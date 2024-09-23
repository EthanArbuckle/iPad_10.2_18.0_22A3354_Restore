void xo_no_setlocale()
{
  xo_locale_inited = 1;
}

_DWORD *xo_retain_clear_all()
{
  uint64_t v0;
  uint64_t i;
  _QWORD *v2;
  _QWORD *v3;
  _DWORD *result;

  v0 = xo_retain();
  for (i = 0; i != 64; ++i)
  {
    v2 = *(_QWORD **)(v0 + 8 * i);
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)*v2;
        xo_free();
        v2 = v3;
      }
      while (v3);
    }
    *(_QWORD *)(v0 + 8 * i) = 0;
  }
  result = (_DWORD *)xo_retain_count();
  *result = 0;
  return result;
}

_DWORD *xo_retain_clear()
{
  _DWORD *result;
  uint64_t v1;
  int v2;
  _QWORD *v3;
  _QWORD *v4;

  result = (_DWORD *)xo_retain();
  v3 = &result[2 * v2];
  while (1)
  {
    v4 = v3;
    v3 = (_QWORD *)*v3;
    if (!v3)
      break;
    if (v3[2] == v1)
    {
      *v4 = *v3;
      result = (_DWORD *)xo_retain_count();
      --*result;
      return result;
    }
  }
  return result;
}

uint64_t xo_warn_hc(uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_warn_hcv(a1, a2, 0, a3, &a9);
}

uint64_t xo_warn_hcv(uint64_t result, int a2, int a3, char *__s, va_list a5)
{
  uint64_t v9;
  size_t v10;
  char *v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  size_t v16;
  FILE **v17;
  char *v18;
  uint64_t v19;
  _DWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  _BYTE *v47;
  const char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  size_t v52;
  size_t v53;
  _BYTE *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  va_list v62;
  va_list v63;
  uint64_t v64;

  v9 = result;
  v64 = *MEMORY[0x24BDAC8D0];
  v63 = a5;
  if (result)
  {
    if (a3)
      goto LABEL_3;
LABEL_9:
    if (!__s)
      return result;
    goto LABEL_10;
  }
  if (!*(_DWORD *)xo_default_inited())
    xo_default_init();
  result = xo_default_handle();
  v9 = result;
  if (!a3)
    goto LABEL_9;
LABEL_3:
  if (!__s || (*(_QWORD *)v9 & 0x10) == 0)
    return result;
LABEL_10:
  v10 = strlen(__s);
  v11 = (char *)xo_program;
  if (xo_program)
  {
    v12 = strlen((const char *)xo_program);
    MEMORY[0x24BDAC7A8]();
    v14 = (char *)&v61 - v13;
    bzero((char *)&v61 - v13, v15);
    if (v12)
    {
      memcpy(v14, v11, v12);
      *(_WORD *)&v14[v12] = 8250;
      v11 = (char *)(v12 + 2);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    MEMORY[0x24BDAC7A8]();
    v14 = (char *)&v61 - ((v10 + 18) & 0xFFFFFFFFFFFFFFF0);
    bzero(v14, v16);
  }
  memcpy(&v11[(_QWORD)v14], __s, v10);
  v11[v10 + (_QWORD)v14] = 0;
  if ((*(_BYTE *)v9 & 0x80) != 0)
  {
    v19 = *(_QWORD *)(v9 + 72);
    v20 = *(_DWORD **)(v9 + 80);
    if ((unint64_t)v20 + 7 >= v19 + *(_QWORD *)(v9 + 88))
    {
      v21 = ((unint64_t)v20 - v19 + 8198) & 0xFFFFFFFFFFFFE000;
      v22 = xo_realloc(v19, v21);
      v23 = *(_QWORD *)(v9 + 80);
      if (!v22)
        goto LABEL_24;
      v20 = (_DWORD *)(v22 + v23 - *(_QWORD *)(v9 + 72));
      *(_QWORD *)(v9 + 72) = v22;
      *(_QWORD *)(v9 + 80) = v20;
      *(_QWORD *)(v9 + 88) = v21;
    }
    v24 = *(_DWORD *)xo_warn_hcv_err_open;
    *(_DWORD *)((char *)v20 + 3) = *(_DWORD *)&xo_warn_hcv_err_open[3];
    *v20 = v24;
    v23 = *(_QWORD *)(v9 + 80) + 7;
    *(_QWORD *)(v9 + 80) = v23;
LABEL_24:
    v25 = *(_QWORD *)(v9 + 72);
    if (v23 + 9 >= (unint64_t)(v25 + *(_QWORD *)(v9 + 88)))
    {
      v26 = (v23 + 9 - v25 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
      v27 = xo_realloc(v25, v26);
      if (!v27)
        goto LABEL_28;
      v23 = v27 + *(_QWORD *)(v9 + 80) - *(_QWORD *)(v9 + 72);
      *(_QWORD *)(v9 + 72) = v27;
      *(_QWORD *)(v9 + 80) = v23;
      *(_QWORD *)(v9 + 88) = v26;
    }
    v28 = *(_QWORD *)xo_warn_hcv_msg_open;
    *(_BYTE *)(v23 + 8) = xo_warn_hcv_msg_open[8];
    *(_QWORD *)v23 = v28;
    *(_QWORD *)(v9 + 80) += 9;
LABEL_28:
    v62 = v63;
    v29 = *(char **)(v9 + 80);
    v30 = *(_QWORD *)(v9 + 72) - (_QWORD)v29 + *(_QWORD *)(v9 + 88);
    v31 = vsnprintf(v29, v30, v14, v63);
    if (v30 <= v31)
    {
      v32 = *(_QWORD *)(v9 + 72);
      v33 = *(_QWORD *)(v9 + 80) + v31;
      if (v33 >= v32 + *(_QWORD *)(v9 + 88))
      {
        v34 = (v33 - v32 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
        result = xo_realloc(v32, v34);
        if (!result)
          return result;
        v35 = result + *(_QWORD *)(v9 + 80) - *(_QWORD *)(v9 + 72);
        *(_QWORD *)(v9 + 72) = result;
        *(_QWORD *)(v9 + 80) = v35;
        *(_QWORD *)(v9 + 88) = v34;
      }
      v63 = v62;
      v31 = vsnprintf(*(char **)(v9 + 80), *(_QWORD *)(v9 + 88) - *(_QWORD *)(v9 + 80) + *(_QWORD *)(v9 + 72), __s, v62);
    }
    v36 = xo_escape_xml((uint64_t *)(v9 + 72), v31, 1u);
    v37 = *(_QWORD *)(v9 + 72);
    v38 = (char *)(*(_QWORD *)(v9 + 80) + v36);
    *(_QWORD *)(v9 + 80) = v38;
    if ((unint64_t)(v38 + 10) >= v37 + *(_QWORD *)(v9 + 88))
    {
      v39 = (unint64_t)&v38[-v37 + 8201] & 0xFFFFFFFFFFFFE000;
      v40 = xo_realloc(v37, v39);
      v41 = *(_QWORD **)(v9 + 80);
      if (!v40)
        goto LABEL_37;
      v38 = (char *)v41 + v40 - *(_QWORD *)(v9 + 72);
      *(_QWORD *)(v9 + 72) = v40;
      *(_QWORD *)(v9 + 80) = v38;
      *(_QWORD *)(v9 + 88) = v39;
    }
    v42 = *(_QWORD *)xo_warn_hcv_msg_close;
    *((_WORD *)v38 + 4) = *(_WORD *)&xo_warn_hcv_msg_close[8];
    *(_QWORD *)v38 = v42;
    v41 = (_QWORD *)(*(_QWORD *)(v9 + 80) + 10);
    *(_QWORD *)(v9 + 80) = v41;
LABEL_37:
    v43 = *(_QWORD *)(v9 + 72);
    if ((unint64_t)(v41 + 1) >= v43 + *(_QWORD *)(v9 + 88))
    {
      v44 = ((unint64_t)v41 - v43 + 8199) & 0xFFFFFFFFFFFFE000;
      v45 = xo_realloc(v43, v44);
      if (!v45)
        goto LABEL_41;
      v41 = (_QWORD *)(v45 + *(_QWORD *)(v9 + 80) - *(_QWORD *)(v9 + 72));
      *(_QWORD *)(v9 + 72) = v45;
      *(_QWORD *)(v9 + 80) = v41;
      *(_QWORD *)(v9 + 88) = v44;
    }
    *v41 = xo_warn_hcv_err_close;
    *(_QWORD *)(v9 + 80) += 8;
LABEL_41:
    if (a2 < 0)
    {
      v47 = *(_BYTE **)(v9 + 80);
      goto LABEL_53;
    }
    v46 = strerror(a2);
    v47 = *(_BYTE **)(v9 + 80);
    if (!v46)
      goto LABEL_53;
    v48 = v46;
    v49 = *(_QWORD *)(v9 + 72);
    if ((unint64_t)(v47 + 2) >= v49 + *(_QWORD *)(v9 + 88))
    {
      v50 = (unint64_t)&v47[-v49 + 8193] & 0xFFFFFFFFFFFFE000;
      v51 = xo_realloc(v49, v50);
      v47 = *(_BYTE **)(v9 + 80);
      if (!v51)
      {
LABEL_47:
        v52 = strlen(v48);
        if (!v52)
          goto LABEL_53;
        v53 = v52;
        v54 = &v47[v52];
        v55 = *(_QWORD *)(v9 + 72);
        if ((unint64_t)v54 >= v55 + *(_QWORD *)(v9 + 88))
        {
          v56 = (unint64_t)&v54[-v55 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
          v57 = xo_realloc(v55, v56);
          v47 = *(_BYTE **)(v9 + 80);
          if (!v57)
            goto LABEL_53;
          v47 = &v47[v57 - *(_QWORD *)(v9 + 72)];
          *(_QWORD *)(v9 + 72) = v57;
          *(_QWORD *)(v9 + 80) = v47;
          *(_QWORD *)(v9 + 88) = v56;
        }
        memcpy(v47, v48, v53);
        v47 = (_BYTE *)(*(_QWORD *)(v9 + 80) + v53);
        *(_QWORD *)(v9 + 80) = v47;
LABEL_53:
        v58 = *(_QWORD *)(v9 + 72);
        if ((unint64_t)(v47 + 1) >= v58 + *(_QWORD *)(v9 + 88))
        {
          v59 = (unint64_t)&v47[-v58 + 0x2000] & 0xFFFFFFFFFFFFE000;
          v60 = xo_realloc(v58, v59);
          if (!v60)
            return xo_write((_QWORD *)v9);
          v47 = (_BYTE *)(v60 + *(_QWORD *)(v9 + 80) - *(_QWORD *)(v9 + 72));
          *(_QWORD *)(v9 + 72) = v60;
          *(_QWORD *)(v9 + 80) = v47;
          *(_QWORD *)(v9 + 88) = v59;
        }
        *v47 = 10;
        ++*(_QWORD *)(v9 + 80);
        return xo_write((_QWORD *)v9);
      }
      v47 = &v47[v51 - *(_QWORD *)(v9 + 72)];
      *(_QWORD *)(v9 + 72) = v51;
      *(_QWORD *)(v9 + 80) = v47;
      *(_QWORD *)(v9 + 88) = v50;
    }
    *(_WORD *)v47 = 8250;
    v47 = (_BYTE *)(*(_QWORD *)(v9 + 80) + 2);
    *(_QWORD *)(v9 + 80) = v47;
    goto LABEL_47;
  }
  v17 = (FILE **)MEMORY[0x24BDAC8D8];
  vfprintf((FILE *)*MEMORY[0x24BDAC8D8], v14, a5);
  if ((a2 & 0x80000000) == 0)
  {
    v18 = strerror(a2);
    if (v18)
      fprintf(*v17, ": %s", v18);
  }
  return fputc(10, *v17);
}

uint64_t xo_warn_c(int a1, char *__s, ...)
{
  va_list va;

  va_start(va, __s);
  return xo_warn_hcv(0, a1, 0, __s, va);
}

uint64_t xo_warn(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v10;

  v10 = __error();
  return xo_warn_hcv(0, *v10, 0, a1, &a9);
}

uint64_t xo_warnx(char *__s, ...)
{
  va_list va;

  va_start(va, __s);
  return xo_warn_hcv(0, -1, 0, __s, va);
}

void xo_err(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v11 = __error();
  v12 = xo_warn_hcv(0, *v11, 0, a2, &a9);
  xo_finish(v12, v13, v14, v15, v16, v17, v18, v19);
  exit(a1);
}

uint64_t xo_finish(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_finish_h(0, a2, a3, a4, a5, a6, a7, a8);
}

void xo_errx(int a1, char *__s, ...)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va;

  va_start(va, __s);
  v3 = xo_warn_hcv(0, -1, 0, __s, va);
  xo_finish(v3, v4, v5, v6, v7, v8, v9, v10);
  exit(a1);
}

void xo_errc(int a1, int a2, char *__s, ...)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va;

  va_start(va, __s);
  v4 = xo_warn_hcv(0, a2, 0, __s, va);
  xo_finish(v4, v5, v6, v7, v8, v9, v10, v11);
  exit(a1);
}

uint64_t xo_message_hcv(uint64_t result, int a2, char *__s, va_list a4)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  size_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  size_t v38;
  const char *v39;
  int v40;
  uint64_t v41;
  _BYTE *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54[8];
  va_list v55;
  va_list v56;
  char v57[1024];
  uint64_t v58;

  v7 = result;
  v58 = *MEMORY[0x24BDAC8D0];
  v55 = 0;
  v56 = a4;
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
    v7 = result;
  }
  if (__s && *__s)
  {
    result = strlen(__s);
    v8 = __s[result - 1];
    switch(*(_WORD *)(v7 + 16))
    {
      case 0:
        v9 = xo_printf_v(v7, __s, a4);
        if (v9 >= 1)
        {
          if ((*(_BYTE *)(v7 + 2) & 0x20) != 0)
            *(_QWORD *)(v7 + 376) += v9;
          if ((*(_BYTE *)(v7 + 8) & 8) != 0)
            *(_QWORD *)(v7 + 352) += v9;
        }
        if (a2 < 1 || v8 == 10)
        {
          if (v8 == 10)
            goto LABEL_60;
        }
        else
        {
          v16 = strerror(a2);
          if (v16)
            xo_printf(v7, ": %s", v10, v11, v12, v13, v14, v15, (char)v16);
        }
        xo_printf(v7, "\n", v10, v11, v12, v13, v14, v15, v54[0]);
        goto LABEL_60;
      case 1:
        if ((*(_BYTE *)v7 & 2) != 0)
          xo_buf_indent((_QWORD *)v7, *(unsigned __int16 *)(v7 + 20));
        v17 = *(_QWORD *)(v7 + 72);
        v18 = *(_QWORD *)(v7 + 80);
        if (v18 + 9 < (unint64_t)(v17 + *(_QWORD *)(v7 + 88)))
          goto LABEL_22;
        v19 = (v18 + 9 - v17 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
        v20 = xo_realloc(v17, v19);
        if (v20)
        {
          v18 = v20 + *(_QWORD *)(v7 + 80) - *(_QWORD *)(v7 + 72);
          *(_QWORD *)(v7 + 72) = v20;
          *(_QWORD *)(v7 + 80) = v18;
          *(_QWORD *)(v7 + 88) = v19;
LABEL_22:
          v21 = *(_QWORD *)xo_message_hcv_msg_open;
          *(_BYTE *)(v18 + 8) = xo_message_hcv_msg_open[8];
          *(_QWORD *)v18 = v21;
          *(_QWORD *)(v7 + 80) += 9;
        }
        v55 = v56;
        v22 = *(char **)(v7 + 80);
        v23 = *(_QWORD *)(v7 + 72) - (_QWORD)v22 + *(_QWORD *)(v7 + 88);
        v24 = vsnprintf(v22, v23, __s, v56);
        if (v23 > v24)
          goto LABEL_28;
        v25 = *(_QWORD *)(v7 + 72);
        v26 = *(_QWORD *)(v7 + 80) + v24;
        if (v26 < v25 + *(_QWORD *)(v7 + 88))
          goto LABEL_27;
        v27 = (v26 - v25 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
        result = xo_realloc(v25, v27);
        if (!result)
          return result;
        v28 = result + *(_QWORD *)(v7 + 80) - *(_QWORD *)(v7 + 72);
        *(_QWORD *)(v7 + 72) = result;
        *(_QWORD *)(v7 + 80) = v28;
        *(_QWORD *)(v7 + 88) = v27;
LABEL_27:
        v56 = v55;
        v24 = vsnprintf(*(char **)(v7 + 80), *(_QWORD *)(v7 + 88) - *(_QWORD *)(v7 + 80) + *(_QWORD *)(v7 + 72), __s, v55);
LABEL_28:
        v29 = *(_QWORD *)(v7 + 80) + xo_escape_xml((uint64_t *)(v7 + 72), v24, 0);
        *(_QWORD *)(v7 + 80) = v29;
        if (a2 < 1 || v8 == 10)
        {
          if (v8 == 10)
            goto LABEL_50;
        }
        else
        {
          v30 = strerror(a2);
          if (v30)
          {
            v31 = v30;
            xo_buf_append((_QWORD *)(v7 + 72), ": ", 2uLL);
            v32 = strlen(v31);
            xo_buf_append((_QWORD *)(v7 + 72), v31, v32);
          }
        }
        v41 = *(_QWORD *)(v7 + 72);
        v42 = *(_BYTE **)(v7 + 80);
        if ((unint64_t)(v42 + 1) < v41 + *(_QWORD *)(v7 + 88))
          goto LABEL_49;
        v43 = (unint64_t)&v42[-v41 + 0x2000] & 0xFFFFFFFFFFFFE000;
        v44 = xo_realloc(v41, v43);
        v29 = *(_QWORD *)(v7 + 80);
        if (v44)
        {
          v42 = (_BYTE *)(v44 + v29 - *(_QWORD *)(v7 + 72));
          *(_QWORD *)(v7 + 72) = v44;
          *(_QWORD *)(v7 + 80) = v42;
          *(_QWORD *)(v7 + 88) = v43;
LABEL_49:
          *v42 = 10;
          v29 = *(_QWORD *)(v7 + 80) + 1;
          *(_QWORD *)(v7 + 80) = v29;
        }
LABEL_50:
        v45 = *(_QWORD *)(v7 + 72);
        if (v29 + 10 < (unint64_t)(v45 + *(_QWORD *)(v7 + 88)))
          goto LABEL_53;
        v46 = (v29 + 10 - v45 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
        v47 = xo_realloc(v45, v46);
        if (v47)
        {
          v29 = v47 + *(_QWORD *)(v7 + 80) - *(_QWORD *)(v7 + 72);
          *(_QWORD *)(v7 + 72) = v47;
          *(_QWORD *)(v7 + 80) = v29;
          *(_QWORD *)(v7 + 88) = v46;
LABEL_53:
          v48 = *(_QWORD *)xo_message_hcv_msg_close;
          *(_WORD *)(v29 + 8) = *(_WORD *)&xo_message_hcv_msg_close[8];
          *(_QWORD *)v29 = v48;
          *(_QWORD *)(v7 + 80) += 10;
        }
        if ((*(_BYTE *)v7 & 2) == 0)
          goto LABEL_59;
        v49 = *(_QWORD *)(v7 + 72);
        v50 = *(_BYTE **)(v7 + 80);
        if ((unint64_t)(v50 + 1) < v49 + *(_QWORD *)(v7 + 88))
          goto LABEL_58;
        v51 = (unint64_t)&v50[-v49 + 0x2000] & 0xFFFFFFFFFFFFE000;
        v52 = xo_realloc(v49, v51);
        if (v52)
        {
          v50 = (_BYTE *)(v52 + *(_QWORD *)(v7 + 80) - *(_QWORD *)(v7 + 72));
          *(_QWORD *)(v7 + 72) = v52;
          *(_QWORD *)(v7 + 80) = v50;
          *(_QWORD *)(v7 + 88) = v51;
LABEL_58:
          *v50 = 10;
          ++*(_QWORD *)(v7 + 80);
        }
LABEL_59:
        xo_write((_QWORD *)v7);
LABEL_60:
        if (*(_WORD *)(v7 + 16) == 3)
        {
          v53 = *(_QWORD *)(v7 + 8);
          if ((v53 & 2) != 0)
          {
            *(_QWORD *)(v7 + 8) = v53 & 0xFFFFFFFFFFFFFFFDLL;
            xo_data_append((_QWORD *)v7, xo_message_hcv_div_close, 6uLL);
            if ((*(_BYTE *)v7 & 2) != 0)
              xo_data_append((_QWORD *)v7, "\n", 1uLL);
          }
        }
LABEL_64:
        result = xo_flush_h(v7);
        break;
      case 2:
      case 4:
      case 5:
        return result;
      case 3:
        v55 = v56;
        v33 = 1024;
        v34 = v57;
        v35 = vsnprintf(v57, 0x400uLL, __s, v56);
        v36 = (int)v35;
        if ((int)v35 >= 1025)
        {
          v33 = (int)v35 + 1024;
          MEMORY[0x24BDAC7A8](v35);
          v34 = &v54[-((v36 + 1039) & 0xFFFFFFFFFFFFFFF0)];
          bzero(v34, v36 + 1024);
          v55 = v56;
          v36 = vsnprintf(v34, v36 + 1024, __s, v56);
        }
        if (v8 != 10)
        {
          v37 = (char *)&xo_version_extra;
          v38 = v33 - v36;
          if (a2 <= 0)
            v39 = (const char *)&xo_version_extra;
          else
            v39 = ": ";
          if (a2 >= 1)
            v37 = strerror(a2);
          v40 = snprintf(&v34[v36], v38, "%s%s\n", v39, v37);
          if (v40 >= 1)
            v36 += v40;
        }
        xo_buf_append_div(v7, "message", 0, 0, 0, v34, v36, 0, 0, 0, 0);
        goto LABEL_60;
      default:
        goto LABEL_64;
    }
  }
  return result;
}

char *xo_buf_indent(_QWORD *a1, int a2)
{
  int v2;
  char *v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *result;
  char *v9;

  v2 = a2;
  if (a2 <= 0)
    v2 = xo_indent((uint64_t)a1);
  v5 = a1[9];
  v4 = (char *)a1[10];
  v6 = &v4[v2];
  if ((unint64_t)v6 >= v5 + a1[11])
  {
    v7 = (unint64_t)&v6[-v5 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
    result = (char *)xo_realloc(a1[9], v7);
    if (!result)
      return result;
    v9 = result;
    v4 = &result[a1[10] - a1[9]];
    a1[9] = v9;
    a1[10] = v4;
    a1[11] = v7;
  }
  result = (char *)memset(v4, 32, v2);
  a1[10] += v2;
  return result;
}

_QWORD *xo_buf_append(_QWORD *result, void *__src, size_t __n)
{
  _QWORD *v5;
  char *v6;
  size_t v7;
  void *v8;

  if (__src && __n)
  {
    v5 = result;
    v6 = (char *)result[1];
    if ((unint64_t)&v6[__n] >= *v5 + v5[2])
    {
      v7 = (unint64_t)&v6[__n - *v5 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
      result = (_QWORD *)xo_realloc(*v5, v7);
      if (!result)
        return result;
      v8 = result;
      v6 = (char *)result + v5[1] - *v5;
      *v5 = v8;
      v5[1] = v6;
      v5[2] = v7;
    }
    result = memcpy(v6, __src, __n);
    v5[1] += __n;
  }
  return result;
}

uint64_t xo_escape_xml(uint64_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  const char *v17;
  size_t v18;

  v3 = a2;
  if (a2 >= 1)
  {
    v4 = a3;
    v6 = 0;
    v7 = (unsigned __int8 *)a1[1];
    v8 = v7;
    do
    {
      v9 = *v8;
      if (v9 == 38)
      {
        v6 += 4;
      }
      else
      {
        if (((v9 == 34) & (a3 >> 9)) != 0)
          v10 = v6 + 5;
        else
          v10 = v6;
        if (v9 == 60)
          v10 = v6 + 3;
        if (v9 == 62)
          v6 += 3;
        else
          v6 = v10;
      }
      ++v8;
    }
    while (v8 < &v7[a2]);
    if (v6)
    {
      v11 = *a1;
      if ((unint64_t)&v7[v6] >= *a1 + a1[2])
      {
        v12 = (unint64_t)&v7[v6 - v11 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v13 = xo_realloc();
        if (!v13)
          return 0;
        v7 = (unsigned __int8 *)(v13 + a1[1] - *a1);
        *a1 = v13;
        a1[1] = (uint64_t)v7;
        a1[2] = v12;
      }
      v14 = &v7[v3 + v6];
      v15 = &v7[v3 - 1];
      while (1)
      {
        --v14;
        v16 = *v15;
        if (v16 == 38)
          break;
        if (v16 == 60)
        {
          v17 = xo_xml_lt;
          goto LABEL_27;
        }
        if (v16 == 62)
        {
          v17 = xo_xml_gt;
LABEL_27:
          v18 = strlen(v17);
          v14 = &v14[-v18 + 1];
          memcpy(v14, v17, v18);
          goto LABEL_28;
        }
        if ((v4 & 0x200) != 0)
        {
          v17 = xo_xml_quot;
          if (v16 == 34)
            goto LABEL_27;
        }
        *v14 = v16;
LABEL_28:
        if (v15 > v7 && v15-- != v14)
          continue;
        v3 += v6;
        return v3;
      }
      v17 = xo_xml_amp;
      goto LABEL_27;
    }
  }
  return v3;
}

uint64_t xo_write(_QWORD *a1)
{
  _BYTE *v2;
  _BYTE *v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD, _QWORD);
  uint64_t result;

  v4 = a1 + 9;
  v2 = (_BYTE *)a1[9];
  v3 = (_BYTE *)v4[1];
  if (v3 == v2)
  {
    result = 0;
    goto LABEL_11;
  }
  if (v3 + 1 < &v2[a1[11]])
    goto LABEL_5;
  v5 = (v3 + 1 - v2 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
  v6 = xo_realloc();
  if (v6)
  {
    v3 = (_BYTE *)(v6 + a1[10] - a1[9]);
    a1[9] = v6;
    a1[10] = v3;
    a1[11] = v5;
LABEL_5:
    *v3 = 0;
    ++a1[10];
  }
  a1[1] &= ~8uLL;
  a1[44] = 0;
  a1[45] = 0;
  a1[43] = 0;
  v7 = (uint64_t (*)(_QWORD, _QWORD))a1[3];
  if (v7)
    result = v7(a1[8], a1[9]);
  else
    result = 0;
  a1[10] = a1[9];
LABEL_11:
  a1[1] &= ~0x10uLL;
  return result;
}

_QWORD *xo_buf_append_div(unint64_t a1, char *a2, unsigned int a3, void *a4, size_t a5, char *a6, uint64_t a7, void *a8, size_t a9, char *a10, size_t a11)
{
  void *v11;
  char *v19;
  size_t v20;
  size_t v21;
  unsigned int v22;
  void (*v23)(unint64_t, _QWORD, _QWORD);
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _WORD *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t *v42;
  const char *v43;
  size_t v44;
  size_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(unint64_t, _QWORD, uint64_t);
  size_t v49;
  _BYTE *v50;
  _BYTE *v51;
  uint64_t v52;
  _QWORD *result;
  void *v54;
  void *v55;
  size_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  char *v63;
  size_t v64;
  void *v65;
  BOOL v66;
  _BOOL4 v67;
  size_t v69;
  _QWORD *v70;
  _QWORD *v71;
  size_t v72;
  size_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t appended;
  const void *v80;
  size_t v81;
  uint64_t v82;
  char *v83;
  size_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  char *v90;
  void *v91;
  void *v92;
  size_t v93;
  size_t v94;
  uint64_t v95;
  char *v96;
  _QWORD v97[4];

  v11 = a8;
  v96 = a2;
  v19 = a10;
  v20 = a9;
  v97[3] = *MEMORY[0x24BDAC8D0];
  if (a8 && !a10)
  {
    ((void (*)(void))MEMORY[0x24BDAC7A8])();
    v19 = (char *)&v89 - ((a9 + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v19, v21);
    memcpy(v19, v11, a9);
    v19[a9] = 0;
    if (*v19 == 37 && (v19[1] - 48) <= 9)
    {
      do
      {
        v22 = v19[2] - 48;
        ++v19;
      }
      while (v22 < 0xA);
      *v19 = 37;
    }
    a11 = strlen(v19);
  }
  if (a4 && (a3 & 0xC0) == 0x80 && (*(_BYTE *)a1 & 0x20) != 0)
  {
    v97[0] = *(_QWORD *)(a1 + 200);
    v89 = (_QWORD *)(a1 + 200);
    v90 = a6;
    v23 = *(void (**)(unint64_t, _QWORD, _QWORD))(a1 + 56);
    if (v23)
      v23(a1, *(_QWORD *)(a1 + 200), 0);
    v24 = *(_BYTE **)(a1 + 144);
    *(_QWORD *)(a1 + 152) = v24;
    if (*(uint64_t *)(a1 + 160) <= 1)
    {
      v25 = xo_realloc(v24, 0x2000);
      if (!v25)
        goto LABEL_17;
      v26 = v25;
      v24 = (_BYTE *)(v25 + *(_QWORD *)(a1 + 152) - *(_QWORD *)(a1 + 144));
      *(_QWORD *)(a1 + 144) = v26;
      *(_QWORD *)(a1 + 152) = v24;
      *(_QWORD *)(a1 + 160) = 0x2000;
    }
    *v24 = 91;
    ++*(_QWORD *)(a1 + 152);
LABEL_17:
    xo_buf_escape(a1, (uint64_t *)(a1 + 144), a4, a5, 0);
    v27 = *(_QWORD *)(a1 + 144);
    v28 = *(_DWORD **)(a1 + 152);
    v29 = v27 + *(_QWORD *)(a1 + 160);
    v30 = *(_BYTE *)a1;
    v92 = a4;
    if ((v30 & 2) != 0)
    {
      if ((unint64_t)(v28 + 1) >= v29)
      {
        v34 = ((unint64_t)v28 - v27 + 8195) & 0xFFFFFFFFFFFFE000;
        v35 = xo_realloc(v27, v34);
        if (!v35)
          goto LABEL_27;
        v28 = (_DWORD *)(v35 + *(_QWORD *)(a1 + 152) - *(_QWORD *)(a1 + 144));
        *(_QWORD *)(a1 + 144) = v35;
        *(_QWORD *)(a1 + 152) = v28;
        *(_QWORD *)(a1 + 160) = v34;
      }
      *v28 = 656424224;
      v33 = 4;
    }
    else
    {
      if ((unint64_t)v28 + 2 >= v29)
      {
        v31 = ((unint64_t)v28 - v27 + 8193) & 0xFFFFFFFFFFFFE000;
        v32 = xo_realloc(v27, v31);
        if (!v32)
          goto LABEL_27;
        v28 = (_DWORD *)(v32 + *(_QWORD *)(a1 + 152) - *(_QWORD *)(a1 + 144));
        *(_QWORD *)(a1 + 144) = v32;
        *(_QWORD *)(a1 + 152) = v28;
        *(_QWORD *)(a1 + 160) = v31;
      }
      *(_WORD *)v28 = 10045;
      v33 = 2;
    }
    *(_QWORD *)(a1 + 152) += v33;
LABEL_27:
    xo_do_format_field(a1, (uint64_t *)(a1 + 144), (unsigned __int8 *)v19, a11, a3 & 0xFFFFF4F7 | 0x300);
    v36 = *(_QWORD *)(a1 + 144);
    v37 = *(_WORD **)(a1 + 152);
    if ((unint64_t)(v37 + 1) >= v36 + *(_QWORD *)(a1 + 160))
    {
      v38 = ((unint64_t)v37 - v36 + 8193) & 0xFFFFFFFFFFFFE000;
      v39 = xo_realloc(v36, v38);
      if (!v39)
      {
LABEL_31:
        v93 = a5;
        v94 = a9;
        v95 = a7;
        v40 = *(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176);
        v43 = *(const char **)(v40 + 16);
        v42 = (uint64_t *)(v40 + 16);
        v41 = v43;
        v91 = v11;
        if (v43)
          v44 = strlen(v41);
        else
          v44 = 0;
        v45 = *(_QWORD *)(a1 + 152) - *(_QWORD *)(a1 + 144);
        v46 = xo_realloc(v41, v45 + v44 + 1);
        if (v46)
        {
          v47 = v46;
          memcpy((void *)(v46 + v44), *(const void **)(a1 + 144), v45);
          *(_BYTE *)(v47 + v45 + v44) = 0;
          *v42 = v47;
        }
        *v89 = v97[0];
        v48 = *(void (**)(unint64_t, _QWORD, uint64_t))(a1 + 56);
        if (v48)
          v48(a1, *(_QWORD *)(a1 + 200), 1);
        a6 = v90;
        v11 = v91;
        v20 = v94;
        a7 = v95;
        a4 = v92;
        a5 = v93;
        goto LABEL_39;
      }
      v37 = (_WORD *)(v39 + *(_QWORD *)(a1 + 152) - *(_QWORD *)(a1 + 144));
      *(_QWORD *)(a1 + 144) = v39;
      *(_QWORD *)(a1 + 152) = v37;
      *(_QWORD *)(a1 + 160) = v38;
    }
    *v37 = 23847;
    *(_QWORD *)(a1 + 152) += 2;
    goto LABEL_31;
  }
LABEL_39:
  if ((a3 & 8) != 0)
    return (_QWORD *)xo_do_format_field(a1, 0, (unsigned __int8 *)v19, a11, a3 | 0x800);
  xo_line_ensure_open((_QWORD *)a1);
  if ((*(_BYTE *)a1 & 2) != 0)
    xo_buf_indent((_QWORD *)a1, *(unsigned __int16 *)(a1 + 20));
  xo_data_append((_QWORD *)a1, xo_buf_append_div_div_start, 0xCuLL);
  v49 = strlen(v96);
  xo_data_append((_QWORD *)a1, v96, v49);
  v50 = *(_BYTE **)(a1 + 408);
  v51 = *(_BYTE **)(a1 + 416);
  if (v51 != v50)
    xo_data_append((_QWORD *)a1, v50, v51 - v50);
  if (a4)
  {
    xo_data_append((_QWORD *)a1, xo_buf_append_div_div_tag, 0xCuLL);
    xo_buf_escape(a1, (uint64_t *)(a1 + 72), a4, a5, 0);
    v52 = *(_QWORD *)a1;
    if ((*(_QWORD *)a1 & 0x40000) != 0)
    {
      *(_QWORD *)(a1 + 8) |= 0x10uLL;
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72) + 1;
      if ((v52 & 0x20) == 0)
      {
LABEL_47:
        if ((v52 & 0x40) == 0)
        {
LABEL_77:
          if ((a3 & 0x80) != 0 && (*(_BYTE *)(a1 + 1) & 8) != 0)
            xo_data_append((_QWORD *)a1, xo_buf_append_div_div_key, 0xFuLL);
          goto LABEL_80;
        }
LABEL_71:
        if (*(_QWORD *)(a1 + 184))
        {
          v70 = xo_info_find(a1, a4, a5);
          if (v70)
          {
            v71 = v70;
            if (v70[1])
            {
              xo_data_append((_QWORD *)a1, xo_buf_append_div_in_type, 0xDuLL);
              v72 = strlen((const char *)v71[1]);
              xo_buf_escape(a1, (uint64_t *)(a1 + 72), (void *)v71[1], v72, 0);
            }
            if (v71[2])
            {
              xo_data_append((_QWORD *)a1, xo_buf_append_div_in_help, 0xDuLL);
              v73 = strlen((const char *)v71[2]);
              xo_buf_escape(a1, (uint64_t *)(a1 + 72), (void *)v71[2], v73, 0);
            }
          }
        }
        goto LABEL_77;
      }
    }
    else if ((v52 & 0x20) == 0)
    {
      goto LABEL_47;
    }
    v92 = a4;
    v93 = a5;
    v94 = v20;
    v95 = a7;
    v54 = v11;
    xo_data_append((_QWORD *)a1, xo_buf_append_div_div_xpath, 0xEuLL);
    v55 = *(void **)(a1 + 208);
    if (v55)
    {
      v56 = strlen(*(const char **)(a1 + 208));
      xo_data_append((_QWORD *)a1, v55, v56);
    }
    LODWORD(v57) = *(_DWORD *)(a1 + 176);
    if ((v57 & 0x80000000) == 0)
    {
      v58 = 0;
      v59 = 0;
      do
      {
        v60 = *(_QWORD *)(a1 + 168);
        v61 = v60 + v58;
        if (*(_QWORD *)(v60 + v58 + 8) && (*(_DWORD *)(v61 + 4) | 4) != 7)
        {
          xo_data_append((_QWORD *)a1, "/", 1uLL);
          v63 = *(char **)(v61 + 8);
          v64 = strlen(v63);
          xo_buf_escape(a1, (uint64_t *)(a1 + 72), v63, v64, 0);
          v65 = *(void **)(v60 + v58 + 16);
          v57 = *(unsigned int *)(a1 + 176);
          v66 = (a3 & 0x80) != 0 && v59 == v57;
          v67 = !v66;
          if (v65 && v67)
          {
            v69 = strlen(*(const char **)(v60 + v58 + 16));
            xo_data_append((_QWORD *)a1, v65, v69);
            LODWORD(v57) = *(_DWORD *)(a1 + 176);
          }
        }
        v62 = v59++ < (int)v57;
        v58 += 24;
      }
      while (v62);
    }
    xo_data_append((_QWORD *)a1, "/", 1uLL);
    a4 = v92;
    a5 = v93;
    xo_buf_escape(a1, (uint64_t *)(a1 + 72), v92, v93, 0);
    v11 = v54;
    v20 = v94;
    a7 = v95;
    if ((*(_QWORD *)a1 & 0x40) == 0)
      goto LABEL_77;
    goto LABEL_71;
  }
LABEL_80:
  v74 = v20;
  v75 = *(_QWORD *)(a1 + 72);
  v76 = *(_QWORD *)(a1 + 80);
  xo_data_append((_QWORD *)a1, xo_buf_append_div_div_end, 2uLL);
  v77 = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
  v78 = *(_QWORD *)(a1 + 376);
  v97[0] = v77;
  v97[1] = v78;
  v97[2] = *(_QWORD *)(a1 + 352);
  if (a7)
  {
    appended = xo_data_append_content(a1, a6, a7, a3);
    if ((a3 & 0x8000) == 0)
      goto LABEL_88;
  }
  else
  {
    appended = xo_do_format_field(a1, 0, (unsigned __int8 *)v11, v74, a3);
    if ((a3 & 0x8000) == 0)
      goto LABEL_88;
  }
  v80 = (const void *)(v77 + *(_QWORD *)(a1 + 72));
  v81 = *(_QWORD *)(a1 + 80) - (_QWORD)v80;
  MEMORY[0x24BDAC7A8](appended);
  v83 = (char *)&v89 - v82;
  bzero((char *)&v89 - v82, v84);
  memcpy(v83, v80, v81);
  v83[v81] = 0;
  xo_format_humanize(a1, (unint64_t *)(a1 + 72), v97, a3);
  v85 = *(_QWORD *)(a1 + 72);
  v86 = *(_QWORD *)(a1 + 80);
  v87 = v86 + v81 + 15;
  if (v87 >= v85 + *(_QWORD *)(a1 + 88))
  {
    v88 = (v87 - v85 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
    v85 = xo_realloc(v85, v88);
    if (!v85)
      goto LABEL_88;
    v86 = v85 + *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v85;
    *(_QWORD *)(a1 + 80) = v86;
    *(_QWORD *)(a1 + 88) = v88;
  }
  memmove((void *)(v85 + v76 - v75 + v81 + 15), (const void *)(v85 + v76 - v75), v86 - (v85 + v76 - v75));
  qmemcpy((void *)(*(_QWORD *)(a1 + 72) + v76 - v75), "\" data-number=\"", 15);
  memcpy((void *)(*(_QWORD *)(a1 + 72) + v76 - v75 + 15), v83, v81);
  *(_QWORD *)(a1 + 80) += v81 + 15;
LABEL_88:
  result = xo_data_append((_QWORD *)a1, xo_buf_append_div_div_close, 6uLL);
  if ((*(_BYTE *)a1 & 2) != 0)
    return xo_data_append((_QWORD *)a1, "\n", 1uLL);
  return result;
}

uint64_t xo_printf_v(uint64_t a1, char *__format, va_list a3)
{
  int64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 80) + *(_QWORD *)(a1 + 88);
  result = vsnprintf(*(char **)(a1 + 80), v5, __format, a3);
  if (v5 <= (int)result)
  {
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80) + (int)result;
    if (v8 >= v7 + *(_QWORD *)(a1 + 88))
    {
      v9 = (v8 - v7 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
      v10 = xo_realloc(*(_QWORD *)(a1 + 72), v9);
      if (!v10)
        return -1;
      v11 = v10 + *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v10;
      *(_QWORD *)(a1 + 80) = v11;
      *(_QWORD *)(a1 + 88) = v9;
    }
    result = vsnprintf(*(char **)(a1 + 80), *(_QWORD *)(a1 + 88) - *(_QWORD *)(a1 + 80) + *(_QWORD *)(a1 + 72), __format, a3);
  }
  if (result >= 1)
    *(_QWORD *)(a1 + 80) += result;
  return result;
}

uint64_t xo_printf(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_printf_v(a1, a2, &a9);
}

_QWORD *xo_data_append(_QWORD *result, void *__src, size_t __n)
{
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  size_t v8;
  void *v9;

  if (__src && __n)
  {
    v5 = result;
    v6 = (char *)result[10];
    v7 = v5[9];
    if ((unint64_t)&v6[__n] >= v7 + v5[11])
    {
      v8 = (unint64_t)&v6[__n - v7 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
      result = (_QWORD *)xo_realloc(v5[9], v8);
      if (!result)
        return result;
      v9 = result;
      v6 = (char *)result + v5[10] - v5[9];
      v5[9] = v9;
      v5[10] = v6;
      v5[11] = v8;
    }
    result = memcpy(v6, __src, __n);
    v5[10] += __n;
  }
  return result;
}

uint64_t xo_flush_h(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);

  v1 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v1 = xo_default_handle();
  }
  if (*(_WORD *)(v1 + 16) == 5)
    xo_encoder_handle(v1, 13, 0, 0, 0);
  v2 = xo_write((_QWORD *)v1);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = *(uint64_t (**)(_QWORD))(v1 + 40);
    if (v3)
    {
      if ((v3(*(_QWORD *)(v1 + 64)) & 0x80000000) != 0)
        return -1;
    }
  }
  return v2;
}

uint64_t xo_message_hc(uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_message_hcv(a1, a2, a3, &a9);
}

uint64_t xo_message_c(int a1, char *__s, ...)
{
  va_list va;

  va_start(va, __s);
  return xo_message_hcv(0, a1, __s, va);
}

uint64_t xo_message_e(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v10;

  v10 = __error();
  return xo_message_hcv(0, *v10, a1, &a9);
}

uint64_t xo_message(char *__s, ...)
{
  va_list va;

  va_start(va, __s);
  return xo_message_hcv(0, 0, __s, va);
}

_BYTE *xo_failure(_BYTE *result, char *__s)
{
  if ((*result & 0x10) != 0)
    return (_BYTE *)xo_warn_hcv((int)result, -1, 1, __s);
  return result;
}

uint64_t xo_create(__int16 a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = xo_realloc(0, 472);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 464) = 0;
    *(_OWORD *)(v4 + 432) = 0u;
    *(_OWORD *)(v4 + 448) = 0u;
    *(_OWORD *)(v4 + 400) = 0u;
    *(_OWORD *)(v4 + 416) = 0u;
    *(_OWORD *)(v4 + 368) = 0u;
    *(_OWORD *)(v4 + 384) = 0u;
    *(_OWORD *)(v4 + 336) = 0u;
    *(_OWORD *)(v4 + 352) = 0u;
    *(_OWORD *)(v4 + 304) = 0u;
    *(_OWORD *)(v4 + 320) = 0u;
    *(_OWORD *)(v4 + 272) = 0u;
    *(_OWORD *)(v4 + 288) = 0u;
    *(_OWORD *)(v4 + 240) = 0u;
    *(_OWORD *)(v4 + 256) = 0u;
    *(_OWORD *)(v4 + 208) = 0u;
    *(_OWORD *)(v4 + 224) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 192) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)v4 = 0u;
    *(_WORD *)(v4 + 16) = a1;
    *(_QWORD *)v4 = a2;
    xo_init_handle(v4);
    *(_WORD *)(v5 + 16) = a1;
  }
  return v5;
}

