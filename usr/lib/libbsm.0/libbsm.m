pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return atoken->val[5];
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return atoken->val[1];
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return atoken->val[2];
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return atoken->val[7];
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return atoken->val[0];
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  if (auidp)
    *auidp = atoken->val[0];
  if (euidp)
    *euidp = atoken->val[1];
  if (egidp)
    *egidp = atoken->val[2];
  if (ruidp)
    *ruidp = atoken->val[3];
  if (rgidp)
    *rgidp = atoken->val[4];
  if (pidp)
    *pidp = atoken->val[5];
  if (asidp)
    *asidp = atoken->val[6];
  if (tidp)
  {
    audit_set_terminal_host(&tidp->machine);
    tidp->port = atoken->val[7];
  }
}

uint64_t audit_set_terminal_host(_DWORD *a1)
{
  uint64_t v1;
  int *v2;
  char *v3;
  size_t v5;
  int v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = 4294901247;
  *(_QWORD *)v6 = 0xB00000001;
  if (a1)
  {
    *a1 = 0;
    v5 = 4;
    if (sysctl(v6, 2u, a1, &v5, 0, 0))
    {
      v2 = __error();
      v3 = strerror(*v2);
      syslog(3, "sysctl() failed (%s)", v3);
      return 4294901249;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return atoken->val[3];
}

void au_free_token(token_t *tok)
{
  void *v2;

  if (tok)
  {
    v2 = *(void **)tok;
    if (v2)
      free(v2);
    free(tok);
  }
}

int au_open(void)
{
  _BYTE *v0;
  uint64_t v1;
  _BYTE *v2;
  void *v3;
  int v4;

  pthread_mutex_lock(&mutex);
  if (audit_rec_count)
  {
    v0 = (_BYTE *)audit_free_q;
    if (audit_free_q)
    {
      *(_BYTE *)audit_free_q = 1;
      v1 = *((_QWORD *)v0 + 5);
      if (v1)
      {
        *(_QWORD *)(v1 + 48) = *((_QWORD *)v0 + 6);
        v1 = *((_QWORD *)v0 + 5);
      }
      **((_QWORD **)v0 + 6) = v1;
      goto LABEL_14;
    }
  }
  else
  {
    audit_free_q = 0;
  }
  pthread_mutex_unlock(&mutex);
  v2 = malloc_type_malloc(0x38uLL, 0x10B0040D4C499B4uLL);
  if (!v2)
    return -1;
  v0 = v2;
  v3 = malloc_type_malloc(0x7FFFuLL, 0x100004077774924uLL);
  *((_QWORD *)v0 + 3) = v3;
  if (!v3)
  {
LABEL_11:
    free(v0);
    *__error() = 12;
    return -1;
  }
  pthread_mutex_lock(&mutex);
  v4 = audit_rec_count;
  if (audit_rec_count == 20)
  {
    pthread_mutex_unlock(&mutex);
    free(*((void **)v0 + 3));
    goto LABEL_11;
  }
  *((_DWORD *)v0 + 1) = audit_rec_count;
  open_desc_table[v4] = v0;
  audit_rec_count = v4 + 1;
LABEL_14:
  pthread_mutex_unlock(&mutex);
  bzero(*((void **)v0 + 3), 0x7FFFuLL);
  *((_QWORD *)v0 + 1) = 0;
  *((_QWORD *)v0 + 2) = v0 + 8;
  *((_QWORD *)v0 + 4) = 0;
  *v0 = 1;
  return *((_DWORD *)v0 + 1);
}

int au_write(int d, token_t *m)
{
  uint64_t v2;
  int *v3;
  int v4;
  int result;

  if (m && (v2 = open_desc_table[d]) != 0 && *(_BYTE *)v2)
  {
    if ((unint64_t)(*(_QWORD *)(v2 + 32) + *((_QWORD *)m + 1) - 32544) > 0xFFFFFFFFFFFF7FFFLL)
    {
      result = 0;
      *((_QWORD *)m + 2) = 0;
      *((_QWORD *)m + 3) = *(_QWORD *)(v2 + 16);
      **(_QWORD **)(v2 + 16) = m;
      *(_QWORD *)(v2 + 16) = (char *)m + 16;
      *(_QWORD *)(v2 + 32) += *((_QWORD *)m + 1);
      return result;
    }
    v3 = __error();
    v4 = 12;
  }
  else
  {
    v3 = __error();
    v4 = 22;
  }
  *v3 = v4;
  return -1;
}

uint64_t au_close_with_errors(int a1, int a2, au_event_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;

  v3 = *((_QWORD *)&open_desc_table + a1);
  if (v3 && *(_BYTE *)v3)
  {
    if (a2)
    {
      if ((unint64_t)(*(_QWORD *)(v3 + 32) - 32544) <= 0xFFFFFFFFFFFF7FFFLL)
      {
        fwrite("au_close failed", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        *__error() = 12;
        v4 = 4294967276;
LABEL_12:
        au_teardown(v3);
        return v4;
      }
      v5 = au_assemble(*((_QWORD **)&open_desc_table + a1), a3);
      if (v5 < 0)
      {
        v4 = (-30 - v5);
        goto LABEL_12;
      }
      if (audit(*(const void **)(v3 + 24), *(_DWORD *)(v3 + 32)))
      {
        v4 = (-40 - *__error());
        goto LABEL_12;
      }
    }
    v4 = 0;
    goto LABEL_12;
  }
  *__error() = 22;
  return 4294967286;
}

uint64_t au_assemble(_QWORD *a1, au_event_t a2)
{
  uint64_t v4;
  uint64_t v5;
  token_t *v6;
  token_t *v7;
  token_t *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  timeval v18;
  auditinfo_addr_t aia;

  memset(&aia.ai_termid.at_addr[1], 0, 24);
  *(_OWORD *)&aia.ai_auid = 0u;
  *(_QWORD *)&aia.ai_termid.at_type = 4;
  if (audit_get_kaudit(&aia, 0x30uLL))
  {
    if (*__error() != 78 && *__error() != 1)
      return 0xFFFFFFFFLL;
    goto LABEL_4;
  }
  v18.tv_sec = 0;
  *(_QWORD *)&v18.tv_usec = 0;
  if (gettimeofday(&v18, 0) < 0)
    return 4294967294;
  if (aia.ai_termid.at_type == 16)
  {
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)aia.ai_termid.at_addr, *(int32x4_t *)aia.ai_termid.at_addr))) & 1) == 0)
    {
LABEL_4:
      v4 = a1[4];
      v5 = v4 + 25;
      v6 = au_to_header((int)v4 + 25, a2, 0);
      goto LABEL_5;
    }
    v12 = 45;
  }
  else
  {
    if (aia.ai_termid.at_type != 4)
      return 4294967293;
    if (!aia.ai_termid.at_addr[0])
      goto LABEL_4;
    v12 = 33;
  }
  v5 = v12 + a1[4];
  v6 = au_to_header32_ex_tm((int)v12 + *((_DWORD *)a1 + 8), a2, 0, v18, &aia);
LABEL_5:
  v7 = v6;
  if (!v6)
    return 4294967292;
  v8 = au_to_trailer(v5);
  if (v8)
  {
    v9 = a1 + 1;
    v10 = a1[1];
    *((_QWORD *)v7 + 2) = v10;
    if (v10)
      v11 = (_QWORD *)(*v9 + 24);
    else
      v11 = a1 + 2;
    *v11 = (char *)v7 + 16;
    a1[1] = v7;
    *((_QWORD *)v7 + 3) = v9;
    *((_QWORD *)v8 + 2) = 0;
    *((_QWORD *)v8 + 3) = a1[2];
    *(_QWORD *)a1[2] = v8;
    a1[2] = (char *)v8 + 16;
    a1[4] = v5;
    v15 = a1[1];
    if (v15)
    {
      v16 = (char *)a1[3];
      do
      {
        memcpy(v16, *(const void **)v15, *(_QWORD *)(v15 + 8));
        v17 = *(_QWORD *)(v15 + 8);
        v15 = *(_QWORD *)(v15 + 16);
        v16 += v17;
      }
      while (v15);
    }
    return 0;
  }
  else
  {
    v14 = *__error();
    au_free_token(v7);
    *__error() = v14;
    return 4294967291;
  }
}

uint64_t au_teardown(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  for (i = *(_QWORD *)(a1 + 8); i; i = *(_QWORD *)(a1 + 8))
  {
    v3 = *(_QWORD *)(i + 16);
    if (v3)
      v4 = (_QWORD *)(v3 + 24);
    else
      v4 = (_QWORD *)(a1 + 16);
    *v4 = *(_QWORD *)(i + 24);
    **(_QWORD **)(i + 24) = *(_QWORD *)(i + 16);
    free(*(void **)i);
    free((void *)i);
  }
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 32) = 0;
  pthread_mutex_lock(&mutex);
  v5 = audit_free_q;
  *(_QWORD *)(a1 + 40) = audit_free_q;
  if (v5)
    *(_QWORD *)(v5 + 48) = a1 + 40;
  audit_free_q = a1;
  *(_QWORD *)(a1 + 48) = &audit_free_q;
  return pthread_mutex_unlock(&mutex);
}

int au_close(int d, int keep, __int16 event)
{
  uint64_t v3;
  int v4;

  v3 = open_desc_table[d];
  if (v3 && *(_BYTE *)v3)
  {
    if (keep)
    {
      if ((unint64_t)(*(_QWORD *)(v3 + 32) - 32544) <= 0xFFFFFFFFFFFF7FFFLL)
      {
        fwrite("au_close failed", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        *__error() = 12;
LABEL_10:
        v4 = -1;
        goto LABEL_11;
      }
      if ((au_assemble((_QWORD *)open_desc_table[d], event) & 0x80000000) != 0)
        goto LABEL_10;
      v4 = audit(*(const void **)(v3 + 24), *(_DWORD *)(v3 + 32));
    }
    else
    {
      v4 = 0;
    }
LABEL_11:
    au_teardown(v3);
    return v4;
  }
  *__error() = 22;
  return -1;
}

int au_close_buffer(int d, __int16 event, u_char *buffer, size_t *buflen)
{
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  int v8;

  v4 = *((_QWORD *)&open_desc_table + d);
  if (!v4 || !*(_BYTE *)v4)
  {
    *__error() = 22;
    return -1;
  }
  v5 = *(_QWORD *)(v4 + 32);
  v6 = v5 + 45;
  if ((unint64_t)(v5 - 32544) >= 0xFFFFFFFFFFFF8000 && v6 <= *buflen)
  {
    if ((au_assemble(*((_QWORD **)&open_desc_table + d), event) & 0x80000000) == 0)
    {
      memcpy(buffer, *(const void **)(v4 + 24), *(_QWORD *)(v4 + 32));
      v8 = 0;
      *buflen = *(_QWORD *)(v4 + 32);
      goto LABEL_7;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "au_close_buffer failed %zd", v6);
    *__error() = 12;
  }
  v8 = -1;
LABEL_7:
  au_teardown(v4);
  return v8;
}

int au_close_token(token_t *tok, u_char *buffer, size_t *buflen)
{
  size_t v5;

  v5 = *((_QWORD *)tok + 1);
  if (v5 <= *buflen)
  {
    memcpy(buffer, *(const void **)tok, v5);
    *buflen = *((_QWORD *)tok + 1);
    au_free_token(tok);
    return 0;
  }
  else
  {
    au_free_token(tok);
    *__error() = 12;
    return 22;
  }
}

au_class_ent *__cdecl getauclassent_r(au_class_ent_t *class_int)
{
  au_class_ent *v2;

  pthread_mutex_lock(&mutex_0);
  v2 = (au_class_ent *)getauclassent_r_locked((uint64_t)class_int);
  pthread_mutex_unlock(&mutex_0);
  return v2;
}

void *getauclassent_r_locked(uint64_t a1)
{
  void *result;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *__lasts;

  if (fp || (result = fopen("/etc/security/audit_class", "r"), (fp = (uint64_t)result) != 0))
  {
    while (1)
    {
      result = fgets(&linestr, 256, (FILE *)fp);
      if (!result)
        break;
      if (linestr != 35)
      {
        v3 = strrchr(&linestr, 10);
        if (v3)
          *v3 = 0;
        __lasts = 0;
        v4 = strtok_r(&linestr, ":", &__lasts);
        v5 = strtok_r(0, ":", &__lasts);
        v6 = strtok_r(0, ":", &__lasts);
        result = 0;
        if (v4 && v5 && v6)
        {
          if (strlen(v5) <= 7 && (strlcpy(*(char **)a1, v5, 8uLL), strlen(v6) <= 0x47))
          {
            strlcpy(*(char **)(a1 + 16), v6, 0x48uLL);
            *(_DWORD *)(a1 + 8) = strtoul(v4, 0, 0);
            return (void *)a1;
          }
          else
          {
            return 0;
          }
        }
        return result;
      }
    }
  }
  return result;
}

au_class_ent *getauclassent(void)
{
  getauclassent_class_ent_name = 0;
  getauclassent_class_ent_desc = 0u;
  unk_1EF6D3540 = 0u;
  xmmword_1EF6D3550 = 0u;
  unk_1EF6D3560 = 0u;
  qword_1EF6D3570 = 0;
  getauclassent_c = (uint64_t)&getauclassent_class_ent_name;
  unk_1EF6D3580 = 0;
  qword_1EF6D3588 = (uint64_t)&getauclassent_class_ent_desc;
  pthread_mutex_lock(&mutex_0);
  getauclassent_cp = (uint64_t)getauclassent_r_locked((uint64_t)&getauclassent_c);
  pthread_mutex_unlock(&mutex_0);
  return (au_class_ent *)getauclassent_cp;
}

void setauclass(void)
{
  pthread_mutex_lock(&mutex_0);
  if (fp)
    fseek((FILE *)fp, 0, 0);
  pthread_mutex_unlock(&mutex_0);
}

au_class_ent *__cdecl getauclassnam_r(au_class_ent_t *class_int, const char *name)
{
  const char **v4;
  au_class_ent *v5;

  if (!name)
    return 0;
  pthread_mutex_lock(&mutex_0);
  if (fp)
    fseek((FILE *)fp, 0, 0);
  do
  {
    v4 = (const char **)getauclassent_r_locked((uint64_t)class_int);
    v5 = (au_class_ent *)v4;
  }
  while (v4 && strcmp(name, *v4));
  pthread_mutex_unlock(&mutex_0);
  return v5;
}

au_class_ent *__cdecl getauclassnam(const char *name)
{
  getauclassnam_class_ent_name = 0;
  getauclassnam_class_ent_desc = 0u;
  *(_OWORD *)algn_1EF6D35B0 = 0u;
  xmmword_1EF6D35C0 = 0u;
  unk_1EF6D35D0 = 0u;
  qword_1EF6D35E0 = 0;
  getauclassnam_c = (uint64_t)&getauclassnam_class_ent_name;
  unk_1EF6D35F0 = 0;
  qword_1EF6D35F8 = (uint64_t)&getauclassnam_class_ent_desc;
  return getauclassnam_r((au_class_ent_t *)&getauclassnam_c, name);
}

au_class_ent *__cdecl getauclassnum_r(au_class_ent_t *class_int, au_class_t class_number)
{
  au_class_ent *v4;
  au_class_ent *v5;

  pthread_mutex_lock(&mutex_0);
  if (fp)
    fseek((FILE *)fp, 0, 0);
  while (1)
  {
    v4 = (au_class_ent *)getauclassent_r_locked((uint64_t)class_int);
    v5 = v4;
    if (!v4)
      break;
    if (v4->ac_class == class_number)
      return v5;
  }
  pthread_mutex_unlock(&mutex_0);
  return v5;
}

au_class_ent *__cdecl getauclassnum(au_class_t class_number)
{
  getauclassnum_class_ent_name = 0;
  getauclassnum_class_ent_desc = 0u;
  unk_1EF6D3618 = 0u;
  xmmword_1EF6D3628 = 0u;
  unk_1EF6D3638 = 0u;
  qword_1EF6D3648 = 0;
  getauclassnum_c = (uint64_t)&getauclassnum_class_ent_name;
  *(_QWORD *)algn_1EF6D3658 = 0;
  qword_1EF6D3660 = (uint64_t)&getauclassnum_class_ent_desc;
  return getauclassnum_r((au_class_ent_t *)&getauclassnum_c, class_number);
}

void endauclass(void)
{
  pthread_mutex_lock(&mutex_0);
  if (fp)
  {
    fclose((FILE *)fp);
    fp = 0;
  }
  pthread_mutex_unlock(&mutex_0);
}

ssize_t au_poltostr(int policy, size_t maxsize, char *buf)
{
  uint64_t v5;
  uint64_t v6;
  int v7;

  if (!maxsize)
    return -1;
  v5 = 0;
  *buf = 0;
  v6 = policy;
  v7 = 1;
  do
  {
    if ((au_polstr[v5] & v6) != 0)
    {
      if (!v7 && strlcat(buf, ",", maxsize) >= maxsize
        || strlcat(buf, (const char *)au_polstr[v5 + 1], maxsize) >= maxsize)
      {
        return -1;
      }
      v7 = 0;
    }
    v5 += 2;
  }
  while (v5 != 28);
  return strlen(buf);
}

int au_strtopol(const char *polstr, int *policy)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *__stringp;

  *policy = 0;
  v3 = strdup(polstr);
  if (!v3)
    return -1;
  v4 = v3;
  __stringp = v3;
  v5 = strsep(&__stringp, ",");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = 0;
      while (strcmp(v6, (const char *)au_polstr[v7 + 1]))
      {
        v7 += 2;
        if (v7 == 28)
        {
          free(v4);
          *__error() = 22;
          return -1;
        }
      }
      *policy |= LODWORD(au_polstr[v7]);
      v6 = strsep(&__stringp, ",");
    }
    while (v6);
  }
  free(v4);
  return 0;
}

ssize_t au_sflagstostr(uint64_t flags, size_t maxsize, char *buf)
{
  uint64_t v6;
  int v7;

  if (!maxsize)
    return -1;
  v6 = 0;
  *buf = 0;
  v7 = 1;
  do
  {
    if ((au_sflagsstr[v6] & flags) != 0)
    {
      if (!v7 && strlcat(buf, ",", maxsize) >= maxsize
        || strlcat(buf, (const char *)au_sflagsstr[v6 + 1], maxsize) >= maxsize)
      {
        return -1;
      }
      v7 = 0;
    }
    v6 += 2;
  }
  while (v6 != 12);
  return strlen(buf);
}

int au_strtosflags(const char *sflagsstr, uint64_t *flags)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *__stringp;

  *flags = 0;
  v3 = strdup(sflagsstr);
  if (!v3)
    return -1;
  v4 = v3;
  __stringp = v3;
  v5 = strsep(&__stringp, ",");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = 0;
      while (strcmp(v6, (const char *)au_sflagsstr[v7 + 1]))
      {
        v7 += 2;
        if (v7 == 12)
        {
          free(v4);
          *__error() = 22;
          return -1;
        }
      }
      *flags |= au_sflagsstr[v7];
      v6 = strsep(&__stringp, ",");
    }
    while (v6);
  }
  free(v4);
  return 0;
}

void setac(void)
{
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  pthread_mutex_unlock(&mutex_1);
}

uint64_t setac_locked()
{
  uint64_t result;
  int v1;
  stat v2;

  result = fp_0;
  if (fp_0)
  {
    memset(&v2, 0, sizeof(v2));
    v1 = fileno((FILE *)fp_0);
    if ((fstat(v1, &v2) & 0x80000000) == 0)
    {
      if (setac_locked_lastctime == v2.st_ctimespec.tv_sec)
        return fseek((FILE *)fp_0, 0, 0);
      setac_locked_lastctime = v2.st_ctimespec.tv_sec;
    }
    result = fclose((FILE *)fp_0);
    fp_0 = 0;
  }
  return result;
}

void endac(void)
{
  pthread_mutex_lock(&mutex_1);
  if (fp_0)
  {
    fclose((FILE *)fp_0);
    fp_0 = 0;
  }
  pthread_mutex_unlock(&mutex_1);
}

int getacdir(char *name, int len)
{
  int v4;
  char *__s;

  __s = 0;
  pthread_mutex_lock(&mutex_1);
  if ((getstrfromtype_locked("dir", &__s) & 0x80000000) != 0)
  {
    v4 = -2;
  }
  else if (__s)
  {
    if (strlen(__s) >= len)
    {
      v4 = -3;
    }
    else
    {
      strlcpy(name, __s, len);
      v4 = 0;
    }
  }
  else
  {
    v4 = -1;
  }
  pthread_mutex_unlock(&mutex_1);
  return v4;
}

