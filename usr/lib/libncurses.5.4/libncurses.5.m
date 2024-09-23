uint64_t _nc_setupterm(char *__s, int a2, int *a3, int a4)
{
  const char *v7;
  TERMINAL *v8;
  const char *termname;
  TERMTYPE *v10;
  int v11;
  int v12;
  const TERMTYPE *v13;
  unsigned __int8 *v14;
  char *Booleans;
  char **Strings;
  int v17;
  char *v18;
  FILE *v19;
  const char *v20;
  size_t v21;

  v7 = __s;
  v8 = cur_term;
  if (!__s)
  {
    v18 = getenv("TERM");
    if (!v18 || (v7 = v18, !*v18))
    {
      if (!a3)
      {
        v19 = (FILE *)*MEMORY[0x1E0C80C10];
        v20 = "TERM environment variable not set.\n";
LABEL_34:
        v21 = 35;
LABEL_53:
        fwrite(v20, v21, 1uLL, v19);
        goto LABEL_55;
      }
      goto LABEL_36;
    }
  }
  if (strlen(v7) >= 0x201)
  {
    if (!a3)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "TERM environment must be <= %d characters.\n");
      goto LABEL_55;
    }
LABEL_36:
    v17 = -1;
    goto LABEL_37;
  }
  if (a2 == 1 && !isatty(1))
    a2 = 2;
  if (!a4
    || !v8
    || a2 != v8->Filedes
    || (termname = v8->_termname) == 0
    || strcmp(termname, v7)
    || !_nc_name_match(v8->type.term_names, v7, "|"))
  {
    v10 = (TERMTYPE *)calloc(1uLL, 0xF0uLL);
    if (!v10)
    {
      if (!a3)
      {
        v19 = (FILE *)*MEMORY[0x1E0C80C10];
        v20 = "Not enough memory to create terminal structure.\n";
        v21 = 48;
        goto LABEL_53;
      }
      goto LABEL_36;
    }
    v8 = (TERMINAL *)v10;
    v11 = _nc_setup_tinfo(v7, v10);
    if (v11 != 1)
    {
      v12 = v11;
      v13 = _nc_fallback(v7);
      if (v13)
      {
        _nc_copy_termtype(&v8->type, v13);
      }
      else
      {
        del_curterm(v8);
        if (!v12)
        {
          if (!a3)
          {
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "'%s': unknown terminal type.\n");
            goto LABEL_55;
          }
          goto LABEL_29;
        }
        if (v12 == -1)
        {
          if (!a3)
          {
            v19 = (FILE *)*MEMORY[0x1E0C80C10];
            v20 = "terminals database is inaccessible\n";
            goto LABEL_34;
          }
          goto LABEL_36;
        }
      }
    }
    strncpy(ttytype, v8->type.term_names, 0xFFuLL)[255] = 0;
    v8->Filedes = a2;
    v8->_termname = strdup(v7);
    set_curterm(v8);
    v14 = (unsigned __int8 *)*((_QWORD *)v8->type.Strings + 9);
    if (v14)
      _nc_tinfo_cmdch((uint64_t)v8, *v14);
    if (isatty(a2))
    {
      def_prog_mode();
      baudrate();
    }
  }
  _nc_get_screensize(SP, &LINES, &COLS);
  if (a3)
    *a3 = 1;
  Booleans = v8->type.Booleans;
  if (Booleans[6])
  {
    Strings = v8->type.Strings;
    if ((unint64_t)(Strings[10] + 1) <= 1
      && ((unint64_t)(Strings[11] + 1) < 2 || (unint64_t)(Strings[12] + 1) < 2)
      || (unint64_t)(Strings[5] + 1) < 2)
    {
      del_curterm(v8);
      if (a3)
      {
LABEL_29:
        v17 = 0;
LABEL_37:
        *a3 = v17;
        return 0xFFFFFFFFLL;
      }
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "'%s': I need something more specific.\n");
LABEL_55:
      exit(1);
    }
    if (!a3)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "'%s': terminal is not really generic.\n");
      goto LABEL_55;
    }
LABEL_49:
    v17 = 1;
    goto LABEL_37;
  }
  if (Booleans[7])
  {
    if (!a3)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "'%s': I can't handle hardcopy terminals.\n");
      goto LABEL_55;
    }
    goto LABEL_49;
  }
  return 0;
}

int tgetent(char *a1, const char *a2)
{
  uint64_t v3;
  char **v4;
  uint64_t v5;
  int v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  TERMINAL *v11;
  BOOL v12;
  uint64_t i;
  TERMINAL *v14;
  char *v15;
  char **Strings;
  const char *v17;
  int v18;
  char *v19;
  char *v20;
  char *v21;
  int v22;
  char *v23;
  const char *v24;
  char *v25;
  TERMINAL *v26;
  char **v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  __int16 *Numbers;
  char **v33;
  int v34;
  const char *v35;
  BOOL v36;
  char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  char **v41;
  char *v42;
  char *v43;
  char *v45;
  __int16 v46;
  char *v47;
  __int16 v48;
  int v49;

  v49 = -1;
  _nc_setupterm((char *)a2, 1, &v49, 1);
  v3 = 0;
  v4 = (char **)&PC[136];
  while (!*((_BYTE *)v4 - 16) || *v4 != a1)
  {
    ++v3;
    v4 += 5;
    if (v3 == 4)
    {
      v5 = 0;
      v6 = 0;
      v7 = &PC[112];
      do
      {
        v8 = *(_QWORD *)v7;
        v7 += 40;
        if (v8 < *(_QWORD *)&PC[40 * v6 + 112])
          v6 = v5;
        ++v5;
      }
      while (v5 != 4);
LABEL_22:
      *(_DWORD *)&PC[272] = v6;
      goto LABEL_23;
    }
  }
  *(_DWORD *)&PC[272] = v3;
  v9 = *(v4 - 1);
  if (v9)
  {
    free(v9);
    v6 = *(_DWORD *)&PC[272];
    v10 = *(int *)&PC[272];
    *(_QWORD *)&PC[40 * *(int *)&PC[272] + 128] = 0;
  }
  else
  {
    v10 = v3;
    v6 = v3;
  }
  v11 = *(TERMINAL **)&PC[40 * v10 + 144];
  if (v11)
    v12 = v11 == cur_term;
  else
    v12 = 1;
  if (!v12)
  {
    del_curterm(v11);
    for (i = 0; i != 160; i += 40)
    {
      if (*(TERMINAL **)&PC[i + 144] == v11)
        *(_QWORD *)&PC[i + 144] = 0;
    }
    v6 = v3;
    goto LABEL_22;
  }
LABEL_23:
  v14 = cur_term;
  v15 = &PC[40 * v6 + 8];
  *((_QWORD *)v15 + 17) = cur_term;
  *((_QWORD *)v15 + 13) = ++*(_QWORD *)&PC[280];
  PC[0] = 0;
  UP = 0;
  BC = 0;
  *((_QWORD *)v15 + 15) = 0;
  if (v49 == 1)
  {
    Strings = v14->type.Strings;
    v17 = Strings[14];
    if (v17)
    {
      v18 = strcmp(v17, "\b");
      v14->type.Booleans[37] = v18 == 0;
      Strings = v14->type.Strings;
      if (v18)
      {
        Strings[397] = Strings[14];
        Strings = v14->type.Strings;
      }
    }
    v19 = Strings[104];
    if (v19)
      PC[0] = *v19;
    if (Strings[19])
      UP = Strings[19];
    v20 = Strings[397];
    if (v20)
      BC = v20;
    v21 = _nc_trim_sgr0(&v14->type);
    v22 = *(_DWORD *)&PC[272];
    *(_QWORD *)&PC[40 * *(int *)&PC[272] + 128] = v21;
    if (v21)
    {
      v23 = v21;
      v24 = (const char *)*((_QWORD *)cur_term->type.Strings + 39);
      if (!strcmp(v21, v24))
      {
        if (v23 != v24)
        {
          free(v23);
          v22 = *(_DWORD *)&PC[272];
        }
        *(_QWORD *)&PC[40 * v22 + 128] = 0;
      }
    }
    v25 = &PC[40 * v22 + 8];
    *((_QWORD *)v25 + 16) = a1;
    v25[112] = 1;
    _nc_set_no_padding(SP);
    baudrate();
    v26 = cur_term;
    v27 = cur_term->type.Strings;
    v28 = v27[2];
    if ((unint64_t)(v28 + 1) >= 2)
    {
      v37 = strchr(v28, 42);
      if (v37)
      {
        v38 = atoi(v37 + 1);
        if (v38)
          v26->type.Numbers[34] = v38;
      }
    }
    v29 = v27[103];
    if ((unint64_t)(v29 + 1) >= 2)
    {
      v39 = strchr(v29, 42);
      if (v39)
      {
        v40 = atoi(v39 + 1);
        if (v40)
          v26->type.Numbers[35] = v40;
      }
    }
    if ((unint64_t)(v27[394] + 1) <= 1)
    {
      v30 = v27[50];
      if ((unint64_t)(v30 + 1) >= 2)
      {
        v27[394] = v30;
        *((_QWORD *)v26->type.Strings + 50) = 0;
        v27 = v26->type.Strings;
      }
    }
    if ((unint64_t)(v27[395] + 1) <= 1)
    {
      v31 = v27[123];
      if ((unint64_t)(v31 + 1) >= 2
        && (unint64_t)(v27[122] + 1) <= 1
        && (unint64_t)(v27[124] + 1) <= 1)
      {
        v27[395] = v31;
        *((_QWORD *)v26->type.Strings + 123) = 0;
      }
    }
    Numbers = v26->type.Numbers;
    if (Numbers[33] == -1)
    {
      v34 = (unsigned __int16)Numbers[4];
      v33 = v26->type.Strings;
      if (v34 != 0xFFFF && (unint64_t)(v33[36] + 1) >= 2)
        Numbers[33] = v34;
    }
    else
    {
      v33 = v26->type.Strings;
    }
    v35 = v33[103];
    v36 = (unint64_t)(v35 + 1) >= 2 && strcmp("\n", v35) == 0;
    v26->type.Booleans[41] = v36;
    v41 = v26->type.Strings;
    v42 = v41[14];
    if ((unint64_t)(v42 + 1) >= 2)
    {
      v45 = strchr(v42, 42);
      if (v45)
      {
        v46 = atoi(v45 + 1);
        if (v46)
          v26->type.Numbers[36] = v46;
      }
    }
    v43 = v41[134];
    if ((unint64_t)(v43 + 1) >= 2)
    {
      v47 = strchr(v43, 42);
      if (v47)
      {
        v48 = atoi(v47 + 1);
        if (v48)
          v26->type.Numbers[37] = v48;
      }
    }
  }
  return v49;
}

char *__cdecl _nc_trim_sgr0(TERMTYPE *a1)
{
  char **Strings;
  char *v2;
  char *v4;
  char *v5;
  char **v6;
  char *v7;
  const char *v8;
  size_t v9;
  size_t v10;
  size_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  _BYTE *v17;
  _BYTE *v18;
  _BYTE *v19;
  _BYTE *v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  char *v29;
  int v30;
  int v31;
  int v32;
  char *v33;
  char *v34;
  int v35;
  int v36;
  int v37;
  char v38;
  int v39;
  char **v40;

  Strings = a1->Strings;
  v2 = Strings[39];
  if (v2 == (char *)-1 || !v2 || (unint64_t)(Strings[131] + 1) < 2)
    return v2;
  v4 = sub_1C05D245C((uint64_t)a1, 1);
  v5 = sub_1C05D245C((uint64_t)a1, 0);
  v6 = a1->Strings;
  v7 = strdup(v6[39]);
  if (sub_1C05D24B4(v4, v6[25])
    && sub_1C05D24B4(v5, *((const char **)a1->Strings + 38))
    && sub_1C05D24B4(v7, *((const char **)a1->Strings + 38)))
  {
    if (sub_1C05D255C(v5, v7) && !sub_1C05D255C(v5, v4))
    {
      v8 = (const char *)*((_QWORD *)a1->Strings + 38);
      if (v8)
      {
        v9 = strlen(v5);
        v10 = strlen(v8);
        v11 = v9 - v10;
        if (v9 > v10)
        {
          v12 = 0;
          while (1)
          {
            v13 = sub_1C05D2674((unint64_t)v8, (unsigned __int8 *)&v5[v12]);
            if (v13)
              break;
            if (++v12 > v11)
              goto LABEL_14;
          }
          v38 = v5[(v13 + v12)];
          if (v38)
          {
            v39 = v12;
            do
            {
              LODWORD(v12) = v39 + 1;
              v5[v39] = v38;
              v38 = v5[v13 + 1 + v39++];
            }
            while (v38);
          }
          v5[v12] = 0;
          goto LABEL_49;
        }
      }
LABEL_14:
      if (!v5)
        goto LABEL_37;
      v14 = *v5;
      if (v14 == 233)
      {
        v15 = 1;
      }
      else
      {
        if (v14 != 27 || v5[1] != 91)
          goto LABEL_37;
        v15 = 2;
      }
      if (v5[strlen(v5) - 1] == 109)
      {
        v17 = sub_1C05D2750(&v5[v15]);
        if (*v17 == 49)
        {
          v18 = v17;
          v19 = v17 + 1;
          if (sub_1C05D2750(v17 + 1) != v17 + 1)
          {
            v20 = v19;
            v21 = (_DWORD)v18 - (_DWORD)v5;
            v22 = (_DWORD)v18 - (_DWORD)v5 - 1;
            v23 = *(v18 - 1);
            v24 = sub_1C05D2750(v20);
            if (v23 == 59)
              v25 = v22;
            else
              v25 = v21;
            LOBYTE(v26) = v5[v24 - v5];
            if ((_BYTE)v26)
            {
              v27 = v24 - (_DWORD)v5 + 1;
              do
              {
                v28 = v25 + 1;
                v5[v25] = v26;
                v26 = v5[v27++];
                ++v25;
              }
              while (v26);
            }
            else
            {
              v28 = v25;
            }
            v5[v28] = 0;
LABEL_49:
            v40 = a1->Strings;
            if (!strcmp(v5, v40[39]))
            {
              free(v5);
              v2 = v40[39];
            }
            else
            {
              v2 = v5;
            }
            goto LABEL_21;
          }
        }
      }
LABEL_37:
      v29 = strstr(v7, v5);
      if (v29)
      {
        v30 = (int)v29;
        if (strcmp(v7, v5))
        {
          v31 = v30 - (_DWORD)v7;
          v32 = strlen(v5);
          v33 = strdup(v7);
          v34 = v33;
          LOBYTE(v35) = v33[v32];
          if ((_BYTE)v35)
          {
            v36 = v32 + 1;
            do
            {
              v37 = v31 + 1;
              v33[v31] = v35;
              v35 = v33[v36++];
              ++v31;
            }
            while (v35);
          }
          else
          {
            v37 = v31;
          }
          v33[v37] = 0;
          free(v5);
          v5 = v34;
        }
      }
      goto LABEL_49;
    }
    goto LABEL_20;
  }
  if (v5)
LABEL_20:
    free(v5);
LABEL_21:
  if (v7)
    free(v7);
  if (v4)
    free(v4);
  return v2;
}

int _nc_read_entry(const char *const a1, char *const a2, TERMTYPE *const a3)
{
  int file_entry;
  const char *db;
  const char *v9;
  int v10;
  const char *source;
  DBDIRS v12[2];

  sprintf(a2, "%.*s", 1023, a1);
  if (!*a1 || !strcmp(a1, ".") || !strcmp(a1, "..") || _nc_pathlast(a1) || strchr((char *)a1, 58))
    return 0;
  *(_QWORD *)v12 = 0;
  _nc_first_db(&v12[1], (int *)v12);
  db = _nc_next_db(&v12[1], (int *)v12);
  if (!db)
    return -1;
  v9 = db;
  while (1)
  {
    if (_nc_is_dir_path(v9) && (v10 = strlen(v9), v10 + strlen(a1) + 5 <= 0x400))
    {
      sprintf(a2, "%s/%02x/%s", v9, *a1, a1);
      file_entry = _nc_read_file_entry(a2, a3);
    }
    else
    {
      file_entry = _nc_read_termcap_entry(a1, (uint64_t)a3);
      source = _nc_get_source();
      sprintf(a2, "%.*s", 1023, source);
    }
    if (file_entry == 1)
      break;
    v9 = _nc_next_db(&v12[1], (int *)v12);
    if (!v9)
      return file_entry;
  }
  _nc_last_db();
  return file_entry;
}

uint64_t _nc_getenv_num(const char *a1)
{
  char *v1;
  char *v2;
  uint64_t result;
  char *__endptr;

  __endptr = 0;
  v1 = getenv(a1);
  if (!v1)
    return -1;
  v2 = v1;
  result = strtol(v1, &__endptr, 0);
  if (result < 0 || __endptr == v2 || *__endptr || result > (int)result)
    return -1;
  return result;
}

char *_nc_home_terminfo(void)
{
  char *result;
  char *v1;
  size_t v2;
  char *v3;

  result = *(char **)&PC[472];
  if (!*(_QWORD *)&PC[472])
  {
    result = getenv("HOME");
    if (result)
    {
      v1 = result;
      v2 = strlen(result);
      v3 = (char *)malloc(v2 + 13);
      *(_QWORD *)&PC[472] = v3;
      if (!v3)
        _nc_err_abort("Out of memory");
      sprintf(v3, "%s/.terminfo", v1);
      return *(char **)&PC[472];
    }
  }
  return result;
}

unsigned int _nc_pathlast(const char *a1)
{
  int v1;
  char *v2;
  int v3;

  v1 = (int)a1;
  v2 = strrchr((char *)a1, 47);
  if (v2)
    v3 = (_DWORD)v2 + 1;
  else
    v3 = v1;
  return v3 - v1;
}

int baudrate(void)
{
  int result;
  uint64_t v1;
  __int16 v2;

  if (!cur_term)
    return -1;
  result = cfgetospeed(&cur_term->Nttyb);
  if (result < 0)
  {
LABEL_6:
    v2 = 1;
  }
  else
  {
    v1 = 0;
    while (*(_DWORD *)&word_1C05E1004[v1 + 2] != result)
    {
      v1 += 4;
      if (v1 == 72)
        goto LABEL_6;
    }
    v2 = word_1C05E1004[v1];
  }
  ospeed = v2;
  cur_term->_baudrate = result;
  return result;
}

int _nc_name_match(const char *const a1, const char *const a2, const char *const a3)
{
  int v3;
  int v4;
  const char *v5;
  BOOL v6;
  int v7;
  char v8;
  int v9;
  const char *v10;
  int v11;
  int v12;
  int v13;

  if (a1)
  {
    while (1)
    {
      v3 = *(unsigned __int8 *)a1;
      if (!*a1)
      {
LABEL_21:
        LODWORD(a1) = 0;
        return (int)a1;
      }
      v4 = *(unsigned __int8 *)a2;
      if (*a2)
      {
        v5 = a2 + 1;
        while (1)
        {
          v3 = *(unsigned __int8 *)a1;
          v6 = v3 != v4;
          if (v3 != v4)
            break;
          ++a1;
          v7 = *(unsigned __int8 *)v5++;
          v4 = v7;
          if (!v7)
          {
            v3 = *(unsigned __int8 *)a1;
            break;
          }
        }
        if (!v3)
        {
          v8 = 0;
          v9 = 1;
          if (v6)
            goto LABEL_20;
          goto LABEL_19;
        }
      }
      else
      {
        v6 = 0;
      }
      v8 = 0;
      while (1)
      {
        v10 = a3 + 1;
        v11 = *(unsigned __int8 *)a3;
        if (*a3)
          break;
LABEL_16:
        v13 = *(unsigned __int8 *)++a1;
        v3 = v13;
        v8 = 1;
        if (!v13)
          goto LABEL_21;
      }
      while (v3 != v11)
      {
        v12 = *(unsigned __int8 *)v10++;
        v11 = v12;
        if (!v12)
          goto LABEL_16;
      }
      v9 = 0;
      if (v6)
        goto LABEL_20;
LABEL_19:
      if ((v8 & 1) == 0)
      {
        LODWORD(a1) = 1;
        return (int)a1;
      }
LABEL_20:
      ++a1;
      if (v9)
        goto LABEL_21;
    }
  }
  return (int)a1;
}

const char *__cdecl _nc_next_db(DBDIRS *a1, int *a2)
{
  uint64_t v2;
  const char *v4;

  v2 = *(unsigned int *)a1;
  if ((int)v2 >= *(int *)&PC[304] || *(_QWORD *)&PC[296] == 0)
    return 0;
  v4 = *(const char **)(*(_QWORD *)&PC[296] + 8 * v2);
  if (v4)
    *a1 = v2 + 1;
  return v4;
}

char *__cdecl _nc_rootname(char *a1)
{
  char *v2;
  int v3;
  char *v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  int v9;
  char v10;
  unsigned int v11;

  v2 = strrchr(a1, 47);
  if (v2)
    v3 = (_DWORD)v2 + 1;
  else
    v3 = (int)a1;
  v4 = strdup(&a1[v3 - (_DWORD)a1]);
  v5 = v4;
  qword_1EF614AE0 = (uint64_t)v4;
  v6 = *v4;
  if (*v4)
  {
    v7 = MEMORY[0x1E0C80978];
    v8 = v4;
    do
    {
      if ((v6 & 0x80) != 0)
      {
        if (!__maskrune(v6, 0x100uLL) || !__maskrune(v6, 0x8000uLL))
        {
LABEL_13:
          v10 = *v8;
          goto LABEL_14;
        }
      }
      else
      {
        v9 = *(_DWORD *)(v7 + 4 * v6 + 60);
        if ((v9 & 0x100) == 0 || (v9 & 0x8000) == 0)
          goto LABEL_13;
      }
      v10 = __tolower(v6);
LABEL_14:
      *v8 = v10;
      v11 = *++v8;
      v6 = v11;
    }
    while (v11);
  }
  return v5;
}

char *__cdecl _nc_basename(char *a1)
{
  char *v2;
  int v3;

  v2 = strrchr(a1, 47);
  if (v2)
    v3 = (_DWORD)v2 + 1;
  else
    v3 = (int)a1;
  return &a1[v3 - (_DWORD)a1];
}

BOOL _nc_is_abs_path(const char *a1)
{
  if (a1)
    LOBYTE(a1) = *a1 == 47;
  return (char)a1;
}

uint64_t _nc_access(const char *a1, int a2)
{
  char v2;
  char *v5;
  unsigned int v6;
  unsigned int v7;
  char __s[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = a2;
  if ((access(a1, a2) & 0x80000000) == 0)
    return 0;
  if ((v2 & 2) == 0 || *__error() != 2 || strlen(a1) > 0x3FF)
    return 0xFFFFFFFFLL;
  __strcpy_chk();
  v5 = strrchr(__s, 47);
  if (v5)
    v6 = (_DWORD)v5 + 1;
  else
    v6 = __s;
  v7 = v6 - __s;
  __s[v7] = 0;
  if (!v7)
    strcpy(__s, ".");
  return access(__s, 7);
}

BOOL _nc_is_dir_path(const char *a1)
{
  stat v3;

  memset(&v3, 0, sizeof(v3));
  return !stat(a1, &v3) && (v3.st_mode & 0xF000) == 0x4000;
}

BOOL _nc_is_file_path(const char *a1)
{
  stat v3;

  memset(&v3, 0, sizeof(v3));
  return !stat(a1, &v3) && (v3.st_mode & 0xF000) == 0x8000;
}

uint64_t _nc_add_to_try(void **a1, unsigned __int8 *a2, int a3)
{
  __int16 v3;
  uint64_t result;
  unsigned __int8 *v6;
  int v7;
  void **v8;
  void **v9;
  void **v10;
  int v11;
  int v12;
  void **v13;
  int v14;
  unsigned __int8 *v16;
  void **v17;
  void **v18;
  int v19;
  int v20;
  void **v21;

  if (!a2)
    return 0xFFFFFFFFLL;
  v3 = a3;
  result = 0xFFFFFFFFLL;
  if (a3)
  {
    v6 = a2;
    v7 = *a2;
    if (*a2)
    {
      v8 = (void **)*a1;
      if (*a1)
      {
        v9 = (void **)*a1;
        while (1)
        {
          while (1)
          {
            v10 = v9;
            v11 = *((unsigned __int8 *)v9 + 16);
            if (v11)
              break;
            if (v7 != 128)
              goto LABEL_8;
LABEL_11:
            v12 = *++v6;
            v7 = v12;
            if (!v12)
              goto LABEL_31;
            v9 = (void **)*v10;
            if (!*v10)
              goto LABEL_22;
          }
          if (v11 == v7)
            goto LABEL_11;
LABEL_8:
          v9 = (void **)v10[1];
          if (!v9)
          {
            v13 = (void **)calloc(1uLL, 0x18uLL);
            v8 = v13;
            v10[1] = v13;
            if (!v13)
              return 0xFFFFFFFFLL;
            goto LABEL_18;
          }
        }
      }
      v8 = (void **)calloc(1uLL, 0x18uLL);
      *a1 = v8;
      if (!v8)
        return 0xFFFFFFFFLL;
LABEL_18:
      v14 = *v6;
      if (v14 == 128)
        LOBYTE(v14) = 0;
      *((_BYTE *)v8 + 16) = v14;
      *((_WORD *)v8 + 9) = 0;
      if (*++v6)
      {
        v10 = v8;
LABEL_22:
        v16 = v6 + 1;
        v17 = v10;
        while (1)
        {
          v18 = (void **)calloc(1uLL, 0x18uLL);
          *v17 = v18;
          if (!v18)
            break;
          v10 = v18;
          v19 = *(v16 - 1);
          if (v19 == 128)
            LOBYTE(v19) = 0;
          *((_BYTE *)v18 + 16) = v19;
          *((_WORD *)v18 + 9) = 0;
          v20 = *v16++;
          v17 = v18;
          if (!v20)
            goto LABEL_31;
        }
        do
        {
          v21 = (void **)*v8;
          free(v8);
          v8 = v21;
        }
        while (v21);
        return 0xFFFFFFFFLL;
      }
      else
      {
        v10 = v8;
LABEL_31:
        result = 0;
        *((_WORD *)v10 + 9) = v3;
      }
    }
  }
  return result;
}

void _nc_init_entry(TERMTYPE *const a1)
{
  if (!qword_1EF614AE8)
  {
    qword_1EF614AE8 = (uint64_t)calloc(0x1000uLL, 1uLL);
    if (!qword_1EF614AE8)
      _nc_err_abort("Out of memory");
  }
  qword_1EF614AF0 = 0;
  _nc_init_termtype(a1);
}

_ENTRY *__cdecl _nc_copy_entry(_ENTRY *oldp)
{
  _ENTRY *v2;
  _ENTRY *v3;

  v2 = (_ENTRY *)calloc(1uLL, 0x400uLL);
  v3 = v2;
  if (v2)
  {
    memcpy(v2, oldp, sizeof(_ENTRY));
    _nc_copy_termtype(&v3->tterm, &oldp->tterm);
  }
  return v3;
}

char *__cdecl _nc_save_str(const char *const a1)
{
  size_t v2;
  char *result;
  size_t v4;

  v2 = strlen(a1);
  if (v2 || !qword_1EF614AF0)
  {
    v4 = v2 + 1;
    if (v2 + 1 + qword_1EF614AF0 <= 0xFFF)
    {
      result = strcpy((char *)(qword_1EF614AE8 + qword_1EF614AF0), a1);
      qword_1EF614AF0 += v4;
      return result;
    }
    _nc_warning("Too much data, some is lost: %s", a1);
  }
  else if ((unint64_t)qword_1EF614AF0 <= 0xFFF)
  {
    return (char *)(qword_1EF614AE8 + qword_1EF614AF0 - 1);
  }
  return 0;
}

void _nc_wrap_entry(_ENTRY *const a1, BOOL a2)
{
  uint64_t v2;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  const char *v9;
  char **v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  size_t v24;
  char *v25;
  char *v26;
  unint64_t i;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  const char **v34;
  _DWORD *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[128];
  _DWORD v49[2048];
  uint64_t v50;

  v2 = ((uint64_t (*)(_ENTRY *const, BOOL))MEMORY[0x1E0C80A78])(a1, a2);
  v4 = v3;
  v5 = v2;
  v50 = *MEMORY[0x1E0C80C00];
  v6 = *(unsigned int *)(v2 + 72);
  if (v3)
  {
    qword_1EF614AF0 = 0;
    *(_QWORD *)v2 = _nc_save_str(*(const char *const *)v2);
    v7 = *(unsigned __int16 *)(v5 + 60);
    if (*(_WORD *)(v5 + 60))
    {
      v8 = 0;
      do
      {
        v9 = *(const char **)(*(_QWORD *)(v5 + 32) + 8 * v8);
        if ((unint64_t)(v9 + 1) >= 2)
        {
          *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8 * v8) = _nc_save_str(v9);
          v7 = *(unsigned __int16 *)(v5 + 60);
        }
        ++v8;
      }
      while (v8 < v7);
    }
    if ((_DWORD)v6)
    {
      v10 = (char **)(v5 + 80);
      v11 = v6;
      do
      {
        if (!*v10)
          *v10 = _nc_save_str(0);
        v10 += 3;
        --v11;
      }
      while (v11);
    }
    free(*(void **)(v5 + 8));
  }
  v12 = (const void *)qword_1EF614AE8;
  v13 = *(unsigned __int16 *)(v5 + 60);
  if (*(_WORD *)(v5 + 60))
  {
    v14 = 0;
    do
    {
      if (v14 <= 0x7FF)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8 * v14);
        if (v15)
        {
          if (v15 == -1)
            v16 = -2;
          else
            v16 = v15 - (_DWORD)v12;
        }
        else
        {
          v16 = -1;
        }
        v49[v14] = v16;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  if ((_DWORD)v6)
  {
    v17 = (uint64_t *)(v5 + 80);
    v18 = (int *)v48;
    v19 = v6;
    do
    {
      v20 = *v17;
      v17 += 3;
      v21 = v20 - (_DWORD)v12;
      if (v20)
        v22 = v21;
      else
        v22 = -1;
      *v18++ = v22;
      --v19;
    }
    while (v19);
  }
  v23 = *(_QWORD *)v5;
  v24 = qword_1EF614AF0;
  v25 = (char *)malloc(qword_1EF614AF0);
  *(_QWORD *)(v5 + 8) = v25;
  if (!v25)
    goto LABEL_54;
  v26 = v25;
  memcpy(v25, v12, v24);
  *(_QWORD *)v5 = &v26[(v23 - (_DWORD)v12)];
  if ((_DWORD)v13)
  {
    for (i = 0; i != v13; ++i)
    {
      if (i <= 0x7FF)
      {
        v28 = v49[i];
        if (v28 == -1)
        {
          v29 = 0;
        }
        else if (v28 == -2)
        {
          v29 = -1;
        }
        else
        {
          v29 = *(_QWORD *)(v5 + 8) + v28;
        }
        *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8 * i) = v29;
      }
    }
  }
  if ((v4 & 1) == 0)
  {
    v30 = *(unsigned __int16 *)(v5 + 64);
    v31 = *(unsigned __int16 *)(v5 + 66);
    v32 = v30 + *(unsigned __int16 *)(v5 + 62) + v31;
    if ((v32 - 1) <= 0x7FE)
    {
      v47 = *(unsigned __int16 *)(v5 + 62);
      v33 = 0;
      v34 = *(const char ***)(v5 + 48);
      v35 = v49;
      do
      {
        v36 = *v34++;
        v33 += strlen(v36) + 1;
        *v35++ = (_DWORD)v36 - (_DWORD)v12;
        --v32;
      }
      while (v32);
      v37 = malloc(v33);
      *(_QWORD *)(v5 + 40) = v37;
      if (v37)
      {
        v38 = 0;
        v39 = 0;
        v40 = *(_QWORD *)(v5 + 48);
        v41 = qword_1EF614AE8;
        do
        {
          *(_QWORD *)(v40 + 8 * v38) = *(_QWORD *)(v5 + 40) + v39;
          strcpy(*(char **)(*(_QWORD *)(v5 + 48) + 8 * v38), (const char *)(v41 + (int)v49[v38]));
          v40 = *(_QWORD *)(v5 + 48);
          v39 += strlen(*(const char **)(v40 + 8 * v38++)) + 1;
        }
        while (v30 + v31 + v47 != v38);
        goto LABEL_47;
      }
LABEL_54:
      _nc_err_abort("Out of memory");
    }
  }
LABEL_47:
  if ((_DWORD)v6)
  {
    v42 = (_QWORD *)(v5 + 80);
    v43 = (int *)v48;
    do
    {
      v45 = *v43++;
      v44 = v45;
      if ((_DWORD)v45 == -1)
        v46 = 0;
      else
        v46 = *(_QWORD *)(v5 + 8) + v44;
      *v42 = v46;
      v42 += 3;
      --v6;
    }
    while (v6);
  }
}

void _nc_merge_entry(TERMTYPE *const a1, TERMTYPE *const a2)
{
  unint64_t i;
  char *Booleans;
  int v6;
  unint64_t v7;
  __int16 *Numbers;
  int v9;
  unint64_t v10;
  uint64_t v11;
  char **Strings;
  char *v13;

  _nc_align_termtype(a1, a2);
  if (a2->num_Booleans)
  {
    for (i = 0; i < a2->num_Booleans; ++i)
    {
      Booleans = a1->Booleans;
      if (Booleans[i] != 254)
      {
        v6 = a2->Booleans[i];
        if (v6 == 254)
        {
          LOBYTE(v6) = 0;
        }
        else if (v6 != 1)
        {
          continue;
        }
        Booleans[i] = v6;
      }
    }
  }
  if (a2->num_Numbers)
  {
    v7 = 0;
    Numbers = a1->Numbers;
    do
    {
      if (Numbers[v7] != -2)
      {
        v9 = (unsigned __int16)a2->Numbers[v7];
        if (v9 == 65534)
        {
          LOWORD(v9) = -1;
LABEL_17:
          Numbers[v7] = v9;
          goto LABEL_18;
        }
        if (v9 != 0xFFFF)
          goto LABEL_17;
      }
LABEL_18:
      ++v7;
    }
    while (v7 < a2->num_Numbers);
  }
  if (a2->num_Strings)
  {
    v10 = 0;
    v11 = 8 * a2->num_Strings;
    do
    {
      Strings = a1->Strings;
      if (Strings[v10 / 8] != (char *)-1)
      {
        v13 = a2->Strings[v10 / 8];
        if (v13 == (char *)-1)
        {
          v13 = 0;
LABEL_26:
          Strings[v10 / 8] = v13;
          goto LABEL_27;
        }
        if (v13)
          goto LABEL_26;
      }
LABEL_27:
      v10 += 8;
    }
    while (v11 != v10);
  }
}

void _nc_align_termtype(TERMTYPE *a1, TERMTYPE *a2)
{
  unsigned int ext_Booleans;
  int ext_Numbers;
  int ext_Strings;
  int v5;
  int v6;
  int v7;
  char **v13;
  char **v14;
  char **v15;
  char **v16;
  uint64_t v17;
  const char **v18;
  uint64_t v19;
  uint64_t v20;
  const char **v21;
  signed int v22;
  int v23;
  int v24;
  char **v25;
  char **v26;
  char **ext_Names;
  char **v28;
  uint64_t v29;
  _BYTE v30[12];

  ext_Booleans = a1->ext_Booleans;
  ext_Numbers = a1->ext_Numbers;
  ext_Strings = a1->ext_Strings;
  v5 = a2->ext_Booleans;
  v6 = a2->ext_Numbers;
  v7 = a2->ext_Strings;
  *(_DWORD *)&v30[8] = ext_Numbers + ext_Booleans + ext_Strings;
  *(_DWORD *)&v30[4] = v6 + v5 + v7;
  if (*(_QWORD *)&v30[4])
  {
    if (*(_DWORD *)&v30[8] == *(_DWORD *)&v30[4] && ext_Booleans == v5 && ext_Numbers == v6 && ext_Strings == v7)
    {
      if (!*(_DWORD *)&v30[8])
        return;
      ext_Names = a1->ext_Names;
      v28 = a2->ext_Names;
      v29 = ext_Numbers + ext_Booleans + ext_Strings;
      while (!strcmp(*ext_Names, *v28))
      {
        ++v28;
        ++ext_Names;
        if (!--v29)
          return;
      }
    }
    v13 = (char **)malloc((8 * (*(_DWORD *)&v30[4] + *(_DWORD *)&v30[8])));
    if (v13)
    {
      v14 = v13;
      if (ext_Strings && v5 != -v6)
      {
        sub_1C05AE6BC((uint64_t)a1, (uint64_t)a2);
        v7 = a2->ext_Strings;
        ext_Booleans = a1->ext_Booleans;
      }
      if (v7 && ext_Booleans + a1->ext_Numbers)
      {
        sub_1C05AE6BC((uint64_t)a2, (uint64_t)a1);
        ext_Booleans = a1->ext_Booleans;
      }
      v15 = a1->ext_Names;
      v16 = a2->ext_Names;
      v17 = a2->ext_Booleans;
      *(_DWORD *)v30 = sub_1C05AE884((uint64_t)v14, (const char **)v15, ext_Booleans, (const char **)v16, a2->ext_Booleans);
      v18 = (const char **)&v15[ext_Booleans];
      v19 = a1->ext_Numbers;
      v20 = a2->ext_Numbers;
      v21 = (const char **)&v16[v17];
      v22 = sub_1C05AE884((uint64_t)&v14[*(int *)v30], v18, a1->ext_Numbers, v21, a2->ext_Numbers);
      v23 = sub_1C05AE884((uint64_t)&(&v14[*(int *)v30])[v22], &v18[v19], a1->ext_Strings, &v21[v20], a2->ext_Strings);
      v24 = v22 + *(_DWORD *)v30 + v23;
      if (*(_DWORD *)&v30[8] != v24)
      {
        sub_1C05AE990((void **)&a1->term_names, (uint64_t)v14, *(int *)v30, v22, v23);
        v25 = a1->ext_Names;
        if (v25)
          free(v25);
        a1->ext_Names = v14;
      }
      if (*(_DWORD *)&v30[4] == v24)
        goto LABEL_26;
      sub_1C05AE990((void **)&a2->term_names, (uint64_t)v14, *(int *)v30, v22, v23);
      v26 = (char **)_nc_doalloc(a2->ext_Names, 8 * v24);
      a2->ext_Names = v26;
      if (v26)
      {
        memcpy(v26, v14, 8 * v24);
LABEL_26:
        if (*(_DWORD *)&v30[8] == v24)
          free(v14);
        return;
      }
    }
    _nc_err_abort("Out of memory", *(_QWORD *)v30);
  }
}

uint64_t sub_1C05AE6BC(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_WORD *)(result + 66))
  {
    v3 = result;
    v4 = *(unsigned __int16 *)(result + 64) + *(unsigned __int16 *)(result + 62);
    v5 = v4 + *(unsigned __int16 *)(result + 66);
    v6 = v4;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(v3 + 32)
                     + 8 * (v6 + *(unsigned __int16 *)(v3 + 60) - (v4 + *(unsigned __int16 *)(v3 + 66)))) == -1)
      {
        v7 = *(char **)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v8 = *(unsigned __int16 *)(a2 + 62);
        if (!*(_WORD *)(a2 + 62))
          goto LABEL_16;
        v9 = 0;
        v10 = *(_QWORD *)(a2 + 48);
        while (strcmp(v7, *(const char **)(v10 + 8 * v9)))
        {
          if (v8 == ++v9)
            goto LABEL_16;
        }
        if ((v9 & 0x80000000) != 0)
        {
LABEL_16:
          if ((sub_1C05AED8C(a2, v7, 1) & 0x80000000) != 0)
          {
            result = sub_1C05AED8C(a2, v7, 2);
            if ((result & 0x80000000) == 0)
            {
              if (sub_1C05AEE44(v3, v7, 1) || (result = sub_1C05AEE44(v3, v7, 0), (_DWORD)result))
              {
                result = sub_1C05AEFE4(v3, v7, 2);
                *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8 * (int)result) = -1;
                continue;
              }
            }
          }
          else if (sub_1C05AEE44(v3, v7, 2) || (result = sub_1C05AEE44(v3, v7, 0), (_DWORD)result))
          {
            result = sub_1C05AEFE4(v3, v7, 1);
            *(_WORD *)(*(_QWORD *)(v3 + 24) + 2 * (int)result) = -2;
            continue;
          }
        }
        else if (sub_1C05AEE44(v3, v7, 2) || (result = sub_1C05AEE44(v3, v7, 1), (_DWORD)result))
        {
          result = sub_1C05AEFE4(v3, v7, 0);
          *(_BYTE *)(*(_QWORD *)(v3 + 16) + (int)result) = 0;
          continue;
        }
      }
      ++v6;
    }
    while (v6 < v5);
  }
  return result;
}

uint64_t sub_1C05AE884(uint64_t a1, const char **a2, int a3, const char **a4, int a5)
{
  int v5;
  int v7;
  uint64_t v10;
  const char *v11;
  const char *v12;
  int v13;
  const char **v14;
  unsigned int v15;
  const char *v16;
  const char **v17;
  unsigned int v18;
  const char *v19;

  v5 = a5;
  v7 = a3;
  v10 = 0;
  if (a3 >= 1 && a5 >= 1)
  {
    v10 = 0;
    do
    {
      v11 = *a2;
      v12 = *a4;
      v13 = strcmp(*a2, *a4);
      if (v13 < 0)
      {
        ++a2;
        *(_QWORD *)(a1 + 8 * v10) = v11;
        --v7;
      }
      else
      {
        if (v13)
        {
          ++a4;
          *(_QWORD *)(a1 + 8 * v10) = v12;
        }
        else
        {
          *(_QWORD *)(a1 + 8 * v10) = v11;
          ++a2;
          ++a4;
          --v7;
        }
        --v5;
      }
      ++v10;
    }
    while (v7 && v5 > 0);
  }
  if (v7 >= 1)
  {
    v14 = (const char **)(a1 + 8 * v10);
    v15 = v7 + 1;
    v10 = (v7 + v10);
    do
    {
      v16 = *a2++;
      *v14++ = v16;
      --v15;
    }
    while (v15 > 1);
  }
  if (v5 >= 1)
  {
    v17 = (const char **)(a1 + 8 * v10);
    v18 = v5 + 1;
    v10 = (v10 + v5);
    do
    {
      v19 = *a4++;
      *v17++ = v19;
      --v18;
    }
    while (v18 > 1);
  }
  return v10;
}

void **sub_1C05AE990(void **result, uint64_t a2, int a3, unsigned int a4, int a5)
{
  int v5;
  void **v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned __int16 v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char **v18;
  const char *v19;
  int v20;
  BOOL v21;
  const char *v22;
  _BYTE *v23;
  uint64_t v24;
  char v25;
  unsigned __int16 v26;
  void **v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char **v33;
  int v34;
  const char *v35;
  unsigned int v36;
  __int16 v37;
  int v38;
  unsigned __int16 v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  const char **v45;
  const char *v46;
  int v47;
  const char *v48;
  _QWORD *v49;
  int v50;
  uint64_t v51;
  int v52;
  const char **v55;
  int v56;

  v5 = a3;
  v6 = result;
  v7 = *((unsigned __int16 *)result + 31);
  v8 = *((unsigned __int16 *)result + 32);
  v56 = v8 + v7 + *((unsigned __int16 *)result + 33);
  if (v7 == a3)
  {
    v9 = a5;
    v10 = a4;
  }
  else
  {
    v11 = *((_WORD *)result + 28) + a3 - v7;
    *((_WORD *)result + 28) = v11;
    result = (void **)_nc_doalloc(result[2], v11);
    v6[2] = result;
    if (!result)
      goto LABEL_36;
    v12 = v5;
    if (v5 >= 1)
    {
      v13 = *((unsigned __int16 *)v6 + 28) - (uint64_t)v5;
      v14 = *((unsigned __int16 *)v6 + 31) - 1;
      v15 = v5;
      v16 = *((unsigned __int16 *)v6 + 28) - v5;
      do
      {
        v17 = v15--;
        v18 = (const char **)v6[6];
        v19 = *(const char **)(a2 + 8 * v15);
        v20 = v56;
        while (1)
        {
          v21 = __OFSUB__(v20--, 1);
          if (v20 < 0 != v21)
            break;
          v22 = *v18++;
          result = (void **)strcmp(v22, v19);
          if (!(_DWORD)result)
          {
            v23 = v6[2];
            v24 = v13 + v14--;
            v25 = v23[v24];
            goto LABEL_11;
          }
        }
        v25 = 0;
        v23 = v6[2];
LABEL_11:
        v23[v16 + (int)v15] = v25;
      }
      while (v17 > 1);
    }
    v5 = v12;
    *((_WORD *)v6 + 31) = v12;
    v8 = *((unsigned __int16 *)v6 + 32);
    v9 = a5;
    v10 = a4;
  }
  if (v8 != v10)
  {
    v52 = v5;
    v26 = *((_WORD *)v6 + 29) + v10 - v8;
    *((_WORD *)v6 + 29) = v26;
    result = (void **)_nc_doalloc(v6[3], 2 * v26);
    v6[3] = result;
    if (!result)
      goto LABEL_36;
    if (v10 >= 1)
    {
      v27 = result;
      v28 = *((unsigned __int16 *)v6 + 29) - a4;
      v29 = *((unsigned __int16 *)v6 + 32) - 1;
      v55 = (const char **)v6[6];
      v30 = a4;
      do
      {
        v31 = v30--;
        v32 = *(const char **)(a2 + 8 * (v30 + v52));
        v33 = v55;
        v34 = v56;
        while (1)
        {
          v21 = __OFSUB__(v34--, 1);
          if (v34 < 0 != v21)
            break;
          v35 = *v33++;
          result = (void **)strcmp(v35, v32);
          if (!(_DWORD)result)
          {
            v36 = v29 + v28;
            --v29;
            v37 = *((_WORD *)v27 + (int)v36);
            goto LABEL_22;
          }
        }
        v37 = -1;
LABEL_22:
        *((_WORD *)v27 + (int)(v28 + v30)) = v37;
      }
      while (v31 > 1);
    }
    v9 = a5;
    v10 = a4;
    *((_WORD *)v6 + 32) = a4;
    v5 = v52;
  }
  v38 = *((unsigned __int16 *)v6 + 33);
  if (v38 == v9)
    return result;
  v39 = *((_WORD *)v6 + 30) + v9 - v38;
  *((_WORD *)v6 + 30) = v39;
  result = (void **)_nc_doalloc(v6[4], 8 * v39);
  v6[4] = result;
  if (!result)
LABEL_36:
    _nc_err_abort("Out of memory");
  if (v9 >= 1)
  {
    v40 = *((unsigned __int16 *)v6 + 30) - v9;
    v41 = *((unsigned __int16 *)v6 + 33) - 1;
    v42 = v10 + v5;
    v43 = v9;
    do
    {
      v44 = v43--;
      v45 = (const char **)v6[6];
      v46 = *(const char **)(a2 + 8 * (v42 + (int)v43));
      v47 = v56;
      while (1)
      {
        v21 = __OFSUB__(v47--, 1);
        if (v47 < 0 != v21)
          break;
        v48 = *v45++;
        result = (void **)strcmp(v48, v46);
        if (!(_DWORD)result)
        {
          v49 = v6[4];
          v50 = v41 + v40;
          --v41;
          v51 = v49[v50];
          goto LABEL_33;
        }
      }
      v51 = 0;
      v49 = v6[4];
LABEL_33:
      v49[v40 + (int)v43] = v51;
    }
    while (v44 > 1);
  }
  *((_WORD *)v6 + 33) = v9;
  return result;
}

void _nc_copy_termtype(TERMTYPE *a1, const TERMTYPE *a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  size_t num_Booleans;
  char *v9;
  char *v10;
  size_t v11;
  __int16 *v12;
  __int16 *v13;
  size_t v14;
  char **v15;
  char **v16;
  int v17;
  size_t v18;
  char **v19;

  v4 = *(_OWORD *)&a2->Booleans;
  v5 = *(_OWORD *)&a2->Strings;
  v6 = *(_QWORD *)&a2->ext_Numbers;
  *(_OWORD *)&a1->ext_Names = *(_OWORD *)&a2->ext_Names;
  v7 = *(_OWORD *)&a2->term_names;
  *(_QWORD *)&a1->ext_Numbers = v6;
  *(_OWORD *)&a1->Booleans = v4;
  *(_OWORD *)&a1->Strings = v5;
  *(_OWORD *)&a1->term_names = v7;
  num_Booleans = a1->num_Booleans;
  v9 = (char *)malloc(num_Booleans);
  a1->Booleans = v9;
  if (!v9)
    goto LABEL_8;
  v10 = v9;
  v11 = 2 * a1->num_Numbers;
  v12 = (__int16 *)malloc(v11);
  a1->Numbers = v12;
  if (!v12)
    goto LABEL_8;
  v13 = v12;
  v14 = 8 * a1->num_Strings;
  v15 = (char **)malloc(v14);
  a1->Strings = v15;
  if (!v15)
    goto LABEL_8;
  v16 = v15;
  memcpy(v10, a2->Booleans, num_Booleans);
  memcpy(v13, a2->Numbers, v11);
  memcpy(v16, a2->Strings, v14);
  v17 = a2->ext_Numbers + a2->ext_Booleans + a2->ext_Strings;
  if (v17)
  {
    v18 = (8 * v17);
    v19 = (char **)malloc(v18);
    a1->ext_Names = v19;
    if (v19)
    {
      memcpy(v19, a2->ext_Names, v18);
      return;
    }
LABEL_8:
    _nc_err_abort("Out of memory");
  }
  a1->ext_Names = 0;
}

uint64_t sub_1C05AED8C(uint64_t a1, char *__s1, int a3)
{
  int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    if (a3 == 1)
    {
      v5 = *(unsigned __int16 *)(a1 + 62);
      v6 = *(unsigned __int16 *)(a1 + 64) + v5;
    }
    else
    {
      if (a3 == 2)
      {
        v4 = *(unsigned __int16 *)(a1 + 64) + *(unsigned __int16 *)(a1 + 62);
        v5 = v4;
      }
      else
      {
        v5 = 0;
        v4 = *(unsigned __int16 *)(a1 + 64) + *(unsigned __int16 *)(a1 + 62);
      }
      v6 = v4 + *(unsigned __int16 *)(a1 + 66);
    }
  }
  else
  {
    v5 = 0;
    v6 = *(unsigned __int16 *)(a1 + 62);
  }
  if (v5 >= v6)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  while (strcmp(__s1, *(const char **)(v7 + 8 * v8)))
  {
    if (v9 == ++v8)
      return 0xFFFFFFFFLL;
  }
  return v8;
}

BOOL sub_1C05AEE44(uint64_t a1, char *a2, int a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _WORD *v19;
  uint64_t v20;

  v5 = sub_1C05AED8C(a1, a2, a3);
  v6 = v5;
  if ((v5 & 0x80000000) == 0)
  {
    v7 = *(unsigned __int16 *)(a1 + 62);
    v8 = *(unsigned __int16 *)(a1 + 64);
    v9 = *(unsigned __int16 *)(a1 + 66);
    v10 = v7 + v8 + v9 - 1;
    if (v5 < v10)
    {
      v11 = v5;
      do
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v11) = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v11 + 8);
        ++v11;
      }
      while (v11 < v10);
    }
    v12 = sub_1C05AF2AC((unsigned __int16 *)a1, v5, a3);
    switch(a3)
    {
      case 2:
        v16 = *(unsigned __int16 *)(a1 + 60);
        if (v12 < (int)v16 - 1)
        {
          v17 = v12;
          do
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v17) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v17 + 8);
            ++v17;
          }
          while (v16 - 1 != v17);
        }
        *(_WORD *)(a1 + 66) = v9 - 1;
        *(_WORD *)(a1 + 60) = v16 - 1;
        break;
      case 1:
        v18 = *(unsigned __int16 *)(a1 + 58);
        if (v12 < (int)v18 - 1)
        {
          v19 = (_WORD *)(*(_QWORD *)(a1 + 24) + 2 * v12 + 2);
          v20 = ~(uint64_t)v12 + v18;
          do
          {
            *(v19 - 1) = *v19;
            ++v19;
            --v20;
          }
          while (v20);
          LOWORD(v8) = *(_WORD *)(a1 + 64);
          v18 = *(unsigned __int16 *)(a1 + 58);
        }
        *(_WORD *)(a1 + 64) = v8 - 1;
        *(_WORD *)(a1 + 58) = v18 - 1;
        break;
      case 0:
        v13 = *(unsigned __int16 *)(a1 + 56);
        v14 = v13 - 1;
        if (v12 < (int)v13 - 1)
        {
          v15 = v12;
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 16) + v15) = *(_BYTE *)(*(_QWORD *)(a1 + 16) + v15 + 1);
            ++v15;
          }
          while (v14 != v15);
          LOWORD(v7) = *(_WORD *)(a1 + 62);
          LOWORD(v13) = *(_WORD *)(a1 + 56);
        }
        *(_WORD *)(a1 + 62) = v7 - 1;
        *(_WORD *)(a1 + 56) = v13 - 1;
        break;
    }
  }
  return v6 >= 0;
}

uint64_t sub_1C05AEFE4(uint64_t a1, char *__s1, int a3)
{
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 v23;
  void *v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int16 v29;
  char *v30;
  int v31;
  unsigned int v32;
  char *v33;
  char *v34;
  __int16 v35;

  if (a3)
  {
    if (a3 == 1)
    {
      LODWORD(v7) = *(unsigned __int16 *)(a1 + 62);
      v6 = *(unsigned __int16 *)(a1 + 64) + (_DWORD)v7;
      v8 = v6;
    }
    else
    {
      if (a3 == 2)
      {
        v6 = *(unsigned __int16 *)(a1 + 64) + *(unsigned __int16 *)(a1 + 62);
        LODWORD(v7) = v6;
      }
      else
      {
        LODWORD(v7) = 0;
        v6 = *(unsigned __int16 *)(a1 + 64) + *(unsigned __int16 *)(a1 + 62);
      }
      v8 = v6 + *(unsigned __int16 *)(a1 + 66);
    }
  }
  else
  {
    LODWORD(v7) = 0;
    v8 = *(unsigned __int16 *)(a1 + 62);
    v6 = *(unsigned __int16 *)(a1 + 64) + v8;
  }
  v9 = *(unsigned __int16 *)(a1 + 66);
  v10 = *(void **)(a1 + 48);
  if (v7 >= v8)
  {
LABEL_15:
    v13 = v6 + v9;
    v14 = _nc_doalloc(v10, (8 * (v6 + v9) + 8));
    *(_QWORD *)(a1 + 48) = v14;
    if (v14)
    {
      if (v13 > v7)
      {
        v15 = 8 * (v6 + v9);
        v16 = 8 * (v6 + v9 - 1);
        do
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 48) + v15) = *(_QWORD *)(*(_QWORD *)(a1 + 48) + v16);
          v15 -= 8;
          v16 -= 8;
          --v13;
        }
        while (v7 < v13);
        v14 = *(_QWORD **)(a1 + 48);
      }
      v14[v7] = __s1;
      v17 = sub_1C05AF2AC((unsigned __int16 *)a1, v7, a3);
      if (a3 == 2)
      {
        ++*(_WORD *)(a1 + 66);
        v23 = *(_WORD *)(a1 + 60) + 1;
        *(_WORD *)(a1 + 60) = v23;
        v24 = _nc_doalloc(*(void **)(a1 + 32), 8 * v23);
        *(_QWORD *)(a1 + 32) = v24;
        if (v24)
        {
          v25 = *(unsigned __int16 *)(a1 + 60);
          v26 = v25 - 1;
          if (v25 - 1 > v17)
          {
            v27 = 8 * (v25 - 2);
            v28 = 8 * v26;
            do
            {
              *(_QWORD *)(*(_QWORD *)(a1 + 32) + v28) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v27);
              v27 -= 8;
              v28 -= 8;
              --v26;
            }
            while (v17 < v26);
          }
          return v17;
        }
      }
      else if (a3 == 1)
      {
        ++*(_WORD *)(a1 + 64);
        v29 = *(_WORD *)(a1 + 58) + 1;
        *(_WORD *)(a1 + 58) = v29;
        v30 = (char *)_nc_doalloc(*(void **)(a1 + 24), 2 * v29);
        *(_QWORD *)(a1 + 24) = v30;
        if (v30)
        {
          v31 = *(unsigned __int16 *)(a1 + 58);
          v32 = v31 - 1;
          if (v31 - 1 > v17)
          {
            v33 = &v30[2 * (v31 - 2)];
            v34 = &v30[2 * v32];
            do
            {
              v35 = *(_WORD *)v33;
              v33 -= 2;
              *(_WORD *)v34 = v35;
              v34 -= 2;
              --v32;
            }
            while (v17 < v32);
          }
          return v17;
        }
      }
      else
      {
        if (a3)
          return v17;
        ++*(_WORD *)(a1 + 62);
        v18 = *(_WORD *)(a1 + 56) + 1;
        *(_WORD *)(a1 + 56) = v18;
        v19 = _nc_doalloc(*(void **)(a1 + 16), v18);
        *(_QWORD *)(a1 + 16) = v19;
        if (v19)
        {
          v20 = *(unsigned __int16 *)(a1 + 56);
          v21 = (v20 - 1);
          if (v21 > v17)
          {
            v22 = (v20 - 2);
            do
              *(_BYTE *)(*(_QWORD *)(a1 + 16) + v21--) = *(_BYTE *)(*(_QWORD *)(a1 + 16) + v22--);
            while (v17 < v21);
          }
          return v17;
        }
      }
    }
    _nc_err_abort("Out of memory");
  }
  v11 = v8;
  v7 = v7;
  while (1)
  {
    v12 = strcmp(__s1, *((const char **)v10 + v7));
    if (!v12)
      return sub_1C05AF2AC((unsigned __int16 *)a1, v7, a3);
    if (v12 < 0)
      goto LABEL_15;
    if (v11 == ++v7)
    {
      LODWORD(v7) = v11;
      goto LABEL_15;
    }
  }
}

uint64_t sub_1C05AF2AC(unsigned __int16 *a1, int a2, int a3)
{
  int v3;
  int v4;

  if (a3 == 1)
  {
    v3 = a1[29];
    v4 = a1[32] + a1[31];
  }
  else if (a3)
  {
    v4 = a1[33] + a1[31];
    v3 = a1[30] - a1[32];
  }
  else
  {
    v3 = a1[28];
    v4 = a1[31];
  }
  return (v3 - v4 + a2);
}

char *__cdecl _nc_captoinfo(const char *a1, const char *a2, const int a3)
{
  const char *v5;
  int v6;
  const char *v7;
  char v8;
  int v9;
  char *v10;
  char *v11;
  unsigned __int8 *v12;
  const char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  int v20;
  char *v21;
  char *v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;

  dword_1EF614AF8 = 0;
  dword_1EF614AFC = 0;
  dword_1EF614B00 = 0;
  dword_1EF614B04 = 0;
  dword_1EF614B08 = 0;
  dword_1EF614B0C = 1;
  qword_1EF614B10 = (uint64_t)sub_1C05AF9A8();
  if (a2)
    v5 = a2;
  else
    v5 = (const char *)&unk_1C05E2CBB;
  if (a3 < 0 || (v6 = *(unsigned __int8 *)v5, (v6 - 48) > 9))
  {
    v7 = v5;
    v5 = 0;
  }
  else
  {
    v7 = v5;
    while (v6 - 48 < 0xA || (v6 | 4) == 0x2E)
    {
      v8 = *++v7;
      LOBYTE(v6) = v8;
    }
  }
  while (1)
  {
    while (1)
    {
      v9 = *(unsigned __int8 *)v7;
      if (v9 != 37)
        break;
      v12 = (unsigned __int8 *)(v7 + 1);
      if (a3 <= 0)
      {
        byte_1EF614B28 = 37;
        qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, &byte_1EF614B28);
        ++v7;
      }
      else
      {
        v13 = v7 + 2;
        switch(v7[1])
        {
          case '+':
            sub_1C05AFA90(dword_1EF614B0C, 1);
            v7 = &v13[(int)sub_1C05AFBC8((char *)v7 + 2)];
            v16 = (char *)qword_1EF614B10;
            v17 = "%+%c";
            goto LABEL_27;
          case ',':
          case '/':
          case '1':
          case '4':
          case '5':
          case '7':
          case '9':
          case ':':
          case ';':
          case '<':
          case '=':
          case '?':
          case '@':
          case 'A':
          case 'C':
            goto LABEL_32;
          case '-':
            v7 = &v13[(int)sub_1C05AFBC8((char *)v7 + 2)];
            sub_1C05AFA90(dword_1EF614B0C, 1);
            v16 = (char *)qword_1EF614B10;
            v17 = "%-%c";
LABEL_27:
            qword_1EF614B10 = (uint64_t)sub_1C05AF9F8(v16, v17);
            sub_1C05AFDEC();
            continue;
          case '.':
            sub_1C05AFA90(dword_1EF614B0C, 1);
            v18 = (char *)qword_1EF614B10;
            v19 = "%c";
            goto LABEL_60;
          case '0':
            v20 = *(unsigned __int8 *)v13;
            if (v20 == 51)
              goto LABEL_33;
            if (v20 == 50)
            {
LABEL_31:
              sub_1C05AFA90(dword_1EF614B0C, 1);
              v18 = (char *)qword_1EF614B10;
              v19 = "%2d";
LABEL_60:
              qword_1EF614B10 = (uint64_t)sub_1C05AF9F8(v18, v19);
              sub_1C05AFDEC();
              v7 += 2;
            }
            else
            {
LABEL_32:
              byte_1EF614B28 = 37;
              qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, &byte_1EF614B28);
              v21 = unctrl((char)*v12);
              _nc_warning("unknown %% code %s (%#x) in %s", v21, *v12, a1);
              ++v7;
            }
            break;
          case '2':
            goto LABEL_31;
          case '3':
LABEL_33:
            sub_1C05AFA90(dword_1EF614B0C, 1);
            v18 = (char *)qword_1EF614B10;
            v19 = "%3d";
            goto LABEL_60;
          case '6':
          case 'B':
            sub_1C05AFA90(dword_1EF614B0C, 1);
            qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, "%{10}%/%{16}%*");
            sub_1C05AFA90(dword_1EF614B0C, 1);
            v14 = (char *)qword_1EF614B10;
            v15 = "%{10}%m%+";
            goto LABEL_51;
          case '8':
          case 'D':
            sub_1C05AFA90(dword_1EF614B0C, 2);
            v14 = (char *)qword_1EF614B10;
            v15 = "%{2}%*%-";
LABEL_51:
            qword_1EF614B10 = (uint64_t)sub_1C05AF9F8(v14, v15);
            v7 += 2;
            break;
          case '>':
            sub_1C05AFA90(dword_1EF614B0C, 2);
            qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, "%?");
            v22 = (char *)&v13[(int)sub_1C05AFBC8((char *)v7 + 2)];
            qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, "%>%t");
            v7 = &v22[(int)sub_1C05AFBC8(v22)];
            v10 = (char *)qword_1EF614B10;
            v11 = "%+%;";
            goto LABEL_14;
          default:
            switch(v7[1])
            {
              case '\\':
                v14 = (char *)qword_1EF614B10;
                v15 = "%\\";
                goto LABEL_51;
              case ']':
              case '^':
              case '_':
              case 'c':
              case 'e':
              case 'g':
              case 'h':
              case 'j':
              case 'k':
              case 'l':
              case 'o':
              case 'p':
              case 'q':
                goto LABEL_32;
              case 'a':
                v23 = *(unsigned __int8 *)v13;
                if (v23 > 0x3D
                  || ((1 << v23) & 0x2000AC0000000000) == 0
                  || (v24 = *((unsigned __int8 *)v7 + 3), v24 != 112) && v24 != 99
                  || !v7[4])
                {
                  sub_1C05AFA90(dword_1EF614B0C, 1);
                  v7 = &v13[(int)sub_1C05AFBC8((char *)v7 + 2)];
                  v10 = (char *)qword_1EF614B10;
                  v11 = "%+";
                  goto LABEL_14;
                }
                if (v23 != 61)
                {
                  sub_1C05AFA90(dword_1EF614B0C, 1);
                  v24 = *((unsigned __int8 *)v7 + 3);
                }
                if (v24 == 112)
                {
                  sub_1C05AFA90(dword_1EF614B0C + v7[4] - 64, 1);
                  if (dword_1EF614B0C != dword_1EF614AFC)
                  {
                    sub_1C05AFDEC();
                    --dword_1EF614B0C;
                  }
                  v25 = 3;
                }
                else
                {
                  v25 = sub_1C05AFBC8((char *)v7 + 4) + 2;
                }
                switch(*v13)
                {
                  case '*':
                    v30 = (char *)qword_1EF614B10;
                    v31 = "%*";
                    goto LABEL_73;
                  case '+':
                    v30 = (char *)qword_1EF614B10;
                    v31 = "%+";
                    goto LABEL_73;
                  case ',':
                  case '.':
                    goto LABEL_74;
                  case '-':
                    v30 = (char *)qword_1EF614B10;
                    v31 = "%-";
                    goto LABEL_73;
                  case '/':
                    v30 = (char *)qword_1EF614B10;
                    v31 = "%/";
LABEL_73:
                    qword_1EF614B10 = (uint64_t)sub_1C05AF9F8(v30, v31);
                    goto LABEL_74;
                  default:
                    if (*v13 != 61)
                      goto LABEL_74;
                    if (!dword_1EF614B08)
                      goto LABEL_75;
                    if (dword_1EF614B0C == 2)
                    {
                      dword_1EF614AFC = 1;
                    }
                    else if (dword_1EF614B0C == 1)
                    {
                      dword_1EF614AFC = 2;
                    }
                    else
                    {
LABEL_75:
                      dword_1EF614AFC = dword_1EF614B0C;
                    }
LABEL_74:
                    v7 = &v13[v25];
                    break;
                }
                break;
              case 'b':
                v26 = dword_1EF614B0C - 1;
                goto LABEL_49;
              case 'd':
                sub_1C05AFA90(dword_1EF614B0C, 1);
                v18 = (char *)qword_1EF614B10;
                v19 = "%d";
                goto LABEL_60;
              case 'f':
                v26 = dword_1EF614B0C + 1;
LABEL_49:
                dword_1EF614B0C = v26;
                v7 += 2;
                continue;
              case 'i':
                v14 = (char *)qword_1EF614B10;
                v15 = "%i";
                goto LABEL_51;
              case 'm':
                v27 = dword_1EF614B00++;
                v7 += 2;
                if (v27 != 1)
                  continue;
                _nc_warning("saw %%m twice in %s");
                goto LABEL_58;
              case 'n':
                v28 = dword_1EF614B04++;
                v7 += 2;
                if (v28 != 1)
                  continue;
                _nc_warning("saw %%n twice in %s");
                goto LABEL_58;
              case 'r':
                v29 = dword_1EF614B08++;
                v7 += 2;
                if (v29 != 1)
                  continue;
                _nc_warning("saw %%r twice in %s");
LABEL_58:
                v7 = v13;
                continue;
              case 's':
                sub_1C05AFA90(dword_1EF614B0C, 1);
                v18 = (char *)qword_1EF614B10;
                v19 = "%s";
                goto LABEL_60;
              default:
                if (v7[1] != 37)
                  goto LABEL_32;
                v14 = (char *)qword_1EF614B10;
                byte_1EF614B28 = 37;
                v15 = &byte_1EF614B28;
                goto LABEL_51;
            }
            break;
        }
      }
    }
    if (!*v7)
      break;
    v10 = (char *)qword_1EF614B10;
    ++v7;
    byte_1EF614B28 = v9;
    v11 = &byte_1EF614B28;
LABEL_14:
    qword_1EF614B10 = (uint64_t)sub_1C05AF9F8(v10, v11);
  }
  v32 = (char *)qword_1EF614B10;
  if (v5)
  {
    v33 = sub_1C05AF9F8((char *)qword_1EF614B10, "$<");
    qword_1EF614B10 = (uint64_t)v33;
    while (*(unsigned __int8 *)v5 - 48 < 0xA || (*v5 | 4) == 0x2E)
    {
      byte_1EF614B28 = *v5;
      v33 = sub_1C05AF9F8(v33, &byte_1EF614B28);
      qword_1EF614B10 = (uint64_t)v33;
      ++v5;
    }
    v32 = sub_1C05AF9F8(v33, "/>");
    qword_1EF614B10 = (uint64_t)v32;
  }
  byte_1EF614B28 = 0;
  sub_1C05AF9F8(v32, &byte_1EF614B28);
  return (char *)qword_1EF614B18;
}

_BYTE *sub_1C05AF9A8()
{
  _BYTE *result;

  result = (_BYTE *)qword_1EF614B18;
  if (!qword_1EF614B18)
  {
    qword_1EF614B20 = 256;
    result = malloc(0x100uLL);
    qword_1EF614B18 = (uint64_t)result;
    if (!result)
      _nc_err_abort("Out of memory");
  }
  *result = 0;
  return result;
}

char *sub_1C05AF9F8(char *a1, char *__s)
{
  char *v3;
  char *v4;
  size_t v5;
  uint64_t v6;
  char *v7;

  v3 = a1;
  v4 = &a1[-qword_1EF614B18];
  v5 = (size_t)&a1[strlen(__s) - qword_1EF614B18 + 2];
  if (v5 > qword_1EF614B20)
  {
    qword_1EF614B20 = 2 * v5;
    v6 = (uint64_t)_nc_doalloc((void *)qword_1EF614B18, 2 * v5);
    qword_1EF614B18 = v6;
    if (!v6)
      _nc_err_abort("Out of memory");
    v3 = &v4[v6];
  }
  v7 = strcpy(v3, __s);
  return &v3[strlen(v7)];
}

void sub_1C05AFA90(int a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  char *v6;
  uint64_t v7;

  if (a1 == 2)
    v2 = 1;
  else
    v2 = a1;
  if (a1 == 1)
    v3 = 2;
  else
    v3 = v2;
  if (dword_1EF614B08)
    v4 = v3;
  else
    v4 = a1;
  if (a2)
  {
    v5 = a2;
    v6 = (char *)qword_1EF614B10;
    do
    {
      --v5;
      qword_1EF614B10 = (uint64_t)sub_1C05AF9F8(v6, "%p");
      byte_1EF614B28 = v4 + 48;
      v6 = sub_1C05AF9F8((char *)qword_1EF614B10, &byte_1EF614B28);
      qword_1EF614B10 = (uint64_t)v6;
    }
    while (v5);
  }
  if (dword_1EF614AFC != v4)
  {
    if (dword_1EF614AFC)
    {
      v7 = dword_1EF614AF8;
      if (dword_1EF614AF8 < 16)
      {
        ++dword_1EF614AF8;
        dword_1EF614B2C[v7] = dword_1EF614AFC;
      }
      else
      {
        _nc_warning("string too complex to convert");
      }
    }
    dword_1EF614AFC = v4;
    if (v4 <= 2 && dword_1EF614B04)
      qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, "%{96}%^");
    if (v4 <= 2)
    {
      if (dword_1EF614B00)
        qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, "%{127}%^");
    }
  }
}

uint64_t sub_1C05AFBC8(char *a1)
{
  int v1;
  unsigned int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  int v8;
  char *v10;
  char v11;

  v1 = *a1;
  if (v1 == 94)
  {
    v6 = a1[1];
    if (v6 == 63)
    {
      v5 = 2;
      v7 = 127;
      goto LABEL_18;
    }
    if (a1[1])
    {
      v7 = v6 & 0x1F;
      v5 = 2;
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  if (v1 != 92)
  {
    LOBYTE(v2) = *a1;
    v5 = 1;
    goto LABEL_12;
  }
  v2 = a1[1];
  if ((a1[1] - 48) >= 4)
  {
    if (a1[1])
    {
      v5 = 2;
      goto LABEL_12;
    }
    v5 = 1;
    v7 = 92;
LABEL_18:
    LOBYTE(v2) = v7;
    goto LABEL_19;
  }
  if (v2 - 48 > 9)
  {
LABEL_10:
    v7 = 0;
    v5 = 1;
    goto LABEL_18;
  }
  v3 = 0;
  v4 = 2;
  do
  {
    v3 = v2 + 8 * v3 - 48;
    v2 = a1[v4++];
  }
  while (v2 - 48 < 0xA);
  v5 = (v4 - 1);
  LOBYTE(v2) = v3;
LABEL_12:
  v7 = v2;
  if ((v2 & 0x80) == 0)
  {
LABEL_19:
    v8 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v7 + 60) & 0x800;
    goto LABEL_20;
  }
  v8 = __maskrune(v2, 0x800uLL);
LABEL_20:
  if (v8)
  {
    if (v2 - 39 > 0x35
      || ((1 << (v2 - 39)) & 0x20000000080021) == 0)
    {
      v10 = sub_1C05AF9F8((char *)qword_1EF614B10, "%'");
      qword_1EF614B10 = (uint64_t)v10;
      v11 = 39;
      goto LABEL_30;
    }
  }
  v10 = sub_1C05AF9F8((char *)qword_1EF614B10, "%{");
  qword_1EF614B10 = (uint64_t)v10;
  if (v2 >= 0x64u)
  {
    byte_1EF614B28 = ((41 * v7) >> 12) | 0x30;
    v10 = sub_1C05AF9F8(v10, &byte_1EF614B28);
    qword_1EF614B10 = (uint64_t)v10;
LABEL_28:
    byte_1EF614B28 = (((205 * v7) >> 11) - 10 * ((unsigned __int16)(26 * ((205 * v7) >> 11)) >> 8)) | 0x30;
    v10 = sub_1C05AF9F8(v10, &byte_1EF614B28);
    qword_1EF614B10 = (uint64_t)v10;
    goto LABEL_29;
  }
  if (v2 >= 0xAu)
    goto LABEL_28;
LABEL_29:
  v2 = (v7 - 10 * ((205 * v7) >> 11)) | 0x30;
  v11 = 125;
LABEL_30:
  byte_1EF614B28 = v2;
  qword_1EF614B10 = (uint64_t)sub_1C05AF9F8(v10, &byte_1EF614B28);
  byte_1EF614B28 = v11;
  qword_1EF614B10 = (uint64_t)sub_1C05AF9F8((char *)qword_1EF614B10, &byte_1EF614B28);
  return v5;
}

void sub_1C05AFDEC()
{
  int v0;

  v0 = dword_1EF614AF8;
  if (dword_1EF614AF8)
  {
    --dword_1EF614AF8;
    dword_1EF614AFC = dword_1EF614B2C[v0 - 1];
  }
  else if (dword_1EF614AFC)
  {
    dword_1EF614AFC = 0;
  }
  else
  {
    _nc_warning("I'm confused");
  }
  ++dword_1EF614B0C;
}

char *__cdecl _nc_infotocap(const char *a1, const char *a2, const int a3)
{
  uint64_t v3;
  char *v5;
  const char *v6;
  const char *v7;
  int v8;
  const char *v9;
  int v10;
  int v11;
  const char *j;
  char *v13;
  unsigned int v14;
  int v16;
  char *v17;
  char *v18;
  int v19;
  chtype v20;
  chtype v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  char *v27;
  char *v28;
  char *v29;
  chtype v30;
  int v31;
  int v32;
  int v33;
  int v34;
  char v35;
  unsigned int v36;
  char v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  int v42;
  int v43;
  int v44;
  int v46;
  char *i;
  char v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  chtype v53[2];
  char v54[4];
  __int16 v55;
  uint64_t v56;
  int v57;
  __int16 v58;

  v3 = *(_QWORD *)&a3;
  v57 = 0;
  v56 = 0;
  v55 = 0;
  v5 = sub_1C05AF9A8();
  v6 = &a2[strlen(a2)];
  if (v6 - 1 > a2 && *(v6 - 1) == 62)
  {
    v8 = *((unsigned __int8 *)v6 - 2);
    v7 = v6 - 2;
    if (v8 == 47)
      --v7;
    while (*(unsigned __int8 *)v7 - 48 < 0xA || (*v7 | 4) == 0x2E)
      --v7;
    v9 = 0;
    if (v7 > a2 && *v7 == 60)
    {
      v46 = *(unsigned __int8 *)--v7;
      if (v46 == 36)
        v9 = v7;
      else
        v9 = 0;
    }
    for (i = (char *)(v7 + 2); ; ++i)
    {
      v48 = *i;
      if (*i - 48 >= 0xA && (v48 | 4) != 0x2E)
        break;
      byte_1EF614B28 = v48;
      v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
    }
  }
  else
  {
    v9 = 0;
  }
  if (!*a2)
    return (char *)qword_1EF614B18;
  v10 = 0;
  v51 = 0;
  v52 = 0;
  while (!v9 || a2 < v9)
  {
    *(_QWORD *)v53 = 0;
    v11 = *(unsigned __int8 *)a2;
    switch(v11)
    {
      case '$':
        if (a2[1] == 60)
        {
          for (j = a2 + 1; ; ++j)
          {
            v14 = *((unsigned __int8 *)j + 1);
            if (v14 - 48 >= 0xA && (v14 > 0x3E || ((1 << j[1]) & 0x4000C40000000000) == 0))
              break;
          }
          goto LABEL_144;
        }
        break;
      case '\\':
        j = a2 + 1;
        v19 = *((unsigned __int8 *)a2 + 1);
        if (a2 + 1 == v9 || !a2[1])
        {
          v13 = v5;
          v18 = "\\134";
          goto LABEL_143;
        }
        if (v19 == 44)
        {
LABEL_140:
          byte_1EF614B28 = v19;
          goto LABEL_141;
        }
        if (v19 == 94)
          goto LABEL_39;
        v49 = v10;
        v22 = v3;
        byte_1EF614B28 = 92;
        v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
        v23 = *j;
        v24 = *(unsigned __int8 *)j;
        if (!_nc_strict_bsd)
          goto LABEL_61;
        if ((v24 - 48) <= 9)
        {
          v25 = *((unsigned __int8 *)a2 + 2);
          if ((v25 - 58) < 0xFFFFFFF6)
          {
            v3 = v22;
            if (v24 == 48)
            {
              v26 = 2;
              v10 = v49;
LABEL_111:
              v36 = v26 + 1;
              v37 = 50;
              do
              {
                byte_1EF614B28 = v37;
                v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
                --v36;
                v37 = 48;
              }
              while (v36 > 1);
              goto LABEL_63;
            }
LABEL_62:
            v10 = v49;
            goto LABEL_63;
          }
          v3 = v22;
          if (!a2[2])
            goto LABEL_62;
          v10 = v49;
          if (v24 == 48 && v25 == 48)
          {
            if (*((unsigned __int8 *)a2 + 3) - 48 >= 0xA)
            {
              v26 = 1;
              goto LABEL_111;
            }
            LOBYTE(v24) = 48;
          }
LABEL_63:
          byte_1EF614B28 = v24;
LABEL_141:
          v13 = v5;
          goto LABEL_142;
        }
        if (memchr("E\\nrtbf", *j, 8uLL))
        {
LABEL_61:
          v3 = v22;
          goto LABEL_62;
        }
        if (v23 > 107)
        {
          if (v23 == 115)
          {
            LOBYTE(v24) = 48;
            byte_1EF614B28 = 48;
            v39 = sub_1C05AF9F8(v5, &byte_1EF614B28);
            byte_1EF614B28 = 52;
            v5 = sub_1C05AF9F8(v39, &byte_1EF614B28);
            goto LABEL_61;
          }
          if (v23 == 108)
          {
            LOBYTE(v24) = 110;
            goto LABEL_61;
          }
        }
        else
        {
          if (v23 == 58)
          {
            byte_1EF614B28 = 48;
            v38 = sub_1C05AF9F8(v5, &byte_1EF614B28);
            byte_1EF614B28 = 55;
            v5 = sub_1C05AF9F8(v38, &byte_1EF614B28);
            LOBYTE(v24) = 50;
            goto LABEL_61;
          }
          if (v23 == 101)
          {
            LOBYTE(v24) = 69;
            goto LABEL_61;
          }
        }
        __sprintf_chk(v54, 0, 4uLL, "%03o", v24);
        byte_1EF614B28 = v54[0];
        v40 = sub_1C05AF9F8(v5, &byte_1EF614B28);
        byte_1EF614B28 = v54[1];
        v5 = sub_1C05AF9F8(v40, &byte_1EF614B28);
        LOBYTE(v24) = v54[2];
        goto LABEL_61;
      case '^':
        j = a2 + 1;
        if (a2 + 1 != v9 && a2[1])
        {
          byte_1EF614B28 = 94;
          v13 = sub_1C05AF9F8(v5, &byte_1EF614B28);
          byte_1EF614B28 = *j;
LABEL_142:
          v18 = &byte_1EF614B28;
          goto LABEL_143;
        }
LABEL_39:
        v13 = v5;
        v18 = "\\136";
LABEL_143:
        v5 = sub_1C05AF9F8(v13, v18);
        goto LABEL_144;
    }
    if (sscanf(a2, "[%%?%%p1%%{8}%%<%%t%d%%p1%%d%%e%%p1%%{16}%%<%%t%d%%p1%%{8}%%-%%d%%e%d;5;%%p1%%d%%;m",
           &v57,
           (char *)&v56 + 4,
           &v56) == 3)
    {
      if ((v16 = v56, v57 == 4) && v56 == 0xA00000030 || v57 == 3 && v56 == 0x900000026)
      {
        v17 = strstr((char *)a2, ";m");
        if (!v17)
          break;
        j = v17 + 1;
        v13 = v5;
        if (v16 == 48)
          v18 = "[48;5;%dm";
        else
          v18 = "[38;5;%dm";
        goto LABEL_143;
      }
    }
    if (*a2 != 37)
      goto LABEL_49;
    j = a2 + 1;
    if (a2[1] == 37)
    {
      v13 = v5;
      v18 = "%%";
      goto LABEL_143;
    }
    if ((int)v3 <= 0)
    {
LABEL_49:
      byte_1EF614B28 = *a2;
      v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
      j = a2;
      goto LABEL_144;
    }
    if (sscanf(a2, "%%?%%{%d}%%>%%t%%{%d}%%+%%;", &v53[1], v53) == 2)
    {
      j = strchr((char *)a2, 59);
      v20 = v53[1];
      goto LABEL_48;
    }
    if (sscanf(a2, "%%?%%{%d}%%>%%t%%'%c'%%+%%;", &v53[1], &v55) == 2)
    {
      j = strchr((char *)a2, 59);
      v20 = v53[1];
      goto LABEL_57;
    }
    if (sscanf(a2, "%%?%%'%c'%%>%%t%%{%d}%%+%%;", (char *)&v55 + 1, v53) == 2)
    {
      j = strchr((char *)a2, 59);
      v20 = SHIBYTE(v55);
LABEL_48:
      v21 = v53[0];
LABEL_58:
      v5 = sub_1C05B0878(v5, v20, v21);
      if (!j)
        break;
      goto LABEL_144;
    }
    if (sscanf(a2, "%%?%%'%c'%%>%%t%%'%c'%%+%%;", (char *)&v55 + 1, &v55) == 2)
    {
      j = strchr((char *)a2, 59);
      v20 = SHIBYTE(v55);
LABEL_57:
      v21 = (char)v55;
      goto LABEL_58;
    }
    v58 = 0;
    if (sscanf(a2, "%%p%c%%{10}%%/%%{16}%%*%%p%c%%{10}%%m%%+", (char *)&v58 + 1, &v58) == 2
      && HIBYTE(v58) - 48 <= 9
      && HIBYTE(v58) == v58
      && v58 - 48 <= 9)
    {
      j = a2 + 28;
      v13 = v5;
      v18 = "%B";
      goto LABEL_143;
    }
    v50 = v3;
    if (sscanf(a2, "%%{%d}%%+%%c", &v53[1]) == 1 || sscanf(a2, "%%'%c'%%+%%c", (char *)&v55 + 1) == 1)
    {
      v27 = strchr((char *)a2, 43);
      if (v27)
      {
        v28 = v27;
        v29 = sub_1C05AF9F8(v5, "%+");
        v30 = SHIBYTE(v55);
        if (HIBYTE(v55))
          v53[1] = SHIBYTE(v55);
        else
          v30 = v53[1];
        j = v28 + 2;
        v41 = sub_1C05B08B0(v29, v30);
LABEL_120:
        v5 = v41;
LABEL_121:
        v3 = v50;
        goto LABEL_144;
      }
    }
    if (!strncmp(a2, "%{2}%*%-", 8uLL))
    {
      j = a2 + 7;
      v41 = sub_1C05AF9F8(v5, "%D");
      goto LABEL_120;
    }
    v3 = v3;
    if (!strncmp(a2, "%{96}%^", 7uLL))
    {
      j = a2 + 6;
      if (HIDWORD(v52))
      {
        v42 = HIDWORD(v52) + 1;
      }
      else
      {
        v5 = sub_1C05AF9F8(v5, "%n");
        v42 = 1;
      }
      HIDWORD(v52) = v42;
      goto LABEL_144;
    }
    if (!strncmp(a2, "%{127}%^", 8uLL))
    {
      j = a2 + 7;
      if ((_DWORD)v52)
      {
        v43 = v52 + 1;
      }
      else
      {
        v5 = sub_1C05AF9F8(v5, "%m");
        v43 = 1;
      }
      LODWORD(v52) = v43;
      goto LABEL_144;
    }
    v19 = *j;
    if (v19 <= 98)
    {
      if ((v19 - 48) < 0xA)
      {
        byte_1EF614B28 = 37;
        v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
        v55 = 0;
        v31 = *(unsigned __int8 *)j;
        v32 = _nc_strict_bsd;
        if ((v31 - 48) <= 9)
        {
          do
          {
            LOBYTE(v55) = HIBYTE(v55);
            v34 = *j++;
            v33 = v34;
            HIBYTE(v55) = v34;
            if (v32)
            {
              if (v33 > 51)
                return 0;
            }
            else
            {
              byte_1EF614B28 = v33;
              v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
              v32 = _nc_strict_bsd;
            }
            v31 = *(unsigned __int8 *)j;
          }
          while ((v31 - 48) < 0xA);
        }
        if (v32)
        {
          if (v55 != 48 && (_BYTE)v55)
            return 0;
          v35 = HIBYTE(v55);
          if (SHIBYTE(v55) <= 49)
          {
            v35 = 100;
            HIBYTE(v55) = 100;
          }
          byte_1EF614B28 = v35;
          v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
          v31 = *(unsigned __int8 *)j;
        }
        if (memchr("doxX.", (char)v31, 6uLL) && v31 != 100)
          return 0;
        goto LABEL_144;
      }
      if (v19 == 37)
        goto LABEL_140;
LABEL_147:
      byte_1EF614B28 = *j;
      v5 = sub_1C05AF9F8(v5, &byte_1EF614B28);
      v10 = 1;
      goto LABEL_144;
    }
    if (v19 <= 104)
    {
      if (v19 == 99)
      {
        v13 = v5;
        v18 = "%.";
        goto LABEL_143;
      }
      if (v19 == 100)
      {
        v13 = v5;
        v18 = "%d";
        goto LABEL_143;
      }
      goto LABEL_147;
    }
    if (v19 == 105)
    {
      v13 = v5;
      v18 = "%i";
      goto LABEL_143;
    }
    if (v19 != 112)
    {
      if (v19 == 115)
      {
        if (_nc_strict_bsd)
          return 0;
        v13 = v5;
        v18 = "%s";
        goto LABEL_143;
      }
      goto LABEL_147;
    }
    v44 = *((unsigned __int8 *)a2 + 2);
    j = a2 + 2;
    if (v44 != 49)
    {
      if (v44 != 50)
      {
        v3 = v3;
        if ((char)v44 > 50)
          return 0;
        goto LABEL_144;
      }
      if (!v51)
      {
        v5 = sub_1C05AF9F8(v5, "%r");
        v51 = 1;
      }
      goto LABEL_121;
    }
    HIDWORD(v51) = 1;
LABEL_144:
    if (*j)
    {
      a2 = j + 1;
      if (j[1])
        continue;
    }
    break;
  }
  if ((v10 & 1) == 0)
    return (char *)qword_1EF614B18;
  return 0;
}

char *sub_1C05B0878(char *a1, chtype a2, chtype a3)
{
  char *v5;
  char *v6;

  v5 = sub_1C05AF9F8(a1, "%>");
  v6 = sub_1C05B08B0(v5, a2);
  return sub_1C05B08B0(v6, a3);
}

char *sub_1C05B08B0(char *a1, chtype a2)
{
  char v2;
  char *v3;
  char __s[80];
  uint64_t v6;

  v2 = a2;
  v3 = a1;
  v6 = *MEMORY[0x1E0C80C00];
  if (a2 > 0x7F)
    goto LABEL_5;
  if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * a2 + 60) & 0x40000) == 0)
  {
    if (a2 <= 0x1F)
    {
      unctrl(a2);
      __sprintf_chk(__s, 0, 0x50uLL, "%.20s");
      return sub_1C05AF9F8(v3, __s);
    }
LABEL_5:
    __sprintf_chk(__s, 0, 0x50uLL, "\\%03o");
    return sub_1C05AF9F8(v3, __s);
  }
  if (a2 == 92 || a2 == 58)
  {
    byte_1EF614B28 = 92;
    v3 = sub_1C05AF9F8(a1, &byte_1EF614B28);
  }
  byte_1EF614B28 = v2;
  return sub_1C05AF9F8(v3, &byte_1EF614B28);
}

BOOL _nc_is_charable(wint_t a1)
{
  return wctob(a1) == a1;
}

const name_table_entry *__cdecl _nc_get_table(BOOL a1)
{
  if (a1)
    return (const name_table_entry *)sub_1C05B0A44(&qword_1EF614B70, (uint64_t)&unk_1C05DB9CC, (uint64_t)&unk_1C05DD118);
  else
    return (const name_table_entry *)sub_1C05B0A44(&qword_1EF614B78, (uint64_t)&unk_1C05DD6EC, (uint64_t)&unk_1C05DEE38);
}

char *sub_1C05B0A44(char **a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v3 = *a1;
  if (!*a1)
  {
    v3 = (char *)calloc(0x1F1uLL, 0x10uLL);
    *a1 = v3;
    if (v3)
    {
      v7 = 0;
      v8 = a2 + 10;
      v9 = -7952;
      do
      {
        v10 = (const char *)(a3 + v7);
        *(_QWORD *)&v3[v9 + 7952] = v10;
        v3 = *a1;
        v11 = (uint64_t)&(*a1)[v9];
        *(_DWORD *)(v11 + 7960) = *(_DWORD *)(v8 - 6);
        *(_DWORD *)(v11 + 7964) = *(_DWORD *)(v8 - 2);
        v7 += strlen(v10) + 1;
        v8 += 12;
        v9 += 16;
      }
      while (v9);
    }
  }
  return v3;
}

const HashValue *__cdecl _nc_get_hash_table(BOOL a1)
{
  if (a1)
    return (const HashValue *)&unk_1C05DF790;
  else
    return (const HashValue *)&unk_1C05DFF56;
}

const alias *__cdecl _nc_get_alias_table(BOOL a1)
{
  if (a1)
    return (const alias *)sub_1C05B0B44((uint64_t)&unk_1EF614B80, (uint64_t)&unk_1C05E071C, (uint64_t)&unk_1C05E0824, 44);
  else
    return (const alias *)sub_1C05B0B44((uint64_t)&unk_1EF614B88, (uint64_t)&unk_1C05E09F6, (uint64_t)"font0", 6);
}

void *sub_1C05B0B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *result;
  uint64_t v6;
  uint64_t v9;
  __int16 *v10;

  result = *(void **)a1;
  if (!result)
  {
    v6 = a4;
    result = calloc(a4 + 1, 0x18uLL);
    *(_QWORD *)a1 = result;
    if (result)
    {
      if (v6)
      {
        v9 = 0;
        v10 = (__int16 *)(a2 + 4);
        do
        {
          if ((*(v10 - 2) & 0x80000000) == 0)
            *(_QWORD *)(*(_QWORD *)a1 + v9) = a3 + (unsigned __int16)*(v10 - 2);
          if ((*(v10 - 1) & 0x80000000) == 0)
            *(_QWORD *)(*(_QWORD *)a1 + v9 + 8) = a3 + (unsigned __int16)*(v10 - 1);
          if ((*v10 & 0x80000000) == 0)
            *(_QWORD *)(*(_QWORD *)a1 + v9 + 16) = a3 + (unsigned __int16)*v10;
          v10 += 3;
          v9 += 24;
          --v6;
        }
        while (v6);
        return *(void **)a1;
      }
    }
  }
  return result;
}

const HashData *__cdecl _nc_get_hash_info(BOOL a1)
{
  return (const HashData *)((char *)&unk_1E79D98B8 + 32 * a1);
}

uint64_t sub_1C05B0C14(char *a1)
{
  char v1;
  int v2;
  char *v3;
  int v4;
  int v5;

  v1 = *a1;
  if (*a1)
  {
    v2 = 0;
    v3 = a1 + 1;
    do
    {
      v4 = *v3++;
      v2 += (v4 << 8) + v1;
      v1 = v4;
    }
    while (v4);
    v5 = v2 % 994;
  }
  else
  {
    LOWORD(v5) = 0;
  }
  return (__int16)v5;
}

BOOL sub_1C05B0C7C(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_1C05B0C98(char *a1)
{
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  int v6;
  char *v7;
  int v8;
  int v9;
  char v11;
  __int16 v12;

  v1 = 0;
  v2 = 0;
  while (1)
  {
    v3 = v1;
    v4 = *a1;
    if (!*a1)
      break;
    ++a1;
    *(&v11 + v2) = v4;
    v1 = 1;
    v2 = 1;
    if ((v3 & 1) != 0)
    {
      v2 = 2;
      break;
    }
  }
  *(&v11 + v2) = 0;
  v5 = v11;
  if (v11)
  {
    v6 = 0;
    v7 = (char *)&v12;
    do
    {
      v8 = *v7++;
      v6 += (v8 << 8) + v5;
      v5 = v8;
    }
    while (v8);
    v9 = v6 % 994;
  }
  else
  {
    LOWORD(v9) = 0;
  }
  return (__int16)v9;
}

BOOL sub_1C05B0D40(const char *a1, const char *a2)
{
  return strncmp(a1, a2, 2uLL) == 0;
}

const char *_nc_get_source(void)
{
  return *(const char **)&PC[24];
}

void _nc_set_source(const char *const a1)
{
  if (*(_QWORD *)&PC[24])
    free(*(void **)&PC[24]);
  *(_QWORD *)&PC[24] = strdup(a1);
}

void _nc_set_type(const char *const a1)
{
  _BYTE *v2;

  v2 = *(_BYTE **)&PC[32];
  if (*(_QWORD *)&PC[32] || (v2 = malloc(0x201uLL), (*(_QWORD *)&PC[32] = v2) != 0))
  {
    *v2 = 0;
    if (a1)
      strncat(*(char **)&PC[32], a1, 0x200uLL);
  }
}

void _nc_get_type(char *name)
{
  const char *v1;

  if (name)
  {
    if (*(_QWORD *)&PC[32])
      v1 = *(const char **)&PC[32];
    else
      v1 = (const char *)&unk_1C05E2CBB;
    strcpy(name, v1);
  }
}

void _nc_warning(const char *const a1, ...)
{
  FILE **v2;
  va_list va;

  va_start(va, a1);
  if (!_nc_suppress_warnings)
  {
    sub_1C05B0E94();
    v2 = (FILE **)MEMORY[0x1E0C80C10];
    vfprintf((FILE *)*MEMORY[0x1E0C80C10], a1, va);
    fputc(10, *v2);
  }
}

uint64_t sub_1C05B0E94()
{
  FILE **v0;
  const char *v1;

  v0 = (FILE **)MEMORY[0x1E0C80C10];
  v1 = *(const char **)&PC[24];
  if (!*(_QWORD *)&PC[24])
    v1 = "?";
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "\"%s\"", v1);
  if ((_nc_curr_line & 0x80000000) == 0)
    fprintf(*v0, ", line %d", _nc_curr_line);
  if ((_nc_curr_col & 0x80000000) == 0)
    fprintf(*v0, ", col %d", _nc_curr_col);
  if (*(_QWORD *)&PC[32] && **(_BYTE **)&PC[32])
    fprintf(*v0, ", terminal '%s'", *(const char **)&PC[32]);
  fputc(58, *v0);
  return fputc(32, *v0);
}

void _nc_err_abort(const char *const a1, ...)
{
  FILE **v2;
  va_list va;

  va_start(va, a1);
  sub_1C05B0E94();
  v2 = (FILE **)MEMORY[0x1E0C80C10];
  vfprintf((FILE *)*MEMORY[0x1E0C80C10], a1, va);
  fputc(10, *v2);
  exit(1);
}

void _nc_syserr_abort(const char *const a1, ...)
{
  FILE **v2;
  va_list va;

  va_start(va, a1);
  sub_1C05B0E94();
  v2 = (FILE **)MEMORY[0x1E0C80C10];
  vfprintf((FILE *)*MEMORY[0x1E0C80C10], a1, va);
  fputc(10, *v2);
  exit(1);
}

char *__cdecl _nc_tic_expand(const char *a1, BOOL a2, int a3)
{
  _BOOL4 v4;
  const char *v6;
  size_t v7;
  unint64_t v8;
  size_t v9;
  BOOL v10;
  char *result;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  _BYTE *v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  const char *v29;
  int v30;
  uint64_t v31;
  char *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  int v37;
  char *v38;
  int v39;
  char *__endptr;

  v4 = a2;
  if ((unint64_t)(a1 + 1) <= 1)
    v6 = (const char *)&unk_1C05E0A74;
  else
    v6 = a1;
  v7 = strlen(v6);
  if (!a1)
    return 0;
  v8 = v7;
  v9 = 4 * v7 + 8;
  if (qword_1EF614B90)
    v10 = v9 > qword_1EF614B98;
  else
    v10 = 1;
  if (!v10
    || (qword_1EF614B98 = 4 * v7 + 8,
        result = (char *)_nc_doalloc((void *)qword_1EF614B90, v9),
        (qword_1EF614B90 = (uint64_t)result) != 0))
  {
    v39 = a3;
    v12 = 0;
    v13 = MEMORY[0x1E0C80978];
    while (1)
    {
      v14 = *(unsigned __int8 *)v6;
      if (*(unsigned __int8 *)v6 > 0x39u)
      {
        if (*(unsigned __int8 *)v6 > 0x5Du)
        {
          if ((_DWORD)v14 == 94)
            goto LABEL_35;
          if ((_DWORD)v14 != 128)
            goto LABEL_49;
          v18 = qword_1EF614B90;
          v19 = 12380;
          goto LABEL_66;
        }
        if ((_DWORD)v14 == 58)
          goto LABEL_35;
        if ((_DWORD)v14 != 92)
          goto LABEL_49;
        if (v4 && (v6 == a1 || *(v6 - 1) != 94))
        {
          v18 = qword_1EF614B90;
          v19 = 23644;
          goto LABEL_66;
        }
LABEL_50:
        if ((*(_DWORD *)(v13 + 4 * v14 + 60) & 0x40000) == 0)
        {
          v28 = 1;
          goto LABEL_60;
        }
        if (*(unsigned __int8 *)v6 > 0x39u)
        {
          if ((_DWORD)v14 != 58 && (_DWORD)v14 != 94)
            goto LABEL_78;
        }
        else
        {
          if ((_DWORD)v14 == 33)
          {
            if (!v4)
              goto LABEL_71;
LABEL_78:
            *(_BYTE *)(qword_1EF614B90 + v12++) = v14;
            goto LABEL_79;
          }
          if ((_DWORD)v14 != 44)
            goto LABEL_78;
        }
LABEL_71:
        if ((_DWORD)v14 == 92
          || (*(_DWORD *)(v13 + 4 * v14 + 60) & 0x200) == 0
          || v8 >= 4 && *((unsigned __int8 *)v6 + 1) - 48 > 9)
        {
          goto LABEL_76;
        }
        sprintf((char *)(qword_1EF614B90 + v12), "^%c", (v14 + 64));
        goto LABEL_67;
      }
      if (*(unsigned __int8 *)v6 <= 0x24u)
      {
        if ((_DWORD)v14 == 27)
        {
          v18 = qword_1EF614B90;
          v19 = 17756;
        }
        else
        {
          if ((_DWORD)v14 == 32)
          {
            if (!v4)
              goto LABEL_50;
            if (v6 == a1)
              goto LABEL_21;
            v15 = v6;
            do
            {
              v17 = *(unsigned __int8 *)v15++;
              v16 = v17;
            }
            while (v17 == 32);
            if (!v16)
            {
LABEL_21:
              v18 = qword_1EF614B90;
              v19 = 29532;
              goto LABEL_66;
            }
          }
          else if (!*v6)
          {
            result = (char *)qword_1EF614B90;
            *(_BYTE *)(qword_1EF614B90 + v12) = 0;
            return result;
          }
LABEL_49:
          if (v14 <= 0x7E)
            goto LABEL_50;
          v28 = 0;
LABEL_60:
          if ((_DWORD)v14 == 10)
          {
            if (v8 < 4)
              goto LABEL_70;
            v18 = qword_1EF614B90;
            v19 = 28252;
          }
          else
          {
            if ((_DWORD)v14 != 13 || v8 <= 3 && (strlen(a1) < 3 || v6[1]))
            {
LABEL_70:
              if (v28)
                goto LABEL_71;
LABEL_76:
              sprintf((char *)(qword_1EF614B90 + v12), "\\%03o", v14);
              v12 += 4;
              goto LABEL_79;
            }
            v18 = qword_1EF614B90;
            v19 = 29276;
          }
        }
LABEL_66:
        *(_WORD *)(v18 + v12) = v19;
LABEL_67:
        v12 += 2;
        goto LABEL_79;
      }
      if ((_DWORD)v14 != 37)
      {
        if ((_DWORD)v14 != 44)
          goto LABEL_49;
LABEL_35:
        if (v4)
        {
          v20 = (_BYTE *)(qword_1EF614B90 + v12);
          *v20 = 92;
          v12 += 2;
          v20[1] = v14;
LABEL_79:
          v22 = v6;
          goto LABEL_80;
        }
        goto LABEL_50;
      }
      v22 = v6 + 1;
      v21 = *((unsigned __int8 *)v6 + 1);
      if (v21 > 0x7E || (*(_DWORD *)(v13 + 4 * v21 + 60) & 0x40000) == 0)
        goto LABEL_50;
      v23 = qword_1EF614B90;
      v24 = v12 + 1;
      *(_BYTE *)(qword_1EF614B90 + v12) = 37;
      if (v39 != 1)
      {
        if (v39 == -1)
        {
          v25 = *v22;
          if (v25 == 39)
          {
            v26 = *((unsigned __int8 *)v6 + 2);
            if (v26 != 92 && v26 <= 0x7E && (*(_DWORD *)(v13 + 4 * v26 + 60) & 0x40000) != 0)
            {
              v27 = *((unsigned __int8 *)v6 + 3);
              v6 += 3;
              if (v27 == 39)
              {
                sprintf((char *)(v23 + v24), "{%d}", (char)v26);
                v12 = v24 + strlen((const char *)(qword_1EF614B90 + v24));
                goto LABEL_79;
              }
            }
          }
        }
        else
        {
          LOBYTE(v25) = *v22;
        }
LABEL_94:
        v12 += 2;
        *(_BYTE *)(v23 + v24) = v25;
        goto LABEL_80;
      }
      v25 = *v22;
      if (v25 != 123)
        goto LABEL_94;
      v30 = *((unsigned __int8 *)v6 + 2);
      v29 = v6 + 2;
      if ((v30 - 48) > 9)
        goto LABEL_94;
      __endptr = 0;
      v31 = strtol(v29, &__endptr, 0);
      v32 = __endptr;
      if (__endptr)
      {
        if (*__endptr == 125)
        {
          v33 = v31;
          if (v31 <= 126 && v31 != 92)
          {
            if (v31 > 0x7F)
            {
              v38 = __endptr;
              v37 = __maskrune(v31, 0x40000uLL);
              v32 = v38;
              if (v37)
              {
LABEL_89:
                v34 = qword_1EF614B90;
                v35 = v12 + 2;
                *(_BYTE *)(qword_1EF614B90 + v24) = 39;
                if (v33 == 92 || v33 == 39)
                {
                  *(_BYTE *)(v34 + v35) = 92;
                  LODWORD(v35) = v12 + 3;
                }
                LODWORD(v24) = v35 + 1;
                *(_BYTE *)(v34 + (int)v35) = v33;
                v36 = 39;
                v12 = v35;
                v22 = v32;
                goto LABEL_97;
              }
            }
            else if ((*(_DWORD *)(v13 + 4 * v31 + 60) & 0x40000) != 0)
            {
              goto LABEL_89;
            }
          }
        }
      }
      v36 = *v22;
      v34 = qword_1EF614B90;
LABEL_97:
      *(_BYTE *)(v34 + (int)v24) = v36;
      v12 += 2;
LABEL_80:
      v6 = v22 + 1;
    }
  }
  return result;
}

const name_table_entry *__cdecl _nc_find_entry(const char *a1, const HashValue *a2)
{
  const HashValue *hash_table;
  const HashData *hash_info;
  int v6;
  uint64_t v7;
  const name_table_entry *table;
  unint64_t v9;
  int i;

  hash_table = _nc_get_hash_table(0);
  hash_info = _nc_get_hash_info(hash_table != a2);
  v6 = ((uint64_t (*)(const char *))hash_info->hash_of)(a1);
  if (hash_info->table_data[v6] < 0)
    return 0;
  v7 = v6;
  table = _nc_get_table(hash_table != a2);
  v9 = hash_info->table_data[v7];
  for (i = ((uint64_t (*)(const char *, const char *))hash_info->compare_names)(table[v9].nte_name, a1);
        !i;
        i = ((uint64_t (*)(const char *, const char *))hash_info->compare_names)(table[v9].nte_name, a1))
  {
    if (table[v9].nte_link < 0)
      return 0;
    v9 = hash_info->table_data[hash_info->table_size] + (unint64_t)(unsigned __int16)table[v9].nte_link;
  }
  return &table[v9];
}

const name_table_entry *__cdecl _nc_find_type_entry(const char *a1, int a2, BOOL a3)
{
  const HashData *hash_info;
  int v7;
  uint64_t v8;
  const name_table_entry *table;
  unint64_t i;
  const name_table_entry *v11;

  hash_info = _nc_get_hash_info(a3);
  v7 = ((uint64_t (*)(const char *))hash_info->hash_of)(a1);
  if (hash_info->table_data[v7] < 0)
    return 0;
  v8 = v7;
  table = _nc_get_table(a3);
  for (i = hash_info->table_data[v8];
        ;
        i = hash_info->table_data[hash_info->table_size] + (unint64_t)(unsigned __int16)v11->nte_link)
  {
    v11 = &table[i];
    if (v11->nte_type == a2)
    {
      if (((unsigned int (*)(const char *, const char *))hash_info->compare_names)(table[i].nte_name, a1))
        break;
    }
    if (v11->nte_link < 0)
      return 0;
  }
  return &table[i];
}

void sub_1C05B161C(uint64_t a1, char a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = *(_QWORD **)(a1 + 32);
  if ((unint64_t)(v4[39] + 1) <= 1)
  {
    if ((unint64_t)(v4[43] + 1) >= 2 && (unint64_t)(v4[35] + 1) <= 1)
    {
      _nc_warning("exit_standout_mode but no enter_standout_mode");
      v4 = *(_QWORD **)(a1 + 32);
    }
    if ((unint64_t)(v4[35] + 1) >= 2 && (unint64_t)(v4[43] + 1) <= 1)
    {
      _nc_warning("enter_standout_mode but no exit_standout_mode");
      v4 = *(_QWORD **)(a1 + 32);
    }
    if ((unint64_t)(v4[44] + 1) >= 2 && (unint64_t)(v4[36] + 1) <= 1)
    {
      _nc_warning("exit_underline_mode but no enter_underline_mode");
      v4 = *(_QWORD **)(a1 + 32);
    }
    if ((unint64_t)(v4[36] + 1) >= 2 && (unint64_t)(v4[44] + 1) <= 1)
    {
      _nc_warning("enter_underline_mode but no exit_underline_mode");
      v4 = *(_QWORD **)(a1 + 32);
    }
    if ((unint64_t)(v4[321] + 1) >= 2 && (unint64_t)(v4[311] + 1) <= 1)
    {
      _nc_warning("exit_italics_mode but no enter_italics_mode");
      v4 = *(_QWORD **)(a1 + 32);
    }
    if ((unint64_t)(v4[311] + 1) >= 2 && (unint64_t)(v4[321] + 1) <= 1)
      _nc_warning("enter_italics_mode but no exit_italics_mode");
  }
  if ((a2 & 1) == 0)
  {
    sub_1C05B2770((char *)a1, 0);
    v5 = *(_QWORD **)(a1 + 32);
    if ((unint64_t)(v5[25] + 1) >= 2 && (unint64_t)(v5[146] + 1) <= 1)
    {
      _nc_warning("enter_alt_charset_mode but no acs_chars");
      v5 = *(_QWORD **)(a1 + 32);
    }
    if ((unint64_t)(v5[38] + 1) >= 2 && (unint64_t)(v5[146] + 1) <= 1)
      _nc_warning("exit_alt_charset_mode but no acs_chars");
  }
  v6 = *(_QWORD **)(a1 + 32);
  if ((unint64_t)(v6[38] + 1) >= 2 && (unint64_t)(v6[25] + 1) <= 1)
  {
    _nc_warning("exit_alt_charset_mode but no enter_alt_charset_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[25] + 1) >= 2 && (unint64_t)(v6[38] + 1) <= 1)
  {
    _nc_warning("enter_alt_charset_mode but no exit_alt_charset_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[26] + 1) >= 2 && (unint64_t)(v6[39] + 1) <= 1)
  {
    _nc_warning("enter_blink_mode but no exit_attribute_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[27] + 1) >= 2 && (unint64_t)(v6[39] + 1) <= 1)
  {
    _nc_warning("enter_bold_mode but no exit_attribute_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[28] + 1) >= 2 && (unint64_t)(v6[40] + 1) <= 1)
  {
    _nc_warning("enter_ca_mode but no exit_ca_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[40] + 1) >= 2 && (unint64_t)(v6[28] + 1) <= 1)
  {
    _nc_warning("exit_ca_mode but no enter_ca_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[41] + 1) >= 2 && (unint64_t)(v6[29] + 1) <= 1)
  {
    _nc_warning("exit_delete_mode but no enter_delete_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[29] + 1) >= 2 && (unint64_t)(v6[41] + 1) <= 1)
  {
    _nc_warning("enter_delete_mode but no exit_delete_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[30] + 1) >= 2 && (unint64_t)(v6[39] + 1) <= 1)
  {
    _nc_warning("enter_dim_mode but no exit_attribute_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[42] + 1) >= 2 && (unint64_t)(v6[31] + 1) <= 1)
  {
    _nc_warning("exit_insert_mode but no enter_insert_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[31] + 1) >= 2 && (unint64_t)(v6[42] + 1) <= 1)
  {
    _nc_warning("enter_insert_mode but no exit_insert_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[32] + 1) >= 2 && (unint64_t)(v6[39] + 1) <= 1)
  {
    _nc_warning("enter_secure_mode but no exit_attribute_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[33] + 1) >= 2 && (unint64_t)(v6[39] + 1) <= 1)
  {
    _nc_warning("enter_protected_mode but no exit_attribute_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[34] + 1) >= 2 && (unint64_t)(v6[39] + 1) <= 1)
  {
    _nc_warning("enter_reverse_mode but no exit_attribute_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[135] + 1) >= 2 && (unint64_t)(v6[47] + 1) <= 1)
  {
    _nc_warning("to_status_line but no from_status_line");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[47] + 1) >= 2 && (unint64_t)(v6[135] + 1) <= 1)
  {
    _nc_warning("from_status_line but no to_status_line");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[102] + 1) >= 2 && (unint64_t)(v6[101] + 1) <= 1)
  {
    _nc_warning("meta_on but no meta_off");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[101] + 1) >= 2 && (unint64_t)(v6[102] + 1) <= 1)
  {
    _nc_warning("meta_off but no meta_on");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[119] + 1) >= 2 && (unint64_t)(v6[120] + 1) <= 1)
  {
    _nc_warning("prtr_off but no prtr_on");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[120] + 1) >= 2 && (unint64_t)(v6[119] + 1) <= 1)
  {
    _nc_warning("prtr_on but no prtr_off");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[126] + 1) >= 2 && (unint64_t)(v6[128] + 1) <= 1)
  {
    _nc_warning("restore_cursor but no save_cursor");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[128] + 1) >= 2 && (unint64_t)(v6[126] + 1) <= 1)
  {
    _nc_warning("save_cursor but no restore_cursor");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[150] + 1) >= 2 && (unint64_t)(v6[149] + 1) <= 1)
  {
    _nc_warning("exit_xon_mode but no enter_xon_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[149] + 1) >= 2 && (unint64_t)(v6[150] + 1) <= 1)
  {
    _nc_warning("enter_xon_mode but no exit_xon_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[152] + 1) >= 2 && (unint64_t)(v6[151] + 1) <= 1)
  {
    _nc_warning("exit_am_mode but no enter_am_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[151] + 1) >= 2 && (unint64_t)(v6[152] + 1) <= 1)
  {
    _nc_warning("enter_am_mode but no exit_am_mode");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[157] + 1) >= 2 && (unint64_t)(v6[156] + 1) <= 1)
  {
    _nc_warning("label_off but no label_on");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[276] + 1) >= 2 && (unint64_t)(v6[275] + 1) <= 1)
  {
    _nc_warning("remove_clock but no display_clock");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[275] + 1) >= 2 && (unint64_t)(v6[276] + 1) <= 1)
  {
    _nc_warning("display_clock but no remove_clock");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if ((unint64_t)(v6[301] + 1) >= 2 && (unint64_t)(v6[300] + 1) <= 1)
    _nc_warning("set_color_pair but no initialize_pair");
}

void sub_1C05B1D84(uint64_t a1)
{
  sub_1C05B161C(a1, 0);
}

BOOL _nc_entry_match(char *a1, char *a2)
{
  return sub_1C05B1D94(a1, a2, 0);
}

char *sub_1C05B1D94(char *a1, char *a2, int a3)
{
  char *v5;
  char *v7;
  char *v9;
  char *result;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char v16[514];
  char v17[514];
  uint64_t v18;

  v5 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (!strchr(a1, 124))
    v5 = sub_1C05B27C4(v17, v5);
  if (!strchr(a2, 124))
    a2 = sub_1C05B27C4(v16, a2);
  if (_nc_syntax == 1 && _nc_user_definable)
  {
    v7 = strchr(v5, 124);
    if (v7 - v5 == 2 && v7 != 0)
      v5 = v7 + 1;
    v9 = strchr(a2, 124);
    if (v9 - a2 == 2 && v9 != 0)
      a2 = v9 + 1;
  }
  result = strchr(v5, 124);
  if (result)
  {
    v12 = result;
    v13 = strchr(a2, 124);
    while (!v13)
    {
LABEL_26:
      v5 = v12 + 1;
      result = strchr(v12 + 1, 124);
      v12 = result;
      if (!result)
        return result;
    }
    v14 = v13;
    v15 = a2;
    while (v12 - v5 != v14 - v15 || memcmp(v5, v15, v12 - v5))
    {
      v15 = v14 + 1;
      v14 = strchr(v14 + 1, 124);
      if (!v14)
        goto LABEL_26;
    }
    if (a3 >= 1)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Name collision '%.*s' between\n", (_DWORD)v12 - (_DWORD)v5, v5);
    return (char *)1;
  }
  return result;
}

void _nc_read_entry_source(FILE *a1, char *a2, int a3, BOOL a4, BOOL (__cdecl *a5)(_ENTRY *))
{
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  _ENTRY *v11;
  _ENTRY *v12;
  _ENTRY *v13;
  _ENTRY *v14;
  _ENTRY v15;

  v8 = _nc_suppress_warnings;
  if (a4)
    _nc_suppress_warnings = 1;
  _nc_reset_input(a1, a2);
  bzero(&v15, 0x400uLL);
  if (_nc_parse_entry(&v15, a3, a4) != -1)
  {
    v9 = MEMORY[0x1E0C80978];
    do
    {
      v10 = *v15.tterm.term_names;
      if (*v15.tterm.term_names < 0)
      {
        if (!__maskrune(v10, 0x500uLL))
LABEL_27:
          _nc_err_abort("terminal names must start with letter or digit");
      }
      else if ((*(_DWORD *)(v9 + 4 * v10 + 60) & 0x500) == 0)
      {
        goto LABEL_27;
      }
      if (!a5 || (((uint64_t (*)(_ENTRY *))a5)(&v15) & 1) == 0)
      {
        v11 = _nc_copy_entry(&v15);
        if (!v11)
          _nc_err_abort("Out of memory");
        v12 = _nc_tail;
        v11->last = _nc_tail;
        _nc_tail = v11;
        v11->next = 0;
        if (v12)
          v12->next = v11;
        if (v15.tterm.Booleans)
          free(v15.tterm.Booleans);
        if (v15.tterm.Numbers)
          free(v15.tterm.Numbers);
        if (v15.tterm.Strings)
          free(v15.tterm.Strings);
        if (v15.tterm.ext_Names)
          free(v15.tterm.ext_Names);
      }
      bzero(&v15, 0x400uLL);
    }
    while (_nc_parse_entry(&v15, a3, a4) != -1);
  }
  v13 = _nc_tail;
  if (_nc_tail)
  {
    do
    {
      v14 = v13;
      v13 = v13->last;
    }
    while (v13);
    _nc_head = v14;
  }
  _nc_suppress_warnings = v8;
}

int _nc_resolve_uses2(BOOL a1, BOOL a2)
{
  _ENTRY *v2;
  int v3;
  _ENTRY *v4;
  uint64_t v5;
  uint64_t v6;
  char *term_names;
  char *v8;
  char *v10;
  char *v12;
  int v14;
  char v15;
  size_t i;
  int v17;
  char *v18;
  uint64_t j;
  char *v20;
  uint64_t v21;
  int v22;
  _ENTRY *v24;
  char v25;
  uint64_t nuses;
  unint64_t v27;
  uint64_t v28;
  int k;
  char *Booleans;
  __int16 *Numbers;
  char **Strings;
  char **ext_Names;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _ENTRY *m;
  char *v38;
  uint64_t v39;
  TERMINAL *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _ENTRY *v44;
  _ENTRY *v45;
  unint64_t v46;
  char *name;
  char *v48;
  const char *v49;
  uint64_t v50;
  _ENTRY *v51;
  char v52;
  _entry *v53;
  __int128 v54;
  __int128 v55;
  _BOOL4 v56;
  _BOOL4 v57;
  int v58;
  int v59;
  TERMINAL v60;
  TERMTYPE v61;
  uint64_t v62;

  v57 = a2;
  v62 = *MEMORY[0x1E0C80C00];
  v2 = _nc_head;
  if (_nc_head)
  {
    v56 = a1;
    v3 = 0;
    v4 = _nc_head;
LABEL_3:
    v5 = 0;
    do
    {
      if (v4 > v2
        && (v6 = (v5 + 1),
            sub_1C05B1D94(v4->tterm.term_names, v2->tterm.term_names, (int)v5 + 1)))
      {
        if (!(_DWORD)v5)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "\t%s\n", v2->tterm.term_names);
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "and\t%s\n", v4->tterm.term_names);
        term_names = v2->tterm.term_names;
        v8 = v4->tterm.term_names;
        if (_nc_syntax == 1 && _nc_user_definable)
        {
          v10 = strchr(v2->tterm.term_names, 124);
          if (v10 - term_names == 2 && v10 != 0)
            term_names = v10 + 1;
          v12 = strchr(v8, 124);
          if (v12 - v8 == 2 && v12 != 0)
            v8 = v12 + 1;
        }
        v14 = *term_names;
        if (*term_names)
        {
          v58 = v3;
          v15 = 0;
          do
          {
            for (i = 0; v14; v14 = term_names[++i])
            {
              if (v14 == 124)
                break;
            }
            v17 = *v8;
            if (*v8)
            {
              v18 = v8;
              while (1)
              {
                for (j = 0; v17; v17 = v18[++j])
                {
                  if (v17 == 124)
                    break;
                }
                if (i == j && !memcmp(term_names, v18, i))
                  break;
                if (v17)
                  v20 = v18 + 1;
                else
                  v20 = v18;
                v18 = &v20[j];
                v17 = v20[j];
                if (!v20[j])
                  goto LABEL_48;
              }
              if (v18 != v8 || v17 == 124)
              {
                if (v17 == 124)
                  v21 = j + 1;
                else
                  v21 = j;
                do
                {
                  v22 = v18[v21];
                  *v18++ = v22;
                }
                while (v22);
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "...now\t%s\n");
              }
              else
              {
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "Cannot remove alias '%.*s'\n");
              }
              v15 = 1;
            }
LABEL_48:
            if (term_names[i])
              term_names += i + 1;
            else
              term_names += i;
            v14 = *term_names;
          }
          while (*term_names);
          v3 = v58 + ((v15 & 1) == 0);
        }
        else
        {
          ++v3;
        }
      }
      else
      {
        v6 = v5;
      }
      v2 = v2->next;
      v5 = v6;
    }
    while (v2);
    while (1)
    {
      v4 = v4->next;
      if (!v4)
        break;
      v2 = _nc_head;
      if (_nc_head)
        goto LABEL_3;
    }
    if (v3 > 0)
      return 0;
    v44 = _nc_head;
    _nc_curr_col = -1;
    *(_DWORD *)&a1 = v56;
    if (_nc_head)
    {
      v59 = 0;
      v45 = 0;
      do
      {
        if (v44->nuses)
        {
          v46 = 0;
          do
          {
            name = _nc_first_name(v44->tterm.term_names);
            v48 = (char *)v44 + 24 * v46;
            v49 = (const char *)*((_QWORD *)v48 + 10);
            v50 = *((_QWORD *)v48 + 12);
            _nc_set_type(name);
            v51 = _nc_head;
            if (!_nc_head)
              goto LABEL_104;
            v52 = 0;
            do
            {
              while (v51 != v44 && _nc_name_match(v51->tterm.term_names, v49, "|"))
              {
                v44->uses[v46].link = v51;
                v51 = v51->next;
                v52 = 1;
                if (!v51)
                  goto LABEL_108;
              }
              v51 = v51->next;
            }
            while (v51);
            if ((v52 & 1) == 0)
            {
LABEL_104:
              memset(&v60, 0, 72);
              if (_nc_read_entry(v49, (char *const)&v61, &v60.type) == 1)
              {
                v53 = (_entry *)malloc(0x400uLL);
                if (!v53)
                  _nc_err_abort("Out of memory");
                v54 = *(_OWORD *)&v60.type.ext_Names;
                *(_OWORD *)&v53->tterm.Strings = *(_OWORD *)&v60.type.Strings;
                *(_OWORD *)&v53->tterm.ext_Names = v54;
                *(_QWORD *)&v53->tterm.ext_Numbers = *(_QWORD *)&v60.type.ext_Numbers;
                v55 = *(_OWORD *)&v60.type.Booleans;
                *(_OWORD *)&v53->tterm.term_names = *(_OWORD *)&v60.type.term_names;
                *(_OWORD *)&v53->tterm.Booleans = v55;
                v53->nuses = 0;
                v53->next = v45;
                v45 = v53;
                v44->uses[v46].link = v53;
              }
              else
              {
                ++v59;
                _nc_curr_line = v50;
                _nc_warning("resolution of use=%s failed", v49);
                v44->uses[v46].link = 0;
              }
            }
LABEL_108:
            ++v46;
          }
          while (v46 < v44->nuses);
        }
        v44 = v44->next;
      }
      while (v44);
      *(_DWORD *)&a1 = v56;
      if (v59)
      {
        _nc_free_entries(v45);
        return 0;
      }
    }
  }
  else
  {
    _nc_curr_col = -1;
  }
  if (a1)
  {
    do
    {
      memset(&v61, 0, sizeof(v61));
      v24 = _nc_head;
      if (!_nc_head)
        break;
      v25 = 0;
      do
      {
        nuses = v24->nuses;
        if ((_DWORD)nuses)
        {
          v27 = 0;
          v28 = 24 * nuses;
          do
          {
            if (v24->uses[v27 / 0x18].link->nuses)
            {
              v25 = 1;
              goto LABEL_82;
            }
            v27 += 24;
          }
          while (v28 != v27);
          _nc_copy_termtype(&v61, &v24->tterm);
          for (k = v24->nuses; k; v24->nuses = k)
          {
            _nc_merge_entry(&v61, &v24->uses[k - 1].link->tterm);
            k = v24->nuses - 1;
          }
          _nc_merge_entry(&v61, &v24->tterm);
          Booleans = v24->tterm.Booleans;
          if (Booleans)
            free(Booleans);
          Numbers = v24->tterm.Numbers;
          if (Numbers)
            free(Numbers);
          Strings = v24->tterm.Strings;
          if (Strings)
            free(Strings);
          ext_Names = v24->tterm.ext_Names;
          if (ext_Names)
            free(ext_Names);
          *(_OWORD *)&v24->tterm.term_names = *(_OWORD *)&v61.term_names;
          v34 = *(_OWORD *)&v61.Booleans;
          v35 = *(_OWORD *)&v61.Strings;
          v36 = *(_OWORD *)&v61.ext_Names;
          *(_QWORD *)&v24->tterm.ext_Numbers = *(_QWORD *)&v61.ext_Numbers;
          *(_OWORD *)&v24->tterm.Strings = v35;
          *(_OWORD *)&v24->tterm.ext_Names = v36;
          *(_OWORD *)&v24->tterm.Booleans = v34;
          v25 = 1;
          _nc_wrap_entry(v24, 1);
        }
LABEL_82:
        v24 = v24->next;
      }
      while (v24);
    }
    while ((v25 & 1) != 0);
    if (_nc_check_termtype)
    {
      _nc_curr_col = -1;
      for (m = _nc_head; m; m = m->next)
      {
        _nc_curr_line = m->startline;
        v38 = _nc_first_name(m->tterm.term_names);
        _nc_set_type(v38);
        if ((char *)_nc_check_termtype2 == (char *)sub_1C05B161C)
        {
          sub_1C05B2770((char *)m, v57);
        }
        else
        {
          v39 = SP;
          v40 = cur_term;
          bzero(&v61, 0x648uLL);
          memset(&v60.type.ext_Names, 0, 192);
          memset(&v60.type.Booleans, 0, 32);
          *(_OWORD *)&v60.type.term_names = 0u;
          v61.ext_Names = (char **)&v60;
          *(_OWORD *)&v60.type.term_names = *(_OWORD *)&m->tterm.term_names;
          v41 = *(_OWORD *)&m->tterm.Booleans;
          v42 = *(_OWORD *)&m->tterm.Strings;
          v43 = *(_OWORD *)&m->tterm.ext_Names;
          *(_QWORD *)&v60.type.ext_Numbers = *(_QWORD *)&m->tterm.ext_Numbers;
          *(_OWORD *)&v60.type.Strings = v42;
          *(_OWORD *)&v60.type.ext_Names = v43;
          *(_OWORD *)&v60.type.Booleans = v41;
          SP = (uint64_t)&v61;
          set_curterm(&v60);
          _nc_check_termtype2(&m->tterm, v57);
          SP = v39;
          set_curterm(v40);
        }
      }
    }
  }
  return 1;
}

char *sub_1C05B2770(char *result, int a2)
{
  _QWORD *v2;

  if (!a2)
  {
    v2 = (_QWORD *)*((_QWORD *)result + 4);
    if (!v2[146])
    {
      if (v2[25])
      {
        if (v2[38])
        {
          v2[146] = result;
        }
      }
    }
  }
  return result;
}

int _nc_resolve_uses(BOOL a1)
{
  return _nc_resolve_uses2(a1, 0);
}

char *sub_1C05B27C4(char *a1, char *__s)
{
  size_t v4;
  size_t v5;

  if (strchr(__s, 124))
    return __s;
  v4 = strlen(__s);
  if (v4 >= 0x200)
    v5 = 512;
  else
    v5 = v4;
  strncpy(a1, __s, v5);
  *(_WORD *)&a1[v5] = 124;
  return a1;
}

void _nc_reset_input(FILE *a1, char *a2)
{
  dword_1EF614BA0 = -1;
  if (qword_1EF614BA8)
    *(_BYTE *)qword_1EF614BA8 = 0;
  qword_1EF614BB0 = (uint64_t)a1;
  qword_1EF614BB8 = (uint64_t)a2;
  qword_1EF614BC0 = (uint64_t)a2;
  _nc_curr_file_pos = 0;
  if (a1)
    _nc_curr_line = 0;
  _nc_curr_col = 0;
}

int _nc_get_token(BOOL a1)
{
  int v1;
  const char *v2;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  chtype v8;
  unsigned int v9;
  unsigned int v10;
  char *v11;
  int v12;
  int v13;
  unint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  int v20;
  int v21;
  int v22;
  unint64_t v23;
  const char *j;
  uint64_t v25;
  int v26;
  int v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const HashValue *hash_table;
  const name_table_entry *entry;
  BOOL v33;
  BOOL v34;
  int v35;
  int v36;
  _BYTE *v37;
  _BYTE *v38;
  char *v39;
  int v40;
  int v41;
  const char *v42;
  char *v43;
  int v44;
  char *v45;
  _BYTE *v46;
  unsigned int v47;
  uint64_t v48;
  char v50;
  char *v51;
  int64_t v52;
  char v53;
  uint64_t v54;
  int v56;
  uint64_t i;
  unsigned int v58;
  unsigned int v59;
  int v60;
  int v61;
  char *v62;
  BOOL v63;
  char *v64;
  uint64_t v65;
  char *__s;
  int v67;
  BOOL v68;
  char *__endptr;
  char __str[80];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v1 = dword_1EF614BA0;
  if (dword_1EF614BA0 != -1)
  {
    if (qword_1EF614BA8)
      v2 = (const char *)qword_1EF614BA8;
    else
      v2 = (const char *)&unk_1C05E2CBB;
    _nc_set_type(v2);
    dword_1EF614BA0 = -1;
    if (qword_1EF614BA8)
      *(_BYTE *)qword_1EF614BA8 = 0;
    return v1;
  }
  if (qword_1EF614BB0)
  {
    if (feof((FILE *)qword_1EF614BB0))
    {
      v4 = (_BYTE *)qword_1EF614BB8;
      if (!qword_1EF614BB8)
        goto LABEL_99;
LABEL_12:
      if (!*v4)
      {
LABEL_99:
        qword_1EF614BB0 = 0;
        sub_1C05B32A4();
        v1 = -1;
        if (qword_1EF614BC8 && _nc_curr_token.tk_name == (char *)qword_1EF614BC8)
          _nc_curr_token.tk_name = 0;
        return v1;
      }
    }
  }
  else
  {
    v4 = (_BYTE *)qword_1EF614BB8;
    if (qword_1EF614BB8)
      goto LABEL_12;
  }
  v67 = 0;
  v68 = a1;
  v5 = MEMORY[0x1E0C80978];
  while (1)
  {
    if (qword_1EF614BB0)
    {
      v6 = MEMORY[0x1C3B9DC38]();
    }
    else if (qword_1EF614BB8)
    {
      v6 = qword_1EF614BB8 - qword_1EF614BC0;
    }
    else
    {
      v6 = 0;
    }
    do
    {
      while (1)
      {
        v7 = sub_1C05B32A4();
        v8 = v7;
        if (v7 > 31)
          break;
        if (v7 != 9)
        {
          if (v7 != 10)
            goto LABEL_27;
          byte_1EF614BD0 = 1;
        }
      }
    }
    while (v7 == 32);
    if (v7 == 92)
    {
      do
      {
        v9 = sub_1C05B32A4();
        v8 = v9;
      }
      while (v9 <= 0x20 && ((1 << v9) & 0x100000600) != 0);
    }
LABEL_27:
    _nc_curr_token.tk_valstring = 0;
    if (v8 == -1)
    {
LABEL_102:
      v1 = -1;
      v34 = a1;
      goto LABEL_170;
    }
    if (v8 == 58 && byte_1EF614BD1 == 58)
      v8 = sub_1C05B32A4();
    if (v8 == 46)
    {
      if (_nc_disable_period)
      {
        v8 = 46;
LABEL_39:
        if ((*(_DWORD *)(v5 + 4 * v8 + 60) & 0x500) != 0)
          break;
        goto LABEL_42;
      }
      do
      {
        v10 = sub_1C05B32A4();
        v8 = v10;
      }
      while (v10 <= 0x2E && ((1 << v10) & 0x400100000200) != 0);
      v67 = 1;
    }
    if (v8 == -1)
      goto LABEL_102;
    if (v8 <= 0x7F)
      goto LABEL_39;
    if (__maskrune(v8, 0x500uLL))
      break;
LABEL_42:
    if (v8 == 46 && _nc_disable_period || memchr("@%&*!#", (char)v8, 7uLL))
      break;
    if (!a1)
    {
      v11 = unctrl(v8);
      _nc_warning("Illegal character (expected alphanumeric or %s) - '%s'", "@%&*!#", v11);
    }
    v12 = byte_1EF614BD1;
    do
      v13 = sub_1C05B32A4();
    while (v13 != v12 && v13 != -1);
  }
  v14 = 0x1EF614000uLL;
  v15 = (_BYTE *)qword_1EF614BC8;
  if (!qword_1EF614BC8)
  {
    v15 = malloc(0x1000uLL);
    qword_1EF614BC8 = (uint64_t)v15;
  }
  __endptr = 0;
  v15[1] = 0;
  v16 = v15 + 1;
  *v15 = v8;
  v17 = 0x1EF614000uLL;
  if (!byte_1EF614BD2)
  {
    if (byte_1EF614BD0 == 1 && _nc_syntax == 1)
    {
      _nc_warning("Missing backslash before newline");
      byte_1EF614BD0 = 0;
    }
    v35 = sub_1C05B32A4();
    if (v35 == -1)
    {
      v38 = v15 + 1;
      v34 = a1;
LABEL_121:
      *v38 = 0;
      v1 = -1;
      goto LABEL_170;
    }
    v36 = v35;
    v37 = v15 + 1;
    v34 = v68;
    while (1)
    {
      if (v36 > 0x7F)
      {
        if (__maskrune(v36, 0x500uLL))
          goto LABEL_116;
      }
      else if ((*(_DWORD *)(v5 + 4 * v36 + 60) & 0x500) != 0)
      {
        goto LABEL_116;
      }
      if (_nc_syntax)
      {
        if (v36 != 59)
          goto LABEL_122;
      }
      else if (v36 != 95)
      {
LABEL_122:
        *v16 = 0;
        v39 = v16 + 1;
        if (v36 <= 57)
        {
          if (v36 == 35)
          {
            for (i = 0; i != 79; ++i)
            {
              v58 = sub_1C05B32A4();
              v59 = v58;
              if (v58 > 0x7F)
                v60 = __maskrune(v58, 0x500uLL);
              else
                v60 = *(_DWORD *)(v5 + 4 * v58 + 60) & 0x500;
              if (!v60)
                break;
              __str[i] = v59;
            }
            __str[i] = 0;
            v61 = strtol(__str, &__endptr, 0);
            if (!v68)
            {
              v62 = __endptr;
              if (__endptr == __str)
              if (*v62)
                v63 = 0;
              else
                v63 = v59 == byte_1EF614BD1;
              if (!v63)
                _nc_warning("Missing separator");
            }
            _nc_curr_token.tk_name = (char *)qword_1EF614BC8;
            _nc_curr_token.tk_valnumber = v61;
            v1 = 1;
            goto LABEL_170;
          }
          if (v36 != 44)
            goto LABEL_193;
        }
        else if (v36 != 58)
        {
          if (v36 == 61)
          {
            v56 = _nc_trans_string(v39, (char *)(qword_1EF614BC8 + 4096));
            if (!v68 && v56 != byte_1EF614BD1)
              _nc_warning("Missing separator");
            _nc_curr_token.tk_name = (char *)qword_1EF614BC8;
            _nc_curr_token.tk_valstring = v39;
            v1 = 2;
            goto LABEL_170;
          }
          if (v36 == 64)
          {
            v40 = sub_1C05B32A4();
            v41 = v67;
            if (v40 != byte_1EF614BD1 && !v68)
            {
              v42 = (const char *)qword_1EF614BC8;
              v43 = unctrl(v40);
            }
            _nc_curr_token.tk_name = (char *)qword_1EF614BC8;
            v1 = 3;
            goto LABEL_171;
          }
LABEL_193:
          if (!v68)
          {
            v64 = unctrl(v36);
            _nc_warning("Illegal character - '%s'", v64);
          }
          v1 = 5;
          goto LABEL_170;
        }
        if (v36 != byte_1EF614BD1)
          _nc_err_abort("Separator inconsistent with syntax");
        v1 = 0;
        _nc_curr_token.tk_name = (char *)qword_1EF614BC8;
        goto LABEL_170;
      }
LABEL_116:
      if ((uint64_t)&v37[-qword_1EF614BC8] > 4093)
      {
        v38 = v16;
        goto LABEL_121;
      }
      v16[1] = 0;
      v38 = v16 + 1;
      *v16 = v36;
      v36 = sub_1C05B32A4();
      ++v37;
      ++v16;
      if (v36 == -1)
        goto LABEL_121;
    }
  }
  v18 = 0;
  __s = 0;
  _nc_comment_start = v6;
  _nc_comment_end = _nc_curr_file_pos;
  v19 = 0x1EF614000uLL;
  _nc_start_line = _nc_curr_line;
  _nc_syntax = -1;
  while (1)
  {
    v20 = sub_1C05B32A4();
    if (v20 > 57)
    {
      switch(v20)
      {
        case ':':
          v26 = sub_1C05B35E0(0);
          LOBYTE(v20) = 58;
          if (v26 != 44)
          {
            *(_DWORD *)(v19 + 3328) = 1;
            byte_1EF614BD1 = 58;
            goto LABEL_135;
          }
          break;
        case '|':
          if (!v18)
            v18 = v16;
          __s = v16;
          break;
        case '\\':
          do
            v20 = sub_1C05B32A4();
          while (v20 <= 0x20 && ((1 << v20) & 0x100000600) != 0);
          break;
      }
      goto LABEL_97;
    }
    if (v20 != 44)
    {
      if (v20 == 10)
        break;
      if (v20 == -1)
        _nc_err_abort("Premature EOF");
      goto LABEL_97;
    }
    *(_DWORD *)(v19 + 3328) = 0;
    byte_1EF614BD1 = 44;
    if (!v18)
      break;
    v21 = sub_1C05B35E0(0);
    v22 = sub_1C05B35E0(1);
    LOBYTE(v20) = 44;
    if (v22 != 58 && v21 != 92 && v21 != 58)
    {
      v23 = v19;
      for (j = *(const char **)(v17 + 3000); ; ++j)
      {
        v25 = *(unsigned __int8 *)j;
        if (*j < 0)
          break;
        if ((*(_DWORD *)(v5 + 4 * v25 + 60) & 0x4000) == 0)
        {
          v27 = *(_DWORD *)(v5 + 4 * v25 + 60) & 0x1000;
          goto LABEL_82;
        }
LABEL_66:
        ;
      }
      if (__maskrune(*(unsigned __int8 *)j, 0x4000uLL))
        goto LABEL_66;
      v27 = __maskrune(v25, 0x1000uLL);
LABEL_82:
      v19 = v23;
      if (!v27)
      {
        LOBYTE(v20) = 44;
        v14 = 0x1EF614000;
        goto LABEL_97;
      }
      v28 = j;
      do
      {
        v29 = *(unsigned __int8 *)v28;
        if (*v28 < 0)
          v30 = __maskrune(*(unsigned __int8 *)v28, 0x500uLL);
        else
          v30 = *(_DWORD *)(v5 + 4 * v29 + 60) & 0x500;
        ++v28;
      }
      while (v30);
      LOBYTE(v20) = 44;
      if ((int)v29 > 60)
      {
        if ((_DWORD)v29 == 61)
        {
          v19 = v23;
          v14 = 0x1EF614000uLL;
          break;
        }
        v33 = (_DWORD)v29 == 64;
LABEL_96:
        v17 = 0x1EF614000;
        v19 = v23;
        v14 = 0x1EF614000uLL;
        if (v33)
          break;
        goto LABEL_97;
      }
      if ((_DWORD)v29 != 44)
      {
        v33 = (_DWORD)v29 == 35;
        goto LABEL_96;
      }
      *((_BYTE *)v28 - 1) = 0;
      hash_table = _nc_get_hash_table(0);
      entry = _nc_find_entry(j, hash_table);
      LOBYTE(v20) = 44;
      *((_BYTE *)v28 - 1) = 44;
      v17 = 0x1EF614000;
      v19 = v23;
      v14 = 0x1EF614000;
      if (entry)
        break;
    }
LABEL_97:
    if ((uint64_t)&v16[-*(_QWORD *)(v14 + 3016)] > 4093)
      break;
    *v16 = v20;
    *++v16 = 0;
  }
LABEL_135:
  *v16 = 0;
  v44 = *(_DWORD *)(v19 + 3328);
  if (v44 == -1)
  {
    *(_DWORD *)(v19 + 3328) = 1;
    byte_1EF614BD1 = 58;
    v34 = a1;
    v45 = __s;
  }
  else
  {
    v34 = a1;
    v45 = __s;
    if (!v44)
    {
      do
      {
        v46 = v16;
        v47 = *--v16;
        v48 = (1 << v47) & 0x100100000200;
      }
      while (v47 <= 0x2C && v48 != 0);
      *v46 = 0;
    }
  }
  if (v18)
  {
    v50 = *v18;
    *v18 = 0;
    _nc_set_type(*(const char *const *)(v14 + 3016));
    *v18 = v50;
  }
  if (v45)
  {
    if (!v34)
    {
      if (*v45)
      {
        if (!strchr(v45, 32))
          _nc_warning("older tic versions may treat the description field as an alias");
      }
      else
      {
        _nc_warning("empty longname field");
      }
    }
  }
  else
  {
    v45 = (char *)(*(_QWORD *)(v14 + 3016) + strlen(*(const char **)(v14 + 3016)));
  }
  v51 = *(char **)(v14 + 3016);
  if (v51 < v45)
  {
    v52 = v45 - v51;
    while (1)
    {
      v53 = *v51;
      v54 = *v51;
      if (*v51 < 0)
      {
        if (__maskrune(*v51, 0x4000uLL))
        {
LABEL_163:
          if (!v34)
            _nc_warning("whitespace in name or alias field", v65);
          goto LABEL_169;
        }
      }
      else if ((*(_DWORD *)(v5 + 4 * v54 + 60) & 0x4000) != 0)
      {
        goto LABEL_163;
      }
      if ((_DWORD)v54 == 47)
        break;
      if (memchr("$[]!*?", v53, 7uLL))
      {
        if (!v34)
        goto LABEL_169;
      }
      ++v51;
      if (!--v52)
        goto LABEL_169;
    }
    if (!v34)
      _nc_warning("slashes aren't allowed in names or aliases");
  }
LABEL_169:
  _nc_curr_token.tk_name = *(char **)(v14 + 3016);
  v1 = 4;
LABEL_170:
  v41 = v67;
LABEL_171:
  if (v41 == 1)
    return _nc_get_token(v34);
  return v1;
}

uint64_t sub_1C05B32A4()
{
  const char *v0;
  size_t v1;
  void *v2;
  uint64_t v3;
  size_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  size_t v11;
  const char *v12;
  int v13;
  int v14;

  if (!qword_1EF614BB0)
  {
    if (qword_1EF614BD8)
    {
      free((void *)qword_1EF614BD8);
      qword_1EF614BD8 = 0;
      free((void *)qword_1EF614BA8);
      qword_1EF614BA8 = 0;
      qword_1EF614BE0 = 0;
    }
    v0 = (const char *)qword_1EF614BB8;
    if (!qword_1EF614BB8)
      return 0xFFFFFFFFLL;
    v13 = *(unsigned __int8 *)qword_1EF614BB8;
    if (!*(_BYTE *)qword_1EF614BB8)
      return 0xFFFFFFFFLL;
    if (v13 != 9)
    {
      if (v13 != 10)
        goto LABEL_57;
      v14 = 0;
      ++_nc_curr_line;
LABEL_56:
      _nc_curr_col = v14;
      goto LABEL_57;
    }
LABEL_55:
    v14 = _nc_curr_col | 7;
    goto LABEL_56;
  }
  v0 = (const char *)qword_1EF614BB8;
  if (!qword_1EF614BB8)
    goto LABEL_5;
  if (*(_BYTE *)qword_1EF614BB8 == 9)
    goto LABEL_55;
  if (!*(_BYTE *)qword_1EF614BB8)
  {
LABEL_5:
    v1 = 0;
    qword_1EF614BC0 = 0;
    while (1)
    {
      if (v1 + 256 >= qword_1EF614BE0)
      {
        qword_1EF614BE0 = 2 * qword_1EF614BE0 + 1024;
        v2 = _nc_doalloc((void *)qword_1EF614BD8, qword_1EF614BE0);
        qword_1EF614BD8 = (uint64_t)v2;
        if (!v2)
          return 0xFFFFFFFFLL;
        if (qword_1EF614BC0)
          qword_1EF614BC0 = (uint64_t)v2;
      }
      if (!v1)
        _nc_curr_file_pos = MEMORY[0x1C3B9DC38](qword_1EF614BB0);
      v3 = 0;
      v4 = qword_1EF614BD8 + v1;
      v5 = (int)qword_1EF614BE0 - (int)v1 >= 1 ? 1 : qword_1EF614BE0 - v1;
      v6 = qword_1EF614BE0 - v1 - v5;
      while (v6 != (_DWORD)v3)
      {
        v7 = fgetc((FILE *)qword_1EF614BB0);
        if (v7 == -1)
        {
          v6 = v3;
          break;
        }
        if (!v7)
          _nc_err_abort("This is not a text-file");
        *(_BYTE *)(v4 + v3++) = v7;
        if (v7 == 10)
        {
          *(_BYTE *)(v4 + v3) = 0;
          goto LABEL_23;
        }
      }
      *(_BYTE *)(v4 + v3) = 0;
      if (!v6)
      {
        if (v1)
          *(_WORD *)(qword_1EF614BD8 + strlen((const char *)qword_1EF614BD8)) = 10;
        goto LABEL_29;
      }
LABEL_23:
      v0 = (const char *)qword_1EF614BD8;
      qword_1EF614BC0 = qword_1EF614BD8;
      if (v1)
        goto LABEL_30;
      if (!_nc_curr_line && *(_WORD *)qword_1EF614BD8 == 282)
        _nc_err_abort("This is a compiled terminal description, not a source");
      ++_nc_curr_line;
      _nc_curr_col = 0;
LABEL_29:
      v0 = (const char *)qword_1EF614BC0;
LABEL_30:
      qword_1EF614BB8 = (uint64_t)v0;
      if (!v0)
        return 0xFFFFFFFFLL;
      v1 = strlen(v0);
      v8 = _nc_curr_col;
      while (1)
      {
        v9 = *(unsigned __int8 *)v0;
        if (v9 != 32 && v9 != 9)
          break;
        if (v9 == 9)
          v8 |= 7u;
        _nc_curr_col = ++v8;
        qword_1EF614BB8 = (uint64_t)++v0;
      }
      v11 = strlen(v0);
      if (v11 >= 2)
      {
        v12 = &v0[v11];
        if (v0[v11 - 1] == 10 && *(v12 - 2) == 13)
        {
          --v11;
          *((_BYTE *)v12 - 2) = 10;
          *((_BYTE *)v12 - 1) = 0;
        }
      }
      if (v0[v11 - 1] == 10)
      {
        if (*(_BYTE *)qword_1EF614BD8 == 35)
          goto LABEL_5;
        break;
      }
    }
  }
LABEL_57:
  byte_1EF614BD2 = v0 == (const char *)qword_1EF614BC0;
  if (v0 == (const char *)qword_1EF614BC0)
    byte_1EF614BD0 = 0;
  ++_nc_curr_col;
  qword_1EF614BB8 = (uint64_t)(v0 + 1);
  return *(unsigned __int8 *)v0;
}

void _nc_panic_mode(char a1)
{
  int v1;
  int v2;

  v1 = a1;
  do
    v2 = sub_1C05B32A4();
  while (v2 != v1 && v2 != -1);
}

uint64_t sub_1C05B35E0(int a1)
{
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v2 = strlen((const char *)qword_1EF614BB8);
  v3 = 0;
  v4 = MEMORY[0x1E0C80978];
  while (v2 + v3)
  {
    v5 = qword_1EF614BB8;
    v6 = *(unsigned __int8 *)(qword_1EF614BB8 + v2 + v3 - 1);
    if (*(char *)(qword_1EF614BB8 + v2 + v3 - 1) < 0)
      v7 = __maskrune(v6, 0x4000uLL);
    else
      v7 = *(_DWORD *)(v4 + 4 * v6 + 60) & 0x4000;
    --v3;
    if (!v7)
    {
      if ((int)v2 + (int)v3 > a1)
        return *(char *)(v5 + (v2 - a1 + v3));
      return 0;
    }
  }
  return 0;
}

int _nc_trans_string(char *a1, char *a2)
{
  int v3;
  int v4;
  char *v5;
  int v6;
  int v7;
  _BOOL4 v9;
  signed int v10;
  unsigned int v11;
  chtype v13;
  chtype v14;
  char *v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char *v21;
  int v22;
  uint64_t v23;
  char v25;

  v3 = 0;
  v4 = 0;
  v25 = 0;
  v5 = a2 - 1;
  while (1)
  {
    while (1)
    {
      v6 = sub_1C05B32A4();
      v7 = v6;
      if (v6 == -1 || v6 == byte_1EF614BD1)
        goto LABEL_103;
      if (a1 >= v5)
      {
        do
        {
          v22 = sub_1C05B32A4();
          v7 = v22;
        }
        while (v22 != -1 && v22 != byte_1EF614BD1);
        goto LABEL_103;
      }
      if (v6 == 10 && _nc_syntax == 1)
        goto LABEL_102;
      if (v6 == 94 && v4 != 37)
      {
        v13 = sub_1C05B32A4();
        if (v13 == -1)
LABEL_104:
          _nc_err_abort("Premature EOF");
        v14 = v13;
        if (v13 > 0x7F || (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v13 + 60) & 0x40000) == 0)
        {
          v15 = unctrl(v13);
          _nc_warning("Illegal ^ character - '%s'", v15);
        }
        if (v14 == 63 && _nc_syntax != 1)
        {
          *a1 = 127;
          if (_nc_tracing)
            _nc_warning("Allow ^? as synonym for \\177");
          v7 = 63;
          goto LABEL_86;
        }
        if ((v14 & 0x1F) != 0)
          v7 = v14 & 0x1F;
        else
          v7 = 128;
        goto LABEL_85;
      }
      if (v6 == 92)
        break;
      if (v6 != 10 || _nc_syntax)
        goto LABEL_85;
LABEL_88:
      if (!((v3 < 601) | v25 & 1))
      {
        _nc_warning("Very long string found.  Missing separator?");
        v25 = 1;
      }
    }
    v9 = _nc_syntax == 1 && _nc_strict_bsd != 0;
    v10 = sub_1C05B32A4();
    if (v10 == -1)
      goto LABEL_104;
    v7 = v10;
    v11 = v10 - 48;
    if ((v10 & 0xFFFFFFF8) == 0x30)
      goto LABEL_53;
    if (v11 < 0xA && v9)
      break;
    if (v10 != 10)
    {
      if (v10 > 101)
      {
        if (v10 <= 113)
        {
          if (v10 == 102)
          {
            *a1 = 12;
            v7 = 102;
            goto LABEL_86;
          }
          if (v10 == 110)
          {
            *a1 = 10;
            v7 = 110;
            goto LABEL_86;
          }
        }
        else
        {
          switch(v10)
          {
            case 'r':
              *a1 = 13;
              v7 = 114;
              goto LABEL_86;
            case 't':
              *a1 = 9;
              v7 = 116;
              goto LABEL_86;
            case '|':
              goto LABEL_85;
          }
        }
      }
      else
      {
        if (v10 > 91)
        {
          switch(v10)
          {
            case '\\':
              v7 = 92;
              break;
            case '^':
              v7 = 94;
              break;
            case 'b':
              *a1 = 8;
              v7 = 98;
              goto LABEL_86;
            default:
              goto LABEL_67;
          }
LABEL_85:
          *a1 = v7;
          goto LABEL_86;
        }
        if (v10 == 44)
        {
          v7 = 44;
          goto LABEL_85;
        }
        if (v10 == 69)
        {
          *a1 = 27;
          v7 = 69;
          goto LABEL_86;
        }
      }
LABEL_67:
      if (_nc_syntax && _nc_strict_bsd)
        goto LABEL_85;
      if (v10 <= 100)
      {
        if (v10 == 58)
        {
          v7 = 58;
          goto LABEL_85;
        }
        if (v10 == 97)
        {
          v7 = 7;
          goto LABEL_85;
        }
      }
      else
      {
        switch(v10)
        {
          case 's':
            v7 = 32;
            goto LABEL_85;
          case 'l':
            v7 = 10;
            goto LABEL_85;
          case 'e':
            v7 = 27;
            goto LABEL_85;
        }
      }
      v21 = unctrl(v10);
      _nc_warning("Illegal character '%s' in \\ sequence", v21);
      goto LABEL_85;
    }
  }
  v9 = 1;
LABEL_53:
  v16 = 1;
  while (2)
  {
    v17 = v16;
    v18 = sub_1C05B32A4();
    if ((_DWORD)v18 == -1)
      goto LABEL_104;
    v7 = v18;
    if ((v18 & 0xFFFFFFF8) == 0x30)
    {
LABEL_59:
      v16 = 0;
      LOBYTE(v11) = v7 + 8 * v11 - 48;
      if ((v17 & 1) == 0)
        goto LABEL_76;
      continue;
    }
    break;
  }
  if ((v18 - 48) <= 9)
  {
    if (!v9)
    goto LABEL_59;
  }
  v19 = qword_1EF614BB8;
  if (qword_1EF614BB8 == qword_1EF614BC0)
    goto LABEL_105;
  --qword_1EF614BB8;
  *(_BYTE *)(v19 - 1) = v18;
  --_nc_curr_col;
LABEL_76:
  if (v9)
    v20 = 0;
  else
    v20 = 0x80;
  if ((_BYTE)v11)
    v20 = v11;
  *a1 = v20;
LABEL_86:
  ++a1;
  if (_nc_curr_col > 1)
  {
    ++v3;
    v4 = v7;
    goto LABEL_88;
  }
  v23 = qword_1EF614BB8;
  if (qword_1EF614BB8 == qword_1EF614BC0)
LABEL_105:
    _nc_syserr_abort("Can't backspace off beginning of line");
  --qword_1EF614BB8;
  *(_BYTE *)(v23 - 1) = v7;
  --_nc_curr_col;
LABEL_102:
  v7 = 10;
LABEL_103:
  *a1 = 0;
  return v7;
}

void _nc_push_token(int a1)
{
  char *v1;

  dword_1EF614BA0 = a1;
  v1 = (char *)qword_1EF614BA8;
  if (!qword_1EF614BA8)
  {
    v1 = (char *)malloc(0x201uLL);
    qword_1EF614BA8 = (uint64_t)v1;
  }
  _nc_get_type(v1);
}

const char *__cdecl _nc_tic_dir(const char *a1)
{
  const char *result;

  if (!PC[41])
  {
    if (a1)
    {
      *(_QWORD *)&PC[48] = a1;
      PC[40] = 1;
    }
    else if (!PC[40])
    {
      result = getenv("TERMINFO");
      if (result)
      {
        *(_QWORD *)&PC[48] = result;
        PC[40] = 1;
        return result;
      }
    }
  }
  if (*(_QWORD *)&PC[48])
    return *(const char **)&PC[48];
  else
    return "/usr/share/terminfo";
}

const char *_nc_keep_tic_dir(const char *a1)
{
  const char *result;

  result = _nc_tic_dir(a1);
  PC[41] = 1;
  return result;
}

void _nc_last_db(void)
{
  if (*(_QWORD *)&PC[288])
  {
    if (sub_1C05B3C20())
    {
      free(*(void **)&PC[288]);
      *(_QWORD *)&PC[288] = 0;
      free(*(void **)&PC[296]);
      *(_QWORD *)&PC[296] = 0;
    }
  }
}

uint64_t sub_1C05B3C20()
{
  uint64_t v1;
  const char **i;

  if (time(0) <= *(uint64_t *)&PC[312])
  {
    v1 = 0;
    for (i = (const char **)&PC[320]; !*i || (sub_1C05B405C(*i, v1) & 1) == 0; i += 2)
    {
      if (++v1 == 9)
        return 0;
    }
  }
  return 1;
}

void _nc_first_db(DBDIRS *a1, int *a2)
{
  uint64_t v2;
  size_t v3;
  const char *v4;
  _BYTE *v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  char *v9;
  unsigned __int8 *v10;
  size_t v11;
  int v12;
  int v13;
  stat *v14;
  stat *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char **v20;
  char *v21;
  uint64_t v22;
  int v23;
  char **v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  *a1 = dbdTIC;
  *a2 = 0;
  if (*(_QWORD *)&PC[288])
  {
    if (!sub_1C05B3C20())
      return;
    free(*(void **)&PC[288]);
    *(_QWORD *)&PC[288] = 0;
    free(*(void **)&PC[296]);
    *(_QWORD *)&PC[296] = 0;
  }
  v35[0] = *(_QWORD *)&PC[48];
  v35[4] = "/usr/share/terminfo";
  v35[5] = "/usr/share/terminfo";
  v38 = "/etc/termcap:/usr/share/misc/termcap";
  sub_1C05B405C("TERMINFO", 1u);
  v35[1] = *(_QWORD *)&PC[344];
  v35[2] = _nc_home_terminfo();
  sub_1C05B405C("HOME", 2u);
  sub_1C05B405C("TERMINFO_DIRS", 3u);
  v35[3] = *(_QWORD *)&PC[376];
  sub_1C05B405C("TERMCAP", 6u);
  v36 = *(_QWORD *)&PC[424];
  if (*(_QWORD *)&PC[424] && **(_BYTE **)&PC[424] != 47)
    v36 = 0;
  sub_1C05B405C("TERMPATH", 7u);
  v2 = 0;
  v3 = 0;
  v37 = *(_QWORD *)&PC[440];
  do
  {
    if (v35[v2])
      v4 = (const char *)v35[v2];
    else
      v4 = (const char *)&unk_1C05E2CBB;
    v35[v2] = v4;
    v3 += strlen(v4) + 2;
    ++v2;
  }
  while (v2 != 9);
  v5 = malloc(v3);
  *(_QWORD *)&PC[288] = v5;
  if (v5)
  {
    v6 = 0;
    *v5 = 0;
    do
    {
      v7 = (const char *)v35[v6];
      if (*v7)
      {
        v8 = strlen(*(const char **)&PC[288]);
        v9 = (char *)(*(_QWORD *)&PC[288] + v8);
        if (v8)
          *v9++ = 58;
        strcpy(v9, v7);
      }
      ++v6;
    }
    while (v6 != 9);
    v10 = *(unsigned __int8 **)&PC[288];
    v11 = 2;
    do
    {
      while (1)
      {
        v13 = *v10++;
        v12 = v13;
        if (v13 != 58)
          break;
        ++v11;
      }
    }
    while (v12);
    *(_QWORD *)&PC[296] = calloc(v11, 8uLL);
    v14 = (stat *)calloc(v11, 0x90uLL);
    v15 = v14;
    if (*(_QWORD *)&PC[296])
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {
      free(*(void **)&PC[288]);
      *(_QWORD *)&PC[288] = 0;
    }
    else
    {
      v17 = 0;
      **(_QWORD **)&PC[296] = *(_QWORD *)&PC[288];
      v18 = 1;
      while (*(_BYTE *)(*(_QWORD *)&PC[288] + v17))
      {
        if (*(_BYTE *)(*(_QWORD *)&PC[288] + v17) == 58)
        {
          *(_BYTE *)(*(_QWORD *)&PC[288] + v17) = 0;
          v19 = *(_QWORD *)&PC[288] + v17++;
          *(_QWORD *)(*(_QWORD *)&PC[296] + 8 * v18++) = v19 + 1;
        }
        else
        {
          ++v17;
        }
      }
      v20 = *(const char ***)&PC[296];
      v21 = **(char ***)&PC[296];
      if (!**(_QWORD **)&PC[296])
        goto LABEL_58;
      v22 = 0;
      v23 = 0;
      v24 = *(char ***)&PC[296];
      do
      {
        if (!*v21)
        {
          *v24 = strdup("/usr/share/terminfo");
          v20 = *(const char ***)&PC[296];
        }
        if (v23 >= 1)
        {
          v25 = 0;
          v26 = v20[v22];
          while (strcmp(v26, v20[v25]))
          {
            if (v23 == ++v25)
              goto LABEL_46;
          }
          v27 = 8 * v23;
          do
          {
            v28 = *(_QWORD *)(*(_QWORD *)&PC[296] + v27 + 8);
            *(_QWORD *)(*(_QWORD *)&PC[296] + v27) = v28;
            v27 += 8;
          }
          while (v28);
          v20 = *(const char ***)&PC[296];
          --v23;
        }
LABEL_46:
        v22 = ++v23;
        v24 = (char **)&v20[v23];
        v21 = *v24;
      }
      while (*v24);
      v29 = *v20;
      if (*v20)
      {
        v30 = 0;
        v31 = 0;
        do
        {
          if (stat(v29, &v15[v30]) || (v34 = v15[v30].st_mode & 0xF000, v34 != 0x4000) && v34 != 0x8000)
          {
            v32 = 8 * v31;
            do
            {
              v33 = *(_QWORD *)(*(_QWORD *)&PC[296] + v32 + 8);
              *(_QWORD *)(*(_QWORD *)&PC[296] + v32) = v33;
              v32 += 8;
            }
            while (v33);
            --v31;
          }
          v30 = ++v31;
          v29 = *(const char **)(*(_QWORD *)&PC[296] + 8 * v31);
        }
        while (v29);
      }
      else
      {
LABEL_58:
        v31 = 0;
      }
      *(_DWORD *)&PC[304] = v31;
      *(_QWORD *)&PC[312] = time(0);
    }
    free(v15);
  }
}

char *sub_1C05B405C(const char *a1, unsigned int a2)
{
  char *result;
  void *v5;
  uint64_t v6;
  char *v7;
  const char *v8;
  const char **v9;
  void **v10;
  char *v11;
  _QWORD *v12;
  void *v13;

  result = getenv(a1);
  if (result)
  {
    result = strdup(result);
    if (result)
    {
      v5 = result;
      v6 = a2;
      v7 = &PC[16 * a2 + 8];
      v8 = (const char *)*((_QWORD *)v7 + 39);
      if (v8 && !strcmp(v8, a1))
      {
        v11 = &PC[16 * v6 + 8];
        v12 = v11 + 320;
        v13 = (void *)*((_QWORD *)v11 + 40);
        if (v13)
        {
          if (!strcmp((const char *)v5, *((const char **)v11 + 40)))
          {
            free(v5);
            return 0;
          }
          free(v13);
        }
        *v12 = v5;
      }
      else
      {
        v9 = (const char **)(v7 + 312);
        v10 = (void **)&PC[16 * v6 + 328];
        if (*v10)
          free(*v10);
        *v9 = a1;
        *v10 = v5;
      }
      return (char *)1;
    }
  }
  return result;
}

int define_key(const char *a1, int a2)
{
  BOOL v2;
  int v3;
  uint64_t v4;
  int v6;
  int v7;
  int v8;
  int v9;

  if (SP)
    v2 = cur_term == 0;
  else
    v2 = 1;
  if (v2)
    return -1;
  v4 = *(_QWORD *)&a2;
  if (a2 > 0)
  {
    if (a1)
    {
      while (_nc_remove_string((uint64_t *)(SP + 160), a1))
        ;
      v3 = -1;
    }
    else
    {
      if (!has_key(a2))
        return -1;
      v8 = -1;
      do
      {
        v3 = v8;
        v9 = _nc_remove_key((_QWORD *)(SP + 160), v4);
        v8 = 0;
      }
      while (v9);
    }
    if (!a1)
      return v3;
    if (!key_defined(a1))
    {
      if (_nc_add_to_try((void **)(SP + 160), (unsigned __int8 *)a1, v4))
        return -1;
      else
        return 0;
    }
    return -1;
  }
  v6 = -1;
  do
  {
    v3 = v6;
    v7 = _nc_remove_string((uint64_t *)(SP + 160), a1);
    v6 = 0;
  }
  while (v7);
  return v3;
}

void *_nc_doalloc(void *a1, size_t __size)
{
  void *result;
  int *v4;

  if (!a1)
    return malloc(__size);
  result = realloc(a1, __size);
  if (!result)
  {
    free(a1);
    v4 = __error();
    result = 0;
    *v4 = 12;
  }
  return result;
}

void _nc_free_entry(_ENTRY *a1, _ENTRY *a2)
{
  _ENTRY *v2;

  v2 = _nc_delink_entry(a1, a2);
  if (v2)
    free(v2);
}

_ENTRY *_nc_delink_entry(_ENTRY *a1, _ENTRY *a2)
{
  _ENTRY *next;
  _ENTRY *v3;
  _ENTRY *v4;

  if (!a1)
    return 0;
  if (a1 != a2)
  {
    while (1)
    {
      next = a1->next;
      if (!next)
        return 0;
      v3 = a1;
      a1 = a1->next;
      if (next == a2)
      {
        if (v3)
          v3->next = a2->next;
        goto LABEL_7;
      }
    }
  }
  v3 = 0;
LABEL_7:
  v4 = a2->next;
  if (v4)
    v4->last = v3;
  if (_nc_head == a2)
    _nc_head = v4;
  if (_nc_tail == a2)
    _nc_tail = v3;
  return a2;
}

void _nc_free_entries(_ENTRY *a1)
{
  while (_nc_head)
    _nc_free_termtype(&_nc_head->tterm);
}

const TERMTYPE *__cdecl _nc_fallback(const char *a1)
{
  return 0;
}

void _nc_free_termtype(TERMTYPE *a1)
{
  char *str_table;
  char *Booleans;
  __int16 *Numbers;
  char **Strings;
  char *ext_str_table;
  char **ext_Names;

  str_table = a1->str_table;
  if (str_table)
    free(str_table);
  Booleans = a1->Booleans;
  if (Booleans)
    free(Booleans);
  Numbers = a1->Numbers;
  if (Numbers)
    free(Numbers);
  Strings = a1->Strings;
  if (Strings)
    free(Strings);
  ext_str_table = a1->ext_str_table;
  if (ext_str_table)
    free(ext_str_table);
  ext_Names = a1->ext_Names;
  if (ext_Names)
    free(ext_Names);
  *(_QWORD *)&a1->ext_Numbers = 0;
  *(_OWORD *)&a1->Strings = 0u;
  *(_OWORD *)&a1->ext_Names = 0u;
  *(_OWORD *)&a1->term_names = 0u;
  *(_OWORD *)&a1->Booleans = 0u;
  _nc_free_entry(_nc_head, (_ENTRY *)a1);
}

int use_extended_names(BOOL a1)
{
  _BOOL4 v1;

  v1 = _nc_user_definable;
  _nc_user_definable = a1;
  return v1;
}

const char *_nc_setenv_num(const char *result, int a2)
{
  const char *v2;
  char __value[128];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if ((a2 & 0x80000000) == 0)
    {
      v2 = result;
      __sprintf_chk(__value, 0, 0x80uLL, "%d", a2);
      return (const char *)setenv(v2, __value, 1);
    }
  }
  return result;
}

void _nc_scroll_optimize()
{
  void *v0;
  int v1;
  int v2;
  BOOL v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;

  v0 = *(void **)(SP + 1432);
  v1 = *(_DWORD *)(SP + 1440);
  v2 = *(__int16 *)(SP + 128);
  if (v0)
    v3 = v1 < v2;
  else
    v3 = 1;
  if (v3)
  {
    if (v1 <= v2)
      v4 = *(__int16 *)(SP + 128);
    else
      v4 = *(_DWORD *)(SP + 1440);
    v5 = _nc_doalloc(v0, 4 * v4);
    if (!v5)
      return;
    v6 = SP;
    *(_QWORD *)(SP + 1432) = v5;
    *(_DWORD *)(v6 + 1440) = v4;
  }
  _nc_hash_map();
  v7 = SP;
  v8 = *(__int16 *)(SP + 128);
  if (v8 >= 1)
  {
    v9 = 0;
    do
    {
      v10 = *(_QWORD *)(v7 + 1432);
      v11 = v9 << 32;
      v12 = (int)v9;
      v13 = (int)v9 + 1;
      v14 = v9 + 1;
      while (1)
      {
        v15 = *(int *)(v10 + 4 * v12);
        if ((_DWORD)v15 != -1 && v12 < v15)
          break;
        ++v12;
        v11 += 0x100000000;
        ++v13;
        ++v14;
        if (v12 >= v8)
          goto LABEL_27;
      }
      v17 = *(unsigned int *)(v10 + (v11 >> 30));
      v18 = (v17 - v12);
      do
      {
        v19 = v17;
        v9 = v13;
        if (v13 >= v8)
          break;
        v20 = *(_DWORD *)(v10 + 4 * v13);
        v17 = (v17 + 1);
        ++v13;
      }
      while (v20 != -1 && v20 - 1 == (_DWORD)v19);
      _nc_scrolln((void *)v18, v12, v19, (v8 - 1));
      v7 = SP;
      v8 = *(__int16 *)(SP + 128);
    }
    while ((int)v9 < v8);
  }
LABEL_27:
  v22 = (v8 - 1);
  if (v8 >= 1)
  {
    while (2)
    {
      v23 = *(_QWORD *)(SP + 1432);
      while (1)
      {
        v24 = *(_DWORD *)(v23 + 4 * v22);
        if (v24 != -1 && v24 < (int)v22)
          break;
        v3 = (int)v22 <= 0;
        v22 = (v22 - 1);
        if (v3)
          return;
      }
      v26 = 0;
      v27 = (v24 - v22);
      v28 = v22 - 1;
      do
      {
        v29 = v22 + v26;
        if ((int)v22 + v26 < 1)
        {
          _nc_scrolln((void *)v27, (v24 + v26), v22, (*(__int16 *)(SP + 128) - 1));
          return;
        }
        v30 = *(_DWORD *)(v23 + 4 * v28);
        v31 = v24 + v26-- - v30;
        --v28;
      }
      while (v30 != -1 && v31 == 1);
      _nc_scrolln((void *)v27, (v24 + v26 + 1), v22, (*(__int16 *)(SP + 128) - 1));
      v22 = (v22 + v26);
      if (v29 > 0)
        continue;
      break;
    }
  }
}

void _nc_hash_map()
{
  uint64_t v0;
  int v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  unsigned int v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  BOOL v44;
  _QWORD *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _DWORD *v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  unsigned int v66;
  int v67;
  int v68;
  unsigned int v69;
  void *v71;

  v0 = SP;
  v1 = *(unsigned __int16 *)(SP + 128);
  if (*(_DWORD *)(SP + 1424) < *(__int16 *)(SP + 128))
  {
    v2 = *(void **)(SP + 1416);
    if (v2)
    {
      free(v2);
      v0 = SP;
      v1 = *(unsigned __int16 *)(SP + 128);
    }
    v3 = malloc(48 * (__int16)v1 + 48);
    *(_QWORD *)(v0 + 1416) = v3;
    if (!v3)
    {
      v71 = *(void **)(v0 + 1400);
      if (v71)
      {
        free(v71);
        v0 = SP;
        *(_QWORD *)(SP + 1400) = 0;
      }
      *(_DWORD *)(v0 + 1424) = 0;
      return;
    }
    *(_DWORD *)(v0 + 1424) = (__int16)v1;
  }
  if (!*(_QWORD *)(v0 + 1400))
  {
    v11 = calloc((__int16)v1, 8uLL);
    v0 = SP;
    *(_QWORD *)(SP + 1400) = v11;
    v12 = *(_QWORD **)(v0 + 1408);
    if (v12)
    {
LABEL_21:
      v13 = *(_QWORD *)(v0 + 1400);
      if (v13)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
        return;
      v1 = *(__int16 *)(v0 + 128);
      if (v1 >= 1)
      {
        v15 = 0;
        v16 = *(_QWORD *)(v0 + 136);
        v17 = *(unsigned __int16 *)(v16 + 6);
        v18 = (__int16)v17;
        v19 = v17 + 2;
        do
        {
          if (v18 < 0)
          {
            v24 = 0;
            v12[v15] = 0;
          }
          else
          {
            v20 = 0;
            v21 = (int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 144) + 40) + 16 * v15) + 4);
            v22 = v19;
            do
            {
              v23 = *v21;
              v21 += 7;
              v20 = 33 * v20 + v23;
              --v22;
            }
            while (v22 > 1);
            v24 = 0;
            v12[v15] = v20;
            v25 = (int *)(*(_QWORD *)(*(_QWORD *)(v16 + 40) + 16 * v15) + 4);
            v26 = v19;
            do
            {
              v27 = *v25;
              v25 += 7;
              v24 = 33 * v24 + v27;
              --v26;
            }
            while (v26 > 1);
          }
          *(_QWORD *)(v13 + 8 * v15++) = v24;
        }
        while (v15 != (unsigned __int16)v1);
      }
      goto LABEL_35;
    }
LABEL_20:
    v12 = calloc(*(__int16 *)(v0 + 128), 8uLL);
    v0 = SP;
    *(_QWORD *)(SP + 1408) = v12;
    goto LABEL_21;
  }
  v4 = *(_QWORD *)(v0 + 1408);
  if (!v4)
    goto LABEL_20;
  if ((__int16)v1 >= 1)
  {
    v5 = 0;
    v6 = *(_QWORD *)(*(_QWORD *)(v0 + 144) + 40);
    do
    {
      if (*(__int16 *)(v6 + 16 * v5 + 8) != -1)
      {
        if (*(__int16 *)(*(_QWORD *)(v0 + 136) + 6) < 0)
        {
          v7 = 0;
        }
        else
        {
          v7 = 0;
          v8 = *(unsigned __int16 *)(*(_QWORD *)(v0 + 136) + 6) + 2;
          v9 = (int *)(*(_QWORD *)(v6 + 16 * v5) + 4);
          do
          {
            v10 = *v9;
            v9 += 7;
            v7 = 33 * v7 + v10;
            --v8;
          }
          while (v8 > 1);
        }
        *(_QWORD *)(v4 + 8 * v5) = v7;
      }
      ++v5;
    }
    while (v5 != v1);
  }
LABEL_35:
  bzero(*(void **)(v0 + 1416), 48 * (__int16)v1 + 48);
  v28 = (_QWORD *)SP;
  v29 = *(__int16 *)(SP + 128);
  if (v29 < 1)
  {
    v39 = *(_QWORD **)(SP + 1416);
  }
  else
  {
    v30 = 0;
    v31 = *(_QWORD *)(SP + 1400);
    v32 = *(_QWORD *)(SP + 1416) - 8;
    do
    {
      v33 = *(_QWORD *)(v31 + 8 * v30);
      v34 = v32;
      do
      {
        v35 = *(_QWORD *)(v34 + 8);
        v34 += 24;
        if (v35)
          v36 = v35 == v33;
        else
          v36 = 1;
      }
      while (!v36);
      *(_QWORD *)(v34 - 16) = v33;
      ++*(_DWORD *)(v34 - 8);
      *(_DWORD *)v34 = v30++;
    }
    while (v30 != v29);
    v37 = 0;
    v38 = v28[176];
    v39 = (_QWORD *)v28[177];
    v40 = v28[179];
    do
    {
      v41 = *(_QWORD *)(v38 + 8 * v37);
      v42 = (char *)v39 - 12;
      do
      {
        v43 = *(_QWORD *)(v42 + 12);
        v42 += 24;
        if (v43)
          v44 = v43 == v41;
        else
          v44 = 1;
      }
      while (!v44);
      *(_QWORD *)(v42 - 12) = v41;
      ++*(_DWORD *)v42;
      *((_DWORD *)v42 + 2) = v37;
      *(_DWORD *)(v40 + 4 * v37++) = -1;
    }
    while (v37 != v29);
  }
  if (*v39)
  {
    v45 = v39 + 3;
    do
    {
      if (*((_DWORD *)v45 - 4) == 1 && *((_DWORD *)v45 - 3) == 1)
      {
        v46 = *((_DWORD *)v45 - 2);
        v47 = *((int *)v45 - 1);
        if (v46 != (_DWORD)v47)
          *(_DWORD *)(v28[179] + 4 * v47) = v46;
      }
      v48 = *v45;
      v45 += 3;
    }
    while (v48);
  }
  sub_1C05B4A98((uint64_t)v28);
  v49 = SP;
  v50 = *(__int16 *)(SP + 128);
  if (v50 >= 1)
  {
    v51 = 0;
    v52 = *(_QWORD *)(SP + 1432);
    v53 = *(unsigned __int16 *)(SP + 128);
    while (1)
    {
      v54 = (int)v51;
      v55 = v51 << 32;
      v56 = (_DWORD *)(v52 + 4 * (int)v51);
      while (*v56 == -1)
      {
        ++v54;
        ++v56;
        v55 += 0x100000000;
        if (v54 >= v53)
          goto LABEL_91;
      }
      v57 = 0;
      v58 = *(_DWORD *)(v52 + (v55 >> 30));
      v59 = v58 - v54;
      v60 = ~v58;
      v61 = v54;
      do
      {
        v62 = v61;
        v63 = v57;
        if (v54 + v57 + 1 >= v53)
          break;
        v64 = v56[v57 + 1];
        ++v61;
        ++v57;
      }
      while (v64 != -1 && v60 + v64 == v63);
      v66 = v63 + 1;
      if (v63 + 1 >= 3)
        break;
      if ((int)v54 <= v62)
        goto LABEL_75;
LABEL_79:
      v51 = (v62 + 1);
      if ((int)v51 >= v50)
        goto LABEL_91;
    }
    if (v66 <= 0x17)
      v68 = v66 >> 3;
    else
      v68 = 2;
    v69 = v68 + v63 + 1;
    if (v59 < 0)
      v59 = -v59;
    if (v69 >= v59 || (int)v54 > v62)
      goto LABEL_79;
LABEL_75:
    if ((int)v54 <= v62)
      v67 = v62;
    else
      v67 = v54;
    memset(v56, 255, 4 * (v67 - v54) + 4);
    goto LABEL_79;
  }
LABEL_91:
  sub_1C05B4A98(v49);
}

uint64_t sub_1C05B4A98(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  int *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  _DWORD *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;

  v1 = *(__int16 *)(result + 128);
  if ((int)v1 < 1)
  {
    v2 = 0;
  }
  else
  {
    v2 = 0;
    while (*(_DWORD *)(*(_QWORD *)(result + 1432) + 4 * v2) == -1)
    {
      if (v1 == ++v2)
        return result;
    }
  }
  if ((int)v2 < (int)v1)
  {
    v3 = 0;
    v4 = 0;
    v5 = *(_QWORD *)(result + 1432);
    v6 = *(__int16 *)(result + 128);
    v36 = v5 + 4;
    v37 = v5;
    v39 = result;
    v40 = v5 - 4;
    v34 = v6;
    v35 = *(__int16 *)(result + 128);
    do
    {
      v7 = 0;
      v8 = v2;
      v9 = (int)v2;
      v10 = *(_DWORD *)(v37 + 4 * (int)v2);
      v11 = v10 - v2;
      v12 = (v2 + 1);
      if ((int)v12 > (int)v1)
        v13 = (v2 + 1);
      else
        v13 = v1;
      v14 = v2 << 32;
      v15 = (int)v2 + 1;
      v16 = v36 + 4 * (int)v2;
      do
      {
        v2 = v12;
        if (v15 + v7 >= v6)
          goto LABEL_23;
        result = *(unsigned int *)(v16 + 4 * v7);
        v17 = v7;
        v14 += 0x100000000;
        ++v7;
        v12 = (v12 + 1);
      }
      while ((_DWORD)result != -1 && ~v10 + (_DWORD)result == v17);
      v13 = v8 + v7;
      if ((int)v9 + (int)v7 >= (int)v1)
      {
LABEL_23:
        v2 = v13;
        v38 = v13;
        goto LABEL_24;
      }
      v19 = v2 << 32;
      v20 = (int *)(v37 + 4 * (int)v2);
      while (1)
      {
        v21 = *v20++;
        if (v21 != -1)
          break;
        v19 += 0x100000000;
        v2 = (v2 + 1);
        if ((_DWORD)v1 == (_DWORD)v2)
        {
          v2 = v1;
          v38 = v1;
          goto LABEL_24;
        }
      }
      v33 = *(_DWORD *)(v37 + (v19 >> 30));
      if (v33 >= (int)v2)
        v33 = v2;
      v38 = v33;
LABEL_24:
      v22 = v3 - v11;
      if (v11 >= 0)
        v22 = v4;
      if ((int)v8 > v22)
      {
        v23 = *(_QWORD *)(v39 + 1400);
        v24 = v22;
        v25 = v8 - 1;
        v26 = v10 - 1;
        v27 = *(_QWORD *)(v39 + 1408) - 8;
        do
        {
          if (*(_QWORD *)(v27 + 8 * v9) != *(_QWORD *)(v23 + 8 * v26))
          {
            result = sub_1C05B4EEC(v39, v26, v25, v11 >> 31);
            if (!(_DWORD)result)
              break;
          }
          *(_DWORD *)(v40 + 4 * v9) = v26;
          --v25;
          --v26;
          --v9;
        }
        while (v9 > v24);
      }
      if (v11 <= 0)
        v28 = v2;
      else
        v28 = v38 - v11;
      if ((int)v13 < v28)
      {
        v29 = *(_QWORD *)(v39 + 1400);
        v30 = (uint64_t *)(*(_QWORD *)(v39 + 1408) + 8 * (int)v13);
        v31 = (_DWORD *)(v37 + 4 * (int)v13);
        while (1)
        {
          v32 = *v30++;
          if (v32 != *(_QWORD *)(v29 + 8 * (v11 + (int)v13)))
          {
            result = sub_1C05B4EEC(v39, v11 + v13, v13, v11 > 0);
            if (!(_DWORD)result)
              break;
          }
          *v31++ = v11 + v13;
          LODWORD(v13) = v13 + 1;
          if (v28 == (_DWORD)v13)
          {
            LODWORD(v13) = v28;
            break;
          }
        }
      }
      v6 = v34;
      v1 = v35;
      v3 = v13 + (v11 & ~(v11 >> 31));
      v4 = v13;
    }
    while ((int)v2 < (int)v35);
  }
  return result;
}

uint64_t _nc_make_oldhash(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(SP + 1400);
  if (v1)
  {
    v2 = *(_QWORD *)(SP + 136);
    if (*(__int16 *)(v2 + 6) < 0)
    {
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v4 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 16 * (int)result);
      v5 = *(unsigned __int16 *)(v2 + 6) + 2;
      v6 = (int *)(v4 + 4);
      do
      {
        v7 = *v6;
        v6 += 7;
        v3 = 33 * v3 + v7;
        --v5;
      }
      while (v5 > 1);
    }
    *(_QWORD *)(v1 + 8 * (int)result) = v3;
  }
  return result;
}

void *_nc_scroll_oldhash(void *result, int a2, int a3)
{
  uint64_t v3;
  int v6;
  int v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  int *v27;
  unsigned int v28;
  uint64_t v29;

  v3 = *(_QWORD *)(SP + 1400);
  if (v3)
  {
    v6 = (int)result;
    if ((int)result >= 0)
      v7 = (int)result;
    else
      v7 = -(int)result;
    v8 = 8 * (a3 - a2 - v7 + 1);
    v9 = (char *)(v3 + 8 * a2);
    if ((int)result < 1)
    {
      result = memmove(&v9[-8 * (int)result], v9, v8);
      if (v6 < 0)
      {
        v20 = a2;
        v21 = *(_QWORD *)(SP + 136);
        v22 = *(unsigned __int16 *)(v21 + 6);
        v23 = (__int16)v22;
        v24 = *(_QWORD *)(SP + 1400);
        v25 = v22 + 2;
        do
        {
          v26 = 0;
          if ((v23 & 0x80000000) == 0)
          {
            v27 = (int *)(*(_QWORD *)(*(_QWORD *)(v21 + 40) + 16 * v20) + 4);
            v28 = v25;
            do
            {
              v29 = *v27;
              v27 += 7;
              v26 = 33 * v26 + v29;
              --v28;
            }
            while (v28 > 1);
          }
          *(_QWORD *)(v24 + 8 * v20++) = v26;
        }
        while (v20 < a2 - v6);
      }
    }
    else
    {
      result = memmove(v9, &v9[8 * result], v8);
      v10 = *(_QWORD *)(SP + 136);
      v11 = *(unsigned __int16 *)(v10 + 6);
      v12 = (__int16)v11;
      v13 = *(_QWORD *)(SP + 1400);
      v14 = a3;
      v15 = v11 + 2;
      do
      {
        v16 = 0;
        if ((v12 & 0x80000000) == 0)
        {
          v17 = (int *)(*(_QWORD *)(*(_QWORD *)(v10 + 40) + 16 * v14) + 4);
          v18 = v15;
          do
          {
            v19 = *v17;
            v17 += 7;
            v16 = 33 * v16 + v19;
            --v18;
          }
          while (v18 > 1);
        }
        *(_QWORD *)(v13 + 8 * v14--) = v16;
      }
      while (v14 > a3 - v6);
    }
  }
  return result;
}

BOOL sub_1C05B4EEC(uint64_t a1, int a2, int a3, int a4)
{
  int v7;
  int v8;
  int v9;
  int v10;

  if (a2 == a3)
    return 0;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 1432) + 4 * a2) == -1)
    v7 = a2;
  else
    v7 = *(_DWORD *)(*(_QWORD *)(a1 + 1432) + 4 * a2);
  if (a4)
    v8 = sub_1C05B4FF8(a1);
  else
    v8 = sub_1C05B5120(a1);
  v9 = sub_1C05B5120(a1);
  v10 = v9 + v8;
  if (v7 == a2)
    v9 = sub_1C05B4FF8(a1);
  return v10 >= (int)(sub_1C05B5120(a1) + v9);
}

uint64_t sub_1C05B4FF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (**v2)(_QWORD);
  _DWORD *v3;
  int v4;
  int v5;
  uint64_t result;
  int v7;
  int v8;
  uint64_t v9;
  _DWORD *v10;

  v1 = a1;
  v2 = &_nc_abiver;
  if (cur_term->type.Booleans[28])
    _nc_abiver(&_nc_abiver);
  if (*(__int16 *)(*(_QWORD *)(v1 + 136) + 6) < 0)
    return 0;
  v3 = (_DWORD *)(*v2)(v2);
  result = 0;
  v8 = v7 + 2;
  v10 = (_DWORD *)(v9 + 12);
  do
  {
    if (v5 != *(v10 - 3)
      || *(v10 - 2) != 32
      || *(v10 - 1)
      || *v10
      || v10[1]
      || v10[2]
      || *v3 >= 0x60000u && v4 != v10[3])
    {
      result = (result + 1);
    }
    --v8;
    v10 += 7;
  }
  while (v8 > 1);
  return result;
}

uint64_t sub_1C05B5120(uint64_t a1)
{
  _DWORD *v1;
  uint64_t result;
  int v3;
  int v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  _DWORD *v8;

  if (*(__int16 *)(*(_QWORD *)(a1 + 136) + 6) < 0)
    return 0;
  v1 = (_DWORD *)_nc_abiver(&_nc_abiver);
  result = 0;
  v4 = v3 + 2;
  v6 = (_DWORD *)(v5 + 12);
  v8 = (_DWORD *)(v7 + 12);
  do
  {
    if (*(v6 - 3) != *(v8 - 3)
      || *(v6 - 2) != *(v8 - 2)
      || *(v6 - 1) != *(v8 - 1)
      || *v6 != *v8
      || v6[1] != v8[1]
      || v6[2] != v8[2]
      || *v1 >= 0x60000u && v6[3] != v8[3])
    {
      result = (result + 1);
    }
    --v4;
    v6 += 7;
    v8 += 7;
  }
  while (v4 > 1);
  return result;
}

uint64_t _nc_init_keytry(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;
  chtype code;
  uint64_t offset;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unsigned __int8 *v11;

  if (result)
  {
    v1 = result;
    v2 = 0;
    v3 = (void **)(result + 160);
    code = 348;
    do
    {
      offset = _nc_tinfo_fkeys[v2].offset;
      if (offset <= 0x19D)
        result = _nc_add_to_try(v3, (unsigned __int8 *)cur_term->type.Strings[offset], code);
      code = _nc_tinfo_fkeys[++v2].code;
    }
    while (v2 != 150);
    v6 = *(_QWORD *)(v1 + 48);
    LODWORD(v7) = *(unsigned __int16 *)(v6 + 60);
    if (v7 >= 0x19F)
    {
      v8 = 414;
      do
      {
        v9 = *(_BYTE **)(*(_QWORD *)(v6 + 48)
                       + 8
                       * (int)(v8
                             + *(unsigned __int16 *)(v6 + 66)
                             + *(unsigned __int16 *)(v6 + 64)
                             + *(unsigned __int16 *)(v6 + 62)
                             - v7));
        if (v9)
        {
          v10 = *(_QWORD *)(v6 + 32);
          v11 = *(unsigned __int8 **)(v10 + 8 * v8);
          if (*v9 == 107 && v11 != 0)
          {
            result = key_defined(*(const char **)(v10 + 8 * v8));
            if (!(_DWORD)result)
              result = _nc_add_to_try(v3, v11, (int)v8 + 97);
          }
        }
        ++v8;
        v7 = *(unsigned __int16 *)(v6 + 60);
      }
      while (v8 < v7);
    }
  }
  return result;
}

int key_defined(const char *a1)
{
  if (a1 && SP)
    return sub_1C05B5330(*(uint64_t **)(SP + 160), a1);
  else
    return -1;
}

uint64_t sub_1C05B5330(uint64_t *a1, _BYTE *a2)
{
  uint64_t *v2;
  int v3;
  BOOL v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t result;

  if (!a2)
    return 0;
  v2 = a1;
  v3 = *a2;
  if (*a2)
    v4 = a1 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = a2 + 1;
    do
    {
      if (v3 == *((unsigned __int8 *)v2 + 16))
      {
        v6 = *v2;
        if (*v5)
        {
          result = sub_1C05B5330(v6, v5);
          if ((_DWORD)result)
            return result;
        }
        else if (v6 || sub_1C05B5330(0, v5))
        {
          return 0xFFFFFFFFLL;
        }
        result = *((unsigned __int16 *)v2 + 9);
        if (*((_WORD *)v2 + 9))
          return result;
      }
      v2 = (uint64_t *)v2[1];
    }
    while (v2);
  }
  return 0;
}

char *__cdecl keybound(int a1, int a2)
{
  uint64_t v2;
  char *result;
  int v4;

  v2 = *(_QWORD *)&a1;
  result = 0;
  v4 = a2;
  if ((v2 & 0x80000000) == 0)
  {
    if (SP)
      return _nc_expand_try(*(_QWORD *)(SP + 160), v2, &v4, 0);
  }
  return result;
}

int keyok(int a1, BOOL a2)
{
  uint64_t v2;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int v6;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  int v10;

  if (!SP)
    return -1;
  v2 = *(_QWORD *)&a1;
  v3 = -1;
  if ((a1 & 0x80000000) == 0 && *(_QWORD *)(SP + 48))
  {
    v10 = 0;
    if (a2)
    {
      v4 = _nc_expand_try(*(_QWORD *)(SP + 168), *(uint64_t *)&a1, &v10, 0);
      if (v4)
      {
        v5 = v4;
        do
        {
          if (_nc_remove_key((_QWORD *)(SP + 168), v2))
          {
            v6 = _nc_add_to_try((void **)(SP + 160), v5, v2);
            free(v5);
            v3 = 0;
            v10 = 0;
            if (v6)
              return v6;
          }
          else
          {
            free(v5);
          }
          v5 = _nc_expand_try(*(_QWORD *)(SP + 168), v2, &v10, 0);
        }
        while (v5);
      }
    }
    else
    {
      v8 = _nc_expand_try(*(_QWORD *)(SP + 160), *(uint64_t *)&a1, &v10, 0);
      if (v8)
      {
        v9 = v8;
        do
        {
          if (_nc_remove_key((_QWORD *)(SP + 160), v2))
          {
            v6 = _nc_add_to_try((void **)(SP + 168), v9, v2);
            free(v9);
            v3 = 0;
            v10 = 0;
            if (v6)
              return v6;
          }
          else
          {
            free(v9);
          }
          v9 = _nc_expand_try(*(_QWORD *)(SP + 160), v2, &v10, 0);
        }
        while (v9);
      }
    }
  }
  return v3;
}

int use_legacy_coding(int a1)
{
  int result;

  result = -1;
  if (a1 <= 2)
  {
    if (SP)
    {
      result = *(_DWORD *)(SP + 1456);
      *(_DWORD *)(SP + 1456) = a1;
    }
  }
  return result;
}

void _nc_init_acs(void)
{
  chtype *v0;
  uint64_t v1;
  uint64_t i;
  int v3;
  __int128 v4;
  char **Strings;
  char *v6;
  const char *v7;
  const char *v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  const char *v14;
  const char *v15;
  uint64_t j;
  int v17;

  if (!SP || (v0 = *(chtype **)(SP + 1024), v0 == acs_map))
  {
    v3 = 0;
    xmmword_1EF614F50 = 0u;
    xmmword_1EF614D64 = 0u;
    xmmword_1EF614F34 = 0u;
    unk_1EF614F44 = 0u;
    xmmword_1EF614F14 = 0u;
    *(_OWORD *)&dword_1EF614F24 = 0u;
    xmmword_1EF614EF4 = 0u;
    unk_1EF614F04 = 0u;
    xmmword_1EF614ED4 = 0u;
    unk_1EF614EE4 = 0u;
    *(__int128 *)((char *)&xmmword_1EF614EB0 + 4) = 0u;
    *(_OWORD *)((char *)&qword_1EF614EC0 + 4) = 0u;
    xmmword_1EF614E94 = 0u;
    *(_OWORD *)&qword_1EF614EA4 = 0u;
    xmmword_1EF614E74 = 0u;
    unk_1EF614E84 = 0u;
    xmmword_1EF614E64 = 0u;
    unk_1EF614E54 = 0u;
    unk_1EF614E44 = 0u;
    unk_1EF614E34 = 0u;
    unk_1EF614E24 = 0u;
    unk_1EF614E14 = 0u;
    unk_1EF614E04 = 0u;
    unk_1EF614DF4 = 0u;
    unk_1EF614DE4 = 0u;
    unk_1EF614DD4 = 0u;
    unk_1EF614DC4 = 0u;
    unk_1EF614DB4 = 0u;
    unk_1EF614DA4 = 0u;
    unk_1EF614D94 = 0u;
    unk_1EF614D84 = 0u;
    unk_1EF614D74 = 0u;
    v0 = acs_map;
  }
  else
  {
    v1 = *(_QWORD *)(SP + 1032);
    for (i = 1; i != 128; ++i)
    {
      v0[i] = 0;
      acs_map[i] = i | 0x400000;
      *(_BYTE *)(v1 + i) = 0;
    }
    v3 = 1;
  }
  *(_QWORD *)&v4 = 0x2B0000002BLL;
  *((_QWORD *)&v4 + 1) = 0x2B0000002BLL;
  *(_OWORD *)(v0 + 106) = v4;
  *((_QWORD *)v0 + 48) = 0x3A0000002BLL;
  v0[126] = 111;
  *(_OWORD *)(v0 + 43) = xmmword_1C05E0F40;
  *(_OWORD *)(v0 + 102) = xmmword_1C05E0F50;
  v0[48] = 35;
  *(_OWORD *)(v0 + 110) = xmmword_1C05E0F60;
  *(_OWORD *)(v0 + 114) = xmmword_1C05E0F70;
  *(_OWORD *)(v0 + 118) = xmmword_1C05E0F80;
  *(_OWORD *)(v0 + 122) = xmmword_1C05E0F90;
  *(_QWORD *)(v0 + 77) = 0x2B0000002BLL;
  *((_OWORD *)v0 + 21) = v4;
  *(_QWORD *)(v0 + 81) = 0x2D0000002DLL;
  *(_OWORD *)(v0 + 69) = v4;
  *(_OWORD *)(v0 + 73) = v4;
  *((_QWORD *)v0 + 44) = 0x7C0000007CLL;
  *(_OWORD *)(v0 + 65) = v4;
  Strings = cur_term->type.Strings;
  v6 = Strings[155];
  if (v6)
  {
    _nc_putp((int)"ena_acs", v6);
    Strings = cur_term->type.Strings;
  }
  v7 = Strings[379];
  if (v7)
  {
    v8 = Strings[25];
    if (v8)
    {
      if (!strcmp(v7, v8))
      {
        v14 = Strings[380];
        if (v14)
        {
          v15 = Strings[38];
          if (v15)
          {
            if (!strcmp(v14, v15))
            {
              for (j = 1; j != 128; ++j)
              {
                if (!v0[j])
                {
                  v0[j] = j;
                  v17 = SP ? v3 : 0;
                  if (v17 == 1)
                    *(_BYTE *)(*(_QWORD *)(SP + 1032) + j) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  v9 = Strings[146];
  if (v9)
  {
    v10 = strlen(Strings[146]);
    if (v10 >= 2)
    {
      v11 = 0;
      v12 = SP;
      do
      {
        if (v9[v11] >= 1)
        {
          v0[v9[v11]] = v9[v11 + 1] | 0x400000;
          if (v12)
            *(_BYTE *)(*(_QWORD *)(v12 + 1032) + v9[v11]) = 1;
        }
        v13 = v11 + 3;
        v11 += 2;
      }
      while (v13 < v10);
    }
  }
}

uint64_t wadd_wch(WINDOW *a1, _OWORD *a2)
{
  uint64_t result;
  _OWORD v4[2];

  if (!a1)
    return 0xFFFFFFFFLL;
  v4[0] = *a2;
  *(_OWORD *)((char *)v4 + 12) = *(_OWORD *)((char *)a2 + 12);
  result = sub_1C05B58B4(a1, (uint64_t)v4);
  if ((_DWORD)result != -1)
  {
    _nc_synchook(a1);
    return 0;
  }
  return result;
}

uint64_t sub_1C05B58B4(WINDOW *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  int v6;
  int v7;
  int v8;
  int *v9;
  int *v10;
  _DWORD *v11;
  int v12;
  unsigned int v13;
  int v14;
  unsigned __int8 v15;
  int v16;
  unsigned int v17;
  int v18;
  _BYTE v19[28];

  if ((*(_BYTE *)(a2 + 2) & 0x40) != 0)
    goto LABEL_4;
  v4 = *(unsigned int *)(a2 + 4);
  if (v4 > 0x7F)
  {
    if (__maskrune(v4, 0x40000uLL))
      goto LABEL_4;
  }
  else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v4 + 60) & 0x40000) != 0)
  {
LABEL_4:
    *(_OWORD *)v19 = *(_OWORD *)a2;
    *(_OWORD *)&v19[12] = *(_OWORD *)(a2 + 12);
    return sub_1C05B5BE4((__int16 *)a1, (__int128 *)v19);
  }
  v6 = *((__int16 *)a1 + 1);
  v7 = *(__int16 *)a1;
  switch(*(_DWORD *)(a2 + 4))
  {
    case 8:
      if (!*((_WORD *)a1 + 1))
        return 0;
      LOWORD(v8) = v6 - 1;
      goto LABEL_35;
    case 9:
      v8 = (__int16)(TABSIZE + v6 / TABSIZE * TABSIZE);
      if ((*((_BYTE *)a1 + 27) || *((unsigned __int16 *)a1 + 25) != (unsigned __int16)v7) && v8 > *((__int16 *)a1 + 3))
      {
        wclrtoeol(a1);
        *((_WORD *)a1 + 6) |= 0x40u;
        if (v7 >= *((__int16 *)a1 + 24) && *((unsigned __int16 *)a1 + 25) == (unsigned __int16)v7)
        {
          if (*((_BYTE *)a1 + 27))
          {
            wscrl(a1, 1);
            LOWORD(v8) = 0;
          }
          else
          {
            LOWORD(v8) = *((_WORD *)a1 + 3);
          }
        }
        else
        {
          LOWORD(v8) = 0;
          LOWORD(v7) = v7 + 1;
        }
        goto LABEL_36;
      }
      v17 = *(_DWORD *)a2 & 0xFFFFFF00;
      do
      {
        if (*((__int16 *)a1 + 1) >= v8)
          goto LABEL_36;
        *(_DWORD *)v19 = v17;
        *(_QWORD *)&v19[20] = 0;
        *(_OWORD *)&v19[4] = *(__int128 *)((char *)&xmmword_1C05E0FA8 + 4);
        v18 = sub_1C05B5BE4((__int16 *)a1, (__int128 *)v19);
        result = 0xFFFFFFFFLL;
      }
      while (v18 != -1);
      return result;
    case 0xA:
      wclrtoeol(a1);
      if (v7 >= *((__int16 *)a1 + 24) && *((unsigned __int16 *)a1 + 25) == (unsigned __int16)v7)
      {
        if (!*((_BYTE *)a1 + 27))
          return 0xFFFFFFFFLL;
        wscrl(a1, 1);
      }
      else
      {
        LOWORD(v7) = v7 + 1;
      }
LABEL_34:
      LOWORD(v8) = 0;
LABEL_35:
      *((_WORD *)a1 + 6) &= ~0x40u;
LABEL_36:
      result = 0;
      *((_WORD *)a1 + 1) = v8;
      *(_WORD *)a1 = v7;
      return result;
    case 0xD:
      goto LABEL_34;
    default:
      v9 = wunctrl((int *)a2);
      if (!v9)
        return 0xFFFFFFFFLL;
      v10 = v9;
      v11 = (_DWORD *)_nc_abiver(&_nc_abiver);
      break;
  }
  while (1)
  {
    v12 = *v10;
    if (!*v10)
      break;
    v13 = *(_DWORD *)a2;
    if (*v11 < 0x60000u)
    {
      v14 = 0;
    }
    else
    {
      v14 = *(_DWORD *)(a2 + 24);
      if (!v14)
        v14 = BYTE1(v13);
      if (v14 >= 255)
        v15 = -1;
      else
        v15 = v14;
      v13 = v13 & 0xFFFF00FF | (v15 << 8);
    }
    ++v10;
    *(_DWORD *)v19 = v13;
    *(_DWORD *)&v19[4] = v12;
    *(_QWORD *)&v19[8] = 0;
    *(_QWORD *)&v19[16] = 0;
    *(_DWORD *)&v19[24] = v14;
    v16 = sub_1C05B5BE4((__int16 *)a1, (__int128 *)v19);
    result = 0xFFFFFFFFLL;
    if (v16 == -1)
      return result;
  }
  return 0;
}

uint64_t wecho_wchar(uint64_t a1, _OWORD *a2)
{
  uint64_t result;
  char v4;
  _OWORD v5[2];

  if (!a1)
    return 0xFFFFFFFFLL;
  v5[0] = *a2;
  *(_OWORD *)((char *)v5 + 12) = *(_OWORD *)((char *)a2 + 12);
  result = sub_1C05B58B4((WINDOW *)a1, (uint64_t)v5);
  if ((_DWORD)result != -1)
  {
    v4 = *(_BYTE *)(a1 + 30);
    *(_BYTE *)(a1 + 30) = 1;
    _nc_synchook((WINDOW *)a1);
    result = 0;
    *(_BYTE *)(a1 + 30) = v4;
  }
  return result;
}

uint64_t sub_1C05B5BE4(__int16 *a1, __int128 *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  int v8;
  __int32 v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  BOOL v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned __int8 v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _WORD *v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t result;
  uint64_t v38;
  _OWORD *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int *v46;
  char v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;

  v4 = a1[1];
  LODWORD(v5) = *a1;
  v6 = *a1;
  v7 = (__int128 *)((char *)a2 + 4);
  v56 = *(_QWORD *)((char *)a2 + 12);
  v57 = *((_DWORD *)a2 + 5);
  v14 = *(_DWORD *)_nc_abiver(&_nc_abiver);
  if (v13)
    v15 = v14 >= 0x60000;
  else
    v15 = 0;
  v16 = BYTE1(v12);
  if (v15)
    v16 = v13;
  if (v9 != 32 || v11 || v12 | v16)
  {
    v22 = *((_DWORD *)a1 + 22);
    if ((v8 & 0xFF00) != 0)
      v23 = -65536;
    else
      v23 = -256;
    v24 = v22 & v23 | v8;
    if (v16 || (v16 = *((_DWORD *)a1 + 29)) != 0 || (v16 = BYTE1(v8), BYTE1(v8)))
    {
      if ((v12 & 0xFF00) != 0)
        v25 = -65536;
      else
        v25 = -256;
      v18 = v24 & v25 | v12;
      if (v14 < 0x60000)
      {
LABEL_27:
        v21 = v18 & 0xFFFF0000 | v12 | (v16 << 8);
        v16 = v13;
        goto LABEL_45;
      }
    }
    else
    {
      v16 = BYTE1(v22);
      if (v14 < 0x60000)
      {
        if ((v12 & 0xFF00) != 0)
          v26 = -65536;
        else
          v26 = -256;
        v18 = v24 & v26 | v12;
        goto LABEL_27;
      }
      if (*((_DWORD *)a1 + 28))
        v16 = *((_DWORD *)a1 + 28);
      if ((v12 & 0xFF00) != 0)
        v27 = -65536;
      else
        v27 = -256;
      v18 = v24 & v27 | v12;
    }
    if (v16 >= 255)
      LOBYTE(v19) = -1;
    else
      LOBYTE(v19) = v16;
    goto LABEL_44;
  }
  v17 = *((_DWORD *)a1 + 22);
  v9 = *((_DWORD *)a1 + 23);
  v11 = *((_DWORD *)a1 + 24);
  v56 = *(_QWORD *)(a1 + 50);
  v16 = *((_DWORD *)a1 + 28);
  v57 = *((_DWORD *)a1 + 27);
  v18 = v17 | v8 & 0xFFFFFF00;
  v19 = *((_DWORD *)a1 + 29);
  if (!v19)
  {
    v19 = BYTE1(v8);
    if (!BYTE1(v8))
    {
      if (v14 >= 0x60000)
      {
        v19 = *((_DWORD *)a1 + 28);
        if (!v16)
          v19 = BYTE1(v17);
        goto LABEL_13;
      }
      LOBYTE(v19) = BYTE1(*((_DWORD *)a1 + 22));
LABEL_44:
      v21 = v18 & 0xFFFF00FF | (v19 << 8);
      goto LABEL_45;
    }
  }
  if (v14 < 0x60000)
    goto LABEL_44;
LABEL_13:
  if (v19 >= 255)
    v20 = -1;
  else
    v20 = v19;
  v21 = v17 & 0xFFFF00FF | v8 & 0xFFFF0000 | (v20 << 8);
  v16 = v19;
LABEL_45:
  *(_DWORD *)a2 = v21;
  *((_DWORD *)a2 + 1) = v9;
  *((_DWORD *)a2 + 2) = v11;
  *(_QWORD *)v10 = v56;
  *(_DWORD *)(v10 + 8) = v57;
  *((_DWORD *)a2 + 6) = v16;
  v28 = *((_QWORD *)a1 + 5);
  v29 = v28 + 16 * v6;
  v30 = (_WORD *)(v29 + 8);
  v31 = *(__int16 *)(v29 + 8);
  if (v31 == -1)
  {
    *(_WORD *)(v29 + 10) = v4;
LABEL_50:
    *v30 = v4;
    goto LABEL_51;
  }
  if (v4 < v31)
    goto LABEL_50;
  v32 = v28 + 16 * v6;
  v33 = *(__int16 *)(v32 + 10);
  v30 = (_WORD *)(v32 + 10);
  if (v4 > v33)
    goto LABEL_50;
LABEL_51:
  v34 = wcwidth(v9);
  if (!v34)
  {
    if (v4 < 1 || (v5 & 0x80000000) != 0)
    {
      if (a1[3] < 0 || *a1 <= 0)
        goto LABEL_92;
      v38 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * ((int)v5 - 1)) + 28 * (unsigned __int16)a1[3];
    }
    else
    {
      v38 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * v6) + 28 * (v4 - 1);
    }
    v41 = v38 + 4;
    v42 = 0;
    while (*(_DWORD *)(v41 + v42))
    {
      v42 += 4;
      if (v42 == 20)
        goto LABEL_92;
    }
    *(_DWORD *)(v41 + v42) = *(_DWORD *)v7;
    goto LABEL_92;
  }
  v35 = v34;
  if (v34 < 2)
  {
    v39 = (_OWORD *)(*(_QWORD *)v29 + 28 * v4);
    v40 = *a2;
    *(_OWORD *)((char *)v39 + 12) = *(__int128 *)((char *)a2 + 12);
    *v39 = v40;
    ++v4;
LABEL_92:
    if (v4 > a1[3])
      return sub_1C05B6148((WINDOW *)a1);
    result = 0;
    a1[1] = v4;
    return result;
  }
  v36 = a1[3] + 1;
  if (v34 > v36)
    return 0xFFFFFFFFLL;
  if (v34 + v4 <= v36)
    goto LABEL_69;
  sub_1C05B60C8(a1, v36 - v4);
  result = sub_1C05B6148((WINDOW *)a1);
  if ((_DWORD)result != -1)
  {
    v4 = a1[1];
    v5 = *a1;
    v29 = *((_QWORD *)a1 + 5) + 16 * v5;
LABEL_69:
    v43 = 0;
    v44 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * (int)v5);
    v45 = v4;
    v46 = (int *)(v44 + 28 * v4);
    while (1)
    {
      v48 = *v46;
      v46 += 7;
      v47 = v48;
      v49 = v48;
      if ((_BYTE)v48)
      {
        if (v49 == 1)
          goto LABEL_83;
        if ((v47 & 0xE0) == 0)
          break;
      }
      if (v35 == ++v43)
        goto LABEL_83;
    }
    if (v4 + (int)v43 <= a1[3])
    {
      while ((*(_DWORD *)(v44 + 28 * (v4 + (int)v43)) & 0xFEu) - 2 < 0x1E)
      {
        ++v43;
        if (v4 + v43 > a1[3])
          goto LABEL_83;
      }
      sub_1C05B60C8(a1, v43);
    }
LABEL_83:
    v50 = 0;
    v51 = 28 * v4;
    while (1)
    {
      v52 = *v7;
      v53 = *((_QWORD *)v7 + 2);
      ++v50;
      v54 = *(_QWORD *)v29 + v51;
      *(_DWORD *)v54 = *(_DWORD *)a2 & 0xFFFFFF00 | v50;
      *(_QWORD *)(v54 + 20) = v53;
      *(_OWORD *)(v54 + 4) = v52;
      v55 = *(__int16 *)(v29 + 8);
      if (v55 == -1)
      {
        *(_WORD *)(v29 + 10) = v45;
      }
      else if (v45 >= v55)
      {
        if (v45 > *(__int16 *)(v29 + 10))
          *(_WORD *)(v29 + 10) = v45;
        goto LABEL_90;
      }
      *(_WORD *)(v29 + 8) = v45;
LABEL_90:
      ++v45;
      v51 += 28;
      if ((_DWORD)v35 == v50)
      {
        v4 = v45;
        goto LABEL_92;
      }
    }
  }
  return result;
}

_WORD *sub_1C05B60C8(_WORD *result, int a2)
{
  _WORD *v2;
  __int16 v3;
  __int16 v4;
  int v5;
  _OWORD v6[2];

  v2 = result;
  v3 = result[1];
  v4 = *result;
  v5 = a2 + 1;
  do
  {
    if (--v5 < 1)
      break;
    v6[0] = xmmword_1C05E0FA8;
    *(_OWORD *)((char *)v6 + 12) = *(__int128 *)((char *)&xmmword_1C05E0FA8 + 12);
    result = (_WORD *)sub_1C05B5BE4(v2, v6);
  }
  while ((_DWORD)result != -1);
  v2[1] = v3;
  *v2 = v4;
  return result;
}

uint64_t sub_1C05B6148(WINDOW *a1)
{
  int v2;
  uint64_t result;

  *((_WORD *)a1 + 6) |= 0x40u;
  v2 = *(__int16 *)a1;
  if (v2 < *((__int16 *)a1 + 24) || *((unsigned __int16 *)a1 + 25) != (unsigned __int16)v2)
  {
    *(_WORD *)a1 = v2 + 1;
    goto LABEL_6;
  }
  *((_WORD *)a1 + 1) = *((_WORD *)a1 + 3);
  if (*((_BYTE *)a1 + 27))
  {
    wscrl(a1, 1);
LABEL_6:
    result = 0;
    *((_WORD *)a1 + 1) = 0;
    return result;
  }
  return 0xFFFFFFFFLL;
}

double _nc_render()
{
  double result;

  *(_QWORD *)&result = sub_1C05B61F4().n128_u64[0];
  return result;
}

__n128 sub_1C05B61F4()
{
  unsigned int *v0;
  unsigned __int8 *v1;
  _OWORD *v2;
  uint64_t v3;
  int v4;
  int v5;
  __int128 v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned __int8 v16;
  __n128 result;

  v0 = (unsigned int *)_nc_abiver(&_nc_abiver);
  if (*v0 < 0x60000 || (v5 = *((_DWORD *)v1 + 6)) == 0)
    v5 = v1[1];
  if (*((_DWORD *)v1 + 1) != 32 || *((_DWORD *)v1 + 2) || *(_DWORD *)v1 | v5)
  {
    v9 = *(_DWORD *)(v3 + 88);
    if ((v4 & 0xFF00) != 0)
      v10 = -65536;
    else
      v10 = -256;
    v11 = v9 & v10 | v4;
    if (!v5)
    {
      v5 = *(_DWORD *)(v3 + 116);
      if (!v5)
      {
        v5 = BYTE1(v4);
        if (!BYTE1(v4))
        {
          if (*v0 <= 0x5FFFF)
          {
            v5 = BYTE1(v9);
          }
          else
          {
            v12 = *(_DWORD *)(v3 + 112);
            if (v12)
              v5 = v12;
            else
              v5 = BYTE1(v9);
          }
        }
      }
    }
    v14 = *(_DWORD *)v1;
    if ((*(_DWORD *)v1 & 0xFF00) != 0)
      v15 = -65536;
    else
      v15 = -256;
    v7 = v15 & v11 | v14;
    *(_DWORD *)v1 = v7;
    if (*v0 <= 0x5FFFF)
    {
      v13 = v14 | (v5 << 8) | v7 & 0xFFFF0000;
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  v6 = *(_OWORD *)(v3 + 88);
  *(_OWORD *)(v1 + 12) = *(_OWORD *)(v3 + 100);
  *(_OWORD *)v1 = v6;
  v7 = (*(_DWORD *)(v3 + 88) | v4) & 0xFFFFFF00 | *v1;
  *(_DWORD *)v1 = v7;
  v5 = *(_DWORD *)(v3 + 116);
  if (v5)
  {
    v8 = *v0;
    goto LABEL_20;
  }
  v5 = *(unsigned __int8 *)(v3 + 17);
  v8 = *v0;
  if (*(_BYTE *)(v3 + 17))
  {
LABEL_20:
    if (v8 <= 0x5FFFF)
    {
LABEL_21:
      v13 = v7 & 0xFFFF00FF | (v5 << 8);
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  if (v8 <= 0x5FFFF)
  {
    LOBYTE(v5) = *(_BYTE *)(v3 + 89);
    goto LABEL_21;
  }
  v5 = *(_DWORD *)(v3 + 112);
  if (!v5)
    v5 = *(unsigned __int8 *)(v3 + 89);
LABEL_27:
  *((_DWORD *)v1 + 6) = v5;
  if (v5 >= 255)
    v16 = -1;
  else
    v16 = v5;
  v13 = v7 & 0xFFFF00FF | (v16 << 8);
LABEL_32:
  *(_DWORD *)v1 = v13;
  *(_OWORD *)((char *)v2 + 12) = *(_OWORD *)(v1 + 12);
  result = *(__n128 *)v1;
  *v2 = *(_OWORD *)v1;
  return result;
}

size_t _nc_build_wch(__int16 *a1, uint64_t a2)
{
  const char *v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  size_t v9;
  size_t v10;
  unsigned int *v11;
  int v12;
  unsigned int v13;
  int v14;
  __int32 v15;
  unsigned int v16;
  unsigned __int8 v17;
  __int32 v19;
  mbstate_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (const char *)(a1 + 60);
  v5 = a1[1];
  v6 = *a1;
  v7 = *((_DWORD *)a1 + 44);
  if (v7 && (*((_DWORD *)a1 + 45) != v5 || *((_DWORD *)a1 + 46) != v6))
  {
    v7 = 0;
    *((_DWORD *)a1 + 44) = 0;
  }
  v19 = 0;
  *((_DWORD *)a1 + 45) = v5;
  *((_DWORD *)a1 + 46) = v6;
  memset(&v20, 0, sizeof(v20));
  v4[v7] = *(_DWORD *)(a2 + 4);
  v8 = *((_DWORD *)a1 + 44) + 1;
  *((_DWORD *)a1 + 44) = v8;
  v4[v8] = 0;
  v9 = mbrtowc(&v19, v4, *((unsigned int *)a1 + 44), &v20);
  v10 = v9;
  if ((int)v9 >= 1)
  {
    v11 = (unsigned int *)_nc_abiver(&_nc_abiver);
    if (*v11 < 0x60000)
    {
      v14 = 0;
    }
    else
    {
      v14 = *(_DWORD *)(a2 + 24);
      if (!v14)
        v14 = BYTE1(v12);
    }
    *(_DWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)a2 = 0;
    v15 = v19;
    *(_DWORD *)a2 = v12;
    *(_DWORD *)(a2 + 4) = v15;
    if (*v11 > v13)
    {
      *(_DWORD *)(a2 + 24) = BYTE1(v12);
      *(_DWORD *)a2 = v12 & 0xFFFF00FF | (BYTE1(v12) << 8);
      if (*v11 > v13)
      {
        v16 = v12 & 0xFFFF00FF;
        *(_DWORD *)(a2 + 24) = v14;
        if (v14 >= 255)
          v17 = -1;
        else
          v17 = v14;
        *(_DWORD *)a2 = v16 | (v17 << 8);
      }
    }
    goto LABEL_19;
  }
  if ((_DWORD)v9 == -1)
LABEL_19:
    *((_DWORD *)a1 + 44) = 0;
  return v10;
}

uint64_t _nc_waddch_nosync(__int16 *a1, _OWORD *a2)
{
  _OWORD v3[2];

  v3[0] = *a2;
  *(_OWORD *)((char *)v3 + 12) = *(_OWORD *)((char *)a2 + 12);
  return sub_1C05B6538(a1, (uint64_t)v3);
}

uint64_t sub_1C05B6538(__int16 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t result;
  _DWORD *v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned __int8 v18;
  int v19;
  unsigned int v20;
  int v21;
  _BYTE v22[28];

  v4 = *(unsigned int *)(a2 + 4);
  v5 = _nc_screen_of((uint64_t)a1);
  v6 = unctrl(v4);
  if ((*(_BYTE *)(a2 + 2) & 0x40) != 0)
    goto LABEL_18;
  v7 = v6;
  if (v5)
  {
    if (*(_DWORD *)(v5 + 1456) && !v6[1])
      goto LABEL_18;
  }
  if (v4 > 0x7F)
  {
    if (__maskrune(v4, 0x40000uLL) && !__maskrune(v4, 0x200uLL))
      goto LABEL_18;
  }
  else
  {
    v8 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v4 + 60);
    if ((v8 & 0x40000) != 0 && (v8 & 0x200) == 0)
    {
LABEL_18:
      *(_OWORD *)v22 = *(_OWORD *)a2;
      *(_OWORD *)&v22[12] = *(_OWORD *)(a2 + 12);
      return sub_1C05B6994(a1, (uint64_t)v22);
    }
  }
  if ((!v5 || !*(_DWORD *)(v5 + 1456)) && (*((_DWORD *)a1 + 44) || !_nc_is_charable(*(_DWORD *)(a2 + 4))))
    goto LABEL_18;
  v9 = v4 - 8;
  v10 = a1[1];
  v11 = *a1;
  switch(v9)
  {
    case 0:
      if (!a1[1])
        return 0;
      LOWORD(v12) = v10 - 1;
      goto LABEL_45;
    case 1:
      v12 = (__int16)(TABSIZE + v10 / TABSIZE * TABSIZE);
      if ((*((_BYTE *)a1 + 27) || (unsigned __int16)a1[25] != (unsigned __int16)v11) && v12 > a1[3])
      {
        wclrtoeol((WINDOW *)a1);
        a1[6] |= 0x40u;
        if (v11 >= a1[24] && (unsigned __int16)a1[25] == (unsigned __int16)v11)
        {
          if (*((_BYTE *)a1 + 27))
          {
            wscrl((WINDOW *)a1, 1);
            LOWORD(v12) = 0;
          }
          else
          {
            LOWORD(v12) = a1[3];
          }
        }
        else
        {
          LOWORD(v12) = 0;
          LOWORD(v11) = v11 + 1;
        }
        goto LABEL_46;
      }
      v20 = *(_DWORD *)a2 & 0xFFFFFF00;
      do
      {
        if (a1[1] >= v12)
          goto LABEL_46;
        *(_DWORD *)v22 = v20;
        *(_QWORD *)&v22[20] = 0;
        *(_OWORD *)&v22[4] = *(__int128 *)((char *)&xmmword_1C05E0FCC + 4);
        v21 = sub_1C05B6994(a1, (uint64_t)v22);
        result = 0xFFFFFFFFLL;
      }
      while (v21 != -1);
      return result;
    case 2:
      wclrtoeol((WINDOW *)a1);
      if (v11 >= a1[24] && (unsigned __int16)a1[25] == (unsigned __int16)v11)
      {
        if (!*((_BYTE *)a1 + 27))
          return 0xFFFFFFFFLL;
        wscrl((WINDOW *)a1, 1);
      }
      else
      {
        LOWORD(v11) = v11 + 1;
      }
LABEL_44:
      LOWORD(v12) = 0;
LABEL_45:
      a1[6] &= ~0x40u;
LABEL_46:
      result = 0;
      a1[1] = v12;
      *a1 = v11;
      return result;
    case 5:
      goto LABEL_44;
    default:
      v14 = (_DWORD *)_nc_abiver(&_nc_abiver);
      break;
  }
  while (1)
  {
    v15 = *v7;
    if (!*v7)
      break;
    v16 = *(_DWORD *)a2;
    if (*v14 < 0x60000u)
    {
      v17 = 0;
    }
    else
    {
      v17 = *(_DWORD *)(a2 + 24);
      if (!v17)
        v17 = BYTE1(v16);
      if (v17 >= 255)
        v18 = -1;
      else
        v18 = v17;
      v16 = v16 & 0xFFFF00FF | (v18 << 8);
    }
    ++v7;
    *(_DWORD *)v22 = v16;
    *(_DWORD *)&v22[4] = v15;
    *(_QWORD *)&v22[8] = 0;
    *(_QWORD *)&v22[16] = 0;
    *(_DWORD *)&v22[24] = v17;
    v19 = sub_1C05B6994(a1, (uint64_t)v22);
    result = 0xFFFFFFFFLL;
    if (v19 == -1)
      return result;
  }
  return 0;
}

int waddch(WINDOW *a1, const chtype a2)
{
  int v3;
  int v4;
  unsigned int v5;
  int result;
  _DWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  int v10;

  if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
  {
    v4 = BYTE1(v3);
    v5 = v3 & 0xFFFF0000 | (BYTE1(v3) << 8);
    if (a1)
      goto LABEL_3;
    return -1;
  }
  v4 = 0;
  v5 = v3 & 0xFFFFFF00;
  if (!a1)
    return -1;
LABEL_3:
  v7[0] = v5;
  v7[1] = v3;
  v9 = 0;
  v8 = 0;
  v10 = v4;
  result = sub_1C05B6538((__int16 *)a1, (uint64_t)v7);
  if (result != -1)
  {
    _nc_synchook(a1);
    return 0;
  }
  return result;
}

int wechochar(WINDOW *a1, const chtype a2)
{
  int v3;
  int v4;
  unsigned int v5;
  int result;
  char v7;
  _DWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  int v11;

  if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
  {
    v4 = BYTE1(v3);
    v5 = v3 & 0xFFFF0000 | (BYTE1(v3) << 8);
    if (a1)
      goto LABEL_3;
    return -1;
  }
  v4 = 0;
  v5 = v3 & 0xFFFFFF00;
  if (!a1)
    return -1;
LABEL_3:
  v8[0] = v5;
  v8[1] = v3;
  v10 = 0;
  v9 = 0;
  v11 = v4;
  result = sub_1C05B6538((__int16 *)a1, (uint64_t)v8);
  if (result != -1)
  {
    v7 = *((_BYTE *)a1 + 30);
    *((_BYTE *)a1 + 30) = 1;
    _nc_synchook(a1);
    result = 0;
    *((_BYTE *)a1 + 30) = v7;
  }
  return result;
}

uint64_t sub_1C05B6994(__int16 *a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _WORD *v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t result;
  chtype v18;
  int v19;
  char *v20;
  int v21;
  unsigned __int8 *v22;
  int v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  char v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[28];

  v4 = a1[1];
  v5 = *a1;
  sub_1C05B61F4();
  *(_OWORD *)a2 = *(_OWORD *)v42;
  *(_OWORD *)(a2 + 12) = *(_OWORD *)&v42[12];
  v6 = *((_QWORD *)a1 + 5);
  v7 = v6 + 16 * v5;
  v8 = (_WORD *)(v7 + 8);
  v9 = *(__int16 *)(v7 + 8);
  if (v9 == -1)
  {
    *(_WORD *)(v7 + 10) = v4;
  }
  else if (v4 >= v9)
  {
    v10 = v6 + 16 * v5;
    v11 = *(__int16 *)(v10 + 10);
    v8 = (_WORD *)(v10 + 10);
    if (v4 <= v11)
      goto LABEL_7;
  }
  *v8 = v4;
LABEL_7:
  if (*((_DWORD *)a1 + 44)
    || !*(_DWORD *)(SP + 1456) && (*(_DWORD *)a2 & 0x400000) == 0 && (*(_DWORD *)a2 & 0xFEu) - 2 < 0x1E
    || *(_DWORD *)(a2 + 8)
    || !_nc_is_charable(*(_DWORD *)(a2 + 4)))
  {
    v12 = _nc_build_wch(a1, a2);
    if (v12 >= -1)
    {
      if (v12 != -1)
        goto LABEL_15;
      v19 = *(_DWORD *)a2;
      v18 = *(_DWORD *)(a2 + 4);
      if (v18 > 0xFF)
        return waddch((WINDOW *)a1, v19 | 0x20);
      v20 = unctrl(v18);
      if (!v20[1])
        return waddch((WINDOW *)a1, v19 | 0x20);
      v21 = *v20;
      if (*v20)
      {
        v22 = (unsigned __int8 *)(v20 + 1);
        while (1)
        {
          result = waddch((WINDOW *)a1, v19 | v21);
          if ((_DWORD)result)
            break;
          v23 = *v22++;
          v21 = v23;
          if (!v23)
            return result;
        }
        return 0xFFFFFFFFLL;
      }
    }
    return 0;
  }
LABEL_15:
  v13 = (_DWORD *)(a2 + 4);
  v14 = wcwidth(*(_DWORD *)(a2 + 4));
  if (!v14)
  {
    if (v4 < 1 || (v5 & 0x80000000) != 0)
    {
      if (a1[3] < 0 || *a1 <= 0)
        goto LABEL_57;
      v24 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * ((int)v5 - 1)) + 28 * (unsigned __int16)a1[3];
    }
    else
    {
      v24 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * v5) + 28 * (v4 - 1);
    }
    v27 = v24 + 4;
    v28 = 0;
    while (*(_DWORD *)(v27 + v28))
    {
      v28 += 4;
      if (v28 == 20)
        goto LABEL_57;
    }
    *(_DWORD *)(v27 + v28) = *v13;
    goto LABEL_57;
  }
  v15 = v14;
  if (v14 < 2)
  {
    v25 = (_OWORD *)(*(_QWORD *)v7 + 28 * v4);
    v26 = *(_OWORD *)a2;
    *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)(a2 + 12);
    *v25 = v26;
    ++v4;
LABEL_57:
    if (v4 > a1[3])
      return sub_1C05B6148((WINDOW *)a1);
    result = 0;
    a1[1] = v4;
    return result;
  }
  v16 = a1[3] + 1;
  if (v14 > v16)
    return 0xFFFFFFFFLL;
  if (v14 + v4 <= v16)
    goto LABEL_42;
  sub_1C05B6D7C(a1, v16 - v4);
  result = sub_1C05B6148((WINDOW *)a1);
  if ((_DWORD)result != -1)
  {
    v4 = a1[1];
    v5 = *a1;
    v7 = *((_QWORD *)a1 + 5) + 16 * v5;
LABEL_42:
    v29 = 0;
    v30 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * (int)v5);
    v31 = v4;
    v32 = (int *)(v30 + 28 * v4);
    while (1)
    {
      v34 = *v32;
      v32 += 7;
      v33 = v34;
      v35 = v34;
      if ((_BYTE)v34)
      {
        if (v35 == 1)
          goto LABEL_47;
        if ((v33 & 0xE0) == 0)
          break;
      }
      if (v15 == ++v29)
        goto LABEL_47;
    }
    if (v4 + (int)v29 <= a1[3])
    {
      while ((*(_DWORD *)(v30 + 28 * (v4 + (int)v29)) & 0xFEu) - 2 < 0x1E)
      {
        ++v29;
        if (v4 + v29 > a1[3])
          goto LABEL_47;
      }
      sub_1C05B6D7C(a1, v29);
    }
LABEL_47:
    v36 = 0;
    v37 = 28 * v4;
    while (1)
    {
      v38 = *(_OWORD *)v13;
      v39 = *(_QWORD *)(a2 + 20);
      ++v36;
      v40 = *(_QWORD *)v7 + v37;
      *(_DWORD *)v40 = *(_DWORD *)a2 & 0xFFFFFF00 | v36;
      *(_QWORD *)(v40 + 20) = v39;
      *(_OWORD *)(v40 + 4) = v38;
      v41 = *(__int16 *)(v7 + 8);
      if (v41 == -1)
      {
        *(_WORD *)(v7 + 10) = v31;
      }
      else if (v31 >= v41)
      {
        if (v31 > *(__int16 *)(v7 + 10))
          *(_WORD *)(v7 + 10) = v31;
        goto LABEL_54;
      }
      *(_WORD *)(v7 + 8) = v31;
LABEL_54:
      ++v31;
      v37 += 28;
      if ((_DWORD)v15 == v36)
      {
        v4 = v31;
        goto LABEL_57;
      }
    }
  }
  return result;
}

_WORD *sub_1C05B6D7C(_WORD *result, int a2)
{
  _WORD *v2;
  __int16 v3;
  __int16 v4;
  int v5;
  _OWORD v6[2];

  v2 = result;
  v3 = result[1];
  v4 = *result;
  v5 = a2 + 1;
  do
  {
    if (--v5 < 1)
      break;
    v6[0] = xmmword_1C05E0FCC;
    *(_OWORD *)((char *)v6 + 12) = *(__int128 *)((char *)&xmmword_1C05E0FCC + 12);
    result = (_WORD *)sub_1C05B6994(v2, v6);
  }
  while ((_DWORD)result != -1);
  v2[1] = v3;
  *v2 = v4;
  return result;
}

int waddnstr(WINDOW *a1, const char *a2, int a3)
{
  int v3;
  const char *v4;
  int v5;
  BOOL v7;
  int v8;
  __int128 v10;
  uint64_t v11;
  int v12;

  v3 = -1;
  if (a1)
  {
    v4 = a2;
    if (a2)
    {
      v5 = a3;
      if (a3 < 0)
        v5 = strlen(a2);
      while (1)
      {
        v7 = __OFSUB__(v5, 1);
        if (--v5 < 0 != v7)
          break;
        v8 = *(unsigned __int8 *)v4;
        if (!*v4)
          break;
        ++v4;
        *((_QWORD *)&v10 + 1) = 0;
        v11 = 0;
        LODWORD(v10) = 0;
        DWORD1(v10) = v8;
        v12 = 0;
        if (_nc_waddch_nosync((__int16 *)a1, &v10) == -1)
        {
          v3 = -1;
          goto LABEL_10;
        }
      }
      v3 = 0;
LABEL_10:
      _nc_synchook(a1);
    }
  }
  return v3;
}

int waddchnstr(WINDOW *a1, const chtype *a2, int a3)
{
  WINDOW *v3;
  uint64_t v4;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _WORD *v19;
  int v20;
  int v21;
  uint64_t v23;
  _WORD *v24;
  int v25;
  int v26;
  int v27;

  if (!a1)
    return -1;
  v3 = a1;
  LODWORD(v4) = *((__int16 *)a1 + 1);
  if (a3 < 0)
  {
    if (*a2)
    {
      *(_QWORD *)&a3 = 0;
      while (a2[++*(_QWORD *)&a3])
        ;
    }
    else
    {
      a3 = 0;
    }
  }
  v7 = *((__int16 *)a1 + 3) - (_DWORD)v4;
  if (a3 >= v7 + 1)
    LODWORD(v8) = v7 + 1;
  else
    LODWORD(v8) = a3;
  if ((_DWORD)v8)
  {
    v9 = *(__int16 *)a1;
    v10 = *((_QWORD *)a1 + 5);
    v11 = v10 + 16 * v9;
    if ((int)v8 >= 1)
    {
      v12 = (_DWORD *)_nc_abiver(&_nc_abiver);
      v14 = 28 * v4;
      v15 = v8;
      do
      {
        if (!*v13)
          break;
        v16 = *(_QWORD *)v11 + v14;
        *(_QWORD *)v16 = 0;
        *(_QWORD *)(v16 + 8) = 0;
        *(_DWORD *)(v16 + 24) = 0;
        *(_QWORD *)(v16 + 16) = 0;
        *(_DWORD *)(v16 + 4) = *v13;
        *(_DWORD *)v16 = *(_DWORD *)v13 & 0xFFFFFF00;
        if (*v12 >= 0x60000u)
        {
          v17 = *(_DWORD *)v13 >> 8;
          v18 = *(_QWORD *)v11 + v14;
          *(_DWORD *)(v18 + 24) = BYTE1(*(_DWORD *)v13);
          *(_BYTE *)(v18 + 1) = v17;
        }
        v14 += 28;
        v13 += 4;
        --v15;
      }
      while (v15);
    }
    v21 = *(__int16 *)(v11 + 8);
    v19 = (_WORD *)(v11 + 8);
    v20 = v21;
    if (v21 == -1 || v20 > (int)v4)
      *v19 = v4;
    v23 = v10 + 16 * v9;
    v26 = *(__int16 *)(v23 + 10);
    v24 = (_WORD *)(v23 + 10);
    v25 = v26;
    v27 = (__int16)(v4 + v8 - 1);
    if (v26 == -1 || v25 < v27)
      *v24 = v27;
    _nc_synchook(v3);
  }
  return 0;
}

uint64_t _nc_wchstrlen(uint64_t result)
{
  int *v1;
  int v2;

  if (result)
  {
    v1 = (int *)(result + 4);
    LODWORD(result) = -1;
    do
    {
      v2 = *v1;
      v1 += 7;
      result = (result + 1);
    }
    while (v2);
  }
  return result;
}

uint64_t wadd_wchnstr(WINDOW *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  WINDOW *v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _DWORD *v17;
  __int32 v18;
  int v19;
  int v20;
  int v21;
  WINDOW *v22;
  uint64_t v23;
  _OWORD *v24;
  WINDOW *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  __int128 *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _WORD *v36;
  int v37;
  int v38;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[28];

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = a2;
  v4 = a1;
  v5 = *((unsigned __int16 *)a1 + 1);
  LOWORD(v6) = *((_WORD *)a1 + 1);
  if (a3 < 0)
  {
    if (a2)
    {
      v7 = (int *)(a2 + 4);
      a3 = -1;
      do
      {
        v8 = *v7;
        v7 += 7;
        ++a3;
      }
      while (v8);
    }
    else
    {
      a3 = 0;
    }
  }
  v10 = *((__int16 *)a1 + 3) - (__int16)v5;
  if (a3 >= v10 + 1)
    v11 = (v10 + 1);
  else
    v11 = a3;
  if ((_DWORD)v11)
  {
    v44 = *((_QWORD *)a1 + 5);
    v45 = *(__int16 *)a1;
    v12 = (uint64_t *)(v44 + 16 * v45);
    v13 = (__int16)v5 + (_DWORD)v11 - 1;
    if ((__int16)v5 < 1 || (*(_DWORD *)(*v12 + 28 * *((unsigned __int16 *)a1 + 1)) & 0xFEu) - 32 < 0xFFFFFFE2)
    {
LABEL_18:
      v43 = (__int16)v5;
    }
    else
    {
      v14 = 0;
      v15 = 28 * v5;
      while ((*(_DWORD *)(*v12 + v15) & 0xFEu) - 2 < 0x1E)
      {
        ++v14;
        v15 -= 28;
        if ((__int16)v5 + 1 == v14)
          goto LABEL_18;
      }
      v43 = v5 - v14;
      if (v14)
      {
        v40 = v11;
        v41 = v14 + 1;
        do
        {
          v42 = (_OWORD *)(*v12 + v15);
          _nc_render();
          *(_OWORD *)((char *)v42 + 12) = *(_OWORD *)&v46[12];
          *v42 = *(_OWORD *)v46;
          --v41;
          v15 += 28;
        }
        while (v41 > 1);
        v11 = v40;
      }
    }
    if ((int)v11 >= 1)
    {
      for (i = 0; i != v11; ++i)
      {
        v17 = (_DWORD *)(v3 + 28 * i);
        v18 = v17[1];
        if (!v18 || (__int16)v6 > *((__int16 *)v4 + 3))
          break;
        if ((*v17 & 0xFEu) - 2 >= 0x1E)
        {
          v19 = wcwidth(v18);
          v20 = v19 + (__int16)v6;
          if (v20 - 1 > *((__int16 *)v4 + 3))
            break;
          v21 = v19;
          v6 = (__int16)v6;
          v22 = v4;
          v23 = v3;
          v24 = (_OWORD *)(*v12 + 28 * (__int16)v6);
          v25 = v22;
          _nc_render();
          *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)&v46[12];
          *v24 = *(_OWORD *)v46;
          v3 = v23;
          if (v21 >= 2)
          {
            v26 = 0;
            v27 = *v12;
            v28 = 28 * v6;
            do
            {
              if (v26)
              {
                v29 = (_OWORD *)(v27 + v28);
                v30 = (__int128 *)(v27 + 28 * (int)v6);
                v31 = *v30;
                *(_OWORD *)((char *)v29 + 12) = *(__int128 *)((char *)v30 + 12);
                *v29 = v31;
                v27 = *v12;
              }
              *(_DWORD *)(v27 + v28) = *(_DWORD *)(v27 + v28) & 0xFFFFFF00 | ++v26;
              v28 += 28;
            }
            while (v21 != v26);
          }
          v13 = v13 + v21 - 1;
          LOWORD(v6) = v20;
          v4 = v25;
        }
      }
    }
    while ((int)v6 <= *((__int16 *)v4 + 3))
    {
      v32 = *v12 + 28 * (__int16)v6;
      if ((*(_DWORD *)v32 & 0xFEu) - 2 > 0x1D)
        break;
      _nc_render();
      *(_OWORD *)(v32 + 12) = *(_OWORD *)&v46[12];
      *(_OWORD *)v32 = *(_OWORD *)v46;
      ++v13;
      LODWORD(v6) = (__int16)(v6 + 1);
    }
    v33 = v44 + 16 * v45;
    v34 = *(__int16 *)(v33 + 8);
    if (v34 == -1 || v43 < v34)
      *(_WORD *)(v33 + 8) = v43;
    v38 = *(__int16 *)(v33 + 10);
    v36 = (_WORD *)(v33 + 10);
    v37 = v38;
    if (v38 == -1 || v13 > v37)
      *v36 = v13;
    _nc_synchook(v4);
  }
  return 0;
}

uint64_t waddnwstr(WINDOW *a1, __int32 *a2, int a3)
{
  uint64_t v3;
  __int32 *v4;
  int v5;
  BOOL v7;
  __int32 v8;
  __int128 v10;
  uint64_t v11;
  int v12;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    v4 = a2;
    if (a2)
    {
      v5 = a3;
      if (a3 < 0)
        v5 = wcslen(a2);
      while (1)
      {
        v7 = __OFSUB__(v5, 1);
        if (--v5 < 0 != v7)
          break;
        v8 = *v4;
        if (!*v4)
          break;
        ++v4;
        *((_QWORD *)&v10 + 1) = 0;
        v11 = 0;
        v12 = 0;
        LODWORD(v10) = 0;
        DWORD1(v10) = v8;
        if (wadd_wch(a1, &v10) == -1)
        {
          v3 = 0xFFFFFFFFLL;
          goto LABEL_10;
        }
      }
      v3 = 0;
LABEL_10:
      _nc_synchook(a1);
    }
  }
  return v3;
}

uint64_t _nc_baudrate(int a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = dword_1EF614BEC;
  if (dword_1EF614BE8 != a1 || dword_1EF614BEC == -1)
  {
    if (a1 < 0)
    {
LABEL_10:
      v1 = 0xFFFFFFFFLL;
    }
    else
    {
      v3 = 0;
      while (word_1C05E1004[v3] != a1)
      {
        v3 += 4;
        if (v3 == 72)
          goto LABEL_10;
      }
      v1 = *(unsigned int *)&word_1C05E1004[v3 + 2];
    }
    if (dword_1EF614BE8 != a1)
    {
      dword_1EF614BE8 = a1;
      dword_1EF614BEC = v1;
    }
  }
  return v1;
}

uint64_t _nc_ospeed(int a1)
{
  uint64_t v1;

  if (a1 < 0)
    return 1;
  v1 = 0;
  while (*(_DWORD *)&word_1C05E1004[v1 + 2] != a1)
  {
    v1 += 4;
    if (v1 == 72)
      return 1;
  }
  return word_1C05E1004[v1];
}

uint64_t addch_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = addch(v2);
  *v0 = v1;
  return result;
}

uint64_t addchnstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  const chtype *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = addchnstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t addchstr_NCURSES60()
{
  int *v0;
  int v1;
  const chtype *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = addchstr(v2);
  *v0 = v1;
  return result;
}

uint64_t addnstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  const char *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = addnstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t addstr_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = addstr(v2);
  *v0 = v1;
  return result;
}

uint64_t attroff_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = attroff(v2);
  *v0 = v1;
  return result;
}

uint64_t attron_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = attron(v2);
  *v0 = v1;
  return result;
}

uint64_t attrset_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = attrset(v2);
  *v0 = v1;
  return result;
}

uint64_t attr_get_NCURSES60()
{
  int *v0;
  int v1;
  __int16 *v2;
  void *v3;
  attr_t *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = attr_get(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t attr_off_NCURSES60()
{
  int *v0;
  int v1;
  void *v2;
  attr_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = attr_off(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t attr_on_NCURSES60()
{
  int *v0;
  int v1;
  void *v2;
  attr_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = attr_on(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t attr_set_NCURSES60()
{
  int *v0;
  int v1;
  __int16 v2;
  void *v3;
  attr_t v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = attr_set(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t bkgd_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = bkgd(v2);
  *v0 = v1;
  return result;
}

void bkgdset_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  bkgdset(v2);
  *v0 = v1;
}

uint64_t border_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  chtype v3;
  chtype v4;
  chtype v5;
  chtype v6;
  chtype v7;
  chtype v8;
  chtype v9;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = border(v9, v2, v3, v4, v5, v6, v7, v8);
  *v0 = v1;
  return result;
}

uint64_t box_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  chtype v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = box(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t chgat_NCURSES60()
{
  int *v0;
  int v1;
  attr_t v2;
  __int16 v3;
  const void *v4;
  int v5;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = chgat(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t color_content_NCURSES60()
{
  int *v0;
  int v1;
  __int16 *v2;
  __int16 *v3;
  __int16 *v4;
  __int16 v5;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = color_content(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t color_set_NCURSES60()
{
  int *v0;
  int v1;
  void *v2;
  __int16 v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = color_set(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t copywin_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  const WINDOW *v9;
  int v10;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = copywin(v9, v2, v3, v4, v5, v6, v7, v8, v10);
  *v0 = v1;
  return result;
}

uint64_t delay_output_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = delay_output(v2);
  *v0 = v1;
  return result;
}

uint64_t deleteln_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = deleteln();
  *v0 = v1;
  return result;
}

WINDOW *derwin_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  WINDOW *v6;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = derwin(v6, v2, v3, v4, v5);
  *v0 = v1;
  return result;
}

uint64_t doupdate_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = doupdate();
  *v0 = v1;
  return result;
}

WINDOW *dupwin_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = dupwin(v2);
  *v0 = v1;
  return result;
}

uint64_t echochar_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = echochar(v2);
  *v0 = v1;
  return result;
}

uint64_t endwin_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = endwin();
  *v0 = v1;
  return result;
}

uint64_t flushinp_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = flushinp();
  *v0 = v1;
  return result;
}

uint64_t getbkgd_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getbkgd(v2);
  *v0 = v1;
  return result;
}

uint64_t getch_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getch();
  *v0 = v1;
  return result;
}

uint64_t getnstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  char *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getnstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t getstr_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getstr(v2);
  *v0 = v1;
  return result;
}

WINDOW *getwin_NCURSES60()
{
  int *v0;
  int v1;
  FILE *v2;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getwin(v2);
  *v0 = v1;
  return result;
}

uint64_t hline_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  chtype v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = hline(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t inch_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = inch();
  *v0 = v1;
  return result;
}

uint64_t inchnstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  chtype *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = inchnstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t inchstr_NCURSES60()
{
  int *v0;
  int v1;
  chtype *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = inchstr(v2);
  *v0 = v1;
  return result;
}

WINDOW *initscr_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = initscr();
  *v0 = v1;
  return result;
}

uint64_t init_color_NCURSES60()
{
  int *v0;
  int v1;
  __int16 v2;
  __int16 v3;
  __int16 v4;
  __int16 v5;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = init_color(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t init_pair_NCURSES60()
{
  int *v0;
  int v1;
  __int16 v2;
  __int16 v3;
  __int16 v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = init_pair(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t innstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  char *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = innstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t insch_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = insch(v2);
  *v0 = v1;
  return result;
}

uint64_t insdelln_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = insdelln(v2);
  *v0 = v1;
  return result;
}

uint64_t insertln_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = insertln();
  *v0 = v1;
  return result;
}

uint64_t insnstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  const char *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = insnstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t insstr_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = insstr(v2);
  *v0 = v1;
  return result;
}

uint64_t instr_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = instr(v2);
  *v0 = v1;
  return result;
}

uint64_t intrflush_NCURSES60()
{
  int *v0;
  int v1;
  BOOL v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = intrflush(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t keypad_NCURSES60()
{
  int *v0;
  int v1;
  BOOL v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = keypad(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t mvaddch_NCURSES60(uint64_t a1, uint64_t a2, chtype a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = addch(a3);
  *v4 = v5;
  return result;
}

uint64_t mvaddchnstr_NCURSES60(uint64_t a1, uint64_t a2, const chtype *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = addchnstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvaddchstr_NCURSES60(uint64_t a1, uint64_t a2, const chtype *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = addchstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvaddnstr_NCURSES60(uint64_t a1, uint64_t a2, const char *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = addnstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvaddstr_NCURSES60(uint64_t a1, uint64_t a2, const char *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = addstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvchgat_NCURSES60(uint64_t a1, uint64_t a2, int a3, attr_t a4, __int16 a5, const void *a6)
{
  int *v10;
  int v11;
  int v12;
  int v13;
  uint64_t result;

  v10 = (int *)_nc_abiver(&_nc_abiver);
  v11 = *v10;
  *v10 = 393216;
  result = wmove(stdscr, v12, v13);
  if ((_DWORD)result != -1)
    result = chgat(a3, a4, a5, a6);
  *v10 = v11;
  return result;
}

uint64_t mvcur_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = mvcur(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t mvderwin_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = mvderwin(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t mvgetch_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wmove(stdscr, v2, v3);
  if ((_DWORD)result != -1)
    result = getch();
  *v0 = v1;
  return result;
}

uint64_t mvgetnstr_NCURSES60(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = getnstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvgetstr_NCURSES60(uint64_t a1, uint64_t a2, char *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = getstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvhline_NCURSES60(uint64_t a1, uint64_t a2, chtype a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = hline(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvinch_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wmove(stdscr, v2, v3);
  if ((_DWORD)result != -1)
    result = inch();
  *v0 = v1;
  return result;
}

uint64_t mvinchnstr_NCURSES60(uint64_t a1, uint64_t a2, chtype *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = inchnstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvinchstr_NCURSES60(uint64_t a1, uint64_t a2, chtype *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = inchstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvinnstr_NCURSES60(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = innstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvinsch_NCURSES60(uint64_t a1, uint64_t a2, chtype a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = insch(a3);
  *v4 = v5;
  return result;
}

uint64_t mvinsnstr_NCURSES60(uint64_t a1, uint64_t a2, const char *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = insnstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvinsstr_NCURSES60(uint64_t a1, uint64_t a2, const char *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = insstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvinstr_NCURSES60(uint64_t a1, uint64_t a2, char *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = instr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvprintw_NCURSES60(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v10;
  int v11;
  int v12;
  int v13;
  uint64_t result;

  v10 = (int *)_nc_abiver(&_nc_abiver);
  v11 = *v10;
  *v10 = 393216;
  result = wmove(stdscr, v12, v13);
  if ((_DWORD)result != -1)
    result = vwprintw(stdscr, a3, &a9);
  *v10 = v11;
  return result;
}

uint64_t mvscanw_NCURSES60(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v10;
  int v11;
  int v12;
  int v13;
  uint64_t result;

  v10 = (int *)_nc_abiver(&_nc_abiver);
  v11 = *v10;
  *v10 = 393216;
  result = wmove(stdscr, v12, v13);
  if ((_DWORD)result != -1)
    result = vwscanw(stdscr, a3, &a9);
  *v10 = v11;
  return result;
}

uint64_t mvvline_NCURSES60(uint64_t a1, uint64_t a2, chtype a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = vline(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvwaddch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, chtype a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = addch(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwaddchnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, const chtype *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = addchnstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwaddchstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, const chtype *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = addchstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwaddnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = addnstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwaddstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = addstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwchgat_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, int a4, attr_t a5, __int16 a6, const void *a7)
{
  int *v11;
  int v12;
  int v13;
  int v14;
  WINDOW *v15;
  uint64_t result;

  v11 = (int *)_nc_abiver(&_nc_abiver);
  v12 = *v11;
  *v11 = 393216;
  result = wmove(v15, v13, v14);
  if ((_DWORD)result != -1)
    result = chgat(a4, a5, a6, a7);
  *v11 = v12;
  return result;
}

uint64_t mvwgetch_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wmove(v4, v2, v3);
  if ((_DWORD)result != -1)
    result = getch();
  *v0 = v1;
  return result;
}

uint64_t mvwgetnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = getnstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwgetstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = getstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwhline_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, chtype a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = hline(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwin_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = mvwin(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t mvwinch_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wmove(v4, v2, v3);
  if ((_DWORD)result != -1)
    result = inch();
  *v0 = v1;
  return result;
}

uint64_t mvwinchnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, chtype *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = inchnstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwinchstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, chtype *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = inchstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwinnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = innstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwinsch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, chtype a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = insch(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwinsnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = insnstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwinsstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = insstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwinstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = instr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwprintw_NCURSES60(WINDOW *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v11;
  int v12;
  int v13;
  int v14;
  uint64_t result;

  v11 = (int *)_nc_abiver(&_nc_abiver);
  v12 = *v11;
  *v11 = 393216;
  result = wmove(a1, v13, v14);
  if ((_DWORD)result != -1)
    result = vwprintw(a1, a4, &a9);
  *v11 = v12;
  return result;
}

uint64_t mvwscanw_NCURSES60(WINDOW *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v11;
  int v12;
  int v13;
  int v14;
  uint64_t result;

  v11 = (int *)_nc_abiver(&_nc_abiver);
  v12 = *v11;
  *v11 = 393216;
  result = wmove(a1, v13, v14);
  if ((_DWORD)result != -1)
    result = vwscanw(a1, a4, &a9);
  *v11 = v12;
  return result;
}

uint64_t mvwvline_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, chtype a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = vline(a4, a5);
  *v7 = v8;
  return result;
}

WINDOW *newpad_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = newpad(v3, v2);
  *v0 = v1;
  return result;
}

SCREEN *newterm_NCURSES60()
{
  int *v0;
  int v1;
  FILE *v2;
  FILE *v3;
  char *v4;
  SCREEN *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = newterm(v4, v2, v3);
  *v0 = v1;
  return result;
}

WINDOW *newwin_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = newwin(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t overlay_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  const WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = overlay(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t overwrite_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  const WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = overwrite(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t pair_content_NCURSES60()
{
  int *v0;
  int v1;
  __int16 *v2;
  __int16 *v3;
  __int16 v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = pair_content(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t pechochar_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = pechochar(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t pnoutrefresh_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  WINDOW *v8;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = pnoutrefresh(v8, v2, v3, v4, v5, v6, v7);
  *v0 = v1;
  return result;
}

uint64_t prefresh_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  WINDOW *v8;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = prefresh(v8, v2, v3, v4, v5, v6, v7);
  *v0 = v1;
  return result;
}

uint64_t printw_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  const char *v11;
  uint64_t result;

  v9 = (int *)_nc_abiver(&_nc_abiver);
  v10 = *v9;
  *v9 = 393216;
  result = vwprintw(stdscr, v11, &a9);
  *v9 = v10;
  return result;
}

uint64_t putwin_NCURSES60()
{
  int *v0;
  int v1;
  FILE *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = putwin(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t redrawwin_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = redrawwin(v2);
  *v0 = v1;
  return result;
}

uint64_t refresh_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = refresh();
  *v0 = v1;
  return result;
}

uint64_t scanw_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  char *v11;
  uint64_t result;

  v9 = (int *)_nc_abiver(&_nc_abiver);
  v10 = *v9;
  *v9 = 393216;
  result = vwscanw(stdscr, v11, &a9);
  *v9 = v10;
  return result;
}

uint64_t scr_dump_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = scr_dump(v2);
  *v0 = v1;
  return result;
}

uint64_t scr_init_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = scr_init(v2);
  *v0 = v1;
  return result;
}

uint64_t scrl_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = scrl(v2);
  *v0 = v1;
  return result;
}

uint64_t scroll_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = scroll(v2);
  *v0 = v1;
  return result;
}

uint64_t scrollok_NCURSES60()
{
  int *v0;
  int v1;
  BOOL v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = scrollok(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t scr_restore_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = scr_restore(v2);
  *v0 = v1;
  return result;
}

uint64_t scr_set_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = scr_set(v2);
  *v0 = v1;
  return result;
}

SCREEN *set_term_NCURSES60()
{
  int *v0;
  int v1;
  SCREEN *v2;
  SCREEN *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = set_term(v2);
  *v0 = v1;
  return result;
}

uint64_t slk_attroff_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_attroff(v2);
  *v0 = v1;
  return result;
}

uint64_t slk_attr_off_NCURSES60()
{
  int *v0;
  int v1;
  void *v2;
  attr_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_attr_off(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t slk_attron_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_attron(v2);
  *v0 = v1;
  return result;
}

uint64_t slk_attr_on_NCURSES60()
{
  int *v0;
  int v1;
  void *v2;
  attr_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_attr_on(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t slk_attrset_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_attrset(v2);
  *v0 = v1;
  return result;
}

uint64_t slk_attr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_attr();
  *v0 = v1;
  return result;
}

uint64_t slk_attr_set_NCURSES60()
{
  int *v0;
  int v1;
  __int16 v2;
  void *v3;
  attr_t v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_attr_set(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t slk_clear_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_clear();
  *v0 = v1;
  return result;
}

uint64_t slk_color_NCURSES60()
{
  int *v0;
  int v1;
  __int16 v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_color(v2);
  *v0 = v1;
  return result;
}

uint64_t slk_init_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_init(v2);
  *v0 = v1;
  return result;
}

char *slk_label_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  char *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_label(v2);
  *v0 = v1;
  return result;
}

uint64_t slk_noutrefresh_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_noutrefresh();
  *v0 = v1;
  return result;
}

uint64_t slk_refresh_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_refresh();
  *v0 = v1;
  return result;
}

uint64_t slk_restore_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_restore();
  *v0 = v1;
  return result;
}

uint64_t slk_set_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  int v3;
  int v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_set(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t slk_touch_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_touch();
  *v0 = v1;
  return result;
}

uint64_t standout_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = standout();
  *v0 = v1;
  return result;
}

uint64_t standend_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = standend();
  *v0 = v1;
  return result;
}

uint64_t start_color_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = start_color();
  *v0 = v1;
  return result;
}

WINDOW *subpad_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  WINDOW *v6;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = subpad(v6, v2, v3, v4, v5);
  *v0 = v1;
  return result;
}

WINDOW *subwin_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  WINDOW *v6;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = subwin(v6, v2, v3, v4, v5);
  *v0 = v1;
  return result;
}

uint64_t ungetch_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = ungetch(v2);
  *v0 = v1;
  return result;
}

uint64_t vidattr_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vidattr(v2);
  *v0 = v1;
  return result;
}

uint64_t vidputs_NCURSES60()
{
  int *v0;
  int v1;
  NCURSES_OUTC v2;
  chtype v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vidputs(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t vline_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  chtype v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vline(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t vwprintw_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  va_list v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vwprintw(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t vw_printw_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  va_list v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vw_printw(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t vwscanw_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  va_list v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vwscanw(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t vw_scanw_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  va_list v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vw_scanw(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t waddch_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = waddch(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t waddchnstr_NCURSES60()
{
  int *v0;
  int v1;
  const chtype *v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = waddchnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t waddchstr_NCURSES60()
{
  int *v0;
  int v1;
  const chtype *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = waddchstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t waddnstr_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = waddnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t waddstr_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = waddstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wattron_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wattron(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wattroff_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wattroff(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wattrset_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wattrset(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wattr_get_NCURSES60()
{
  int *v0;
  int v1;
  attr_t *v2;
  __int16 *v3;
  void *v4;
  WINDOW *v5;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wattr_get(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t wattr_on_NCURSES60()
{
  int *v0;
  int v1;
  attr_t v2;
  void *v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wattr_on(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wattr_off_NCURSES60()
{
  int *v0;
  int v1;
  attr_t v2;
  void *v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wattr_off(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wattr_set_NCURSES60()
{
  int *v0;
  int v1;
  attr_t v2;
  __int16 v3;
  void *v4;
  WINDOW *v5;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wattr_set(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t wbkgd_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wbkgd(v3, v2);
  *v0 = v1;
  return result;
}

void wbkgdset_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  WINDOW *v3;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  wbkgdset(v3, v2);
  *v0 = v1;
}

uint64_t wborder_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  chtype v3;
  chtype v4;
  chtype v5;
  chtype v6;
  chtype v7;
  chtype v8;
  WINDOW *v9;
  chtype v10;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wborder(v9, v2, v3, v4, v5, v6, v7, v8, v10);
  *v0 = v1;
  return result;
}

uint64_t wchgat_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  attr_t v3;
  __int16 v4;
  const void *v5;
  WINDOW *v6;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wchgat(v6, v2, v3, v4, v5);
  *v0 = v1;
  return result;
}

uint64_t wclear_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wclear(v2);
  *v0 = v1;
  return result;
}

uint64_t wcolor_set_NCURSES60()
{
  int *v0;
  int v1;
  __int16 v2;
  void *v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wcolor_set(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wdeleteln_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wdeleteln(v2);
  *v0 = v1;
  return result;
}

uint64_t wechochar_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wechochar(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wgetch_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetch(v2);
  *v0 = v1;
  return result;
}

uint64_t wgetnstr_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wgetstr_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t whline_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = whline(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t winch_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winch(v2);
  *v0 = v1;
  return result;
}

uint64_t winchnstr_NCURSES60()
{
  int *v0;
  int v1;
  chtype *v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winchnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t winchstr_NCURSES60()
{
  int *v0;
  int v1;
  chtype *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winchstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t winnstr_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t winsch_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winsch(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t winsdelln_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winsdelln(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t winsertln_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winsertln(v2);
  *v0 = v1;
  return result;
}

uint64_t winsnstr_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winsnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t winsstr_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winsstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t winstr_NCURSES60()
{
  int *v0;
  int v1;
  char *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wnoutrefresh_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wnoutrefresh(v2);
  *v0 = v1;
  return result;
}

uint64_t wprintw_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  const char *v11;
  WINDOW *v12;
  uint64_t result;

  v9 = (int *)_nc_abiver(&_nc_abiver);
  v10 = *v9;
  *v9 = 393216;
  result = vwprintw(v12, v11, &a9);
  *v9 = v10;
  return result;
}

uint64_t wredrawln_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wredrawln(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wrefresh_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wrefresh(v2);
  *v0 = v1;
  return result;
}

uint64_t wscanw_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  char *v11;
  WINDOW *v12;
  uint64_t result;

  v9 = (int *)_nc_abiver(&_nc_abiver);
  v10 = *v9;
  *v9 = 393216;
  result = vwscanw(v12, v11, &a9);
  *v9 = v10;
  return result;
}

uint64_t wscrl_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wscrl(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wstandout_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wstandout(v2);
  *v0 = v1;
  return result;
}

uint64_t wstandend_NCURSES60()
{
  int *v0;
  int v1;
  WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wstandend(v2);
  *v0 = v1;
  return result;
}

uint64_t wvline_NCURSES60()
{
  int *v0;
  int v1;
  chtype v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wvline(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t putp_NCURSES60()
{
  int *v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = putp(v2);
  *v0 = v1;
  return result;
}

BOOL is_term_resized_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_term_resized(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t assume_default_colors_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = assume_default_colors(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t resize_term_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = resize_term(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t resizeterm_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = resizeterm(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t use_default_colors_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = use_default_colors();
  *v0 = v1;
  return result;
}

uint64_t use_screen_NCURSES60()
{
  int *v0;
  int v1;
  NCURSES_SCREEN_CB v2;
  void *v3;
  SCREEN *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = use_screen(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t use_window_NCURSES60()
{
  int *v0;
  int v1;
  NCURSES_WINDOW_CB v2;
  void *v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = use_window(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wresize_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wresize(v4, v2, v3);
  *v0 = v1;
  return result;
}

WINDOW *wgetparent_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  WINDOW *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetparent(v2);
  *v0 = v1;
  return result;
}

BOOL is_cleared_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_cleared(v2);
  *v0 = v1;
  return result;
}

BOOL is_idcok_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_idcok(v2);
  *v0 = v1;
  return result;
}

BOOL is_idlok_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_idlok(v2);
  *v0 = v1;
  return result;
}

BOOL is_immedok_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_immedok(v2);
  *v0 = v1;
  return result;
}

BOOL is_keypad_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_keypad(v2);
  *v0 = v1;
  return result;
}

BOOL is_leaveok_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_leaveok(v2);
  *v0 = v1;
  return result;
}

BOOL is_nodelay_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_nodelay(v2);
  *v0 = v1;
  return result;
}

BOOL is_notimeout_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_notimeout(v2);
  *v0 = v1;
  return result;
}

BOOL is_pad_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_pad(v2);
  *v0 = v1;
  return result;
}

BOOL is_scrollok_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_scrollok(v2);
  *v0 = v1;
  return result;
}

BOOL is_subwin_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_subwin(v2);
  *v0 = v1;
  return result;
}

BOOL is_syncok_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  _BOOL8 result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = is_syncok(v2);
  *v0 = v1;
  return result;
}

uint64_t wgetdelay_NCURSES60()
{
  int *v0;
  int v1;
  const WINDOW *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetdelay(v2);
  *v0 = v1;
  return result;
}

uint64_t wgetscrreg_NCURSES60()
{
  int *v0;
  int v1;
  int *v2;
  int *v3;
  const WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetscrreg(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t add_wch_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = add_wch(v2);
  *v0 = v1;
  return result;
}

uint64_t add_wchnstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = add_wchnstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t add_wchstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = add_wchstr(v2);
  *v0 = v1;
  return result;
}

uint64_t addnwstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  __int32 *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = addnwstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t addwstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = addwstr(v2);
  *v0 = v1;
  return result;
}

uint64_t bkgrnd_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = bkgrnd(v2);
  *v0 = v1;
  return result;
}

uint64_t bkgrndset_NCURSES60()
{
  int *v0;
  int v1;
  int *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = bkgrndset(v2);
  *v0 = v1;
  return result;
}

uint64_t border_set_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = border_set();
  *v0 = v1;
  return result;
}

uint64_t box_set_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = box_set(v2);
  *v0 = v1;
  return result;
}

uint64_t echo_wchar_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = echo_wchar(v2);
  *v0 = v1;
  return result;
}

uint64_t erasewchar_NCURSES60()
{
  int *v0;
  int v1;
  _DWORD *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = erasewchar(v2);
  *v0 = v1;
  return result;
}

uint64_t get_wch_NCURSES60()
{
  int *v0;
  int v1;
  _DWORD *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = get_wch(v2);
  *v0 = v1;
  return result;
}

uint64_t get_wstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = get_wstr(v2);
  *v0 = v1;
  return result;
}

uint64_t getbkgrnd_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getbkgrnd(v2);
  *v0 = v1;
  return result;
}

uint64_t getcchar_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  unsigned int *v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getcchar(v6, v2, v3, v4, v5);
  *v0 = v1;
  return result;
}

uint64_t getn_wstr_NCURSES60()
{
  int *v0;
  int v1;
  unsigned int v2;
  __int32 *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = getn_wstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t hline_set_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  _OWORD *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = hline_set(v3, v2);
  *v0 = v1;
  return result;
}

void in_wch_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  in_wch(v2);
  *v0 = v1;
}

uint64_t in_wchnstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = in_wchnstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t in_wchstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = in_wchstr(v2);
  *v0 = v1;
  return result;
}

uint64_t innwstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = innwstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t ins_nwstr_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  __int32 *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = ins_nwstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t ins_wch_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = ins_wch(v2);
  *v0 = v1;
  return result;
}

uint64_t ins_wstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = ins_wstr(v2);
  *v0 = v1;
  return result;
}

uint64_t inwstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = inwstr(v2);
  *v0 = v1;
  return result;
}

char *key_name_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  char *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = key_name(v2);
  *v0 = v1;
  return result;
}

uint64_t killwchar_NCURSES60()
{
  int *v0;
  int v1;
  _DWORD *v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = killwchar(v2);
  *v0 = v1;
  return result;
}

uint64_t mvadd_wch_NCURSES60(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = add_wch(a3);
  *v4 = v5;
  return result;
}

uint64_t mvadd_wchnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = add_wchnstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvadd_wchstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = add_wchstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvaddnwstr_NCURSES60(uint64_t a1, uint64_t a2, __int32 *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = addnwstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvaddwstr_NCURSES60(uint64_t a1, uint64_t a2, __int32 *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = addwstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvget_wch_NCURSES60(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = get_wch(a3);
  *v4 = v5;
  return result;
}

uint64_t mvget_wstr_NCURSES60(uint64_t a1, uint64_t a2, __int32 *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = get_wstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvgetn_wstr_NCURSES60(uint64_t a1, uint64_t a2, __int32 *a3, unsigned int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = getn_wstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvhline_set_NCURSES60(uint64_t a1, uint64_t a2, _OWORD *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = hline_set(a3, a4);
  *v6 = v7;
  return result;
}

void mvin_wch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  if (wmove(stdscr, v6, v7) != -1)
    in_wch(a3);
  *v4 = v5;
}

uint64_t mvin_wchnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = in_wchnstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvin_wchstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = in_wchstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvinnwstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = innwstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvins_nwstr_NCURSES60(uint64_t a1, uint64_t a2, __int32 *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = ins_nwstr(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvins_wch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = ins_wch(a3);
  *v4 = v5;
  return result;
}

uint64_t mvins_wstr_NCURSES60(uint64_t a1, uint64_t a2, __int32 *a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = ins_wstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvinwstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (int *)_nc_abiver(&_nc_abiver);
  v5 = *v4;
  *v4 = 393216;
  result = wmove(stdscr, v6, v7);
  if ((_DWORD)result != -1)
    result = inwstr(a3);
  *v4 = v5;
  return result;
}

uint64_t mvvline_set_NCURSES60(uint64_t a1, uint64_t a2, _OWORD *a3, int a4)
{
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v6 = (int *)_nc_abiver(&_nc_abiver);
  v7 = *v6;
  *v6 = 393216;
  result = wmove(stdscr, v8, v9);
  if ((_DWORD)result != -1)
    result = vline_set(a3, a4);
  *v6 = v7;
  return result;
}

uint64_t mvwadd_wch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = add_wch(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwadd_wchnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = add_wchnstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwadd_wchstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = add_wchstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwaddnwstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, __int32 *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = addnwstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwaddwstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, __int32 *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = addwstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwget_wch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = get_wch(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwget_wstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, __int32 *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = get_wstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwgetn_wstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, __int32 *a4, unsigned int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = getn_wstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwhline_set_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = hline_set(a4, a5);
  *v7 = v8;
  return result;
}

void mvwin_wch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  if (wmove(v9, v7, v8) != -1)
    in_wch(a4);
  *v5 = v6;
}

uint64_t mvwin_wchnstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = in_wchnstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwin_wchstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = in_wchstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwinnwstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = innwstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwins_nwstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, __int32 *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = ins_nwstr(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t mvwins_wch_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = ins_wch(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwins_wstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, __int32 *a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = ins_wstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwinwstr_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  WINDOW *v9;
  uint64_t result;

  v5 = (int *)_nc_abiver(&_nc_abiver);
  v6 = *v5;
  *v5 = 393216;
  result = wmove(v9, v7, v8);
  if ((_DWORD)result != -1)
    result = inwstr(a4);
  *v5 = v6;
  return result;
}

uint64_t mvwvline_set_NCURSES60(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, int a5)
{
  int *v7;
  int v8;
  int v9;
  int v10;
  WINDOW *v11;
  uint64_t result;

  v7 = (int *)_nc_abiver(&_nc_abiver);
  v8 = *v7;
  *v7 = 393216;
  result = wmove(v11, v9, v10);
  if ((_DWORD)result != -1)
    result = vline_set(a4, a5);
  *v7 = v8;
  return result;
}

uint64_t pecho_wchar_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = pecho_wchar(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t setcchar_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  int v3;
  int v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = setcchar(v6, v2, v3, v4, v5);
  *v0 = v1;
  return result;
}

uint64_t slk_wset_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  int v3;
  int v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = slk_wset(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t term_attrs_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = term_attrs();
  *v0 = v1;
  return result;
}

uint64_t unget_wch_NCURSES60()
{
  int *v0;
  int v1;
  __int32 v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = unget_wch(v2);
  *v0 = v1;
  return result;
}

uint64_t vid_attr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vid_attr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t vid_puts_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  int v3;
  int (__cdecl *v4)(int);
  int v5;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vid_puts(v5, v2, v3, v4);
  *v0 = v1;
  return result;
}

uint64_t vline_set_NCURSES60()
{
  int *v0;
  int v1;
  int v2;
  _OWORD *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = vline_set(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wadd_wch_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wadd_wch(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wadd_wchnstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wadd_wchnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wadd_wchstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wadd_wchstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t waddnwstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = waddnwstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t waddwstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = waddwstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wbkgrnd_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wbkgrnd(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wbkgrndset_NCURSES60()
{
  int *v0;
  int v1;
  int *v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wbkgrndset(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wborder_set_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wborder_set(v2);
  *v0 = v1;
  return result;
}

uint64_t wecho_wchar_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wecho_wchar(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wget_wch_NCURSES60()
{
  int *v0;
  int v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wget_wch(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wget_wstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wget_wstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wgetbkgrnd_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetbkgrnd(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wgetn_wstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  unsigned int v3;
  WINDOW *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wgetn_wstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t whline_set_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  int v3;
  __int16 *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = whline_set(v4, v2, v3);
  *v0 = v1;
  return result;
}

void win_wch_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  __int16 *v3;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  win_wch(v3, v2);
  *v0 = v1;
}

uint64_t win_wchnstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  int v3;
  __int16 *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = win_wchnstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t win_wchstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  __int16 *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = win_wchstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t winnwstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  int v3;
  __int16 *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winnwstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wins_nwstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  int v3;
  uint64_t v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wins_nwstr(v4, v2, v3);
  *v0 = v1;
  return result;
}

uint64_t wins_wch_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  WINDOW *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wins_wch(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t wins_wstr_NCURSES60()
{
  int *v0;
  int v1;
  __int32 *v2;
  uint64_t v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wins_wstr(v3, v2);
  *v0 = v1;
  return result;
}

uint64_t winwstr_NCURSES60()
{
  int *v0;
  int v1;
  uint64_t v2;
  __int16 *v3;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = winwstr(v3, v2);
  *v0 = v1;
  return result;
}

int *wunctrl_NCURSES60()
{
  int *v0;
  int v1;
  int *v2;
  int *result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wunctrl(v2);
  *v0 = v1;
  return result;
}

uint64_t wvline_set_NCURSES60()
{
  int *v0;
  int v1;
  _OWORD *v2;
  int v3;
  __int16 *v4;
  uint64_t result;

  v0 = (int *)_nc_abiver(&_nc_abiver);
  v1 = *v0;
  *v0 = 393216;
  result = wvline_set(v4, v2, v3);
  *v0 = v1;
  return result;
}

int beep(void)
{
  char **Strings;
  char *v1;
  char *v3;
  int v4;

  if (!cur_term)
    return -1;
  Strings = cur_term->type.Strings;
  v1 = Strings[1];
  if (v1)
    return _nc_putp_flush((int)"bell", v1);
  v3 = Strings[45];
  if (!v3)
    return -1;
  v4 = _nc_putp_flush((int)"flash_screen", v3);
  _nc_flush();
  return v4;
}

uint64_t wbkgrndset(uint64_t result, int *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned int *v7;
  __int128 *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned __int8 v11;
  int v12;
  int v13;
  __int128 v14;
  wint_t v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;

  if (!result)
    return result;
  v2 = result;
  v3 = *(_DWORD *)(result + 88);
  v4 = *a2;
  if ((v3 & 0xFF00) != 0)
    v5 = ~v3 & 0xFFFF00FF;
  else
    v5 = ~v3;
  v6 = *(_DWORD *)(result + 16) & v5;
  if ((v4 & 0xFF00) != 0)
    v6 &= 0xFFFF00FF;
  *(_DWORD *)(result + 16) = v6 | v4;
  v7 = (unsigned int *)_nc_abiver(&_nc_abiver);
  if (*v7 < 0x60000)
  {
    if (!v12)
      goto LABEL_13;
LABEL_11:
    *(_DWORD *)(v2 + 116) = 0;
    if (*v7 <= v10)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v12 | *(_DWORD *)(v2 + 112))
    goto LABEL_11;
LABEL_12:
  v13 = *((_DWORD *)v8 + 6);
  if (v13)
  {
LABEL_14:
    *(_DWORD *)(v2 + 116) = v13;
    goto LABEL_15;
  }
LABEL_13:
  v13 = v11;
  if (v11)
    goto LABEL_14;
LABEL_15:
  if (*((_DWORD *)v8 + 1))
  {
    v14 = *v8;
    *(_OWORD *)(v9 + 12) = *(__int128 *)((char *)v8 + 12);
    *(_OWORD *)v9 = v14;
    v16 = *(_DWORD *)(v2 + 88);
    v15 = *(_DWORD *)(v2 + 92);
  }
  else
  {
    *(_QWORD *)v9 = 0;
    *(_QWORD *)(v9 + 8) = 0;
    *(_DWORD *)(v9 + 24) = 0;
    *(_QWORD *)(v9 + 16) = 0;
    v15 = 32;
    *(_DWORD *)(v2 + 92) = 32;
    v16 = *(_DWORD *)v8;
    *(_DWORD *)(v2 + 88) = *(_DWORD *)v8;
    if (*v7 > v10)
    {
      v17 = *((unsigned __int8 *)v8 + 1);
      *(_DWORD *)(v2 + 112) = v17;
      v18 = v16 & 0xFFFF00FF | (v17 << 8);
      *(_DWORD *)(v2 + 88) = v18;
      if (*v7 <= v10)
      {
        v15 = 32;
        v16 = v18;
      }
      else
      {
        v19 = *((_DWORD *)v8 + 6);
        if (!v19)
          v19 = *((unsigned __int8 *)v8 + 1);
        *(_DWORD *)(v2 + 112) = v19;
        if (v19 >= 255)
          LOBYTE(v19) = -1;
        v16 = v16 & 0xFFFF00FF | (v19 << 8);
        *(_DWORD *)(v2 + 88) = v16;
        v15 = 32;
      }
    }
  }
  result = _nc_to_char(v15);
  if ((_DWORD)result == -1)
    v20 = 32;
  else
    v20 = result;
  v21 = v20 | v16 & 0xFFFF00FF;
  v22 = *(_DWORD *)(v2 + 116);
  if (!v22)
    v22 = *(unsigned __int8 *)(v2 + 17);
  *(_DWORD *)(v2 + 20) = v21 | (v22 << 8);
  return result;
}

void wbkgdset(WINDOW *a1, chtype a2)
{
  int v2;
  uint64_t v3;
  _QWORD v4[3];
  int v5;

  v4[1] = 0;
  v4[2] = 0;
  v5 = 0;
  v4[0] = vand_s8((int8x8_t)vdup_n_s32(a2), (int8x8_t)0xFFFFFFFF00);
  if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
  {
    v5 = BYTE1(v2);
    LODWORD(v4[0]) = v2 & 0xFFFF0000 | (BYTE1(v2) << 8);
  }
  wbkgrndset(v3, (int *)v4);
}

uint64_t wbkgrnd(uint64_t a1, _OWORD *a2)
{
  __int128 *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  int v19;
  __int128 *v20;
  _DWORD *v21;
  int v22;
  int v23;
  int v24;
  _BYTE v25[28];
  int v26[12];

  if (!a1)
    return 0xFFFFFFFFLL;
  *(_OWORD *)v26 = *a2;
  *(_OWORD *)&v26[3] = *(_OWORD *)((char *)a2 + 12);
  v3 = (__int128 *)(a1 + 88);
  v4 = *(_DWORD *)(a1 + 88);
  v5 = *(_DWORD *)(a1 + 92);
  v6 = *(_DWORD *)(a1 + 96);
  v23 = *(_DWORD *)(a1 + 104);
  v24 = *(_DWORD *)(a1 + 100);
  v22 = *(_DWORD *)(a1 + 108);
  v19 = *(_DWORD *)(a1 + 112);
  wbkgrndset(a1, v26);
  v20 = v3;
  v7 = *(_DWORD *)v3;
  *(_DWORD *)(a1 + 116) = BYTE1(*(_DWORD *)v3);
  *(_DWORD *)(a1 + 16) = v7;
  v8 = *(__int16 *)(a1 + 4);
  if ((v8 & 0x80000000) == 0)
  {
    v21 = (_DWORD *)_nc_abiver(&_nc_abiver);
    v9 = 0;
    v10 = *(_WORD *)(a1 + 6);
    do
    {
      if ((v10 & 0x8000) == 0)
      {
        v11 = 0;
        v12 = -1;
        do
        {
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * v9);
          v14 = v13 + v11;
          if (*(_DWORD *)(v13 + v11) == v4
            && *(_DWORD *)(v14 + 4) == v5
            && *(_DWORD *)(v13 + v11 + 8) == v6
            && *(_DWORD *)(v13 + v11 + 12) == v24
            && *(_DWORD *)(v13 + v11 + 16) == v23
            && *(_DWORD *)(v13 + v11 + 20) == v22
            && (*v21 < 0x60000u || *(_DWORD *)(v13 + v11 + 24) == v19))
          {
            v15 = *v20;
            v16 = *(__int128 *)((char *)v20 + 12);
          }
          else
          {
            _nc_render();
            v15 = *(_OWORD *)v25;
            v16 = *(_OWORD *)&v25[12];
          }
          *(_OWORD *)(v14 + 12) = v16;
          *(_OWORD *)v14 = v15;
          ++v12;
          v11 += 28;
        }
        while (v12 < *(__int16 *)(a1 + 6));
        v10 = *(_WORD *)(a1 + 6);
        LOWORD(v8) = *(_WORD *)(a1 + 4);
      }
    }
    while (v9++ < (__int16)v8);
  }
  wtouchln((WINDOW *)a1, 0, (__int16)v8 + 1, 1);
  _nc_synchook((WINDOW *)a1);
  return 0;
}

int wbkgd(WINDOW *a1, chtype a2)
{
  int v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  int v7;

  v6 = 0;
  v7 = 0;
  v5 = (unint64_t)vand_s8((int8x8_t)vdup_n_s32(a2), (int8x8_t)0xFFFFFFFF00);
  if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
  {
    v7 = BYTE1(v2);
    LODWORD(v5) = v2 & 0xFFFF0000 | (BYTE1(v2) << 8);
  }
  return wbkgrnd(v3, &v5);
}

int wborder(WINDOW *a1, chtype a2, chtype a3, chtype a4, chtype a5, chtype a6, chtype a7, chtype a8, chtype a9)
{
  _DWORD *v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int8x8_t v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD *v18;
  unsigned int *v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  int8x8_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int *v30;
  unsigned int *v31;
  unsigned int *v32;
  uint64_t *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int8x8_t *v45;
  uint64_t v46;
  unsigned int v47;
  int v48;

  if (!a1)
    return -1;
  v10 = (_DWORD *)_nc_abiver(&_nc_abiver);
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  v12 = *((__int16 *)a1 + 3);
  v13 = *((__int16 *)a1 + 2);
  if ((v12 & 0x8000000000000000) == 0)
  {
    LOWORD(v14) = 0;
    v15 = vand_s8((int8x8_t)vdup_n_s32(v48 | v47), (int8x8_t)0xFFFFFFFF00);
    v16 = ((unsigned __int16)(v48 | v47) >> 8);
    do
    {
      v17 = **((_QWORD **)a1 + 5) + 28 * (__int16)v14;
      *(_DWORD *)(v17 + 24) = 0;
      *(_QWORD *)(v17 + 8) = 0;
      *(_QWORD *)(v17 + 16) = 0;
      *(_QWORD *)v17 = 0;
      *(int8x8_t *)v17 = v15;
      v18 = (_QWORD *)*((_QWORD *)a1 + 5);
      if (*v10 > 0x5FFFFu)
      {
        v19 = (unsigned int *)(*v18 + 28 * (__int16)v14);
        v19[6] = v16;
        *v19 = *v19 & 0xFFFF00FF | (v16 << 8);
      }
      v20 = v18[2 * v13] + 28 * (__int16)v14;
      *(_QWORD *)(v20 + 8) = 0;
      *(_QWORD *)(v20 + 16) = 0;
      *(_DWORD *)(v20 + 24) = 0;
      *(int8x8_t *)v20 = v15;
      if (*v10 > 0x5FFFFu)
      {
        v21 = (unsigned int *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * v13) + 28 * (__int16)v14);
        v21[6] = v16;
        *v21 = *v21 & 0xFFFF00FF | (v16 << 8);
      }
      v14 = (__int16)(v14 + 1);
    }
    while (v14 <= (int)v12);
  }
  v22 = v48 | v47;
  v23 = (uint64_t *)*((_QWORD *)a1 + 5);
  *((_WORD *)v23 + 4) = 0;
  v24 = &v23[2 * v13];
  *((_WORD *)v24 + 4) = 0;
  *((_WORD *)v23 + 5) = v12;
  *((_WORD *)v24 + 5) = v12;
  if ((v13 & 0x80000000) == 0)
  {
    LOWORD(v25) = 0;
    v26 = vand_s8((int8x8_t)vdup_n_s32(v48 | v47), (int8x8_t)0xFFFFFFFF00);
    v27 = ((unsigned __int16)(v48 | v47) >> 8);
    do
    {
      v28 = 2 * (__int16)v25;
      v29 = v23[v28];
      *(_DWORD *)(v29 + 24) = 0;
      *(_QWORD *)(v29 + 8) = 0;
      *(_QWORD *)(v29 + 16) = 0;
      *(_QWORD *)v29 = 0;
      *(int8x8_t *)v29 = v26;
      v30 = *(unsigned int **)(*((_QWORD *)a1 + 5) + v28 * 8);
      if (*v10 > 0x5FFFFu)
      {
        v30[6] = v27;
        *v30 = *v30 & 0xFFFF00FF | (v27 << 8);
      }
      v25 = (__int16)v25;
      v31 = &v30[7 * (int)v12];
      v31[6] = 0;
      *((_QWORD *)v31 + 1) = 0;
      *((_QWORD *)v31 + 2) = 0;
      *(_QWORD *)v31 = 0;
      *(int8x8_t *)v31 = v26;
      v23 = (uint64_t *)*((_QWORD *)a1 + 5);
      if (*v10 > 0x5FFFFu)
      {
        v32 = (unsigned int *)(v23[2 * v25] + 28 * (int)v12);
        v32[6] = v27;
        *v32 = *v32 & 0xFFFF00FF | (v27 << 8);
      }
      v33 = &v23[2 * v25];
      *((_WORD *)v33 + 4) = 0;
      *((_WORD *)v33 + 5) = v12;
      LODWORD(v25) = (__int16)(v25 + 1);
    }
    while ((int)v25 <= (int)v13);
  }
  v34 = v48 | v47;
  v35 = *v23;
  *(_DWORD *)(v35 + 24) = 0;
  *(_QWORD *)(v35 + 8) = 0;
  *(_QWORD *)(v35 + 16) = 0;
  *(_QWORD *)v35 = 0;
  *(int8x8_t *)v35 = vand_s8((int8x8_t)vdup_n_s32(v22), (int8x8_t)0xFFFFFFFF00);
  v36 = **((_QWORD **)a1 + 5);
  if (*v10 > 0x5FFFFu)
  {
    *(_DWORD *)(v36 + 24) = BYTE1(v22);
    *(_BYTE *)(v36 + 1) = BYTE1(v22);
  }
  v37 = v48 | v47;
  v38 = v36 + 28 * (int)v12;
  *(_DWORD *)(v38 + 24) = 0;
  *(_QWORD *)(v38 + 8) = 0;
  *(_QWORD *)(v38 + 16) = 0;
  *(_QWORD *)v38 = 0;
  *(int8x8_t *)v38 = vand_s8((int8x8_t)vdup_n_s32(v34), (int8x8_t)0xFFFFFFFF00);
  v39 = (_QWORD *)*((_QWORD *)a1 + 5);
  if (*v10 > 0x5FFFFu)
  {
    v40 = *v39 + 28 * (int)v12;
    *(_DWORD *)(v40 + 24) = BYTE1(v34);
    *(_BYTE *)(v40 + 1) = BYTE1(v34);
  }
  v41 = v48 | v47;
  v42 = 16 * v13;
  v43 = v39[2 * v13];
  *(_DWORD *)(v43 + 24) = 0;
  *(_QWORD *)(v43 + 8) = 0;
  *(_QWORD *)(v43 + 16) = 0;
  *(_QWORD *)v43 = 0;
  *(int8x8_t *)v43 = vand_s8((int8x8_t)vdup_n_s32(v37), (int8x8_t)0xFFFFFFFF00);
  v44 = *(_QWORD *)(*((_QWORD *)a1 + 5) + v42);
  if (*v10 > 0x5FFFFu)
  {
    *(_DWORD *)(v44 + 24) = BYTE1(v37);
    *(_BYTE *)(v44 + 1) = BYTE1(v37);
  }
  v45 = (int8x8_t *)(v44 + 28 * (int)v12);
  v45[1] = 0;
  v45[2] = 0;
  v45[3].i32[0] = 0;
  *v45 = vand_s8((int8x8_t)vdup_n_s32(v41), (int8x8_t)0xFFFFFFFF00);
  if (*v10 > 0x5FFFFu)
  {
    v46 = *(_QWORD *)(*((_QWORD *)a1 + 5) + v42) + 28 * (int)v12;
    *(_DWORD *)(v46 + 24) = BYTE1(v41);
    *(_BYTE *)(v46 + 1) = BYTE1(v41);
  }
  _nc_synchook(a1);
  return 0;
}

uint64_t wborder_set(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  _OWORD v22[17];

  memset(&v22[14], 0, 28);
  memset(&v22[12], 0, 28);
  memset(&v22[10], 0, 28);
  memset(&v22[8], 0, 28);
  memset(&v22[6], 0, 28);
  memset(&v22[4], 0, 28);
  memset(&v22[2], 0, 28);
  memset(v22, 0, 28);
  if (!a1)
    return 0xFFFFFFFFLL;
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  _nc_render();
  v2 = *(__int16 *)(a1 + 6);
  v3 = *(__int16 *)(a1 + 4);
  if ((v2 & 0x8000000000000000) == 0)
  {
    LOWORD(v4) = 0;
    do
    {
      v5 = 28 * (__int16)v4;
      v6 = (_OWORD *)(**(_QWORD **)(a1 + 40) + v5);
      *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)((char *)&v22[10] + 12);
      *v6 = v22[10];
      v7 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * v3) + v5);
      *(_OWORD *)((char *)v7 + 12) = *(_OWORD *)((char *)&v22[8] + 12);
      *v7 = v22[8];
      v4 = (__int16)(v4 + 1);
    }
    while (v4 <= (int)v2);
  }
  v8 = *(_QWORD *)(a1 + 40);
  *(_WORD *)(v8 + 8) = 0;
  v9 = v8 + 16 * v3;
  *(_WORD *)(v9 + 8) = 0;
  *(_WORD *)(v8 + 10) = v2;
  *(_WORD *)(v9 + 10) = v2;
  if ((v3 & 0x80000000) == 0)
  {
    LOWORD(v10) = 0;
    do
    {
      v11 = 16 * (__int16)v10;
      v12 = *(_OWORD **)(v8 + v11);
      *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)((char *)&v22[14] + 12);
      *v12 = v22[14];
      v13 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + v11) + 28 * (int)v2);
      *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)((char *)&v22[12] + 12);
      *v13 = v22[12];
      v8 = *(_QWORD *)(a1 + 40);
      v14 = v8 + v11;
      *(_WORD *)(v14 + 8) = 0;
      *(_WORD *)(v14 + 10) = v2;
      v10 = (__int16)(v10 + 1);
    }
    while (v10 <= (int)v3);
  }
  v15 = *(_OWORD **)v8;
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)((char *)&v22[6] + 12);
  *v15 = v22[6];
  v16 = 28 * v2;
  v17 = (_OWORD *)(**(_QWORD **)(a1 + 40) + v16);
  *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)((char *)&v22[4] + 12);
  *v17 = v22[4];
  v18 = 16 * v3;
  v19 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + v18);
  *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)&v22[2] + 12);
  *v19 = v22[2];
  v20 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + v18) + v16);
  *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)((char *)v22 + 12);
  *v20 = v22[0];
  _nc_synchook((WINDOW *)a1);
  return 0;
}

uint64_t setcchar(unsigned __int8 *a1, __int32 *a2, int a3, int a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;

  result = 0xFFFFFFFFLL;
  if (a2 && !a5)
  {
    LODWORD(v10) = wcslen(a2);
    if (v10 >= 2 && wcwidth(*a2) < 0)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      if (v10 >= 5)
        v10 = 5;
      else
        v10 = v10;
      if (v10 >= 2)
      {
        v11 = 1;
        while (!wcwidth(a2[v11]))
        {
          if (v10 == ++v11)
            goto LABEL_15;
        }
        LODWORD(v10) = v11;
      }
LABEL_15:
      *(_QWORD *)a1 = 0;
      *((_QWORD *)a1 + 1) = 0;
      *((_DWORD *)a1 + 6) = 0;
      *((_QWORD *)a1 + 2) = 0;
      if ((_DWORD)v10)
      {
        *(_DWORD *)a1 = *a1 | a3 & 0xFFFFFF00;
        if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
        {
          v16 = a3 & 0xFFFF0000 | (a4 << 8) | v12;
        }
        else
        {
          *((_DWORD *)a1 + 6) = a4;
          v14 = v13 & 0xFFFF00FF;
          v15 = a4 << 8;
          if (a4 > 255)
            v15 = 65280;
          v16 = v14 | v15;
        }
        *(_DWORD *)a1 = v16;
        memcpy(a1 + 4, a2, 4 * v10);
      }
      return 0;
    }
  }
  return result;
}

uint64_t getcchar(uint64_t a1, __int32 *a2, unsigned int *a3, _WORD *a4, uint64_t a5)
{
  uint64_t result;
  __int32 *v10;
  size_t v11;
  int v12;

  result = 0xFFFFFFFFLL;
  if (a1 && !a5)
  {
    v10 = wmemchr((__int32 *)(a1 + 4), 0, 5uLL);
    if (v10)
      v11 = (((unint64_t)v10 - a1 - 4) >> 2);
    else
      v11 = 5;
    if (a2)
    {
      result = 0xFFFFFFFFLL;
      if (a3 && a4 && (v11 & 0x80000000) == 0)
      {
        *a3 = *(_DWORD *)a1 & 0xFFFFFF00;
        if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u || (v12 = *(_DWORD *)(a1 + 24)) == 0)
          LOWORD(v12) = *(unsigned __int8 *)(a1 + 1);
        *a4 = v12;
        wmemcpy(a2, (const __int32 *)(a1 + 4), v11);
        result = 0;
        a2[v11] = 0;
      }
    }
    else if ((int)v11 < 5)
    {
      return (v11 + 1);
    }
    else
    {
      return 5;
    }
  }
  return result;
}

int wchgat(WINDOW *a1, int a2, attr_t a3, __int16 a4, const void *a5)
{
  _DWORD *v5;
  int v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  unsigned __int8 v14;
  int v15;
  __int16 *v16;
  __int16 *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  uint64_t v25;

  if (!a1)
    return -1;
  if (*((__int16 *)a1 + 1) <= *((__int16 *)a1 + 3))
  {
    v5 = (_DWORD *)_nc_abiver(&_nc_abiver);
    v13 = v12 | (v7 << 8);
    if (v7 >= 255)
      v14 = -1;
    else
      v14 = v7;
    v15 = v14 << 8;
    v16 = (__int16 *)(v8 + 1);
    v17 = (__int16 *)v8 + 5;
    v18 = v10 + 1;
    v19 = v11 | (v7 << 8);
    v20 = 28 * v9;
    do
    {
      if (v6 != -1)
      {
        v21 = __OFSUB__(v6--, 1);
        if (v6 < 0 != v21)
          return 0;
      }
      v22 = *v8;
      v23 = *(unsigned __int8 *)(*v8 + v20);
      *(_DWORD *)(*v8 + v20) = v19 | v23;
      if (*v5 < 0x60000u)
      {
        v24 = v13 | v23;
      }
      else
      {
        *(_DWORD *)(v22 + v20 + 24) = v7;
        v24 = (v19 | v23) & 0xFFFF00FF | v15;
      }
      *(_DWORD *)(v22 + v20) = v24;
      v25 = *v16;
      if (v25 == -1)
      {
        *v17 = v9;
      }
      else if (v9 >= v25)
      {
        if (v9 > *v17)
          *v17 = v9;
        goto LABEL_18;
      }
      *v16 = v9;
LABEL_18:
      ++v9;
      v20 += 28;
    }
    while (v18 != v9);
  }
  return 0;
}

int wclear(WINDOW *a1)
{
  int result;

  result = werase(a1);
  if (result != -1)
    *((_BYTE *)a1 + 25) = 1;
  return result;
}

int clearok(WINDOW *a1, BOOL a2)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_BYTE *)a1 + 25) = a2;
  return result;
}

int wclrtobot(WINDOW *a1)
{
  __int16 v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _WORD *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _BYTE v14[28];

  if (!a1)
    return -1;
  v1 = *((_WORD *)a1 + 1);
  *(_OWORD *)v14 = *(_OWORD *)((char *)a1 + 88);
  *(_OWORD *)&v14[12] = *(_OWORD *)((char *)a1 + 100);
  v2 = *(__int16 *)a1;
  v3 = *((__int16 *)a1 + 2);
  if (v2 <= v3)
  {
    do
    {
      v4 = *((_QWORD *)a1 + 5);
      v5 = v4 + 16 * (__int16)v2;
      v6 = *((__int16 *)a1 + 3);
      v9 = *(__int16 *)(v5 + 8);
      v7 = (_WORD *)(v5 + 8);
      v8 = v9;
      if (v9 == -1 || v8 > v1)
        *v7 = v1;
      v10 = (__int16)v2;
      v11 = *(_QWORD *)(v4 + 16 * (__int16)v2);
      *(_WORD *)(v4 + 16 * v10 + 10) = v6;
      if (v6 >= v1)
      {
        v12 = (_OWORD *)(v11 + 28 * v1);
        do
        {
          *v12 = *(_OWORD *)v14;
          *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)&v14[12];
          v12 = (_OWORD *)((char *)v12 + 28);
        }
        while ((unint64_t)v12 <= v11 + 28 * v6);
        LOWORD(v3) = *((_WORD *)a1 + 2);
      }
      v1 = 0;
      v2 = (__int16)(v10 + 1);
    }
    while (v2 <= (__int16)v3);
  }
  _nc_synchook(a1);
  return 0;
}

int wclrtoeol(WINDOW *a1)
{
  uint64_t v1;
  __int16 v2;
  int v3;
  int v4;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;
  unint64_t v11;
  _OWORD *v12;
  _BYTE v13[28];

  if (!a1)
    return -1;
  v1 = *(__int16 *)a1;
  v2 = *((_WORD *)a1 + 6);
  if ((v2 & 0x40) != 0 && (int)v1 < *((__int16 *)a1 + 2))
  {
    v2 &= ~0x40u;
    *((_WORD *)a1 + 6) = v2;
  }
  if ((v2 & 0x40) != 0)
    return -1;
  if ((int)v1 > *((__int16 *)a1 + 2))
    return -1;
  v3 = *((__int16 *)a1 + 1);
  v4 = *((__int16 *)a1 + 3);
  if (v3 > v4)
    return -1;
  v6 = *((__int16 *)a1 + 3);
  *(_OWORD *)v13 = *(_OWORD *)((char *)a1 + 88);
  *(_OWORD *)&v13[12] = *(_OWORD *)((char *)a1 + 100);
  v7 = *((_QWORD *)a1 + 5) + 16 * v1;
  v8 = *(__int16 *)(v7 + 8);
  if (v8 == -1 || v8 > v3)
    *(_WORD *)(v7 + 8) = v3;
  *(_WORD *)(v7 + 10) = v4;
  v10 = *(_QWORD *)v7;
  v11 = *(_QWORD *)v7 + 28 * v6;
  v12 = (_OWORD *)(v10 + 28 * v3);
  do
  {
    *v12 = *(_OWORD *)v13;
    *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)&v13[12];
    v12 = (_OWORD *)((char *)v12 + 28);
  }
  while ((unint64_t)v12 <= v11);
  _nc_synchook(a1);
  return 0;
}

uint64_t _nc_reset_colors()
{
  int v0;
  char **Strings;
  char *v2;
  _BOOL8 v3;
  char *v4;

  v0 = *(_DWORD *)(SP + 756);
  if (v0 >= 1)
    *(_DWORD *)(SP + 756) = -v0;
  Strings = cur_term->type.Strings;
  v2 = Strings[297];
  v3 = v2 != 0;
  if (v2)
  {
    _nc_putp((int)"orig_pair", v2);
    Strings = cur_term->type.Strings;
  }
  v4 = Strings[298];
  if (v4)
  {
    _nc_putp((int)"orig_colors", v4);
    return 1;
  }
  return v3;
}

int start_color(void)
{
  __int16 *Numbers;
  int v1;
  size_t v2;
  char *v3;
  uint64_t v4;
  int result;
  uint64_t v7;
  size_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  if (!SP)
    return -1;
  if (*(_DWORD *)(SP + 752))
    return 0;
  Numbers = cur_term->type.Numbers;
  v1 = Numbers[14];
  v2 = Numbers[13];
  v3 = (char *)*((_QWORD *)cur_term->type.Strings + 297);
  if (v3)
  {
    _nc_putp((int)"orig_pair", v3);
  }
  else
  {
    sub_1C05BEDF4(*(unsigned int *)(SP + 996), (int (__cdecl *)(int))_nc_outch);
    v4 = SP ? *(unsigned int *)(SP + 1000) : 0;
    sub_1C05BEE60(v4, (int (__cdecl *)(int))_nc_outch);
  }
  if (v1 < 1 || (int)v2 < 1)
    return 0;
  v7 = SP;
  v8 = (v1 + 2 * v2 + 1);
  *(_DWORD *)(SP + 988) = v8;
  *(_DWORD *)(v7 + 984) = v1;
  *(_DWORD *)(v7 + 968) = v2;
  COLOR_PAIRS = v1;
  COLORS = v2;
  v9 = calloc(v8, 4uLL);
  *(_QWORD *)(SP + 976) = v9;
  if (!v9)
    return -1;
  v10 = calloc(v2, 0x10uLL);
  v11 = SP;
  *(_QWORD *)(SP + 960) = v10;
  if (!v10)
  {
    v19 = *(void **)(v11 + 976);
    if (v19)
    {
      free(v19);
      *(_QWORD *)(SP + 976) = 0;
    }
    return -1;
  }
  **(_DWORD **)(v11 + 976) = *(_DWORD *)(v11 + 1000) & 0x1FF | ((*(_DWORD *)(v11 + 996) & 0x1FF) << 9);
  if (cur_term->type.Booleans[29])
    v12 = &unk_1C05E1094;
  else
    v12 = &unk_1C05E1114;
  if (COLORS >= 1)
  {
    v13 = 0;
    v14 = 0;
    v15 = 16 * COLORS;
    do
    {
      v16 = (_OWORD *)(*(_QWORD *)(v11 + 960) + v13);
      if (v14 > 7)
      {
        *v16 = v12[v14 & 7];
        v11 = SP;
        v17 = *(_QWORD *)(SP + 960);
        if (cur_term->type.Booleans[29])
        {
          *(_WORD *)(v17 + v13 + 2) = 100;
        }
        else
        {
          if (*(_WORD *)(v17 + v13))
            *(_WORD *)(v17 + v13) = 1000;
          v18 = v17 + v13;
          if (*(_WORD *)(v18 + 2))
            *(_WORD *)(v18 + 2) = 1000;
          if (*(_WORD *)(v18 + 4))
            *(_WORD *)(v18 + 4) = 1000;
        }
      }
      else
      {
        *v16 = v12[v13 / 0x10];
        v11 = SP;
      }
      ++v14;
      v13 += 16;
    }
    while (v15 != v13);
  }
  result = 0;
  *(_DWORD *)(v11 + 752) = 1;
  return result;
}

uint64_t sub_1C05BEDF4(uint64_t a1, int (__cdecl *a2)(int))
{
  char **Strings;
  const char *v4;
  char *v5;

  Strings = cur_term->type.Strings;
  v4 = Strings[359];
  if (!v4)
  {
    v4 = Strings[302];
    if ((int)a1 <= 15)
      a1 = dword_1C05E1194[(int)a1];
  }
  v5 = _nc_tiparm(1, v4, a1);
  return tputs(v5, 1, a2);
}

uint64_t sub_1C05BEE60(uint64_t a1, int (__cdecl *a2)(int))
{
  char **Strings;
  const char *v4;
  char *v5;

  Strings = cur_term->type.Strings;
  v4 = Strings[360];
  if (!v4)
  {
    v4 = Strings[303];
    if ((int)a1 <= 15)
      a1 = dword_1C05E1194[(int)a1];
  }
  v5 = _nc_tiparm(1, v4, a1);
  return tputs(v5, 1, a2);
}

int init_pair(__int16 a1, __int16 a2, __int16 a3)
{
  uint64_t v3;
  int result;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _QWORD *v24;
  __int16 *v25;
  __int16 *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  _DWORD *v32;
  uint64_t v33;
  int *v34;
  int v35;
  int v36;
  BOOL v37;
  const char *v38;
  __int16 *v39;
  char *v40;

  v3 = a1;
  result = -1;
  if ((v3 & 0x80000000) != 0)
    return result;
  v5 = SP;
  if (!SP || *(_DWORD *)(SP + 988) <= (int)v3 || !*(_DWORD *)(SP + 752))
    return result;
  v6 = a3;
  v7 = a2;
  v8 = cur_term->type.Numbers[13];
  v9 = *(_QWORD *)(SP + 976);
  v10 = *(_DWORD *)(v9 + 4 * (unsigned __int16)v3);
  if (!*(_BYTE *)(SP + 993) && !*(_BYTE *)(SP + 992))
  {
    if (a2 < 0 || COLORS <= (unsigned __int16)a2 || a3 < 0)
      return result;
    v37 = v8 <= a2 || COLORS <= a3;
    if (v37 || !(_DWORD)v3 || v8 <= a3)
      return result;
LABEL_25:
    v15 = v6 & 0x1FF | ((v7 & 0x1FF) << 9);
    if (v10)
      v16 = v10 == v15;
    else
      v16 = 1;
    if (!v16 && (*(__int16 *)(*(_QWORD *)(v5 + 136) + 4) & 0x80000000) == 0)
    {
      v19 = (_DWORD *)_nc_abiver(&_nc_abiver);
      v20 = 0;
      while (1)
      {
        if (*(__int16 *)(v18 + 6) < 0)
          goto LABEL_49;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v24 = (_QWORD *)(*(_QWORD *)(v18 + 40) + 16 * v20);
        v25 = (__int16 *)(v24 + 1);
        v26 = (__int16 *)v24 + 5;
        do
        {
          v27 = *v24;
          if (*v19 <= 0x5FFFFu || (v28 = *(_DWORD *)(v27 + v21 + 24)) == 0)
            v28 = *(unsigned __int8 *)(v27 + v21 + 1);
          if (v28 == (_DWORD)v3)
          {
            v29 = v27 + v21;
            *(_QWORD *)(v29 + 8) = 0;
            *(_QWORD *)(v29 + 16) = 0;
            *(_DWORD *)(v29 + 24) = 0;
            *(_QWORD *)v29 = 0;
            if (*v19 > 0x5FFFFu)
            {
              v30 = (_DWORD *)(*v24 + v21);
              v30[6] = 0;
              *v30 &= 0xFFFF00FF;
            }
            v31 = *v25;
            if (v31 == -1)
            {
              *v26 = v22;
            }
            else if (v22 >= v31)
            {
              if (v22 > *v26)
                *v26 = v22;
              goto LABEL_45;
            }
            *v25 = v22;
LABEL_45:
            v23 = 1;
          }
          v17 = SP;
          v18 = *(_QWORD *)(SP + 136);
          v21 += 28;
          v37 = v22++ < *(__int16 *)(v18 + 6);
        }
        while (v37);
        if ((v23 & 1) != 0)
        {
          _nc_make_oldhash(v20);
          v17 = SP;
          v18 = *(_QWORD *)(SP + 136);
        }
LABEL_49:
        v37 = v20++ < *(__int16 *)(v18 + 4);
        if (!v37)
        {
          v9 = *(_QWORD *)(v17 + 976);
          break;
        }
      }
    }
    *(_DWORD *)(v9 + 4 * (unsigned __int16)v3) = v15;
    v32 = (_DWORD *)_nc_abiver(&_nc_abiver);
    v34 = *(int **)(v33 + 744);
    if (*v32 <= 0x5FFFFu)
    {
      v36 = *v34;
      if ((_DWORD)v3 != BYTE1(*v34))
      {
LABEL_68:
        result = 0;
        if ((v7 | v6) <= 7)
        {
          v38 = (const char *)*((_QWORD *)cur_term->type.Strings + 300);
          if (v38)
          {
            if (cur_term->type.Booleans[29])
              v39 = (__int16 *)&unk_1C05E1094;
            else
              v39 = (__int16 *)&unk_1C05E1114;
            v40 = _nc_tiparm(7, v38, v3, v39[8 * (unsigned __int16)v7], v39[8 * (unsigned __int16)v7 + 1], v39[8 * (unsigned __int16)v7 + 2], v39[8 * (unsigned __int16)v6], v39[8 * (unsigned __int16)v6 + 1], v39[8 * (unsigned __int16)v6 + 2]);
            _nc_putp((int)"initialize_pair", v40);
            return 0;
          }
        }
        return result;
      }
    }
    else
    {
      v35 = v34[6];
      if (!v35)
        v35 = *((unsigned __int8 *)v34 + 1);
      if (v35 != (_DWORD)v3)
        goto LABEL_68;
      v34[6] = -1;
      v36 = *v34;
    }
    *v34 = v36 | 0xFF00;
    goto LABEL_68;
  }
  v11 = *(_DWORD *)(SP + 1004);
  v12 = a2 > 0x1FE;
  if (a2 <= 0x1FE)
  {
    if (COLORS <= (unsigned __int16)a2 || v8 <= a2)
      return result;
  }
  else
  {
    v7 = 511;
  }
  if (a3 <= 0x1FE)
  {
    if (COLORS <= (unsigned __int16)a3 || v8 <= a3)
      return result;
  }
  else
  {
    v12 = 1;
    v6 = 511;
  }
  v13 = (~v10 & 0x1FF) == 0 || (~v10 & 0x3FE00) == 0;
  v14 = !v12;
  if (v13 || (v14 & 1) != 0)
  {
    if (v13)
      v11 -= v14;
  }
  else
  {
    ++v11;
  }
  if (*(_DWORD *)(SP + 984) + v11 >= (int)v3)
  {
    *(_DWORD *)(SP + 1004) = v11;
    goto LABEL_25;
  }
  return result;
}

int init_color(__int16 a1, __int16 a2, __int16 a3, __int16 a4)
{
  TERMINAL *v4;
  const char *v5;
  uint64_t v6;
  int result;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  __int16 v19;
  BOOL v20;
  int v21;
  int v22;
  __int16 v23;
  char *v24;
  int v25;

  if (!SP)
    return -1;
  v4 = cur_term;
  v5 = (const char *)*((_QWORD *)cur_term->type.Strings + 299);
  if (!v5)
    return -1;
  v6 = a1;
  result = -1;
  if ((v6 & 0x80000000) == 0)
  {
    v8 = !*(_DWORD *)(SP + 752) || COLORS <= (int)v6;
    if (!v8
      && a4 <= 0x3E8
      && a3 <= 0x3E8
      && a2 <= 0x3E8
      && cur_term->type.Numbers[13] > (int)v6)
    {
      v9 = *(_QWORD *)(SP + 960);
      v10 = v9 + 16 * (unsigned __int16)v6;
      *(_DWORD *)(v10 + 12) = 1;
      *(_WORD *)(v10 + 6) = a2;
      *(_WORD *)(v10 + 8) = a3;
      *(_WORD *)(v10 + 10) = a4;
      if (v4->type.Booleans[29])
      {
        v11 = v9 + 16 * (unsigned __int16)v6;
        v12 = (_WORD *)(v11 + 4);
        if (a3 >= a2)
          v13 = a2;
        else
          v13 = a3;
        if (a3 <= a2)
          v14 = a2;
        else
          v14 = a3;
        if (v13 >= a4)
          v13 = a4;
        if (v14 <= a4)
          v14 = a4;
        v15 = v13 + v14;
        *(_WORD *)(v11 + 2) = (v13 + v14) / 20;
        if (v14 == v13)
        {
          *(_WORD *)v10 = 0;
          *v12 = 0;
        }
        else
        {
          if (v15 >= 1000)
            v15 = 2000 - v15;
          *v12 = 100 * (v14 - v13) / v15;
          v17 = a2 - a3;
          if (v14 == a3)
          {
            v17 = a4 - a2;
            v18 = a3;
          }
          else
          {
            v18 = v14;
          }
          if (v14 == a3)
            v19 = 240;
          else
            v19 = 360;
          v20 = v14 == a2;
          if (v14 == a2)
            v21 = a3 - a4;
          else
            v21 = v17;
          if (v20)
            v22 = a2;
          else
            v22 = v18;
          if (v20)
            v23 = 120;
          else
            v23 = v19;
          *(_WORD *)v10 = (__int16)(60 * v21 / (v22 - v13) + v23) % 360;
        }
      }
      else
      {
        *(_WORD *)v10 = a2;
        v16 = v9 + 16 * (unsigned __int16)v6;
        *(_WORD *)(v16 + 2) = a3;
        *(_WORD *)(v16 + 4) = a4;
      }
      v24 = _nc_tiparm(4, v5, v6, a2, a3, a4);
      _nc_putp((int)"initialize_color", v24);
      result = 0;
      if ((int)v6 + 1 > *(_DWORD *)(SP + 756))
        v25 = v6 + 1;
      else
        v25 = *(_DWORD *)(SP + 756);
      *(_DWORD *)(SP + 756) = v25;
    }
  }
  return result;
}

BOOL can_change_color(void)
{
  return SP && *(_QWORD *)(SP + 48) && cur_term->type.Booleans[27] != 0;
}

BOOL has_colors(void)
{
  __int16 *Numbers;
  char **Strings;

  if (!cur_term)
    return 0;
  Numbers = cur_term->type.Numbers;
  if (Numbers[13] < 0 || Numbers[14] < 0)
    return 0;
  Strings = cur_term->type.Strings;
  return Strings[302] && Strings[303] || Strings[359] && Strings[360] || Strings[301] != 0;
}

int color_content(__int16 a1, __int16 *a2, __int16 *a3, __int16 *a4)
{
  int v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  v4 = -1;
  if ((a1 & 0x80000000) == 0 && SP)
  {
    v5 = COLORS <= (unsigned __int16)a1 || cur_term->type.Numbers[13] <= a1;
    if (v5 || !*(_DWORD *)(SP + 752))
    {
      return -1;
    }
    else
    {
      v6 = *(_QWORD *)(SP + 960);
      v7 = v6 + 16 * (unsigned __int16)a1;
      v8 = *(_WORD *)(v7 + 2);
      v9 = *(_WORD *)(v7 + 4);
      if (a2)
        *a2 = *(_WORD *)(v6 + 16 * (unsigned __int16)a1);
      if (a3)
        *a3 = v8;
      v4 = 0;
      if (a4)
        *a4 = v9;
    }
  }
  return v4;
}

int pair_content(__int16 a1, __int16 *a2, __int16 *a3)
{
  int v3;
  int result;
  unsigned int v5;
  __int16 v6;
  __int16 v7;

  v3 = a1;
  result = -1;
  if ((v3 & 0x80000000) == 0 && SP && *(_DWORD *)(SP + 988) > (int)(unsigned __int16)v3 && *(_DWORD *)(SP + 752))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(SP + 976) + 4 * (unsigned __int16)v3);
    v6 = v5 & 0x1FF;
    if ((~v5 & 0x1FF) == 0)
      v6 = -1;
    if (a2)
    {
      if ((~v5 & 0x3FE00) != 0)
        v7 = (v5 >> 9) & 0x1FF;
      else
        v7 = -1;
      *a2 = v7;
    }
    result = 0;
    if (a3)
      *a3 = v6;
  }
  return result;
}

uint64_t _nc_do_color(uint64_t result, uint64_t a2, int a3, int (__cdecl *a4)(int))
{
  uint64_t v4;
  int v7;
  const char *v8;
  char *v9;
  const char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v18 = 511;
  v17 = 511;
  v16 = -1;
  v15 = -1;
  if ((a2 & 0x80000000) == 0)
  {
    v4 = SP;
    if (SP)
    {
      if (*(_DWORD *)(SP + 988) > (int)a2 && *(_DWORD *)(SP + 752))
      {
        v7 = result;
        if (!(_DWORD)a2)
          goto LABEL_51;
        v8 = (const char *)*((_QWORD *)cur_term->type.Strings + 301);
        if (v8)
        {
          v9 = _nc_tiparm(1, v8, a2);
          return tputs(v9, 1, a4);
        }
        result = pair_content(a2, &v18, &v17);
        if ((_DWORD)result != -1)
        {
LABEL_51:
          if ((v7 & 0x80000000) == 0)
          {
            result = pair_content(v7, &v16, &v15);
            if ((_DWORD)result != -1)
            {
              if (((unsigned __int16)v18 < 0x1FFu || v16 > 510 || v16 < 0)
                && ((unsigned __int16)v17 < 0x1FFu || v15 > 510 || v15 < 0))
              {
                goto LABEL_32;
              }
              if (*(_BYTE *)(v4 + 994))
              {
                if ((unsigned __int16)v15 >= 0x1FFu && v16 <= 510 && (v16 & 0x80000000) == 0)
                {
                  v10 = "\x1B[39m";
LABEL_29:
                  tputs(v10, 1, a4);
LABEL_32:
                  v13 = (unsigned __int16)v18;
                  if ((unsigned __int16)v18 >= 0x1FFu)
                  {
                    if (SP)
                      v13 = *(unsigned __int16 *)(SP + 996);
                    else
                      v13 = 7;
                    v18 = v13;
                  }
                  result = (unsigned __int16)v17;
                  if ((unsigned __int16)v17 >= 0x1FFu)
                  {
                    if (SP)
                      result = *(unsigned __int16 *)(SP + 1000);
                    else
                      result = 0;
                    v17 = result;
                  }
                  if (a3)
                  {
                    v18 = result;
                    v17 = v13;
                    v14 = v13;
                  }
                  else
                  {
                    v14 = result;
                    result = v13;
                  }
                  if (result <= 0x1FE)
                  {
                    result = sub_1C05BEDF4(result, a4);
                    v14 = (unsigned __int16)v17;
                  }
                  if (v14 <= 0x1FE)
                    return sub_1C05BEE60(v14, a4);
                  return result;
                }
                if (v16 >= 0x1FF && (unsigned __int16)v15 <= 0x1FEu)
                {
                  v10 = "\x1B[49m";
                  goto LABEL_29;
                }
              }
              v12 = (char *)*((_QWORD *)cur_term->type.Strings + 297);
              if (v12)
                _nc_putp((int)"orig_pair", v12);
              goto LABEL_32;
            }
          }
          v11 = (char *)*((_QWORD *)cur_term->type.Strings + 297);
          if (v11)
            result = _nc_putp((int)"orig_pair", v11);
          if ((v7 & 0x80000000) == 0)
            goto LABEL_32;
        }
      }
    }
  }
  return result;
}

int wcolor_set(WINDOW *a1, __int16 a2, void *a3)
{
  int result;

  result = -1;
  if ((a2 & 0x80000000) == 0 && a1 && !a3 && SP && *(int *)(SP + 988) > a2)
  {
    result = 0;
    *((_DWORD *)a1 + 29) = a2;
  }
  return result;
}

TERMINAL *__cdecl set_curterm(TERMINAL *a1)
{
  TERMINAL *v2;
  char **Strings;
  char *v4;

  v2 = cur_term;
  if (SP)
    *(_QWORD *)(SP + 48) = a1;
  cur_term = a1;
  if (a1)
  {
    ospeed = _nc_ospeed(a1->_baudrate);
    Strings = a1->type.Strings;
    if (Strings)
    {
      v4 = Strings[104];
      if (v4)
        LOBYTE(v4) = *v4;
      PC[0] = (char)v4;
    }
  }
  return v2;
}

int del_curterm(TERMINAL *a1)
{
  TERMINAL *v2;
  char *termname;

  if (!a1)
    return -1;
  v2 = cur_term;
  _nc_free_termtype(&a1->type);
  if (v2 == a1)
  {
    if (SP)
      *(_QWORD *)(SP + 48) = 0;
    cur_term = 0;
  }
  termname = a1->_termname;
  if (termname)
    free(termname);
  if (*(_QWORD *)&PC[472])
  {
    free(*(void **)&PC[472]);
    *(_QWORD *)&PC[472] = 0;
  }
  free(a1);
  return 0;
}

uint64_t _nc_screen_of(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result - 8);
  return result;
}

int wdelch(WINDOW *a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  _OWORD *v5;
  int v6;
  unint64_t v8;
  _OWORD *v9;
  _BYTE v11[28];

  if (!a1)
    return -1;
  *(_OWORD *)v11 = *(_OWORD *)((char *)a1 + 88);
  *(_OWORD *)&v11[12] = *(_OWORD *)((char *)a1 + 100);
  v1 = *((_QWORD *)a1 + 5) + 16 * *(__int16 *)a1;
  v2 = *(_QWORD *)v1;
  v3 = *((__int16 *)a1 + 3);
  v4 = *((__int16 *)a1 + 1);
  v5 = (_OWORD *)(*(_QWORD *)v1 + 28 * *((__int16 *)a1 + 1));
  v6 = *(__int16 *)(v1 + 8);
  if (v6 == -1 || v6 > v4)
    *(_WORD *)(v1 + 8) = v4;
  *(_WORD *)(v1 + 10) = v3;
  if (v4 >= v3)
  {
    v9 = v5;
  }
  else
  {
    v8 = v2 + 28 * v3;
    do
    {
      v9 = (_OWORD *)((char *)v5 + 28);
      *v5 = *(_OWORD *)((char *)v5 + 28);
      *(_OWORD *)((char *)v5 + 12) = *(_OWORD *)((char *)v5 + 40);
      v5 = v9;
    }
    while ((unint64_t)v9 < v8);
  }
  *v9 = *(_OWORD *)v11;
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)&v11[12];
  _nc_synchook(a1);
  return 0;
}

int delwin(WINDOW *a1)
{
  uint64_t *v1;
  char v3;
  uint64_t v5;
  int v6;

  if (!a1)
    return -1;
  v1 = *(uint64_t **)&PC[464];
  if (!*(_QWORD *)&PC[464])
    return -1;
  v3 = 1;
  do
  {
    while (v1 + 2 == (uint64_t *)a1)
    {
      v3 = 0;
      v1 = (uint64_t *)*v1;
      if (!v1)
        goto LABEL_13;
    }
    if ((*((_WORD *)v1 + 14) & 1) != 0 && (WINDOW *)v1[10] == a1)
      return -1;
    v1 = (uint64_t *)*v1;
  }
  while (v1);
  if ((v3 & 1) != 0)
    return -1;
LABEL_13:
  if ((*((_WORD *)a1 + 6) & 1) != 0)
  {
    v5 = *((_QWORD *)a1 + 8);
    if (!v5)
    {
      v6 = -1;
      goto LABEL_19;
    }
  }
  else
  {
    v5 = *(_QWORD *)(SP + 136);
    if (!v5)
      return _nc_freewin((uint64_t)a1);
  }
  v6 = *(__int16 *)(v5 + 4) + 1;
LABEL_19:
  wtouchln((WINDOW *)v5, 0, v6, 1);
  return _nc_freewin((uint64_t)a1);
}

int use_default_colors(void)
{
  return assume_default_colors(-1, -1);
}

int assume_default_colors(int a1, int a2)
{
  __int16 v3;
  char **Strings;
  int result;
  BOOL v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  char v11;

  v3 = a1;
  Strings = cur_term->type.Strings;
  if (!Strings[297] && !Strings[298] || Strings[300])
    return -1;
  v6 = a1 > 0x1FE;
  if (a1 <= 0x1FE)
    v7 = a1;
  else
    v7 = 511;
  if (a2 > 0x1FE)
    v6 = 1;
  *(_BYTE *)(SP + 993) = v6;
  v8 = tigetflag("AX") == 1;
  v9 = SP;
  *(_BYTE *)(SP + 994) = v8;
  *(_DWORD *)(v9 + 996) = v7;
  if (a2 >= 0x1FF)
    v10 = 511;
  else
    v10 = a2;
  *(_DWORD *)(v9 + 1000) = v10;
  if (!*(_QWORD *)(v9 + 976))
    return 0;
  v11 = *(_BYTE *)(v9 + 993);
  *(_WORD *)(v9 + 992) = 257;
  init_pair(0, v3, a2);
  result = 0;
  *(_BYTE *)(SP + 993) = v11;
  return result;
}

int echo(void)
{
  int result;

  if (!SP)
    return -1;
  result = 0;
  *(_DWORD *)(SP + 788) = 1;
  return result;
}

int noecho(void)
{
  int result;

  if (!SP)
    return -1;
  result = 0;
  *(_DWORD *)(SP + 788) = 0;
  return result;
}

int endwin(void)
{
  uint64_t v0;

  v0 = SP;
  if (!SP)
    return -1;
  *(_DWORD *)(SP + 736) = 1;
  (*(void (**)(void))(v0 + 1088))();
  _nc_screen_wrap();
  _nc_mvcur_wrap();
  return reset_shell_mode();
}

int werase(WINDOW *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  _DWORD *v5;
  uint64_t v6;
  int v7;
  _OWORD *v8;
  int v9;
  _DWORD *v10;
  uint64_t v11;
  _BYTE v14[28];

  if (!a1)
    return -1;
  *(_OWORD *)v14 = *(_OWORD *)((char *)a1 + 88);
  *(_OWORD *)&v14[12] = *(_OWORD *)((char *)a1 + 100);
  v1 = *((__int16 *)a1 + 2);
  if ((v1 & 0x80000000) == 0)
  {
    v2 = 0;
    v3 = *((_QWORD *)a1 + 5);
    v4 = *((_WORD *)a1 + 3);
    do
    {
      v5 = *(_DWORD **)(v3 + 16 * v2);
      if ((*v5 & 0xFEu) - 2 > 0x1D)
      {
        v8 = *(_OWORD **)(v3 + 16 * v2);
      }
      else
      {
        v6 = *((_QWORD *)a1 + 8);
        if (v6)
          LODWORD(v6) = *((__int16 *)a1 + 5);
        v7 = v6 + 1;
        v8 = *(_OWORD **)(v3 + 16 * v2);
        do
        {
          if (--v7 < 1)
            break;
          v9 = *((unsigned __int8 *)v8 - 28);
          v8 = (_OWORD *)((char *)v8 - 28);
        }
        while (v9 != 1);
      }
      v10 = &v5[7 * v4];
      if (v8 <= (_OWORD *)v10)
      {
        do
        {
          *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)&v14[12];
          *v8 = *(_OWORD *)v14;
          v8 = (_OWORD *)((char *)v8 + 28);
        }
        while (v8 <= (_OWORD *)v10);
        v3 = *((_QWORD *)a1 + 5);
        v4 = *((_WORD *)a1 + 3);
        LOWORD(v1) = *((_WORD *)a1 + 2);
      }
      v11 = v3 + 16 * v2;
      *(_WORD *)(v11 + 8) = 0;
      *(_WORD *)(v11 + 10) = v4;
    }
    while (v2++ < (__int16)v1);
  }
  *(_DWORD *)a1 = 0;
  *((_WORD *)a1 + 6) &= ~0x40u;
  _nc_synchook(a1);
  return 0;
}

uint64_t erasewchar(_DWORD *a1)
{
  uint64_t result;
  int v3;

  result = erasechar();
  if ((_DWORD)result != -1)
  {
    v3 = result;
    result = 0;
    *a1 = v3;
  }
  return result;
}

uint64_t killwchar(_DWORD *a1)
{
  uint64_t result;
  int v3;

  result = killchar();
  if ((_DWORD)result != -1)
  {
    v3 = result;
    result = 0;
    *a1 = v3;
  }
  return result;
}

int flash(void)
{
  char **Strings;
  char *v1;
  const char *v2;

  if (SP && *(_QWORD *)(SP + 48))
  {
    Strings = cur_term->type.Strings;
    v1 = Strings[45];
    if (v1)
    {
      v2 = "flash_screen";
      return _nc_putp_flush((int)v2, v1);
    }
    v1 = Strings[1];
    if (v1)
    {
      v2 = "bell";
      return _nc_putp_flush((int)v2, v1);
    }
  }
  return -1;
}

void _nc_free_and_exit(int a1)
{
  TERMINAL *v2;

  if (SP)
  {
    delscreen((SCREEN *)SP);
    v2 = *(TERMINAL **)(SP + 48);
    if (v2)
      del_curterm(v2);
  }
  exit(a1);
}

uint64_t wget_wch(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  __int16 *v15;
  __int32 v17;
  int v18;
  char __s[55];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  if (_nc_screen_of(a1))
  {
    v4 = 0;
    v17 = 0;
    while (1)
    {
      v5 = _nc_wgetch(a1, &v18, 1);
      v6 = v5;
      if ((_DWORD)v5 == -1)
        goto LABEL_16;
      if ((_DWORD)v5 == 256)
        break;
      v7 = v18;
      if (v4 == 54)
      {
        v15 = (__int16 *)SP;
        goto LABEL_14;
      }
      v8 = v4 + 1;
      __s[v4] = v18;
      v9 = mblen(0, 0);
      *__error() = v9;
      v10 = mbtowc(0, 0, 0);
      *__error() = v10;
      v11 = mblen(__s, ++v4);
      if ((v11 & 0x80000000) == 0)
      {
        v12 = v11;
        v13 = mblen(0, 0);
        *__error() = v13;
        v14 = mbtowc(0, 0, 0);
        *__error() = v14;
        if (mbtowc(&v17, __s, v8) != v12)
        {
          _nc_ungetch((__int16 *)SP, v18);
          v6 = 0xFFFFFFFFLL;
        }
        v18 = v17;
        if (!a2)
          return v6;
LABEL_17:
        *a2 = v18;
        return v6;
      }
    }
    if (!v4)
    {
      v6 = 256;
      if (!a2)
        return v6;
      goto LABEL_17;
    }
    v15 = (__int16 *)SP;
    v7 = v18;
LABEL_14:
    _nc_ungetch(v15, v7);
  }
  v6 = 0xFFFFFFFFLL;
LABEL_16:
  if (a2)
    goto LABEL_17;
  return v6;
}

uint64_t wgetn_wstr(WINDOW *a1, __int32 *a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  int32x4_t *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  __int32 *v13;
  int v14;
  int v16;
  int v17;
  __int16 v18;
  WINDOW *v19;
  int v20;
  int v21;
  __int32 *v22;
  unint64_t v23;
  int v24;
  int v25;
  int8x16_t v26;
  uint64_t result;
  int32x4_t *v28;
  int32x4_t v29;
  int v30;
  int v31;
  int v32;
  termios buf;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = _nc_screen_of((uint64_t)a1);
  if (!a1)
    return 0xFFFFFFFFLL;
  v7 = v6;
  memset(&buf, 0, sizeof(buf));
  v32 = 0;
  _nc_get_tty_mode(&buf);
  v8 = (int32x4_t *)(v7 + 776);
  v29 = *v8;
  nl();
  noecho();
  noraw();
  cbreak();
  v31 = erasechar();
  v30 = killchar();
  v9 = *(__int16 *)a1;
  v10 = *((__int16 *)a1 + 1);
  if (is_wintouched(a1) || (*((_WORD *)a1 + 6) & 0x20) != 0)
    wrefresh(a1);
  v11 = wget_wch((uint64_t)a1, &v32);
  if (v11 == -1)
  {
    v24 = 1;
    v13 = a2;
    goto LABEL_57;
  }
  v28 = v8;
  v12 = vmovn_s32(vtstq_s32(v29, v29)).i8[6] & 1;
  v13 = a2;
  while (1)
  {
    v14 = v32;
    if (v32 == 13 || v32 == 10)
      break;
    if (v32 <= 256)
    {
      if (v32 == v31)
      {
        v32 = 263;
LABEL_44:
        if (v13 <= a2)
          goto LABEL_21;
        v19 = a1;
        v20 = v9;
        v21 = v10;
        v22 = a2;
        v23 = (unint64_t)v13;
        goto LABEL_20;
      }
      if (v32 == v30)
      {
        v32 = 335;
LABEL_40:
        while (v13 > a2)
          v13 = (__int32 *)sub_1C05C0444(a1, v9, v10, a2, (unint64_t)v13, v12);
        goto LABEL_21;
      }
    }
    if (v11 == 256)
    {
      if (v32 <= 262)
      {
        if (v32 != 260)
        {
          if (v32 == 258)
            goto LABEL_49;
LABEL_47:
          beep();
          goto LABEL_21;
        }
      }
      else if (v32 != 263)
      {
        if (v32 == 335)
          goto LABEL_40;
        if (v32 == 343)
          goto LABEL_49;
        goto LABEL_47;
      }
      goto LABEL_44;
    }
    if ((a3 & 0x80000000) == 0 && a3 <= v13 - a2)
      goto LABEL_47;
    v13[1] = 0;
    *v13 = v14;
    if (!v12)
      goto LABEL_37;
    v16 = *(unsigned __int16 *)a1;
    v17 = sub_1C05C0504(a1, v13);
    v18 = *((_WORD *)a1 + 6);
    if (v17 != -1)
    {
      if ((v18 & 0x40) != 0)
      {
        if (*((_BYTE *)a1 + 27) && v16 == *((unsigned __int16 *)a1 + 2) && *(unsigned __int16 *)a1 == v16)
        {
          if (v9 >= 2)
            --v9;
          else
            v9 = 0;
        }
        *((_WORD *)a1 + 6) = v18 & 0xFFBF;
      }
      wrefresh(a1);
LABEL_37:
      ++v13;
      goto LABEL_21;
    }
    *((_WORD *)a1 + 6) = v18 & 0xFFBF;
    waddch(a1, 0x20u);
    v19 = a1;
    v20 = v9;
    v21 = v10;
    v22 = a2;
    v23 = (unint64_t)(v13 + 1);
LABEL_20:
    v13 = (__int32 *)sub_1C05C0444(v19, v20, v21, v22, v23, v12);
LABEL_21:
    v11 = wget_wch((uint64_t)a1, &v32);
    if (v11 == -1)
    {
      v24 = 1;
LABEL_56:
      v8 = v28;
      goto LABEL_57;
    }
  }
  v32 = 343;
LABEL_49:
  if (!v12 || *(unsigned __int16 *)a1 != *((unsigned __int16 *)a1 + 2))
  {
    v24 = 0;
    goto LABEL_56;
  }
  v8 = v28;
  if (*((_BYTE *)a1 + 27))
    wechochar(a1, 0xAu);
  v24 = 0;
LABEL_57:
  *((_WORD *)a1 + 1) = 0;
  *((_WORD *)a1 + 6) &= ~0x40u;
  v25 = *(__int16 *)a1;
  if (v25 < *((__int16 *)a1 + 2))
    *(_WORD *)a1 = v25 + 1;
  wrefresh(a1);
  v26.i64[0] = 0x100000001;
  v26.i64[1] = 0x100000001;
  *(int8x16_t *)v8 = vbicq_s8(v26, (int8x16_t)vceqzq_s32(v29));
  _nc_set_tty_mode(&buf);
  result = 0;
  *v13 = 0;
  if (v24)
  {
    if (v13 == a2)
      *(_QWORD *)a2 = 0xFFFFFFFFLL;
    return 0xFFFFFFFFLL;
  }
  return result;
}

unint64_t sub_1C05C0444(WINDOW *a1, int a2, int a3, __int32 *a4, unint64_t a5, int a6)
{
  unint64_t v6;
  __int32 *v7;
  int v9;
  int v10;
  __int32 v11;
  int v12;
  unsigned __int16 v13;
  int v14;

  v6 = a5;
  if (a5 > (unint64_t)a4)
  {
    *(_DWORD *)(a5 - 4) = 0;
    v6 = a5 - 4;
    if (a6)
    {
      v7 = a4;
      v9 = *(__int16 *)a1;
      v10 = *((__int16 *)a1 + 1);
      wmove(a1, a2, a3);
      if (*v7)
      {
        do
        {
          sub_1C05C0504(a1, v7);
          v11 = v7[1];
          ++v7;
        }
        while (v11);
      }
      v12 = *(__int16 *)a1;
      v13 = *(_WORD *)a1;
      v14 = *((__int16 *)a1 + 1);
      while (v9 > (__int16)v13 || v13 == (unsigned __int16)v9 && *((__int16 *)a1 + 1) < v10)
      {
        waddch(a1, 0x20u);
        v13 = *(_WORD *)a1;
      }
      wmove(a1, v12, v14);
    }
  }
  return v6;
}

uint64_t sub_1C05C0504(WINDOW *a1, __int32 *a2)
{
  __int128 v4;
  uint64_t v5;
  int v6;
  __int32 v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 0uLL;
  v6 = 0;
  v5 = 0;
  v7[0] = *a2;
  v7[1] = 0;
  setcchar((unsigned __int8 *)&v4, v7, 0, 0, 0);
  return wadd_wch(a1, &v4);
}

int set_escdelay(int a1)
{
  ESCDELAY = a1;
  return 0;
}

int get_escdelay(void)
{
  return ESCDELAY;
}

uint64_t _nc_wgetch(uint64_t a1, int *a2, int a3)
{
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t *v16;
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  unsigned __int16 v21;
  int v22;
  int v23;
  unsigned __int16 v24;
  int v25;
  int v26;
  int v27;
  unsigned __int16 v28;
  int v29;
  int v30;
  unsigned __int16 v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  unsigned __int16 v37;
  __int16 *v38;
  int v39;
  __int16 v40;
  BOOL v41;
  _BOOL4 v42;
  int v43;
  chtype v44;
  BOOL v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int16 v50;
  int v51;
  __int16 v52;
  int64_t v53;
  char *v54;
  int v55;
  int v56;
  void *v57;
  char __s[135];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  *a2 = 0;
  v6 = _nc_screen_of(a1);
  result = 0xFFFFFFFFLL;
  if (!a1 || !v6)
    return result;
  v8 = *(unsigned __int16 *)(v6 + 728);
  if (*(__int16 *)(v6 + 728) < 0)
  {
    if (v8 == 0xFFFF
      && !*(_BYTE *)(v6 + 772)
      && !*(_DWORD *)(v6 + 780)
      && !*(_DWORD *)(v6 + 784)
      && !*(_BYTE *)(v6 + 178))
    {
      if (sub_1C05C0D48((WINDOW *)a1, __s) != -1)
        _nc_ungetch((__int16 *)v6, 10);
      v53 = strlen(__s);
      if (v53 >= 1)
      {
        v54 = &__s[v53];
        do
        {
          v55 = *--v54;
          _nc_ungetch((__int16 *)v6, v55);
        }
        while (v54 > __s);
      }
      v56 = sub_1C05C0CDC((unsigned __int16 *)v6);
      v33 = v56 > 256;
      *a2 = v56;
      return (v33 << 8);
    }
  }
  else if (*(unsigned __int16 *)(v6 + 732) != v8)
  {
    sub_1C05C0C90(a1);
    v9 = *(unsigned __int16 *)(v6 + 728);
    if (*(__int16 *)(v6 + 728) < 0)
      v10 = -1;
    else
      v10 = *(_DWORD *)(v6 + 4 * v9 + 180);
    v30 = *(unsigned __int16 *)(v6 + 732);
    if ((__int16)v9 <= 135)
      v31 = v9 + 1;
    else
      v31 = 0;
    *(_WORD *)(v6 + 728) = v31;
    v32 = *(unsigned __int16 *)(v6 + 730);
    if (v30 == (_DWORD)v9)
    {
      if (v32 == v31)
      {
        v31 = -1;
        *(_DWORD *)(v6 + 728) = 0xFFFF;
      }
      *(_WORD *)(v6 + 732) = v31;
    }
    else if (v32 == v31)
    {
      *(_DWORD *)(v6 + 728) = 0xFFFF;
    }
    *a2 = v10;
    goto LABEL_99;
  }
  v11 = *(unsigned __int8 *)(a1 + 32);
  if (v11 != *(unsigned __int8 *)(v6 + 177))
    _nc_keypad(v6, v11);
  sub_1C05C0C90(a1);
  if ((*(_BYTE *)(a1 + 24) || (*(_DWORD *)(a1 + 36) & 0x80000000) == 0 || *(int *)(v6 + 784) >= 2)
    && *(__int16 *)(v6 + 728) == -1)
  {
    v12 = *(_DWORD *)(v6 + 784);
    v13 = v12 < 2 ? *(_DWORD *)(a1 + 36) : 100 * v12 - 100;
    if (!_nc_timed_wait((int *)v6, 3, v13, 0))
    {
LABEL_149:
      if (!_nc_handle_sigwinch(v6))
        return 0xFFFFFFFFLL;
      _nc_update_screensize(v6);
      if (*(__int16 *)(v6 + 728) < 0)
        return 0xFFFFFFFFLL;
      v48 = *(unsigned __int16 *)(v6 + 728);
      v49 = *(unsigned __int16 *)(v6 + 732);
      if ((_DWORD)v49 == *(unsigned __int16 *)(v6 + 728))
        return 0xFFFFFFFFLL;
      v10 = *(_DWORD *)(v6 + 4 * v48 + 180);
      if (v48 <= 0x87)
        v50 = v48 + 1;
      else
        v50 = 0;
      *(_WORD *)(v6 + 728) = v50;
      if (*(unsigned __int16 *)(v6 + 730) == v50)
        *(_DWORD *)(v6 + 728) = 0xFFFF;
      *a2 = v10;
      if ((v49 & 0x8000) != 0)
      {
        *(_WORD *)(v6 + 732) = v49 + 1;
      }
      else
      {
        v51 = *(_DWORD *)(v6 + 4 * v49 + 180);
        if (v49 <= 0x87)
          v52 = v49 + 1;
        else
          v52 = 0;
        *(_WORD *)(v6 + 732) = v52;
        if (v51 != -1)
          goto LABEL_99;
      }
      sub_1C05C0CDC((unsigned __int16 *)v6);
      v10 = *a2;
LABEL_99:
      v33 = v10 > 256;
      return (v33 << 8);
    }
  }
  if (!*(_BYTE *)(a1 + 32))
  {
    v29 = *(unsigned __int16 *)(v6 + 728);
    if (v29 == 0xFFFF)
    {
      if (*(__int16 *)(v6 + 730) < 0)
      {
        LOWORD(v29) = -1;
        goto LABEL_121;
      }
      __s[0] = 0;
      v34 = read(*(_DWORD *)v6, __s, 1uLL);
      v35 = __s[0];
      if ((v34 + 1) < 2)
        v35 = -1;
      v36 = *(__int16 *)(v6 + 730);
      *(_DWORD *)(v6 + 4 * v36 + 180) = v35;
      *(_WORD *)(v6 + 734) = 0;
      v29 = *(unsigned __int16 *)(v6 + 728);
      if (v29 == 0xFFFF)
      {
        *(_WORD *)(v6 + 732) = v36;
        *(_WORD *)(v6 + 728) = v36;
        LOWORD(v29) = v36;
      }
      if ((int)v36 <= 135)
        v37 = v36 + 1;
      else
        v37 = 0;
      if (v37 == (unsigned __int16)v29)
        v37 = -1;
      *(_WORD *)(v6 + 730) = v37;
      if ((v29 & 0x8000) != 0)
      {
LABEL_121:
        v43 = *(unsigned __int16 *)(v6 + 732);
        v40 = v29 + 1;
        *(_WORD *)(v6 + 728) = v29 + 1;
        v42 = *(unsigned __int16 *)(v6 + 730) == (unsigned __int16)(v29 + 1);
        v19 = -1;
        if (v43 == (unsigned __int16)v29)
        {
          v38 = (__int16 *)(v6 + 732);
LABEL_123:
          if (v42)
          {
            v40 = -1;
            *(_DWORD *)(v6 + 728) = 0xFFFF;
          }
          *v38 = v40;
          goto LABEL_128;
        }
LABEL_126:
        if (v42)
          *(_DWORD *)(v6 + 728) = 0xFFFF;
LABEL_128:
        if (v19 != -1)
          goto LABEL_129;
        goto LABEL_149;
      }
    }
    else if ((v29 & 0x8000) != 0)
    {
      goto LABEL_121;
    }
    v19 = *(_DWORD *)(v6 + 4 * (unsigned __int16)v29 + 180);
    v38 = (__int16 *)(v6 + 732);
    v39 = *(unsigned __int16 *)(v6 + 732);
    if ((unsigned __int16)v29 < 0x88u)
    {
      v40 = v29 + 1;
      *(_WORD *)(v6 + 728) = v29 + 1;
      v41 = *(unsigned __int16 *)(v6 + 730) == (unsigned __int16)(v29 + 1);
    }
    else
    {
      v40 = 0;
      *(_WORD *)(v6 + 728) = 0;
      v41 = *(unsigned __int16 *)(v6 + 730) == 0;
    }
    v42 = v41;
    if (v39 == (unsigned __int16)v29)
      goto LABEL_123;
    goto LABEL_126;
  }
  LODWORD(v14) = 0;
  v57 = (void *)(v6 + 180);
  while (2)
  {
    v15 = ESCDELAY;
    v16 = *(uint64_t **)(v6 + 160);
    do
    {
      v17 = *(__int16 *)(v6 + 728);
      if (v17 < 0)
      {
        LOWORD(v18) = *(_WORD *)(v6 + 730);
      }
      else
      {
        v18 = *(unsigned __int16 *)(v6 + 732);
        if (v18 != (unsigned __int16)v17)
        {
          v19 = *(_DWORD *)(v6 + 4 * *(unsigned __int16 *)(v6 + 728) + 180);
          if (v19 > 256)
            goto LABEL_61;
        }
        LODWORD(v20) = *(unsigned __int16 *)(v6 + 730);
        if (v18 != (_DWORD)v20)
        {
          if ((v18 & 0x8000) != 0)
            goto LABEL_48;
          goto LABEL_30;
        }
      }
      if ((v18 & 0x8000) != 0)
        goto LABEL_84;
      __s[0] = 0;
      v22 = read(*(_DWORD *)v6, __s, 1uLL);
      v23 = __s[0];
      if ((v22 + 1) < 2)
        v23 = -1;
      v20 = *(__int16 *)(v6 + 730);
      *(_DWORD *)(v6 + 4 * v20 + 180) = v23;
      *(_WORD *)(v6 + 734) = 0;
      v17 = *(unsigned __int16 *)(v6 + 728);
      if (v17 == 0xFFFF)
      {
        *(_WORD *)(v6 + 732) = v20;
        *(_WORD *)(v6 + 728) = v20;
        LOWORD(v17) = v20;
      }
      if ((int)v20 <= 135)
        LOWORD(v20) = v20 + 1;
      else
        LOWORD(v20) = 0;
      if ((unsigned __int16)v20 == (unsigned __int16)v17)
        LOWORD(v20) = -1;
      *(_WORD *)(v6 + 730) = v20;
      if ((v22 + 1) < 2)
      {
LABEL_84:
        *(_WORD *)(v6 + 732) = v17;
        v19 = -1;
        goto LABEL_85;
      }
      v18 = *(unsigned __int16 *)(v6 + 732);
      if ((v18 & 0x8000) != 0)
      {
LABEL_48:
        v21 = v18 + 1;
        *(_WORD *)(v6 + 732) = v21;
        LOBYTE(v19) = -1;
        goto LABEL_49;
      }
LABEL_30:
      v19 = *(_DWORD *)(v6 + 4 * v18 + 180);
      if (v18 <= 0x87)
        v21 = v18 + 1;
      else
        v21 = 0;
      *(_WORD *)(v6 + 732) = v21;
      if (v19 > 256)
      {
        *(_WORD *)(v6 + 732) = v17;
        v27 = (__int16)v20;
        v28 = v20 - 1;
        if (v27 < 1)
          v28 = 136;
        *(_WORD *)(v6 + 730) = v28;
        if ((unsigned __int16)v17 == v28)
        {
          bzero(v57, 0x224uLL);
          *(_DWORD *)(v6 + 728) = 0xFFFF;
          *(_WORD *)(v6 + 732) = 0;
        }
        goto LABEL_67;
      }
LABEL_49:
      if (!v16)
        goto LABEL_58;
      while (*((unsigned __int8 *)v16 + 16) != v19)
      {
        v16 = (uint64_t *)v16[1];
        if (!v16)
          goto LABEL_58;
      }
      if (*((_WORD *)v16 + 9))
      {
        if (v21 == (unsigned __int16)v20)
        {
          bzero(v57, 0x224uLL);
          *(_DWORD *)(v6 + 730) = 0;
          v21 = -1;
        }
        *(_WORD *)(v6 + 728) = v21;
        v19 = *((unsigned __int16 *)v16 + 9);
        goto LABEL_67;
      }
      v16 = (uint64_t *)*v16;
    }
    while ((v17 & 0x8000) == 0 && v21 != (unsigned __int16)v20 || _nc_timed_wait((int *)v6, 3, v15, 0));
    LOWORD(v17) = *(_WORD *)(v6 + 728);
LABEL_58:
    if ((v17 & 0x8000) != 0)
      v19 = -1;
    else
      v19 = *(_DWORD *)(v6 + 4 * (unsigned __int16)v17 + 180);
LABEL_61:
    if ((__int16)v17 <= 135)
      v24 = v17 + 1;
    else
      v24 = 0;
    *(_WORD *)(v6 + 728) = v24;
    if (*(unsigned __int16 *)(v6 + 730) == v24)
    {
      v24 = -1;
      *(_DWORD *)(v6 + 728) = 0xFFFF;
    }
    *(_WORD *)(v6 + 732) = v24;
LABEL_67:
    if (v19 != 409)
    {
LABEL_85:
      if (!(_DWORD)v14)
        goto LABEL_128;
      _nc_ungetch((__int16 *)v6, v19);
      break;
    }
    if (((*(uint64_t (**)(uint64_t))(v6 + 1064))(v6) & 1) == 0)
    {
      v25 = *(_DWORD *)(v6 + 1052);
      if ((v25 & 0x80000000) == 0)
      {
        v14 = (v14 + 1);
        v26 = _nc_timed_wait((int *)v6, 3, v25, 0);
        if (v26)
        {
          if ((v26 & 4) == 0)
            continue;
        }
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v6 + 1072))(v6, v14) & 1) == 0)
          continue;
      }
    }
    break;
  }
  v19 = 409;
LABEL_129:
  if (*(_DWORD *)(v6 + 788) && (*(_WORD *)(a1 + 12) & 0x10) == 0)
  {
    v44 = v19 == 263 ? 8 : v19;
    if (v44 <= 0x100)
      wechochar((WINDOW *)a1, v44);
  }
  if (v19 == 13)
  {
    if (*(_DWORD *)(v6 + 776))
      v19 = 10;
    else
      v19 = 13;
  }
  v46 = (v19 & 0x80) != 0 && v19 <= 256 && a3 == 0;
  v47 = v19 & 0x7F;
  if (!v46)
    v47 = v19;
  *a2 = v47;
  return (v47 > 256) << 8;
}

uint64_t sub_1C05C0C90(uint64_t a1)
{
  uint64_t result;

  result = is_wintouched((WINDOW *)a1);
  if ((result | ((*(_WORD *)(a1 + 12) & 0x20) >> 5)) == 1
    && (*(_WORD *)(a1 + 12) & 0x10) == 0)
  {
    return wrefresh((WINDOW *)a1);
  }
  return result;
}

uint64_t sub_1C05C0CDC(unsigned __int16 *a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned __int16 v4;
  int v5;

  v1 = a1[364];
  if ((__int16)a1[364] < 0)
    v2 = 0xFFFFFFFFLL;
  else
    v2 = *(unsigned int *)&a1[2 * v1 + 90];
  v3 = a1[366];
  if ((__int16)v1 <= 135)
    v4 = v1 + 1;
  else
    v4 = 0;
  a1[364] = v4;
  v5 = a1[365];
  if (v3 == (_DWORD)v1)
  {
    if (v5 == v4)
    {
      v4 = -1;
      *((_DWORD *)a1 + 182) = 0xFFFF;
    }
    a1[366] = v4;
  }
  else if (v5 == v4)
  {
    *((_DWORD *)a1 + 182) = 0xFFFF;
  }
  return v2;
}

uint64_t sub_1C05C0D48(WINDOW *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = _nc_screen_of((uint64_t)a1);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  *(_BYTE *)(v4 + 178) = 1;
  result = wgetnstr(a1, a2, 135);
  *(_BYTE *)(v5 + 178) = 0;
  return result;
}

int wgetch(WINDOW *a1)
{
  uint64_t v2;
  int v3;
  int v5;

  v2 = _nc_screen_of((uint64_t)a1);
  if (v2)
    v3 = *(_DWORD *)(v2 + 792);
  else
    v3 = 0;
  v5 = 0;
  if (_nc_wgetch((uint64_t)a1, &v5, v3) == -1)
    return -1;
  else
    return v5;
}

int wgetnstr(WINDOW *a1, char *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int32x2_t v8;
  int v9;
  int v10;
  int v11;
  char *v12;
  signed int v13;
  int v14;
  int v15;
  int v16;
  __int16 v17;
  int v18;
  int v19;
  int v21;
  int8x8_t *v22;
  int v23;
  termios buf;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = _nc_screen_of((uint64_t)a1);
  if (!a1)
    return -1;
  v6 = v5;
  memset(&buf, 0, sizeof(buf));
  _nc_get_tty_mode(&buf);
  v7 = *(_DWORD *)(v6 + 788);
  v8 = *(int32x2_t *)(v6 + 776);
  v22 = (int8x8_t *)v6;
  v21 = *(_DWORD *)(v6 + 784);
  nl();
  noecho();
  noraw();
  cbreak();
  v9 = erasechar();
  v23 = killchar();
  v10 = *(__int16 *)a1;
  v11 = *((__int16 *)a1 + 1);
  if (is_wintouched(a1) || (*((_WORD *)a1 + 6) & 0x20) != 0)
    wrefresh(a1);
  v12 = a2;
  while (1)
  {
    v13 = wgetch(a1);
    v14 = v13;
    if (v13 > 12)
    {
      if (v13 == 13 || v13 == 343 || v13 == 258)
        break;
      goto LABEL_13;
    }
    if (v13 == -1)
      goto LABEL_44;
    if (v13 == 10)
      break;
LABEL_13:
    if ((v13 & 0xFFFFFFFE) == 0x19A)
      goto LABEL_44;
    if (v13 == v9 || v13 == 263 || v13 == 260)
    {
      if (v12 > a2)
LABEL_24:
        v12 = (char *)sub_1C05C1128(a1, v10, v11, a2, (unint64_t)v12, v7 != 0);
    }
    else if (v13 == v23)
    {
      for (; v12 > a2; v12 = (char *)sub_1C05C1128(a1, v10, v11, a2, (unint64_t)v12, v7 != 0))
        ;
    }
    else if (v13 <= 256 && (a3 < 0 || v12 - a2 < a3))
    {
      *v12++ = v13;
      if (v7)
      {
        v15 = *(unsigned __int16 *)a1;
        v16 = waddch(a1, v13);
        v17 = *((_WORD *)a1 + 6);
        if (v16 == -1)
        {
          *((_WORD *)a1 + 6) = v17 & 0xFFBF;
          waddch(a1, 0x20u);
          goto LABEL_24;
        }
        if ((v17 & 0x40) != 0)
        {
          if (*((_BYTE *)a1 + 27) && v15 == *((unsigned __int16 *)a1 + 2) && *(unsigned __int16 *)a1 == v15)
          {
            if (v10 >= 2)
              --v10;
            else
              v10 = 0;
          }
          *((_WORD *)a1 + 6) = v17 & 0xFFBF;
        }
        wrefresh(a1);
      }
    }
    else
    {
      beep();
    }
  }
  if (v7 && *(unsigned __int16 *)a1 == *((unsigned __int16 *)a1 + 2) && *((_BYTE *)a1 + 27))
    wechochar(a1, 0xAu);
LABEL_44:
  *((_WORD *)a1 + 1) = 0;
  *((_WORD *)a1 + 6) &= ~0x40u;
  v18 = *(__int16 *)a1;
  if (v18 < *((__int16 *)a1 + 2))
    *(_WORD *)a1 = v18 + 1;
  wrefresh(a1);
  v22[98].i32[1] = v7 != 0;
  v22[97] = vbic_s8((int8x8_t)0x100000001, (int8x8_t)vceqz_s32(v8));
  v22[98].i32[0] = v21 != 0;
  _nc_set_tty_mode(&buf);
  *v12 = 0;
  if (v14 == -1)
    v19 = -1;
  else
    v19 = 0;
  if ((v14 - 410) >= 2)
    return v19;
  else
    return v14;
}

unint64_t sub_1C05C1128(WINDOW *a1, int a2, int a3, const char *a4, unint64_t a5, int a6)
{
  unint64_t v6;
  int v9;
  int v10;
  int v11;
  unsigned __int16 v12;
  int v13;

  v6 = a5;
  if (a5 > (unint64_t)a4)
  {
    *(_BYTE *)(a5 - 1) = 0;
    v6 = a5 - 1;
    if (a6)
    {
      v9 = *(__int16 *)a1;
      v10 = *((__int16 *)a1 + 1);
      wmove(a1, a2, a3);
      waddnstr(a1, a4, -1);
      v11 = *(__int16 *)a1;
      v12 = *(_WORD *)a1;
      v13 = *((__int16 *)a1 + 1);
      while (v9 > (__int16)v12 || v12 == (unsigned __int16)v9 && *((__int16 *)a1 + 1) < v10)
      {
        waddch(a1, 0x20u);
        v12 = *(_WORD *)a1;
      }
      wmove(a1, v11, v13);
    }
  }
  return v6;
}

BOOL has_ic(void)
{
  char **Strings;

  if (!cur_term)
    return 0;
  Strings = cur_term->type.Strings;
  if (!Strings[52] && !Strings[108] && (!Strings[31] || !Strings[42]))
    return 0;
  if (Strings[21])
    return 1;
  return Strings[105] != 0;
}

BOOL has_il(void)
{
  char **Strings;

  if (!cur_term)
    return 0;
  Strings = cur_term->type.Strings;
  if (!Strings[53] && !Strings[110])
    return 0;
  if (Strings[22])
    return 1;
  return Strings[106] != 0;
}

int whline(WINDOW *a1, chtype a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int v20;

  if (!a1)
    return -1;
  v4 = *((_QWORD *)a1 + 5) + 16 * *(__int16 *)a1;
  v5 = *((__int16 *)a1 + 1);
  v6 = a3 + v5 - 1;
  v7 = *((__int16 *)a1 + 3);
  if (v6 >= v7)
    v8 = *((__int16 *)a1 + 3);
  else
    v8 = a3 + v5 - 1;
  v9 = *(__int16 *)(v4 + 8);
  if (v9 == -1 || v9 > (int)v5)
    *(_WORD *)(v4 + 8) = v5;
  v11 = *(__int16 *)(v4 + 10);
  if (v11 == -1 || v8 > v11)
    *(_WORD *)(v4 + 10) = v8;
  if (a2)
    _nc_abiver(&_nc_abiver);
  else
    _nc_abiver(&_nc_abiver);
  _nc_render();
  if (v8 >= (int)v5)
  {
    v14 = v6;
    if (v7 < (uint64_t)v6)
      v14 = v7;
    v15 = v14 + 1;
    v16 = 28 * v14;
    do
    {
      v17 = *(_QWORD *)v4 + v16;
      *(_QWORD *)v17 = v18;
      *(_OWORD *)(v17 + 8) = v19;
      *(_DWORD *)(v17 + 24) = v20;
      --v15;
      v16 -= 28;
    }
    while (v15 > v5);
  }
  _nc_synchook(a1);
  return 0;
}

uint64_t whline_set(__int16 *a1, _OWORD *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v11;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _BYTE v19[28];

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = *((_QWORD *)a1 + 5) + 16 * *a1;
  v5 = a1[1];
  v6 = a3 + v5 - 1;
  v7 = a1[3];
  if (v6 >= v7)
    v8 = a1[3];
  else
    v8 = a3 + v5 - 1;
  v9 = *(__int16 *)(v4 + 8);
  if (v9 == -1 || v9 > (int)v5)
    *(_WORD *)(v4 + 8) = v5;
  v11 = *(__int16 *)(v4 + 10);
  if (v11 == -1 || v8 > v11)
    *(_WORD *)(v4 + 10) = v8;
  v13 = (_OWORD *)(_nc_wacs + 3164);
  if (a2)
    v13 = a2;
  *(_OWORD *)v19 = *v13;
  *(_OWORD *)&v19[12] = *(_OWORD *)((char *)v13 + 12);
  _nc_render();
  if (v8 >= (int)v5)
  {
    v14 = v6;
    if (v7 < (uint64_t)v6)
      v14 = v7;
    v15 = v14 + 1;
    v16 = 28 * v14;
    do
    {
      v17 = (_OWORD *)(*(_QWORD *)v4 + v16);
      *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)&v19[12];
      *v17 = *(_OWORD *)v19;
      --v15;
      v16 -= 28;
    }
    while (v15 > v5);
  }
  _nc_synchook((WINDOW *)a1);
  return 0;
}

void immedok(WINDOW *a1, BOOL a2)
{
  if (a1)
    *((_BYTE *)a1 + 30) = a2;
}

__n128 win_wch(__int16 *a1, uint64_t a2)
{
  uint64_t v2;
  __n128 result;

  if (a1)
  {
    if (a2)
    {
      v2 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * *a1) + 28 * a1[1];
      result = *(__n128 *)v2;
      *(_OWORD *)(a2 + 12) = *(_OWORD *)(v2 + 12);
      *(__n128 *)a2 = result;
    }
  }
  return result;
}

uint64_t win_wchnstr(__int16 *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;

  v3 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v4 = a1[3] - a1[1];
    if (v4 + 1 < a3)
      v5 = v4 + 1;
    else
      v5 = a3;
    if (a3 < 0)
      v6 = v4 + 1;
    else
      v6 = v5;
    if (v6 < 1)
    {
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * *a1) + 28 * a1[1];
      v10 = 28 * v6;
      do
      {
        if (!v7 || (*(_BYTE *)(v9 + v7) & 0xFE) == 0)
        {
          v11 = (_OWORD *)(a2 + 28 * v8);
          v12 = *(_OWORD *)(v9 + v7);
          ++v8;
          *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)(v9 + v7 + 12);
          *v11 = v12;
        }
        v7 += 28;
      }
      while (v10 != v7);
    }
    v3 = 0;
    v13 = a2 + 28 * v8;
    *(_QWORD *)v13 = 0;
    *(_QWORD *)(v13 + 8) = 0;
    *(_DWORD *)(v13 + 24) = 0;
    *(_QWORD *)(v13 + 16) = 0;
  }
  return v3;
}

int winchnstr(WINDOW *a1, chtype *a2, int a3)
{
  unint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;

  if (a2)
  {
    if (a1 && a3)
    {
      v4 = 0;
      v5 = *((__int16 *)a1 + 1);
      v6 = *((__int16 *)a1 + 3);
      v7 = 28 * v5;
      while ((uint64_t)(v5 + v4) <= v6)
      {
        a2[v4++] = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * *(__int16 *)a1) + v7) | *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * *(__int16 *)a1) + v7 + 4);
        v7 += 28;
        if ((a3 & 0x80000000) == 0 && v4 >= a3)
          break;
      }
    }
    else
    {
      LODWORD(v4) = 0;
    }
    a2[v4] = 0;
  }
  else
  {
    LODWORD(v4) = 0;
  }
  return v4;
}

WINDOW *initscr(void)
{
  char *v0;
  char *v1;

  if (!PC[21])
  {
    PC[21] = 1;
    if (getenv("NCURSES_PRINT_ABI"))
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "ncurses: minimum supported ABI: %d.%d, maximum supported ABI: %d.%d\n", 5, 4, 6, 0);
    v0 = getenv("TERM");
    if (!v0 || (v1 = v0, !*v0))
      v1 = "unknown";
    if (!newterm(v1, (FILE *)*MEMORY[0x1E0C80C20], (FILE *)*MEMORY[0x1E0C80C18]))
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error opening terminal: %s.\n", v1);
      exit(1);
    }
    def_prog_mode();
  }
  return stdscr;
}

uint64_t _nc_insert_wch(WINDOW *a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  int v11;
  unint64_t v13;
  _OWORD *v14;
  _DWORD *v16;
  uint64_t v17;
  _BYTE v18[28];

  v4 = wcwidth(*(_DWORD *)(a2 + 4));
  if ((v4 & 0x80000000) != 0)
    return winsch(a1, *(_DWORD *)(a2 + 4));
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  v6 = *((__int16 *)a1 + 1);
  v7 = *((__int16 *)a1 + 3);
  if (v6 <= v7)
  {
    v8 = *((_QWORD *)a1 + 5) + 16 * *(__int16 *)a1;
    v9 = *(_QWORD *)v8;
    v10 = (_OWORD *)(*(_QWORD *)v8 + 28 * *((__int16 *)a1 + 3));
    v11 = *(__int16 *)(v8 + 8);
    if (v11 == -1 || v11 > v6)
      *(_WORD *)(v8 + 8) = v6;
    *(_WORD *)(v8 + 10) = v7;
    if (v7 <= v6)
    {
      v14 = v10;
    }
    else
    {
      v13 = v9 + 28 * v6;
      do
      {
        v14 = (_OWORD *)((char *)v10 - 28);
        *v10 = *(_OWORD *)((char *)v10 - 28 * v5);
        *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)v10 - 28 * v5 + 12);
        v10 = v14;
      }
      while ((unint64_t)v14 > v13);
    }
    _nc_render();
    *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)&v18[12];
    *v14 = *(_OWORD *)v18;
    if ((int)v5 >= 2)
    {
      v16 = (_DWORD *)v14 + 7;
      v17 = 1;
      do
      {
        *v16 = *v16 & 0xFFFFFF00 | ++v17;
        v16 += 7;
      }
      while (v5 != v17);
    }
    ++*((_WORD *)a1 + 1);
  }
  return 0;
}

uint64_t wins_wch(WINDOW *a1, uint64_t a2)
{
  int v3;
  uint64_t inserted;

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = *(_DWORD *)a1;
  inserted = _nc_insert_wch(a1, a2);
  *(_DWORD *)a1 = v3;
  _nc_synchook(a1);
  return inserted;
}

uint64_t wins_nwstr(uint64_t a1, __int32 *a2, int a3)
{
  uint64_t v3;
  int v5;
  uint64_t v7;
  __int16 v8;
  __int16 v9;
  __int32 v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  unsigned int v14;
  uint64_t inserted;
  __int32 v17;
  _QWORD v18[3];
  int v19;

  v3 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v5 = a3;
    if (a3 <= 0 && (v5 = wcslen(a2), v5 < 1))
    {
      return 0;
    }
    else
    {
      v7 = _nc_screen_of(a1);
      v8 = *(_WORD *)a1;
      v9 = *(_WORD *)(a1 + 2);
      v10 = *a2;
      if (*a2)
      {
        v11 = 0;
        while (v5 > (v11 * 4) >> 2)
        {
          v12 = wcwidth(v10);
          v13 = v12 == 1 || v12 <= -1;
          v14 = a2[v11];
          if (v13 && v14 < 0x80)
          {
            inserted = _nc_insert_ch(v7, a1, v14);
          }
          else
          {
            v17 = a2[v11];
            memset(v18, 0, sizeof(v18));
            v19 = 0;
            setcchar((unsigned __int8 *)v18, &v17, 0, 0, 0);
            inserted = _nc_insert_wch((WINDOW *)a1, (uint64_t)v18);
          }
          v3 = inserted;
          if ((_DWORD)inserted)
            goto LABEL_19;
          v10 = a2[++v11];
          if (!v10)
            break;
        }
      }
      v3 = 0;
LABEL_19:
      *(_WORD *)(a1 + 2) = v9;
      *(_WORD *)a1 = v8;
      _nc_synchook((WINDOW *)a1);
    }
  }
  return v3;
}

uint64_t _nc_insert_ch(uint64_t a1, uint64_t a2, unsigned int a3)
{
  chtype v6;
  uint64_t result;
  int v8;
  int v9;
  char *v10;
  int v11;
  unsigned int v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  int v27;
  unint64_t v29;
  _OWORD *v30;
  int v31;
  char *v32;
  int v33;
  unsigned __int8 *v34;
  int v35;
  __int128 v36;
  _OWORD v37[2];
  _BYTE v38[28];

  v6 = a3;
  switch(a3)
  {
    case 8u:
    case 0xAu:
    case 0xDu:
      *(_QWORD *)&v38[16] = 0;
      *(_DWORD *)&v38[12] = 0;
      *(_DWORD *)&v38[24] = 0;
      *(_DWORD *)v38 = a3 & 0xFFFFFF00;
      *(_QWORD *)&v38[4] = a3;
      if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
        *(_DWORD *)&v38[24] = a3 >> 8;
      v37[0] = *(_OWORD *)v38;
      *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)&v38[12];
      _nc_waddch_nosync((__int16 *)a2, v37);
      return 0;
    case 9u:
      v8 = TABSIZE - *(__int16 *)(a2 + 2) % TABSIZE;
      if (v8 < 1)
        return 0;
      v9 = v8 + 1;
      while (1)
      {
        result = _nc_insert_ch(a1, a2, 32);
        if ((_DWORD)result)
          break;
        if (--v9 < 2)
          return 0;
      }
      return result;
    default:
      if (!*(_DWORD *)(a2 + 176))
      {
        v15 = a3 > 0x7Fu
            ? __maskrune(a3, 0x40000uLL)
            : *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * a3 + 60) & 0x40000;
        if (v15 | a3 & 0x400000
          || a1
          && *(_DWORD *)(a1 + 1456)
          && (v6 > 0x7F
            ? (v31 = __maskrune(v6, 0x200uLL))
            : (v31 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60) & 0x200),
              !v31))
        {
          if (*(__int16 *)(a2 + 2) > *(__int16 *)(a2 + 6))
            return 0;
          memset(&v38[8], 0, 20);
          *(_DWORD *)v38 = a3 & 0xFFFFFF00;
          *(_DWORD *)&v38[4] = v6;
          if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
          {
            *(_DWORD *)&v38[24] = BYTE1(a3);
            *(_DWORD *)v38 = a3 & 0xFFFF0000 | (BYTE1(a3) << 8);
          }
          v25 = (_OWORD *)(v20 + v23 * (uint64_t)v21);
          v26 = v22 + 16 * v24;
          v27 = *(__int16 *)(v26 + 8);
          if (v27 == -1 || v27 > v18)
            *(_WORD *)(v26 + 8) = v18;
          *(_WORD *)(v26 + 10) = v19;
          if (v19 <= v18)
          {
            v30 = v25;
          }
          else
          {
            v29 = v20 + v18 * (uint64_t)v21;
            do
            {
              v30 = (_OWORD *)((char *)v25 - 28);
              *v25 = *(_OWORD *)((char *)v25 - 28);
              *(_OWORD *)((char *)v25 + 12) = *(v25 - 1);
              v25 = v30;
            }
            while ((unint64_t)v30 > v29);
          }
          _nc_render();
          result = 0;
          v36 = v37[0];
          *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)((char *)v37 + 12);
          *v30 = v36;
          ++*(_WORD *)(a2 + 2);
          return result;
        }
      }
      if (v6 > 0x7F)
      {
        if (__maskrune(v6, 0x200uLL))
          goto LABEL_15;
      }
      else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60) & 0x200) != 0)
      {
LABEL_15:
        v10 = unctrl(v6);
        v11 = *v10;
        if (!*v10)
          return 0;
        v12 = a3 & 0xFFFFFF00;
        v13 = (unsigned __int8 *)(v10 + 1);
        do
        {
          result = _nc_insert_ch(a1, a2, v12 | v11);
          if ((_DWORD)result)
            break;
          v14 = *v13++;
          v11 = v14;
        }
        while (v14);
        return result;
      }
      memset(&v38[8], 0, 20);
      v16 = a3 & 0xFFFFFF00;
      *(_DWORD *)v38 = a3 & 0xFFFFFF00;
      *(_DWORD *)&v38[4] = v6;
      if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
      {
        *(_DWORD *)&v38[24] = BYTE1(a3);
        *(_DWORD *)v38 = a3 & 0xFFFF0000 | (BYTE1(a3) << 8);
      }
      v37[0] = *(_OWORD *)v38;
      *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)&v38[12];
      _nc_render();
      v17 = _nc_build_wch((__int16 *)a2, (uint64_t)v38);
      if (v17 >= 1)
        return _nc_insert_wch((WINDOW *)a2, (uint64_t)v38);
      if (v17 != -1)
        return 0;
      v32 = unctrl(v6);
      if (strlen(v32) < 2)
        return 0xFFFFFFFFLL;
      v33 = *v32;
      if (!*v32)
        return 0;
      v34 = (unsigned __int8 *)(v32 + 1);
      do
      {
        result = _nc_insert_ch(a1, a2, v16 | v33);
        if ((_DWORD)result)
          break;
        v35 = *v34++;
        v33 = v35;
      }
      while (v35);
      return result;
  }
}

int winsch(WINDOW *a1, chtype a2)
{
  int v4;
  uint64_t v5;
  int inserted;

  if (!a1)
    return -1;
  v4 = *(_DWORD *)a1;
  v5 = _nc_screen_of((uint64_t)a1);
  inserted = _nc_insert_ch(v5, (uint64_t)a1, a2);
  *(_DWORD *)a1 = v4;
  _nc_synchook(a1);
  return inserted;
}

int winsdelln(WINDOW *a1, int a2)
{
  int v3;
  int v4;
  __int128 v6[2];

  if (!a1)
    return -1;
  if (a2)
  {
    v3 = *(__int16 *)a1;
    v4 = *((__int16 *)a1 + 2);
    v6[0] = *(_OWORD *)((char *)a1 + 88);
    *(__int128 *)((char *)v6 + 12) = *(_OWORD *)((char *)a1 + 100);
    _nc_scroll_window((uint64_t)a1, -a2, v3, v4, v6);
    _nc_synchook(a1);
  }
  return 0;
}

int winsnstr(WINDOW *a1, const char *a2, int a3)
{
  int result;
  uint64_t v7;
  __int16 v8;
  __int16 v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  result = -1;
  if (a1 && a2)
  {
    v7 = _nc_screen_of((uint64_t)a1);
    v8 = *(_WORD *)a1;
    v9 = *((_WORD *)a1 + 1);
    v10 = *(unsigned __int8 *)a2;
    if (*a2)
    {
      v11 = v7;
      v12 = 0;
      v13 = a2 + 1;
      do
      {
        if (a3 >= 1 && v12 >= a3)
          break;
        _nc_insert_ch(v11, (uint64_t)a1, v10);
        v10 = v13[v12++];
      }
      while (v10);
    }
    *((_WORD *)a1 + 1) = v9;
    *(_WORD *)a1 = v8;
    _nc_synchook(a1);
    return 0;
  }
  return result;
}

int winnstr(WINDOW *a1, char *a2, int a3)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  int v10;
  __int32 *v11;
  __int32 *v12;
  size_t v13;
  size_t v14;
  size_t v15;
  char *v17;
  char *v18;
  uint64_t i;
  __int16 v21;
  unsigned int v22;

  if (!a2)
    return 0;
  if (!a1)
    goto LABEL_26;
  v5 = a3;
  if (a3 < 0)
    v5 = *((__int16 *)a1 + 3) - *((__int16 *)a1 + 1) + 1;
  if (v5 < 1)
  {
LABEL_26:
    v6 = 0;
    goto LABEL_27;
  }
  v6 = 0;
  v7 = *((__int16 *)a1 + 1);
  v8 = 16 * *(__int16 *)a1;
  while (1)
  {
    v9 = (_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + v8) + 28 * v7);
    v22 = 0;
    v21 = 0;
    if ((*v9 & 0xFEu) - 2 < 0x1E)
      goto LABEL_23;
    v10 = getcchar((uint64_t)v9, 0, 0, 0, 0);
    if (v10 < 1)
      goto LABEL_23;
    v11 = (__int32 *)calloc((v10 + 1), 4uLL);
    if (!v11)
      goto LABEL_23;
    v12 = v11;
    if (!getcchar((uint64_t)v9, v11, &v22, &v21, 0))
    {
      v13 = wcstombs(0, v12, 0);
      if (v13)
      {
        v14 = v13;
        if (v13 != -1 || *__error() != 92)
          break;
      }
    }
LABEL_22:
    free(v12);
LABEL_23:
    if (v7 < *((__int16 *)a1 + 3))
    {
      ++v7;
      if (v6 < v5)
        continue;
    }
    goto LABEL_27;
  }
  v15 = v14 + v6 + 10;
  if (v6 + (int)v14 <= v5 && (int)v15 >= 1)
  {
    v17 = (char *)calloc(v15, 1uLL);
    if (v17)
    {
      v18 = v17;
      wcstombs(v17, v12, v14);
      for (i = 0; i != v14; ++i)
        a2[v6 + i] = v18[i];
      v6 += i;
      free(v18);
      goto LABEL_22;
    }
  }
  free(v12);
LABEL_27:
  a2[v6] = 0;
  return v6;
}

uint64_t winnwstr(__int16 *a1, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  result = 0;
  if (a1 && a2)
  {
    result = 0;
    v5 = a1[1];
    v6 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * *a1);
    v7 = v6 + 28 * v5 + 4;
    do
    {
      if ((int)result >= a3 || (_DWORD)result == -1)
        break;
      if ((*(_DWORD *)(v6 + 28 * v5) & 0xFEu) - 2 >= 0x1E)
      {
        v8 = 0;
        while (1)
        {
          v9 = *(_DWORD *)(v7 + 4 * v8);
          if (!v9)
          {
            result = (result + v8);
            goto LABEL_16;
          }
          if (a3 - (uint64_t)(int)result == v8)
            break;
          *(_DWORD *)(a2 + 4 * (int)result + 4 * v8++) = v9;
          if (v8 == 5)
          {
            result = (result + 5);
            goto LABEL_16;
          }
        }
        if ((_DWORD)result)
          result = result;
        else
          result = 0xFFFFFFFFLL;
      }
LABEL_16:
      v7 += 28;
    }
    while (v5++ < a1[3]);
    if ((int)result >= 1)
      *(_DWORD *)(a2 + 4 * result) = 0;
  }
  return result;
}

uint64_t winwstr(__int16 *a1, uint64_t a2)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  if (winnwstr(a1, a2, 5 * (a1[3] - a1[1]) + 5) == -1)
    return 0xFFFFFFFFLL;
  return 0;
}

BOOL isendwin(void)
{
  return SP && *(_DWORD *)(SP + 736) != 0;
}

char erasechar(void)
{
  if (cur_term)
    return cur_term->Ottyb.c_cc[3];
  else
    return -1;
}

char killchar(void)
{
  if (cur_term)
    return cur_term->Ottyb.c_cc[5];
  else
    return -1;
}

int flushinp(void)
{
  uint64_t v0;
  int result;

  if (!cur_term)
    return -1;
  tcflush(cur_term->Filedes, 1);
  v0 = SP;
  result = 0;
  if (SP)
  {
    *(_DWORD *)(SP + 728) = 0xFFFF;
    *(_WORD *)(v0 + 732) = 0;
  }
  return result;
}

char *key_name(int a1)
{
  int *v1;
  char *v2;
  size_t v3;
  size_t v4;
  int v6[2];
  uint64_t v7;
  uint64_t v8;
  int v9;

  v6[0] = 0;
  v7 = 0;
  v9 = 0;
  v8 = 0;
  v6[1] = a1;
  v1 = wunctrl(v6);
  v2 = byte_1EF614BF0;
  v3 = wcstombs(byte_1EF614BF0, v1, 6uLL);
  if (!v3)
    return 0;
  v4 = v3;
  if (v3 == -1 && *__error() == 92)
    return 0;
  byte_1EF614BF0[v4] = 0;
  return v2;
}

int leaveok(WINDOW *a1, BOOL a2)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_BYTE *)a1 + 26) = a2;
  return result;
}

char *longname(void)
{
  char *v0;
  int64_t v1;
  char *v2;

  v0 = ttytype;
  v1 = strlen(ttytype);
  if (v1 >= 1)
  {
    v2 = &ttytype[v1];
    while (*v2 != 124)
    {
      if (--v2 <= ttytype)
        return v0;
    }
    return v2 + 1;
  }
  return v0;
}

int getmouse(MEVENT *a1)
{
  int v1;
  unint64_t v2;
  __int16 *v3;
  uint64_t v4;
  __int128 v5;

  v1 = -1;
  if (!a1 || !SP)
    return v1;
  if (!*(_DWORD *)(SP + 1048))
    return -1;
  v2 = *(_QWORD *)(SP + 1336);
  if (v2 <= SP + 1144)
    v3 = (__int16 *)(SP + 1312);
  else
    v3 = (__int16 *)(v2 - 24);
  if (*v3 == -1)
  {
LABEL_14:
    *(_QWORD *)&a1->y = 0;
    a1->bstate = 0;
    a1->id = -1;
    a1->x = 0;
    return -1;
  }
  v4 = *(_QWORD *)(SP + 1112);
  while ((v4 & *((_QWORD *)v3 + 2)) == 0)
  {
    *v3 = -1;
    if ((unint64_t)v3 <= SP + 1144)
      v3 = (__int16 *)(SP + 1312);
    else
      v3 -= 12;
    if (*v3 == -1)
      goto LABEL_14;
  }
  v1 = 0;
  v5 = *(_OWORD *)v3;
  a1->bstate = *((_QWORD *)v3 + 2);
  *(_OWORD *)&a1->id = v5;
  *v3 = -1;
  *(_QWORD *)(SP + 1336) = v3;
  return v1;
}

int ungetmouse(MEVENT *a1)
{
  unint64_t v1;
  __int128 v2;
  uint64_t v3;

  if (!a1 || !SP)
    return -1;
  v1 = *(_QWORD *)(SP + 1336);
  v2 = *(_OWORD *)&a1->id;
  *(_QWORD *)(v1 + 16) = a1->bstate;
  *(_OWORD *)v1 = v2;
  if (v1 >= SP + 1312)
    v3 = SP + 1144;
  else
    v3 = v1 + 24;
  *(_QWORD *)(SP + 1336) = v3;
  return ungetch(409);
}

mmask_t mousemask(mmask_t a1, mmask_t *a2)
{
  uint64_t v3;
  mmask_t v4;
  int v5;
  uint64_t v6;
  mmask_t v7;
  uint64_t v8;
  uint64_t v9;
  mmask_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = SP;
  if (!SP)
    return 0;
  if (a2)
    *a2 = *(_QWORD *)(SP + 1104);
  if (!a1 && !*(_BYTE *)(v3 + 1045))
    return 0;
  sub_1C05C26DC(v3);
  if (!*(_DWORD *)(SP + 1048))
    return 0;
  v4 = a1 & 0xF7DF7DF;
  sub_1C05C2888(SP, v4 != 0);
  v5 = 0;
  v6 = SP;
  *(_QWORD *)(SP + 1104) = v4;
  *(_QWORD *)(v6 + 1112) = v4;
  v7 = v4;
  do
  {
    v8 = v7 & (16 << v5);
    if ((v7 & (16 << v5)) != 0)
      v9 = (8 << v5);
    else
      v9 = 0;
    v10 = v7 | v9;
    v11 = v10 & (8 << v5);
    if ((v10 & (8 << v5)) != 0)
      v12 = (4 << v5);
    else
      v12 = 0;
    v7 = v10 | v12;
    if (v8 | v11)
      *(_QWORD *)(v6 + 1112) = v7;
    if ((v7 & (4 << v5)) != 0)
    {
      v7 |= (3 << v5);
      *(_QWORD *)(v6 + 1112) = v7;
    }
    v5 += 6;
  }
  while (v5 != 24);
  return v4;
}

uint64_t sub_1C05C26DC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  TERMINAL *v3;
  const char *v4;
  char *v5;
  char *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 1045))
      return *(_BYTE *)(v1 + 1045) != 0;
    v2 = 0;
    *(_BYTE *)(result + 1045) = 1;
    *(_QWORD *)(result + 1336) = result + 1144;
    do
    {
      *(_WORD *)(result + 1144 + v2) = -1;
      v2 += 24;
    }
    while (v2 != 192);
    v3 = cur_term;
    v4 = (const char *)*((_QWORD *)cur_term->type.Strings + 355);
    if (v4)
    {
      if (strcmp(v4, "\x1B[M") && !strstr(v3->type.term_names, "xterm"))
        return *(_BYTE *)(v1 + 1045) != 0;
    }
    else if (!strstr(cur_term->type.term_names, "xterm")
           || _nc_add_to_try((void **)(v1 + 160), "\x1B[M", 409))
    {
      return *(_BYTE *)(v1 + 1045) != 0;
    }
    *(_DWORD *)(v1 + 1048) = -1;
    *(_DWORD *)(v1 + 1128) = 0;
    v5 = tigetstr("XM");
    *(_QWORD *)(v1 + 1136) = v5;
    if ((unint64_t)(v5 + 1) >= 2)
    {
      v6 = strstr(v5, "[?");
      if (v6)
      {
        v7 = v6 + 2;
        if (v6[2] - 48 <= 9)
        {
          do
          {
            v8 = 0;
            do
              v9 = v7[v8++];
            while ((v9 - 48) < 0xA);
            v10 = v8 - 1;
            v11 = strncmp(v7, "1006", v8 - 1);
            v7 += v10;
            if (!v11)
            {
              *(_DWORD *)(v1 + 1128) = 1;
              v9 = *(unsigned __int8 *)v7;
            }
            if (v9 != 59)
              break;
            do
            {
              v13 = *(unsigned __int8 *)++v7;
              v12 = v13;
            }
            while (v13 == 59);
          }
          while ((v12 - 48) <= 9);
        }
      }
    }
    else
    {
      tigetnum("XM");
      *(_QWORD *)(v1 + 1136) = "\x1B[?1000%?%p1%{1}%=%th%el%;";
    }
    return *(_BYTE *)(v1 + 1045) != 0;
  }
  return result;
}

void sub_1C05C2888(uint64_t a1, int a2)
{
  int v3;
  char *v4;
  int v5;
  char *v6;

  if (a2)
  {
    if (sub_1C05C26DC(a1))
    {
      *(_QWORD *)(a1 + 1120) = 0;
      v3 = *(_DWORD *)(a1 + 1048);
      if (v3)
      {
        if (v3 == -1)
        {
          keyok(409, 1);
          v4 = _nc_tiparm(1, *(const char **)(a1 + 1136), 1);
          _nc_putp((int)"xterm-mouse", v4);
          *(_BYTE *)(a1 + 1100) = 1;
        }
        *(_QWORD *)(a1 + 1056) = sub_1C05C2B1C;
        *(_QWORD *)(a1 + 1064) = sub_1C05C2B24;
        *(_QWORD *)(a1 + 1072) = sub_1C05C2ED8;
        *(_QWORD *)(a1 + 1080) = sub_1C05C333C;
        *(_QWORD *)(a1 + 1088) = sub_1C05C335C;
LABEL_7:
        _nc_flush();
      }
    }
  }
  else if (*(_BYTE *)(a1 + 1045))
  {
    if ((sub_1C05C26DC(a1) & 1) != 0)
    {
      v5 = *(_DWORD *)(a1 + 1048);
      if (v5)
      {
        if (v5 == -1)
        {
          v6 = _nc_tiparm(1, *(const char **)(a1 + 1136), 0);
          _nc_putp((int)"xterm-mouse", v6);
          *(_BYTE *)(a1 + 1100) = 0;
        }
        goto LABEL_7;
      }
    }
  }
}

BOOL wenclose(const WINDOW *a1, int a2, int a3)
{
  int v3;
  int v4;
  int v5;

  if (a1)
  {
    v3 = a2 - *((__int16 *)a1 + 42);
    v4 = *((__int16 *)a1 + 4);
    LOBYTE(a1) = v3 >= v4
              && (v5 = *((__int16 *)a1 + 5), v5 <= a3)
              && *((__int16 *)a1 + 3) + v5 >= a3
              && *((__int16 *)a1 + 2) + v4 >= v3;
  }
  return (char)a1;
}

int mouseinterval(int a1)
{
  int result;

  if (!SP)
    return 166;
  result = *(_DWORD *)(SP + 1052);
  if ((a1 & 0x80000000) == 0)
    *(_DWORD *)(SP + 1052) = a1;
  return result;
}

BOOL _nc_has_mouse(_BOOL8 result)
{
  if (result)
    return *(_DWORD *)(result + 1048) != 0;
  return result;
}

BOOL has_mouse(void)
{
  return SP && *(_DWORD *)(SP + 1048) != 0;
}

BOOL wmouse_trafo(const WINDOW *a1, int *a2, int *a3, BOOL a4)
{
  BOOL v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  v4 = 0;
  if (a1 && a2 && a3)
  {
    v5 = *a2;
    v6 = *a3;
    if (!a4)
    {
      v11 = *((__int16 *)a1 + 42);
      v12 = *((__int16 *)a1 + 4);
      if (v5 - v11 >= v12)
      {
        v13 = *((__int16 *)a1 + 5);
        v10 = v6 - v13;
        if (v6 >= v13 && *((__int16 *)a1 + 3) + v13 >= v6 && *((__int16 *)a1 + 2) + v12 >= v5 - v11)
        {
          v9 = v5 - (v12 + v11);
          goto LABEL_17;
        }
      }
      return 0;
    }
    v4 = 0;
    v7 = *((__int16 *)a1 + 4);
    v8 = v5 + v7;
    if (v8 >= v7 && (v6 & 0x80000000) == 0)
    {
      if (v6 <= *((__int16 *)a1 + 3) && *((__int16 *)a1 + 2) + v7 >= v8)
      {
        v9 = v8 + *((__int16 *)a1 + 42);
        v10 = v6 + *((__int16 *)a1 + 5);
LABEL_17:
        *a3 = v10;
        *a2 = v9;
        return 1;
      }
      return 0;
    }
  }
  return v4;
}

uint64_t sub_1C05C2B1C()
{
  return 0;
}

uint64_t sub_1C05C2B24(uint64_t a1)
{
  unint64_t v3;
  int v4;
  unint64_t v5;
  int v6;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _OWORD v31[2];
  __int128 v32;
  _BYTE v33[80];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 1048) != -1)
    return 0;
  v3 = *(_QWORD *)(a1 + 1336);
  v4 = *(_DWORD *)(a1 + 1128);
  if (v4 != 1)
  {
    if (!v4)
    {
      v5 = 0;
      do
      {
        v6 = read(*(_DWORD *)a1, &v33[v5], 3 - v5);
        v5 += v6;
      }
      while (v6 != -1 && v5 < 3);
      *(_WORD *)v3 = 0;
      v8 = v33[0];
      *(_QWORD *)(v3 + 16) = 0;
      if (sub_1C05C337C(a1, v3, v8, (~v8 & 0x60) == 0))
      {
        v9 = *(_QWORD *)(v3 + 16);
      }
      else
      {
        v13 = *(_QWORD *)(a1 + 1120);
        if ((v13 & 0x82082) != 0)
        {
          v14 = 0;
          v9 = 266305;
          *(_QWORD *)(v3 + 16) = 266305;
          do
          {
            if ((v13 & (2 << v14)) == 0)
            {
              v9 &= ~(unint64_t)(1 << v14);
              *(_QWORD *)(v3 + 16) = v9;
            }
            v14 += 6;
          }
          while (v14 != 24);
          *(_QWORD *)(a1 + 1120) = 0;
        }
        else
        {
          v9 = 0x8000000;
          *(_QWORD *)(v3 + 16) = 0x8000000;
        }
      }
      if ((v8 & 0x1C) != 0)
        *(_QWORD *)(v3 + 16) = v9 | (v8 << 20) & 0x1000000 | (((v8 >> 2) & 3) << 25);
      v24 = v33[2] - 33;
      *(_DWORD *)(v3 + 4) = v33[1] - 33;
      *(_DWORD *)(v3 + 8) = v24;
      goto LABEL_56;
    }
LABEL_49:
    if (v3 >= SP + 1312)
      v25 = SP + 1144;
    else
      v25 = v3 + 24;
    *(_QWORD *)(a1 + 1336) = v25;
LABEL_60:
    v28 = *(_QWORD *)(v3 + 16);
    v29 = (v28 & 0x82082) == 0;
    v30 = (v28 >> 19) & 1;
    if (v29)
      return 0;
    else
      return v30;
  }
  memset(v31, 0, sizeof(v31));
  v32 = 0u;
  if (read(*(_DWORD *)a1, v33, 1uLL) == -1)
  {
    LOBYTE(v10) = 0;
    *(_WORD *)v3 = 0;
LABEL_15:
    v11 = 2 << (6 * (v10 & 3));
    v12 = *(_QWORD *)(a1 + 1120);
    if ((v12 & v11) != 0)
    {
      v9 = 1 << (6 * (v10 & 3));
      *(_QWORD *)(v3 + 16) = v9;
      *(_QWORD *)(a1 + 1120) = v12 & ~v11;
    }
    else
    {
      LODWORD(v9) = 0x8000000;
      *(_QWORD *)(v3 + 16) = 0x8000000;
    }
    goto LABEL_55;
  }
  v15 = 0;
  v16 = 0;
  v17 = -1;
  v18 = 1;
  while (1)
  {
    if ((int)v16 >= 77)
    {
      if (LODWORD(v31[0]) != -1)
        goto LABEL_49;
      goto LABEL_53;
    }
    v19 = v33[v15];
    v15 = (int)v16 + 1;
    v20 = v15;
    v33[v15] = 0;
    if (v19 - 48 < 0xA)
    {
      if (v18)
      {
        v21 = v17 + 2;
        ++v17;
        DWORD1(v31[0]) = v21;
      }
      v18 = 0;
      *((_DWORD *)v31 + v17 + 2) = v19 + 10 * *((_DWORD *)v31 + v17 + 2) - 48;
      goto LABEL_29;
    }
    if (v19 == 59)
    {
      if (v18)
      {
        v23 = v17 + 2;
        ++v17;
        DWORD1(v31[0]) = v23;
      }
      v18 = 1;
      goto LABEL_29;
    }
    if (v19 - 127 > 0xFFFFFFA0)
      break;
    ++LODWORD(v31[0]);
    v15 = (int)v16;
    v20 = v16;
LABEL_29:
    v22 = read(*(_DWORD *)a1, &v33[v15], 1uLL);
    v16 = v20;
    if (v22 == -1)
      goto LABEL_47;
  }
  if (v19 < 0x40)
  {
    ++LODWORD(v31[0]);
    goto LABEL_29;
  }
  HIDWORD(v32) = v19;
LABEL_47:
  if ((v20 & 0x80000000) != 0 || LODWORD(v31[0]))
    goto LABEL_49;
LABEL_53:
  v10 = DWORD2(v31[0]);
  v26 = HIDWORD(v32);
  *(_WORD *)v3 = 0;
  if (v26 != 77)
    goto LABEL_15;
  sub_1C05C337C(a1, v3, v10, (v10 >> 6) & 1);
  v9 = *(_QWORD *)(v3 + 16);
LABEL_55:
  *(uint32x2_t *)(v3 + 4) = vqsub_u32(*(uint32x2_t *)((char *)v31 + 12), (uint32x2_t)0x100000001);
LABEL_56:
  if (v3 >= SP + 1312)
    v27 = SP + 1144;
  else
    v27 = v3 + 24;
  *(_QWORD *)(a1 + 1336) = v27;
  if ((v9 & 0x8000000) == 0)
    goto LABEL_60;
  return 1;
}

BOOL sub_1C05C2ED8(_QWORD *a1, int a2)
{
  __int16 *v2;
  int v3;
  __int16 *v4;
  uint64_t v5;
  unint64_t v7;
  __int16 *v8;
  __int16 *v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  char v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  __int16 *v26;
  unint64_t v27;
  __int16 *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int16 *v45;
  unint64_t v46;
  __int16 *v47;

  v2 = (__int16 *)a1[167];
  if (a2 > 7)
  {
    v5 = SP;
    v4 = (__int16 *)a1[167];
  }
  else
  {
    v3 = a2 - 8;
    v4 = (__int16 *)a1[167];
    do
    {
      *v4 = -1;
      v5 = SP;
      if ((unint64_t)v4 >= SP + 1312)
        v4 = (__int16 *)(SP + 1144);
      else
        v4 += 12;
    }
    while (!__CFADD__(v3++, 1));
  }
  v7 = 0;
  v8 = 0;
  do
  {
LABEL_11:
    v9 = v4;
    while (1)
    {
      v4 = v9 + 12;
      v10 = (unsigned __int16)*v9;
      if ((unint64_t)v9 >= v5 + 1312)
        v4 = (__int16 *)(v5 + 1144);
      v11 = v4 == v2;
      if (v4 == v2)
        goto LABEL_33;
      if (v10 == 0xFFFF)
        goto LABEL_34;
      if (*v4 == -1)
        break;
      if (*((_DWORD *)v9 + 1) != *((_DWORD *)v4 + 1))
        break;
      if (*((_DWORD *)v9 + 2) != *((_DWORD *)v4 + 2))
        break;
      v12 = *((_QWORD *)v9 + 2);
      if ((v12 & 0x82082) == 0)
        break;
      v13 = *((_QWORD *)v4 + 2);
      if ((v13 & 0x82082) != 0)
        break;
      v14 = 0;
      while (((v12 & (2 << v14)) != 0) != ((v13 & (1 << v14)) == 0))
      {
        v14 += 6;
        if (v14 == 24)
        {
          v15 = 0;
          v16 = a1[138];
          v17 = 1;
LABEL_25:
          v18 = 6 * v17++ - 6;
          do
          {
            v19 = (4 << v18);
            if ((v16 & v19) != 0 && (*((_QWORD *)v9 + 2) & (2 << v18)) != 0)
            {
              v15 = 1;
              v13 = v13 & ~(unint64_t)(1 << v18) | v19;
              *((_QWORD *)v4 + 2) = v13;
              if (v17 != 5)
                goto LABEL_25;
              goto LABEL_48;
            }
            ++v17;
            v18 += 6;
          }
          while (v17 != 6);
          if ((v15 & 1) == 0)
            break;
LABEL_48:
          if (v7)
            v21 = 1;
          else
            v21 = v8 == 0;
          *v9 = -1;
          v5 = SP;
          if (!v21)
            v7 = (unint64_t)v9;
          goto LABEL_11;
        }
      }
LABEL_33:
      if (v10 != 0xFFFF)
        goto LABEL_42;
LABEL_34:
      if (v7)
        v20 = 1;
      else
        v20 = v8 == 0;
      if (!v20)
        v7 = (unint64_t)v9;
      v9 = v4;
      if (v4 == v2)
        goto LABEL_58;
    }
    v11 = 0;
LABEL_42:
    if (!v8)
    {
      v8 = v9;
LABEL_46:
      if (v11)
        break;
      goto LABEL_11;
    }
    if (!v7)
      goto LABEL_46;
    v22 = *(_OWORD *)v9;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)v9 + 2);
    *(_OWORD *)v7 = v22;
    *v9 = -1;
    v5 = SP;
    if (v7 >= SP + 1312)
      v7 = SP + 1144;
    else
      v7 += 24;
  }
  while (!v11);
LABEL_58:
  if (v7)
    v2 = (__int16 *)v7;
  v23 = v5 + 1144;
  v24 = v5 + 1312;
  v25 = 0;
  if (v8)
  {
    if ((unint64_t)v8 >= v24)
      v26 = (__int16 *)v23;
    else
      v26 = v8 + 12;
    v27 = (unint64_t)v8;
    do
    {
      v28 = (__int16 *)v27;
      v27 = (unint64_t)v26;
      while (v26 != v2)
      {
        if (*v26 != -1)
        {
          if ((*((_QWORD *)v28 + 2) & 0x104104) != 0)
          {
            v29 = *((_QWORD *)v26 + 2);
            if ((v29 & 0x104104) != 0)
            {
              v30 = 0;
              v31 = a1[138];
              v32 = 1;
LABEL_71:
              v33 = 6 * v32++ - 6;
              do
              {
                v34 = (8 << v33);
                if ((v31 & v34) != 0)
                {
                  v35 = (4 << v33);
                  if ((*((_QWORD *)v28 + 2) & v35) != 0 && (v29 & v35) != 0)
                  {
                    v29 = v29 & ~v35 | v34;
                    *(_QWORD *)(v27 + 16) = v29;
                    v30 = 1;
                    if (v32 != 5)
                      goto LABEL_71;
                    goto LABEL_83;
                  }
                }
                ++v32;
                v33 += 6;
              }
              while (v32 != 6);
              if ((v30 & 1) == 0)
                goto LABEL_84;
LABEL_83:
              *v28 = -1;
            }
          }
LABEL_84:
          if ((*((_DWORD *)v28 + 4) & 0x208208) != 0)
          {
            v37 = *(_QWORD *)(v27 + 16);
            if ((v37 & 0x104104) != 0)
            {
              v38 = 0;
              v39 = a1[138];
              v40 = 1;
LABEL_87:
              v41 = 6 * v40++ - 6;
              do
              {
                v42 = (16 << v41);
                if ((v39 & v42) != 0 && (*((_QWORD *)v28 + 2) & (8 << v41)) != 0)
                {
                  v43 = (4 << v41);
                  if ((v37 & v43) != 0)
                  {
                    v37 = v37 & ~v43 | v42;
                    *(_QWORD *)(v27 + 16) = v37;
                    v38 = 1;
                    if (v40 != 5)
                      goto LABEL_87;
                    goto LABEL_96;
                  }
                }
                ++v40;
                v41 += 6;
              }
              while (v40 != 6);
              if ((v38 & 1) == 0)
                break;
LABEL_96:
              *v28 = -1;
            }
          }
          break;
        }
      }
      if ((a1[139] & *((_QWORD *)v28 + 2)) != 0)
      {
        if (*v28 != -1)
        {
          if (v25)
          {
            v44 = *(_OWORD *)v28;
            *(_QWORD *)(v25 + 16) = *((_QWORD *)v28 + 2);
            *(_OWORD *)v25 = v44;
            *v28 = -1;
            if (v25 >= SP + 1312)
              v25 = SP + 1144;
            else
              v25 += 24;
          }
          goto LABEL_110;
        }
      }
      else
      {
        *v28 = -1;
      }
      if (v25)
        v45 = (__int16 *)v25;
      else
        v45 = v28;
      if (v28 == v8)
        v8 = (__int16 *)v27;
      else
        v25 = (unint64_t)v45;
LABEL_110:
      v23 = SP + 1144;
      v24 = SP + 1312;
      v26 = (__int16 *)(v27 + 24);
      if (v27 >= SP + 1312)
        v26 = (__int16 *)(SP + 1144);
    }
    while ((__int16 *)v27 != v2);
  }
  if (v25)
    v46 = v25;
  else
    v46 = (unint64_t)v2;
  a1[167] = v46;
  if (v46 <= v23)
    v47 = (__int16 *)v24;
  else
    v47 = (__int16 *)(v46 - 24);
  return *v47 != -1;
}

uint64_t sub_1C05C333C(uint64_t result)
{
  if (*(_DWORD *)(result + 1048) == -1)
  {
    if (*(_QWORD *)(result + 1104))
      return sub_1C05C2888();
  }
  return result;
}

uint64_t sub_1C05C335C(uint64_t result)
{
  if (*(_DWORD *)(result + 1048) == -1)
  {
    if (*(_QWORD *)(result + 1104))
      return sub_1C05C2888();
  }
  return result;
}

uint64_t sub_1C05C337C(uint64_t a1, uint64_t a2, char a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((a3 & 3) == 2)
  {
    v5 = *(_QWORD *)(a1 + 1120);
    v6 = 0x8000000;
    if ((v5 & 0x2000) == 0)
      v6 = 0x2000;
    *(_QWORD *)(a2 + 16) = v6;
    v7 = v5 | 0x2000;
    goto LABEL_19;
  }
  if ((a3 & 3) == 1)
  {
    if (a4)
    {
      v4 = 0x8000000;
      goto LABEL_11;
    }
    v11 = *(_QWORD *)(a1 + 1120);
    v12 = 0x8000000;
    if ((v11 & 0x80) == 0)
      v12 = 128;
    *(_QWORD *)(a2 + 16) = v12;
    v7 = v11 | 0x80;
LABEL_19:
    *(_QWORD *)(a1 + 1120) = v7;
    return 1;
  }
  if ((a3 & 3) != 0)
    return 0;
  if (!a4)
  {
    v9 = *(_QWORD *)(a1 + 1120);
    v10 = 0x8000000;
    if ((v9 & 2) == 0)
      v10 = 2;
    *(_QWORD *)(a2 + 16) = v10;
    v7 = v9 | 2;
    goto LABEL_19;
  }
  v4 = 0x80000;
LABEL_11:
  *(_QWORD *)(a2 + 16) = v4;
  return 1;
}

int wmove(WINDOW *a1, int a2, int a3)
{
  int result;

  result = -1;
  if (a1
    && (a3 & 0x80000000) == 0
    && (a2 & 0x80000000) == 0
    && *((__int16 *)a1 + 3) >= a3
    && *((__int16 *)a1 + 2) >= a2)
  {
    result = 0;
    *((_WORD *)a1 + 1) = a3;
    *(_WORD *)a1 = a2;
    *((_WORD *)a1 + 6) = *((_WORD *)a1 + 6) & 0xFF9F | 0x20;
  }
  return result;
}

uint64_t _nc_msec_cost(char *__s, int a2)
{
  char *v2;
  float v3;
  uint64_t v4;
  int v5;
  float v6;
  int v7;
  float v8;
  int v9;
  int v10;
  float v11;

  if (__s)
  {
    v2 = __s;
    v3 = (float)a2;
    v4 = SP;
    v5 = byte_1EF614AA0;
    v6 = 0.0;
    while (1)
    {
      v7 = *v2;
      if (v7 != 36)
      {
        if (!*v2)
          return (int)v6;
LABEL_20:
        if (v4)
          v6 = v6 + (float)*(int *)(v4 + 816);
        goto LABEL_22;
      }
      if (v2[1] != 60 || !strchr(v2, 62))
        goto LABEL_20;
      v2 += 2;
      v8 = 0.0;
      while (1)
      {
        v7 = *v2;
        if (!*v2 || v7 == 62)
          break;
        if ((v7 - 48) > 9)
        {
          if (v7 == 46)
          {
            v10 = *++v2;
            v9 = v10;
            if (v10 != 62 && (v9 - 48) <= 9)
            {
              v11 = (double)((char)v9 - 48) / 10.0;
              v8 = v8 + v11;
            }
          }
          else if (v7 == 42)
          {
            v8 = v8 * v3;
          }
        }
        else
        {
          v8 = (float)(*v2 - 48) + (float)(v8 * 10.0);
        }
        ++v2;
      }
      if (v4)
      {
        if (!*(_BYTE *)(v4 + 812))
          goto LABEL_28;
      }
      else if (!v5)
      {
LABEL_28:
        v6 = v6 + (float)(v8 * 10.0);
      }
LABEL_22:
      ++v2;
      if (!v7)
        return (int)v6;
    }
  }
  return 1000000;
}

void _nc_mvcur_resume()
{
  uint64_t v0;
  char **Strings;
  char *v2;
  const char *v3;
  char *v4;
  int v5;

  v0 = SP;
  if (SP)
  {
    Strings = cur_term->type.Strings;
    v2 = Strings[28];
    if (v2)
    {
      _nc_putp((int)"enter_ca_mode", v2);
      Strings = cur_term->type.Strings;
      v0 = SP;
    }
    v3 = Strings[3];
    if (v3)
    {
      v4 = _nc_tiparm(2, v3, 0, (*(__int16 *)(v0 + 128) - 1));
      _nc_putp((int)"change_scroll_region", v4);
      v0 = SP;
    }
    *(_QWORD *)(v0 + 764) = -1;
    v5 = *(_DWORD *)(v0 + 760);
    if (v5 != -1)
    {
      *(_DWORD *)(v0 + 760) = -1;
      curs_set(v5);
    }
  }
}

void _nc_mvcur_init()
{
  uint64_t v0;
  FILE *v1;
  int v2;
  int v3;
  int baudrate;
  char **Strings;
  char *v6;
  const char *v7;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  _DWORD *v17;
  TERMINAL *v18;
  char **v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  char *v30;
  int v31;
  int v32;
  char *v33;
  int v34;
  int v35;
  char *v36;
  int v37;
  int v38;
  char *v39;
  int v40;
  uint64_t v41;
  int v42;
  char *v43;
  int v44;
  int v45;
  char *v46;
  int v47;
  int v48;
  char *v49;
  int v50;
  _DWORD *v51;
  int v52;
  int v53;
  TERMINAL *v54;
  char **v55;
  const char *v56;
  char *v57;

  v0 = SP;
  v1 = *(FILE **)(SP + 8);
  if (!v1)
    goto LABEL_6;
  v2 = fileno(v1);
  v3 = isatty(v2);
  v0 = SP;
  if (!v3)
    goto LABEL_6;
  baudrate = cur_term->_baudrate;
  if (baudrate <= 0)
    baudrate = 9600;
  *(_DWORD *)(SP + 816) = 0x15F90u / baudrate;
  if (baudrate > 0x15F90)
LABEL_6:
    *(_DWORD *)(v0 + 816) = 1;
  Strings = cur_term->type.Strings;
  *(_DWORD *)(v0 + 820) = _nc_msec_cost(Strings[2], 0);
  *(_DWORD *)(v0 + 828) = _nc_msec_cost(Strings[12], 0);
  *(_DWORD *)(v0 + 832) = _nc_msec_cost(Strings[18], 0);
  *(_DWORD *)(v0 + 836) = _nc_msec_cost(Strings[14], 0);
  *(_DWORD *)(v0 + 840) = _nc_msec_cost(Strings[17], 0);
  *(_DWORD *)(v0 + 844) = _nc_msec_cost(Strings[11], 0);
  *(_DWORD *)(v0 + 848) = _nc_msec_cost(Strings[19], 0);
  *(_DWORD *)(v0 + 928) = _nc_msec_cost(Strings[31], 0);
  *(_DWORD *)(v0 + 932) = _nc_msec_cost(Strings[42], 0);
  *(_DWORD *)(v0 + 936) = 0;
  v6 = Strings[54];
  if (v6)
    *(_DWORD *)(v0 + 936) = _nc_msec_cost(v6, 0);
  v7 = Strings[10];
  if (!v7)
    v7 = Strings[15];
  v8 = 1000000;
  *(_QWORD *)(v0 + 944) = v7;
  v9 = _nc_tiparm(2, v7, 23, 23);
  *(_DWORD *)(SP + 824) = _nc_msec_cost(v9, 1);
  v10 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 111), 23);
  *(_DWORD *)(SP + 852) = _nc_msec_cost(v10, 1);
  v11 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 112), 23);
  *(_DWORD *)(SP + 856) = _nc_msec_cost(v11, 1);
  v12 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 107), 23);
  *(_DWORD *)(SP + 860) = _nc_msec_cost(v12, 1);
  v13 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 114), 23);
  *(_DWORD *)(SP + 864) = _nc_msec_cost(v13, 1);
  v14 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 8), 23);
  *(_DWORD *)(SP + 868) = _nc_msec_cost(v14, 1);
  v15 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 127), 23);
  v16 = _nc_msec_cost(v15, 1);
  v17 = (_DWORD *)SP;
  *(_DWORD *)(SP + 872) = v16;
  v18 = cur_term;
  v19 = cur_term->type.Strings;
  v20 = _nc_msec_cost(v19[7], 1);
  v21 = 1000000;
  if (v20 != 1000000)
    v21 = (v20 + v17[204] - 1) / v17[204];
  v17[219] = v21;
  v22 = _nc_msec_cost(v19[6], 1);
  v23 = 1000000;
  if (v22 != 1000000)
    v23 = (v22 + v17[204] - 1) / v17[204];
  v17[220] = v23;
  v24 = _nc_msec_cost(v19[269], 1);
  v25 = 1000000;
  if (v24 != 1000000)
    v25 = (v24 + v17[204] - 1) / v17[204];
  v17[221] = v25;
  v26 = _nc_msec_cost(v19[21], 1);
  v27 = 1000000;
  if (v26 != 1000000)
    v27 = (v26 + v17[204] - 1) / v17[204];
  v17[222] = v27;
  v28 = _nc_msec_cost(v19[52], 1);
  v29 = 1000000;
  if (v28 != 1000000)
    v29 = (v28 + v17[204] - 1) / v17[204];
  v17[223] = v29;
  if (v18->type.Booleans[28])
    v17[220] = 0;
  v30 = _nc_tiparm(1, v19[105], 23);
  v31 = _nc_msec_cost(v30, 1);
  v32 = 1000000;
  if (v31 != 1000000)
    v32 = (v31 + *(_DWORD *)(SP + 816) - 1) / *(_DWORD *)(SP + 816);
  *(_DWORD *)(SP + 896) = v32;
  v33 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 108), 23);
  v34 = _nc_msec_cost(v33, 1);
  v35 = 1000000;
  if (v34 != 1000000)
    v35 = (v34 + *(_DWORD *)(SP + 816) - 1) / *(_DWORD *)(SP + 816);
  *(_DWORD *)(SP + 900) = v35;
  v36 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 37), 23);
  v37 = _nc_msec_cost(v36, 1);
  v38 = 1000000;
  if (v37 != 1000000)
    v38 = (v37 + *(_DWORD *)(SP + 816) - 1) / *(_DWORD *)(SP + 816);
  *(_DWORD *)(SP + 904) = v38;
  v39 = _nc_tiparm(2, *((const char **)cur_term->type.Strings + 121), 32, 23);
  v40 = _nc_msec_cost(v39, 1);
  v41 = SP;
  v42 = 1000000;
  if (v40 != 1000000)
    v42 = (v40 + *(_DWORD *)(SP + 816) - 1) / *(_DWORD *)(SP + 816);
  *(_DWORD *)(SP + 908) = v42;
  v43 = _nc_tiparm(2, *(const char **)(v41 + 944), 23, 23);
  v44 = _nc_msec_cost(v43, 1);
  v45 = 1000000;
  if (v44 != 1000000)
    v45 = (v44 + *(_DWORD *)(SP + 816) - 1) / *(_DWORD *)(SP + 816);
  *(_DWORD *)(SP + 916) = v45;
  v46 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 8), 23);
  v47 = _nc_msec_cost(v46, 1);
  v48 = 1000000;
  if (v47 != 1000000)
    v48 = (v47 + *(_DWORD *)(SP + 816) - 1) / *(_DWORD *)(SP + 816);
  *(_DWORD *)(SP + 912) = v48;
  v49 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 112), 23);
  v50 = _nc_msec_cost(v49, 1);
  v51 = (_DWORD *)SP;
  if (v50 != 1000000)
    v8 = (v50 + *(_DWORD *)(SP + 816) - 1) / *(_DWORD *)(SP + 816);
  *(_DWORD *)(SP + 920) = v8;
  v52 = v51[229];
  v53 = v51[228];
  if (v53 >= v8)
    v53 = v8;
  if (v52 >= v53)
    v52 = v53;
  v51[231] = v52;
  v54 = cur_term;
  v55 = cur_term->type.Strings;
  v56 = v55[128];
  if (v56)
  {
    v57 = v55[28];
    if (v57)
    {
      if (strstr(v57, v56))
      {
        v55[128] = 0;
        *((_QWORD *)v54->type.Strings + 126) = 0;
      }
    }
  }
  _nc_mvcur_resume();
}

uint64_t _nc_mvcur_wrap()
{
  uint64_t result;
  int v1;
  char *v2;

  result = sub_1C05C3CF4(-1, -1, *(__int16 *)(SP + 128) - 1, 0, (int (__cdecl *)(int))_nc_outch, 1);
  if (SP)
  {
    v1 = *(_DWORD *)(SP + 760);
    if (v1 != -1)
    {
      curs_set(1);
      *(_DWORD *)(SP + 760) = v1;
    }
    v2 = (char *)*((_QWORD *)cur_term->type.Strings + 40);
    if (v2)
      _nc_putp((int)"exit_ca_mode", v2);
    return _nc_outch(13);
  }
  return result;
}

uint64_t _nc_mvcur(int a1, int a2, int a3, int a4)
{
  return sub_1C05C3CF4(a1, a2, a3, a4, (int (__cdecl *)(int))_nc_outch, 1);
}

uint64_t sub_1C05C3CF4(int a1, int a2, int a3, int a4, int (__cdecl *a5)(int), int a6)
{
  uint64_t v6;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  char *v21;
  int v22;
  char *v23;
  int v24;
  int v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  int v29;
  int v30;
  int v31;
  __int128 *v32;
  int v33;
  int v34;
  __int128 *v35;
  int v36;
  __int128 *v37;
  int v38;
  __int128 *v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  char *Booleans;
  int v45;
  BOOL v46;
  __int128 *v47;
  int v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  unsigned int *v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  __int16 v59;
  int v61;
  int v62;
  int v63;
  __int128 v64[2];
  char v65[512];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = SP;
  if (!SP)
    return 0xFFFFFFFFLL;
  v9 = a2;
  v10 = a1;
  if (a1 == a3 && a2 == a4)
    return 0;
  v12 = *(__int16 *)(SP + 130);
  if (v12 <= a4)
    v13 = a4 / v12 + a3;
  else
    v13 = a3;
  if (v12 <= a4)
    v14 = (a4 % v12);
  else
    v14 = a4;
  v15 = *(int **)(SP + 744);
  v16 = *v15;
  v63 = v15[6];
  if ((*v15 & 0x400000) != 0 || v16 && !cur_term->type.Booleans[14])
  {
    vid_puts(0, 0, 0, a5);
    v6 = SP;
    v12 = *(__int16 *)(SP + 130);
  }
  if (v12 <= v9)
  {
    if (*(_DWORD *)(v6 + 776))
    {
      v17 = (v9 + 1) / v12;
      v10 += v17;
      v18 = *(__int16 *)(v6 + 128);
      if (v10 >= v18)
        v19 = v10 + ~v18;
      else
        v19 = 0;
      v20 = v17 - v19;
      if (v17 - v19 >= 1)
      {
        v21 = (char *)*((_QWORD *)cur_term->type.Strings + 2);
        if (v21)
          _nc_putp((int)"carriage_return", v21);
        else
          ((void (*)(uint64_t))a5)(13);
        v22 = v20 + 1;
        do
        {
          v23 = (char *)*((_QWORD *)cur_term->type.Strings + 103);
          if (v23)
            _nc_putp((int)"newline", v23);
          else
            ((void (*)(uint64_t))a5)(10);
          --v22;
        }
        while (v22 > 1);
        v9 = 0;
      }
    }
    else
    {
      v9 = -1;
      v10 = -1;
    }
  }
  v24 = *(__int16 *)(SP + 128);
  if (v10 >= v24)
    v25 = v24 - 1;
  else
    v25 = v10;
  if (v13 >= v24)
    v26 = (v24 - 1);
  else
    v26 = v13;
  memset(v64, 0, sizeof(v64));
  v27 = _nc_str_init(v64, v65, 512);
  v28 = _nc_tiparm(2, *(const char **)(SP + 944), v26, v14);
  v29 = 1000000;
  if (_nc_safe_strcpy((uint64_t)v27, v28))
  {
    v29 = *(_DWORD *)(SP + 824);
    if (v9 == -1 || v25 == -1)
      goto LABEL_93;
    if ((int)v14 >= 8 && *(__int16 *)(SP + 130) - 8 > (int)v14)
    {
      v30 = v26 - v25;
      if ((int)v26 - v25 < 0)
        v30 = v25 - v26;
      v31 = v14 - v9;
      if ((int)v14 - v9 < 0)
        v31 = v9 - v14;
      if ((v30 + v31) > 7)
        goto LABEL_93;
    }
  }
  if (v9 != -1 && v25 != -1)
  {
    v32 = (__int128 *)_nc_str_null(v64, 512);
    v33 = sub_1C05C4418(v32, v25, v9, v26, v14, a6);
    v34 = v33 != 1000000 && v33 < v29;
    if (v33 != 1000000 && v33 < v29)
      v29 = v33;
    goto LABEL_54;
  }
  v34 = 0;
  if (v25 != -1)
  {
LABEL_54:
    if (*((_QWORD *)cur_term->type.Strings + 2))
    {
      v35 = (__int128 *)_nc_str_null(v64, 512);
      v36 = sub_1C05C4418(v35, v25, 0, v26, v14, a6);
      if (v36 != 1000000 && *(_DWORD *)(SP + 820) + v36 < v29)
      {
        v34 = 2;
        v29 = *(_DWORD *)(SP + 820) + v36;
      }
    }
  }
  if (*((_QWORD *)cur_term->type.Strings + 12))
  {
    v37 = (__int128 *)_nc_str_null(v64, 512);
    v38 = sub_1C05C4418(v37, 0, 0, v26, v14, a6);
    if (v38 != 1000000 && *(_DWORD *)(SP + 828) + v38 < v29)
    {
      v34 = 3;
      v29 = *(_DWORD *)(SP + 828) + v38;
    }
  }
  v62 = a6;
  if (*((_QWORD *)cur_term->type.Strings + 18))
  {
    v39 = (__int128 *)_nc_str_null(v64, 512);
    v40 = sub_1C05C4418(v39, *(__int16 *)(SP + 128) - 1, 0, v26, v14, a6);
    v41 = v14;
    if (v40 != 1000000 && *(_DWORD *)(SP + 832) + v40 < v29)
    {
      v34 = 4;
      v29 = *(_DWORD *)(SP + 832) + v40;
    }
  }
  else
  {
    v41 = v14;
  }
  v42 = v16;
  if (v9 < 1)
    v43 = 0;
  else
    v43 = *(_DWORD *)(SP + 820);
  Booleans = cur_term->type.Booleans;
  if (*Booleans
    && ((v45 = Booleans[4], v61 = v25 - 1, v25 >= 1) ? (v46 = v45 == 0) : (v46 = 0),
        v46
     && *((_QWORD *)cur_term->type.Strings + 14)
     && (v47 = (__int128 *)_nc_str_null(v64, 512),
         v48 = sub_1C05C4418(v47, v61, *(__int16 *)(SP + 130) - 1, v26, v41, v62),
         v48 != 1000000)
     && (v49 = v48 + v43 + *(_DWORD *)(SP + 836), v49 < v29)))
  {
    _nc_str_init(v64, v65, 512);
    if (v9 > 0)
      _nc_safe_strcat((uint64_t)v64, cur_term->type.Strings[2]);
    _nc_safe_strcat((uint64_t)v64, cur_term->type.Strings[14]);
    sub_1C05C4418(v64, v61, *(__int16 *)(SP + 130) - 1, v26, v41, v62);
    v29 = v49;
  }
  else if (v34)
  {
    _nc_str_init(v64, v65, 512);
    v16 = v42;
    LODWORD(v14) = v41;
    switch(v34)
    {
      case 1:
        v50 = v25;
        v51 = v9;
        goto LABEL_92;
      case 2:
        _nc_safe_strcpy((uint64_t)v64, cur_term->type.Strings[2]);
        v50 = v25;
        goto LABEL_91;
      case 3:
        _nc_safe_strcpy((uint64_t)v64, cur_term->type.Strings[12]);
        v50 = 0;
        goto LABEL_91;
      case 4:
        _nc_safe_strcpy((uint64_t)v64, cur_term->type.Strings[18]);
        v50 = *(__int16 *)(SP + 128) - 1;
LABEL_91:
        v51 = 0;
LABEL_92:
        sub_1C05C4418(v64, v50, v51, v26, v41, v62);
        break;
      default:
        goto LABEL_87;
    }
    goto LABEL_93;
  }
  v16 = v42;
LABEL_87:
  LODWORD(v14) = v41;
LABEL_93:
  if (v29 == 1000000)
  {
    v11 = 0xFFFFFFFFLL;
  }
  else
  {
    tputs(v65, 1, a5);
    v11 = 0;
    v52 = SP;
    *(_DWORD *)(SP + 764) = v26;
    *(_DWORD *)(v52 + 768) = v14;
  }
  v53 = (unsigned int *)_nc_abiver(&_nc_abiver);
  if (v16 != v56)
    goto LABEL_103;
  if (*v53 > v54)
  {
    v57 = v63;
    if (!v63)
      v57 = BYTE1(v16);
    v58 = *(_DWORD *)(v55 + 24);
    if (!v58)
      v58 = BYTE1(v16);
    if (v57 != v58)
    {
LABEL_103:
      if (*v53 <= v54)
      {
        v59 = BYTE1(v16);
      }
      else
      {
        v59 = BYTE1(v16);
        if (v63)
          v59 = v63;
      }
      vid_puts(v16, v59, 0, a5);
    }
  }
  return v11;
}

int mvcur(int a1, int a2, int a3, int a4)
{
  return sub_1C05C3CF4(a1, a2, a3, a4, _nc_putchar, 0);
}

uint64_t sub_1C05C4418(__int128 *a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  double v12;
  int v13;
  const char *v14;
  char *v15;
  char **Strings;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  int v35;
  uint64_t v36;
  __int128 v37;
  int v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  int v43;
  char **v44;
  unint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  _DWORD *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int *v56;
  int v57;
  _DWORD *v58;
  wint_t v59;
  int v60;
  int v61;
  int v62;
  uint64_t v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  int v71;
  int v72;
  unint64_t v73;
  char *v74;
  size_t v75;
  int v76;
  uint64_t v77;
  unint64_t v78;
  int v79;
  _BYTE *v80;
  uint64_t v81;
  int v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  char __s[512];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v86 = 0u;
  v87 = 0u;
  *(_QWORD *)&v12 = _nc_str_copy(&v86, (uint64_t)a1).n128_u64[0];
  if ((_DWORD)a4 == a2)
    goto LABEL_2;
  v14 = (const char *)*((_QWORD *)cur_term->type.Strings + 127);
  v13 = 1000000;
  if (v14)
  {
    v15 = _nc_tiparm(1, v14, v12, a4);
    if (_nc_safe_strcat((uint64_t)a1, v15))
      v13 = *(_DWORD *)(SP + 872);
  }
  Strings = cur_term->type.Strings;
  v17 = (a4 - a2);
  if ((int)a4 <= a2)
  {
    v27 = (a2 - a4);
    if (Strings[114])
    {
      if (*(_DWORD *)(SP + 864) < v13)
      {
        *(_QWORD *)&v28 = _nc_str_copy(a1, (uint64_t)&v86).n128_u64[0];
        v30 = v29;
        v31 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 114), v28, v27);
        if (_nc_safe_strcat(v30, v31))
          v13 = *(_DWORD *)(SP + 864);
      }
    }
    if (*((_QWORD *)cur_term->type.Strings + 19) && *(_DWORD *)(SP + 848) * (int)v27 < v13)
    {
      _nc_str_copy(a1, (uint64_t)&v86);
      v33 = v32;
      v34 = (char *)*((_QWORD *)cur_term->type.Strings + 19);
      if (strlen(v34) * (int)v27 < *(_QWORD *)(v32 + 16))
      {
        if ((int)v27 >= 1)
        {
          v13 = *(_DWORD *)(SP + 848) * v27;
          v35 = v27 + 1;
          while (_nc_safe_strcat(v33, v34))
          {
            if (--v35 <= 1)
              goto LABEL_32;
          }
          return 1000000;
        }
        goto LABEL_2;
      }
      return 1000000;
    }
  }
  else
  {
    if (Strings[107])
    {
      if (*(_DWORD *)(SP + 860) < v13)
      {
        *(_QWORD *)&v18 = _nc_str_copy(a1, (uint64_t)&v86).n128_u64[0];
        v20 = v19;
        v21 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 107), v18, v17);
        if (_nc_safe_strcat(v20, v21))
          v13 = *(_DWORD *)(SP + 860);
      }
    }
    v22 = (_BYTE *)*((_QWORD *)cur_term->type.Strings + 11);
    if (v22 && (*v22 != 10 || *(_DWORD *)(SP + 776)) && *(_DWORD *)(SP + 844) * (int)v17 < v13)
    {
      _nc_str_copy(a1, (uint64_t)&v86);
      v24 = v23;
      v25 = (char *)*((_QWORD *)cur_term->type.Strings + 11);
      if (strlen(v25) * (int)v17 < *(_QWORD *)(v23 + 16))
      {
        if ((int)v17 >= 1)
        {
          v13 = *(_DWORD *)(SP + 844) * v17;
          v26 = v17 + 1;
          while (_nc_safe_strcat(v24, v25))
          {
            if (--v26 <= 1)
              goto LABEL_32;
          }
          return 1000000;
        }
LABEL_2:
        v13 = 0;
        goto LABEL_33;
      }
      return 1000000;
    }
  }
LABEL_32:
  v36 = 1000000;
  if (v13 == 1000000)
    return v36;
LABEL_33:
  v37 = a1[1];
  v86 = *a1;
  v87 = v37;
  if ((_DWORD)a5 == a3)
  {
    v38 = 0;
    return (v38 + v13);
  }
  v36 = 1000000;
  v84 = 0u;
  v85 = 0u;
  v38 = 1000000;
  if (*((_QWORD *)cur_term->type.Strings + 8))
  {
    *(_QWORD *)&v39 = _nc_str_copy(a1, (uint64_t)&v86).n128_u64[0];
    v41 = v40;
    v42 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 8), v39, a5);
    v43 = _nc_safe_strcat(v41, v42);
    v38 = 1000000;
    if (v43)
      v38 = *(_DWORD *)(SP + 868);
  }
  v44 = cur_term->type.Strings;
  v45 = (a5 - a3);
  if ((int)a5 <= a3)
  {
    v65 = (a3 - a5);
    if (v44[111])
    {
      if (*(_DWORD *)(SP + 852) < v38)
      {
        *(_QWORD *)&v66 = _nc_str_copy(a1, (uint64_t)&v86).n128_u64[0];
        v68 = v67;
        v69 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 111), v66, v65);
        if (_nc_safe_strcat(v68, v69))
          v38 = *(_DWORD *)(SP + 852);
      }
    }
    if (*((_QWORD *)cur_term->type.Strings + 14))
    {
      _nc_str_init(&v84, __s, 512);
      v70 = (char *)*((_QWORD *)cur_term->type.Strings + 14);
      v71 = 1000000;
      if (strlen(v70) * (int)v65 < (unint64_t)v85)
      {
        if ((int)v65 >= 1)
        {
          v71 = *(_DWORD *)(SP + 836) * v65;
          v72 = v65 + 1;
          while (_nc_safe_strcat((uint64_t)&v84, v70))
          {
            if (--v72 <= 1)
              goto LABEL_94;
          }
          goto LABEL_90;
        }
        goto LABEL_89;
      }
LABEL_94:
      if (v71 < v38)
      {
        _nc_str_copy(a1, (uint64_t)&v86);
        if (_nc_safe_strcat(v81, __s))
          v38 = v71;
      }
    }
  }
  else
  {
    if (v44[112])
    {
      if (*(_DWORD *)(SP + 856) < v38)
      {
        *(_QWORD *)&v46 = _nc_str_copy(a1, (uint64_t)&v86).n128_u64[0];
        v48 = v47;
        v49 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 112), v46, v45);
        if (_nc_safe_strcat(v48, v49))
          v38 = *(_DWORD *)(SP + 856);
      }
    }
    if (*((_QWORD *)cur_term->type.Strings + 17))
    {
      _nc_str_init(&v84, __s, 512);
      if (a6 && (int)v45 >= 1 && (int)v45 < (int)v85)
      {
        v50 = (_DWORD *)_nc_abiver(&_nc_abiver);
        v51 = 0;
        v83 = a3;
        v52 = 1;
        v54 = 16 * v53;
        v55 = 28 * a3;
        while (1)
        {
          v56 = (int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(SP + 144) + 40) + v54) + v55);
          v57 = *v56;
          v58 = *(_DWORD **)(SP + 744);
          if (*v56 != *v58)
            goto LABEL_82;
          v59 = v56[1];
          v60 = v56[2];
          if (*v50 >= 0x60000u)
          {
            v61 = v56[6];
            if (!v61)
              v61 = BYTE1(v57);
            v62 = v58[6];
            if (!v62)
              v62 = BYTE1(v57);
            if (v61 != v62)
              goto LABEL_82;
          }
          if (!(*(_DWORD *)(SP + 1456) | v57 & 0x400000) && v57 >= 2u)
          {
            if (v57 < 0x20u || v60 != 0)
              goto LABEL_82;
          }
          else if (v60)
          {
            goto LABEL_82;
          }
          if (!_nc_is_charable(v59))
            break;
          v52 = ++v51 < v45;
          v55 += 28;
          if (v45 == v51)
            goto LABEL_91;
        }
        if (v52)
        {
LABEL_82:
          v73 = v45;
          v36 = 1000000;
          goto LABEL_83;
        }
LABEL_91:
        v77 = 28 * v83 + 4;
        v78 = v45;
        do
        {
          v79 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(SP + 144) + 40) + v54) + v77);
          v80 = (_BYTE *)(*((_QWORD *)&v84 + 1))++;
          *v80 = v79;
          v77 += 28;
          --v78;
        }
        while (v78);
        **((_BYTE **)&v84 + 1) = 0;
        *(_QWORD *)&v85 = v85 - v45;
        v71 = *(_DWORD *)(SP + 816) * v45;
        v36 = 1000000;
        goto LABEL_94;
      }
      v73 = (int)v45;
LABEL_83:
      v74 = (char *)*((_QWORD *)cur_term->type.Strings + 17);
      v75 = strlen(v74) * v73;
      v71 = 1000000;
      if (v75 < (unint64_t)v85)
      {
        if ((int)v45 >= 1)
        {
          v71 = *(_DWORD *)(SP + 840) * v45;
          v76 = v45 + 1;
          while (_nc_safe_strcat((uint64_t)&v84, v74))
          {
            if (--v76 <= 1)
              goto LABEL_94;
          }
LABEL_90:
          v71 = 1000000;
          goto LABEL_94;
        }
LABEL_89:
        v71 = 0;
        goto LABEL_94;
      }
      goto LABEL_94;
    }
  }
  if (v38 != 1000000)
    return (v38 + v13);
  return v36;
}

int mvwin(WINDOW *a1, int a2, int a3)
{
  int v3;

  if (!a1)
    return -1;
  if ((*((_WORD *)a1 + 6) & 0x10) != 0)
    return -1;
  v3 = *((__int16 *)a1 + 2);
  if (v3 + a2 >= *(__int16 *)(SP + 128) || (a3 | a2) < 0 || *((__int16 *)a1 + 3) + a3 >= *(__int16 *)(SP + 130))
    return -1;
  *((_WORD *)a1 + 4) = a2;
  *((_WORD *)a1 + 5) = a3;
  return wtouchln(a1, 0, v3 + 1, 1);
}

int napms(int a1)
{
  timespec v2;
  timespec __rqtp;

  v2 = (timespec)0;
  __rqtp.tv_sec = a1 / 1000;
  __rqtp.tv_nsec = 1000000 * (a1 % 1000);
  while (nanosleep(&__rqtp, &v2) == -1 && *__error() == 4)
    __rqtp = v2;
  return 0;
}

void filter(void)
{
  byte_1EF6147C9 = 1;
}

void nofilter(void)
{
  byte_1EF6147C9 = 0;
}

SCREEN *__cdecl newterm(char *a1, FILE *a2, FILE *a3)
{
  FILE *v4;
  FILE *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  _BOOL4 v14;
  SCREEN *result;
  uint64_t v16;
  char **Strings;
  _BOOL4 v18;
  _BYTE *v19;
  char **v20;
  const char *v21;
  const char *v22;
  BOOL v23;
  const char *v24;
  const char *v25;
  BOOL v26;
  const char *v27;
  const char *v28;
  BOOL v29;
  TERMINAL *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  termios buf;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = a2;
  else
    v4 = (FILE *)*MEMORY[0x1E0C80C20];
  if (a3)
    v5 = a3;
  else
    v5 = (FILE *)*MEMORY[0x1E0C80C18];
  v6 = SP;
  if (SP)
    v7 = *(_QWORD *)(SP + 48);
  else
    v7 = 0;
  v35 = 0;
  v8 = fileno(v4);
  if (_nc_setupterm(a1, v8, &v35, 0) == -1)
    return 0;
  SP = 0;
  v9 = *(_DWORD *)&PC[92];
  if (_nc_setupscreen(LINES, COLS, v4, byte_1EF6147C9, *(int *)&PC[92]) == -1)
  {
    result = 0;
    SP = v6;
    return result;
  }
  if (v6)
    *(_QWORD *)(v6 + 48) = v7;
  v10 = COLS;
  v11 = *(_QWORD *)(SP + 48);
  v12 = _nc_getenv_num("ESCDELAY");
  if ((v12 & 0x80000000) == 0)
    set_escdelay(v12);
  if (v9 && v9 <= 2 && cur_term->type.Numbers[8] >= 1)
    _nc_slk_initialize(*(_QWORD *)(SP + 152), v10);
  *(_DWORD *)SP = fileno(v5);
  v13 = fileno(v5);
  typeahead(v13);
  v14 = (~*(_DWORD *)(v11 + 96) & 0x300) == 0 && (*(_BYTE *)(v11 + 80) & 0x20) == 0;
  v16 = SP;
  *(_DWORD *)(SP + 792) = v14;
  *(_DWORD *)(v16 + 736) = 0;
  Strings = cur_term->type.Strings;
  if (Strings[129] && Strings[130])
    goto LABEL_32;
  if (!Strings[113] && !Strings[110] && !Strings[53])
  {
    v18 = 0;
    goto LABEL_33;
  }
  if (Strings[109] || Strings[106])
LABEL_32:
    v18 = 1;
  else
    v18 = Strings[22] != 0;
LABEL_33:
  *(_DWORD *)(v16 + 952) = v18;
  baudrate();
  v19 = (_BYTE *)SP;
  *(_QWORD *)(SP + 160) = 0;
  v20 = cur_term->type.Strings;
  v21 = v20[43];
  if (v21)
  {
    v22 = v20[39];
    if (v22)
      v23 = strcmp(v21, v22) != 0;
    else
      v23 = 1;
  }
  else
  {
    v23 = 0;
  }
  v19[1040] = v23;
  v24 = v20[44];
  if (v24)
  {
    v25 = v20[39];
    if (v25)
      v26 = strcmp(v24, v25) != 0;
    else
      v26 = 1;
  }
  else
  {
    v26 = 0;
  }
  v19[1041] = v26;
  v27 = v20[321];
  if (v27)
  {
    v28 = v20[39];
    if (v28)
      v29 = strcmp(v27, v28) != 0;
    else
      v29 = 1;
  }
  else
  {
    v29 = 0;
  }
  v19[1042] = v29;
  _nc_mvcur_init();
  _nc_screen_init();
  v30 = cur_term;
  if (!cbreak())
  {
    v31 = *(_OWORD *)&v30->Nttyb.c_cflag;
    *(_OWORD *)&buf.c_iflag = *(_OWORD *)&v30->Nttyb.c_iflag;
    *(_OWORD *)&buf.c_cflag = v31;
    v32 = *(_OWORD *)&v30->Nttyb.c_cc[16];
    *(_OWORD *)buf.c_cc = *(_OWORD *)v30->Nttyb.c_cc;
    *(_OWORD *)&buf.c_cc[16] = v32;
    buf.c_ospeed = v30->Nttyb.c_ospeed;
    buf.c_lflag = DWORD2(v31) & 0xFFFFFFE7;
    *(int8x16_t *)&buf.c_iflag = vandq_s8(*(int8x16_t *)&buf.c_iflag, (int8x16_t)xmmword_1C05E11E0);
    if (!_nc_set_tty_mode(&buf))
    {
      v33 = *(_OWORD *)&buf.c_cc[16];
      *(_OWORD *)v30->Nttyb.c_cc = *(_OWORD *)buf.c_cc;
      *(_OWORD *)&v30->Nttyb.c_cc[16] = v33;
      v30->Nttyb.c_ospeed = buf.c_ospeed;
      v34 = *(_OWORD *)&buf.c_cflag;
      *(_OWORD *)&v30->Nttyb.c_iflag = *(_OWORD *)&buf.c_iflag;
      *(_OWORD *)&v30->Nttyb.c_cflag = v34;
    }
  }
  _nc_signal_handler(1);
  return (SCREEN *)SP;
}

uint64_t _nc_freewin(uint64_t a1)
{
  char *v2;
  char *v3;
  char *v4;
  _QWORD *v5;
  WINDOW **v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = 0;
  v3 = &PC[464];
  do
  {
    v3 = *(char **)v3;
    if (!v3)
      return 0xFFFFFFFFLL;
    v4 = v2;
    v2 = v3;
  }
  while (v3 + 16 != (char *)a1);
  v5 = (_QWORD *)_nc_screen_chain;
  if (_nc_screen_chain)
  {
    while (1)
    {
      if (v5[17] == a1)
      {
        v5[17] = 0;
        v7 = &curscr;
        goto LABEL_16;
      }
      if (v5[19] == a1)
      {
        v5[19] = 0;
        v7 = &stdscr;
        goto LABEL_16;
      }
      if (v5[18] == a1)
        break;
      v5 = (_QWORD *)v5[174];
      if (!v5)
        goto LABEL_18;
    }
    v5[18] = 0;
    v7 = &newscr;
LABEL_16:
    if (*v7 == (WINDOW *)a1)
      *v7 = 0;
  }
LABEL_18:
  v8 = &PC[464];
  if (v4)
    v8 = v4;
  *(_QWORD *)v8 = *(_QWORD *)v3;
  if ((*(_WORD *)(a1 + 12) & 1) == 0)
  {
    v9 = *(__int16 *)(a1 + 4);
    if ((v9 & 0x80000000) == 0)
    {
      v10 = 0;
      v11 = -1;
      do
      {
        v12 = *(void **)(*(_QWORD *)(a1 + 40) + v10);
        if (v12)
        {
          free(v12);
          LOWORD(v9) = *(_WORD *)(a1 + 4);
        }
        ++v11;
        v10 += 16;
      }
      while (v11 < (__int16)v9);
    }
  }
  free(*(void **)(a1 + 40));
  free(v3);
  return 0;
}

WINDOW *__cdecl newwin(int a1, int a2, int a3, int a4)
{
  char *v4;
  int v5;
  signed int v6;
  _DWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = 0;
  if ((a2 | a1 | a3 | a4) < 0 || !SP)
    return (WINDOW *)v4;
  v5 = a2;
  v6 = a1;
  if (!a1)
  {
    v6 = *(__int16 *)(SP + 132) - a3;
    if (a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (!a2)
LABEL_5:
    v5 = *(__int16 *)(SP + 130) - a4;
LABEL_6:
  v4 = _nc_makenew(v6, v5, a3, a4, 0);
  if (v4 && v6 >= 1)
  {
    v7 = (_DWORD *)_nc_abiver(&_nc_abiver);
    v8 = 0;
    while (1)
    {
      v9 = calloc(v5, 0x1CuLL);
      *(_QWORD *)(*((_QWORD *)v4 + 5) + 16 * v8) = v9;
      if (!v9)
        break;
      if (v5 >= 1)
      {
        do
        {
          v9[1] = 0;
          v9[2] = 0;
          *((_DWORD *)v9 + 6) = 0;
          *v9 = 0x2000000000;
          if (*v7 >= 0x60000u)
          {
            *((_DWORD *)v9 + 6) = 0;
            *(_DWORD *)v9 = 0;
          }
          v9 = (_QWORD *)((char *)v9 + 28);
        }
        while ((unint64_t)v9 < *(_QWORD *)(*((_QWORD *)v4 + 5) + 16 * v8) + 28 * v5);
      }
      if (++v8 == v6)
        return (WINDOW *)v4;
    }
    _nc_freewin((uint64_t)v4);
    return 0;
  }
  return (WINDOW *)v4;
}

char *_nc_makenew(unsigned int a1, int a2, int a3, int a4, __int16 a5)
{
  char *result;
  __int16 v7;
  __int16 v8;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  BOOL v17;
  uint64_t v18;
  _WORD *v19;
  __int16 v20;
  int v21;

  result = 0;
  v7 = a2 - 1;
  if ((a2 - 1) <= 0x7FFE)
  {
    v8 = a1 - 1;
    if (a1 - 1 <= 0x7FFE)
    {
      if (SP)
      {
        result = (char *)calloc(1uLL, 0xD0uLL);
        if (result)
        {
          v13 = result;
          v14 = a1;
          v15 = (char *)calloc(a1, 0x10uLL);
          *((_QWORD *)v13 + 7) = v15;
          if (v15)
          {
            v16 = v15;
            v17 = 0;
            *((_DWORD *)v13 + 4) = 0;
            v18 = SP;
            *((_WORD *)v13 + 50) = *(_WORD *)(SP + 134);
            result = v13 + 16;
            *((_WORD *)v13 + 10) = v8;
            *((_WORD *)v13 + 11) = v7;
            *((_WORD *)v13 + 12) = a3;
            *((_WORD *)v13 + 13) = a4;
            *((_WORD *)v13 + 14) = a5;
            *((_DWORD *)v13 + 8) = 0;
            *((_DWORD *)v13 + 32) = 0;
            *((_QWORD *)v13 + 14) = 0;
            *((_QWORD *)v13 + 15) = 0;
            *((_QWORD *)v13 + 13) = 0x2000000000;
            if ((a5 & 0x10) == 0)
              v17 = *(__int16 *)(v18 + 128) == a1 && *(__int16 *)(v18 + 130) == a2;
            v13[41] = v17;
            *(_DWORD *)(v13 + 42) = 0x1000000;
            v13[48] = 0;
            *((_DWORD *)v13 + 13) = -1;
            *((_WORD *)v13 + 23) = 0;
            *(_QWORD *)(v13 + 68) = -1;
            *((_WORD *)v13 + 32) = 0;
            *((_WORD *)v13 + 33) = v8;
            *((_QWORD *)v13 + 10) = 0;
            *((_QWORD *)v13 + 11) = -1;
            v19 = v16 + 10;
            *((_DWORD *)v13 + 24) = -1;
            do
            {
              *(v19 - 1) = 0;
              *v19 = v7;
              v19 += 8;
              --v14;
            }
            while (v14);
            if ((a5 & 0x10) == 0 && a4 + a2 == *(__int16 *)(v18 + 130))
            {
              v20 = a5 | 2;
              *((_WORD *)v13 + 14) = a5 | 2;
              v21 = *(__int16 *)(v18 + 128);
              if (!a4 && !a3 && v21 == a1)
              {
                v20 = a5 | 6;
                *((_WORD *)v13 + 14) = a5 | 6;
              }
              if (a3 + a1 == v21)
                *((_WORD *)v13 + 14) = v20 | 8;
            }
            *(_QWORD *)v13 = *(_QWORD *)&PC[464];
            *((_QWORD *)v13 + 1) = SP;
            *(_QWORD *)&PC[464] = v13;
          }
          else
          {
            free(v13);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

WINDOW *__cdecl derwin(WINDOW *a1, int a2, int a3, int a4, int a5)
{
  WINDOW *result;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  __int16 v14;
  __int128 v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;

  result = 0;
  if (a1 && ((a3 | a2 | a4 | a5) & 0x80000000) == 0)
  {
    v9 = *((__int16 *)a1 + 2) + 1;
    if (a4 + a2 <= v9 && (v10 = *((__int16 *)a1 + 3) + 1, a5 + a3 <= v10))
    {
      v11 = v9 - a4;
      if (a2)
        v12 = a2;
      else
        v12 = v11;
      if (a3)
        v13 = a3;
      else
        v13 = v10 - a5;
      if ((*((_WORD *)a1 + 6) & 0x10) != 0)
        v14 = 17;
      else
        v14 = 1;
      result = (WINDOW *)_nc_makenew(v12, v13, *((__int16 *)a1 + 4) + a4, *((__int16 *)a1 + 5) + a5, v14);
      if (result)
      {
        *((_DWORD *)result + 13) = a5;
        *((_DWORD *)result + 14) = a4;
        *((_DWORD *)result + 4) = *((_DWORD *)a1 + 4);
        v15 = *(_OWORD *)((char *)a1 + 88);
        *(_OWORD *)((char *)result + 100) = *(_OWORD *)((char *)a1 + 100);
        *(_OWORD *)((char *)result + 88) = v15;
        if ((int)v12 >= 1)
        {
          v16 = (_QWORD *)*((_QWORD *)result + 5);
          v17 = (uint64_t *)(*((_QWORD *)a1 + 5) + 16 * a4);
          do
          {
            v18 = *v17;
            v17 += 2;
            *v16 = v18 + 28 * a5;
            v16 += 2;
            --v12;
          }
          while (v12);
        }
        *((_QWORD *)result + 8) = a1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

WINDOW *__cdecl subwin(WINDOW *result, int a2, int a3, int a4, int a5)
{
  if (result)
    return derwin(result, a2, a3, a4 - *((__int16 *)result + 4), a5 - *((__int16 *)result + 5));
  return result;
}

int nl(void)
{
  int result;

  if (!SP)
    return -1;
  result = 0;
  *(_DWORD *)(SP + 776) = 1;
  return result;
}

int nonl(void)
{
  int result;

  if (!SP)
    return -1;
  result = 0;
  *(_DWORD *)(SP + 776) = 0;
  return result;
}

int idlok(WINDOW *a1, BOOL a2)
{
  _BOOL4 v2;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int result;

  if (!a1)
    return -1;
  v2 = a2;
  v4 = _nc_screen_of((uint64_t)a1);
  if (!v4)
    return -1;
  v5 = v4;
  v6 = v2 && (has_il() || *((_QWORD *)cur_term->type.Strings + 3) != 0);
  result = 0;
  *((_BYTE *)a1 + 28) = v6;
  *(_BYTE *)(v5 + 1043) = v6;
  return result;
}

void idcok(WINDOW *a1, BOOL a2)
{
  _BOOL4 v2;
  uint64_t v4;
  BOOL v5;

  if (a1)
  {
    v2 = a2;
    v4 = _nc_screen_of((uint64_t)a1);
    v5 = v2 && has_ic();
    *((_BYTE *)a1 + 29) = v5;
    *(_BYTE *)(v4 + 1044) = v5;
  }
}

int halfdelay(int a1)
{
  int result;

  if ((a1 - 1) > 0xFE || cur_term == 0)
    return -1;
  cbreak();
  result = 0;
  *(_DWORD *)(SP + 784) = a1 + 1;
  return result;
}

int nodelay(WINDOW *a1, BOOL a2)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_DWORD *)a1 + 9) = a2 - 1;
  return result;
}

int notimeout(WINDOW *a1, BOOL a2)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_BYTE *)a1 + 24) = a2;
  return result;
}

void wtimeout(WINDOW *a1, int a2)
{
  if (a1)
    *((_DWORD *)a1 + 9) = a2;
}

int keypad(WINDOW *a1, BOOL a2)
{
  _BOOL4 v2;
  uint64_t v3;

  if (!a1)
    return -1;
  v2 = a2;
  *((_BYTE *)a1 + 32) = a2;
  v3 = _nc_screen_of((uint64_t)a1);
  return _nc_keypad(v3, v2);
}

uint64_t _nc_keypad(uint64_t a1, int a2)
{
  char **Strings;
  uint64_t result;
  char *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  Strings = cur_term->type.Strings;
  if (a2)
  {
    if (_nc_putp((int)"keypad_xmit", Strings[89]) != -1)
      _nc_flush();
    if (!*(_BYTE *)(a1 + 176))
    {
      _nc_init_keytry(a1);
      *(_BYTE *)(a1 + 176) = 1;
    }
  }
  else
  {
    v6 = Strings[88];
    if (v6 && _nc_putp((int)"keypad_local", v6) != -1)
      _nc_flush();
  }
  result = 0;
  *(_BYTE *)(a1 + 177) = a2 != 0;
  return result;
}

int meta(WINDOW *a1, BOOL a2)
{
  _BOOL4 v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;

  v2 = a2;
  if (!a1)
  {
    v3 = SP;
    if (SP)
      goto LABEL_3;
    return -1;
  }
  v3 = _nc_screen_of((uint64_t)a1);
  if (!v3)
    return -1;
LABEL_3:
  *(_DWORD *)(v3 + 792) = v2;
  v4 = 101;
  if (v2)
  {
    v4 = 102;
    v5 = "meta_on";
  }
  else
  {
    v5 = "meta_off";
  }
  _nc_putp((int)v5, cur_term->type.Strings[v4]);
  return 0;
}

int curs_set(int a1)
{
  int result;
  int v3;
  char *v4;
  const char *v5;

  result = -1;
  if (a1 <= 2 && SP)
  {
    v3 = *(_DWORD *)(SP + 760);
    if (v3 == a1)
    {
      return a1;
    }
    else
    {
      if (a1)
      {
        if (a1 == 1)
        {
          v4 = (char *)*((_QWORD *)cur_term->type.Strings + 16);
          v5 = "cursor_normal";
        }
        else
        {
          v4 = (char *)*((_QWORD *)cur_term->type.Strings + 20);
          v5 = "cursor_visible";
        }
      }
      else
      {
        v4 = (char *)*((_QWORD *)cur_term->type.Strings + 13);
        v5 = "cursor_invisible";
      }
      result = _nc_putp((int)v5, v4);
      if (result != -1)
      {
        _nc_flush();
        if (v3 == -1)
          result = 1;
        else
          result = v3;
      }
      *(_DWORD *)(SP + 760) = a1;
    }
  }
  return result;
}

uint64_t _nc_putp_flush(int a1, char *a2)
{
  uint64_t v2;

  v2 = _nc_putp(a1, a2);
  if ((_DWORD)v2 != -1)
    _nc_flush();
  return v2;
}

int typeahead(int a1)
{
  int result;

  if (!cur_term)
    return -1;
  result = 0;
  *(_DWORD *)(SP + 44) = a1;
  return result;
}

int has_key(int a1)
{
  if (SP)
    return sub_1C05C5A68(*(uint64_t *)&a1, *(_QWORD *)(SP + 160));
  else
    return 0;
}

uint64_t sub_1C05C5A68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  v2 = a2;
  while (*(unsigned __int16 *)(v2 + 18) != (_DWORD)a1 && !sub_1C05C5A68(a1, *(_QWORD *)v2))
  {
    v2 = *(_QWORD *)(v2 + 8);
    if (!v2)
      return 0;
  }
  return 1;
}

int overlay(const WINDOW *a1, WINDOW *a2)
{
  return sub_1C05C5ACC((uint64_t)a1, (uint64_t)a2, 1);
}

uint64_t sub_1C05C5ACC(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  BOOL v12;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;

  if (!a1 || !a2)
    return 0xFFFFFFFFLL;
  v3 = *(__int16 *)(a1 + 10);
  v4 = *(__int16 *)(a1 + 8);
  v5 = *(__int16 *)(a1 + 6) + v3;
  v6 = *(__int16 *)(a1 + 4) + v4;
  v7 = *(__int16 *)(a2 + 10);
  v8 = *(__int16 *)(a2 + 8);
  v9 = *(__int16 *)(a2 + 6) + v7;
  v10 = *(__int16 *)(a2 + 4) + v8;
  v11 = v9 < v3 || v5 < v7;
  v12 = v11 || v10 < v4;
  if (v12 || v6 < v8)
    return 0xFFFFFFFFLL;
  if (v4 <= v8)
    v15 = *(__int16 *)(a2 + 8);
  else
    v15 = *(__int16 *)(a1 + 8);
  v16 = v15 - v4;
  if (v3 <= v7)
    v17 = *(__int16 *)(a2 + 10);
  else
    v17 = *(__int16 *)(a1 + 10);
  v18 = v17 - v3;
  if (v6 >= v10)
    v19 = *(__int16 *)(a2 + 4) + v8;
  else
    v19 = v6;
  if (v5 >= v9)
    v5 = *(__int16 *)(a2 + 6) + v7;
  return copywin((const WINDOW *)a1, (WINDOW *)a2, v16, v18, v15 - v8, v17 - v7, v19 - v8, v5 - v7, a3);
}

int overwrite(const WINDOW *a1, WINDOW *a2)
{
  return sub_1C05C5ACC((uint64_t)a1, (uint64_t)a2, 0);
}

int copywin(const WINDOW *a1, WINDOW *a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9)
{
  int result;
  uint64_t v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  char v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  char v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  __int128 *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 *v38;
  __int128 v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _DWORD *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;

  result = -1;
  if (!a1)
    return result;
  if (!a2)
    return result;
  v12 = *(_QWORD *)&a5;
  if (a7 < a5 || a8 < a6)
    return result;
  v13 = a3;
  v14 = (*((_DWORD *)a2 + 22) & 0xFF00) != 0 ? -65536 : -256;
  if (a3 - a5 + a7 > *((__int16 *)a1 + 2) + 1)
    return result;
  v15 = a4;
  if (a4 - a6 + a8 > *((__int16 *)a1 + 3) + 1 || *((__int16 *)a2 + 2) < a7 || *((__int16 *)a2 + 3) < a8)
    return result;
  v44 = (_DWORD *)_nc_abiver(&_nc_abiver);
  v18 = 0;
  v20 = v19 & 0xFFFFFF00;
  v45 = v21 + 1;
  v46 = v15;
  v23 = v22 + 1;
  v24 = v12;
  v47 = v14;
  v48 = v17;
  while (2)
  {
    if ((v24 & 0x80000000) != 0 || (v13 & 0x80000000) != 0)
      goto LABEL_44;
    v25 = 0;
    v26 = v16;
    v27 = v15;
    v49 = v24;
    do
    {
      if ((v26 & 0x80000000) == 0 && (v27 & 0x80000000) == 0)
      {
        if (a9)
        {
          v28 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * v13);
          v29 = *(_DWORD *)(v28 + 28 * v27 + 4);
          if (v29 == 32)
            goto LABEL_39;
          v30 = *(_QWORD *)(*((_QWORD *)a2 + 5) + 16 * v24);
          v31 = (__int128 *)(v28 + 28 * v27);
          v32 = v30 + 28 * v26;
          if (*(_DWORD *)v32 == *(_DWORD *)v31
            && *(_DWORD *)(v30 + 28 * v26 + 4) == v29
            && *(_DWORD *)(v30 + 28 * v26 + 8) == *(_DWORD *)(v28 + 28 * v27 + 8)
            && *(_DWORD *)(v30 + 28 * v26 + 12) == *(_DWORD *)(v28 + 28 * v27 + 12)
            && *(_DWORD *)(v30 + 28 * v26 + 16) == *(_DWORD *)(v28 + 28 * v27 + 16)
            && *(_DWORD *)(v30 + 28 * v26 + 20) == *(_DWORD *)(v28 + 28 * v27 + 20)
            && (*v44 <= 0x5FFFFu || *(_DWORD *)(v30 + 28 * v26 + 24) == *(_DWORD *)(v28 + 28 * v27 + 24)))
          {
            goto LABEL_39;
          }
          v33 = *v31;
          *(_OWORD *)(v32 + 12) = *(__int128 *)((char *)v31 + 12);
          *(_OWORD *)v32 = v33;
          v34 = *(_QWORD *)(*((_QWORD *)a2 + 5) + 16 * v24);
          *(_DWORD *)(v34 + 28 * v26) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * v13) + 28 * v27) & v14 | v20 | *(unsigned __int8 *)(v34 + 28 * v26);
        }
        else
        {
          v35 = *(_QWORD *)(*((_QWORD *)a2 + 5) + 16 * v24);
          v36 = v35 + 28 * v26;
          v37 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * v13);
          v38 = (__int128 *)(v37 + 28 * v27);
          if (*(_DWORD *)v36 == *(_DWORD *)v38
            && *(_DWORD *)(v35 + 28 * v26 + 4) == *(_DWORD *)(v37 + 28 * v27 + 4)
            && *(_DWORD *)(v35 + 28 * v26 + 8) == *(_DWORD *)(v37 + 28 * v27 + 8)
            && *(_DWORD *)(v35 + 28 * v26 + 12) == *(_DWORD *)(v37 + 28 * v27 + 12)
            && *(_DWORD *)(v35 + 28 * v26 + 16) == *(_DWORD *)(v37 + 28 * v27 + 16)
            && *(_DWORD *)(v35 + 28 * v26 + 20) == *(_DWORD *)(v37 + 28 * v27 + 20)
            && (*v44 <= 0x5FFFFu || *(_DWORD *)(v35 + 28 * v26 + 24) == *(_DWORD *)(v37 + 28 * v27 + 24)))
          {
            goto LABEL_39;
          }
          v39 = *v38;
          *(_OWORD *)(v36 + 12) = *(__int128 *)((char *)v38 + 12);
          *(_OWORD *)v36 = v39;
        }
        v25 = 1;
LABEL_39:
        v18 = 1;
      }
      ++v27;
      ++v26;
    }
    while (v23 != v26);
    if ((v25 & 1) != 0)
    {
      v40 = v12;
      v41 = v12;
      v42 = v16;
      wtouchln(a2, v40, v45, 1);
      v16 = v42;
      v12 = v41;
      v15 = v46;
      v14 = v47;
      v17 = v48;
    }
    v24 = v49;
LABEL_44:
    ++v13;
    if (v24++ != v17)
      continue;
    return (v18 & 1) - 1;
  }
}

WINDOW *__cdecl newpad(int a1, int a2)
{
  char *v2;
  _DWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = 0;
  if (a1 >= 1 && a2 >= 1)
  {
    v2 = _nc_makenew(a1, a2, 0, 0, 16);
    if (v2)
    {
      v5 = (_DWORD *)_nc_abiver(&_nc_abiver);
      v6 = 0;
      while (1)
      {
        v7 = calloc(a2, 0x1CuLL);
        *(_QWORD *)(*((_QWORD *)v2 + 5) + 16 * v6) = v7;
        if (!v7)
          break;
        do
        {
          v7[1] = 0;
          v7[2] = 0;
          *((_DWORD *)v7 + 6) = 0;
          *v7 = 0x2000000000;
          if (*v5 >= 0x60000u)
          {
            *((_DWORD *)v7 + 6) = 0;
            *(_DWORD *)v7 = 0;
          }
          v7 = (_QWORD *)((char *)v7 + 28);
        }
        while ((unint64_t)v7 < *(_QWORD *)(*((_QWORD *)v2 + 5) + 16 * v6)
                                     + 28 * (unint64_t)a2);
        if (++v6 == a1)
          return (WINDOW *)v2;
      }
      _nc_freewin((uint64_t)v2);
      return 0;
    }
  }
  return (WINDOW *)v2;
}

WINDOW *__cdecl subpad(WINDOW *result, int a2, int a3, int a4, int a5)
{
  if (result)
  {
    if ((*((_WORD *)result + 6) & 0x10) != 0)
      return derwin(result, a2, a3, a4, a5);
    else
      return 0;
  }
  return result;
}

int prefresh(WINDOW *a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  if (pnoutrefresh(a1, a2, a3, a4, a5, a6, a7) == -1 || doupdate() == -1)
    return -1;
  else
    return 0;
}

int pnoutrefresh(WINDOW *a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int result;
  _DWORD *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  __int16 *v43;
  __int16 *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int *v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _DWORD *v61;
  uint64_t v62;
  char v63;
  int v64;
  int v65;
  _WORD *v66;
  int v67;
  __int16 v68;
  __int16 v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;

  if (!a1)
    return -1;
  if ((*((_WORD *)a1 + 6) & 0x10) == 0)
    return -1;
  v14 = _nc_screen_of((uint64_t)a1);
  v15 = a2 & ~(a2 >> 31);
  LODWORD(v16) = a3 & ~(a3 >> 31);
  v17 = a4 & ~(a4 >> 31);
  v18 = a5 & ~(a5 >> 31);
  v19 = *((__int16 *)a1 + 2);
  v23 = v19 < v15 - v17 + a6;
  v20 = v19 - (v15 - v17);
  if (v23)
  {
    v21 = v15 - v17 + v20;
  }
  else
  {
    v20 = a6;
    v21 = v15 - v17 + a6;
  }
  v22 = *((__int16 *)a1 + 3);
  v23 = v22 < (int)v16 - v18 + a7;
  v24 = v22 - (v16 - v18);
  v25 = v23 ? v24 : a7;
  LODWORD(v26) = v23 ? v16 - v18 + v24 : (int)v16 - v18 + a7;
  if (v20 >= *(__int16 *)(v14 + 128))
    return -1;
  v27 = v14;
  result = -1;
  if (v18 <= v25 && v17 <= v20 && v25 < *(__int16 *)(v27 + 130))
  {
    v68 = v25;
    v69 = v20;
    v73 = a5 & ~(a5 >> 31);
    v70 = a4 & ~(a4 >> 31);
    v71 = a2 & ~(a2 >> 31);
    v67 = v21;
    if (v15 <= v21)
    {
      v29 = (_DWORD *)_nc_abiver(&_nc_abiver);
      v30 = (int)v26;
      v32 = v31;
      v72 = v16 - 1;
      v33 = 28 * (v16 - 1);
      v34 = a2 & ~(a2 >> 31);
      v35 = 28 * v16;
      v36 = 28 * v73;
      while (1)
      {
        v37 = *(_QWORD *)(v27 + 144);
        if (v32 > *(__int16 *)(v37 + 4))
          goto LABEL_46;
        v38 = *((_QWORD *)a1 + 5) + 16 * v34;
        v39 = v16;
        v40 = v26;
        if ((int)v16 <= (int)v26)
          break;
LABEL_45:
        *(_DWORD *)(v38 + 8) = -1;
        ++v32;
        v23 = v34++ < v67;
        v16 = v39;
        v26 = v40;
        if (!v23)
          goto LABEL_46;
      }
      v41 = 0;
      v42 = (_QWORD *)(*(_QWORD *)(v37 + 40) + 16 * v32);
      v43 = (__int16 *)(v42 + 1);
      v44 = (__int16 *)v42 + 5;
      v45 = v72;
      v46 = v73;
      while (1)
      {
        v47 = (unsigned int *)(v35 + v41 + *(_QWORD *)v38);
        v49 = *v47;
        v48 = v47[1];
        v50 = v47[2];
        v51 = v47[3];
        v53 = v47[4];
        v52 = v47[5];
        v54 = v47[6];
        if (!v41 && v35 && (*v47 & 0xFE) - 2 <= 0x1D)
        {
          v55 = *(_DWORD *)(*(_QWORD *)v38 + v33);
          v56 = BYTE1(v55);
          if (*v29 > 0x5FFFFu)
            v49 = v55 & 0xFFFF00FF | (BYTE1(v55) << 8);
          else
            v49 = *(_DWORD *)(*(_QWORD *)v38 + v33);
          v48 = 32;
          v50 = 0;
          v51 = 0;
          v53 = 0;
          v52 = 0;
          if (*v29 > 0x5FFFFu)
            v54 = v56;
          else
            v54 = 0;
        }
        v57 = *v42;
        v58 = *v42 + v36;
        if (v49 == *(_DWORD *)(v58 + v41) && v48 == *(_DWORD *)(v58 + v41 + 4))
        {
          v59 = v57 + v36 + v41;
          if (v50 == *(_DWORD *)(v59 + 8) && v51 == *(_DWORD *)(v59 + 12))
          {
            v60 = v57 + v36 + v41;
            if (v53 == *(_DWORD *)(v60 + 16)
              && v52 == *(_DWORD *)(v60 + 20)
              && (*v29 <= 0x5FFFFu || v54 == *(_DWORD *)(v57 + v36 + v41 + 24)))
            {
              goto LABEL_44;
            }
          }
        }
        *(_DWORD *)(v58 + v41) = v49;
        v61 = (_DWORD *)(v58 + v41);
        v61[1] = v48;
        v61[2] = v50;
        v61[3] = v51;
        v61[4] = v53;
        v61[5] = v52;
        v61[6] = v54;
        v62 = *v43;
        if (v62 == -1)
        {
          *v44 = v46;
        }
        else if (v46 >= v62)
        {
          if (v46 > *v44)
            *v44 = v46;
          goto LABEL_44;
        }
        *v43 = v46;
LABEL_44:
        ++v46;
        ++v45;
        v41 += 28;
        if (v45 >= v30)
          goto LABEL_45;
      }
    }
LABEL_46:
    *((_WORD *)a1 + 5) = v73;
    *((_WORD *)a1 + 4) = v70;
    if (*((_BYTE *)a1 + 25))
    {
      *((_BYTE *)a1 + 25) = 0;
      *(_BYTE *)(*(_QWORD *)(v27 + 144) + 25) = 1;
    }
    v63 = *((_BYTE *)a1 + 26);
    if (!v63)
    {
      v64 = *(__int16 *)a1;
      if (v71 <= v64)
      {
        v65 = *((__int16 *)a1 + 1);
        if ((int)v16 <= v65 && v67 >= v64 && (int)v26 >= v65)
        {
          v66 = *(_WORD **)(v27 + 144);
          *v66 = v70 - v71 + v64 + *((_WORD *)a1 + 42);
          v66[1] = v73 - v16 + v65;
        }
      }
    }
    result = 0;
    *(_BYTE *)(*(_QWORD *)(v27 + 144) + 26) = v63;
    *((_WORD *)a1 + 6) &= ~0x20u;
    *((_WORD *)a1 + 36) = v71;
    *((_WORD *)a1 + 37) = v16;
    *((_WORD *)a1 + 38) = v70;
    *((_WORD *)a1 + 39) = v73;
    *((_WORD *)a1 + 40) = v69;
    *((_WORD *)a1 + 41) = v68;
  }
  return result;
}

int pechochar(WINDOW *a1, const chtype a2)
{
  if (!a1)
    return -1;
  if ((*((_WORD *)a1 + 6) & 0x10) == 0)
    return wechochar(a1, a2);
  waddch(a1, a2);
  prefresh(a1, *((__int16 *)a1 + 36), *((__int16 *)a1 + 37), *((__int16 *)a1 + 38), *((__int16 *)a1 + 39), *((__int16 *)a1 + 40), *((__int16 *)a1 + 41));
  return 0;
}

uint64_t pecho_wchar(uint64_t a1, _OWORD *a2)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  if ((*(_WORD *)(a1 + 12) & 0x10) == 0)
    return wecho_wchar(a1, a2);
  wadd_wch((WINDOW *)a1, a2);
  prefresh((WINDOW *)a1, *(__int16 *)(a1 + 72), *(__int16 *)(a1 + 74), *(__int16 *)(a1 + 76), *(__int16 *)(a1 + 78), *(__int16 *)(a1 + 80), *(__int16 *)(a1 + 82));
  return 0;
}

int mcprint(char *a1, int a2)
{
  uint64_t v2;
  char **Strings;
  const char *v5;
  char *v6;
  size_t v7;
  size_t v8;
  size_t v9;
  size_t v10;
  size_t v11;
  const char *v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  int *v17;
  int v18;

  v2 = *(_QWORD *)&a2;
  *__error() = 0;
  if ((int)v2 < 1 || !cur_term)
    goto LABEL_13;
  Strings = cur_term->type.Strings;
  v5 = Strings[144];
  if (!v5)
  {
    v6 = Strings[120];
    if (v6)
    {
      v12 = Strings[119];
      if (v12)
      {
        v8 = strlen(Strings[120]);
        v9 = strlen(v12);
        v10 = v2;
        v11 = v8 + v2 + v9;
        goto LABEL_9;
      }
    }
LABEL_13:
    v17 = __error();
    v18 = 19;
LABEL_15:
    *v17 = v18;
    return -1;
  }
  v6 = _nc_tiparm(1, v5, v2);
  v7 = strlen(v6);
  if (!v6)
  {
LABEL_14:
    v17 = __error();
    v18 = 12;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = 0;
  v10 = v2;
  v11 = v7 + v2;
LABEL_9:
  v13 = (char *)malloc(v11 + 1);
  if (!v13)
    goto LABEL_14;
  v14 = v13;
  v15 = &strcpy(v13, v6)[v8];
  memcpy(v15, a1, v10);
  if (v9)
    strcpy(&v15[v10], *((const char **)cur_term->type.Strings + 119));
  v16 = write(cur_term->Filedes, v14, v11);
  sleep(0);
  free(v14);
  return v16;
}

int printw(const char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  return vwprintw(stdscr, a1, va);
}

int vwprintw(WINDOW *a1, const char *a2, va_list a3)
{
  char *v4;

  v4 = _nc_printf_string(a2, a3);
  if (v4)
    return waddnstr(a1, v4, -1);
  else
    return -1;
}

int wprintw(WINDOW *a1, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  return vwprintw(a1, a2, va);
}

int mvprintw(int a1, int a2, const char *a3, ...)
{
  int result;
  va_list va;

  va_start(va, a3);
  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return vwprintw(stdscr, a3, va);
  return result;
}

int mvwprintw(WINDOW *a1, int a2, int a3, const char *a4, ...)
{
  int result;
  va_list va;

  va_start(va, a4);
  result = wmove(a1, a2, a3);
  if (result != -1)
    return vwprintw(a1, a4, va);
  return result;
}

int raw(void)
{
  TERMINAL *v0;
  __int128 v1;
  tcflag_t v2;
  __int128 v3;
  int result;
  __int128 v5;
  __int128 v6;
  termios v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = cur_term;
  if (!cur_term)
    return -1;
  v1 = *(_OWORD *)&cur_term->Nttyb.c_cflag;
  *(_OWORD *)&v7.c_iflag = *(_OWORD *)&cur_term->Nttyb.c_iflag;
  *(_OWORD *)&v7.c_cflag = v1;
  v7.c_ospeed = cur_term->Nttyb.c_ospeed;
  v2 = DWORD2(v1) & 0xFFFFFA7F;
  v3 = *(_OWORD *)&cur_term->Nttyb.c_cc[16];
  *(_OWORD *)v7.c_cc = *(_OWORD *)cur_term->Nttyb.c_cc;
  *(_OWORD *)&v7.c_cc[16] = v3;
  v7.c_lflag = v2;
  v7.c_iflag = v7.c_iflag & 0xFFFFFDF5;
  *(_WORD *)&v7.c_cc[16] = 1;
  result = _nc_set_tty_mode(&v7);
  if (!result)
  {
    *(_QWORD *)(SP + 780) = 0x100000001;
    v0->Nttyb.c_ospeed = v7.c_ospeed;
    v5 = *(_OWORD *)&v7.c_cc[16];
    *(_OWORD *)v0->Nttyb.c_cc = *(_OWORD *)v7.c_cc;
    *(_OWORD *)&v0->Nttyb.c_cc[16] = v5;
    v6 = *(_OWORD *)&v7.c_cflag;
    *(_OWORD *)&v0->Nttyb.c_iflag = *(_OWORD *)&v7.c_iflag;
    *(_OWORD *)&v0->Nttyb.c_cflag = v6;
  }
  return result;
}

int cbreak(void)
{
  TERMINAL *v0;
  __int128 v1;
  __int128 v2;
  int result;
  __int128 v4;
  __int128 v5;
  termios v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = cur_term;
  if (!cur_term)
    return -1;
  v1 = *(_OWORD *)&cur_term->Nttyb.c_cflag;
  *(_OWORD *)&v6.c_iflag = *(_OWORD *)&cur_term->Nttyb.c_iflag;
  *(_OWORD *)&v6.c_cflag = v1;
  v2 = *(_OWORD *)&cur_term->Nttyb.c_cc[16];
  *(_OWORD *)v6.c_cc = *(_OWORD *)cur_term->Nttyb.c_cc;
  *(_OWORD *)&v6.c_cc[16] = v2;
  v6.c_ospeed = cur_term->Nttyb.c_ospeed;
  v6.c_iflag = v6.c_iflag & 0xFFFFFEFF;
  v6.c_lflag = v6.c_lflag & 0xFFFFFE7F | 0x80;
  *(_WORD *)&v6.c_cc[16] = 1;
  result = _nc_set_tty_mode(&v6);
  if (!result)
  {
    *(_DWORD *)(SP + 784) = 1;
    v0->Nttyb.c_ospeed = v6.c_ospeed;
    v4 = *(_OWORD *)&v6.c_cc[16];
    *(_OWORD *)v0->Nttyb.c_cc = *(_OWORD *)v6.c_cc;
    *(_OWORD *)&v0->Nttyb.c_cc[16] = v4;
    v5 = *(_OWORD *)&v6.c_cflag;
    *(_OWORD *)&v0->Nttyb.c_iflag = *(_OWORD *)&v6.c_iflag;
    *(_OWORD *)&v0->Nttyb.c_cflag = v5;
  }
  return result;
}

void qiflush(void)
{
  TERMINAL *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  termios v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = cur_term;
  if (cur_term)
  {
    v1 = *(_OWORD *)&cur_term->Nttyb.c_cflag;
    v2 = *(_OWORD *)&cur_term->Nttyb.c_cc[16];
    *(_OWORD *)v5.c_cc = *(_OWORD *)cur_term->Nttyb.c_cc;
    *(_OWORD *)&v5.c_cc[16] = v2;
    v5.c_ospeed = cur_term->Nttyb.c_ospeed;
    *(_OWORD *)&v5.c_iflag = *(_OWORD *)&cur_term->Nttyb.c_iflag;
    v5.c_cflag = v1;
    v5.c_lflag = DWORD2(v1) & 0x7FFFFFFF;
    if (!_nc_set_tty_mode(&v5))
    {
      v3 = *(_OWORD *)&v5.c_cc[16];
      *(_OWORD *)v0->Nttyb.c_cc = *(_OWORD *)v5.c_cc;
      *(_OWORD *)&v0->Nttyb.c_cc[16] = v3;
      v0->Nttyb.c_ospeed = v5.c_ospeed;
      v4 = *(_OWORD *)&v5.c_cflag;
      *(_OWORD *)&v0->Nttyb.c_iflag = *(_OWORD *)&v5.c_iflag;
      *(_OWORD *)&v0->Nttyb.c_cflag = v4;
    }
  }
}

int noraw(void)
{
  TERMINAL *v0;
  __int128 v1;
  tcflag_t v2;
  __int128 v3;
  int result;
  __int128 v5;
  __int128 v6;
  termios v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = cur_term;
  if (!cur_term)
    return -1;
  v1 = *(_OWORD *)&cur_term->Nttyb.c_cflag;
  *(_OWORD *)&v7.c_iflag = *(_OWORD *)&cur_term->Nttyb.c_iflag;
  *(_OWORD *)&v7.c_cflag = v1;
  v7.c_ospeed = cur_term->Nttyb.c_ospeed;
  v2 = cur_term->Ottyb.c_lflag & 0x400 | *((_QWORD *)&v1 + 1);
  v3 = *(_OWORD *)&cur_term->Nttyb.c_cc[16];
  *(_OWORD *)v7.c_cc = *(_OWORD *)cur_term->Nttyb.c_cc;
  *(_OWORD *)&v7.c_cc[16] = v3;
  v7.c_lflag = v2 | 0x180;
  v7.c_iflag |= 0x20AuLL;
  result = _nc_set_tty_mode(&v7);
  if (!result)
  {
    *(_QWORD *)(SP + 780) = 0;
    v0->Nttyb.c_ospeed = v7.c_ospeed;
    v5 = *(_OWORD *)&v7.c_cc[16];
    *(_OWORD *)v0->Nttyb.c_cc = *(_OWORD *)v7.c_cc;
    *(_OWORD *)&v0->Nttyb.c_cc[16] = v5;
    v6 = *(_OWORD *)&v7.c_cflag;
    *(_OWORD *)&v0->Nttyb.c_iflag = *(_OWORD *)&v7.c_iflag;
    *(_OWORD *)&v0->Nttyb.c_cflag = v6;
  }
  return result;
}

int nocbreak(void)
{
  TERMINAL *v0;
  __int128 v1;
  __int128 v2;
  int result;
  __int128 v4;
  __int128 v5;
  termios v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = cur_term;
  if (!cur_term)
    return -1;
  v1 = *(_OWORD *)&cur_term->Nttyb.c_cflag;
  *(_OWORD *)&v6.c_iflag = *(_OWORD *)&cur_term->Nttyb.c_iflag;
  *(_OWORD *)&v6.c_cflag = v1;
  v2 = *(_OWORD *)&cur_term->Nttyb.c_cc[16];
  *(_OWORD *)v6.c_cc = *(_OWORD *)cur_term->Nttyb.c_cc;
  *(_OWORD *)&v6.c_cc[16] = v2;
  v6.c_ospeed = cur_term->Nttyb.c_ospeed;
  v6.c_lflag = *((_QWORD *)&v1 + 1) | 0x100;
  v6.c_iflag |= 0x100uLL;
  result = _nc_set_tty_mode(&v6);
  if (!result)
  {
    *(_DWORD *)(SP + 784) = 0;
    v0->Nttyb.c_ospeed = v6.c_ospeed;
    v4 = *(_OWORD *)&v6.c_cc[16];
    *(_OWORD *)v0->Nttyb.c_cc = *(_OWORD *)v6.c_cc;
    *(_OWORD *)&v0->Nttyb.c_cc[16] = v4;
    v5 = *(_OWORD *)&v6.c_cflag;
    *(_OWORD *)&v0->Nttyb.c_iflag = *(_OWORD *)&v6.c_iflag;
    *(_OWORD *)&v0->Nttyb.c_cflag = v5;
  }
  return result;
}

void noqiflush(void)
{
  TERMINAL *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  termios v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = cur_term;
  if (cur_term)
  {
    v1 = *(_OWORD *)&cur_term->Nttyb.c_cflag;
    v2 = *(_OWORD *)&cur_term->Nttyb.c_cc[16];
    *(_OWORD *)v5.c_cc = *(_OWORD *)cur_term->Nttyb.c_cc;
    *(_OWORD *)&v5.c_cc[16] = v2;
    v5.c_ospeed = cur_term->Nttyb.c_ospeed;
    *(_OWORD *)&v5.c_iflag = *(_OWORD *)&cur_term->Nttyb.c_iflag;
    v5.c_cflag = v1;
    v5.c_lflag = *((_QWORD *)&v1 + 1) | 0x80000000;
    if (!_nc_set_tty_mode(&v5))
    {
      v3 = *(_OWORD *)&v5.c_cc[16];
      *(_OWORD *)v0->Nttyb.c_cc = *(_OWORD *)v5.c_cc;
      *(_OWORD *)&v0->Nttyb.c_cc[16] = v3;
      v0->Nttyb.c_ospeed = v5.c_ospeed;
      v4 = *(_OWORD *)&v5.c_cflag;
      *(_OWORD *)&v0->Nttyb.c_iflag = *(_OWORD *)&v5.c_iflag;
      *(_OWORD *)&v0->Nttyb.c_cflag = v4;
    }
  }
}

int intrflush(WINDOW *a1, BOOL a2)
{
  TERMINAL *v2;
  __int128 v3;
  __int128 v4;
  tcflag_t v5;
  int result;
  __int128 v7;
  __int128 v8;
  termios v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!SP)
    return -1;
  v2 = cur_term;
  if (!cur_term)
    return -1;
  v3 = *(_OWORD *)&cur_term->Nttyb.c_cflag;
  v4 = *(_OWORD *)&cur_term->Nttyb.c_cc[16];
  *(_OWORD *)v9.c_cc = *(_OWORD *)cur_term->Nttyb.c_cc;
  *(_OWORD *)&v9.c_cc[16] = v4;
  v9.c_ospeed = cur_term->Nttyb.c_ospeed;
  *(_OWORD *)&v9.c_iflag = *(_OWORD *)&cur_term->Nttyb.c_iflag;
  *(_OWORD *)&v9.c_cflag = v3;
  v5 = DWORD2(v3) & 0x7FFFFFFF;
  if (!a2)
    v5 = *((_QWORD *)&v3 + 1) | 0x80000000;
  v9.c_lflag = v5;
  result = _nc_set_tty_mode(&v9);
  if (!result)
  {
    v7 = *(_OWORD *)&v9.c_cc[16];
    *(_OWORD *)v2->Nttyb.c_cc = *(_OWORD *)v9.c_cc;
    *(_OWORD *)&v2->Nttyb.c_cc[16] = v7;
    v2->Nttyb.c_ospeed = v9.c_ospeed;
    v8 = *(_OWORD *)&v9.c_cflag;
    *(_OWORD *)&v2->Nttyb.c_iflag = *(_OWORD *)&v9.c_iflag;
    *(_OWORD *)&v2->Nttyb.c_cflag = v8;
  }
  return result;
}

int wredrawln(WINDOW *a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  int result;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  int v18;
  uint64_t v19;

  if (!a1)
    return -1;
  v6 = _nc_screen_of((uint64_t)a1);
  v7 = a2 & ~(a2 >> 31);
  result = wtouchln(a1, v7, a3, 1);
  if (result != -1)
  {
    result = wtouchln(*(WINDOW **)(v6 + 136), v7 + *((__int16 *)a1 + 4), a3, 1);
    if (result != -1)
    {
      v9 = v7 + a3;
      v10 = *(_QWORD *)(v6 + 136);
      v11 = *(__int16 *)(v10 + 4) - *((__int16 *)a1 + 4);
      LODWORD(v12) = v11 + 1;
      if ((int)v7 + a3 >= v11 + 1)
        v13 = v11 + 1;
      else
        v13 = v7 + a3;
      v14 = *((__int16 *)a1 + 2);
      if (v13 >= v14 + 1)
        v13 = v14 + 1;
      v15 = *(__int16 *)(v10 + 6) - (uint64_t)*((__int16 *)a1 + 5);
      if (*((__int16 *)a1 + 3) + 1 >= (unint64_t)(v15 + 1))
        v16 = v15 + 1;
      else
        v16 = *((__int16 *)a1 + 3) + 1;
      if ((int)v7 < v13)
      {
        v17 = 28 * v16;
        if (*((__int16 *)a1 + 2) + 1 < (int)v12)
          v12 = *((__int16 *)a1 + 2) + 1;
        else
          v12 = (int)v12;
        if (v12 >= v9)
          v18 = v9;
        else
          v18 = v12;
        do
        {
          v19 = v7 + *((__int16 *)a1 + 4);
          bzero((void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 136) + 40) + 16 * v19) + 28 * *((__int16 *)a1 + 5)), v17);
          _nc_make_oldhash(v19);
          ++v7;
        }
        while (v18 != (_DWORD)v7);
      }
      return 0;
    }
  }
  return result;
}

int wrefresh(WINDOW *a1)
{
  int result;

  if (!a1)
    return -1;
  if (*(WINDOW **)(SP + 136) == a1)
  {
    *((_BYTE *)a1 + 25) = 1;
    return doupdate();
  }
  else
  {
    if (wnoutrefresh(a1))
      return -1;
    if (*((_BYTE *)a1 + 25))
      *(_BYTE *)(*(_QWORD *)(SP + 144) + 25) = 1;
    result = doupdate();
    *((_BYTE *)a1 + 25) = 0;
  }
  return result;
}

int wnoutrefresh(WINDOW *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int *v43;
  int v44;
  BOOL v45;
  uint64_t v46;
  __int16 *v47;
  __int16 *v48;
  uint64_t v49;
  uint64_t v50;
  int i;
  _OWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int16 *v56;
  uint64_t v57;
  __int16 *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 *v63;
  uint64_t v64;
  _OWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  int result;
  _DWORD *v75;

  if (!a1)
    return -1;
  if ((*((_WORD *)a1 + 6) & 0x10) != 0)
    return -1;
  v2 = *((__int16 *)a1 + 5);
  v3 = SP;
  v4 = *(_QWORD *)(SP + 144);
  v5 = *(_OWORD *)((char *)a1 + 100);
  *(_OWORD *)(v4 + 88) = *(_OWORD *)((char *)a1 + 88);
  *(_OWORD *)(v4 + 100) = v5;
  *(_DWORD *)(*(_QWORD *)(v3 + 144) + 16) = *((_DWORD *)a1 + 4);
  wsyncdown(a1);
  *((_WORD *)a1 + 6) &= ~0x20u;
  v6 = SP;
  if (*((__int16 *)a1 + 2) < 0)
    goto LABEL_77;
  v75 = (_DWORD *)_nc_abiver(&_nc_abiver);
  v11 = 0;
  do
  {
    v6 = SP;
    v12 = *(_QWORD *)(SP + 144);
    if (v10 > *(__int16 *)(v12 + 4))
      goto LABEL_77;
    v13 = *((_QWORD *)a1 + 5) + 16 * v11;
    v14 = *(__int16 *)(v13 + 8);
    if (v14 != -1)
    {
      v15 = *(__int16 *)(v13 + 10);
      if (v8 >= v15)
        v16 = *(__int16 *)(v13 + 10);
      else
        v16 = v8;
      v17 = v14 + v2;
      v18 = *(_QWORD *)v13;
      v19 = *(unsigned __int8 *)(*(_QWORD *)v13 + 28 * *(__int16 *)(v13 + 8));
      v20 = v19 - 2;
      LODWORD(v21) = (v17 - v19 + 1) & ~((v17 - v19 + 1) >> 31);
      v22 = v21 - v2;
      if (v14 + v2 <= (int)v21)
        v22 = *(__int16 *)(v13 + 8);
      if (v17 < (int)v21)
        LODWORD(v21) = v14 + v2;
      if (v20 > 0x1D)
        LODWORD(v21) = v14 + v2;
      else
        v14 = v22;
      if (*(_BYTE *)(v18 + 28 * v16))
      {
        v23 = (__int16)v15;
        if ((__int16)v15 >= v9)
          v23 = v9;
        if (v23 >= v7)
          v24 = v7;
        else
          v24 = v23;
        v25 = v8 + (int)v24 - v16;
        v26 = (unsigned __int8 *)(v18 + 28 * v24 + 28);
        do
        {
          v16 = v24;
          if (v25 == v24)
            break;
          ++v24;
          v27 = *v26;
          v26 += 28;
        }
        while (v27 != 1);
      }
      v28 = *(_QWORD *)(v12 + 40);
      v29 = (uint64_t *)(v28 + 16 * v10);
      if (v16 >= *((__int16 *)a1 + 3))
        v30 = *((__int16 *)a1 + 3);
      else
        v30 = v16;
      v31 = v30 + v2;
      v32 = *v29;
      v33 = *(unsigned __int8 *)(*v29 + 28 * (int)v21);
      v34 = v33 - 2;
      v35 = (v21 - v33 + 1) & ~(((int)v21 - v33 + 1) >> 31);
      if (v34 >= 0x1E)
        v36 = v21;
      else
        v36 = v35;
      if (*(_BYTE *)(v32 + 28 * v31))
      {
        v37 = *((__int16 *)a1 + 3);
        v38 = *(__int16 *)(v12 + 6);
        if (v16 < v37)
          v37 = v16;
        if (v31 <= v38)
          v39 = v38;
        else
          v39 = v30 + v2;
        v40 = v39 + v37 - v30;
        v41 = v2 - 1 + v37;
        v42 = v39 - v31;
        v43 = (int *)(v32 + 28 * (v37 + v2) + 28);
        while (v42)
        {
          v44 = *v43;
          v43 += 7;
          ++v41;
          --v42;
          if ((v44 & 0xFEu) - 2 >= 0x1E)
            goto LABEL_44;
        }
        v41 = v40;
      }
      else
      {
        v41 = v30 + v2;
      }
LABEL_44:
      v45 = v41 > v31 || v36 < (int)v21;
      if (v45 && v36 <= v41)
      {
        v46 = v28 + 16 * v10;
        v47 = (__int16 *)(v46 + 8);
        v48 = (__int16 *)(v46 + 10);
        v49 = v36;
        v50 = 28 * v36;
        for (i = v41 - v36 + 1; i; --i)
        {
          v52 = (_OWORD *)(*v29 + v50);
          *(_OWORD *)((char *)v52 + 12) = *(__int128 *)((char *)&xmmword_1C05E11F8 + 12);
          *v52 = xmmword_1C05E11F8;
          v53 = *v47;
          if (v53 == -1)
          {
            *v48 = v49;
          }
          else if (v49 >= v53)
          {
            if (v49 > *v48)
              *v48 = v49;
            goto LABEL_57;
          }
          *v47 = v49;
LABEL_57:
          ++v49;
          v50 += 28;
        }
      }
      if (v14 <= v16)
      {
        v54 = 0;
        v21 = (int)v21;
        v55 = v28 + 16 * v10;
        v56 = (__int16 *)(v55 + 8);
        v57 = v16 + 1;
        v58 = (__int16 *)(v55 + 10);
        v59 = 28 * v14;
        v60 = v57 - v14;
        v61 = 28 * (int)v21;
        do
        {
          v62 = *(_QWORD *)v13;
          v63 = (__int128 *)(*(_QWORD *)v13 + v59 + v54);
          v64 = *v29;
          v65 = (_OWORD *)(*v29 + v61 + v54);
          if (*(_DWORD *)v63 != *(_DWORD *)v65
            || (v66 = v62 + v59 + v54, v67 = v64 + v61 + v54, *(_DWORD *)(v66 + 4) != *(_DWORD *)(v67 + 4))
            || *(_DWORD *)(v66 + 8) != *(_DWORD *)(v67 + 8)
            || (v68 = v62 + v59 + v54, v69 = v64 + v61 + v54, *(_DWORD *)(v68 + 12) != *(_DWORD *)(v69 + 12))
            || *(_DWORD *)(v68 + 16) != *(_DWORD *)(v69 + 16)
            || *(_DWORD *)(v62 + v59 + v54 + 20) != *(_DWORD *)(v64 + v61 + v54 + 20)
            || *v75 >= 0x60000u && *(_DWORD *)(v62 + v59 + v54 + 24) != *(_DWORD *)(v64 + v61 + v54 + 24))
          {
            v70 = *v63;
            *(_OWORD *)((char *)v65 + 12) = *(__int128 *)((char *)v63 + 12);
            *v65 = v70;
            v71 = *v56;
            if (v71 == -1)
            {
              *v58 = v21;
            }
            else if (v21 >= v71)
            {
              if (v21 > *v58)
                *v58 = v21;
              goto LABEL_74;
            }
            *v56 = v21;
          }
LABEL_74:
          ++v21;
          v54 += 28;
          --v60;
        }
        while (v60);
      }
    }
    *(_WORD *)(v13 + 10) = -1;
    *(_WORD *)(v13 + 8) = -1;
    ++v10;
    v45 = v11++ < *((__int16 *)a1 + 2);
  }
  while (v45);
  v6 = SP;
LABEL_77:
  if (*((_BYTE *)a1 + 25))
  {
    *((_BYTE *)a1 + 25) = 0;
    *(_BYTE *)(*(_QWORD *)(v6 + 144) + 25) = 1;
  }
  v72 = *((_BYTE *)a1 + 26);
  v73 = *(_QWORD *)(v6 + 144);
  if (!v72)
  {
    *(_WORD *)v73 = *((_WORD *)a1 + 4) + *(_WORD *)a1 + *((_WORD *)a1 + 42);
    *(_WORD *)(v73 + 2) = *((_WORD *)a1 + 5) + *((_WORD *)a1 + 1);
  }
  result = 0;
  *(_BYTE *)(v73 + 26) = v72;
  return result;
}

int restartterm(char *a1, int a2, int *a3)
{
  int v4;
  int v5;
  int v6;

  if (_nc_setupterm(a1, a2, a3, 0) || !SP)
    return -1;
  v4 = *(_DWORD *)(SP + 784);
  v5 = *(_DWORD *)(SP + 780);
  v6 = *(_DWORD *)(SP + 776);
  if (*(_DWORD *)(SP + 788))
  {
    echo();
    if (v4)
    {
LABEL_6:
      cbreak();
      goto LABEL_7;
    }
  }
  else
  {
    noecho();
    if (v4)
      goto LABEL_6;
  }
  nocbreak();
  if (v5)
  {
    raw();
    if (v6)
      goto LABEL_8;
LABEL_12:
    nonl();
    goto LABEL_13;
  }
LABEL_7:
  noraw();
  if (!v6)
    goto LABEL_12;
LABEL_8:
  nl();
LABEL_13:
  reset_prog_mode();
  _nc_update_screensize(SP);
  return 0;
}

int vwscanw(WINDOW *a1, char *a2, va_list a3)
{
  int result;
  char __str[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = wgetnstr(a1, __str, 1023);
  if (result != -1)
    return vsscanf(__str, a2, a3);
  return result;
}

int scanw(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  return vwscanw(stdscr, a1, va);
}

int wscanw(WINDOW *a1, char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  return vwscanw(a1, a2, va);
}

int mvscanw(int a1, int a2, char *a3, ...)
{
  va_list va;

  va_start(va, a3);
  if (wmove(stdscr, a1, a2))
    return -1;
  else
    return vwscanw(stdscr, a3, va);
}

int mvwscanw(WINDOW *a1, int a2, int a3, char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  if (wmove(a1, a2, a3))
    return -1;
  else
    return vwscanw(a1, a4, va);
}

WINDOW *__cdecl getwin(FILE *a1)
{
  WINDOW *v2;
  uint64_t v3;
  int v4;
  __int16 v5;
  int v6;
  int v7;
  WINDOW *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[3];

  if (!a1)
    return 0;
  memset(v20, 0, 40);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v2 = 0;
  if ((sub_1C05C78A4(&v15, 4, a1) & 0x80000000) != 0 || (_DWORD)v15 == -2004318072)
    return v2;
  if ((sub_1C05C78A4((_BYTE *)&v15 + 4, 116, a1) & 0x80000000) != 0)
    return 0;
  v2 = 0;
  LODWORD(v3) = SWORD2(v15);
  if (WORD2(v15))
  {
    if (SWORD2(v15) < 0x4000)
    {
      v4 = SWORD3(v15);
      if (WORD3(v15))
      {
        if (SWORD3(v15) < 0x4000)
        {
          v5 = WORD6(v15);
          v6 = SWORD2(v15) + 1;
          v7 = SWORD3(v15) + 1;
          v8 = (BYTE12(v15) & 0x10) != 0 ? newpad(v6, v7) : newwin(v6, v7, 0, 0);
          v2 = v8;
          if (v8)
          {
            v9 = DWORD2(v15);
            *(_DWORD *)v8 = v15;
            *((_DWORD *)v8 + 2) = v9;
            *((_WORD *)v8 + 42) = WORD2(v20[0]);
            *((_WORD *)v8 + 6) = v5 & 0xFFFE;
            *((_DWORD *)v8 + 4) = v16;
            *((_BYTE *)v8 + 32) = v17;
            v10 = v18;
            *((_DWORD *)v8 + 9) = DWORD1(v17);
            *((_WORD *)v8 + 2) = v3;
            *((_WORD *)v8 + 3) = v4;
            *(_OWORD *)((char *)v8 + 88) = *(_OWORD *)((char *)v20 + 8);
            *(_OWORD *)((char *)v8 + 100) = *(_OWORD *)((char *)&v20[1] + 4);
            *((_QWORD *)v8 + 3) = *((_QWORD *)&v16 + 1);
            *((_DWORD *)v8 + 12) = v10;
            if ((v5 & 0x10) != 0)
            {
              *((_QWORD *)v8 + 9) = *((_QWORD *)&v19 + 1);
              *((_DWORD *)v8 + 20) = v20[0];
            }
            if ((v3 & 0x80000000) == 0)
            {
              v11 = 0;
              v12 = 28 * v4 + 28;
              v13 = -1;
              while ((sub_1C05C78A4(*(_BYTE **)(*((_QWORD *)v2 + 5) + v11), v12, a1) & 0x80000000) == 0)
              {
                v3 = *((__int16 *)v2 + 2);
                ++v13;
                v11 += 16;
                if (v13 >= v3)
                  goto LABEL_19;
              }
              delwin(v2);
              return 0;
            }
LABEL_19:
            wtouchln(v2, 0, v3 + 1, 1);
          }
        }
      }
    }
  }
  return v2;
}

uint64_t sub_1C05C78A4(_BYTE *a1, uint64_t a2, FILE *a3)
{
  uint64_t result;

  clearerr(a3);
  if (!a2)
    return 0;
  while (1)
  {
    result = fgetc(a3);
    if ((_DWORD)result == -1)
      break;
    *a1++ = result;
    if (!--a2)
      return 0;
  }
  return result;
}

int putwin(WINDOW *a1, FILE *a2)
{
  uint64_t v4;
  int result;
  uint64_t v6;
  size_t v7;
  uint64_t v8;

  if (!a1)
    return -1;
  v4 = *((__int16 *)a1 + 3);
  clearerr(a2);
  if (fwrite(a1, 0x78uLL, 1uLL, a2) != 1 || ferror(a2))
    return -1;
  if ((*((__int16 *)a1 + 2) & 0x80000000) == 0)
  {
    v6 = 0;
    v7 = v4 + 1;
    v8 = -1;
    while (fwrite(*(const void **)(*((_QWORD *)a1 + 5) + v6), 0x1CuLL, v7, a2) == v7)
    {
      result = ferror(a2);
      if (result)
        break;
      ++v8;
      v6 += 16;
      if (v8 >= *((__int16 *)a1 + 2))
        return result;
    }
    return -1;
  }
  return 0;
}

int scr_restore(const char *a1)
{
  FILE *v2;
  FILE *v3;
  WINDOW *v4;

  if ((_nc_access(a1, 4) & 0x80000000) != 0)
    return -1;
  v2 = fopen(a1, "rb");
  if (!v2)
    return -1;
  v3 = v2;
  delwin(*(WINDOW **)(SP + 144));
  v4 = getwin(v3);
  *(_QWORD *)(SP + 144) = v4;
  newscr = v4;
  fclose(v3);
  if (*(_QWORD *)(SP + 144))
    return 0;
  else
    return -1;
}

int scr_dump(const char *a1)
{
  FILE *v2;
  FILE *v3;

  if ((_nc_access(a1, 2) & 0x80000000) != 0)
    return -1;
  v2 = fopen(a1, "wb");
  if (!v2)
    return -1;
  v3 = v2;
  putwin(newscr, v2);
  fclose(v3);
  return 0;
}

int scr_init(const char *a1)
{
  FILE *v2;
  FILE *v3;
  WINDOW *v4;

  if (!SP || *((_QWORD *)cur_term->type.Strings + 40) && cur_term->type.Booleans[24])
    return -1;
  if ((_nc_access(a1, 4) & 0x80000000) != 0)
    return -1;
  v2 = fopen(a1, "rb");
  if (!v2)
    return -1;
  v3 = v2;
  delwin(*(WINDOW **)(SP + 136));
  v4 = getwin(v3);
  *(_QWORD *)(SP + 136) = v4;
  curscr = v4;
  fclose(v3);
  if (*(_QWORD *)(SP + 136))
    return 0;
  else
    return -1;
}

int scr_set(const char *a1)
{
  WINDOW *v2;

  if (scr_init(a1))
    return -1;
  delwin(*(WINDOW **)(SP + 144));
  v2 = dupwin(curscr);
  *(_QWORD *)(SP + 144) = v2;
  newscr = v2;
  if (v2)
    return 0;
  else
    return -1;
}

uint64_t _nc_scroll_window(uint64_t result, int a2, int a3, int a4, __int128 *a5)
{
  int v5;
  uint64_t v7;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  int v29;
  int v30;

  if ((a3 & 0x80000000) == 0)
  {
    v5 = a4;
    if (a4 >= a3)
    {
      v7 = result;
      if (*(__int16 *)(result + 4) >= a4)
      {
        v30 = a4 - a3;
        v10 = 28 * *(__int16 *)(result + 6) + 28;
        if (a2 < 0)
        {
          v11 = (a3 - a2);
          if ((int)v11 <= a4)
          {
            v12 = a4 + 1;
            v13 = 16 * a4;
            do
            {
              memcpy(*(void **)(*(_QWORD *)(v7 + 40) + v13), *(const void **)(*(_QWORD *)(v7 + 40) + v13 + 16 * a2), v10);
              --v12;
              v13 -= 16;
            }
            while (v12 > v11);
          }
          v14 = a3;
          do
          {
            if ((int)v14 > *(__int16 *)(v7 + 4))
              break;
            if ((*(__int16 *)(v7 + 6) & 0x80000000) == 0)
            {
              v15 = 0;
              v16 = -1;
              do
              {
                v17 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 16 * v14) + v15);
                v18 = *a5;
                *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)a5 + 12);
                *v17 = v18;
                ++v16;
                v15 += 28;
              }
              while (v16 < *(__int16 *)(v7 + 6));
            }
            ++v14;
          }
          while ((int)v11 > (int)v14);
        }
        if (a2 >= 1)
        {
          if (v5 - a2 >= a3)
          {
            v19 = a3;
            v20 = 16 * (a3 + (unint64_t)a2);
            v21 = ~v5 + a3 + a2;
            do
            {
              if (v19 > *(__int16 *)(v7 + 4))
                break;
              memcpy(*(void **)(*(_QWORD *)(v7 + 40) + 16 * v19++), *(const void **)(*(_QWORD *)(v7 + 40) + v20), v10);
              v20 += 16;
            }
            while (!__CFADD__(v21++, 1));
          }
          if (v5 - a2 < 0)
            v23 = -1;
          else
            v23 = v5 - a2;
          if (v23 < v5)
          {
            v24 = *(_WORD *)(v7 + 6);
            do
            {
              if ((v24 & 0x8000) == 0)
              {
                v25 = 0;
                v26 = -1;
                do
                {
                  v27 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 16 * v5) + v25);
                  v28 = *a5;
                  *(_OWORD *)((char *)v27 + 12) = *(__int128 *)((char *)a5 + 12);
                  *v27 = v28;
                  ++v26;
                  v25 += 28;
                }
                while (v26 < *(__int16 *)(v7 + 6));
                v24 = *(_WORD *)(v7 + 6);
              }
              --v5;
            }
            while (v5 > v23);
          }
        }
        result = wtouchln((WINDOW *)v7, a3, v30 + 1, 1);
        if (*(_DWORD *)(v7 + 176))
        {
          v29 = *(_DWORD *)(v7 + 184) + a2;
          if (v29 < 0)
          {
            v29 = 0;
          }
          else if (v29 > *(__int16 *)(v7 + 4))
          {
            v29 = 0;
          }
          *(_DWORD *)(v7 + 184) = v29;
        }
      }
    }
  }
  return result;
}

int wscrl(WINDOW *a1, int a2)
{
  int v3;
  int v4;
  __int128 v6[2];

  if (!a1)
    return -1;
  if (!*((_BYTE *)a1 + 27))
    return -1;
  if (a2)
  {
    v3 = *((__int16 *)a1 + 24);
    v4 = *((__int16 *)a1 + 25);
    v6[0] = *(_OWORD *)((char *)a1 + 88);
    *(__int128 *)((char *)v6 + 12) = *(_OWORD *)((char *)a1 + 100);
    _nc_scroll_window((uint64_t)a1, a2, v3, v4, v6);
    _nc_synchook(a1);
  }
  return 0;
}

int scrollok(WINDOW *a1, BOOL a2)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_BYTE *)a1 + 27) = a2;
  return result;
}

int wsetscrreg(WINDOW *a1, int a2, int a3)
{
  int result;
  int v5;

  result = -1;
  if (a1)
  {
    if ((a2 & 0x80000000) == 0 && a3 > a2)
    {
      v5 = *((__int16 *)a1 + 2);
      if (v5 >= a3 && (a3 & 0x80000000) == 0 && v5 >= a2)
      {
        result = 0;
        *((_WORD *)a1 + 24) = a2;
        *((_WORD *)a1 + 25) = a3;
      }
    }
  }
  return result;
}

SCREEN *__cdecl set_term(SCREEN *a1)
{
  SCREEN *v1;
  WINDOW *v3;
  WINDOW *v4;
  WINDOW *v5;
  int v6;
  int v7;

  v1 = (SCREEN *)SP;
  SP = (uint64_t)a1;
  if (a1)
  {
    set_curterm(*((TERMINAL **)a1 + 6));
    v3 = (WINDOW *)*((_QWORD *)a1 + 17);
    v4 = (WINDOW *)*((_QWORD *)a1 + 18);
    v5 = (WINDOW *)*((_QWORD *)a1 + 19);
    v6 = *((_DWORD *)a1 + 242);
    v7 = *((_DWORD *)a1 + 246);
  }
  else
  {
    set_curterm(0);
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  curscr = v3;
  newscr = v4;
  stdscr = v5;
  COLORS = v6;
  COLOR_PAIRS = v7;
  return v1;
}

void delscreen(SCREEN *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v1 = &_nc_screen_chain;
  v2 = _nc_screen_chain;
  if (_nc_screen_chain)
  {
    if ((SCREEN *)_nc_screen_chain == a1)
    {
      v4 = 0;
LABEL_7:
      if (v4)
        v1 = (uint64_t *)(v4 + 1392);
      *v1 = *((_QWORD *)a1 + 174);
      _nc_freewin(*((_QWORD *)a1 + 17));
      _nc_freewin(*((_QWORD *)a1 + 18));
      _nc_freewin(*((_QWORD *)a1 + 19));
      v5 = *((_QWORD *)a1 + 100);
      if (v5)
      {
        v6 = *(void **)(v5 + 16);
        if (v6)
        {
          if (*(__int16 *)(v5 + 26) >= 1)
          {
            v7 = 0;
            v8 = 0;
            do
            {
              v9 = *(_QWORD *)(v5 + 16);
              if (*(_QWORD *)(v9 + v7))
              {
                free(*(void **)(v9 + v7));
                v5 = *((_QWORD *)a1 + 100);
                v9 = *(_QWORD *)(v5 + 16);
              }
              if (*(_QWORD *)(v9 + v7 + 8))
              {
                free(*(void **)(v9 + v7 + 8));
                v5 = *((_QWORD *)a1 + 100);
              }
              ++v8;
              v7 += 24;
            }
            while (v8 < *(__int16 *)(v5 + 26));
            v6 = *(void **)(v5 + 16);
          }
          free(v6);
          v5 = *((_QWORD *)a1 + 100);
        }
        free((void *)v5);
        *((_QWORD *)a1 + 100) = 0;
      }
      sub_1C05C81A8(*((_QWORD **)a1 + 20));
      *((_QWORD *)a1 + 20) = 0;
      sub_1C05C81A8(*((_QWORD **)a1 + 21));
      *((_QWORD *)a1 + 21) = 0;
      v10 = (void *)*((_QWORD *)a1 + 93);
      if (v10)
        free(v10);
      v11 = (void *)*((_QWORD *)a1 + 120);
      if (v11)
        free(v11);
      v12 = (void *)*((_QWORD *)a1 + 122);
      if (v12)
        free(v12);
      v13 = (void *)*((_QWORD *)a1 + 175);
      if (v13)
        free(v13);
      v14 = (void *)*((_QWORD *)a1 + 176);
      if (v14)
        free(v14);
      v15 = (void *)*((_QWORD *)a1 + 177);
      if (v15)
        free(v15);
      v16 = (void *)*((_QWORD *)a1 + 128);
      if (v16)
        free(v16);
      v17 = (void *)*((_QWORD *)a1 + 129);
      if (v17)
        free(v17);
      _nc_flush();
      del_curterm(*((TERMINAL **)a1 + 6));
      v18 = (void *)*((_QWORD *)a1 + 2);
      if (v18)
        free(v18);
      free(a1);
      if ((SCREEN *)SP == a1)
      {
        curscr = 0;
        newscr = 0;
        stdscr = 0;
        COLORS = 0;
        COLOR_PAIRS = 0;
        SP = 0;
        if (_nc_wacs)
          free((void *)_nc_wacs);
        _nc_wacs = 0;
      }
    }
    else
    {
      while (1)
      {
        v4 = v2;
        v2 = *(_QWORD *)(v2 + 1392);
        if (!v2)
          break;
        if ((SCREEN *)v2 == a1)
          goto LABEL_7;
      }
    }
  }
}

void sub_1C05C81A8(_QWORD *a1)
{
  if (a1)
  {
    sub_1C05C81A8(*a1);
    sub_1C05C81A8(a1[1]);
    free(a1);
  }
}

uint64_t _nc_setupscreen(int a1, int a2, FILE *a3, int a4, int a5)
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  TERMINAL *v12;
  __int16 v13;
  int v14;
  size_t v15;
  void *v16;
  char *v17;
  int v18;
  int v19;
  int v20;
  TERMINAL *v21;
  __int16 *Numbers;
  int v23;
  int v24;
  int v25;
  char *locale;
  const char *v27;
  _BOOL4 v28;
  WINDOW *v29;
  WINDOW *v30;
  WINDOW *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t (*v35)(uint64_t, int);
  int v36;
  int v37;
  int v38;
  WINDOW *v39;
  WINDOW *v40;
  WINDOW *v41;
  uint64_t result;
  __int16 v43;
  uint64_t v44;
  int v45;
  int v46;

  v45 = a2;
  v46 = a1;
  SP = (uint64_t)calloc(1uLL, 0x648uLL);
  if (!SP)
    return 0xFFFFFFFFLL;
  v8 = calloc(0x80uLL, 4uLL);
  *(_QWORD *)(SP + 1024) = v8;
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = calloc(0x80uLL, 1uLL);
  v10 = SP;
  *(_QWORD *)(SP + 1032) = v9;
  if (!v9)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(v10 + 1392) = _nc_screen_chain;
  _nc_screen_chain = v10;
  v11 = calloc(1uLL, 0x1CuLL);
  *(_QWORD *)(v10 + 744) = v11;
  if (!v11)
    return 0xFFFFFFFFLL;
  SP = v10;
  *(_QWORD *)(v10 + 48) = cur_term;
  _nc_get_screensize(v10, &v46, &v45);
  LINES = v46;
  COLS = v45;
  *(_BYTE *)(v10 + 40) = a4 != 0;
  if (a4)
  {
    v46 = 1;
    LINES = 1;
    v12 = cur_term;
    *((_QWORD *)cur_term->type.Strings + 5) = 0;
    *((_QWORD *)v12->type.Strings + 107) = 0;
    *((_QWORD *)v12->type.Strings + 11) = 0;
    *((_QWORD *)v12->type.Strings + 10) = 0;
    *((_QWORD *)v12->type.Strings + 114) = 0;
    *((_QWORD *)v12->type.Strings + 19) = 0;
    *((_QWORD *)v12->type.Strings + 127) = 0;
    *((_QWORD *)v12->type.Strings + 12) = *((_QWORD *)v12->type.Strings + 2);
  }
  _nc_set_buffer(a3, 1);
  v13 = v46;
  *(_WORD *)(v10 + 128) = v46;
  *(_WORD *)(v10 + 132) = v13;
  *(_WORD *)(v10 + 130) = v45;
  fflush(a3);
  if (a3)
    v14 = fileno(a3);
  else
    v14 = -1;
  *(_DWORD *)(v10 + 4) = v14;
  *(_QWORD *)(v10 + 8) = a3;
  v15 = (v45 + 6) * (v46 + 2);
  *(_QWORD *)(v10 + 24) = v15;
  v16 = malloc(v15);
  *(_QWORD *)(v10 + 16) = v16;
  if (!v16)
    *(_QWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 32) = 0;
  *(_DWORD *)(v10 + 768) = -1;
  *(_OWORD *)(v10 + 776) = xmmword_1C05E1220;
  *(_WORD *)(v10 + 728) = -1;
  *(_DWORD *)(v10 + 736) = 1;
  *(_QWORD *)(v10 + 760) = -1;
  *(_QWORD *)&PC[464] = 0;
  *(_QWORD *)(v10 + 1448) = _nc_outch;
  *(_QWORD *)(v10 + 1464) = 0;
  _nc_set_no_padding(v10);
  *(_WORD *)(v10 + 993) = 0;
  *(_QWORD *)(v10 + 996) = 7;
  v17 = getenv("NCURSES_ASSUMED_COLORS");
  if (v17)
  {
    v44 = 0;
    v43 = 0;
    v18 = sscanf(v17, "%d%c%d%c", (char *)&v44 + 4, (char *)&v43 + 1, &v44, &v43);
    if (v18 >= 1)
    {
      v19 = 511;
      if ((v44 & 0x8000000000000000) == 0)
      {
        if (SHIDWORD(v44) >= cur_term->type.Numbers[13])
          v19 = 511;
        else
          v19 = HIDWORD(v44);
      }
      *(_DWORD *)(v10 + 996) = v19;
      if (v18 >= 3)
      {
        v20 = 511;
        if ((v44 & 0x80000000) == 0)
        {
          if ((int)v44 >= cur_term->type.Numbers[13])
            v20 = 511;
          else
            v20 = v44;
        }
        *(_DWORD *)(v10 + 1000) = v20;
      }
    }
  }
  *(_DWORD *)(v10 + 1052) = 166;
  *(_QWORD *)(v10 + 1056) = sub_1C05C880C;
  *(_QWORD *)(v10 + 1064) = sub_1C05C8814;
  *(_QWORD *)(v10 + 1072) = sub_1C05C881C;
  *(_QWORD *)(v10 + 1080) = nullsub_1;
  *(_QWORD *)(v10 + 1088) = nullsub_2;
  *(_DWORD *)(v10 + 1096) = -1;
  *(_DWORD *)(v10 + 1008) = termattrs();
  if (has_colors())
    *(_DWORD *)(v10 + 1008) |= 0xFF00u;
  v21 = cur_term;
  Numbers = cur_term->type.Numbers;
  v23 = Numbers[4];
  if (v23 >= 1)
  {
    v24 = *(_DWORD *)(v10 + 1008);
    *(_DWORD *)(v10 + 1016) = v24 & 0x81BF0000;
    *(_DWORD *)(v10 + 1012) = v24 & 0x819F0000;
    *((_QWORD *)v21->type.Strings + 146) = 0;
    *((_QWORD *)v21->type.Strings + 155) = 0;
    *((_QWORD *)v21->type.Strings + 25) = 0;
    *((_QWORD *)v21->type.Strings + 38) = 0;
    Numbers = v21->type.Numbers;
    LOWORD(v23) = Numbers[4];
  }
  if ((v23 & 0x8000) == 0)
  {
    Numbers[4] = -1;
    *((_QWORD *)v21->type.Strings + 131) = 0;
    *((_QWORD *)v21->type.Strings + 26) = 0;
    *((_QWORD *)v21->type.Strings + 27) = 0;
    *((_QWORD *)v21->type.Strings + 30) = 0;
    *((_QWORD *)v21->type.Strings + 34) = 0;
    *((_QWORD *)v21->type.Strings + 35) = 0;
    *((_QWORD *)v21->type.Strings + 36) = 0;
  }
  _nc_init_acs();
  v25 = _nc_unicode_locale();
  *(_BYTE *)(v10 + 1601) = v25;
  if (_nc_wacs)
    goto LABEL_33;
  _nc_init_wacs();
  if (_nc_wacs)
  {
    v25 = *(unsigned __int8 *)(v10 + 1601);
LABEL_33:
    if (v25)
      LOBYTE(v25) = _nc_locale_breaks_acs(*(_QWORD *)(v10 + 48)) != 0;
    *(_BYTE *)(v10 + 1600) = v25;
    locale = _nc_get_locale();
    v28 = !locale || (v27 = locale, !strcmp(locale, "C")) || strcmp(v27, "POSIX") == 0;
    *(_DWORD *)(v10 + 1456) = v28;
    *(_WORD *)(v10 + 1043) = 256;
    *(_OWORD *)(v10 + 1400) = 0u;
    v29 = newwin(v46, v45, 0, 0);
    *(_QWORD *)(v10 + 144) = v29;
    if (v29)
    {
      v30 = newwin(v46, v45, 0, 0);
      *(_QWORD *)(v10 + 136) = v30;
      if (v30)
      {
        newscr = *(WINDOW **)(v10 + 144);
        v31 = newscr;
        curscr = v30;
        *(_QWORD *)(v10 + 1344) = resizeterm;
        *(_QWORD *)(v10 + 1352) = _nc_ungetch;
        *((_BYTE *)v31 + 25) = 1;
        *((_BYTE *)v30 + 25) = 0;
        def_shell_mode();
        def_prog_mode();
        v32 = (char *)off_1EF614848;
        if (off_1EF614848 && off_1EF614848 != &unk_1EF6147D0)
        {
          v33 = 0;
          while (1)
          {
            v34 = &_nc_prescreen[v33];
            v35 = *(uint64_t (**)(uint64_t, int))&_nc_prescreen[v33 + 24];
            if (v35 == _nc_slk_initialize)
            {
              if (a5 > 2 || cur_term->type.Numbers[8] <= 0)
              {
LABEL_46:
                v36 = *(_DWORD *)&_nc_prescreen[v33 + 16];
                if (v36 >= 0)
                  v37 = *(_DWORD *)&_nc_prescreen[v33 + 16];
                else
                  v37 = -v36;
                if (v36 < 0)
                  v38 = v36 + *(__int16 *)(v10 + 132);
                else
                  v38 = 0;
                v39 = newwin(v37, v45, v38, 0);
                if (!v39)
                  goto LABEL_64;
                *((_QWORD *)v34 + 1) = v39;
                (*((void (**)(void))v34 + 3))();
                if ((*(_DWORD *)&_nc_prescreen[v33 + 16] & 0x80000000) == 0)
                  *(_WORD *)(v10 + 134) += v37;
                *(_WORD *)(v10 + 132) -= v37;
                v32 = (char *)off_1EF614848;
              }
            }
            else if (v35)
            {
              goto LABEL_46;
            }
            if (&_nc_prescreen[v33 + 32] != v32)
            {
              v33 += 24;
              if (v33 < 120)
                continue;
            }
            off_1EF614848 = &unk_1EF6147D0;
            break;
          }
        }
        v40 = newwin(*(__int16 *)(v10 + 132), v45, 0, 0);
        *(_QWORD *)(v10 + 152) = v40;
        if (v40)
        {
          v41 = v40;
          result = 0;
          LINES = *(__int16 *)(v10 + 132);
          stdscr = v41;
          *(_BYTE *)(v10 + 41) = 0;
          return result;
        }
      }
    }
  }
LABEL_64:
  SP = 0;
  return 0xFFFFFFFFLL;
}

uint64_t sub_1C05C880C()
{
  return 0;
}

uint64_t sub_1C05C8814()
{
  return 0;
}

uint64_t sub_1C05C881C()
{
  return 1;
}

uint64_t _nc_ripoffline(int a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v2 = (char *)off_1EF614848;
  if (!off_1EF614848)
  {
    v2 = (char *)&unk_1EF6147D0;
    goto LABEL_7;
  }
  if (off_1EF614848 < (_UNKNOWN *)&off_1EF614848)
  {
LABEL_7:
    v3 = 0;
    *((_DWORD *)v2 + 2) = a1;
    *((_QWORD *)v2 + 2) = a2;
    off_1EF614848 = v2 + 24;
    return v3;
  }
  return 0xFFFFFFFFLL;
}

int ripoffline(int a1, int (__cdecl *a2)(WINDOW *, int))
{
  char *v3;
  int result;

  v3 = (char *)off_1EF614848;
  if (off_1EF614848)
  {
    if (off_1EF614848 >= (_UNKNOWN *)&off_1EF614848)
      return -1;
  }
  else
  {
    v3 = (char *)&unk_1EF6147D0;
  }
  result = 0;
  *((_DWORD *)v3 + 2) = (a1 >> 31) | 1;
  *((_QWORD *)v3 + 2) = a2;
  off_1EF614848 = v3 + 24;
  return result;
}

int set_tabsize(int a1)
{
  TABSIZE = a1;
  return 0;
}

uint64_t _nc_handle_sigwinch(uint64_t result)
{
  uint64_t i;

  if (*(_DWORD *)&PC[12])
  {
    *(_DWORD *)&PC[12] = 0;
    for (i = _nc_screen_chain; i; i = *(_QWORD *)(i + 1392))
      *(_BYTE *)(i + 1384) = 1;
  }
  if (result)
    return *(unsigned __int8 *)(result + 1384);
  return result;
}

void use_env(BOOL a1)
{
  _nc_prescreen = a1;
}

void use_tioctl(BOOL a1)
{
  byte_1EF614AB0 = a1;
}

uint64_t _nc_get_screensize(uint64_t result, int *a2, int *a3)
{
  TERMINAL *v3;
  __int16 *Numbers;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v3 = cur_term;
  Numbers = cur_term->type.Numbers;
  *a2 = Numbers[2];
  *a3 = *Numbers;
  if (_nc_prescreen | byte_1EF614AB0)
  {
    v7 = result;
    result = isatty(v3->Filedes);
    if ((_DWORD)result)
    {
      v13 = 0;
      *__error() = 0;
      while (1)
      {
        result = ioctl(cur_term->Filedes, 0x40087468uLL, &v13);
        if ((result & 0x80000000) == 0)
          break;
        result = (uint64_t)__error();
        if (*(_DWORD *)result != 4)
          goto LABEL_12;
      }
      if (v7 && *(_BYTE *)(v7 + 40))
        v8 = 1;
      else
        v8 = (unsigned __int16)v13;
      *a2 = v8;
      *a3 = WORD1(v13);
    }
LABEL_12:
    if (_nc_prescreen)
    {
      if (byte_1EF614AB0)
      {
        if ((!v7 || !*(_BYTE *)(v7 + 40)) && (int)_nc_getenv_num("LINES") >= 1)
          _nc_setenv_num("LINES", *a2);
        if ((int)_nc_getenv_num("COLUMNS") >= 1)
          _nc_setenv_num("COLUMNS", *a3);
      }
      v9 = _nc_getenv_num("LINES");
      if (v9 >= 1)
        *a2 = v9;
      result = _nc_getenv_num("COLUMNS");
      if ((int)result >= 1)
        *a3 = result;
    }
    v10 = *a2;
    if (*a2 <= 0)
    {
      v10 = v3->type.Numbers[2];
      *a2 = v10;
    }
    v11 = *a3;
    if (*a3 <= 0)
    {
      v11 = *v3->type.Numbers;
      *a3 = v11;
      v10 = *a2;
    }
    if (v10 <= 0)
    {
      LOWORD(v10) = 24;
      *a2 = 24;
      v11 = *a3;
    }
    if (v11 <= 0)
    {
      LOWORD(v11) = 80;
      *a3 = 80;
      v10 = *a2;
    }
    Numbers = v3->type.Numbers;
    Numbers[2] = v10;
    *Numbers = v11;
  }
  v12 = Numbers[1];
  if (v12 < 0)
    v12 = 8;
  TABSIZE = v12;
  return result;
}

uint64_t _nc_update_screensize(uint64_t a1)
{
  __int16 *Numbers;
  int v3;
  int v4;
  uint64_t result;
  uint64_t (*v6)(void);
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;

  v9 = 0;
  Numbers = cur_term->type.Numbers;
  v3 = Numbers[2];
  v4 = *Numbers;
  result = _nc_get_screensize(a1, (int *)&v9 + 1, (int *)&v9);
  if (a1)
  {
    v6 = *(uint64_t (**)(void))(a1 + 1344);
    if (v6)
    {
      result = HIDWORD(v9);
      if (HIDWORD(v9) == v3 && (_DWORD)v9 == v4)
      {
        if (*(_BYTE *)(a1 + 1384))
        {
          v8 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1352);
          if (v8)
            result = v8(SP, 410);
        }
      }
      else
      {
        result = v6();
      }
      *(_BYTE *)(a1 + 1384) = 0;
    }
  }
  return result;
}

uint64_t _nc_setup_tinfo(const char *a1, TERMTYPE *a2)
{
  uint64_t result;
  unsigned int num_Booleans;
  unint64_t v5;
  char *Booleans;
  unint64_t v7;
  uint64_t v8;
  char **Strings;
  uint64_t ext_Booleans;
  uint64_t ext_Numbers;
  uint64_t ext_Strings;
  unint64_t v13;
  uint64_t v14;
  char **ext_Names;
  char v16[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = _nc_read_entry(a1, v16, a2);
  if ((_DWORD)result == 1)
  {
    num_Booleans = a2->num_Booleans;
    if (a2->num_Booleans)
    {
      v5 = 0;
      do
      {
        Booleans = a2->Booleans;
        if (Booleans[v5] >= 2u)
        {
          Booleans[v5] = 0;
          num_Booleans = a2->num_Booleans;
        }
        ++v5;
      }
      while (v5 < num_Booleans);
    }
    if (a2->num_Strings)
    {
      v7 = 0;
      v8 = 8 * a2->num_Strings;
      do
      {
        Strings = a2->Strings;
        if (Strings[v7 / 8] == (char *)-1)
          Strings[v7 / 8] = 0;
        v7 += 8;
      }
      while (v8 != v7);
    }
    ext_Booleans = a2->ext_Booleans;
    ext_Numbers = a2->ext_Numbers;
    ext_Strings = a2->ext_Strings;
    if ((_DWORD)ext_Numbers + (_DWORD)ext_Booleans + (_DWORD)ext_Strings)
    {
      v13 = 0;
      v14 = 8 * (ext_Numbers + ext_Strings + ext_Booleans);
      do
      {
        ext_Names = a2->ext_Names;
        if (ext_Names[v13 / 8] == (char *)-1)
          ext_Names[v13 / 8] = 0;
        v13 += 8;
      }
      while (v14 != v13);
    }
  }
  return result;
}

const char *_nc_tinfo_cmdch(uint64_t a1, int a2)
{
  const char *result;
  const char *v5;
  unsigned int v6;
  unint64_t v7;
  unsigned __int8 v8;
  _BYTE *v9;
  int v10;
  unsigned __int8 *v11;
  int v12;

  result = getenv("CC");
  if (result)
  {
    v5 = result;
    result = (const char *)strlen(result);
    if (result == (const char *)1)
    {
      v6 = *(unsigned __int16 *)(a1 + 60);
      if (*(_WORD *)(a1 + 60))
      {
        v7 = 0;
        v8 = *v5;
        do
        {
          v9 = *(_BYTE **)(*(_QWORD *)(a1 + 32) + 8 * v7);
          if (v9)
          {
            v10 = *v9;
            if (*v9)
            {
              v11 = v9 + 1;
              do
              {
                if (v10 == a2)
                  *(v11 - 1) = v8;
                v12 = *v11++;
                v10 = v12;
              }
              while (v12);
            }
            v6 = *(unsigned __int16 *)(a1 + 60);
          }
          ++v7;
        }
        while (v7 < v6);
      }
    }
  }
  return result;
}

char *_nc_get_locale()
{
  return setlocale(2, 0);
}

BOOL _nc_unicode_locale()
{
  char *v0;

  v0 = nl_langinfo(0);
  return strcmp(v0, "UTF-8") == 0;
}

uint64_t _nc_locale_breaks_acs(uint64_t a1)
{
  uint64_t result;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;

  if (getenv("NCURSES_NO_UTF8_ACS"))
    return _nc_getenv_num("NCURSES_NO_UTF8_ACS");
  result = tigetnum("U8");
  if ((result & 0x80000000) != 0)
  {
    result = (uint64_t)getenv("TERM");
    if (result)
    {
      v3 = (char *)result;
      if (strstr((char *)result, "linux"))
        return 1;
      result = (uint64_t)strstr(v3, "screen");
      if (result)
      {
        result = (uint64_t)getenv("TERMCAP");
        if (result)
        {
          v4 = (char *)result;
          result = (uint64_t)strstr((char *)result, "screen");
          if (result)
          {
            result = (uint64_t)strstr(v4, "hhII00");
            if (result)
            {
              v5 = *(_QWORD *)(a1 + 32);
              v6 = *(char **)(v5 + 200);
              if (v6)
              {
                if (strchr(*(char **)(v5 + 200), 14) || strchr(v6, 15))
                  return 1;
              }
              v7 = *(char **)(v5 + 1048);
              if (!v7)
                return 0;
              if (strchr(*(char **)(v5 + 1048), 14))
                return 1;
              result = (uint64_t)strchr(v7, 15);
              if (result)
                return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

int setupterm(char *a1, int a2, int *a3)
{
  return _nc_setupterm(a1, a2, a3, 0);
}

uint64_t _nc_format_slks(int a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v34;
  uint64_t result;

  if (SP)
  {
    v1 = *(_QWORD *)(SP + 800);
    if (v1)
    {
      v2 = *(__int16 *)(v1 + 28);
      v3 = *(_DWORD *)(SP + 808);
      if (v3 >= 3)
      {
        v4 = a1 - 12 * v2;
        v5 = v4 - 9;
        v6 = v4 - 8;
        if (v5 >= 0)
          v6 = v5;
        v7 = v6 >> 1;
        if (v7 <= 1)
          v7 = 1;
        if (*(__int16 *)(v1 + 24) >= 1)
        {
          v8 = 0;
          v9 = 0;
          v10 = *(unsigned __int16 *)(v1 + 24);
          v11 = (_DWORD *)(*(_QWORD *)(v1 + 16) + 16);
          do
          {
            *v11 = v9;
            v11 += 6;
            v12 = v9 + v2;
            if ((v8 & 0x7FFFFFFB) == 3)
              v13 = v7;
            else
              v13 = 1;
            v9 = v12 + v13;
            ++v8;
          }
          while (v10 != v8);
        }
LABEL_40:
        result = 0;
        *(_BYTE *)v1 = 1;
        return result;
      }
      if (v3 == 1)
      {
        v23 = *(__int16 *)(v1 + 24);
        v24 = a1 - v23 * v2;
        v25 = v24 - 5;
        v26 = v24 - 4;
        if (v25 >= 0)
          v26 = v25;
        v27 = v26 >> 1;
        if (v27 <= 1)
          v27 = 1;
        if (v23 >= 1)
        {
          v28 = 0;
          v29 = 0;
          v30 = *(_QWORD *)(v1 + 16) + 16;
          v31 = 24 * v23;
          do
          {
            *(_DWORD *)(v30 + v28) = v29;
            v32 = v29 + v2;
            if (v28 == 96 || v28 == 48)
              v34 = v27;
            else
              v34 = 1;
            v29 = v32 + v34;
            v28 += 24;
          }
          while (v31 != v28);
        }
        goto LABEL_40;
      }
      if (v3 == 2)
      {
        v14 = *(__int16 *)(v1 + 24);
        if (a1 - v14 * v2 <= 7)
          v15 = 7;
        else
          v15 = a1 - v14 * v2;
        if (v14 >= 1)
        {
          v16 = 0;
          v17 = 0;
          v18 = v15 - 6;
          v19 = *(_QWORD *)(v1 + 16) + 16;
          v20 = 24 * v14;
          do
          {
            *(_DWORD *)(v19 + v16) = v17;
            v21 = v17 + v2;
            if (v16 == 72)
              v22 = v18;
            else
              v22 = 1;
            v17 = v21 + v22;
            v16 += 24;
          }
          while (v20 != v16);
        }
        goto LABEL_40;
      }
      sub_1C05C9078();
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_1C05C9078()
{
  void **v0;

  if (SP)
  {
    v0 = *(void ***)(SP + 800);
    if (v0)
    {
      if (v0[2])
      {
        free(v0[2]);
        v0 = *(void ***)(SP + 800);
      }
      free(v0);
      *(_QWORD *)(SP + 800) = 0;
    }
  }
}

uint64_t _nc_slk_initialize(uint64_t a1, int a2)
{
  uint64_t result;
  int v5;
  _DWORD *v6;
  uint64_t v7;
  int v8;
  __int16 *Numbers;
  int v10;
  __int16 v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  if (_nc_screen_of(a1))
  {
    if (*(_QWORD *)(SP + 800))
      return 0;
    v5 = cur_term->type.Numbers[8];
    v6 = calloc(1uLL, 0x40uLL);
    v7 = SP;
    *(_QWORD *)(SP + 800) = v6;
    if (v6)
    {
      v8 = *(_DWORD *)(v7 + 808);
      if (!v8)
      {
        v8 = *(_DWORD *)&PC[92];
        *(_DWORD *)(v7 + 808) = *(_DWORD *)&PC[92];
      }
      Numbers = cur_term->type.Numbers;
      if ((Numbers[15] & 1) != 0)
        v10 = 0x40000;
      else
        v10 = 0x10000;
      v6[8] = *((unsigned __int8 *)v6 + 32) | v10;
      if (v5 <= 0)
      {
        if (v8 >= 3)
          LOWORD(v5) = 12;
        else
          LOWORD(v5) = 8;
        *((_WORD *)v6 + 12) = v5;
        if (v8 >= 3)
          v11 = 5;
        else
          v11 = 8;
      }
      else
      {
        *((_WORD *)v6 + 12) = v5;
        v11 = Numbers[9] * Numbers[10];
      }
      *((_WORD *)v6 + 14) = v11;
      if (v8 >= 3)
        v12 = 12;
      else
        v12 = 8;
      if (v12 <= (unsigned __int16)v5)
        LOWORD(v12) = v5;
      *((_WORD *)v6 + 13) = v12;
      if (v11 >= 1)
      {
        v13 = calloc((unsigned __int16)v12, 0x18uLL);
        v14 = *(_QWORD *)(SP + 800);
        *(_QWORD *)(v14 + 16) = v13;
        if (v13)
        {
          if (*(__int16 *)(v14 + 26) < 1)
          {
LABEL_32:
            result = _nc_format_slks(a2);
            *(_QWORD *)(*(_QWORD *)(SP + 800) + 8) = a1;
            if (a1)
            {
              *(_DWORD *)&PC[92] = 0;
              return result;
            }
          }
          else
          {
            v15 = 0;
            v16 = 0;
            v17 = *(__int16 *)(v14 + 28);
            while (1)
            {
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(SP + 800) + 16) + v15) = _nc_doalloc(0, v17 + 1);
              v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(SP + 800) + 16) + v15);
              if (!v18)
                break;
              bzero(v18, v17 + 1);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(SP + 800) + 16) + v15 + 8) = _nc_doalloc(0, v17 + 1);
              v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(SP + 800) + 16) + v15 + 8);
              if (!v19)
                break;
              if (v17 + 1 >= 2)
              {
                memset(v19, 32, v17);
                v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(SP + 800) + 16) + v15 + 8);
              }
              *((_BYTE *)v19 + v17) = 0;
              v20 = *(_QWORD *)(SP + 800);
              *(_BYTE *)(*(_QWORD *)(v20 + 16) + v15 + 21) = v16++ < *(__int16 *)(v20 + 24);
              v15 += 24;
              if (v16 >= *(__int16 *)(v20 + 26))
                goto LABEL_32;
            }
          }
        }
      }
      sub_1C05C9078();
    }
  }
  return 0xFFFFFFFFLL;
}

int slk_restore(void)
{
  _WORD *v0;

  if (!SP)
    return -1;
  v0 = *(_WORD **)(SP + 800);
  if (!v0)
    return -1;
  *v0 = 1;
  return slk_refresh();
}

uint64_t slk_wset(int a1, __int32 *a2, int a3)
{
  size_t v6;
  size_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  __int32 *v12;
  mbstate_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0xFFFFFFFFLL;
  memset(&v13, 0, sizeof(v13));
  v12 = a2;
  v6 = wcsrtombs(0, (const __int32 **)&v12, 0, &v13);
  if (v6 == -1)
    return 0xFFFFFFFFLL;
  v7 = v6;
  v8 = (char *)_nc_doalloc(0, v6 + 1);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v12 = a2;
  if (wcsrtombs(v8, (const __int32 **)&v12, v7, &v13) == -1)
  {
    v10 = 0xFFFFFFFFLL;
  }
  else
  {
    v9[v7] = 0;
    v10 = slk_set(a1, v9, a3);
  }
  free(v9);
  return v10;
}

int slk_attr_set(const attr_t a1, __int16 a2, void *a3)
{
  int result;
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;

  if (!SP)
    return -1;
  result = -1;
  if ((a2 & 0x80000000) == 0 && !a3)
  {
    v5 = *(_QWORD *)(SP + 800);
    if (v5)
    {
      if (*(int *)(SP + 988) > a2)
      {
        *(_DWORD *)(v5 + 32) = *(unsigned __int8 *)(v5 + 32) | a1 & 0xFFFFFF00;
        if (a2)
        {
          if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
          {
            v11 = v7 & 0xFFFF00FF | (v6 << 8);
          }
          else
          {
            *(_DWORD *)(v8 + 56) = v6;
            v9 = v7 & 0xFFFF00FF;
            v10 = v6 << 8;
            if (v6 > 0xFF)
              v10 = 65280;
            v11 = v9 | v10;
          }
          result = 0;
          *(_DWORD *)(v8 + 32) = v11;
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

int slk_attroff(const chtype a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int result;

  if (!SP)
    return -1;
  v1 = *(_QWORD *)(SP + 800);
  if (!v1)
    return -1;
  *(_DWORD *)(v1 + 32) &= ~a1 | 0xFF;
  if ((a1 & 0xFF00) == 0)
    return 0;
  if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u)
    *(_DWORD *)(v2 + 56) = 0;
  result = 0;
  *(_DWORD *)(v2 + 32) = v3 & 0xFFFF00FF;
  return result;
}

int slk_attron(const chtype a1)
{
  uint64_t v1;
  unsigned __int8 v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  int result;

  if (!SP)
    return -1;
  v1 = *(_QWORD *)(SP + 800);
  if (!v1)
    return -1;
  *(_DWORD *)(v1 + 32) |= a1 & 0xFFFFFF00;
  if ((a1 & 0xFF00) == 0)
    return 0;
  if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
  {
    v6 = v4 & 0xFFFF00FF | v5;
  }
  else
  {
    *(_DWORD *)(v3 + 56) = v2;
    v6 = v4 & 0xFFFF00FF | (v2 << 8);
  }
  result = 0;
  *(_DWORD *)(v3 + 32) = v6;
  return result;
}

int slk_attrset(const chtype a1)
{
  uint64_t v1;
  int result;

  if (!SP)
    return -1;
  v1 = *(_QWORD *)(SP + 800);
  if (!v1)
    return -1;
  result = 0;
  *(_DWORD *)(v1 + 32) = *(unsigned __int8 *)(v1 + 32) | a1 & 0xFFFFFF00;
  return result;
}

attr_t slk_attr(void)
{
  int v0;
  uint64_t v1;
  unsigned __int8 v2;
  int v3;
  int v4;

  if (!SP || !*(_QWORD *)(SP + 800))
    return 0;
  if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
  {
    v3 = v2;
  }
  else
  {
    v3 = *(_DWORD *)(v1 + 56);
    v4 = v2;
    if (!v3)
      v3 = v4;
  }
  return v0 | (v3 << 8);
}

int slk_clear(void)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v0 = SP;
  if (!SP)
    return -1;
  v1 = *(_QWORD *)(SP + 800);
  if (!v1)
    return -1;
  *(_BYTE *)(v1 + 1) = 1;
  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_OWORD *)(v3 + 88);
  *(_OWORD *)(v2 + 100) = *(_OWORD *)(v3 + 100);
  *(_OWORD *)(v2 + 88) = v4;
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 800) + 8);
  *(_DWORD *)(v6 + 16) = *(_DWORD *)(v5 + 16);
  if (v6 == v5)
    return 0;
  werase((WINDOW *)v6);
  return wrefresh(*(WINDOW **)(*(_QWORD *)(SP + 800) + 8));
}

int slk_color(__int16 a1)
{
  int v1;
  int result;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;

  if (!SP)
    return -1;
  v1 = a1;
  result = -1;
  if ((v1 & 0x80000000) == 0 && *(_QWORD *)(SP + 800) && *(_DWORD *)(SP + 988) > v1)
  {
    if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
    {
      result = 0;
    }
    else
    {
      result = 0;
      *(_DWORD *)(v4 + 56) = v3;
      if (v3 <= 0xFF)
        v5 = v3 << 8;
      else
        v5 = 65280;
      v3 = v5 >> 8;
    }
    *(_BYTE *)(v4 + 33) = v3;
  }
  return result;
}

int slk_init(int a1)
{
  int v1;

  if (a1 > 3 || *(_DWORD *)&PC[92])
    return -1;
  *(_DWORD *)&PC[92] = a1 + 1;
  if (a1 <= 1)
    v1 = -1;
  else
    v1 = 1 - a1;
  return _nc_ripoffline(v1, (uint64_t)_nc_slk_initialize);
}

char *__cdecl slk_label(int a1)
{
  char *result;
  uint64_t v3;

  if (!SP)
    return 0;
  result = 0;
  if (a1 >= 1)
  {
    v3 = *(_QWORD *)(SP + 800);
    if (v3)
    {
      if (*(__int16 *)(v3 + 26) < a1)
        return 0;
      return *(char **)(*(_QWORD *)(v3 + 16) + 24 * (a1 - 1));
    }
  }
  return result;
}

int slk_noutrefresh(void)
{
  uint64_t v0;

  if (!SP)
    return -1;
  v0 = *(_QWORD *)(SP + 800);
  if (!v0)
    return -1;
  if (*(_BYTE *)(v0 + 1))
    return 0;
  sub_1C05C98E8(SP);
  return wnoutrefresh(*(WINDOW **)(*(_QWORD *)(SP + 800) + 8));
}

uint64_t sub_1C05C98E8(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  const char *v20;
  int v21;
  int v22;
  int v23;

  v1 = *(_QWORD *)(result + 800);
  if (!*(_BYTE *)(v1 + 1))
  {
    v21 = cur_term->type.Numbers[8];
    v2 = *(__int16 *)(v1 + 26);
    if (v2 >= 1)
    {
      v3 = result;
      v4 = 0;
      v23 = *(_DWORD *)(result + 808);
      v5 = v23 < 3 && v21 > 0;
      if (v23 >= 3)
        v6 = v23 - 3;
      else
        v6 = 0;
      v22 = v6;
      v7 = *(_QWORD *)(v1 + 16);
      do
      {
        if (*(_BYTE *)v1 || *(_BYTE *)(v7 + 24 * v4 + 20))
        {
          if (*(_BYTE *)(v7 + 24 * v4 + 21))
          {
            if (v5)
            {
              if (v4 < cur_term->type.Numbers[8])
              {
                v8 = tparm(cur_term->type.Strings[147], v4 + 1, *(_QWORD *)(v7 + 24 * v4 + 8));
                result = _nc_putp((int)"plab_norm", v8);
              }
            }
            else
            {
              if (v23 == 4)
              {
                v9 = *(_QWORD *)(v1 + 8);
                v10 = _nc_screen_of(v9);
                if (v9)
                {
                  v11 = v10;
                  if (v10)
                  {
                    if (*(_DWORD *)(v10 + 808) == 4)
                    {
                      if (wmove((WINDOW *)v9, 0, 0) != -1)
                        whline((WINDOW *)v9, 0, *(__int16 *)(v9 + 6) + 1);
                      wmove((WINDOW *)v9, 0, 0);
                      v12 = *(_QWORD *)(v11 + 800);
                      if (*(__int16 *)(v12 + 24) >= 1)
                      {
                        v13 = 0;
                        v14 = 16;
                        do
                        {
                          mvwprintw((WINDOW *)v9, 0, *(_DWORD *)(*(_QWORD *)(v12 + 16) + v14), "F%d", ++v13);
                          v12 = *(_QWORD *)(v11 + 800);
                          v14 += 24;
                        }
                        while (v13 < *(__int16 *)(v12 + 24));
                      }
                    }
                  }
                }
              }
              wmove(*(WINDOW **)(v1 + 8), v22, *(_DWORD *)(*(_QWORD *)(v1 + 16) + 24 * v4 + 16));
              v15 = *(_QWORD *)(v1 + 8);
              if (v15)
              {
                v16 = *(_DWORD *)(v1 + 32);
                *(_DWORD *)(v15 + 116) = BYTE1(v16);
                *(_DWORD *)(v15 + 16) = v16;
              }
              result = waddnstr((WINDOW *)v15, *(const char **)(*(_QWORD *)(v1 + 16) + 24 * v4 + 8), -1);
              v17 = *(_QWORD *)(v1 + 8);
              if (v17)
              {
                v18 = *(_DWORD *)(*(_QWORD *)(v3 + 152) + 16);
                *(_DWORD *)(v17 + 116) = BYTE1(v18);
                *(_DWORD *)(v17 + 16) = v18;
              }
            }
          }
          v7 = *(_QWORD *)(v1 + 16);
          *(_BYTE *)(v7 + 24 * v4 + 20) = 0;
          LOWORD(v2) = *(_WORD *)(v1 + 26);
        }
        ++v4;
      }
      while (v4 < (__int16)v2);
    }
    *(_BYTE *)v1 = 0;
    if (v21 >= 1)
    {
      v19 = 157;
      if (*(_BYTE *)(v1 + 1))
      {
        v20 = "label_off";
      }
      else
      {
        v19 = 156;
        v20 = "label_on";
      }
      return _nc_putp((int)v20, cur_term->type.Strings[v19]);
    }
  }
  return result;
}

int slk_refresh(void)
{
  uint64_t v0;

  if (!SP)
    return -1;
  v0 = *(_QWORD *)(SP + 800);
  if (!v0)
    return -1;
  if (*(_BYTE *)(v0 + 1))
    return 0;
  sub_1C05C98E8(SP);
  return wrefresh(*(WINDOW **)(*(_QWORD *)(SP + 800) + 8));
}

int slk_set(int a1, const char *a2, int a3)
{
  int result;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  const char *v15;
  size_t v16;
  size_t v17;
  size_t v18;
  uint64_t v20;
  void *v21;
  char *v22;
  int v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  __darwin_ct_rune_t v30;
  mbstate_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!SP)
    return -1;
  result = -1;
  if (a1 < 1)
    return result;
  v5 = *(_QWORD *)(SP + 800);
  if (!v5 || a3 > 2 || *(__int16 *)(v5 + 26) < a1)
    return result;
  v29 = (a1 - 1);
  v7 = 0;
  if (a2)
    v8 = a2;
  else
    v8 = (const char *)&unk_1C05E2CBB;
  v9 = *(_DWORD *)(SP + 808);
  v10 = MEMORY[0x1E0C80978];
  do
  {
    v11 = v8[v7];
    if (v8[v7] < 0)
      v12 = __maskrune(v11, 0x4000uLL);
    else
      v12 = *(_DWORD *)(v10 + 4 * v11 + 60) & 0x4000;
    ++v7;
  }
  while (v12);
  if (v9 >= 3)
    v13 = 5;
  else
    v13 = 8;
  if (v8[v7 - 1])
  {
    v14 = 0;
    v15 = &v8[v7 - 1];
    do
    {
      v30 = 0;
      memset(&v31, 0, sizeof(v31));
      v16 = strlen(v15);
      v17 = mbrtowc(0, v15, v16, &v31);
      if (v17 == -1)
        break;
      v18 = v17;
      mbrtowc(&v30, v15, v17, &v31);
      if (!(v30 > 0x7F
           ? __maskrune(v30, 0x40000uLL)
           : *(_DWORD *)(v10 + 4 * v30 + 60) & 0x40000))
        break;
      if (wcwidth(v30) + v14 > v13)
        break;
      v14 += wcwidth(v30);
      v15 += v18;
    }
    while (*v15);
  }
  else
  {
    v14 = 0;
    LODWORD(v15) = (_DWORD)v8 + v7 - 1;
  }
  v20 = *(_QWORD *)(v5 + 16);
  v21 = *(void **)(v20 + 24 * v29);
  if (v21)
  {
    free(v21);
    v20 = *(_QWORD *)(v5 + 16);
  }
  v22 = strdup(&v8[v7 - 1]);
  *(_QWORD *)(v20 + 24 * v29) = v22;
  if (!v22)
    return -1;
  v23 = (_DWORD)v15 - (_DWORD)v8 - v7 + 1;
  v22[v23] = 0;
  v24 = (char *)_nc_doalloc(*(void **)(v20 + 24 * v29 + 8), v13 + (int)v15 - (int)v8 - (int)v7 + 2);
  v25 = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v25 + 24 * v29 + 8) = v24;
  if (!v24)
    return -1;
  if (a3 == 2)
  {
    v28 = v13 - v14;
    v26 = v29;
  }
  else
  {
    v26 = v29;
    if (a3 != 1)
    {
LABEL_42:
      v28 = 0;
      goto LABEL_43;
    }
    v27 = v13 - v14;
    if (v13 < v14)
      ++v27;
    v28 = v27 >> 1;
  }
  if (v28 < 1)
    goto LABEL_42;
  memset(v24, 32, v28);
  v25 = *(_QWORD *)(v5 + 16);
  v24 = *(char **)(v25 + 24 * v26 + 8);
LABEL_43:
  memcpy(&v24[v28], *(const void **)(v25 + 24 * v26), v23);
  if (v28 < v13)
    memset((void *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 24 * v26 + 8) + v28 + (uint64_t)v23), 32, v13 - (v14 + v28));
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 24 * v26 + 8) + v13 + (int)v15 - v14 - (int)v8 - (int)v7 + 1) = 0;
  *(_BYTE *)(*(_QWORD *)(v5 + 16) + 24 * v26 + 20) = 1;
  return result;
}

int slk_touch(void)
{
  _BYTE *v0;
  int result;

  if (!SP)
    return -1;
  v0 = *(_BYTE **)(SP + 800);
  if (!v0)
    return -1;
  result = 0;
  *v0 = 1;
  return result;
}

int tgetflag(char *a1)
{
  TERMINAL *v1;
  const name_table_entry *type_entry;
  int nte_index;
  unint64_t num_Booleans;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  BOOL v12;
  BOOL v13;

  v1 = cur_term;
  if (cur_term && *a1 && a1[1])
  {
    type_entry = _nc_find_type_entry(a1, 0, 1);
    if (type_entry)
    {
      nte_index = type_entry->nte_index;
      if ((nte_index & 0x80000000) == 0)
        return v1->type.Booleans[nte_index];
    }
    else
    {
      num_Booleans = v1->type.num_Booleans;
      if (num_Booleans >= 0x2D)
      {
        v7 = 0;
        v8 = *a1;
        v9 = (uint64_t)&v1->type.ext_Names[v1->type.ext_Booleans - (int)num_Booleans + 44];
        v10 = num_Booleans - 44;
        while (1)
        {
          v11 = *(unsigned __int8 **)(v9 + 8 * v7);
          if (v8 == *v11)
          {
            v12 = !v11[1] || v8 == 0;
            v13 = !v12 && a1[1] == v11[1];
            if (v13 && !v11[2])
              break;
          }
          if (v10 == ++v7)
            return 0;
        }
        nte_index = v7 + 44;
        if ((nte_index & 0x80000000) == 0)
          return v1->type.Booleans[nte_index];
      }
    }
  }
  return 0;
}

int tgetnum(char *a1)
{
  TERMINAL *v1;
  const name_table_entry *type_entry;
  int nte_index;
  int v5;
  unint64_t num_Numbers;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  BOOL v13;
  BOOL v14;

  v1 = cur_term;
  if (!cur_term || !*a1 || !a1[1])
    return -1;
  type_entry = _nc_find_type_entry(a1, 1, 1);
  if (!type_entry)
  {
    num_Numbers = v1->type.num_Numbers;
    if (num_Numbers >= 0x28)
    {
      v8 = 0;
      v9 = *a1;
      v10 = (uint64_t)&v1->type.ext_Names[v1->type.ext_Numbers + v1->type.ext_Booleans - (int)num_Numbers + 39];
      v11 = num_Numbers - 39;
      while (1)
      {
        v12 = *(unsigned __int8 **)(v10 + 8 * v8);
        if (v9 == *v12)
        {
          v13 = !v12[1] || v9 == 0;
          v14 = !v13 && a1[1] == v12[1];
          if (v14 && !v12[2])
            break;
        }
        if (v11 == ++v8)
          return -1;
      }
      nte_index = v8 + 39;
      if ((nte_index & 0x80000000) == 0)
        goto LABEL_6;
    }
    return -1;
  }
  nte_index = type_entry->nte_index;
  if (nte_index < 0)
    return -1;
LABEL_6:
  v5 = v1->type.Numbers[nte_index];
  if (v5 < 0)
    return -1;
  else
    return v5;
}

char *__cdecl tgetstr(char *a1, char **a2)
{
  TERMINAL *v2;
  const name_table_entry *type_entry;
  int nte_index;
  char *v7;
  unint64_t num_Strings;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  BOOL v14;
  BOOL v15;

  v2 = cur_term;
  if (!cur_term || !*a1 || !a1[1])
    return 0;
  type_entry = _nc_find_type_entry(a1, 2, 1);
  if (!type_entry)
  {
    num_Strings = v2->type.num_Strings;
    if (num_Strings >= 0x19F)
    {
      v9 = 0;
      v10 = *a1;
      v11 = (uint64_t)&v2->type.ext_Names[v2->type.ext_Strings
                                       + v2->type.ext_Numbers
                                       + v2->type.ext_Booleans
                                       - (int)num_Strings
                                       + 414];
      v12 = num_Strings - 414;
      while (1)
      {
        v13 = *(unsigned __int8 **)(v11 + 8 * v9);
        if (v10 == *v13)
        {
          v14 = !v13[1] || v10 == 0;
          v15 = !v14 && a1[1] == v13[1];
          if (v15 && !v13[2])
            break;
        }
        if (v12 == ++v9)
          return 0;
      }
      nte_index = v9 + 414;
      if ((nte_index & 0x80000000) == 0)
        goto LABEL_6;
    }
    return 0;
  }
  nte_index = type_entry->nte_index;
  if (nte_index < 0)
    return 0;
LABEL_6:
  v7 = v2->type.Strings[nte_index];
  if ((unint64_t)(v7 + 1) >= 2)
  {
    if (v7 == cur_term->type.Strings[39] && *(_QWORD *)&PC[40 * *(int *)&PC[272] + 128])
      v7 = *(char **)&PC[40 * *(int *)&PC[272] + 128];
    if (a2 && *a2)
    {
      strcpy(*a2, v7);
      v7 = *a2;
      *a2 += strlen(*a2) + 1;
    }
  }
  return v7;
}

char *termname(void)
{
  if (cur_term)
    return cur_term->_termname;
  else
    return 0;
}

char *__cdecl tgoto(const char *a1, int a2, int a3)
{
  uint64_t v3;
  const char *v5;
  int v6;
  const char *v7;
  int v8;
  _BOOL4 v9;
  int v10;
  size_t v11;
  char *result;
  uint64_t v13;
  unint64_t *v14;
  int v15;
  const char *v16;
  int v17;
  int v18;
  const char *v19;
  int v20;
  int32x2_t v21;
  char *v22;
  const char *v23;
  unsigned int v24;
  int v25;
  int v26;
  char v27;
  unint64_t v28;
  int v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v5 = a1;
  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = *(unsigned __int8 *)a1;
    if (*a1)
    {
      v7 = a1;
      v8 = *(unsigned __int8 *)a1;
      do
      {
        if (v8 == 36)
        {
          v9 = *((unsigned __int8 *)v7 + 1) != 60;
        }
        else if (v8 == 37 && v7[1])
        {
          if (v7[1] == 112)
            goto LABEL_16;
          v9 = 1;
          ++v7;
        }
        else
        {
          v9 = 1;
        }
        v10 = *(unsigned __int8 *)++v7;
        v8 = v10;
      }
      while (v10 && v9);
      if (v9)
      {
        if (BC)
          v11 = strlen(BC) + 10;
        else
          v11 = 10;
        v27 = 0;
        v28 = __PAIR64__(a2, v3);
        v13 = 0;
        v29 = 0;
        v14 = &v28;
        while (1)
        {
          if (v13 + v11 > qword_1EF614C00)
          {
            qword_1EF614C00 += v13 + v11;
            result = (char *)_nc_doalloc((void *)qword_1EF614BF8, qword_1EF614C00);
            qword_1EF614BF8 = (uint64_t)result;
            if (!result)
            {
              qword_1EF614C00 = 0;
              return result;
            }
            v6 = *(unsigned __int8 *)v5;
          }
          if (v6 == 37)
            break;
          *(_BYTE *)(qword_1EF614BF8 + v13++) = v6;
          v16 = v5;
LABEL_65:
          v6 = *((unsigned __int8 *)v16 + 1);
          v5 = v16 + 1;
          if (!v16[1])
          {
            result = (char *)qword_1EF614BF8;
            if (qword_1EF614BF8)
            {
              if ((v27 & 1) != 0)
              {
                strcpy((char *)(qword_1EF614BF8 + v13), BC);
                v13 += strlen(BC);
                result = (char *)qword_1EF614BF8;
              }
              result[v13] = 0;
            }
            return result;
          }
        }
        v16 = v5 + 1;
        v15 = v5[1];
        if (v15 <= 65)
        {
          if (v15 > 42)
          {
            v17 = v15 - 43;
            v18 = 100;
            v19 = "%02d";
            switch(v17)
            {
              case 0:
                v20 = *(_DWORD *)v14 + *((unsigned __int8 *)v5 + 2);
                *(_DWORD *)v14 = v20;
                v16 = v5 + 2;
                if (v20)
                  goto LABEL_48;
                goto LABEL_44;
              case 3:
                v20 = *(_DWORD *)v14;
                if (!*(_DWORD *)v14)
                {
LABEL_44:
                  if (BC)
                    v20 = 1;
                  else
                    v20 = 128;
                  v27 |= BC != 0;
                  *(_DWORD *)v14 = v20;
                }
LABEL_48:
                v14 = (unint64_t *)((char *)v14 + 4);
                goto LABEL_49;
              case 7:
                goto LABEL_51;
              case 8:
                v18 = 1000;
                v19 = "%03d";
LABEL_51:
                *(int *)v14 %= v18;
                goto LABEL_52;
              default:
                goto LABEL_63;
            }
          }
          if (v5[1])
          {
            if (v15 == 37)
            {
              LOBYTE(v20) = 37;
LABEL_49:
              *(_BYTE *)(qword_1EF614BF8 + v13++) = v20;
            }
          }
          else
          {
            v16 = v5;
          }
          goto LABEL_63;
        }
        if (v15 > 104)
        {
          switch(v15)
          {
            case 'i':
              v21 = vadd_s32((int32x2_t)v28, (int32x2_t)0x100000001);
              break;
            case 'n':
              v21 = (int32x2_t)veor_s8((int8x8_t)v28, (int8x8_t)0x6000000060);
              break;
            case 'r':
              v21 = vrev64_s32((int32x2_t)v28);
              break;
            default:
              goto LABEL_63;
          }
          v28 = (unint64_t)v21;
        }
        else
        {
          if (v15 == 66)
          {
            v25 = *(_DWORD *)v14 % 10 + 16 * (*(_DWORD *)v14 / 10);
          }
          else
          {
            if (v15 != 68)
            {
              v19 = "%d";
              if (v15 == 100)
              {
LABEL_52:
                v22 = (char *)(qword_1EF614BF8 + v13);
                v23 = fmtcheck(v19, "%d");
                v24 = *(_DWORD *)v14;
                v14 = (unint64_t *)((char *)v14 + 4);
                sprintf(v22, v23, v24);
                v13 += strlen((const char *)(qword_1EF614BF8 + v13));
              }
              goto LABEL_63;
            }
            if (*(int *)v14 <= 0)
              v26 = -(-*(_DWORD *)v14 & 0xF);
            else
              v26 = *(_DWORD *)v14 & 0xF;
            v25 = *(_DWORD *)v14 - 2 * v26;
          }
          *(_DWORD *)v14 = v25;
        }
LABEL_63:
        if ((char *)v14 - (char *)&v28 >= 9)
        {
          v29 = 0;
          v14 = (unint64_t *)&v29;
        }
        goto LABEL_65;
      }
    }
  }
LABEL_16:
  result = _nc_tiparm(2, a1, a3, *(_QWORD *)&a2);
  if (!result)
  {
    result = _nc_tiparm(1, v5, v3);
    if (!result)
      return _nc_tiparm(0, v5);
  }
  return result;
}

int tigetflag(char *a1)
{
  TERMINAL *v1;
  const name_table_entry *type_entry;
  int nte_index;
  unint64_t num_Booleans;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v1 = cur_term;
  if (cur_term)
  {
    type_entry = _nc_find_type_entry(a1, 0, 0);
    if (type_entry)
    {
      nte_index = type_entry->nte_index;
      if ((nte_index & 0x80000000) == 0)
        return v1->type.Booleans[nte_index];
    }
    else
    {
      num_Booleans = v1->type.num_Booleans;
      if (num_Booleans >= 0x2D)
      {
        v7 = 0;
        v8 = (uint64_t)&v1->type.ext_Names[v1->type.ext_Booleans - (int)num_Booleans + 44];
        v9 = num_Booleans - 44;
        while (strcmp(a1, *(const char **)(v8 + 8 * v7)))
        {
          if (v9 == ++v7)
            return -1;
        }
        nte_index = v7 + 44;
        if ((((_DWORD)v7 + 44) & 0x80000000) == 0)
          return v1->type.Booleans[nte_index];
      }
    }
  }
  return -1;
}

int tigetnum(char *a1)
{
  TERMINAL *v1;
  const name_table_entry *type_entry;
  int nte_index;
  int v5;
  unint64_t num_Numbers;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v1 = cur_term;
  if (!cur_term)
    return -2;
  type_entry = _nc_find_type_entry(a1, 1, 0);
  if (!type_entry)
  {
    num_Numbers = v1->type.num_Numbers;
    if (num_Numbers >= 0x28)
    {
      v8 = 0;
      v9 = (uint64_t)&v1->type.ext_Names[v1->type.ext_Numbers + v1->type.ext_Booleans - (int)num_Numbers + 39];
      v10 = num_Numbers - 39;
      while (strcmp(a1, *(const char **)(v9 + 8 * v8)))
      {
        if (v10 == ++v8)
          return -2;
      }
      nte_index = v8 + 39;
      if ((((_DWORD)v8 + 39) & 0x80000000) == 0)
        goto LABEL_4;
    }
    return -2;
  }
  nte_index = type_entry->nte_index;
  if (nte_index < 0)
    return -2;
LABEL_4:
  v5 = v1->type.Numbers[nte_index];
  if (v5 < 0)
    return -1;
  else
    return v5;
}

char *__cdecl tigetstr(char *a1)
{
  TERMINAL *v1;
  const name_table_entry *type_entry;
  int nte_index;
  unint64_t num_Strings;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v1 = cur_term;
  if (cur_term)
  {
    type_entry = _nc_find_type_entry(a1, 2, 0);
    if (type_entry)
    {
      nte_index = type_entry->nte_index;
      if ((nte_index & 0x80000000) == 0)
        return v1->type.Strings[nte_index];
    }
    else
    {
      num_Strings = v1->type.num_Strings;
      if (num_Strings >= 0x19F)
      {
        v7 = 0;
        v8 = (uint64_t)&v1->type.ext_Names[v1->type.ext_Strings
                                        + v1->type.ext_Numbers
                                        + v1->type.ext_Booleans
                                        - (int)num_Strings
                                        + 414];
        v9 = num_Strings - 414;
        while (strcmp(a1, *(const char **)(v8 + 8 * v7)))
        {
          if (v9 == ++v7)
            return (char *)-1;
        }
        nte_index = v7 + 414;
        if ((((_DWORD)v7 + 414) & 0x80000000) == 0)
          return v1->type.Strings[nte_index];
      }
    }
  }
  return (char *)-1;
}

BOOL is_linetouched(WINDOW *a1, int a2)
{
  BOOL result;

  if (!a1)
    return 1;
  result = 1;
  if ((a2 & 0x80000000) == 0 && *((__int16 *)a1 + 2) >= a2)
    return *(__int16 *)(*((_QWORD *)a1 + 5) + 16 * a2 + 8) != -1;
  return result;
}

BOOL is_wintouched(WINDOW *a1)
{
  uint64_t v1;
  unsigned __int16 *v2;
  int v3;

  if (a1)
  {
    if (*((__int16 *)a1 + 2) < 0)
    {
      LOBYTE(a1) = 0;
    }
    else
    {
      v1 = *((unsigned __int16 *)a1 + 2);
      v2 = (unsigned __int16 *)(*((_QWORD *)a1 + 5) + 8);
      do
      {
        v3 = *v2;
        v2 += 8;
        LOBYTE(a1) = v3 != 0xFFFF;
      }
      while (v3 == 0xFFFF && v1-- != 0);
    }
  }
  return (char)a1;
}

int wtouchln(WINDOW *a1, int a2, int a3, int a4)
{
  int v4;
  int v5;
  int v6;
  __int16 v7;
  __int16 *v8;
  __int16 v9;

  v4 = -1;
  if (a1)
  {
    if (((a3 | a2) & 0x80000000) == 0)
    {
      v5 = *((__int16 *)a1 + 2);
      if (v5 >= a2)
      {
        if (a3 < 1)
        {
          return 0;
        }
        else
        {
          v6 = a3 + a2;
          if (a4)
            v7 = 0;
          else
            v7 = -1;
          v8 = (__int16 *)(*((_QWORD *)a1 + 5) + 16 * a2 + 10);
          do
          {
            *(v8 - 1) = v7;
            if (a4)
              v9 = *((_WORD *)a1 + 3);
            else
              v9 = -1;
            v4 = 0;
            *v8 = v9;
            v8 += 8;
            if (v6 <= a2 + 1)
              break;
          }
          while (a2++ < v5);
        }
      }
    }
  }
  return v4;
}

int _nc_tparm_analyze(const char *a1, char **a2, int *a3)
{
  size_t v6;
  size_t v7;
  int v8;
  int64_t v9;
  const char *v10;
  int v11;
  _BYTE *v12;
  char *v13;
  char v14;
  int v15;
  int v16;
  int v17;
  char v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;

  if (!a1)
    return 0;
  v6 = strlen(a1);
  v7 = v6;
  if (v6 > qword_1EF6149C0)
  {
    qword_1EF6149C0 += v6 + 2;
    off_1EF6149B8 = _nc_doalloc(off_1EF6149B8, qword_1EF6149C0);
    if (!off_1EF6149B8)
      return 0;
  }
  a2[8] = 0;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *a3 = 0;
  if ((uint64_t)(v7 << 32) < 1)
  {
    v8 = 0;
    goto LABEL_66;
  }
  v8 = 0;
  v9 = (int)v7;
  v10 = a1;
  v11 = -1;
  do
  {
    if (*v10 != 37)
      goto LABEL_46;
    ++v10;
    v12 = off_1EF6149B8;
    if (!off_1EF6149B8)
      goto LABEL_29;
    *(_BYTE *)off_1EF6149B8 = 37;
    v13 = v12 + 1;
    v14 = *v10;
    if (!*v10)
      goto LABEL_28;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    while (1)
    {
      if (v14 <= 45)
      {
        if (v14 == 32 || v14 == 35)
          goto LABEL_24;
        if (v14 != 45)
          goto LABEL_22;
        if ((v18 & 1) == 0)
          goto LABEL_26;
        *v13++ = v14;
LABEL_18:
        v18 = 1;
        goto LABEL_25;
      }
      if ((v14 - 58) <= 0x3E)
      {
        if (v14 == 58)
          goto LABEL_18;
        if (((1 << (v14 - 58)) & 0x4220060040000000) != 0)
          break;
      }
      if (v14 != 46)
      {
LABEL_22:
        if (v14 - 48 > 9)
          goto LABEL_26;
        v15 = v14 + 10 * v15 - 48;
        v16 |= v15 > 10000;
LABEL_24:
        *v13++ = v14;
        goto LABEL_25;
      }
      v15 = 0;
      *v13++ = v14;
      v16 |= v17;
      v17 = 1;
LABEL_25:
      v19 = *(unsigned __int8 *)++v10;
      v14 = v19;
      if (!v19)
      {
LABEL_26:
        if ((v16 & 1) == 0)
          goto LABEL_28;
        goto LABEL_27;
      }
    }
    *v13++ = v14;
    if ((v16 & 1) != 0)
    {
LABEL_27:
      *v12 = 37;
      v13 = v12 + 2;
      v12[1] = *v10;
    }
LABEL_28:
    *v13 = 0;
LABEL_29:
    v20 = *v10;
    if (v20 <= 41)
    {
      if (v20 == 33)
      {
LABEL_44:
        ++v8;
      }
      else
      {
        if (v20 != 38)
        {
          if (v20 == 39)
          {
            v11 = -1;
            v10 += 2;
          }
          goto LABEL_46;
        }
LABEL_43:
        v8 += 2;
      }
LABEL_45:
      v11 = -1;
      goto LABEL_46;
    }
    v21 = (v20 - 42);
    if (v21 <= 0x34)
    {
      if (((1 << (v20 - 42)) & 0x100020009C002BLL) != 0)
        goto LABEL_43;
      if (v21 != 38)
      {
        if (v21 == 46)
        {
LABEL_37:
          if (v11 < 1)
            ++v8;
          goto LABEL_45;
        }
        goto LABEL_36;
      }
      ++v8;
LABEL_63:
      ++v10;
    }
    else
    {
LABEL_36:
      switch(*v10)
      {
        case 'c':
        case 'd':
        case 'o':
        case 'x':
          goto LABEL_37;
        case 'g':
          goto LABEL_63;
        case 'l':
        case 's':
          if (v11 >= 1)
            a2[v11 - 1] = (char *)&unk_1EF614C08;
          ++v8;
          break;
        case 'm':
        case '|':
          goto LABEL_43;
        case 'p':
          v23 = *(unsigned __int8 *)++v10;
          v24 = v23 - 48;
          if ((v23 - 48) <= 9)
          {
            if (v24 > *a3)
              *a3 = v24;
            v11 = v24;
          }
          break;
        case '{':
          do
            v22 = *(unsigned __int8 *)++v10;
          while ((v22 - 48) < 0xA);
          break;
        case '~':
          goto LABEL_44;
        default:
          break;
      }
    }
LABEL_46:
    if (*v10)
      ++v10;
  }
  while (v10 - a1 < v9);
LABEL_66:
  if (v8 >= 9)
    return 9;
  else
    return v8;
}

char *tparm(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  _nc_tparm_err = 0;
  return (char *)sub_1C05CAD88(1, -1, -1, a1, (char **)va);
}

uint64_t sub_1C05CAD88(int a1, int a2, int a3, char *__s, char **a5)
{
  size_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char **v16;
  char **v17;
  uint64_t v18;
  __int16 *v19;
  int v20;
  int v21;
  int v22;
  uint64_t *v23;
  char **v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char **Strings;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  char *v35;
  int v36;
  char *v37;
  char **v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  char *v44;
  int v45;
  char *v46;
  uint64_t result;
  int v49;
  BOOL v50;
  uint64_t v51;
  _DWORD *v52;
  char *v53;
  int v54;
  char *v55;
  _BYTE *v56;
  char *v57;
  char v58;
  int v59;
  int v60;
  int v61;
  int v62;
  char v63;
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  BOOL v69;
  char v70;
  int v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  int v93;
  int v94;
  int v95;
  char *v96;
  uint64_t v97;
  int v98;
  int v99;
  uint64_t v100;
  int v101;
  int v102;
  uint64_t v103;
  int v104;
  int v105;
  uint64_t v106;
  int v107;
  int v108;
  uint64_t v109;
  int v110;
  int v111;
  uint64_t v112;
  int v113;
  int v114;
  uint64_t v115;
  int v116;
  int v117;
  uint64_t v118;
  int v119;
  int v120;
  uint64_t v121;
  int v122;
  int v123;
  int v124;
  BOOL v125;
  uint64_t v126;
  unsigned int v127;
  uint64_t v128;
  int v129;
  unsigned int v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  int v134;
  int v135;
  int v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  int v144;
  int v145;
  int v146;
  int v147;
  uint64_t v148;
  int v149;
  int v150;
  unsigned int v151;
  int v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  unint64_t v157;
  char *v158;
  _DWORD *v159;
  __int16 *v160;
  char *v161;
  const char *v162;
  uint64_t *v163;
  int v164;
  char *v165;
  BOOL v166;
  uint64_t v167;
  int v168;
  int v169;
  char *v170;
  const char *v171;
  size_t v172;
  size_t v173;
  uint64_t v174;
  unint64_t v175;
  char *v176;
  char *v177;
  const char *v178;
  int v179;
  int v180;
  int v181;
  int v183;
  int v184;
  BOOL v185;
  char *v186;
  uint64_t v187;
  char *v188;
  int v189;
  uint64_t v190;
  uint64_t v191;
  _BYTE *v192;
  char v193;
  int v194;
  char **v195;
  uint64_t v196;
  uint64_t v197;
  char *v198[2];
  __int128 v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v195 = a5;
  v194 = 0;
  if (!__s)
    return 0;
  v202 = 0;
  v201 = 0u;
  v199 = 0u;
  v200 = 0u;
  *(_OWORD *)v198 = 0u;
  qword_1EF6149B0 = 0;
  v9 = strlen(__s);
  v10 = _nc_tparm_analyze(__s, v198, &v194);
  if (!off_1EF6149B8)
    return 0;
  if (v10 >= 9)
    v11 = 9;
  else
    v11 = v10;
  if (v194 >= 9)
    v12 = 9;
  else
    v12 = v194;
  v194 = v12;
  if ((int)v12 <= (int)v11)
    v13 = v11;
  else
    v13 = v12;
  if ((int)v13 < 1)
  {
    v15 = 0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    do
    {
      if (v198[v14])
      {
        v16 = v195++;
        v198[v14] = *v16;
        *(&v196 + v14) = 0;
        v15 |= 1 << v14;
      }
      else
      {
        v17 = v195++;
        if (a1)
          v18 = (uint64_t)*v17;
        else
          v18 = *(int *)v17;
        *(&v196 + v14) = v18;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  dword_1EF614998 = 0;
  v19 = (__int16 *)v12;
  if (!(_DWORD)v12)
  {
    v194 = v11;
    if (v10 >= 1)
    {
      v20 = 0;
      v21 = _nc_tparm_err;
      v22 = v11 + 1;
      v23 = &v196 + (v11 - 1);
      v24 = &v198[(v11 - 1)];
      do
      {
        v25 = *v24;
        if (*v24)
        {
          if (v20 > 19)
            goto LABEL_32;
          v26 = &_nc_prescreen[16 * v20];
          v26[152] = 0;
          *((_QWORD *)v26 + 18) = v25;
        }
        else
        {
          if (v20 > 19)
          {
LABEL_32:
            _nc_tparm_err = ++v21;
            goto LABEL_33;
          }
          v27 = *v23;
          v28 = &_nc_prescreen[16 * v20];
          v28[152] = 1;
          *((_DWORD *)v28 + 36) = v27;
        }
        v20 = ++dword_1EF614998;
LABEL_33:
        --v22;
        --v23;
        --v24;
      }
      while (v22 > 1);
    }
    v19 = (__int16 *)v11;
  }
  if (a3 != -1 && v15 != a3 && v15)
  {
    if (!cur_term)
      return 0;
    if ((Strings = cur_term->type.Strings, v30 = Strings[115], (unint64_t)(v30 + 1) >= 2) && !strcmp(v30, __s)
      || (v31 = Strings[116], (unint64_t)(v31 + 1) >= 2) && !strcmp(v31, __s)
      || (v32 = Strings[117], (unint64_t)(v32 + 1) >= 2) && !strcmp(v32, __s)
      || (v33 = Strings[147], (unint64_t)(v33 + 1) >= 2) && !strcmp(v33, __s))
    {
      v36 = 2;
    }
    else
    {
      v34 = Strings[361];
      if ((unint64_t)(v34 + 1) >= 2 && !strcmp(v34, __s))
      {
        v36 = 6;
      }
      else
      {
        v35 = tigetstr("Cs");
        v36 = (unint64_t)(v35 + 1) >= 2 && strcmp(v35, __s) == 0;
        v37 = tigetstr("Ms");
        if ((unint64_t)(v37 + 1) >= 2 && !strcmp(v37, __s))
          v36 = 3;
      }
    }
    if (v36 != v15)
      return 0;
  }
  if (a2 != -1 && (_DWORD)v19 != a2 && cur_term)
  {
    v38 = cur_term->type.Strings;
    v39 = v38[135];
    if ((unint64_t)(v39 + 1) >= 2 && !strcmp(v39, __s)
      || (v40 = v38[360], (unint64_t)(v40 + 1) >= 2) && !strcmp(v40, __s)
      || (v41 = v38[359], (unint64_t)(v41 + 1) >= 2) && !strcmp(v41, __s)
      || (v42 = v38[303], (unint64_t)(v42 + 1) >= 2) && !strcmp(v42, __s)
      || (v43 = v38[302], (unint64_t)(v43 + 1) >= 2) && !strcmp(v43, __s))
    {
      v45 = 0;
    }
    else
    {
      v44 = tigetstr("xm");
      v45 = a2;
      if ((unint64_t)(v44 + 1) >= 2)
      {
        if (!strcmp(v44, __s))
          v45 = 3;
        else
          v45 = a2;
      }
      v46 = tigetstr("S0");
      if ((unint64_t)(v46 + 1) >= 2 && !strcmp(v46, __s))
        v45 = 0;
    }
    result = 0;
    if ((int)v19 >= v45 && (int)v19 <= a2)
      v49 = v11;
    else
      v49 = a2;
    if (v49)
      v50 = (_DWORD)v13 == 0;
    else
      v50 = 0;
    if (v50 || (int)v13 > v49)
      return result;
    if (v49 != 9 && (_DWORD)v13 != v49)
      return 0;
  }
  if ((uint64_t)(v9 << 32) >= 1)
  {
    v193 = 0;
    v51 = (int)v9;
    v52 = &unk_1EF615000;
    v53 = __s;
    while (1)
    {
      v54 = *v53;
      if (v54 == 37)
        break;
      v66 = qword_1EF6149B0;
      v67 = qword_1EF6149B0 + 1;
      v68 = (_BYTE *)qword_1EF6149A0;
      if (qword_1EF6149B0 + 1 > (unint64_t)qword_1EF6149A8)
      {
        qword_1EF6149A8 = 2 * v67;
        v68 = _nc_doalloc((void *)qword_1EF6149A0, 2 * v67);
        qword_1EF6149A0 = (uint64_t)v68;
        if (!v68)
          goto LABEL_464;
        v66 = qword_1EF6149B0;
        v67 = qword_1EF6149B0 + 1;
      }
      v69 = v54 == 0;
      v70 = 0x80;
LABEL_126:
      if (!v69)
        v70 = v54;
      qword_1EF6149B0 = v67;
      v68[v66] = v70;
LABEL_440:
      v73 = *v53;
LABEL_441:
      if (!v73)
        goto LABEL_459;
LABEL_442:
      if (++v53 - __s >= v51)
        goto LABEL_459;
    }
    v55 = v53 + 1;
    qword_1EF614850[0] = (uint64_t)v53;
    v56 = off_1EF6149B8;
    if (!off_1EF6149B8)
    {
      v71 = 0;
      goto LABEL_138;
    }
    *(_BYTE *)off_1EF6149B8 = 37;
    v57 = v56 + 1;
    v58 = *v55;
    if (!*v55)
    {
      v59 = 0;
LABEL_134:
      v65 = 0;
      goto LABEL_135;
    }
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    while (v58 <= 45)
    {
      if (v58 == 32 || v58 == 35)
        goto LABEL_117;
      if (v58 != 45)
        goto LABEL_115;
      if ((v63 & 1) == 0)
        goto LABEL_119;
      *v57++ = v58;
LABEL_109:
      v63 = 1;
LABEL_118:
      v64 = *++v55;
      v58 = v64;
      if (!v64)
      {
LABEL_119:
        if ((v61 & 1) != 0)
          goto LABEL_120;
        goto LABEL_132;
      }
    }
    if ((v58 - 58) > 0x3E)
      goto LABEL_111;
    if (v58 == 58)
      goto LABEL_109;
    if (((1 << (v58 - 58)) & 0x4220060040000000) == 0)
    {
LABEL_111:
      if (v58 == 46)
      {
        *v57++ = v58;
        v61 |= v62;
        if ((v62 & 1) == 0)
          v60 = v59;
        v62 = 1;
        v59 = 0;
        goto LABEL_118;
      }
LABEL_115:
      if (v58 - 48 > 9)
        goto LABEL_119;
      v59 = v58 + 10 * v59 - 48;
      v61 |= v59 > 10000;
LABEL_117:
      *v57++ = v58;
      goto LABEL_118;
    }
    *v57++ = v58;
    if ((v61 & 1) != 0)
    {
LABEL_120:
      v60 = 0;
      v59 = 0;
      v65 = 0;
      *v56 = 37;
      v57 = v56 + 2;
      v56[1] = *v55;
      if ((v62 & 1) == 0)
        goto LABEL_135;
      goto LABEL_133;
    }
LABEL_132:
    if ((v62 & 1) == 0)
      goto LABEL_134;
LABEL_133:
    v65 = v59;
    v59 = v60;
LABEL_135:
    *v57 = 0;
    if (v59 <= v65)
      v71 = v65;
    else
      v71 = v59;
LABEL_138:
    v53 = v55;
    v72 = *v55;
    v73 = *v55;
    if (v72 > 79)
    {
      switch(v72)
      {
        case 'X':
        case 'd':
        case 'o':
        case 'x':
          v74 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            v75 = 0;
            ++v52[44];
          }
          else
          {
            --dword_1EF614998;
            if (_nc_prescreen[16 * v74 + 152])
              v75 = *(unsigned int *)&_nc_prescreen[16 * v74 + 144];
            else
              v75 = 0;
          }
          if (v71 <= 30)
            v153 = 30;
          else
            v153 = v71;
          v154 = (v153 + 1);
          v155 = qword_1EF6149B0;
          v156 = (const char *)off_1EF6149B8;
          v157 = qword_1EF6149B0 + v154;
          v158 = (char *)qword_1EF6149A0;
          v159 = v52;
          if (v157 > qword_1EF6149A8)
          {
            qword_1EF6149A8 = 2 * v157;
            v158 = (char *)_nc_doalloc((void *)qword_1EF6149A0, 2 * v157);
            qword_1EF6149A0 = (uint64_t)v158;
            if (v158)
            {
              v160 = v19;
              v155 = qword_1EF6149B0;
              goto LABEL_321;
            }
LABEL_464:
            _nc_err_abort("Out of memory");
          }
          v160 = v19;
LABEL_321:
          v161 = &v158[v155];
          v162 = fmtcheck(v156, "%d");
          sprintf(v161, v162, v75);
          qword_1EF6149B0 += strlen((const char *)(qword_1EF6149A0 + qword_1EF6149B0));
          v19 = v160;
          v52 = v159;
          goto LABEL_440;
        case 'Y':
        case 'Z':
        case '[':
        case '\\':
        case ']':
        case '_':
        case 'a':
        case 'b':
        case 'f':
        case 'h':
        case 'j':
        case 'k':
        case 'n':
        case 'q':
        case 'r':
        case 'u':
        case 'v':
        case 'w':
        case 'y':
        case 'z':
        case '}':
          goto LABEL_441;
        case '^':
          LODWORD(v77) = dword_1EF614998;
          v118 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            v119 = 0;
            ++v52[44];
          }
          else
          {
            --dword_1EF614998;
            v119 = _nc_prescreen[16 * v118 + 152];
            if (_nc_prescreen[16 * v118 + 152])
              v119 = *(_DWORD *)&_nc_prescreen[16 * v118 + 144];
            if ((_DWORD)v118)
            {
              v77 = (v77 - 2);
              dword_1EF614998 = v77;
              v120 = _nc_prescreen[16 * v77 + 152];
              if (_nc_prescreen[16 * v77 + 152])
                v120 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
              if (v77 <= 0x13)
                goto LABEL_418;
              goto LABEL_428;
            }
            LODWORD(v77) = 0;
          }
          v120 = 0;
          ++v52[44];
LABEL_418:
          v183 = v120 ^ v119;
          goto LABEL_438;
        case 'c':
          v121 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            v54 = 0;
            ++v52[44];
          }
          else
          {
            --dword_1EF614998;
            if (_nc_prescreen[16 * v121 + 152])
              v54 = *(_DWORD *)&_nc_prescreen[16 * v121 + 144];
            else
              v54 = 0;
          }
          v66 = qword_1EF6149B0;
          v67 = qword_1EF6149B0 + 1;
          v68 = (_BYTE *)qword_1EF6149A0;
          if (qword_1EF6149B0 + 1 <= (unint64_t)qword_1EF6149A8)
            goto LABEL_423;
          qword_1EF6149A8 = 2 * v67;
          v68 = _nc_doalloc((void *)qword_1EF6149A0, 2 * v67);
          qword_1EF6149A0 = (uint64_t)v68;
          if (!v68)
            goto LABEL_464;
          v66 = qword_1EF6149B0;
          v67 = qword_1EF6149B0 + 1;
LABEL_423:
          v69 = v54 == 0;
          v70 = 0x80;
          goto LABEL_126;
        case 'e':
          v122 = 0;
          ++v53;
          while (2)
          {
            v123 = *v53;
            if (v123 != 37)
            {
              if (!*v53)
                goto LABEL_459;
LABEL_262:
              if (v123)
                ++v53;
              continue;
            }
            break;
          }
          v124 = *++v53;
          v123 = v124;
          if (v124 != 59)
          {
            if (v123 == 63)
            {
              v123 = 63;
              ++v122;
            }
            goto LABEL_262;
          }
          v125 = __OFSUB__(v122--, 1);
          if (v122 < 0 == v125)
          {
            v123 = 63;
            goto LABEL_262;
          }
          goto LABEL_442;
        case 'g':
          v127 = *++v53;
          v126 = v127;
          if (v127 - 65 > 0x19)
          {
            if ((v126 - 97) > 0x19)
              goto LABEL_440;
            v128 = dword_1EF614998;
            if (dword_1EF614998 > 19)
              goto LABEL_428;
            v129 = *((_DWORD *)&qword_1EF614850[-1] + v126 - 1);
          }
          else
          {
            v128 = dword_1EF614998;
            if (dword_1EF614998 > 19)
              goto LABEL_428;
            v129 = *((_DWORD *)&qword_1EF614850[27] + v126 + 1);
          }
          v163 = &qword_1EF614850[2 * v128];
          *((_BYTE *)v163 + 16) = 1;
          *((_DWORD *)v163 + 2) = v129;
          goto LABEL_439;
        case 'i':
          if ((v193 & 1) != 0)
          {
            v193 = 1;
            goto LABEL_441;
          }
          if (v198[0])
          {
            if (!v198[1])
            {
              v164 = ++v197;
              if (!(_DWORD)v12)
                goto LABEL_455;
            }
          }
          else
          {
            v189 = ++v196;
            if (!(_DWORD)v12)
            {
              LODWORD(qword_1EF614858) = v189;
              if (v198[1])
                goto LABEL_456;
              v164 = ++v197;
LABEL_455:
              LODWORD(qword_1EF614868) = v164;
              goto LABEL_456;
            }
            if (!v198[1])
              ++v197;
          }
LABEL_456:
          v193 = 1;
          goto LABEL_440;
        case 'l':
          v130 = dword_1EF614998;
          v131 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            ++v52[44];
            v132 = (const char *)&unk_1EF614C09;
            LODWORD(v131) = v130;
LABEL_353:
            v169 = strlen(v132);
            v170 = &_nc_prescreen[16 * (int)v131];
            v170[152] = 1;
            *((_DWORD *)v170 + 36) = v169;
            goto LABEL_439;
          }
          --dword_1EF614998;
          v132 = (const char *)&unk_1EF614C09;
          if (!_nc_prescreen[16 * v131 + 152])
          {
            if (*(_QWORD *)&_nc_prescreen[16 * v131 + 144])
              v132 = *(const char **)&_nc_prescreen[16 * v131 + 144];
            else
              v132 = (const char *)&unk_1EF614C09;
          }
          if (v130 <= 0x14)
            goto LABEL_353;
          goto LABEL_428;
        case 'm':
          LODWORD(v77) = dword_1EF614998;
          v133 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            v134 = 0;
            ++v52[44];
          }
          else
          {
            --dword_1EF614998;
            v134 = _nc_prescreen[16 * v133 + 152];
            if (_nc_prescreen[16 * v133 + 152])
              v134 = *(_DWORD *)&_nc_prescreen[16 * v133 + 144];
            if ((_DWORD)v133)
            {
              v77 = (v77 - 2);
              dword_1EF614998 = v77;
              v135 = _nc_prescreen[16 * v77 + 152];
              if (_nc_prescreen[16 * v77 + 152])
                v135 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
LABEL_426:
              v184 = v135 % v134;
              goto LABEL_427;
            }
            LODWORD(v77) = 0;
          }
          v135 = 0;
          ++v52[44];
          goto LABEL_426;
        case 'p':
          v136 = *++v53;
          v73 = v136;
          if ((v136 - 49) > 8u)
            goto LABEL_441;
          v137 = (v73 - 49);
          v138 = v198[v137];
          if (v138)
          {
            if (dword_1EF614998 > 19)
              goto LABEL_428;
            v139 = &_nc_prescreen[16 * dword_1EF614998];
            v139[152] = 0;
            *((_QWORD *)v139 + 18) = v138;
          }
          else
          {
            if (dword_1EF614998 > 19)
              goto LABEL_428;
            v187 = *(&v196 + v137);
            v188 = &_nc_prescreen[16 * dword_1EF614998];
            v188[152] = 1;
            *((_DWORD *)v188 + 36) = v187;
          }
          goto LABEL_439;
        case 's':
          v140 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            ++v52[44];
            v141 = (const char *)&unk_1EF614C09;
          }
          else
          {
            --dword_1EF614998;
            v141 = (const char *)&unk_1EF614C09;
            if (!_nc_prescreen[16 * v140 + 152])
            {
              v142 = *(const char **)&_nc_prescreen[16 * v140 + 144];
              if (v142)
                v141 = v142;
              else
                v141 = (const char *)&unk_1EF614C09;
            }
          }
          v171 = (const char *)off_1EF6149B8;
          v172 = strlen(v141);
          if (v71 <= (int)v172)
            v173 = v172;
          else
            v173 = v71;
          v174 = qword_1EF6149B0;
          v175 = qword_1EF6149B0 + v173 + 1;
          v176 = (char *)qword_1EF6149A0;
          if (v175 <= qword_1EF6149A8)
            goto LABEL_362;
          qword_1EF6149A8 = 2 * v175;
          v176 = (char *)_nc_doalloc((void *)qword_1EF6149A0, 2 * v175);
          qword_1EF6149A0 = (uint64_t)v176;
          if (!v176)
            goto LABEL_464;
          v174 = qword_1EF6149B0;
LABEL_362:
          v177 = &v176[v174];
          v178 = fmtcheck(v171, "%s");
          sprintf(v177, v178, v141);
          qword_1EF6149B0 += strlen((const char *)(qword_1EF6149A0 + qword_1EF6149B0));
          v19 = &jpt_1C05CB434;
          goto LABEL_440;
        case 't':
          v143 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            ++v52[44];
LABEL_364:
            v179 = 0;
            ++v53;
            while (1)
            {
              v180 = *v53;
              if (v180 == 37)
              {
                v181 = *++v53;
                v180 = v181;
                if (v181 == 59)
                {
                  v125 = __OFSUB__(v179--, 1);
                  if (v179 < 0 != v125)
                    goto LABEL_442;
                  v180 = 63;
                }
                else if (v180 == 63)
                {
                  ++v179;
                }
                else if (v180 == 101 && v179 == 0)
                {
                  goto LABEL_442;
                }
              }
              else if (!*v53)
              {
                goto LABEL_459;
              }
              if (v180)
                ++v53;
            }
          }
          --dword_1EF614998;
          if (!_nc_prescreen[16 * v143 + 152] || !*(_DWORD *)&_nc_prescreen[16 * v143 + 144])
            goto LABEL_364;
          goto LABEL_440;
        case '{':
          v144 = *++v53;
          v145 = v144 - 48;
          if ((v144 - 48) > 9)
          {
            v146 = 0;
          }
          else
          {
            v146 = 0;
            do
            {
              v146 = v145 + 10 * v146;
              v147 = *++v53;
              v145 = v147 - 48;
            }
            while ((v147 - 48) < 0xA);
          }
          if (dword_1EF614998 > 19)
            goto LABEL_428;
          v165 = &_nc_prescreen[16 * dword_1EF614998];
          v165[152] = 1;
          *((_DWORD *)v165 + 36) = v146;
          goto LABEL_439;
        case '|':
          LODWORD(v77) = dword_1EF614998;
          v148 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            v149 = 0;
            ++v52[44];
          }
          else
          {
            --dword_1EF614998;
            v149 = _nc_prescreen[16 * v148 + 152];
            if (_nc_prescreen[16 * v148 + 152])
              v149 = *(_DWORD *)&_nc_prescreen[16 * v148 + 144];
            if ((_DWORD)v148)
            {
              v77 = (v77 - 2);
              dword_1EF614998 = v77;
              v150 = _nc_prescreen[16 * v77 + 152];
              if (_nc_prescreen[16 * v77 + 152])
                v150 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
              if (v77 <= 0x13)
                goto LABEL_431;
              goto LABEL_428;
            }
            LODWORD(v77) = 0;
          }
          v150 = 0;
          ++v52[44];
LABEL_431:
          v183 = v150 | v149;
          goto LABEL_438;
        case '~':
          v151 = dword_1EF614998;
          v77 = (dword_1EF614998 - 1);
          if (dword_1EF614998 < 1)
          {
            v152 = 0;
            ++v52[44];
            LODWORD(v77) = v151;
LABEL_382:
            v183 = ~v152;
            goto LABEL_438;
          }
          --dword_1EF614998;
          v152 = _nc_prescreen[16 * v77 + 152];
          if (_nc_prescreen[16 * v77 + 152])
            v152 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
          if (v151 <= 0x14)
            goto LABEL_382;
          goto LABEL_428;
        default:
          if (v72 != 80)
            goto LABEL_441;
          v86 = *++v53;
          v85 = v86;
          if (v86 - 65 > 0x19)
          {
            if ((v85 - 97) <= 0x19)
            {
              v167 = (dword_1EF614998 - 1);
              if (dword_1EF614998 < 1)
              {
                v168 = 0;
                ++v52[44];
              }
              else
              {
                --dword_1EF614998;
                if (_nc_prescreen[16 * v167 + 152])
                  v168 = *(_DWORD *)&_nc_prescreen[16 * v167 + 144];
                else
                  v168 = 0;
              }
              *(_DWORD *)&_nc_prescreen[4 * v85 + 124] = v168;
            }
          }
          else
          {
            v87 = (dword_1EF614998 - 1);
            if (dword_1EF614998 < 1)
            {
              v88 = 0;
              ++v52[44];
            }
            else
            {
              --dword_1EF614998;
              if (_nc_prescreen[16 * v87 + 152])
                v88 = *(_DWORD *)&_nc_prescreen[16 * v87 + 144];
              else
                v88 = 0;
            }
            *(_DWORD *)&_nc_prescreen[4 * v85 + 356] = v88;
          }
          goto LABEL_440;
      }
    }
    switch(v72)
    {
      case '!':
        v76 = dword_1EF614998;
        v77 = (dword_1EF614998 - 1);
        if (dword_1EF614998 < 1)
        {
          v78 = 0;
          ++v52[44];
          LODWORD(v77) = v76;
        }
        else
        {
          --dword_1EF614998;
          v78 = _nc_prescreen[16 * v77 + 152];
          if (_nc_prescreen[16 * v77 + 152])
            v78 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
          if (v76 > 0x14)
            goto LABEL_428;
        }
        v166 = v78 == 0;
LABEL_405:
        v183 = v166;
        goto LABEL_438;
      case '"':
      case '#':
      case '$':
      case '(':
      case ')':
      case ',':
      case '.':
        goto LABEL_441;
      case '%':
        v89 = qword_1EF6149B0;
        v90 = qword_1EF6149B0 + 1;
        v91 = (_BYTE *)qword_1EF6149A0;
        if (qword_1EF6149B0 + 1 <= (unint64_t)qword_1EF6149A8)
          goto LABEL_176;
        qword_1EF6149A8 = 2 * v90;
        v91 = _nc_doalloc((void *)qword_1EF6149A0, 2 * v90);
        qword_1EF6149A0 = (uint64_t)v91;
        if (!v91)
          goto LABEL_464;
        v89 = qword_1EF6149B0;
        v90 = qword_1EF6149B0 + 1;
LABEL_176:
        qword_1EF6149B0 = v90;
        v91[v89] = 37;
        goto LABEL_440;
      case '&':
        LODWORD(v77) = dword_1EF614998;
        v92 = (dword_1EF614998 - 1);
        if (dword_1EF614998 < 1)
        {
          v93 = 0;
          ++v52[44];
        }
        else
        {
          --dword_1EF614998;
          v93 = _nc_prescreen[16 * v92 + 152];
          if (_nc_prescreen[16 * v92 + 152])
            v93 = *(_DWORD *)&_nc_prescreen[16 * v92 + 144];
          if ((_DWORD)v92)
          {
            v77 = (v77 - 2);
            dword_1EF614998 = v77;
            v94 = _nc_prescreen[16 * v77 + 152];
            if (_nc_prescreen[16 * v77 + 152])
              v94 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
            if (v77 <= 0x13)
              goto LABEL_386;
            goto LABEL_428;
          }
          LODWORD(v77) = 0;
        }
        v94 = 0;
        ++v52[44];
LABEL_386:
        v183 = v94 & v93;
        goto LABEL_438;
      case '\'':
        if (dword_1EF614998 > 19)
        {
          ++v52[44];
        }
        else
        {
          v95 = v53[1];
          v96 = &_nc_prescreen[16 * dword_1EF614998];
          v96[152] = 1;
          *((_DWORD *)v96 + 36) = v95;
          ++dword_1EF614998;
        }
        v53 += 2;
        goto LABEL_440;
      case '*':
        LODWORD(v77) = dword_1EF614998;
        v97 = (dword_1EF614998 - 1);
        if (dword_1EF614998 < 1)
        {
          v98 = 0;
          ++v52[44];
        }
        else
        {
          --dword_1EF614998;
          v98 = _nc_prescreen[16 * v97 + 152];
          if (_nc_prescreen[16 * v97 + 152])
            v98 = *(_DWORD *)&_nc_prescreen[16 * v97 + 144];
          if ((_DWORD)v97)
          {
            v77 = (v77 - 2);
            dword_1EF614998 = v77;
            v99 = _nc_prescreen[16 * v77 + 152];
            if (_nc_prescreen[16 * v77 + 152])
              v99 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
            if (v77 <= 0x13)
              goto LABEL_389;
            goto LABEL_428;
          }
          LODWORD(v77) = 0;
        }
        v99 = 0;
        ++v52[44];
LABEL_389:
        v183 = v99 * v98;
        goto LABEL_438;
      case '+':
        LODWORD(v77) = dword_1EF614998;
        v100 = (dword_1EF614998 - 1);
        if (dword_1EF614998 < 1)
        {
          v101 = 0;
          ++v52[44];
        }
        else
        {
          --dword_1EF614998;
          v101 = _nc_prescreen[16 * v100 + 152];
          if (_nc_prescreen[16 * v100 + 152])
            v101 = *(_DWORD *)&_nc_prescreen[16 * v100 + 144];
          if ((_DWORD)v100)
          {
            v77 = (v77 - 2);
            dword_1EF614998 = v77;
            v102 = _nc_prescreen[16 * v77 + 152];
            if (_nc_prescreen[16 * v77 + 152])
              v102 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
            if (v77 <= 0x13)
              goto LABEL_392;
            goto LABEL_428;
          }
          LODWORD(v77) = 0;
        }
        v102 = 0;
        ++v52[44];
LABEL_392:
        v183 = v102 + v101;
        goto LABEL_438;
      case '-':
        LODWORD(v77) = dword_1EF614998;
        v103 = (dword_1EF614998 - 1);
        if (dword_1EF614998 < 1)
        {
          v104 = 0;
          ++v52[44];
        }
        else
        {
          --dword_1EF614998;
          v104 = _nc_prescreen[16 * v103 + 152];
          if (_nc_prescreen[16 * v103 + 152])
            v104 = *(_DWORD *)&_nc_prescreen[16 * v103 + 144];
          if ((_DWORD)v103)
          {
            v77 = (v77 - 2);
            dword_1EF614998 = v77;
            v105 = _nc_prescreen[16 * v77 + 152];
            if (_nc_prescreen[16 * v77 + 152])
              v105 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
            if (v77 <= 0x13)
              goto LABEL_395;
            goto LABEL_428;
          }
          LODWORD(v77) = 0;
        }
        v105 = 0;
        ++v52[44];
LABEL_395:
        v183 = v105 - v104;
        goto LABEL_438;
      case '/':
        LODWORD(v77) = dword_1EF614998;
        v106 = (dword_1EF614998 - 1);
        if (dword_1EF614998 < 1)
        {
          v107 = 0;
          ++v52[44];
        }
        else
        {
          --dword_1EF614998;
          v107 = _nc_prescreen[16 * v106 + 152];
          if (_nc_prescreen[16 * v106 + 152])
            v107 = *(_DWORD *)&_nc_prescreen[16 * v106 + 144];
          if ((_DWORD)v106)
          {
            v77 = (v77 - 2);
            dword_1EF614998 = v77;
            v108 = _nc_prescreen[16 * v77 + 152];
            if (_nc_prescreen[16 * v77 + 152])
              v108 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
LABEL_398:
            v184 = v108 / v107;
LABEL_427:
            v183 = v184;
            if ((int)v77 <= 19)
              goto LABEL_438;
LABEL_428:
            ++v52[44];
            goto LABEL_440;
          }
          LODWORD(v77) = 0;
        }
        v108 = 0;
        ++v52[44];
        goto LABEL_398;
      default:
        switch(v72)
        {
          case '<':
            LODWORD(v77) = dword_1EF614998;
            v79 = (dword_1EF614998 - 1);
            if (dword_1EF614998 < 1)
            {
              v80 = 0;
              ++v52[44];
            }
            else
            {
              --dword_1EF614998;
              v80 = _nc_prescreen[16 * v79 + 152];
              if (_nc_prescreen[16 * v79 + 152])
                v80 = *(_DWORD *)&_nc_prescreen[16 * v79 + 144];
              if ((_DWORD)v79)
              {
                v77 = (v77 - 2);
                dword_1EF614998 = v77;
                v81 = _nc_prescreen[16 * v77 + 152];
                if (_nc_prescreen[16 * v77 + 152])
                  v81 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
                if (v77 <= 0x13)
                  goto LABEL_401;
                goto LABEL_428;
              }
              LODWORD(v77) = 0;
            }
            v81 = 0;
            ++v52[44];
LABEL_401:
            v183 = v81 < v80;
            goto LABEL_438;
          case '=':
            LODWORD(v77) = dword_1EF614998;
            v109 = (dword_1EF614998 - 1);
            if (dword_1EF614998 < 1)
            {
              v110 = 0;
              ++v52[44];
            }
            else
            {
              --dword_1EF614998;
              v110 = _nc_prescreen[16 * v109 + 152];
              if (_nc_prescreen[16 * v109 + 152])
                v110 = *(_DWORD *)&_nc_prescreen[16 * v109 + 144];
              if ((_DWORD)v109)
              {
                v77 = (v77 - 2);
                dword_1EF614998 = v77;
                v111 = _nc_prescreen[16 * v77 + 152];
                if (_nc_prescreen[16 * v77 + 152])
                  v111 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
                if (v77 <= 0x13)
                  goto LABEL_404;
                goto LABEL_428;
              }
              LODWORD(v77) = 0;
            }
            v111 = 0;
            ++v52[44];
LABEL_404:
            v166 = v111 == v110;
            goto LABEL_405;
          case '>':
            LODWORD(v77) = dword_1EF614998;
            v112 = (dword_1EF614998 - 1);
            if (dword_1EF614998 < 1)
            {
              v113 = 0;
              ++v52[44];
            }
            else
            {
              --dword_1EF614998;
              v113 = _nc_prescreen[16 * v112 + 152];
              if (_nc_prescreen[16 * v112 + 152])
                v113 = *(_DWORD *)&_nc_prescreen[16 * v112 + 144];
              if ((_DWORD)v112)
              {
                v77 = (v77 - 2);
                dword_1EF614998 = v77;
                v114 = _nc_prescreen[16 * v77 + 152];
                if (_nc_prescreen[16 * v77 + 152])
                  v114 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
                if (v77 <= 0x13)
                  goto LABEL_410;
                goto LABEL_428;
              }
              LODWORD(v77) = 0;
            }
            v114 = 0;
            ++v52[44];
LABEL_410:
            v183 = v114 > v113;
            goto LABEL_438;
          case '?':
          case '@':
            goto LABEL_441;
          case 'A':
            LODWORD(v77) = dword_1EF614998;
            v115 = (dword_1EF614998 - 1);
            if (dword_1EF614998 < 1)
            {
              v116 = 0;
              ++v52[44];
            }
            else
            {
              --dword_1EF614998;
              v116 = _nc_prescreen[16 * v115 + 152];
              if (_nc_prescreen[16 * v115 + 152])
                v116 = *(_DWORD *)&_nc_prescreen[16 * v115 + 144];
              if ((_DWORD)v115)
              {
                v77 = (v77 - 2);
                dword_1EF614998 = v77;
                v117 = _nc_prescreen[16 * v77 + 152];
                if (_nc_prescreen[16 * v77 + 152])
                  v117 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
                if (v77 <= 0x13)
                  goto LABEL_413;
                goto LABEL_428;
              }
              LODWORD(v77) = 0;
            }
            v117 = 0;
            ++v52[44];
LABEL_413:
            if (v116)
              v185 = v117 == 0;
            else
              v185 = 1;
            goto LABEL_435;
          default:
            if (v72 != 79)
              goto LABEL_441;
            LODWORD(v77) = dword_1EF614998;
            v82 = (dword_1EF614998 - 1);
            if (dword_1EF614998 < 1)
            {
              v83 = 0;
              ++v52[44];
            }
            else
            {
              --dword_1EF614998;
              v83 = _nc_prescreen[16 * v82 + 152];
              if (_nc_prescreen[16 * v82 + 152])
                v83 = *(_DWORD *)&_nc_prescreen[16 * v82 + 144];
              if ((_DWORD)v82)
              {
                v77 = (v77 - 2);
                dword_1EF614998 = v77;
                v84 = _nc_prescreen[16 * v77 + 152];
                if (_nc_prescreen[16 * v77 + 152])
                  v84 = *(_DWORD *)&_nc_prescreen[16 * v77 + 144];
                if (v77 > 0x13)
                  goto LABEL_428;
LABEL_434:
                v185 = (v83 | v84) == 0;
LABEL_435:
                v183 = !v185;
LABEL_438:
                v186 = &_nc_prescreen[16 * (int)v77];
                v186[152] = 1;
                *((_DWORD *)v186 + 36) = v183;
LABEL_439:
                ++dword_1EF614998;
                goto LABEL_440;
              }
              LODWORD(v77) = 0;
            }
            v84 = 0;
            ++v52[44];
            goto LABEL_434;
        }
    }
  }
LABEL_459:
  v190 = qword_1EF6149B0;
  v191 = qword_1EF6149B0 + 1;
  v192 = (_BYTE *)qword_1EF6149A0;
  if (qword_1EF6149B0 + 1 > (unint64_t)qword_1EF6149A8)
  {
    qword_1EF6149A8 = 2 * v191;
    v192 = _nc_doalloc((void *)qword_1EF6149A0, 2 * v191);
    qword_1EF6149A0 = (uint64_t)v192;
    if (!v192)
      goto LABEL_464;
    v190 = qword_1EF6149B0;
  }
  v192[v190] = 0;
  return qword_1EF6149A0;
}

char *tiparm_s(int a1, int a2, const char *a3, ...)
{
  va_list va;

  va_start(va, a3);
  if (a2 > 0x1FF)
    return 0;
  _nc_tparm_err = 0;
  return (char *)sub_1C05CAD88(0, a1, a2, (char *)a3, (char **)va);
}

char *tiparm(const char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  _nc_tparm_err = 0;
  return (char *)sub_1C05CAD88(0, -1, -1, (char *)a1, (char **)va);
}

char *_nc_tiparm(int a1, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  _nc_tparm_err = 0;
  return (char *)sub_1C05CAD88(0, a1, -1, (char *)a2, (char **)va);
}

char *_nc_set_no_padding(uint64_t a1)
{
  char *result;

  result = getenv("NCURSES_NO_PADDING");
  if (a1)
    *(_BYTE *)(a1 + 812) = result != 0;
  else
    byte_1EF614AA0 = result != 0;
  return result;
}

int delay_output(int a1)
{
  void (*v3)(char);
  int v4;
  int v5;
  int v6;

  if (!cur_term)
    return -1;
  if (cur_term->type.Booleans[25])
  {
    _nc_flush();
    napms(a1);
  }
  else
  {
    v3 = (void (*)(char))off_1ED4FCA98;
    v4 = _nc_baudrate(ospeed);
    v5 = v4 * a1 / 9000;
    _nc_nulls_sent += v5;
    if (v4 * a1 >= 9000)
    {
      v6 = v5 + 1;
      do
      {
        v3(PC[0]);
        --v6;
      }
      while (v6 > 1);
    }
    if ((char *)v3 == (char *)_nc_outch)
      _nc_flush();
  }
  return 0;
}

void _nc_flush()
{
  size_t v0;
  char *v1;
  ssize_t v2;

  if (SP)
  {
    if ((*(_DWORD *)(SP + 4) & 0x80000000) == 0)
    {
      v0 = *(_QWORD *)(SP + 32);
      if (v0)
      {
        v1 = *(char **)(SP + 16);
        *(_QWORD *)(SP + 32) = 0;
        do
        {
          while (1)
          {
            v2 = write(*(_DWORD *)(SP + 4), v1, v0);
            if (v2 < 1)
              break;
            v1 += v2;
            v0 -= v2;
            if (!v0)
              return;
          }
        }
        while (*__error() == 35 || *__error() == 4);
      }
    }
  }
}

uint64_t _nc_outch(char a1)
{
  uint64_t v2;
  BOOL v3;
  int v4;
  char *p_buf;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  char v10;
  char __buf;

  v2 = SP;
  if (cur_term)
    v3 = SP == 0;
  else
    v3 = 1;
  if (v3)
  {
    v10 = a1;
    v4 = fileno((FILE *)*MEMORY[0x1E0C80C20]);
    p_buf = &v10;
    goto LABEL_12;
  }
  v6 = *(_QWORD *)(SP + 16);
  if (!v6)
  {
    __buf = a1;
    v4 = fileno(*(FILE **)(SP + 8));
    p_buf = &__buf;
LABEL_12:
    if (write(v4, p_buf, 1uLL) == -1)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  v7 = *(_QWORD *)(SP + 32);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) >= *(_QWORD *)(SP + 24))
  {
    _nc_flush();
    v2 = SP;
    v6 = *(_QWORD *)(SP + 16);
    v7 = *(_QWORD *)(SP + 32);
    v8 = v7 + 1;
  }
  result = 0;
  *(_QWORD *)(v2 + 32) = v8;
  *(_BYTE *)(v6 + v7) = a1;
  return result;
}

int putp(const char *a1)
{
  return tputs(a1, 1, _nc_putchar);
}

int tputs(const char *a1, int a2, int (__cdecl *a3)(int))
{
  BOOL v3;
  char *v4;
  int result;
  uint64_t (*v8)();
  char **Strings;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  BOOL v17;
  int v18;
  int v19;
  int v20;
  char *v21;
  int v22;
  unsigned int v23;
  int v24;
  BOOL v25;
  char *v26;
  int v27;
  int v28;
  int v29;
  char v30;

  if (SP)
    v3 = cur_term == 0;
  else
    v3 = 0;
  if (v3)
    return -1;
  v4 = (char *)a1;
  if ((unint64_t)(a1 + 1) < 2)
    return -1;
  v8 = off_1ED4FCA98;
  if (cur_term)
  {
    Strings = cur_term->type.Strings;
    v10 = Strings[1] == a1 || Strings[45] == a1;
    if (!cur_term->type.Booleans[20] && cur_term->type.Numbers[5])
    {
      if (SP)
      {
        if (!*(_BYTE *)(SP + 812))
          goto LABEL_60;
      }
      else if (!byte_1EF614AA0)
      {
LABEL_60:
        v11 = (int)_nc_baudrate(ospeed) >= cur_term->type.Numbers[5];
        goto LABEL_14;
      }
    }
    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 1;
  }
LABEL_14:
  off_1ED4FCA98 = (uint64_t (*)())a3;
  v12 = v10 || v11;
  while (1)
  {
    while (1)
    {
      v13 = *v4;
      if (v13 != 36)
      {
        if (!*v4)
          goto LABEL_54;
        ((void (*)(_QWORD))a3)((char)v13);
        goto LABEL_30;
      }
      if (v4[1] != 60)
        break;
      v15 = v4[2];
      v4 += 2;
      v14 = v15;
      v16 = v15 - 48;
      v17 = v15 != 46 && v16 > 9;
      if (!v17 && strchr(v4, 62))
      {
        if (v16 > 9)
        {
          v18 = 0;
        }
        else
        {
          v18 = 0;
          do
          {
            v18 = 10 * v18 + (char)v14 - 48;
            v19 = *++v4;
            v14 = v19;
          }
          while ((v19 - 48) < 0xA);
        }
        v20 = 10 * v18;
        if (v14 == 46)
        {
          v22 = v4[1];
          v21 = v4 + 1;
          v23 = v22 - 48;
          v24 = v22 - 48;
          v25 = v23 >= 0xA;
          if (v23 >= 0xA)
            v26 = v21;
          else
            v26 = v21 + 1;
          if (v25)
            v24 = 0;
          v4 = v26 - 1;
          do
          {
            v27 = *++v4;
            LOBYTE(v14) = v27;
          }
          while ((v27 - 48) < 0xA);
          v20 += v24;
        }
        v28 = 0;
        while (v14 == 47 || v14 == 42)
        {
          if (v14 == 42)
            v29 = a2;
          else
            v29 = 1;
          v20 *= v29;
          v28 |= v14 != 42;
          v30 = *++v4;
          LOBYTE(v14) = v30;
        }
        if (v20 >= 1 && ((v12 | v28) & 1) != 0)
          delay_output(v20 / 0xAu);
        goto LABEL_30;
      }
      ((void (*)(uint64_t))a3)(36);
      ((void (*)(uint64_t))a3)(60);
    }
    ((void (*)(uint64_t))a3)(36);
    if (!v4[1])
      break;
    ((void (*)(void))a3)();
    ++v4;
LABEL_30:
    if (!*v4)
      break;
    ++v4;
  }
LABEL_54:
  result = 0;
  off_1ED4FCA98 = v8;
  return result;
}

uint64_t _nc_putp(int a1, char *a2)
{
  if (a2)
    return tputs(a2, 1, (int (__cdecl *)(int))_nc_outch);
  else
    return 0xFFFFFFFFLL;
}

uint64_t _nc_signal_handler(uint64_t result)
{
  int v1;
  const sigaction *v2;

  v1 = result;
  if ((byte_1EF614C10 & 1) != 0)
  {
LABEL_10:
    if (!v1)
      return result;
    goto LABEL_11;
  }
  if (!(_DWORD)result)
  {
    qword_1EF614C18 = 1;
    return sigaction(18, (const sigaction *)&qword_1EF614C18, (sigaction *)((char *)&qword_1EF614C24 + 4));
  }
  if (qword_1EF614C18)
  {
    v2 = (const sigaction *)((char *)&qword_1EF614C24 + 4);
LABEL_9:
    result = sigaction(18, v2, 0);
    goto LABEL_10;
  }
  result = sigaction(18, 0, (sigaction *)((char *)&qword_1EF614C24 + 4));
  if (!(_DWORD)result && !*(uint64_t *)((char *)&qword_1EF614C24 + 4))
  {
    v2 = (const sigaction *)&qword_1EF614C18;
    dword_1EF614C20 = 0;
    qword_1EF614C24 = qword_1EF614C24 | 2;
    qword_1EF614C18 = (uint64_t)sub_1C05CC9D0;
    goto LABEL_9;
  }
  byte_1EF614C10 = 1;
  if (!v1)
    return result;
LABEL_11:
  if (!PC[20])
  {
    sub_1C05CCAF0(2, (void (__cdecl *)(int))sub_1C05CCB78);
    sub_1C05CCAF0(15, (void (__cdecl *)(int))sub_1C05CCB78);
    result = sub_1C05CCAF0(28, (void (__cdecl *)(int))sub_1C05CCC2C);
    PC[20] = 1;
  }
  return result;
}

uint64_t sub_1C05CC9D0()
{
  pid_t v0;
  sigset_t v1;
  pid_t v2;
  sigaction v4;
  sigaction v5;
  sigset_t v6;
  sigset_t v7;

  *(_DWORD *)&PC[8] = 1;
  if (SP)
  {
    if (!*(_DWORD *)(SP + 736))
    {
      v0 = tcgetpgrp(0);
      if (v0 == getpgrp())
        def_prog_mode();
    }
  }
  v4.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v4.sa_mask = 0;
  v6 = 0;
  v7 = 134225920;
  sigprocmask(1, &v7, &v6);
  if ((v6 & 0x200000) != 0)
  {
    v1 = 0x20000;
  }
  else
  {
    v7 = 0x200000;
    sigprocmask(1, &v7, 0);
    v1 = 2228224;
  }
  endwin();
  v7 = v1;
  sigprocmask(2, &v7, 0);
  v5.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v5.sa_mask = 0x200000000;
  sigaction(18, &v5, &v4);
  v2 = getpid();
  kill(v2, 18);
  sigaction(18, &v4, 0);
  flushinp();
  def_shell_mode();
  doupdate();
  return sigprocmask(3, &v6, 0);
}

uint64_t sub_1C05CCAF0(int a1, void (__cdecl *a2)(int))
{
  uint64_t result;
  _BOOL4 v6;
  sigaction v7;
  sigaction v8;

  *(_QWORD *)&v7.sa_mask = 0;
  if (a1 != 28)
    v7.sa_flags = 2;
  v8.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v8.sa_mask = 0;
  v7.__sigaction_u.__sa_handler = a2;
  result = sigaction(a1, 0, &v8);
  if (!(_DWORD)result)
  {
    v6 = a1 == 28 && v8.__sigaction_u.__sa_handler == (void (__cdecl *)(int))1;
    if (!v8.__sigaction_u.__sa_handler || v8.__sigaction_u.__sa_handler == a2 || v6)
      return sigaction(a1, &v7, 0);
  }
  return result;
}

void sub_1C05CCB78(int a1)
{
  uint64_t v1;
  int v2;
  uint64_t i;
  FILE *v4;
  int v5;
  sigaction v6;

  v1 = SP;
  v2 = (*(_DWORD *)&PC[16])++;
  if (!v2 && (a1 == 15 || a1 == 2))
  {
    v6.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
    *(_QWORD *)&v6.sa_mask = 0;
    if (!sigaction(a1, &v6, 0))
    {
      for (i = _nc_screen_chain; i; i = *(_QWORD *)(i + 1392))
      {
        v4 = *(FILE **)(i + 8);
        if (v4)
        {
          v5 = fileno(v4);
          if (isatty(v5))
            *(_QWORD *)(i + 1448) = _nc_outch;
        }
        set_term((SCREEN *)i);
        endwin();
        if (v1)
          *(_DWORD *)(v1 + 736) = 0;
      }
    }
  }
  _exit(1);
}

void sub_1C05CCC2C()
{
  *(_DWORD *)&PC[12] = 1;
}

int _nc_get_tty_mode(termios *buf)
{
  int result;
  TERMINAL *v3;

  result = -1;
  if (buf && SP)
  {
    v3 = cur_term;
    if (cur_term)
    {
      while (1)
      {
        result = tcgetattr(v3->Filedes, buf);
        if (!result)
          break;
        if (*__error() != 4)
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      buf->c_ospeed = 0;
      *(_OWORD *)buf->c_cc = 0u;
      *(_OWORD *)&buf->c_cc[16] = 0u;
      *(_OWORD *)&buf->c_iflag = 0u;
      *(_OWORD *)&buf->c_cflag = 0u;
      return -1;
    }
  }
  return result;
}

int _nc_set_tty_mode(termios *buf)
{
  int result;
  TERMINAL *v3;

  result = -1;
  if (buf)
  {
    if (SP)
    {
      v3 = cur_term;
      if (cur_term)
      {
        while (1)
        {
          result = tcsetattr(v3->Filedes, 1, buf);
          if (!result)
            break;
          if (*__error() != 4)
          {
            if (*__error() == 25 && SP != 0)
              *(_BYTE *)(SP + 772) = 1;
            return -1;
          }
        }
      }
    }
  }
  return result;
}

int def_shell_mode(void)
{
  TERMINAL *v0;
  int result;

  v0 = cur_term;
  if (!cur_term || _nc_get_tty_mode(&cur_term->Ottyb))
    return -1;
  result = 0;
  if ((v0->Ottyb.c_oflag & 4) != 0)
  {
    *cur_term->type.Strings = 0;
    *((_QWORD *)cur_term->type.Strings + 134) = 0;
  }
  return result;
}

int def_prog_mode(void)
{
  TERMINAL *v0;
  int result;

  v0 = cur_term;
  if (!cur_term)
    return -1;
  result = _nc_get_tty_mode(&cur_term->Nttyb);
  if (result)
    return -1;
  v0->Nttyb.c_oflag &= 0xFFFFFFFBuLL;
  return result;
}

int reset_prog_mode(void)
{
  int result;

  if (!cur_term || _nc_set_tty_mode(&cur_term->Nttyb))
    return -1;
  result = SP;
  if (SP)
  {
    if (*(_BYTE *)(SP + 177))
      _nc_keypad(SP, 1);
    return 0;
  }
  return result;
}

int reset_shell_mode(void)
{
  TERMINAL *v0;

  v0 = cur_term;
  if (!cur_term)
    return -1;
  if (SP)
  {
    _nc_keypad(SP, 0);
    _nc_flush();
  }
  return _nc_set_tty_mode(&v0->Ottyb);
}

int savetty(void)
{
  termios *v0;

  if (SP)
  {
    v0 = (termios *)(SP + 56);
  }
  else
  {
    v0 = (termios *)qword_1EF614A98;
    if (!qword_1EF614A98)
    {
      v0 = (termios *)calloc(1uLL, 0x48uLL);
      qword_1EF614A98 = (uint64_t)v0;
    }
  }
  return _nc_get_tty_mode(v0);
}

int resetty(void)
{
  termios *v0;

  if (SP)
  {
    v0 = (termios *)(SP + 56);
  }
  else
  {
    v0 = (termios *)qword_1EF614A98;
    if (!qword_1EF614A98)
    {
      v0 = (termios *)calloc(1uLL, 0x48uLL);
      qword_1EF614A98 = (uint64_t)v0;
    }
  }
  return _nc_set_tty_mode(v0);
}

uint64_t _nc_timed_wait(int *a1, char a2, int a3, int *a4)
{
  int tv_sec;
  __darwin_suseconds_t tv_usec;
  int v9;
  timeval *v10;
  int v11;
  int v12;
  unint64_t v13;
  int v14;
  int v15;
  __darwin_suseconds_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  fd_set v23;
  timeval v24;

  memset(&v23, 0, sizeof(v23));
  while (1)
  {
    v24.tv_sec = 0;
    *(_QWORD *)&v24.tv_usec = 0;
    gettimeofday(&v24, 0);
    tv_sec = v24.tv_sec;
    tv_usec = v24.tv_usec;
    memset(&v23, 0, sizeof(v23));
    if ((a2 & 1) != 0)
    {
      v12 = *a1;
      if (__darwin_check_fd_set_overflow(*a1, &v23, 0))
        *(__int32_t *)((char *)v23.fds_bits + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v12;
      v9 = *a1 + 1;
      if ((a2 & 2) == 0)
      {
LABEL_4:
        if ((a3 & 0x80000000) == 0)
          goto LABEL_5;
        goto LABEL_17;
      }
    }
    else
    {
      v9 = 0;
      if ((a2 & 2) == 0)
        goto LABEL_4;
    }
    v13 = a1[274];
    if ((v13 & 0x80000000) == 0)
    {
      if (__darwin_check_fd_set_overflow(a1[274], &v23, 0))
        *(__int32_t *)((char *)v23.fds_bits + ((v13 >> 3) & 0x1FFFFFFC)) |= 1 << v13;
      if ((int)v13 <= v9)
        v14 = v9;
      else
        v14 = v13;
      v9 = v14 + 1;
    }
    if ((a3 & 0x80000000) == 0)
    {
LABEL_5:
      v24.tv_sec = a3 / 0x3E8uLL;
      *(&v24.tv_usec + 1) = 0;
      v24.tv_usec = 1000 * (a3 % 0x3E8u);
      v10 = &v24;
      v11 = v9;
      goto LABEL_18;
    }
LABEL_17:
    v11 = v9;
    v10 = 0;
LABEL_18:
    v15 = select(v11, &v23, 0, 0, v10);
    v24.tv_sec = 0;
    *(_QWORD *)&v24.tv_usec = 0;
    gettimeofday(&v24, 0);
    v16 = v24.tv_usec;
    if (tv_usec > v24.tv_usec)
      v16 = v24.tv_usec + 1000000;
    v17 = (((v16 - tv_usec) / -1000 - 1000 * (LODWORD(v24.tv_sec) - tv_sec - (tv_usec > v24.tv_usec))) & ~(a3 >> 31))
        + a3;
    if (v15 || v17 < 101)
      break;
    napms(100);
    a3 = v17 - 100;
  }
  if (a4)
    *a4 = v17;
  if (v15 < 1)
    return 0;
  if ((a2 & 2) != 0
    && (v18 = a1[274], (v18 & 0x80000000) == 0)
    && __darwin_check_fd_set_overflow(a1[274], &v23, 0)
    && ((*(unsigned int *)((char *)v23.fds_bits + ((v18 >> 3) & 0x1FFFFFFC)) >> v18) & 1) != 0)
  {
    v19 = 2;
    if ((a2 & 1) == 0)
      return v19;
LABEL_33:
    v20 = *a1;
    if (__darwin_check_fd_set_overflow(v20, &v23, 0)
      && ((*(unsigned int *)((char *)v23.fds_bits + (((unint64_t)v20 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v20) & 1) != 0)
    {
      return v19 | 1;
    }
  }
  else
  {
    v19 = 0;
    if ((a2 & 1) != 0)
      goto LABEL_33;
  }
  return v19;
}

uint64_t _nc_wcrtomb(char *a1, __int32 a2, mbstate_t *a3)
{
  int v3;
  int v4;
  __int32 *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = wcrtomb(a1, a2, a3);
  }
  else
  {
    v6 = v7;
    v7[0] = a2;
    v7[1] = 0;
    v3 = wcsrtombs(0, (const __int32 **)&v6, 0, a3);
  }
  v4 = v3;
  if (v3 == -1)
  {
    __error();
  }
  else if (!v3)
  {
    return 1;
  }
  return v4;
}

uint64_t unget_wch(__int32 a1)
{
  size_t v2;
  int v3;
  char *v4;
  char *v5;
  int v6;
  int v7;
  uint64_t v9;
  mbstate_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&v11, 0, sizeof(v11));
  v2 = _nc_wcrtomb(0, a1, &v11);
  if (v2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = (char *)malloc(v2);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  memset(&v11, 0, sizeof(v11));
  v6 = wcrtomb(v4, a1, &v11);
  *__error() = v6;
  v7 = v3 - 1;
  while ((v7 & 0x80000000) == 0)
  {
    if (ungetch(v5[v7--]))
    {
      v9 = 0xFFFFFFFFLL;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  free(v5);
  return v9;
}

uint64_t _nc_ungetch(__int16 *a1, int a2)
{
  unsigned int v2;
  int v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;

  if (!a1 || a1[365] < 0)
    return 0xFFFFFFFFLL;
  v2 = (unsigned __int16)a1[365];
  v3 = a1[364];
  if (v3 < 0)
  {
    v4 = 0;
    a1[364] = 0;
    if (v2 <= 0x87)
      v6 = v2 + 1;
    else
      v6 = -1;
    a1[365] = v6;
    a1[366] = v6;
  }
  else
  {
    if (a1[364])
      v4 = v3 - 1;
    else
      v4 = 136;
    a1[364] = v4;
    if (v2 == (unsigned __int16)v4)
    {
      a1[365] = -1;
      v4 = v2;
    }
  }
  v5 = 0;
  *(_DWORD *)&a1[2 * v4 + 90] = a2;
  return v5;
}

int ungetch(int a1)
{
  return _nc_ungetch((__int16 *)SP, a1);
}

uint64_t vid_puts(int a1, uint64_t a2, int a3, int (__cdecl *a4)(int))
{
  unint64_t v5;
  TERMINAL **v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  int (__cdecl *v24)(int);
  unsigned int v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  char **Strings;
  const char *v31;
  char *v32;
  const char *v33;
  int v34;
  const char *v35;
  char **v36;
  const char *v37;
  int v38;
  const char *v39;
  uint64_t v40;
  BOOL v41;
  int (__cdecl *v42)(int);
  uint64_t v43;
  int v44;
  _BOOL4 v45;
  char v46;
  uint64_t v47;
  BOOL v48;
  const char *v49;
  BOOL v50;
  const char *v51;
  char **v52;
  const char *v53;
  const char *v54;
  char v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  int v72;
  _DWORD *v73;
  unsigned int *v74;
  int v75;
  unsigned int v76;
  int v77;
  const char *v79;
  const char *v80;
  int v81;
  int v82;
  unsigned int v83;

  v5 = 0x1EF614000uLL;
  v6 = &cur_term;
  if (SP)
  {
    dword_1EF614C38 = **(_DWORD **)(SP + 744);
    if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
    {
      v15 = v12;
    }
    else
    {
      v14 = *(_DWORD *)(v13 + 24);
      v15 = v12;
      if (v14)
        v15 = v14;
    }
    v8 = v10 & 0xFFFFFF00;
    *(_DWORD *)(v5 + 3132) = v15;
    if ((*v6)->type.Numbers[4] >= 1)
      v8 &= ~*(_DWORD *)(v11 + 1012);
  }
  else
  {
    v7 = 0;
    v8 = a1 & 0xFFFFFF00;
    v9 = 1;
  }
  if ((_DWORD)a2)
    v16 = 1;
  else
    v16 = v7;
  if (v16 == 1 && (*v6)->type.Numbers[15] >= 1)
  {
    v17 = *((unsigned __int16 *)(*v6)->type.Numbers + 15);
    v18 = v17 >> 2;
    v19 = ((v17 >> 2) & 0x40 | v17 & 0x3F | (v17 >> 6 << 7)) << 16;
    v20 = v18 & ((v8 & 0x40000) >> 18);
    if (v20)
      v19 &= ~0x40000u;
    v8 &= ~v19;
  }
  else
  {
    v20 = 0;
  }
  v21 = dword_1EF614C38;
  v22 = *(unsigned int *)(v5 + 3132);
  if (v8 != dword_1EF614C38 || (_DWORD)v22 != (_DWORD)a2)
  {
    v24 = a4;
    v83 = v20;
    if ((v20 & 1) != 0)
      v25 = v8 & 0xFFFBFFFF;
    else
      v25 = v8;
    v26 = dword_1EF614C38 & ~v25;
    v27 = v26 & 0xFFFF00FF;
    v28 = v9 ^ 1;
    if ((_DWORD)a2)
      v28 = 1;
    v81 = v9;
    v82 = v7;
    if (((v7 | v28) & 1) == 0 && ((_DWORD)v22 || ((v20 ^ ((dword_1EF614C38 & 0x40000) == 0)) & 1) == 0))
    {
      _nc_do_color(v22, 0, v20 & 1, a4);
      v9 = v81;
      v7 = v82;
    }
    if (v25)
    {
      v29 = v25 & 0xFFFF00FF & (~v21 | 0xFE00FFFF);
      Strings = cur_term->type.Strings;
      v31 = Strings[131];
      if (v31)
      {
        if (v29 | v27)
        {
          v32 = _nc_tiparm(9, v31, HIWORD(v25) & 1, (v25 >> 17) & 1, (v25 >> 18) & 1, (v25 >> 19) & 1, (v25 >> 20) & 1, (v25 >> 21) & 1, (v25 >> 23) & 1, HIBYTE(v25) & 1, (v25 >> 22) & 1);
          tputs(v32, 1, v24);
          v9 = v81;
          LOBYTE(v7) = v82;
          dword_1EF614C38 &= 0xFFFF00FF;
          dword_1EF614C3C = 0;
        }
        if (SP && !*(_BYTE *)(SP + 1042))
          goto LABEL_68;
        if ((v25 & 0x80000000) != 0)
        {
          v33 = (const char *)*((_QWORD *)cur_term->type.Strings + 311);
          if (!v33)
          {
LABEL_68:
            if ((v9 & v16) != 1)
              goto LABEL_163;
            v43 = dword_1EF614C3C;
            if ((_DWORD)a2)
              v46 = 0;
            else
              v46 = v7;
            if ((v46 & 1) != 0 || dword_1EF614C3C != (_DWORD)a2)
              goto LABEL_76;
            v45 = (dword_1EF614C38 & 0x40000) == 0;
            goto LABEL_75;
          }
        }
        else
        {
          if ((v26 & 0x80000000) == 0)
            goto LABEL_68;
          v33 = (const char *)*((_QWORD *)cur_term->type.Strings + 321);
          if (!v33)
            goto LABEL_68;
        }
        tputs(v33, 1, v24);
        v9 = v81;
        LOBYTE(v7) = v82;
        goto LABEL_68;
      }
      if ((v26 & 0x400000) != 0)
      {
        v39 = Strings[38];
        if (v39)
        {
          tputs(v39, 1, v24);
          v9 = v81;
          LOBYTE(v7) = v82;
          v27 = v26 & 0xFFBF00FF;
        }
      }
      v40 = SP;
      if (SP)
      {
        if (*(_BYTE *)(SP + 1041))
          v41 = (v27 & 0x20000) == 0;
        else
          v41 = 1;
        v42 = v24;
        if (v41)
          goto LABEL_88;
      }
      else
      {
        v42 = v24;
        if ((v27 & 0x20000) == 0)
          goto LABEL_94;
      }
      v49 = (const char *)*((_QWORD *)cur_term->type.Strings + 44);
      if (v49)
      {
        tputs(v49, 1, v42);
        v9 = v81;
        LOBYTE(v7) = v82;
        v27 &= 0xFFFD00FF;
        v40 = SP;
      }
      if (v40)
      {
LABEL_88:
        if (*(_BYTE *)(v40 + 1040))
          v50 = (v27 & 0x10000) == 0;
        else
          v50 = 1;
        if (v50)
          goto LABEL_99;
        goto LABEL_96;
      }
LABEL_94:
      if ((v27 & 0x10000) == 0)
        goto LABEL_100;
      v40 = 0;
LABEL_96:
      v51 = (const char *)*((_QWORD *)cur_term->type.Strings + 43);
      if (v51)
      {
        tputs(v51, 1, v42);
        v9 = v81;
        LOBYTE(v7) = v82;
        v27 &= ~0x10000u;
        v40 = SP;
      }
      if (v40)
      {
LABEL_99:
        if (!*(_BYTE *)(v40 + 1042))
          goto LABEL_103;
      }
LABEL_100:
      if ((v27 & 0x80000000) != 0)
      {
        v52 = cur_term->type.Strings;
        v53 = v52[321];
        if (!v53)
          goto LABEL_105;
        tputs(v53, 1, v42);
        v9 = v81;
        LOBYTE(v7) = v82;
        v27 &= ~0x80000000;
      }
LABEL_103:
      if (!v27)
      {
LABEL_107:
        if ((v9 & v16) == 1)
        {
          v55 = (_DWORD)a2 ? 0 : v7;
          if ((v55 & 1) != 0 || dword_1EF614C3C != (_DWORD)a2 || ((v83 ^ ((dword_1EF614C38 & 0x40000) == 0)) & 1) == 0)
            _nc_do_color(dword_1EF614C3C, a2, v83 & 1, v42);
        }
        if ((v29 & 0x400000) != 0)
        {
          v56 = (const char *)*((_QWORD *)cur_term->type.Strings + 25);
          if (v56)
            tputs(v56, 1, v42);
        }
        if ((v29 & 0x80000) != 0)
        {
          v57 = (const char *)*((_QWORD *)cur_term->type.Strings + 26);
          if (v57)
            tputs(v57, 1, v42);
        }
        if ((v29 & 0x200000) != 0)
        {
          v58 = (const char *)*((_QWORD *)cur_term->type.Strings + 27);
          if (v58)
            tputs(v58, 1, v42);
        }
        if ((v29 & 0x100000) != 0)
        {
          v59 = (const char *)*((_QWORD *)cur_term->type.Strings + 30);
          if (v59)
            tputs(v59, 1, v42);
        }
        if ((v29 & 0x40000) != 0)
        {
          v60 = (const char *)*((_QWORD *)cur_term->type.Strings + 34);
          if (v60)
            tputs(v60, 1, v42);
        }
        if ((v29 & 0x10000) != 0)
        {
          v61 = (const char *)*((_QWORD *)cur_term->type.Strings + 35);
          if (v61)
            tputs(v61, 1, v42);
        }
        if ((v29 & 0x1000000) != 0)
        {
          v62 = (const char *)*((_QWORD *)cur_term->type.Strings + 33);
          if (v62)
            tputs(v62, 1, v42);
        }
        if ((v29 & 0x800000) != 0)
        {
          v63 = (const char *)*((_QWORD *)cur_term->type.Strings + 32);
          if (v63)
            tputs(v63, 1, v42);
        }
        if ((v29 & 0x20000) != 0)
        {
          v64 = (const char *)*((_QWORD *)cur_term->type.Strings + 36);
          if (v64)
            tputs(v64, 1, v42);
        }
        if ((v29 & 0x80000000) != 0)
        {
          v65 = (const char *)*((_QWORD *)cur_term->type.Strings + 311);
          if (v65)
            tputs(v65, 1, v42);
        }
        if ((v29 & 0x2000000) != 0)
        {
          v66 = (const char *)*((_QWORD *)cur_term->type.Strings + 386);
          if (v66)
            tputs(v66, 1, v42);
        }
        if ((v29 & 0x4000000) != 0)
        {
          v67 = (const char *)*((_QWORD *)cur_term->type.Strings + 387);
          if (v67)
            tputs(v67, 1, v42);
        }
        if ((v29 & 0x8000000) != 0)
        {
          v68 = (const char *)*((_QWORD *)cur_term->type.Strings + 388);
          if (v68)
            tputs(v68, 1, v42);
        }
        if ((v29 & 0x10000000) != 0)
        {
          v69 = (const char *)*((_QWORD *)cur_term->type.Strings + 389);
          if (v69)
            tputs(v69, 1, v42);
        }
        if ((v29 & 0x20000000) != 0)
        {
          v70 = (const char *)*((_QWORD *)cur_term->type.Strings + 390);
          if (v70)
            tputs(v70, 1, v42);
        }
        if ((v29 & 0x40000000) != 0)
        {
          v71 = (const char *)*((_QWORD *)cur_term->type.Strings + 391);
          if (v71)
            tputs(v71, 1, v42);
        }
        goto LABEL_163;
      }
      v52 = cur_term->type.Strings;
LABEL_105:
      v54 = v52[39];
      if (v54)
      {
        tputs(v54, 1, v42);
        v9 = v81;
        LOBYTE(v7) = v82;
        dword_1EF614C38 &= 0xFFFF00FF;
        dword_1EF614C3C = 0;
        v29 = v25 & 0xFFFF00FF;
      }
      goto LABEL_107;
    }
    v34 = dword_1EF614C38;
    if ((dword_1EF614C38 & 0x400000) != 0)
    {
      v35 = (const char *)*((_QWORD *)cur_term->type.Strings + 38);
      if (!v35)
        goto LABEL_46;
      tputs(v35, 1, v24);
      v9 = v81;
      v7 = v82;
      v34 = dword_1EF614C38 & 0xFFBFFFFF;
      dword_1EF614C38 &= ~0x400000u;
    }
    if (!v34)
    {
LABEL_59:
      if ((v9 & v16) != 1)
        goto LABEL_163;
      v43 = dword_1EF614C3C;
      if ((_DWORD)a2)
        v44 = 0;
      else
        v44 = v7;
      v45 = v34 == 0;
      if (v44 == 1 || dword_1EF614C3C != (_DWORD)a2)
        goto LABEL_76;
LABEL_75:
      if (((v83 ^ v45) & 1) == 0)
LABEL_76:
        _nc_do_color(v43, a2, v83 & 1, v24);
LABEL_163:
      v72 = v8 | 0x40000;
      if ((v83 & 1) == 0)
        v72 = v8;
      if (SP)
      {
        **(_DWORD **)(SP + 744) = **(unsigned __int8 **)(SP + 744) | v72 & 0xFFFFFF00;
        v73 = (_DWORD *)_nc_abiver(&_nc_abiver);
        v76 = v75 & 0xFFFF00FF;
        if (*v73 < 0x60000u)
        {
          v77 = a2 << 8;
        }
        else
        {
          v74[6] = a2;
          v77 = a2 << 8;
          if ((int)a2 > 255)
            v77 = 65280;
        }
        *v74 = v76 | v77;
      }
      else
      {
        dword_1EF614C38 = v72;
        dword_1EF614C3C = a2;
      }
      return 0;
    }
LABEL_46:
    v36 = cur_term->type.Strings;
    v37 = v36[39];
    if (v37)
    {
LABEL_47:
      tputs(v37, 1, v24);
      v9 = v81;
      v7 = v82;
LABEL_48:
      v38 = dword_1EF614C38;
      dword_1EF614C38 &= 0xFFFF00FF;
      dword_1EF614C3C = 0;
      v34 = v38 & 0x40000;
      goto LABEL_59;
    }
    v47 = SP;
    if (SP)
    {
      if (*(_BYTE *)(SP + 1041))
        v48 = (v26 & 0x20000) == 0;
      else
        v48 = 1;
      if (v48)
        goto LABEL_178;
    }
    else if ((v26 & 0x20000) == 0)
    {
      goto LABEL_181;
    }
    v79 = v36[44];
    if (v79)
    {
      tputs(v79, 1, v24);
      v9 = v81;
      v7 = v82;
      v27 = v26 & 0xFFFD00FF;
      v47 = SP;
    }
    if (v47)
    {
LABEL_178:
      if (!*(_BYTE *)(v47 + 1040) || (v27 & 0x10000) == 0)
        goto LABEL_186;
      goto LABEL_183;
    }
LABEL_181:
    if ((v27 & 0x10000) == 0)
      goto LABEL_187;
    v47 = 0;
LABEL_183:
    v80 = (const char *)*((_QWORD *)cur_term->type.Strings + 43);
    if (v80)
    {
      tputs(v80, 1, v24);
      v9 = v81;
      v7 = v82;
      v27 &= 0xFFFE00FF;
      v47 = SP;
    }
    if (v47)
    {
LABEL_186:
      if (!*(_BYTE *)(v47 + 1042))
        goto LABEL_48;
    }
LABEL_187:
    if ((v27 & 0x80000000) == 0)
      goto LABEL_48;
    v37 = (const char *)*((_QWORD *)cur_term->type.Strings + 321);
    if (!v37)
      goto LABEL_48;
    goto LABEL_47;
  }
  return 0;
}

uint64_t vid_attr(int a1, uint64_t a2, int a3)
{
  vid_puts(a1, a2, a3, _nc_putchar);
  return 0;
}

uint64_t term_attrs()
{
  chtype v0;
  char **Strings;
  unsigned int v2;

  if (!SP)
    return 0;
  v0 = termattrs();
  Strings = cur_term->type.Strings;
  if (Strings[386])
    v2 = v0 | 0x2000000;
  else
    v2 = v0;
  if (Strings[387])
    v2 |= 0x4000000u;
  if (Strings[388])
    v2 |= 0x8000000u;
  if (Strings[389])
    v2 |= 0x10000000u;
  if (Strings[390])
    v2 |= 0x20000000u;
  if (Strings[391])
    return v2 | 0x40000000;
  else
    return v2;
}

int vidputs(chtype a1, NCURSES_OUTC a2)
{
  int v2;
  _BOOL4 v3;
  _BOOL4 v4;
  chtype v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  char **Strings;
  char *v19;
  char *v20;
  const char *v21;
  int v22;
  const char *v23;
  char **v24;
  const char *v25;
  int v26;
  int (__cdecl *v27)(int);
  uint64_t v28;
  int v29;
  int v30;
  _BOOL4 v31;
  int v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  BOOL v36;
  int (__cdecl *v37)(int);
  int v38;
  BOOL v39;
  uint64_t v40;
  BOOL v41;
  const char *v42;
  BOOL v43;
  const char *v44;
  char **v45;
  const char *v46;
  const char *v47;
  int v48;
  BOOL v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  int v66;
  const char *v68;
  const char *v69;
  _BOOL4 v70;

  if (SP)
  {
    v2 = *(_DWORD *)(SP + 752);
    v3 = v2 != 0;
    if (v2)
      v4 = *(_BYTE *)(SP + 993) == 0;
    else
      v4 = 0;
    v5 = a1 & 0xFFFFFF00;
    dword_1EF6147CC = **(_DWORD **)(SP + 744);
    if (cur_term->type.Numbers[4] >= 1)
      v5 &= ~*(_DWORD *)(SP + 1012);
  }
  else
  {
    v4 = 0;
    v5 = a1 & 0xFFFFFF00;
    v3 = 1;
  }
  if ((v4 || (v5 & 0xFF00) != 0) && cur_term->type.Numbers[15] >= 1)
  {
    v6 = *((unsigned __int16 *)cur_term->type.Numbers + 15);
    v7 = (v6 & 0x3F | (((v6 >> 8) & 1) << 6) & 0xFFFFFE7F | (v6 >> 6 << 7)) << 16;
    v8 = (v5 >> 18) & ((v6 & 4) >> 2);
    v9 = v7 & 0xFFFBFFFF;
    if (!v8)
      v9 = v7;
    v5 &= ~v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = dword_1EF6147CC;
  if (v5 != dword_1EF6147CC)
  {
    v12 = v8;
    if ((v8 & 1) != 0)
      v13 = v5 & 0xFFFBFFFF;
    else
      v13 = v5;
    v14 = dword_1EF6147CC & ~v13;
    v15 = v14 & 0xFFFF00FF;
    v16 = !v3;
    if (BYTE1(v5))
      v16 = 1;
    if (((v4 | v16) & 1) == 0 && (BYTE1(dword_1EF6147CC) || ((v8 ^ ((dword_1EF6147CC & 0x40000) == 0)) & 1) == 0))
      _nc_do_color(BYTE1(dword_1EF6147CC), 0, v8 & 1, a2);
    if (v13)
    {
      v70 = v3;
      v17 = v13 & 0xFFFF00FF & (~v10 | 0xFE00FFFF);
      Strings = cur_term->type.Strings;
      v19 = Strings[131];
      if (v19)
      {
        if (v17 | v15)
        {
          v20 = tparm(v19, HIWORD(v13) & 1, (v13 >> 17) & 1, (v13 >> 18) & 1, (v13 >> 19) & 1, (v13 >> 20) & 1, (v13 >> 21) & 1, (v13 >> 23) & 1, HIBYTE(v13) & 1, (v13 >> 22) & 1);
          tputs(v20, 1, a2);
          dword_1EF6147CC &= 0xFFFF00FF;
        }
        if (!SP || *(_BYTE *)(SP + 1042))
        {
          if ((v13 & 0x80000000) != 0)
          {
            v21 = (const char *)*((_QWORD *)cur_term->type.Strings + 311);
            if (!v21)
              goto LABEL_64;
          }
          else
          {
            if ((v14 & 0x80000000) == 0)
              goto LABEL_64;
            v21 = (const char *)*((_QWORD *)cur_term->type.Strings + 321);
            if (!v21)
              goto LABEL_64;
          }
          tputs(v21, 1, a2);
        }
LABEL_64:
        v28 = BYTE1(v5);
        if (BYTE1(v5))
          v38 = 1;
        else
          v38 = v4;
        if ((v70 & v38) == 1)
        {
          v27 = a2;
          v33 = BYTE1(dword_1EF6147CC);
          v39 = !BYTE1(v5) && v4;
          if (v39 || BYTE1(v5) != BYTE1(dword_1EF6147CC) || ((v12 ^ ((dword_1EF6147CC & 0x40000) == 0)) & 1) == 0)
          {
            v32 = v12 & 1;
            goto LABEL_75;
          }
        }
        goto LABEL_164;
      }
      if ((v14 & 0x400000) != 0)
      {
        v34 = Strings[38];
        if (v34)
        {
          tputs(v34, 1, a2);
          v15 = v14 & 0xFFBF00FF;
        }
      }
      v35 = SP;
      if (SP)
      {
        if (*(_BYTE *)(SP + 1041))
          v36 = (v15 & 0x20000) == 0;
        else
          v36 = 1;
        v37 = a2;
        if (v36)
          goto LABEL_87;
      }
      else
      {
        v37 = a2;
        if ((v15 & 0x20000) == 0)
          goto LABEL_92;
      }
      v42 = (const char *)*((_QWORD *)cur_term->type.Strings + 44);
      if (v42)
      {
        tputs(v42, 1, v37);
        v15 &= 0xFFFD00FF;
        v35 = SP;
      }
      if (v35)
      {
LABEL_87:
        if (*(_BYTE *)(v35 + 1040))
          v43 = (v15 & 0x10000) == 0;
        else
          v43 = 1;
        if (v43)
          goto LABEL_97;
        goto LABEL_94;
      }
LABEL_92:
      if ((v15 & 0x10000) == 0)
        goto LABEL_98;
      v35 = 0;
LABEL_94:
      v44 = (const char *)*((_QWORD *)cur_term->type.Strings + 43);
      if (v44)
      {
        tputs(v44, 1, v37);
        v15 &= ~0x10000u;
        v35 = SP;
      }
      if (v35)
      {
LABEL_97:
        if (!*(_BYTE *)(v35 + 1042))
          goto LABEL_101;
      }
LABEL_98:
      if ((v15 & 0x80000000) != 0)
      {
        v45 = cur_term->type.Strings;
        v46 = v45[321];
        if (!v46)
          goto LABEL_103;
        tputs(v46, 1, v37);
        v15 &= ~0x80000000;
      }
LABEL_101:
      if (!v15)
      {
LABEL_105:
        if (BYTE1(v5))
          v48 = 1;
        else
          v48 = v4;
        if ((v70 & v48) == 1)
        {
          v49 = !BYTE1(v5) && v4;
          if (v49 || BYTE1(v5) != BYTE1(dword_1EF6147CC) || ((v12 ^ ((dword_1EF6147CC & 0x40000) == 0)) & 1) == 0)
            _nc_do_color(BYTE1(dword_1EF6147CC), BYTE1(v5), v12 & 1, v37);
        }
        if ((v17 & 0x400000) != 0)
        {
          v50 = (const char *)*((_QWORD *)cur_term->type.Strings + 25);
          if (v50)
            tputs(v50, 1, v37);
        }
        if ((v17 & 0x80000) != 0)
        {
          v51 = (const char *)*((_QWORD *)cur_term->type.Strings + 26);
          if (v51)
            tputs(v51, 1, v37);
        }
        if ((v17 & 0x200000) != 0)
        {
          v52 = (const char *)*((_QWORD *)cur_term->type.Strings + 27);
          if (v52)
            tputs(v52, 1, v37);
        }
        if ((v17 & 0x100000) != 0)
        {
          v53 = (const char *)*((_QWORD *)cur_term->type.Strings + 30);
          if (v53)
            tputs(v53, 1, v37);
        }
        if ((v17 & 0x40000) != 0)
        {
          v54 = (const char *)*((_QWORD *)cur_term->type.Strings + 34);
          if (v54)
            tputs(v54, 1, v37);
        }
        if ((v17 & 0x10000) != 0)
        {
          v55 = (const char *)*((_QWORD *)cur_term->type.Strings + 35);
          if (v55)
            tputs(v55, 1, v37);
        }
        if ((v17 & 0x1000000) != 0)
        {
          v56 = (const char *)*((_QWORD *)cur_term->type.Strings + 33);
          if (v56)
            tputs(v56, 1, v37);
        }
        if ((v17 & 0x800000) != 0)
        {
          v57 = (const char *)*((_QWORD *)cur_term->type.Strings + 32);
          if (v57)
            tputs(v57, 1, v37);
        }
        if ((v17 & 0x20000) != 0)
        {
          v58 = (const char *)*((_QWORD *)cur_term->type.Strings + 36);
          if (v58)
            tputs(v58, 1, v37);
        }
        if ((v17 & 0x80000000) != 0)
        {
          v59 = (const char *)*((_QWORD *)cur_term->type.Strings + 311);
          if (v59)
            tputs(v59, 1, v37);
        }
        if ((v17 & 0x2000000) != 0)
        {
          v60 = (const char *)*((_QWORD *)cur_term->type.Strings + 386);
          if (v60)
            tputs(v60, 1, v37);
        }
        if ((v17 & 0x4000000) != 0)
        {
          v61 = (const char *)*((_QWORD *)cur_term->type.Strings + 387);
          if (v61)
            tputs(v61, 1, v37);
        }
        if ((v17 & 0x8000000) != 0)
        {
          v62 = (const char *)*((_QWORD *)cur_term->type.Strings + 388);
          if (v62)
            tputs(v62, 1, v37);
        }
        if ((v17 & 0x10000000) != 0)
        {
          v63 = (const char *)*((_QWORD *)cur_term->type.Strings + 389);
          if (v63)
            tputs(v63, 1, v37);
        }
        if ((v17 & 0x20000000) != 0)
        {
          v64 = (const char *)*((_QWORD *)cur_term->type.Strings + 390);
          if (v64)
            tputs(v64, 1, v37);
        }
        if ((v17 & 0x40000000) != 0)
        {
          v65 = (const char *)*((_QWORD *)cur_term->type.Strings + 391);
          if (v65)
            tputs(v65, 1, v37);
        }
        goto LABEL_164;
      }
      v45 = cur_term->type.Strings;
LABEL_103:
      v47 = v45[39];
      if (v47)
      {
        tputs(v47, 1, v37);
        dword_1EF6147CC &= 0xFFFF00FF;
        v17 = v13 & 0xFFFF00FF;
      }
      goto LABEL_105;
    }
    v22 = dword_1EF6147CC;
    if ((dword_1EF6147CC & 0x400000) != 0)
    {
      v23 = (const char *)*((_QWORD *)cur_term->type.Strings + 38);
      if (!v23)
        goto LABEL_39;
      tputs(v23, 1, a2);
      v22 = dword_1EF6147CC & 0xFFBFFFFF;
      dword_1EF6147CC &= ~0x400000u;
    }
    if (!v22)
      goto LABEL_42;
LABEL_39:
    v24 = cur_term->type.Strings;
    v25 = v24[39];
    if (v25)
    {
LABEL_40:
      tputs(v25, 1, a2);
LABEL_41:
      v26 = dword_1EF6147CC;
      dword_1EF6147CC &= 0xFFFF00FF;
      v22 = v26 & 0x40000;
LABEL_42:
      v27 = a2;
      v28 = BYTE1(v5);
      if (BYTE1(v5))
        v29 = 1;
      else
        v29 = v4;
      if ((v3 & v29) == 1)
      {
        v30 = BYTE1(v5) || v4;
        v31 = v22 == 0;
        if (v30 == 1 || ((v12 ^ v31) & 1) == 0)
        {
          v32 = v12 & 1;
          v33 = 0;
LABEL_75:
          _nc_do_color(v33, v28, v32, v27);
        }
      }
LABEL_164:
      v66 = v5 | 0x40000;
      if ((v12 & 1) == 0)
        v66 = v5;
      if (SP)
        **(_DWORD **)(SP + 744) = **(unsigned __int8 **)(SP + 744) | v66 & 0xFFFFFF00;
      else
        dword_1EF6147CC = v66;
      return 0;
    }
    v40 = SP;
    if (SP)
    {
      if (*(_BYTE *)(SP + 1041))
        v41 = (v14 & 0x20000) == 0;
      else
        v41 = 1;
      if (v41)
        goto LABEL_174;
    }
    else if ((v14 & 0x20000) == 0)
    {
      goto LABEL_177;
    }
    v68 = v24[44];
    if (v68)
    {
      tputs(v68, 1, a2);
      v15 = v14 & 0xFFFD00FF;
      v40 = SP;
    }
    if (v40)
    {
LABEL_174:
      if (!*(_BYTE *)(v40 + 1040) || (v15 & 0x10000) == 0)
        goto LABEL_182;
      goto LABEL_179;
    }
LABEL_177:
    if ((v15 & 0x10000) == 0)
      goto LABEL_183;
    v40 = 0;
LABEL_179:
    v69 = (const char *)*((_QWORD *)cur_term->type.Strings + 43);
    if (v69)
    {
      tputs(v69, 1, a2);
      v15 &= 0xFFFE00FF;
      v40 = SP;
    }
    if (v40)
    {
LABEL_182:
      if (!*(_BYTE *)(v40 + 1042))
        goto LABEL_41;
    }
LABEL_183:
    if ((v15 & 0x80000000) == 0)
      goto LABEL_41;
    v25 = (const char *)*((_QWORD *)cur_term->type.Strings + 321);
    if (!v25)
      goto LABEL_41;
    goto LABEL_40;
  }
  return 0;
}

int vidattr(chtype a1)
{
  vidputs(a1, _nc_putchar);
  return 0;
}

chtype termattrs(void)
{
  char **Strings;
  int v1;
  chtype v2;

  if (!SP || !*(_QWORD *)(SP + 48))
    return 0;
  Strings = cur_term->type.Strings;
  if (Strings[26])
    v1 = ((Strings[25] != 0) << 22) | 0x80000;
  else
    v1 = (Strings[25] != 0) << 22;
  if (Strings[27])
    v1 |= 0x200000u;
  if (Strings[30])
    v1 |= 0x100000u;
  if (Strings[34])
    v1 |= 0x40000u;
  if (Strings[35])
    v1 |= 0x10000u;
  if (Strings[33])
    v1 |= 0x1000000u;
  if (Strings[32])
    v1 |= 0x800000u;
  if (Strings[36])
    v1 |= 0x20000u;
  if (*(_DWORD *)(SP + 752))
    v2 = v1 | 0xFF00;
  else
    v2 = v1;
  if (Strings[311])
    return v2 | 0x80000000;
  else
    return v2;
}

int wvline(WINDOW *a1, chtype a2, int a3)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v17;
  __int128 v18;
  int v19;

  if (!a1)
    return -1;
  v4 = *(__int16 *)a1;
  v5 = *((__int16 *)a1 + 1);
  v6 = a3 + v4 - 1;
  v7 = *((__int16 *)a1 + 2);
  if (v6 >= v7)
    v8 = *((__int16 *)a1 + 2);
  else
    v8 = a3 + v4 - 1;
  _nc_abiver(&_nc_abiver);
  _nc_render();
  if (v8 >= v4)
  {
    if (v7 >= (uint64_t)v6)
      v9 = v6;
    else
      v9 = v7;
    v10 = v9 + 1;
    v11 = 16 * v9;
    do
    {
      v12 = *((_QWORD *)a1 + 5);
      v13 = v12 + v11;
      v14 = *(_QWORD *)(v12 + v11) + 28 * v5;
      *(_QWORD *)v14 = v17;
      *(_OWORD *)(v14 + 8) = v18;
      *(_DWORD *)(v14 + 24) = v19;
      v15 = *(__int16 *)(v12 + v11 + 8);
      if (v15 == -1)
      {
        *(_WORD *)(v13 + 10) = v5;
      }
      else if (v5 >= v15)
      {
        if (v5 > *(__int16 *)(v12 + v11 + 10))
          *(_WORD *)(v12 + v11 + 10) = v5;
        goto LABEL_16;
      }
      *(_WORD *)(v13 + 8) = v5;
LABEL_16:
      --v10;
      v11 -= 16;
    }
    while (v10 > v4);
  }
  _nc_synchook(a1);
  return 0;
}

uint64_t wvline_set(__int16 *a1, _OWORD *a2, int a3)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  int v16;
  _BYTE v18[28];

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = *a1;
  v5 = a1[1];
  v6 = a3 + v4 - 1;
  v7 = a1[2];
  if (v6 >= v7)
    v8 = a1[2];
  else
    v8 = a3 + v4 - 1;
  v9 = (_OWORD *)(_nc_wacs + 3360);
  if (a2)
    v9 = a2;
  *(_OWORD *)v18 = *v9;
  *(_OWORD *)&v18[12] = *(_OWORD *)((char *)v9 + 12);
  _nc_render();
  if (v8 >= v4)
  {
    v10 = v6;
    if (v7 < (uint64_t)v6)
      v10 = v7;
    v11 = v10 + 1;
    v12 = 16 * v10;
    do
    {
      v13 = *((_QWORD *)a1 + 5);
      v14 = v13 + v12;
      v15 = (_OWORD *)(*(_QWORD *)(v13 + v12) + 28 * v5);
      *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&v18[12];
      *v15 = *(_OWORD *)v18;
      v16 = *(__int16 *)(v13 + v12 + 8);
      if (v16 == -1)
      {
        *(_WORD *)(v14 + 10) = v5;
      }
      else if (v5 >= v16)
      {
        if (v5 > *(__int16 *)(v13 + v12 + 10))
          *(_WORD *)(v13 + v12 + 10) = v5;
        goto LABEL_17;
      }
      *(_WORD *)(v14 + 8) = v5;
LABEL_17:
      --v11;
      v12 -= 16;
    }
    while (v11 > v4);
  }
  _nc_synchook((WINDOW *)a1);
  return 0;
}

uint64_t _nc_init_wacs()
{
  _BOOL4 v0;
  uint64_t result;
  _DWORD *v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  chtype v6;
  uint64_t v7;
  _DWORD *v8;

  v0 = _nc_unicode_locale();
  result = (uint64_t)calloc(0x80uLL, 0x1CuLL);
  _nc_wacs = result;
  if (result)
  {
    v2 = (_DWORD *)_nc_abiver(&_nc_abiver);
    for (i = 0; i != 162; i += 3)
    {
      result = wcwidth(dword_1C05E12E0[v0 + 1 + i]);
      v4 = dword_1C05E12E0[i];
      if (v0 && (_DWORD)result == 1)
      {
        v5 = _nc_wacs + 28 * v4;
        *(_QWORD *)(v5 + 8) = 0;
        *(_QWORD *)(v5 + 16) = 0;
        *(_QWORD *)v5 = 0;
        *(_DWORD *)(v5 + 24) = 0;
        *(_DWORD *)(v5 + 4) = dword_1C05E12E0[i + 2];
      }
      else
      {
        v6 = acs_map[v4];
        v7 = _nc_wacs;
        v5 = _nc_wacs + 28 * v4;
        *(_QWORD *)(v5 + 8) = 0;
        *(_QWORD *)(v5 + 16) = 0;
        *(_DWORD *)(v5 + 24) = 0;
        *(_QWORD *)v5 = 0;
        if ((v6 & 0x400000) != 0)
        {
          *(_DWORD *)(v7 + 28 * v4 + 4) = v4;
          *(_DWORD *)v5 = 0x400000;
          goto LABEL_10;
        }
        *(_DWORD *)(v7 + 28 * v4 + 4) = dword_1C05E12E0[i + 1];
      }
      *(_DWORD *)v5 = 0;
LABEL_10:
      if (*v2 > 0x5FFFFu)
      {
        v8 = (_DWORD *)(_nc_wacs + 28 * v4);
        v8[6] = 0;
        *v8 &= 0xFFFF00FF;
      }
    }
  }
  return result;
}

int wattr_off(WINDOW *a1, attr_t a2, void *a3)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  int result;
  unsigned int v7;

  if (!a1)
    return -1;
  v3 = (_DWORD *)_nc_abiver(&_nc_abiver);
  if ((v4 & 0xFF00) != 0 && *v3 >= 0x60000u)
  {
    *(_DWORD *)(v5 + 116) = 0;
  }
  else if ((v4 & 0xFF00) == 0)
  {
    v7 = ~v4;
    goto LABEL_9;
  }
  v7 = ~v4 & 0xFFFF00FF;
LABEL_9:
  result = 0;
  *(_DWORD *)(v5 + 16) &= v7;
  return result;
}

int wattr_on(WINDOW *a1, attr_t a2, void *a3)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  int result;
  unsigned int *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;

  if (!a1)
    return -1;
  v3 = (_DWORD *)_nc_abiver(&_nc_abiver);
  if ((v4 & 0xFF00) != 0 && *v3 >= 0x60000u)
  {
    *(_DWORD *)(v5 + 116) = BYTE1(v4);
  }
  else if ((v4 & 0xFF00) == 0)
  {
    v10 = *(_DWORD *)(v5 + 16);
    v7 = (unsigned int *)(v5 + 16);
    v9 = v10;
    goto LABEL_9;
  }
  v8 = *(_DWORD *)(v5 + 16);
  v7 = (unsigned int *)(v5 + 16);
  v9 = v8 & 0xFFFF00FF;
LABEL_9:
  result = 0;
  *v7 = v9 | v4;
  return result;
}

chtype winch(WINDOW *a1)
{
  if (a1)
    LODWORD(a1) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * *(__int16 *)a1) + 28 * *((__int16 *)a1 + 1)) | *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * *(__int16 *)a1) + 28 * *((__int16 *)a1 + 1) + 4);
  return a1;
}

void _nc_synchook(WINDOW *a1)
{
  if (*((_BYTE *)a1 + 30))
    wrefresh(a1);
  if (*((_BYTE *)a1 + 31))
    wsyncup(a1);
}

void wsyncup(WINDOW *a1)
{
  WINDOW *v1;
  uint64_t v2;
  uint64_t v3;
  __int16 *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v11;
  _WORD *v12;
  int v13;
  int v14;

  if (a1)
  {
    while (*((_QWORD *)a1 + 8))
    {
      v1 = a1;
      a1 = (WINDOW *)*((_QWORD *)a1 + 8);
      if ((*((__int16 *)v1 + 2) & 0x80000000) == 0)
      {
        v2 = 0;
        v3 = *((unsigned __int16 *)v1 + 2) + 1;
        v4 = (__int16 *)(*((_QWORD *)v1 + 5) + 10);
        do
        {
          if ((*(v4 - 1) & 0x80000000) == 0)
          {
            v5 = *((_DWORD *)v1 + 13);
            v6 = *v4;
            v7 = v5 + (unsigned __int16)*(v4 - 1);
            v8 = *((_QWORD *)a1 + 5) + 16 * (v2 + *((int *)v1 + 14));
            v9 = *(__int16 *)(v8 + 8);
            if (v9 == -1 || v7 < v9)
              *(_WORD *)(v8 + 8) = v7;
            v11 = v5 + v6;
            v14 = *(__int16 *)(v8 + 10);
            v12 = (_WORD *)(v8 + 10);
            v13 = v14;
            if (v14 == -1 || v11 > v13)
              *v12 = v11;
          }
          v4 += 8;
          ++v2;
        }
        while (v3 != v2);
      }
    }
  }
}

int mvderwin(WINDOW *a1, int a2, int a3)
{
  int result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (!a1)
    return -1;
  result = -1;
  if (((a3 | a2) & 0x80000000) == 0)
  {
    v7 = *((_QWORD *)a1 + 8);
    if (v7)
    {
      if (a3 + *((__int16 *)a1 + 3) + 1 <= *(__int16 *)(v7 + 6) + 1
        && a2 + *((__int16 *)a1 + 2) + 1 <= *(__int16 *)(v7 + 4) + 1)
      {
        wsyncup(a1);
        *((_DWORD *)a1 + 13) = a3;
        *((_DWORD *)a1 + 14) = a2;
        if ((*((__int16 *)a1 + 2) & 0x80000000) == 0)
        {
          v8 = (_QWORD *)*((_QWORD *)a1 + 5);
          v9 = (uint64_t *)(*(_QWORD *)(v7 + 40) + 16 * a2);
          v10 = *((unsigned __int16 *)a1 + 2) + 1;
          do
          {
            v11 = *v9;
            v9 += 2;
            *v8 = v11 + 28 * a3;
            v8 += 2;
            --v10;
          }
          while (v10);
        }
        return 0;
      }
    }
  }
  return result;
}

int syncok(WINDOW *a1, BOOL a2)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_BYTE *)a1 + 31) = a2;
  return result;
}

void wsyncdown(WINDOW *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v13;

  if (a1)
  {
    v2 = *((_QWORD *)a1 + 8);
    if (v2)
    {
      wsyncdown(*((WINDOW **)a1 + 8));
      if ((*((__int16 *)a1 + 2) & 0x80000000) == 0)
      {
        v3 = 0;
        v4 = 16 * *((unsigned __int16 *)a1 + 2) + 16;
        v5 = *(_QWORD *)(v2 + 40) + 16 * *((int *)a1 + 14);
        do
        {
          if ((*(__int16 *)(v5 + v3 + 8) & 0x80000000) == 0)
          {
            v6 = *((_QWORD *)a1 + 5);
            v7 = *((_DWORD *)a1 + 13);
            v8 = *(__int16 *)(v5 + v3 + 10) - v7;
            v9 = (*(unsigned __int16 *)(v5 + v3 + 8) - v7) & ~((*(unsigned __int16 *)(v5 + v3 + 8) - v7) >> 31);
            if (v8 >= *((__int16 *)a1 + 3))
              v8 = *((__int16 *)a1 + 3);
            v10 = v6 + v3;
            v11 = *(__int16 *)(v6 + v3 + 8);
            if (v11 == -1 || v9 < v11)
              *(_WORD *)(v10 + 8) = v9;
            v13 = *(__int16 *)(v10 + 10);
            if (v13 == -1 || v8 > v13)
              *(_WORD *)(v10 + 10) = v8;
          }
          v3 += 16;
        }
        while (v4 != v3);
      }
    }
  }
}

void wcursyncup(WINDOW *a1)
{
  WINDOW *v1;
  WINDOW *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (WINDOW *)*((_QWORD *)v1 + 8);
      if (!v2)
        break;
      wmove(v2, *((_DWORD *)v1 + 14) + *(__int16 *)v1, *((_DWORD *)v1 + 13) + *((__int16 *)v1 + 1));
      v1 = (WINDOW *)*((_QWORD *)v1 + 8);
    }
    while (v1);
  }
}

WINDOW *__cdecl dupwin(WINDOW *a1)
{
  __int16 v2;
  int v3;
  int v4;
  WINDOW *v5;
  WINDOW *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a1)
    return 0;
  v2 = *((_WORD *)a1 + 6);
  v3 = *((__int16 *)a1 + 2) + 1;
  v4 = *((__int16 *)a1 + 3) + 1;
  if ((v2 & 0x10) != 0)
    v5 = newpad(v3, v4);
  else
    v5 = newwin(v3, v4, *((__int16 *)a1 + 4), *((__int16 *)a1 + 5));
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)a1;
    *(_QWORD *)v5 = *(_QWORD *)a1;
    *((_DWORD *)v5 + 2) = *((_DWORD *)a1 + 2);
    *((_WORD *)v5 + 42) = *((_WORD *)a1 + 42);
    *((_WORD *)v5 + 6) = *((_WORD *)a1 + 6) & 0xFFFE;
    *((_DWORD *)v5 + 4) = *((_DWORD *)a1 + 4);
    v8 = *(_OWORD *)((char *)a1 + 88);
    *(_OWORD *)((char *)v5 + 100) = *(_OWORD *)((char *)a1 + 100);
    *(_OWORD *)((char *)v5 + 88) = v8;
    *((_QWORD *)v5 + 3) = *((_QWORD *)a1 + 3);
    *((_BYTE *)v5 + 32) = *((_BYTE *)a1 + 32);
    *((_DWORD *)v5 + 9) = *((_DWORD *)a1 + 9);
    *((_DWORD *)v5 + 13) = 0;
    *((_DWORD *)v5 + 14) = 0;
    *((_QWORD *)v5 + 8) = 0;
    *((_WORD *)v5 + 24) = *((_WORD *)a1 + 24);
    *((_WORD *)v5 + 25) = *((_WORD *)a1 + 25);
    if ((*((_WORD *)a1 + 6) & 0x10) != 0)
    {
      v9 = *((_QWORD *)a1 + 9);
      *((_DWORD *)v5 + 20) = *((_DWORD *)a1 + 20);
      *((_QWORD *)v5 + 9) = v9;
    }
    if ((v7 & 0x800000000000) == 0)
    {
      v10 = 0;
      v11 = 28 * (*((__int16 *)a1 + 3) + 1);
      v12 = *((_QWORD *)v5 + 5);
      v13 = *((_QWORD *)a1 + 5);
      v14 = -1;
      do
      {
        memcpy(*(void **)(v12 + v10), *(const void **)(v13 + v10), v11);
        v13 = *((_QWORD *)a1 + 5);
        v12 = *((_QWORD *)v6 + 5);
        *(_DWORD *)(v12 + v10 + 8) = *(_DWORD *)(v13 + v10 + 8);
        ++v14;
        v10 += 16;
      }
      while (v14 < *((__int16 *)v6 + 2));
    }
  }
  return v6;
}

int *wunctrl(int *result)
{
  int *v1;
  chtype v2;
  char *v3;
  int *v4;
  char v5;
  unsigned __int8 *v6;
  wint_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  if (result)
  {
    v1 = result;
    if (SP
      && (*(_DWORD *)(SP + 1456) || (*result & 0x400000) != 0 || (*result & 0xFEu) - 2 >= 0x1E)
      && !result[2]
      && _nc_is_charable(result[1]))
    {
      v2 = _nc_to_char(v1[1]);
      v3 = unctrl(v2);
      v4 = &dword_1EF614C40;
      qword_1EF614C58 = (uint64_t)&dword_1EF614C40;
      v5 = *v3;
      if (*v3)
      {
        v6 = (unsigned __int8 *)(v3 + 1);
        do
        {
          v7 = _nc_to_widechar(v5);
          v8 = qword_1EF614C58;
          v9 = qword_1EF614C58;
          *(_DWORD *)qword_1EF614C58 = v7;
          qword_1EF614C58 = v9 + 4;
          v10 = *v6++;
          v5 = v10;
        }
        while (v10);
        v4 = (int *)(v8 + 4);
      }
      *v4 = 0;
      return &dword_1EF614C40;
    }
    else
    {
      return v1 + 1;
    }
  }
  return result;
}

char *__cdecl _nc_first_name(const char *const a1)
{
  char *v2;
  char *result;
  char *v5;
  uint64_t i;
  int v8;

  v2 = *(char **)&PC[72];
  if (*(_QWORD *)&PC[72] || (result = (char *)malloc(0x201uLL), v2 = result, (*(_QWORD *)&PC[72] = result) != 0))
  {
    if (_nc_syntax == 1 && _nc_user_definable)
    {
      v5 = strchr((char *)a1, 124);
      if (v5 - a1 == 2 && v5 != 0)
        a1 = v5 + 1;
    }
    for (i = 0; i != 512; ++i)
    {
      v8 = a1[i];
      v2[i] = v8;
      v2 = *(char **)&PC[72];
      if (!v8)
        break;
      if (*(_BYTE *)(*(_QWORD *)&PC[72] + i) == 124)
        break;
    }
    *(_BYTE *)(*(_QWORD *)&PC[72] + i) = 0;
    return *(char **)&PC[72];
  }
  return result;
}

uint64_t _nc_panelhook()
{
  if (SP)
    return SP + 1360;
  else
    return 0;
}

int _nc_parse_entry(_ENTRY *a1, int a2, BOOL a3)
{
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  int v6;
  int v7;
  _ENTRY *v8;
  int result;
  char *tk_name;
  BOOL v11;
  char *v12;
  char *name;
  const char *term_names;
  char *v15;
  char *v16;
  const char *v17;
  int token;
  int v19;
  char *v20;
  int v21;
  const HashValue *hash_table;
  const name_table_entry *entry;
  const name_table_entry *i;
  char *v25;
  unsigned int nuses;
  char *v27;
  _BOOL4 v29;
  const alias *alias_table;
  const char *from;
  char *v32;
  const char **p_source;
  char *v34;
  int v35;
  unsigned int ext_Booleans;
  uint64_t ext_Numbers;
  unsigned int v38;
  uint64_t ext_Strings;
  uint64_t v40;
  char **ext_Names;
  uint64_t v42;
  const alias *v43;
  const char *v44;
  char *v45;
  const char **v46;
  int v47;
  const char **v48;
  const char *v49;
  uint64_t v50;
  const char **v51;
  unsigned int v52;
  unsigned int v53;
  unsigned __int16 *p_num_Strings;
  unsigned int v55;
  const char *v56;
  const HashValue *v57;
  const name_table_entry *v58;
  const char *v59;
  const HashValue *v60;
  const name_table_entry *v61;
  uint64_t v62;
  char v63;
  unint64_t v64;
  char **v65;
  int v66;
  char **v67;
  uint64_t v68;
  unsigned int v69;
  int v70;
  unsigned __int16 v71;
  char *v72;
  int num_Booleans;
  uint64_t v74;
  uint64_t v75;
  unsigned __int16 v76;
  char **v77;
  int num_Strings;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int16 v82;
  __int16 *v83;
  int num_Numbers;
  unsigned int v85;
  __int16 *v86;
  __int16 *v87;
  __int16 v88;
  int v89;
  int v90;
  int v91;
  int v92;
  char **v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  int nte_type;
  char *Booleans;
  uint64_t nte_index;
  char v101;
  char v102;
  char *tk_valstring;
  char *v104;
  char v105;
  __int16 *v106;
  int v107;
  char **v109;
  const char *v110;
  char *v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char v117;
  char v118;
  char v119;
  char v120;
  char v121;
  int v122;
  uint64_t v123;
  char v124;
  char **p_name;
  char *v126;
  char **Strings;
  const char *v128;
  const char *v129;
  const char *v130;
  char *v131;
  char **v132;
  char **v133;
  char *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  char *v138;
  const HashValue *v139;
  const name_table_entry *v140;
  const HashValue *v141;
  const name_table_entry *v142;
  const name_table_entry *v143;
  char **v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  char *v148;
  int v149;
  char j;
  char v151;
  char **v152;
  char *v153;
  const char *v154;
  char **v155;
  char **v156;
  char *v157;
  char *v158;
  const char *v159;
  char *v160;
  const char *v161;
  char *v162;
  char **v163;
  const char *v164;
  char *v165;
  __int16 *Numbers;
  int v167;
  const char *v168;
  unsigned int v169;
  char **v170;
  __int16 v171;
  int v172;
  int v173;
  __int16 v174;
  int v175;
  _BOOL4 v176;
  char __s[16];
  __int128 v178;
  char v179[4096];
  _OWORD v180[17];
  uint64_t v181;

  v3 = MEMORY[0x1E0C80A78](a1, *(_QWORD *)&a2, a3);
  v5 = v4;
  v7 = v6;
  v8 = (_ENTRY *)v3;
  v181 = *MEMORY[0x1E0C80C00];
  result = _nc_get_token(v4);
  if (result == -1)
    return result;
  if (result != 4)
    _nc_err_abort("Entry does not start with terminal names in column one");
  _nc_init_entry(&v8->tterm);
  v8->cstart = _nc_comment_start;
  v8->cend = _nc_comment_end;
  v8->startline = _nc_start_line;
  tk_name = _nc_curr_token.tk_name;
  v11 = _nc_syntax == 1 && !_nc_user_definable;
  if (v11 && _nc_curr_token.tk_name[2] == 124)
  {
    _nc_curr_token.tk_name[2] = 0;
    tk_name += 3;
  }
  v12 = _nc_save_str(tk_name);
  v8->tterm.term_names = v12;
  v8->tterm.str_table = v12;
  if (!v12)
    return -1;
  name = _nc_first_name(v12);
  _nc_set_type(name);
  term_names = v8->tterm.term_names;
  v15 = strchr(v8->tterm.term_names, 124);
  if (v15)
  {
    v16 = v15;
    do
    {
      if (v16 - term_names >= 33)
      {
        if (term_names == v8->tterm.term_names)
          v17 = "primary name";
        else
          v17 = "alias";
      }
      term_names = v16 + 1;
      v16 = strchr(v16 + 1, 124);
    }
    while (v16);
  }
  v8->nuses = 0;
  token = _nc_get_token(v5);
  v19 = 0;
  while (token != -1 && token != 4)
  {
    v20 = _nc_curr_token.tk_name;
    v21 = strcmp(_nc_curr_token.tk_name, "use");
    if (!v21 || !strcmp(v20, "tc"))
    {
      v25 = _nc_save_str(_nc_curr_token.tk_valstring);
      nuses = v8->nuses;
      v27 = (char *)v8 + 24 * nuses;
      *((_QWORD *)v27 + 10) = v25;
      *((_QWORD *)v27 + 12) = _nc_curr_line;
      v8->nuses = ++nuses;
      v29 = nuses < 2 || v21 == 0;
      if (((v29 | v19) & 1) == 0)
      {
        _nc_warning("Legacy termcap allows only a trailing tc= clause");
        v19 = 1;
      }
      goto LABEL_159;
    }
    hash_table = _nc_get_hash_table(_nc_syntax != 0);
    entry = _nc_find_entry(v20, hash_table);
    if (entry)
    {
      i = entry;
      v175 = v19;
    }
    else if (_nc_syntax == 1)
    {
      if (!((v8->nuses == 0) | v19 & 1))
      {
        _nc_warning("Legacy termcap allows only a trailing tc= clause");
        v19 = 1;
      }
      v175 = v19;
      alias_table = _nc_get_alias_table(1);
      from = alias_table->from;
      if (!alias_table->from)
      {
LABEL_41:
        if (!_nc_user_definable)
          goto LABEL_71;
        v34 = _nc_curr_token.tk_name;
        v35 = token;
LABEL_43:
        while (v35 == 3)
        {
          ext_Booleans = v8->tterm.ext_Booleans;
          ext_Numbers = v8->tterm.ext_Numbers;
          v38 = ext_Numbers + ext_Booleans;
          ext_Strings = v8->tterm.ext_Strings;
          v35 = 2;
          if ((_DWORD)ext_Numbers + ext_Booleans + (_DWORD)ext_Strings)
          {
            v40 = 0;
            ext_Names = v8->tterm.ext_Names;
            v42 = ext_Numbers + ext_Strings + v8->tterm.ext_Booleans;
            while (strcmp(v34, ext_Names[v40]))
            {
              if (v42 == ++v40)
              {
                v35 = 2;
                goto LABEL_43;
              }
            }
            if (v38 >= v40)
              v35 = v40 > ext_Booleans;
            else
              v35 = 2;
          }
        }
        if (v35 == 2)
        {
          v172 = v7;
          v53 = v8->tterm.ext_Booleans;
          v52 = v8->tterm.ext_Numbers + v53;
          v55 = v52 + v8->tterm.ext_Strings;
          p_num_Strings = &v8->tterm.num_Strings;
        }
        else if (v35 == 1)
        {
          v172 = v7;
          v53 = v8->tterm.ext_Booleans;
          v55 = v8->tterm.ext_Numbers + v53;
          p_num_Strings = &v8->tterm.num_Numbers;
          v52 = v53;
        }
        else
        {
          if (v35)
          {
LABEL_71:
            if (!v5)
              _nc_warning("unknown capability '%s'");
            goto LABEL_158;
          }
          v172 = v7;
          v52 = 0;
          LOWORD(v53) = v8->tterm.ext_Booleans;
          p_num_Strings = &v8->tterm.num_Booleans;
          v55 = (unsigned __int16)v53;
        }
        LODWORD(v62) = *p_num_Strings;
        if (v52 < v55)
        {
          v171 = v53;
          v173 = *p_num_Strings;
          v62 = 0;
          v63 = 0;
          v169 = v52;
          v64 = v52 - (unint64_t)v55;
          v170 = v8->tterm.ext_Names;
          v65 = &v170[v52];
          do
          {
            v66 = strcmp(v65[v62], v34);
            v63 |= v66 == 0;
            if ((v66 & 0x80000000) == 0)
            {
              if (v35)
              {
                LOWORD(v53) = v171;
                v69 = v169;
                v67 = v170;
                if (v35 == 1)
                  v70 = v62 + 39;
                else
                  v70 = v62 + 414;
              }
              else
              {
                v70 = v62 + 44;
                LOWORD(v53) = v171;
                v69 = v169;
                v67 = v170;
              }
              v55 = v69 + v62;
              if ((v63 & 1) != 0)
              {
                v68 = v69 + v62;
                LOWORD(v62) = v70;
                goto LABEL_124;
              }
              LODWORD(v62) = v70;
              goto LABEL_103;
            }
            ++v62;
          }
          while (v64 + v62);
          LODWORD(v62) = v173;
          LOWORD(v53) = v171;
          v67 = v170;
          v68 = v55;
          if ((v63 & 1) != 0)
            goto LABEL_124;
        }
LABEL_103:
        if (v35 == 2)
        {
          ++v8->tterm.ext_Strings;
          v76 = v8->tterm.num_Strings + 1;
          v8->tterm.num_Strings = v76;
          v77 = (char **)_nc_doalloc(v8->tterm.Strings, 8 * v76);
          v8->tterm.Strings = v77;
          if (!v77)
            goto LABEL_339;
          num_Strings = v8->tterm.num_Strings;
          v79 = num_Strings - 1;
          if (num_Strings - 1 > v62)
          {
            v80 = (num_Strings - 2);
            v81 = v79;
            do
            {
              v8->tterm.Strings[v81] = v8->tterm.Strings[v80--];
              --v79;
              --v81;
            }
            while (v62 < v79);
          }
        }
        else if (v35 == 1)
        {
          ++v8->tterm.ext_Numbers;
          v82 = v8->tterm.num_Numbers + 1;
          v8->tterm.num_Numbers = v82;
          v83 = (__int16 *)_nc_doalloc(v8->tterm.Numbers, 2 * v82);
          v8->tterm.Numbers = v83;
          if (!v83)
            goto LABEL_339;
          num_Numbers = v8->tterm.num_Numbers;
          v85 = num_Numbers - 1;
          if (num_Numbers - 1 > v62)
          {
            v86 = &v83[num_Numbers - 2];
            v87 = &v83[v85];
            do
            {
              v88 = *v86--;
              *v87-- = v88;
              --v85;
            }
            while (v62 < v85);
          }
        }
        else
        {
          v8->tterm.ext_Booleans = v53 + 1;
          v71 = v8->tterm.num_Booleans + 1;
          v8->tterm.num_Booleans = v71;
          v72 = (char *)_nc_doalloc(v8->tterm.Booleans, v71);
          v8->tterm.Booleans = v72;
          if (!v72)
            goto LABEL_339;
          num_Booleans = v8->tterm.num_Booleans;
          v74 = (num_Booleans - 1);
          if (v74 > v62)
          {
            v75 = (num_Booleans - 2);
            do
              v8->tterm.Booleans[v74--] = v8->tterm.Booleans[v75--];
            while (v62 < v74);
          }
        }
        v174 = v62;
        v89 = v8->tterm.ext_Booleans;
        v90 = v8->tterm.ext_Numbers;
        v91 = v8->tterm.ext_Strings;
        v92 = v90 + v89 + v91;
        v93 = (char **)_nc_doalloc(v8->tterm.ext_Names, (8 * v92));
        v8->tterm.ext_Names = v93;
        if (!v93)
LABEL_339:
          _nc_err_abort("Out of memory");
        v94 = v92 - 1;
        if (v92 - 1 > v55)
        {
          v95 = (v89 + v90 + v91 - 2);
          v96 = (v92 - 1);
          do
          {
            v8->tterm.ext_Names[v96] = v8->tterm.ext_Names[v95--];
            --v94;
            --v96;
          }
          while (v55 < v94);
        }
        v97 = _nc_save_str(v34);
        v68 = v55;
        v8->tterm.ext_Names[v55] = v97;
        v67 = v8->tterm.ext_Names;
        LOWORD(v62) = v174;
LABEL_124:
        i = (const name_table_entry *)&qword_1EF614C60;
        qword_1EF614C60 = (uint64_t)v67[v68];
        dword_1EF614C68 = v35;
        word_1EF614C6C = v62;
        word_1EF614C6E = -1;
        if (_nc_tracing >= 0x2000)
          _nc_warning("extended capability '%s'", _nc_curr_token.tk_name);
        v7 = v172;
        goto LABEL_127;
      }
      v32 = _nc_curr_token.tk_name;
      p_source = &alias_table->source;
      while (strcmp(from, v32))
      {
        from = p_source[1];
        p_source += 3;
        if (!from)
          goto LABEL_41;
      }
      v56 = *(p_source - 1);
      if (!v56)
      {
        _nc_warning("%s (%s termcap extension) ignored");
        goto LABEL_158;
      }
      v57 = _nc_get_hash_table(1);
      v58 = _nc_find_entry(v56, v57);
      i = v58;
      if (!v58 || v5)
      {
        if (!v58)
          goto LABEL_41;
      }
      else
      {
        _nc_warning("%s (%s termcap extension) aliased to %s");
      }
    }
    else
    {
      v175 = v19;
      v43 = _nc_get_alias_table(0);
      v44 = v43->from;
      v45 = _nc_curr_token.tk_name;
      if (!v43->from)
        goto LABEL_56;
      v46 = &v43->source;
      while (strcmp(v44, v45))
      {
        v44 = v46[1];
        v46 += 3;
        if (!v44)
          goto LABEL_56;
      }
      v59 = *(v46 - 1);
      if (!v59)
      {
        _nc_warning("%s (%s terminfo extension) ignored");
        goto LABEL_158;
      }
      v60 = _nc_get_hash_table(0);
      v61 = _nc_find_entry(v59, v60);
      i = v61;
      if (!v61 || v5)
      {
        if (!v61)
        {
          v45 = _nc_curr_token.tk_name;
LABEL_56:
          v47 = -1;
          do
          {
LABEL_57:
            if (++v47 > 2)
              goto LABEL_41;
            v48 = (const char **)(&off_1E79DC7D8)[v47];
            v49 = *v48;
          }
          while (!*v48);
          v50 = 0;
          v51 = v48 + 1;
          while (strcmp(v49, v45))
          {
            v49 = v51[v50++];
            if (!v49)
              goto LABEL_57;
          }
          for (i = _nc_get_table(0); i->nte_type != v47 || i->nte_index != (_DWORD)v50; ++i)
            ;
        }
      }
      else
      {
        _nc_warning("%s (%s terminfo extension) aliased to %s");
      }
    }
LABEL_127:
    nte_type = i->nte_type;
    if (token == 3)
    {
      if (nte_type == 2)
      {
        v8->tterm.Strings[i->nte_index] = (char *)-1;
        goto LABEL_158;
      }
      if (nte_type == 1)
      {
        v8->tterm.Numbers[i->nte_index] = -2;
        goto LABEL_158;
      }
      if (nte_type)
      {
LABEL_158:
        v19 = v175;
        goto LABEL_159;
      }
      Booleans = v8->tterm.Booleans;
      nte_index = i->nte_index;
      v101 = -2;
LABEL_152:
      Booleans[nte_index] = v101;
      goto LABEL_158;
    }
    if (nte_type == token)
    {
      if (!token)
      {
        Booleans = v8->tterm.Booleans;
        nte_index = i->nte_index;
        v101 = 1;
        goto LABEL_152;
      }
      if (token == 1)
        goto LABEL_147;
      if (token != 2)
      {
        v19 = v175;
        if (!v5)
          _nc_warning("unknown token type");
        if (_nc_syntax == 1)
          v102 = 58;
        else
          v102 = 44;
        _nc_panic_mode(v102);
        goto LABEL_159;
      }
    }
    else if (token)
    {
      if (token != 2)
      {
        if (token != 1 || strcmp("ma", _nc_curr_token.tk_name))
        {
LABEL_156:
          if (!v5)
            _nc_warning("wrong type used for %s capability '%s'");
          goto LABEL_158;
        }
        i = _nc_find_type_entry("ma", 1, _nc_syntax != 0);
LABEL_147:
        v19 = v175;
        if (_nc_curr_token.tk_valnumber < 0x8000)
          v8->tterm.Numbers[i->nte_index] = _nc_curr_token.tk_valnumber;
        else
          v8->tterm.Numbers[i->nte_index] = 0x7FFF;
        goto LABEL_159;
      }
      if (strcmp("MT", _nc_curr_token.tk_name))
        goto LABEL_156;
      i = _nc_find_type_entry("MT", 2, _nc_syntax != 0);
    }
    else if (nte_type != 2)
    {
      goto LABEL_156;
    }
    tk_valstring = _nc_curr_token.tk_valstring;
    if (_nc_syntax == 1)
      tk_valstring = _nc_captoinfo(_nc_curr_token.tk_name, _nc_curr_token.tk_valstring, word_1C05E1568[i->nte_index]);
    v19 = v175;
    v8->tterm.Strings[i->nte_index] = _nc_save_str(tk_valstring);
LABEL_159:
    token = _nc_get_token(v5);
  }
  _nc_push_token(token);
  v104 = _nc_first_name(v8->tterm.term_names);
  _nc_set_type(v104);
  if (v7)
    goto LABEL_166;
  if (_nc_syntax == 1)
  {
    if (strchr(v8->tterm.term_names, 43))
    {
      *(_OWORD *)__s = 0u;
      v178 = 0u;
      goto LABEL_172;
    }
    v123 = v8->nuses;
    if (!(_DWORD)v123)
    {
      *(_OWORD *)__s = 0u;
      v178 = 0u;
      goto LABEL_213;
    }
    v124 = 0;
    p_name = &v8->uses[0].name;
    do
    {
      v126 = *p_name;
      p_name += 3;
      v124 |= strchr(v126, 43) == 0;
      --v123;
    }
    while (v123);
    *(_OWORD *)__s = 0u;
    v178 = 0u;
    if ((v124 & 1) != 0)
    {
LABEL_172:
      v105 = 1;
    }
    else
    {
LABEL_213:
      Strings = v8->tterm.Strings;
      if (!Strings[50])
      {
        v128 = Strings[394];
        if (v128)
        {
          *((_QWORD *)v8->tterm.Strings + 50) = _nc_save_str(v128);
          Strings = v8->tterm.Strings;
        }
      }
      if (!Strings[123])
      {
        v129 = Strings[395];
        if (v129)
        {
          *((_QWORD *)v8->tterm.Strings + 123) = _nc_save_str(v129);
          Strings = v8->tterm.Strings;
        }
      }
      if (!Strings[2])
      {
        if (v8->tterm.Numbers[34] < 1)
        {
          v130 = (const char *)asc_1C05E19B0;
        }
        else
        {
          __sprintf_chk((char *)v180, 0, 0x10AuLL, "%s$<%d>", (const char *)asc_1C05E19B0, *((unsigned __int16 *)v8->tterm.Numbers + 34));
          v130 = (const char *)v180;
        }
        *((_QWORD *)v8->tterm.Strings + 2) = _nc_save_str(v130);
        Strings = v8->tterm.Strings;
      }
      if (!Strings[14])
      {
        if (v8->tterm.Numbers[36] >= 1)
        {
          __sprintf_chk((char *)v180, 0, 0x10AuLL, "%s$<%d>", (const char *)&asc_1C05E19B0[1], *((unsigned __int16 *)v8->tterm.Numbers + 36));
          v154 = (const char *)v180;
          goto LABEL_292;
        }
        if (v8->tterm.Booleans[37] == 1)
        {
          v154 = (const char *)&asc_1C05E19B0[1];
LABEL_292:
          *((_QWORD *)v8->tterm.Strings + 14) = _nc_save_str(v154);
        }
        else
        {
          v162 = Strings[397];
          if ((unint64_t)(v162 + 1) >= 2)
            Strings[14] = v162;
        }
      }
      v155 = v8->tterm.Strings;
      if (!v155[11])
      {
        v160 = v155[396];
        if ((unint64_t)(v160 + 1) >= 2)
        {
          v155[11] = v160;
        }
        else if (v8->tterm.Booleans[41] != 1)
        {
          if (v8->tterm.Numbers[35] < 1)
          {
            v161 = (const char *)&asc_1C05E19B0[2];
          }
          else
          {
            __sprintf_chk((char *)v180, 0, 0x10AuLL, "%s$<%d>", (const char *)&asc_1C05E19B0[2], *((unsigned __int16 *)v8->tterm.Numbers + 35));
            v161 = (const char *)v180;
          }
          *((_QWORD *)v8->tterm.Strings + 11) = _nc_save_str(v161);
        }
      }
      v156 = v8->tterm.Strings;
      if (!v156[129])
      {
        v157 = v8->tterm.Booleans;
        if (v157[38] != 1)
        {
          v158 = v156[396];
          if ((unint64_t)(v158 + 1) >= 2)
          {
            v156[11] = v158;
          }
          else if (v157[41] != 1)
          {
            if (v8->tterm.Numbers[35] < 1)
            {
              v159 = (const char *)&asc_1C05E19B0[2];
            }
            else
            {
              __sprintf_chk((char *)v180, 0, 0x10AuLL, "%s$<%d>", (const char *)&asc_1C05E19B0[2], *((unsigned __int16 *)v8->tterm.Numbers + 35));
              v159 = (const char *)v180;
            }
            *((_QWORD *)v8->tterm.Strings + 129) = _nc_save_str(v159);
          }
        }
      }
      v163 = v8->tterm.Strings;
      if (!v163[103])
      {
        if (v8->tterm.Booleans[41] != 1)
        {
          if ((unint64_t)(v163[2] + 1) < 2)
            goto LABEL_318;
          if ((unint64_t)(v163[129] + 1) >= 2)
          {
            _nc_str_init(__s, v180, 266);
            if (!_nc_safe_strcat((uint64_t)__s, v8->tterm.Strings[2])
              || (_nc_safe_strcat((uint64_t)__s, v8->tterm.Strings[129]) & 1) == 0)
            {
              goto LABEL_318;
            }
          }
          else
          {
            if ((unint64_t)(v163[11] + 1) < 2)
              goto LABEL_318;
            _nc_str_init(__s, v180, 266);
            if (!_nc_safe_strcat((uint64_t)__s, v8->tterm.Strings[2])
              || !_nc_safe_strcat((uint64_t)__s, v8->tterm.Strings[11]))
            {
              goto LABEL_318;
            }
          }
          v164 = (const char *)v180;
          goto LABEL_316;
        }
        v164 = (const char *)&asc_1C05E19B0[2];
        if (v8->tterm.Numbers[35] >= 1)
        {
          v164 = (const char *)v180;
          __sprintf_chk((char *)v180, 0, 0x10AuLL, "%s$<%d>", (const char *)&asc_1C05E19B0[2], *((unsigned __int16 *)v8->tterm.Numbers + 35));
        }
LABEL_316:
        *((_QWORD *)v8->tterm.Strings + 103) = _nc_save_str(v164);
      }
LABEL_318:
      v165 = v8->tterm.Booleans;
      if (v165[43] == 1 || v165[39] == 1)
        *((_QWORD *)v8->tterm.Strings + 2) = 0;
      Numbers = v8->tterm.Numbers;
      if (!*((_QWORD *)v8->tterm.Strings + 134))
      {
        v167 = Numbers[37];
        v168 = (const char *)&asc_1C05E19B0[3];
        if (v167 >= 1)
        {
          v168 = (const char *)v180;
          __sprintf_chk((char *)v180, 0, 0x10AuLL, "%s$<%d>", (const char *)&asc_1C05E19B0[3], (unsigned __int16)v167);
        }
        *((_QWORD *)v8->tterm.Strings + 134) = _nc_save_str(v168);
        Numbers = v8->tterm.Numbers;
      }
      if (Numbers[1] == -1 && v8->tterm.Booleans[42] == 1)
        Numbers[1] = 8;
      v105 = 0;
      if (!*((_QWORD *)v8->tterm.Strings + 1))
        *((_QWORD *)v8->tterm.Strings + 1) = _nc_save_str("\a");
    }
    if (v8->tterm.Booleans[42] == 1)
    {
      v106 = v8->tterm.Numbers;
      v107 = (unsigned __int16)v106[1];
      if (v107 != 8 && v107 != 0xFFFF)
      {
        _nc_warning("hardware tabs with a width other than 8: %d");
        goto LABEL_224;
      }
      v109 = v8->tterm.Strings;
      v110 = v109[134];
      if (v110)
      {
        if (_nc_capcmp(v109[134], (const char *)&asc_1C05E19B0[3]))
        {
          _nc_visbuf(v110);
          _nc_warning("hardware tabs with a non-^I tab string %s");
          goto LABEL_224;
        }
      }
      else
      {
        *((_QWORD *)v8->tterm.Strings + 134) = _nc_save_str((const char *const)&asc_1C05E19B0[3]);
        v106 = v8->tterm.Numbers;
      }
      v106[1] = 8;
    }
LABEL_224:
    v131 = (char *)*((_QWORD *)v8->tterm.Strings + 398);
    if ((unint64_t)(v131 + 1) < 2)
    {
LABEL_225:
      if ((v105 & 1) == 0 && !v8->tterm.Booleans[7])
      {
        v132 = v8->tterm.Strings;
        if (!v132[55])
        {
          *((_QWORD *)v8->tterm.Strings + 55) = _nc_save_str((const char *const)&asc_1C05E19B0[1]);
          v132 = v8->tterm.Strings;
        }
        if (!v132[79])
        {
          *((_QWORD *)v8->tterm.Strings + 79) = _nc_save_str((const char *const)&asc_1C05E19B0[1]);
          v132 = v8->tterm.Strings;
        }
        if (!v132[61])
          *((_QWORD *)v8->tterm.Strings + 61) = _nc_save_str((const char *const)&asc_1C05E19B0[2]);
      }
      v133 = v8->tterm.Strings;
      if ((unint64_t)(v133[400] + 1) > 1
        || (unint64_t)(v133[401] + 1) > 1
        || (unint64_t)(v133[402] + 1) > 1
        || (unint64_t)(v133[403] + 1) > 1
        || (unint64_t)(v133[404] + 1) > 1
        || (unint64_t)(v133[405] + 1) > 1
        || (unint64_t)(v133[406] + 1) > 1
        || (unint64_t)(v133[407] + 1) > 1
        || (unint64_t)(v133[408] + 1) > 1
        || (unint64_t)(v133[409] + 1) > 1
        || (unint64_t)(v133[410] + 1) >= 2)
      {
        _nc_str_init(__s, v179, 1023);
        _nc_safe_strcat((uint64_t)__s, v8->tterm.Strings[146]);
        sub_1C05D0B08((size_t)__s, 106, v8->tterm.Strings[403]);
        sub_1C05D0B08((size_t)__s, 107, v8->tterm.Strings[402]);
        sub_1C05D0B08((size_t)__s, 108, v8->tterm.Strings[400]);
        sub_1C05D0B08((size_t)__s, 109, v8->tterm.Strings[401]);
        sub_1C05D0B08((size_t)__s, 110, v8->tterm.Strings[410]);
        sub_1C05D0B08((size_t)__s, 113, v8->tterm.Strings[408]);
        sub_1C05D0B08((size_t)__s, 116, v8->tterm.Strings[404]);
        sub_1C05D0B08((size_t)__s, 117, v8->tterm.Strings[405]);
        sub_1C05D0B08((size_t)__s, 118, v8->tterm.Strings[406]);
        sub_1C05D0B08((size_t)__s, 119, v8->tterm.Strings[407]);
        sub_1C05D0B08((size_t)__s, 120, v8->tterm.Strings[409]);
        if (v179[0])
        {
          *((_QWORD *)v8->tterm.Strings + 146) = _nc_save_str(v179);
          _nc_warning("acsc string synthesized from XENIX capabilities");
        }
      }
      else if (!v133[146] && v133[25] && v133[38])
      {
      }
      goto LABEL_166;
    }
    v134 = strchr(v8->tterm.Strings[398], 105);
    if (v134)
      v176 = v134[1] == 109;
    else
      v176 = 0;
    v135 = strchr(v131, 44);
    if (!v135)
    {
LABEL_281:
      if (v176)
      {
        v152 = v8->tterm.Strings;
        if (!v152[77])
        {
          v153 = v152[200];
          if (v153)
          {
            v152[77] = v153;
            *((_QWORD *)v8->tterm.Strings + 200) = 0;
          }
        }
      }
      goto LABEL_225;
    }
    v136 = v135;
    while (2)
    {
      v137 = 0;
      while ((_DWORD)v136 - (_DWORD)v131 != strlen(&aAl_1[v137])
           || strncmp(&aAl_1[v137], v131, ((_DWORD)v136 - (_DWORD)v131)))
      {
        v137 += 9;
        if (v137 == 171)
        {
          goto LABEL_260;
        }
      }
      v138 = &aAl_1[v137 + 3];
      if (!*v138)
      {
LABEL_260:
        v131 = v136 + 1;
        v136 = strchr(v136 + 1, 44);
        if (!v136)
          goto LABEL_281;
        continue;
      }
      break;
    }
    v139 = _nc_get_hash_table(1);
    v140 = _nc_find_entry(&aAl_1[v137], v139);
    v141 = _nc_get_hash_table(0);
    v142 = _nc_find_entry(v138, v141);
    if (!v140 || (v143 = v142) == 0)
      _nc_err_abort("ko translation table is invalid, I give up");
    v144 = v8->tterm.Strings;
    v145 = v144[v140->nte_index];
    if (!v145)
    {
      _nc_warning("no value for ko capability %s");
      goto LABEL_260;
    }
    v146 = v143->nte_index;
    v147 = v144[v146];
    if (v147)
    {
      if (strcmp(v145, v144[v146]))
      {
        _nc_visbuf(v147);
        _nc_warning("%s (%s) already has an explicit value %s, ignoring ko");
      }
      goto LABEL_260;
    }
    v148 = v179;
    while (2)
    {
      v149 = *(unsigned __int8 *)v145;
      if (v149 == 36)
      {
        if (v145[1] != 60)
          goto LABEL_279;
        for (j = 36; j && j != 62; j = v151)
          v151 = *++v145;
      }
      else
      {
        if (!*v145)
        {
          *v148 = 0;
          v8->tterm.Strings[v143->nte_index] = _nc_save_str(v179);
          goto LABEL_260;
        }
LABEL_279:
        *v148++ = v149;
      }
      ++v145;
      continue;
    }
  }
  if ((unint64_t)(*((_QWORD *)v8->tterm.Strings + 413) + 1) >= 2)
  {
    memset(v180, 0, 32);
    _nc_str_init(v180, v179, 1023);
    _nc_safe_strcat((uint64_t)v180, v8->tterm.Strings[146]);
    v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    v112 = *v111;
    if (*v111)
    {
      __s[0] = 108;
      __s[1] = v112;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v113 = v111[1];
    if (v113)
    {
      __s[0] = 113;
      __s[1] = v113;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v114 = v111[2];
    if (v114)
    {
      __s[0] = 107;
      __s[1] = v114;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v115 = v111[3];
    if (v115)
    {
      __s[0] = 120;
      __s[1] = v115;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v116 = v111[4];
    if (v116)
    {
      __s[0] = 106;
      __s[1] = v116;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v117 = v111[5];
    if (v117)
    {
      __s[0] = 109;
      __s[1] = v117;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v118 = v111[6];
    if (v118)
    {
      __s[0] = 119;
      __s[1] = v118;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v119 = v111[7];
    if (v119)
    {
      __s[0] = 117;
      __s[1] = v119;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v120 = v111[8];
    if (v120)
    {
      __s[0] = 118;
      __s[1] = v120;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v121 = v111[9];
    if (v121)
    {
      __s[0] = 116;
      __s[1] = v121;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
      v111 = (char *)*((_QWORD *)v8->tterm.Strings + 413);
    }
    v122 = v111[10];
    if (v122)
    {
      __s[0] = 110;
      __s[1] = v122;
      __s[2] = 0;
      _nc_safe_strcat((uint64_t)v180, __s);
    }
    if (v179[0])
    {
      *((_QWORD *)v8->tterm.Strings + 146) = _nc_save_str(v179);
      _nc_warning("acsc string synthesized from AIX capabilities");
      *((_QWORD *)v8->tterm.Strings + 413) = 0;
    }
  }
LABEL_166:
  _nc_wrap_entry(v8, 0);
  return 0;
}

int _nc_capcmp(const char *a1, const char *a2)
{
  _BOOL4 v2;
  int v4;
  unsigned int v5;
  int v7;
  unsigned int v8;

  v2 = (unint64_t)(a1 + 1) > 1;
  if ((unint64_t)(a1 + 1) <= 1 && (unint64_t)(a2 + 1) < 2)
    return 0;
  if ((unint64_t)(a2 + 1) <= 1)
    v2 = 0;
  if (!v2)
    return 1;
  while (1)
  {
    v4 = *(unsigned __int8 *)a1;
    if (v4 == 36)
    {
      if (a1[1] == 60)
      {
        for (a1 += 2; ; ++a1)
        {
          LOBYTE(v4) = *a1;
          v5 = *(unsigned __int8 *)a1;
          if (v5 - 48 >= 0xA && (v5 > 0x3E || ((1 << v4) & 0x4000C40000000000) == 0))
            break;
        }
      }
      else
      {
        LOBYTE(v4) = 36;
      }
    }
    v7 = *(unsigned __int8 *)a2;
    if (v7 == 36)
    {
      if (a2[1] != 60)
      {
        LOBYTE(v7) = 36;
        goto LABEL_29;
      }
      for (a2 += 2; ; ++a2)
      {
        LOBYTE(v7) = *a2;
        v8 = *(unsigned __int8 *)a2;
        if (v8 - 48 >= 0xA && (v8 > 0x3E || ((1 << v7) & 0x4000C40000000000) == 0))
          break;
      }
    }
    if (!(v4 | v7))
      return 0;
LABEL_29:
    if (v4 != v7)
      return (char)v7 - (char)v4;
    ++a1;
    ++a2;
  }
}

size_t sub_1C05D0B08(size_t result, char a2, char *__s)
{
  uint64_t v5;
  char v6;
  char __sa[3];

  if (__s)
  {
    v5 = result;
    result = strlen(__s);
    if (result == 1)
    {
      v6 = *__s;
      if (*__s)
      {
        __sa[0] = a2;
        __sa[1] = v6;
        __sa[2] = 0;
        return _nc_safe_strcat(v5, __sa);
      }
    }
  }
  return result;
}

void _nc_init_termtype(TERMTYPE *const a1)
{
  char *v2;
  __int16 *v3;
  char **v4;
  unint64_t v5;
  unint64_t v6;
  __int16 *Numbers;
  unint64_t v8;
  uint64_t v9;

  *(_QWORD *)&a1->num_Booleans = 0x19E0027002CLL;
  *(_DWORD *)&a1->ext_Numbers = 0;
  if (!a1->Booleans && (v2 = (char *)malloc(0x2CuLL), (a1->Booleans = v2) == 0)
    || !a1->Numbers && (v3 = (__int16 *)malloc(0x4EuLL), (a1->Numbers = v3) == 0)
    || !a1->Strings && (v4 = (char **)malloc(0xCF0uLL), (a1->Strings = v4) == 0))
  {
    _nc_err_abort("Out of memory");
  }
  v5 = 0;
  do
    a1->Booleans[v5++] = 0;
  while (v5 < a1->num_Booleans);
  if (a1->num_Numbers)
  {
    v6 = 0;
    Numbers = a1->Numbers;
    do
      Numbers[v6++] = -1;
    while (v6 < a1->num_Numbers);
  }
  if (a1->num_Strings)
  {
    v8 = 0;
    v9 = 8 * a1->num_Strings;
    do
    {
      a1->Strings[v8 / 8] = 0;
      v8 += 8;
    }
    while (v9 != v8);
  }
}

int _nc_read_termtype(TERMTYPE *a1, char *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  size_t v15;
  char *v16;
  unsigned int v17;
  size_t v18;
  int v19;
  size_t v20;
  int v21;
  unsigned int v22;
  size_t v23;
  size_t v24;
  __int16 *v25;
  int v26;
  int v27;
  size_t v28;
  uint64_t v29;
  int v30;
  int v31;
  char *v32;
  int v33;
  size_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  size_t v50;
  unsigned __int8 *v51;
  unint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  size_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  unint64_t v66;
  int v68;
  __int16 v69;
  int v70;
  int __count;
  size_t __counta;
  int v73;
  __int16 v74;
  unsigned __int8 v75;
  unsigned __int8 v76;
  unsigned __int8 v77;
  unsigned __int8 v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  uint64_t v85;

  v3 = MEMORY[0x1E0C80A78](a1, a2, *(_QWORD *)&a3);
  v85 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(v3 + 64) = 0;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  if (v5 < 1)
    goto LABEL_128;
  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = v5 >= 12 ? 12 : v5;
  __memcpy_chk();
  if (v6 < 0xC || v74 != 282)
    goto LABEL_128;
  LODWORD(v10) = 0;
  v11 = (__int16)(v76 << 8) | v75;
  if ((v11 & 0x80000000) != 0)
    return (int)v10;
  v12 = (__int16)(v78 << 8) | (unint64_t)v77;
  if ((v12 & 0x80000000) != 0)
    return (int)v10;
  if (((__int16)(v80 << 8) | v79) < 0)
    return (int)v10;
  v13 = (__int16)(v82 << 8) | v81;
  if ((v13 & 0x80000000) != 0)
    return (int)v10;
  v14 = (__int16)(v84 << 8) | v83;
  if (v14 < 0)
    return (int)v10;
  v15 = v11 + v14 + 1;
  if (v14)
  {
    if (v13 > 0x7FF)
      goto LABEL_128;
    v10 = (char *)malloc(v15);
    if (!v10)
      return (int)v10;
    v16 = v10;
  }
  else
  {
    v16 = (char *)malloc(v15);
    v13 = 0;
    LODWORD(v10) = 0;
    if (!v16)
      return (int)v10;
  }
  v70 = v13;
  v73 = (__int16)(v80 << 8) | v79;
  if (v11 >= 0x200)
    v17 = 512;
  else
    v17 = (__int16)(v76 << 8) | v75;
  *(_QWORD *)v8 = v16;
  *(_QWORD *)(v8 + 8) = v16;
  if (v6 >= 13)
  {
    if (v6 - (int)v9 >= (int)v17)
      v18 = v17;
    else
      v18 = (v6 - v9);
    memcpy(v16, (const void *)(v7 + v9), v18);
    v19 = v18 + v9;
  }
  else
  {
    LODWORD(v18) = 0;
    v19 = 12;
  }
  if (v17 != (_DWORD)v18)
    bzero(&v16[v18], v17 - v18);
  v16[v17] = 0;
  if ((int)v12 <= 44)
    v20 = 44;
  else
    v20 = v12;
  v10 = (char *)calloc(v20, 1uLL);
  *(_QWORD *)(v8 + 16) = v10;
  if (v10)
  {
    v21 = v6 - v19;
    v22 = v19;
    if (v6 - v19 < 1)
    {
      __count = v19;
      LODWORD(v23) = 0;
    }
    else
    {
      if (v21 >= (int)v12)
        v23 = v12;
      else
        v23 = v21;
      memcpy(v10, (const void *)(v7 + v22), v23);
      __count = v23 + v22;
    }
    if ((int)v23 < (int)v12)
      goto LABEL_128;
    if ((((_DWORD)v12 + v11) & 1) != 0 && __count < v6)
      LOBYTE(v74) = *(_BYTE *)(v7 + __count++);
    v24 = v73 <= 39 ? 39 : v73;
    v10 = (char *)calloc(v24, 2uLL);
    *(_QWORD *)(v8 + 24) = v10;
    if (v10)
    {
      v25 = (__int16 *)v10;
      v26 = 2 * v73;
      if (v6 - __count < 1)
      {
        v27 = 0;
      }
      else
      {
        if (v6 - __count >= v26)
          v27 = 2 * v73;
        else
          v27 = v6 - __count;
        __memcpy_chk();
        v26 = 2 * v73;
        __count += v27;
      }
      if (v27 != v26)
        goto LABEL_128;
      sub_1C05D14C4((uint64_t)&v74, v25, v73);
      if (v70 <= 414)
        v28 = 414;
      else
        v28 = v70;
      v10 = (char *)calloc(v28, 8uLL);
      *(_QWORD *)(v8 + 32) = v10;
      if (!v10)
        return (int)v10;
      v69 = v28;
      if (v70)
      {
        v29 = (uint64_t)v10;
        v30 = 2 * v70;
        if (v6 - __count < 1)
        {
          v31 = 0;
        }
        else
        {
          if (v6 - __count >= v30)
            v31 = 2 * v70;
          else
            v31 = v6 - __count;
          __memcpy_chk();
          v30 = 2 * v70;
          __count += v31;
        }
        if (v31 != v30)
          goto LABEL_128;
        v32 = &v16[v17 + 1];
        v33 = v6 - __count;
        if (v6 - __count < 1)
        {
          LODWORD(v34) = 0;
        }
        else
        {
          v34 = v33 >= v14 ? v14 : v33;
          memcpy(v32, (const void *)(v7 + __count), v34);
          __count += v34;
        }
        if ((_DWORD)v34 != v14)
          goto LABEL_128;
        sub_1C05D152C((uint64_t)&v74, v29, v70, v14, (uint64_t)v32);
      }
      v35 = __count;
      *(_DWORD *)(v8 + 56) = 2555948;
      *(_WORD *)(v8 + 60) = v69;
      v36 = v73;
      if ((v14 & 1) != 0 && __count < v6)
      {
        LOBYTE(v74) = *(_BYTE *)(v7 + __count);
        v35 = __count + 1;
      }
      if (_nc_user_definable)
      {
        v37 = v6 - v35;
        if (v6 - v35 >= 1)
        {
          v38 = v37 >= 10 ? 10 : v6 - v35;
          __memcpy_chk();
          if (v37 >= 0xA)
          {
            v39 = (__int16)(HIBYTE(v74) << 8) | v74;
            if (v39 <= 0)
            {
              v51 = &v76;
              v52 = -1;
              while (v52 != 3)
              {
                v53 = *(__int16 *)(v51 - 1);
                ++v52;
                v51 += 2;
                if (v53 >= 1)
                {
                  if (v52 <= 3)
                    goto LABEL_83;
                  break;
                }
              }
            }
            else
            {
LABEL_83:
              LODWORD(v10) = 0;
              v40 = (__int16)(v76 << 8) | v75;
              v41 = (__int16)(v78 << 8) | v77;
              if ((v40 + v39 + v41) > 0x7FF)
                return (int)v10;
              if ((__int16)(v79 | (v80 << 8)) > 4095)
                return (int)v10;
              v42 = (__int16)(v82 << 8) | v81;
              if (v42 > 4095)
                return (int)v10;
              if (v39 < 0)
                return (int)v10;
              if (v40 < 0)
                return (int)v10;
              if ((v41 & 0x80000000) != 0)
                return (int)v10;
              if ((__int16)(v80 << 8) < 0)
                return (int)v10;
              __counta = (v40 + v39 + v41);
              v68 = (__int16)(v82 << 8) | v81;
              if (v42 < 0)
                return (int)v10;
              v43 = v35;
              *(_WORD *)(v8 + 56) = v39 + 44;
              *(_WORD *)(v8 + 58) = v40 + 39;
              v44 = v41;
              *(_WORD *)(v8 + 60) = v41 + v69;
              v45 = _nc_doalloc(*(void **)(v8 + 16), (unsigned __int16)(v39 + 44));
              *(_QWORD *)(v8 + 16) = v45;
              if (!v45
                || (v46 = _nc_doalloc(*(void **)(v8 + 24), 2 * *(unsigned __int16 *)(v8 + 58)),
                    (*(_QWORD *)(v8 + 24) = v46) == 0)
                || (v47 = _nc_doalloc(*(void **)(v8 + 32), 8 * *(unsigned __int16 *)(v8 + 60)),
                    (*(_QWORD *)(v8 + 32) = v47) == 0))
              {
                _nc_err_abort("Out of memory");
              }
              v48 = v38 + (uint64_t)v43;
              *(_WORD *)(v8 + 62) = v39;
              if (v39)
              {
                v49 = v6 - v48;
                if (v6 - (int)v48 < 1)
                {
                  LODWORD(v50) = 0;
                }
                else
                {
                  if (v49 >= v39)
                    v50 = v39;
                  else
                    v50 = v49;
                  memcpy((void *)(*(_QWORD *)(v8 + 16) + 44), (const void *)(v7 + v48), v50);
                  LODWORD(v48) = v50 + v48;
                }
                if ((_DWORD)v50 != v39)
                  goto LABEL_128;
                if ((v39 & 1) != 0 && (int)v48 < v6)
                {
                  LOBYTE(v74) = *(_BYTE *)(v7 + (int)v48);
                  LODWORD(v48) = v48 + 1;
                }
              }
              *(_WORD *)(v8 + 64) = v40;
              if (v40)
              {
                v56 = 2 * v40;
                if (v6 - (int)v48 < 1)
                {
                  v57 = 0;
                }
                else
                {
                  if (v6 - (int)v48 >= v56)
                    v57 = 2 * v40;
                  else
                    v57 = v6 - v48;
                  __memcpy_chk();
                  LODWORD(v48) = v57 + v48;
                }
                if (v57 != v56)
                  goto LABEL_128;
                sub_1C05D14C4((uint64_t)&v74, (__int16 *)(*(_QWORD *)(v8 + 24) + 78), v40);
              }
              if ((__counta + v44) > 0x7FF)
                goto LABEL_128;
              if ((_DWORD)v44 || (_DWORD)__counta)
              {
                v58 = 2 * (__counta + v44);
                if (v6 - (int)v48 < 1)
                {
                  v59 = 0;
                }
                else
                {
                  v59 = v6 - (int)v48 >= v58 ? 2 * (__counta + v44) : v6 - (int)v48;
                  __memcpy_chk();
                  LODWORD(v48) = v59 + v48;
                }
                if (v59 != v58)
                  goto LABEL_128;
              }
              if (v68)
              {
                v10 = (char *)malloc((unsigned __int16)v68);
                *(_QWORD *)(v8 + 40) = v10;
                if (!v10)
                  return (int)v10;
                v60 = v6 - v48;
                if (v6 - (int)v48 < 1)
                {
                  LODWORD(v61) = 0;
                }
                else
                {
                  v61 = v60 >= v68 ? v68 : v60;
                  memcpy(v10, (const void *)(v7 + (int)v48), v61);
                }
                if ((_DWORD)v61 != v68)
                  goto LABEL_128;
              }
              *(_WORD *)(v8 + 66) = v44;
              if ((_DWORD)v44)
              {
                sub_1C05D152C((uint64_t)&v74, *(_QWORD *)(v8 + 32) + 8 * v70, v44, v68, *(_QWORD *)(v8 + 40));
                v62 = 0;
                v63 = *(_QWORD *)(v8 + 32);
                v64 = v44 + 413;
                do
                {
                  *(_QWORD *)(v63 + 8 * v64) = *(_QWORD *)(v63 + 8 * (v70 - 1 + v64 - 413));
                  v63 = *(_QWORD *)(v8 + 32);
                  v65 = *(const char **)(v63 + 8 * v64);
                  if ((unint64_t)(v65 + 1) >= 2)
                    v62 += strlen(v65) + 1;
                  v66 = v64 - 413;
                  --v64;
                }
                while (v66 > 1);
                if ((int)v44 <= 2047)
                  goto LABEL_157;
LABEL_128:
                LODWORD(v10) = 0;
                return (int)v10;
              }
              v36 = v73;
              if ((_DWORD)__counta)
              {
                v62 = 0;
LABEL_157:
                v10 = (char *)calloc(__counta, 8uLL);
                *(_QWORD *)(v8 + 48) = v10;
                if (!v10)
                  return (int)v10;
                sub_1C05D152C((uint64_t)(&v74 + (int)v44), (uint64_t)v10, __counta, v68, *(_QWORD *)(v8 + 40) + v62);
                v36 = v73;
              }
            }
          }
        }
      }
      if ((int)v12 <= 43)
      {
        do
          *(_BYTE *)(*(_QWORD *)(v8 + 16) + v12++) = 0;
        while (v12 != 44);
      }
      if (v36 <= 38)
        memset((void *)(*(_QWORD *)(v8 + 24) + 2 * v36), 255, 2 * (38 - v36) + 2);
      if (v70 > 413)
      {
        LODWORD(v10) = 1;
      }
      else
      {
        v54 = v70 - 1;
        v55 = 8 * v70;
        LODWORD(v10) = 1;
        do
        {
          *(_QWORD *)(*(_QWORD *)(v8 + 32) + v55) = 0;
          ++v54;
          v55 += 8;
        }
        while (v54 < 413);
      }
    }
  }
  return (int)v10;
}

uint64_t sub_1C05D14C4(uint64_t result, __int16 *a2, int a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  int v6;
  __int16 v7;

  if (a3 >= 1)
  {
    v3 = a3;
    v4 = (unsigned __int8 *)(result + 1);
    do
    {
      v5 = *(v4 - 1);
      if (v5 == 254)
      {
        v6 = *v4;
        if (v6 != 255)
          goto LABEL_10;
        v7 = -2;
      }
      else
      {
        if (v5 != 255)
        {
          LOWORD(v6) = *v4;
LABEL_10:
          v7 = v5 | ((_WORD)v6 << 8);
          goto LABEL_11;
        }
        v6 = *v4;
        if (v6 != 255)
          goto LABEL_10;
        v7 = -1;
      }
LABEL_11:
      *a2++ = v7;
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

void sub_1C05D152C(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  unint64_t v16;
  int v17;

  if (a3 >= 1)
  {
    v9 = 0;
    v10 = 0;
    v11 = a5 + a4;
    v12 = a3;
    while (1)
    {
      v13 = (unsigned __int8 *)(a1 + 2 * v9);
      v14 = *v13;
      if (v14 != 254)
        break;
      v15 = v13[1];
      if (v15 != 255)
        goto LABEL_10;
      v16 = -1;
LABEL_17:
      *(_QWORD *)(a2 + 8 * v9) = v16;
      if (v16 + 1 >= 2)
      {
        while (v16 <= v11)
        {
          if (!*(_BYTE *)v16)
            goto LABEL_24;
          ++v16;
        }
        *(_QWORD *)(a2 + 8 * v9) = 0;
      }
LABEL_24:
      if (++v9 == v12)
        return;
    }
    if (v14 == 255)
    {
      v15 = v13[1];
      if (v15 == 255)
      {
LABEL_11:
        v16 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v15 = v13[1];
    }
LABEL_10:
    v17 = v14 | (v15 << 8);
    if (a4 >= (__int16)v17)
    {
      if (v17 >= a4)
      {
        if ((v10 & 1) == 0)
          _nc_warning("corrupt data found in convert_strings");
        v16 = 0;
        v10 = 1;
      }
      else
      {
        v16 = a5 + v17;
      }
      goto LABEL_17;
    }
    goto LABEL_11;
  }
}

int _nc_read_file_entry(const char *const a1, TERMTYPE *a2)
{
  const char *v2;
  TERMTYPE *v3;
  TERMTYPE *v4;
  const char *v5;
  FILE *v6;
  FILE *v7;
  int v8;
  int v9;
  char __ptr[4097];
  uint64_t v12;

  v2 = (const char *)((uint64_t (*)(const char *const, TERMTYPE *))MEMORY[0x1E0C80A78])(a1, a2);
  v4 = v3;
  v5 = v2;
  v12 = *MEMORY[0x1E0C80C00];
  if ((_nc_access(v2, 4) & 0x80000000) == 0)
  {
    v6 = fopen(v5, "rb");
    if (v6)
    {
      v7 = v6;
      v8 = fread(__ptr, 1uLL, 0x1001uLL, v6);
      if (v8 >= 1)
      {
        if (_nc_read_termtype(v4, __ptr, v8))
        {
          v9 = 1;
LABEL_9:
          fclose(v7);
          return v9;
        }
        _nc_free_termtype(v4);
      }
      v9 = 0;
      goto LABEL_9;
    }
  }
  return 0;
}

uint64_t _nc_read_termcap_entry(const char *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  const char **v12;
  const char *v13;
  FILE *v14;
  FILE *v15;
  _ENTRY *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21[1024];
  char __s[1024];
  uint64_t v23;
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
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
  v39 = 0;
  v23 = 0;
  v4 = getenv("TERMCAP");
  if (v4)
  {
    v5 = v4;
    if (_nc_is_abs_path(v4))
    {
      LODWORD(v6) = sub_1C05D1A74((uint64_t)&v23, v5, 0);
      v7 = 0;
      goto LABEL_20;
    }
    if (_nc_name_match(v5, a1, "|:"))
    {
      __sprintf_chk(__s, 0, 0x400uLL, "%.*s\n", 1022, v5);
      _nc_set_source("TERMCAP");
      _nc_read_entry_source(0, __s, 0, 0, 0);
      goto LABEL_28;
    }
  }
  v8 = getenv("TERMPATH");
  if (!v8)
    v8 = "/etc/termcap:/usr/share/misc/termcap";
  v7 = strdup(v8);
  v9 = 0;
  v6 = 0;
  while (1)
  {
    if (v7[v9] == 58)
    {
      v7[v9] = 0;
      goto LABEL_15;
    }
    if (!v7[v9])
      break;
    if (!v9 || !v7[v9 - 1])
      v6 = sub_1C05D1A74((uint64_t)&v23, &v7[v9], v6);
LABEL_15:
    ++v9;
  }
  v10 = getenv("HOME");
  if (v10 && *v10 && strlen(v10) + 12 <= 0x3FF)
  {
    __strcpy_chk();
    __sprintf_chk(__s, 0, 0x400uLL, "%s/.termcap", v21);
    LODWORD(v6) = sub_1C05D1A74((uint64_t)&v23, __s, v6);
  }
LABEL_20:
  if ((int)v6 >= 1)
  {
    v11 = v6;
    v12 = (const char **)&v23;
    do
    {
      v13 = *v12;
      if (!_nc_access(*v12, 4))
      {
        v14 = fopen(v13, "r");
        if (v14)
        {
          v15 = v14;
          _nc_set_source(v13);
          _nc_read_entry_source(v15, 0, 0, 1, 0);
          fclose(v15);
        }
      }
      ++v12;
      --v11;
    }
    while (v11);
  }
  if (v7)
    free(v7);
LABEL_28:
  if (!_nc_head)
    return 0xFFFFFFFFLL;
  _nc_resolve_uses2(1, 0);
  v16 = _nc_head;
  if (!_nc_head)
    return 0;
  while (!_nc_name_match(v16->tterm.term_names, a1, "|:"))
  {
    v16 = v16->next;
    if (!v16)
      return 0;
  }
  *(_OWORD *)a2 = *(_OWORD *)&v16->tterm.term_names;
  v18 = *(_OWORD *)&v16->tterm.Booleans;
  v19 = *(_OWORD *)&v16->tterm.Strings;
  v20 = *(_OWORD *)&v16->tterm.ext_Names;
  *(_QWORD *)(a2 + 64) = *(_QWORD *)&v16->tterm.ext_Numbers;
  *(_OWORD *)(a2 + 32) = v19;
  *(_OWORD *)(a2 + 48) = v20;
  *(_OWORD *)(a2 + 16) = v18;
  _nc_free_entry(_nc_head, v16);
  return 1;
}

uint64_t sub_1C05D1A74(uint64_t a1, char *__s, uint64_t a3)
{
  char *v6;
  char *v7;

  v6 = strchr(__s, 58);
  v7 = v6;
  if (v6)
    *v6 = 0;
  if ((int)a3 <= 31 && !_nc_access(__s, 4))
  {
    *(_QWORD *)(a1 + 8 * (int)a3) = __s;
    a3 = (a3 + 1);
  }
  *(_QWORD *)(a1 + 8 * (int)a3) = 0;
  if (v7)
    *v7 = 58;
  return a3;
}

BOOL is_term_resized(int a1, int a2)
{
  BOOL result;

  result = 0;
  if (a1 >= 1 && a2 >= 1)
    return *(__int16 *)(SP + 128) != a1 || *(__int16 *)(SP + 130) != a2;
  return result;
}

int resize_term(int a1, int a2)
{
  int result;
  int v5;
  int v6;
  int v7;
  int v8;
  int v10;
  int v11;
  int v12;
  int v13;
  int v15;
  uint64_t *v16;
  char v17;
  int v18;
  char *v19;
  char *v20;
  uint64_t v21;
  __int16 *Numbers;
  void *v23;
  void *v24;

  result = -1;
  if (a2 >= 1 && a1 >= 1 && SP)
  {
    v5 = *(__int16 *)(SP + 128);
    v6 = *(__int16 *)(SP + 132);
    v7 = v5 - v6;
    v8 = *(__int16 *)(SP + 130);
    if (v5 == a1 && v8 == a2)
    {
      v13 = a1 - v7;
    }
    else
    {
      dword_1EF614C70 = *(__int16 *)(SP + 128);
      dword_1EF614C74 = v8;
      v10 = v8;
      if (v5 < a1)
      {
        v11 = sub_1C05D1D24(a1, v8, v5 - v6);
        dword_1EF614C70 = a1;
        dword_1EF614C74 = v8;
        if (v11)
          return -1;
        v10 = *(__int16 *)(SP + 130);
        v5 = a1;
      }
      if (v10 < a2)
      {
        v12 = sub_1C05D1D24(v5, a2, v7);
        dword_1EF614C70 = v5;
        dword_1EF614C74 = a2;
        v8 = a2;
        if (v12)
          return -1;
      }
      if (v5 > a1 || v8 > a2)
      {
        v15 = 0;
        do
        {
          v16 = *(uint64_t **)&PC[464];
          if (!*(_QWORD *)&PC[464])
            break;
          v17 = 0;
          do
          {
            if ((*((_WORD *)v16 + 14) & 0x10) == 0)
            {
              v18 = 0;
              v19 = (char *)(v16 + 2);
LABEL_26:
              v20 = &PC[464];
              while (1)
              {
                v20 = *(char **)v20;
                if (!v20)
                  break;
                if (*((char **)v20 + 10) == v19)
                {
                  v19 = v20 + 16;
                  ++v18;
                  goto LABEL_26;
                }
              }
              if (v18 == v15)
              {
                if (sub_1C05D1F20((uint64_t)(v16 + 2), a1, a2, v7))
                  return -1;
                v17 = 1;
              }
            }
            v16 = (uint64_t *)*v16;
          }
          while (v16);
          ++v15;
        }
        while ((v17 & 1) != 0);
      }
      v21 = SP;
      *(_WORD *)(SP + 128) = a1;
      *(_WORD *)(v21 + 130) = a2;
      Numbers = cur_term->type.Numbers;
      Numbers[2] = a1;
      *Numbers = a2;
      v13 = a1 - v7;
      *(_WORD *)(v21 + 132) = v13;
      v23 = *(void **)(v21 + 1400);
      if (v23)
      {
        free(v23);
        v21 = SP;
        *(_QWORD *)(SP + 1400) = 0;
      }
      v24 = *(void **)(v21 + 1408);
      if (v24)
      {
        free(v24);
        *(_QWORD *)(SP + 1408) = 0;
      }
    }
    result = 0;
    LINES = v13;
    COLS = a2;
  }
  return result;
}

uint64_t sub_1C05D1D24(int a1, int a2, int a3)
{
  int v6;
  uint64_t *v7;
  char v8;
  int v9;
  uint64_t *v10;

  v6 = 1;
  while (2)
  {
    v7 = *(uint64_t **)&PC[464];
    if (*(_QWORD *)&PC[464])
    {
      v8 = 0;
      do
      {
        if ((*((_WORD *)v7 + 14) & 0x10) == 0)
        {
          v9 = v6;
          v10 = v7 + 2;
          do
          {
            v10 = (uint64_t *)v10[8];
            --v9;
          }
          while (v10);
          if (!v9)
          {
            if (sub_1C05D1F20((uint64_t)(v7 + 2), a1, a2, a3))
              return 0xFFFFFFFFLL;
            v8 = 1;
          }
        }
        v7 = (uint64_t *)*v7;
      }
      while (v7);
      ++v6;
      if ((v8 & 1) != 0)
        continue;
    }
    break;
  }
  return 0;
}

int resizeterm(int a1, int a2)
{
  int v2;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  BOOL v11;

  v2 = -1;
  if (a2 >= 1 && a1 >= 1)
  {
    v4 = SP;
    if (SP)
    {
      *(_BYTE *)(SP + 1384) = 0;
      if (*(__int16 *)(v4 + 128) == a1 && *(__int16 *)(v4 + 130) == a2)
      {
        v2 = 0;
      }
      else
      {
        v6 = *(_QWORD *)(v4 + 800);
        if (v6 && !*(_BYTE *)(v6 + 1))
        {
          slk_clear();
          v7 = 1;
        }
        else
        {
          v7 = 0;
        }
        v2 = resize_term(a1, a2);
        clearok(*(WINDOW **)(SP + 136), 1);
        v8 = 0;
        v4 = SP;
        do
        {
          v9 = &_nc_prescreen[v8];
          v10 = *(_QWORD *)&_nc_prescreen[v8 + 8];
          if (v10)
            v11 = v10 == *(_QWORD *)(v4 + 152);
          else
            v11 = 1;
          if (!v11
            && (*((_DWORD *)v9 + 4) & 0x80000000) != 0
            && *(uint64_t (**)(uint64_t, int))&_nc_prescreen[v8 + 24] != _nc_slk_initialize)
          {
            wtouchln(*(WINDOW **)&_nc_prescreen[v8 + 8], 0, *(__int16 *)(v10 + 4) + 1, 1);
            wnoutrefresh(*((WINDOW **)v9 + 1));
            v4 = SP;
          }
          v8 += 24;
        }
        while (v8 < 120);
        if (v7)
        {
          slk_restore();
          slk_touch();
          slk_refresh();
          v4 = SP;
        }
      }
      _nc_ungetch((__int16 *)v4, 410);
    }
  }
  return v2;
}

uint64_t sub_1C05D1F20(uint64_t a1, int a2, int a3, int a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v17;
  int v19;
  int v20;
  int v22;
  uint64_t v24;
  __int16 v25;
  int v26;

  v8 = dword_1EF614C70;
  v9 = _nc_screen_of(a1);
  v10 = 0;
  v11 = v8 - a4 + *(__int16 *)(v9 + 134);
  v12 = *(__int16 *)(a1 + 4) + 1;
  v13 = *(__int16 *)(a1 + 6);
  while (1)
  {
    if (*(_QWORD *)&_nc_prescreen[v10 + 8] == a1)
    {
      v14 = *(_DWORD *)&_nc_prescreen[v10 + 16];
      if (v14)
        break;
    }
    v10 += 24;
    if (v10 >= 120)
      goto LABEL_5;
  }
  if ((v14 & 0x80000000) == 0)
  {
LABEL_5:
    v15 = *(__int16 *)(a1 + 8);
    if (v11 <= v15)
    {
      *(_WORD *)(a1 + 8) = v15 + a2 - dword_1EF614C70;
    }
    else
    {
      if (a2 != dword_1EF614C70 && v12 == dword_1EF614C70)
        v17 = a2;
      else
        v17 = *(__int16 *)(a1 + 4) + 1;
      if (a2 != dword_1EF614C70 && v12 == dword_1EF614C70 - a4)
        v12 = a2 - a4;
      else
        v12 = v17;
    }
    goto LABEL_19;
  }
  v24 = 0;
  v25 = 0;
  do
  {
    v26 = *(_DWORD *)&_nc_prescreen[v24 + 16];
    if (v26 < 0)
    {
      v25 -= v26;
      if (*(_QWORD *)&_nc_prescreen[v24 + 8] == a1)
        break;
    }
    v24 += 24;
  }
  while (v24 < 120);
  *(_WORD *)(a1 + 8) = a2 - v25 - *(_WORD *)(a1 + 84);
  if (*(uint64_t (**)(uint64_t, int))&_nc_prescreen[v10 + 24] == _nc_slk_initialize)
    _nc_format_slks(a3);
LABEL_19:
  if (v12 >= a2)
    v19 = a2;
  else
    v19 = v12;
  if (v13 < a3)
    v20 = v13 + 1;
  else
    v20 = a3;
  if (dword_1EF614C74 != a3 && v20 == dword_1EF614C74)
    v22 = a3;
  else
    v22 = v20;
  return wresize((WINDOW *)a1, v19, v22);
}

char *_nc_printf_string(const char *a1, va_list a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  char *result;

  if (a1)
  {
    v4 = *(__int16 *)(SP + 128);
    v5 = *(_DWORD *)&PC[484];
    if (*(int *)&PC[484] >= v4)
    {
      v6 = *(__int16 *)(SP + 130);
      v7 = *(_DWORD *)&PC[480];
      if (*(int *)&PC[480] >= v6)
      {
        result = *(char **)&PC[96];
        if (!*(_QWORD *)&PC[96])
          return result;
        goto LABEL_10;
      }
    }
    else
    {
      *(_DWORD *)&PC[484] = *(__int16 *)(SP + 128);
      v6 = *(__int16 *)(SP + 130);
      v5 = v4;
      v7 = *(_DWORD *)&PC[480];
    }
    if (v7 < v6)
    {
      *(_DWORD *)&PC[480] = v6;
      v7 = v6;
    }
    *(_QWORD *)&PC[104] = v5 + v5 * v7 + 1;
    result = (char *)_nc_doalloc(*(void **)&PC[96], *(size_t *)&PC[104]);
    *(_QWORD *)&PC[96] = result;
    if (result)
    {
LABEL_10:
      vsnprintf(result, *(size_t *)&PC[104], a1, a2);
      return *(char **)&PC[96];
    }
  }
  else
  {
    result = *(char **)&PC[96];
    if (*(_QWORD *)&PC[96])
    {
      free(*(void **)&PC[96]);
      result = 0;
      *(_QWORD *)&PC[96] = 0;
      *(_QWORD *)&PC[104] = 0;
    }
  }
  return result;
}

_QWORD *_nc_str_init(_QWORD *result, _BYTE *a2, uint64_t a3)
{
  if (result)
  {
    *result = a2;
    result[1] = a2;
    result[2] = a3 - 1;
    result[3] = a3 - 1;
    if (a2)
      *a2 = 0;
  }
  return result;
}

_QWORD *_nc_str_null(_QWORD *result, uint64_t a2)
{
  if (result)
  {
    *result = 0;
    result[1] = 0;
    result[2] = a2 - 1;
    result[3] = a2 - 1;
  }
  return result;
}

__n128 _nc_str_copy(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t _nc_safe_strcat(uint64_t a1, char *__s)
{
  size_t v4;
  size_t v5;
  size_t v6;
  char *v7;

  if (!__s)
    return 0;
  v4 = strlen(__s);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 >= v5)
    return 0;
  v6 = v4;
  v7 = *(char **)(a1 + 8);
  if (v7)
  {
    strcpy(v7, __s);
    v5 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 8) += v6;
  }
  *(_QWORD *)(a1 + 16) = v5 - v6;
  return 1;
}

uint64_t _nc_safe_strcpy(uint64_t a1, char *__s)
{
  size_t v4;
  size_t v5;

  if (!__s)
    return 0;
  v4 = strlen(__s);
  if (v4 >= *(_QWORD *)(a1 + 16))
    return 0;
  v5 = v4;
  if (*(_QWORD *)a1)
  {
    strcpy(*(char **)a1, __s);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + v5;
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 24) - v5;
  return 1;
}

_BYTE *_nc_expand_try(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  _BYTE *result;
  uint64_t v9;
  char v11;

  result = 0;
  if (a1 && (_DWORD)a2)
  {
    v9 = a4 + 1;
    while (1)
    {
      result = (_BYTE *)_nc_expand_try(*(_QWORD *)a1, a2, a3, v9);
      if (result)
        break;
      if (*(unsigned __int16 *)(a1 + 18) == (_DWORD)a2 && !(*a3)--)
      {
        result = calloc(a4 + 2, 1uLL);
        if (!result)
          return result;
        break;
      }
      a1 = *(_QWORD *)(a1 + 8);
      if (!a1)
        return 0;
    }
    v11 = *(_BYTE *)(a1 + 16);
    if (!v11)
      v11 = 0x80;
    result[a4] = v11;
  }
  return result;
}

uint64_t _nc_remove_key(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v5;

  if (!(_DWORD)a2)
    return 0;
  v2 = a1;
  v3 = *a1;
  if (!*a1)
    return 0;
  while (!_nc_remove_key(v3, a2))
  {
    v5 = (_QWORD *)*v2;
    if (*(unsigned __int16 *)(*v2 + 18) == (_DWORD)a2)
    {
      if (*v5)
      {
        *((_WORD *)v5 + 9) = 0;
      }
      else
      {
        *v2 = v5[1];
        free(v5);
      }
      return 1;
    }
    v3 = v5[1];
    v2 = v5 + 1;
    if (!v3)
      return 0;
  }
  return 1;
}

uint64_t _nc_remove_string(uint64_t *a1, _BYTE *a2)
{
  int v3;
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  do
  {
    if (!a2)
      return 0;
    v3 = *a2;
    if (!*a2)
      return 0;
    result = *a1;
    if (!*a1)
      return result;
    v5 = a1;
    if (*(unsigned __int8 *)(result + 16) != v3)
    {
      while (1)
      {
        v6 = result;
        result = *(_QWORD *)(result + 8);
        if (!result)
          return result;
        if (*(unsigned __int8 *)(result + 16) == v3)
        {
          v5 = (uint64_t *)(v6 + 8);
          break;
        }
      }
    }
    v7 = *++a2;
    a1 = (uint64_t *)result;
  }
  while (v7);
  if (*(_QWORD *)result)
    return 0;
  *v5 = *(_QWORD *)(result + 8);
  free((void *)result);
  return 1;
}

char *sub_1C05D245C(uint64_t a1, uint64_t a2)
{
  char *v2;

  v2 = _nc_tiparm(9, *(const char **)(*(_QWORD *)(a1 + 32) + 1048), 0, 0, 0, 0, 0, 0, 0, 0, a2);
  if ((unint64_t)(v2 + 1) >= 2)
    return strdup(v2);
  else
    return 0;
}

BOOL sub_1C05D24B4(char *__s, const char *a2)
{
  size_t v5;
  size_t v6;
  BOOL v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  unsigned int v11;

  if (__s)
  {
    if ((unint64_t)(a2 + 1) >= 2)
    {
      v5 = strlen(__s);
      v6 = strlen(a2);
      v7 = v5 > v6;
      v8 = v5 - v6;
      if (v7)
      {
        v9 = v6;
        if (!strncmp(a2, __s, v6))
        {
          v10 = 0;
          v11 = 1;
          do
          {
            __s[v10] = __s[v10 + v9];
            v10 = v11;
            v7 = v8 > v11++;
          }
          while (v7);
          strcpy(&__s[v10], a2);
        }
      }
    }
  }
  return __s != 0;
}

BOOL sub_1C05D255C(char *__s, char *a2)
{
  _BOOL8 result;
  char *v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  size_t v9;
  size_t v10;
  size_t v11;

  result = 0;
  if (!__s)
    return result;
  v4 = a2;
  if (!a2)
    return result;
  v5 = *__s;
  if (v5 == 233)
  {
    v6 = 1;
  }
  else if (v5 == 27)
  {
    v6 = 2 * (__s[1] == 91);
  }
  else
  {
    v6 = 0;
  }
  v7 = *a2;
  if (v7 == 233)
  {
    v8 = 1;
    if (!v6)
      goto LABEL_17;
LABEL_13:
    if (v8)
    {
      if (v6 == v8)
      {
        __s += v6;
        v4 = &a2[v6];
        if (*__s != *v4)
        {
          __s = sub_1C05D2750(__s);
          v4 = sub_1C05D2750(v4);
        }
      }
    }
    goto LABEL_17;
  }
  if (v7 == 27)
  {
    v8 = 2 * (a2[1] == 91);
    if (v6)
      goto LABEL_13;
  }
LABEL_17:
  v9 = strlen(__s);
  v10 = strlen(v4);
  result = 0;
  if (v9 && v10)
  {
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
    return strncmp(__s, v4, v11) == 0;
  }
  return result;
}

unint64_t sub_1C05D2674(unint64_t result, unsigned __int8 *a2)
{
  int v2;
  _BYTE *v3;
  int v4;
  _BYTE *v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v10;
  int v11;
  BOOL v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(unsigned __int8 *)result;
  if (*(_BYTE *)result)
  {
    v3 = (_BYTE *)result;
    v4 = 0;
    LODWORD(result) = 0;
    while (v2 == *a2)
    {
      result = (v4 + result);
      if (v2 != 36)
        goto LABEL_27;
      v5 = v3;
      if (v3[1] == 60)
      {
        v5 = v3 + 1;
        do
        {
          v7 = *++v5;
          v6 = v7;
          v8 = v7 - 48;
        }
        while (v7 == 47 || v8 < 0xA);
        if (v6 == 62)
          ++v5;
      }
      if (a2[1] != 60)
        goto LABEL_27;
      v10 = 0;
      do
        v11 = a2[v10++ + 2];
      while (v11 == 47 || (v11 - 48) < 0xA);
      v13 = v11 == 62;
      v14 = v11 == 62;
      v15 = v13 ? v10 + 1 : v10;
      if (v5 != v3 && (v16 = v15 + 1) != 0)
      {
        a2 += v16;
        v4 = v14 + v10 + 1;
      }
      else
      {
LABEL_27:
        v4 = 0;
        result = (result + 1);
        v5 = v3 + 1;
        ++a2;
      }
      v2 = *v5;
      v3 = v5;
      if (!*v5)
        return result;
    }
  }
  return 0;
}

_BYTE *sub_1C05D2750(_BYTE *a1)
{
  _BYTE *v1;
  uint64_t v2;
  int v3;

  v1 = a1;
  if (*a1 == 48)
  {
    v2 = a1[1];
    if (v2 == 59)
    {
      v1 += 2;
    }
    else
    {
      if ((v2 & 0x80) != 0)
        v3 = __maskrune(v2, 0x100uLL);
      else
        v3 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v2 + 60) & 0x100;
      if (v3)
        ++v1;
    }
  }
  return v1;
}

int doupdate(void)
{
  uint64_t v0;
  WINDOW *v1;
  WINDOW *v2;
  WINDOW *v3;
  WINDOW *v4;
  WINDOW *v5;
  WINDOW *v6;
  BOOL v7;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  char **Strings;
  char *v17;
  _BOOL4 v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _BOOL4 v24;
  char *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  __int16 *v42;
  uint64_t v43;
  _DWORD *v44;
  int v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int v69;
  _BYTE v70[28];

  v0 = SP;
  if (!SP)
    return -1;
  v1 = *(WINDOW **)(SP + 136);
  v2 = curscr;
  if (v1)
  {
    if (v1 != curscr)
      curscr = *(WINDOW **)(SP + 136);
  }
  else
  {
    *(_QWORD *)(SP + 136) = curscr;
    v1 = v2;
  }
  v3 = *(WINDOW **)(v0 + 144);
  v4 = newscr;
  if (v3)
  {
    if (v3 != newscr)
      newscr = *(WINDOW **)(v0 + 144);
  }
  else
  {
    *(_QWORD *)(v0 + 144) = newscr;
    v3 = v4;
  }
  v5 = *(WINDOW **)(v0 + 152);
  v6 = stdscr;
  if (v5)
  {
    if (v5 != stdscr)
      stdscr = *(WINDOW **)(v0 + 152);
  }
  else
  {
    *(_QWORD *)(v0 + 152) = stdscr;
    v5 = v6;
  }
  v7 = !v1 || v3 == 0;
  if (v7 || v5 == 0)
    return -1;
  _nc_signal_handler(0);
  v10 = SP;
  if (*(_WORD *)(SP + 734))
    --*(_WORD *)(SP + 734);
  if (!*(_DWORD *)(v10 + 736))
  {
    if (!_nc_handle_sigwinch(v10))
      goto LABEL_29;
    v10 = SP;
  }
  _nc_update_screensize(v10);
LABEL_29:
  v11 = SP;
  if (*(_DWORD *)(SP + 736))
  {
    reset_prog_mode();
    _nc_mvcur_resume();
    _nc_screen_resume();
    (*(void (**)(void))(SP + 1080))();
    v11 = SP;
    *(_DWORD *)(SP + 736) = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(v11 + 136) + 25) && !*(_BYTE *)(*(_QWORD *)(v11 + 144) + 25))
  {
    sub_1C05D3140();
    v33 = *(__int16 *)(SP + 128);
    v34 = *(__int16 *)(*(_QWORD *)(SP + 144) + 4);
    if (v34 + 1 < (int)v33)
      v35 = (v34 + 1);
    else
      v35 = v33;
    if (*(_DWORD *)(SP + 952))
      _nc_scroll_optimize();
    v36 = sub_1C05D3204(v35);
    v37 = v36;
    if (v36 <= 0)
    {
      v41 = SP;
      v42 = *(__int16 **)(SP + 144);
    }
    else
    {
      v38 = 0;
      v39 = 5;
      v40 = 8;
      do
      {
        if (v39 == 5)
        {
          sub_1C05D3140();
          v39 = 0;
        }
        v41 = SP;
        v42 = *(__int16 **)(SP + 144);
        if (*(__int16 *)(*((_QWORD *)v42 + 5) + v40) != -1
          || *(__int16 *)(*(_QWORD *)(*(_QWORD *)(SP + 136) + 40) + v40) != -1)
        {
          sub_1C05D359C(v38);
          ++v39;
          v41 = SP;
          v42 = *(__int16 **)(SP + 144);
        }
        if (v38 <= v42[2])
          *(_DWORD *)(*((_QWORD *)v42 + 5) + v40) = -1;
        v43 = *(_QWORD *)(v41 + 136);
        if (v38 <= *(__int16 *)(v43 + 4))
          *(_DWORD *)(*(_QWORD *)(v43 + 40) + v40) = -1;
        ++v38;
        v40 += 16;
      }
      while (v37 != v38);
    }
    goto LABEL_113;
  }
  if (cur_term->type.Booleans[28])
    v12 = *(unsigned __int8 *)(*(_QWORD *)(v11 + 152) + 89) << 8;
  else
    v12 = 0;
  v13 = *(__int16 *)(v11 + 128);
  v14 = *(__int16 *)(*(_QWORD *)(v11 + 144) + 4);
  if (v14 + 1 < (int)v13)
    v15 = (v14 + 1);
  else
    v15 = v13;
  *(_DWORD *)v70 = v12;
  *(_QWORD *)&v70[20] = 0;
  *(_OWORD *)&v70[4] = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
  Strings = cur_term->type.Strings;
  v17 = Strings[5];
  v18 = v17 || Strings[7] || Strings[6] != 0;
  if (*(_DWORD *)(v11 + 752) && !*(_BYTE *)(v11 + 993))
  {
    v20 = (_DWORD *)_nc_abiver(&_nc_abiver);
    v22 = *(_QWORD *)(v21 + 744);
    if (*v20 < 0x60000u || (v23 = *(_DWORD *)(v22 + 24)) == 0)
      LOWORD(v23) = *(unsigned __int8 *)(v22 + 1);
    _nc_do_color((__int16)v23, 0, 0, (int (__cdecl *)(int))_nc_outch);
    if (cur_term->type.Booleans[28])
      v24 = v18;
    else
      v24 = 0;
    if (!v24)
    {
      v19 = SP;
LABEL_89:
      v44 = *(_DWORD **)(v19 + 744);
      if (*v44 == v12)
      {
        if (*v20 < 0x60000u || (v45 = v44[6]) == 0 || (v46 = v12 >> 8, v45 == (_DWORD)v46))
        {
LABEL_96:
          if (*(__int16 *)(v19 + 128) >= 1)
          {
            v47 = 0;
            do
            {
              _nc_mvcur(*(_DWORD *)(v19 + 764), *(_DWORD *)(v19 + 768), v47, 0);
              v19 = SP;
              if (*(__int16 *)(SP + 130) >= 1)
              {
                v48 = 0;
                do
                {
                  sub_1C05D6628((uint64_t)v70);
                  ++v48;
                  v19 = SP;
                }
                while (v48 < *(__int16 *)(SP + 130));
              }
              ++v47;
            }
            while (v47 < *(__int16 *)(v19 + 128));
          }
LABEL_102:
          _nc_mvcur(*(_DWORD *)(v19 + 764), *(_DWORD *)(v19 + 768), 0, 0);
          goto LABEL_103;
        }
      }
      else
      {
        v46 = v12 >> 8;
      }
      vid_puts(v12, v46, 0, (int (__cdecl *)(int))_nc_outch);
      v19 = SP;
      goto LABEL_96;
    }
    Strings = cur_term->type.Strings;
    v17 = Strings[5];
  }
  else if (!v18)
  {
    v20 = (_DWORD *)_nc_abiver(&_nc_abiver);
    goto LABEL_89;
  }
  if (!v17)
  {
    if (Strings[7])
    {
      *(_QWORD *)(SP + 764) = -1;
      _nc_mvcur(-1, -1, 0, 0);
      if (**(_DWORD **)(SP + 744) == v12)
      {
        if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
          goto LABEL_135;
        v31 = *(_DWORD *)(v30 + 24);
        if (!v31)
          goto LABEL_135;
        v32 = v12 >> 8;
        if (v31 == (_DWORD)v32)
          goto LABEL_135;
      }
      else
      {
        v32 = v12 >> 8;
      }
      vid_puts(v12, v32, 0, (int (__cdecl *)(int))_nc_outch);
      v29 = SP;
LABEL_135:
      tputs(*((const char **)cur_term->type.Strings + 7), *(__int16 *)(v29 + 128), (int (__cdecl *)(int))_nc_outch);
      goto LABEL_103;
    }
    if (!Strings[6])
      goto LABEL_103;
    v65 = SP;
    *(_QWORD *)(SP + 764) = -1;
    if (**(_DWORD **)(v65 + 744) == v12)
    {
      if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u
        || (v67 = *(_DWORD *)(v66 + 24)) == 0
        || (v68 = v12 >> 8, v67 == (_DWORD)v68))
      {
LABEL_138:
        if (*(__int16 *)(v19 + 128) >= 1)
        {
          v69 = 0;
          do
          {
            _nc_mvcur(*(_DWORD *)(v19 + 764), *(_DWORD *)(v19 + 768), v69, 0);
            _nc_putp((int)"clr_eol", cur_term->type.Strings[6]);
            ++v69;
            v19 = SP;
          }
          while (v69 < *(__int16 *)(SP + 128));
        }
        goto LABEL_102;
      }
    }
    else
    {
      v68 = v12 >> 8;
    }
    vid_puts(v12, v68, 0, (int (__cdecl *)(int))_nc_outch);
    v19 = SP;
    goto LABEL_138;
  }
  if (**(_DWORD **)(SP + 744) == v12)
  {
    if (*(_DWORD *)_nc_abiver(&_nc_abiver) < 0x60000u)
      goto LABEL_86;
    v27 = *(_DWORD *)(v26 + 24);
    if (!v27)
      goto LABEL_86;
    v28 = v12 >> 8;
    if (v27 == (_DWORD)v28)
      goto LABEL_86;
  }
  else
  {
    v28 = v12 >> 8;
  }
  vid_puts(v12, v28, 0, (int (__cdecl *)(int))_nc_outch);
  v25 = (char *)*((_QWORD *)cur_term->type.Strings + 5);
LABEL_86:
  _nc_putp((int)"clear_screen", v25);
  *(_QWORD *)(SP + 764) = 0;
LABEL_103:
  v49 = SP;
  if (*(__int16 *)(SP + 128) >= 1)
  {
    v50 = 0;
    do
    {
      if (*(__int16 *)(v49 + 130) >= 1)
      {
        v51 = 0;
        v52 = 0;
        do
        {
          v53 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v49 + 136) + 40) + 16 * v50) + v51);
          *v53 = *(_OWORD *)v70;
          *(_OWORD *)((char *)v53 + 12) = *(_OWORD *)&v70[12];
          ++v52;
          v49 = SP;
          v51 += 28;
        }
        while (v52 < *(__int16 *)(SP + 130));
      }
      ++v50;
    }
    while (v50 < *(__int16 *)(v49 + 128));
  }
  v54 = sub_1C05D3204(v15);
  if (v54 >= 1)
  {
    v55 = v54;
    v56 = 0;
    do
    {
      sub_1C05D359C(v56);
      v56 = (v56 + 1);
    }
    while (v55 != (_DWORD)v56);
  }
  LODWORD(v37) = 0;
  v41 = SP;
  *(_BYTE *)(*(_QWORD *)(SP + 136) + 25) = 0;
  v42 = *(__int16 **)(v41 + 144);
  *((_BYTE *)v42 + 25) = 0;
LABEL_113:
  if ((int)v37 <= v42[2])
  {
    v57 = *((_QWORD *)v42 + 5) + 16 * (int)v37 + 10;
    v58 = v42[2] - (uint64_t)(int)v37 + 1;
    do
    {
      *(_DWORD *)(v57 - 2) = -1;
      v57 += 16;
      --v58;
    }
    while (v58);
  }
  v59 = *(_QWORD *)(v41 + 136);
  if ((int)v37 <= *(__int16 *)(v59 + 4))
  {
    v60 = *(_QWORD *)(v59 + 40) + 16 * (int)v37 + 10;
    v61 = *(__int16 *)(v59 + 4) - (uint64_t)(int)v37 + 1;
    do
    {
      *(_DWORD *)(v60 - 2) = -1;
      v60 += 16;
      --v61;
    }
    while (v61);
  }
  if (!*((_BYTE *)v42 + 26))
  {
    v62 = v42[1];
    *(_WORD *)(v59 + 2) = v42[1];
    v63 = *v42;
    *(_WORD *)v59 = *v42;
    _nc_mvcur(*(_DWORD *)(v41 + 764), *(_DWORD *)(v41 + 768), v63, v62);
    v41 = SP;
  }
  if (**(_DWORD **)(v41 + 744) || *(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u && *(_DWORD *)(v64 + 24))
    vid_puts(0, 0, 0, (int (__cdecl *)(int))_nc_outch);
  _nc_flush();
  *(_DWORD *)(*(_QWORD *)(SP + 136) + 16) = *(_DWORD *)(*(_QWORD *)(SP + 144) + 16);
  _nc_signal_handler(1);
  return 0;
}

void _nc_screen_resume()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char **Strings;
  char *v7;
  const char *v8;
  char *v9;
  char *v10;
  TERMINAL *v11;
  char **v12;
  char *v13;
  char *v14;
  char *v15;
  const char *v16;

  v0 = SP;
  **(_DWORD **)(SP + 744) = **(unsigned __int8 **)(SP + 744);
  *(_BYTE *)(*(_QWORD *)(v0 + 144) + 25) = 1;
  if (*(_DWORD *)(v0 + 752) || *(_DWORD *)(v0 + 756))
  {
    _nc_reset_colors();
    v1 = SP;
    v2 = *(_DWORD *)(SP + 756);
    if (v2 < 0)
    {
      v3 = 0;
      v4 = 0;
      *(_DWORD *)(SP + 756) = -v2;
      do
      {
        v5 = *(_QWORD *)(v1 + 960) + v3;
        if (*(_DWORD *)(v5 + 12))
        {
          init_color(v4, *(_WORD *)(v5 + 6), *(_WORD *)(v5 + 8), *(_WORD *)(v5 + 10));
          v1 = SP;
        }
        ++v4;
        v3 += 16;
      }
      while (v4 < *(int *)(v1 + 756));
    }
  }
  Strings = cur_term->type.Strings;
  v7 = Strings[39];
  if (v7)
  {
    v8 = "exit_attribute_mode";
LABEL_16:
    _nc_putp((int)v8, v7);
    goto LABEL_17;
  }
  v9 = Strings[38];
  if (v9)
  {
    _nc_putp((int)"exit_alt_charset_mode", v9);
    Strings = cur_term->type.Strings;
  }
  v10 = Strings[43];
  if (v10)
  {
    _nc_putp((int)"exit_standout_mode", v10);
    Strings = cur_term->type.Strings;
  }
  v7 = Strings[44];
  if (v7)
  {
    v8 = "exit_underline_mode";
    goto LABEL_16;
  }
LABEL_17:
  v11 = cur_term;
  v12 = cur_term->type.Strings;
  v13 = v12[42];
  if (v13)
  {
    _nc_putp((int)"exit_insert_mode", v13);
    v11 = cur_term;
    v12 = cur_term->type.Strings;
  }
  v14 = v12[151];
  if (v14)
  {
    v15 = v12[152];
    if (v15)
    {
      if (v11->type.Booleans[1])
      {
        v16 = "enter_am_mode";
      }
      else
      {
        v16 = "exit_am_mode";
        v14 = v15;
      }
      _nc_putp((int)v16, v14);
    }
  }
}

void sub_1C05D3140()
{
  unint64_t v0;
  timeval v1;
  fd_set v2;

  if (!*(_WORD *)(SP + 734))
  {
    v0 = *(unsigned int *)(SP + 44);
    if ((v0 & 0x80000000) == 0)
    {
      v1.tv_sec = 0;
      *(_QWORD *)&v1.tv_usec = 0;
      memset(&v2, 0, sizeof(v2));
      if (__darwin_check_fd_set_overflow(v0, &v2, 0))
        *(__int32_t *)((char *)v2.fds_bits + ((v0 >> 3) & 0x1FFFFFFC)) |= 1 << v0;
      if (select(*(_DWORD *)(SP + 44) + 1, &v2, 0, 0, &v1))
      {
        *(_WORD *)(SP + 734) = 5;
        _nc_flush();
      }
    }
  }
}

uint64_t sub_1C05D3204(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v14;
  unsigned int *v15;
  uint64_t *v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  _BOOL4 v23;
  _DWORD *v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  int v28;
  __int16 v29;
  uint64_t *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  __int16 v46;

  v1 = a1;
  v2 = *(_QWORD *)(SP + 144);
  v3 = *(__int16 *)(v2 + 6);
  if (v3 + 1 < *(__int16 *)(SP + 130))
    v4 = v3 + 1;
  else
    v4 = *(__int16 *)(SP + 130);
  if (!*((_QWORD *)cur_term->type.Strings + 7))
    return v1;
  v5 = (a1 - 1);
  v6 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 16 * (int)v5) + 28 * (v4 - 1));
  v7 = *v6;
  v8 = v6[1];
  v9 = v6[2];
  v10 = v6[3];
  v11 = v6[4];
  v12 = v6[5];
  if (cur_term->type.Booleans[28] || !*(_DWORD *)(SP + 752))
    goto LABEL_6;
  if (!*(_BYTE *)(SP + 993) || *(_DWORD *)(SP + 996) != 511 || *(_DWORD *)(SP + 1000) != 511)
    return v1;
  if (*(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u && (v29 = v28, v28) || (v29 = BYTE1(v7), BYTE1(v7)))
  {
    LOWORD(v42) = 0;
    v46 = 0;
    if (pair_content(v29, (__int16 *)&v42, &v46) == -1 || (unsigned __int16)v42 != 511 || v46 != 511)
      return v1;
    if (v8 != 32 || v9 != 0)
      return v1;
  }
  else
  {
LABEL_6:
    if (v8 != 32 || v9 != 0)
      return v1;
  }
  v14 = (v7 & 0x7FC700FF) != 0 || (int)v1 < 1;
  if (!v14)
  {
    v15 = (unsigned int *)_nc_abiver(&_nc_abiver);
    v20 = v1;
    do
    {
      if (v4 >= 1)
      {
        v21 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v19 + 144) + 40) + 16 * v5) + 12);
        v22 = 1;
        do
        {
          if (*(v21 - 3) != v7 || *(v21 - 2) != v8 || *(v21 - 1) != v9 || *v21 != v10 || v21[1] != v11 || v21[2] != v12)
            goto LABEL_63;
          v23 = *v15 <= v18 || v21[3] == v17;
          if (!v23)
            break;
          v21 += 7;
          v14 = v22++ < v4;
        }
        while (v14);
        if (!v23)
        {
LABEL_63:
          v27 = v20;
          break;
        }
        v24 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v19 + 136) + 40) + 16 * v5) + 12);
        v25 = 1;
        do
        {
          if (*(v24 - 3) != v7 || *(v24 - 2) != v8 || *(v24 - 1) != v9 || *v24 != v10 || v24[1] != v11 || v24[2] != v12)
          {
            v27 = v5;
            goto LABEL_44;
          }
          v26 = *v15 <= v18 || v24[3] == v17;
          if (!v26)
            break;
          v24 += 7;
          v14 = v25++ < v4;
        }
        while (v14);
        v27 = v5;
        if (!v26)
          goto LABEL_44;
      }
      v27 = v20;
LABEL_44:
      v20 = v27;
      v14 = v5-- <= 0;
    }
    while (!v14);
    if ((int)v27 < (int)v1)
    {
      v31 = v16;
      v32 = v17;
      _nc_mvcur(*(_DWORD *)(*v16 + 764), *(_DWORD *)(*v16 + 768), v27, 0);
      *(_QWORD *)&v42 = __PAIR64__(v8, v7);
      *((_QWORD *)&v42 + 1) = __PAIR64__(v10, v9);
      v43 = v11;
      v44 = v12;
      v45 = v32;
      sub_1C05D5AAC(&v42);
      v33 = *v31;
      v34 = *(_QWORD *)(*v31 + 1400);
      if (v34)
      {
        v35 = *(_QWORD *)(v33 + 1408);
        if (v35)
        {
          v36 = *(__int16 *)(v33 + 128);
          if ((int)v27 < v36)
          {
            v37 = (uint64_t *)(v35 + 8 * (int)v27);
            v38 = (_QWORD *)(v34 + 8 * (int)v27);
            v39 = v36 - (uint64_t)(int)v27;
            do
            {
              v40 = *v37++;
              *v38++ = v40;
              --v39;
            }
            while (v39);
          }
        }
      }
    }
    return v27;
  }
  return v1;
}

uint64_t sub_1C05D359C(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int *v10;
  _DWORD *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  int v20;
  BOOL v21;
  int v22;
  TERMINAL **v23;
  char *Booleans;
  char **Strings;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  _DWORD *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  BOOL v38;
  __int16 v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _DWORD *v43;
  uint64_t v44;
  int v45;
  int *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v55;
  int v56;
  _DWORD *v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  _DWORD *v63;
  uint64_t v64;
  _DWORD *v65;
  int v66;
  int v67;
  BOOL v68;
  __int16 v69;
  int v70;
  BOOL v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  _DWORD *v75;
  _DWORD *v76;
  uint64_t v77;
  _DWORD *v78;
  int v79;
  int v80;
  int v81;
  TERMINAL **v82;
  int v83;
  int v84;
  BOOL v85;
  int v86;
  void *v87;
  int *v88;
  size_t v89;
  uint64_t v90;
  int *v91;
  int v92;
  int v93;
  int v94;
  uint64_t v95;
  _DWORD *v96;
  BOOL v97;
  int v98;
  unsigned int *v99;
  _DWORD *v100;
  __int16 v101;
  int v102;
  int v103;
  const char *v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  _DWORD *v108;
  _DWORD *v109;
  int v110;
  __int16 v111;
  unsigned int v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  int *v117;
  uint64_t v118;
  int *v119;
  int v120;
  int v121;
  int v122;
  int *v123;
  int v124;
  TERMINAL **v125;
  int v126;
  int v127;
  int v128;
  _DWORD *v129;
  uint64_t v130;
  uint64_t v131;
  int *v132;
  int *v133;
  uint64_t v134;
  char v135;
  int v136;
  uint64_t v137;
  _DWORD *v138;
  TERMINAL **v139;
  TERMINAL **v140;
  int v141;
  int v142;
  int v143;
  int v144;
  TERMINAL **v145;
  unsigned int v146;
  uint64_t v147;
  int *v148;
  unsigned int v149;
  TERMINAL **v150;
  char **v151;
  uint64_t v152;
  int v153;
  unsigned int *v154;
  int v155;
  int v156;
  int v157;
  int *v158;
  int v159;
  char *v160;
  int v161;
  char **v162;
  int v163;
  int v164;
  int v165;
  _DWORD *v166;
  int v167;
  int v168;
  _DWORD *v169;
  unsigned int v170;
  int v171;
  int v172;
  __int16 v173;
  int v174;
  unint64_t v175;
  int *v176;
  int v177;
  int v178;
  _DWORD *v179;
  _DWORD *v180;
  unsigned int *v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  __int16 v203[2];
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  unsigned int v210[7];
  __int16 v211;

  v1 = result;
  v2 = SP;
  v3 = 16 * (int)result;
  v4 = *(int **)(*(_QWORD *)(*(_QWORD *)(SP + 144) + 40) + v3);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(SP + 136) + 40) + v3);
  v6 = *(_QWORD *)(SP + 1400);
  if (v6)
  {
    v7 = *(_QWORD *)(SP + 1408);
    if (v7)
      *(_QWORD *)(v6 + 8 * (int)result) = *(_QWORD *)(v7 + 8 * (int)result);
  }
  v8 = *(_DWORD *)(v2 + 752);
  if (v8 && *(__int16 *)(v2 + 130) >= 1)
  {
    result = _nc_abiver(&_nc_abiver);
    v10 = (int *)(v5 + 24);
    v11 = v4 + 6;
    do
    {
      v12 = *(v11 - 6);
      v13 = *(v10 - 6);
      if (v12 != v13
        || *(v11 - 5) != *(v10 - 5)
        || *(v11 - 4) != *(v10 - 4)
        || *(v11 - 3) != *(v10 - 3)
        || *(v11 - 2) != *(v10 - 2)
        || *(v11 - 1) != *(v10 - 1)
        || *(_DWORD *)result > 0x5FFFFu && *v11 != *v10)
      {
        v14 = BYTE1(v13);
        v15 = BYTE1(v12);
        if (*(_DWORD *)result <= 0x5FFFFu)
        {
          v16 = BYTE1(v12);
        }
        else
        {
          if (*v10)
            v14 = *v10;
          v16 = *v11;
          if (!*v11)
            v16 = BYTE1(v12);
        }
        v17 = v13 & 0xFFFF00FF;
        v18 = v12 & 0xFFFF00FF;
        if (v14 != v16 && v17 == v18)
        {
          v20 = *(_DWORD *)(v2 + 988);
          v21 = v14 < v20 && v16 < v20;
          if (v21 && *(_DWORD *)(*(_QWORD *)(v2 + 976) + 4 * v14) == *(_DWORD *)(*(_QWORD *)(v2 + 976) + 4 * v16))
          {
            if (*(_DWORD *)result <= 0x5FFFFu)
            {
              *(v10 - 6) = v17;
              if (*(_DWORD *)result <= 0x5FFFFu || (v22 = *v11) == 0)
                LOBYTE(v22) = *((_BYTE *)v11 - 23);
            }
            else
            {
              v22 = *v11;
              if (!*v11)
                v22 = v15;
              *v10 = v22;
              if (v22 >= 255)
                LOBYTE(v22) = -1;
            }
            *(v10 - 6) = (v22 << 8) | v17;
          }
        }
      }
      v10 += 7;
      v11 += 7;
      --v9;
    }
    while (v9);
  }
  v23 = &cur_term;
  Booleans = cur_term->type.Booleans;
  Strings = cur_term->type.Strings;
  if (Booleans[3] && Strings[6] && *(__int16 *)(v2 + 130) >= 1)
  {
    result = _nc_abiver(&_nc_abiver);
    v26 = 0;
    v28 = 28 * v27;
    while (1)
    {
      v29 = v4[v26 / 4];
      if (v29 != *(_DWORD *)(v5 + v26))
        break;
      if (*(_DWORD *)result > 0x5FFFFu)
      {
        v30 = v4[v26 / 4 + 6];
        v31 = BYTE1(v29);
        if (!v30)
          v30 = v31;
        if (*(_DWORD *)(v5 + v26 + 24))
          v31 = *(_DWORD *)(v5 + v26 + 24);
        if (v30 != v31)
          break;
      }
      v26 += 28;
      if (v28 == v26)
        goto LABEL_54;
    }
    v82 = v23;
    v83 = v1;
    _nc_mvcur(*(_DWORD *)(v2 + 764), *(_DWORD *)(v2 + 768), v1, 0);
    *(_OWORD *)v210 = xmmword_1C05E1A70;
    *(_OWORD *)&v210[3] = *(__int128 *)((char *)&xmmword_1C05E1A70 + 12);
    if ((*v82)->type.Booleans[28])
      v210[0] = *(unsigned __int8 *)(*(_QWORD *)(SP + 152) + 89) << 8;
    sub_1C05D5C68(v210, 0);
    result = sub_1C05D6DB8(v5, (uint64_t)v4, v83, 0, *(__int16 *)(SP + 130) - 1);
    LODWORD(v41) = 0;
    goto LABEL_142;
  }
LABEL_54:
  v32 = v4 + 3;
  v33 = v4[3];
  if (!Strings[269])
    goto LABEL_74;
  v34 = *v4;
  v35 = v4[1];
  v36 = v4[2];
  if (!v8 || Booleans[28])
    goto LABEL_71;
  if (!*(_BYTE *)(v2 + 993) || *(_DWORD *)(v2 + 996) != 511 || *(_DWORD *)(v2 + 1000) != 511)
    goto LABEL_74;
  result = _nc_abiver(&_nc_abiver);
  v38 = *(_DWORD *)result < 0x60000u || v37 == 0;
  v39 = v37;
  if (v38)
  {
    v39 = BYTE1(v34);
    if (!BYTE1(v34))
    {
LABEL_71:
      if (v35 != 32)
        goto LABEL_74;
      goto LABEL_72;
    }
  }
  v40 = v1;
  v203[0] = 0;
  v211 = 0;
  result = pair_content(v39, v203, &v211);
  v2 = SP;
  if ((_DWORD)result == -1)
  {
    v1 = v40;
    v23 = &cur_term;
    goto LABEL_74;
  }
  v1 = v40;
  v23 = &cur_term;
  if (v203[0] != 511 || v211 != 511 || v35 != 32)
  {
LABEL_74:
    v41 = *(__int16 *)(v2 + 130);
    if ((int)v41 < 1)
    {
      LODWORD(v41) = 0;
    }
    else
    {
      result = _nc_abiver(&_nc_abiver);
      v42 = 0;
      v43 = (_DWORD *)(v5 + 12);
      while (*(v32 - 3) == *(v43 - 3)
           && *(v32 - 2) == *(v43 - 2)
           && *(v32 - 1) == *(v43 - 1)
           && *v32 == *v43
           && v32[1] == v43[1]
           && v32[2] == v43[2]
           && (*(_DWORD *)result <= 0x5FFFFu || v32[3] == v43[3]))
      {
        ++v42;
        v43 += 7;
        v32 += 7;
        if (v41 == v42)
          goto LABEL_88;
      }
      LODWORD(v41) = v42;
    }
    goto LABEL_88;
  }
LABEL_72:
  if (v36 || (v34 & 0x7FC700FF) != 0)
    goto LABEL_74;
  LODWORD(v90) = *(__int16 *)(v2 + 130);
  if ((int)v90 < 1)
  {
    LODWORD(v95) = 0;
LABEL_182:
    if ((int)v95 < (int)v90)
    {
      result = _nc_abiver(&_nc_abiver);
      v107 = 28 * v95 + 12;
      v108 = (_DWORD *)(v5 + v107);
      v109 = (int *)((char *)v4 + v107);
      while (*(v109 - 3) == *(v108 - 3)
           && *(v109 - 2) == *(v108 - 2)
           && *(v109 - 1) == *(v108 - 1)
           && *v109 == *v108
           && v109[1] == v108[1]
           && v109[2] == v108[2]
           && (*(_DWORD *)result <= 0x5FFFFu || v109[3] == v108[3]))
      {
        LODWORD(v95) = v95 + 1;
        v108 += 7;
        v109 += 7;
        if ((int)v95 >= v106)
        {
          LODWORD(v41) = v106;
          goto LABEL_88;
        }
      }
    }
LABEL_194:
    LODWORD(v41) = v95;
    goto LABEL_88;
  }
  result = _nc_abiver(&_nc_abiver);
  v95 = 0;
  v96 = (_DWORD *)(v5 + 12);
  while (*(v96 - 3) == v34
       && *(v96 - 2) == 32
       && !*(v96 - 1)
       && *v96 == v33
       && v96[1] == v92
       && v96[2] == v93
       && (*(_DWORD *)result <= 0x5FFFFu || v96[3] == v94))
  {
    ++v95;
    v96 += 7;
    if (v90 == v95)
    {
      LODWORD(v95) = v90;
      break;
    }
  }
  v41 = 0;
  v97 = 1;
  while (*(v32 - 3) == v34
       && *(v32 - 2) == 32
       && !*(v32 - 1)
       && *v32 == v33
       && v32[1] == v92
       && v32[2] == v93
       && (*(_DWORD *)result <= 0x5FFFFu || v32[3] == v94))
  {
    v97 = ++v41 < (unint64_t)(unsigned __int16)v90;
    v32 += 7;
    if (v90 == v41)
    {
      LODWORD(v41) = v90;
      break;
    }
  }
  if ((_DWORD)v41 == (_DWORD)v95)
    goto LABEL_182;
  if (v41 >= v95)
  {
    v98 = v91[221];
    if (v98 < (int)v41 - (int)v95)
    {
      v99 = (unsigned int *)result;
      v199 = v92;
      v202 = v94;
      v195 = v93;
      v177 = v1;
      if (v97 || v91[220] > v98)
      {
        _nc_mvcur(v91[191], v91[192], v1, v41 - 1);
        v100 = *(_DWORD **)(SP + 744);
        v101 = v202;
        if (*v100 == v34)
        {
          if (*v99 <= 0x5FFFF)
            goto LABEL_180;
          v102 = v100[6];
          v103 = BYTE1(v34);
          if (!v102)
            v102 = BYTE1(v34);
          if (v202)
            v103 = v202;
          if (v102 == v103)
          {
LABEL_180:
            v104 = "clr_bol";
            v105 = 269;
LABEL_355:
            result = _nc_putp((int)v104, cur_term->type.Strings[v105]);
            if (v41 <= v95)
            {
              LODWORD(v41) = v95;
              v1 = v177;
            }
            else
            {
              v175 = v41 - (unint64_t)v95;
              v176 = (int *)(v5 + 28 * v95 + 12);
              v1 = v177;
              do
              {
                *(v176 - 3) = v34;
                *(v176 - 2) = 32;
                *(v176 - 1) = 0;
                *v176 = v33;
                v176[1] = v199;
                v176[2] = v195;
                v176[3] = v202;
                v176 += 7;
                --v175;
              }
              while (v175);
            }
            v23 = &cur_term;
            goto LABEL_88;
          }
        }
        v111 = BYTE1(v34);
        v112 = *v99;
        v113 = "clr_bol";
        v114 = 269;
        v115 = "clr_bol";
        if (!v202)
          v101 = BYTE1(v34);
        v116 = 269;
      }
      else
      {
        _nc_mvcur(v91[191], v91[192], v1, 0);
        v166 = *(_DWORD **)(SP + 744);
        v101 = v202;
        if (*v166 == v34)
        {
          if (*v99 <= 0x5FFFF)
            goto LABEL_322;
          v167 = v166[6];
          v168 = BYTE1(v34);
          if (!v167)
            v167 = BYTE1(v34);
          if (v202)
            v168 = v202;
          if (v167 == v168)
          {
LABEL_322:
            v104 = "clr_eol";
            v105 = 6;
            goto LABEL_355;
          }
        }
        v111 = BYTE1(v34);
        v112 = *v99;
        v113 = "clr_eol";
        v114 = 6;
        v115 = "clr_eol";
        if (!v202)
          v101 = BYTE1(v34);
        v116 = 6;
      }
      if (v112 <= 0x5FFFF)
      {
        v105 = v114;
      }
      else
      {
        v111 = v101;
        v105 = v116;
      }
      if (v112 > 0x5FFFF)
        v174 = (int)v115;
      else
        v174 = (int)v113;
      v194 = v174;
      vid_puts(v34, v111, 0, (int (__cdecl *)(int))_nc_outch);
      LODWORD(v104) = v194;
      goto LABEL_355;
    }
    goto LABEL_194;
  }
LABEL_88:
  v44 = SP;
  v45 = *(__int16 *)(SP + 130);
  if ((int)v41 >= v45)
    return result;
  v46 = &v4[7 * v45 - 7];
  v48 = *v46;
  v47 = v46[1];
  v50 = v46[2];
  v49 = v46[3];
  v51 = v46[4];
  v52 = v46[5];
  v53 = v46[6];
  if ((*v23)->type.Booleans[28] || !*(_DWORD *)(SP + 752))
    goto LABEL_90;
  if (!*(_BYTE *)(SP + 993) || *(_DWORD *)(SP + 996) != 511 || *(_DWORD *)(SP + 1000) != 511)
    goto LABEL_126;
  result = _nc_abiver(&_nc_abiver);
  v68 = *(_DWORD *)result < 0x60000u || v53 == 0;
  v69 = v53;
  if (v68)
  {
    v69 = BYTE1(v48);
    if (!BYTE1(v48))
    {
LABEL_90:
      if (v47 != 32 || v50 != 0)
        goto LABEL_126;
LABEL_95:
      if ((v48 & 0x7FC700FF) != 0)
        goto LABEL_126;
      v55 = *(__int16 *)(v44 + 130);
      v56 = v55 - 1;
      v197 = v51;
      v200 = v49;
      if (v55 - 1 <= (int)v41)
      {
        v62 = *(__int16 *)(v44 + 130);
        v60 = v55 - 1;
      }
      else
      {
        v57 = (_DWORD *)_nc_abiver(&_nc_abiver);
        v60 = v55 - 1;
        v61 = v41 + 1;
        v62 = v55;
        v56 = v55 - 1;
        if (*(_DWORD *)(v5 + 28 * (v55 - 1)) == v48)
        {
          v63 = (_DWORD *)(v5 + 28 * v55 - 24);
          v64 = v55 - 2;
          v62 = v55;
          v65 = v63;
          while (1)
          {
            v56 = v62 - 1;
            v66 = *v65;
            v65 -= 7;
            if (v66 != v47
              || v63[1] != v50
              || v63[2] != v59
              || v63[3] != v58
              || v63[4] != v52
              || *v57 > 0x5FFFFu && v63[5] != v53)
            {
              break;
            }
            if (v64 <= (int)v41)
            {
              v62 = v41 + 1;
              v56 = v41;
              break;
            }
            v67 = *(v63 - 8);
            --v64;
            v63 = v65;
            --v62;
            if (v67 != v48)
            {
              v62 = v56--;
              break;
            }
          }
        }
        if (v4[7 * v60] == v48)
        {
          v117 = &v4[7 * v55 - 6];
          v118 = v55 - 2;
          v119 = v117;
          while (1)
          {
            v60 = v55 - 1;
            v120 = *v119;
            v119 -= 7;
            if (v120 != v47
              || v117[1] != v50
              || v117[2] != v59
              || v117[3] != v58
              || v117[4] != v52
              || *v57 > 0x5FFFFu && v117[5] != v53)
            {
              break;
            }
            if (v118 <= (int)v41)
            {
              v60 = v41;
              goto LABEL_218;
            }
            v121 = *(v117 - 8);
            --v118;
            v117 = v119;
            --v55;
            if (v121 != v48)
            {
              v55 = v60--;
              break;
            }
          }
        }
      }
      v61 = v55;
      if (v60 == (_DWORD)v41)
      {
LABEL_218:
        v55 = v61;
        if (*(_DWORD *)(v44 + 880) < v56 - (int)v41)
        {
          v122 = v50;
          _nc_mvcur(*(_DWORD *)(v44 + 764), *(_DWORD *)(v44 + 768), v1, v41);
          v123 = &v4[7 * (int)v41];
          if (*v123 != v48
            || v4[7 * (int)v41 + 1] != v47
            || v4[7 * (int)v41 + 2] != v122
            || v4[7 * (int)v41 + 3] != v200
            || v4[7 * (int)v41 + 4] != v197
            || v4[7 * (int)v41 + 5] != v52
            || *(_DWORD *)_nc_abiver(&_nc_abiver) > 0x5FFFFu && v4[7 * v124 + 6] != v53)
          {
            sub_1C05D6628((uint64_t)v123);
          }
          *(_DWORD *)v203 = v48;
          v204 = v47;
          v205 = v122;
          v206 = v200;
          v207 = v197;
          v208 = v52;
LABEL_229:
          v209 = v53;
LABEL_270:
          result = (uint64_t)sub_1C05D5C68((unsigned int *)v203, 0);
LABEL_142:
          v84 = *(__int16 *)(SP + 130);
          v85 = __OFSUB__(v84, (_DWORD)v41);
          v86 = v84 - v41;
          if ((v86 < 0) ^ v85 | (v86 == 0))
            return result;
          v87 = (void *)(v5 + 28 * (int)v41);
          v88 = &v4[7 * (int)v41];
          v89 = 28 * v86;
          return (uint64_t)memcpy(v87, v88, v89);
        }
      }
      v196 = v60;
      v185 = v48;
      v189 = v52;
      if (v55 == v62)
      {
        result = _nc_abiver(&_nc_abiver);
        v129 = (_DWORD *)result;
        v130 = v56;
        v131 = v127;
LABEL_232:
        v132 = &v4[7 * (int)v131];
        v133 = v132;
        while (1)
        {
          v134 = v131;
          v136 = *v133;
          v133 -= 7;
          v135 = v136;
          if (v136 != *(_DWORD *)(v5 + 28 * v130)
            || v132[1] != *(_DWORD *)(v5 + 28 * v130 + 4)
            || v132[2] != *(_DWORD *)(v5 + 28 * v130 + 8)
            || v132[3] != *(_DWORD *)(v5 + 28 * v130 + 12)
            || v132[4] != *(_DWORD *)(v5 + 28 * v130 + 16)
            || v132[5] != *(_DWORD *)(v5 + 28 * v130 + 20)
            || *v129 > 0x5FFFFu && v132[6] != *(_DWORD *)(v5 + 28 * v130 + 24))
          {
            break;
          }
          if ((v135 & 0xFEu) - 2 >= 0x1E)
          {
            v137 = v130 - 1;
          }
          else
          {
            v137 = v130 - 1;
            if (*(v132 - 7) != *(_DWORD *)(v5 + 28 * (v130 - 1))
              || *(v132 - 6) != *(_DWORD *)(v5 + 28 * v137 + 4)
              || *(v132 - 5) != *(_DWORD *)(v5 + 28 * v137 + 8)
              || *(v132 - 4) != *(_DWORD *)(v5 + 28 * v137 + 12)
              || *(v132 - 3) != *(_DWORD *)(v5 + 28 * v137 + 16)
              || *(v132 - 2) != *(_DWORD *)(v5 + 28 * v137 + 20)
              || *v129 > 0x5FFFFu && *(v132 - 1) != *(_DWORD *)(v5 + 28 * v137 + 24))
            {
              break;
            }
          }
          --v131;
          if (v130)
          {
            v132 = v133;
            v130 = v137;
            if (v134)
              continue;
          }
          goto LABEL_272;
        }
        LODWORD(v137) = v130;
LABEL_272:
        if ((int)v137 >= (int)v131)
          v143 = v131;
        else
          v143 = v137;
        if (v143 >= (int)v41)
        {
          v187 = v53;
          v144 = v1;
          v192 = v126;
          v180 = v129;
          v183 = v128;
          _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), v1, v41);
          result = sub_1C05D6DB8(v5, (uint64_t)v4, v144, v41, v143);
          v129 = v180;
          v128 = v183;
          v127 = v196;
          v126 = v192;
          v125 = &cur_term;
          v1 = v144;
          v53 = v187;
        }
        if ((int)v137 < (int)v131)
        {
          if (v127 > v56)
            v56 = v127;
          if (v143)
          {
            v145 = v125;
            v146 = LOBYTE(v4[7 * v143 + 7]);
            if (v146 >= 2)
            {
              v147 = (int)v137;
              if ((int)v131 < (uint64_t)(int)v137)
                v147 = (int)v131;
              v148 = &v4[7 * v147];
              while ((_DWORD)v147 && v146 <= 0x1F)
              {
                --v143;
                LODWORD(v137) = v137 - 1;
                v149 = *(unsigned __int8 *)v148;
                v148 -= 7;
                v146 = v149;
                LODWORD(v147) = v147 - 1;
                if (v149 <= 1)
                  goto LABEL_306;
              }
              v143 = v147;
            }
          }
          else if ((int)v41 <= 0 && *(_BYTE *)v4 == 1)
          {
            v145 = v125;
            v158 = v4 + 7;
            v143 = -1;
            do
            {
              v159 = *v158;
              v158 += 7;
              ++v143;
            }
            while ((v159 & 0xFEu) - 2 < 0x1E);
            LODWORD(v137) = v137 + v143;
          }
          else
          {
            v145 = v125;
            v143 = 0;
          }
LABEL_306:
          v161 = v1;
          _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), v1, v143 + 1);
          if (v196 > (int)v131)
          {
LABEL_363:
            result = sub_1C05D6DB8(v5, (uint64_t)v4, v161, v143 + 1, v56);
            goto LABEL_142;
          }
          v162 = (*v145)->type.Strings;
          if (v162[108])
          {
            v163 = *(_DWORD *)(SP + 900);
            goto LABEL_362;
          }
          if (v162[31] && v162[42])
          {
            v164 = *(_DWORD *)(SP + 936);
            v165 = *(_DWORD *)(SP + 928) - v137 + *(_DWORD *)(SP + 932);
          }
          else
          {
            if (!v162[52])
            {
              v163 = 1000000;
LABEL_362:
              if (v163 <= v56 - v143)
              {
                result = sub_1C05D6C5C((uint64_t)&v4[7 * v143 + 7], (v131 - v137));
                goto LABEL_142;
              }
              goto LABEL_363;
            }
            v164 = *(_DWORD *)(SP + 936) + *(_DWORD *)(SP + 892);
            v165 = -(int)v137;
          }
          v163 = v165 + v164 * v131;
          goto LABEL_362;
        }
        if ((int)v137 <= (int)v131)
          goto LABEL_142;
        v181 = v129;
        v184 = v128;
        v193 = v126;
        v188 = v53;
        v150 = v125;
        v178 = v1;
        _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), v1, v143 + 1);
        v151 = (*v150)->type.Strings;
        if (v151[105])
        {
          v152 = SP;
          v153 = *(_DWORD *)(SP + 896);
          v155 = v178;
          v154 = v181;
          v53 = v188;
          v156 = v196;
        }
        else
        {
          v160 = v151[21];
          v152 = SP;
          v53 = v188;
          v156 = v196;
          v154 = v181;
          if (v160)
            v153 = *(_DWORD *)(SP + 888) * v137 - v131;
          else
            v153 = 1000000;
          v155 = v178;
        }
        if (v153 > v156 + ~v143 + *(_DWORD *)(v152 + 880))
        {
          if (sub_1C05D6DB8(v5, (uint64_t)v4, v155, v143 + 1, v156))
            _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), v155, v184);
          *(_DWORD *)v203 = v185;
          v204 = v47;
          v205 = v193;
          v206 = v200;
          v207 = v197;
          v208 = v189;
          goto LABEL_229;
        }
        v169 = *(_DWORD **)(v152 + 744);
        v170 = *v154;
        if (*v169 == v185)
        {
          if (v170 <= 0x5FFFF)
            goto LABEL_344;
          v171 = v169[6];
          v172 = BYTE1(v185);
          if (!v171)
            v171 = BYTE1(v185);
          if (v53)
            v172 = v53;
          if (v171 == v172)
            goto LABEL_344;
        }
        else if (v170 <= 0x5FFFF)
        {
          v173 = BYTE1(v185);
LABEL_343:
          vid_puts(v185, v173, 0, (int (__cdecl *)(int))_nc_outch);
LABEL_344:
          result = sub_1C05D6FBC((v137 - v131));
          goto LABEL_142;
        }
        v173 = BYTE1(v185);
        if (v53)
          v173 = v53;
        goto LABEL_343;
      }
      v186 = v53;
      v191 = v50;
      v182 = v55;
      if (v4[7 * v60] == *(_DWORD *)(v5 + 28 * v56))
      {
        v131 = v60;
        v130 = v56;
        if (v4[7 * v60 + 1] == *(_DWORD *)(v5 + 28 * v56 + 4)
          && v4[7 * v60 + 2] == *(_DWORD *)(v5 + 28 * v56 + 8)
          && v4[7 * v60 + 3] == *(_DWORD *)(v5 + 28 * v56 + 12)
          && v4[7 * v60 + 4] == *(_DWORD *)(v5 + 28 * v56 + 16)
          && v4[7 * v60 + 5] == *(_DWORD *)(v5 + 28 * v56 + 20))
        {
          v138 = (_DWORD *)_nc_abiver(&_nc_abiver);
          if (*v138 <= 0x5FFFFu || v4[7 * (int)v131 + 6] == *(_DWORD *)(v5 + 28 * v56 + 24))
          {
            v179 = v138;
            if (*(_BYTE *)(v44 + 1044))
            {
              v140 = v139;
              v141 = v1;
              result = has_ic();
              v1 = v141;
              v125 = v140;
              v53 = v186;
              v126 = v191;
              v127 = v196;
              v129 = v179;
              v128 = v182;
              if ((result & 1) != 0)
                goto LABEL_232;
              v44 = SP;
            }
          }
        }
      }
      v142 = v1;
      _nc_mvcur(*(_DWORD *)(v44 + 764), *(_DWORD *)(v44 + 768), v1, v41);
      if (v56 - v196 <= *(_DWORD *)(SP + 880))
      {
        if (v196 <= v56)
          v157 = v56;
        else
          v157 = v196;
        result = sub_1C05D6DB8(v5, (uint64_t)v4, v142, v41, v157);
        goto LABEL_142;
      }
      if (sub_1C05D6DB8(v5, (uint64_t)v4, v142, v41, v196))
        _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), v142, v182);
      *(_DWORD *)v203 = v185;
      v204 = v47;
      v205 = v191;
      v206 = v200;
      v207 = v197;
      v208 = v189;
      v209 = v186;
      goto LABEL_270;
    }
  }
  v190 = v50;
  v198 = v51;
  v201 = v49;
  v70 = v1;
  v203[0] = 0;
  v211 = 0;
  result = pair_content(v69, v203, &v211);
  v44 = SP;
  if ((_DWORD)result == -1 || v203[0] != 511)
  {
    v1 = v70;
    goto LABEL_126;
  }
  v1 = v70;
  if (v211 == 511)
  {
    v50 = v190;
    v71 = v47 == 32 && v190 == 0;
    v51 = v198;
    v49 = v201;
    if (v71)
      goto LABEL_95;
  }
LABEL_126:
  v72 = *(__int16 *)(v44 + 130);
  LODWORD(v73) = v72 - 1;
  if (v72 - 1 > (int)v41)
  {
    result = _nc_abiver(&_nc_abiver);
    v73 = v72 - 1;
    if (v4[7 * v73] == *(_DWORD *)(v5 + 28 * v73))
    {
      v74 = 28 * v72 - 24;
      v75 = (_DWORD *)(v5 + v74);
      v76 = (int *)((char *)v4 + v74);
      v77 = v72 - 2;
      v78 = v75;
      while (1)
      {
        LODWORD(v73) = v72 - 1;
        v79 = *v78;
        v78 -= 7;
        if (*v76 != v79
          || v76[1] != v75[1]
          || v76[2] != v75[2]
          || v76[3] != v75[3]
          || v76[4] != v75[4]
          || *(_DWORD *)result > 0x5FFFFu && v76[5] != v75[5])
        {
          break;
        }
        if (v77 <= (int)v41)
        {
          v72 = v41 + 1;
          LODWORD(v73) = v41;
          break;
        }
        v80 = *(v76 - 8);
        v76 -= 7;
        v81 = *(v75 - 8);
        --v77;
        v75 = v78;
        --v72;
        if (v80 != v81)
        {
          v72 = v73;
          LODWORD(v73) = v73 - 1;
          break;
        }
      }
    }
  }
  if (v72 > (int)v41)
  {
    v110 = v1;
    _nc_mvcur(*(_DWORD *)(v44 + 764), *(_DWORD *)(v44 + 768), v1, v41);
    sub_1C05D6DB8(v5, (uint64_t)v4, v110, v41, v73);
    v87 = (void *)(v5 + 28 * (int)v41);
    v88 = &v4[7 * (int)v41];
    v89 = 28 * (v73 - v41 + 1);
    return (uint64_t)memcpy(v87, v88, v89);
  }
  return result;
}

uint64_t _nc_scrolln(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  int v9;
  char *v10;
  int v11;
  int v12;
  int v13;
  char *Booleans;
  char **v15;
  const char *v16;
  int v17;
  BOOL v18;
  char *v19;
  char *v20;
  char **Strings;
  const char *v22;
  int v23;
  BOOL v24;
  char *v25;
  char *v26;
  char *v27;
  int v28;
  char *v29;
  uint64_t v30;
  int v32;
  int v33;
  uint64_t v35;
  char *v36;
  int v37;
  char *v38;
  uint64_t v39;
  int v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;

  if (!SP || !*(_QWORD *)(SP + 48) || *(_BYTE *)(SP + 41))
    return 0xFFFFFFFFLL;
  if (cur_term->type.Booleans[28])
    v9 = *(unsigned __int8 *)(*(_QWORD *)(SP + 152) + 89) << 8;
  else
    v9 = 0;
  v44 = 0;
  v43 = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
  if ((int)a1 < 1)
  {
    v13 = -(int)a1;
    v40 = v9;
    v42 = 0;
    v41 = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
    if (sub_1C05D5EAC(-(int)a1, a2, a3, 0, a4, (uint64_t)&v40) != -1)
      goto LABEL_19;
    Strings = cur_term->type.Strings;
    v22 = Strings[3];
    if (v22)
    {
      if ((_DWORD)a2
        && ((v23 = *(_DWORD *)(SP + 764), v23 != (_DWORD)a2) ? (v24 = v23 == (_DWORD)a2 - 1) : (v24 = 1),
            v24 && (v25 = Strings[128]) != 0 && Strings[126]))
      {
        _nc_putp((int)"save_cursor", v25);
        v26 = _nc_tiparm(2, *((const char **)cur_term->type.Strings + 3), a2, a3);
        _nc_putp((int)"change_scroll_region", v26);
        _nc_putp((int)"restore_cursor", cur_term->type.Strings[126]);
      }
      else
      {
        v36 = _nc_tiparm(2, v22, a2, a3);
        _nc_putp((int)"change_scroll_region", v36);
        *(_QWORD *)(SP + 764) = -1;
      }
      v40 = v9;
      v42 = 0;
      v41 = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
      v37 = sub_1C05D5EAC(-(int)a1, a2, a3, a2, a3, (uint64_t)&v40);
      v38 = _nc_tiparm(2, *((const char **)cur_term->type.Strings + 3), 0, a4);
      _nc_putp((int)"change_scroll_region", v38);
      v39 = SP;
      *(_QWORD *)(SP + 764) = -1;
      if (v37 != -1)
        goto LABEL_19;
    }
    else
    {
      v39 = SP;
    }
    if (!*(_BYTE *)(v39 + 1043))
      return 0xFFFFFFFFLL;
    v40 = v9;
    v42 = 0;
    v41 = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
    result = sub_1C05D57C4(-(int)a1, (int)a1 + (int)a3 + 1, a2, &v40);
    if ((_DWORD)result == -1)
      return result;
LABEL_19:
    Booleans = cur_term->type.Booleans;
    if (Booleans[26])
    {
      if (v13 < 1)
      {
LABEL_55:
        v35 = *(_QWORD *)(SP + 136);
        v40 = v9;
        v41 = v43;
        v42 = v44;
        _nc_scroll_window(v35, (int)a1, (__int16)a2, (__int16)a3, (__int128 *)&v40);
        _nc_scroll_oldhash(a1, a2, a3);
        return 0;
      }
    }
    else
    {
      if ((_DWORD)a2)
        goto LABEL_55;
      if (!Booleans[11] || v13 <= 0)
        goto LABEL_55;
    }
    v32 = a2;
    v33 = (int)a1;
    do
    {
      _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), v32, 0);
      sub_1C05D5C68((unsigned int *)&xmmword_1C05E1A70, 0);
      ++v32;
    }
    while (!__CFADD__(v33++, 1));
    goto LABEL_55;
  }
  v40 = v9;
  v42 = 0;
  v41 = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
  if (sub_1C05D5144((uint64_t)a1, a2, a3, 0, a4, (uint64_t)&v40) != -1)
  {
LABEL_10:
    v10 = cur_term->type.Booleans;
    if (v10[26] || (_DWORD)a3 == (_DWORD)a4 && v10[12])
    {
      v11 = a3;
      v12 = (int)a1;
      if ((_DWORD)a3 == (_DWORD)a4 && (v11 = a3, v12 = (int)a1, *((_QWORD *)cur_term->type.Strings + 7)))
      {
        _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a3 - (_DWORD)a1 + 1, 0);
        sub_1C05D5AAC(&xmmword_1C05E1A70);
      }
      else
      {
        do
        {
          _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), v11, 0);
          sub_1C05D5C68((unsigned int *)&xmmword_1C05E1A70, 0);
          --v11;
          --v12;
        }
        while (v12);
      }
    }
    goto LABEL_55;
  }
  v15 = cur_term->type.Strings;
  v16 = v15[3];
  if (v16)
  {
    if (((_DWORD)a1 == 1 && v15[129] || v15[109])
      && ((v17 = *(_DWORD *)(SP + 764), v17 != (_DWORD)a3) ? (v18 = v17 == (_DWORD)a3 - 1) : (v18 = 1),
          v18 && (v19 = v15[128]) != 0 && v15[126]))
    {
      _nc_putp((int)"save_cursor", v19);
      v20 = _nc_tiparm(2, *((const char **)cur_term->type.Strings + 3), a2, a3);
      _nc_putp((int)"change_scroll_region", v20);
      _nc_putp((int)"restore_cursor", cur_term->type.Strings[126]);
    }
    else
    {
      v27 = _nc_tiparm(2, v16, a2, a3);
      _nc_putp((int)"change_scroll_region", v27);
      *(_QWORD *)(SP + 764) = -1;
    }
    v40 = v9;
    v42 = 0;
    v41 = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
    v28 = sub_1C05D5144((uint64_t)a1, a2, a3, a2, a3, (uint64_t)&v40);
    v29 = _nc_tiparm(2, *((const char **)cur_term->type.Strings + 3), 0, a4);
    _nc_putp((int)"change_scroll_region", v29);
    v30 = SP;
    *(_QWORD *)(SP + 764) = -1;
    if (v28 != -1)
      goto LABEL_10;
  }
  else
  {
    v30 = SP;
  }
  if (!*(_BYTE *)(v30 + 1043))
    return 0xFFFFFFFFLL;
  v40 = v9;
  v42 = 0;
  v41 = *(__int128 *)((char *)&xmmword_1C05E1A70 + 4);
  result = sub_1C05D57C4((uint64_t)a1, a2, (int)a3 - (int)a1 + 1, &v40);
  if ((_DWORD)result != -1)
    goto LABEL_10;
  return result;
}

uint64_t sub_1C05D5144(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  char **Strings;
  _DWORD *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  _DWORD *v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  _DWORD *v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  char *v45;
  char *v46;
  const char *v47;
  uint64_t result;
  _DWORD *v49;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v58;
  int v59;
  int v60;
  int v61;

  Strings = cur_term->type.Strings;
  if ((_DWORD)a1 == 1)
  {
    if (a3 == a5 && a2 == a4 && Strings[129])
    {
      _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a3, 0);
      v10 = (_DWORD *)_nc_abiver(&_nc_abiver);
      if (v13 != v11)
        goto LABEL_12;
      if (*v10 > 0x5FFFFu)
      {
        v14 = *(_DWORD *)(v12 + 24);
        v15 = BYTE1(v13);
        if (!v14)
          v14 = v15;
        if (*(_DWORD *)(a6 + 24))
          v15 = *(_DWORD *)(a6 + 24);
        if (v14 != v15)
        {
LABEL_12:
          if (*v10 <= 0x5FFFFu)
          {
            LOWORD(v16) = BYTE1(v11);
          }
          else
          {
            v16 = *(_DWORD *)(a6 + 24);
            if (!v16)
              LOWORD(v16) = BYTE1(v11);
          }
          vid_puts(v11, (__int16)v16, 0, (int (__cdecl *)(int))_nc_outch);
        }
      }
      v46 = (char *)*((_QWORD *)cur_term->type.Strings + 129);
      v47 = "scroll_forward";
LABEL_90:
      _nc_putp((int)v47, v46);
      goto LABEL_91;
    }
    if (a3 == a5 && Strings[22])
    {
      _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
      v17 = (_DWORD *)_nc_abiver(&_nc_abiver);
      if (v20 != v18)
        goto LABEL_24;
      if (*v17 > 0x5FFFFu)
      {
        v21 = *(_DWORD *)(v19 + 24);
        v22 = BYTE1(v20);
        if (!v21)
          v21 = v22;
        if (*(_DWORD *)(a6 + 24))
          v22 = *(_DWORD *)(a6 + 24);
        if (v21 != v22)
        {
LABEL_24:
          if (*v17 <= 0x5FFFFu)
          {
            LOWORD(v23) = BYTE1(v18);
          }
          else
          {
            v23 = *(_DWORD *)(a6 + 24);
            if (!v23)
              LOWORD(v23) = BYTE1(v18);
          }
          vid_puts(v18, (__int16)v23, 0, (int (__cdecl *)(int))_nc_outch);
        }
      }
      v46 = (char *)*((_QWORD *)cur_term->type.Strings + 22);
      v47 = "delete_line";
      goto LABEL_90;
    }
  }
  if (a3 == a5 && a2 == a4 && Strings[109])
  {
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a3, 0);
    v24 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v27 != v25)
      goto LABEL_37;
    if (*v24 > 0x5FFFFu)
    {
      v28 = *(_DWORD *)(v26 + 24);
      v29 = BYTE1(v27);
      if (!v28)
        v28 = v29;
      if (*(_DWORD *)(a6 + 24))
        v29 = *(_DWORD *)(a6 + 24);
      if (v28 != v29)
      {
LABEL_37:
        if (*v24 <= 0x5FFFFu)
        {
          LOWORD(v30) = BYTE1(v25);
        }
        else
        {
          v30 = *(_DWORD *)(a6 + 24);
          if (!v30)
            LOWORD(v30) = BYTE1(v25);
        }
        vid_puts(v25, (__int16)v30, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    v45 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 109), a1);
LABEL_86:
    tputs(v45, a1, (int (__cdecl *)(int))_nc_outch);
    goto LABEL_91;
  }
  if (a3 == a5 && Strings[106])
  {
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
    v31 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v34 != v32)
      goto LABEL_49;
    if (*v31 > 0x5FFFFu)
    {
      v35 = *(_DWORD *)(v33 + 24);
      v36 = BYTE1(v34);
      if (!v35)
        v35 = v36;
      if (*(_DWORD *)(a6 + 24))
        v36 = *(_DWORD *)(a6 + 24);
      if (v35 != v36)
      {
LABEL_49:
        if (*v31 <= 0x5FFFFu)
        {
          LOWORD(v37) = BYTE1(v32);
        }
        else
        {
          v37 = *(_DWORD *)(a6 + 24);
          if (!v37)
            LOWORD(v37) = BYTE1(v32);
        }
        vid_puts(v32, (__int16)v37, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    v45 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 106), a1);
    goto LABEL_86;
  }
  if (a3 == a5 && a2 == a4 && Strings[129])
  {
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a3, 0);
    v38 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v41 != v39)
      goto LABEL_62;
    if (*v38 > 0x5FFFFu)
    {
      v42 = *(_DWORD *)(v40 + 24);
      v43 = BYTE1(v41);
      if (!v42)
        v42 = v43;
      if (*(_DWORD *)(a6 + 24))
        v43 = *(_DWORD *)(a6 + 24);
      if (v42 != v43)
      {
LABEL_62:
        if (*v38 <= 0x5FFFFu)
        {
          LOWORD(v44) = BYTE1(v39);
        }
        else
        {
          v44 = *(_DWORD *)(a6 + 24);
          if (!v44)
            LOWORD(v44) = BYTE1(v39);
        }
        vid_puts(v39, (__int16)v44, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    if ((int)a1 >= 1)
    {
      v60 = a1;
      do
      {
        _nc_putp((int)"scroll_forward", cur_term->type.Strings[129]);
        --v60;
      }
      while (v60);
    }
  }
  else
  {
    result = 0xFFFFFFFFLL;
    if (a3 != a5 || !Strings[22])
      return result;
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
    v49 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v52 != v50)
      goto LABEL_80;
    if (*v49 > 0x5FFFFu)
    {
      v53 = *(_DWORD *)(v51 + 24);
      v54 = BYTE1(v52);
      if (!v53)
        v53 = v54;
      if (*(_DWORD *)(a6 + 24))
        v54 = *(_DWORD *)(a6 + 24);
      if (v53 != v54)
      {
LABEL_80:
        if (*v49 <= 0x5FFFFu)
        {
          LOWORD(v55) = BYTE1(v50);
        }
        else
        {
          v55 = *(_DWORD *)(a6 + 24);
          if (!v55)
            LOWORD(v55) = BYTE1(v50);
        }
        vid_puts(v50, (__int16)v55, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    if ((int)a1 >= 1)
    {
      v61 = a1;
      do
      {
        _nc_putp((int)"delete_line", cur_term->type.Strings[22]);
        --v61;
      }
      while (v61);
    }
  }
LABEL_91:
  v56 = SP;
  if (*(_DWORD *)(SP + 752) && !*(_BYTE *)(SP + 993) && !cur_term->type.Booleans[28] && (int)a1 >= 1)
  {
    v58 = 0;
    do
    {
      _nc_mvcur(*(_DWORD *)(v56 + 764), *(_DWORD *)(v56 + 768), a3 - v58, 0);
      v56 = SP;
      if (*(__int16 *)(SP + 130) >= 1)
      {
        v59 = 0;
        do
        {
          sub_1C05D6628(a6);
          ++v59;
          v56 = SP;
        }
        while (v59 < *(__int16 *)(SP + 130));
      }
      ++v58;
    }
    while (v58 != (_DWORD)a1);
  }
  return 0;
}

uint64_t sub_1C05D57C4(uint64_t a1, int a2, int a3, int *a4)
{
  char **Strings;
  _DWORD *v8;
  int v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  int v13;
  int v14;
  int v15;
  char **v17;
  char *v18;
  const char *v19;
  int v20;
  char *v21;
  int *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char **v28;
  char *v29;
  const char *v30;
  char *v31;

  Strings = cur_term->type.Strings;
  if (!Strings[106] && !Strings[22] || !Strings[110] && !Strings[53])
    return 0xFFFFFFFFLL;
  _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
  v8 = (_DWORD *)_nc_abiver(&_nc_abiver);
  v12 = v8;
  if (v11 != v9)
    goto LABEL_12;
  if (*v8 > 0x5FFFFu)
  {
    v13 = *(_DWORD *)(v10 + 24);
    v14 = BYTE1(v11);
    if (!v13)
      v13 = v14;
    if (a4[6])
      v14 = a4[6];
    if (v13 != v14)
    {
LABEL_12:
      if (*v8 <= 0x5FFFFu)
      {
        LOWORD(v15) = BYTE1(v9);
      }
      else
      {
        v15 = a4[6];
        if (!v15)
          LOWORD(v15) = BYTE1(v9);
      }
      vid_puts(v9, (__int16)v15, 0, (int (__cdecl *)(int))_nc_outch);
    }
  }
  v17 = cur_term->type.Strings;
  if ((_DWORD)a1 != 1)
  {
    v19 = v17[106];
    if (v19)
    {
LABEL_25:
      v21 = _nc_tiparm(1, v19, a1);
      tputs(v21, a1, (int (__cdecl *)(int))_nc_outch);
      goto LABEL_27;
    }
    v20 = a1;
    if ((int)a1 < 1)
      goto LABEL_27;
    do
    {
LABEL_26:
      _nc_putp((int)"delete_line", cur_term->type.Strings[22]);
      --v20;
    }
    while (v20);
    goto LABEL_27;
  }
  v18 = v17[22];
  if (!v18)
  {
    v19 = v17[106];
    v20 = 1;
    if (v19)
      goto LABEL_25;
    goto LABEL_26;
  }
  _nc_putp((int)"delete_line", v18);
LABEL_27:
  _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a3, 0);
  v22 = *(int **)(SP + 744);
  v23 = *v22;
  v24 = *a4;
  if (*v22 != *a4)
    goto LABEL_34;
  if (*v12 > 0x5FFFFu)
  {
    v25 = v22[6];
    v26 = BYTE1(v23);
    if (!v25)
      v25 = v26;
    if (a4[6])
      v26 = a4[6];
    if (v25 != v26)
    {
LABEL_34:
      if (*v12 <= 0x5FFFFu)
      {
        LOWORD(v27) = BYTE1(v24);
      }
      else
      {
        v27 = a4[6];
        if (!v27)
          LOWORD(v27) = BYTE1(v24);
      }
      vid_puts(v24, (__int16)v27, 0, (int (__cdecl *)(int))_nc_outch);
    }
  }
  v28 = cur_term->type.Strings;
  if ((_DWORD)a1 != 1)
  {
    v30 = v28[110];
    if (v30)
    {
LABEL_46:
      v31 = _nc_tiparm(1, v30, a1);
      tputs(v31, a1, (int (__cdecl *)(int))_nc_outch);
      return 0;
    }
    if ((int)a1 < 1)
      return 0;
    do
    {
LABEL_47:
      _nc_putp((int)"insert_line", cur_term->type.Strings[53]);
      LODWORD(a1) = a1 - 1;
    }
    while ((_DWORD)a1);
    return 0;
  }
  v29 = v28[53];
  if (!v29)
  {
    v30 = v28[110];
    if (v30)
      goto LABEL_46;
    goto LABEL_47;
  }
  _nc_putp((int)"insert_line", v29);
  return 0;
}

uint64_t sub_1C05D5AAC(__int128 *a1)
{
  uint64_t v2;
  int v3;
  unsigned int *v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v22;

  v2 = *(_DWORD *)(SP + 764) & ~(*(int *)(SP + 764) >> 31);
  v3 = *(_DWORD *)(SP + 768) & ~(*(int *)(SP + 768) >> 31);
  v4 = (unsigned int *)_nc_abiver(&_nc_abiver);
  if (v9 != v5)
    goto LABEL_8;
  if (*v4 > v7)
  {
    v10 = *(_DWORD *)(v8 + 24);
    v11 = BYTE1(v9);
    if (!v10)
      v10 = v11;
    if (*((_DWORD *)a1 + 6))
      v11 = *((_DWORD *)a1 + 6);
    if (v10 != v11)
    {
LABEL_8:
      if (*v4 <= v7)
      {
        LOWORD(v12) = BYTE1(v5);
      }
      else
      {
        v12 = *((_DWORD *)a1 + 6);
        if (!v12)
          LOWORD(v12) = BYTE1(v5);
      }
      vid_puts(v5, (__int16)v12, 0, (int (__cdecl *)(int))_nc_outch);
      v6 = SP;
    }
  }
  result = tputs(*((const char **)cur_term->type.Strings + 7), *(__int16 *)(v6 + 128) - (_DWORD)v2, (int (__cdecl *)(int))_nc_outch);
  v14 = SP;
  if (v3 < *(__int16 *)(SP + 130))
  {
    v15 = 28 * v3;
    do
    {
      v16 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 136) + 40) + 16 * v2) + v15);
      v17 = *a1;
      *(_OWORD *)((char *)v16 + 12) = *(__int128 *)((char *)a1 + 12);
      *v16 = v17;
      v14 = SP;
      v15 += 28;
      ++v3;
    }
    while (v3 < *(__int16 *)(SP + 130));
  }
  for (i = (v2 + 1); (int)i < *(__int16 *)(v14 + 128); ++i)
  {
    if (*(__int16 *)(v14 + 130) >= 1)
    {
      v19 = 0;
      v20 = 0;
      do
      {
        v21 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 136) + 40) + 16 * i) + v19);
        v22 = *a1;
        *(_OWORD *)((char *)v21 + 12) = *(__int128 *)((char *)a1 + 12);
        *v21 = v22;
        ++v20;
        v14 = SP;
        v19 += 28;
      }
      while (v20 < *(__int16 *)(SP + 130));
    }
  }
  return result;
}

unsigned int *sub_1C05D5C68(unsigned int *result, int a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  __int128 v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  int v17;
  unsigned int v18;

  v2 = (uint64_t)result;
  if (*(_QWORD *)(SP + 136)
    && (*(_DWORD *)(SP + 764) & 0x80000000) == 0
    && *(_DWORD *)(SP + 768) < *(__int16 *)(SP + 130))
  {
    result = (unsigned int *)_nc_abiver(&_nc_abiver);
    do
    {
      if ((v3 & 0x80000000) == 0)
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 136) + 40) + 16 * *(int *)(v4 + 764));
        v6 = (_OWORD *)(v5 + 28 * v3);
        if (*(_DWORD *)v6 != *(_DWORD *)v2
          || *(_DWORD *)(v5 + 28 * v3 + 4) != *(_DWORD *)(v2 + 4)
          || *(_DWORD *)(v5 + 28 * v3 + 8) != *(_DWORD *)(v2 + 8)
          || *(_DWORD *)(v5 + 28 * v3 + 12) != *(_DWORD *)(v2 + 12)
          || *(_DWORD *)(v5 + 28 * v3 + 16) != *(_DWORD *)(v2 + 16)
          || *(_DWORD *)(v5 + 28 * v3 + 20) != *(_DWORD *)(v2 + 20)
          || *result >= 0x60000 && *(_DWORD *)(v5 + 28 * v3 + 24) != *(_DWORD *)(v2 + 24))
        {
          v7 = *(_OWORD *)v2;
          *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)(v2 + 12);
          *v6 = v7;
          v4 = SP;
          a2 = 1;
        }
      }
      ++v3;
    }
    while ((int)v3 < *(__int16 *)(v4 + 130));
  }
  if (a2)
  {
    result = (unsigned int *)_nc_abiver(&_nc_abiver);
    if (v12 != v8)
      goto LABEL_24;
    if (*result > v10)
    {
      v13 = *(_DWORD *)(v11 + 24);
      v14 = BYTE1(v12);
      if (!v13)
        v13 = v14;
      if (*(_DWORD *)(v2 + 24))
        v14 = *(_DWORD *)(v2 + 24);
      if (v13 != v14)
      {
LABEL_24:
        if (*result <= v10)
        {
          LOWORD(v15) = BYTE1(v8);
        }
        else
        {
          v15 = *(_DWORD *)(v2 + 24);
          if (!v15)
            LOWORD(v15) = BYTE1(v8);
        }
        result = (unsigned int *)vid_puts(v8, (__int16)v15, 0, (int (__cdecl *)(int))_nc_outch);
        v9 = SP;
      }
    }
    v16 = (char *)*((_QWORD *)cur_term->type.Strings + 6);
    if (v16)
    {
      v17 = *(__int16 *)(v9 + 130) - *(_DWORD *)(v9 + 768);
      if (*(_DWORD *)(v9 + 880) <= v17)
        return (unsigned int *)_nc_putp((int)"clr_eol", v16);
    }
    else
    {
      v17 = *(__int16 *)(v9 + 130) - *(_DWORD *)(v9 + 768);
    }
    if (v17 >= 1)
    {
      v18 = v17 + 1;
      do
      {
        result = (unsigned int *)sub_1C05D6628(v2);
        --v18;
      }
      while (v18 > 1);
    }
  }
  return result;
}

uint64_t sub_1C05D5EAC(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  char **Strings;
  _DWORD *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  _DWORD *v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  _DWORD *v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  char *v45;
  char *v46;
  const char *v47;
  uint64_t result;
  _DWORD *v49;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v58;
  int v59;
  int v60;
  int v61;

  Strings = cur_term->type.Strings;
  if ((_DWORD)a1 == 1)
  {
    if (a3 == a5 && a2 == a4 && Strings[130])
    {
      _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
      v10 = (_DWORD *)_nc_abiver(&_nc_abiver);
      if (v13 != v11)
        goto LABEL_12;
      if (*v10 > 0x5FFFFu)
      {
        v14 = *(_DWORD *)(v12 + 24);
        v15 = BYTE1(v13);
        if (!v14)
          v14 = v15;
        if (*(_DWORD *)(a6 + 24))
          v15 = *(_DWORD *)(a6 + 24);
        if (v14 != v15)
        {
LABEL_12:
          if (*v10 <= 0x5FFFFu)
          {
            LOWORD(v16) = BYTE1(v11);
          }
          else
          {
            v16 = *(_DWORD *)(a6 + 24);
            if (!v16)
              LOWORD(v16) = BYTE1(v11);
          }
          vid_puts(v11, (__int16)v16, 0, (int (__cdecl *)(int))_nc_outch);
        }
      }
      v46 = (char *)*((_QWORD *)cur_term->type.Strings + 130);
      v47 = "scroll_reverse";
LABEL_90:
      _nc_putp((int)v47, v46);
      goto LABEL_91;
    }
    if (a3 == a5 && Strings[53])
    {
      _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
      v17 = (_DWORD *)_nc_abiver(&_nc_abiver);
      if (v20 != v18)
        goto LABEL_24;
      if (*v17 > 0x5FFFFu)
      {
        v21 = *(_DWORD *)(v19 + 24);
        v22 = BYTE1(v20);
        if (!v21)
          v21 = v22;
        if (*(_DWORD *)(a6 + 24))
          v22 = *(_DWORD *)(a6 + 24);
        if (v21 != v22)
        {
LABEL_24:
          if (*v17 <= 0x5FFFFu)
          {
            LOWORD(v23) = BYTE1(v18);
          }
          else
          {
            v23 = *(_DWORD *)(a6 + 24);
            if (!v23)
              LOWORD(v23) = BYTE1(v18);
          }
          vid_puts(v18, (__int16)v23, 0, (int (__cdecl *)(int))_nc_outch);
        }
      }
      v46 = (char *)*((_QWORD *)cur_term->type.Strings + 53);
      v47 = "insert_line";
      goto LABEL_90;
    }
  }
  if (a3 == a5 && a2 == a4 && Strings[113])
  {
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
    v24 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v27 != v25)
      goto LABEL_37;
    if (*v24 > 0x5FFFFu)
    {
      v28 = *(_DWORD *)(v26 + 24);
      v29 = BYTE1(v27);
      if (!v28)
        v28 = v29;
      if (*(_DWORD *)(a6 + 24))
        v29 = *(_DWORD *)(a6 + 24);
      if (v28 != v29)
      {
LABEL_37:
        if (*v24 <= 0x5FFFFu)
        {
          LOWORD(v30) = BYTE1(v25);
        }
        else
        {
          v30 = *(_DWORD *)(a6 + 24);
          if (!v30)
            LOWORD(v30) = BYTE1(v25);
        }
        vid_puts(v25, (__int16)v30, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    v45 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 113), a1);
LABEL_86:
    tputs(v45, a1, (int (__cdecl *)(int))_nc_outch);
    goto LABEL_91;
  }
  if (a3 == a5 && Strings[110])
  {
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
    v31 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v34 != v32)
      goto LABEL_49;
    if (*v31 > 0x5FFFFu)
    {
      v35 = *(_DWORD *)(v33 + 24);
      v36 = BYTE1(v34);
      if (!v35)
        v35 = v36;
      if (*(_DWORD *)(a6 + 24))
        v36 = *(_DWORD *)(a6 + 24);
      if (v35 != v36)
      {
LABEL_49:
        if (*v31 <= 0x5FFFFu)
        {
          LOWORD(v37) = BYTE1(v32);
        }
        else
        {
          v37 = *(_DWORD *)(a6 + 24);
          if (!v37)
            LOWORD(v37) = BYTE1(v32);
        }
        vid_puts(v32, (__int16)v37, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    v45 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 110), a1);
    goto LABEL_86;
  }
  if (a3 == a5 && a2 == a4 && Strings[130])
  {
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
    v38 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v41 != v39)
      goto LABEL_62;
    if (*v38 > 0x5FFFFu)
    {
      v42 = *(_DWORD *)(v40 + 24);
      v43 = BYTE1(v41);
      if (!v42)
        v42 = v43;
      if (*(_DWORD *)(a6 + 24))
        v43 = *(_DWORD *)(a6 + 24);
      if (v42 != v43)
      {
LABEL_62:
        if (*v38 <= 0x5FFFFu)
        {
          LOWORD(v44) = BYTE1(v39);
        }
        else
        {
          v44 = *(_DWORD *)(a6 + 24);
          if (!v44)
            LOWORD(v44) = BYTE1(v39);
        }
        vid_puts(v39, (__int16)v44, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    if ((int)a1 >= 1)
    {
      v60 = a1;
      do
      {
        _nc_putp((int)"scroll_reverse", cur_term->type.Strings[130]);
        --v60;
      }
      while (v60);
    }
  }
  else
  {
    result = 0xFFFFFFFFLL;
    if (a3 != a5 || !Strings[53])
      return result;
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a2, 0);
    v49 = (_DWORD *)_nc_abiver(&_nc_abiver);
    if (v52 != v50)
      goto LABEL_80;
    if (*v49 > 0x5FFFFu)
    {
      v53 = *(_DWORD *)(v51 + 24);
      v54 = BYTE1(v52);
      if (!v53)
        v53 = v54;
      if (*(_DWORD *)(a6 + 24))
        v54 = *(_DWORD *)(a6 + 24);
      if (v53 != v54)
      {
LABEL_80:
        if (*v49 <= 0x5FFFFu)
        {
          LOWORD(v55) = BYTE1(v50);
        }
        else
        {
          v55 = *(_DWORD *)(a6 + 24);
          if (!v55)
            LOWORD(v55) = BYTE1(v50);
        }
        vid_puts(v50, (__int16)v55, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    if ((int)a1 >= 1)
    {
      v61 = a1;
      do
      {
        _nc_putp((int)"insert_line", cur_term->type.Strings[53]);
        --v61;
      }
      while (v61);
    }
  }
LABEL_91:
  v56 = SP;
  if (*(_DWORD *)(SP + 752) && !*(_BYTE *)(SP + 993) && !cur_term->type.Booleans[28] && (int)a1 >= 1)
  {
    v58 = 0;
    do
    {
      _nc_mvcur(*(_DWORD *)(v56 + 764), *(_DWORD *)(v56 + 768), v58 + a2, 0);
      v56 = SP;
      if (*(__int16 *)(SP + 130) >= 1)
      {
        v59 = 0;
        do
        {
          sub_1C05D6628(a6);
          ++v59;
          v56 = SP;
        }
        while (v59 < *(__int16 *)(SP + 130));
      }
      ++v58;
    }
    while (v58 != (_DWORD)a1);
  }
  return 0;
}

void _nc_screen_wrap()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (SP)
  {
    if (**(_DWORD **)(SP + 744) || *(_DWORD *)_nc_abiver(&_nc_abiver) >= 0x60000u && *(_DWORD *)(v1 + 24))
    {
      vid_puts(0, 0, 0, (int (__cdecl *)(int))_nc_outch);
      v0 = SP;
    }
    if (*(_DWORD *)(v0 + 752) && !*(_BYTE *)(v0 + 993))
    {
      *(_BYTE *)(v0 + 993) = 1;
      _nc_do_color(0xFFFFFFFFLL, 0, 0, (int (__cdecl *)(int))_nc_outch);
      v2 = SP;
      *(_BYTE *)(SP + 993) = 0;
      _nc_mvcur(*(_DWORD *)(v2 + 764), *(_DWORD *)(v2 + 768), *(__int16 *)(v2 + 128) - 1, 0);
      sub_1C05D5C68((unsigned int *)&xmmword_1C05E1A70, 1);
      v0 = SP;
    }
    if (*(_DWORD *)(v0 + 756))
      _nc_reset_colors();
  }
}

uint64_t sub_1C05D6628(uint64_t a1)
{
  uint64_t result;
  int v3;
  int v4;
  char **Strings;
  uint64_t v6;
  int v7;
  char *Booleans;

  result = *(unsigned int *)(SP + 764);
  if ((_DWORD)result == *(__int16 *)(SP + 128) - 1
    && (v3 = *(_DWORD *)(SP + 768), v4 = *(__int16 *)(SP + 130), v3 == v4 - 1)
    && cur_term->type.Booleans[1])
  {
    Strings = cur_term->type.Strings;
    if (Strings[151] && Strings[152])
    {
      _nc_putp((int)"exit_am_mode", Strings[152]);
      sub_1C05D6814(a1);
      --*(_DWORD *)(SP + 768);
      result = _nc_putp((int)"enter_am_mode", cur_term->type.Strings[151]);
    }
    else if (Strings[31] && Strings[42] || Strings[52] || Strings[108])
    {
      _nc_mvcur(result, v3, *(_DWORD *)(SP + 764), v4 - 2);
      sub_1C05D6814(a1);
      _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), *(__int16 *)(SP + 128) - 1, *(__int16 *)(SP + 130) - 2);
      result = sub_1C05D6C5C(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(SP + 144) + 40) + 16 * *(__int16 *)(SP + 128) - 16)+ 28 * *(__int16 *)(SP + 130)- 56, 1);
    }
  }
  else
  {
    result = sub_1C05D6814(a1);
  }
  v6 = SP;
  v7 = *(_DWORD *)(SP + 768);
  if (v7 >= *(__int16 *)(SP + 130))
  {
    Booleans = cur_term->type.Booleans;
    if (Booleans[4])
    {
      *(_QWORD *)(SP + 764) = -1;
    }
    else if (Booleans[1])
    {
      *(_DWORD *)(SP + 768) = 0;
      ++*(_DWORD *)(v6 + 764);
      if (!Booleans[14])
      {
        if (**(_DWORD **)(v6 + 744))
          return vid_puts(0, 0, 0, (int (__cdecl *)(int))_nc_outch);
      }
    }
    else
    {
      *(_DWORD *)(SP + 768) = v7 - 1;
    }
  }
  return result;
}

uint64_t sub_1C05D6814(uint64_t result)
{
  unsigned int v1;
  __int128 *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  char *v24;
  unsigned int v25;
  uint64_t v26;
  char *v27;
  char v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  char v36[6];
  _OWORD v37[2];
  mbstate_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)result;
  if ((*(_DWORD *)result & 0xFEu) - 2 < 0x1E)
    return result;
  v2 = (__int128 *)result;
  v3 = *(_DWORD *)(result + 24);
  memset(&v38, 0, sizeof(v38));
  v4 = wcwidth(*(_DWORD *)(result + 4));
  if (v4 <= 0)
  {
    v6 = *((unsigned int *)v2 + 1);
    if (v6 > 0xFF)
    {
LABEL_14:
      v2 = &xmmword_1C05E1A70;
      goto LABEL_15;
    }
    if (v6 > 0x7F)
    {
      if (!__maskrune(*((_DWORD *)v2 + 1), 0x40000uLL))
        goto LABEL_9;
    }
    else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60) & 0x40000) == 0)
    {
LABEL_9:
      v7 = *(_DWORD *)(SP + 1456);
      if (v6 >= 0xA0 && v7 > 0)
        goto LABEL_15;
      if (v7 >= 2 && *((int *)v2 + 1) > 127)
        goto LABEL_15;
      if ((v1 & 0x400000) != 0)
      {
        v30 = *((int *)v2 + 1);
        if ((int)v30 > 127)
          goto LABEL_15;
        v31 = *(_QWORD *)(SP + 1024);
        if (v31)
        {
          if (*(_DWORD *)(v31 + 4 * v30))
            goto LABEL_15;
        }
      }
      goto LABEL_14;
    }
LABEL_15:
    v5 = 1;
    goto LABEL_16;
  }
  v5 = v4;
LABEL_16:
  memset(v37, 0, 28);
  v8 = &_nc_abiver;
  if ((v1 & 0x400000) != 0)
  {
    v9 = *(_QWORD *)(SP + 1024);
    if (v9)
    {
      v10 = *((int *)v2 + 1);
      if ((int)v10 <= 127)
      {
        v37[0] = *v2;
        *(_OWORD *)((char *)v37 + 12) = *(__int128 *)((char *)v2 + 12);
        if (*(_BYTE *)(SP + 1600) && *(_BYTE *)(*(_QWORD *)(SP + 1032) + SDWORD1(v37[0])))
        {
          v11 = (_OWORD *)(_nc_wacs + 28 * SDWORD1(v37[0]));
        }
        else
        {
          if (!*(_BYTE *)(SP + 1601)
            || *(_BYTE *)(*(_QWORD *)(SP + 1032) + SDWORD1(v37[0]))
            || !*(_DWORD *)(_nc_wacs + 28 * SDWORD1(v37[0]) + 4))
          {
            goto LABEL_25;
          }
          v11 = (_OWORD *)(_nc_wacs + 28 * SDWORD1(v37[0]));
        }
        v1 &= ~0x400000u;
        v37[0] = *v11;
        *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)((char *)v11 + 12);
LABEL_25:
        if ((v1 & 0x400000) != 0)
        {
          v12 = *(unsigned __int8 *)(v9 + 4 * v10);
          if (v12)
          {
            memset((char *)v37 + 8, 0, 20);
            *(_QWORD *)&v37[0] = __PAIR64__(v12, v1);
            v13 = (unsigned int *)_nc_abiver(&_nc_abiver);
            if (*v13 > v14)
            {
              DWORD2(v37[1]) = BYTE1(v1);
              LODWORD(v37[0]) = v1 & 0xFFFF00FF | (BYTE1(v1) << 8);
            }
          }
          else
          {
            v37[0] = *v2;
            *(_OWORD *)((char *)v37 + 12) = *(__int128 *)((char *)v2 + 12);
            v1 &= ~0x400000u;
          }
        }
        v2 = v37;
      }
    }
  }
  v32 = 0;
  v33 = 0;
  v35 = 0;
  v34 = 0;
  if (cur_term->type.Booleans[18] && *((_DWORD *)v2 + 1) == 126)
  {
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v32 = v1 | 0x6000000000;
    v15 = (unsigned int *)(*v8)(v8);
    if (*v15 > v16)
    {
      v35 = BYTE1(v1);
      LODWORD(v32) = v1 & 0xFFFF00FF | (BYTE1(v1) << 8);
    }
    v2 = (__int128 *)&v32;
  }
  result = (*v8)(v8);
  if (v19 != v1)
    goto LABEL_43;
  if (*(_DWORD *)result > v17)
  {
    v20 = *(_DWORD *)(v18 + 24);
    v21 = BYTE1(v1);
    if (!v20)
      v20 = BYTE1(v1);
    if (v3)
      v21 = v3;
    if (v20 != v21)
    {
LABEL_43:
      if (*(_DWORD *)result <= v17)
      {
        v22 = BYTE1(v1);
      }
      else
      {
        v22 = BYTE1(v1);
        if (v3)
          v22 = v3;
      }
      result = vid_puts(v1, v22, 0, (int (__cdecl *)(int))_nc_outch);
    }
  }
  if ((*(_DWORD *)v2 & 0xFEu) - 2 >= 0x1E)
  {
    if (!*((_DWORD *)v2 + 2) && (result = _nc_is_charable(*((_DWORD *)v2 + 1)), (_DWORD)result))
    {
LABEL_60:
      result = _nc_outch(*((_DWORD *)v2 + 1));
    }
    else
    {
      v23 = 0;
      memset(&v38, 0, sizeof(v38));
      do
      {
        v24 = (char *)v2 + 4 * v23;
        v25 = *((_DWORD *)v24 + 1);
        if (!v25)
          break;
        result = wcrtomb(v36, *((_DWORD *)v24 + 1), &v38);
        if ((int)result < 1)
        {
          if ((_DWORD)v23 || v25 > 0xFF)
            break;
          goto LABEL_60;
        }
        v26 = result;
        v27 = v36;
        do
        {
          v28 = *v27++;
          result = _nc_outch(v28);
          --v26;
        }
        while (v26);
        ++v23;
      }
      while (v23 != 5);
    }
  }
  *(_DWORD *)(SP + 768) += v5;
  v29 = (char *)*((_QWORD *)cur_term->type.Strings + 145);
  if (v29)
    return _nc_putp((int)"char_padding", v29);
  return result;
}

uint64_t sub_1C05D6C5C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  TERMINAL *v4;
  char **Strings;
  const char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  v3 = result;
  v4 = cur_term;
  Strings = cur_term->type.Strings;
  v6 = Strings[108];
  if (v6)
  {
    v7 = _nc_tiparm(1, v6, a2);
    for (result = tputs(v7, a2, (int (__cdecl *)(int))_nc_outch); (_DWORD)a2; LODWORD(a2) = a2 - 1)
    {
      result = sub_1C05D6814(v3);
      v3 += 28;
    }
  }
  else
  {
    v8 = Strings[31];
    if (v8 && Strings[42])
    {
      _nc_putp((int)"enter_insert_mode", v8);
      for (; (_DWORD)a2; LODWORD(a2) = a2 - 1)
      {
        sub_1C05D6814(v3);
        v9 = (char *)*((_QWORD *)cur_term->type.Strings + 54);
        if (v9)
          _nc_putp((int)"insert_padding", v9);
        v3 += 28;
      }
      return _nc_putp((int)"exit_insert_mode", cur_term->type.Strings[42]);
    }
    else
    {
      for (; (_DWORD)a2; LODWORD(a2) = a2 - 1)
      {
        _nc_putp((int)"insert_character", v4->type.Strings[52]);
        result = sub_1C05D6814(v3);
        v4 = cur_term;
        v10 = (char *)*((_QWORD *)cur_term->type.Strings + 54);
        if (v10)
        {
          result = _nc_putp((int)"insert_padding", v10);
          v4 = cur_term;
        }
        v3 += 28;
      }
    }
  }
  return result;
}

uint64_t sub_1C05D6DB8(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  int v5;
  int v7;
  uint64_t result;
  int v9;
  int v10;
  int v11;
  int v12;
  _DWORD *v14;
  int v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t v18;
  _DWORD *v19;
  int v20;

  v5 = a4;
  v7 = a5 - a4;
  if (a1 == a2 || v7 < *(_DWORD *)(SP + 924))
    return sub_1C05D7058((_DWORD *)(a2 + 28 * a4), (v7 + 1));
  v9 = -a4;
  if (a5 >= a4)
  {
    v14 = (_DWORD *)_nc_abiver(&_nc_abiver);
    v12 = 0;
    v10 = 0;
    v11 = v15 + 1;
    v16 = 28 * v5 + 12;
    v17 = (_DWORD *)(a2 + v16);
    v19 = (_DWORD *)(v18 + v16);
    v20 = v5;
    while (v10 || (*(v19 - 3) & 0xFEu) - 2 >= 0x1E)
    {
      if (*(v19 - 3) == *(v17 - 3)
        && *(v19 - 2) == *(v17 - 2)
        && *(v19 - 1) == *(v17 - 1)
        && *v19 == *v17
        && v19[1] == v17[1]
        && v19[2] == v17[2]
        && (*v14 < 0x60000u || v19[3] == v17[3]))
      {
        ++v10;
      }
      else
      {
        if (v10 <= *(_DWORD *)(SP + 924))
          break;
        sub_1C05D7058((_DWORD *)(a2 + 28 * v20), (v5 + v9 + v12));
        _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), a3, v5);
        v10 = 0;
        v20 = v5;
      }
LABEL_21:
      v12 = -v10;
      v9 = -v20;
      ++v5;
      v17 += 7;
      v19 += 7;
      if (v11 == v5)
      {
        v5 = v20;
        goto LABEL_23;
      }
    }
    v10 = 0;
    goto LABEL_21;
  }
  v10 = 0;
  v11 = a4;
  v12 = 0;
LABEL_23:
  LODWORD(result) = sub_1C05D7058((_DWORD *)(a2 + 28 * v5), (v11 + v9 + v12));
  if (v10)
    return 1;
  else
    return result;
}

uint64_t sub_1C05D6FBC(uint64_t result)
{
  int v1;
  const char *v2;
  char *v3;

  v1 = result;
  v2 = (const char *)*((_QWORD *)cur_term->type.Strings + 105);
  if (v2)
  {
    v3 = _nc_tiparm(1, v2, result);
    return tputs(v3, v1, (int (__cdecl *)(int))_nc_outch);
  }
  else if ((int)result >= 1)
  {
    do
    {
      result = _nc_putp((int)"delete_character", cur_term->type.Strings[21]);
      --v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_1C05D7058(_DWORD *a1, uint64_t a2)
{
  uint64_t v2;
  char **Strings;
  unsigned int *v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  BOOL v10;
  __int128 v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  unsigned int v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  int v21;
  int v22;
  _BOOL4 v23;
  int *v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  unint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t result;
  BOOL v33;
  _BOOL4 v34;
  __int16 v35;
  int v36;
  char *v37;
  __int16 v38;
  char *v39;
  uint64_t v40;
  __int128 v41;
  int v42;
  int v43;
  int v44[7];
  __int16 v45[2];

  v2 = a2;
  Strings = cur_term->type.Strings;
  if (!Strings[37] && !Strings[121])
  {
    if ((int)a2 >= 1)
    {
      v40 = a2;
      do
      {
        sub_1C05D6628((uint64_t)a1);
        a1 += 7;
        --v40;
      }
      while (v40);
    }
    return 0;
  }
  if ((int)a2 < 1)
    return 0;
  v5 = (unsigned int *)_nc_abiver(&_nc_abiver);
  while (1)
  {
    memset(v44, 0, sizeof(v44));
    if (v2 < 2)
    {
      v8 = a1;
LABEL_96:
      v41 = *(_OWORD *)v8;
      *(_OWORD *)&v44[3] = *(_OWORD *)(v8 + 3);
      *(_OWORD *)v44 = v41;
LABEL_97:
      sub_1C05D6628((uint64_t)v44);
      return 0;
    }
    v6 = v2 - 2;
    v7 = a1 + 20;
    v8 = a1;
    while (1)
    {
      v9 = v8[7];
      v8 += 7;
      if (*a1 == v9
        && a1[1] == a1[8]
        && a1[2] == a1[9]
        && a1[3] == a1[10]
        && a1[4] == a1[11]
        && a1[5] == a1[12]
        && (*v5 < 0x60000 || a1[6] == a1[13]))
      {
        break;
      }
      sub_1C05D6628((uint64_t)a1);
      --v6;
      v7 += 7;
      a1 = v8;
      v10 = (int)v2 <= 2;
      v2 = (v2 - 1);
      if (v10)
        goto LABEL_96;
    }
    v11 = *(_OWORD *)a1;
    *(_OWORD *)&v44[3] = *(_OWORD *)(a1 + 3);
    *(_OWORD *)v44 = v11;
    if ((_DWORD)v2 == 1)
      goto LABEL_97;
    if ((int)v2 < 3)
    {
      v12 = 0;
      v14 = 2;
    }
    else
    {
      v12 = 1;
      v13 = 3;
      while (*(v7 - 6) == v44[0]
           && *(v7 - 5) == v44[1]
           && *(v7 - 4) == v44[2]
           && *(v7 - 3) == v44[3]
           && *(v7 - 2) == v44[4]
           && *(v7 - 1) == v44[5]
           && (*v5 <= 0x5FFFF || *v7 == v44[6]))
      {
        v12 = v13++ < v2;
        v7 += 7;
        if (!--v6)
        {
          v14 = v2;
          goto LABEL_33;
        }
      }
      v14 = (v13 - 1);
    }
LABEL_33:
    if (!*((_QWORD *)cur_term->type.Strings + 37)
      || (int)v14 <= *(_DWORD *)(SP + 916) + *(_DWORD *)(SP + 904)
      || !cur_term->type.Booleans[28]
      && *(_DWORD *)(SP + 752)
      && (!*(_BYTE *)(SP + 993)
       || *(_DWORD *)(SP + 996) != 511
       || *(_DWORD *)(SP + 1000) != 511
       || (*v5 >= 0x60000 && (v19 = v44[6], v44[6]) || (v19 = BYTE1(v44[0]), BYTE1(v44[0])))
       && ((*(_DWORD *)v45 = 0, pair_content(v19, &v45[1], v45) == -1) || v45[1] != 511 || v45[0] != 511))
      || v44[1] != 32
      || v44[2]
      || (v44[0] & 0x7FC700FF) != 0)
    {
      v20 = (const char *)*((_QWORD *)cur_term->type.Strings + 121);
      if (!v20 || (int)v14 <= *(_DWORD *)(SP + 908))
      {
        v29 = 0;
        if (v14 <= 1)
          v30 = 1;
        else
          v30 = v14;
        v31 = 28 * v30;
        do
        {
          sub_1C05D6628((uint64_t)&a1[v29 / 4]);
          v29 += 28;
        }
        while (v31 != v29);
        goto LABEL_72;
      }
      v43 = v14;
      v21 = *(_DWORD *)(SP + 768) + v14;
      v22 = *(__int16 *)(SP + 130);
      v23 = v21 >= v22;
      v24 = *(int **)(SP + 744);
      v25 = *v24;
      v26 = *v5;
      v42 = v21;
      if (*v24 == v44[0])
      {
        if (v26 <= 0x5FFFF)
          goto LABEL_81;
        v27 = v24[6];
        v28 = BYTE1(v25);
        if (!v27)
          v27 = v28;
        if (v44[6])
          v28 = v44[6];
        if (v27 == v28)
          goto LABEL_81;
      }
      else if (v26 <= 0x5FFFF)
      {
        v34 = v21 >= v22;
        v35 = BYTE1(v44[0]);
LABEL_80:
        vid_puts(v44[0], v35, 0, (int (__cdecl *)(int))_nc_outch);
        v20 = (const char *)*((_QWORD *)cur_term->type.Strings + 121);
        v23 = v34;
LABEL_81:
        LODWORD(v14) = v43;
        v36 = v43 - v23;
        v37 = _nc_tiparm(2, v20, v44[1], (v43 - v23));
        tputs(v37, v36, (int (__cdecl *)(int))_nc_outch);
        *(_DWORD *)(SP + 768) += v36;
        if (v42 >= v22)
          sub_1C05D6628((uint64_t)v44);
        goto LABEL_72;
      }
      v34 = v21 >= v22;
      v35 = v44[6];
      if (!v44[6])
        v35 = BYTE1(v44[0]);
      goto LABEL_80;
    }
    v15 = *(_DWORD **)(SP + 744);
    v16 = *v5;
    if (*v15 != v44[0])
    {
      if (v16 <= 0x5FFFF)
      {
        v38 = BYTE1(v44[0]);
      }
      else
      {
LABEL_84:
        v38 = v44[6];
        if (!v44[6])
          v38 = BYTE1(v44[0]);
      }
      vid_puts(v44[0], v38, 0, (int (__cdecl *)(int))_nc_outch);
      goto LABEL_89;
    }
    if (v16 > 0x5FFFF)
    {
      v17 = v15[6];
      v18 = BYTE1(v44[0]);
      if (!v17)
        v17 = BYTE1(v44[0]);
      if (v44[6])
        v18 = v44[6];
      if (v17 != v18)
        goto LABEL_84;
    }
LABEL_89:
    v39 = _nc_tiparm(1, *((const char **)cur_term->type.Strings + 37), v14);
    _nc_putp((int)"erase_chars", v39);
    if (!v12)
      return 1;
    _nc_mvcur(*(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768), *(_DWORD *)(SP + 764), *(_DWORD *)(SP + 768) + v14);
LABEL_72:
    result = 0;
    a1 += 7 * v14;
    v33 = __OFSUB__((_DWORD)v2, (_DWORD)v14);
    v2 = (v2 - v14);
    if (((int)v2 < 0) ^ v33 | ((_DWORD)v2 == 0))
      return result;
  }
}

char *_nc_unctrl(uint64_t a1, unsigned __int8 a2)
{
  unsigned int v2;
  int v3;
  char *v4;

  v2 = a2;
  if (a1
    && ((v3 = *(_DWORD *)(a1 + 1456), (a2 & 0xE0) == 0x80) && v3 >= 2
     || a2 >= 0xA0u && (v3 > 0 || !v3 && __maskrune(a2, 0x40000uLL))))
  {
    v4 = (char *)&unk_1C05E1C8C + 2 * v2 - 256;
  }
  else
  {
    v4 = (char *)&unk_1C05E1A8C + 2 * v2;
  }
  return (char *)&unk_1C05E1D8C + *(__int16 *)v4;
}

char *__cdecl unctrl(chtype a1)
{
  return _nc_unctrl(SP, a1);
}

int use_screen(SCREEN *a1, NCURSES_SCREEN_CB a2, void *a3)
{
  SCREEN *v6;

  v6 = (SCREEN *)SP;
  set_term(a1);
  LODWORD(a3) = ((uint64_t (*)(SCREEN *, void *))a2)(a1, a3);
  set_term(v6);
  return (int)a3;
}

int use_window(WINDOW *a1, NCURSES_WINDOW_CB a2, void *a3)
{
  return ((uint64_t (*)(WINDOW *, void *))a2)(a1, a3);
}

const char *curses_version(void)
{
  return "ncurses 6.0.20150808";
}

const char *__cdecl _nc_visbuf2(int a1, const char *a2)
{
  return sub_1C05D76D4(a1, (char *)a2, -1);
}

const char *sub_1C05D76D4(int a1, char *__s, int a3)
{
  unsigned __int8 *v3;
  const char *v4;
  int v5;
  _BYTE *v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!__s)
    return "(null)";
  v3 = (unsigned __int8 *)__s;
  if (__s == (char *)-1)
    return "(cancelled)";
  v5 = a3;
  if (a3 < 0)
  {
    v5 = strlen(__s);
    if ((a1 & 0x80000000) == 0)
      goto LABEL_7;
  }
  else if ((a1 & 0x80000000) == 0)
  {
LABEL_7:
    v7 = _nc_doalloc((void *)qword_1EF614C78[a1], 4 * v5 + 4);
    qword_1EF614C78[a1] = (uint64_t)v7;
    if (!v7)
      return "(_nc_visbuf2n failed)";
    v4 = v7;
    *v7 = 34;
    v8 = v7 + 1;
    if (v5 < 1)
    {
LABEL_36:
      *(_WORD *)v8 = 34;
      return v4;
    }
    v9 = v5 + 1;
    v10 = MEMORY[0x1E0C80978];
    while (1)
    {
      v11 = *v3;
      if (!*v3)
        goto LABEL_36;
      if ((_DWORD)v11 == 92 || (_DWORD)v11 == 34)
      {
        *v8 = 92;
        v8[1] = v11;
        v8 += 2;
      }
      else if ((v11 & 0x80) == 0 && ((_DWORD)v11 == 32 || (*(_DWORD *)(v10 + 4 * v11 + 60) & 0x800) != 0))
      {
        *v8++ = v11;
      }
      else
      {
        if (*v3 <= 0xCu)
        {
          if ((_DWORD)v11 == 8)
          {
            *(_WORD *)v8 = 25180;
            v8 += 2;
            goto LABEL_14;
          }
          if ((_DWORD)v11 == 10)
          {
            *(_WORD *)v8 = 28252;
            v8 += 2;
            goto LABEL_14;
          }
        }
        else
        {
          switch((_DWORD)v11)
          {
            case 0xD:
              *(_WORD *)v8 = 29276;
              v8 += 2;
              goto LABEL_14;
            case 0x1B:
              *(_WORD *)v8 = 25948;
              v8 += 2;
              goto LABEL_14;
            case 0x7F:
              *(_WORD *)v8 = 24156;
              v8[2] = 63;
LABEL_35:
              v8 += 3;
              goto LABEL_14;
          }
        }
        if ((v11 & 0x80) == 0 && (*(_DWORD *)(v10 + 4 * v11 + 60) & 0x200) != 0)
        {
          *(_WORD *)v8 = 24156;
          v8[2] = v11 + 64;
          goto LABEL_35;
        }
        sprintf(v8, "\\%03lo", *v3);
        v8 += strlen(v8);
      }
LABEL_14:
      ++v3;
      *v8 = 0;
      if (--v9 <= 1)
        goto LABEL_36;
    }
  }
  v12 = 0;
  v4 = "(_nc_visbuf2n failed)";
  do
  {
    free((void *)qword_1EF614C78[v12]);
    qword_1EF614C78[v12++] = 0;
  }
  while (v12 != 4);
  return v4;
}

const char *__cdecl _nc_visbuf(const char *a1)
{
  return sub_1C05D76D4(0, (char *)a1, -1);
}

const char *_nc_visbufn(char *__s, int a2)
{
  return sub_1C05D76D4(0, __s, a2);
}

int wresize(WINDOW *a1, int a2, int a3)
{
  int v4;
  int v6;
  int v8;
  uint64_t v11;
  void **v12;
  void **v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  int v17;
  int v18;
  _OWORD *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  __int128 v32;
  _OWORD *v33;
  __int16 *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  int v40;
  int v41;
  __int16 v42;
  char v43;
  uint64_t __size;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;

  if (!a1)
    return -1;
  v4 = a2 - 1;
  if (a2 < 1)
    return -1;
  v6 = a3 - 1;
  if (a3 < 1)
    return -1;
  v8 = *((__int16 *)a1 + 2);
  if (v4 == v8 && v6 == *((__int16 *)a1 + 3))
    return 0;
  v48 = a3 - 1;
  v47 = *((__int16 *)a1 + 3);
  if ((*((_WORD *)a1 + 6) & 1) != 0)
  {
    v11 = *((_QWORD *)a1 + 8);
    if (*((_DWORD *)a1 + 14) + v4 > *(__int16 *)(v11 + 4) || *((_DWORD *)a1 + 13) + v6 > *(__int16 *)(v11 + 6))
      return -1;
    v46 = *(_QWORD *)(v11 + 40);
  }
  else
  {
    v46 = 0;
  }
  v45 = a2;
  v12 = (void **)calloc(a2, 0x10uLL);
  if (!v12)
    return -1;
  v13 = v12;
  v40 = a2;
  v41 = v8;
  v14 = 0;
  v15 = *((_WORD *)a1 + 6);
  v16 = v46;
  v17 = v47;
  v18 = v47 + 1;
  v19 = (_OWORD *)((char *)a1 + 88);
  v20 = v8;
  __size = 28 * a3;
  v21 = v48;
  v22 = v45;
  v43 = v15;
  v42 = v4;
  do
  {
    if (v14 > v20)
      v23 = 0;
    else
      v23 = v18;
    if ((v15 & 1) != 0)
    {
      if (v16 && (v26 = *(_QWORD *)(v16 + 16 * (*((_DWORD *)a1 + 14) + (int)v14))) != 0)
        v25 = (_OWORD *)(v26 + 28 * *((int *)a1 + 13));
      else
        v25 = 0;
    }
    else if (v14 > v20)
    {
      v25 = malloc(__size);
      v27 = a3;
      v28 = v25;
      if (!v25)
        goto LABEL_54;
      do
      {
        *v28 = *v19;
        *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)((char *)a1 + 100);
        v28 = (_OWORD *)((char *)v28 + 28);
        --v27;
      }
      while (v27);
      v21 = v48;
      v16 = v46;
      v17 = v47;
      v22 = v45;
      v18 = v47 + 1;
      LOBYTE(v15) = v43;
    }
    else
    {
      if (v21 == v17)
      {
        v24 = *((_QWORD *)a1 + 5);
        v25 = *(_OWORD **)(v24 + 16 * v14);
        goto LABEL_39;
      }
      v25 = malloc(__size);
      if (!v25)
      {
LABEL_54:
        sub_1C05D7CC0(v13, v14);
        return -1;
      }
      v29 = 0;
      v30 = 0;
      v21 = v48;
      v17 = v47;
      v22 = v45;
      v18 = v47 + 1;
      LOBYTE(v15) = v43;
      do
      {
        v31 = (_OWORD *)((char *)v25 + v29);
        if (v30 <= v47)
        {
          v33 = (_OWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 16 * v14) + v29);
          v32 = *(_OWORD *)((char *)v33 + 12);
          *v31 = *v33;
        }
        else
        {
          *v31 = *v19;
          v32 = *(_OWORD *)((char *)a1 + 100);
        }
        *(_OWORD *)((char *)v31 + 12) = v32;
        ++v30;
        v29 += 28;
      }
      while (a3 != v30);
      v16 = v46;
    }
    if (v14 > v20)
      goto LABEL_41;
    v24 = *((_QWORD *)a1 + 5);
LABEL_39:
    LODWORD(v13[2 * v14 + 1]) = *(_DWORD *)(v24 + 16 * v14 + 8);
    if (v21 != v17 || v14 > v20)
    {
LABEL_41:
      v34 = (__int16 *)&v13[2 * v14 + 1];
      if (v23 >= a3)
      {
        LOWORD(v23) = 0;
      }
      else if (v23 <= *v34)
      {
        goto LABEL_46;
      }
      *v34 = v23;
LABEL_46:
      WORD1(v13[2 * v14 + 1]) = v21;
    }
    v13[2 * v14++] = v25;
  }
  while (v14 != v22);
  if ((v15 & 1) == 0)
  {
    if (v48 == v17)
    {
      if (v41 >= v40)
      {
        v35 = 16 * v40;
        v36 = v41 - v40 + 1;
        do
        {
          free(*(void **)(*((_QWORD *)a1 + 5) + v35));
          v35 += 16;
          --v36;
        }
        while (v36);
      }
    }
    else if ((v41 & 0x80000000) == 0)
    {
      v37 = 0;
      do
      {
        free(*(void **)(*((_QWORD *)a1 + 5) + v37));
        v37 += 16;
      }
      while (16 * (v41 + 1) != v37);
    }
  }
  free(*((void **)a1 + 5));
  *((_QWORD *)a1 + 5) = v13;
  *((_WORD *)a1 + 3) = v48;
  *((_WORD *)a1 + 2) = v42;
  if (*((__int16 *)a1 + 24) > v42)
    *((_WORD *)a1 + 24) = v42;
  v38 = *((__int16 *)a1 + 25);
  if (v38 > v42 || v38 == v41)
    *((_WORD *)a1 + 25) = v42;
  if (*((__int16 *)a1 + 1) > (__int16)v48)
    *((_WORD *)a1 + 1) = v48;
  if (*(__int16 *)a1 > v42)
    *(_WORD *)a1 = v42;
  sub_1C05D7D0C((uint64_t)a1);
  return 0;
}

void sub_1C05D7CC0(void **a1, int a2)
{
  unint64_t v3;

  if (a2 >= 1)
  {
    v3 = a2 + 1;
    do
      free(a1[2 * (v3-- - 2)]);
    while (v3 > 1);
  }
  free(a1);
}

uint64_t sub_1C05D7D0C(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  unsigned __int16 v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;

  v1 = *(uint64_t **)&PC[464];
  if (*(_QWORD *)&PC[464])
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 40);
    do
    {
      if (v1[10] == v2)
      {
        v4 = *((_DWORD *)v1 + 18);
        v5 = *(__int16 *)(v2 + 4);
        if (v4 > v5)
        {
          *((_DWORD *)v1 + 18) = v5;
          v4 = v5;
        }
        v6 = *((_DWORD *)v1 + 17);
        v7 = *(__int16 *)(v2 + 6);
        if (v6 > v7)
        {
          *((_DWORD *)v1 + 17) = v7;
          v6 = v7;
        }
        if (v4 + *((__int16 *)v1 + 10) <= v5)
        {
          v8 = *((_WORD *)v1 + 10);
        }
        else
        {
          v8 = v5 - v4;
          *((_WORD *)v1 + 10) = v8;
        }
        if (v6 + *((__int16 *)v1 + 11) > v7)
          *((_WORD *)v1 + 11) = v7 - v6;
        if ((v8 & 0x8000) == 0)
        {
          v9 = (_QWORD *)v1[7];
          v10 = v8 + 1;
          v11 = (uint64_t *)(v3 + 16 * v4);
          do
          {
            v12 = *v11;
            v11 += 2;
            *v9 = v12 + 28 * v6;
            v9 += 2;
            --v10;
          }
          while (v10);
        }
        result = sub_1C05D7D0C(v1 + 2);
      }
      v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
  return result;
}

void _nc_set_writedir(const char *a1)
{
  const char *v1;
  char *v2;
  const char *v3;
  const char *v4;
  char *v5;
  int *v6;
  char __s1[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1 || (a1 = getenv("TERMINFO")) != 0)
    _nc_tic_dir(a1);
  v1 = _nc_tic_dir(0);
  if ((sub_1C05D7EE4(v1) & 0x80000000) != 0)
  {
    v2 = _nc_home_terminfo();
    if (v2)
    {
      v3 = v2;
      if ((sub_1C05D7EE4(v2) & 0x80000000) != 0)
      {
        v6 = __error();
        _nc_err_abort("%s: permission denied (errno %d)", v3, *v6);
      }
      v1 = v3;
    }
  }
  v4 = _nc_tic_dir(v1);
  if (chdir(v4) < 0 || !getcwd(__s1, 0x400uLL))
    _nc_err_abort("%s: not a directory", v1);
  v5 = strdup(__s1);
  _nc_keep_tic_dir(v5);
}

uint64_t sub_1C05D7EE4(const char *a1)
{
  const char *v2;
  const char *v3;
  size_t v4;
  int v5;
  unsigned int v6;
  stat v8;
  char v9[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _nc_tic_dir(0);
  if (v2 == a1 || (v3 = v2, _nc_is_abs_path(a1)))
  {
    if (strlen(a1) + 1 > 0x400)
      return 0xFFFFFFFFLL;
    __strcpy_chk();
  }
  else
  {
    v4 = strlen(v3);
    if (v4 + strlen(a1) + 2 > 0x400)
      return 0xFFFFFFFFLL;
    __sprintf_chk(v9, 0, 0x400uLL, "%s/%s", v3, a1);
  }
  memset(&v8, 0, sizeof(v8));
  v5 = stat(a1, &v8);
  if (v5 < 0)
    return mkdir(a1, 0x1FFu);
  v6 = v5;
  if ((_nc_access(a1, 7) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if ((v8.st_mode & 0xF000) == 0x4000)
    return v6;
  else
    return 0xFFFFFFFFLL;
}

void _nc_write_entry(TERMTYPE *const a1)
{
  const char **v1;
  size_t v2;
  unint64_t v3;
  char *i;
  char *v5;
  uint64_t v7;
  char *v8;
  int v9;
  int v10;
  uint64_t v11;
  const char *v12;
  stat v13;
  char __s[4096];
  char v15[1024];
  char v16[1024];
  uint64_t v17;

  v1 = (const char **)((uint64_t (*)(TERMTYPE *const))MEMORY[0x1E0C80A78])(a1);
  v17 = *MEMORY[0x1E0C80C00];
  v2 = strlen(*v1);
  if (!v2)
    _nc_syserr_abort("no terminal name found.");
  v3 = v2;
  if (v2 >= 0xFFF)
    _nc_syserr_abort("terminal name too long: %s", *v1);
  memset(&v13, 0, sizeof(v13));
  __strcpy_chk();
  i = &__s[v3];
  v5 = &__s[v3 - 1];
  if (v3 >= 2)
  {
    do
    {
      if (*v5 == 124)
        break;
      --v5;
    }
    while (v5 > __s);
  }
  if (v5 != __s)
  {
    *v5 = 0;
    for (i = __s; *i; ++i)
    {
      if (*i == 124)
      {
        *i++ = 0;
        break;
      }
    }
  }
  _nc_set_type(__s);
  if (!dword_1EF614C98++)
    qword_1EF614CA0 = 0;
  if (strlen(__s) >= 0x3FC)
    _nc_warning("terminal name too long.");
  __sprintf_chk(v16, 0, 0x400uLL, "%02x/%s", __s[0], __s);
  if (qword_1EF614CA0 >= 1 && (stat(v16, &v13) & 0x80000000) == 0 && v13.st_mtimespec.tv_sec >= qword_1EF614CA0)
    _nc_warning("name multiply defined.");
  sub_1C05D83A4(__s[0]);
  sub_1C05D8460((uint64_t)v16, (uint64_t)v1, v7);
  if (!qword_1EF614CA0 && (stat(v16, &v13) < 0 || (qword_1EF614CA0 = v13.st_mtimespec.tv_sec) == 0))
  {
    v12 = _nc_tic_dir(0);
    _nc_syserr_abort("error obtaining time from %s/%s", v12, v16);
  }
  while (*i)
  {
    v8 = i++;
    while (1)
    {
      v10 = *i++;
      v9 = v10;
      if (!v10)
        break;
      if (v9 == 124)
      {
        *(i - 1) = 0;
        goto LABEL_29;
      }
    }
    --i;
LABEL_29:
    if (strlen(v8) < 0x3FD)
    {
      if (strchr(v8, 47))
      {
        _nc_warning("cannot link alias %s.");
      }
      else
      {
        sub_1C05D83A4(*v8);
        __sprintf_chk(v15, 0, 0x400uLL, "%02x/%s", *v8, v8);
        if (!strcmp(v16, v15))
        {
          _nc_warning("self-synonym ignored");
        }
        else if (stat(v15, &v13) < 0 || v13.st_mtimespec.tv_sec >= qword_1EF614CA0)
        {
          if (!_nc_access(v15, 2))
            sub_1C05D8460((uint64_t)v15, (uint64_t)v1, v11);
        }
        else
        {
          _nc_warning("alias %s multiply defined.");
        }
      }
    }
    else
    {
      _nc_warning("terminal alias %s too long.");
    }
  }
}

uint64_t sub_1C05D83A4(int __c)
{
  uint64_t result;
  uint64_t v3;
  const char *v4;
  char v5[5];

  if (!__c
    || (result = (uint64_t)memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", __c, 0x3FuLL)) == 0)
  {
    _nc_err_abort("Illegal terminfo subdirectory \"%02x\"", __c);
  }
  v3 = result - (_QWORD)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  if (!byte_1EF614CAC[result - (_QWORD)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"])
  {
    __sprintf_chk(v5, 0, 5uLL, "%02x", __c);
    result = sub_1C05D7EE4(v5);
    if ((result & 0x80000000) != 0)
    {
      v4 = _nc_tic_dir(0);
      _nc_err_abort("%s/%s: permission denied", v4, v5);
    }
    byte_1EF614CAC[v3] = 1;
  }
  return result;
}

uint64_t sub_1C05D8460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  FILE *v7;
  FILE *v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _WORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char **v21;
  unint64_t v22;
  int v23;
  __int16 v24;
  __int16 v25;
  int v26;
  unsigned int v27;
  BOOL *v28;
  unsigned __int8 *v29;
  unint64_t v30;
  int v31;
  size_t v32;
  size_t v33;
  unsigned int v34;
  size_t v35;
  unsigned int v36;
  const char **v37;
  unsigned int v38;
  const char *v39;
  size_t v40;
  size_t v41;
  unint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  const char **v47;
  int v48;
  char v49;
  __int16 v50;
  uint64_t v51;
  size_t v52;
  unsigned int v53;
  size_t v54;
  size_t v55;
  size_t v56;
  size_t v57;
  size_t v58;
  const char **v59;
  unsigned int v60;
  const char *v61;
  size_t v62;
  size_t v63;
  unsigned int v64;
  size_t v65;
  size_t v66;
  const char *v68;
  const char *v69;
  uint64_t v70;
  char v71;
  FILE *__stream;
  const char **v73;
  uint64_t v74;
  uint64_t __ptr;
  int v76;
  uint64_t v77;
  int v78;
  _WORD v79[2048];
  uint64_t v80;

  v3 = (const char *)MEMORY[0x1E0C80A78](a1, a2, a3);
  v5 = v4;
  v6 = v3;
  v80 = *MEMORY[0x1E0C80C00];
  if (_nc_access(v3, 2) || (v7 = fopen(v6, "wb")) == 0)
    sub_1C05DB4A4(v6);
  v8 = v7;
  v69 = v6;
  if (_nc_user_definable)
    v9 = 44;
  else
    v9 = 37;
  v10 = strlen(*(const char **)v5);
  v11 = 0;
  v12 = 0;
  v13 = *(unsigned __int8 **)(v5 + 16);
  do
  {
    if (v13[v11] == 1)
      v12 = v11 + 1;
    ++v11;
  }
  while (v9 != v11);
  v14 = 0;
  v15 = 0;
  v16 = 39;
  if (!_nc_user_definable)
    v16 = 33;
  v74 = v5;
  v17 = *(_WORD **)(v5 + 24);
  do
  {
    if ((__int16)v17[v14] != -1)
      v15 = v14 + 1;
    ++v14;
  }
  while (v16 != v14);
  __stream = v8;
  v18 = 0;
  v19 = 0;
  v20 = 414;
  if (!_nc_user_definable)
    v20 = 394;
  v21 = *(const char ***)(v74 + 32);
  do
  {
    if (v21[v18])
      v19 = v18 + 1;
    ++v18;
  }
  while (v20 != v18);
  v22 = v10 + 1;
  v73 = *(const char ***)(v74 + 32);
  v23 = sub_1C05D8C2C(v21, v19, v79);
  LOWORD(v77) = 282;
  v24 = 513;
  if (v10 + 1 < 0x201)
    v24 = v10 + 1;
  WORD1(v77) = v24;
  WORD2(v77) = v12;
  HIWORD(v77) = v15;
  LOWORD(v78) = v19;
  BYTE2(v78) = v23;
  v25 = v23 + 255;
  v71 = v23;
  if (v23 >= 0)
    HIBYTE(v25) = BYTE1(v23);
  HIBYTE(v78) = HIBYTE(v25);
  v76 = v78;
  __ptr = v77;
  if (v22 < 0xFF4)
    v26 = v10 + 1;
  else
    v26 = 4084;
  __memcpy_chk();
  if (v22 > 0xFF4)
    goto LABEL_129;
  v27 = v26 + 12;
  if (v12)
  {
    v28 = (BOOL *)&v77;
    v29 = v13;
    v30 = v12;
    do
    {
      v31 = *v29++;
      *v28++ = v31 == 1;
      --v30;
    }
    while (v30);
  }
  if (v26 == 4084)
  {
    v32 = 0;
  }
  else
  {
    v32 = v12 >= 4096 - (unint64_t)v27 ? 4096 - v27 : v12;
    memcpy((char *)&__ptr + v27, &v77, v32);
    v27 += v32;
  }
  if (v32 != v12)
    goto LABEL_129;
  if ((((_DWORD)v12 + (_DWORD)v22) & 1) != 0)
  {
    if (v27 == 4096)
      goto LABEL_129;
    *((_BYTE *)&__ptr + v27++) = 0;
  }
  sub_1C05D8CBC((uint64_t)&v77, v17, v15);
  if (v27 == 4096)
  {
    v33 = 0;
    v34 = 4096;
  }
  else
  {
    v33 = 2 * v15 >= 4096 - (unint64_t)v27 ? 4096 - v27 : 2 * v15;
    memcpy((char *)&__ptr + v27, &v77, v33);
    v34 = v27 + v33;
  }
  if (v15 != v33 >> 1)
    goto LABEL_129;
  sub_1C05D8CBC((uint64_t)&v77, v79, v19);
  if (v34 == 4096)
  {
    v35 = 0;
    v36 = 4096;
  }
  else
  {
    v35 = 2 * v19 >= 4096 - (unint64_t)v34 ? 4096 - v34 : 2 * v19;
    memcpy((char *)&__ptr + v34, &v77, v35);
    v36 = v34 + v35;
  }
  if (v19 != v35 >> 1)
    goto LABEL_129;
  if (v19)
  {
    v37 = v73;
    v38 = v36;
    do
    {
      v39 = *v37;
      if ((unint64_t)(*v37 + 1) >= 2)
      {
        if (v38 == 4096)
        {
          v40 = 0;
        }
        else
        {
          v41 = strlen(*v37);
          v40 = v41 + 1 < 4096 - (unint64_t)v38 ? v41 + 1 : 4096 - v38;
          memcpy((char *)&__ptr + v38, v39, v40);
          v36 += v40;
          v39 = *v37;
          v38 = v36;
        }
        if (v40 != strlen(v39) + 1)
          goto LABEL_129;
      }
      ++v37;
    }
    while (--v19);
  }
  if (sub_1C05D8D1C(v74))
  {
    v42 = *(unsigned __int16 *)(v74 + 62);
    v70 = *(unsigned __int16 *)(v74 + 64);
    v43 = *(unsigned __int16 *)(v74 + 66);
    if ((v71 & 1) != 0)
    {
      if (v36 == 4096)
        goto LABEL_129;
      *((_BYTE *)&__ptr + v36++) = 0;
    }
    v44 = sub_1C05D8C2C(v73 + 414, v43, v79);
    if (v43 <= 0x7FF)
    {
      v45 = v44;
      v46 = (v70 + v42 + v43);
      v47 = *(const char ***)(v74 + 48);
      v48 = sub_1C05D8C2C(v47, v46, &v79[v43]);
      LOWORD(v77) = v42;
      v50 = v48 + v45;
      v49 = (v48 + v45 < 0) ^ __OFADD__(v48, v45);
      v51 = (v46 + v43);
      WORD1(v77) = v70;
      WORD2(v77) = v43;
      HIWORD(v77) = v70 + v42 + v43 + v43;
      LOBYTE(v78) = v50;
      if (v49)
        HIBYTE(v50) = (unsigned __int16)(v50 + 255) >> 8;
      BYTE1(v78) = HIBYTE(v50);
      if (v36 != 4096)
      {
        v52 = 4096 - (unint64_t)v36 >= 0xA ? 10 : 4096 - v36;
        memcpy((char *)&__ptr + v36, &v77, v52);
        if (v52 >= 0xA)
        {
          v53 = v36 + v52;
          if ((_DWORD)v42)
          {
            if (v53 == 4096)
            {
              v54 = 0;
            }
            else
            {
              if (v42 >= 4096 - (unint64_t)v53)
                v54 = 4096 - v53;
              else
                v54 = v42;
              memcpy((char *)&__ptr + v53, v13 + 44, v54);
              v53 += v54;
            }
            if (v54 != v42)
              goto LABEL_129;
            if ((v42 & 1) != 0)
            {
              if (v53 == 4096)
                goto LABEL_129;
              *((_BYTE *)&__ptr + v53++) = 0;
            }
          }
          if (!(_DWORD)v70
            || ((sub_1C05D8CBC((uint64_t)&v77, v17 + 39, v70), v53 != 4096)
              ? (2 * v70 >= 4096 - (unint64_t)v53 ? (v56 = 4096 - v53) : (v56 = 2 * v70),
                 memcpy((char *)&__ptr + v53, &v77, v56),
                 v53 += v56,
                 v55 = v56 >> 1)
              : (v55 = 0),
                v55 == v70))
          {
            sub_1C05D8CBC((uint64_t)&v77, v79, (v46 + v43));
            if (v53 == 4096)
            {
              v57 = 0;
              v36 = 4096;
            }
            else
            {
              v58 = 2 * v51 >= 4096 - (unint64_t)v53 ? 4096 - v53 : 2 * v51;
              memcpy((char *)&__ptr + v53, &v77, v58);
              v36 = v53 + v58;
              v57 = v58 >> 1;
            }
            if (v57 == v51)
            {
              if ((_DWORD)v43)
              {
                v59 = v73 + 414;
                v60 = v36;
                do
                {
                  v61 = *v59;
                  if ((unint64_t)(*v59 + 1) >= 2)
                  {
                    if (v60 == 4096)
                    {
                      v62 = 0;
                    }
                    else
                    {
                      v63 = strlen(*v59);
                      v62 = v63 + 1 < 4096 - (unint64_t)v60 ? v63 + 1 : 4096 - v60;
                      memcpy((char *)&__ptr + v60, v61, v62);
                      v36 += v62;
                      v61 = *v59;
                      v60 = v36;
                    }
                    if (v62 != strlen(v61) + 1)
                      goto LABEL_129;
                  }
                  ++v59;
                }
                while (--v43);
              }
              if ((_DWORD)v46)
              {
                v64 = v36;
                while (1)
                {
                  if (v64 == 4096)
                  {
                    v65 = 0;
                  }
                  else
                  {
                    v66 = strlen(*v47);
                    v65 = v66 + 1 < 4096 - (unint64_t)v64 ? v66 + 1 : 4096 - v64;
                    memcpy((char *)&__ptr + v64, *v47, v65);
                    v36 += v65;
                    v64 = v36;
                  }
                  if (v65 != strlen(*v47) + 1)
                    goto LABEL_129;
                  ++v47;
                  if (!--v46)
                    goto LABEL_127;
                }
              }
              goto LABEL_127;
            }
          }
        }
      }
    }
LABEL_129:
    v68 = _nc_tic_dir(0);
    _nc_syserr_abort("error writing %s/%s", v68, v69);
  }
LABEL_127:
  ++dword_1EF614CA8;
  if (fwrite(&__ptr, 1uLL, v36, __stream) != v36)
    goto LABEL_129;
  return fclose(__stream);
}

int _nc_tic_written(void)
{
  return dword_1EF614CA8;
}

uint64_t sub_1C05D8C2C(const char **a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4;
  uint64_t v6;
  const char *v7;

  if (!a2)
    return 0;
  v4 = a2;
  v6 = 0;
  do
  {
    v7 = *a1;
    if (*a1 == (const char *)-1)
    {
      *a3 = -2;
    }
    else if (v7)
    {
      *a3 = v6;
      v6 = v6 + strlen(v7) + 1;
    }
    else
    {
      *a3 = -1;
    }
    ++a3;
    ++a1;
    --v4;
  }
  while (v4);
  return v6;
}

uint64_t sub_1C05D8CBC(uint64_t result, _WORD *a2, uint64_t a3)
{
  _BYTE *v3;
  int v4;

  if (a3)
  {
    v3 = (_BYTE *)(result + 1);
    do
    {
      v4 = (unsigned __int16)*a2;
      if (v4 == 65534)
      {
        *(_WORD *)(v3 - 1) = -2;
      }
      else if (v4 == 0xFFFF)
      {
        *(_WORD *)(v3 - 1) = -1;
      }
      else
      {
        *(v3 - 1) = v4;
        *v3 = (unsigned __int16)(*a2 + ((__int16)*a2 >> 23)) >> 8;
      }
      ++a2;
      v3 += 2;
      --a3;
    }
    while (a3);
  }
  return result;
}

BOOL sub_1C05D8D1C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 v11;

  if (!_nc_user_definable)
    return 0;
  if (*(_WORD *)(a1 + 62))
  {
    v1 = 0;
    v2 = 0;
    do
    {
      v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 16) + 44 + v1++);
      if (v3 == 1)
        v2 = v1;
    }
    while (*(unsigned __int16 *)(a1 + 62) != v1);
  }
  else
  {
    v2 = 0;
  }
  if (*(_WORD *)(a1 + 64))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = *(__int16 *)(*(_QWORD *)(a1 + 24) + 78 + 2 * v5++);
      if (v7 != -1)
        v6 = v5;
    }
    while (*(unsigned __int16 *)(a1 + 64) != v5);
  }
  else
  {
    v6 = 0;
  }
  v8 = v6 + v2;
  v9 = *(unsigned __int16 *)(a1 + 66);
  if (*(_WORD *)(a1 + 66))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 3312 + 8 * v10++))
        v11 = v10;
    }
    while (v9 != v10);
    LODWORD(v9) = v11;
  }
  return v8 + (_DWORD)v9 != 0;
}

const char *_nc_keyname(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int *i;
  int v7;
  _QWORD *v9;
  int v10;
  char v11;
  int v12;
  TERMINAL *v13;
  unsigned int v14;
  char *v15;
  char *v16;
  int v17;
  unint64_t num_Strings;
  char **Strings;
  uint64_t *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char *v26;
  unsigned int v27;
  char __s1[20];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a2 == -1)
    return "-1";
  v2 = a2;
  if (a2 != 348)
  {
    for (i = &dword_1C05E21D8; ; i += 2)
    {
      v3 = *((__int16 *)i - 2);
      if (v3 == -1)
        break;
      v7 = *i;
      if (v7 == a2)
        return &aKeyA1_0[v3];
    }
    if (a2 > 0xFF)
    {
      if (a1 && *(_QWORD *)(a1 + 48))
      {
        v13 = cur_term;
        v14 = _nc_tracing;
        _nc_tracing = 0;
        v15 = keybound(a2, 0);
        if (v15)
        {
          v16 = v15;
          v27 = v14;
          v17 = 0;
          do
          {
            num_Strings = v13->type.num_Strings;
            if (num_Strings < 0x19F)
            {
LABEL_25:
              free(v16);
            }
            else
            {
              Strings = v13->type.Strings;
              v20 = &qword_1E79DBAD8;
              v21 = 414;
              while (1)
              {
                v22 = Strings[v21];
                if (v22)
                {
                  if (!strcmp(v16, v22))
                    break;
                }
                ++v21;
                ++v20;
                if (v21 == num_Strings)
                  goto LABEL_25;
              }
              if (v21 >= 0x19E)
                v20 = (uint64_t *)&(&v13->type.ext_Names[v13->type.ext_Strings
                                                      + v13->type.ext_Numbers
                                                      + v13->type.ext_Booleans
                                                      - (int)num_Strings])[(int)v21];
              v4 = *v20;
              free(v16);
              if (v4)
                goto LABEL_47;
            }
            v16 = keybound(v2, ++v17);
          }
          while (v16);
          v4 = 0;
LABEL_47:
          v14 = v27;
        }
        else
        {
          v4 = 0;
        }
        _nc_tracing = v14;
        return (const char *)v4;
      }
    }
    else
    {
      v9 = *(_QWORD **)&PC[80];
      if (*(_QWORD *)&PC[80] || (v9 = calloc(0x100uLL, 8uLL), (*(_QWORD *)&PC[80] = v9) != 0))
      {
        if (a1)
        {
          v10 = *(_DWORD *)&PC[88];
          if (!*(_DWORD *)(a1 + 792))
          {
            v11 = 0;
            v12 = 1;
LABEL_35:
            if (v10 != v12)
            {
              v23 = 0;
              *(_DWORD *)&PC[88] = v12;
              do
              {
                if (v9[v23])
                {
                  free((void *)v9[v23]);
                  *(_QWORD *)(*(_QWORD *)&PC[80] + v23 * 8) = 0;
                  v9 = *(_QWORD **)&PC[80];
                }
                ++v23;
              }
              while (v23 != 256);
            }
            v4 = v9[v2];
            if (!v4)
            {
              v24 = v2;
              v25 = v11 ^ 1;
              v26 = __s1;
              if (v2 < 128)
                v25 = 1;
              if ((v25 & 1) == 0)
              {
                strcpy(__s1, "M-");
                v26 = &__s1[2];
                v2 -= 128;
              }
              if (v2 > 31)
              {
                if (v2 == 127)
                {
                  strcpy(v26, "^?");
                }
                else
                {
                  *v26 = v2;
                  v26[1] = 0;
                }
              }
              else
              {
                sprintf(v26, "^%c", (v2 + 64));
              }
              *(_QWORD *)(*(_QWORD *)&PC[80] + 8 * v24) = strdup(__s1);
              return *(const char **)(*(_QWORD *)&PC[80] + 8 * v24);
            }
            return (const char *)v4;
          }
        }
        else
        {
          v10 = *(_DWORD *)&PC[88];
        }
        v12 = 2;
        v11 = 1;
        goto LABEL_35;
      }
    }
    return 0;
  }
  v3 = 0;
  return &aKeyA1_0[v3];
}

char *__cdecl keyname(int a1)
{
  return (char *)_nc_keyname(SP, a1);
}

int addch(const chtype a1)
{
  return waddch(stdscr, a1);
}

int addchnstr(const chtype *a1, int a2)
{
  return waddchnstr(stdscr, a1, a2);
}

int addchstr(const chtype *a1)
{
  return waddchnstr(stdscr, a1, -1);
}

int addnstr(const char *a1, int a2)
{
  return waddnstr(stdscr, a1, a2);
}

int addstr(const char *a1)
{
  return waddnstr(stdscr, a1, -1);
}

int attroff(int a1)
{
  return wattr_off(stdscr, a1, 0);
}

int attron(int a1)
{
  return wattr_on(stdscr, a1, 0);
}

int attrset(int a1)
{
  WINDOW *v1;
  int result;

  v1 = stdscr;
  if (!stdscr)
    return -1;
  result = 0;
  *((_DWORD *)stdscr + 29) = BYTE1(a1);
  *((_DWORD *)v1 + 4) = a1;
  return result;
}

int attr_get(attr_t *a1, __int16 *a2, void *a3)
{
  attr_t v3;
  int v4;

  if (a1)
  {
    v3 = stdscr;
    if (stdscr)
      v3 = *((_DWORD *)stdscr + 4);
    *a1 = v3;
  }
  if (a2)
  {
    LOWORD(v4) = (_WORD)stdscr;
    if (stdscr)
      v4 = *((_DWORD *)stdscr + 29);
    *a2 = v4;
  }
  return 0;
}

int attr_off(attr_t a1, void *a2)
{
  return wattr_off(stdscr, a1, a2);
}

int attr_on(attr_t a1, void *a2)
{
  return wattr_on(stdscr, a1, a2);
}

int attr_set(attr_t a1, __int16 a2, void *a3)
{
  WINDOW *v3;

  v3 = stdscr;
  if (stdscr)
  {
    *((_DWORD *)stdscr + 4) = a1 & 0xFFFF00FF;
    *((_DWORD *)v3 + 29) = a2;
  }
  return 0;
}

int bkgd(chtype a1)
{
  return wbkgd(stdscr, a1);
}

void bkgdset(chtype a1)
{
  wbkgdset(stdscr, a1);
}

int border(chtype a1, chtype a2, chtype a3, chtype a4, chtype a5, chtype a6, chtype a7, chtype a8)
{
  return wborder(stdscr, a1, a2, a3, a4, a5, a6, a7, a8);
}

int box(WINDOW *a1, chtype a2, chtype a3)
{
  return wborder(a1, a2, a2, a3, a3, 0, 0, 0, 0);
}

int chgat(int a1, attr_t a2, __int16 a3, const void *a4)
{
  return wchgat(stdscr, a1, a2, a3, a4);
}

int clear(void)
{
  return wclear(stdscr);
}

int clrtobot(void)
{
  return wclrtobot(stdscr);
}

int clrtoeol(void)
{
  return wclrtoeol(stdscr);
}

int color_set(__int16 a1, void *a2)
{
  return wcolor_set(stdscr, a1, a2);
}

int COLOR_PAIR(int a1)
{
  return a1 << 8;
}

int delch(void)
{
  return wdelch(stdscr);
}

int deleteln(void)
{
  return winsdelln(stdscr, -1);
}

int echochar(const chtype a1)
{
  return wechochar(stdscr, a1);
}

int erase(void)
{
  return werase(stdscr);
}

chtype getbkgd(WINDOW *a1)
{
  if (a1)
    LODWORD(a1) = *((_DWORD *)a1 + 5);
  return a1;
}

int getch(void)
{
  return wgetch(stdscr);
}

int getnstr(char *a1, int a2)
{
  return wgetnstr(stdscr, a1, a2);
}

int getstr(char *a1)
{
  return wgetnstr(stdscr, a1, -1);
}

int hline(chtype a1, int a2)
{
  return whline(stdscr, a1, a2);
}

chtype inch(void)
{
  return winch(stdscr);
}

int inchnstr(chtype *a1, int a2)
{
  return winchnstr(stdscr, a1, a2);
}

int inchstr(chtype *a1)
{
  return winchnstr(stdscr, a1, -1);
}

int innstr(char *a1, int a2)
{
  return winnstr(stdscr, a1, a2);
}

int insch(chtype a1)
{
  return winsch(stdscr, a1);
}

int insdelln(int a1)
{
  return winsdelln(stdscr, a1);
}

int insertln(void)
{
  return winsdelln(stdscr, 1);
}

int insnstr(const char *a1, int a2)
{
  return winsnstr(stdscr, a1, a2);
}

int insstr(const char *a1)
{
  return winsnstr(stdscr, a1, -1);
}

int instr(char *a1)
{
  return winnstr(stdscr, a1, -1);
}

int move(int a1, int a2)
{
  return wmove(stdscr, a1, a2);
}

int mvaddch(int a1, int a2, const chtype a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return waddch(stdscr, a3);
  return result;
}

int mvaddchnstr(int a1, int a2, const chtype *a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return waddchnstr(stdscr, a3, a4);
  return result;
}

int mvaddchstr(int a1, int a2, const chtype *a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return waddchnstr(stdscr, a3, -1);
  return result;
}

int mvaddnstr(int a1, int a2, const char *a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return waddnstr(stdscr, a3, a4);
  return result;
}

int mvaddstr(int a1, int a2, const char *a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return waddnstr(stdscr, a3, -1);
  return result;
}

int mvchgat(int a1, int a2, int a3, attr_t a4, __int16 a5, const void *a6)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return wchgat(stdscr, a3, a4, a5, a6);
  return result;
}

int mvdelch(int a1, int a2)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return wdelch(stdscr);
  return result;
}

int mvgetch(int a1, int a2)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return wgetch(stdscr);
  return result;
}

int mvgetnstr(int a1, int a2, char *a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return wgetnstr(stdscr, a3, a4);
  return result;
}

int mvgetstr(int a1, int a2, char *a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return wgetnstr(stdscr, a3, -1);
  return result;
}

int mvhline(int a1, int a2, chtype a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return whline(stdscr, a3, a4);
  return result;
}

chtype mvinch(int a1, int a2)
{
  chtype result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winch(stdscr);
  return result;
}

int mvinchnstr(int a1, int a2, chtype *a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winchnstr(stdscr, a3, a4);
  return result;
}

int mvinchstr(int a1, int a2, chtype *a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winchnstr(stdscr, a3, -1);
  return result;
}

int mvinnstr(int a1, int a2, char *a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winnstr(stdscr, a3, a4);
  return result;
}

int mvinsch(int a1, int a2, chtype a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winsch(stdscr, a3);
  return result;
}

int mvinsnstr(int a1, int a2, const char *a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winsnstr(stdscr, a3, a4);
  return result;
}

int mvinsstr(int a1, int a2, const char *a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winsnstr(stdscr, a3, -1);
  return result;
}

int mvinstr(int a1, int a2, char *a3)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return winnstr(stdscr, a3, -1);
  return result;
}

int mvvline(int a1, int a2, chtype a3, int a4)
{
  int result;

  result = wmove(stdscr, a1, a2);
  if (result != -1)
    return wvline(stdscr, a3, a4);
  return result;
}

int mvwaddch(WINDOW *a1, int a2, int a3, const chtype a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return waddch(a1, a4);
  return result;
}

int mvwaddchnstr(WINDOW *a1, int a2, int a3, const chtype *a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return waddchnstr(a1, a4, a5);
  return result;
}

int mvwaddchstr(WINDOW *a1, int a2, int a3, const chtype *a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return waddchnstr(a1, a4, -1);
  return result;
}

int mvwaddnstr(WINDOW *a1, int a2, int a3, const char *a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return waddnstr(a1, a4, a5);
  return result;
}

int mvwaddstr(WINDOW *a1, int a2, int a3, const char *a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return waddnstr(a1, a4, -1);
  return result;
}

int mvwchgat(WINDOW *a1, int a2, int a3, int a4, attr_t a5, __int16 a6, const void *a7)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return wchgat(a1, a4, a5, a6, a7);
  return result;
}

int mvwdelch(WINDOW *a1, int a2, int a3)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return wdelch(a1);
  return result;
}

int mvwgetch(WINDOW *a1, int a2, int a3)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return wgetch(a1);
  return result;
}

int mvwgetnstr(WINDOW *a1, int a2, int a3, char *a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return wgetnstr(a1, a4, a5);
  return result;
}

int mvwgetstr(WINDOW *a1, int a2, int a3, char *a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return wgetnstr(a1, a4, -1);
  return result;
}

int mvwhline(WINDOW *a1, int a2, int a3, chtype a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return whline(a1, a4, a5);
  return result;
}

chtype mvwinch(WINDOW *a1, int a2, int a3)
{
  chtype result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winch(a1);
  return result;
}

int mvwinchnstr(WINDOW *a1, int a2, int a3, chtype *a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winchnstr(a1, a4, a5);
  return result;
}

int mvwinchstr(WINDOW *a1, int a2, int a3, chtype *a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winchnstr(a1, a4, -1);
  return result;
}

int mvwinnstr(WINDOW *a1, int a2, int a3, char *a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winnstr(a1, a4, a5);
  return result;
}

int mvwinsch(WINDOW *a1, int a2, int a3, chtype a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winsch(a1, a4);
  return result;
}

int mvwinsnstr(WINDOW *a1, int a2, int a3, const char *a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winsnstr(a1, a4, a5);
  return result;
}

int mvwinsstr(WINDOW *a1, int a2, int a3, const char *a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winsnstr(a1, a4, -1);
  return result;
}

int mvwinstr(WINDOW *a1, int a2, int a3, char *a4)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return winnstr(a1, a4, -1);
  return result;
}

int mvwvline(WINDOW *a1, int a2, int a3, chtype a4, int a5)
{
  int result;

  result = wmove(a1, a2, a3);
  if (result != -1)
    return wvline(a1, a4, a5);
  return result;
}

int PAIR_NUMBER(int a1)
{
  return BYTE1(a1);
}

int redrawwin(WINDOW *a1)
{
  int v1;

  if (a1)
    v1 = *((__int16 *)a1 + 2) + 1;
  else
    v1 = -1;
  return wredrawln(a1, 0, v1);
}

int refresh(void)
{
  return wrefresh(stdscr);
}

int scrl(int a1)
{
  return wscrl(stdscr, a1);
}

int scroll(WINDOW *a1)
{
  return wscrl(a1, 1);
}

int setscrreg(int a1, int a2)
{
  return wsetscrreg(stdscr, a1, a2);
}

int slk_attr_off(const attr_t a1, void *a2)
{
  if (a2)
    return -1;
  else
    return slk_attroff(a1);
}

int slk_attr_on(attr_t a1, void *a2)
{
  if (a2)
    return -1;
  else
    return slk_attron(a1);
}

int standout(void)
{
  WINDOW *v0;
  int result;

  v0 = stdscr;
  if (!stdscr)
    return -1;
  result = 0;
  *((_DWORD *)stdscr + 29) = 0;
  *((_DWORD *)v0 + 4) = 0x10000;
  return result;
}

int standend(void)
{
  WINDOW *v0;
  int result;

  v0 = stdscr;
  if (!stdscr)
    return -1;
  result = 0;
  *((_DWORD *)stdscr + 29) = 0;
  *((_DWORD *)v0 + 4) = 0;
  return result;
}

void timeout(int a1)
{
  wtimeout(stdscr, a1);
}

int touchline(WINDOW *a1, int a2, int a3)
{
  return wtouchln(a1, a2, a3, 1);
}

int touchwin(WINDOW *a1)
{
  int v1;

  if (a1)
    v1 = *((__int16 *)a1 + 2) + 1;
  else
    v1 = -1;
  return wtouchln(a1, 0, v1, 1);
}

int untouchwin(WINDOW *a1)
{
  int v1;

  if (a1)
    v1 = *((__int16 *)a1 + 2) + 1;
  else
    v1 = -1;
  return wtouchln(a1, 0, v1, 0);
}

int vline(chtype a1, int a2)
{
  return wvline(stdscr, a1, a2);
}

int waddchstr(WINDOW *a1, const chtype *a2)
{
  return waddchnstr(a1, a2, -1);
}

int waddstr(WINDOW *a1, const char *a2)
{
  return waddnstr(a1, a2, -1);
}

int wattron(WINDOW *a1, int a2)
{
  return wattr_on(a1, a2, 0);
}

int wattroff(WINDOW *a1, int a2)
{
  return wattr_off(a1, a2, 0);
}

int wattrset(WINDOW *a1, int a2)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_DWORD *)a1 + 29) = BYTE1(a2);
  *((_DWORD *)a1 + 4) = a2;
  return result;
}

int wattr_get(WINDOW *a1, attr_t *a2, __int16 *a3, void *a4)
{
  attr_t v4;
  int v5;

  if (a2)
  {
    if (a1)
      v4 = *((_DWORD *)a1 + 4);
    else
      v4 = 0;
    *a2 = v4;
  }
  if (a3)
  {
    if (a1)
      v5 = *((_DWORD *)a1 + 29);
    else
      LOWORD(v5) = 0;
    *a3 = v5;
  }
  return 0;
}

int wattr_set(WINDOW *a1, attr_t a2, __int16 a3, void *a4)
{
  if (a1)
  {
    *((_DWORD *)a1 + 4) = a2 & 0xFFFF00FF;
    *((_DWORD *)a1 + 29) = a3;
  }
  return 0;
}

int wdeleteln(WINDOW *a1)
{
  return winsdelln(a1, -1);
}

int wgetstr(WINDOW *a1, char *a2)
{
  return wgetnstr(a1, a2, -1);
}

int winchstr(WINDOW *a1, chtype *a2)
{
  return winchnstr(a1, a2, -1);
}

int winsertln(WINDOW *a1)
{
  return winsdelln(a1, 1);
}

int winsstr(WINDOW *a1, const char *a2)
{
  return winsnstr(a1, a2, -1);
}

int winstr(WINDOW *a1, char *a2)
{
  return winnstr(a1, a2, -1);
}

int wstandout(WINDOW *a1)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_DWORD *)a1 + 29) = 0;
  *((_DWORD *)a1 + 4) = 0x10000;
  return result;
}

int wstandend(WINDOW *a1)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *((_DWORD *)a1 + 29) = 0;
  *((_DWORD *)a1 + 4) = 0;
  return result;
}

int getattrs(const WINDOW *a1)
{
  if (a1)
    LODWORD(a1) = *((_DWORD *)a1 + 4);
  return (int)a1;
}

int getcurx(const WINDOW *a1)
{
  if (a1)
    return *((__int16 *)a1 + 1);
  else
    return -1;
}

int getcury(const WINDOW *a1)
{
  if (a1)
    return *(__int16 *)a1;
  else
    return -1;
}

int getbegx(const WINDOW *a1)
{
  if (a1)
    return *((__int16 *)a1 + 5);
  else
    return -1;
}

int getbegy(const WINDOW *a1)
{
  if (a1)
    return *((__int16 *)a1 + 4);
  else
    return -1;
}

int getmaxx(const WINDOW *a1)
{
  if (a1)
    return *((__int16 *)a1 + 3) + 1;
  else
    return -1;
}

int getmaxy(const WINDOW *a1)
{
  if (a1)
    return *((__int16 *)a1 + 2) + 1;
  else
    return -1;
}

int getparx(const WINDOW *a1)
{
  if (a1)
    return *((_DWORD *)a1 + 13);
  else
    return -1;
}

int getpary(const WINDOW *a1)
{
  if (a1)
    return *((_DWORD *)a1 + 14);
  else
    return -1;
}

WINDOW *__cdecl wgetparent(WINDOW *result)
{
  if (result)
    return (WINDOW *)*((_QWORD *)result + 8);
  return result;
}

BOOL is_cleared(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 25) != 0;
  return (char)a1;
}

BOOL is_idcok(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 29) != 0;
  return (char)a1;
}

BOOL is_idlok(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 28) != 0;
  return (char)a1;
}

BOOL is_immedok(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 30) != 0;
  return (char)a1;
}

BOOL is_keypad(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 32) != 0;
  return (char)a1;
}

BOOL is_leaveok(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 26) != 0;
  return (char)a1;
}

BOOL is_nodelay(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_DWORD *)a1 + 9) == 0;
  return (char)a1;
}

BOOL is_notimeout(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 24) != 0;
  return (char)a1;
}

BOOL is_pad(const WINDOW *a1)
{
  if (a1)
    LODWORD(a1) = (*((unsigned __int16 *)a1 + 6) >> 4) & 1;
  return (char)a1;
}

BOOL is_scrollok(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 27) != 0;
  return (char)a1;
}

BOOL is_subwin(const WINDOW *a1)
{
  if (a1)
    LOWORD(a1) = *((_WORD *)a1 + 6) & 1;
  return (char)a1;
}

BOOL is_syncok(const WINDOW *a1)
{
  if (a1)
    LOBYTE(a1) = *((_BYTE *)a1 + 31) != 0;
  return (char)a1;
}

int wgetdelay(const WINDOW *a1)
{
  if (a1)
    LODWORD(a1) = *((_DWORD *)a1 + 9);
  return (int)a1;
}

int wgetscrreg(const WINDOW *a1, int *a2, int *a3)
{
  int result;

  if (!a1)
    return -1;
  result = 0;
  *a2 = *((__int16 *)a1 + 24);
  *a3 = *((__int16 *)a1 + 25);
  return result;
}

uint64_t add_wch(_OWORD *a1)
{
  return wadd_wch(stdscr, a1);
}

uint64_t add_wchnstr(uint64_t a1, int a2)
{
  return wadd_wchnstr(stdscr, a1, a2);
}

uint64_t add_wchstr(uint64_t a1)
{
  return wadd_wchnstr(stdscr, a1, -1);
}

uint64_t addnwstr(__int32 *a1, int a2)
{
  return waddnwstr(stdscr, a1, a2);
}

uint64_t addwstr(__int32 *a1)
{
  return waddnwstr(stdscr, a1, -1);
}

uint64_t bkgrnd(_OWORD *a1)
{
  return wbkgrnd((uint64_t)stdscr, a1);
}

uint64_t bkgrndset(int *a1)
{
  return wbkgrndset((uint64_t)stdscr, a1);
}

uint64_t border_set()
{
  return wborder_set((uint64_t)stdscr);
}

uint64_t box_set(uint64_t a1)
{
  return wborder_set(a1);
}

uint64_t echo_wchar(_OWORD *a1)
{
  return wecho_wchar((uint64_t)stdscr, a1);
}

uint64_t get_wch(_DWORD *a1)
{
  return wget_wch((uint64_t)stdscr, a1);
}

uint64_t get_wstr(__int32 *a1)
{
  return wgetn_wstr(stdscr, a1, 0xFFFFFFFF);
}

uint64_t getbkgrnd(_OWORD *a1)
{
  __int128 v1;

  if (stdscr)
  {
    v1 = *(_OWORD *)((char *)stdscr + 88);
    *(_OWORD *)((char *)a1 + 12) = *(_OWORD *)((char *)stdscr + 100);
    *a1 = v1;
  }
  return 0;
}

uint64_t getn_wstr(__int32 *a1, unsigned int a2)
{
  return wgetn_wstr(stdscr, a1, a2);
}

uint64_t hline_set(_OWORD *a1, int a2)
{
  return whline_set((__int16 *)stdscr, a1, a2);
}

double in_wch(uint64_t a1)
{
  double result;

  *(_QWORD *)&result = win_wch((__int16 *)stdscr, a1).n128_u64[0];
  return result;
}

uint64_t in_wchnstr(uint64_t a1, int a2)
{
  return win_wchnstr((__int16 *)stdscr, a1, a2);
}

uint64_t in_wchstr(uint64_t a1)
{
  return win_wchnstr((__int16 *)stdscr, a1, -1);
}

uint64_t innwstr(uint64_t a1, int a2)
{
  return winnwstr((__int16 *)stdscr, a1, a2);
}

uint64_t ins_nwstr(__int32 *a1, int a2)
{
  return wins_nwstr((uint64_t)stdscr, a1, a2);
}

uint64_t ins_wch(uint64_t a1)
{
  return wins_wch(stdscr, a1);
}

uint64_t ins_wstr(__int32 *a1)
{
  return wins_nwstr((uint64_t)stdscr, a1, -1);
}

uint64_t inwstr(uint64_t a1)
{
  return winwstr((__int16 *)stdscr, a1);
}

uint64_t mvadd_wch(int a1, int a2, _OWORD *a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wadd_wch(stdscr, a3);
  return result;
}

uint64_t mvadd_wchnstr(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wadd_wchnstr(stdscr, a3, a4);
  return result;
}

uint64_t mvadd_wchstr(int a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wadd_wchnstr(stdscr, a3, -1);
  return result;
}

uint64_t mvaddnwstr(int a1, int a2, __int32 *a3, int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return waddnwstr(stdscr, a3, a4);
  return result;
}

uint64_t mvaddwstr(int a1, int a2, __int32 *a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return waddnwstr(stdscr, a3, -1);
  return result;
}

uint64_t mvget_wch(int a1, int a2, _DWORD *a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wget_wch((uint64_t)stdscr, a3);
  return result;
}

uint64_t mvget_wstr(int a1, int a2, __int32 *a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wgetn_wstr(stdscr, a3, 0xFFFFFFFF);
  return result;
}

uint64_t mvgetn_wstr(int a1, int a2, __int32 *a3, unsigned int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wgetn_wstr(stdscr, a3, a4);
  return result;
}

uint64_t mvhline_set(int a1, int a2, _OWORD *a3, int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return whline_set((__int16 *)stdscr, a3, a4);
  return result;
}

double mvin_wch(int a1, int a2, uint64_t a3)
{
  double result;

  if (wmove(stdscr, a1, a2) != -1)
    *(_QWORD *)&result = win_wch((__int16 *)stdscr, a3).n128_u64[0];
  return result;
}

uint64_t mvin_wchnstr(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return win_wchnstr((__int16 *)stdscr, a3, a4);
  return result;
}

uint64_t mvin_wchstr(int a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return win_wchnstr((__int16 *)stdscr, a3, -1);
  return result;
}

uint64_t mvinnwstr(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return winnwstr((__int16 *)stdscr, a3, a4);
  return result;
}

uint64_t mvins_nwstr(int a1, int a2, __int32 *a3, int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wins_nwstr((uint64_t)stdscr, a3, a4);
  return result;
}

uint64_t mvins_wch(int a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wins_wch(stdscr, a3);
  return result;
}

uint64_t mvins_wstr(int a1, int a2, __int32 *a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wins_nwstr((uint64_t)stdscr, a3, -1);
  return result;
}

uint64_t mvinwstr(int a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return winwstr((__int16 *)stdscr, a3);
  return result;
}

uint64_t mvvline_set(int a1, int a2, _OWORD *a3, int a4)
{
  uint64_t result;

  result = wmove(stdscr, a1, a2);
  if ((_DWORD)result != -1)
    return wvline_set((__int16 *)stdscr, a3, a4);
  return result;
}

uint64_t mvwadd_wch(WINDOW *a1, int a2, int a3, _OWORD *a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wadd_wch(a1, a4);
  return result;
}

uint64_t mvwadd_wchnstr(WINDOW *a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wadd_wchnstr(a1, a4, a5);
  return result;
}

uint64_t mvwadd_wchstr(WINDOW *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wadd_wchnstr(a1, a4, -1);
  return result;
}

uint64_t mvwaddnwstr(WINDOW *a1, int a2, int a3, __int32 *a4, int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return waddnwstr(a1, a4, a5);
  return result;
}

uint64_t mvwaddwstr(WINDOW *a1, int a2, int a3, __int32 *a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return waddnwstr(a1, a4, -1);
  return result;
}

uint64_t mvwget_wch(WINDOW *a1, int a2, int a3, _DWORD *a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wget_wch((uint64_t)a1, a4);
  return result;
}

uint64_t mvwget_wstr(WINDOW *a1, int a2, int a3, __int32 *a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wgetn_wstr(a1, a4, 0xFFFFFFFF);
  return result;
}

uint64_t mvwgetn_wstr(WINDOW *a1, int a2, int a3, __int32 *a4, unsigned int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wgetn_wstr(a1, a4, a5);
  return result;
}

uint64_t mvwhline_set(WINDOW *a1, int a2, int a3, _OWORD *a4, int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return whline_set((__int16 *)a1, a4, a5);
  return result;
}

double mvwin_wch(__int16 *a1, int a2, int a3, uint64_t a4)
{
  double result;

  if (wmove((WINDOW *)a1, a2, a3) != -1)
    *(_QWORD *)&result = win_wch(a1, a4).n128_u64[0];
  return result;
}

uint64_t mvwin_wchnstr(WINDOW *a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return win_wchnstr((__int16 *)a1, a4, a5);
  return result;
}

uint64_t mvwin_wchstr(WINDOW *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return win_wchnstr((__int16 *)a1, a4, -1);
  return result;
}

uint64_t mvwinnwstr(WINDOW *a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return winnwstr((__int16 *)a1, a4, a5);
  return result;
}

uint64_t mvwins_nwstr(WINDOW *a1, int a2, int a3, __int32 *a4, int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wins_nwstr((uint64_t)a1, a4, a5);
  return result;
}

uint64_t mvwins_wch(WINDOW *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wins_wch(a1, a4);
  return result;
}

uint64_t mvwins_wstr(WINDOW *a1, int a2, int a3, __int32 *a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wins_nwstr((uint64_t)a1, a4, -1);
  return result;
}

uint64_t mvwinwstr(WINDOW *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return winwstr((__int16 *)a1, a4);
  return result;
}

uint64_t mvwvline_set(WINDOW *a1, int a2, int a3, _OWORD *a4, int a5)
{
  uint64_t result;

  result = wmove(a1, a2, a3);
  if ((_DWORD)result != -1)
    return wvline_set((__int16 *)a1, a4, a5);
  return result;
}

uint64_t vline_set(_OWORD *a1, int a2)
{
  return wvline_set((__int16 *)stdscr, a1, a2);
}

uint64_t wadd_wchstr(WINDOW *a1, uint64_t a2)
{
  return wadd_wchnstr(a1, a2, -1);
}

uint64_t waddwstr(WINDOW *a1, __int32 *a2)
{
  return waddnwstr(a1, a2, -1);
}

uint64_t wget_wstr(WINDOW *a1, __int32 *a2)
{
  return wgetn_wstr(a1, a2, 0xFFFFFFFF);
}

uint64_t wgetbkgrnd(uint64_t a1, _OWORD *a2)
{
  __int128 v2;

  if (a1)
  {
    v2 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)((char *)a2 + 12) = *(_OWORD *)(a1 + 100);
    *a2 = v2;
  }
  return 0;
}

uint64_t win_wchstr(__int16 *a1, uint64_t a2)
{
  return win_wchnstr(a1, a2, -1);
}

uint64_t wins_wstr(uint64_t a1, __int32 *a2)
{
  return wins_nwstr(a1, a2, -1);
}

BOOL mouse_trafo(int *a1, int *a2, BOOL a3)
{
  return wmouse_trafo(stdscr, a1, a2, a3);
}

void sub_1C05DB4A4(const char *a1)
{
  const char *v2;

  perror(a1);
  v2 = _nc_tic_dir(0);
  _nc_syserr_abort("can't open %s/%s", v2, a1);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1E0C80AA0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C80C38]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void _exit(int a1)
{
  MEMORY[0x1E0C80F80](*(_QWORD *)&a1);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

wint_t btowc(int a1)
{
  return MEMORY[0x1E0C81748](*(_QWORD *)&a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1E0C81828](__count, __size);
}

speed_t cfgetospeed(const termios *a1)
{
  return MEMORY[0x1E0C82608](a1);
}

int chdir(const char *a1)
{
  return MEMORY[0x1E0C82628](a1);
}

void clearerr(FILE *a1)
{
  MEMORY[0x1E0C82648](a1);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1E0C83388](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1E0C83450](a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1E0C83648](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpgrp(void)
{
  return MEMORY[0x1E0C83758]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C83A48](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

int mblen(const char *__s, size_t __n)
{
  return MEMORY[0x1E0C83FF8](__s, __n);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x1E0C84038](a1, a2, a3, a4);
}

int mbtowc(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C84058](a1, a2, a3);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1E0C84238](__rqtp, __rmtp);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x1E0C843D0](*(_QWORD *)&a1);
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85028](__ptr, __size);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1E0C85280](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1E0C85358](*(_QWORD *)&a1, a2);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x1E0C853E0](*(_QWORD *)&a1, a2, a3);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C85400](*(_QWORD *)&a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1E0C855A0](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int tcflush(int a1, int a2)
{
  return MEMORY[0x1E0C858A8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x1E0C858B0](*(_QWORD *)&a1, a2);
}

pid_t tcgetpgrp(int a1)
{
  return MEMORY[0x1E0C858B8](*(_QWORD *)&a1);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x1E0C858C0](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

int vsscanf(const char *__str, const char *__format, va_list a3)
{
  return MEMORY[0x1E0C85BB0](__str, __format, a3);
}

size_t wcrtomb(char *a1, __int32 a2, mbstate_t *a3)
{
  return MEMORY[0x1E0C85BE8](a1, *(_QWORD *)&a2, a3);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1E0C85C20](a1);
}

size_t wcsrtombs(char *a1, const __int32 **a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x1E0C85C48](a1, a2, a3, a4);
}

size_t wcstombs(char *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x1E0C85C80](a1, a2, a3);
}

int wctob(wint_t a1)
{
  return MEMORY[0x1E0C85CA0](*(_QWORD *)&a1);
}

int wcwidth(__int32 a1)
{
  return MEMORY[0x1E0C85CB0](*(_QWORD *)&a1);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

__int32 *__cdecl wmemcpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x1E0C85CC8](a1, a2, a3);
}