uint64_t xo_init_handle(uint64_t a1)
{
  FILE *v2;
  int v3;
  char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = (FILE *)*MEMORY[0x24BDAC8E8];
  *(_QWORD *)(a1 + 64) = *MEMORY[0x24BDAC8E8];
  *(_QWORD *)(a1 + 24) = xo_write_to_file;
  *(_QWORD *)(a1 + 40) = xo_flush_file;
  v3 = fileno(v2);
  if (isatty(v3))
    *(_QWORD *)a1 |= 0x800000uLL;
  if ((xo_locale_inited & 1) == 0)
  {
    xo_locale_inited = 1;
    v4 = getenv("LC_ALL");
    if (!v4)
    {
      v4 = getenv("LC_CTYPE");
      if (!v4)
        v4 = getenv("LANG");
    }
    if (v4)
      v5 = v4;
    else
      v5 = "C";
    setlocale(2, v5);
  }
  *(_QWORD *)(a1 + 88) = 0x2000;
  v6 = xo_realloc(0, 0x2000);
  *(_QWORD *)(a1 + 72) = v6;
  *(_QWORD *)(a1 + 80) = v6;
  *(_QWORD *)(a1 + 112) = 0x2000;
  result = xo_realloc(0, 0x2000);
  *(_QWORD *)(a1 + 96) = result;
  *(_QWORD *)(a1 + 104) = result;
  v8 = *(_QWORD *)(a1 + 8);
  if ((v8 & 0x20) == 0)
  {
    *(_QWORD *)(a1 + 8) = v8 | 0x20;
    *(_WORD *)(a1 + 20) = 2;
    result = xo_depth_check(a1, 128);
    *(_QWORD *)(a1 + 8) &= ~0x20uLL;
  }
  return result;
}

_QWORD *xo_create_to_file(uint64_t a1, __int16 a2, uint64_t a3)
{
  _QWORD *result;

  result = (_QWORD *)xo_create(a2, a3);
  if (result)
  {
    result[8] = a1;
    result[3] = xo_write_to_file;
    result[4] = xo_close_file;
    result[5] = xo_flush_file;
  }
  return result;
}

uint64_t xo_write_to_file(FILE *a1, const char *a2)
{
  return fprintf(a1, "%s", a2);
}

uint64_t xo_set_file_h(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
    if (a2)
      goto LABEL_3;
LABEL_7:
    xo_failure((_BYTE *)a1, "xo_set_file: NULL fp");
    return 0xFFFFFFFFLL;
  }
  if (!a2)
    goto LABEL_7;
LABEL_3:
  v3 = 0;
  *(_QWORD *)(a1 + 64) = a2;
  *(_QWORD *)(a1 + 24) = xo_write_to_file;
  *(_QWORD *)(a1 + 32) = xo_close_file;
  *(_QWORD *)(a1 + 40) = xo_flush_file;
  return v3;
}

uint64_t xo_set_file(uint64_t a1)
{
  return xo_set_file_h(0, a1);
}

_DWORD *xo_destroy(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *result;
  uint64_t v11;

  v2 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v2 = xo_default_handle();
  }
  xo_flush_h(v2);
  v3 = *(void (**)(_QWORD))(v2 + 32);
  if (v3 && (*(_BYTE *)v2 & 1) != 0)
    v3(*(_QWORD *)(v2 + 64));
  xo_free(*(_QWORD *)(v2 + 168));
  v4 = *(_QWORD *)(v2 + 72);
  if (v4)
    xo_free(v4);
  *(_QWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  v5 = *(_QWORD *)(v2 + 96);
  if (v5)
    xo_free(v5);
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 112) = 0;
  v6 = *(_QWORD *)(v2 + 144);
  if (v6)
    xo_free(v6);
  *(_QWORD *)(v2 + 144) = 0;
  *(_QWORD *)(v2 + 152) = 0;
  *(_QWORD *)(v2 + 160) = 0;
  v7 = *(_QWORD *)(v2 + 120);
  if (v7)
    xo_free(v7);
  *(_QWORD *)(v2 + 120) = 0;
  *(_QWORD *)(v2 + 128) = 0;
  *(_QWORD *)(v2 + 136) = 0;
  v8 = *(_QWORD *)(v2 + 408);
  if (v8)
    xo_free(v8);
  *(_QWORD *)(v2 + 408) = 0;
  *(_QWORD *)(v2 + 416) = 0;
  *(_QWORD *)(v2 + 424) = 0;
  v9 = *(_QWORD *)(v2 + 432);
  if (v9)
    xo_free(v9);
  if (a1)
    return (_DWORD *)xo_free(v2);
  v11 = xo_default_handle();
  *(_QWORD *)(v11 + 464) = 0;
  *(_OWORD *)(v11 + 432) = 0u;
  *(_OWORD *)(v11 + 448) = 0u;
  *(_OWORD *)(v11 + 400) = 0u;
  *(_OWORD *)(v11 + 416) = 0u;
  *(_OWORD *)(v11 + 368) = 0u;
  *(_OWORD *)(v11 + 384) = 0u;
  *(_OWORD *)(v11 + 336) = 0u;
  *(_OWORD *)(v11 + 352) = 0u;
  *(_OWORD *)(v11 + 304) = 0u;
  *(_OWORD *)(v11 + 320) = 0u;
  *(_OWORD *)(v11 + 272) = 0u;
  *(_OWORD *)(v11 + 288) = 0u;
  *(_OWORD *)(v11 + 240) = 0u;
  *(_OWORD *)(v11 + 256) = 0u;
  *(_OWORD *)(v11 + 208) = 0u;
  *(_OWORD *)(v11 + 224) = 0u;
  *(_OWORD *)(v11 + 176) = 0u;
  *(_OWORD *)(v11 + 192) = 0u;
  *(_OWORD *)(v11 + 144) = 0u;
  *(_OWORD *)(v11 + 160) = 0u;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 80) = 0u;
  *(_OWORD *)(v11 + 96) = 0u;
  *(_OWORD *)(v11 + 48) = 0u;
  *(_OWORD *)(v11 + 64) = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(_OWORD *)(v11 + 32) = 0u;
  *(_OWORD *)v11 = 0u;
  result = (_DWORD *)xo_default_inited();
  *result = 0;
  return result;
}

uint64_t xo_set_style(uint64_t result, __int16 a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
  }
  *(_WORD *)(result + 16) = a2;
  return result;
}

uint64_t xo_get_style(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
  }
  return *(unsigned __int16 *)(a1 + 16);
}

uint64_t xo_set_style_name(uint64_t a1, const char *a2)
{
  int v3;
  __int16 v4;
  uint64_t result;

  if (!a2)
    return 0xFFFFFFFFLL;
  v3 = xo_name_to_style(a2);
  if (v3 < 0)
    return 0xFFFFFFFFLL;
  v4 = v3;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
  }
  result = 0;
  *(_WORD *)(a1 + 16) = v4;
  return result;
}

uint64_t xo_name_to_style(const char *a1)
{
  uint64_t result;

  if (!strcmp(a1, "xml"))
    return 1;
  if (!strcmp(a1, "json"))
    return 2;
  if (!strcmp(a1, "encoder"))
    return 5;
  result = strcmp(a1, "text");
  if ((_DWORD)result)
  {
    if (!strcmp(a1, "html"))
    {
      return 3;
    }
    else if (!strcmp(a1, "sdparams"))
    {
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t xo_set_options(uint64_t a1, char *__s)
{
  char *v2;
  uint64_t v3;
  char v4;
  char *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int v9;
  size_t v10;
  size_t v11;
  unsigned __int8 *v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  char *v16;
  char *v17;
  char *v18;
  int v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  if (!__s)
    return 0;
  v2 = __s;
  v3 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v3 = xo_default_handle();
  }
  if (*v2 == 58)
  {
    v5 = v2 + 1;
    v4 = v2[1];
    if (v4)
    {
      do
      {
        if (v4 > 98)
        {
          switch(v4)
          {
            case 'c':
              v6 = *(_QWORD *)v3 | 0x2000000;
              goto LABEL_31;
            case 'd':
            case 'e':
            case 'h':
            case 'j':
            case 'l':
            case 'm':
              break;
            case 'f':
              v6 = *(_QWORD *)v3 | 0x400000;
              goto LABEL_31;
            case 'g':
              v6 = *(_QWORD *)v3 | 0x10000000;
              goto LABEL_31;
            case 'i':
              v7 = strspn(v2 + 2, "0123456789");
              if (v7 >= 1)
              {
                v8 = v7;
                *(_WORD *)(v3 + 20) = atoi(v2 + 2);
                v5 = &v2[v8];
              }
              break;
            case 'k':
              v6 = *(_QWORD *)v3 | 0x800;
              goto LABEL_31;
            case 'n':
              v6 = *(_QWORD *)v3 | 0x8000000;
              goto LABEL_31;
            default:
              if (v4 == 117)
              {
                v6 = *(_QWORD *)v3 | 0x100000;
              }
              else
              {
                if (v4 != 120)
                  break;
                v6 = *(_QWORD *)v3 | 0x20;
              }
LABEL_31:
              *(_QWORD *)v3 = v6;
              break;
          }
        }
        else
        {
          switch(v4)
          {
            case 'F':
              v6 = *(_QWORD *)v3 | 0x800000;
              goto LABEL_31;
            case 'H':
              *(_WORD *)(v3 + 16) = 3;
              break;
            case 'I':
              v6 = *(_QWORD *)v3 | 0x40;
              goto LABEL_31;
            case 'J':
              *(_WORD *)(v3 + 16) = 2;
              break;
            case 'P':
              v6 = *(_QWORD *)v3 | 2;
              goto LABEL_31;
            case 'T':
              *(_WORD *)(v3 + 16) = 0;
              break;
            case 'U':
              v6 = *(_QWORD *)v3 | 0x40000;
              goto LABEL_31;
            case 'W':
              v6 = *(_QWORD *)v3 | 0x10;
              goto LABEL_31;
            case 'X':
              *(_WORD *)(v3 + 16) = 1;
              break;
            default:
              break;
          }
        }
        v2 = v5;
        v9 = *++v5;
        v4 = v9;
      }
      while (v9);
    }
    return 0;
  }
  v10 = strlen(v2);
  v11 = v10 + 1;
  v12 = (unsigned __int8 *)v26 - ((MEMORY[0x24BDAC7A8](v10) + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v12, v11);
  memcpy(v12, v2, v11);
  v13 = (unint64_t)&v12[v11 - 1];
  if ((unint64_t)v12 >= v13)
    return 0;
  v14 = 0;
  v15 = -1;
  do
  {
    v16 = strchr((char *)v12, 44);
    v17 = v16;
    if (v16)
    {
      *v16 = 0;
      v17 = v16 + 1;
    }
    if (*v12 == 64)
    {
      v19 = v12[1];
      v18 = (char *)(v12 + 1);
      if (!v19)
        goto LABEL_71;
      v14 = xo_encoder_init((_BYTE *)v3, v18);
      if (!(_DWORD)v14)
        goto LABEL_72;
LABEL_41:
      xo_warnx("error initializing encoder: %s");
LABEL_49:
      if (!v17)
        break;
      goto LABEL_73;
    }
    v20 = strchr((char *)v12, 61);
    v21 = v20;
    if (v20)
    {
      *v20 = 0;
      v21 = v20 + 1;
    }
    if (!strcmp("colors", (const char *)v12))
    {
      xo_set_color_map(v3, v21);
      if (!v17)
        break;
      goto LABEL_73;
    }
    v22 = xo_name_to_style((const char *)v12);
    if ((v22 & 0x80000000) == 0 && v22 != 5)
    {
      if (v15 < 0)
      {
        v15 = v22;
        if (!v17)
          break;
        goto LABEL_73;
      }
      xo_warnx("ignoring multiple styles: '%s'");
      goto LABEL_49;
    }
    v23 = xo_name_lookup(xo_xof_names, (char *)v12, 0xFFFFFFFFFFFFFFFFLL);
    if (v23)
    {
      v24 = *(_QWORD *)v3 | v23;
      goto LABEL_55;
    }
    if (!strcmp((const char *)v12, "no-color"))
    {
      v24 = *(_QWORD *)v3 & 0xFFFFFFFFFDFFFFFFLL;
LABEL_55:
      *(_QWORD *)v3 = v24;
      if (!v17)
        break;
      goto LABEL_73;
    }
    if (strcmp((const char *)v12, "indent"))
    {
      if (strcmp((const char *)v12, "encoder"))
      {
        xo_warnx("unknown libxo option value: '%s'", (const char *)v12);
        v14 = 0xFFFFFFFFLL;
        if (!v17)
          break;
        goto LABEL_73;
      }
      if (!v21)
      {
LABEL_71:
        xo_failure((_BYTE *)v3, "missing value for encoder option");
LABEL_72:
        if (!v17)
          break;
        goto LABEL_73;
      }
      v14 = xo_encoder_init((_BYTE *)v3, v21);
      if (!(_DWORD)v14)
        goto LABEL_72;
      goto LABEL_41;
    }
    if (v21)
    {
      *(_WORD *)(v3 + 20) = atoi(v21);
      if (!v17)
        break;
      goto LABEL_73;
    }
    xo_failure((_BYTE *)v3, "missing value for indent option");
    if (!v17)
      break;
LABEL_73:
    v12 = (unsigned __int8 *)v17;
  }
  while ((unint64_t)v17 < v13);
  if (v15 >= 1)
    *(_WORD *)(v3 + 16) = v15;
  return v14;
}

uint64_t xo_set_color_map(uint64_t result, char *__s)
{
  char *v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;

  v2 = __s;
  v3 = (_QWORD *)result;
  if (__s)
  {
    result = strlen(__s);
    v4 = result + 1;
  }
  else
  {
    v4 = 0;
  }
  v5 = (unint64_t)&v2[v4 - 1];
  v6 = 1;
  v7 = 385;
  while (v2)
  {
    if (!*v2 || (unint64_t)v2 >= v5)
      break;
    v9 = strchr(v2, 43);
    v10 = v9;
    if (v9)
    {
      *v9 = 0;
      v10 = v9 + 1;
    }
    result = (uint64_t)strchr(v2, 47);
    v11 = (const char *)result;
    if (result)
    {
      *(_BYTE *)result = 0;
      v11 = (const char *)(result + 1);
    }
    if (*v2)
    {
      v12 = 0;
      while (1)
      {
        result = strcmp(xo_color_names[v12], v2);
        if (!(_DWORD)result)
          break;
        if (++v12 == 9)
          goto LABEL_18;
      }
    }
    else
    {
LABEL_18:
      LODWORD(v12) = -1;
    }
    if (v11 && *v11)
    {
      v13 = 0;
      while (1)
      {
        result = strcmp(xo_color_names[v13], v11);
        if (!(_DWORD)result)
          break;
        if (++v13 == 9)
          goto LABEL_24;
      }
      if ((int)v12 >= 0)
        v16 = v12;
      else
        v16 = v6;
      *((_BYTE *)v3 + v6 + 384) = v16;
      if ((int)v13 >= 0)
        v15 = v13;
      else
        v15 = v6;
    }
    else
    {
LABEL_24:
      if ((int)v12 >= 0)
        v14 = v12;
      else
        v14 = v6;
      *((_BYTE *)v3 + v6 + 384) = v14;
      v15 = v6;
    }
    *((_BYTE *)v3 + v6++ + 393) = v15;
    ++v7;
    v2 = v10;
    if (v6 == 10)
    {
      *v3 |= 0x100000000uLL;
      return result;
    }
  }
  v17 = *v3;
  if (v6 <= 1)
  {
    *v3 = v17 & 0xFFFFFFFEFFFFFFFFLL;
  }
  else
  {
    *v3 = v17 | 0x100000000;
    if ((int)v6 > 8)
      return result;
  }
  do
  {
    v18 = (char *)v3 + v7;
    v18[9] = v7 + 0x80;
    *v18 = v7++ + 0x80;
  }
  while (v7 != 393);
  return result;
}

_QWORD *xo_set_flags(_QWORD *result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = (_QWORD *)xo_default_handle();
  }
  *result |= a2;
  return result;
}

uint64_t xo_get_flags(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
  }
  return *(_QWORD *)a1;
}

_BYTE *xo_set_leading_xpath(uint64_t a1, char *__s)
{
  uint64_t v3;
  _BYTE *result;

  v3 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v3 = xo_default_handle();
  }
  result = *(_BYTE **)(v3 + 208);
  if (result)
  {
    result = (_BYTE *)xo_free(result);
    *(_QWORD *)(v3 + 208) = 0;
  }
  if (__s)
  {
    result = xo_strndup(__s, 0xFFFFFFFFFFFFFFFFLL);
    *(_QWORD *)(v3 + 208) = result;
  }
  return result;
}

_BYTE *xo_strndup(char *__s, size_t a2)
{
  size_t v2;
  _BYTE *v4;
  _BYTE *v5;

  v2 = a2;
  if ((a2 & 0x8000000000000000) != 0)
    v2 = strlen(__s);
  v4 = (_BYTE *)xo_realloc(0, v2 + 1);
  v5 = v4;
  if (v4)
  {
    memcpy(v4, __s, v2);
    v5[v2] = 0;
  }
  return v5;
}

uint64_t xo_set_info(uint64_t result, _QWORD *a2, int a3)
{
  uint64_t *v5;
  uint64_t v6;

  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
  }
  if (a2 && a3 < 0)
  {
    if (*a2)
    {
      a3 = 0;
      v5 = a2 + 3;
      do
      {
        ++a3;
        v6 = *v5;
        v5 += 3;
      }
      while (v6);
    }
    else
    {
      a3 = 0;
    }
  }
  *(_QWORD *)(result + 184) = a2;
  *(_DWORD *)(result + 192) = a3;
  return result;
}

uint64_t xo_set_formatter(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
  }
  *(_QWORD *)(result + 48) = a2;
  *(_QWORD *)(result + 56) = a3;
  return result;
}

_QWORD *xo_clear_flags(_QWORD *result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = (_QWORD *)xo_default_handle();
  }
  *result &= ~a2;
  return result;
}