uint64_t getstrfromtype_locked(const char *a1, char **a2)
{
  FILE *v4;
  char *i;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  char *v10;
  char *v12;
  char *__lasts;

  *a2 = 0;
  v4 = (FILE *)fp_0;
  if (!fp_0)
  {
    v4 = fopen("/etc/security/audit_control", "r");
    fp_0 = (uint64_t)v4;
    if (!v4)
      return 0xFFFFFFFFLL;
  }
  __lasts = 0;
  if (fgets(linestr_0, 256, v4))
  {
    while (1)
    {
      if (linestr_0[0] != 35)
      {
        for (i = &linestr_0[strlen(linestr_0) - 1]; i >= linestr_0; --i)
        {
          v6 = *i;
          v7 = v6 > 0x20;
          v8 = (1 << v6) & 0x100000600;
          if (v7 || v8 == 0)
            break;
          *i = 0;
        }
        v10 = strtok_r(linestr_0, ":", &__lasts);
        if (v10)
        {
          if (!strcmp(a1, v10))
            break;
        }
      }
      if (!fgets(linestr_0, 256, (FILE *)fp_0))
        goto LABEL_15;
    }
    v12 = strtok_r(0, ":", &__lasts);
    *a2 = v12;
    if (v12)
      return 0;
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
LABEL_15:
  if (ferror((FILE *)fp_0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

int getacmin(int *min_val)
{
  int v2;
  char *v4;

  v4 = 0;
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  if ((getstrfromtype_locked("minfree", &v4) & 0x80000000) != 0)
  {
    v2 = -2;
  }
  else if (v4)
  {
    v2 = 0;
    *min_val = atoi(v4);
  }
  else
  {
    v2 = 1;
  }
  pthread_mutex_unlock(&mutex_1);
  return v2;
}

int getacfilesz(size_t *size_val)
{
  const char *v2;
  int v3;
  int v5;
  char v6;
  size_t v8;
  char v9;
  uint64_t v10;
  char *v11;

  v11 = 0;
  v10 = 0;
  v9 = 0;
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  if ((getstrfromtype_locked("filesz", &v11) & 0x80000000) != 0)
  {
    pthread_mutex_unlock(&mutex_1);
    return -2;
  }
  v2 = v11;
  if (!v11)
  {
    pthread_mutex_unlock(&mutex_1);
    *__error() = 22;
    return 1;
  }
  while (1)
  {
    v3 = *(unsigned __int8 *)v2;
    if (v3 != 32 && v3 != 9)
      break;
    ++v2;
  }
  v5 = sscanf(v2, "%ju%c", &v10, &v9);
  if (v5 == 1)
  {
    v6 = 66;
    v9 = 66;
  }
  else
  {
    if (v5 != 2)
    {
LABEL_16:
      *__error() = 22;
      pthread_mutex_unlock(&mutex_1);
      return -1;
    }
    v6 = v9;
  }
  if (au_spacetobytes(size_val, v10, v6))
    goto LABEL_16;
  v8 = *size_val - 1;
  pthread_mutex_unlock(&mutex_1);
  if (v8 > 0x7FFFE)
    return 0;
  *__error() = 22;
  return -1;
}

uint64_t au_spacetobytes(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a3 <= 70)
    {
      if (a3 == 32 || a3 == 66)
        goto LABEL_12;
    }
    else
    {
      switch(a3)
      {
        case 'G':
          a2 <<= 30;
          goto LABEL_12;
        case 'M':
          a2 <<= 20;
          goto LABEL_12;
        case 'K':
          a2 <<= 10;
LABEL_12:
          v3 = 0;
          *a1 = a2;
          break;
      }
    }
  }
  return v3;
}

int getacflg(char *auditstr, int len)
{
  int v4;
  char *__s;

  __s = 0;
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  if ((getstrfromtype_locked("flags", &__s) & 0x80000000) != 0)
  {
    v4 = -2;
  }
  else if (__s)
  {
    if (strlen(__s) >= len)
    {
      v4 = -3;
    }
    else
    {
      strlcpy(auditstr, __s, len);
      v4 = 0;
    }
  }
  else
  {
    v4 = 1;
  }
  pthread_mutex_unlock(&mutex_1);
  return v4;
}

int getacna(char *auditstr, int len)
{
  int v4;
  char *__s;

  __s = 0;
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  if ((getstrfromtype_locked("naflags", &__s) & 0x80000000) != 0)
  {
    v4 = -2;
  }
  else if (__s)
  {
    if (strlen(__s) >= len)
    {
      v4 = -3;
    }
    else
    {
      strlcpy(auditstr, __s, len);
      v4 = 0;
    }
  }
  else
  {
    v4 = 1;
  }
  pthread_mutex_unlock(&mutex_1);
  return v4;
}

int getacpol(char *auditstr, size_t len)
{
  int v4;
  char *__s;

  __s = 0;
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  if ((getstrfromtype_locked("policy", &__s) & 0x80000000) != 0)
  {
    v4 = -2;
  }
  else if (__s)
  {
    if (strlen(__s) >= len)
    {
      v4 = -3;
    }
    else
    {
      strlcpy(auditstr, __s, len);
      v4 = 0;
    }
  }
  else
  {
    v4 = -1;
  }
  pthread_mutex_unlock(&mutex_1);
  return v4;
}

int getacsflagsmask(const char *which, char *auditstr, size_t len)
{
  *__error() = 78;
  return -1;
}

int getachost(char *auditstr, size_t len)
{
  int v4;
  char *__s;

  __s = 0;
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  if ((getstrfromtype_locked("host", &__s) & 0x80000000) != 0)
  {
    v4 = -2;
  }
  else if (__s)
  {
    if (strlen(__s) >= len)
    {
      v4 = -3;
    }
    else
    {
      strlcpy(auditstr, __s, len);
      v4 = 0;
    }
  }
  else
  {
    v4 = 1;
  }
  pthread_mutex_unlock(&mutex_1);
  return v4;
}

int getacexpire(int *andflg, time_t *age, size_t *size)
{
  char *v6;
  int v7;
  int v9;
  char v10;
  int v12;
  _WORD v13[5];
  int v14[2];
  char *v15;
  char __big[256];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v14 = 0;
  v15 = 0;
  memset(v13, 0, sizeof(v13));
  *age = 0;
  *size = 0;
  *andflg = 0;
  pthread_mutex_lock(&mutex_1);
  setac_locked();
  if ((getstrfromtype_locked("expire-after", &v15) & 0x80000000) != 0)
  {
    pthread_mutex_unlock(&mutex_1);
    return -2;
  }
  v6 = v15;
  if (!v15)
  {
    pthread_mutex_unlock(&mutex_1);
    return 1;
  }
  while (1)
  {
    v7 = *v6;
    if (v7 != 32 && v7 != 9)
      break;
    ++v6;
  }
  v9 = sscanf(v6, "%lu%c%[ \tadnorADNOR]%lu%c", v14, (char *)v13 + 1, __big, &v13[1], v13);
  switch(v9)
  {
    case 1:
      v10 = 66;
      HIBYTE(v13[0]) = 66;
LABEL_16:
      if (!setexpirecond(age, size, *(uint64_t *)v14, v10))
      {
LABEL_17:
        pthread_mutex_unlock(&mutex_1);
        return 0;
      }
      break;
    case 5:
      if (setexpirecond(age, size, *(uint64_t *)v14, SHIBYTE(v13[0]))
        || setexpirecond(age, size, *(uint64_t *)&v13[1], SLOBYTE(v13[0])))
      {
        break;
      }
      if (strcasestr(__big, "and"))
      {
        v12 = 1;
      }
      else
      {
        if (!strcasestr(__big, "or"))
          break;
        v12 = 0;
      }
      *andflg = v12;
      goto LABEL_17;
    case 2:
      v10 = HIBYTE(v13[0]);
      goto LABEL_16;
  }
  pthread_mutex_unlock(&mutex_1);
  return -1;
}

uint64_t setexpirecond(uint64_t *a1, _QWORD *a2, uint64_t a3, __darwin_ct_rune_t a4)
{
  int v8;
  uint64_t result;
  uint64_t v10;

  if (a4 < 0)
    v8 = __maskrune(a4, 0x8000uLL);
  else
    v8 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * a4 + 60) & 0x8000;
  if (a4 == 32 || v8)
    return au_spacetobytes(a2, a3, a4);
  result = 0xFFFFFFFFLL;
  if (!a1)
    return result;
  if (a4 > 114)
  {
    if (a4 != 115)
    {
      if (a4 != 121)
        return result;
      a3 = 31449600 * a3 + 86400 * (a3 / 4);
    }
  }
  else
  {
    if (a4 == 100)
    {
      v10 = 86400;
    }
    else
    {
      if (a4 != 104)
        return result;
      v10 = 3600;
    }
    a3 *= v10;
  }
  result = 0;
  *a1 = a3;
  return result;
}

u_short au_domain_to_bsm(int local_domain)
{
  uint64_t v1;

  v1 = 0;
  while (*(_DWORD *)&bsm_domains[v1 + 2] != local_domain)
  {
    v1 += 4;
    if (v1 == 260)
      return 700;
  }
  return bsm_domains[v1];
}

int au_bsm_to_domain(u_short bsm_domain, int *local_domainp)
{
  uint64_t v2;
  int result;

  v2 = 0;
  while ((unsigned __int16)bsm_domains[v2] != bsm_domain)
  {
    v2 += 4;
    if (v2 == 260)
      return -1;
  }
  if (v2 * 2)
    return -1;
  result = 0;
  *local_domainp = 0;
  return result;
}

void setauevent(void)
{
  pthread_mutex_lock(&mutex_2);
  if (fp_1)
    fseek((FILE *)fp_1, 0, 0);
  pthread_mutex_unlock(&mutex_2);
}

void endauevent(void)
{
  pthread_mutex_lock(&mutex_2);
  if (fp_1)
  {
    fclose((FILE *)fp_1);
    fp_1 = 0;
  }
  pthread_mutex_unlock(&mutex_2);
}

au_event_ent *__cdecl getauevent_r(au_event_ent *e)
{
  char *v2;

  pthread_mutex_lock(&mutex_2);
  if (fp_1 || (fp_1 = (uint64_t)fopen("/etc/security/audit_event", "r")) != 0)
  {
    while (fgets(&linestr_1, 256, (FILE *)fp_1))
    {
      v2 = strrchr(&linestr_1, 10);
      if (v2)
        *v2 = 0;
      if (linestr_1 != 35)
      {
        if (!eventfromstr((uint64_t)e))
          e = 0;
        goto LABEL_11;
      }
    }
  }
  e = 0;
LABEL_11:
  pthread_mutex_unlock(&mutex_2);
  return e;
}

au_event_ent *getauevent(void)
{
  getauevent_e = 0u;
  xmmword_1EF6D38E8 = 0u;
  qword_1EF6D3890 = 0;
  unk_1EF6D3898 = 0;
  getauevent_event_ent_name = 0;
  unk_1EF6D389E = 0;
  getauevent_event_ent_desc = 0u;
  unk_1EF6D38B6 = 0u;
  xmmword_1EF6D38C6 = 0u;
  word_1EF6D38D6 = 0;
  *((_QWORD *)&getauevent_e + 1) = &getauevent_event_ent_name;
  *(_QWORD *)&xmmword_1EF6D38E8 = &getauevent_event_ent_desc;
  return getauevent_r((au_event_ent *)&getauevent_e);
}

au_event_ent *__cdecl getauevnam_r(au_event_ent *e, const char *name)
{
  FILE *v4;
  char *v5;

  pthread_mutex_lock(&mutex_2);
  if (name
    && (fp_1 && (fseek((FILE *)fp_1, 0, 0), (v4 = (FILE *)fp_1) != 0)
     || (v4 = fopen("/etc/security/audit_event", "r"), (fp_1 = (uint64_t)v4) != 0))
    && fgets(&linestr_1, 256, v4))
  {
    while (1)
    {
      v5 = strrchr(&linestr_1, 10);
      if (v5)
        *v5 = 0;
      if (eventfromstr((uint64_t)e) && !strcmp(name, e->ae_name))
        break;
      if (!fgets(&linestr_1, 256, (FILE *)fp_1))
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    e = 0;
  }
  pthread_mutex_unlock(&mutex_2);
  return e;
}

au_event_ent *__cdecl getauevnam(const char *name)
{
  getauevnam_e = 0u;
  xmmword_1EF6D3958 = 0u;
  qword_1EF6D3900 = 0;
  unk_1EF6D3908 = 0;
  getauevnam_event_ent_name = 0;
  unk_1EF6D390E = 0;
  getauevnam_event_ent_desc = 0u;
  unk_1EF6D3926 = 0u;
  xmmword_1EF6D3936 = 0u;
  word_1EF6D3946 = 0;
  *((_QWORD *)&getauevnam_e + 1) = &getauevnam_event_ent_name;
  *(_QWORD *)&xmmword_1EF6D3958 = &getauevnam_event_ent_desc;
  return getauevnam_r((au_event_ent *)&getauevnam_e, name);
}

au_event_ent *__cdecl getauevnum_r(au_event_ent *e, au_event_t event_number)
{
  int v2;
  FILE *v4;
  char *v5;

  v2 = event_number;
  pthread_mutex_lock(&mutex_2);
  if ((fp_1 && (fseek((FILE *)fp_1, 0, 0), (v4 = (FILE *)fp_1) != 0)
     || (v4 = fopen("/etc/security/audit_event", "r"), (fp_1 = (uint64_t)v4) != 0))
    && fgets(&linestr_1, 256, v4))
  {
    while (1)
    {
      v5 = strrchr(&linestr_1, 10);
      if (v5)
        *v5 = 0;
      if (eventfromstr((uint64_t)e) && e->ae_number == v2)
        break;
      if (!fgets(&linestr_1, 256, (FILE *)fp_1))
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    e = 0;
  }
  pthread_mutex_unlock(&mutex_2);
  return e;
}

au_event_ent *__cdecl getauevnum(au_event_t event_number)
{
  getauevnum_e = 0u;
  xmmword_1EF6D39C8 = 0u;
  qword_1EF6D3970 = 0;
  unk_1EF6D3978 = 0;
  getauevnum_event_ent_name = 0;
  unk_1EF6D397E = 0;
  getauevnum_event_ent_desc = 0u;
  unk_1EF6D3996 = 0u;
  xmmword_1EF6D39A6 = 0u;
  word_1EF6D39B6 = 0;
  *((_QWORD *)&getauevnum_e + 1) = &getauevnum_event_ent_name;
  *(_QWORD *)&xmmword_1EF6D39C8 = &getauevnum_event_ent_desc;
  return getauevnum_r((au_event_ent *)&getauevnum_e, event_number);
}

au_event_t *__cdecl getauevnonam_r(au_event_t *ev, const char *event_name)
{
  getauevnonam_r_event_ent_name = 0;
  unk_1EF6D39E0 = 0;
  *(uint64_t *)((char *)&qword_1EF6D39E8 + 6) = 0;
  qword_1EF6D39E8 = 0;
  getauevnonam_r_event_ent_desc = 0u;
  unk_1EF6D3A06 = 0u;
  xmmword_1EF6D3A16 = 0u;
  word_1EF6D3A26 = 0;
  getauevnonam_r_e = 0u;
  xmmword_1EF6D3A38 = 0u;
  *((_QWORD *)&getauevnonam_r_e + 1) = &getauevnonam_r_event_ent_name;
  *(_QWORD *)&xmmword_1EF6D3A38 = &getauevnonam_r_event_ent_desc;
  getauevnonam_r_ep = (uint64_t)getauevnam_r((au_event_ent *)&getauevnonam_r_e, event_name);
  if (!getauevnonam_r_ep)
    return 0;
  *ev = getauevnonam_r_e;
  return ev;
}

au_event_t *__cdecl getauevnonam(const char *event_name)
{
  return getauevnonam_r(&getauevnonam_event, event_name);
}

uint64_t eventfromstr(uint64_t a1)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  uint64_t result;
  int v7;
  unsigned int am_success;
  char *v9;
  au_mask_t masks;

  v9 = 0;
  masks = 0;
  v2 = strtok_r(&linestr_1, ":", &v9);
  v3 = strtok_r(0, ":", &v9);
  v4 = strtok_r(0, ":", &v9);
  v5 = strtok_r(0, ":", &v9);
  result = 0;
  if (v2 && v3)
  {
    if (strlen(v3) > 0x1D)
      return 0;
    strlcpy(*(char **)(a1 + 8), v3, 0x1EuLL);
    if (v4)
    {
      if (strlen(v4) > 0x31)
        return 0;
      strlcpy(*(char **)(a1 + 16), v4, 0x32uLL);
    }
    else
    {
      **(_BYTE **)(a1 + 16) = 0;
    }
    *(_WORD *)a1 = atoi(v2);
    if (v5)
    {
      v7 = getauditflagsbin(v5, &masks);
      am_success = masks.am_success;
      if (v7)
        am_success = 0;
    }
    else
    {
      am_success = 0;
    }
    *(_DWORD *)(a1 + 24) = am_success;
    return a1;
  }
  return result;
}

int getauditflagsbin(char *auditstr, au_mask_t *masks)
{
  char *i;
  char *v4;
  int v5;
  int v6;
  const char *v8;
  au_class_t ac_class;
  unsigned int v10;
  char *v12;
  au_class_ent_t class_int;
  _OWORD v14[4];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v16[0] = 0;
  memset(v14, 0, sizeof(v14));
  v15 = 0;
  v12 = 0;
  class_int.ac_name = (char *)v16;
  *(_QWORD *)&class_int.ac_class = 0;
  class_int.ac_desc = (char *)v14;
  *masks = 0;
  for (i = strtok_r(auditstr, ",", &v12); i; i = strtok_r(0, ",", &v12))
  {
    v4 = i + 1;
    v5 = *i;
    if (v5 != 94)
      v4 = i;
    v6 = *v4;
    if (v6 == 43 || v6 == 45)
      v8 = v4 + 1;
    else
      v8 = v4;
    if (!getauclassnam_r(&class_int, v8))
    {
      *__error() = 22;
      LODWORD(i) = -1;
      return (int)i;
    }
    ac_class = class_int.ac_class;
    if (v5 == 94)
    {
      if (v6 != 45)
      {
        masks->am_success &= ~class_int.ac_class;
        if (v6 == 43)
          continue;
      }
      v10 = masks->am_failure & ~ac_class;
    }
    else
    {
      if (v6 != 45)
      {
        masks->am_success |= class_int.ac_class;
        if (v6 == 43)
          continue;
      }
      v10 = masks->am_failure | ac_class;
    }
    masks->am_failure = v10;
  }
  return (int)i;
}

int getauditflagschar(char *auditstr, au_mask_t *masks, int verbose)
{
  char *v6;
  unsigned int am_failure;
  unsigned int v8;
  char *ac_desc;
  au_class_ent_t class_int;
  _OWORD v12[4];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = 0;
  memset(v12, 0, sizeof(v12));
  v13 = 0;
  class_int.ac_name = (char *)v14;
  *(_QWORD *)&class_int.ac_class = 0;
  class_int.ac_desc = (char *)v12;
  setauclass();
  v6 = auditstr;
  while (getauclassent_r(&class_int))
  {
    if (class_int.ac_class)
    {
      am_failure = masks->am_failure;
      v8 = masks->am_success & class_int.ac_class;
      if ((v8 == class_int.ac_class) | (2 * ((am_failure & class_int.ac_class) == class_int.ac_class)))
      {
        if (verbose)
        {
          strlcpy(v6, class_int.ac_desc, 0x48uLL);
          ac_desc = class_int.ac_desc;
        }
        else
        {
          strlcpy(v6, class_int.ac_name, 8uLL);
          ac_desc = class_int.ac_name;
        }
        v6 += strlen(ac_desc);
        *v6 = 44;
LABEL_13:
        ++v6;
      }
      else
      {
        if (v8 == class_int.ac_class)
        {
          *v6 = 43;
          goto LABEL_13;
        }
        if ((am_failure & class_int.ac_class) == class_int.ac_class)
        {
          *v6 = 45;
          goto LABEL_13;
        }
      }
    }
  }
  if (v6 != auditstr)
    *(v6 - 1) = 0;
  return 0;
}

void au_print_xml_header(FILE *outfp)
{
  fwrite("<?xml version='1.0' encoding='UTF-8'?>\n", 0x27uLL, 1uLL, outfp);
  fwrite("<audit>\n", 8uLL, 1uLL, outfp);
}

void au_print_xml_footer(FILE *outfp)
{
  fwrite("</audit>\n", 9uLL, 1uLL, outfp);
}

int au_fetch_tok(tokenstr_t *tok, u_char *buf, int len)
{
  int v3;
  uint64_t v5;
  size_t v6;
  int v7;
  BOOL v8;
  u_int32_t v9;

  if (len < 1)
    return -1;
  tok->data = buf;
  tok->len = 1;
  v3 = *buf;
  tok->id = v3;
  if (v3 <= 95)
  {
    switch(v3)
    {
      case 17:
        return fetch_file_tok((uint64_t)tok, (uint64_t)buf, len);
      case 18:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 37:
      case 48:
      case 49:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
        goto LABEL_49;
      case 19:
        return fetch_trailer_tok((uint64_t)tok, (uint64_t)buf, len);
      case 20:
        return fetch_header32_tok((uint64_t)tok, (uint64_t)buf, len);
      case 21:
        return fetch_header32_ex_tok((uint64_t)tok, (uint64_t)buf, len);
      case 33:
        return fetch_arb_tok((uint64_t)tok, (uint64_t)buf, len);
      case 34:
      case 39:
        return fetch_ipc_tok((uint64_t)tok, (uint64_t)buf, len);
      case 35:
      case 40:
      case 41:
        goto LABEL_7;
      case 36:
      case 38:
        return fetch_process32_tok((uint64_t)tok, (uint64_t)buf, len);
      case 42:
        if (len < 5)
          goto LABEL_55;
        v9 = *(_DWORD *)(buf + 1);
        break;
      case 43:
        return fetch_ip_tok((uint64_t)tok, (uint64_t)buf, len);
      case 44:
        if (len >= 3)
        {
          tok->tt.grps.no = *(_WORD *)(buf + 1);
          tok->len = 3;
        }
        v8 = len >= 3;
        goto LABEL_56;
      case 45:
        return fetch_arg32_tok((uint64_t)tok, (uint64_t)buf, len);
      case 46:
        return fetch_socket_tok((uint64_t)tok, (uint64_t)buf, len);
      case 47:
        if (len < 5)
          goto LABEL_55;
        v9 = bswap32(*(_DWORD *)(buf + 1));
        break;
      case 50:
        return fetch_ipcperm_tok((uint64_t)tok, (uint64_t)buf, len);
      case 59:
        return fetch_newgroups_tok((uint64_t)tok, (uint64_t)buf, len);
      case 60:
      case 61:
        return fetch_execarg_tok((uint64_t)tok, (uint64_t)buf, len);
      case 62:
        return fetch_attr32_tok((uint64_t)tok, (uint64_t)buf, len);
      default:
        if (v3 != 82)
          goto LABEL_49;
        return fetch_exit_tok((uint64_t)tok, (uint64_t)buf, len);
    }
    tok->tt.attr32.mode = v9;
    tok->len = 5;
LABEL_55:
    v8 = len >= 5;
LABEL_56:
    if (v8)
      return 0;
    else
      return -1;
  }
  if (v3 <= 236)
  {
    switch(v3)
    {
      case 96:
LABEL_7:
        if (len < 3)
          return -1;
        v5 = __rev16(*(unsigned __int16 *)(buf + 1));
        tok->tt.grps.no = v5;
        tok->len = 3;
        v6 = v5 + 3;
        if (v6 > len)
          return -1;
        tok->tt.arg64.val = (u_int64_t)(buf + 3);
        tok->len = v6;
        return 0;
      case 113:
        return fetch_arg64_tok((uint64_t)tok, (uint64_t)buf, len);
      case 114:
        return fetch_return64_tok((uint64_t)tok, (uint64_t)buf, len);
      case 115:
        return fetch_attr64_tok((uint64_t)tok, (uint64_t)buf, len);
      case 116:
        return fetch_header64_tok((uint64_t)tok, (uint64_t)buf, len);
      case 117:
      case 119:
        return fetch_process64_tok((uint64_t)tok, (uint64_t)buf, len);
      case 121:
        return fetch_header64_ex_tok((uint64_t)tok, (uint64_t)buf, len);
      case 122:
      case 123:
        return fetch_process32ex_tok((uint64_t)tok, (uint64_t)buf, len);
      case 124:
      case 125:
        return fetch_process64ex_tok((uint64_t)tok, (uint64_t)buf, len);
      case 126:
        return fetch_inaddr_ex_tok((uint64_t)tok, (uint64_t)buf, len);
      case 127:
        return fetch_socketex32_tok((uint64_t)tok, (uint64_t)buf, len);
      case 128:
        return fetch_sock_inet32_tok((uint64_t)tok, (uint64_t)buf, len);
      case 129:
        return fetch_sock_inet128_tok((uint64_t)tok, (uint64_t)buf, len);
      case 130:
        return fetch_sock_unix_tok((uint64_t)tok, (uint64_t)buf, len);
      default:
        goto LABEL_49;
    }
  }
  if (v3 == 237)
    return fetch_identity_tok((uint64_t)tok, (uint64_t)buf, len);
  if (v3 == 238 || v3 == 239)
    return fetch_cert_hash_tok((uint64_t)tok, (uint64_t)buf, len);
LABEL_49:
  if (len < 9)
    return -1;
  v7 = 0;
  tok->tt.grps.no = len - 8;
  tok->tt.arg64.val = (u_int64_t)(buf + 1);
  tok->len = (len - 8) + 1;
  return v7;
}

uint64_t fetch_header32_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 5;
  if (v3 + 5 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 7;
  if (v3 + 7 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 30) = bswap32(*(unsigned __int16 *)(a2 + v5)) >> 16;
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v3 + 9;
  if (v3 + 9 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 32) = bswap32(*(unsigned __int16 *)(a2 + v6)) >> 16;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v3 + 13;
  if (v3 + 13 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v7));
  *(_QWORD *)(a1 + 16) = v8;
  v10 = v3 + 17;
  if (v10 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 40) = bswap32(*(_DWORD *)(a2 + v8));
  *(_QWORD *)(a1 + 16) = v10;
  return 0;
}

uint64_t fetch_header32_ex_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  size_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v7 = a3;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v8 = v3 + 5;
  if (v3 + 5 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 7;
  if (v3 + 7 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 30) = bswap32(*(unsigned __int16 *)(a2 + v8)) >> 16;
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 9;
  if (v3 + 9 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 32) = bswap32(*(unsigned __int16 *)(a2 + v9)) >> 16;
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v3 + 13;
  if (v3 + 13 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v12 = *(_DWORD *)(a2 + v10);
  *(_QWORD *)(a1 + 40) = 0;
  v13 = (void *)(a1 + 40);
  v14 = bswap32(v12);
  *(_DWORD *)(a1 + 36) = v14;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  if (v14 == 16)
  {
    v15 = v3 + 29;
    if (v3 + 29 <= (unint64_t)a3)
    {
      v16 = 16;
LABEL_14:
      memcpy(v13, (const void *)(a2 + v11), v16);
      *(_QWORD *)(a1 + 16) = v15;
      v17 = 1;
      v11 = v15;
      goto LABEL_15;
    }
    v17 = 0;
  }
  else
  {
    if (v14 == 4)
    {
      v15 = v3 + 17;
      if (v3 + 17 > (unint64_t)a3)
        return 0xFFFFFFFFLL;
      v16 = 4;
      goto LABEL_14;
    }
    v17 = 1;
  }
LABEL_15:
  v18 = v11 + 4;
  if (v11 + 4 > v7)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 56) = bswap32(*(_DWORD *)(a2 + v11));
  *(_QWORD *)(a1 + 16) = v18;
  if (!v17)
    return 0xFFFFFFFFLL;
  v19 = v11 + 8;
  if (v19 > v7)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 60) = bswap32(*(_DWORD *)(a2 + v18));
  *(_QWORD *)(a1 + 16) = v19;
  return 0;
}

uint64_t fetch_header64_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v6 = a3;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v7 = v3 + 5;
  if (v3 + 5 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v3 + 7;
  if (v3 + 7 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 30) = bswap32(*(unsigned __int16 *)(a2 + v7)) >> 16;
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 9;
  if (v3 + 9 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 32) = bswap32(*(unsigned __int16 *)(a2 + v8)) >> 16;
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 17;
  if (v3 + 17 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 40) = bswap64(*(_QWORD *)(a2 + v9));
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v3 + 25;
  if (v3 + 25 <= (unint64_t)a3)
  {
    *(_QWORD *)(a1 + 48) = be64dec((unint64_t *)(a2 + v10));
    *(_QWORD *)(a1 + 16) = v12;
  }
  if (v12 <= v6)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t fetch_header64_ex_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  size_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v7 = a3;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v8 = v3 + 5;
  if (v3 + 5 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 7;
  if (v3 + 7 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 30) = bswap32(*(unsigned __int16 *)(a2 + v8)) >> 16;
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 9;
  if (v3 + 9 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 32) = bswap32(*(unsigned __int16 *)(a2 + v9)) >> 16;
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v3 + 13;
  if (v3 + 13 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v12 = *(_DWORD *)(a2 + v10);
  *(_QWORD *)(a1 + 40) = 0;
  v13 = (void *)(a1 + 40);
  v14 = bswap32(v12);
  *(_DWORD *)(a1 + 36) = v14;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  if (v14 == 16)
  {
    v15 = v3 + 29;
    if (v3 + 29 <= (unint64_t)a3)
    {
      v16 = 16;
LABEL_14:
      memcpy(v13, (const void *)(a2 + v11), v16);
      *(_QWORD *)(a1 + 16) = v15;
      v17 = 1;
      v11 = v15;
      goto LABEL_15;
    }
    v17 = 0;
  }
  else
  {
    if (v14 == 4)
    {
      v15 = v3 + 17;
      if (v3 + 17 > (unint64_t)a3)
        return 0xFFFFFFFFLL;
      v16 = 4;
      goto LABEL_14;
    }
    v17 = 1;
  }
LABEL_15:
  v18 = v11 + 8;
  if (v11 + 8 > v7)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 56) = be64dec((unint64_t *)(a2 + v11));
  *(_QWORD *)(a1 + 16) = v18;
  if (!v17)
    return 0xFFFFFFFFLL;
  v19 = v11 + 16;
  if (v19 > v7)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 64) = be64dec((unint64_t *)(a2 + v18));
  *(_QWORD *)(a1 + 16) = v19;
  return 0;
}

uint64_t fetch_trailer_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 24) = bswap32(*(unsigned __int16 *)(a2 + v3)) >> 16;
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v3 + 6;
  if (v6 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v6;
  return 0;
}

uint64_t fetch_arg32_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 1;
  if (v3 + 1 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + v3);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 5;
  if (v3 + 5 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 7;
  if (v6 > a3)
    return 0xFFFFFFFFLL;
  v8 = __rev16(*(unsigned __int16 *)(a2 + v5));
  *(_WORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 16) = v6;
  v9 = v6 + v8;
  if (v9 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 40) = a2 + v6;
  *(_QWORD *)(a1 + 16) = v9;
  return 0;
}

uint64_t fetch_arg64_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 1;
  if (v3 + 1 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + v3);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 9;
  if (v3 + 9 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 32) = bswap64(*(_QWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 11;
  if (v6 > a3)
    return 0xFFFFFFFFLL;
  v8 = __rev16(*(unsigned __int16 *)(a2 + v5));
  *(_WORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 16) = v6;
  v9 = v6 + v8;
  if (v9 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 48) = a2 + v6;
  *(_QWORD *)(a1 + 16) = v9;
  return 0;
}

uint64_t fetch_attr32_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 12;
  if (v3 + 12 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 32) = bswap32(*(_DWORD *)(a2 + v5));
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v3 + 16;
  if (v3 + 16 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v6));
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v3 + 24;
  if (v3 + 24 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 40) = bswap64(*(_QWORD *)(a2 + v7));
  *(_QWORD *)(a1 + 16) = v8;
  v10 = v3 + 28;
  if (v10 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a2 + v8));
  *(_QWORD *)(a1 + 16) = v10;
  return 0;
}

uint64_t fetch_attr64_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v6 = a3;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v7 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v3 + 12;
  if (v3 + 12 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 32) = bswap32(*(_DWORD *)(a2 + v7));
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 16;
  if (v3 + 16 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v8));
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 24;
  if (v3 + 24 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 40) = bswap64(*(_QWORD *)(a2 + v9));
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v3 + 32;
  if (v3 + 32 <= (unint64_t)a3)
  {
    *(_QWORD *)(a1 + 48) = be64dec((unint64_t *)(a2 + v10));
    *(_QWORD *)(a1 + 16) = v12;
  }
  if (v12 <= v6)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t fetch_exit_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v3 + 8;
  if (v6 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v6;
  return 0;
}

