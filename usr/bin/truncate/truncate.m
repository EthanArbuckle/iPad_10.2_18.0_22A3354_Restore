BOOL start(int a1, char **a2)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  int v10;
  int v11;
  int v12;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t st_size;
  BOOL v19;
  const char **v20;
  int v21;
  const char *v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  const char *v27;
  off_t v28;
  BOOL v29;
  uint64_t v30;
  int v32;
  uint64_t v33;
  stat v34;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v32 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  memset(&v34, 0, sizeof(v34));
  v33 = 0;
  while (1)
  {
    while (1)
    {
      v10 = getopt(a1, a2, "cr:s:");
      if (v10 != 114)
        break;
      v9 = optarg;
      v7 = 1;
    }
    if (v10 == -1)
      break;
    if (v10 == 99)
    {
      v5 = 1;
    }
    else
    {
      if (v10 != 115)
        goto LABEL_77;
      v11 = (((*optarg - 37) >> 1) | ((*optarg - 37) << 7));
      v12 = v32;
      if ((v11 - 3) < 2)
      {
        v6 = 1;
      }
      else if (v11 == 5 || v11 == 0)
      {
        v12 = 1;
      }
      v32 = v12;
      if (v6 | v12)
        v14 = optarg + 1;
      else
        v14 = optarg;
      if (expand_number(v14, &v33) == -1 || (v4 = v33, v33 < 0))
      v8 = 1;
      if ((*optarg | 2) == 0x2F)
        v4 = -v33;
    }
  }
  v15 = optind;
  if (optind >= a1 || v8 + v7 != 1)
  {
LABEL_77:
    fprintf(__stderrp, "%s\n%s\n", "usage: truncate [-c] -s [+|-|%|/]size[K|k|M|m|G|g|T|t] file ...", "       truncate [-c] -r rfile file ...");
    exit(1);
  }
  if (v7)
  {
    if (stat(v9, &v34) == -1)
      err(1, "%s", v9);
    v17 = 0;
    st_size = v34.st_size;
  }
  else
  {
    v19 = v6 == 1 || v32 == 1;
    if (v19)
      v17 = v4;
    else
      v17 = 0;
    if (v19)
      st_size = 0;
    else
      st_size = v4;
  }
  v20 = (const char **)&a2[v15];
  if (v5)
    v21 = 1;
  else
    v21 = 513;
  v22 = *v20;
  if (!*v20)
  {
    v23 = 0;
    return v23 != 0;
  }
  v23 = 0;
  if (v17 >= 0)
    v24 = v17;
  else
    v24 = -v17;
  v25 = -1;
LABEL_48:
  ++v20;
  do
  {
    if (v25 != -1)
      close(v25);
    v26 = open(v22, v21, 420);
    v25 = v26;
    if (v26 != -1)
    {
      if (v6 != 1)
        goto LABEL_59;
      if (fstat(v26, &v34) != -1)
      {
        st_size = v34.st_size + v17;
LABEL_59:
        if (v32 == 1)
        {
          if (fstat(v25, &v34) != -1)
          {
            st_size = v34.st_size;
            v28 = v34.st_size / v24;
            if (v34.st_size % v24)
            {
              v29 = v28 != v24 && v17 < 0;
              v30 = v17 > 0;
              if (v29)
                v30 = -1;
              st_size = ((v30 + v28) & ~((v30 + v28) >> 63)) * v24;
            }
            goto LABEL_69;
          }
LABEL_72:
          warn("%s", v22);
          ++v23;
        }
        else
        {
LABEL_69:
          st_size &= ~(st_size >> 63);
          if (ftruncate(v25, st_size) == -1)
            goto LABEL_72;
        }
        v22 = *v20;
        if (*v20)
          goto LABEL_48;
        goto LABEL_74;
      }
LABEL_54:
      warn("%s", v22);
      ++v23;
      goto LABEL_56;
    }
    if (*__error() != 2)
      goto LABEL_54;
LABEL_56:
    v27 = *v20++;
    v22 = v27;
  }
  while (v27);
  if (v25 == -1)
    return v23 != 0;
LABEL_74:
  close(v25);
  return v23 != 0;
}