uint64_t xo_simplify_format(uint64_t a1, char *a2, int a3, void (*a4)(uint64_t, _QWORD, _QWORD))
{
  uint64_t v7;
  int *v8;
  int v9;
  char *i;
  int v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  size_t v15;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  _DWORD *j;
  int v22;
  unsigned int v23;
  char *k;
  int v25;
  int v26;
  unsigned int *v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  size_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  size_t v42;
  size_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  const void *v48;
  size_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char __str[12];
  uint64_t v61;

  v7 = a1;
  v61 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v7 = xo_default_handle();
  }
  *(_QWORD *)(v7 + 376) = 0;
  v8 = __error();
  *(_DWORD *)(v7 + 440) = *v8;
  v9 = 1;
  for (i = a2; ; ++i)
  {
    v11 = *i;
    if (v11 != 10 && v11 != 123)
      break;
    ++v9;
LABEL_11:
    ;
  }
  if (*i)
    goto LABEL_11;
  v12 = (2 * v9) | 1;
  MEMORY[0x24BDAC7A8](v8);
  v14 = &__str[-(v12 * (unint64_t)v13) - 4];
  bzero(v14, v15);
  if (!xo_parse_fields((_BYTE *)v7, (uint64_t)v14, v12, a2))
  {
    v18 = xo_realloc(0, 0x2000);
    v17 = v18;
    if (a3)
    {
      v19 = 0;
      v20 = 0;
      for (j = v14 + 88; ; j += 24)
      {
        v22 = *(j - 20);
        if (v22 > 70)
        {
          if (v22 == 71 || v22 == 123)
            continue;
        }
        else
        {
          if (v22 == 10 || v22 == 43)
            continue;
          if (!v22)
            break;
        }
        if (++v19 > 0x3E)
          break;
        if (*j)
          v20 |= 1 << *j;
      }
      v23 = 0;
      for (k = v14; ; k += 96)
      {
        v25 = *((_DWORD *)k + 2);
        if (v25 > 70)
        {
          if (v25 == 71 || v25 == 123)
            continue;
        }
        else
        {
          if (v25 == 10 || v25 == 43)
            continue;
          if (!v25)
            break;
        }
        if (!*((_DWORD *)k + 22))
        {
          do
            ++v23;
          while (((1 << v23) & v20) != 0);
          if (v23 > v19)
            break;
          *((_DWORD *)k + 22) = v23;
          v20 |= 1 << v23;
        }
      }
    }
    v26 = *((_DWORD *)v14 + 2);
    if (!v26)
    {
      v28 = 0x2000;
      v29 = (_BYTE *)v18;
LABEL_102:
      if ((unint64_t)(v29 + 1) >= v17 + v28)
      {
        v57 = xo_realloc(v17, (unint64_t)&v29[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000);
        if (!v57)
          return v17;
        v29 = &v29[v57 - v17];
        v17 = v57;
      }
      *v29 = 0;
      return v17;
    }
    v27 = (unsigned int *)(v14 + 64);
    v28 = 0x2000;
    v29 = (_BYTE *)v18;
    while (1)
    {
      v30 = *((_QWORD *)v27 - 8);
      if ((v30 & 0x80000) != 0)
      {
        if (a4)
        {
          if (v26 != 86)
          {
            v31 = *((_QWORD *)v27 - 5);
            if (v31)
              a4(v31, *v27, (v30 >> 20) & 1);
          }
        }
      }
      if (v26 > 70)
        break;
      if (v26 != 10)
      {
        if (v26 == 43)
        {
          v32 = (const void *)*((_QWORD *)v27 - 5);
          if (!v32)
            goto LABEL_97;
          v33 = *(_QWORD *)v27;
          if (!*(_QWORD *)v27)
            goto LABEL_97;
          if ((unint64_t)&v29[v33] >= v17 + v28)
          {
            v34 = (unint64_t)&v29[v33 - v17 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
            v35 = xo_realloc(v17, v34);
            if (!v35)
              goto LABEL_97;
            v29 = &v29[v35 - v17];
            v17 = v35;
            v28 = v34;
          }
          memcpy(v29, v32, v33);
          goto LABEL_96;
        }
        goto LABEL_62;
      }
      if ((unint64_t)(v29 + 1) < v17 + v28)
        goto LABEL_94;
      v55 = (unint64_t)&v29[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000;
      v56 = xo_realloc(v17, v55);
      if (v56)
      {
        v29 = &v29[v56 - v17];
        v17 = v56;
        v28 = v55;
LABEL_94:
        v54 = 10;
LABEL_95:
        *v29 = v54;
        v33 = 1;
LABEL_96:
        v29 += v33;
      }
LABEL_97:
      v26 = v27[10];
      v27 += 24;
      if (!v26)
        goto LABEL_102;
    }
    if (v26 == 71)
      goto LABEL_97;
    if (v26 == 123)
    {
      if ((unint64_t)(v29 + 1) >= v17 + v28)
      {
        v36 = (unint64_t)&v29[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000;
        v37 = xo_realloc(v17, v36);
        if (!v37)
        {
LABEL_81:
          v48 = (const void *)*((_QWORD *)v27 - 5);
          if (v48)
          {
            v49 = *(_QWORD *)v27;
            if (*(_QWORD *)v27)
            {
              if ((unint64_t)&v29[v49] < v17 + v28)
              {
LABEL_86:
                memcpy(v29, v48, v49);
                v29 += v49;
                goto LABEL_87;
              }
              v50 = (unint64_t)&v29[v49 - v17 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
              v51 = xo_realloc(v17, v50);
              if (v51)
              {
                v29 = &v29[v51 - v17];
                v17 = v51;
                v28 = v50;
                goto LABEL_86;
              }
            }
          }
LABEL_87:
          if ((unint64_t)(v29 + 1) < v17 + v28)
            goto LABEL_90;
          v52 = (unint64_t)&v29[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000;
          v53 = xo_realloc(v17, v52);
          if (v53)
          {
            v29 = &v29[v53 - v17];
            v17 = v53;
            v28 = v52;
LABEL_90:
            v54 = 125;
            goto LABEL_95;
          }
          goto LABEL_97;
        }
        v29 = &v29[v37 - v17];
        v17 = v37;
        v28 = v36;
      }
      *v29++ = 123;
      goto LABEL_81;
    }
LABEL_62:
    if ((unint64_t)(v29 + 1) >= v17 + v28)
    {
      v38 = (unint64_t)&v29[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000;
      v39 = xo_realloc(v17, v38);
      if (!v39)
        goto LABEL_66;
      v29 = &v29[v39 - v17];
      v17 = v39;
      v28 = v38;
    }
    *v29++ = 123;
LABEL_66:
    if (v26 != 86)
    {
      if ((unint64_t)(v29 + 1) < v17 + v28)
      {
LABEL_70:
        *v29++ = v26;
        goto LABEL_71;
      }
      v40 = (unint64_t)&v29[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000;
      v41 = xo_realloc(v17, v40);
      if (v41)
      {
        v29 = &v29[v41 - v17];
        v17 = v41;
        v28 = v40;
        goto LABEL_70;
      }
    }
LABEL_71:
    if (v27[6])
    {
      snprintf(__str, 0xCuLL, "%u", v27[6]);
      v42 = strlen(__str);
      if (v42)
      {
        v43 = v42;
        if ((unint64_t)&v29[v42] >= v17 + v28)
        {
          v44 = (unint64_t)&v29[v42 - v17 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
          v45 = xo_realloc(v17, v44);
          if (!v45)
            goto LABEL_77;
          v29 = &v29[v45 - v17];
          v17 = v45;
          v28 = v44;
        }
        memcpy(v29, __str, v43);
        v29 += v43;
      }
    }
LABEL_77:
    if ((unint64_t)(v29 + 1) >= v17 + v28)
    {
      v46 = (unint64_t)&v29[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000;
      v47 = xo_realloc(v17, v46);
      if (!v47)
        goto LABEL_81;
      v29 = &v29[v47 - v17];
      v17 = v47;
      v28 = v46;
    }
    *v29++ = 58;
    goto LABEL_81;
  }
  return 0;
}

uint64_t xo_parse_fields(_BYTE *a1, uint64_t a2, unsigned int a3, char *a4)
{
  BOOL v4;
  uint64_t result;
  int v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t i;
  unsigned __int8 *v18;
  uint64_t v19;
  BOOL v20;
  char *v21;
  uint64_t j;
  unsigned int v23;
  char *v24;
  uint64_t v25;
  char *v26;
  _BYTE *v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  BOOL v32;
  unsigned int v33;
  BOOL v34;
  int v35;
  char *v37;
  uint64_t v38;
  unsigned int *v39;
  int v40;
  unsigned int v41;
  uint64_t v42;

  if (*a4)
    v4 = a3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v10 = 0;
    v11 = 0;
    v12 = a2;
    v13 = a4;
    while (1)
    {
      v14 = v11;
      *(_QWORD *)(v12 + 16) = v13;
      v15 = *v13;
      if (v15 == 10)
      {
        *(_DWORD *)(v12 + 8) = 10;
        *(_QWORD *)(v12 + 56) = 1;
        ++v13;
        goto LABEL_23;
      }
      if (v15 != 123)
      {
        v19 = 0;
        while ((_BYTE)v15 && v15 != 10 && v15 != 123)
          LOBYTE(v15) = v13[++v19];
        *(_DWORD *)(v12 + 8) = 43;
        *(_QWORD *)(v12 + 24) = v13;
        *(_QWORD *)(v12 + 64) = v19;
        v13 += v19;
        *(_QWORD *)(v12 + 48) = v13;
        goto LABEL_23;
      }
      v16 = v13[1];
      *(_QWORD *)(v12 + 16) = v13 + 1;
      if (v16 == 123)
      {
        *(_DWORD *)(v12 + 8) = 123;
        for (i = 2; ; ++i)
        {
          if (v13[i] == 125)
          {
            v18 = (unsigned __int8 *)&v13[i];
            if (v13[i + 1] == 125)
            {
              *(_QWORD *)(v12 + 56) = i;
              if (*v18 == 125)
                v18 = (unsigned __int8 *)&v13[2 * (v18[1] == 125) + i];
              *(_QWORD *)(v12 + 48) = v18;
              v13 = (char *)v18;
              goto LABEL_23;
            }
          }
          else if (!v13[i])
          {
            xo_printable((uint64_t)a4);
            v37 = "missing closing '}}': '%s'";
            goto LABEL_81;
          }
        }
      }
      v21 = xo_parse_roles(a1, (uint64_t)a4, v13 + 1, v12);
      if (!v21)
        return 0xFFFFFFFFLL;
      if (*(_DWORD *)(v12 + 88))
        v10 = 1;
      if (*v21 != 58)
      {
        xo_printable((uint64_t)a4);
        v37 = "missing content (':'): '%s'";
        goto LABEL_81;
      }
      for (j = 1; ; ++j)
      {
        v23 = v21[j];
        if (v23 <= 0x5B)
          break;
        if (v23 == 92)
        {
          if (!v21[++j])
          {
LABEL_80:
            v37 = "backslash at the end of string";
            goto LABEL_81;
          }
        }
        else if (v23 == 125)
        {
          goto LABEL_43;
        }
LABEL_42:
        ;
      }
      if (v21[j] && v23 != 47)
        goto LABEL_42;
LABEL_43:
      v24 = &v21[j];
      v25 = j - 1;
      if (v25)
      {
        *(_QWORD *)(v12 + 64) = v25;
        *(_QWORD *)(v12 + 24) = v21 + 1;
        v23 = *v24;
      }
      if (v23 != 47)
      {
        v28 = 0;
        v26 = 0;
        goto LABEL_66;
      }
      v26 = ++v24;
      while (2)
      {
        v23 = *v24;
        if (v23 > 0x5B)
        {
          if (v23 == 92)
          {
            if (!*++v24)
              goto LABEL_80;
          }
          else if (v23 == 125)
          {
            break;
          }
          goto LABEL_55;
        }
        if (*v24 && v23 != 47)
        {
LABEL_55:
          ++v24;
          continue;
        }
        break;
      }
      v28 = (_BYTE *)(v24 - v26);
      if (v23 == 47)
      {
        v29 = 0;
        v30 = v24 + 1;
        while (v30[v29] && v30[v29] != 125)
          ++v29;
        *(_QWORD *)(v12 + 40) = v30;
        *(_QWORD *)(v12 + 80) = v29;
        v24 = &v30[v29];
        v23 = *v24;
      }
LABEL_66:
      if (v23 != 125)
      {
        xo_printable((uint64_t)a4);
        v37 = "missing closing '}': %s";
LABEL_81:
        xo_failure(a1, v37);
        return 0xFFFFFFFFLL;
      }
      v31 = &v24[-*(_QWORD *)(v12 + 16)];
      v13 = v24 + 1;
      *(_QWORD *)(v12 + 48) = v13;
      *(_QWORD *)(v12 + 56) = v31;
      if (*(_QWORD *)(v12 + 64))
        v32 = 0;
      else
        v32 = v26 == 0;
      if (v32)
      {
        if ((*(_BYTE *)(v12 + 2) & 0x20) == 0)
          goto LABEL_23;
      }
      else if (v26)
      {
        *(_QWORD *)(v12 + 32) = v26;
        *(_QWORD *)(v12 + 72) = v28;
        goto LABEL_23;
      }
      v33 = *(_DWORD *)(v12 + 8) - 67;
      v34 = v33 > 0x1A;
      v35 = (1 << v33) & 0x5000011;
      if (v34 || v35 == 0)
      {
        *(_QWORD *)(v12 + 32) = "%s";
        *(_QWORD *)(v12 + 72) = 2;
      }
LABEL_23:
      v11 = v14 + 1;
      v12 += 96;
      if (*v13)
        v20 = v11 >= a3;
      else
        v20 = 1;
      if (v20)
      {
        if (v10)
        {
          v38 = 0;
          v39 = (unsigned int *)(a2 + 88);
          v40 = -1;
          while (1)
          {
            v41 = *v39;
            if (*v39)
            {
              if (v41 > v11)
              {
                v37 = "field number exceeds number of fields: '%s'";
                goto LABEL_81;
              }
            }
            else
            {
              v41 = v40 + 2;
              *v39 = v40 + 2;
            }
            if (v41 <= 0x40)
            {
              v42 = 1 << (v41 - 1);
              if ((v42 & v38) != 0)
              {
                v37 = "field number %u reused: '%s'";
                goto LABEL_81;
              }
              v38 |= v42;
            }
            result = 0;
            ++v40;
            v39 += 24;
            if (v14 == v40)
              return result;
          }
        }
        return 0;
      }
    }
  }
  return 0;
}

uint64_t xo_emit_hv(unint64_t a1, char *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t result;

  v4 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v4 = xo_default_handle();
  }
  *(_QWORD *)(v4 + 200) = a3;
  result = (int)xo_do_emit(v4, 0, a2);
  *(_QWORD *)(v4 + 200) = 0;
  return result;
}

uint64_t xo_do_emit(unint64_t a1, int a2, char *a3)
{
  int *v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  int v10;
  int *v11;
  char *v12;
  unsigned int v13;
  int v14;
  char *i;
  int v16;
  unsigned int v17;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 376) = 0;
  v6 = __error();
  *(_DWORD *)(a1 + 440) = *v6;
  if (!a3)
    return 0;
  v7 = ((a2 | (*(_DWORD *)a1 >> 30)) & 1) == 0 || *(int *)a1 < 0;
  v8 = v7;
  if (!v7)
  {
    v6 = (int *)xo_retain_count();
    if (*v6)
    {
      v28[0] = a3;
      v6 = (int *)xo_retain(&xo_retain, v9);
      v11 = &v6[2 * v10];
      while (1)
      {
        v11 = *(int **)v11;
        if (!v11)
          break;
        if (*((char **)v11 + 2) == a3)
        {
          v12 = (char *)*((_QWORD *)v11 + 4);
          v13 = v11[6];
          ++*((_QWORD *)v11 + 1);
          if (v12)
            return xo_do_emit_fields(a1, (uint64_t)v12, v13);
          break;
        }
      }
    }
  }
  v14 = 1;
  for (i = a3; ; ++i)
  {
    v16 = *i;
    if (v16 != 10 && v16 != 123)
      break;
    ++v14;
LABEL_20:
    ;
  }
  if (*i)
    goto LABEL_20;
  v13 = (2 * v14) | 1;
  MEMORY[0x24BDAC7A8](v6);
  v12 = (char *)v28 - v13 * (unint64_t)v17;
  bzero(v12, 96 * v13);
  bzero(v12, 96 * v13);
  if (xo_parse_fields((_BYTE *)a1, (uint64_t)v12, v13, a3))
    return 0xFFFFFFFFLL;
  if ((v8 & 1) == 0)
  {
    v28[0] = a3;
    v20 = xo_realloc(0, (96 * (2 * v14 + 2)) | 0x28);
    if (v20)
    {
      v21 = v20;
      v22 = 9 * ((a3 >> 4) & 0xFFFFFF ^ (((a3 >> 4) & 0xFFFFFF) >> 16) ^ 0x3D);
      v23 = ((982451653 * (v22 ^ (v22 >> 4))) ^ ((982451653 * (v22 ^ (v22 >> 4))) >> 15)) & 0x3F;
      v24 = v20 + 40;
      memcpy((void *)(v20 + 40), v12, 96 * v13);
      *(_OWORD *)v21 = 0u;
      *(_OWORD *)(v21 + 16) = 0u;
      *(_QWORD *)(v21 + 16) = a3;
      *(_QWORD *)(v21 + 32) = v24;
      *(_DWORD *)(v21 + 24) = v13;
      v26 = xo_retain(&xo_retain, v25);
      *(_QWORD *)v21 = *(_QWORD *)(v26 + 8 * v23);
      *(_QWORD *)(v26 + 8 * v23) = v21;
      v27 = (_DWORD *)xo_retain_count();
      ++*v27;
    }
  }
  return xo_do_emit_fields(a1, (uint64_t)v12, v13);
}

uint64_t xo_emit_h(unint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10;
  uint64_t result;

  v10 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v10 = xo_default_handle();
  }
  *(_QWORD *)(v10 + 200) = &a9;
  result = (int)xo_do_emit(v10, 0, a2);
  *(_QWORD *)(v10 + 200) = 0;
  return result;
}

uint64_t xo_emit(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10;
  uint64_t result;

  if (!*(_DWORD *)xo_default_inited())
    xo_default_init();
  v10 = xo_default_handle();
  *(_QWORD *)(v10 + 200) = &a9;
  result = (int)xo_do_emit(v10, 0, a1);
  *(_QWORD *)(v10 + 200) = 0;
  return result;
}

uint64_t xo_emit_hvf(unint64_t a1, int a2, char *a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t result;

  v6 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v6 = xo_default_handle();
  }
  *(_QWORD *)(v6 + 200) = a4;
  result = (int)xo_do_emit(v6, a2, a3);
  *(_QWORD *)(v6 + 200) = 0;
  return result;
}

uint64_t xo_emit_hf(unint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v11;
  uint64_t result;

  v11 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v11 = xo_default_handle();
  }
  *(_QWORD *)(v11 + 200) = &a9;
  result = (int)xo_do_emit(v11, a2, a3);
  *(_QWORD *)(v11 + 200) = 0;
  return result;
}

uint64_t xo_emit_f(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v11;
  uint64_t result;

  if (!*(_DWORD *)xo_default_inited())
    xo_default_init();
  v11 = xo_default_handle();
  *(_QWORD *)(v11 + 200) = &a9;
  result = (int)xo_do_emit(v11, a1, a2);
  *(_QWORD *)(v11 + 200) = 0;
  return result;
}

uint64_t xo_emit_field_hv(unint64_t a1, char *a2, const char *a3, const char *a4, const char *a5, uint64_t a6)
{
  unint64_t v10;
  char *v11;
  size_t v12;
  size_t v14;
  size_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v10 = a1;
  v22 = a6;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v10 = xo_default_handle();
  }
  v20 = 0u;
  v21 = 0u;
  if (a2)
    v11 = a2;
  else
    v11 = "V";
  v18 = 0uLL;
  v19 = 0uLL;
  v16 = 0uLL;
  v17 = 0uLL;
  if (!xo_parse_roles((_BYTE *)v10, (uint64_t)v11, v11, (uint64_t)&v16))
    return -1;
  *(_QWORD *)&v17 = a4;
  *((_QWORD *)&v17 + 1) = a3;
  *(_QWORD *)&v18 = a4;
  *((_QWORD *)&v18 + 1) = a5;
  if (a3)
    v12 = strlen(a3);
  else
    v12 = 0;
  *(_QWORD *)&v20 = v12;
  if (a4)
    v14 = strlen(a4);
  else
    v14 = 0;
  *((_QWORD *)&v20 + 1) = v14;
  if (a5)
    v15 = strlen(a5);
  else
    v15 = 0;
  *(_QWORD *)&v21 = v15;
  if (a3 && !a4 && ((DWORD2(v16) - 67) > 0x1A || ((1 << (BYTE8(v16) - 67)) & 0x5000011) == 0))
  {
    *(_QWORD *)&v18 = "%s";
    *((_QWORD *)&v20 + 1) = 2;
  }
  *(_QWORD *)(v10 + 200) = v22;
  return xo_do_emit_fields(v10, (uint64_t)&v16, 1);
}

char *xo_parse_roles(_BYTE *a1, uint64_t a2, char *a3, uint64_t a4)
{
  char *v5;
  unsigned __int8 v7;
  uint64_t v8;
  const char *v9;
  unsigned int v10;
  int64_t i;
  unsigned int v12;
  BOOL v13;
  const char *v15;
  const char *v16;
  const char *v17;
  char *v19;

  v5 = a3;
  if (!a3)
  {
    v7 = 0;
    *(_QWORD *)a4 = 0;
    goto LABEL_55;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  while (1)
  {
    v10 = *v5;
    if (v10 > 0x39)
      break;
    if (v10 != 44)
    {
      if (!*v5 || v10 == 47)
        goto LABEL_52;
LABEL_24:
      v16 = (const char *)(char)v10;
      switch((char)v10)
      {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          v7 = v10 + 10 * v7 - 48;
          goto LABEL_28;
        case 'C':
        case 'D':
        case 'E':
        case 'G':
        case 'L':
        case 'N':
        case 'P':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case '[':
        case ']':
          if (!(_DWORD)v9)
            goto LABEL_29;
          xo_printable(a2);
          v19 = "field descriptor uses multiple types: '%s'";
          goto LABEL_58;
        case 'a':
          v8 |= 0x200000uLL;
          goto LABEL_28;
        case 'c':
          v8 |= 1uLL;
          goto LABEL_28;
        case 'd':
          v8 |= 0x40uLL;
          goto LABEL_28;
        case 'e':
          v8 |= 8uLL;
          goto LABEL_28;
        case 'g':
          v8 |= 0x80000uLL;
          goto LABEL_28;
        case 'h':
          v8 |= 0x8000uLL;
          goto LABEL_28;
        case 'k':
          v8 |= 0x80uLL;
          goto LABEL_28;
        case 'l':
          v8 |= 0x2000uLL;
          goto LABEL_28;
        case 'n':
          v8 |= 0x20uLL;
          goto LABEL_28;
        case 'p':
          v8 |= 0x100000uLL;
          goto LABEL_28;
        case 'q':
          v8 |= 0x10uLL;
          goto LABEL_28;
        case 't':
          v8 |= 0x1000uLL;
          goto LABEL_28;
        case 'w':
          v8 |= 4uLL;
LABEL_28:
          v16 = v9;
LABEL_29:
          if (((_DWORD)v16 == 85 || (_DWORD)v16 == 78) && (v8 & 1) != 0)
          {
            xo_printable(a2);
            xo_failure(a1, "colon modifier on 'N' or 'U' field ignored: '%s'");
            v8 &= ~1uLL;
          }
          v9 = v16;
          goto LABEL_38;
        default:
          xo_printable(a2);
          v19 = "field descriptor uses unknown modifier: '%s'";
          goto LABEL_58;
      }
    }
    for (i = 0; ; ++i)
    {
      v12 = v5[i + 1];
      v13 = v12 > 0x3A || ((1 << v12) & 0x400900000000001) == 0;
      if (!v13 || v12 == 125)
        break;
    }
    if (i >= 1)
    {
      v15 = xo_name_lookup(xo_role_names, v5 + 1, i);
      if (v15)
      {
        v9 = v15;
      }
      else
      {
        v17 = xo_name_lookup(xo_modifier_names, v5 + 1, i);
        if (v17)
          v8 |= (unint64_t)v17;
        else
          xo_failure(a1, "unknown keyword ignored: '%.*s'");
      }
    }
    v5 += i;
LABEL_38:
    ++v5;
  }
  if (v10 != 92)
  {
    if (v10 != 58 && v10 != 125)
      goto LABEL_24;
LABEL_52:
    *(_QWORD *)a4 = v8;
    if ((_DWORD)v9)
    {
LABEL_56:
      *(_DWORD *)(a4 + 8) = (_DWORD)v9;
      *(_DWORD *)(a4 + 88) = v7;
      return v5;
    }
LABEL_55:
    LODWORD(v9) = 86;
    goto LABEL_56;
  }
  if (*++v5)
    goto LABEL_38;
  v19 = "backslash at the end of string";
LABEL_58:
  xo_failure(a1, v19);
  return 0;
}

uint64_t xo_do_emit_fields(unint64_t a1, uint64_t a2, int a3)
{
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  const char **v14;
  char *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  unint64_t v31;
  char *v32;
  char *v33;
  size_t v34;
  char *v35;
  char *v36;
  char *v37;
  unsigned int v38;
  int v39;
  char *v40;
  char *i;
  unsigned int v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  BOOL v56;
  int v57;
  const char *v58;
  char *v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  char *v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  const char *v68;
  size_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  int v76;
  char *v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  char *v94;
  unint64_t v95;
  uint64_t v96;
  char *v97;
  size_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  char *v107;
  size_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  unint64_t v115;
  uint64_t v116;
  char v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  char v122;
  int v123;
  const char *v124;
  int v125;
  const char ***v126;
  char *__s;
  char *v129;
  unint64_t v130;
  char __src;
  char v132;
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  if ((v6 & 1) != 0 || *(_WORD *)(a1 + 16) == 5)
    v125 = 0;
  else
    v125 = (v5 >> 23) & 1;
  v7 = 0x257A4F000uLL;
  if (!a3)
    goto LABEL_239;
  v119 = *(_DWORD *)a1;
  v8 = 0;
  v126 = (const char ***)(a1 + 200);
  v9 = MEMORY[0x24BDAC740];
  do
  {
    v10 = *(_DWORD *)(a2 + 8);
    if (!v10)
      break;
    v11 = *(_QWORD *)a2;
    if ((*(_QWORD *)a2 & 0x200000) != 0)
    {
      v14 = (*v126)++;
      v12 = (char *)*v14;
      if (*v14)
        v13 = strlen(*v14);
      else
        v13 = 0;
    }
    else
    {
      v12 = *(char **)(a2 + 24);
      v13 = *(_QWORD *)(a2 + 64);
    }
    if (v10 <= 77)
    {
      if (v10 == 10)
      {
        xo_line_close((_QWORD *)a1);
        if (!v125 || (xo_flush_h(a1) & 0x8000000000000000) == 0)
          goto LABEL_237;
        return -1;
      }
      if (v10 == 43)
      {
        v15 = *(char **)(a2 + 24);
        v16 = *(_QWORD *)(a2 + 64);
        goto LABEL_21;
      }
    }
    else if (v10 == 78 || v10 == 85)
    {
      if ((v11 & 4) != 0)
      {
        xo_format_content(a1, "padding", 0, " ", 1, 0, 0, v11);
        v11 &= ~4uLL;
      }
    }
    else if (v10 == 123)
    {
      v15 = *(char **)(a2 + 16);
      v16 = *(_QWORD *)(a2 + 56);
LABEL_21:
      xo_format_text(a1, v15, v16);
      goto LABEL_237;
    }
    if (v10 > 85)
    {
      switch(v10)
      {
        case ']':
          xo_anchor_stop(a1, a2, v12, v13);
          goto LABEL_233;
        case '[':
          v21 = *(_QWORD *)(a1 + 8);
          if ((v21 & 8) != 0)
          {
            xo_failure((_BYTE *)a1, "the anchor already recording is discarded");
            v21 = *(_QWORD *)(a1 + 8);
          }
          *(_QWORD *)(a1 + 8) = v21 | 8;
          *(_QWORD *)(a1 + 344) = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
          *(_QWORD *)(a1 + 352) = 0;
          *(_QWORD *)(a1 + 360) = xo_find_width(a1, a2, v12, v13);
          goto LABEL_233;
        case 'V':
          xo_format_value(a1, v12, v13, 0, 0, *(unsigned __int8 **)(a2 + 32), *(_QWORD *)(a2 + 72), *(char **)(a2 + 40), *(_QWORD *)(a2 + 80), v11);
          goto LABEL_233;
      }
      goto LABEL_53;
    }
    if (v10 != 67)
    {
      if (v10 == 71)
      {
        v17 = *(unsigned __int8 **)(a2 + 32);
        v18 = *(_QWORD *)(a2 + 72);
        v19 = *(_QWORD *)(a1 + 448);
        if (v19)
        {
          (*(void (**)(uint64_t))(v7 + 104))(v19);
          *(_QWORD *)(a1 + 448) = 0;
        }
        if (v13 | v18)
        {
          if (v13 || !v18)
          {
            *(_QWORD *)(a1 + 448) = xo_strndup(v12, v13);
          }
          else
          {
            v20 = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
            xo_do_format_field(a1, 0, v17, v18, 0);
            *(_QWORD *)(a1 + 448) = xo_strndup((char *)(v20 + *(_QWORD *)(a1 + 72)), *(_QWORD *)(a1 + 80) - (v20 + *(_QWORD *)(a1 + 72)));
            if ((v20 & 0x8000000000000000) == 0)
              *(_QWORD *)(a1 + 80) = *(_QWORD *)(a1 + 72) + v20;
          }
        }
        goto LABEL_237;
      }
LABEL_53:
      if (v13 || *(_QWORD *)(a2 + 32))
      {
        v28 = "decoration";
        switch(v10)
        {
          case 'D':
            goto LABEL_144;
          case 'E':
            v28 = "error";
            goto LABEL_144;
          case 'L':
            v28 = "label";
            goto LABEL_144;
          case 'N':
            v28 = "note";
            goto LABEL_144;
          case 'P':
            v28 = "padding";
            goto LABEL_144;
          case 'T':
            xo_format_title(a1, (uint64_t *)a2, v12, v13);
            goto LABEL_233;
          case 'U':
            xo_format_units((uint64_t *)a1, (uint64_t *)a2, v12, v13);
            goto LABEL_233;
          case 'W':
            v28 = "warning";
LABEL_144:
            v58 = "__warning";
            if (v10 != 87)
              v58 = 0;
            if (v10 == 69)
              v59 = "__error";
            else
              v59 = (char *)v58;
            xo_format_content(a1, v28, v59, v12, v13, *(unsigned __int8 **)(a2 + 32), *(_QWORD *)(a2 + 72), v11);
            break;
          default:
            xo_failure((_BYTE *)a1, "unknown field type: '%c'");
            break;
        }
      }
      goto LABEL_233;
    }
    v22 = *(unsigned __int8 **)(a2 + 32);
    v23 = *(_QWORD *)(a2 + 72);
    __s = 0;
    v129 = 0;
    v130 = 0;
    if (v13)
    {
      v24 = *(unsigned __int16 *)(a1 + 16);
      v7 = 0x257A4F000;
      if (v24 <= 5 && ((1 << v24) & 0x36) != 0)
        goto LABEL_233;
      v118 = v11;
      v130 = 0x2000;
      v25 = (char *)xo_realloc(0, 0x2000);
      __s = v25;
      v129 = v25;
      if (v12)
      {
        v26 = v25;
        if (v13 < 0x2000)
          goto LABEL_52;
        v27 = (char *)xo_realloc(v25, (v13 + 0x1FFF) & 0xFFFFFFFFFFFFE000);
        if (v27)
        {
          v26 = v27;
          __s = v27;
          v130 = (v13 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
LABEL_52:
          memcpy(v26, v12, v13);
          v129 = &v26[v13];
        }
      }
    }
    else
    {
      v118 = v11;
      v130 = 0x2000;
      v29 = (char *)xo_realloc(0, 0x2000);
      __s = v29;
      v129 = v29;
      if (v23)
      {
        xo_do_format_field(a1, (uint64_t *)&__s, v22, v23, 0);
      }
      else
      {
        strcpy(v29, "reset");
        v129 = v29 + 6;
      }
    }
    v7 = 0x257A4F000;
    if ((*(_BYTE *)(a1 + 3) & 4) == 0 || *(_WORD *)(a1 + 16) != 3 && *(_WORD *)(a1 + 16))
      goto LABEL_231;
    v30 = v129;
    if (v129 + 1 >= &__s[v130])
    {
      v31 = (v129 + 1 - __s + 0x1FFF) & 0xFFFFFFFFFFFFE000;
      v32 = (char *)xo_realloc(__s, v31);
      if (!v32)
        goto LABEL_68;
      v30 = &v32[v129 - __s];
      __s = v32;
      v129 = v30;
      v130 = v31;
    }
    *v30 = 0;
    ++v129;
LABEL_68:
    v123 = *(unsigned __int8 *)(a1 + 402);
    v120 = *(unsigned __int8 *)(a1 + 404);
    v121 = *(unsigned __int8 *)(a1 + 403);
    v33 = __s;
    v34 = strlen(__s);
    if (__s)
    {
      v35 = &__s[v34 - 1];
      if (v35 > __s)
      {
        do
        {
          v36 = v33 - 1;
          do
          {
            v37 = v36;
            v38 = v36[1];
            if ((v38 & 0x80000000) != 0)
              v39 = __maskrune(v38, 0x4000uLL);
            else
              v39 = *(_DWORD *)(v9 + 4 * v38 + 60) & 0x4000;
            ++v36;
          }
          while (v39);
          v40 = strchr(v37 + 1, 44);
          v33 = v40;
          if (v40)
          {
            *v40 = 0;
            v33 = v40 + 1;
          }
          for (i = &v37[strlen(v37 + 1)]; ; --i)
          {
            v42 = *i;
            v43 = (v42 & 0x80000000) != 0 ? __maskrune(v42, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v42 + 60) & 0x4000;
            if (i <= v36 || !v43)
              break;
            *i = 0;
          }
          v44 = *v36;
          if (v44 == 98)
          {
            if (v36[1] != 103 || v36[2] != 45)
            {
LABEL_105:
              v48 = 0;
              while (strcmp(xo_effect_names[v48], v36))
              {
                if (++v48 == 5)
                  goto LABEL_130;
              }
              if ((v48 & 0x80000000) == 0)
              {
                v49 = 1 << v48;
                v50 = v123 | (1 << v48);
                v51 = v50 & 0xE1;
                if (1 << v48 == 1)
                  v50 = 1;
                v53 = v120;
                v52 = v121;
                if (v49 == 1)
                  v54 = 0;
                else
                  v54 = v121;
                if (v49 == 1)
                  v55 = 0;
                else
                  v55 = v120;
                v56 = v49 == 2;
                if (v49 == 2)
                  v57 = v51;
                else
                  v57 = v50;
                v123 = v57;
                if (!v56)
                {
                  v52 = v54;
                  v53 = v55;
                }
                v120 = v53;
                v121 = v52;
                continue;
              }
LABEL_130:
              if ((*(_BYTE *)a1 & 0x10) != 0)
                xo_failure((_BYTE *)a1, "unknown color/effect string detected: '%s'");
              continue;
            }
            v46 = 0;
            while (strcmp(xo_color_names[v46], v36 + 3))
            {
              if (++v46 == 9)
                goto LABEL_130;
            }
            if ((v46 & 0x80000000) != 0)
              goto LABEL_130;
            v120 = v46;
          }
          else if (v44 == 102)
          {
            if (v36[1] != 103 || v36[2] != 45)
              goto LABEL_105;
            v47 = 0;
            while (strcmp(xo_color_names[v47], v36 + 3))
            {
              if (++v47 == 9)
                goto LABEL_130;
            }
            if ((v47 & 0x80000000) != 0)
              goto LABEL_130;
            v121 = v47;
          }
          else
          {
            if (v44 != 110 || v36[1] != 111 || v36[2] != 45)
              goto LABEL_105;
            v45 = 0;
            while (strcmp(xo_effect_names[v45], v36 + 3))
            {
              if (++v45 == 5)
                goto LABEL_130;
            }
            if ((v45 & 0x80000000) != 0)
              goto LABEL_130;
            v123 = (v123 & ~(1 << v45));
          }
        }
        while (v33 && v33 < v35);
      }
    }
    if ((*(_QWORD *)a1 & 0x100000000) != 0 && v121 <= 8)
      v121 = *(unsigned __int8 *)(a1 + v121 + 384);
    v7 = 0x257A4F000;
    if ((*(_QWORD *)a1 & 0x100000000) != 0 && v120 <= 8)
      v120 = *(unsigned __int8 *)(a1 + v120 + 393);
    if (!*(_WORD *)(a1 + 16))
    {
      __src = 27;
      if ((*(unsigned __int8 *)(a1 + 402) & ~v123) != 0)
      {
        v123 |= 1u;
        *(_BYTE *)(a1 + 402) = 0;
      }
      v75 = 0;
      v76 = 1;
      v77 = &v132;
      v78 = 1;
      do
      {
        if ((v76 & (*(unsigned __int8 *)(a1 + 402) ^ v123)) != 0)
        {
          v78 += snprintf(v77, 1024 - v78, ";%s", xo_effect_on_codes[v75]);
          if (v78 > 1023)
            goto LABEL_193;
          if (v76 == 1)
          {
            *(_WORD *)(a1 + 402) = 0;
            *(_BYTE *)(a1 + 404) = 0;
          }
        }
        v76 *= 2;
        v77 = &__src + v78;
        ++v75;
      }
      while (v75 != 5);
      if (v121 != *(unsigned __int8 *)(a1 + 403))
      {
        v79 = v121 - 1;
        if (!v121)
          v79 = 9;
        v78 += snprintf(v77, 1024 - v78, ";3%u", v79);
      }
      if (v120 != *(unsigned __int8 *)(a1 + 404))
      {
        v80 = v120 - 1;
        if (!v120)
          v80 = 9;
        v78 += snprintf(&__src + v78, 1024 - v78, ";4%u", v80);
      }
      if (v78 != 1 && v78 <= 1020)
      {
        v132 = 91;
        *(_WORD *)(&__src + v78) = 109;
        v81 = v78 + 1;
        if (v78 != -1)
        {
          v83 = *(_QWORD *)(a1 + 72);
          v82 = *(void **)(a1 + 80);
          if ((unint64_t)v82 + v81 < v83 + *(_QWORD *)(a1 + 88))
            goto LABEL_192;
          v84 = ((unint64_t)v82 + v81 - v83 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
          v85 = xo_realloc(*(_QWORD *)(a1 + 72), v84);
          if (v85)
          {
            v86 = v85;
            v82 = (void *)(v85 + *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72));
            *(_QWORD *)(a1 + 72) = v86;
            *(_QWORD *)(a1 + 80) = v82;
            *(_QWORD *)(a1 + 88) = v84;
LABEL_192:
            memcpy(v82, &__src, v78 + 1);
            *(_QWORD *)(a1 + 80) += v81;
          }
        }
      }
LABEL_193:
      LOBYTE(v60) = v123 & 0xFE;
LABEL_194:
      v87 = v120;
      v73 = v121;
      goto LABEL_230;
    }
    v60 = v123 & 0xFE;
    if (*(unsigned __int8 *)(a1 + 402) == v60
      && *(unsigned __int8 *)(a1 + 403) == v121
      && *(unsigned __int8 *)(a1 + 404) == v120)
    {
      goto LABEL_194;
    }
    v61 = 0;
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a1 + 408);
    v62 = 1;
    v122 = v123 & 0xFE;
    do
    {
      if ((v62 & v60) == 0)
        goto LABEL_167;
      v63 = *(_QWORD *)(a1 + 408);
      v64 = *(char **)(a1 + 416);
      if ((unint64_t)(v64 + 8) >= v63 + *(_QWORD *)(a1 + 424))
      {
        v65 = (unint64_t)&v64[-v63 + 8199] & 0xFFFFFFFFFFFFE000;
        v66 = xo_realloc(v63, v65);
        v67 = *(char **)(a1 + 416);
        if (!v66)
          goto LABEL_163;
        v64 = &v67[v66 - *(_QWORD *)(a1 + 408)];
        *(_QWORD *)(a1 + 408) = v66;
        *(_QWORD *)(a1 + 416) = v64;
        *(_QWORD *)(a1 + 424) = v65;
      }
      *(_QWORD *)v64 = 0x2D74636566666520;
      v67 = (char *)(*(_QWORD *)(a1 + 416) + 8);
      *(_QWORD *)(a1 + 416) = v67;
LABEL_163:
      v68 = xo_effect_names[v61];
      v69 = strlen(v68);
      v70 = *(_QWORD *)(a1 + 408);
      if ((unint64_t)&v67[v69] >= v70 + *(_QWORD *)(a1 + 424))
      {
        v71 = (unint64_t)&v67[v69 - v70 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v72 = xo_realloc(v70, v71);
        v60 = v123 & 0xFE;
        if (!v72)
          goto LABEL_167;
        v67 = (char *)(v72 + *(_QWORD *)(a1 + 416) - *(_QWORD *)(a1 + 408));
        *(_QWORD *)(a1 + 408) = v72;
        *(_QWORD *)(a1 + 416) = v67;
        *(_QWORD *)(a1 + 424) = v71;
      }
      memcpy(v67, v68, v69);
      *(_QWORD *)(a1 + 416) += v69;
      v60 = v123 & 0xFE;
LABEL_167:
      v62 *= 2;
      ++v61;
    }
    while (v61 != 5);
    v73 = v121;
    if (v121)
      v74 = xo_color_names[v121];
    else
      v74 = 0;
    v87 = v120;
    if (v120)
      v88 = xo_color_names[v120];
    else
      v88 = 0;
    v89 = "inverse";
    if (v88)
      v90 = v88;
    else
      v90 = "inverse";
    if (v74)
      v89 = v74;
    if ((v123 & 0x10) != 0)
      v91 = v90;
    else
      v91 = v74;
    if ((v123 & 0x10) != 0)
      v92 = v89;
    else
      v92 = v88;
    v124 = v92;
    if (v91)
    {
      v93 = *(_QWORD *)(a1 + 408);
      v94 = *(char **)(a1 + 416);
      if ((unint64_t)(v94 + 10) < v93 + *(_QWORD *)(a1 + 424))
        goto LABEL_214;
      v95 = (unint64_t)&v94[-v93 + 8201] & 0xFFFFFFFFFFFFE000;
      v96 = xo_realloc(v93, v95);
      v97 = *(char **)(a1 + 416);
      if (v96)
      {
        v94 = &v97[v96 - *(_QWORD *)(a1 + 408)];
        *(_QWORD *)(a1 + 408) = v96;
        *(_QWORD *)(a1 + 416) = v94;
        *(_QWORD *)(a1 + 424) = v95;
LABEL_214:
        *((_WORD *)v94 + 4) = 11623;
        *(_QWORD *)v94 = *(_QWORD *)" color-fg-";
        v97 = (char *)(*(_QWORD *)(a1 + 416) + 10);
        *(_QWORD *)(a1 + 416) = v97;
      }
      v98 = strlen(v91);
      v99 = *(_QWORD *)(a1 + 408);
      if ((unint64_t)&v97[v98] < v99 + *(_QWORD *)(a1 + 424))
      {
LABEL_218:
        memcpy(v97, v91, v98);
        *(_QWORD *)(a1 + 416) += v98;
      }
      else
      {
        v100 = (unint64_t)&v97[v98 - v99 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v101 = xo_realloc(v99, v100);
        if (v101)
        {
          v97 = (char *)(v101 + *(_QWORD *)(a1 + 416) - *(_QWORD *)(a1 + 408));
          *(_QWORD *)(a1 + 408) = v101;
          *(_QWORD *)(a1 + 416) = v97;
          *(_QWORD *)(a1 + 424) = v100;
          goto LABEL_218;
        }
      }
    }
    v102 = v124;
    if (v124)
    {
      v103 = *(_QWORD *)(a1 + 408);
      v104 = *(char **)(a1 + 416);
      v7 = 0x257A4F000;
      if ((unint64_t)(v104 + 10) < v103 + *(_QWORD *)(a1 + 424))
        goto LABEL_223;
      v105 = (unint64_t)&v104[-v103 + 8201] & 0xFFFFFFFFFFFFE000;
      v106 = xo_realloc(v103, v105);
      v107 = *(char **)(a1 + 416);
      if (v106)
      {
        v104 = &v107[v106 - *(_QWORD *)(a1 + 408)];
        *(_QWORD *)(a1 + 408) = v106;
        *(_QWORD *)(a1 + 416) = v104;
        *(_QWORD *)(a1 + 424) = v105;
LABEL_223:
        *((_WORD *)v104 + 4) = 11623;
        *(_QWORD *)v104 = *(_QWORD *)" color-bg-";
        v107 = (char *)(*(_QWORD *)(a1 + 416) + 10);
        *(_QWORD *)(a1 + 416) = v107;
      }
      v108 = strlen(v124);
      v109 = *(_QWORD *)(a1 + 408);
      if ((unint64_t)&v107[v108] < v109 + *(_QWORD *)(a1 + 424))
      {
LABEL_227:
        memcpy(v107, v102, v108);
        *(_QWORD *)(a1 + 416) += v108;
      }
      else
      {
        v110 = (unint64_t)&v107[v108 - v109 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v111 = xo_realloc(v109, v110);
        if (v111)
        {
          v107 = (char *)(v111 + *(_QWORD *)(a1 + 416) - *(_QWORD *)(a1 + 408));
          *(_QWORD *)(a1 + 408) = v111;
          *(_QWORD *)(a1 + 416) = v107;
          *(_QWORD *)(a1 + 424) = v110;
          v102 = v124;
          goto LABEL_227;
        }
      }
    }
    else
    {
      v7 = 0x257A4F000uLL;
    }
    LOBYTE(v60) = v122;
LABEL_230:
    *(_BYTE *)(a1 + 402) = v60;
    *(_BYTE *)(a1 + 403) = v73;
    *(_BYTE *)(a1 + 404) = v87;
LABEL_231:
    LOBYTE(v11) = v118;
    if (__s)
      (*(void (**)(char *))(v7 + 104))(__s);
LABEL_233:
    if ((v11 & 1) != 0)
      xo_format_content(a1, "decoration", 0, ":", 1, 0, 0, 0);
    if ((v11 & 4) != 0)
      xo_format_content(a1, "padding", 0, " ", 1, 0, 0, 0);
LABEL_237:
    a2 += 96;
    ++v8;
  }
  while (v8 != a3);
  v6 = *(_QWORD *)(a1 + 8);
  v5 = v119;
LABEL_239:
  *(_QWORD *)(a1 + 8) = v6 & 0xFFFFFFFFFFFFFFFELL;
  v112 = (v5 >> 22) & 1;
  if ((uint64_t)(*(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72)) > 7680)
    v112 = 1;
  v113 = v6 & 8;
  if (v112 == 1 && v113 == 0)
    v115 = (unint64_t)xo_flush_h(a1) >> 63;
  else
    LOBYTE(v115) = 0;
  v116 = *(_QWORD *)(a1 + 448);
  if (v116)
  {
    (*(void (**)(uint64_t))(v7 + 104))(v116);
    *(_QWORD *)(a1 + 448) = 0;
  }
  if ((v115 & 1) != 0)
    return -1;
  else
    return *(_QWORD *)(a1 + 376);
}

uint64_t xo_emit_field_h(unint64_t a1, char *a2, const char *a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_field_hv(a1, a2, a3, a4, a5, (uint64_t)&a9);
}

uint64_t xo_emit_field(char *a1, const char *a2, const char *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_field_hv(0, a1, a2, a3, a4, (uint64_t)&a9);
}

uint64_t xo_attr_hv(uint64_t a1, char *__s, char *a3, va_list a4)
{
  uint64_t v7;
  size_t v8;
  size_t v9;
  int v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  unint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  size_t v22;
  _BYTE *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t result;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;

  v7 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v7 = xo_default_handle();
  }
  v8 = strlen(__s);
  v9 = v8;
  v10 = *(unsigned __int16 *)(v7 + 16);
  if (v10 != 5)
  {
    if (v10 != 1)
      return 0;
    v11 = *(_QWORD *)(v7 + 120);
    v12 = *(_BYTE **)(v7 + 128);
    v13 = &v12[v9 + 5];
    if ((unint64_t)v13 >= v11 + *(_QWORD *)(v7 + 136))
    {
      v14 = (unint64_t)&v13[-v11 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
      v15 = xo_realloc(v11, v14);
      if (!v15)
        return -1;
      v12 = (_BYTE *)(v15 + *(_QWORD *)(v7 + 128) - *(_QWORD *)(v7 + 120));
      *(_QWORD *)(v7 + 120) = v15;
      *(_QWORD *)(v7 + 136) = v14;
    }
    *(_QWORD *)(v7 + 128) = v12 + 1;
    *v12 = 32;
    memcpy(*(void **)(v7 + 128), __s, v9);
    v16 = (_BYTE *)(*(_QWORD *)(v7 + 128) + v9);
    *(_QWORD *)(v7 + 128) = v16 + 1;
    *v16 = 61;
    v17 = *(_BYTE **)(v7 + 128);
    *(_QWORD *)(v7 + 128) = v17 + 1;
    *v17 = 34;
    v18 = xo_vsnprintf(v7, v7 + 120, a3, a4);
    if (v18 < 0)
    {
      v19 = *(_BYTE **)(v7 + 128);
    }
    else
    {
      v18 = xo_escape_xml((uint64_t *)(v7 + 120), v18, 1u);
      v19 = (_BYTE *)(*(_QWORD *)(v7 + 128) + v18);
      *(_QWORD *)(v7 + 128) = v19;
    }
    v34 = *(_QWORD *)(v7 + 120);
    if ((unint64_t)(v19 + 2) < v34 + *(_QWORD *)(v7 + 136))
      goto LABEL_30;
    v35 = (unint64_t)&v19[-v34 + 8193] & 0xFFFFFFFFFFFFE000;
    v36 = xo_realloc(v34, v35);
    if (v36)
    {
      v19 = (_BYTE *)(v36 + *(_QWORD *)(v7 + 128) - *(_QWORD *)(v7 + 120));
      *(_QWORD *)(v7 + 120) = v36;
      *(_QWORD *)(v7 + 136) = v35;
LABEL_30:
      *(_QWORD *)(v7 + 128) = v19 + 1;
      *v19 = 34;
      **(_BYTE **)(v7 + 128) = 0;
      return v18 + v9 + 5;
    }
    return -1;
  }
  v20 = *(_QWORD *)(v7 + 120);
  v21 = *(_QWORD *)(v7 + 128);
  if (__s && v8)
  {
    v22 = v21 + v8;
    v23 = *(_BYTE **)(v7 + 128);
    if (v21 + v9 >= v20 + *(_QWORD *)(v7 + 136))
    {
      v24 = (v22 - v20 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
      v25 = xo_realloc(*(_QWORD *)(v7 + 120), v24);
      v26 = *(_QWORD *)(v7 + 120);
      v27 = *(_BYTE **)(v7 + 128);
      if (!v25)
        goto LABEL_20;
      v23 = &v27[v25 - v26];
      *(_QWORD *)(v7 + 120) = v25;
      *(_QWORD *)(v7 + 128) = v23;
      *(_QWORD *)(v7 + 136) = v24;
    }
    memcpy(v23, __s, v9);
    v26 = *(_QWORD *)(v7 + 120);
    v27 = (_BYTE *)(*(_QWORD *)(v7 + 128) + v9);
    *(_QWORD *)(v7 + 128) = v27;
  }
  else
  {
    v26 = *(_QWORD *)(v7 + 120);
    v27 = *(_BYTE **)(v7 + 128);
  }
LABEL_20:
  if ((unint64_t)(v27 + 1) >= v26 + *(_QWORD *)(v7 + 136))
  {
    v29 = (unint64_t)&v27[-v26 + 0x2000] & 0xFFFFFFFFFFFFE000;
    v30 = xo_realloc(v26, v29);
    v31 = *(_QWORD *)(v7 + 128);
    if (!v30)
      goto LABEL_24;
    v27 = (_BYTE *)(v30 + v31 - *(_QWORD *)(v7 + 120));
    *(_QWORD *)(v7 + 120) = v30;
    *(_QWORD *)(v7 + 128) = v27;
    *(_QWORD *)(v7 + 136) = v29;
  }
  *v27 = 0;
  v31 = *(_QWORD *)(v7 + 128) + 1;
  *(_QWORD *)(v7 + 128) = v31;
LABEL_24:
  v32 = *(_QWORD *)(v7 + 120);
  result = xo_vsnprintf(v7, v7 + 120, a3, a4);
  if ((result & 0x8000000000000000) == 0)
  {
    v33 = (_BYTE *)(*(_QWORD *)(v7 + 128) + result);
    *(_QWORD *)(v7 + 128) = v33;
    *v33 = 0;
    return (int)xo_encoder_handle(v7, 15, *(_QWORD *)(v7 + 120) + v21 - v20, *(_QWORD *)(v7 + 120) + v31 - v32, 0);
  }
  return result;
}

uint64_t xo_vsnprintf(uint64_t a1, uint64_t a2, char *__format, va_list a4)
{
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);

  v8 = a2 + 8;
  v7 = *(char **)(a2 + 8);
  v9 = *(_QWORD *)a2 - (_QWORD)v7 + *(_QWORD *)(v8 + 8);
  v10 = *(uint64_t (**)(uint64_t))(a1 + 48);
  if (v10)
    result = v10(a1);
  else
    result = vsnprintf(v7, v9, __format, a4);
  if (result >= v9)
  {
    v12 = *(_QWORD *)(a2 + 8) + result;
    if (v12 >= *(_QWORD *)a2 + *(_QWORD *)(a2 + 16))
    {
      v13 = (v12 - *(_QWORD *)a2 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
      v14 = xo_realloc(*(_QWORD *)a2, v13);
      if (!v14)
        return -1;
      v15 = v14 + *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
      *(_QWORD *)a2 = v14;
      *(_QWORD *)(a2 + 8) = v15;
      *(_QWORD *)(a2 + 16) = v13;
    }
    v16 = *(uint64_t (**)(uint64_t))(a1 + 48);
    if (v16)
      return v16(a1);
    else
      return vsnprintf(*(char **)(a2 + 8), *(_QWORD *)a2 - *(_QWORD *)(a2 + 8) + *(_QWORD *)(a2 + 16), __format, a4);
  }
  return result;
}

uint64_t xo_attr_h(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_attr_hv(a1, a2, a3, &a9);
}

uint64_t xo_attr(char *__s, char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  return xo_attr_hv(0, __s, a2, va);
}

uint64_t xo_set_depth(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t result;
  int v5;

  v3 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v3 = xo_default_handle();
  }
  result = xo_depth_check(v3, a2);
  if (!(_DWORD)result)
  {
    v5 = *(_DWORD *)(v3 + 176) + a2;
    *(_DWORD *)(v3 + 176) = v5;
    *(_WORD *)(v3 + 18) += a2;
    if (*(_WORD *)(v3 + 16) == 2 && (*(_BYTE *)(v3 + 2) & 1) == 0 && v5 >= 1)
      *(_QWORD *)(v3 + 8) |= 4uLL;
  }
  return result;
}

uint64_t xo_depth_check(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_DWORD *)(a1 + 180) > a2)
    return 0;
  v4 = a2 + 128;
  v5 = xo_realloc(*(_QWORD *)(a1 + 168), 24 * (int)v4);
  if (v5)
  {
    v6 = v5;
    bzero((void *)(v5 + 24 * *(int *)(a1 + 180)), 24 * (v4 - *(int *)(a1 + 180)));
    result = 0;
    *(_DWORD *)(a1 + 180) = v4;
    *(_QWORD *)(a1 + 168) = v6;
  }
  else
  {
    xo_failure((_BYTE *)a1, "xo_depth_check: out of memory (%d)");
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t xo_open_container_hf(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, a2, a3, 1, a5, a6, a7, a8);
}

uint64_t xo_transition(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  int v21;
  int v22;
  _BYTE *v23;
  char *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;

  v8 = a4;
  v11 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v11 = xo_default_handle();
  }
  v12 = *(_QWORD *)(v11 + 168);
  v13 = *(_DWORD *)(v11 + 176);
  v14 = v12 + 24 * v13;
  v15 = *(_DWORD *)(v14 + 4);
  if (v15 != 10 || v13 == 0)
  {
    v17 = *(_DWORD *)(v14 + 4);
  }
  else
  {
    v18 = 24 * v13;
    do
    {
      v17 = *(_DWORD *)(v12 + v18 - 20);
      v19 = v17 != 10 || v18 == 24;
      v18 -= 24;
    }
    while (!v19);
  }
  v20 = 0;
  v21 = v8 | (v17 << 8);
  if (v21 > 768)
  {
    switch(v21)
    {
      case 769:
LABEL_25:
        if (v15 == 10)
          goto LABEL_32;
        v22 = xo_do_close_leaf_list(v11, 0);
        if (v22 < 0)
          goto LABEL_62;
        goto LABEL_35;
      case 770:
      case 772:
      case 774:
      case 776:
        goto LABEL_31;
      case 771:
        if (v15 == 10)
          goto LABEL_32;
        v22 = xo_do_close_list(v11, 0);
LABEL_53:
        if ((v22 & 0x80000000) == 0)
          goto LABEL_54;
        goto LABEL_62;
      case 773:
        goto LABEL_61;
      case 775:
LABEL_37:
        if (v15 == 10)
          goto LABEL_32;
        v22 = xo_do_close_list(v11, 0);
        if ((v22 & 0x80000000) == 0)
          goto LABEL_39;
        goto LABEL_62;
      case 777:
      case 778:
        goto LABEL_66;
      case 779:
        if (v15 == 10)
          goto LABEL_32;
        v23 = (_BYTE *)v11;
        v24 = 0;
        v25 = 4;
        goto LABEL_34;
      case 780:
        goto LABEL_69;
      default:
        switch(v21)
        {
          case 1281:
            goto LABEL_35;
          case 1282:
          case 1288:
            goto LABEL_31;
          case 1283:
            goto LABEL_54;
          case 1284:
            goto LABEL_33;
          case 1285:
            v26 = v11;
            if (v15 == 10)
              goto LABEL_60;
            v22 = xo_do_close_instance(v11, 0);
            if (v22 < 0)
              goto LABEL_62;
            goto LABEL_61;
          case 1286:
            if (v15 == 10)
              goto LABEL_32;
            v22 = xo_do_close_instance(v11, a3);
            goto LABEL_62;
          case 1287:
          case 1292:
            goto LABEL_39;
          case 1289:
          case 1290:
            goto LABEL_66;
          case 1291:
            goto LABEL_69;
          default:
            switch(v21)
            {
              case 1793:
                goto LABEL_25;
              case 1794:
              case 1798:
                if (v15 == 10)
                  goto LABEL_32;
                v22 = xo_do_close_leaf_list(v11, 0);
                if (v22 < 0)
                  goto LABEL_62;
                goto LABEL_33;
              case 1795:
                if (v15 == 10)
                  goto LABEL_32;
                v22 = xo_do_close_leaf_list(v11, 0);
                goto LABEL_53;
              case 1796:
                goto LABEL_33;
              case 1797:
                if (v15 == 10)
                  goto LABEL_32;
                v22 = xo_do_close_leaf_list(v11, 0);
                if (v22 < 0)
                  goto LABEL_62;
                goto LABEL_61;
              case 1799:
                goto LABEL_37;
              case 1800:
                if (v15 == 10)
                  goto LABEL_32;
                v27 = v11;
                v28 = a3;
                goto LABEL_50;
              case 1803:
                if (v15 == 10)
                  goto LABEL_32;
                v27 = v11;
                v28 = 0;
LABEL_50:
                v22 = xo_do_close_leaf_list(v27, v28);
                break;
              case 1804:
                goto LABEL_69;
              default:
                goto LABEL_66;
            }
            goto LABEL_62;
        }
    }
  }
  switch(v21)
  {
    case 1:
LABEL_35:
      v20 = xo_do_open_container(v11, a2, a3);
      if ((v20 & 0x8000000000000000) == 0)
        goto LABEL_69;
      goto LABEL_72;
    case 2:
      v22 = xo_do_close_container(v11, a3);
      goto LABEL_62;
    case 3:
LABEL_54:
      v22 = xo_do_open_list(v11, a2, a3, a4, a5, a6, a7, a8);
      goto LABEL_62;
    case 4:
LABEL_33:
      v23 = (_BYTE *)v11;
      v24 = a3;
      v25 = v8;
LABEL_34:
      xo_do_close(v23, v24, v25);
      goto LABEL_68;
    case 5:
LABEL_40:
      v26 = v11;
LABEL_60:
      v22 = xo_do_open_list(v26, a2, a3, a4, a5, a6, a7, a8);
      if ((v22 & 0x80000000) == 0)
LABEL_61:
        v22 = xo_do_open_instance(v11, a2, a3);
      goto LABEL_62;
    case 6:
      v29 = "xo_close_instance ignored when called from initial state ('%s')";
      goto LABEL_67;
    case 7:
    case 12:
LABEL_39:
      v22 = xo_do_open_leaf_list(v11, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
LABEL_62:
      v20 = v22;
      if ((v22 & 0x8000000000000000) != 0)
        goto LABEL_72;
      goto LABEL_69;
    case 8:
      v29 = "xo_close_leaf_list ignored when called from initial state ('%s')";
      goto LABEL_67;
    case 9:
    case 10:
LABEL_66:
      v29 = "unknown transition: (%u -> %u)";
LABEL_67:
      xo_failure((_BYTE *)v11, v29);
LABEL_68:
      v20 = 0;
      goto LABEL_69;
    case 11:
LABEL_69:
      if ((*(_BYTE *)(v11 + 2) & 0x40) != 0 && xo_flush_h(v11) < 0)
        v20 = -1;
LABEL_72:
      *(_QWORD *)(v11 + 8) |= 0x40uLL;
      break;
    default:
      switch(v21)
      {
        case 257:
          goto LABEL_35;
        case 258:
        case 262:
        case 264:
LABEL_31:
          if (v15 != 10)
            goto LABEL_33;
LABEL_32:
          xo_failure((_BYTE *)v11, "marker '%s' prevents transition from %s to %s");
          v20 = -1;
          break;
        case 259:
          goto LABEL_54;
        case 260:
          goto LABEL_33;
        case 261:
          goto LABEL_40;
        case 263:
        case 268:
          goto LABEL_39;
        case 267:
          goto LABEL_69;
        default:
          goto LABEL_66;
      }
      break;
  }
  return v20;
}

uint64_t xo_open_container_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, a2, 1, a5, a6, a7, a8);
}

uint64_t xo_open_container(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, a1, 1, a5, a6, a7, a8);
}

uint64_t xo_open_container_hd(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 1024, a2, 1, a5, a6, a7, a8);
}

uint64_t xo_open_container_d(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 1024, a1, 1, a5, a6, a7, a8);
}