uint64_t fetch_execarg_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 <= (unint64_t)a3)
  {
    v7 = bswap32(*(_DWORD *)(a2 + v3));
    *(_DWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 16) = v4;
    if (!(_DWORD)v7)
      return 0;
    v8 = 0;
    while (1)
    {
      if (v8 <= 0x7F)
        *(_QWORD *)(a1 + 8 * v8 + 32) = a2 + v4;
      if (!a2)
        break;
      while (1)
      {
        v9 = *(unsigned __int8 *)(a2 + v4++);
        *(_QWORD *)(a1 + 16) = v4;
        if (!v9)
          break;
        if (v4 >= a3)
          return 0xFFFFFFFFLL;
      }
      if (++v8 == v7)
      {
        if (v7 < 0x81)
          return 0;
        v5 = 0;
        *(_DWORD *)(a1 + 24) = 128;
        return v5;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t fetch_file_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 10;
  if (v6 > a3)
    return 0xFFFFFFFFLL;
  v8 = __rev16(*(unsigned __int16 *)(a2 + v5));
  *(_WORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 16) = v6;
  v9 = v6 + v8;
  if (v9 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 40) = a2 + v6;
  *(_QWORD *)(a1 + 16) = v9;
  return 0;
}

uint64_t fetch_newgroups_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;
  uint64_t i;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v5 = __rev16(*(unsigned __int16 *)(a2 + v3));
  *(_WORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 16) = v3 + 2;
  if ((_DWORD)v5)
  {
    v6 = (_DWORD *)(a1 + 28);
    for (i = v3 + 3; i + 3 <= (unint64_t)a3; i += 4)
    {
      *v6++ = bswap32(*(_DWORD *)(a2 + 2 + i - 3));
      *(_QWORD *)(a1 + 16) = i + 3;
      if (!--v5)
        return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t fetch_inaddr_ex_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 <= (unint64_t)a3)
  {
    v5 = bswap32(*(_DWORD *)(a2 + v3));
    *(_DWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 16) = v4;
    if (v5 == 16)
    {
      v6 = v3 + 20;
      if (v6 <= a3)
      {
        *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + v4);
        goto LABEL_10;
      }
    }
    else if (v5 == 4)
    {
      v6 = v3 + 8;
      if (v6 <= a3)
      {
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + v4);
LABEL_10:
        v7 = 0;
        *(_QWORD *)(a1 + 16) = v6;
        return v7;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t fetch_ip_tok(uint64_t a1, uint64_t a2, unsigned int a3)
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
  uint64_t v12;
  unint64_t v14;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 1;
  if (v3 + 1 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + v3);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 26) = *(_WORD *)(a2 + v5);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v3 + 6;
  if (v3 + 6 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 28) = *(_WORD *)(a2 + v6);
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 30) = *(_WORD *)(a2 + v7);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 9;
  if (v3 + 9 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + v8);
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 10;
  if (v3 + 10 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + v9);
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v3 + 12;
  if (v3 + 12 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 34) = *(_WORD *)(a2 + v10);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v3 + 16;
  if (v3 + 16 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + v11);
  *(_QWORD *)(a1 + 16) = v12;
  v14 = v3 + 20;
  if (v14 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + v12);
  *(_QWORD *)(a1 + 16) = v14;
  return 0;
}

uint64_t fetch_ipc_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 1;
  if (v3 + 1 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + v3);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v3 + 5;
  if (v6 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v6;
  return 0;
}

uint64_t fetch_ipcperm_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 12;
  if (v3 + 12 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 32) = bswap32(*(_DWORD *)(a2 + v5));
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v3 + 16;
  if (v3 + 16 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v6));
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v3 + 20;
  if (v3 + 20 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 40) = bswap32(*(_DWORD *)(a2 + v7));
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 24;
  if (v3 + 24 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 44) = bswap32(*(_DWORD *)(a2 + v8));
  *(_QWORD *)(a1 + 16) = v9;
  v11 = v3 + 28;
  if (v11 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a2 + v9));
  *(_QWORD *)(a1 + 16) = v11;
  return 0;
}

uint64_t fetch_process32_tok(uint64_t a1, uint64_t a2, unsigned int a3)
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
  unint64_t v13;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 12;
  if (v3 + 12 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 32) = bswap32(*(_DWORD *)(a2 + v5));
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v3 + 16;
  if (v3 + 16 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v6));
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v3 + 20;
  if (v3 + 20 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 40) = bswap32(*(_DWORD *)(a2 + v7));
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 24;
  if (v3 + 24 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 44) = bswap32(*(_DWORD *)(a2 + v8));
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 28;
  if (v3 + 28 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a2 + v9));
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v3 + 32;
  if (v3 + 32 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 52) = bswap32(*(_DWORD *)(a2 + v10));
  *(_QWORD *)(a1 + 16) = v11;
  v13 = v3 + 36;
  if (v13 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + v11);
  *(_QWORD *)(a1 + 16) = v13;
  return 0;
}

uint64_t fetch_process32ex_tok(uint64_t a1, uint64_t a2, unsigned int a3)
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
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 <= (unint64_t)a3)
  {
    *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v3 + 8;
    if (v3 + 8 <= (unint64_t)a3)
    {
      *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
      *(_QWORD *)(a1 + 16) = v5;
      v6 = v3 + 12;
      if (v3 + 12 <= (unint64_t)a3)
      {
        *(_DWORD *)(a1 + 32) = bswap32(*(_DWORD *)(a2 + v5));
        *(_QWORD *)(a1 + 16) = v6;
        v7 = v3 + 16;
        if (v3 + 16 <= (unint64_t)a3)
        {
          *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v6));
          *(_QWORD *)(a1 + 16) = v7;
          v8 = v3 + 20;
          if (v3 + 20 <= (unint64_t)a3)
          {
            *(_DWORD *)(a1 + 40) = bswap32(*(_DWORD *)(a2 + v7));
            *(_QWORD *)(a1 + 16) = v8;
            v9 = v3 + 24;
            if (v3 + 24 <= (unint64_t)a3)
            {
              *(_DWORD *)(a1 + 44) = bswap32(*(_DWORD *)(a2 + v8));
              *(_QWORD *)(a1 + 16) = v9;
              v10 = v3 + 28;
              if (v3 + 28 <= (unint64_t)a3)
              {
                *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a2 + v9));
                *(_QWORD *)(a1 + 16) = v10;
                v11 = v3 + 32;
                if (v3 + 32 <= (unint64_t)a3)
                {
                  *(_DWORD *)(a1 + 52) = bswap32(*(_DWORD *)(a2 + v10));
                  *(_QWORD *)(a1 + 16) = v11;
                  v12 = v3 + 36;
                  if (v3 + 36 <= (unint64_t)a3)
                  {
                    v13 = bswap32(*(_DWORD *)(a2 + v11));
                    *(_DWORD *)(a1 + 56) = v13;
                    *(_QWORD *)(a1 + 16) = v12;
                    if (v13 == 16)
                    {
                      v14 = v3 + 52;
                      if (v3 + 52 <= (unint64_t)a3)
                      {
                        *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + v12);
                        goto LABEL_18;
                      }
                    }
                    else if (v13 == 4)
                    {
                      v14 = v3 + 40;
                      if (v3 + 40 <= (unint64_t)a3)
                      {
                        *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + v12);
LABEL_18:
                        v15 = 0;
                        *(_QWORD *)(a1 + 16) = v14;
                        return v15;
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
  return 0xFFFFFFFFLL;
}

uint64_t fetch_process64_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v7 = a3;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v8 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 12;
  if (v3 + 12 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 32) = bswap32(*(_DWORD *)(a2 + v8));
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 16;
  if (v3 + 16 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v9));
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v3 + 20;
  if (v3 + 20 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 40) = bswap32(*(_DWORD *)(a2 + v10));
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v3 + 24;
  if (v3 + 24 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 44) = bswap32(*(_DWORD *)(a2 + v11));
  *(_QWORD *)(a1 + 16) = v12;
  v13 = v3 + 28;
  if (v3 + 28 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a2 + v12));
  *(_QWORD *)(a1 + 16) = v13;
  v14 = v3 + 36;
  if (v3 + 36 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 56) = be64dec((unint64_t *)(a2 + v13));
  *(_QWORD *)(a1 + 16) = v14;
  v16 = v3 + 40;
  if (v3 + 40 <= v7)
  {
    *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + v14);
    *(_QWORD *)(a1 + 16) = v16;
  }
  if (v16 <= v7)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t fetch_process64ex_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v7 = a3;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v8 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = bswap32(*(_DWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v3 + 12;
  if (v3 + 12 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 32) = bswap32(*(_DWORD *)(a2 + v8));
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v3 + 16;
  if (v3 + 16 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 36) = bswap32(*(_DWORD *)(a2 + v9));
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v3 + 20;
  if (v3 + 20 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 40) = bswap32(*(_DWORD *)(a2 + v10));
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v3 + 24;
  if (v3 + 24 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 44) = bswap32(*(_DWORD *)(a2 + v11));
  *(_QWORD *)(a1 + 16) = v12;
  v13 = v3 + 28;
  if (v3 + 28 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a2 + v12));
  *(_QWORD *)(a1 + 16) = v13;
  v14 = v3 + 36;
  if (v3 + 36 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 56) = be64dec((unint64_t *)(a2 + v13));
  *(_QWORD *)(a1 + 16) = v14;
  v15 = v3 + 40;
  if (v3 + 40 > v7)
    return 0xFFFFFFFFLL;
  v16 = bswap32(*(_DWORD *)(a2 + v14));
  *(_DWORD *)(a1 + 64) = v16;
  *(_QWORD *)(a1 + 16) = v15;
  if (v16 == 16)
  {
    v17 = v3 + 56;
    if (v3 + 56 <= v7)
    {
      *(_OWORD *)(a1 + 68) = *(_OWORD *)(a2 + v15);
      goto LABEL_17;
    }
    return 0xFFFFFFFFLL;
  }
  if (v16 != 4)
    return 0xFFFFFFFFLL;
  v17 = v3 + 44;
  if (v3 + 44 > v7)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + v15);
LABEL_17:
  result = 0;
  *(_QWORD *)(a1 + 16) = v17;
  return result;
}

uint64_t fetch_return64_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 1;
  if (v3 + 1 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + v3);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v3 + 9;
  if (v6 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 32) = bswap64(*(_QWORD *)(a2 + v4));
  *(_QWORD *)(a1 + 16) = v6;
  return 0;
}

uint64_t fetch_socket_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 24) = bswap32(*(unsigned __int16 *)(a2 + v3)) >> 16;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 26) = *(_WORD *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + v5);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v3 + 10;
  if (v3 + 10 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + v6);
  *(_QWORD *)(a1 + 16) = v7;
  v9 = v3 + 14;
  if (v9 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + v7);
  *(_QWORD *)(a1 + 16) = v9;
  return 0;
}

uint64_t fetch_sock_inet32_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 24) = bswap32(*(unsigned __int16 *)(a2 + v3)) >> 16;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 26) = *(_WORD *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v5;
  v7 = v3 + 8;
  if (v7 > a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + v5);
  *(_QWORD *)(a1 + 16) = v7;
  return 0;
}

uint64_t fetch_sock_unix_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  size_t v7;
  const void *v8;
  void *v9;
  size_t v10;
  size_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v7 = a3;
  *(_WORD *)(a1 + 24) = bswap32(*(unsigned __int16 *)(a2 + v3)) >> 16;
  *(_QWORD *)(a1 + 16) = v4;
  v8 = (const void *)(a2 + v4);
  v9 = memchr((void *)(a2 + v4), 0, 0x68uLL);
  if (v9)
    v10 = (int)v9 - (int)v8 + 1;
  else
    v10 = 105;
  v11 = v10 + v4;
  if (v11 > v7)
    return 0xFFFFFFFFLL;
  memcpy((void *)(a1 + 26), v8, v10);
  *(_QWORD *)(a1 + 16) = v11;
  return 0;
}

uint64_t fetch_sock_inet128_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 24) = bswap32(*(unsigned __int16 *)(a2 + v3)) >> 16;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 26) = *(_WORD *)(a2 + v4);
  *(_QWORD *)(a1 + 16) = v5;
  v7 = v3 + 20;
  if (v7 > a3)
    return 0xFFFFFFFFLL;
  *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + v5);
  *(_QWORD *)(a1 + 16) = v7;
  return 0;
}

uint64_t fetch_socketex32_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 24) = bswap32(*(unsigned __int16 *)(a2 + v3)) >> 16;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 26) = bswap32(*(unsigned __int16 *)(a2 + v4)) >> 16;
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v3 + 6;
  if (v3 + 6 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v7 = __rev16(*(unsigned __int16 *)(a2 + v5));
  *(_WORD *)(a1 + 28) = v7;
  *(_QWORD *)(a1 + 16) = v6;
  if (v7 != 16 && v7 != 4)
    return 0xFFFFFFFFLL;
  v9 = v3 + 8;
  if (v3 + 8 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a1 + 30) = *(_WORD *)(a2 + v6);
  *(_QWORD *)(a1 + 16) = v9;
  if (v7 == 4)
  {
    v10 = v3 + 12;
    if (v10 > a3)
      return 0xFFFFFFFFLL;
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + v9);
  }
  else
  {
    v10 = v3 + 24;
    if (v10 > a3)
      return 0xFFFFFFFFLL;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + v9);
  }
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v10 + 2;
  if (v10 + 2 <= a3)
  {
    *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + v10);
    *(_QWORD *)(a1 + 16) = v11;
    if (v7 == 4)
    {
      v12 = v10 + 6;
      if (v12 <= a3)
      {
        *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + v11);
LABEL_23:
        v13 = 0;
        *(_QWORD *)(a1 + 16) = v12;
        return v13;
      }
    }
    else
    {
      v12 = v10 + 18;
      if (v12 <= a3)
      {
        *(_OWORD *)(a1 + 52) = *(_OWORD *)(a2 + v11);
        goto LABEL_23;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t fetch_arb_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 1;
  if (v3 + 1 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + v3);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 2;
  if (v3 + 2 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  v6 = *(char *)(a2 + v4);
  *(_BYTE *)(a1 + 25) = v6;
  *(_QWORD *)(a1 + 16) = v5;
  v7 = v3 + 3;
  if (v7 > a3)
    return 0xFFFFFFFFLL;
  v8 = *(unsigned __int8 *)(a2 + v5);
  *(_BYTE *)(a1 + 26) = v8;
  *(_QWORD *)(a1 + 16) = v7;
  if (v6 > 3)
    return 0xFFFFFFFFLL;
  v9 = v7 + qword_1C1278338[v6] * v8;
  if (v9 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 32) = a2 + v7;
  *(_QWORD *)(a1 + 16) = v9;
  return 0;
}

uint64_t fetch_cert_hash_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 <= (unint64_t)a3)
  {
    v7 = bswap32(*(_DWORD *)(a2 + v3));
    *(_DWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 16) = v4;
    if (!(_DWORD)v7)
      return 0;
    v8 = 0;
    while (1)
    {
      if (v8 <= 0x1F)
        *(_QWORD *)(a1 + 32 + 8 * v8) = a2 + v4;
      if (!a2)
        break;
      while (1)
      {
        v9 = *(unsigned __int8 *)(a2 + v4++);
        *(_QWORD *)(a1 + 16) = v4;
        if (!v9)
          break;
        if (v4 >= a3)
          return 0xFFFFFFFFLL;
      }
      if (++v8 == v7)
      {
        if (v7 < 0x21)
          return 0;
        v5 = 0;
        *(_DWORD *)(a1 + 24) = 32;
        return v5;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t fetch_identity_tok(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  unint64_t v16;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 + 4;
  if (v3 + 4 > (unint64_t)a3)
    return 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + v3));
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3 + 6;
  if (v5 > a3)
    return 0xFFFFFFFFLL;
  v6 = __rev16(*(unsigned __int16 *)(a2 + v4));
  *(_WORD *)(a1 + 28) = v6;
  *(_QWORD *)(a1 + 16) = v5;
  v7 = v5 + v6;
  if (v7 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 32) = a2 + v5;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v7 + 1;
  if (v7 + 1 > a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + v7);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v7 + 3;
  if (v9 > a3)
    return 0xFFFFFFFFLL;
  v10 = __rev16(*(unsigned __int16 *)(a2 + v8));
  *(_WORD *)(a1 + 42) = v10;
  *(_QWORD *)(a1 + 16) = v9;
  v11 = v9 + v10;
  if (v11 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 48) = a2 + v9;
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11 + 1;
  if (v11 + 1 > a3)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + v11);
  *(_QWORD *)(a1 + 16) = v12;
  v13 = v11 + 3;
  if (v11 + 3 > a3)
    return 0xFFFFFFFFLL;
  v15 = __rev16(*(unsigned __int16 *)(a2 + v12));
  *(_WORD *)(a1 + 58) = v15;
  *(_QWORD *)(a1 + 16) = v13;
  v16 = v13 + v15;
  if (v16 > a3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 64) = a2 + v13;
  *(_QWORD *)(a1 + 16) = v16;
  return 0;
}

void au_print_flags_tok(FILE *outfp, tokenstr_t *tok, char *del, int oflags)
{
  char v4;
  int id;
  const char *v9;
  unint64_t v10;
  u_int64_t *v11;
  size_t v12;
  size_t v13;
  uint64_t val;
  unint64_t v15;
  const char *v16;
  char *v17;
  char *v18;
  int v19;
  in_addr v20;
  char *v21;
  int v22;
  int v23;
  __int128 *p_uid;
  char *v25;
  int v26;
  const char *v27;
  const char *v28;
  FILE *v29;
  in_addr v30;
  int v31;
  __int128 *v32;
  const char *v33;
  size_t v34;
  unint64_t v35;
  u_int64_t *v36;
  size_t v37;
  size_t v38;
  unint64_t no;
  const char *v40;
  const char *v41;
  size_t v42;
  char *v43;
  int v44;
  u_int64_t mode;
  char *v46;
  unint64_t cdhash_len;
  in_addr v48;
  char *v49;
  in_addr v50;
  char *v51;
  char *v52;
  unint64_t v53;
  char *v54;
  unint64_t v55;
  u_int64_t *p_val;
  size_t v57;
  size_t v58;
  unint64_t v59;
  u_int64_t *v60;
  size_t v61;
  size_t v62;
  uint64_t text;
  unint64_t len;
  char *path;
  unint64_t v66;
  const char *v67;
  char *v68;
  const char *v69;
  char *dev;
  in_addr v71;
  char *v72;
  const char *v73;
  FILE *v74;
  const char *v75;
  size_t v76;
  FILE *v77;
  const char *v78;
  in_addr v79;
  char *v80;
  in_addr v81;
  char *v82;
  in_addr v83;
  char *v84;
  in_addr v85;
  char *v86;
  char *v87;
  const char *v88;
  size_t v89;
  unint64_t v90;
  const char *v91;
  size_t v92;
  const char *v93;
  size_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  u_int64_t v102;
  char *v103;
  __int128 v104;
  char v105[46];
  uint64_t v106;

  v4 = oflags;
  v106 = *MEMORY[0x1E0C80C00];
  id = tok->id;
  if (id <= 95)
  {
    switch(id)
    {
      case 17:
        print_tok_type(outfp, 17, "file", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          print_sec32(outfp, tok->tt.attr32.mode, v4);
          fputs(del, outfp);
          if ((v4 & 1) != 0)
            v9 = "%u";
          else
            v9 = " + %u msec";
          fprintf(outfp, v9, tok->tt.arg32.val);
          goto LABEL_119;
        }
        fprintf(outfp, "%s=\"", "time");
        print_sec32(outfp, tok->tt.attr32.mode, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "msec");
        if ((v4 & 1) != 0)
          fprintf(outfp, "%u");
        else
          fprintf(outfp, " + %u msec");
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fputc(62, outfp);
        text = (uint64_t)tok->tt.arg32.text;
        len = tok->tt.arg32.len;
LABEL_177:
        print_string((uint64_t)outfp, text, len, v4);
        goto LABEL_228;
      case 18:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 37:
      case 48:
      case 49:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
        goto LABEL_75;
      case 19:
        print_tok_type(outfp, 19, "trailer", oflags);
        if ((v4 & 4) != 0)
          return;
        goto LABEL_104;
      case 20:
        print_tok_type(outfp, 20, "header", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.attr32.mode);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.hdr32.version);
          fputs(del, outfp);
          print_event(outfp, tok->tt.hdr32.e_type, v4);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.arg32.len);
          fputs(del, outfp);
          print_sec32(outfp, tok->tt.attr32.fsid, v4);
          fputs(del, outfp);
          if ((v4 & 1) != 0)
            v16 = "%u";
          else
            v16 = " + %u msec";
          v17 = (char *)tok->tt.grps.list[3];
          goto LABEL_89;
        }
        fprintf(outfp, "%s=\"", "version");
        fprintf(outfp, "%u", tok->tt.hdr32.version);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "event");
        print_event(outfp, tok->tt.hdr32.e_type, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "modifier");
        fprintf(outfp, "%u", tok->tt.arg32.len);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "time");
        print_sec32(outfp, tok->tt.attr32.fsid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "msec");
        if ((v4 & 1) != 0)
          v67 = "%u";
        else
          v67 = " + %u msec";
        v68 = (char *)tok->tt.grps.list[3];
        goto LABEL_186;
      case 21:
        print_tok_type(outfp, 21, "header_ex", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.attr32.mode);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.hdr32.version);
          fputs(del, outfp);
          print_event(outfp, tok->tt.hdr32.e_type, v4);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.arg32.len);
          fputs(del, outfp);
          print_ip_ex_address(outfp, tok->tt.attr32.fsid, (__int128 *)&tok->tt.inaddr_ex.addr[3]);
          fputs(del, outfp);
          print_sec32(outfp, tok->tt.grps.list[7], v4);
          fputs(del, outfp);
          if ((v4 & 1) != 0)
            v16 = "%u";
          else
            v16 = " + %u msec";
          v17 = (char *)tok->tt.grps.list[8];
          goto LABEL_89;
        }
        fprintf(outfp, "%s=\"", "version");
        fprintf(outfp, "%u", tok->tt.hdr32.version);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "event");
        print_event(outfp, tok->tt.hdr32.e_type, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "modifier");
        fprintf(outfp, "%u", tok->tt.arg32.len);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "host");
        print_ip_ex_address(outfp, tok->tt.attr32.fsid, (__int128 *)&tok->tt.inaddr_ex.addr[3]);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "time");
        print_sec32(outfp, tok->tt.grps.list[7], v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "msec");
        if ((v4 & 1) != 0)
          v67 = "%u";
        else
          v67 = " + %u msec";
        v68 = (char *)tok->tt.grps.list[8];
        goto LABEL_186;
      case 33:
        print_tok_type(outfp, 33, "arbitrary", oflags);
        if ((v4 & 4) == 0)
          fputs(del, outfp);
        no = (char)tok->tt.arg32.no;
        if (no <= 4)
        {
          v40 = off_1E7A7C738[no];
          v41 = off_1E7A7C760[no];
          if ((v4 & 4) != 0)
          {
            fprintf(outfp, "%s=\"", "print");
            v89 = strlen(v40);
            print_string((uint64_t)outfp, (uint64_t)v40, v89, v4);
            fwrite("\" ", 2uLL, 1uLL, outfp);
          }
          else
          {
            v42 = strlen(off_1E7A7C738[no]);
            print_string((uint64_t)outfp, (uint64_t)v40, v42, v4);
            fputs(del, outfp);
          }
          switch(tok->tt.arb.bu)
          {
            case 0u:
              if ((v4 & 4) != 0)
              {
                fprintf(outfp, "%s=\"", "type");
                fprintf(outfp, "%zu", 1uLL);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fprintf(outfp, "%s=\"", "count");
                fprintf(outfp, "%u", tok->tt.arb.uc);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fputc(62, outfp);
                if (tok->tt.arb.uc)
                {
                  v98 = 0;
                  do
                    fprintf(outfp, v41, *(unsigned __int8 *)(tok->tt.arg64.val + v98++));
                  while (v98 < tok->tt.arb.uc);
                }
                goto LABEL_228;
              }
              print_string((uint64_t)outfp, (uint64_t)"byte", 4uLL, v4);
              fputs(del, outfp);
              fprintf(outfp, "%u", tok->tt.arb.uc);
              fputs(del, outfp);
              if (tok->tt.arb.uc)
              {
                v90 = 0;
                do
                  fprintf(outfp, v41, *(unsigned __int8 *)(tok->tt.arg64.val + v90++));
                while (v90 < tok->tt.arb.uc);
              }
              break;
            case 1u:
              if ((v4 & 4) != 0)
              {
                fprintf(outfp, "%s=\"", "type");
                fprintf(outfp, "%zu", 2uLL);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fprintf(outfp, "%s=\"", "count");
                fprintf(outfp, "%u", tok->tt.arb.uc);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fputc(62, outfp);
                if (tok->tt.arb.uc)
                {
                  v99 = 0;
                  do
                    fprintf(outfp, v41, *(unsigned __int16 *)(tok->tt.arg64.val + 2 * v99++));
                  while (v99 < tok->tt.arb.uc);
                }
                goto LABEL_228;
              }
              print_string((uint64_t)outfp, (uint64_t)"short", 5uLL, v4);
              fputs(del, outfp);
              fprintf(outfp, "%u", tok->tt.arb.uc);
              fputs(del, outfp);
              if (tok->tt.arb.uc)
              {
                v95 = 0;
                do
                  fprintf(outfp, v41, *(unsigned __int16 *)(tok->tt.arg64.val + 2 * v95++));
                while (v95 < tok->tt.arb.uc);
              }
              break;
            case 2u:
              if ((v4 & 4) != 0)
              {
                fprintf(outfp, "%s=\"", "type");
                fprintf(outfp, "%zu", 4uLL);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fprintf(outfp, "%s=\"", "count");
                fprintf(outfp, "%u", tok->tt.arb.uc);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fputc(62, outfp);
                if (tok->tt.arb.uc)
                {
                  v100 = 0;
                  do
                    fprintf(outfp, v41, *(unsigned int *)(tok->tt.arg64.val + 4 * v100++));
                  while (v100 < tok->tt.arb.uc);
                }
                goto LABEL_228;
              }
              print_string((uint64_t)outfp, (uint64_t)"int", 3uLL, v4);
              fputs(del, outfp);
              fprintf(outfp, "%u", tok->tt.arb.uc);
              fputs(del, outfp);
              if (tok->tt.arb.uc)
              {
                v96 = 0;
                do
                  fprintf(outfp, v41, *(unsigned int *)(tok->tt.arg64.val + 4 * v96++));
                while (v96 < tok->tt.arb.uc);
              }
              break;
            case 3u:
              if ((v4 & 4) != 0)
              {
                fprintf(outfp, "%s=\"", "type");
                fprintf(outfp, "%zu", 8uLL);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fprintf(outfp, "%s=\"", "count");
                fprintf(outfp, "%u", tok->tt.arb.uc);
                fwrite("\" ", 2uLL, 1uLL, outfp);
                fputc(62, outfp);
                if (tok->tt.arb.uc)
                {
                  v101 = 0;
                  do
                    fprintf(outfp, v41, *(_QWORD *)(tok->tt.arg64.val + 8 * v101++));
                  while (v101 < tok->tt.arb.uc);
                }
                goto LABEL_228;
              }
              print_string((uint64_t)outfp, (uint64_t)"int64", 5uLL, v4);
              fputs(del, outfp);
              fprintf(outfp, "%u", tok->tt.arb.uc);
              fputs(del, outfp);
              if (tok->tt.arb.uc)
              {
                v97 = 0;
                do
                  fprintf(outfp, v41, *(_QWORD *)(tok->tt.arg64.val + 8 * v97++));
                while (v97 < tok->tt.arb.uc);
              }
              break;
            default:
              return;
          }
        }
        return;
      case 34:
        print_tok_type(outfp, 34, "IPC", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          print_ipctype(outfp, tok->tt.arg32.no, v4);
          goto LABEL_104;
        }
        fprintf(outfp, "%s=\"", "ipc-type");
        print_ipctype(outfp, tok->tt.arg32.no, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        v78 = "ipc-id";
        goto LABEL_192;
      case 35:
        v43 = "path";
        v44 = 35;
        goto LABEL_106;
      case 36:
        print_tok_type(outfp, 36, "subject", oflags);
        if ((v4 & 4) == 0)
          goto LABEL_101;
        fprintf(outfp, "%s=\"", "audit-uid");
        print_user(outfp, tok->tt.attr32.mode, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "uid");
        print_user(outfp, tok->tt.arg32.val, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "gid");
        print_group(outfp, tok->tt.attr32.gid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "ruid");
        print_user(outfp, tok->tt.attr32.fsid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "rgid");
        print_group(outfp, tok->tt.grps.list[3], v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "pid");
        fprintf(outfp, "%u", tok->tt.grps.list[4]);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "sid");
        fprintf(outfp, "%u", tok->tt.attr32.dev);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "tid");
        fprintf(outfp, "%u ");
        goto LABEL_190;
      case 38:
        print_tok_type(outfp, 38, "process", oflags);
        if ((v4 & 4) == 0)
        {
LABEL_101:
          fputs(del, outfp);
          print_user(outfp, tok->tt.attr32.mode, v4);
          fputs(del, outfp);
          print_user(outfp, tok->tt.arg32.val, v4);
          fputs(del, outfp);
          print_group(outfp, tok->tt.attr32.gid, v4);
          fputs(del, outfp);
          print_user(outfp, tok->tt.attr32.fsid, v4);
          fputs(del, outfp);
          print_group(outfp, tok->tt.grps.list[3], v4);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.grps.list[4]);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.attr32.dev);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.grps.list[6]);
          fputs(del, outfp);
          v20.s_addr = tok->tt.grps.list[7];
          goto LABEL_124;
        }
        fprintf(outfp, "%s=\"", "audit-uid");
        print_user(outfp, tok->tt.attr32.mode, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "uid");
        print_user(outfp, tok->tt.arg32.val, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "gid");
        print_group(outfp, tok->tt.attr32.gid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "ruid");
        print_user(outfp, tok->tt.attr32.fsid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "rgid");
        print_group(outfp, tok->tt.grps.list[3], v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "pid");
        fprintf(outfp, "%u", tok->tt.grps.list[4]);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "sid");
        fprintf(outfp, "%u", tok->tt.attr32.dev);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "tid");
        fprintf(outfp, "%u");