uint64_t xo_close_container_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, a2, 2, a5, a6, a7, a8);
}

uint64_t xo_close_container(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, a1, 2, a5, a6, a7, a8);
}

uint64_t xo_close_container_hd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, 0, 2, a5, a6, a7, a8);
}

uint64_t xo_close_container_d(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, 0, 2, a5, a6, a7, a8);
}

uint64_t xo_open_list_hf(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, a2, a3, 3, a5, a6, a7, a8);
}

uint64_t xo_open_list_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, a2, 3, a5, a6, a7, a8);
}

uint64_t xo_open_list(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, a1, 3, a5, a6, a7, a8);
}

uint64_t xo_open_list_hd(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 1024, a2, 3, a5, a6, a7, a8);
}

uint64_t xo_open_list_d(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 1024, a1, 3, a5, a6, a7, a8);
}

uint64_t xo_close_list_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, a2, 4, a5, a6, a7, a8);
}

uint64_t xo_close_list(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, a1, 4, a5, a6, a7, a8);
}

uint64_t xo_close_list_hd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, 0, 4, a5, a6, a7, a8);
}

uint64_t xo_close_list_d(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, 0, 4, a5, a6, a7, a8);
}

uint64_t xo_open_instance_hf(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, a2, a3, 5, a5, a6, a7, a8);
}

uint64_t xo_open_instance_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, a2, 5, a5, a6, a7, a8);
}

uint64_t xo_open_instance(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, a1, 5, a5, a6, a7, a8);
}

uint64_t xo_open_instance_hd(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 1024, a2, 5, a5, a6, a7, a8);
}

uint64_t xo_open_instance_d(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 1024, a1, 5, a5, a6, a7, a8);
}

uint64_t xo_close_instance_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, a2, 6, a5, a6, a7, a8);
}

uint64_t xo_close_instance(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, a1, 6, a5, a6, a7, a8);
}

uint64_t xo_close_instance_hd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0, 0, 6, a5, a6, a7, a8);
}

uint64_t xo_close_instance_d(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0, 0, 0, 6, a5, a6, a7, a8);
}

uint64_t xo_open_marker_h(uint64_t a1, char *a2)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
  }
  xo_depth_change((_BYTE *)a1, a2, 1, 0, 0xAu, *(_DWORD *)(*(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176)) & 0xF1);
  return 0;
}

_BYTE *xo_depth_change(_BYTE *result, char *__s1, int a3, __int16 a4, unsigned int a5, int a6)
{
  _BYTE *v8;
  int v9;
  uint64_t v12;
  unsigned int v13;
  int v14;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  _QWORD *v25;
  const char *v26;
  uint64_t v27;
  _QWORD *v28;
  _BYTE *v29;
  char *v30;
  int v31;

  v8 = result;
  v9 = *((unsigned __int16 *)result + 8);
  if (v9 == 3 || v9 == 0)
    a4 = 0;
  v12 = *(_QWORD *)result;
  v13 = (*(_QWORD *)result >> 7) & 8 | a6;
  v14 = *((_DWORD *)result + 44);
  if ((a3 & 0x80000000) == 0)
  {
    result = (_BYTE *)xo_depth_check((uint64_t)result, v14 + a3);
    if ((_DWORD)result)
      return result;
    v16 = *((_QWORD *)v8 + 21);
    v17 = *((_DWORD *)v8 + 44);
    v18 = v17 + a3;
    v19 = (unsigned int *)(v16 + 24 * v18);
    *v19 = v13;
    v19[1] = a5;
    v20 = *(_QWORD *)v8;
    if ((*(_QWORD *)v8 & 0x2000) != 0)
    {
      *(_DWORD *)(v16 + 24 * v17) |= 1u;
      *(_QWORD *)v8 = v20 & 0xFFFFFFFFFFFFDFFFLL;
    }
    if (__s1)
      v21 = __s1;
    else
      v21 = "failure";
    result = xo_strndup(v21, 0xFFFFFFFFFFFFFFFFLL);
    *(_QWORD *)(v16 + 24 * (int)v18 + 8) = result;
    goto LABEL_21;
  }
  if (v14)
  {
    v22 = *((_QWORD *)result + 21);
    v23 = v22 + 24 * v14;
    v26 = *(const char **)(v23 + 8);
    v25 = (_QWORD *)(v23 + 8);
    v24 = v26;
    if ((v12 & 0x10) == 0)
    {
LABEL_17:
      if (v24)
      {
        xo_free(v24);
        *v25 = 0;
      }
      v27 = v22 + 24 * v14;
      v29 = *(_BYTE **)(v27 + 16);
      v28 = (_QWORD *)(v27 + 16);
      result = v29;
      if (v29)
      {
        result = (_BYTE *)xo_free(result);
        *v28 = 0;
      }
LABEL_21:
      *((_DWORD *)v8 + 44) += a3;
      *((_WORD *)v8 + 9) += a4;
      return result;
    }
    if (__s1 && v24 && strcmp(__s1, v24))
    {
      v30 = "incorrect close: '%s' .vs. '%s'";
    }
    else
    {
      v31 = *(_DWORD *)(v22 + 24 * v14) ^ v13;
      if ((v31 & 2) != 0)
      {
        v30 = "list close on list confict: '%s'";
      }
      else
      {
        if ((v31 & 4) == 0)
          goto LABEL_17;
        v30 = "list close on instance confict: '%s'";
      }
    }
  }
  else
  {
    if ((v12 & 0x1000) != 0)
      return result;
    v30 = "close with empty stack: '%s'";
  }
  return xo_failure(v8, v30);
}

uint64_t xo_open_marker(char *a1)
{
  xo_open_marker_h(0, a1);
  return 0;
}

uint64_t xo_close_marker_h(_BYTE *a1, char *a2)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = (_BYTE *)xo_default_handle();
  }
  xo_do_close(a1, a2, 10);
  return 0;
}

_BYTE *xo_do_close(_BYTE *result, char *__s1, int a3)
{
  _BYTE *v4;
  char v5;
  int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  char v12;
  const char *v13;
  char *v14;

  v4 = result;
  v5 = 1;
  v6 = 1;
  switch(a3)
  {
    case 2:
      goto LABEL_6;
    case 4:
      v6 = 3;
      goto LABEL_6;
    case 6:
      v6 = 5;
      goto LABEL_6;
    case 8:
      v6 = 7;
      goto LABEL_6;
    case 10:
      v5 = 0;
      v6 = 10;
LABEL_6:
      v7 = *((_DWORD *)result + 44);
      if (v7 < 1)
        goto LABEL_17;
      v8 = *((_QWORD *)result + 21);
      v9 = v8 + 24 * v7;
      v10 = v5 ^ 1;
      break;
    default:
      return result;
  }
  while (1)
  {
    v11 = *(_DWORD *)(v9 + 4);
    v12 = v11 == 10 ? v10 : 1;
    if ((v12 & 1) == 0)
      break;
    if (v11 == v6)
    {
      if (!__s1)
        return (_BYTE *)xo_do_close_all((uint64_t)v4, v9);
      v13 = *(const char **)(v9 + 8);
      if (!v13 || !strcmp(__s1, v13))
        return (_BYTE *)xo_do_close_all((uint64_t)v4, v9);
    }
    v9 -= 24;
    if (v9 <= v8)
    {
LABEL_17:
      v14 = "xo_%s can't find match for '%s'";
      return xo_failure(v4, v14);
    }
  }
  if (__s1)
  {
    v14 = "close (xo_%s) fails at marker '%s'; not found '%s'";
    return xo_failure(v4, v14);
  }
  xo_failure(v4, "close stops at marker '%s'");
  return (_BYTE *)xo_do_close_all((uint64_t)v4, v9);
}

uint64_t xo_close_marker(char *a1)
{
  xo_close_marker_h(0, a1);
  return 0;
}

_QWORD *xo_set_writer(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = (_QWORD *)xo_default_handle();
  }
  result[8] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

uint64_t (*xo_set_allocator(uint64_t (*result)(void), uint64_t (*a2)(void)))(void)
{
  xo_realloc = result;
  xo_free = a2;
  return result;
}

uint64_t xo_flush()
{
  return xo_flush_h(0);
}

uint64_t xo_finish_h(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v8 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v8 = xo_default_handle();
  }
  if ((*(_BYTE *)(v8 + 3) & 1) == 0)
    xo_do_close_all(v8, *(_QWORD *)(v8 + 168));
  v9 = *(unsigned __int16 *)(v8 + 16);
  if (v9 == 5)
  {
    xo_encoder_handle(v8, 12, 0, 0, 0);
  }
  else if (v9 == 2 && (*(_QWORD *)v8 & 0x10000) == 0)
  {
    v10 = "\n";
    if ((*(_QWORD *)v8 & 2) == 0)
      v10 = (const char *)&xo_version_extra;
    v11 = *(_QWORD *)(v8 + 8);
    if ((v11 & 4) != 0)
    {
      *(_QWORD *)(v8 + 8) = v11 & 0xFFFFFFFFFFFFFFFBLL;
    }
    else if ((v11 & 0x40) == 0)
    {
      v10 = (const char *)&xo_version_extra;
    }
    xo_printf(v8, "%s%*s%s}\n", a3, a4, a5, a6, a7, a8, (char)v10);
  }
  return xo_flush_h(v8);
}

uint64_t xo_do_close_all(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v2 = *(_QWORD *)(result + 168) + 24 * *(int *)(result + 176);
  if (v2 >= a2)
  {
    v4 = result;
    v5 = 0;
    while (2)
    {
      v6 = *(unsigned int *)(v2 + 4);
      switch((int)v6)
      {
        case 0:
          goto LABEL_12;
        case 1:
          result = xo_do_close_container(v4, 0);
          goto LABEL_8;
        case 3:
          result = xo_do_close_list(v4, 0);
          goto LABEL_8;
        case 5:
          result = xo_do_close_instance(v4, 0);
          goto LABEL_8;
        case 7:
          result = xo_do_close_leaf_list(v4, 0);
LABEL_8:
          v5 = (int)result;
          goto LABEL_9;
        case 10:
          v7 = *(_DWORD *)v2 & 0xF1;
          result = (uint64_t)xo_depth_change((_BYTE *)v4, *(char **)(v2 + 8), -1, 0, 0xAu, 0);
          v6 = 0;
          *(_DWORD *)(*(_QWORD *)(v4 + 168) + 24 * *(int *)(v4 + 176)) |= v7;
          goto LABEL_12;
        default:
LABEL_9:
          if (v5 < 0)
            result = (uint64_t)xo_failure((_BYTE *)v4, "close %d failed: %d");
          v6 = v5;
LABEL_12:
          v2 -= 24;
          v5 = v6;
          if (v2 < a2)
            return result;
          continue;
      }
    }
  }
  return result;
}

uint64_t xo_indent(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
  }
  if ((*(_BYTE *)a1 & 2) != 0)
    return (*(unsigned __int16 *)(a1 + 20) & (*(unsigned __int8 *)(a1 + 8) << 29 >> 31))
         + *(unsigned __int16 *)(a1 + 20) * *(unsigned __int16 *)(a1 + 18);
  else
    return 0;
}

uint64_t xo_finish_atexit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_finish_h(0, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t xo_errorn_hv(uint64_t result, int a2, char *a3, va_list a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  size_t v12;
  size_t v13;
  int v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  _QWORD v21[2];

  v11 = result;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v21[0] = a4;
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
    v11 = result;
  }
  if (a2)
  {
    result = strlen(a3);
    if (result >= 1)
    {
      v12 = result;
      if (a3[result - 1] != 10)
      {
        MEMORY[0x24BDAC7A8](result);
        bzero((char *)v21 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0), v13);
        result = (uint64_t)memcpy((char *)v21 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0), a3, v12);
        *(_WORD *)((char *)v21 + v12 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0)) = 10;
        a3 = (char *)v21 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0);
      }
    }
  }
  v14 = *(unsigned __int16 *)(v11 + 16);
  if ((v14 - 1) < 2)
  {
    *(_QWORD *)(v11 + 200) = v21[0];
    xo_transition(v11, 0, "error", 1, a5, a6, a7, a8);
    v15 = strlen(a3);
    xo_format_value(v11, "message", 7uLL, 0, 0, (unsigned __int8 *)a3, v15, 0, 0, 0);
    result = xo_transition(v11, 0, "error", 2, v16, v17, v18, v19);
LABEL_17:
    *(_QWORD *)(v11 + 200) = 0;
    return result;
  }
  if (v14 == 3)
  {
    *(_QWORD *)(v11 + 200) = v21[0];
    v20 = strlen(a3);
    xo_buf_append_div(v11, "error", 0, 0, 0, 0, 0, a3, v20, 0, 0);
    if ((*(_BYTE *)(v11 + 8) & 2) != 0)
      xo_line_close((_QWORD *)v11);
    result = xo_write((_QWORD *)v11);
    goto LABEL_17;
  }
  if (!*(_WORD *)(v11 + 16))
    return vfprintf((FILE *)*MEMORY[0x24BDAC8D8], a3, a4);
  return result;
}

_QWORD *xo_line_close(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = result;
  if (!*((_WORD *)result + 8))
    return xo_data_append(v1, "\n", 1uLL);
  if (*((_WORD *)result + 8) == 3)
  {
    v2 = result[1];
    if ((v2 & 2) == 0)
    {
      xo_line_ensure_open(result);
      v2 = v1[1];
    }
    v1[1] = v2 & 0xFFFFFFFFFFFFFFFDLL;
    result = xo_data_append(v1, xo_line_close_div_close, 6uLL);
    if ((*(_BYTE *)v1 & 2) != 0)
      return xo_data_append(v1, "\n", 1uLL);
  }
  return result;
}

_QWORD *xo_format_value(unint64_t a1, char *a2, size_t a3, char *a4, uint64_t a5, unsigned __int8 *a6, size_t a7, char *a8, size_t a9, uint64_t a10)
{
  uint64_t v17;
  uint64_t v18;
  int v19;
  int *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  int v44;
  _QWORD *result;
  int v46;
  size_t v47;
  _QWORD *v48;
  uint64_t v49;
  _BYTE *v50;
  size_t v51;
  unsigned int v52;
  char v53;
  _BYTE *v54;
  _BYTE *v55;
  uint64_t v56;
  size_t v57;
  unsigned int v58;
  uint64_t v59;
  int *v60;
  int v61;
  char v62;
  size_t v63;
  unsigned int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  unsigned __int8 *v68;
  uint64_t v69;
  BOOL is_numeric;
  char *v71;
  _QWORD *v72;
  size_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  size_t v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v86 = a5;
  v17 = a10;
  v90 = *MEMORY[0x24BDAC8D0];
  v84 = *(_QWORD *)a1;
  v18 = *(_QWORD *)(a1 + 168);
  v19 = *(_DWORD *)(a1 + 176);
  v20 = (int *)(v18 + 24 * v19);
  if ((a10 & 0x2000) != 0)
  {
    if ((*v20 & 0xE0) != 0x80)
    {
      MEMORY[0x24BDAC7A8](a1);
      memcpy((char *)&v83 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), a2, a3);
      *((_BYTE *)&v83 + a3 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0)) = 0;
      if (xo_transition(a1, 0, (char *)&v83 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), 12, v30, v31, v32, v33) < 0)
        v17 |= 0x48uLL;
      else
        *(_DWORD *)(*(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176)) |= 0x80u;
      v18 = *(_QWORD *)(a1 + 168);
      v19 = *(_DWORD *)(a1 + 176);
    }
    v41 = v18 + 24 * v19;
    v42 = *(char **)(v41 + 8);
    if (v42)
    {
      a3 = strlen(*(const char **)(v41 + 8));
      a2 = v42;
    }
    goto LABEL_24;
  }
  v21 = *v20;
  if ((a10 & 0x80) != 0)
  {
    if ((a10 & 0x40) != 0 || (v21 & 0x20) == 0)
    {
      if ((v21 & 0x40) == 0)
      {
        MEMORY[0x24BDAC7A8](a1);
        memcpy((char *)&v83 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), a2, a3);
        *((_BYTE *)&v83 + a3 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0)) = 0;
        if (xo_transition(a1, 0, (char *)&v83 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), 11, v34, v35, v36, v37) < 0)
        {
          v17 |= 0x48uLL;
          v26 = *(_QWORD *)(a1 + 168);
          v38 = *(_DWORD *)(a1 + 176);
          v40 = *(_DWORD *)(v26 + 24 * v38);
        }
        else
        {
          v26 = *(_QWORD *)(a1 + 168);
          v38 = *(_DWORD *)(a1 + 176);
          v39 = 24 * v38;
          v40 = *(_DWORD *)(v26 + v39) | 0x40;
          *(_DWORD *)(v26 + v39) = v40;
        }
        v43 = 24 * v38;
        v44 = v40 | 0x40;
        goto LABEL_23;
      }
    }
    else
    {
      xo_failure((_BYTE *)a1, "key field emitted after normal value field: '%.*s'");
    }
  }
  else if ((*v20 & 0xA0) != 0x20)
  {
    MEMORY[0x24BDAC7A8](a1);
    memcpy((char *)&v83 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), a2, a3);
    *((_BYTE *)&v83 + a3 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0)) = 0;
    if (xo_transition(a1, 0, (char *)&v83 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), 11, v22, v23, v24, v25) < 0)
    {
      v17 |= 0x48uLL;
      v26 = *(_QWORD *)(a1 + 168);
      v27 = *(_DWORD *)(a1 + 176);
      v29 = *(_DWORD *)(v26 + 24 * v27);
    }
    else
    {
      v26 = *(_QWORD *)(a1 + 168);
      v27 = *(_DWORD *)(a1 + 176);
      v28 = 24 * v27;
      v29 = *(_DWORD *)(v26 + v28) | 0x20;
      *(_DWORD *)(v26 + v28) = v29;
    }
    v43 = 24 * v27;
    v44 = v29 | 0x20;
LABEL_23:
    *(_DWORD *)(v26 + v43) = v44;
  }
LABEL_24:
  v87 = 0;
  v88 = 0;
  v89 = 0;
  result = xo_xml_leader_len((_BYTE *)a1, a2);
  v46 = *(unsigned __int16 *)(a1 + 16);
  v85 = a4;
  v47 = a9;
  v48 = (_QWORD *)(a1 + 72);
  switch(v46)
  {
    case 0:
      v49 = *(_QWORD *)(a1 + 376);
      v87 = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
      v88 = v49;
      v89 = *(_QWORD *)(a1 + 352);
      if (v86)
      {
        result = (_QWORD *)xo_data_append_content(a1, v85, v86, ((_DWORD)v17 << 8) & 0x800 | v17);
        if ((v17 & 0x8000) == 0)
          return result;
        return (_QWORD *)xo_format_humanize(a1, (unint64_t *)(a1 + 72), &v87, ((_DWORD)v17 << 8) & 0x800 | v17);
      }
      result = (_QWORD *)xo_do_format_field(a1, 0, a6, a7, ((_DWORD)v17 << 8) & 0x800 | v17);
      if ((v17 & 0x8000) != 0)
        return (_QWORD *)xo_format_humanize(a1, (unint64_t *)(a1 + 72), &v87, ((_DWORD)v17 << 8) & 0x800 | v17);
      return result;
    case 1:
      if ((v17 & 0x40) != 0)
        goto LABEL_80;
      v50 = result;
      if (!a8)
      {
        MEMORY[0x24BDAC7A8](result);
        a8 = (char *)&v83 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0);
        bzero(a8, v51);
        memcpy(a8, a6, a7);
        a8[a7] = 0;
        if (*a8 == 37 && (a8[1] - 48) <= 9)
        {
          do
          {
            v52 = a8[2] - 48;
            ++a8;
          }
          while (v52 < 0xA);
          *a8 = 37;
        }
        v47 = strlen(a8);
      }
      if (!a3)
      {
        xo_failure((_BYTE *)a1, "missing field name: %s");
        a2 = xo_format_value_missing;
        a3 = 18;
      }
      v53 = v84;
      if ((v84 & 2) != 0)
        xo_buf_indent((_QWORD *)a1, -1);
      xo_data_append((_QWORD *)a1, "<", 1uLL);
      if (*v50)
        xo_data_append((_QWORD *)a1, v50, 1uLL);
      xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
      v54 = *(_BYTE **)(a1 + 120);
      v55 = *(_BYTE **)(a1 + 128);
      if (v55 != v54)
      {
        xo_data_append((_QWORD *)a1, v54, v55 - v54);
        *(_QWORD *)(a1 + 128) = *(_QWORD *)(a1 + 120);
      }
      v56 = *(_QWORD *)a1;
      if ((v17 & 0x80) != 0 && (v56 & 0x800) != 0)
      {
        xo_data_append((_QWORD *)a1, xo_format_value_attr, 0xAuLL);
        v56 = *(_QWORD *)a1;
      }
      if ((v56 & 0x40000) != 0)
      {
        *(_QWORD *)(a1 + 8) |= 0x10uLL;
        *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
      }
      xo_data_append((_QWORD *)a1, ">", 1uLL);
      if (v86)
        xo_data_append_content(a1, v85, v86, v17);
      else
        xo_do_format_field(a1, 0, (unsigned __int8 *)a8, v47, v17);
      xo_data_append((_QWORD *)a1, "</", 2uLL);
      if (*v50)
        xo_data_append((_QWORD *)a1, v50, 1uLL);
      xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
      result = xo_data_append((_QWORD *)a1, ">", 1uLL);
      if ((v53 & 2) != 0)
      {
        v71 = "\n";
        goto LABEL_127;
      }
      return result;
    case 2:
      if ((v17 & 0x40) != 0)
        goto LABEL_80;
      if (!a8)
      {
        MEMORY[0x24BDAC7A8](result);
        a8 = (char *)&v83 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0);
        bzero(a8, v57);
        memcpy(a8, a6, a7);
        a8[a7] = 0;
        if (*a8 == 37 && (a8[1] - 48) <= 9)
        {
          do
          {
            v58 = a8[2] - 48;
            ++a8;
          }
          while (v58 < 0xA);
          *a8 = 37;
        }
        v47 = strlen(a8);
      }
      v59 = *(_QWORD *)a1;
      v60 = (int *)(*(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176));
      v61 = *v60;
      if ((*(_QWORD *)a1 & 0x2000) != 0)
      {
        v61 |= 1u;
        *v60 = v61;
        *(_QWORD *)a1 = v59 & 0xFFFFFFFFFFFFDFFFLL;
      }
      v62 = v84;
      if ((v61 & 1) != 0)
      {
        xo_data_append((_QWORD *)a1, ",", 1uLL);
        if ((v17 & 0x2000) == 0 && (*(_BYTE *)a1 & 2) != 0)
          xo_data_append((_QWORD *)a1, "\n", 1uLL);
      }
      else
      {
        *v60 = v61 | 1;
      }
      if ((v17 & 0x10) != 0)
        goto LABEL_91;
      if ((v17 & 0x20) != 0)
      {
        is_numeric = 1;
      }
      else if (v86)
      {
LABEL_91:
        is_numeric = 0;
      }
      else if (v47)
      {
        is_numeric = xo_format_is_numeric(a8, v47);
      }
      else
      {
        a8 = "true";
        is_numeric = 1;
        v47 = 4;
      }
      if (!a3)
      {
        xo_failure((_BYTE *)a1, "missing field name: %s");
        a2 = xo_format_value_missing_219;
        a3 = 18;
      }
      if ((v17 & 0x2000) != 0)
      {
        if ((v61 & 1) != 0 && (v62 & 2) != 0)
        {
          xo_data_append((_QWORD *)a1, "\n", 1uLL);
          v76 = v86;
        }
        else
        {
          v76 = v86;
          if ((v62 & 2) == 0)
            goto LABEL_119;
        }
        xo_buf_indent((_QWORD *)a1, -1);
      }
      else
      {
        if ((v62 & 2) != 0)
          xo_buf_indent((_QWORD *)a1, -1);
        xo_data_append((_QWORD *)a1, "\"", 1uLL);
        v75 = *(_QWORD *)(a1 + 72);
        v74 = *(_QWORD *)(a1 + 80);
        xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
        v76 = v86;
        if ((*(_BYTE *)(a1 + 2) & 0x10) != 0)
        {
          v77 = v74 - v75;
          v78 = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
          if (v74 - v75 < v78)
          {
            do
            {
              if (*(_BYTE *)(*v48 + v77) == 45)
                *(_BYTE *)(*v48 + v77) = 95;
              ++v77;
            }
            while (v77 < v78);
          }
        }
        xo_data_append((_QWORD *)a1, "\":", 2uLL);
        if ((v84 & 2) != 0)
          xo_data_append((_QWORD *)a1, " ", 1uLL);
      }
LABEL_119:
      if (!is_numeric)
      {
        xo_data_append((_QWORD *)a1, "\"", 1uLL);
        if (v76)
          xo_data_append_content(a1, v85, v76, v17);
        else
          xo_do_format_field(a1, 0, (unsigned __int8 *)a8, v47, v17);
        v71 = "\"";
LABEL_127:
        v72 = (_QWORD *)a1;
        v73 = 1;
        return xo_data_append(v72, v71, v73);
      }
      v67 = a1;
      if (!v76)
      {
        v68 = (unsigned __int8 *)a8;
        v69 = v47;
        v66 = v17;
        return (_QWORD *)xo_do_format_field(v67, 0, v68, v69, v66);
      }
      return (_QWORD *)xo_data_append_content(a1, v85, v76, v17);
    case 3:
      return xo_buf_append_div(a1, "data", ((_DWORD)v17 << 8) & 0x800 | v17, a2, a3, v85, v86, a6, a7, a8, a9);
    case 4:
      if ((v17 & 0x40) != 0)
        goto LABEL_80;
      if (!a8)
      {
        MEMORY[0x24BDAC7A8](result);
        a8 = (char *)&v83 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0);
        bzero(a8, v63);
        memcpy(a8, a6, a7);
        a8[a7] = 0;
        if (*a8 == 37 && (a8[1] - 48) <= 9)
        {
          do
          {
            v64 = a8[2] - 48;
            ++a8;
          }
          while (v64 < 0xA);
          *a8 = 37;
        }
        v47 = strlen(a8);
      }
      if (!a3)
      {
        xo_failure((_BYTE *)a1, "missing field name: %s");
        a2 = xo_format_value_missing_221;
        a3 = 18;
      }
      xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
      xo_data_append((_QWORD *)a1, "=\"", 2uLL);
      if (v86)
        xo_data_append_content(a1, v85, v86, v17);
      else
        xo_do_format_field(a1, 0, (unsigned __int8 *)a8, v47, v17);
      v71 = "\" ";
      v72 = (_QWORD *)a1;
      v73 = 2;
      return xo_data_append(v72, v71, v73);
    case 5:
      if ((v17 & 0x40) != 0)
      {
LABEL_80:
        if (!v86)
        {
          v66 = v17 | 0x800;
          v67 = a1;
          v68 = a6;
          v69 = a7;
          return (_QWORD *)xo_do_format_field(v67, 0, v68, v69, v66);
        }
      }
      else
      {
        if ((v17 & 0x10) != 0)
        {
          v65 = 10;
        }
        else if ((v17 & 0x20) != 0)
        {
          v65 = 11;
        }
        else if (a7)
        {
          result = memchr("diouxXDOUeEfFgGaAcCp", (char)a6[a7 - 1], 0x15uLL);
          if (result)
            v65 = 11;
          else
            v65 = 10;
        }
        else
        {
          a6 = "true";
          v65 = 11;
          a7 = 4;
        }
        if (!a8)
        {
          MEMORY[0x24BDAC7A8](result);
          a8 = (char *)&v83 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0);
          bzero(a8, v79);
          memcpy(a8, a6, a7);
          a8[a7] = 0;
          if (*a8 == 37 && (a8[1] - 48) <= 9)
          {
            do
            {
              v80 = a8[2] - 48;
              ++a8;
            }
            while (v80 < 0xA);
            *a8 = 37;
          }
          v47 = strlen(a8);
        }
        if (!a3)
        {
          xo_failure((_BYTE *)a1, "missing field name: %s");
          a2 = xo_format_value_missing_225;
          a3 = 18;
        }
        v81 = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
        xo_data_append((_QWORD *)a1, a2, a3);
        xo_data_append((_QWORD *)a1, &xo_version_extra, 1uLL);
        v82 = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
        if (v86)
          xo_data_append_content(a1, v85, v86, v17);
        else
          xo_do_format_field(a1, 0, (unsigned __int8 *)a8, v47, v17);
        xo_data_append((_QWORD *)a1, &xo_version_extra, 1uLL);
        result = (_QWORD *)xo_encoder_handle(a1, v65, *(_QWORD *)(a1 + 72) + v81, *(_QWORD *)(a1 + 72) + v82, v17);
        *(_QWORD *)(a1 + 80) = *(_QWORD *)(a1 + 72);
      }
      return result;
    default:
      return result;
  }
}

uint64_t xo_error_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return xo_errorn_hv(a1, 0, a2, va, a5, a6, a7, a8);
}

uint64_t xo_error_hv(uint64_t a1, char *a2, va_list a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_errorn_hv(a1, 0, a2, a3, a5, a6, a7, a8);
}

uint64_t xo_error(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return xo_errorn_hv(0, 0, a1, va, a5, a6, a7, a8);
}

uint64_t xo_errorn_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return xo_errorn_hv(a1, 1, a2, va, a5, a6, a7, a8);
}

uint64_t xo_errorn(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return xo_errorn_hv(0, 1, a1, va, a5, a6, a7, a8);
}

uint64_t xo_parse_args(int a1, uint64_t *a2)
{
  const char *v4;
  char *v5;
  size_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;
  char *v14;

  if (!xo_program)
  {
    xo_program = *a2;
    v4 = (const char *)xo_program;
    v5 = strrchr((char *)xo_program, 47);
    if (v5)
    {
      v4 = v5 + 1;
      xo_program = (uint64_t)(v5 + 1);
    }
    v6 = strlen(v4);
    if (v6 >= 6)
    {
      v7 = &v4[v6 - 5];
      if (!strcmp(v7, ".test"))
        *v7 = 0;
    }
  }
  if (!*(_DWORD *)xo_default_inited())
    xo_default_init();
  v8 = xo_default_handle();
  v9 = 1;
  if (a1 < 2)
  {
LABEL_28:
    if ((*(_BYTE *)(v8 + 3) & 2) != 0 && isatty(1))
      *(_QWORD *)v8 |= 0x4000000uLL;
    a2[(int)v9] = 0;
    return v9;
  }
  LODWORD(v10) = 1;
  while (1)
  {
    v11 = a2[(int)v10];
    if (!v11 || strncmp((const char *)a2[(int)v10], xo_parse_args_libxo_opt, 7uLL))
    {
      if ((_DWORD)v9 != (_DWORD)v10)
        a2[(int)v9] = v11;
      v9 = (v9 + 1);
      goto LABEL_16;
    }
    v12 = (char *)(v11 + 7);
    v13 = *(unsigned __int8 *)(v11 + 7);
    if (v13 <= 0x39)
      break;
    if (v13 != 58)
    {
      if (v13 != 61)
        goto LABEL_35;
      v12 = (char *)(v11 + 8);
    }
    if ((xo_set_options(v8, v12) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
LABEL_16:
    LODWORD(v10) = v10 + 1;
    if ((int)v10 >= a1)
      goto LABEL_28;
  }
  if (*(_BYTE *)(v11 + 7))
  {
    if (v13 == 45 && !strcmp((const char *)(v11 + 8), "check"))
      exit(121);
LABEL_35:
    xo_warnx("unknown libxo option: '%s'");
    return 0xFFFFFFFFLL;
  }
  v10 = (int)v10 + 1;
  v14 = (char *)a2[v10];
  if (v14)
  {
    if ((xo_set_options(v8, v14) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  xo_warnx("missing libxo option");
  return 0xFFFFFFFFLL;
}

size_t xo_dump_stack(uint64_t a1)
{
  uint64_t v1;
  FILE **v2;
  size_t result;
  int v4;
  const char **v5;
  uint64_t v6;
  const char *v7;
  const char *v8;

  v1 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v1 = xo_default_handle();
  }
  v2 = (FILE **)MEMORY[0x24BDAC8D8];
  result = fwrite("Stack dump:\n", 0xCuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  if (*(int *)(v1 + 176) >= 1)
  {
    v4 = 0;
    v5 = (const char **)(*(_QWORD *)(v1 + 168) + 32);
    do
    {
      v6 = *((unsigned int *)v5 - 1);
      v7 = "unknown";
      if (v6 <= 0xE)
        v7 = xo_state_name_names[v6];
      ++v4;
      v8 = *v5;
      if (!*v5)
        v8 = "--";
      result = fprintf(*v2, "   [%d] %s '%s' [%x]\n", v4, v7, v8, *((_DWORD *)v5 - 2));
      v5 += 3;
    }
    while (v4 < *(_DWORD *)(v1 + 176));
  }
  return result;
}

uint64_t xo_set_program(uint64_t result)
{
  xo_program = result;
  return result;
}

char *xo_set_version_h(char *result, char *__s)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = (uint64_t)result;
  if (result)
  {
    if (!__s)
      return result;
    goto LABEL_7;
  }
  if (!*(_DWORD *)xo_default_inited())
    xo_default_init();
  result = (char *)xo_default_handle();
  v3 = (uint64_t)result;
  if (__s)
  {
LABEL_7:
    result = strchr(__s, 34);
    if (!result)
    {
      v9 = *(unsigned __int16 *)(v3 + 16);
      switch(v9)
      {
        case 5:
          return (char *)xo_encoder_handle(v3, 16, 0, (uint64_t)__s, 0);
        case 2:
          result = xo_strndup(__s, 0xFFFFFFFFFFFFFFFFLL);
          *(_QWORD *)(v3 + 432) = result;
          break;
        case 1:
          return (char *)xo_attr_h(v3, "version", "%s", v4, v5, v6, v7, v8, (char)__s);
      }
    }
  }
  return result;
}

char *xo_set_version(char *__s)
{
  return xo_set_version_h(0, __s);
}

uint64_t xo_emit_warn_hcv(uint64_t result, int a2, int a3, char *a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  _OWORD v33[4];
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
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
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;

  v5 = a5;
  v9 = result;
  v62 = *MEMORY[0x24BDAC8D0];
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
    v9 = result;
  }
  if (a4)
  {
    xo_open_marker_h(v9, "xo_emit_warn_hcv");
    if (a2)
      v14 = "__warning";
    else
      v14 = "__error";
    xo_transition(v9, 0, v14, 1, v10, v11, v12, v13);
    if (xo_program)
      xo_emit("{wc:program}", v15, v16, v17, v18, v19, v20, v21, xo_program);
    if (*(unsigned __int16 *)(v9 + 16) - 1 <= 1)
    {
      v61 = 0;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
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
      v38 = 0u;
      v34 = 0;
      memset(v33, 0, sizeof(v33));
      v37 = 0x2000;
      v35 = (char *)xo_realloc(0, 0x2000);
      v36 = v35;
      xo_depth_check((uint64_t)v33, 128);
      xo_emit_hv((unint64_t)v33, a4, a5);
      xo_format_value(v9, "message", 7uLL, v35, v36 - v35, 0, 0, 0, 0, 0);
      xo_free(*((_QWORD *)&v42 + 1));
      if (v35)
        xo_free(v35);
      v5 = a5;
    }
    xo_emit_hv(v9, a4, v5);
    v22 = strlen(a4);
    if (v22 >= 1 && a4[v22 - 1] != 10)
    {
      if (a3 >= 1)
      {
        v30 = strerror(a3);
        if (v30)
          xo_emit_h(v9, ": {G:strerror}{g:error/%s}", v24, v25, v26, v27, v28, v29, (uint64_t)v30);
      }
      xo_emit("\n", v23, v24, v25, v26, v27, v28, v29, v31);
    }
    xo_close_marker_h((_BYTE *)v9, "xo_emit_warn_hcv");
    return xo_flush_h(v9);
  }
  return result;
}

uint64_t xo_emit_warn_hc(uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_warn_hcv(a1, 1, a2, a3, (uint64_t)&a9);
}

uint64_t xo_emit_warn_c(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_warn_hcv(0, 1, a1, a2, (uint64_t)&a9);
}

uint64_t xo_emit_warn(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int *v10;

  v10 = __error();
  return xo_emit_warn_hcv(0, 1, *v10, a1, (uint64_t)&a9);
}

uint64_t xo_emit_warnx(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_warn_hcv(0, 1, -1, a1, (uint64_t)&a9);
}

void xo_emit_err_v(int a1, int a2, char *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = xo_emit_warn_hcv(0, 0, a2, a3, a4);
  xo_finish(v5, v6, v7, v8, v9, v10, v11, v12);
  exit(a1);
}

void xo_emit_err(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int *v11;

  v11 = __error();
  xo_emit_err_v(a1, *v11, a2, (uint64_t)&a9);
}

void xo_emit_errx(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xo_emit_err_v(a1, -1, a2, (uint64_t)&a9);
}

void xo_emit_errc(int a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xo_emit_err_v(a1, a2, a3, (uint64_t)&a9);
}

uint64_t xo_get_private(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
  }
  return *(_QWORD *)(a1 + 464);
}

uint64_t xo_set_private(uint64_t result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
  }
  *(_QWORD *)(result + 464) = a2;
  return result;
}

uint64_t xo_get_encoder(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    a1 = xo_default_handle();
  }
  return *(_QWORD *)(a1 + 456);
}

uint64_t xo_set_encoder(uint64_t result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
  }
  *(_WORD *)(result + 16) = 5;
  *(_QWORD *)(result + 456) = a2;
  return result;
}

uint64_t xo_explicit_transition(uint64_t result, int a2, char *__s1, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;

  v11 = result;
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    result = xo_default_handle();
    v11 = result;
  }
  switch(a2)
  {
    case 3:
      result = xo_do_open_list(v11, a4, __s1, a4, a5, a6, a7, a8);
      break;
    case 4:
      xo_depth_change((_BYTE *)v11, __s1, 1, 1, 3u, (a4 >> 7) & 8 | (*(_DWORD *)v11 >> 13) & 1 | 2);
      result = xo_do_close_list(v11, __s1);
      break;
    case 5:
      result = xo_do_open_instance(v11, a4, __s1);
      break;
    case 6:
      xo_depth_change((_BYTE *)v11, __s1, 1, 1, 5u, (a4 >> 7) & 8);
      v12 = *(_QWORD *)v11;
      if ((*(_QWORD *)v11 & 0x2000) != 0)
      {
        *(_DWORD *)(*(_QWORD *)(v11 + 168) + 24 * *(int *)(v11 + 176)) |= 1u;
        *(_QWORD *)v11 = v12 & 0xFFFFFFFFFFFFDFFFLL;
      }
      result = xo_do_close_instance(v11, __s1);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t xo_do_open_list(uint64_t a1, uint64_t a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int *v13;
  int v14;
  const char *v15;
  void *v16;
  size_t v17;
  char *v18;
  size_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  _QWORD v25[2];

  v8 = __s;
  v10 = a1;
  v25[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v10 = xo_default_handle();
  }
  v11 = *(unsigned __int16 *)(v10 + 16);
  if (v11 == 5)
  {
    v22 = xo_encoder_handle(v10, 4, (uint64_t)v8, 0, a2);
LABEL_28:
    v23 = 0;
    goto LABEL_29;
  }
  if (v11 != 2)
  {
    v22 = 0;
    goto LABEL_28;
  }
  if ((*(_QWORD *)v10 & 0x10000) == 0 && (*(_BYTE *)(v10 + 8) & 4) == 0)
    xo_emit_top(v10);
  if (!v8)
  {
    xo_failure((_BYTE *)v10, "NULL passed for list name");
    v8 = "failure";
  }
  v12 = *(_QWORD *)v10;
  v13 = (int *)(*(_QWORD *)(v10 + 168) + 24 * *(int *)(v10 + 176));
  v14 = *v13;
  if ((*(_QWORD *)v10 & 0x2000) != 0)
  {
    v14 |= 1u;
    *v13 = v14;
    v12 &= ~0x2000uLL;
    *(_QWORD *)v10 = v12;
  }
  v15 = ",\n";
  if ((v12 & 2) == 0)
    v15 = ", ";
  if ((v14 & 1) != 0)
    LOBYTE(v16) = (_BYTE)v15;
  else
    v16 = &xo_version_extra;
  *v13 = v14 | 1;
  if ((v12 & 0x100000) != 0)
  {
    v17 = strlen(v8);
    v18 = (char *)v25 - ((MEMORY[0x24BDAC7A8](v17) + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v18, v19);
    if (v18 < &v18[v17 + 1])
    {
      v20 = 0;
      do
      {
        v21 = v8[v20];
        if (v21 == 45)
          LOBYTE(v21) = 95;
        v18[v20++] = v21;
      }
      while (&v18[v20 - 1] < &v18[v17]);
    }
  }
  v22 = xo_printf(v10, "%s%*s\"%s\": [%s", (uint64_t)__s, a4, a5, a6, a7, a8, (char)v16);
  v23 = 1;
LABEL_29:
  xo_depth_change((_BYTE *)v10, v8, 1, v23, 3u, (a2 >> 7) & 8 | 2);
  return v22;
}

uint64_t xo_do_open_instance(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  _BYTE *v29;
  size_t v30;

  v5 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v5 = xo_default_handle();
  }
  if ((*(_BYTE *)v5 & 2) != 0)
    v6 = "\n";
  else
    v6 = (const char *)&xo_version_extra;
  if (!__s)
  {
    xo_failure((_BYTE *)v5, "NULL passed for instance name");
    __s = "failure";
  }
  strlen(__s);
  xo_xml_leader_len((_BYTE *)v5, __s);
  v13 = *(_QWORD *)v5;
  v14 = *(_QWORD *)v5 | a2;
  v15 = *(unsigned __int16 *)(v5 + 16);
  switch(v15)
  {
    case 5:
      v17 = xo_encoder_handle(v5, 8, (uint64_t)__s, 0, v14);
      break;
    case 2:
      v18 = (int *)(*(_QWORD *)(v5 + 168) + 24 * *(int *)(v5 + 176));
      v19 = *v18;
      if ((v13 & 0x2000) != 0)
      {
        v19 |= 1u;
        *v18 = v19;
        v13 &= ~0x2000uLL;
        *(_QWORD *)v5 = v13;
      }
      v20 = ",\n";
      if ((v13 & 2) == 0)
        v20 = ", ";
      if ((v19 & 1) == 0)
        v20 = (const char *)&xo_version_extra;
      *v18 = v19 | 1;
      v17 = xo_printf(v5, "%s%*s{%s", v7, v8, v9, v10, v11, v12, (char)v20);
      break;
    case 1:
      if ((v13 & 2) != 0)
        v16 = (*(unsigned __int16 *)(v5 + 20) & (*(unsigned __int8 *)(v5 + 8) << 29 >> 31))
            + *(unsigned __int16 *)(v5 + 20) * *(unsigned __int16 *)(v5 + 18);
      else
        LOBYTE(v16) = 0;
      v21 = xo_printf(v5, "%*s<%s%s", v7, v8, v9, v10, v11, v12, v16);
      v27 = v21;
      v28 = *(_BYTE **)(v5 + 120);
      v29 = *(_BYTE **)(v5 + 128);
      v30 = v29 - v28;
      if (v29 != v28)
      {
        v27 = v30 + v21;
        xo_data_append((_QWORD *)v5, v28, v30);
        *(_QWORD *)(v5 + 128) = *(_QWORD *)(v5 + 120);
      }
      v17 = xo_printf(v5, ">%s", v30, v22, v23, v24, v25, v26, (char)v6) + v27;
      break;
    default:
      v17 = 0;
      break;
  }
  xo_depth_change((_BYTE *)v5, __s, 1, 1, 5u, (v14 >> 7) & 8);
  return v17;
}

uint64_t xo_do_close_instance(uint64_t a1, char *__s)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const void *v7;
  size_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v3 = a1;
  v24[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v3 = xo_default_handle();
  }
  if (!__s)
  {
    v4 = *(_QWORD *)(v3 + 168);
    v5 = *(_DWORD *)(v3 + 176);
    v6 = v4 + 24 * v5;
    v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      v8 = strlen(*(const char **)(v6 + 8)) + 1;
      __s = (char *)v24 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
      bzero(__s, v8);
      memcpy(__s, v7, v8);
    }
    else if ((*(_BYTE *)(v4 + 24 * v5) & 8) != 0)
    {
      __s = 0;
    }
    else
    {
      xo_failure((_BYTE *)v3, "missing name without 'dtrt' mode");
      __s = "failure";
    }
  }
  strlen(__s);
  xo_xml_leader_len((_BYTE *)v3, __s);
  result = 0;
  switch(*(_WORD *)(v3 + 16))
  {
    case 0:
    case 3:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 6u, 0);
      result = 0;
      break;
    case 1:
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 6u, 0);
      LOBYTE(v16) = 0;
      if ((*(_BYTE *)v3 & 2) != 0)
        v16 = (*(unsigned __int16 *)(v3 + 20) & (*(unsigned __int8 *)(v3 + 8) << 29 >> 31))
            + *(unsigned __int16 *)(v3 + 20) * *(unsigned __int16 *)(v3 + 18);
      result = xo_printf(v3, "%*s</%s%s>%s", v10, v11, v12, v13, v14, v15, v16);
      break;
    case 2:
      if ((*(_QWORD *)v3 & 2) != 0)
        v17 = "\n";
      else
        v17 = (const char *)&xo_version_extra;
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 6u, 0);
      result = xo_printf(v3, "%s%*s}", v18, v19, v20, v21, v22, v23, (char)v17);
      *(_DWORD *)(*(_QWORD *)(v3 + 168) + 24 * *(int *)(v3 + 176)) |= 1u;
      break;
    case 5:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 6u, 0);
      result = xo_encoder_handle(v3, 9, (uint64_t)__s, 0, 0);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t xo_do_close_list(uint64_t a1, char *__s1)
{
  char *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const void *v7;
  size_t v8;
  int v9;
  _DWORD *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD v19[2];

  v2 = __s1;
  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!__s1)
  {
    v4 = *(_QWORD *)(a1 + 168);
    v5 = *(_DWORD *)(a1 + 176);
    v6 = v4 + 24 * v5;
    v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      v8 = strlen(*(const char **)(v6 + 8)) + 1;
      v2 = (char *)v19 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
      bzero(v2, v8);
      memcpy(v2, v7, v8);
    }
    else if ((*(_BYTE *)(v4 + 24 * v5) & 8) != 0)
    {
      v2 = 0;
    }
    else
    {
      xo_failure((_BYTE *)a1, "missing name without 'dtrt' mode");
      v2 = "failure";
    }
  }
  v9 = *(unsigned __int16 *)(a1 + 16);
  if (v9 == 5)
  {
    xo_depth_change((_BYTE *)a1, v2, -1, 0, 4u, 2);
    return xo_encoder_handle(a1, 5, (uint64_t)v2, 0, 0);
  }
  else
  {
    if (v9 == 2)
    {
      v10 = (_DWORD *)(*(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176));
      v11 = (const char *)&xo_version_extra;
      if ((*v10 & 1) != 0)
      {
        if ((*(_BYTE *)a1 & 2) != 0)
          v11 = "\n";
        else
          v11 = (const char *)&xo_version_extra;
      }
      *v10 |= 1u;
      xo_depth_change((_BYTE *)a1, v2, -1, -1, 4u, 2);
      xo_indent(a1);
      result = xo_printf(a1, "%s%*s]", v12, v13, v14, v15, v16, v17, (char)v11);
    }
    else
    {
      xo_depth_change((_BYTE *)a1, v2, -1, 0, 4u, 2);
      result = 0;
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176)) |= 1u;
  }
  return result;
}

_DWORD *xo_default_init()
{
  _BYTE *v0;
  char *v1;
  _DWORD *result;

  v0 = (_BYTE *)xo_default_handle();
  xo_init_handle((uint64_t)v0);
  if ((v0[1] & 1) == 0)
  {
    v1 = getenv("LIBXO_OPTIONS");
    if (v1)
      xo_set_options_simple(v0, v1);
  }
  result = (_DWORD *)xo_default_inited();
  *result = 1;
  return result;
}

uint64_t xo_set_options_simple(_BYTE *a1, char *__s)
{
  size_t v4;
  char *v5;
  uint64_t result;
  unint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  unint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = strlen(__s) + 1;
  v5 = (char *)v13 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v5, v4);
  result = (uint64_t)memcpy(v5, __s, v4);
  v7 = (unint64_t)&v5[v4 - 1];
  if ((unint64_t)v5 < v7)
  {
    do
    {
      v8 = strchr(v5, 44);
      v9 = v8;
      if (v8)
      {
        *v8 = 0;
        v9 = v8 + 1;
      }
      v10 = strchr(v5, 61);
      v11 = v10;
      if (v10)
      {
        *v10 = 0;
        v11 = v10 + 1;
      }
      if (!strcmp("colors", v5))
      {
        result = xo_set_color_map((uint64_t)a1, v11);
        if (!v9)
          return result;
      }
      else
      {
        result = (uint64_t)xo_name_lookup(xo_xof_simple_names, v5, 0xFFFFFFFFFFFFFFFFLL);
        if (result)
        {
          v12 = *(_QWORD *)a1 | result;
        }
        else
        {
          result = strcmp(v5, "no-color");
          if ((_DWORD)result)
            return (uint64_t)xo_failure(a1, "unknown simple option: %s");
          v12 = *(_QWORD *)a1 & 0xFFFFFFFFFDFFFFFFLL;
        }
        *(_QWORD *)a1 = v12;
        if (!v9)
          return result;
      }
      v5 = v9;
    }
    while ((unint64_t)v9 < v7);
  }
  return result;
}

const char *xo_name_lookup(_QWORD *a1, char *__s2, size_t a3)
{
  size_t v3;
  size_t v6;
  uint64_t v7;
  char *i;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  int v13;
  const char *result;

  if (!a3)
    return 0;
  v3 = a3;
  if ((a3 & 0x8000000000000000) != 0)
    v3 = strlen(__s2);
  v6 = ~v3;
  v7 = MEMORY[0x24BDAC740];
  for (i = __s2; ; ++i)
  {
    v9 = *i;
    if ((v9 & 0x80000000) != 0)
      break;
    if ((*(_DWORD *)(v7 + 4 * v9 + 60) & 0x4000) == 0)
      goto LABEL_10;
LABEL_9:
    ++v6;
  }
  if (__maskrune(v9, 0x4000uLL))
    goto LABEL_9;
LABEL_10:
  v10 = 0;
  v11 = &__s2[v3];
  do
  {
    v12 = v11[v10];
    if ((v12 & 0x80000000) != 0)
      v13 = __maskrune(v12, 0x4000uLL);
    else
      v13 = *(_DWORD *)(v7 + 4 * v12 + 60) & 0x4000;
    --v10;
  }
  while (v13);
  if (!*i)
    return 0;
  result = (const char *)a1[1];
  if (result)
  {
    while (strncmp(result, i, v10 - v6))
    {
      result = (const char *)a1[3];
      a1 += 2;
      if (!result)
        return result;
    }
    return (const char *)*a1;
  }
  return result;
}