LABEL_190:
        v30.s_addr = tok->tt.grps.list[7];
        goto LABEL_201;
      case 39:
        print_tok_type(outfp, 39, "return", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          print_retval(outfp, tok->tt.arg32.no, v4);
          goto LABEL_104;
        }
        fprintf(outfp, "%s=\"", "errval");
        print_retval(outfp, tok->tt.arg32.no, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        v78 = "retval";
LABEL_192:
        fprintf(outfp, "%s=\"", v78);
        fprintf(outfp, "%u");
        goto LABEL_227;
      case 40:
        v43 = "text";
        v44 = 40;
LABEL_106:
        print_tok_type(outfp, v44, v43, oflags);
        if ((v4 & 4) == 0)
          goto LABEL_107;
        text = tok->tt.arg64.val;
        len = tok->tt.grps.no;
        goto LABEL_177;
      case 41:
        print_tok_type(outfp, 41, "opaque", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.grps.no);
          goto LABEL_110;
        }
        print_mem(outfp, tok->tt.arg64.val, tok->tt.grps.no);
        goto LABEL_228;
      case 42:
        print_tok_type(outfp, 42, "ip addr", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          v20.s_addr = tok->tt.attr32.mode;
          goto LABEL_124;
        }
        v79.s_addr = tok->tt.attr32.mode;
        v80 = inet_ntoa(v79);
        fputs(v80, outfp);
        goto LABEL_228;
      case 43:
        print_tok_type(outfp, 43, "ip", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          print_mem(outfp, (uint64_t)&tok->tt, 1uLL);
          fputs(del, outfp);
          print_mem(outfp, (uint64_t)(&tok->tt.arg32.no + 1), 1uLL);
          fputs(del, outfp);
          fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
          fputs(del, outfp);
          fprintf(outfp, "%u", bswap32(tok->tt.ip.id) >> 16);
          fputs(del, outfp);
          fprintf(outfp, "%u", bswap32(tok->tt.hdr32.e_type) >> 16);
          fputs(del, outfp);
          print_mem(outfp, (uint64_t)&tok->tt.arg64.val, 1uLL);
          fputs(del, outfp);
          print_mem(outfp, (uint64_t)tok->tt.execarg.text + 1, 1uLL);
          fputs(del, outfp);
          fprintf(outfp, "%u", bswap32(tok->tt.ip.chksm) >> 16);
          fputs(del, outfp);
          v48.s_addr = tok->tt.attr32.fsid;
          v49 = inet_ntoa(v48);
          fputs(v49, outfp);
          fputs(del, outfp);
          v20.s_addr = tok->tt.grps.list[3];
          goto LABEL_124;
        }
        fprintf(outfp, "%s=\"", "version");
        print_mem(outfp, (uint64_t)&tok->tt, 1uLL);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "service_type");
        print_mem(outfp, (uint64_t)(&tok->tt.arg32.no + 1), 1uLL);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "len");
        fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "id");
        fprintf(outfp, "%u", bswap32(tok->tt.ip.id) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "offset");
        fprintf(outfp, "%u", bswap32(tok->tt.hdr32.e_type) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "time_to_live");
        print_mem(outfp, (uint64_t)&tok->tt.arg64.val, 1uLL);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "protocol");
        print_mem(outfp, (uint64_t)tok->tt.execarg.text + 1, 1uLL);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "cksum");
        fprintf(outfp, "%u", bswap32(tok->tt.ip.chksm) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "src_addr");
        v81.s_addr = tok->tt.attr32.fsid;
        v82 = inet_ntoa(v81);
        fputs(v82, outfp);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "dest_addr");
        v83.s_addr = tok->tt.grps.list[3];
        v84 = inet_ntoa(v83);
        fputs(v84, outfp);
        goto LABEL_227;
      case 44:
        print_tok_type(outfp, 44, "ip port", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          v102 = bswap32(tok->tt.grps.no) >> 16;
          v16 = "%#x";
          break;
        }
        fprintf(outfp, "%#x", bswap32(tok->tt.grps.no) >> 16);
        goto LABEL_228;
      case 45:
        print_tok_type(outfp, 45, "argument", oflags);
        if ((v4 & 4) != 0)
        {
          fprintf(outfp, "%s=\"", "arg-num");
          fprintf(outfp, "%u", tok->tt.arg32.no);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "value");
          fprintf(outfp, "0x%x", tok->tt.arg32.val);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "desc");
          path = tok->tt.arg32.text;
          v66 = tok->tt.arg32.len;
          goto LABEL_198;
        }
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.arg32.no);
        fputs(del, outfp);
        fprintf(outfp, "0x%x");
LABEL_119:
        fputs(del, outfp);
        val = (uint64_t)tok->tt.arg32.text;
        v15 = tok->tt.arg32.len;
        goto LABEL_120;
      case 46:
        print_tok_type(outfp, 46, "socket", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.grps.no);
          fputs(del, outfp);
          fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
          fputs(del, outfp);
          v50.s_addr = tok->tt.arg32.val;
          v51 = inet_ntoa(v50);
          fputs(v51, outfp);
          fputs(del, outfp);
          fprintf(outfp, "%u", bswap32(tok->tt.arg32.len) >> 16);
          fputs(del, outfp);
          v20.s_addr = tok->tt.attr32.fsid;
          goto LABEL_124;
        }
        fprintf(outfp, "%s=\"", "sock_type");
        fprintf(outfp, "%u", tok->tt.grps.no);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "lport");
        fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "laddr");
        v85.s_addr = tok->tt.arg32.val;
        v86 = inet_ntoa(v85);
        fputs(v86, outfp);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "fport");
        fprintf(outfp, "%u", bswap32(tok->tt.arg32.len) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "faddr");
        v30.s_addr = tok->tt.attr32.fsid;
        goto LABEL_201;
      case 47:
        print_tok_type(outfp, 47, "sequence", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          mode = tok->tt.attr32.mode;
          goto LABEL_127;
        }
        fprintf(outfp, "%s=\"", "seq-num");
        fprintf(outfp, "%u", tok->tt.attr32.mode);
        goto LABEL_227;
      case 50:
        print_tok_type(outfp, 50, "IPC perm", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          print_user(outfp, tok->tt.attr32.mode, v4);
          fputs(del, outfp);
          print_group(outfp, tok->tt.arg32.val, v4);
          fputs(del, outfp);
          print_user(outfp, tok->tt.attr32.gid, v4);
          fputs(del, outfp);
          print_group(outfp, tok->tt.attr32.fsid, v4);
          fputs(del, outfp);
          fprintf(outfp, "%o", tok->tt.grps.list[3]);
          fputs(del, outfp);
          fprintf(outfp, "%u");
          goto LABEL_155;
        }
        fprintf(outfp, "%s=\"", "uid");
        print_user(outfp, tok->tt.attr32.mode, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "gid");
        print_group(outfp, tok->tt.arg32.val, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "creator-uid");
        print_user(outfp, tok->tt.attr32.gid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "creator-gid");
        print_group(outfp, tok->tt.attr32.fsid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "mode");
        fprintf(outfp, "%o", tok->tt.grps.list[3]);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "seq");
        v69 = "%u";
        fprintf(outfp, "%u", tok->tt.grps.list[4]);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        v88 = "key";
        goto LABEL_205;
      case 59:
        print_tok_type(outfp, 59, "group", oflags);
        if (tok->tt.grps.no)
        {
          v53 = 0;
          do
          {
            v54 = (char *)tok + 4 * v53;
            if ((v4 & 4) != 0)
            {
              fwrite("<gid>", 5uLL, 1uLL, outfp);
              print_group(outfp, *((_DWORD *)v54 + 7), v4);
              fwrite("</gid>", 6uLL, 1uLL, outfp);
              close_tag((uint64_t)outfp, tok->id);
            }
            else
            {
              fputs(del, outfp);
              print_group(outfp, *((_DWORD *)v54 + 7), v4);
            }
            ++v53;
          }
          while (v53 < tok->tt.grps.no);
        }
        return;
      case 60:
        print_tok_type(outfp, 60, "exec arg", oflags);
        if (tok->tt.attr32.mode)
        {
          v55 = 0;
          p_val = &tok->tt.arg64.val;
          do
          {
            if ((v4 & 4) != 0)
            {
              fwrite("<arg>", 5uLL, 1uLL, outfp);
              v58 = strlen((const char *)p_val[v55]);
              print_string((uint64_t)outfp, p_val[v55], v58, v4);
              fwrite("</arg>", 6uLL, 1uLL, outfp);
            }
            else
            {
              fputs(del, outfp);
              v57 = strlen((const char *)p_val[v55]);
              print_string((uint64_t)outfp, p_val[v55], v57, v4);
            }
            ++v55;
          }
          while (v55 < tok->tt.attr32.mode);
        }
        goto LABEL_151;
      case 61:
        print_tok_type(outfp, 61, "exec env", oflags);
        if (tok->tt.attr32.mode)
        {
          v59 = 0;
          v60 = &tok->tt.arg64.val;
          do
          {
            if ((v4 & 4) != 0)
            {
              fwrite("<env>", 5uLL, 1uLL, outfp);
              v62 = strlen((const char *)v60[v59]);
              print_string((uint64_t)outfp, v60[v59], v62, v4);
              fwrite("</env>", 6uLL, 1uLL, outfp);
            }
            else
            {
              fputs(del, outfp);
              v61 = strlen((const char *)v60[v59]);
              print_string((uint64_t)outfp, v60[v59], v61, v4);
            }
            ++v59;
          }
          while (v59 < tok->tt.attr32.mode);
        }
        goto LABEL_151;
      case 62:
        print_tok_type(outfp, 62, "attribute", oflags);
        if ((v4 & 4) == 0)
        {
          fputs(del, outfp);
          fprintf(outfp, "%o", tok->tt.attr32.mode);
          fputs(del, outfp);
          print_user(outfp, tok->tt.arg32.val, v4);
          fputs(del, outfp);
          print_group(outfp, tok->tt.attr32.gid, v4);
          fputs(del, outfp);
          fprintf(outfp, "%u", tok->tt.attr32.fsid);
          fputs(del, outfp);
          fprintf(outfp, "%lld");
LABEL_155:
          fputs(del, outfp);
          fprintf(outfp, "%u");
          return;
        }
        fprintf(outfp, "%s=\"", "mode");
        fprintf(outfp, "%o", tok->tt.attr32.mode);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "uid");
        print_user(outfp, tok->tt.arg32.val, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "gid");
        print_group(outfp, tok->tt.attr32.gid, v4);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "fsid");
        v69 = "%u";
        fprintf(outfp, "%u", tok->tt.attr32.fsid);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "nodeid");
        fprintf(outfp, "%lld", tok->tt.attr32.nid);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        v88 = "device";
LABEL_205:
        fprintf(outfp, "%s=\"", v88);
        dev = (char *)tok->tt.attr32.dev;
        goto LABEL_206;
      default:
        if (id != 82)
          goto LABEL_75;
        print_tok_type(outfp, 82, "exit", oflags);
        if ((v4 & 4) != 0)
        {
          fprintf(outfp, "%s=\"", "errval");
          fprintf(outfp, "Error %u", tok->tt.attr32.mode);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "retval");
          fprintf(outfp, "%u", tok->tt.arg32.val);
          goto LABEL_227;
        }
        fputs(del, outfp);
        fprintf(outfp, "Error %u", tok->tt.attr32.mode);
LABEL_104:
        fputs(del, outfp);
        mode = tok->tt.arg32.val;
LABEL_127:
        v102 = mode;
        v16 = "%u";
        break;
    }
LABEL_128:
    fprintf(outfp, v16, v102);
    return;
  }
  if (id > 236)
  {
    switch(id)
    {
      case 237:
        print_tok_type(outfp, 237, "identity", oflags);
        if ((v4 & 4) != 0)
        {
          fprintf(outfp, "%s=\"", "signer-type");
          fprintf(outfp, "%u", tok->tt.attr32.mode);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "signing-id");
          print_string((uint64_t)outfp, tok->tt.arg64.val, tok->tt.ip.id, v4);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "signing-id-truncated");
          if (tok->tt.sockunix.path[14])
          {
            v75 = "yes";
            v76 = 3;
          }
          else
          {
            v75 = "no";
            v76 = 2;
          }
          fwrite(v75, v76, 1uLL, outfp);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "team-id");
          print_string((uint64_t)outfp, (uint64_t)tok->tt.arg64.text, tok->tt.identity.team_id_len, v4);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "team-id-truncated");
          if (tok->tt.sockunix.path[30])
          {
            v93 = "yes";
            v94 = 3;
          }
          else
          {
            v93 = "no";
            v94 = 2;
          }
          fwrite(v93, v94, 1uLL, outfp);
          fwrite("\" ", 2uLL, 1uLL, outfp);
          fprintf(outfp, "%s=\"", "cdhash");
          print_mem(outfp, (uint64_t)tok->tt.execarg.text[4], tok->tt.identity.cdhash_len);
LABEL_227:
          fwrite("\" ", 2uLL, 1uLL, outfp);
          goto LABEL_228;
        }
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.attr32.mode);
        fputs(del, outfp);
        print_string((uint64_t)outfp, tok->tt.arg64.val, tok->tt.ip.id, v4);
        fputs(del, outfp);
        if (tok->tt.sockunix.path[14])
        {
          v33 = "truncated";
          v34 = 9;
        }
        else
        {
          v33 = "complete";
          v34 = 8;
        }
        fwrite(v33, v34, 1uLL, outfp);
        fputs(del, outfp);
        print_string((uint64_t)outfp, (uint64_t)tok->tt.arg64.text, tok->tt.identity.team_id_len, v4);
        fputs(del, outfp);
        if (tok->tt.sockunix.path[30])
        {
          v91 = "truncated";
          v92 = 9;
        }
        else
        {
          v91 = "complete";
          v92 = 8;
        }
        fwrite(v91, v92, 1uLL, outfp);
        fputs(del, outfp);
        v46 = tok->tt.execarg.text[4];
        cdhash_len = tok->tt.identity.cdhash_len;
        break;
      case 238:
        print_tok_type(outfp, 238, "principal", oflags);
        if (tok->tt.attr32.mode)
        {
          v35 = 0;
          v36 = &tok->tt.arg64.val;
          do
          {
            if ((v4 & 4) != 0)
            {
              fwrite("<principal>", 0xBuLL, 1uLL, outfp);
              v38 = strlen((const char *)v36[v35]);
              print_string((uint64_t)outfp, v36[v35], v38, v4);
              fwrite("</principal>", 0xCuLL, 1uLL, outfp);
            }
            else
            {
              fputs(del, outfp);
              v37 = strlen((const char *)v36[v35]);
              print_string((uint64_t)outfp, v36[v35], v37, v4);
            }
            ++v35;
          }
          while (v35 < tok->tt.attr32.mode);
        }
LABEL_151:
        if ((v4 & 4) == 0)
          return;
LABEL_228:
        close_tag((uint64_t)outfp, tok->id);
        return;
      case 239:
        print_tok_type(outfp, 239, "cert hash", oflags);
        if (tok->tt.attr32.mode)
        {
          v10 = 0;
          v11 = &tok->tt.arg64.val;
          do
          {
            if ((v4 & 4) != 0)
            {
              fwrite("<hash>", 6uLL, 1uLL, outfp);
              v13 = strlen((const char *)v11[v10]);
              print_string((uint64_t)outfp, v11[v10], v13, v4);
              fwrite("</hash>", 7uLL, 1uLL, outfp);
            }
            else
            {
              fputs(del, outfp);
              v12 = strlen((const char *)v11[v10]);
              print_string((uint64_t)outfp, v11[v10], v12, v4);
            }
            ++v10;
          }
          while (v10 < tok->tt.attr32.mode);
        }
        goto LABEL_151;
      default:
LABEL_75:
        if ((oflags & 4) != 0)
          return;
        print_tok_type(outfp, id, "unknown", oflags);
LABEL_110:
        fputs(del, outfp);
        v46 = tok->tt.execarg.text[0];
        cdhash_len = tok->tt.grps.no;
        break;
    }
    print_mem(outfp, (uint64_t)v46, cdhash_len);
    return;
  }
  switch(id)
  {
    case 96:
      print_tok_type(outfp, 96, "zone", oflags);
      if ((v4 & 4) != 0)
      {
        fprintf(outfp, "%s=\"", "name");
        print_string((uint64_t)outfp, tok->tt.arg64.val, tok->tt.grps.no, v4);
        goto LABEL_227;
      }
LABEL_107:
      fputs(del, outfp);
      val = tok->tt.arg64.val;
      v15 = tok->tt.grps.no;
      goto LABEL_120;
    case 113:
      print_tok_type(outfp, 113, "argument", oflags);
      if ((v4 & 4) != 0)
      {
        fprintf(outfp, "%s=\"", "arg-num");
        fprintf(outfp, "%u", tok->tt.arg32.no);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "value");
        fprintf(outfp, "0x%llx", tok->tt.arg64.val);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "desc");
        path = tok->tt.arg64.text;
        v66 = tok->tt.arg64.len;
LABEL_198:
        v74 = outfp;
        goto LABEL_199;
      }
      fputs(del, outfp);
      fprintf(outfp, "%u", tok->tt.arg32.no);
      fputs(del, outfp);
      fprintf(outfp, "0x%llx", tok->tt.arg64.val);
      fputs(del, outfp);
      val = (uint64_t)tok->tt.arg64.text;
      v15 = tok->tt.arg64.len;
LABEL_120:
      v29 = outfp;
      goto LABEL_121;
    case 114:
      print_tok_type(outfp, 114, "return", oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        print_retval(outfp, tok->tt.arg32.no, v4);
        fputs(del, outfp);
        v102 = tok->tt.arg64.val;
        v16 = "%lld";
        goto LABEL_128;
      }
      fprintf(outfp, "%s=\"", "errval");
      print_retval(outfp, tok->tt.arg32.no, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "retval");
      fprintf(outfp, "%lld");
      goto LABEL_227;
    case 115:
      print_tok_type(outfp, 115, "attribute", oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        fprintf(outfp, "%o", tok->tt.attr32.mode);
        fputs(del, outfp);
        print_user(outfp, tok->tt.arg32.val, v4);
        fputs(del, outfp);
        print_group(outfp, tok->tt.attr32.gid, v4);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.attr32.fsid);
        fputs(del, outfp);
        fprintf(outfp, "%lld", tok->tt.attr32.nid);
        fputs(del, outfp);
        v102 = tok->tt.attr64.dev;
        v16 = "%llu";
        goto LABEL_128;
      }
      fprintf(outfp, "%s=\"", "mode");
      fprintf(outfp, "%o", tok->tt.attr32.mode);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "uid");
      print_user(outfp, tok->tt.arg32.val, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "gid");
      print_group(outfp, tok->tt.attr32.gid, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "fsid");
      fprintf(outfp, "%u", tok->tt.attr32.fsid);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "nodeid");
      fprintf(outfp, "%lld", tok->tt.attr32.nid);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "device");
      v103 = tok->tt.arg64.text;
      v67 = "%llu";
      goto LABEL_187;
    case 116:
      print_tok_type(outfp, 116, "header", oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.attr32.mode);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.hdr32.version);
        fputs(del, outfp);
        print_event(outfp, tok->tt.hdr32.e_type, v4);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.arg32.len);
        fputs(del, outfp);
        print_sec64(outfp, (time_t)tok->tt.arg32.text, v4);
        fputs(del, outfp);
        v17 = tok->tt.arg64.text;
        goto LABEL_39;
      }
      fprintf(outfp, "%s=\"", "version");
      fprintf(outfp, "%u", tok->tt.hdr32.version);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "event");
      print_event(outfp, tok->tt.hdr32.e_type, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "modifier");
      fprintf(outfp, "%u", tok->tt.arg32.len);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "time");
      print_sec64(outfp, (time_t)tok->tt.arg32.text, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "msec");
      v68 = tok->tt.arg64.text;
      goto LABEL_162;
    case 117:
      v18 = "subject";
      v19 = 117;
      goto LABEL_35;
    case 119:
      v18 = "process";
      v19 = 119;
LABEL_35:
      print_tok_type(outfp, v19, v18, oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        print_user(outfp, tok->tt.attr32.mode, v4);
        fputs(del, outfp);
        print_user(outfp, tok->tt.arg32.val, v4);
        fputs(del, outfp);
        print_group(outfp, tok->tt.attr32.gid, v4);
        fputs(del, outfp);
        print_user(outfp, tok->tt.attr32.fsid, v4);
        fputs(del, outfp);
        print_group(outfp, tok->tt.grps.list[3], v4);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.grps.list[4]);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.attr32.dev);
        fputs(del, outfp);
        fprintf(outfp, "%llu", tok->tt.hdr64_ex.s);
        fputs(del, outfp);
        v20.s_addr = tok->tt.grps.list[9];
        goto LABEL_124;
      }
      fprintf(outfp, "%s=\"", "audit-uid");
      print_user(outfp, tok->tt.attr32.mode, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "uid");
      print_user(outfp, tok->tt.arg32.val, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "gid");
      print_group(outfp, tok->tt.attr32.gid, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "ruid");
      print_user(outfp, tok->tt.attr32.fsid, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "rgid");
      print_group(outfp, tok->tt.grps.list[3], v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "pid");
      fprintf(outfp, "%u", tok->tt.grps.list[4]);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "sid");
      fprintf(outfp, "%u", tok->tt.attr32.dev);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "tid");
      fprintf(outfp, "%llu", tok->tt.hdr64_ex.s);
      v30.s_addr = tok->tt.grps.list[9];
LABEL_201:
      v87 = inet_ntoa(v30);
      fputs(v87, outfp);
      goto LABEL_227;
    case 121:
      print_tok_type(outfp, 121, "header_ex", oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.attr32.mode);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.hdr32.version);
        fputs(del, outfp);
        print_event(outfp, tok->tt.hdr32.e_type, v4);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.arg32.len);
        fputs(del, outfp);
        print_ip_ex_address(outfp, tok->tt.attr32.fsid, (__int128 *)&tok->tt.inaddr_ex.addr[3]);
        fputs(del, outfp);
        print_sec64(outfp, (time_t)tok->tt.execarg.text[3], v4);
        fputs(del, outfp);
        v17 = tok->tt.execarg.text[4];
LABEL_39:
        if ((v4 & 1) != 0)
          v16 = "%u";
        else
          v16 = " + %u msec";
LABEL_89:
        v102 = (u_int64_t)v17;
        goto LABEL_128;
      }
      fprintf(outfp, "%s=\"", "version");
      fprintf(outfp, "%u", tok->tt.hdr32.version);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "event");
      print_event(outfp, tok->tt.hdr32.e_type, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "modifier");
      fprintf(outfp, "%u", tok->tt.arg32.len);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "host");
      print_ip_ex_address(outfp, tok->tt.attr32.fsid, (__int128 *)&tok->tt.inaddr_ex.addr[3]);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "time");
      print_sec64(outfp, (time_t)tok->tt.execarg.text[3], v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "msec");
      v68 = tok->tt.execarg.text[4];
LABEL_162:
      if ((v4 & 1) != 0)
        v67 = "%u";
      else
        v67 = " + %u msec";
LABEL_186:
      v103 = v68;
LABEL_187:
      v77 = outfp;
      goto LABEL_207;
    case 122:
      v21 = "subject_ex";
      v22 = 122;
      goto LABEL_44;
    case 123:
      v21 = "process_ex";
      v22 = 123;
LABEL_44:
      print_tok_type(outfp, v22, v21, oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        print_user(outfp, tok->tt.attr32.mode, v4);
        fputs(del, outfp);
        print_user(outfp, tok->tt.arg32.val, v4);
        fputs(del, outfp);
        print_group(outfp, tok->tt.attr32.gid, v4);
        fputs(del, outfp);
        print_user(outfp, tok->tt.attr32.fsid, v4);
        fputs(del, outfp);
        print_group(outfp, tok->tt.grps.list[3], v4);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.grps.list[4]);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.attr32.dev);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.grps.list[6]);
        fputs(del, outfp);
        v23 = tok->tt.grps.list[7];
        p_uid = (__int128 *)((char *)&tok->tt.subj64.tid.port + 4);
        goto LABEL_54;
      }
      fprintf(outfp, "%s=\"", "audit-uid");
      print_user(outfp, tok->tt.attr32.mode, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "uid");
      print_user(outfp, tok->tt.arg32.val, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "gid");
      print_group(outfp, tok->tt.attr32.gid, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "ruid");
      print_user(outfp, tok->tt.attr32.fsid, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "rgid");
      print_group(outfp, tok->tt.grps.list[3], v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "pid");
      fprintf(outfp, "%u", tok->tt.grps.list[4]);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "sid");
      fprintf(outfp, "%u", tok->tt.attr32.dev);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "tid");
      fprintf(outfp, "%u", tok->tt.grps.list[6]);
      v31 = tok->tt.grps.list[7];
      v32 = (__int128 *)((char *)&tok->tt.subj64.tid.port + 4);
      goto LABEL_64;
    case 124:
      v25 = "subject_ex";
      v26 = 124;
      goto LABEL_48;
    case 125:
      v25 = "process_ex";
      v26 = 125;