uint64_t xo_buf_escape(uint64_t a1, uint64_t *a2, void *__src, uint64_t __n, unsigned int a5)
{
  uint64_t v6;
  void *v10;
  size_t v11;
  uint64_t result;
  uint64_t v13;

  v6 = __n;
  v10 = (void *)a2[1];
  if ((unint64_t)v10 + __n >= *a2 + a2[2])
  {
    v11 = ((unint64_t)v10 + __n - *a2 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
    result = xo_realloc(*a2, v11);
    if (!result)
      return result;
    v13 = result;
    v10 = (void *)(result + a2[1] - *a2);
    *a2 = v13;
    a2[1] = (uint64_t)v10;
    a2[2] = v11;
  }
  result = (uint64_t)memcpy(v10, __src, v6);
  switch(*(_WORD *)(a1 + 16))
  {
    case 1:
    case 3:
      result = xo_escape_xml(a2, v6, a5);
      goto LABEL_8;
    case 2:
      result = xo_escape_json(a2, v6);
      goto LABEL_8;
    case 4:
      result = xo_escape_sdparams(a2, v6);
LABEL_8:
      v6 = result;
      break;
    default:
      break;
  }
  a2[1] += v6;
  return result;
}

uint64_t xo_do_format_field(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  unsigned __int8 *v14;
  unint64_t v15;
  int v16;
  unsigned __int8 *v17;
  int v18;
  unsigned __int8 *v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  char *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  int v42;
  int v43;
  uint64_t v44;
  char v45;
  __int32 **v46;
  int v47;
  char *v48;
  uint64_t v49;
  int v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  __int16 v61;
  int v62;
  int v63;
  int v64;
  uint64_t v65;
  char *v66;
  char *v67;
  __int32 *v68;
  __int32 **v69;
  unsigned int v70;
  size_t v71;
  unsigned int v72;
  uint64_t v73;
  size_t v74;
  char *v75;
  uint64_t v76;
  int v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  int v82;
  unint64_t v83;
  uint64_t v84;
  int v85;
  size_t v86;
  int v87;
  unsigned int v88;
  char v89;
  uint64_t i;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t result;
  char *v95;
  unsigned int v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  __int16 v104;
  int v105;
  char v106;
  unsigned int v107;
  int v108;
  int v109;
  int v110;
  uint64_t *v111;
  unsigned __int8 *v112;
  int v113;
  int v114;
  int v115;
  int v116;
  __int32 ***v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[2];

  v5 = a5;
  if ((a5 & 0x100) != 0)
    v6 = 1;
  else
    v6 = *(unsigned __int16 *)(a1 + 16);
  v110 = v6;
  v7 = *(_QWORD *)a1;
  v8 = 2;
  if ((*(_QWORD *)a1 & 0x20000000) == 0)
  {
    if (*(_WORD *)(a1 + 16))
      v8 = 2;
    else
      v8 = 3;
  }
  v9 = *(_QWORD *)(a1 + 376);
  if ((a5 & 0x80000) != 0)
    v10 = 2;
  else
    v10 = v8;
  v105 = v10;
  v11 = (uint64_t *)(a1 + 72);
  if (a2)
    v11 = a2;
  v111 = v11;
  v12 = v11[1];
  v100 = *v11;
  if (a4 < 1)
    goto LABEL_239;
  v97 = v11[1];
  v98 = v8;
  v99 = *(_QWORD *)(a1 + 376);
  v13 = 0;
  v14 = a3;
  v15 = (unint64_t)&a3[a4];
  v121[0] = 0;
  v104 = v5 | 0x4000;
  v118 = (__int32 ***)(a1 + 200);
  v96 = v5 & 0x200;
  v101 = (uint64_t)&a3[a4 - 2];
  v103 = (uint64_t)&a3[a4 - 1];
  v119 = 0u;
  v120 = 0u;
  v107 = v5;
  v112 = &a3[a4];
  while (1)
  {
    v16 = *v14;
    if (v16 != 37)
    {
      if (!v13)
        v13 = (char *)v14;
      if (v16 == 92)
      {
        if (v14[1])
          v17 = v14 + 1;
        else
          v17 = v14;
      }
      else
      {
        v17 = v14;
      }
      goto LABEL_228;
    }
    v17 = v14 + 1;
    if ((unint64_t)(v14 + 1) < v15 && *v17 == 37)
    {
      if (!v13)
        v13 = (char *)(v14 + 1);
      goto LABEL_228;
    }
    if ((v5 & 0x800) == 0 && v13)
    {
      v18 = xo_format_string_direct(a1, v111, v104, 0, v13, v14 - (unsigned __int8 *)v13, 0xFFFFFFFF, v105, 2);
      v7 = *(_QWORD *)a1;
      if ((*(_QWORD *)a1 & 0x200000) != 0)
        *(_QWORD *)(a1 + 376) += v18;
      if ((*(_BYTE *)(a1 + 8) & 8) != 0)
        *(_QWORD *)(a1 + 352) += v18;
    }
    v119 = 0u;
    LODWORD(v120) = 0;
    v121[0] = 0;
    HIDWORD(v119) = -1;
    HIDWORD(v120) = -1;
    *(_QWORD *)((char *)&v120 + 4) = -1;
    if (*v17 == 64)
    {
      v19 = v14 + 2;
      if ((unint64_t)(v14 + 2) < v15)
      {
        v20 = v101 - (_QWORD)v14;
        do
        {
          v21 = *v19;
          if (v21 == 42)
          {
            if ((v7 & 0x200) == 0)
              ++*v118;
          }
          else if (v21 == 64)
          {
            goto LABEL_43;
          }
          ++v19;
          --v20;
        }
        while (v20);
        v19 = (unsigned __int8 *)v15;
      }
LABEL_43:
      if ((v7 & 8) == 0)
      {
LABEL_44:
        v22 = 0;
        if ((v7 & 0x40) == 0 || !v110)
          goto LABEL_52;
        if (*(_WORD *)(a1 + 16) == 3)
          goto LABEL_51;
        goto LABEL_119;
      }
    }
    else
    {
      v19 = v14;
      if ((v7 & 8) == 0)
        goto LABEL_44;
    }
    if (v110 == 1 || (v60 = *(unsigned __int16 *)(a1 + 16) - 1, v60 < 5) && ((0x1Bu >> v60) & 1) != 0)
    {
LABEL_51:
      v22 = 0;
LABEL_52:
      if ((v5 & 0x800) == 0)
        goto LABEL_54;
LABEL_53:
      v22 = 1;
      BYTE2(v119) = 1;
      goto LABEL_54;
    }
LABEL_119:
    v22 = 1;
    BYTE2(v119) = 1;
    if ((v5 & 0x800) != 0)
      goto LABEL_53;
LABEL_54:
    v17 = v19 + 1;
    if ((unint64_t)(v19 + 1) < v15)
      break;
    v23 = 0;
    LOBYTE(v25) = 0;
    LOBYTE(v24) = 0;
    LODWORD(v31) = -1;
LABEL_86:
    if (v17 == (unsigned __int8 *)v15)
    {
      v41 = v24;
      v42 = v23;
      xo_failure((_BYTE *)a1, "field format missing format character: %s");
      v23 = v42;
      LOBYTE(v24) = v41;
      v7 = *(_QWORD *)a1;
    }
    v43 = *v17;
    LOBYTE(v119) = *v17;
    if ((v7 & 0x200) == 0 && (v43 | 0x20) == 0x73)
    {
      v44 = 0;
      v45 = BYTE9(v119);
      do
      {
        if (*((_BYTE *)v121 + v44 + 4))
        {
          v46 = (*v118)++;
          v47 = *(_DWORD *)v46;
          v48 = (char *)v121 + 4 * v44 + 4;
          *((_DWORD *)v48 - 4) = v47;
          if (v47 < 0)
          {
            if (v44)
            {
              *((_DWORD *)v48 - 4) = -1;
            }
            else
            {
              DWORD1(v120) = -DWORD1(v120);
              v45 = 1;
              v23 = 1;
            }
          }
        }
        ++v44;
      }
      while (v44 != 3);
      BYTE9(v119) = v45;
    }
    v49 = SDWORD2(v120);
    if (SDWORD2(v120) > -1 && v120 < 0)
      v51 = DWORD2(v120);
    else
      v51 = HIDWORD(v120);
    HIDWORD(v120) = v51;
    if ((v43 - 68) <= 0x11 && ((1 << (v43 - 68)) & 0x20801) != 0)
    {
      LOBYTE(v24) = 1;
      BYTE3(v119) = 1;
    }
    if (!v22)
    {
      v102 = v51;
      v109 = v23;
      v106 = v24;
      v52 = v17 - v19;
      v53 = *(_QWORD *)(a1 + 96);
      v54 = *(_BYTE **)(a1 + 104);
      v55 = (unint64_t)&v54[v17 - v19 + 2];
      if (v55 >= v53 + *(_QWORD *)(a1 + 112))
      {
        v56 = (v55 - v53 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
        v57 = xo_realloc(v53, v56);
        if (!v57)
          return -1;
        v54 = (_BYTE *)(v57 + *(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 96));
        *(_QWORD *)(a1 + 96) = v57;
        *(_QWORD *)(a1 + 104) = v54;
        *(_QWORD *)(a1 + 112) = v56;
      }
      memcpy(v54, v19, v52 + 1);
      *v54 = 37;
      v54[v52 + 1] = 0;
      v22 = 0;
      if (*(_QWORD *)(a1 + 48))
      {
LABEL_112:
        v58 = xo_vsnprintf(a1, (uint64_t)v111, v54, *(va_list *)(a1 + 200));
        LOBYTE(v24) = v106;
        v5 = v107;
        if (v58 < 1)
          goto LABEL_209;
        switch(v110)
        {
          case 1:
            if ((v107 & 0x1000) != 0)
              v58 = xo_trim_ws((uint64_t)v111, v58);
            goto LABEL_116;
          case 2:
            if ((v107 & 0x1000) != 0)
              v58 = xo_trim_ws((uint64_t)v111, v58);
            v73 = xo_escape_json(v111, v58);
            goto LABEL_160;
          case 3:
LABEL_116:
            v59 = xo_escape_xml(v111, v58, v96);
            LOBYTE(v24) = v106;
            goto LABEL_164;
          case 4:
            if ((v107 & 0x1000) != 0)
              v58 = xo_trim_ws((uint64_t)v111, v58);
            v73 = xo_escape_sdparams(v111, v58);
LABEL_160:
            v59 = v73;
            LOBYTE(v24) = v106;
            goto LABEL_164;
          case 5:
            if ((v107 & 0x1000) != 0)
            {
              v58 = xo_trim_ws((uint64_t)v111, v58);
              LOBYTE(v24) = v106;
            }
            goto LABEL_163;
          default:
LABEL_163:
            v59 = v58;
LABEL_164:
            if ((*(_BYTE *)(a1 + 2) & 0x20) != 0)
              *(_QWORD *)(a1 + 376) += v58;
            if ((*(_BYTE *)(a1 + 8) & 8) != 0)
              *(_QWORD *)(a1 + 352) += v58;
            break;
        }
        goto LABEL_207;
      }
      switch(v43)
      {
        case 's':
LABEL_124:
          v61 = 1;
          if (v43 != 83 && !v106)
          {
            if ((_BYTE)v25)
              v61 = 3;
            else
              v61 = 2;
          }
          break;
        case 'm':
          v61 = 2;
          break;
        case 'S':
          goto LABEL_124;
        default:
          goto LABEL_112;
      }
      BYTE1(v119) = v61;
      if ((*(_BYTE *)(a1 + 3) & 0x20) != 0)
      {
        v62 = 2;
      }
      else if (*(_WORD *)(a1 + 16))
      {
        v62 = 2;
      }
      else
      {
        v62 = 3;
      }
      v63 = v61;
      v64 = (unsigned __int16)(v62 | (v61 << 8));
      if ((v64 - 258) >= 2 && (v64 - 514) >= 2 && (v64 - 770) >= 2)
      {
        xo_failure((_BYTE *)a1, "invalid conversion (%c:%c)");
        LOBYTE(v24) = v106;
        v59 = 0;
        v5 = v107;
      }
      else
      {
        v65 = v111[1] - *v111;
        if (v43 == 109)
        {
          v66 = strerror(*(_DWORD *)(a1 + 440));
          v67 = v66;
          if ((v49 & 0x80000000) == 0)
          {
            v68 = (__int32 *)v66;
            goto LABEL_144;
          }
          if (v66)
          {
            v71 = strlen(v66);
            v70 = v102;
            goto LABEL_175;
          }
          v70 = v102;
          if ((v107 & 0x20) == 0)
          {
LABEL_174:
            v71 = 6;
            v67 = xo_format_string_null;
            goto LABEL_175;
          }
LABEL_152:
          v72 = *(unsigned __int16 *)(a1 + 16) - 1;
          if (v72 > 4)
            goto LABEL_174;
          v71 = qword_24BC33E18[(__int16)v72];
          v67 = (&off_251CDD8A8)[(__int16)v72];
LABEL_175:
          v68 = 0;
          if (v62 == v63 && (DWORD1(v120) & 0x80000000) != 0 && (v49 & 0x80000000) != 0 && (v70 & 0x80000000) != 0)
          {
            if ((*(_BYTE *)(a1 + 8) & 8) == 0 && (*(_BYTE *)(a1 + 2) & 0x20) == 0)
            {
              v74 = strlen(v67);
              v75 = v67;
              v5 = v107;
              xo_buf_escape(a1, v111, v75, v74, v107);
              v76 = v65 + *v111;
              v59 = v111[1] - v76;
              v111[1] = v76;
              goto LABEL_192;
            }
            v68 = 0;
          }
          v49 = v71;
        }
        else
        {
          v69 = (*v118)++;
          v68 = *v69;
          if (v61 != 1)
          {
LABEL_144:
            v70 = v102;
            if (v68)
              v71 = v49;
            else
              v71 = 6;
            if (v68)
              v67 = (char *)v68;
            else
              v67 = xo_format_string_null;
            if (!v68 && (v107 & 0x20) != 0)
              goto LABEL_152;
            goto LABEL_175;
          }
          v70 = v102;
          if (v68)
          {
            v67 = 0;
          }
          else
          {
            v49 = 6;
            v67 = xo_format_string_null;
          }
        }
        v77 = xo_format_string_direct(a1, v111, v107, v68, v67, v49, v70, v62, v63);
        v78 = v111;
        if (v77 < 0)
          goto LABEL_191;
        v79 = v77;
        v80 = *v111;
        v81 = (char *)(v65 + *v111);
        v59 = v111[1] - (_QWORD)v81;
        v111[1] = (uint64_t)v81;
        v82 = DWORD1(v120);
        if ((int)v79 >= SDWORD1(v120))
          goto LABEL_198;
        if ((unint64_t)&v81[SDWORD1(v120)] < v80 + v111[2])
          goto LABEL_189;
        v83 = (unint64_t)&v81[SDWORD1(v120) - v80 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v84 = xo_realloc(v80, v83);
        v78 = v111;
        if (!v84)
        {
LABEL_191:
          v59 = 0;
          v78[1] = *v78 + v65;
          v5 = v107;
LABEL_192:
          LOBYTE(v24) = v106;
        }
        else
        {
          v81 = (char *)(v84 + v111[1] - *v111);
          *v111 = v84;
          v111[1] = (uint64_t)v81;
          v111[2] = v83;
LABEL_189:
          v85 = v82 - v79;
          if (v109)
          {
            v81 += v59;
            v86 = v85;
          }
          else
          {
            v86 = v85;
            memmove(&v81[v85], v81, v59);
          }
          if ((int)v31 <= 0)
            v87 = 32;
          else
            v87 = 48;
          memset(v81, v87, v86);
          v59 += v86;
          v79 += v86;
LABEL_198:
          LOBYTE(v24) = v106;
          if ((*(_BYTE *)(a1 + 2) & 0x20) != 0)
            *(_QWORD *)(a1 + 376) += v79;
          if ((*(_BYTE *)(a1 + 8) & 8) != 0)
            *(_QWORD *)(a1 + 352) += v79;
          v5 = v107;
        }
      }
      v22 = 0;
      if ((v5 & 0x1000) != 0)
      {
        v88 = *(unsigned __int16 *)(a1 + 16);
        if (v88 <= 5 && ((1 << v88) & 0x36) != 0)
        {
          v59 = xo_trim_ws((uint64_t)v111, v59);
          LOBYTE(v24) = v106;
        }
      }
LABEL_207:
      if (v59 >= 1)
        v111[1] += v59;
    }
LABEL_209:
    v7 = *(_QWORD *)a1;
    if ((*(_QWORD *)a1 & 0x200) != 0)
    {
      v13 = 0;
      v15 = (unint64_t)v112;
    }
    else
    {
      v15 = (unint64_t)v112;
      if ((v43 & 0xFFFFFFDF) == 0x53)
      {
        if (!v22)
          goto LABEL_215;
      }
      else
      {
        if (v43 == 109)
          goto LABEL_215;
        v89 = v24;
        for (i = 0; i != 3; ++i)
        {
          if (*((_BYTE *)v121 + i + 4))
            ++*v118;
        }
        if (memchr("diouxXDOU", v43, 0xAuLL))
        {
          if (v25 >= 2u)
            goto LABEL_227;
        }
        else
        {
          if (memchr("eEfFgGaA", v43, 9uLL) || v43 == 67 || v43 == 99 && v89)
          {
LABEL_227:
            v13 = 0;
            ++*v118;
            goto LABEL_228;
          }
          if (v43 != 99 && v43 != 112)
          {
LABEL_215:
            v13 = 0;
            goto LABEL_228;
          }
        }
      }
      v13 = 0;
      ++*v118;
    }
LABEL_228:
    v14 = v17 + 1;
    if ((unint64_t)(v17 + 1) >= v15)
    {
      v9 = v99;
      v8 = v98;
      v12 = v97;
      if ((v5 & 0x800) == 0 && v13)
      {
        v91 = xo_format_string_direct(a1, v111, v104, 0, v13, v14 - (unsigned __int8 *)v13, 0xFFFFFFFF, v105, 2);
        if ((*(_BYTE *)(a1 + 2) & 0x20) != 0)
          *(_QWORD *)(a1 + 376) += v91;
        if ((*(_BYTE *)(a1 + 8) & 8) != 0)
          *(_QWORD *)(a1 + 352) += v91;
      }
      if ((*(_QWORD *)&v5 & 0x180000) == 0)
        return 0;
LABEL_239:
      v92 = xo_format_gettext(a1, v5, v12 - v100, v9, v8);
      v93 = v92;
      if ((*(_BYTE *)(a1 + 2) & 0x20) != 0)
        *(_QWORD *)(a1 + 376) += v92 - v9;
      if ((*(_BYTE *)(a1 + 8) & 8) == 0)
        return 0;
      result = 0;
      *(_QWORD *)(a1 + 352) += v93 - v9;
      return result;
    }
  }
  v114 = v22;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v116 = 0;
  v29 = 0;
  v30 = v103 - (_QWORD)v19;
  v31 = 0xFFFFFFFFLL;
  while (1)
  {
    v32 = *v17;
    if (v32 <= 0x67)
      break;
    switch(*v17)
    {
      case 'h':
        v25 = (v25 + 1);
        BYTE4(v119) = v25;
        break;
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
        goto LABEL_66;
      case 'j':
        BYTE5(v119) = ++v26;
        break;
      case 'l':
        v24 = (v24 + 1);
        BYTE3(v119) = v24;
        break;
      case 'q':
        BYTE8(v119) = ++v116;
        break;
      default:
        if (v32 == 116)
        {
          BYTE6(v119) = ++v27;
        }
        else
        {
          if (v32 != 122)
            goto LABEL_66;
          v28 = (v28 + 1);
          BYTE7(v119) = v28;
        }
        break;
    }
LABEL_83:
    ++v17;
    if (!--v30)
    {
      v15 = (unint64_t)v112;
      v17 = v112;
      v5 = v107;
      v22 = v114;
      goto LABEL_86;
    }
  }
  if (v32 == 45)
  {
    v23 = 1;
    BYTE9(v119) = 1;
    goto LABEL_83;
  }
  if (v32 == 46)
  {
    LODWORD(v120) = ++v29;
    if (v29 >= 3)
    {
      v95 = "Too many dots in format: '%s'";
      goto LABEL_246;
    }
    goto LABEL_83;
  }
LABEL_66:
  v33 = (char)v32;
  v34 = (char)v32 - 48;
  if (v34 <= 9)
  {
    if ((v31 & 0x80000000) != 0)
    {
      v31 = v33 == 48;
      HIDWORD(v119) = v33 == 48;
      v34 = (char)*v17 - 48;
    }
    v35 = (char *)&v119 + 4 * v29;
    v36 = *((_DWORD *)v35 + 5);
    if (v36 <= 0)
      v37 = 0;
    else
      v37 = 10 * v36;
    *((_DWORD *)v35 + 5) = v34 + v37;
    goto LABEL_83;
  }
  if (v33 == 42)
  {
    ++LODWORD(v121[0]);
    *((_BYTE *)v121 + v29 + 4) = 1;
    goto LABEL_83;
  }
  v108 = v23;
  v38 = v31;
  v39 = v7;
  v7 = v25;
  v113 = v26;
  v115 = v27;
  v40 = v28;
  v25 = v24;
  if (memchr("diouxXDOUeEfFgGaAcCsSpm", v33, 0x18uLL))
  {
    v15 = (unint64_t)v112;
    LOBYTE(v24) = v25;
    v22 = v114;
    LOBYTE(v25) = v7;
    LOWORD(v7) = v39;
    v5 = v107;
    LODWORD(v31) = v38;
    v23 = v108;
    goto LABEL_86;
  }
  v27 = v115;
  v26 = v113;
  v23 = v108;
  if (v33 != 118)
  {
    v24 = v25;
    v28 = v40;
    v25 = v7;
    v7 = v39;
    v31 = v38;
    if (v33 != 110)
      goto LABEL_83;
  }
  v95 = "unsupported format: '%s'";
LABEL_246:
  xo_failure((_BYTE *)a1, v95);
  return -1;
}

_QWORD *xo_line_ensure_open(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  if ((*result & 0x200000000) != 0)
  {
    v3 = result[1] | 2;
    *result &= ~0x200000000uLL;
    result[1] = v3;
  }
  else
  {
    v2 = result[1];
    if ((v2 & 2) == 0 && *((_WORD *)result + 8) == 3)
    {
      result[1] = v2 | 2;
      result = xo_data_append(result, xo_line_ensure_open_div_open, 0x12uLL);
      if ((*(_BYTE *)v1 & 2) != 0)
        return xo_data_append(v1, "\n", 1uLL);
    }
  }
  return result;
}

void *xo_info_find(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v6;
  char *v7;
  size_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v10 - ((v6 + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v7, v8);
  memcpy(v7, a2, a3);
  v7[a3] = 0;
  return bsearch(v7, *(const void **)(a1 + 184), *(int *)(a1 + 192), 0x18uLL, (int (__cdecl *)(const void *, const void *))xo_info_compare);
}

unint64_t xo_format_humanize(unint64_t result, unint64_t *a2, _QWORD *a3, unsigned int a4)
{
  unint64_t v6;
  _BYTE *v7;
  unint64_t v9;
  uint64_t v10;
  int64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  unsigned int v16;
  unint64_t v17;
  BOOL v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  size_t v39;
  char *__endptr;

  if ((*(_BYTE *)(result + 3) & 8) != 0)
    return result;
  v6 = result;
  result = *a2;
  v7 = (_BYTE *)a2[1];
  if (&v7[-*a2] == (_BYTE *)*a3)
    return result;
  __endptr = 0;
  if ((unint64_t)(v7 + 1) >= result + a2[2])
  {
    v9 = (unint64_t)&v7[-result + 0x2000] & 0xFFFFFFFFFFFFE000;
    v10 = xo_realloc(result, v9);
    if (!v10)
      goto LABEL_7;
    v7 = (_BYTE *)(v10 + a2[1] - *a2);
    *a2 = v10;
    a2[1] = (unint64_t)v7;
    a2[2] = v9;
  }
  *v7 = 0;
  ++a2[1];
LABEL_7:
  v11 = strtoull((const char *)(*a2 + *a3), &__endptr, 0);
  if (v11 == -1)
  {
    result = (unint64_t)__error();
    if (*(_DWORD *)result == 34)
      return result;
  }
  result = *a2;
  v12 = (_BYTE *)*a3;
  if (__endptr == (char *)(*a2 + *a3))
    return result;
  v13 = a2[2];
  v14 = a2[1] + 10;
  if (v14 >= result + v13)
  {
    v13 = (v14 - result + 0x1FFF) & 0xFFFFFFFFFFFFE000;
    result = xo_realloc(result, v13);
    if (!result)
      return result;
    *a2 = result;
    a2[2] = v13;
    v12 = (_BYTE *)*a3;
  }
  v15 = &v12[result];
  a2[1] = (unint64_t)&v12[result];
  if (!v11)
  {
    if (result)
    {
      v16 = 0;
      v19 = 0;
      v20 = 0;
      goto LABEL_24;
    }
LABEL_69:
    xo_format_humanize_cold_1();
  }
  v16 = -1;
  if (((a4 >> 15) & 8) != 0)
  {
    v21 = v11;
    do
    {
      ++v16;
      v22 = v21 >= 0x3E8;
      v21 /= 0x3E8uLL;
    }
    while (v22);
  }
  else
  {
    v17 = v11;
    do
    {
      ++v16;
      v18 = v17 > 0x3FF;
      v17 >>= 10;
    }
    while (v18);
  }
  if (!result)
    goto LABEL_69;
  v19 = v11;
  v20 = v11 >> 63;
LABEL_24:
  if (v16 < 7 || (v16 & 0x30) != 0)
  {
    v23 = v13 - (_QWORD)v12;
    if ((_BYTE *)v13 != v12)
      *v15 = 0;
    if (v11 < 0)
      v24 = -100;
    else
      v24 = 100;
    v25 = 2;
    result = (unint64_t)&xo_version_extra;
    if (v11 < 0)
      v25 = 3;
    v26 = ((a4 >> 15) & 2) >> 1;
    if (v23 > v25 + v26)
    {
      result = v19 * v24;
      v39 = v13 - (_QWORD)v12;
      if ((v16 & 0x30) != 0)
      {
        v38 = v15;
        if ((int)v23 - ((int)v25 + (int)v26) < 1)
        {
          v28 = 100;
        }
        else
        {
          v27 = v13 - v26 - v25 - (_DWORD)v12 + 1;
          v28 = 100;
          do
          {
            v28 *= 10;
            --v27;
          }
          while (v27 > 1);
        }
        v36 = v25 + v26;
        if ((__int128)(__PAIR128__(v20, v19) * __PAIR128__(v11 >> 63, v24)) >= (unint64_t)v28)
        {
          v32 = 0;
          do
          {
            result = __divti3();
            v31 = v32 + 1;
            if ((__int128)__PAIR128__(v33, result) < (unint64_t)v28)
              break;
            v22 = v32++ >= 6;
          }
          while (!v22);
        }
        else
        {
          v31 = 0;
        }
        if ((v16 & 0x10) != 0)
          goto LABEL_66;
      }
      else
      {
        if (!v16)
          goto LABEL_64;
        v36 = v25 + v26;
        v38 = v15;
        if (v16 - 1 >= 6)
          v29 = 6;
        else
          v29 = v16 - 1;
        v30 = v29 + 1;
        do
        {
          result = __divti3();
          --v30;
        }
        while (v30);
        v31 = v29 + 1;
      }
      if ((a4 & 0x20000) != 0)
      {
        v15 = v38;
        if (result <= 0x3E2 && v31)
        {
          if (v36 + 3 > v39)
            return result;
          v37 = (((int)result + 5) / 100);
          if (v11 >= 0)
            v34 = (const char *)&xo_version_extra;
          else
            v34 = "-";
          localeconv();
          result = snprintf(v38, v39, "%s%d%s%d%s%s%s", v34, v37);
          goto LABEL_65;
        }
      }
      else
      {
        v15 = v38;
      }
LABEL_64:
      __divti3();
      result = snprintf(v15, v39, "%s%lld%s%s%s");
LABEL_65:
      v31 = result;
LABEL_66:
      if ((int)v31 >= 1)
      {
        a2[1] += v31;
        v35 = a3[2];
        *(_QWORD *)(v6 + 376) = a3[1] + v31;
        *(_QWORD *)(v6 + 352) = v35 + v31;
      }
    }
  }
  return result;
}

uint64_t xo_escape_json(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned int v14;

  v2 = a2;
  if (a2 >= 1)
  {
    v4 = 0;
    v5 = (unsigned __int8 *)a1[1];
    v6 = v5;
    do
    {
      v7 = *v6;
      if (v7 > 0x21)
      {
        if (v7 == 92 || v7 == 34)
          ++v4;
      }
      else
      {
        v8 = v7 == 10 || v7 == 13;
        if (v8)
          ++v4;
      }
      ++v6;
    }
    while (v6 < &v5[a2]);
    if (v4)
    {
      v9 = *a1;
      if ((unint64_t)&v5[v4] >= *a1 + a1[2])
      {
        v10 = (unint64_t)&v5[v4 - v9 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v11 = xo_realloc();
        if (!v11)
          return 0;
        v5 = (unsigned __int8 *)(v11 + a1[1] - *a1);
        *a1 = v11;
        a1[1] = (uint64_t)v5;
        a1[2] = v10;
      }
      v12 = &v5[v2 + v4];
      v13 = &v5[v2 - 1];
      while (1)
      {
        v14 = *v13;
        if (v14 > 0x21)
        {
          if (v14 == 92 || v14 == 34)
          {
            *(v12 - 2) = 92;
            v12 -= 2;
            v12[1] = v14;
            goto LABEL_28;
          }
        }
        else
        {
          if (v14 == 10)
          {
            *((_WORD *)v12 - 1) = 28252;
            v12 -= 2;
            goto LABEL_28;
          }
          if (v14 == 13)
          {
            *((_WORD *)v12 - 1) = 29276;
            v12 -= 2;
            goto LABEL_28;
          }
        }
        *--v12 = v14;
LABEL_28:
        if (v13 > v5)
        {
          v8 = v13-- == v12;
          if (!v8)
            continue;
        }
        v2 += v4;
        return v2;
      }
    }
  }
  return v2;
}

uint64_t xo_escape_sdparams(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;

  v2 = a2;
  if (a2 >= 1)
  {
    v4 = 0;
    v5 = (unsigned __int8 *)a1[1];
    v6 = v5;
    do
    {
      v7 = *v6 - 34;
      v8 = v7 > 0x3B;
      v9 = (1 << v7) & 0xC00000000000001;
      v10 = v8 || v9 == 0;
      if (!v10)
        ++v4;
      ++v6;
    }
    while (v6 < &v5[a2]);
    if (v4)
    {
      v11 = *a1;
      if ((unint64_t)&v5[v4] >= *a1 + a1[2])
      {
        v12 = (unint64_t)&v5[v4 - v11 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v13 = xo_realloc();
        if (!v13)
          return 0;
        v5 = (unsigned __int8 *)(v13 + a1[1] - *a1);
        *a1 = v13;
        a1[1] = (uint64_t)v5;
        a1[2] = v12;
      }
      v14 = &v5[v2 + v4];
      v15 = &v5[v2 - 1];
      do
      {
        v16 = *v15;
        if ((v16 - 34) > 0x3B || ((1 << (v16 - 34)) & 0xC00000000000001) == 0)
        {
          *--v14 = v16;
        }
        else
        {
          *(v14 - 2) = 92;
          v14 -= 2;
          v14[1] = v16;
        }
        if (v15 <= v5)
          break;
        v10 = v15-- == v14;
      }
      while (!v10);
      v2 += v4;
    }
  }
  return v2;
}

uint64_t xo_format_string_direct(uint64_t a1, uint64_t *a2, __int16 a3, __int32 *a4, char *a5, uint64_t a6, unsigned int a7, int a8, int a9)
{
  uint64_t v9;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int32 v23;
  int64_t v24;
  size_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  unsigned __int32 v31;
  int v32;
  uint64_t v33;
  char v34;
  int v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  int v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  int v55;
  uint64_t v56;
  _BYTE *v57;
  unint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  const char *v61;
  size_t v62;
  void *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  char *v70;
  mbstate_t *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  __int32 v79;

  v9 = a6;
  v79 = 0;
  if (a6 >= 1)
  {
    v14 = *a2;
    v15 = a2[1] + a6;
    if (v15 < *a2 + a2[2])
      goto LABEL_6;
    v16 = (v15 - v14 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
    v17 = xo_realloc(v14, v16);
    if (v17)
    {
      v18 = v17 + a2[1] - *a2;
      *a2 = v17;
      a2[1] = v18;
      a2[2] = v16;
      goto LABEL_6;
    }
    return 0;
  }
  if (!a6)
    return 0;
LABEL_6:
  v19 = 0;
  v72 = (mbstate_t *)(a1 + 216);
  v20 = a7;
LABEL_7:
  v73 = v20 - (int)v19;
  while (2)
  {
    if (a5)
    {
      v21 = *a5;
      if (!*a5)
        return v19;
      if ((a3 & 0x4000) != 0 && (v21 == 92 || v21 == 37))
      {
        if (!--v9)
          return v19;
        if (!*++a5)
          return v19;
      }
    }
    if (a4 && !*a4)
      return v19;
    switch(a9)
    {
      case 3:
        if (v9 <= 0)
          v25 = 6;
        else
          v25 = v9;
        v24 = mbrtowc(&v79, a5, v25, v72);
        if ((v24 & 0x8000000000000000) == 0)
        {
          if (!v24)
            return v19;
          goto LABEL_32;
        }
        xo_failure((_BYTE *)a1, "invalid mbs char: %02hhx");
        v79 = 63;
LABEL_31:
        v24 = 1;
LABEL_32:
        a5 += v24;
        break;
      case 2:
        v26 = *a5;
        if (*a5 < 0)
        {
          if ((v26 & 0xE0) == 0xC0)
          {
            v24 = 2u;
          }
          else if ((v26 & 0xF0) == 0xE0)
          {
            v24 = 3u;
          }
          else
          {
            if ((v26 & 0xF8) != 0xF0)
            {
              v70 = "invalid UTF-8 character: %02hhx";
LABEL_126:
              xo_failure((_BYTE *)a1, v70);
              return 0xFFFFFFFFLL;
            }
            v24 = 4u;
          }
          if (v9 >= 1 && v9 < v24)
            return v19;
          v32 = (*((_BYTE *)&xo_utf8_data_bits + v24) & v26);
          v33 = 1;
          do
          {
            v34 = a5[v33];
            if ((v34 & 0xC0) != 0x80)
            {
              v79 = -1;
              goto LABEL_125;
            }
            v35 = v34 & 0x3F | (v32 << 6);
            ++v33;
            v32 = v35;
          }
          while (v24 != v33);
          v79 = v35;
          if (v35 == -1)
          {
LABEL_125:
            v70 = "invalid UTF-8 character: %02hhx/%d";
            goto LABEL_126;
          }
          goto LABEL_32;
        }
        v79 = *a5;
        goto LABEL_31;
      case 1:
        v23 = *a4++;
        v79 = v23;
        v24 = 1;
        break;
      default:
        v24 = 0;
        break;
    }
    if (v9 > 0)
      v9 = (v9 - v24) & ~((v9 - v24) >> 63);
    v27 = v79;
    v28 = xo_wcwidth(v79);
    if ((v28 & 0x80000000) != 0)
    {
      if (v27 > 0x7F)
        v30 = __maskrune(v27, 0x200uLL);
      else
        v30 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v27 + 60) & 0x200;
      v29 = v30 == 0;
    }
    else
    {
      v29 = v28;
    }
    if (*(_WORD *)(a1 + 16))
    {
      if ((int)a7 >= 1 && *(_WORD *)(a1 + 16) == 3)
      {
LABEL_46:
        if (v29 > v73)
          return v19;
      }
    }
    else if ((int)a7 >= 1)
    {
      goto LABEL_46;
    }
    if (a8 != 2)
    {
      if (a8 == 3)
      {
        v36 = (char *)a2[1];
        if ((unint64_t)(v36 + 7) >= *a2 + a2[2])
        {
          v37 = (unint64_t)&v36[-*a2 + 8198] & 0xFFFFFFFFFFFFE000;
          v38 = xo_realloc(*a2, v37);
          if (!v38)
            return 0xFFFFFFFFLL;
          v39 = v38;
          v36 = (char *)(v38 + a2[1] - *a2);
          *a2 = v39;
          a2[1] = (uint64_t)v36;
          a2[2] = v37;
          v20 = a7;
        }
        v40 = wcrtomb(v36, v79, v72);
        if (v40 <= 0)
        {
          xo_failure((_BYTE *)a1, "could not convert wide char: %lx");
          v60 = (_BYTE *)a2[1];
          a2[1] = (uint64_t)(v60 + 1);
          *v60 = 63;
          LODWORD(v29) = 1;
        }
        else
        {
          a2[1] += v40;
        }
      }
      goto LABEL_121;
    }
    switch(*(_WORD *)(a1 + 16))
    {
      case 1:
      case 3:
        v31 = v79;
        switch(v79)
        {
          case '&':
            v61 = xo_xml_amp;
            break;
          case '<':
            v61 = xo_xml_lt;
            break;
          case '>':
            v61 = xo_xml_gt;
            break;
          default:
            if ((a3 & 0x200) == 0 || v79 != 34)
              goto LABEL_62;
            v61 = xo_xml_quot;
            break;
        }
        v62 = strlen(v61);
        v64 = *a2;
        v63 = (void *)a2[1];
        v65 = (unint64_t)v63 + v62 - 1;
        if (v65 >= *a2 + a2[2])
        {
          v75 = v61;
          v66 = (v65 - v64 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
          v67 = xo_realloc(v64, v66);
          if (!v67)
            return 0xFFFFFFFFLL;
          v68 = v67;
          v63 = (void *)(v67 + a2[1] - *a2);
          *a2 = v68;
          a2[1] = (uint64_t)v63;
          a2[2] = v66;
          v61 = v75;
        }
        memcpy(v63, v61, v62);
        a2[1] += v62;
        v20 = a7;
        goto LABEL_121;
      case 2:
        v31 = v79;
        if ((v79 > 0x22 || ((1 << v79) & 0x400002400) == 0) && v79 != 92)
          goto LABEL_62;
        v50 = *a2;
        v51 = (_BYTE *)a2[1];
        if ((unint64_t)(v51 + 2) < *a2 + a2[2])
          goto LABEL_103;
        v52 = (unint64_t)&v51[-v50 + 8193] & 0xFFFFFFFFFFFFE000;
        v53 = xo_realloc(v50, v52);
        if (!v53)
          return 0xFFFFFFFFLL;
        v51 = (_BYTE *)(v53 + a2[1] - *a2);
        *a2 = v53;
        a2[2] = v52;
LABEL_103:
        a2[1] = (uint64_t)(v51 + 1);
        *v51 = 92;
        v54 = v79;
        v20 = a7;
        if (v79 == 13)
        {
          v55 = 114;
        }
        else if (v79 == 10)
        {
          v55 = 110;
        }
        else
        {
LABEL_110:
          v55 = v54 & 0x7F;
        }
        v79 = v55;
        v69 = (_BYTE *)a2[1];
        a2[1] = (uint64_t)(v69 + 1);
        *v69 = v55;
        goto LABEL_121;
      case 4:
        v31 = v79;
        if ((v79 - 34) > 0x3B || ((1 << (v79 - 34)) & 0xC00000000000001) == 0)
          goto LABEL_62;
        v56 = *a2;
        v57 = (_BYTE *)a2[1];
        v20 = a7;
        if ((unint64_t)(v57 + 2) < *a2 + a2[2])
          goto LABEL_109;
        v58 = (unint64_t)&v57[-v56 + 8193] & 0xFFFFFFFFFFFFE000;
        v59 = xo_realloc(v56, v58);
        if (!v59)
          return 0xFFFFFFFFLL;
        v57 = (_BYTE *)(v59 + a2[1] - *a2);
        *a2 = v59;
        a2[2] = v58;
LABEL_109:
        a2[1] = (uint64_t)(v57 + 1);
        *v57 = 92;
        v54 = v79;
        goto LABEL_110;
      default:
        v31 = v79;
LABEL_62:
        if (v31 < 0x80)
        {
          v74 = a1;
          v41 = 1u;
          goto LABEL_91;
        }
        if (v31 < 0x800)
        {
          v74 = a1;
          v41 = 2u;
          goto LABEL_91;
        }
        if (v31 < 0x10000)
        {
          v74 = a1;
          v41 = 3u;
          goto LABEL_91;
        }
        if (v31 >= 0x200000)
        {
          xo_failure((_BYTE *)a1, "ignoring bad length");
          v20 = a7;
          if (!v9)
            return v19;
          continue;
        }
        v74 = a1;
        v41 = 4u;
LABEL_91:
        v42 = *a2;
        v43 = (_BYTE *)a2[1];
        v44 = v31;
        if ((unint64_t)&v43[v41] < *a2 + a2[2])
        {
LABEL_94:
          if (v31 >= 0x80)
          {
            v48 = v41 - 1;
            do
            {
              v43[v48] = v44 & 0x3F | 0x80;
              v44 >>= 6;
              v49 = v48-- + 1;
            }
            while (v49 > 1);
            v47 = *((_BYTE *)&xo_utf8_len_bits + v41) | *v43 & *((_BYTE *)&xo_utf8_data_bits + v41);
          }
          else
          {
            v47 = v44 & 0x7F;
          }
          *v43 = v47;
          a2[1] += v41;
          a1 = v74;
          v20 = a7;
LABEL_121:
          v19 = (v19 + v29);
          if (!v9)
            return v19;
          goto LABEL_7;
        }
        v45 = (unint64_t)&v43[v41 - v42 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        v46 = xo_realloc(v42, v45);
        if (v46)
        {
          v43 = (_BYTE *)(v46 + a2[1] - *a2);
          *a2 = v46;
          a2[1] = (uint64_t)v43;
          a2[2] = v45;
          v44 = v79;
          goto LABEL_94;
        }
        return 0xFFFFFFFFLL;
    }
  }
}

size_t xo_trim_ws(uint64_t a1, uint64_t a2)
{
  size_t v2;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;

  v2 = a2;
  v4 = *(char **)(a1 + 8);
  if (a2 >= 1)
  {
    v5 = &v4[a2];
    v6 = v4;
    do
    {
      if (*v6 != 32)
        break;
      ++v6;
    }
    while (v6 < v5);
    if (v6 != v4)
    {
      v2 += v4 - v6;
      memmove(v4, v6, v2);
      v4 = *(char **)(a1 + 8);
    }
  }
  v7 = 0;
  v8 = &v4[v2];
  do
  {
    v9 = v7;
    v10 = (unint64_t)&v8[v7];
    if ((unint64_t)v4 >= v10)
      break;
    v11 = *(unsigned __int8 *)(v10 - 1);
    v7 = v9 - 1;
  }
  while (v11 == 32);
  if (v9)
  {
    v2 += v9;
    v8[v9] = 0;
  }
  return v2;
}

uint64_t xo_format_gettext(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v11;
  _BYTE *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  const char *v18;
  _BYTE *v19;
  char *v20;
  int v21;
  int v22;
  char *v23;
  int v24;
  unsigned int v25;
  _BYTE *v26;
  char *v28;
  size_t v29;
  char *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_BYTE **)(a1 + 80);
  v13 = (uint64_t *)(a1 + 72);
  if ((unint64_t)(v12 + 1) >= v11 + v13[2])
  {
    v14 = (unint64_t)&v12[-v11 + 0x2000] & 0xFFFFFFFFFFFFE000;
    v15 = xo_realloc(v11, v14);
    if (!v15)
      return a4;
    v12 = (_BYTE *)(v15 + *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72));
    *(_QWORD *)(a1 + 72) = v15;
    *(_QWORD *)(a1 + 80) = v12;
    *(_QWORD *)(a1 + 88) = v14;
  }
  *v12 = 0;
  v16 = *v13;
  v17 = (char *)(*v13 + a3);
  if ((a2 & 0x100000) == 0)
  {
    v18 = (const char *)(*v13 + a3);
    if (a5 == 2)
      return a4;
    goto LABEL_29;
  }
  v19 = *(_BYTE **)(a1 + 80);
  v20 = (char *)(a3 + v16 - 1);
  do
  {
    if ((unint64_t)v20 < v16)
    {
      v22 = 0;
      goto LABEL_15;
    }
    v21 = *v20--;
  }
  while ((v21 - 48) > 9);
  v22 = 0;
  v23 = v20 + 1;
  v24 = 1;
  do
  {
    v25 = *v23 - 48;
    if (v25 > 9)
      break;
    v22 += v25 * v24;
    v24 *= 10;
    --v23;
  }
  while ((unint64_t)v23 >= v16);
LABEL_15:
  v26 = memchr((void *)(*v13 + a3), 44, v19 - v17);
  if (v26)
  {
    if (v26 == v17)
    {
      v28 = "nothing before comma in plural gettext field: '%s'";
    }
    else
    {
      if (v26 != v19)
      {
        *v26 = 0;
        if (v22 == 1)
          v18 = v17;
        else
          v18 = v26 + 1;
        if (v18 == v17)
        {
          *(_QWORD *)(a1 + 80) = v26;
          if (a5 == 2)
            return xo_count_utf8_cols(v17, v26 - v17);
          v18 = v17;
        }
LABEL_29:
        v29 = strlen(v18);
        v30 = (char *)v31 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
        bzero(v30, v29 + 1);
        memcpy(v30, v18, v29 + 1);
        *(_QWORD *)(a1 + 80) = *(_QWORD *)(a1 + 72) + a3;
        return (int)xo_format_string_direct(a1, v13, a2, 0, v30, v29, 0, a5, 2);
      }
      v28 = "nothing after comma in plural gettext field: '%s'";
    }
  }
  else
  {
    v28 = "no comma in plural gettext field: '%s'";
  }
  xo_failure((_BYTE *)a1, v28);
  return a4;
}

uint64_t xo_wcwidth(signed int a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  BOOL v8;

  if (!a1)
    return 0;
  v1 = 0xFFFFFFFFLL;
  if (a1 >= 32 && (a1 - 127) >= 0x21)
  {
    if ((a1 - 918000) >= 0xFFF20110)
    {
      v2 = 0;
      v3 = 141;
      do
      {
        v4 = v3 + v2;
        if (v3 + v2 < 0 != __OFADD__(v3, v2))
          ++v4;
        v5 = v4 >> 1;
        v6 = (uint64_t)v4 >> 1;
        if (xo_wcwidth_combining[2 * v5 + 1] >= a1)
        {
          if (xo_wcwidth_combining[2 * v6] <= a1)
            return 0;
          v3 = v6 - 1;
        }
        else
        {
          v2 = v6 + 1;
        }
      }
      while (v3 >= v2);
    }
    if (a1 < 4352)
    {
      return 1;
    }
    else
    {
      v1 = 2;
      if (a1 >> 5 >= 0x8B && (a1 - 9001) >= 2)
      {
        v8 = a1 != 12351 && (a1 - 11904) >> 4 < 0x765;
        v1 = 2;
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_24BC33E50, (uint32x4_t)vaddq_s32(vdupq_n_s32(a1), (int32x4_t)xmmword_24BC33E40)))) & 1) == 0&& (a1 - 65280) >= 0x61&& (a1 - 65504) >= 7&& (a1 - 0x20000) >= 0xFFFE&& !v8)
        {
          if ((a1 - 196608) >= 0xFFFE)
            return 1;
          else
            return 2;
        }
      }
    }
  }
  return v1;
}

uint64_t xo_count_utf8_cols(char *a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned __int8 v10;
  unsigned int v11;
  uint64_t v12;
  int v13;

  if (a2 < 1)
    return 0;
  v2 = a1;
  v3 = 0;
  v4 = (unint64_t)&a1[a2];
  v5 = MEMORY[0x24BDAC740];
  while (1)
  {
    v6 = *v2;
    if (*v2 < 0)
      break;
    v7 = 1;
LABEL_15:
    if (v6 > 0x7F)
    {
      if (__maskrune(v6, 0x40000uLL))
      {
LABEL_19:
        v11 = xo_wcwidth(v6);
        if ((v11 & 0x80000000) != 0)
        {
          if (v6 > 0x7F)
            v13 = __maskrune(v6, 0x200uLL);
          else
            v13 = *(_DWORD *)(v5 + 4 * v6 + 60) & 0x200;
          v12 = v13 == 0;
        }
        else
        {
          v12 = v11;
        }
        v3 += v12;
      }
    }
    else if ((*(_DWORD *)(v5 + 4 * v6 + 60) & 0x40000) != 0)
    {
      goto LABEL_19;
    }
    v2 += v7;
    if ((unint64_t)v2 >= v4)
      return v3;
  }
  if ((v6 & 0xE0) == 0xC0)
  {
    v7 = 2u;
LABEL_11:
    v8 = *((_BYTE *)&xo_utf8_data_bits + v7) & v6;
    v9 = 1;
    while (1)
    {
      v10 = v2[v9];
      if ((v10 & 0xC0) != 0x80)
        break;
      v6 = v10 & 0x3F | (v8 << 6);
      ++v9;
      v8 = v6;
      if (v7 == v9)
      {
        if (v6 == -1)
          return v3;
        goto LABEL_15;
      }
    }
  }
  else
  {
    if ((v6 & 0xF0) == 0xE0)
    {
      v7 = 3u;
      goto LABEL_11;
    }
    if ((v6 & 0xF8) == 0xF0)
    {
      v7 = 4u;
      goto LABEL_11;
    }
  }
  return v3;
}

uint64_t xo_data_append_content(uint64_t a1, char *a2, uint64_t a3, int a4)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = 2;
  if ((*(_BYTE *)(a1 + 3) & 0x20) == 0)
  {
    if (*(_WORD *)(a1 + 16))
      v6 = 2;
    else
      v6 = 3;
  }
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 72);
  result = xo_format_string_direct(a1, (uint64_t *)(a1 + 72), a4 | 0x4000u, 0, a2, a3, 0xFFFFFFFF, v6, 2);
  if ((*(_QWORD *)&a4 & 0x180000) != 0)
    result = xo_format_gettext(a1, a4, v7 - v8, (int)result, v6);
  if ((*(_BYTE *)(a1 + 2) & 0x20) != 0)
    *(_QWORD *)(a1 + 376) += (int)result;
  if ((*(_BYTE *)(a1 + 8) & 8) != 0)
    *(_QWORD *)(a1 + 352) += (int)result;
  return result;
}