LABEL_48:
      print_tok_type(outfp, v26, v25, oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        print_user(outfp, tok->tt.attr32.mode, v4);
        fputs(del, outfp);
        print_user(outfp, tok->tt.arg32.val, v4);
        fputs(del, outfp);
        print_group(outfp, tok->tt.attr32.gid, v4);
        fputs(del, outfp);
        print_user(outfp, tok->tt.attr32.fsid, v4);
        fputs(del, outfp);
        print_group(outfp, tok->tt.grps.list[3], v4);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.grps.list[4]);
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.attr32.dev);
        fputs(del, outfp);
        fprintf(outfp, "%llu", tok->tt.hdr64_ex.s);
        fputs(del, outfp);
        v23 = tok->tt.grps.list[9];
        p_uid = (__int128 *)((char *)&tok->tt.krb5_principal.text[4] + 4);
        goto LABEL_54;
      }
      fprintf(outfp, "%s=\"", "audit-uid");
      print_user(outfp, tok->tt.attr32.mode, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "uid");
      print_user(outfp, tok->tt.arg32.val, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "gid");
      print_group(outfp, tok->tt.attr32.gid, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "ruid");
      print_user(outfp, tok->tt.attr32.fsid, v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "rgid");
      print_group(outfp, tok->tt.grps.list[3], v4);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "pid");
      fprintf(outfp, "%u", tok->tt.grps.list[4]);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "sid");
      fprintf(outfp, "%u", tok->tt.attr32.dev);
      fwrite("\" ", 2uLL, 1uLL, outfp);
      fprintf(outfp, "%s=\"", "tid");
      fprintf(outfp, "%llu", tok->tt.hdr64_ex.s);
      v31 = tok->tt.grps.list[9];
      v32 = (__int128 *)((char *)&tok->tt.krb5_principal.text[4] + 4);
LABEL_64:
      print_ip_ex_address(outfp, v31, v32);
      goto LABEL_227;
    case 126:
      print_tok_type(outfp, 126, "ip addr ex", oflags);
      if ((v4 & 4) == 0)
      {
        fputs(del, outfp);
        v23 = tok->tt.attr32.mode;
        p_uid = (__int128 *)&tok->tt.attr32.uid;
        goto LABEL_54;
      }
      print_ip_ex_address(outfp, tok->tt.attr32.mode, (__int128 *)&tok->tt.attr32.uid);
      goto LABEL_228;
    case 127:
      print_tok_type(outfp, 127, "socket", oflags);
      if ((v4 & 4) != 0)
      {
        fprintf(outfp, "%s=\"", "sock_dom");
        v69 = "%#x";
        fprintf(outfp, "%#x", tok->tt.grps.no);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "sock_type");
        fprintf(outfp, "%#x", tok->tt.ip.len);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "lport");
        fprintf(outfp, "%#x", bswap32(tok->tt.hdr32.e_type) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "laddr");
        print_ip_ex_address(outfp, tok->tt.ip.id, (__int128 *)(&tok->tt.exit + 1));
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "faddr");
        print_ip_ex_address(outfp, tok->tt.ip.id, (__int128 *)((char *)&tok->tt.ret64 + 28));
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "fport");
        dev = (char *)(bswap32(LOWORD(tok->tt.proc32_ex.sid)) >> 16);
LABEL_206:
        v103 = dev;
        v77 = outfp;
        v67 = v69;
LABEL_207:
        fprintf(v77, v67, v103);
        goto LABEL_227;
      }
      fputs(del, outfp);
      fprintf(outfp, "%#x", tok->tt.grps.no);
      fputs(del, outfp);
      fprintf(outfp, "%#x", tok->tt.ip.len);
      fputs(del, outfp);
      fprintf(outfp, "%#x", bswap32(tok->tt.hdr32.e_type) >> 16);
      fputs(del, outfp);
      print_ip_ex_address(outfp, tok->tt.ip.id, (__int128 *)(&tok->tt.exit + 1));
      fputs(del, outfp);
      fprintf(outfp, "%#x", bswap32(LOWORD(tok->tt.proc32_ex.sid)) >> 16);
      fputs(del, outfp);
      v23 = tok->tt.ip.id;
      p_uid = (__int128 *)((char *)&tok->tt.ret64 + 28);
LABEL_54:
      print_ip_ex_address(outfp, v23, p_uid);
      return;
    case 128:
      print_tok_type(outfp, 128, "socket-inet", oflags);
      if ((v4 & 4) != 0)
      {
        fprintf(outfp, "%s=\"", "type");
        fprintf(outfp, "%u", tok->tt.grps.no);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "port");
        fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "addr");
        v71.s_addr = tok->tt.arg32.val;
        v72 = inet_ntoa(v71);
        fputs(v72, outfp);
        goto LABEL_227;
      }
      fputs(del, outfp);
      fprintf(outfp, "%u", tok->tt.grps.no);
      fputs(del, outfp);
      fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
      fputs(del, outfp);
      v20.s_addr = tok->tt.arg32.val;
LABEL_124:
      v52 = inet_ntoa(v20);
      fputs(v52, outfp);
      return;
    case 129:
      print_tok_type(outfp, 129, "socket-inet6", oflags);
      if ((v4 & 4) != 0)
      {
        fprintf(outfp, "%s=\"", "type");
        fprintf(outfp, "%u", tok->tt.grps.no);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "port");
        fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "addr");
        v104 = *(_OWORD *)&tok->tt.attr32.uid;
        v73 = inet_ntop(30, &v104, v105, 0x2Eu);
        fputs(v73, outfp);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        close_tag((uint64_t)outfp, tok->id);
      }
      else
      {
        fputs(del, outfp);
        fprintf(outfp, "%u", tok->tt.grps.no);
        fputs(del, outfp);
        fprintf(outfp, "%u", bswap32(tok->tt.ip.len) >> 16);
        fputs(del, outfp);
        v104 = *(_OWORD *)&tok->tt.attr32.uid;
        v27 = inet_ntop(30, &v104, v105, 0x2Eu);
        fputs(v27, outfp);
      }
      return;
    case 130:
      print_tok_type(outfp, 130, "socket-unix", oflags);
      if ((v4 & 4) != 0)
      {
        fprintf(outfp, "%s=\"", "type");
        fprintf(outfp, "%u", tok->tt.grps.no);
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "port");
        fwrite("\" ", 2uLL, 1uLL, outfp);
        fprintf(outfp, "%s=\"", "addr");
        v66 = strlen(tok->tt.sockunix.path);
        v74 = outfp;
        path = tok->tt.sockunix.path;
LABEL_199:
        print_string((uint64_t)v74, (uint64_t)path, v66, v4);
        goto LABEL_227;
      }
      fputs(del, outfp);
      fprintf(outfp, "%u", tok->tt.grps.no);
      fputs(del, outfp);
      v28 = tok->tt.sockunix.path;
      v15 = strlen(v28);
      v29 = outfp;
      val = (uint64_t)v28;
LABEL_121:
      print_string((uint64_t)v29, val, v15, v4);
      break;
    default:
      goto LABEL_75;
  }
}

void au_print_tok(FILE *outfp, tokenstr_t *tok, char *del, char raw, char sfrm)
{
  int v5;

  if (sfrm)
    v5 = (raw != 0) | 2;
  else
    v5 = raw != 0;
  au_print_flags_tok(outfp, tok, del, v5);
}

void au_print_tok_xml(FILE *outfp, tokenstr_t *tok, char *del, char raw, char sfrm)
{
  int v5;
  int v6;

  if (raw)
    v5 = 5;
  else
    v5 = 4;
  if (sfrm)
    v6 = v5 | 2;
  else
    v6 = v5;
  au_print_flags_tok(outfp, tok, del, v6);
}

int au_read_rec(FILE *fp, u_char **buf)
{
  u_char v4;
  size_t v5;
  char *v6;
  unsigned int v7;
  size_t v8;
  void *v9;
  u_char *v10;
  u_char *v11;
  unsigned __int16 v13;
  int v14;
  int __ptr;
  unsigned int v16;

  v14 = 0;
  __ptr = 0;
  v13 = 0;
  v4 = fgetc(fp);
  if (v4 > 0x73u)
  {
    if (v4 != 121 && v4 != 116)
      goto LABEL_18;
  }
  else if (v4 - 20 >= 2)
  {
    if (v4 != 17
      || fread(&__ptr, 1uLL, 4uLL, fp) < 4
      || fread(&v14, 1uLL, 4uLL, fp) < 4
      || fread(&v13, 1uLL, 2uLL, fp) < 2)
    {
      goto LABEL_18;
    }
    v5 = (bswap32(v13) >> 16) + 11;
    v6 = (char *)malloc_type_malloc(v5, 0xC09A2EB8uLL);
    *buf = (u_char *)v6;
    if (v6)
    {
      *v6 = v4;
      *(_DWORD *)(v6 + 1) = __ptr;
      *(_DWORD *)(v6 + 5) = v14;
      v7 = v13;
      *(_WORD *)(v6 + 9) = v13;
      v8 = bswap32(v7) >> 16;
      if (fread(v6 + 11, 1uLL, v8, fp) < v8)
      {
        v9 = buf;
LABEL_17:
        free(v9);
LABEL_18:
        *__error() = 22;
        goto LABEL_19;
      }
      return v5;
    }
LABEL_19:
    LODWORD(v5) = -1;
    return v5;
  }
  v16 = 0;
  if (fread(&v16, 1uLL, 4uLL, fp) < 4)
    goto LABEL_18;
  v5 = bswap32(v16);
  if (v5 < 5)
    goto LABEL_18;
  v10 = (u_char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  *buf = v10;
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  bzero(v10, v5);
  *v11 = v4;
  v11[1] = BYTE3(v5);
  v11[2] = BYTE2(v5);
  v11[3] = BYTE1(v5);
  v11[4] = v5;
  if (fread(v11 + 5, 1uLL, (v5 - 5), fp) < (v5 - 5))
  {
    v9 = *buf;
    goto LABEL_17;
  }
  return v5;
}

unint64_t be64dec(unint64_t *a1)
{
  return bswap64(*a1);
}

FILE *print_tok_type(FILE *__stream, int a2, char *a3, char a4)
{
  FILE *v4;
  const char *v5;
  size_t v6;

  v4 = __stream;
  if ((a4 & 4) != 0)
  {
    if (a2 > 95)
    {
      if (a2 <= 236)
      {
        switch(a2)
        {
          case 96:
            v5 = "<zone ";
            goto LABEL_37;
          case 113:
LABEL_18:
            v5 = "<argument ";
            goto LABEL_49;
          case 114:
LABEL_19:
            v5 = "<return ";
            goto LABEL_39;
          case 115:
LABEL_20:
            v5 = "<attribute ";
            goto LABEL_47;
          case 116:
          case 121:
LABEL_13:
            v5 = "<record ";
            goto LABEL_39;
          case 117:
          case 122:
          case 124:
LABEL_10:
            v5 = "<subject ";
            goto LABEL_12;
          case 119:
          case 123:
          case 125:
LABEL_11:
            v5 = "<process ";
LABEL_12:
            v6 = 9;
            return (FILE *)fwrite(v5, v6, 1uLL, v4);
          case 126:
LABEL_21:
            v5 = "<ip_address>";
            v6 = 12;
            return (FILE *)fwrite(v5, v6, 1uLL, v4);
          case 127:
LABEL_22:
            v5 = "<socket ";
LABEL_39:
            v6 = 8;
            return (FILE *)fwrite(v5, v6, 1uLL, v4);
          case 128:
            v5 = "<socket-inet ";
            goto LABEL_29;
          case 129:
            v5 = "<socket-inet6 ";
            v6 = 14;
            return (FILE *)fwrite(v5, v6, 1uLL, v4);
          case 130:
            v5 = "<socket-unix ";
LABEL_29:
            v6 = 13;
            return (FILE *)fwrite(v5, v6, 1uLL, v4);
          default:
            return __stream;
        }
      }
      switch(a2)
      {
        case 237:
          v5 = "<identity ";
LABEL_49:
          v6 = 10;
          break;
        case 238:
          v5 = "<krb5_principal>";
          v6 = 16;
          break;
        case 239:
          v5 = "<cert_hash>";
LABEL_47:
          v6 = 11;
          break;
        default:
          return __stream;
      }
    }
    else
    {
      switch(a2)
      {
        case 17:
          v5 = "<file ";
          break;
        case 18:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 37:
        case 48:
        case 49:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
          return __stream;
        case 19:
          v5 = "</record>";
          goto LABEL_12;
        case 20:
        case 21:
          goto LABEL_13;
        case 33:
          v5 = "<arbitrary ";
          goto LABEL_47;
        case 34:
          v5 = "<IPC";
          goto LABEL_41;
        case 35:
          v5 = "<path>";
          break;
        case 36:
          goto LABEL_10;
        case 38:
          goto LABEL_11;
        case 39:
          goto LABEL_19;
        case 40:
          v5 = "<text>";
          break;
        case 41:
          v5 = "<opaque>";
          goto LABEL_39;
        case 42:
          goto LABEL_21;
        case 43:
          v5 = "<ip ";
LABEL_41:
          v6 = 4;
          return (FILE *)fwrite(v5, v6, 1uLL, v4);
        case 44:
          v5 = "<ip_port>";
          goto LABEL_12;
        case 45:
          goto LABEL_18;
        case 46:
          goto LABEL_22;
        case 47:
          v5 = "<sequence ";
          goto LABEL_49;
        case 50:
          v5 = "<IPC_perm ";
          goto LABEL_49;
        case 59:
          v5 = "<group>";
          v6 = 7;
          return (FILE *)fwrite(v5, v6, 1uLL, v4);
        case 60:
          v5 = "<exec_args>";
          goto LABEL_47;
        case 61:
          v5 = "<exec_env>";
          goto LABEL_49;
        case 62:
          goto LABEL_20;
        default:
          if (a2 != 82)
            return __stream;
          v5 = "<exit ";
          break;
      }
LABEL_37:
      v6 = 6;
    }
    return (FILE *)fwrite(v5, v6, 1uLL, v4);
  }
  else if ((a4 & 1) != 0)
  {
    return (FILE *)fprintf(__stream, "%u", a2);
  }
  else
  {
    return (FILE *)fputs(a3, __stream);
  }
}

uint64_t print_event(FILE *a1, int a2, char a3)
{
  char *ae_name;
  au_event_ent e;
  _OWORD v9[3];
  __int16 v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&e.ae_number = 0;
  *(_QWORD *)&e.ae_class = 0;
  v11[1] = 0;
  v12[0] = 0;
  v11[0] = 0;
  *(_QWORD *)((char *)v12 + 6) = 0;
  memset(v9, 0, sizeof(v9));
  v10 = 0;
  e.ae_name = (char *)v11;
  e.ae_desc = (char *)v9;
  if (!getauevnum_r(&e, a2) || (a3 & 1) != 0)
    return fprintf(a1, "%u", a2);
  if ((a3 & 2) != 0)
    ae_name = e.ae_name;
  else
    ae_name = e.ae_desc;
  return fputs(ae_name, a1);
}

uint64_t print_sec32(FILE *a1, unsigned int a2, char a3)
{
  time_t v5;
  char v6[26];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
    return fprintf(a1, "%u", a2);
  v5 = a2;
  ctime_r(&v5, v6);
  v6[24] = 0;
  return fputs(v6, a1);
}

uint64_t close_tag(uint64_t __stream, int a2)
{
  FILE *v2;
  const char *v3;
  size_t v4;

  v2 = (FILE *)__stream;
  if (a2 <= 95)
  {
    switch(a2)
    {
      case 17:
        v3 = "</file>";
        goto LABEL_19;
      case 18:
      case 19:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 37:
      case 48:
      case 49:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
        return __stream;
      case 20:
      case 21:
        goto LABEL_8;
      case 33:
        v3 = "</arbitrary>";
        goto LABEL_24;
      case 34:
      case 36:
      case 38:
      case 39:
      case 43:
      case 45:
      case 46:
      case 47:
      case 50:
      case 62:
        goto LABEL_6;
      case 35:
        v3 = "</path>";
        goto LABEL_19;
      case 40:
        v3 = "</text>";
LABEL_19:
        v4 = 7;
        return fwrite(v3, v4, 1uLL, v2);
      case 41:
        v3 = "</opaque>";
        v4 = 9;
        return fwrite(v3, v4, 1uLL, v2);
      case 42:
        goto LABEL_13;
      case 44:
        v3 = "</ip_port>";
        v4 = 10;
        return fwrite(v3, v4, 1uLL, v2);
      case 59:
        v3 = "</group>";
        v4 = 8;
        return fwrite(v3, v4, 1uLL, v2);
      case 60:
        v3 = "</exec_args>";
        goto LABEL_24;
      case 61:
        v3 = "</exec_env>";
        v4 = 11;
        return fwrite(v3, v4, 1uLL, v2);
      default:
        if (a2 == 82)
          goto LABEL_6;
        return __stream;
    }
  }
  if (a2 > 236)
  {
    switch(a2)
    {
      case 237:
LABEL_6:
        v3 = "/>";
        v4 = 2;
        break;
      case 238:
        v3 = "</krb5_principal>";
        v4 = 17;
        break;
      case 239:
        v3 = "</cert_hash>";
LABEL_24:
        v4 = 12;
        break;
      default:
        return __stream;
    }
    return fwrite(v3, v4, 1uLL, v2);
  }
  switch(a2)
  {
    case 96:
    case 113:
    case 114:
    case 115:
    case 117:
    case 119:
    case 122:
    case 123:
    case 124:
    case 125:
    case 127:
    case 128:
    case 129:
    case 130:
      goto LABEL_6;
    case 116:
    case 121:
LABEL_8:
      __stream = fputc(62, (FILE *)__stream);
      break;
    case 126:
LABEL_13:
      v3 = "</ip_address>";
      v4 = 13;
      return fwrite(v3, v4, 1uLL, v2);
    default:
      return __stream;
  }
  return __stream;
}

size_t print_ip_ex_address(FILE *__stream, int a2, __int128 *a3)
{
  int v4;
  const char *v5;
  __int128 v7;
  char v8[46];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2 == 16)
  {
    v7 = *a3;
    v4 = 30;
    goto LABEL_5;
  }
  if (a2 == 4)
  {
    LODWORD(v7) = *(_DWORD *)a3;
    v4 = 2;
LABEL_5:
    v5 = inet_ntop(v4, &v7, v8, 0x2Eu);
    return fputs(v5, __stream);
  }
  return fwrite("invalid", 7uLL, 1uLL, __stream);
}

uint64_t print_sec64(FILE *a1, time_t a2, char a3)
{
  time_t v5;
  char v6[26];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
    return fprintf(a1, "%u", a2);
  v5 = a2;
  ctime_r(&v5, v6);
  v6[24] = 0;
  return fputs(v6, a1);
}

uint64_t print_string(uint64_t __stream, uint64_t a2, unint64_t a3, char a4)
{
  FILE *v7;
  unint64_t v8;
  unsigned int v9;
  const char *v10;
  size_t v11;

  if (a3)
  {
    v7 = (FILE *)__stream;
    v8 = 0;
    v9 = 1;
    do
    {
      __stream = *(char *)(a2 + v8);
      if (*(_BYTE *)(a2 + v8))
      {
        if ((a4 & 4) != 0)
        {
          if ((int)__stream <= 38)
          {
            if ((_DWORD)__stream == 34)
            {
              v10 = "&quot;";
              goto LABEL_18;
            }
            if ((_DWORD)__stream == 38)
            {
              v10 = "&amp;";
              v11 = 5;
LABEL_19:
              __stream = fwrite(v10, v11, 1uLL, v7);
              goto LABEL_20;
            }
          }
          else
          {
            switch((_DWORD)__stream)
            {
              case '\'':
                v10 = "&apos;";
LABEL_18:
                v11 = 6;
                goto LABEL_19;
              case '>':
                v10 = "&gt;";
                goto LABEL_16;
              case '<':
                v10 = "&lt;";
LABEL_16:
                v11 = 4;
                goto LABEL_19;
            }
          }
        }
        __stream = fputc(__stream, v7);
      }
LABEL_20:
      v8 = v9++;
    }
    while (v8 < a3);
  }
  return __stream;
}

uint64_t print_user(FILE *a1, uid_t a2, char a3)
{
  passwd *v6;

  if ((a3 & 9) != 0)
    return fprintf(a1, "%d", a2);
  v6 = getpwuid(a2);
  if (!v6)
    return fprintf(a1, "%d", a2);
  else
    return fputs(v6->pw_name, a1);
}

uint64_t print_group(FILE *a1, gid_t a2, char a3)
{
  group *v6;

  if ((a3 & 9) != 0)
    return fprintf(a1, "%d", a2);
  v6 = getgrgid(a2);
  if (!v6)
    return fprintf(a1, "%d", a2);
  else
    return fputs(v6->gr_name, a1);
}

FILE *print_mem(FILE *__stream, uint64_t a2, unint64_t a3)
{
  FILE *v5;
  unsigned int v6;
  unint64_t v7;

  if (a3)
  {
    v5 = __stream;
    v6 = 1;
    fwrite("0x", 2uLL, 1uLL, __stream);
    v7 = 0;
    do
    {
      __stream = (FILE *)fprintf(v5, "%02x", *(unsigned __int8 *)(a2 + v7));
      v7 = v6++;
    }
    while (v7 < a3);
  }
  return __stream;
}

size_t print_ipctype(FILE *__stream, int a2, char a3)
{
  const char *v4;
  size_t v5;

  if ((a3 & 1) != 0)
    return fprintf(__stream, "%u", a2);
  if (a2 == 3)
  {
    v4 = "Shared Memory IPC";
    v5 = 17;
    return fwrite(v4, v5, 1uLL, __stream);
  }
  if (a2 == 2)
  {
    v4 = "Semaphore IPC";
    v5 = 13;
    return fwrite(v4, v5, 1uLL, __stream);
  }
  if (a2 != 1)
    return fprintf(__stream, "%u", a2);
  v4 = "Message IPC";
  v5 = 11;
  return fwrite(v4, v5, 1uLL, __stream);
}

size_t print_retval(FILE *a1, u_char bsm_error, char a3)
{
  int errorp;

  if ((a3 & 1) != 0)
    return fprintf(a1, "%u");
  errorp = 0;
  if (au_bsm_to_errno(bsm_error, &errorp))
    return fprintf(a1, "failure: Unknown error: %d");
  if (!errorp)
    return fwrite("success", 7uLL, 1uLL, a1);
  strerror(errorp);
  return fprintf(a1, "failure : %s");
}