uint64_t xo_info_compare(const char *a1, const char **a2)
{
  return strcmp(a1, *a2);
}

_BYTE *xo_printable(uint64_t a1)
{
  int *v1;
  int v2;
  uint64_t v3;
  _BYTE *v4;
  int v5;
  _BYTE *result;
  int v7;
  _BYTE *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;

  if (!a1)
    return &xo_version_extra;
  v1 = (int *)xo_printable_bufnum();
  if (*v1 == 7)
    v2 = 0;
  else
    v2 = *v1 + 1;
  *v1 = v2;
  v3 = xo_printable_bufset();
  result = (_BYTE *)(v3 + ((uint64_t)v5 << 7));
  v7 = *v4;
  v8 = result;
  if (*v4)
  {
    v9 = 0;
    v10 = v4 + 1;
    v8 = result;
    do
    {
      switch(v7)
      {
        case 34:
          ++v9;
          *v8 = 92;
          result[v9] = 34;
          break;
        case 13:
          ++v9;
          *v8 = 92;
          result[v9] = 114;
          break;
        case 10:
          ++v9;
          *v8 = 92;
          result[v9] = 110;
          break;
        default:
          *v8 = v7;
          break;
      }
      v8 = &result[v9 + 1];
      v11 = *v10++;
      v7 = v11;
      if (!v11)
        break;
    }
    while (v9++ < 126);
  }
  *v8 = 0;
  return result;
}

unint64_t xo_format_text(unint64_t result, char *a2, uint64_t a3)
{
  char *v3;
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  _QWORD *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int v18;
  int v19;
  int v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  size_t v25;
  char *v26;
  char v27;
  char v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  _BYTE *v35;
  char *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  int64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  int64_t v46;

  v3 = a2;
  v4 = result;
  if (*(_WORD *)(result + 16) == 3)
    return (unint64_t)xo_buf_append_div(result, "text", 0, 0, 0, a2, a3, 0, 0, 0, 0);
  if (!*(_WORD *)(result + 16))
  {
    v5 = (_QWORD *)(result + 72);
    v6 = &a2[a3];
    v7 = (_QWORD *)(result + 80);
    if (a3 >= 1)
    {
      v8 = 0;
      v46 = *(_QWORD *)(result + 72) - *(_QWORD *)(result + 80);
      v9 = a2;
      while (1)
      {
        v10 = *v9;
        if (v10 < 0)
          break;
        result = 1;
LABEL_49:
        v8 += result;
        if (++v9 >= v6)
        {
          v39 = v8;
          goto LABEL_55;
        }
      }
      if (v3 == v9)
      {
        v18 = *v9;
        v17 = v6 - v9;
        goto LABEL_16;
      }
      if (v3)
      {
        v12 = *(_QWORD *)(v4 + 72);
        v11 = *(char **)(v4 + 80);
        v13 = &v11[v9 - v3];
        if ((unint64_t)v13 >= v12 + *(_QWORD *)(v4 + 88))
        {
          v14 = (unint64_t)&v13[-v12 + 0x1FFF] & 0xFFFFFFFFFFFFE000;
          v15 = xo_realloc(*(_QWORD *)(v4 + 72), v14);
          if (!v15)
            goto LABEL_13;
          v16 = v15;
          v11 = (char *)(v15 + *(_QWORD *)(v4 + 80) - *(_QWORD *)(v4 + 72));
          *(_QWORD *)(v4 + 72) = v16;
          *(_QWORD *)(v4 + 80) = v11;
          *(_QWORD *)(v4 + 88) = v14;
        }
        memcpy(v11, v3, v9 - v3);
        *v7 += v9 - v3;
      }
LABEL_13:
      v10 = *v9;
      v17 = v6 - v9;
      v18 = *v9;
      if ((v10 & 0x80000000) == 0)
      {
        v19 = 0;
        v20 = 0;
        v21 = 1u;
        goto LABEL_22;
      }
LABEL_16:
      if ((v18 & 0xE0) == 0xC0)
      {
        v20 = 0;
        v19 = 1;
        v21 = 2u;
      }
      else if ((v18 & 0xF0) == 0xE0)
      {
        v19 = 1;
        v20 = 1;
        v21 = 3u;
      }
      else
      {
        if ((v18 & 0xF8) != 0xF0)
        {
          v40 = "invalid UTF-8 data: %02hhx";
          goto LABEL_53;
        }
        v19 = 1;
        v20 = 1;
        v21 = 4u;
      }
LABEL_22:
      if ((uint64_t)v21 > v17)
      {
        v40 = "invalid UTF-8 data (short): %02hhx (%d/%d)";
        goto LABEL_53;
      }
      if (v20)
      {
        if (v21 <= 3)
          v22 = 3;
        else
          v22 = v21;
        v23 = 2;
        while ((v9[v23] & 0xC0) == 0x80)
        {
          if (v22 == ++v23)
            goto LABEL_30;
        }
        v40 = "invalid UTF-8 data (byte %d): %x";
LABEL_53:
        result = (unint64_t)xo_failure((_BYTE *)v4, v40);
        v41 = v46;
LABEL_65:
        *v7 = *v5 + v41;
        return result;
      }
LABEL_30:
      if (v19)
      {
        v24 = (v10 & *((_BYTE *)&xo_utf8_data_bits + v21));
        v25 = v21 - 1;
        v26 = v9 + 1;
        while (1)
        {
          v28 = *v26++;
          v27 = v28;
          if ((v28 & 0xC0) != 0x80)
            break;
          v18 = v27 & 0x3F | (v24 << 6);
          v24 = v18;
          if (!--v25)
          {
            if (v18 != -1)
              goto LABEL_35;
            break;
          }
        }
        v35 = (_BYTE *)v4;
        v36 = "invalid UTF-8 byte sequence";
        goto LABEL_42;
      }
LABEL_35:
      v30 = *(_QWORD *)(v4 + 72);
      v29 = *(void **)(v4 + 80);
      v31 = v30 + *(_QWORD *)(v4 + 88);
      if ((*(_BYTE *)(v4 + 1) & 0x40) != 0)
      {
        if ((unint64_t)v29 + v21 >= v31)
        {
          v37 = ((unint64_t)v29 + v21 - v30 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
          result = xo_realloc(*(_QWORD *)(v4 + 72), v37);
          if (!result)
            goto LABEL_48;
          v38 = result;
          v29 = (void *)(result + *(_QWORD *)(v4 + 80) - *(_QWORD *)(v4 + 72));
          *(_QWORD *)(v4 + 72) = v38;
          *(_QWORD *)(v4 + 80) = v29;
          *(_QWORD *)(v4 + 88) = v37;
        }
        memcpy(v29, v9, v21);
        v34 = v21;
      }
      else
      {
        if ((unint64_t)v29 + 7 >= v31)
        {
          v32 = ((unint64_t)v29 - v30 + 8198) & 0xFFFFFFFFFFFFE000;
          result = xo_realloc(*(_QWORD *)(v4 + 72), v32);
          if (!result)
          {
LABEL_48:
            v3 = &v9[v21];
            v9 = &v9[v21 - 1];
            goto LABEL_49;
          }
          v33 = result;
          v29 = (void *)(result + *(_QWORD *)(v4 + 80) - *(_QWORD *)(v4 + 72));
          *(_QWORD *)(v4 + 72) = v33;
          *(_QWORD *)(v4 + 80) = v29;
          *(_QWORD *)(v4 + 88) = v32;
        }
        *(_OWORD *)(v4 + 312) = 0u;
        *(_OWORD *)(v4 + 328) = 0u;
        *(_OWORD *)(v4 + 280) = 0u;
        *(_OWORD *)(v4 + 296) = 0u;
        *(_OWORD *)(v4 + 248) = 0u;
        *(_OWORD *)(v4 + 264) = 0u;
        *(_OWORD *)(v4 + 216) = 0u;
        *(_OWORD *)(v4 + 232) = 0u;
        v34 = wcrtomb((char *)v29, v18, (mbstate_t *)(v4 + 216));
        if (v34 <= 0)
        {
          v35 = (_BYTE *)v4;
          v36 = "could not convert wide char: %lx";
LABEL_42:
          xo_failure(v35, v36);
          result = 0;
          goto LABEL_48;
        }
      }
      *v7 += v34;
      result = xo_wcwidth(v18);
      goto LABEL_48;
    }
    v39 = 0;
LABEL_55:
    if ((*(_BYTE *)(v4 + 2) & 0x20) != 0)
      *(_QWORD *)(v4 + 376) += v39;
    if ((*(_BYTE *)(v4 + 8) & 8) != 0)
      *(_QWORD *)(v4 + 352) += v39;
    v41 = v6 - v3;
    if (v6 != v3 && v3)
    {
      v43 = *(_QWORD *)(v4 + 72);
      v42 = *(void **)(v4 + 80);
      if ((unint64_t)v42 + v41 >= v43 + *(_QWORD *)(v4 + 88))
      {
        v44 = ((unint64_t)v42 + v41 - v43 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
        result = xo_realloc(*(_QWORD *)(v4 + 72), v44);
        if (!result)
          return result;
        v45 = result;
        v42 = (void *)(result + *(_QWORD *)(v4 + 80) - *(_QWORD *)(v4 + 72));
        *(_QWORD *)(v4 + 72) = v45;
        *(_QWORD *)(v4 + 80) = v42;
        *(_QWORD *)(v4 + 88) = v44;
      }
      result = (unint64_t)memcpy(v42, v3, v6 - v3);
      v5 = (_QWORD *)(v4 + 80);
      goto LABEL_65;
    }
  }
  return result;
}

uint64_t xo_format_content(uint64_t result, char *a2, char *a3, char *a4, uint64_t a5, unsigned __int8 *a6, size_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned __int8 *v20;
  uint64_t v21;

  v13 = result;
  switch(*(_WORD *)(result + 16))
  {
    case 0:
      if (!a5)
      {
        v20 = a6;
        v21 = a7;
        v19 = a8;
        goto LABEL_11;
      }
      result = xo_data_append_content(result, a4, a5, a8);
      break;
    case 1:
    case 2:
    case 4:
      if (!a3)
        goto LABEL_4;
      xo_transition(result, 0, a3, 1, a5, (uint64_t)a6, a7, a8);
      xo_format_value(v13, "message", 7uLL, a4, a5, a6, a7, 0, 0, a8);
      result = xo_transition(v13, 0, a3, 2, v15, v16, v17, v18);
      break;
    case 3:
      result = (uint64_t)xo_buf_append_div(result, a2, a8, 0, 0, a4, a5, a6, a7, 0, 0);
      break;
    case 5:
LABEL_4:
      if (!a5)
      {
        v19 = a8 | 0x800;
        v20 = a6;
        v21 = a7;
LABEL_11:
        result = xo_do_format_field(result, 0, v20, v21, v19);
      }
      break;
    default:
      return result;
  }
  return result;
}

_BYTE *xo_anchor_stop(uint64_t a1, uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v5;
  _BYTE *result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 8);
  if ((v5 & 8) == 0)
    return xo_failure((_BYTE *)a1, "no start anchor");
  *(_QWORD *)(a1 + 8) = v5 & 0xFFFFFFFFFFFFFFEFLL;
  result = (_BYTE *)xo_find_width(a1, a2, a3, a4);
  v7 = (uint64_t)result;
  if (!result)
    v7 = *(_QWORD *)(a1 + 360);
  if (v7)
  {
    v8 = v7 >= 0 ? v7 : -v7;
    v9 = v8 - *(_QWORD *)(a1 + 352);
    if (v9 >= 1)
    {
      if (v8 <= 0x2000)
      {
        v10 = *(_QWORD *)(a1 + 344);
        v12 = *(_QWORD *)(a1 + 72);
        v11 = *(_QWORD *)(a1 + 80);
        MEMORY[0x24BDAC7A8](result);
        v13 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v13, v9);
        memset(v13, 32, v9);
        result = (_BYTE *)xo_format_content(a1, "padding", 0, v13, v9, 0, 0, 0);
        if ((v7 & 0x8000000000000000) == 0)
        {
          v14 = v11 - v12;
          v15 = *(_QWORD *)(a1 + 72);
          v16 = *(_QWORD *)(a1 + 80) - v15 - v14;
          if (v16 >= 1)
          {
            if (v16 > (unint64_t)v9)
            {
              MEMORY[0x24BDAC7A8](result);
              v13 = (char *)v17 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
              bzero(v13, v16);
            }
            memcpy(v13, (const void *)(v15 + v14), v16);
            memmove((void *)(v15 + v10 + v16), (const void *)(v15 + v10), v14 - v10);
            result = memmove((void *)(*(_QWORD *)(a1 + 72) + v10), v13, v16);
          }
        }
      }
      else
      {
        result = xo_failure((_BYTE *)a1, "width over %u are not supported");
      }
    }
  }
  *(_QWORD *)(a1 + 8) &= ~8uLL;
  *(_QWORD *)(a1 + 352) = 0;
  *(_QWORD *)(a1 + 360) = 0;
  *(_QWORD *)(a1 + 344) = 0;
  return result;
}

uint64_t xo_format_title(uint64_t result, uint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  size_t v9;
  unsigned int v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  _BYTE *v20;
  _BYTE *v21;
  _WORD *v22;
  unint64_t v23;
  char *v24;
  size_t v25;
  void *v26;
  char *v27;
  size_t v28;
  size_t v29;
  uint64_t v30;
  char *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  char *v37;
  unint64_t v38;
  _QWORD v39[2];

  v5 = result;
  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2[9];
  v7 = *a2;
  if (v6)
    v8 = (unsigned __int8 *)a2[4];
  else
    v8 = "%s";
  if (v6)
    v9 = a2[9];
  else
    v9 = 2;
  v10 = *(unsigned __int16 *)(result + 16);
  if (v10 <= 5 && ((1 << v10) & 0x36) != 0)
  {
    if (!a4)
      return xo_do_format_field(result, 0, v8, v9, v7 | 0x800);
    return result;
  }
  v13 = *(_QWORD *)(result + 80);
  v39[0] = *(_QWORD *)(result + 72);
  v14 = *(_QWORD *)(result + 88);
  if (v10 != 3)
    goto LABEL_27;
  xo_line_ensure_open((_QWORD *)result);
  if ((*(_BYTE *)v5 & 2) != 0)
    xo_buf_indent((_QWORD *)v5, *(unsigned __int16 *)(v5 + 20));
  v15 = *(_QWORD *)(v5 + 72);
  v16 = *(_QWORD *)(v5 + 80);
  if (v16 + 17 < (unint64_t)(v15 + *(_QWORD *)(v5 + 88)))
    goto LABEL_20;
  v17 = (v16 + 17 - v15 + 0x1FFF) & 0xFFFFFFFFFFFFE000;
  v18 = xo_realloc(v15, v17);
  if (v18)
  {
    v16 = v18 + *(_QWORD *)(v5 + 80) - *(_QWORD *)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v18;
    *(_QWORD *)(v5 + 80) = v16;
    *(_QWORD *)(v5 + 88) = v17;
LABEL_20:
    v19 = *(_OWORD *)xo_format_title_div_open;
    *(_BYTE *)(v16 + 16) = xo_format_title_div_open[16];
    *(_OWORD *)v16 = v19;
    *(_QWORD *)(v5 + 80) += 17;
  }
  v20 = *(_BYTE **)(v5 + 408);
  v21 = *(_BYTE **)(v5 + 416);
  if (v21 != v20)
    xo_data_append((_QWORD *)v5, v20, v21 - v20);
  result = *(_QWORD *)(v5 + 72);
  v22 = *(_WORD **)(v5 + 80);
  if ((unint64_t)(v22 + 1) >= result + *(_QWORD *)(v5 + 88))
  {
    v23 = ((unint64_t)v22 - result + 8193) & 0xFFFFFFFFFFFFE000;
    result = xo_realloc(result, v23);
    if (!result)
      goto LABEL_27;
    v22 = (_WORD *)(result + *(_QWORD *)(v5 + 80) - *(_QWORD *)(v5 + 72));
    *(_QWORD *)(v5 + 72) = result;
    *(_QWORD *)(v5 + 80) = v22;
    *(_QWORD *)(v5 + 88) = v23;
  }
  *v22 = *(_WORD *)xo_format_title_div_middle;
  *(_QWORD *)(v5 + 80) += 2;
LABEL_27:
  if (!a4)
  {
    v33 = *(_QWORD *)(v5 + 80) - *(_QWORD *)(v5 + 72);
    result = xo_do_format_field(v5, 0, v8, v9, v7);
    v34 = *(_QWORD *)(v5 + 72) + v33;
    v35 = *(_QWORD *)(v5 + 80) - v34;
    *(_QWORD *)(v5 + 80) = v34;
LABEL_42:
    if (*(_WORD *)(v5 + 16) == 3)
    {
      result = xo_escape_xml((uint64_t *)(v5 + 72), v35, 0);
      v35 = result;
    }
    if (v35 >= 1)
      *(_QWORD *)(v5 + 80) += v35;
    goto LABEL_46;
  }
  MEMORY[0x24BDAC7A8](result);
  v24 = (char *)v39 - ((v9 + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v24, v25);
  v26 = memcpy(v24, v8, v9);
  v24[v9] = 0;
  MEMORY[0x24BDAC7A8](v26);
  v27 = (char *)v39 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v27, v28);
  memcpy(v27, a3, a4);
  v27[a4] = 0;
  if (v27[a4 - 1] != 115)
  {
    v36 = v39[0] - v13 + v14;
    result = snprintf(*(char **)(v5 + 80), v36, v24, (char *)v39 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0));
    v35 = (int)result;
    if (v36 <= (int)result)
    {
      result = *(_QWORD *)(v5 + 72);
      v37 = *(char **)(v5 + 80);
      v38 = *(_QWORD *)(v5 + 88);
      if ((unint64_t)&v37[v35] >= result + v38)
      {
        v38 = (unint64_t)&v37[v35 - result + 0x1FFF] & 0xFFFFFFFFFFFFE000;
        result = xo_realloc(result, v38);
        if (!result)
          return result;
        v37 = (char *)(result + *(_QWORD *)(v5 + 80) - *(_QWORD *)(v5 + 72));
        *(_QWORD *)(v5 + 72) = result;
        *(_QWORD *)(v5 + 80) = v37;
        *(_QWORD *)(v5 + 88) = v38;
      }
      result = snprintf(v37, v38 - (_QWORD)v37 + result, v24, (char *)v39 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0));
      v35 = (int)result;
    }
    if (v35 >= 1)
    {
      if ((*(_BYTE *)(v5 + 2) & 0x20) != 0)
        *(_QWORD *)(v5 + 376) += v35;
      if ((*(_BYTE *)(v5 + 8) & 8) != 0)
        *(_QWORD *)(v5 + 352) += v35;
    }
    goto LABEL_42;
  }
  result = snprintf(0, 0, v24, (char *)v39 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0));
  if ((int)result >= 1)
  {
    v29 = result + 1;
    MEMORY[0x24BDAC7A8](result);
    v31 = (char *)v39 - ((v30 + 16) & 0x1FFFFFFF0);
    bzero(v31, v29);
    v32 = snprintf(v31, v29, v24, v27);
    result = xo_data_append_content(v5, v31, v32, v7);
  }
LABEL_46:
  if (*(_WORD *)(v5 + 16) == 3)
  {
    result = (uint64_t)xo_data_append((_QWORD *)v5, xo_format_title_div_close, 6uLL);
    if ((*(_BYTE *)v5 & 2) != 0)
      return (uint64_t)xo_data_append((_QWORD *)v5, "\n", 1uLL);
  }
  return result;
}

uint64_t *xo_format_units(uint64_t *result, uint64_t *a2, char *a3, uint64_t a4)
{
  uint64_t *v6;
  unsigned __int8 *v7;
  size_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _BYTE *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v6 = result;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v7 = (unsigned __int8 *)a2[4];
  v8 = a2[9];
  v9 = *a2;
  if ((result[1] & 0x10) == 0)
    return (uint64_t *)xo_format_content((uint64_t)result, "units", 0, a3, a4, v7, v8, v9);
  v10 = result + 9;
  v11 = result[9];
  v12 = (_QWORD *)result[10];
  v13 = *((unsigned __int16 *)result + 8);
  if (v13 == 3)
  {
    v27[0] = result[46];
    v17 = v12;
    if ((unint64_t)v12 + 13 >= v11 + result[11])
    {
      v18 = xo_realloc(v11, ((unint64_t)v12 - v11 + 8204) & 0xFFFFFFFFFFFFE000);
      if (!v18)
        goto LABEL_14;
      v17 = (_QWORD *)(v18 + v6[10] - v6[9]);
      v6[9] = v18;
      v6[10] = (uint64_t)v17;
      v6[11] = ((unint64_t)v12 - v11 + 8204) & 0xFFFFFFFFFFFFE000;
    }
    v19 = *(_QWORD *)xo_format_units_units_start_html;
    *(_QWORD *)((char *)v17 + 5) = *(_QWORD *)&xo_format_units_units_start_html[5];
    *v17 = v19;
    v16 = 13;
  }
  else
  {
    if (v13 != 1)
      return result;
    v27[0] = result[46];
    v14 = v12;
    if ((unint64_t)(v12 + 1) >= v11 + result[11])
    {
      v15 = xo_realloc(v11, ((unint64_t)v12 - v11 + 8199) & 0xFFFFFFFFFFFFE000);
      if (!v15)
        goto LABEL_14;
      v14 = (_QWORD *)(v15 + v6[10] - v6[9]);
      v6[9] = v15;
      v6[10] = (uint64_t)v14;
      v6[11] = ((unint64_t)v12 - v11 + 8199) & 0xFFFFFFFFFFFFE000;
    }
    *v14 = xo_format_units_units_start_xml;
    v16 = 8;
  }
  v6[10] += v16;
LABEL_14:
  if (a4)
    xo_buf_escape((uint64_t)v6, v6 + 9, a3, a4, 0);
  else
    xo_do_format_field((uint64_t)v6, 0, v7, v8, v9);
  v20 = (char *)v12 - v11;
  result = (uint64_t *)v6[9];
  v21 = (_BYTE *)v6[10];
  if (v21 + 1 >= (_BYTE *)result + v6[11])
  {
    v22 = (v21 + 1 - (_BYTE *)result + 0x1FFF) & 0xFFFFFFFFFFFFE000;
    result = (uint64_t *)xo_realloc(result, v22);
    v23 = v6[10];
    if (!result)
      goto LABEL_21;
    v21 = (char *)result + v23 - v6[9];
    v6[9] = (uint64_t)result;
    v6[10] = (uint64_t)v21;
    v6[11] = v22;
  }
  *v21 = 34;
  v23 = v6[10] + 1;
  v6[10] = v23;
LABEL_21:
  v24 = *v10;
  v25 = v23 - *v10 - (_QWORD)v20;
  if (v25 <= 0)
  {
    v6[10] = (uint64_t)&v20[v24];
  }
  else
  {
    MEMORY[0x24BDAC7A8](result);
    bzero((char *)v27 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v25);
    memcpy((char *)v27 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), &v20[v24], v25);
    v26 = v27[0];
    memmove((void *)(v24 + v27[0] + v25), (const void *)(v24 + v27[0]), (size_t)&v20[-v27[0]]);
    return (uint64_t *)memmove((void *)(*v10 + v26), (char *)v27 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v25);
  }
  return result;
}

uint64_t xo_find_width(uint64_t a1, uint64_t a2, const void *a3, size_t a4)
{
  char *v5;
  uint64_t v6;
  uint64_t v9;
  char *v10;
  size_t v11;
  uint64_t result;
  BOOL v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  uint64_t v21;
  int *v22;
  unsigned int *v23;
  char *__endptr[2];

  __endptr[1] = *(char **)MEMORY[0x24BDAC8D0];
  v5 = *(char **)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 72);
  __endptr[0] = 0;
  if (!a4)
  {
    if (!v6)
      return 0;
    if (*(_QWORD *)(a1 + 48))
      v13 = 0;
    else
      v13 = v6 == 2;
    if (v13)
    {
      if (!strncmp("%d", v5, 2uLL))
      {
        if ((*(_BYTE *)(a1 + 1) & 2) == 0)
        {
          v22 = *(int **)(a1 + 200);
          *(_QWORD *)(a1 + 200) = v22 + 2;
          return *v22;
        }
        return 0;
      }
      if (!strncmp("%u", v5, 2uLL))
      {
        if ((*(_BYTE *)(a1 + 1) & 2) == 0)
        {
          v23 = *(unsigned int **)(a1 + 200);
          *(_QWORD *)(a1 + 200) = v23 + 2;
          return *v23;
        }
        return 0;
      }
    }
    v14 = *(_QWORD *)(a1 + 72);
    v15 = *(const char **)(a1 + 80);
    v16 = *(_QWORD *)(a1 + 8);
    if ((v16 & 8) != 0)
      *(_QWORD *)(a1 + 8) = v16 & 0xFFFFFFFFFFFFFFF7;
    v17 = &v15[-v14];
    if (xo_do_format_field(a1, (uint64_t *)(a1 + 72), (unsigned __int8 *)v5, v6, 0) < 0)
      goto LABEL_25;
    v18 = *(_QWORD *)(a1 + 72);
    v19 = *(_BYTE **)(a1 + 80);
    if ((unint64_t)(v19 + 1) >= v18 + *(_QWORD *)(a1 + 88))
    {
      v20 = (unint64_t)&v19[-v18 + 0x2000] & 0xFFFFFFFFFFFFE000;
      v21 = xo_realloc(v18, v20);
      if (!v21)
        goto LABEL_21;
      v19 = (_BYTE *)(v21 + *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72));
      *(_QWORD *)(a1 + 72) = v21;
      *(_QWORD *)(a1 + 80) = v19;
      *(_QWORD *)(a1 + 88) = v20;
    }
    *v19 = 0;
    ++*(_QWORD *)(a1 + 80);