int au_preselect(au_event_t event, au_mask_t *mask_p, int sorf, int flag)
{
  char v5;
  int v7;
  uint64_t v8;
  unsigned int v10;

  if (!mask_p)
    return -1;
  v5 = sorf;
  v7 = event;
  pthread_mutex_lock(&mutex_3);
  if ((firsttime & 1) == 0)
  {
    firsttime = 1;
    if (load_event_table() == -1)
      goto LABEL_15;
  }
  if (flag)
  {
    if (flag == 1)
    {
      flush_cache();
      if (load_event_table() != -1)
      {
        v8 = ev_cache;
        if (ev_cache)
        {
          while (*(unsigned __int16 *)(v8 + 80) != v7)
          {
            v8 = *(_QWORD *)(v8 + 112);
            if (!v8)
              goto LABEL_15;
          }
          goto LABEL_16;
        }
      }
    }
LABEL_15:
    pthread_mutex_unlock(&mutex_3);
    return -1;
  }
  v8 = ev_cache;
  if (!ev_cache)
    goto LABEL_15;
  while (*(unsigned __int16 *)(v8 + 80) != v7)
  {
    v8 = *(_QWORD *)(v8 + 112);
    if (!v8)
      goto LABEL_15;
  }
LABEL_16:
  if ((v5 & 1) == 0)
  {
    v10 = 0;
    if ((v5 & 2) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  v10 = *(_DWORD *)(v8 + 104) & mask_p->am_success;
  if ((v5 & 2) != 0)
LABEL_20:
    v10 |= *(_DWORD *)(v8 + 104) & mask_p->am_failure;
LABEL_21:
  pthread_mutex_unlock(&mutex_3);
  return v10 != 0;
}

uint64_t load_event_table()
{
  char *v0;
  char *v1;
  uint64_t v2;

  ev_cache = 0;
  setauevent();
  v0 = (char *)malloc_type_malloc(0x80uLL, 0x10B004028BC5D46uLL);
  if (v0)
  {
    v1 = v0;
    while (1)
    {
      *((_OWORD *)v1 + 6) = 0u;
      *((_OWORD *)v1 + 7) = 0u;
      *((_OWORD *)v1 + 3) = 0u;
      *((_OWORD *)v1 + 4) = 0u;
      *((_OWORD *)v1 + 1) = 0u;
      *((_OWORD *)v1 + 2) = 0u;
      *(_OWORD *)v1 = 0u;
      *((_OWORD *)v1 + 5) = 0u;
      *((_QWORD *)v1 + 11) = v1;
      *((_QWORD *)v1 + 12) = v1 + 30;
      if (!getauevent_r((au_event_ent *)(v1 + 80)))
        break;
      v2 = ev_cache;
      *((_QWORD *)v1 + 14) = ev_cache;
      if (v2)
        *(_QWORD *)(v2 + 120) = v1 + 112;
      ev_cache = (uint64_t)v1;
      *((_QWORD *)v1 + 15) = &ev_cache;
      v1 = (char *)malloc_type_malloc(0x80uLL, 0x10B004028BC5D46uLL);
      if (!v1)
        goto LABEL_7;
    }
    free(v1);
    return 1;
  }
  else
  {
LABEL_7:
    flush_cache();
    return 0xFFFFFFFFLL;
  }
}

uint64_t flush_cache()
{
  uint64_t result;
  uint64_t v1;

  while (1)
  {
    result = ev_cache;
    if (!ev_cache)
      break;
    v1 = *(_QWORD *)(ev_cache + 112);
    if (v1)
    {
      *(_QWORD *)(v1 + 120) = *(_QWORD *)(ev_cache + 120);
      v1 = *(_QWORD *)(result + 112);
    }
    **(_QWORD **)(result + 120) = v1;
    free((void *)result);
  }
  return result;
}

uint32_t au_notify_initialize(void)
{
  uint32_t v0;
  int *v2;
  char *v3;
  int check;

  v0 = notify_register_check("com.apple.audit.change", &token);
  if (!v0)
  {
    check = 0;
    v0 = notify_check(token, &check);
    if (!v0)
    {
      if (audit_get_cond(&au_cond))
      {
        v0 = 1000000;
        if (*__error() == 78)
        {
          return 1000001;
        }
        else
        {
          v2 = __error();
          v3 = strerror(*v2);
          syslog(3, "Initial audit status check failed (%s)", v3);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v0;
}

int au_notify_terminate(void)
{
  if (notify_cancel(token))
    return -1;
  else
    return 0;
}

int au_get_state(void)
{
  uint32_t v1;
  int *v3;
  char *v4;
  int check;

  if (!au_cond)
  {
    v1 = au_notify_initialize();
    if (v1)
    {
      if (v1 == 1000001)
        return 1000001;
      else
        return 1;
    }
    return au_cond;
  }
  check = 0;
  if (notify_check(token, &check))
  {
    au_cond = 0;
    return 1;
  }
  if (!check)
    return au_cond;
  if (audit_get_cond(&au_cond))
  {
    if (*__error() == 78)
    {
      return 1000001;
    }
    else
    {
      v3 = __error();
      v4 = strerror(*v3);
      syslog(3, "Audit status check failed (%s)", v4);
      return *__error();
    }
  }
  else if (au_cond == -1 || au_cond == 2)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

int cannot_audit(int a1)
{
  return au_get_state() != 1;
}

u_short au_socket_type_to_bsm(int local_socket_type)
{
  uint64_t v1;

  v1 = 0;
  while (*(_DWORD *)&bsm_socket_types[v1 + 2] != local_socket_type)
  {
    v1 += 4;
    if (v1 == 20)
      return 500;
  }
  return bsm_socket_types[v1];
}

int au_bsm_to_socket_type(u_short bsm_socket_type, int *local_socket_typep)
{
  return -1;
}

token_t *__cdecl au_to_arg32(char n, const char *text, uint32_t v)
{
  __int16 v6;
  _QWORD *v7;
  _QWORD *v8;
  __int16 v9;
  size_t v10;
  _BYTE *v11;
  _BYTE *v12;

  v6 = strlen(text);
  v7 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v8 = v7;
  if (v7)
  {
    v9 = v6 + 1;
    v10 = (unsigned __int16)(v6 + 1);
    v7[1] = v10 + 8;
    v11 = malloc_type_malloc(v10 + 8, 0x100004077774924uLL);
    *v8 = v11;
    if (v11)
    {
      v12 = v11;
      bzero(v11, v10 + 8);
      *v12 = 45;
      v12[1] = n;
      v12[2] = HIBYTE(v);
      v12[3] = BYTE2(v);
      v12[4] = BYTE1(v);
      v12[5] = v;
      v12[6] = HIBYTE(v9);
      v12[7] = v9;
      memcpy(v12 + 8, text, v10);
    }
    else
    {
      free(v8);
      return 0;
    }
  }
  return (token_t *)v8;
}

token_t *__cdecl au_to_arg64(char n, const char *text, uint64_t v)
{
  __int16 v6;
  _QWORD *v7;
  _QWORD *v8;
  __int16 v9;
  size_t v10;
  _BYTE *v11;
  _BYTE *v12;

  v6 = strlen(text);
  v7 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v8 = v7;
  if (v7)
  {
    v9 = v6 + 1;
    v10 = (unsigned __int16)(v6 + 1);
    v7[1] = v10 + 12;
    v11 = malloc_type_malloc(v10 + 12, 0x100004077774924uLL);
    *v8 = v11;
    if (v11)
    {
      v12 = v11;
      bzero(v11, v10 + 12);
      *v12 = 113;
      v12[1] = n;
      v12[2] = HIBYTE(v);
      v12[3] = BYTE6(v);
      v12[4] = BYTE5(v);
      v12[5] = BYTE4(v);
      v12[6] = BYTE3(v);
      v12[7] = BYTE2(v);
      v12[8] = BYTE1(v);
      v12[9] = v;
      v12[10] = HIBYTE(v9);
      v12[11] = v9;
      memcpy(v12 + 12, text, v10);
    }
    else
    {
      free(v8);
      return 0;
    }
  }
  return (token_t *)v8;
}

token_t *__cdecl au_to_data(char unit_print, char unit_type, char unit_count, const char *p)
{
  int v5;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  size_t v11;
  _BYTE *v12;
  _BYTE *v13;

  if (unit_type >= 4)
  {
    v10 = 0;
    *__error() = 22;
  }
  else
  {
    v5 = unit_count;
    v8 = qword_1C1278380[unit_type];
    v9 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
    v10 = v9;
    if (v9)
    {
      v11 = v8 * v5;
      v9[1] = v11 + 4;
      v12 = malloc_type_malloc(v11 + 4, 0x100004077774924uLL);
      *v10 = v12;
      if (v12)
      {
        v13 = v12;
        bzero(v12, v11 + 4);
        *v13 = 33;
        v13[1] = unit_print;
        v13[2] = unit_type;
        v13[3] = v5;
        memcpy(v13 + 4, p, v11);
      }
      else
      {
        free(v10);
        return 0;
      }
    }
  }
  return (token_t *)v10;
}

token_t *__cdecl au_to_exit(int retval, int err)
{
  _QWORD *v4;
  _QWORD *v5;
  _BYTE *v6;

  v4 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = 9;
    v6 = malloc_type_malloc(9uLL, 0x100004077774924uLL);
    *v5 = v6;
    if (v6)
    {
      *v6 = 82;
      v6[1] = HIBYTE(err);
      v6[2] = BYTE2(err);
      v6[3] = BYTE1(err);
      v6[4] = err;
      v6[5] = HIBYTE(retval);
      v6[6] = BYTE2(retval);
      v6[7] = BYTE1(retval);
      v6[8] = retval;
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return (token_t *)v5;
}

token_t *__cdecl au_to_groups(int *groups)
{
  return au_to_newgroups(0x10u, (gid_t *)groups);
}

token_t *__cdecl au_to_newgroups(uint16_t n, gid_t *groups)
{
  unsigned int v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  unsigned int v10;

  v3 = n;
  v4 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v5 = v4;
  if (v4)
  {
    v6 = v3;
    v4[1] = (4 * v3) | 3;
    v7 = malloc_type_malloc((4 * v3) | 3, 0x100004077774924uLL);
    *v5 = v7;
    if (v7)
    {
      v8 = v7;
      bzero(v7, (4 * v3) | 3);
      *v8 = 59;
      v8[1] = BYTE1(v3);
      v8[2] = v3;
      if (v3)
      {
        v9 = v8 + 3;
        do
        {
          v10 = *groups++;
          *v9++ = bswap32(v10);
          --v6;
        }
        while (v6);
      }
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return (token_t *)v5;
}

token_t *__cdecl au_to_in_addr(in_addr *internet_addr)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 5;
    v4 = (char *)malloc_type_malloc(5uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *(_DWORD *)(v4 + 1) = 0;
      *v4 = 42;
      *(in_addr *)(v4 + 1) = (in_addr)internet_addr->s_addr;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_in_addr_ex(in6_addr *internet_addr)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 21;
    v4 = (char *)malloc_type_malloc(0x15uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *(_QWORD *)(v4 + 13) = 0;
      *(_QWORD *)(v4 + 5) = 0;
      *(_DWORD *)v4 = 126;
      v4[4] = 16;
      *(in6_addr *)(v4 + 5) = *internet_addr;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_ip(ip *ip)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;
  __int128 v5;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 21;
    v4 = (char *)malloc_type_malloc(0x15uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *(_QWORD *)(v4 + 9) = 0;
      *(_QWORD *)(v4 + 1) = 0;
      *(_DWORD *)(v4 + 17) = 0;
      *v4 = 43;
      v5 = *(_OWORD *)ip;
      *(_DWORD *)(v4 + 17) = ip->ip_dst.s_addr;
      *(_OWORD *)(v4 + 1) = v5;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_ipc(char type, int id)
{
  _QWORD *v4;
  _QWORD *v5;
  _BYTE *v6;

  v4 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = 6;
    v6 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
    *v5 = v6;
    if (v6)
    {
      *v6 = 34;
      v6[1] = type;
      v6[2] = HIBYTE(id);
      v6[3] = BYTE2(id);
      v6[4] = BYTE1(id);
      v6[5] = id;
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return (token_t *)v5;
}

token_t *__cdecl au_to_ipc_perm(ipc_perm *perm)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;
  gid_t cgid;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 29;
    v4 = (char *)malloc_type_malloc(0x1DuLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *(_QWORD *)(v4 + 9) = 0;
      *(_QWORD *)(v4 + 1) = 0;
      *(_DWORD *)(v4 + 25) = 0;
      *(_QWORD *)(v4 + 17) = 0;
      *v4 = 50;
      *(_DWORD *)(v4 + 1) = bswap32(perm->uid);
      *(_DWORD *)(v4 + 5) = bswap32(perm->gid);
      *(_DWORD *)(v4 + 9) = bswap32(perm->cuid);
      cgid = perm->cgid;
      v4[13] = HIBYTE(cgid);
      v4[14] = BYTE2(cgid);
      v4[15] = BYTE1(cgid);
      v4[16] = cgid;
      *(_WORD *)(v4 + 17) = 0;
      LOWORD(cgid) = perm->mode;
      v4[19] = BYTE1(cgid);
      v4[20] = cgid;
      *(_WORD *)(v4 + 21) = 0;
      *(_WORD *)(v4 + 23) = bswap32(perm->_seq) >> 16;
      *(_DWORD *)(v4 + 25) = bswap32(perm->_key);
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_iport(uint16_t iport)
{
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 3;
    v4 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *v4 = 44;
      v4[1] = HIBYTE(iport);
      v4[2] = iport;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_opaque(const char *data, uint16_t bytes)
{
  unsigned int v2;
  _QWORD *v4;
  _QWORD *v5;
  _BYTE *v6;
  _BYTE *v7;

  v2 = bytes;
  v4 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = v2 + 3;
    v6 = malloc_type_malloc(v2 + 3, 0x100004077774924uLL);
    *v5 = v6;
    if (v6)
    {
      v7 = v6;
      bzero(v6, v2 + 3);
      *v7 = 41;
      v7[1] = BYTE1(v2);
      v7[2] = v2;
      memcpy(v7 + 3, data, v2);
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return (token_t *)v5;
}

token_t *__cdecl au_to_file(const char *file, timeval tm)
{
  __darwin_suseconds_t tv_usec;
  int tv_sec;
  __int16 v5;
  _QWORD *v6;
  _QWORD *v7;
  __int16 v8;
  size_t v9;
  _BYTE *v10;
  _BYTE *v11;

  tv_usec = tm.tv_usec;
  tv_sec = tm.tv_sec;
  v5 = strlen(file);
  v6 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v7 = v6;
  if (v6)
  {
    v8 = v5 + 1;
    v9 = (unsigned __int16)(v5 + 1);
    v6[1] = v9 + 11;
    v10 = malloc_type_malloc(v9 + 11, 0x100004077774924uLL);
    *v7 = v10;
    if (v10)
    {
      v11 = v10;
      bzero(v10, v9 + 11);
      *v11 = 17;
      v11[1] = HIBYTE(tv_sec);
      v11[2] = BYTE2(tv_sec);
      v11[3] = BYTE1(tv_sec);
      v11[4] = tv_sec;
      v11[5] = (tv_usec / 1000) >> 24;
      v11[6] = (tv_usec / 1000) >> 16;
      v11[7] = (unsigned __int16)(tv_usec / 1000) >> 8;
      v11[8] = tv_usec / 1000;
      v11[9] = HIBYTE(v8);
      v11[10] = v8;
      memcpy(v11 + 11, file, v9);
    }
    else
    {
      free(v7);
      return 0;
    }
  }
  return (token_t *)v7;
}

token_t *__cdecl au_to_text(const char *text)
{
  __int16 v2;
  _QWORD *v3;
  _QWORD *v4;
  __int16 v5;
  size_t v6;
  _BYTE *v7;
  _BYTE *v8;

  v2 = strlen(text);
  v3 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v4 = v3;
  if (v3)
  {
    v5 = v2 + 1;
    v6 = (unsigned __int16)(v2 + 1);
    v3[1] = v6 + 3;
    v7 = malloc_type_malloc(v6 + 3, 0x100004077774924uLL);
    *v4 = v7;
    if (v7)
    {
      v8 = v7;
      bzero(v7, v6 + 3);
      *v8 = 40;
      v8[1] = HIBYTE(v5);
      v8[2] = v5;
      memcpy(v8 + 3, text, v6);
    }
    else
    {
      free(v4);
      return 0;
    }
  }
  return (token_t *)v4;
}

token_t *__cdecl au_to_path(const char *path)
{
  __int16 v2;
  _QWORD *v3;
  _QWORD *v4;
  __int16 v5;
  size_t v6;
  _BYTE *v7;
  _BYTE *v8;

  v2 = strlen(path);
  v3 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v4 = v3;
  if (v3)
  {
    v5 = v2 + 1;
    v6 = (unsigned __int16)(v2 + 1);
    v3[1] = v6 + 3;
    v7 = malloc_type_malloc(v6 + 3, 0x100004077774924uLL);
    *v4 = v7;
    if (v7)
    {
      v8 = v7;
      bzero(v7, v6 + 3);
      *v8 = 35;
      v8[1] = HIBYTE(v5);
      v8[2] = v5;
      memcpy(v8 + 3, path, v6);
    }
    else
    {
      free(v4);
      return 0;
    }
  }
  return (token_t *)v4;
}

token_t *__cdecl au_to_process32(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_t *tid)
{
  _QWORD *v16;
  _QWORD *v17;
  char *v18;

  v16 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v17 = v16;
  if (v16)
  {
    v16[1] = 37;
    v18 = (char *)malloc_type_malloc(0x25uLL, 0x100004077774924uLL);
    *v17 = v18;
    if (v18)
    {
      *(_QWORD *)(v18 + 29) = 0;
      *v18 = 38;
      v18[1] = HIBYTE(auid);
      v18[2] = BYTE2(auid);
      v18[3] = BYTE1(auid);
      v18[4] = auid;
      v18[5] = HIBYTE(euid);
      v18[6] = BYTE2(euid);
      v18[7] = BYTE1(euid);
      v18[8] = euid;
      v18[9] = HIBYTE(egid);
      v18[10] = BYTE2(egid);
      v18[11] = BYTE1(egid);
      v18[12] = egid;
      v18[13] = HIBYTE(ruid);
      v18[14] = BYTE2(ruid);
      v18[15] = BYTE1(ruid);
      v18[16] = ruid;
      v18[17] = HIBYTE(rgid);
      v18[18] = BYTE2(rgid);
      v18[19] = BYTE1(rgid);
      v18[20] = rgid;
      v18[21] = HIBYTE(pid);
      v18[22] = BYTE2(pid);
      v18[23] = BYTE1(pid);
      v18[24] = pid;
      v18[25] = HIBYTE(sid);
      v18[26] = BYTE2(sid);
      v18[27] = BYTE1(sid);
      v18[28] = sid;
      *(_DWORD *)(v18 + 29) = bswap32(tid->port);
      *(_DWORD *)(v18 + 33) = tid->machine;
    }
    else
    {
      free(v17);
      return 0;
    }
  }
  return (token_t *)v17;
}

token_t *__cdecl au_to_process64(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_t *tid)
{
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  uint64_t port;

  v16 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v17 = v16;
  if (v16)
  {
    v16[1] = 41;
    v18 = (char *)malloc_type_malloc(0x29uLL, 0x100004077774924uLL);
    *v17 = v18;
    if (v18)
    {
      *(_DWORD *)(v18 + 37) = 0;
      *(_QWORD *)(v18 + 29) = 0;
      *v18 = 119;
      v18[1] = HIBYTE(auid);
      v18[2] = BYTE2(auid);
      v18[3] = BYTE1(auid);
      v18[4] = auid;
      v18[5] = HIBYTE(euid);
      v18[6] = BYTE2(euid);
      v18[7] = BYTE1(euid);
      v18[8] = euid;
      v18[9] = HIBYTE(egid);
      v18[10] = BYTE2(egid);
      v18[11] = BYTE1(egid);
      v18[12] = egid;
      v18[13] = HIBYTE(ruid);
      v18[14] = BYTE2(ruid);
      v18[15] = BYTE1(ruid);
      v18[16] = ruid;
      v18[17] = HIBYTE(rgid);
      v18[18] = BYTE2(rgid);
      v18[19] = BYTE1(rgid);
      v18[20] = rgid;
      v18[21] = HIBYTE(pid);
      v18[22] = BYTE2(pid);
      v18[23] = BYTE1(pid);
      v18[24] = pid;
      v18[25] = HIBYTE(sid);
      v18[26] = BYTE2(sid);
      v18[27] = BYTE1(sid);
      v18[28] = sid;
      port = tid->port;
      v18[29] = HIBYTE(port);
      v18[30] = BYTE6(port);
      v18[31] = BYTE5(port);
      v18[32] = (int)port >> 31;
      v18[33] = BYTE3(port);
      v18[34] = BYTE2(port);
      v18[35] = BYTE1(port);
      v18[36] = port;
      *(_DWORD *)(v18 + 37) = tid->machine;
    }
    else
    {
      free(v17);
      return 0;
    }
  }
  return (token_t *)v17;
}

token_t *__cdecl au_to_process32_ex(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_addr_t *tid)
{
  u_int32_t at_type;
  token_t *v17;
  token_t *v18;
  char *v19;
  __int128 v20;
  token_t *v21;

  at_type = tid->at_type;
  if (at_type == 16)
  {
    v21 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
    v18 = v21;
    if (!v21)
      return v18;
    *((_QWORD *)v21 + 1) = 53;
    v19 = (char *)malloc_type_malloc(0x35uLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      *(_QWORD *)(v19 + 45) = 0;
      v20 = 0uLL;
      *((_OWORD *)v19 + 2) = 0u;
LABEL_9:
      *(_OWORD *)v19 = v20;
      *((_OWORD *)v19 + 1) = v20;
      *v19 = 123;
      v19[1] = HIBYTE(auid);
      v19[2] = BYTE2(auid);
      v19[3] = BYTE1(auid);
      v19[4] = auid;
      v19[5] = HIBYTE(euid);
      v19[6] = BYTE2(euid);
      v19[7] = BYTE1(euid);
      v19[8] = euid;
      v19[9] = HIBYTE(egid);
      v19[10] = BYTE2(egid);
      v19[11] = BYTE1(egid);
      v19[12] = egid;
      v19[13] = HIBYTE(ruid);
      v19[14] = BYTE2(ruid);
      v19[15] = BYTE1(ruid);
      v19[16] = ruid;
      v19[17] = HIBYTE(rgid);
      v19[18] = BYTE2(rgid);
      v19[19] = BYTE1(rgid);
      v19[20] = rgid;
      v19[21] = HIBYTE(pid);
      v19[22] = BYTE2(pid);
      v19[23] = BYTE1(pid);
      v19[24] = pid;
      v19[25] = HIBYTE(sid);
      v19[26] = BYTE2(sid);
      v19[27] = BYTE1(sid);
      v19[28] = sid;
      *(_DWORD *)(v19 + 29) = bswap32(tid->at_port);
      *(_DWORD *)(v19 + 33) = bswap32(tid->at_type);
      *(_DWORD *)(v19 + 37) = tid->at_addr[0];
      if (tid->at_type == 16)
      {
        *(_DWORD *)(v19 + 41) = tid->at_addr[1];
        *(_DWORD *)(v19 + 45) = tid->at_addr[2];
        *(_DWORD *)(v19 + 49) = tid->at_addr[3];
      }
      return v18;
    }
LABEL_12:
    free(v18);
    return 0;
  }
  if (at_type != 4)
  {
    v18 = 0;
    *__error() = 22;
    return v18;
  }
  v17 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v18 = v17;
  if (v17)
  {
    *((_QWORD *)v17 + 1) = 41;
    v19 = (char *)malloc_type_malloc(0x29uLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      v20 = 0uLL;
      *(_OWORD *)(v19 + 25) = 0u;
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  return v18;
}

token_t *__cdecl au_to_process64_ex(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_addr_t *tid)
{
  u_int32_t at_type;
  token_t *v17;
  token_t *v18;
  char *v19;
  __int128 v20;
  token_t *v21;
  uint64_t at_port;

  at_type = tid->at_type;
  if (at_type == 16)
  {
    v21 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
    v18 = v21;
    if (!v21)
      return v18;
    *((_QWORD *)v21 + 1) = 57;
    v19 = (char *)malloc_type_malloc(0x39uLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      v20 = 0uLL;
      *(_OWORD *)(v19 + 41) = 0u;
      *((_OWORD *)v19 + 2) = 0u;
LABEL_9:
      *(_OWORD *)v19 = v20;
      *((_OWORD *)v19 + 1) = v20;
      *v19 = 125;
      v19[1] = HIBYTE(auid);
      v19[2] = BYTE2(auid);
      v19[3] = BYTE1(auid);
      v19[4] = auid;
      v19[5] = HIBYTE(euid);
      v19[6] = BYTE2(euid);
      v19[7] = BYTE1(euid);
      v19[8] = euid;
      v19[9] = HIBYTE(egid);
      v19[10] = BYTE2(egid);
      v19[11] = BYTE1(egid);
      v19[12] = egid;
      v19[13] = HIBYTE(ruid);
      v19[14] = BYTE2(ruid);
      v19[15] = BYTE1(ruid);
      v19[16] = ruid;
      v19[17] = HIBYTE(rgid);
      v19[18] = BYTE2(rgid);
      v19[19] = BYTE1(rgid);
      v19[20] = rgid;
      v19[21] = HIBYTE(pid);
      v19[22] = BYTE2(pid);
      v19[23] = BYTE1(pid);
      v19[24] = pid;
      v19[25] = HIBYTE(sid);
      v19[26] = BYTE2(sid);
      v19[27] = BYTE1(sid);
      v19[28] = sid;
      at_port = tid->at_port;
      v19[29] = HIBYTE(at_port);
      v19[30] = BYTE6(at_port);
      v19[31] = BYTE5(at_port);
      v19[32] = (int)at_port >> 31;
      v19[33] = BYTE3(at_port);
      v19[34] = BYTE2(at_port);
      v19[35] = BYTE1(at_port);
      v19[36] = at_port;
      *(_DWORD *)(v19 + 37) = bswap32(tid->at_type);
      *(_DWORD *)(v19 + 41) = tid->at_addr[0];
      if (tid->at_type == 16)
      {
        *(_DWORD *)(v19 + 45) = tid->at_addr[1];
        *(_DWORD *)(v19 + 49) = tid->at_addr[2];
        *(_DWORD *)(v19 + 53) = tid->at_addr[3];
      }
      return v18;
    }
LABEL_12:
    free(v18);
    return 0;
  }
  if (at_type != 4)
  {
    v18 = 0;
    *__error() = 22;
    return v18;
  }
  v17 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v18 = v17;
  if (v17)
  {
    *((_QWORD *)v17 + 1) = 45;
    v19 = (char *)malloc_type_malloc(0x2DuLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      v20 = 0uLL;
      *(_OWORD *)(v19 + 29) = 0u;
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  return v18;
}

token_t *__cdecl au_to_return32(char status, uint32_t ret)
{
  _QWORD *v4;
  _QWORD *v5;
  _BYTE *v6;

  v4 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = 6;
    v6 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
    *v5 = v6;
    if (v6)
    {
      *v6 = 39;
      v6[1] = status;
      v6[2] = HIBYTE(ret);
      v6[3] = BYTE2(ret);
      v6[4] = BYTE1(ret);
      v6[5] = ret;
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return (token_t *)v5;
}

token_t *__cdecl au_to_return64(char status, uint64_t ret)
{
  _QWORD *v4;
  _QWORD *v5;
  _BYTE *v6;

  v4 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = 10;
    v6 = malloc_type_malloc(0xAuLL, 0x100004077774924uLL);
    *v5 = v6;
    if (v6)
    {
      *v6 = 114;
      v6[1] = status;
      v6[2] = HIBYTE(ret);
      v6[3] = BYTE6(ret);
      v6[4] = BYTE5(ret);
      v6[5] = BYTE4(ret);
      v6[6] = BYTE3(ret);
      v6[7] = BYTE2(ret);
      v6[8] = BYTE1(ret);
      v6[9] = ret;
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return (token_t *)v5;
}

token_t *__cdecl au_to_seq(uint64_t audit_count)
{
  int v1;
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;

  v1 = audit_count;
  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 5;
    v4 = malloc_type_malloc(5uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *v4 = 47;
      v4[1] = HIBYTE(v1);
      v4[2] = BYTE2(v1);
      v4[3] = BYTE1(v1);
      v4[4] = v1;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_socket_ex(u_short so_domain, u_short so_type, sockaddr *sa_local, sockaddr *sa_remote)
{
  int v6;
  int v7;
  token_t *v8;
  token_t *v9;
  char *v10;
  char *v11;
  token_t *v12;
  _OWORD *v13;
  u_short v14;

  v6 = so_type;
  v7 = so_domain;
  if (so_domain != 2)
  {
    if (so_domain != 30)
    {
      v9 = 0;
      *__error() = 22;
      return v9;
    }
    v12 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
    v9 = v12;
    if (v12)
    {
      *((_QWORD *)v12 + 1) = 43;
      v13 = malloc_type_malloc(0x2BuLL, 0x100004077774924uLL);
      v11 = (char *)v13;
      *(_QWORD *)v9 = v13;
      if (v13)
      {
        *(_OWORD *)((char *)v13 + 27) = 0u;
        *v13 = 0u;
        v13[1] = 0u;
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_9:
    v11 = 0;
    goto LABEL_12;
  }
  v8 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  *((_QWORD *)v8 + 1) = 19;
  v10 = (char *)malloc_type_malloc(0x13uLL, 0x100004077774924uLL);
  v11 = v10;
  *(_QWORD *)v9 = v10;
  if (v10)
  {
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = 0;
    *(_DWORD *)(v10 + 15) = 0;
    goto LABEL_12;
  }
LABEL_11:
  free(v9);
  v9 = 0;
LABEL_12:
  *v11 = 127;
  *(_WORD *)(v11 + 1) = __rev16(au_domain_to_bsm(v7));
  v14 = au_socket_type_to_bsm(v6);
  v11[3] = HIBYTE(v14);
  v11[4] = v14;
  v11[5] = 0;
  if (v7 == 2)
  {
    v11[6] = 4;
    *(_WORD *)(v11 + 7) = *(_WORD *)sa_local->sa_data;
    *(_DWORD *)(v11 + 9) = *(_DWORD *)&sa_local->sa_data[2];
    *(_WORD *)(v11 + 13) = *(_WORD *)sa_remote->sa_data;
    *(_DWORD *)(v11 + 15) = *(_DWORD *)&sa_remote->sa_data[2];
  }
  else
  {
    v11[6] = 16;
    *(_WORD *)(v11 + 7) = *(_WORD *)sa_local->sa_data;
    *(sockaddr *)(v11 + 9) = *(sockaddr *)&sa_local->sa_data[6];
    *(_WORD *)(v11 + 25) = *(_WORD *)sa_remote->sa_data;
    *(sockaddr *)(v11 + 27) = *(sockaddr *)&sa_remote->sa_data[6];
  }
  return v9;
}

token_t *__cdecl au_to_sock_unix(sockaddr_un *so)
{
  _QWORD *v2;
  size_t v3;
  _BYTE *v4;
  _BYTE *v5;
  size_t v6;
  size_t v7;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  if (v2)
  {
    v2[1] = strlen(so->sun_path) + 4;
    v3 = strlen(so->sun_path);
    v4 = malloc_type_malloc(v3 + 4, 0x100004077774924uLL);
    *v2 = v4;
    if (v4)
    {
      v5 = v4;
      v6 = strlen(so->sun_path);
      bzero(v5, v6 + 4);
      *(_WORD *)v5 = 130;
      v5[2] = so->sun_family;
      v7 = strlen(so->sun_path);
      memcpy(v5 + 3, so->sun_path, v7 + 1);
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return (token_t *)v2;
}

token_t *__cdecl au_to_sock_inet32(sockaddr_in *so)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 9;
    v4 = (char *)malloc_type_malloc(9uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *(_QWORD *)(v4 + 1) = 0;
      *v4 = 0x80;
      v4[2] = so->sin_family;
      *(_WORD *)(v4 + 3) = so->sin_port;
      *(_DWORD *)(v4 + 5) = so->sin_addr.s_addr;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_sock_inet128(sockaddr_in6 *so)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 21;
    v4 = (char *)malloc_type_malloc(0x15uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *(_QWORD *)(v4 + 10) = 0;
      *(_QWORD *)(v4 + 2) = 0;
      *(_DWORD *)(v4 + 17) = 0;
      *(_WORD *)v4 = 129;
      v4[2] = so->sin6_family;
      *(_WORD *)(v4 + 3) = bswap32(so->sin6_port) >> 16;
      *(in6_addr *)(v4 + 5) = so->sin6_addr;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_subject32(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_t *tid)
{
  _QWORD *v16;
  _QWORD *v17;
  char *v18;

  v16 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v17 = v16;
  if (v16)
  {
    v16[1] = 37;
    v18 = (char *)malloc_type_malloc(0x25uLL, 0x100004077774924uLL);
    *v17 = v18;
    if (v18)
    {
      *(_QWORD *)(v18 + 29) = 0;
      *v18 = 36;
      v18[1] = HIBYTE(auid);
      v18[2] = BYTE2(auid);
      v18[3] = BYTE1(auid);
      v18[4] = auid;
      v18[5] = HIBYTE(euid);
      v18[6] = BYTE2(euid);
      v18[7] = BYTE1(euid);
      v18[8] = euid;
      v18[9] = HIBYTE(egid);
      v18[10] = BYTE2(egid);
      v18[11] = BYTE1(egid);
      v18[12] = egid;
      v18[13] = HIBYTE(ruid);
      v18[14] = BYTE2(ruid);
      v18[15] = BYTE1(ruid);
      v18[16] = ruid;
      v18[17] = HIBYTE(rgid);
      v18[18] = BYTE2(rgid);
      v18[19] = BYTE1(rgid);
      v18[20] = rgid;
      v18[21] = HIBYTE(pid);
      v18[22] = BYTE2(pid);
      v18[23] = BYTE1(pid);
      v18[24] = pid;
      v18[25] = HIBYTE(sid);
      v18[26] = BYTE2(sid);
      v18[27] = BYTE1(sid);
      v18[28] = sid;
      *(_DWORD *)(v18 + 29) = bswap32(tid->port);
      *(_DWORD *)(v18 + 33) = tid->machine;
    }
    else
    {
      free(v17);
      return 0;
    }
  }
  return (token_t *)v17;
}

token_t *__cdecl au_to_subject64(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_t *tid)
{
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  uint64_t port;

  v16 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v17 = v16;
  if (v16)
  {
    v16[1] = 41;
    v18 = (char *)malloc_type_malloc(0x29uLL, 0x100004077774924uLL);
    *v17 = v18;
    if (v18)
    {
      *(_DWORD *)(v18 + 37) = 0;
      *(_QWORD *)(v18 + 29) = 0;
      *v18 = 117;
      v18[1] = HIBYTE(auid);
      v18[2] = BYTE2(auid);
      v18[3] = BYTE1(auid);
      v18[4] = auid;
      v18[5] = HIBYTE(euid);
      v18[6] = BYTE2(euid);
      v18[7] = BYTE1(euid);
      v18[8] = euid;
      v18[9] = HIBYTE(egid);
      v18[10] = BYTE2(egid);
      v18[11] = BYTE1(egid);
      v18[12] = egid;
      v18[13] = HIBYTE(ruid);
      v18[14] = BYTE2(ruid);
      v18[15] = BYTE1(ruid);
      v18[16] = ruid;
      v18[17] = HIBYTE(rgid);
      v18[18] = BYTE2(rgid);
      v18[19] = BYTE1(rgid);
      v18[20] = rgid;
      v18[21] = HIBYTE(pid);
      v18[22] = BYTE2(pid);
      v18[23] = BYTE1(pid);
      v18[24] = pid;
      v18[25] = HIBYTE(sid);
      v18[26] = BYTE2(sid);
      v18[27] = BYTE1(sid);
      v18[28] = sid;
      port = tid->port;
      v18[29] = HIBYTE(port);
      v18[30] = BYTE6(port);
      v18[31] = BYTE5(port);
      v18[32] = (int)port >> 31;
      v18[33] = BYTE3(port);
      v18[34] = BYTE2(port);
      v18[35] = BYTE1(port);
      v18[36] = port;
      *(_DWORD *)(v18 + 37) = tid->machine;
    }
    else
    {
      free(v17);
      return 0;
    }
  }
  return (token_t *)v17;
}

token_t *__cdecl au_to_subject32_ex(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_addr_t *tid)
{
  u_int32_t at_type;
  token_t *v17;
  token_t *v18;
  char *v19;
  __int128 v20;
  token_t *v21;
  _OWORD *v22;
  u_int32_t *at_addr;

  at_type = tid->at_type;
  if (at_type == 16)
  {
    v21 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
    v18 = v21;
    if (!v21)
      return v18;
    *((_QWORD *)v21 + 1) = 53;
    v19 = (char *)malloc_type_malloc(0x35uLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      *(_QWORD *)(v19 + 45) = 0;
      v20 = 0uLL;
      *((_OWORD *)v19 + 2) = 0u;
LABEL_9:
      *(_OWORD *)v19 = v20;
      *((_OWORD *)v19 + 1) = v20;
      *v19 = 122;
      v19[1] = HIBYTE(auid);
      v19[2] = BYTE2(auid);
      v19[3] = BYTE1(auid);
      v19[4] = auid;
      v19[5] = HIBYTE(euid);
      v19[6] = BYTE2(euid);
      v19[7] = BYTE1(euid);
      v19[8] = euid;
      v19[9] = HIBYTE(egid);
      v19[10] = BYTE2(egid);
      v19[11] = BYTE1(egid);
      v19[12] = egid;
      v19[13] = HIBYTE(ruid);
      v19[14] = BYTE2(ruid);
      v19[15] = BYTE1(ruid);
      v19[16] = ruid;
      v19[17] = HIBYTE(rgid);
      v19[18] = BYTE2(rgid);
      v19[19] = BYTE1(rgid);
      v19[20] = rgid;
      v19[21] = HIBYTE(pid);
      v19[22] = BYTE2(pid);
      v19[23] = BYTE1(pid);
      v19[24] = pid;
      v19[25] = HIBYTE(sid);
      v19[26] = BYTE2(sid);
      v19[27] = BYTE1(sid);
      v19[28] = sid;
      *(_DWORD *)(v19 + 29) = bswap32(tid->at_port);
      *(_DWORD *)(v19 + 33) = bswap32(tid->at_type);
      v22 = v19 + 37;
      at_addr = tid->at_addr;
      if (tid->at_type == 16)
        *v22 = *(_OWORD *)at_addr;
      else
        *(_DWORD *)v22 = *at_addr;
      return v18;
    }
LABEL_12:
    free(v18);
    return 0;
  }
  if (at_type != 4)
  {
    v18 = 0;
    *__error() = 22;
    return v18;
  }
  v17 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v18 = v17;
  if (v17)
  {
    *((_QWORD *)v17 + 1) = 41;
    v19 = (char *)malloc_type_malloc(0x29uLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      v20 = 0uLL;
      *(_OWORD *)(v19 + 25) = 0u;
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  return v18;
}

token_t *__cdecl au_to_subject64_ex(au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_addr_t *tid)
{
  u_int32_t at_type;
  token_t *v17;
  token_t *v18;
  char *v19;
  __int128 v20;
  token_t *v21;
  uint64_t at_port;
  _OWORD *v23;
  u_int32_t *at_addr;

  at_type = tid->at_type;
  if (at_type == 16)
  {
    v21 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
    v18 = v21;
    if (!v21)
      return v18;
    *((_QWORD *)v21 + 1) = 57;
    v19 = (char *)malloc_type_malloc(0x39uLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      v20 = 0uLL;
      *(_OWORD *)(v19 + 41) = 0u;
      *((_OWORD *)v19 + 2) = 0u;
LABEL_9:
      *(_OWORD *)v19 = v20;
      *((_OWORD *)v19 + 1) = v20;
      *v19 = 124;
      v19[1] = HIBYTE(auid);
      v19[2] = BYTE2(auid);
      v19[3] = BYTE1(auid);
      v19[4] = auid;
      v19[5] = HIBYTE(euid);
      v19[6] = BYTE2(euid);
      v19[7] = BYTE1(euid);
      v19[8] = euid;
      v19[9] = HIBYTE(egid);
      v19[10] = BYTE2(egid);
      v19[11] = BYTE1(egid);
      v19[12] = egid;
      v19[13] = HIBYTE(ruid);
      v19[14] = BYTE2(ruid);
      v19[15] = BYTE1(ruid);
      v19[16] = ruid;
      v19[17] = HIBYTE(rgid);
      v19[18] = BYTE2(rgid);
      v19[19] = BYTE1(rgid);
      v19[20] = rgid;
      v19[21] = HIBYTE(pid);
      v19[22] = BYTE2(pid);
      v19[23] = BYTE1(pid);
      v19[24] = pid;
      v19[25] = HIBYTE(sid);
      v19[26] = BYTE2(sid);
      v19[27] = BYTE1(sid);
      v19[28] = sid;
      at_port = tid->at_port;
      v19[29] = HIBYTE(at_port);
      v19[30] = BYTE6(at_port);
      v19[31] = BYTE5(at_port);
      v19[32] = (int)at_port >> 31;
      v19[33] = BYTE3(at_port);
      v19[34] = BYTE2(at_port);
      v19[35] = BYTE1(at_port);
      v19[36] = at_port;
      *(_DWORD *)(v19 + 37) = bswap32(tid->at_type);
      v23 = v19 + 41;
      at_addr = tid->at_addr;
      if (tid->at_type == 16)
        *v23 = *(_OWORD *)at_addr;
      else
        *(_DWORD *)v23 = *at_addr;
      return v18;
    }
LABEL_12:
    free(v18);
    return 0;
  }
  if (at_type != 4)
  {
    v18 = 0;
    *__error() = 22;
    return v18;
  }
  v17 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v18 = v17;
  if (v17)
  {
    *((_QWORD *)v17 + 1) = 45;
    v19 = (char *)malloc_type_malloc(0x2DuLL, 0x100004077774924uLL);
    *(_QWORD *)v18 = v19;
    if (v19)
    {
      v20 = 0uLL;
      *(_OWORD *)(v19 + 29) = 0u;
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  return v18;
}

token_t *au_to_me(void)
{
  au_id_t ai_auid;
  uid_t v2;
  gid_t v3;
  uid_t v4;
  gid_t v5;
  pid_t v6;
  auditinfo_addr v7;

  memset(&v7, 0, sizeof(v7));
  if (getaudit_addr(&v7, 48))
    return 0;
  ai_auid = v7.ai_auid;
  v2 = geteuid();
  v3 = getegid();
  v4 = getuid();
  v5 = getgid();
  v6 = getpid();
  return au_to_subject32_ex(ai_auid, v2, v3, v4, v5, v6, v7.ai_asid, (au_tid_addr_t *)((unint64_t)&v7 | 0xC));
}

token_t *__cdecl au_to_exec_args(char **argv)
{
  return (token_t *)au_to_strings((const char **)argv, 60);
}

_QWORD *au_to_strings(const char **a1, char a2)
{
  const char **v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _BYTE *v11;
  _BYTE *v12;
  char *v13;
  uint64_t v14;
  const char *v15;
  size_t v16;

  v3 = a1;
  v4 = *a1;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = v5;
      v6 += (int)(strlen(v4) + 1);
      ++v5;
      v4 = v3[v7 + 1];
    }
    while (v4);
    v8 = v6 + 5;
  }
  else
  {
    LODWORD(v5) = 0;
    v8 = 5;
  }
  v9 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v10 = v9;
  if (v9)
  {
    v9[1] = v8;
    v11 = malloc_type_malloc(v8, 0x100004077774924uLL);
    *v10 = v11;
    if (v11)
    {
      v12 = v11;
      bzero(v11, v8);
      *v12 = a2;
      v12[1] = BYTE3(v5);
      v12[2] = BYTE2(v5);
      v12[3] = BYTE1(v5);
      v12[4] = v5;
      if ((_DWORD)v5)
      {
        v13 = v12 + 5;
        v14 = v5;
        do
        {
          v15 = *v3++;
          v16 = strlen(v15);
          memcpy(v13, v15, v16 + 1);
          v13 += strlen(v15) + 1;
          --v14;
        }
        while (v14);
      }
    }
    else
    {
      free(v10);
      return 0;
    }
  }
  return v10;
}

token_t *__cdecl au_to_exec_env(char **envp)
{
  return (token_t *)au_to_strings((const char **)envp, 61);
}

token_t *__cdecl au_to_certificate_hash(char **hash)
{
  return (token_t *)au_to_strings((const char **)hash, 239);
}

token_t *__cdecl au_to_krb5_principal(char **principal)
{
  return (token_t *)au_to_strings((const char **)principal, 238);
}

token_t *__cdecl au_to_zonename(const char *zonename)
{
  __int16 v2;
  _QWORD *v3;
  _QWORD *v4;
  __int16 v5;
  size_t v6;
  _BYTE *v7;
  _BYTE *v8;

  v2 = strlen(zonename);
  v3 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v4 = v3;
  if (v3)
  {
    v5 = v2 + 1;
    v6 = (unsigned __int16)(v2 + 1);
    v3[1] = v6 + 3;
    v7 = malloc_type_malloc(v6 + 3, 0x100004077774924uLL);
    *v4 = v7;
    if (v7)
    {
      v8 = v7;
      bzero(v7, v6 + 3);
      *v8 = 96;
      v8[1] = HIBYTE(v5);
      v8[2] = v5;
      memcpy(v8 + 3, zonename, v6);
    }
    else
    {
      free(v4);
      return 0;
    }
  }
  return (token_t *)v4;
}

token_t *__cdecl au_to_identity(uint32_t signer_type, const char *signing_id, u_char signing_id_trunc, const char *team_id, u_char team_id_trunc, uint8_t *cdhash, uint16_t cdhash_len)
{
  unsigned int v7;
  size_t v11;
  size_t v12;
  size_t v13;
  token_t *v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;

  v7 = cdhash_len;
  if (!signing_id)
  {
    v11 = 0;
    if (team_id)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = strlen(signing_id);
  if (!team_id)
    goto LABEL_5;
LABEL_3:
  v12 = strlen(team_id);
LABEL_6:
  v13 = v11 + v7 + v12 + 15;
  v14 = (token_t *)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  *((_QWORD *)v14 + 1) = v13;
  v15 = malloc_type_malloc(v13, 0x100004077774924uLL);
  *(_QWORD *)v14 = v15;
  bzero(v15, v13);
  *v15 = -19;
  v15[1] = HIBYTE(signer_type);
  v15[2] = BYTE2(signer_type);
  v15[3] = BYTE1(signer_type);
  v15[4] = signer_type;
  v15[5] = (unsigned __int16)(v11 + 1) >> 8;
  v15[6] = v11 + 1;
  memcpy(v15 + 7, signing_id, v11);
  v16 = &v15[v11 + 7];
  *v16 = 0;
  v16[1] = signing_id_trunc;
  v16[2] = (unsigned __int16)(v12 + 1) >> 8;
  v16[3] = v12 + 1;
  v17 = v16 + 4;
  memcpy(v16 + 4, team_id, v12);
  v18 = &v17[v12];
  *v18 = 0;
  v18[1] = team_id_trunc;
  v18[2] = BYTE1(v7);
  v18[3] = v7;
  memcpy(&v17[v12 + 4], cdhash, v7);
  return v14;
}

token_t *__cdecl au_to_header32_tm(int rec_size, au_event_t e_type, au_emod_t e_mod, timeval tm)
{
  __darwin_suseconds_t tv_usec;
  int tv_sec;
  _QWORD *v9;
  _QWORD *v10;
  _BYTE *v11;

  tv_usec = tm.tv_usec;
  tv_sec = tm.tv_sec;
  v9 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v10 = v9;
  if (v9)
  {
    v9[1] = 18;
    v11 = malloc_type_malloc(0x12uLL, 0x100004077774924uLL);
    *v10 = v11;
    if (v11)
    {
      *v11 = 20;
      v11[1] = HIBYTE(rec_size);
      v11[2] = BYTE2(rec_size);
      v11[3] = BYTE1(rec_size);
      v11[4] = rec_size;
      v11[5] = 11;
      v11[6] = HIBYTE(e_type);
      v11[7] = e_type;
      v11[8] = HIBYTE(e_mod);
      v11[9] = e_mod;
      v11[10] = HIBYTE(tv_sec);
      v11[11] = BYTE2(tv_sec);
      v11[12] = BYTE1(tv_sec);
      v11[13] = tv_sec;
      v11[14] = (tv_usec / 1000) >> 24;
      v11[15] = (tv_usec / 1000) >> 16;
      v11[16] = (unsigned __int16)(tv_usec / 1000) >> 8;
      v11[17] = tv_usec / 1000;
    }
    else
    {
      free(v10);
      return 0;
    }
  }
  return (token_t *)v10;
}

token_t *__cdecl au_to_header32_ex_tm(int rec_size, au_event_t e_type, au_emod_t e_mod, timeval tm, auditinfo_addr *aia)
{
  u_int32_t at_type;
  __darwin_suseconds_t tv_usec;
  int tv_sec;
  char **v13;
  char **v14;
  char *v15;
  char *v16;
  u_int32_t *at_addr;
  size_t v18;
  uint64_t v19;
  char *v20;

  at_type = aia->ai_termid.at_type;
  if (at_type != 16 && at_type != 4)
    return 0;
  tv_usec = tm.tv_usec;
  tv_sec = tm.tv_sec;
  v13 = (char **)malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v14 = v13;
  if (v13)
  {
    v13[1] = (char *)(aia->ai_termid.at_type + 22);
    v15 = (char *)malloc_type_malloc(aia->ai_termid.at_type + 22, 0x100004077774924uLL);
    *v14 = v15;
    if (!v15)
    {
      free(v14);
      return 0;
    }
    v16 = v15;
    bzero(v15, aia->ai_termid.at_type + 22);
    *v16 = 21;
    v16[1] = HIBYTE(rec_size);
    v16[2] = BYTE2(rec_size);
    v16[3] = BYTE1(rec_size);
    v16[4] = rec_size;
    v16[5] = 11;
    v16[6] = HIBYTE(e_type);
    v16[7] = e_type;
    v16[8] = HIBYTE(e_mod);
    v16[9] = e_mod;
    *(_DWORD *)(v16 + 10) = bswap32(aia->ai_termid.at_type);
    at_addr = aia->ai_termid.at_addr;
    if (aia->ai_termid.at_type == 16)
      v18 = 16;
    else
      v18 = 4;
    if (aia->ai_termid.at_type == 16)
      v19 = 30;
    else
      v19 = 18;
    memcpy(v16 + 14, at_addr, v18);
    v20 = &v16[v19];
    *v20 = HIBYTE(tv_sec);
    v20[1] = BYTE2(tv_sec);
    v20[2] = BYTE1(tv_sec);
    v20[3] = tv_sec;
    v20[4] = (tv_usec / 1000) >> 24;
    v20[5] = (tv_usec / 1000) >> 16;
    v20[6] = (unsigned __int16)(tv_usec / 1000) >> 8;
    v20[7] = tv_usec / 1000;
  }
  return (token_t *)v14;
}

token_t *__cdecl au_to_header64_tm(int rec_size, au_event_t e_type, au_emod_t e_mod, timeval tm)
{
  __darwin_suseconds_t tv_usec;
  __darwin_time_t tv_sec;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;

  tv_usec = tm.tv_usec;
  tv_sec = tm.tv_sec;
  v9 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v10 = v9;
  if (v9)
  {
    v9[1] = 26;
    v11 = (char *)malloc_type_malloc(0x1AuLL, 0x100004077774924uLL);
    *v10 = v11;
    if (v11)
    {
      *v11 = 116;
      v11[1] = HIBYTE(rec_size);
      v11[2] = BYTE2(rec_size);
      v11[3] = BYTE1(rec_size);
      v11[4] = rec_size;
      v11[5] = 11;
      v11[6] = HIBYTE(e_type);
      v11[7] = e_type;
      v11[8] = HIBYTE(e_mod);
      v11[9] = e_mod;
      v11[10] = HIBYTE(tv_sec);
      v11[11] = BYTE6(tv_sec);
      v11[12] = BYTE5(tv_sec);
      v11[13] = BYTE4(tv_sec);
      v11[14] = BYTE3(tv_sec);
      v11[15] = BYTE2(tv_sec);
      v11[16] = BYTE1(tv_sec);
      v11[17] = tv_sec;
      *(_DWORD *)(v11 + 18) = 0;
      v11[22] = (tv_usec / 1000) >> 24;
      v11[23] = (tv_usec / 1000) >> 16;
      v11[24] = (unsigned __int16)(tv_usec / 1000) >> 8;
      v11[25] = tv_usec / 1000;
    }
    else
    {
      free(v10);
      return 0;
    }
  }
  return (token_t *)v10;
}

token_t *__cdecl au_to_header32_ex(int rec_size, au_event_t e_type, au_emod_t e_mod)
{
  auditinfo_addr_t v7;
  timeval v8;

  v8.tv_sec = 0;
  *(_QWORD *)&v8.tv_usec = 0;
  memset(&v7, 0, sizeof(v7));
  if (gettimeofday(&v8, 0) == -1)
    return 0;
  if (audit_get_kaudit(&v7, 0x30uLL))
  {
    if (*__error() == 78)
      return au_to_header32_tm(rec_size, e_type, e_mod, v8);
    return 0;
  }
  return au_to_header32_ex_tm(rec_size, e_type, e_mod, v8, &v7);
}

token_t *__cdecl au_to_header32(int rec_size, au_event_t e_type, au_emod_t e_mod)
{
  timeval v7;

  v7.tv_sec = 0;
  *(_QWORD *)&v7.tv_usec = 0;
  if (gettimeofday(&v7, 0) == -1)
    return 0;
  else
    return au_to_header32_tm(rec_size, e_type, e_mod, v7);
}

token_t *__cdecl au_to_header64(int rec_size, au_event_t e_type, au_emod_t e_mod)
{
  timeval v7;

  v7.tv_sec = 0;
  *(_QWORD *)&v7.tv_usec = 0;
  if (gettimeofday(&v7, 0) == -1)
    return 0;
  else
    return au_to_header64_tm(rec_size, e_type, e_mod, v7);
}

token_t *__cdecl au_to_trailer(int rec_size)
{
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;

  v2 = malloc_type_malloc(0x20uLL, 0x10B00406046BCCBuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 7;
    v4 = malloc_type_malloc(7uLL, 0x100004077774924uLL);
    *v3 = v4;
    if (v4)
    {
      *(_WORD *)v4 = -20205;
      v4[2] = 5;
      v4[3] = HIBYTE(rec_size);
      v4[4] = BYTE2(rec_size);
      v4[5] = BYTE1(rec_size);
      v4[6] = rec_size;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return (token_t *)v3;
}

token_t *__cdecl au_to_kevent(kevent *kev)
{
  return 0;
}

void setauuser(void)
{
  pthread_mutex_lock(&mutex_4);
  if (fp_2)
    fseek((FILE *)fp_2, 0, 0);
  pthread_mutex_unlock(&mutex_4);
}

void endauuser(void)
{
  pthread_mutex_lock(&mutex_4);
  if (fp_2)
  {
    fclose((FILE *)fp_2);
    fp_2 = 0;
  }
  pthread_mutex_unlock(&mutex_4);
}

au_user_ent *__cdecl getauuserent_r(au_user_ent *u)
{
  au_user_ent *v2;

  pthread_mutex_lock(&mutex_4);
  v2 = (au_user_ent *)getauuserent_r_locked((uint64_t)u);
  pthread_mutex_unlock(&mutex_4);
  return v2;
}

void *getauuserent_r_locked(uint64_t a1)
{
  void *result;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *__lasts;

  if (fp_2 || (result = fopen("/etc/security/audit_user", "r"), (fp_2 = (uint64_t)result) != 0))
  {
    while (1)
    {
      result = fgets(&linestr_2, 256, (FILE *)fp_2);
      if (!result)
        break;
      v3 = strrchr(&linestr_2, 10);
      if (v3)
        *v3 = 0;
      if (linestr_2 != 35)
      {
        __lasts = 0;
        v4 = strtok_r(&linestr_2, ":", &__lasts);
        v5 = strtok_r(0, ":", &__lasts);
        v6 = strtok_r(0, ":", &__lasts);
        result = 0;
        if (v4 && v5 && v6)
        {
          if (strlen(v4) > 0x31)
            return 0;
          strlcpy(*(char **)a1, v4, 0x32uLL);
          if (getauditflagsbin(v5, (au_mask_t *)(a1 + 8)) == -1)
          {
            return 0;
          }
          else if (getauditflagsbin(v6, (au_mask_t *)(a1 + 16)) == -1)
          {
            return 0;
          }
          else
          {
            return (void *)a1;
          }
        }
        return result;
      }
    }
  }
  return result;
}

au_user_ent *getauuserent(void)
{
  au_user_ent *v0;

  qword_1EF6D3BB8 = 0;
  unk_1EF6D3BC0 = 0;
  getauuserent_user_ent_name = 0u;
  unk_1EF6D3B88 = 0u;
  xmmword_1EF6D3B98 = 0u;
  word_1EF6D3BA8 = 0;
  getauuserent_u = (uint64_t)&getauuserent_user_ent_name;
  pthread_mutex_lock(&mutex_4);
  v0 = (au_user_ent *)getauuserent_r_locked((uint64_t)&getauuserent_u);
  pthread_mutex_unlock(&mutex_4);
  return v0;
}

au_user_ent *__cdecl getauusernam_r(au_user_ent *u, const char *name)
{
  if (!name)
    return 0;
  pthread_mutex_lock(&mutex_4);
  if (fp_2)
    fseek((FILE *)fp_2, 0, 0);
  while (getauuserent_r_locked((uint64_t)u))
  {
    if (!strcmp(name, u->au_name))
      goto LABEL_9;
  }
  u = 0;
LABEL_9:
  pthread_mutex_unlock(&mutex_4);
  return u;
}

au_user_ent *__cdecl getauusernam(const char *name)
{
  qword_1EF6D3C08 = 0;
  unk_1EF6D3C10 = 0;
  getauusernam_user_ent_name = 0u;
  unk_1EF6D3BD8 = 0u;
  xmmword_1EF6D3BE8 = 0u;
  word_1EF6D3BF8 = 0;
  getauusernam_u = (uint64_t)&getauusernam_user_ent_name;
  return getauusernam_r((au_user_ent *)&getauusernam_u, name);
}

int au_user_mask(char *username, au_mask_t *mask_p)
{
  au_user_ent *v3;
  int v4;
  au_user_ent u;
  _OWORD v7[3];
  __int16 v8;
  char auditstr[257];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  u.au_always = 0;
  u.au_never = 0;
  memset(v7, 0, sizeof(v7));
  v8 = 0;
  u.au_name = (char *)v7;
  v3 = getauusernam_r(&u, username);
  if (v3)
  {
    v4 = getfauditflags(&v3->au_always, &v3->au_never, mask_p);
  }
  else
  {
    if (getacflg(auditstr, 256))
      return -1;
    v4 = getauditflagsbin(auditstr, mask_p);
  }
  if (v4 == -1)
    return -1;
  else
    return 0;
}

int getfauditflags(au_mask_t *usremask, au_mask_t *usrdmask, au_mask_t *lastmask)
{
  int result;
  unsigned int am_failure;
  unsigned int v8;
  unsigned int v9;
  char auditstr[257];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = -1;
  if (usremask && usrdmask && lastmask)
  {
    *lastmask = 0;
    if (getacflg(auditstr, 256) || !getauditflagsbin(auditstr, lastmask))
    {
      result = 0;
      am_failure = lastmask->am_failure;
      v8 = lastmask->am_success | usremask->am_success;
      lastmask->am_success = v8;
      v9 = am_failure | usremask->am_failure;
      lastmask->am_failure = v9;
      lastmask->am_success = v8 & ~usrdmask->am_success;
      lastmask->am_failure = v9 & ~usrdmask->am_failure;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

int audit_submit(__int16 au_event, au_id_t auid, char status, int reterr, const char *fmt, ...)
{
  int v7;
  int v10;
  int *v11;
  int v13;
  int v14;
  u_int32_t at_type;
  pid_t v16;
  uid_t v17;
  gid_t v18;
  uid_t v19;
  gid_t v20;
  token_t *v21;
  int *v22;
  int *v23;
  uid_t v24;
  gid_t v25;
  uid_t v26;
  gid_t v27;
  token_t *v28;
  u_char v29;
  token_t *v30;
  int *v31;
  char *v32;
  au_tid_t v33;
  auditinfo_addr v34;
  va_list v35;
  int cond;
  char __str[256];
  uint64_t v38;
  va_list va;

  va_start(va, fmt);
  v7 = status;
  v38 = *MEMORY[0x1E0C80C00];
  cond = 0;
  v35 = 0;
  memset(&v34, 0, sizeof(v34));
  v33 = 0;
  if (!audit_get_cond(&cond))
  {
    if (cond == 2)
      return 0;
    v13 = au_open();
    if (v13 < 0)
    {
      v10 = *__error();
      v22 = __error();
      strerror(*v22);
      syslog(35, "audit: au_open failed: %s");
      goto LABEL_4;
    }
    v14 = v13;
    if (getaudit_addr(&v34, 48) < 0)
    {
      v10 = *__error();
      v23 = __error();
      strerror(*v23);
      syslog(35, "audit: getaudit_addr failed: %s");
      goto LABEL_4;
    }
    at_type = v34.ai_termid.at_type;
    v16 = getpid();
    if (at_type == 16)
    {
      v17 = geteuid();
      v18 = getegid();
      v19 = getuid();
      v20 = getgid();
      v21 = au_to_subject_ex(auid, v17, v18, v19, v20, v16, v16, (au_tid_addr_t *)((unint64_t)&v34 | 0xC));
    }
    else
    {
      v33.port = v34.ai_termid.at_port;
      v33.machine = v34.ai_termid.at_addr[0];
      v24 = geteuid();
      v25 = getegid();
      v26 = getuid();
      v27 = getgid();
      v21 = au_to_subject32(auid, v24, v25, v26, v27, v16, v16, &v33);
    }
    if (v21)
    {
      if (au_write(v14, v21) < 0)
        goto LABEL_25;
      if (fmt)
      {
        va_copy(v35, va);
        vsnprintf(__str, 0x100uLL, fmt, va);
        v28 = au_to_text(__str);
        if (!v28)
        {
          syslog(35, "audit: failed to generate text token");
          goto LABEL_24;
        }
        if (au_write(v14, v28) < 0)
          goto LABEL_25;
      }
      v29 = au_errno_to_bsm(v7);
      v30 = au_to_return32(v29, reterr);
      if (v30)
      {
        if ((au_write(v14, v30) & 0x80000000) == 0)
        {
          if (au_close(v14, 1, au_event) < 0)
          {
            v10 = *__error();
            syslog(35, "audit: record not committed");
            goto LABEL_4;
          }
          return 0;
        }
LABEL_25:
        v10 = *__error();
        v31 = __error();
        v32 = strerror(*v31);
        syslog(35, "audit: au_write failed: %s", v32);
        au_close(v14, 0, au_event);
        goto LABEL_4;
      }
      syslog(35, "audit: unable to build return token");
    }
    else
    {
      syslog(35, "audit: unable to build subject token");
    }
LABEL_24:
    au_close(v14, 0, au_event);
    v10 = 1;
    goto LABEL_4;
  }
  if (*__error() != 78)
  {
    v10 = *__error();
    v11 = __error();
    strerror(*v11);
    syslog(35, "audit: auditon failed: %s");
LABEL_4:
    *__error() = v10;
    return -1;
  }
  return 0;
}

int audit_get_cond(int *cond)
{
  int v2;
  uint64_t v4;

  v2 = auditon(37, cond, 4);
  if (v2 && *__error() == 22)
  {
    v4 = *cond;
    v2 = auditon(20, &v4, 8);
    *cond = v4;
  }
  return v2;
}

int audit_set_terminal_id(au_tid_t *tid)
{
  int result;

  if (!tid)
    return -66049;
  result = audit_set_terminal_port((dev_t *)tid);
  if (!result)
    return audit_set_terminal_host(&tid->machine);
  return result;
}

uint64_t audit_set_terminal_port(dev_t *a1)
{
  uint64_t v2;
  int *v3;
  int *v4;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  *a1 = -1;
  if (!fstat(0, &v6))
    goto LABEL_5;
  if (*__error() != 9)
  {
    v2 = 4294901248;
    v4 = __error();
    strerror(*v4);
    syslog(3, "fstat() failed (%s)");
    return v2;
  }
  if (stat("/dev/console", &v6))
  {
    v2 = 4294901248;
    v3 = __error();
    strerror(*v3);
    syslog(3, "stat() failed (%s)");
  }
  else
  {
LABEL_5:
    v2 = 0;
    *a1 = v6.st_rdev;
  }
  return v2;
}

int audit_set_terminal_id_ex(au_tid_addr_t *tid)
{
  int result;

  if (!tid)
    return -66049;
  result = audit_set_terminal_port(&tid->at_port);
  if (!result)
    return audit_set_terminal_host(tid->at_addr);
  return result;
}

int audit_write(__int16 event_code, token_t *subject, token_t *misctok, char retval, int errcode)
{
  int v10;
  int v11;
  token_t *v12;
  token_t *v13;
  int v14;

  v10 = au_open();
  if (v10 == -1)
  {
    v14 = -66046;
    au_free_token(subject);
    au_free_token(misctok);
    syslog(3, "%s: au_open() failed");
  }
  else
  {
    v11 = v10;
    if (subject && au_write(v10, subject) == -1)
    {
      au_free_token(subject);
      au_free_token(misctok);
      au_close(v11, 0, event_code);
      v14 = -66044;
      syslog(3, "%s: write of subject failed");
    }
    else if (misctok && au_write(v11, misctok) == -1)
    {
      au_free_token(misctok);
      au_close(v11, 0, event_code);
      v14 = -66043;
      syslog(3, "%s: write of caller token failed");
    }
    else
    {
      v12 = au_to_return32(retval, errcode);
      if (v12)
      {
        v13 = v12;
        if (au_write(v11, v12) == -1)
        {
          au_free_token(v13);
          au_close(v11, 0, event_code);
          v14 = -66041;
          syslog(3, "%s: write of return code failed");
        }
        else if (au_close(v11, 1, event_code) < 0)
        {
          v14 = -66040;
          syslog(3, "%s: au_close() failed");
        }
        else
        {
          return 0;
        }
      }
      else
      {
        au_close(v11, 0, event_code);
        v14 = -66042;
        syslog(3, "%s: au_to_return32() failed");
      }
    }
  }
  return v14;
}

int audit_write_success(__int16 event_code, token_t *misctok, au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_t *tid)
{
  token_t *v12;

  v12 = au_to_subject32(auid, euid, egid, ruid, rgid, pid, sid, tid);
  if (v12)
    return audit_write(event_code, v12, misctok, 0, 0);
  syslog(3, "%s: au_to_subject32() failed", "audit_write_success()");
  return -66045;
}

int audit_write_success_ex(__int16 event_code, token_t *misctok, au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_addr_t *tid)
{
  token_t *v12;

  v12 = au_to_subject32_ex(auid, euid, egid, ruid, rgid, pid, sid, tid);
  if (v12)
    return audit_write(event_code, v12, misctok, 0, 0);
  syslog(3, "%s: au_to_subject32_ex() failed", "audit_write_success_ex()");
  return -66045;
}

int audit_write_success_self(__int16 event_code, token_t *misctok)
{
  token_t *v4;

  v4 = au_to_me();
  if (v4)
    return audit_write(event_code, v4, misctok, 0, 0);
  syslog(3, "%s: au_to_me() failed", "audit_write_success_self()");
  return -66045;
}

int audit_write_failure(__int16 event_code, char *errmsg, int errret, au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_t *tid)
{
  token_t *v14;
  token_t *v15;
  token_t *v16;
  int v18;

  v14 = au_to_subject32(auid, euid, egid, ruid, rgid, pid, sid, tid);
  if (v14)
  {
    v15 = v14;
    v16 = au_to_text(errmsg);
    if (v16)
      return audit_write(event_code, v15, v16, -1, errret);
    au_free_token(v15);
    syslog(3, "%s: au_to_text() failed", "audit_write_failure()");
    return -66039;
  }
  else
  {
    v18 = -66045;
    syslog(3, "%s: au_to_subject32() failed", "audit_write_failure()");
  }
  return v18;
}

int audit_write_failure_ex(__int16 event_code, char *errmsg, int errret, au_id_t auid, uid_t euid, gid_t egid, uid_t ruid, gid_t rgid, pid_t pid, au_asid_t sid, au_tid_addr_t *tid)
{
  token_t *v14;
  token_t *v15;
  token_t *v16;
  int v18;

  v14 = au_to_subject32_ex(auid, euid, egid, ruid, rgid, pid, sid, tid);
  if (v14)
  {
    v15 = v14;
    v16 = au_to_text(errmsg);
    if (v16)
      return audit_write(event_code, v15, v16, -1, errret);
    au_free_token(v15);
    syslog(3, "%s: au_to_text() failed", "audit_write_failure_ex()");
    return -66039;
  }
  else
  {
    v18 = -66045;
    syslog(3, "%s: au_to_subject32_ex() failed", "audit_write_failure_ex()");
  }
  return v18;
}

int audit_write_failure_self(__int16 event_code, char *errmsg, int errret)
{
  token_t *v6;
  token_t *v7;
  token_t *v8;
  int v10;

  v6 = au_to_me();
  if (v6)
  {
    v7 = v6;
    v8 = au_to_text(errmsg);
    if (v8)
      return audit_write(event_code, v7, v8, -1, errret);
    au_free_token(v7);
    syslog(3, "%s: au_to_text() failed", "audit_write_failure_self()");
    return -66039;
  }
  else
  {
    v10 = -66045;
    syslog(3, "%s: au_to_me() failed", "audit_write_failure_self()");
  }
  return v10;
}

int audit_write_failure_na(__int16 event_code, char *errmsg, int errret, uid_t euid, gid_t egid, pid_t pid, au_tid_t *tid)
{
  return audit_write_failure(event_code, errmsg, errret, 0xFFFFFFFF, euid, egid, 0xFFFFFFFF, 0xFFFFFFFF, pid, -1, tid);
}

int audit_write_failure_na_ex(__int16 event_code, char *errmsg, int errret, uid_t euid, gid_t egid, pid_t pid, au_tid_addr_t *tid)
{
  return audit_write_failure_ex(event_code, errmsg, errret, 0xFFFFFFFF, euid, egid, 0xFFFFFFFF, 0xFFFFFFFF, pid, -1, tid);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return atoken->val[4];
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return atoken->val[6];
}

int audit_set_cond(int *cond)
{
  int v2;
  uint64_t v4;

  v2 = auditon(38, cond, 4);
  if (v2 && *__error() == 22)
  {
    v4 = *cond;
    v2 = auditon(21, &v4, 8);
    *cond = v4;
  }
  return v2;
}

int audit_get_policy(int *policy)
{
  int v2;
  uint64_t v4;

  v2 = auditon(33, policy, 4);
  if (v2 && *__error() == 22)
  {
    v4 = *policy;
    v2 = auditon(2, &v4, 8);
    *policy = v4;
  }
  return v2;
}

int audit_set_policy(int *policy)
{
  int v2;
  uint64_t v4;

  v2 = auditon(34, policy, 4);
  if (v2 && *__error() == 22)
  {
    v4 = *policy;
    v2 = auditon(3, &v4, 8);
    *policy = v4;
  }
  return v2;
}

int audit_get_sflags(uint64_t *flags)
{
  return auditon(39, flags, 8);
}

int audit_set_sflags(uint64_t flags)
{
  uint64_t v2;

  v2 = flags;
  return auditon(40, &v2, 8);
}

int audit_get_sflags_mask(const char *which, uint64_t *mask)
{
  *__error() = 78;
  return -1;
}

int audit_set_sflags_mask(const char *which, uint64_t mask)
{
  *__error() = 78;
  return -1;
}

int audit_get_qctrl(au_qctrl_t *qctrl, size_t sz)
{
  int v3;
  uint64_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v8;
  int32x4_t v9;
  uint64_t v10;

  if (sz == 20)
  {
    v3 = auditon(35, qctrl, 20);
    if (v3 && *__error() == 22)
    {
      v10 = 0;
      v4 = *(_QWORD *)&qctrl->aq_bufsz;
      v5.i64[0] = (int)*(_QWORD *)&qctrl->aq_hiwater;
      v5.i64[1] = (int)HIDWORD(*(_QWORD *)&qctrl->aq_hiwater);
      v6 = v5;
      v5.i64[0] = (int)v4;
      v5.i64[1] = SHIDWORD(v4);
      v8 = v6;
      v9 = v5;
      LODWORD(v10) = qctrl->aq_minfree;
      v3 = auditon(6, &v8, 40);
      *(int32x4_t *)&qctrl->aq_hiwater = vuzp1q_s32(v8, v9);
      qctrl->aq_minfree = v10;
    }
  }
  else
  {
    *__error() = 22;
    return -1;
  }
  return v3;
}

int audit_set_qctrl(au_qctrl_t *qctrl, size_t sz)
{
  int v3;
  uint64_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v8;
  int32x4_t v9;
  uint64_t v10;

  if (sz == 20)
  {
    v3 = auditon(36, qctrl, 20);
    if (v3 && *__error() == 22)
    {
      v10 = 0;
      v4 = *(_QWORD *)&qctrl->aq_bufsz;
      v5.i64[0] = (int)*(_QWORD *)&qctrl->aq_hiwater;
      v5.i64[1] = (int)HIDWORD(*(_QWORD *)&qctrl->aq_hiwater);
      v6 = v5;
      v5.i64[0] = (int)v4;
      v5.i64[1] = SHIDWORD(v4);
      v8 = v6;
      v9 = v5;
      LODWORD(v10) = qctrl->aq_minfree;
      v3 = auditon(7, &v8, 40);
      *(int32x4_t *)&qctrl->aq_hiwater = vuzp1q_s32(v8, v9);
      qctrl->aq_minfree = v10;
    }
  }
  else
  {
    *__error() = 22;
    return -1;
  }
  return v3;
}

int audit_send_trigger(int *trigger)
{
  return auditon(31, trigger, 4);
}

int audit_get_kaudit(auditinfo_addr_t *aia, size_t sz)
{
  if (sz == 48)
    return auditon(29, aia, 48);
  *__error() = 22;
  return -1;
}

int audit_set_kaudit(auditinfo_addr_t *aia, size_t sz)
{
  if (sz == 48)
    return auditon(30, aia, 48);
  *__error() = 22;
  return -1;
}

int audit_get_class(au_evclass_map_t *evc_map, size_t sz)
{
  if (sz == 8)
    return auditon(22, evc_map, 8);
  *__error() = 22;
  return -1;
}

int audit_set_class(au_evclass_map_t *evc_map, size_t sz)
{
  if (sz == 8)
    return auditon(23, evc_map, 8);
  *__error() = 22;
  return -1;
}

int audit_get_kmask(au_mask_t *kmask, size_t sz)
{
  if (sz == 8)
    return auditon(4, kmask, 8);
  *__error() = 22;
  return -1;
}

int audit_set_kmask(au_mask_t *kmask, size_t sz)
{
  if (sz == 8)
    return auditon(5, kmask, 8);
  *__error() = 22;
  return -1;
}

int audit_get_fsize(au_fstat_t *fstat, size_t sz)
{
  if (sz == 16)
    return auditon(27, fstat, 16);
  *__error() = 22;
  return -1;
}

int audit_set_fsize(au_fstat_t *fstat, size_t sz)
{
  if (sz == 16)
    return auditon(26, fstat, 16);
  *__error() = 22;
  return -1;
}

int audit_set_pmask(auditpinfo_t *api, size_t sz)
{
  if (sz == 28)
    return auditon(25, api, 28);
  *__error() = 22;
  return -1;
}

int audit_get_pinfo(auditpinfo_t *api, size_t sz)
{
  if (sz == 28)
    return auditon(24, api, 28);
  *__error() = 22;
  return -1;
}

int audit_get_pinfo_addr(auditpinfo_addr_t *apia, size_t sz)
{
  if (sz == 56)
    return auditon(28, apia, 56);
  *__error() = 22;
  return -1;
}

int audit_get_sinfo_addr(auditinfo_addr_t *aia, size_t sz)
{
  if (sz == 48)
    return auditon(32, aia, 48);
  *__error() = 22;
  return -1;
}

int audit_get_stat(au_stat_t *stats, size_t sz)
{
  if (sz == 56)
    return auditon(12, stats, 56);
  *__error() = 22;
  return -1;
}

int audit_set_stat(au_stat_t *stats, size_t sz)
{
  if (sz == 56)
    return auditon(12, stats, 56);
  *__error() = 22;
  return -1;
}

int audit_get_cwd(char *path, size_t sz)
{
  return auditon(8, path, sz);
}

int audit_get_car(char *path, size_t sz)
{
  return auditon(9, path, sz);
}

int audit_get_ctlmode(au_ctlmode_t *mode, size_t sz)
{
  if (sz == 1)
    return auditon(41, mode, 1);
  *__error() = 22;
  return -1;
}

int audit_get_expire_after(au_expire_after_t *expire, size_t sz)
{
  if (sz == 24)
    return auditon(43, expire, 24);
  *__error() = 22;
  return -1;
}

au_sdev_handle_t *__cdecl au_sdev_open(int flags)
{
  au_sdev_handle_t *v2;
  FILE *v3;
  int v4;
  int v5;
  int v7;
  int v8;

  v2 = (au_sdev_handle_t *)malloc_type_malloc(0x18uLL, 0x103004013764637uLL);
  if (v2)
  {
    v3 = fopen("/dev/auditsessions", "r");
    v2->ash_fp = v3;
    if (!v3)
    {
LABEL_8:
      free(v2);
      return 0;
    }
    v2->ash_buf = 0;
    *(_QWORD *)&v2->ash_reclen = 0;
    if ((flags & 0x10000) != 0 && (v8 = 1, v4 = fileno(v3), ioctl(v4, 0x80045365uLL, &v8) < 0)
      || (flags & 1) != 0 && (v7 = 1, v5 = fileno(v2->ash_fp), ioctl(v5, 0x8004667EuLL, &v7) < 0))
    {
      fclose(v2->ash_fp);
      goto LABEL_8;
    }
  }
  return v2;
}

int au_sdev_close(au_sdev_handle_t *ash)
{
  int v2;
  u_char *ash_buf;

  v2 = fclose(ash->ash_fp);
  ash_buf = ash->ash_buf;
  if (ash_buf)
    free(ash_buf);
  free(ash);
  return v2;
}

int au_sdev_fd(au_sdev_handle_t *ash)
{
  return fileno(ash->ash_fp);
}

int au_sdev_read_aia(au_sdev_handle_t *ash, int *event, auditinfo_addr_t *aia_p)
{
  u_char **p_ash_buf;
  int ash_bytesread;
  size_t v8;
  u_char *v9;
  au_asid_t v10;
  __int128 v11;
  au_asid_t dev;
  int result;
  FILE *ash_fp;
  u_char v15;
  u_char *v16;
  u_char *v17;
  int ash_reclen;
  int v19;
  tokenstr_t v20;

  *event = 0;
  *(_OWORD *)&aia_p->ai_termid.at_type = 0u;
  *(_OWORD *)&aia_p->ai_termid.at_addr[3] = 0u;
  *(_OWORD *)&aia_p->ai_auid = 0u;
  p_ash_buf = &ash->ash_buf;
  if (ash->ash_buf)
  {
    LODWORD(v8) = ash->ash_reclen;
    ash_bytesread = ash->ash_bytesread;
    goto LABEL_3;
  }
  ash_fp = ash->ash_fp;
  do
  {
    v15 = fgetc(ash_fp);
    if (ferror(ash_fp))
      goto LABEL_35;
  }
  while (v15 - 20 >= 2 && v15 != 121 && v15 != 116);
  *(_DWORD *)&v20.id = 0;
  if (fread(&v20, 1uLL, 4uLL, ash_fp) <= 3)
  {
LABEL_34:
    if (ferror(ash_fp))
    {
LABEL_35:
      clearerr(ash_fp);
LABEL_38:
      result = -1;
      ash->ash_reclen = -1;
      return result;
    }
LABEL_37:
    *__error() = 22;
    goto LABEL_38;
  }
  v8 = bswap32(*(unsigned int *)&v20.id);
  if (v8 <= 4)
    goto LABEL_37;
  v16 = (u_char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  *p_ash_buf = v16;
  if (!v16)
    goto LABEL_38;
  v17 = v16;
  bzero(v16, v8);
  *v17 = v15;
  v17[1] = BYTE3(v8);
  v17[2] = BYTE2(v8);
  v17[3] = BYTE1(v8);
  v17[4] = v8;
  if (fread(v17 + 5, 1uLL, (v8 - 5), ash_fp) < (v8 - 5))
  {
    free(*p_ash_buf);
    goto LABEL_34;
  }
  ash->ash_reclen = v8;
  if ((v8 & 0x80000000) != 0)
    return -1;
  ash_bytesread = 0;
  ash->ash_bytesread = 0;
LABEL_3:
  while (ash_bytesread < (int)v8)
  {
    v9 = &(*p_ash_buf)[ash_bytesread];
    memset(&v20, 0, 512);
    if (au_fetch_tok(&v20, v9, v8 - ash_bytesread))
      return -1;
    if (v20.id <= 0x2Cu)
    {
      switch(v20.id)
      {
        case 0x14u:
          *event = v20.tt.hdr32.e_type;
          break;
        case 0x24u:
          dev = v20.tt.attr32.dev;
          aia_p->ai_auid = v20.tt.attr32.mode;
          aia_p->ai_asid = dev;
          aia_p->ai_termid.at_port = v20.tt.grps.list[6];
          aia_p->ai_termid.at_type = 4;
          v11 = *((_OWORD *)&v20.tt.sockinet_ex32 + 2);
          goto LABEL_13;
        case 0x13u:
          ash_reclen = ash->ash_reclen;
          v19 = ash->ash_bytesread + LODWORD(v20.len);
          ash->ash_bytesread = v19;
          if (ash_reclen != v19)
            return 0;
          free(*p_ash_buf);
          result = 0;
          *p_ash_buf = 0;
          p_ash_buf[1] = 0;
          return result;
      }
    }
    else
    {
      switch(v20.id)
      {
        case '-':
          if (v20.tt.arg32.no == 3)
          {
            if (!strncmp("am_failure", v20.tt.arg32.text, 0xAuLL))
              aia_p->ai_mask.am_failure = v20.tt.arg32.val;
          }
          else if (v20.tt.arg32.no == 2 && !strncmp("am_success", v20.tt.arg32.text, 0xAuLL))
          {
            aia_p->ai_mask.am_success = v20.tt.arg32.val;
          }
          break;
        case 'q':
          if (v20.tt.arg32.no == 1 && !strncmp("sflags", v20.tt.arg64.text, 6uLL))
            aia_p->ai_flags = v20.tt.arg64.val;
          break;
        case 'z':
          v10 = v20.tt.attr32.dev;
          aia_p->ai_auid = v20.tt.attr32.mode;
          aia_p->ai_asid = v10;
          *(_QWORD *)&aia_p->ai_termid.at_port = *(char **)((char *)&v20.tt.execarg.text[2] + 4);
          v11 = *(__int128 *)((char *)&v20.tt.subj64.tid + 4);
LABEL_13:
          *(_OWORD *)aia_p->ai_termid.at_addr = v11;
          break;
      }
    }
    LODWORD(v8) = ash->ash_reclen;
    ash_bytesread = ash->ash_bytesread + LODWORD(v20.len);
    ash->ash_bytesread = ash_bytesread;
  }
  return -2;
}

u_char au_errno_to_bsm(int local_errno)
{
  uint64_t v1;
  int v2;

  v1 = 0;
  while (bsm_errnos[v1 + 1] != local_errno)
  {
    v1 += 4;
    if (v1 == 604)
    {
      LOBYTE(v2) = -6;
      return v2;
    }
  }
  return bsm_errnos[v1];
}

int au_bsm_to_errno(u_char bsm_error, int *errorp)
{
  uint64_t v2;
  int v3;
  int result;

  v2 = 0;
  while (bsm_errnos[v2] != bsm_error)
  {
    v2 += 4;
    if (v2 == 604)
      return -1;
  }
  v3 = bsm_errnos[v2 + 1];
  if (v3 == -600)
    return -1;
  result = 0;
  *errorp = v3;
  return result;
}

const char *__cdecl au_strerror(u_char bsm_error)
{
  int v1;
  uint64_t v2;
  const char *result;
  int v4;

  v1 = bsm_error;
  v2 = 0;
  result = "Unrecognized BSM error";
  while (bsm_errnos[v2] != v1)
  {
    v2 += 4;
    if (v2 == 604)
      return result;
  }
  v4 = bsm_errnos[v2 + 1];
  if (v4 == -600)
    return *(const char **)&bsm_errnos[v2 + 2];
  else
    return strerror(v4);
}

u_short au_fcntl_cmd_to_bsm(int local_fcntl_command)
{
  uint64_t v1;

  v1 = 0;
  while (*(_DWORD *)&bsm_fcntl_cmdtab[v1 + 2] != local_fcntl_command)
  {
    v1 += 4;
    if (v1 == 160)
      return -1;
  }
  return bsm_fcntl_cmdtab[v1];
}

int au_bsm_to_fcntl_cmd(u_short bsm_fcntl_cmd, int *local_fcntl_cmdp)
{
  uint64_t v2;
  int result;

  v2 = 0;
  while ((unsigned __int16)bsm_fcntl_cmdtab[v2] != bsm_fcntl_cmd)
  {
    v2 += 4;
    if (v2 == 160)
      return -1;
  }
  if (v2 * 2)
    return -1;
  result = 0;
  *local_fcntl_cmdp = 0;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

int audit(const void *a1, int a2)
{
  return MEMORY[0x1E0C81698](a1, *(_QWORD *)&a2);
}

int auditon(int a1, void *a2, int a3)
{
  return MEMORY[0x1E0C816B0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void clearerr(FILE *a1)
{
  MEMORY[0x1E0C82648](a1);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C82B88](a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1E0C83388](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
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

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getaudit_addr(auditinfo_addr *a1, int a2)
{
  return MEMORY[0x1E0C83628](a1, *(_QWORD *)&a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C83658]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x1E0C83680](*(_QWORD *)&a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1E0C83960](*(_QWORD *)&a1.s_addr);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