LABEL_21:
    result = strtol(v15, __endptr, 0);
    if ((unint64_t)(result - 0x7FFFFFFFFFFFFFFFLL) >= 2 && v15 != __endptr[0] && !*__endptr[0])
    {
LABEL_26:
      *(_QWORD *)(a1 + 80) = &v17[*(_QWORD *)(a1 + 72)];
      if ((v16 & 8) != 0)
        *(_QWORD *)(a1 + 8) |= 8uLL;
      return result;
    }
    xo_failure((_BYTE *)a1, "invalid width for anchor: '%s'");
LABEL_25:
    result = 0;
    goto LABEL_26;
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)__endptr - ((v9 + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v11);
  memcpy(v10, a3, a4);
  v10[a4] = 0;
  result = strtol(v10, __endptr, 0);
  if ((unint64_t)(result - 0x7FFFFFFFFFFFFFFFLL) < 2 || v10 == __endptr[0] || *__endptr[0])
  {
    xo_failure((_BYTE *)a1, "invalid width for anchor: '%s'");
    return 0;
  }
  return result;
}

uint64_t xo_do_open_container(uint64_t a1, uint64_t a2, char *__s)
{
  char *v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  void *v21;
  size_t v22;
  char *v23;
  size_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  size_t v36;
  _QWORD v38[2];

  v3 = __s;
  v38[1] = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)a1 & 2) != 0)
    v6 = "\n";
  else
    v6 = (const char *)&xo_version_extra;
  if (!__s)
  {
    xo_failure((_BYTE *)a1, "NULL passed for container name");
    v3 = "failure";
  }
  strlen(v3);
  xo_xml_leader_len((_BYTE *)a1, v3);
  v13 = *(_QWORD *)a1;
  v14 = *(_QWORD *)a1 | a2;
  v15 = *(unsigned __int16 *)(a1 + 16);
  switch(v15)
  {
    case 5:
      v17 = (int)xo_encoder_handle(a1, 2, (uint64_t)v3, 0, v14);
      break;
    case 2:
      if ((v13 & 0x2000) != 0)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176)) |= 1u;
        v13 &= ~0x2000uLL;
        *(_QWORD *)a1 = v13;
      }
      if ((v13 & 0x10000) == 0 && (*(_BYTE *)(a1 + 8) & 4) == 0)
      {
        xo_emit_top(a1);
        v13 = *(_QWORD *)a1;
      }
      v18 = *(_QWORD *)(a1 + 168);
      v19 = *(_DWORD *)(v18 + 24 * *(int *)(a1 + 176));
      v20 = ",\n";
      if ((v13 & 2) == 0)
        v20 = ", ";
      if ((v19 & 1) != 0)
        LOBYTE(v21) = (_BYTE)v20;
      else
        v21 = &xo_version_extra;
      *(_DWORD *)(v18 + 24 * *(int *)(a1 + 176)) = v19 | 1;
      if ((v13 & 0x100000) != 0)
      {
        v22 = strlen(v3);
        v23 = (char *)v38 - ((MEMORY[0x24BDAC7A8](v22) + 16) & 0xFFFFFFFFFFFFFFF0);
        bzero(v23, v24);
        if (v23 < &v23[v22 + 1])
        {
          v25 = 0;
          do
          {
            v26 = v3[v25];
            if (v26 == 45)
              LOBYTE(v26) = 95;
            v23[v25++] = v26;
          }
          while (&v23[v25 - 1] < &v23[v22]);
        }
      }
      v17 = xo_printf(a1, "%s%*s\"%s\": {%s", v7, v8, v9, v10, v11, v12, (char)v21);
      break;
    case 1:
      if ((v13 & 2) != 0)
        v16 = (*(unsigned __int16 *)(a1 + 20) & (*(unsigned __int8 *)(a1 + 8) << 29 >> 31))
            + *(unsigned __int16 *)(a1 + 20) * *(unsigned __int16 *)(a1 + 18);
      else
        LOBYTE(v16) = 0;
      v27 = xo_printf(a1, "%*s<%s%s", v7, v8, v9, v10, v11, v12, v16);
      v33 = v27;
      v34 = *(_BYTE **)(a1 + 120);
      v35 = *(_BYTE **)(a1 + 128);
      v36 = v35 - v34;
      if (v35 != v34)
      {
        v33 = v36 + v27;
        xo_data_append((_QWORD *)a1, v34, v36);
        *(_QWORD *)(a1 + 128) = *(_QWORD *)(a1 + 120);
      }
      v17 = xo_printf(a1, ">%s", v36, v28, v29, v30, v31, v32, (char)v6) + v33;
      break;
    default:
      v17 = 0;
      break;
  }
  xo_depth_change((_BYTE *)a1, v3, 1, 1, 1u, (v14 >> 7) & 8);
  return v17;
}

uint64_t xo_do_close_leaf_list(uint64_t a1, char *__s1)
{
  char *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const void *v7;
  size_t v8;
  int v9;
  _QWORD *v10;
  int *v11;
  _DWORD *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];

  v2 = __s1;
  v22[1] = *MEMORY[0x24BDAC8D0];
  if (!__s1)
  {
    v4 = *(_QWORD *)(a1 + 168);
    v5 = *(_DWORD *)(a1 + 176);
    v6 = v4 + 24 * v5;
    v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      v8 = strlen(*(const char **)(v6 + 8)) + 1;
      v2 = (char *)v22 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
      bzero(v2, v8);
      memcpy(v2, v7, v8);
    }
    else if ((*(_BYTE *)(v4 + 24 * v5) & 8) != 0)
    {
      v2 = 0;
    }
    else
    {
      xo_failure((_BYTE *)a1, "missing name without 'dtrt' mode");
      v2 = "failure";
    }
  }
  v9 = *(unsigned __int16 *)(a1 + 16);
  if (v9 == 5)
  {
    v20 = xo_encoder_handle(a1, 7, (uint64_t)v2, 0, 0);
LABEL_16:
    xo_depth_change((_BYTE *)a1, v2, -1, 0, 8u, 2);
    v10 = (_QWORD *)(a1 + 168);
    v11 = (int *)(a1 + 176);
    goto LABEL_17;
  }
  if (v9 != 2)
  {
    v20 = 0;
    goto LABEL_16;
  }
  v10 = (_QWORD *)(a1 + 168);
  v11 = (int *)(a1 + 176);
  v12 = (_DWORD *)(*(_QWORD *)(a1 + 168) + 24 * *(int *)(a1 + 176));
  v13 = (const char *)&xo_version_extra;
  if ((*v12 & 1) != 0)
  {
    if ((*(_BYTE *)a1 & 2) != 0)
      v13 = "\n";
    else
      v13 = (const char *)&xo_version_extra;
  }
  *v12 |= 1u;
  xo_depth_change((_BYTE *)a1, v2, -1, -1, 8u, 2);
  xo_indent(a1);
  v20 = xo_printf(a1, "%s%*s]", v14, v15, v16, v17, v18, v19, (char)v13);
LABEL_17:
  *(_DWORD *)(*v10 + 24 * *v11) |= 1u;
  return v20;
}

uint64_t xo_do_close_container(uint64_t a1, char *__s)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const void *v7;
  size_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v3 = a1;
  v25[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v3 = xo_default_handle();
  }
  if (!__s)
  {
    v4 = *(_QWORD *)(v3 + 168);
    v5 = *(_DWORD *)(v3 + 176);
    v6 = v4 + 24 * v5;
    v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      v8 = strlen(*(const char **)(v6 + 8)) + 1;
      __s = (char *)v25 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
      bzero(__s, v8);
      memcpy(__s, v7, v8);
    }
    else if ((*(_BYTE *)(v4 + 24 * v5) & 8) != 0)
    {
      __s = 0;
    }
    else
    {
      xo_failure((_BYTE *)v3, "missing name without 'dtrt' mode");
      __s = "failure";
    }
  }
  strlen(__s);
  xo_xml_leader_len((_BYTE *)v3, __s);
  result = 0;
  switch(*(_WORD *)(v3 + 16))
  {
    case 0:
    case 3:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 2u, 0);
      result = 0;
      break;
    case 1:
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 2u, 0);
      LOBYTE(v16) = 0;
      if ((*(_BYTE *)v3 & 2) != 0)
        v16 = (*(unsigned __int16 *)(v3 + 20) & (*(unsigned __int8 *)(v3 + 8) << 29 >> 31))
            + *(unsigned __int16 *)(v3 + 20) * *(unsigned __int16 *)(v3 + 18);
      result = xo_printf(v3, "%*s</%s%s>%s", v10, v11, v12, v13, v14, v15, v16);
      break;
    case 2:
      v17 = *(_QWORD *)v3;
      if ((*(_QWORD *)v3 & 0x2000) != 0)
      {
        *(_DWORD *)(*(_QWORD *)(v3 + 168) + 24 * *(int *)(v3 + 176)) |= 1u;
        v17 &= ~0x2000uLL;
        *(_QWORD *)v3 = v17;
      }
      if ((v17 & 2) != 0)
        v18 = "\n";
      else
        v18 = (const char *)&xo_version_extra;
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 2u, 0);
      result = xo_printf(v3, "%s%*s}%s", v19, v20, v21, v22, v23, v24, (char)v18);
      *(_DWORD *)(*(_QWORD *)(v3 + 168) + 24 * *(int *)(v3 + 176)) |= 1u;
      break;
    case 5:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 2u, 0);
      result = xo_encoder_handle(v3, 3, (uint64_t)__s, 0, 0);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t xo_do_open_leaf_list(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  int *v17;
  int v18;
  const char *v19;

  v8 = (char *)a3;
  v10 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited())
      xo_default_init();
    v10 = xo_default_handle();
  }
  v11 = *(_QWORD *)v10;
  v12 = *(unsigned __int16 *)(v10 + 16);
  if (v12 == 5)
  {
    v14 = xo_encoder_handle(v10, 6, (uint64_t)v8, 0, a2);
LABEL_13:
    v15 = 0;
    goto LABEL_25;
  }
  if (v12 != 2)
  {
    v14 = 0;
    goto LABEL_13;
  }
  if ((v11 & 0x10000) == 0 && (*(_BYTE *)(v10 + 8) & 4) == 0)
  {
    if ((v11 & 2) != 0)
      v13 = *(_WORD *)(v10 + 20) * *(_WORD *)(v10 + 18);
    else
      LOBYTE(v13) = 0;
    xo_printf(v10, "%*s{%s", a3, a4, a5, a6, a7, a8, v13);
    *(_QWORD *)(v10 + 8) |= 4uLL;
  }
  if (!v8)
  {
    xo_failure((_BYTE *)v10, "NULL passed for list name");
    v8 = "failure";
  }
  v16 = *(_QWORD *)v10;
  v17 = (int *)(*(_QWORD *)(v10 + 168) + 24 * *(int *)(v10 + 176));
  v18 = *v17;
  if ((*(_QWORD *)v10 & 0x2000) != 0)
  {
    v18 |= 1u;
    *v17 = v18;
    v16 &= ~0x2000uLL;
    *(_QWORD *)v10 = v16;
  }
  v19 = ",\n";
  if ((v16 & 2) == 0)
    v19 = ", ";
  if ((v18 & 1) == 0)
    v19 = (const char *)&xo_version_extra;
  *v17 = v18 | 1;
  v14 = xo_printf(v10, "%s%*s\"%s\": [%s", a3, a4, a5, a6, a7, a8, (char)v19);
  v15 = 1;
LABEL_25:
  xo_depth_change((_BYTE *)v10, v8, 1, v15, 7u, (a2 >> 7) & 8 | 2);
  return v14;
}

uint64_t xo_emit_top(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = xo_indent(a1);
  result = xo_printf(a1, "%*s{%s", v3, v4, v5, v6, v7, v8, v2);
  *(_QWORD *)(a1 + 8) |= 4uLL;
  if (*(_QWORD *)(a1 + 432))
  {
    v10 = xo_indent(a1);
    xo_printf(a1, "%*s\"__version\": \"%s\", %s", v11, v12, v13, v14, v15, v16, v10);
    result = xo_free(*(_QWORD *)(a1 + 432));
    *(_QWORD *)(a1 + 432) = 0;
  }
  return result;
}

const char *xo_xml_leader_len(_BYTE *a1, char *a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return (const char *)&xo_version_extra;
  v3 = *a2;
  if ((v3 & 0x80000000) != 0)
    v4 = __maskrune(*a2, 0x100uLL);
  else
    v4 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v3 + 60) & 0x100;
  if (v3 == 95 || v4 != 0)
    return (const char *)&xo_version_extra;
  xo_failure(a1, "invalid XML tag name: '%.*s'");
  return "_";
}

BOOL xo_format_is_numeric(_BYTE *a1, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BOOL8 result;

  if (a2 < 1)
    return 0;
  v2 = a1 + 1;
  if (*a1 != 37)
    return 0;
  v3 = &a1[a2];
  v4 = 0;
  v5 = a2 - 1;
  if (a2 != 1)
  {
    do
    {
      if (!v2[v4])
        break;
      if (!memchr("0123456789.*+ -", (char)v2[v4], 0x10uLL))
        break;
      ++v4;
    }
    while (&v2[v4] < v3);
  }
  v6 = v5 <= v4;
  v7 = v5 - v4;
  if (v6)
    return 0;
  v8 = &v2[v4];
  if (v7 < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      if (!v8[v9])
        break;
      if (!memchr("hljtqz", (char)v8[v9], 7uLL))
        break;
      ++v9;
    }
    while (&v8[v9] < v3);
  }
  result = 0;
  if (v7 > v9 && v7 - v9 == 1)
    return memchr("diouDOUeEfFgG", (char)v8[v9], 0xEuLL) != 0;
  return result;
}

_QWORD *xo_encoder_path_add(const char *a1)
{
  _QWORD *result;
  size_t v3;
  _QWORD *v4;
  char *v5;
  _QWORD *v6;

  result = (_QWORD *)xo_encoder_setup();
  if (a1)
  {
    if (!qword_257A4FF30)
    {
      xo_encoder_path = 0;
      qword_257A4FF30 = (uint64_t)&xo_encoder_path;
    }
    v3 = strlen(a1);
    result = (_QWORD *)xo_realloc(0, v3 + 17);
    if (result)
    {
      v4 = result;
      v5 = (char *)(result + 2);
      result = memcpy(result + 2, a1, v3);
      v5[v3] = 0;
      v6 = (_QWORD *)qword_257A4FF30;
      *v4 = 0;
      v4[1] = v6;
      *v6 = v4;
      qword_257A4FF30 = (uint64_t)v4;
    }
  }
  return result;
}

_QWORD *xo_encoder_setup()
{
  _QWORD *result;

  if ((xo_encoder_setup_initted & 1) == 0)
  {
    xo_encoder_setup_initted = 1;
    if (!qword_257A4FF30)
    {
      xo_encoder_path = 0;
      qword_257A4FF30 = (uint64_t)&xo_encoder_path;
    }
    if (!qword_257A4FF40)
    {
      xo_encoders = 0;
      qword_257A4FF40 = (uint64_t)&xo_encoders;
    }
    return xo_encoder_path_add((const char *)&unk_24BC34C92);
  }
  return result;
}

_QWORD *xo_encoders_clean()
{
  _QWORD *result;
  uint64_t *i;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  result = xo_encoder_setup();
  for (i = (uint64_t *)xo_encoders; xo_encoders; i = (uint64_t *)xo_encoders)
  {
    v2 = *i;
    v3 = (_QWORD *)i[1];
    if (*i)
    {
      *(_QWORD *)(v2 + 8) = v3;
      v3 = (_QWORD *)i[1];
    }
    else
    {
      qword_257A4FF40 = i[1];
    }
    *v3 = v2;
    v4 = (void *)i[4];
    if (v4)
      dlclose(v4);
    result = (_QWORD *)xo_free(i);
  }
  if (qword_257A4FF30)
  {
    while (1)
    {
      result = (_QWORD *)xo_encoder_path;
      if (!xo_encoder_path)
        break;
      v5 = *(_QWORD *)xo_encoder_path;
      v6 = *(_QWORD **)(xo_encoder_path + 8);
      if (*(_QWORD *)xo_encoder_path)
      {
        *(_QWORD *)(v5 + 8) = v6;
        v6 = (_QWORD *)result[1];
      }
      else
      {
        qword_257A4FF30 = *(_QWORD *)(xo_encoder_path + 8);
      }
      *v6 = v5;
      xo_free(result);
    }
  }
  else
  {
    xo_encoder_path = 0;
    qword_257A4FF30 = (uint64_t)&xo_encoder_path;
  }
  return result;
}

uint64_t *xo_encoder_register(char *a1, uint64_t a2)
{
  uint64_t *result;

  xo_encoder_setup();
  result = xo_encoder_find(a1);
  if (!result)
  {
    result = xo_encoder_list_add(a1);
    if (result)
      result[3] = a2;
  }
  return result;
}

uint64_t *xo_encoder_find(char *__s2)
{
  uint64_t *v2;

  if (!qword_257A4FF40)
  {
    xo_encoders = 0;
    qword_257A4FF40 = (uint64_t)&xo_encoders;
  }
  v2 = &xo_encoders;
  do
    v2 = (uint64_t *)*v2;
  while (v2 && strcmp((const char *)v2[2], __s2));
  return v2;
}

_QWORD *xo_encoder_list_add(const char *a1)
{
  _QWORD *v2;
  size_t v3;
  void *v4;
  _QWORD *v5;

  if (!a1)
    return 0;
  v2 = (_QWORD *)xo_realloc(0, 40);
  if (v2)
  {
    v3 = strlen(a1) + 1;
    v4 = (void *)xo_realloc(0, v3);
    v2[2] = v4;
    if (v4)
    {
      memcpy(v4, a1, v3);
      v5 = (_QWORD *)qword_257A4FF40;
      *v2 = 0;
      v2[1] = v5;
      *v5 = v2;
      qword_257A4FF40 = (uint64_t)v2;
      return v2;
    }
    xo_free(v2);
    return 0;
  }
  return v2;
}

uint64_t *xo_encoder_unregister(char *a1)
{
  uint64_t *result;
  uint64_t v3;
  uint64_t *v4;

  xo_encoder_setup();
  result = xo_encoder_find(a1);
  if (result)
  {
    v3 = *result;
    v4 = (uint64_t *)result[1];
    if (*result)
    {
      *(_QWORD *)(v3 + 8) = v4;
      v4 = (uint64_t *)result[1];
    }
    else
    {
      qword_257A4FF40 = result[1];
    }
    *v4 = v3;
    return (uint64_t *)xo_free(result);
  }
  return result;
}

uint64_t xo_encoder_init(_BYTE *a1, char *a2)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  int v8;
  size_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int (*v20)(uint64_t *);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24[1024];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  xo_encoder_setup();
  v4 = strchr(a2, 58);
  v5 = strchr(a2, 43);
  v6 = v5;
  if (v4)
  {
    if (v5 >= v4)
      v7 = v4;
    else
      v7 = v5;
    if (v5)
      v6 = v7;
    else
      v6 = v4;
  }
  else if (!v5)
  {
    v8 = 0;
    goto LABEL_10;
  }
  v8 = *v6;
  v9 = strlen(a2);
  v10 = (char *)&v21 - ((MEMORY[0x24BDAC7A8](v9) + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v11);
  memcpy(v10, a2, v9);
  v10[v9] = 0;
  v12 = &v10[v6 - a2];
  *v12 = 0;
  v6 = v12 + 1;
  a2 = v10;
LABEL_10:
  if (strchr(a2, 47) || strchr(a2, 58))
  {
    v13 = "invalid encoder name: %s";
LABEL_13:
    xo_failure(a1, v13);
    return 0xFFFFFFFFLL;
  }
  v15 = xo_encoder_find(a2);
  if (!v15)
  {
    if (qword_257A4FF30)
    {
      v17 = xo_encoder_path;
      if (xo_encoder_path)
      {
        while (1)
        {
          if (snprintf(v24, 0x400uLL, "%s/%s.enc", (const char *)(v17 + 16), a2) <= 0x400)
          {
            v18 = dlopen(v24, 2);
            if (v18)
              break;
          }
          v17 = *(_QWORD *)v17;
          if (!v17)
            goto LABEL_36;
        }
        v19 = v18;
        v20 = (unsigned int (*)(uint64_t *))dlsym(v18, "xo_encoder_library_init");
        if (v20)
        {
          v22 = 1;
          v23 = 0;
          if (!v20(&v22))
          {
            if (v23)
            {
              v15 = xo_encoder_list_add(a2);
              if (v15)
              {
                v15[3] = v23;
                v15[4] = (uint64_t)v19;
                goto LABEL_17;
              }
            }
          }
        }
        dlclose(v19);
      }
    }
    else
    {
      xo_encoder_path = 0;
      qword_257A4FF30 = (uint64_t)&xo_encoder_path;
    }
LABEL_36:
    v13 = "encoder not founde: %s";
    goto LABEL_13;
  }
LABEL_17:
  xo_set_encoder((uint64_t)a1, v15[3]);
  result = xo_encoder_handle((uint64_t)a1, 1, (uint64_t)a2, 0, 0);
  if (!(_DWORD)result && v6)
  {
    if (v8 == 43)
      v16 = 18;
    else
      v16 = 17;
    return xo_encoder_handle((uint64_t)a1, v16, (uint64_t)a2, (uint64_t)v6, 0);
  }
  return result;
}

uint64_t xo_encoder_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t (*encoder)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v10 = xo_get_private(a1);
  encoder = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))xo_get_encoder(a1);
  if (encoder)
    return encoder(a1, a2, a3, a4, v10, a5);
  else
    return 0xFFFFFFFFLL;
}

uint64_t xo_encoder_create(char *a1, uint64_t a2)
{
  _BYTE *v3;
  uint64_t v4;

  v3 = (_BYTE *)xo_create(5, a2);
  v4 = (uint64_t)v3;
  if (v3 && xo_encoder_init(v3, a1))
  {
    xo_destroy(v4);
    return 0;
  }
  return v4;
}

const char *xo_encoder_op_name(unsigned int a1)
{
  if (a1 <= 0x12)
    return (&xo_encoder_op_name_names)[a1];
  else
    return "unknown";
}

uint64_t xo_set_syslog_enterprise_id(int a1)
{
  return snprintf(&xo_syslog_enterprise_id, 0xCuLL, "%u", a1);
}

uint64_t xo_open_log(uint64_t a1, int a2, int a3)
{
  pthread_mutex_lock(&xo_syslog_mutex);
  xo_open_log_unlocked(a1, a2, a3);
  return pthread_mutex_unlock(&xo_syslog_mutex);
}

uint64_t xo_open_log_unlocked(uint64_t result, int a2, int a3)
{
  if (result)
    xo_logtag = result;
  xo_logstat = a2;
  if (a3 && (a3 & 0xFFFFFC07) == 0)
    xo_logfacility = a3;
  if ((a2 & 8) != 0)
    result = xo_connect_log();
  xo_opened = 1;
  return result;
}

uint64_t xo_close_log()
{
  pthread_mutex_lock(&xo_syslog_mutex);
  if (xo_logfile != -1)
  {
    close(xo_logfile);
    xo_logfile = -1;
  }
  xo_logtag = 0;
  xo_status = 0;
  return pthread_mutex_unlock(&xo_syslog_mutex);
}

uint64_t xo_set_logmask(int a1)
{
  uint64_t v2;

  pthread_mutex_lock(&xo_syslog_mutex);
  v2 = xo_logmask;
  if (a1)
    xo_logmask = a1;
  pthread_mutex_unlock(&xo_syslog_mutex);
  return v2;
}

void *xo_set_syslog_handler(void *result, void *a2, void *a3)
{
  xo_syslog_open = result;
  xo_syslog_send = a2;
  xo_syslog_close = a3;
  return result;
}

uint64_t xo_set_unit_test_mode(uint64_t result)
{
  xo_unit_test = result;
  return result;
}

uint64_t xo_vsyslog(uint64_t a1, const char *a2, char *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  pid_t v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  int v18;
  tm *v19;
  char v20;
  char *v21;
  char *v22;
  char *v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  size_t v30;
  char *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  const char *v41;
  uint64_t v42;
  size_t v43;
  int v44;
  char *v45;
  int v46;
  BOOL v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  const char *v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  char v61[2032];
  uint64_t v62;
  uint64_t v63;
  unsigned __int128 v64;
  tm v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  _WORD v70[2];
  char v71[72];
  _BYTE v72[2048];
  iovec v73;
  const char *v74;
  size_t v75;
  _WORD *v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v69 = a4;
  v12 = *__error();
  if (!xo_vsyslog_my_pid)
  {
    if (xo_unit_test)
      v13 = 222;
    else
      v13 = getpid();
    xo_vsyslog_my_pid = v13;
  }
  if (a1 >= 0x400)
  {
    xo_syslog(35, (uint64_t)"syslog-unknown-priority", (uint64_t)"syslog: unknown facility/priority: %#x", v7, v8, v9, v10, v11, a1);
    LODWORD(a1) = a1 & 0x3FF;
  }
  pthread_mutex_lock(&xo_syslog_mutex);
  if (((xo_logmask >> (a1 & 7)) & 1) == 0)
    return pthread_mutex_unlock(&xo_syslog_mutex);
  if (a1 >= 8)
    v14 = 0;
  else
    v14 = xo_logfacility;
  v66 = v72;
  v67 = v72;
  v68 = 2048;
  v15 = xo_create(4, 0);
  if (v15)
  {
    v16 = (_QWORD *)v15;
    if (!xo_logtag)
      xo_logtag = (uint64_t)getprogname();
    xo_set_writer(v16, (uint64_t)&v66, (uint64_t)xo_syslog_handle_write, (uint64_t)xo_syslog_handle_close, (uint64_t)xo_syslog_handle_flush);
    memset(&v65, 0, sizeof(v65));
    v64 = 0uLL;
    if (xo_unit_test)
    {
      *(_QWORD *)&v64 = 1435085229;
      DWORD2(v64) = 123456;
    }
    else
    {
      gettimeofday((timeval *)&v64, 0);
    }
    v18 = v14 | a1;
    v19 = localtime_r((const time_t *)&v64, &v65);
    v20 = xo_logstat;
    if ((xo_logstat & 0x20) == 0)
    {
      v21 = 0;
      v22 = a3;
      goto LABEL_26;
    }
    MEMORY[0x24BDAC7A8](v19);
    v21 = v61;
    bzero(v61, 0x800uLL);
    if (xo_logtag)
    {
      v23 = &v61[xo_snprintf(v61, 2048, "%s", (const char *)xo_logtag)];
      if ((xo_logstat & 1) == 0)
        goto LABEL_24;
    }
    else
    {
      v23 = v61;
      if ((v20 & 1) == 0)
      {
LABEL_24:
        v22 = a3;
        if (xo_logtag)
          xo_snprintf(v23, (char *)&v62 - v23, ": ");
LABEL_26:
        v24 = v12;
        v26 = (int)v66;
        v25 = (int)v67;
        v27 = xo_snprintf(v67, (int)v68 - (int)v67 + (int)v66, "<%d>1 ", v18);
        v67 += v27;
        v28 = strftime(v67, (int)v68 - (int)v67 + (int)v66, "%FT%T", &v65);
        v67 += v28;
        v29 = xo_snprintf(v67, (int)v68 - (int)v67 + (int)v66, ".%03.3u", SDWORD2(v64) / 1000);
        v67 += v29;
        v30 = strftime(v67, (int)v68 - (int)v67 + (int)v66, "%z ", &v65);
        v31 = &v67[v30];
        v67 = v31;
        v71[0] = 0;
        if (xo_unit_test)
        {
          strcpy(v71, "worker-host");
          v32 = 119;
        }
        else
        {
          gethostname(v71, 0x48uLL);
          v31 = v67;
          v32 = v71[0];
        }
        v47 = v32 == 0;
        v33 = v71;
        if (v47)
          v33 = "-";
        v34 = xo_snprintf(v31, (int)v68 - (int)v31 + (int)v66, "%s ", v33);
        v35 = &v67[v34];
        v67 = v35;
        v36 = (const char *)xo_logtag;
        if (!xo_logtag)
          v36 = "-";
        v37 = xo_snprintf(v35, (int)v68 - (int)v35 + (int)v66, "%s ", v36);
        v67 += v37;
        v38 = xo_snprintf(v67, (int)v68 - (int)v67 + (int)v66, "%d ", xo_vsyslog_my_pid);
        v39 = &v67[v38];
        v67 = v39;
        if (a2)
        {
          if (*a2 != 64)
          {
            v40 = &xo_syslog_enterprise_id;
            if (xo_syslog_enterprise_id)
            {
              v41 = "@";
            }
            else
            {
              v73.iov_base = 0;
              v42 = sysctlbyname("kern.syslog.enterprise_id", 0, (size_t *)&v73, 0, 0);
              if (!(_DWORD)v42 && v73.iov_base)
              {
                MEMORY[0x24BDAC7A8](v42);
                v44 = v26;
                v45 = &v61[-((v43 + 15) & 0xFFFFFFFFFFFFFFF0)];
                bzero(v45, v43);
                v46 = sysctlbyname("kern.syslog.enterprise_id", v45, (size_t *)&v73, 0, 0);
                if (v73.iov_base)
                  v47 = v46 == 0;
                else
                  v47 = 0;
                if (v47)
                  v40 = v45;
                v26 = v44;
              }
              if (!*v40)
              {
                v40 = &xo_syslog_enterprise_id;
                snprintf(&xo_syslog_enterprise_id, 0xCuLL, "%u", 32473);
              }
              v41 = "@";
              v39 = v67;
            }
            goto LABEL_53;
          }
          ++a2;
          v40 = (char *)&unk_24BC34C92;
        }
        else
        {
          v40 = (char *)&unk_24BC34C92;
          a2 = "-";
        }
        v41 = (const char *)&unk_24BC34C92;
LABEL_53:
        v48 = xo_snprintf(v39, (int)v68 - (int)v39 + (int)v66, "%s [%s%s%s ", a2, a2, v41, v40);
        v67 += v48;
        v63 = v69;
        *__error() = v24;
        xo_emit_hv((unint64_t)v16, v22, v63);
        xo_flush_h((uint64_t)v16);
        v49 = v67;
        v50 = v67 - 1;
        if (*(v67 - 1) == 32)
        {
          --v67;
          v49 = v50;
        }
        v51 = xo_snprintf(v49, (int)v68 - (int)v49 + (int)v66, "] ");
        v67 += v51;
        v52 = xo_snprintf(v67, (int)v68 - (int)v67 + (int)v66, "%c%c%c", 239, 187, 191);
        v67 += v52;
        if ((xo_logstat & 0x20) != 0)
          v53 = ((_DWORD)v67 - (_DWORD)v66);
        else
          v53 = 0;
        xo_set_style((uint64_t)v16, 0);
        xo_set_flags(v16, 0x20000000);
        *__error() = v24;
        xo_emit_hv((unint64_t)v16, v22, v63);
        xo_flush_h((uint64_t)v16);
        v54 = v67 - 1;
        if (*(v67 - 1) == 10)
        {
          --v67;
          *v54 = 0;
        }
        if ((xo_get_flags((uint64_t)v16) & 4) != 0)
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "xo: syslog: %s\n", &v66[v25 - v26]);
        v55 = v66;
        v56 = &v66[v53];
        if (xo_syslog_send)
        {
          xo_syslog_send(v66, v21, &v66[v53]);
        }
        else
        {
          v57 = strlen(v66);
          if (v21)
          {
            v70[0] = 10;
            v73.iov_base = v21;
            v73.iov_len = strlen(v21);
            v74 = v56;
            v75 = strlen(v56);
            v76 = v70;
            v77 = 1;
            writev(2, &v73, 3);
          }
          if ((xo_opened & 1) == 0)
          {
            xo_logstat |= 8u;
            xo_connect_log();
            xo_opened = 1;
          }
          xo_connect_log();
          v58 = v57;
          if (send(xo_logfile, v55, v57, 0) < 0)
          {
            if (*__error() == 55)
              goto LABEL_77;
            if (xo_syslog_close)
            {
              xo_syslog_close();
            }
            else
            {
              if (xo_logfile != -1)
              {
                close(xo_logfile);
                xo_logfile = -1;
              }
              xo_status = 0;
            }
            xo_connect_log();
            while (send(xo_logfile, v55, v57, 0) < 0)
            {
LABEL_77:
              if (*__error() != 55)
              {
                if ((xo_logstat & 2) != 0)
                {
                  v59 = open("/dev/console", 16777221, 0);
                  if ((v59 & 0x80000000) == 0)
                  {
                    v60 = v59;
                    strcpy((char *)v70, "\r\n");
                    v73.iov_base = strchr(v55, 62) + 1;
                    v73.iov_len = &v55[v58] - (char *)v73.iov_base;
                    v74 = (const char *)v70;
                    v75 = 2;
                    writev(v60, &v73, 2);
                    close(v60);
                  }
                }
                break;
              }
              usleep(1u);
            }
          }
        }
        xo_destroy((uint64_t)v16);
        return pthread_mutex_unlock(&xo_syslog_mutex);
      }
    }
    v23 += xo_snprintf(v23, (char *)&v62 - v23, "[%d]", xo_vsyslog_my_pid);
    goto LABEL_24;
  }
  return pthread_mutex_unlock(&xo_syslog_mutex);
}

uint64_t xo_syslog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_vsyslog(a1, a2, a3, &a9);
}

uint64_t xo_syslog_handle_write(uint64_t a1, char *__s)
{
  int v4;
  int v5;
  int v6;
  _BYTE *v7;

  v4 = strlen(__s);
  v5 = *(_DWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8) + *(_DWORD *)a1;
  if (v5 <= v4)
    v6 = v5 - 1;
  else
    v6 = v4;
  memcpy(*(void **)(a1 + 8), __s, v6);
  v7 = (_BYTE *)(*(_QWORD *)(a1 + 8) + v6);
  *(_QWORD *)(a1 + 8) = v7;
  *v7 = 0;
  return v6;
}

uint64_t xo_syslog_handle_flush()
{
  return 0;
}

uint64_t xo_snprintf(char *__str, int64_t __size, const char *a3, ...)
{
  uint64_t result;
  va_list va;

  va_start(va, a3);
  result = 0;
  if (__str && __size)
  {
    LODWORD(result) = vsnprintf(__str, __size, a3, va);
    if ((result & 0x80000000) != 0)
    {
      result = 0;
      *__str = 0;
    }
    else if (result >= __size)
    {
      return __size;
    }
    else
    {
      return result;
    }
  }
  return result;
}

uint64_t xo_connect_log()
{
  uint64_t result;
  _WORD v1[49];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (xo_syslog_open)
    return xo_syslog_open();
  result = xo_logfile;
  if (xo_logfile != -1 || (result = socket(1, 2, 0), xo_logfile = result, (_DWORD)result != -1))
  {
    if ((xo_status & 1) == 0)
    {
      strcpy((char *)&v1[1], "/var/run/syslog");
      memset(&v1[9], 0, 80);
      v1[0] = 362;
      v2 = 0;
      result = connect(result, (const sockaddr *)v1, 0x6Au);
      if ((_DWORD)result == -1)
      {
        if ((xo_status & 1) == 0)
        {
          result = close(xo_logfile);
          xo_logfile = -1;
        }
      }
      else
      {
        xo_status = 1;
      }
    }
  }
  return result;
}

void xo_format_humanize_cold_1()
{
  __assert_rtn("xo_humanize_number", "xo_humanize.h", 79, "buf != NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __divti3()
{
  return MEMORY[0x24BDAC7C8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x24BDAE650](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x24BDAEA90]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x24BDAEE50](a1, a2, a3, a4);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x24BDAFD40](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
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

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFFC0](__s, __charset);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

size_t wcrtomb(char *a1, __int32 a2, mbstate_t *a3)
{
  return MEMORY[0x24BDB0498](a1, *(_QWORD *)&a2, a3);
}

