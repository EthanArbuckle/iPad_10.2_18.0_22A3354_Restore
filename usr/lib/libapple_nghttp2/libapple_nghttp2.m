uint64_t nghttp2_check_header_value(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2)
    return 1;
  while (VALID_HD_VALUE_CHARS[*a1])
  {
    ++a1;
    if (!--a2)
      return 1;
  }
  return 0;
}

uint64_t nghttp2_check_header_name(_BYTE *a1, uint64_t a2)
{
  if (a2)
  {
    if (*a1 != 58)
      goto LABEL_6;
    if (--a2)
    {
      ++a1;
LABEL_6:
      while (VALID_HD_NAME_CHARS[*a1])
      {
        ++a1;
        if (!--a2)
          return 1;
      }
    }
  }
  return 0;
}

uint64_t nghttp2_session_get_local_window_size(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 2844) - *(_DWORD *)(a1 + 2832));
}

uint64_t nghttp2_session_get_remote_window_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2828);
}

uint64_t nghttp2_session_get_next_stream_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2800);
}

BOOL nghttp2_session_want_read(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 2933) & 2) != 0)
    return 0;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a1 + 2736) + *(_QWORD *)(a1 + 2728))
    return (*(_BYTE *)(a1 + 2933) & 0xC) == 0;
  return 1;
}

uint64_t nghttp2_submit_settings(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  return nghttp2_session_add_settings(a1, 0, a3, a4);
}

BOOL nghttp2_session_want_write(uint64_t a1)
{
  uint64_t v1;

  if ((*(_BYTE *)(a1 + 2933) & 2) != 0)
    return 0;
  if (*(_QWORD *)(a1 + 648) || *(_QWORD *)(a1 + 256) || *(_QWORD *)(a1 + 280))
    return 1;
  v1 = *(_QWORD *)(a1 + 56);
  if (!v1)
  {
    while (!*(_QWORD *)(a1 + 344 + v1))
    {
      v1 += 40;
      if (v1 == 320)
        return *(_QWORD *)(a1 + 304) && *(_QWORD *)(a1 + 2696) < (unint64_t)*(unsigned int *)(a1 + 2860);
    }
  }
  if (*(int *)(a1 + 2828) > 0)
    return 1;
  return *(_QWORD *)(a1 + 304) && *(_QWORD *)(a1 + 2696) < (unint64_t)*(unsigned int *)(a1 + 2860);
}

uint64_t nghttp2_session_client_new2(uint64_t *a1, _OWORD *a2, uint64_t a3, __int128 *a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  result = session_new(&v7, a2, a3, 0, a4, 0);
  if (!(_DWORD)result)
  {
    v6 = v7;
    *(_DWORD *)(v7 + 2800) = 1;
    *a1 = v6;
  }
  return result;
}

uint64_t nghttp2_session_add_ping(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a2 & 1) != 0 && *(_QWORD *)(a1 + 2752) >= *(_QWORD *)(a1 + 2760))
    return 4294966392;
  v6 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v6)
    return 4294966395;
  v7 = v6;
  *(_OWORD *)(v6 + 137) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 128) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_QWORD *)v6 = 8;
  *(_BYTE *)(v6 + 12) = 6;
  *(_BYTE *)(v6 + 13) = a2;
  *(_DWORD *)(v6 + 8) = 0;
  *(_BYTE *)(v6 + 14) = 0;
  if (a3)
    v8 = *a3;
  else
    v8 = 0;
  *(_QWORD *)(v6 + 16) = v8;
  v10 = nghttp2_session_add_item(a1, v6);
  if ((_DWORD)v10)
  {
    v9 = v10;
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v7, *(_QWORD *)(a1 + 2568));
  }
  else
  {
    v9 = 0;
    if ((a2 & 1) != 0)
      ++*(_QWORD *)(a1 + 2752);
  }
  return v9;
}

uint64_t nghttp2_session_add_window_update(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v6)
    return 4294966395;
  v7 = v6;
  *(_OWORD *)(v6 + 137) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 128) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_QWORD *)v6 = 4;
  *(_WORD *)(v6 + 12) = 8;
  *(_DWORD *)(v6 + 8) = a2;
  *(_BYTE *)(v6 + 14) = 0;
  *(_DWORD *)(v6 + 16) = a3;
  *(_BYTE *)(v6 + 20) = 0;
  v8 = nghttp2_session_add_item(a1, v6);
  if ((_DWORD)v8)
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v7, *(_QWORD *)(a1 + 2568));
  return v8;
}

uint64_t nghttp2_submit_data(uint64_t a1, char a2, int a3, __int128 *a4)
{
  uint64_t v5;
  __int128 v6;

  if (!a4)
    __assert_rtn("nghttp2_submit_data", "nghttp2_submit.c", 900, "data_prd");
  v5 = 1;
  v6 = *a4;
  return nghttp2_submit_data_shared(a1, a2, a3, (__int128 *)&v5);
}

uint64_t nghttp2_session_add_settings(uint64_t a1, char a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v4;
  int v8;
  _DWORD *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  int *v24;
  uint64_t v25;
  int v26;
  int *v27;
  uint64_t v28;
  int v29;
  int *v30;
  int v31;
  char v32;

  v4 = a4;
  v8 = *(unsigned __int8 *)(a1 + 2930);
  if ((a2 & 1) != 0)
  {
    if (!a4)
    {
      if (*(_QWORD *)(a1 + 2752) >= *(_QWORD *)(a1 + 2760))
        return 4294966392;
      goto LABEL_14;
    }
    return 4294966795;
  }
  if (!nghttp2_iv_check((uint64_t)a3, a4))
    return 4294966795;
  if (!v4)
  {
LABEL_14:
    v11 = 1;
    goto LABEL_15;
  }
  v9 = a3 + 1;
  v10 = v4;
  do
  {
    if (*(v9 - 1) == 9)
    {
      if (v8 == 255)
      {
        v8 = *(unsigned __int8 *)v9;
      }
      else if (*v9 != v8)
      {
        return 4294966795;
      }
    }
    v9 += 2;
    --v10;
  }
  while (v10);
  v11 = 0;
LABEL_15:
  v13 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v13)
    return 4294966395;
  v14 = v13;
  if ((v11 & 1) != 0)
  {
    v15 = 0;
    if ((a2 & 1) == 0)
      goto LABEL_18;
LABEL_24:
    v17 = 0;
    goto LABEL_30;
  }
  if ((unint64_t)(v4 - 1) > 0x1FFFFFFFFFFFFFFELL)
    goto LABEL_58;
  v19 = (void *)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(8 * v4, *(_QWORD *)(a1 + 2568));
  if (!v19)
    goto LABEL_58;
  v15 = v19;
  memcpy(v19, a3, 8 * v4);
  if ((a2 & 1) != 0)
    goto LABEL_24;
LABEL_18:
  v16 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(24, *(_QWORD *)(a1 + 2568));
  if (!v16)
  {
LABEL_57:
    (*(void (**)(void *, _QWORD))(a1 + 2584))(v15, *(_QWORD *)(a1 + 2568));
LABEL_58:
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v14, *(_QWORD *)(a1 + 2568));
    return 4294966395;
  }
  v17 = (_QWORD *)v16;
  if ((v11 & 1) == 0)
  {
    if ((unint64_t)(v4 - 1) <= 0x1FFFFFFFFFFFFFFELL)
    {
      v20 = (void *)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(8 * v4, *(_QWORD *)(a1 + 2568));
      if (v20)
      {
        v18 = v20;
        memcpy(v20, a3, 8 * v4);
        goto LABEL_29;
      }
    }
    v17[1] = 0;
    (*(void (**)(_QWORD *, _QWORD))(a1 + 2584))(v17, *(_QWORD *)(a1 + 2568));
    goto LABEL_57;
  }
  v18 = 0;
LABEL_29:
  v17[1] = v18;
  v17[2] = v4;
  *v17 = 0;
LABEL_30:
  *(_OWORD *)(v14 + 137) = 0u;
  *(_OWORD *)(v14 + 112) = 0u;
  *(_OWORD *)(v14 + 128) = 0u;
  *(_OWORD *)(v14 + 96) = 0u;
  *(_QWORD *)v14 = 6 * v4;
  *(_BYTE *)(v14 + 12) = 4;
  *(_BYTE *)(v14 + 13) = a2;
  *(_DWORD *)(v14 + 8) = 0;
  *(_BYTE *)(v14 + 14) = 0;
  *(_QWORD *)(v14 + 16) = v4;
  *(_QWORD *)(v14 + 24) = v15;
  v21 = nghttp2_session_add_item(a1, v14);
  if ((_DWORD)v21)
  {
    v12 = v21;
    if ((int)v21 >= -900)
      __assert_rtn("nghttp2_session_add_settings", "nghttp2_session.c", 7673, "nghttp2_is_fatal(rv)");
    if (v17)
    {
      (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(v17[1], *(_QWORD *)(a1 + 2568));
      (*(void (**)(_QWORD *, _QWORD))(a1 + 2584))(v17, *(_QWORD *)(a1 + 2568));
    }
    (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(v14 + 24), *(_QWORD *)(a1 + 2568));
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v14, *(_QWORD *)(a1 + 2568));
  }
  else
  {
    if ((a2 & 1) != 0)
    {
      ++*(_QWORD *)(a1 + 2752);
    }
    else
    {
      v22 = (_QWORD *)(a1 + 2648);
      do
      {
        v23 = v22;
        v22 = (_QWORD *)*v22;
      }
      while (v22);
      *v23 = v17;
    }
    v24 = &a3[2 * v4 - 2];
    v25 = v4;
    while (v25)
    {
      --v25;
      v26 = *v24;
      v24 -= 2;
      if (v26 == 3)
      {
        *(_DWORD *)(a1 + 2920) = a3[2 * v25 + 1];
        break;
      }
    }
    v27 = &a3[2 * v4 - 2];
    v28 = v4;
    while (v28)
    {
      --v28;
      v29 = *v27;
      v27 -= 2;
      if (v29 == 2)
      {
        *(_BYTE *)(a1 + 2928) = a3[2 * v28 + 1];
        break;
      }
    }
    v30 = &a3[2 * v4 - 2];
    while (v4)
    {
      --v4;
      v31 = *v30;
      v30 -= 2;
      if (v31 == 8)
      {
        *(_BYTE *)(a1 + 2929) = a3[2 * v4 + 1];
        break;
      }
    }
    v12 = 0;
    if (v8 == 255)
      v32 = 0;
    else
      v32 = v8;
    *(_BYTE *)(a1 + 2930) = v32;
  }
  return v12;
}

uint64_t submit_headers_shared_nva(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, __int128 *a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  __int16 v28;
  char v29;
  uint64_t v30;

  LODWORD(v11) = a3;
  v29 = 0;
  v28 = 0;
  if (a4)
  {
    v14 = *(_QWORD *)a4;
    v15 = *(_BYTE *)(a4 + 8);
    v28 = *(_WORD *)(a4 + 9);
    v29 = *(_BYTE *)(a4 + 11);
    if ((int)HIDWORD(*(_QWORD *)a4) < 1)
    {
      v16 = 1;
    }
    else
    {
      if (HIDWORD(*(_QWORD *)a4) < 0x101)
        goto LABEL_8;
      v16 = 256;
    }
    HIDWORD(v14) = v16;
  }
  else
  {
    v15 = 0;
    v14 = 0x1000000000;
  }
LABEL_8:
  v27 = v14;
  v30 = 0;
  v17 = nghttp2_nv_array_copy(&v30, a5, a6, a1 + 2568);
  if ((v17 & 0x80000000) != 0)
    return v17;
  v18 = v30;
  v19 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  v20 = v19;
  if (!v19)
  {
    v22 = 4294966395;
LABEL_22:
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v18, *(_QWORD *)(a1 + 2568));
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v20, *(_QWORD *)(a1 + 2568));
    return v22;
  }
  *(_OWORD *)(v19 + 96) = 0u;
  *(_OWORD *)(v19 + 137) = 0u;
  *(_OWORD *)(v19 + 112) = 0u;
  *(_OWORD *)(v19 + 128) = 0u;
  if (a7 && *((_QWORD *)a7 + 2))
  {
    v21 = *a7;
    *(_QWORD *)(v19 + 112) = *((_QWORD *)a7 + 2);
    *(_OWORD *)(v19 + 96) = v21;
  }
  *(_QWORD *)(v19 + 120) = a8;
  if ((_DWORD)v11 == -1)
  {
    v11 = *(unsigned int *)(a1 + 2800);
    v24 = v27;
    if ((v11 & 0x80000000) != 0)
    {
      v22 = 4294966787;
      goto LABEL_22;
    }
    v23 = 0;
    *(_DWORD *)(a1 + 2800) = v11 + 2;
    v22 = v11;
  }
  else
  {
    v22 = 0;
    v23 = 3;
    v24 = v27;
  }
  *(_QWORD *)v19 = 0;
  *(_BYTE *)(v19 + 12) = 1;
  *(_BYTE *)(v19 + 13) = a2 & 0x21 | 4;
  *(_DWORD *)(v19 + 8) = v11;
  *(_BYTE *)(v19 + 14) = 0;
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)(v19 + 40) = v18;
  *(_QWORD *)(v19 + 48) = a6;
  *(_DWORD *)(v19 + 56) = v23;
  *(_QWORD *)(v19 + 24) = v24;
  *(_BYTE *)(v19 + 32) = v15;
  *(_WORD *)(v19 + 33) = v28;
  *(_BYTE *)(v19 + 35) = v29;
  v25 = nghttp2_session_add_item(a1, v19);
  if ((_DWORD)v25)
  {
    v18 = *(_QWORD *)(v20 + 40);
    v22 = v25;
    goto LABEL_22;
  }
  return v22;
}

uint64_t nghttp2_session_add_item(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;

  v4 = *(_DWORD *)(a2 + 8);
  v5 = nghttp2_map_find((uint64_t *)a1, v4);
  if (!v5 || (*(_BYTE *)(v5 + 216) & 2) != 0)
  {
    v6 = 0;
  }
  else if (*(_DWORD *)(v5 + 204) == 5)
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }
  switch(*(_BYTE *)(a2 + 12))
  {
    case 0:
      if (!v6)
        return 4294966786;
      if (*(_QWORD *)(v6 + 152))
        return 4294966767;
      v18 = *(_BYTE *)(v6 + 216);
      if ((v18 & 0xC) != 0)
        __assert_rtn("nghttp2_stream_attach_item", "nghttp2_stream.c", 480, "(stream->flags & NGHTTP2_STREAM_FLAG_DEFERRED_ALL) == 0");
      *(_QWORD *)(v6 + 152) = a2;
      if ((v18 & 0x10) != 0)
        goto LABEL_41;
      v19 = stream_obq_push(*(_QWORD *)(v6 + 96), (uint64_t *)v6);
      if ((_DWORD)v19)
      {
        v7 = v19;
        *(_QWORD *)(v6 + 152) = 0;
      }
      else if ((*(_BYTE *)(v6 + 216) & 0x10) != 0)
      {
LABEL_41:
        v7 = session_ob_data_push(a1, v6);
        if ((_DWORD)v7)
          nghttp2_stream_detach_item(v6);
      }
      else
      {
        return 0;
      }
      return v7;
    case 1:
      if (*(_DWORD *)(a2 + 56) && (!v6 || *(_DWORD *)(v6 + 204) != 4))
        goto LABEL_30;
      v7 = 0;
      v11 = (_QWORD *)(a1 + 304);
      v12 = *(_QWORD *)(a1 + 312);
      v13 = *(_QWORD *)(a1 + 320);
      if (v12)
        v11 = (_QWORD *)(v12 + 144);
      *v11 = a2;
      *(_QWORD *)(a1 + 312) = a2;
      *(_QWORD *)(a1 + 320) = v13 + 1;
      goto LABEL_33;
    case 3:
      if (v6)
        *(_DWORD *)(v6 + 204) = 3;
      goto LABEL_30;
    case 4:
    case 6:
      v7 = 0;
      v8 = (_QWORD *)(a1 + 256);
      v9 = *(_QWORD *)(a1 + 264);
      v10 = *(_QWORD *)(a1 + 272);
      if (v9)
        v8 = (_QWORD *)(v9 + 144);
      *v8 = a2;
      *(_QWORD *)(a1 + 264) = a2;
      *(_QWORD *)(a1 + 272) = v10 + 1;
      goto LABEL_33;
    case 5:
      v21 = 0;
      if (!v6)
        return 4294966786;
      LODWORD(v20) = *(_DWORD *)(v6 + 168);
      HIDWORD(v20) = 16;
      if (!nghttp2_session_open_stream(a1, *(_DWORD *)(a2 + 40), &v20, 4, *(_QWORD *)(a2 + 120)))
        return 4294966395;
LABEL_30:
      v7 = 0;
      v14 = (_QWORD *)(a1 + 280);
      v15 = *(_QWORD *)(a1 + 288);
      v16 = *(_QWORD *)(a1 + 296);
      if (v15)
        v14 = (_QWORD *)(v15 + 144);
      *v14 = a2;
      *(_QWORD *)(a1 + 288) = a2;
      *(_QWORD *)(a1 + 296) = v16 + 1;
LABEL_33:
      *(_BYTE *)(a2 + 152) = 1;
      return v7;
    case 8:
      if (v6)
      {
        *(_BYTE *)(v6 + 219) = 1;
      }
      else if (!v4)
      {
        *(_BYTE *)(a1 + 2934) = 1;
      }
      goto LABEL_30;
    default:
      goto LABEL_30;
  }
}

uint64_t session_new(uint64_t *a1, _OWORD *a2, uint64_t a3, int a4, __int128 *a5, uint64_t (**a6)(uint64_t, uint64_t, _QWORD))
{
  uint64_t (**v11)(uint64_t, uint64_t, _QWORD);
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _OWORD *v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD *v32;
  _OWORD *v33;
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
  uint64_t i;
  _QWORD *v46;
  uint64_t v47;

  if (a6)
    v11 = a6;
  else
    v11 = (uint64_t (**)(uint64_t, uint64_t, _QWORD))&mem_default;
  v12 = v11[3](1, 2968, *v11);
  *a1 = v12;
  if (!v12)
    return 4294966395;
  v13 = *(_OWORD *)v11;
  v14 = *((_OWORD *)v11 + 1);
  *(_QWORD *)(v12 + 2600) = v11[4];
  *(_OWORD *)(v12 + 2568) = v13;
  *(_OWORD *)(v12 + 2584) = v14;
  v15 = *a1;
  v16 = (_QWORD *)(*a1 + 2568);
  *(_QWORD *)(v15 + 40) = 0;
  *(_QWORD *)(v15 + 48) = v16;
  *(_QWORD *)(v15 + 56) = 0;
  *(_QWORD *)(v15 + 64) = 0;
  *(_QWORD *)(v15 + 72) = stream_less;
  *(_DWORD *)(v15 + 200) = 0;
  *(_BYTE *)(v15 + 248) = 0;
  *(_DWORD *)(v15 + 232) = 0;
  *(_DWORD *)(v15 + 236) = 5;
  *(_OWORD *)(v15 + 160) = 0u;
  *(_OWORD *)(v15 + 176) = 0u;
  *(_OWORD *)(v15 + 128) = 0u;
  *(_OWORD *)(v15 + 144) = 0u;
  *(_QWORD *)(v15 + 204) = 0;
  *(_QWORD *)(v15 + 212) = 0;
  *(_QWORD *)(v15 + 220) = 0x1000000000;
  *(_DWORD *)(v15 + 244) = 0;
  *(_WORD *)(v15 + 240) = -1;
  *(_DWORD *)(v15 + 228) = 0;
  *(_QWORD *)(v15 + 192) = 0;
  *(_OWORD *)(v15 + 80) = xmmword_1DF25D870;
  *(_OWORD *)(v15 + 96) = 0u;
  *(_OWORD *)(v15 + 112) = 0u;
  *(_BYTE *)(v15 + 253) = 3;
  *(_DWORD *)(v15 + 249) = 50331648;
  v17 = *a1;
  v18 = (_OWORD *)(*a1 + 2820);
  *(_DWORD *)(v17 + 2836) = 0;
  *(_QWORD *)(v17 + 2840) = 0xFFFF00000000;
  *(_BYTE *)(v17 + 2933) = 0;
  *v18 = xmmword_1DF25D880;
  *(_DWORD *)(v17 + 2920) = -1;
  *(_BYTE *)(v17 + 2928) = 1;
  *(_BYTE *)(v17 + 2930) = -1;
  *(_OWORD *)(v17 + 2656) = xmmword_1DF25D890;
  *(_OWORD *)(v17 + 2672) = xmmword_1DF25D8A0;
  if (a4)
    *(_BYTE *)(v17 + 2932) = 1;
  *(_QWORD *)(v17 + 2868) = 0xFFFFFFFF00004000;
  *(_OWORD *)(v17 + 2880) = xmmword_1DF25D8B0;
  *(_QWORD *)(v17 + 2896) = 0x40000000FFFFLL;
  *(_DWORD *)(v17 + 2904) = -1;
  *(_DWORD *)(v17 + 2912) = -1;
  *(_QWORD *)(v17 + 2720) = 200;
  v18[2] = xmmword_1DF25D8C0;
  *(_QWORD *)(v17 + 2760) = 1000;
  *(_OWORD *)(v17 + 2768) = xmmword_1DF25D8D0;
  *(_QWORD *)(v17 + 2784) = 8;
  if (a5)
  {
    v19 = *((_DWORD *)a5 + 14);
    if ((v19 & 1) != 0 && *((_DWORD *)a5 + 18))
      *(_DWORD *)(v17 + 2916) |= 1u;
    if ((v19 & 2) != 0)
    {
      *(_DWORD *)(v17 + 2860) = *((_DWORD *)a5 + 15);
      if ((v19 & 0x10) == 0)
      {
LABEL_13:
        if ((v19 & 4) == 0)
          goto LABEL_21;
LABEL_19:
        if (*((_DWORD *)a5 + 19))
          *(_DWORD *)(v17 + 2916) |= 2u;
LABEL_21:
        if ((v19 & 8) != 0 && *((_DWORD *)a5 + 20))
          *(_DWORD *)(v17 + 2916) |= 4u;
        if ((v19 & 0x20) != 0)
        {
          v22 = *(__int128 *)((char *)a5 + 120);
          *(_OWORD *)(v17 + 2935) = *(__int128 *)((char *)a5 + 104);
          *(_OWORD *)(v17 + 2951) = v22;
          v19 = *((_DWORD *)a5 + 14);
          if ((v19 & 0x80) == 0)
          {
LABEL_26:
            if ((v19 & 0x40) == 0)
              goto LABEL_32;
            goto LABEL_30;
          }
        }
        else if ((v19 & 0x80) == 0)
        {
          goto LABEL_26;
        }
        *(_DWORD *)(*a1 + 2924) = *((_DWORD *)a5 + 17);
        if ((v19 & 0x40) == 0)
          goto LABEL_32;
LABEL_30:
        if (*((_DWORD *)a5 + 21))
          *(_DWORD *)(*a1 + 2916) |= 8u;
LABEL_32:
        if ((v19 & 0x100) != 0)
          *(_QWORD *)(*a1 + 2768) = *((_QWORD *)a5 + 2);
        if ((v19 & 0x200) != 0)
        {
          v21 = *((_QWORD *)a5 + 3);
          if ((v19 & 0x400) == 0)
            goto LABEL_40;
        }
        else
        {
          v21 = 4096;
          if ((v19 & 0x400) == 0)
            goto LABEL_40;
        }
        if (*((_DWORD *)a5 + 22))
          *(_DWORD *)(*a1 + 2916) |= 0x10u;
LABEL_40:
        if ((v19 & 0x800) != 0)
          *(_QWORD *)(*a1 + 2760) = *((_QWORD *)a5 + 4);
        if ((v19 & 0x1000) != 0)
        {
          v23 = *((_QWORD *)a5 + 5);
          if (v23)
            *(_QWORD *)(*a1 + 2776) = v23;
        }
        if ((v19 & 0x2000) != 0 && *((_DWORD *)a5 + 24))
          *(_DWORD *)(*a1 + 2916) |= 0x20u;
        if ((v19 & 0x4000) != 0 && *((_DWORD *)a5 + 25))
          *(_DWORD *)(*a1 + 2916) |= 0x40u;
        if ((v19 & 0x8000) != 0)
        {
          v24 = *a1;
          v25 = *a5;
          *(_QWORD *)(v24 + 2672) = *(_QWORD *)a5;
          *(_OWORD *)(v24 + 2656) = v25;
          *(_QWORD *)(v24 + 2680) = 0;
          if ((v19 & 0x10000) == 0)
          {
LABEL_53:
            if ((v19 & 0x80000000) == 0)
            {
LABEL_54:
              v17 = *a1;
              goto LABEL_59;
            }
LABEL_57:
            v17 = *a1;
            if (*((_DWORD *)a5 + 23))
              *(_DWORD *)(v17 + 2916) |= 0x80u;
            goto LABEL_59;
          }
        }
        else if ((v19 & 0x10000) == 0)
        {
          goto LABEL_53;
        }
        *(_QWORD *)(*a1 + 2784) = *((_QWORD *)a5 + 6);
        if ((v19 & 0x80000000) == 0)
          goto LABEL_54;
        goto LABEL_57;
      }
    }
    else if ((v19 & 0x10) == 0)
    {
      goto LABEL_13;
    }
    *(_QWORD *)(v17 + 2720) = *((unsigned int *)a5 + 16);
    if ((v19 & 4) == 0)
      goto LABEL_21;
    goto LABEL_19;
  }
  v21 = 4096;
LABEL_59:
  v20 = nghttp2_hd_deflate_init2(v17 + 992, v21, (uint64_t)v16);
  if ((_DWORD)v20)
  {
LABEL_70:
    (*(void (**)(uint64_t, _QWORD))(v15 + 2584))(*a1, *(_QWORD *)(v15 + 2568));
    return v20;
  }
  v20 = nghttp2_hd_inflate_init(*a1 + 2104, (uint64_t)v16);
  if ((_DWORD)v20)
  {
LABEL_69:
    hd_context_free((_QWORD *)(*a1 + 992));
    goto LABEL_70;
  }
  v26 = *a1;
  v27 = *(_QWORD *)(*a1 + 2768) + 16393;
  if (v27 < 0x400A)
    v28 = 1;
  else
    v28 = v27 / 0x400A;
  if (!v28)
  {
    v20 = 4294966795;
    goto LABEL_68;
  }
  v47 = 0;
  v29 = buf_chain_new(&v47, 16394, v16);
  if ((_DWORD)v29)
  {
    v20 = v29;
    v26 = *a1;
LABEL_68:
    nghttp2_hd_inflate_free((_QWORD *)(v26 + 2104));
    goto LABEL_69;
  }
  *(_QWORD *)(v26 + 672) = v16;
  v31 = v47;
  *(_QWORD *)(v26 + 656) = v47;
  *(_QWORD *)(v26 + 664) = v31;
  *(int64x2_t *)(v31 + 24) = vaddq_s64(*(int64x2_t *)(v31 + 24), vdupq_n_s64(0xAuLL));
  *(_QWORD *)(v26 + 680) = 16394;
  *(_QWORD *)(v26 + 696) = 1;
  *(_QWORD *)(v26 + 688) = v28;
  *(_OWORD *)(v26 + 704) = xmmword_1DF25D8E0;
  v32 = (_QWORD *)*a1;
  *v32 = 0;
  v32[1] = v16;
  v32[2] = 0;
  v32[3] = 0;
  active_outbound_item_reset((uint64_t *)(*a1 + 648), (uint64_t)v16);
  v33 = (_OWORD *)(*a1 + 2344);
  v34 = a2[1];
  *v33 = *a2;
  v33[1] = v34;
  v35 = a2[2];
  v36 = a2[3];
  v37 = a2[5];
  v33[4] = a2[4];
  v33[5] = v37;
  v33[2] = v35;
  v33[3] = v36;
  v38 = a2[6];
  v39 = a2[7];
  v40 = a2[9];
  v33[8] = a2[8];
  v33[9] = v40;
  v33[6] = v38;
  v33[7] = v39;
  v41 = a2[10];
  v42 = a2[11];
  v43 = a2[13];
  v33[12] = a2[12];
  v33[13] = v43;
  v33[10] = v41;
  v33[11] = v42;
  *(_QWORD *)(*a1 + 2608) = a3;
  session_inbound_frame_reset(*a1);
  v44 = *a1;
  if (a4)
  {
    if ((*(_BYTE *)(v44 + 2916) & 2) != 0)
    {
      *(_DWORD *)(v44 + 952) = 1;
    }
    else
    {
      *(_DWORD *)(v44 + 952) = 0;
      *(_QWORD *)(v44 + 936) = 24;
    }
  }
  else
  {
    *(_DWORD *)(v44 + 952) = 1;
    *(_DWORD *)(v44 + 720) = 3;
    nghttp2_bufs_add(v44 + 656, "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n", 0x18uLL);
  }
  for (i = 328; i != 648; i += 40)
  {
    v20 = 0;
    v46 = (_QWORD *)(*a1 + i);
    *v46 = 0;
    v46[1] = v16;
    v46[2] = 0;
    v46[3] = 0;
    v46[4] = stream_less_214;
  }
  return v20;
}

double session_inbound_frame_reset(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  double result;
  uint64_t v6;

  v2 = *(unsigned __int8 *)(a1 + 740);
  switch(*(_BYTE *)(a1 + 740))
  {
    case 0:
    case 2:
    case 3:
    case 6:
    case 8:
      goto LABEL_12;
    case 1:
      v3 = *(_QWORD *)(a1 + 768);
      goto LABEL_10;
    case 4:
      (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(a1 + 752), *(_QWORD *)(a1 + 2568));
      (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(a1 + 824), *(_QWORD *)(a1 + 2568));
      *(_QWORD *)(a1 + 824) = 0;
      *(_QWORD *)(a1 + 928) = 0;
      *(_QWORD *)(a1 + 920) = 0;
      goto LABEL_12;
    case 5:
    case 7:
      v3 = *(_QWORD *)(a1 + 752);
      goto LABEL_10;
    default:
      if (((*(unsigned __int8 *)(a1 + (v2 >> 3) + 2935) >> (v2 & 7)) & 1) != 0)
        goto LABEL_12;
      if ((_DWORD)v2 == 12)
      {
        if ((*(_BYTE *)(a1 + 2924) & 2) != 0)
        {
          v6 = *(_QWORD *)(a1 + 744);
          if (v6)
          {
            v3 = *(_QWORD *)(v6 + 8);
            goto LABEL_10;
          }
        }
      }
      else if ((_DWORD)v2 == 10 && (*(_BYTE *)(a1 + 2924) & 1) != 0)
      {
        v4 = *(uint64_t **)(a1 + 744);
        if (v4)
        {
          v3 = *v4;
LABEL_10:
          (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v3, *(_QWORD *)(a1 + 2568));
        }
      }
LABEL_12:
      *(_OWORD *)(a1 + 792) = 0u;
      *(_OWORD *)(a1 + 808) = 0u;
      *(_OWORD *)(a1 + 760) = 0u;
      *(_OWORD *)(a1 + 776) = 0u;
      *(_OWORD *)(a1 + 728) = 0u;
      *(_OWORD *)(a1 + 744) = 0u;
      *(_DWORD *)(a1 + 952) = 2;
      *(_QWORD *)(a1 + 856) = a1 + 956;
      *(_QWORD *)(a1 + 848) = a1 + 956;
      *(_QWORD *)(a1 + 832) = a1 + 956;
      *(_QWORD *)(a1 + 840) = a1 + 988;
      *(_QWORD *)(a1 + 864) = a1 + 965;
      (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(a1 + 872), *(_QWORD *)(a1 + 2568));
      *(_QWORD *)(a1 + 944) = 0;
      *(_QWORD *)(a1 + 936) = 0;
      result = 0.0;
      *(_OWORD *)(a1 + 872) = 0u;
      *(_OWORD *)(a1 + 888) = 0u;
      *(_OWORD *)(a1 + 904) = 0u;
      return result;
  }
}

uint64_t active_outbound_item_reset(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  nghttp2_outbound_item_free(*a1, a2);
  result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(*a1, *(_QWORD *)a2);
  *a1 = 0;
  v5 = a1 + 1;
  v6 = a1[7];
  v7 = v6;
  while (1)
  {
    v5 = (_QWORD *)*v5;
    if (!v5)
      break;
    v8 = v5[1];
    v5[5] = v8;
    v9 = v8 + a1[8];
    v5[3] = v9;
    v5[4] = v9;
    if (!--v7)
    {
      v10 = (_QWORD *)*v5;
      *v5 = 0;
      if (v10)
      {
        do
        {
          v11 = (_QWORD *)a1[3];
          v12 = (_QWORD *)*v10;
          ((void (*)(_QWORD, _QWORD))v11[2])(v10[1], *v11);
          v10[1] = 0;
          result = ((uint64_t (*)(_QWORD *, _QWORD))v11[2])(v10, *v11);
          v10 = v12;
        }
        while (v12);
        v6 = a1[7];
      }
      a1[6] = v6;
      break;
    }
  }
  a1[2] = a1[1];
  *((_DWORD *)a1 + 18) = 0;
  return result;
}

uint64_t nghttp2_outbound_item_free(uint64_t result, uint64_t a2)
{
  int v2;
  _QWORD *v3;
  uint64_t v4;

  if (!result)
    return result;
  v2 = *(unsigned __int8 *)(result + 12);
  switch(*(_BYTE *)(result + 12))
  {
    case 0:
    case 2:
    case 3:
    case 6:
    case 8:
      return result;
    case 1:
      v3 = (_QWORD *)(result + 40);
      return (*(uint64_t (**)(_QWORD, _QWORD))(a2 + 16))(*v3, *(_QWORD *)a2);
    case 4:
    case 5:
    case 7:
      v3 = (_QWORD *)(result + 24);
      return (*(uint64_t (**)(_QWORD, _QWORD))(a2 + 16))(*v3, *(_QWORD *)a2);
    default:
      if (!*(_BYTE *)(result + 96))
        return result;
      if (v2 == 16 || v2 == 12)
      {
        v4 = *(_QWORD *)(result + 16);
        if (!v4)
          return result;
        v3 = (_QWORD *)(v4 + 8);
        return (*(uint64_t (**)(_QWORD, _QWORD))(a2 + 16))(*v3, *(_QWORD *)a2);
      }
      if (v2 != 10)
        __assert_rtn("nghttp2_outbound_item_free", "nghttp2_outbound_item.c", 122, "0");
      v3 = *(_QWORD **)(result + 16);
      if (v3)
        return (*(uint64_t (**)(_QWORD, _QWORD))(a2 + 16))(*v3, *(_QWORD *)a2);
      return result;
  }
}

uint64_t nghttp2_hd_deflate_hd_bufs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  const void **v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  _QWORD *v30;
  const void **v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  const void *v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _BYTE *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 *__s2;
  size_t __n;
  uint64_t v65[3];
  uint64_t __src;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 60))
    return 4294966773;
  v8 = a1;
  if (*(_BYTE *)(a1 + 1104))
  {
    v9 = *(_QWORD *)(a1 + 1096);
    *(_BYTE *)(a1 + 1104) = 0;
    *(_QWORD *)(a1 + 1096) = 0xFFFFFFFFLL;
    v10 = *(_QWORD *)(a1 + 48);
    if (v10 > v9)
    {
      result = emit_table_size(a2, v9);
      if ((_DWORD)result)
      {
LABEL_8:
        *(_BYTE *)(v8 + 60) = 1;
        return result;
      }
      v10 = *(_QWORD *)(v8 + 48);
    }
    result = emit_table_size(a2, v10);
    if ((_DWORD)result)
      goto LABEL_8;
  }
  if (!a4)
    return 0;
  v11 = 0;
  v59 = v8 + 64;
  v60 = a3;
  v56 = a4;
  v57 = a2;
  v58 = v8;
  do
  {
    v61 = *(_QWORD *)(v8 + 32);
    v62 = a3 + 40 * v11;
    v12 = *(_QWORD *)(v62 + 16);
    __s2 = *(unsigned __int8 **)v62;
    v13 = lookup_token(*(_BYTE **)v62, v12);
    v14 = v13;
    v15 = v13;
    __n = v12;
    if (v13 == -1)
    {
      v16 = -2128831035;
      if (!v12)
        goto LABEL_22;
      v17 = __s2;
      v18 = v12;
      do
      {
        v19 = *v17++;
        v16 = 16777619 * (v16 ^ v19);
        --v18;
      }
      while (v18);
    }
    else if (v13 > 0x3C)
    {
      v16 = 0;
    }
    else
    {
      v16 = static_table[32 * (unint64_t)v13 + 31];
    }
    if (v13 == 22 || v13 == 31 && *(_QWORD *)(a3 + 40 * v11 + 24) < 0x14uLL)
    {
LABEL_26:
      v20 = 2;
      goto LABEL_27;
    }
LABEL_22:
    if ((*(_BYTE *)(a3 + 40 * v11 + 32) & 1) != 0)
      goto LABEL_26;
    v20 = v13 <= 0x36 && ((1 << v13) & 0x40218208100008) != 0
       || v12 + *(_QWORD *)(a3 + 40 * v11 + 24) + 32 > (unint64_t)(3 * *(_QWORD *)(v8 + 48)) >> 2;
LABEL_27:
    v21 = *(_QWORD *)(v59 + 8 * (v16 & 0x7F));
    if (!v21)
    {
      if (v13 <= 0x3C)
        goto LABEL_49;
      goto LABEL_58;
    }
    v22 = 0;
    v23 = a3 + 40 * v11;
    v24 = (_QWORD *)(v23 + 24);
    v25 = (const void **)(v23 + 8);
    while (*(_DWORD *)(v21 + 16) != v14
         || v14 == -1
         && (*(_DWORD *)(v21 + 76) != v16
          || *(_QWORD *)(*(_QWORD *)v21 + 24) != __n
          || memcmp(*(const void **)(*(_QWORD *)v21 + 16), __s2, __n)))
    {
      v26 = v22;
LABEL_43:
      v21 = *(_QWORD *)(v21 + 64);
      v22 = v26;
      if (!v21)
        goto LABEL_48;
    }
    if (v22)
      v26 = v22;
    else
      v26 = v21;
    if (v20 != 2 || v22)
    {
      v27 = *(_QWORD *)(v21 + 8);
      v28 = *(_QWORD *)(v27 + 24);
      if (v28 == *v24 && !memcmp(*(const void **)(v27 + 16), *v25, v28))
      {
        v8 = v58;
        v48 = (*(_DWORD *)(v58 + 56) + ~*(_DWORD *)(v21 + 72) + 61);
        goto LABEL_83;
      }
      goto LABEL_43;
    }
    v26 = v21;
LABEL_48:
    v8 = v58;
    if (v14 >= 0x3D)
    {
      if (v26)
      {
        v15 = (*(_DWORD *)(v58 + 56) + ~*(_DWORD *)(v26 + 72) + 61);
LABEL_59:
        a3 = v60;
LABEL_60:
        v34 = v61;
        if (!v20)
        {
          __src = 0;
          v67 = 0;
          v68 = 0;
          if (v15 != -1)
          {
            nghttp2_hd_table_get(v65, (_QWORD *)v8, v15);
            v35 = v65[0];
            __src = v65[0];
            v36 = *(_DWORD *)(v65[0] + 32);
            if (v36 != -1)
              *(_DWORD *)(v65[0] + 32) = v36 + 1;
            goto LABEL_69;
          }
          v38 = (*(uint64_t (**)(size_t, _QWORD))(v61 + 8))(__n + 41, *(_QWORD *)v61);
          if (v38)
          {
            v35 = v38;
            __src = v38;
            *(_QWORD *)v38 = *(_QWORD *)v61;
            v39 = (_BYTE *)(v38 + 40);
            *(_QWORD *)(v38 + 8) = *(_QWORD *)(v61 + 16);
            *(_QWORD *)(v38 + 16) = v38 + 40;
            *(_DWORD *)(v38 + 32) = 1;
            *(_QWORD *)(v38 + 24) = __n;
            if (__n)
            {
              memcpy((void *)(v38 + 40), __s2, __n);
              v39 += __n;
            }
            *v39 = 0;
            v34 = v61;
LABEL_69:
            v40 = a3 + 40 * v11;
            v41 = *(const void **)(v40 + 8);
            v42 = *(_QWORD *)(v40 + 24);
            v43 = (*(uint64_t (**)(size_t, _QWORD))(v34 + 8))(v42 + 41, *(_QWORD *)v34);
            if (v43)
            {
              v44 = v43;
              v67 = v43;
              *(_QWORD *)v43 = *(_QWORD *)v34;
              v45 = *(_QWORD *)(v34 + 16);
              v46 = (_BYTE *)(v43 + 40);
              *(_QWORD *)(v43 + 8) = v45;
              *(_QWORD *)(v43 + 16) = v43 + 40;
              *(_DWORD *)(v43 + 32) = 1;
              *(_QWORD *)(v43 + 24) = v42;
              if (v42)
              {
                memcpy((void *)(v43 + 40), v41, v42);
                v46 += v42;
              }
              a3 = v60;
              *v46 = 0;
              LODWORD(v68) = v14;
              v8 = v58;
              v47 = add_hd_table_incremental((uint64_t *)v58, &__src, v59, v16);
              nghttp2_rcbuf_decref(v44);
              nghttp2_rcbuf_decref(v35);
              if (v47)
              {
                result = 4294966773;
                goto LABEL_8;
              }
              goto LABEL_73;
            }
            nghttp2_rcbuf_decref(v35);
            v8 = v58;
          }
          result = 4294966395;
          goto LABEL_8;
        }
LABEL_73:
        if (v15 == -1)
        {
          result = nghttp2_bufs_addb(v57, (0x100040u >> (8 * v20)) & 0xF0);
          if ((_DWORD)result)
            goto LABEL_8;
          result = emit_string(v57, *(char **)v62, *(_QWORD *)(v62 + 16));
          if ((_DWORD)result)
            goto LABEL_8;
          result = emit_string(v57, *(char **)(a3 + 40 * v11 + 8), *(_QWORD *)(a3 + 40 * v11 + 24));
        }
        else
        {
          result = emit_indname_block(v57, v15, v62, v20);
        }
        v37 = v56;
        goto LABEL_79;
      }
LABEL_58:
      v15 = -1;
      goto LABEL_59;
    }
LABEL_49:
    if (v20 == 2)
    {
      result = emit_indname_block(v57, v15, v62, 2);
      v37 = v56;
      a3 = v60;
      goto LABEL_79;
    }
    a3 = v60;
    v29 = v60 + 40 * v11;
    v30 = (_QWORD *)(v29 + 24);
    v31 = (const void **)(v29 + 8);
    v32 = (char *)&static_table[32 * v15 + 16];
    v33 = -1;
    while (1)
    {
      if (*((_DWORD *)v32 + 14) != (_DWORD)v15)
      {
LABEL_55:
        v8 = v58;
        goto LABEL_60;
      }
      if (*(_QWORD *)v32 == *v30 && !memcmp(*((const void **)v32 - 1), *v31, *(_QWORD *)v32))
        break;
      ++v33;
      v32 += 128;
      if ((int)v15 + (int)v33 >= 60)
        goto LABEL_55;
    }
    v48 = v15 + v33 + 1;
    v8 = v58;
LABEL_83:
    v37 = v56;
    if ((unint64_t)(v48 + 1) <= 0x7E)
    {
      LOBYTE(__src) = (v48 + 1) | 0x80;
      v49 = 1;
      a3 = v60;
      goto LABEL_96;
    }
    v50 = v48 - 126;
    if (v50 < 0x80)
    {
      LOBYTE(__src) = -1;
      v49 = 2;
      v54 = (char *)&__src + 1;
      a3 = v60;
    }
    else
    {
      v51 = 0;
      v52 = v50;
      a3 = v60;
      do
      {
        v53 = v52 >> 14;
        v52 >>= 7;
        ++v51;
      }
      while (v53);
      if (v51 > 0xE)
      {
        result = 4294966773;
        goto LABEL_79;
      }
      LOBYTE(__src) = -1;
      v54 = (char *)&__src + 1;
      do
      {
        *v54++ = v50 | 0x80;
        v55 = v50 >> 14;
        v50 >>= 7;
      }
      while (v55);
      v49 = v51 + 2;
    }
    *v54 = v50;
LABEL_96:
    result = nghttp2_bufs_add(v57, (char *)&__src, v49);
LABEL_79:
    if ((_DWORD)result)
      goto LABEL_8;
    ++v11;
  }
  while (v11 != v37);
  return 0;
}

uint64_t nghttp2_bufs_add(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t result;

  if (!a3)
    return 0;
  v3 = a3;
  do
  {
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 8);
      v7 = *(_QWORD *)(v6 + 32);
      v8 = *(_QWORD *)(v6 + 16) - v7 >= v3 ? v3 : *(_QWORD *)(v6 + 16) - v7;
      if (v8)
        break;
      result = bufs_alloc_chain(a1);
      if ((_DWORD)result)
        return result;
    }
    memcpy(*(void **)(v6 + 32), __src, v8);
    *(_QWORD *)(v6 + 32) = v7 + v8;
    __src += v8;
    v3 -= v8;
  }
  while (v3);
  return 0;
}

uint64_t lookup_token(_BYTE *a1, uint64_t a2)
{
  uint64_t result;
  int v3;
  int v4;
  int v6;
  int v7;
  unsigned int v9;
  unsigned int v12;
  unsigned int v14;
  int v17;
  int v20;
  int v22;
  int v24;
  int v27;
  BOOL v29;
  int v31;
  BOOL v32;
  BOOL v34;
  BOOL v36;
  BOOL v37;

  switch(a2)
  {
    case 2:
      if (a1[1] != 101 || *a1 != 116)
        return 0xFFFFFFFFLL;
      return 61;
    case 3:
      v3 = a1[2];
      if (v3 == 101)
      {
        if (*(_WORD *)a1 != 26465)
          return 0xFFFFFFFFLL;
        return 20;
      }
      else
      {
        if (v3 != 97 || *(_WORD *)a1 != 26998)
          return 0xFFFFFFFFLL;
        return 59;
      }
    case 4:
      v4 = a1[3];
      switch(a1[3])
      {
        case 'e':
          if (*(_WORD *)a1 != 24932 || a1[2] != 116)
            return 0xFFFFFFFFLL;
          return 32;
        case 'f':
        case 'h':
        case 'i':
        case 'j':
        case 'l':
          return 0xFFFFFFFFLL;
        case 'g':
          if (*(_WORD *)a1 != 29797 || a1[2] != 97)
            return 0xFFFFFFFFLL;
          return 33;
        case 'k':
          if (*(_WORD *)a1 != 26988 || a1[2] != 110)
            return 0xFFFFFFFFLL;
          return 44;
        case 'm':
          if (*(_WORD *)a1 != 29286 || a1[2] != 111)
            return 0xFFFFFFFFLL;
          return 36;
        default:
          if (v4 == 116)
          {
            if (*(_WORD *)a1 == 28520 && a1[2] == 115)
              return 37;
          }
          else if (v4 == 121 && *(_WORD *)a1 == 24950 && a1[2] == 114)
          {
            return 58;
          }
          break;
      }
      return 0xFFFFFFFFLL;
    case 5:
      v6 = a1[4];
      if (v6 == 119)
      {
        if (*(_DWORD *)a1 != 1869376609)
          return 0xFFFFFFFFLL;
        return 21;
      }
      else
      {
        if (v6 != 104)
        {
          if (v6 == 101 && *(_DWORD *)a1 == 1735287154)
            return 49;
          return 0xFFFFFFFFLL;
        }
        if (*(_DWORD *)a1 != 1952542778)
          return 0xFFFFFFFFLL;
        return 3;
      }
    case 6:
      v7 = a1[5];
      if (v7 == 116)
      {
        if (*(_DWORD *)a1 == 1701012321 && a1[4] == 112)
          return 18;
        if (*(_DWORD *)a1 == 1701869669 && a1[4] == 99)
          return 34;
      }
      else if (v7 == 114)
      {
        if (*(_DWORD *)a1 == 1987208563 && a1[4] == 101)
          return 53;
      }
      else if (v7 == 101 && *(_DWORD *)a1 == 1802465123 && a1[4] == 105)
      {
        return 31;
      }
      return 0xFFFFFFFFLL;
    case 7:
      v9 = a1[6];
      if (v9 <= 0x67)
      {
        if (v9 == 100)
        {
          if (*(_DWORD *)a1 == 1952804154 && *((_WORD *)a1 + 2) == 28520)
            return 1;
        }
        else
        {
          if (v9 != 101)
            return 0xFFFFFFFFLL;
          if (*(_DWORD *)a1 == 1751348026 && *((_WORD *)a1 + 2) == 28005)
            return 5;
          if (*(_DWORD *)a1 == 1919381621 && *((_WORD *)a1 + 2) == 25697)
            return 65;
        }
      }
      else
      {
        switch(v9)
        {
          case 'h':
            if (*(_DWORD *)a1 == 1919313266 && *((_WORD *)a1 + 2) == 29541)
              return 51;
            break;
          case 'r':
            if (*(_DWORD *)a1 == 1701209458 && *((_WORD *)a1 + 2) == 25970)
              return 50;
            break;
          case 's':
            if (*(_DWORD *)a1 == 1635021626 && *((_WORD *)a1 + 2) == 30068)
              return 7;
            if (*(_DWORD *)a1 == 1768978533 && *((_WORD *)a1 + 2) == 25970)
              return 35;
            break;
          default:
            return 0xFFFFFFFFLL;
        }
      }
      return 0xFFFFFFFFLL;
    case 8:
      v12 = a1[7];
      if (v12 > 0x6D)
      {
        if (v12 == 110)
        {
          if (*(_DWORD *)a1 == 1633906540 && *(_DWORD *)(a1 + 3) == 1869182049)
            return 45;
        }
        else if (v12 == 121 && *(_DWORD *)a1 == 1869181552 && *(_DWORD *)(a1 + 3) == 1953067631)
        {
          return 67;
        }
      }
      else if (v12 == 101)
      {
        if (*(_DWORD *)a1 == 1915577961 && *(_DWORD *)(a1 + 3) == 1735287154)
          return 41;
      }
      else if (v12 == 104 && *(_DWORD *)a1 == 1831691881 && *(_DWORD *)(a1 + 3) == 1668571501)
      {
        return 38;
      }
      return 0xFFFFFFFFLL;
    case 9:
      if (a1[8] != 108 || *(_QWORD *)a1 != 0x6F636F746F72703ALL)
        return 0xFFFFFFFFLL;
      return 66;
    case 10:
      v14 = a1[9];
      if (v14 > 0x73)
      {
        if (v14 == 116)
        {
          if (*(_QWORD *)a1 == 0x6567612D72657375 && a1[8] == 110)
            return 57;
        }
        else if (v14 == 121 && *(_QWORD *)a1 == 0x69726F687475613ALL && a1[8] == 116)
        {
          return 0;
        }
      }
      else if (v14 == 101)
      {
        if (*(_QWORD *)a1 == 0x696C612D7065656BLL && a1[8] == 118)
          return 63;
        if (*(_QWORD *)a1 == 0x6B6F6F632D746573 && a1[8] == 105)
          return 54;
      }
      else if (v14 == 110 && *(_QWORD *)a1 == 0x697463656E6E6F63 && a1[8] == 111)
      {
        return 62;
      }
      return 0xFFFFFFFFLL;
    case 11:
      if (a1[10] != 114)
        return 0xFFFFFFFFLL;
      if (*(_QWORD *)a1 != 0x66612D7972746572 || *((_WORD *)a1 + 4) != 25972)
        return 0xFFFFFFFFLL;
      return 52;
    case 12:
      v17 = a1[11];
      if (v17 == 115)
      {
        if (*(_QWORD *)a1 == 0x77726F662D78616DLL && *(_QWORD *)(a1 + 3) == 0x64726177726F662DLL)
          return 46;
      }
      else if (v17 == 101 && *(_QWORD *)a1 == 0x2D746E65746E6F63 && *(_QWORD *)(a1 + 3) == 0x7079742D746E6574)
      {
        return 30;
      }
      return 0xFFFFFFFFLL;
    case 13:
      switch(a1[12])
      {
        case 'd':
          if (*(_QWORD *)a1 != 0x646F6D2D7473616CLL || *((_DWORD *)a1 + 2) != 1701406313)
            return 0xFFFFFFFFLL;
          result = 43;
          break;
        case 'e':
          if (*(_QWORD *)a1 != 0x2D746E65746E6F63 || *((_DWORD *)a1 + 2) != 1735287154)
            return 0xFFFFFFFFLL;
          result = 29;
          break;
        case 'f':
        case 'g':
        case 'i':
        case 'j':
        case 'k':
        case 'm':
          return 0xFFFFFFFFLL;
        case 'h':
          if (*(_QWORD *)a1 != 0x2D656E6F6E2D6669 || *((_DWORD *)a1 + 2) != 1668571501)
            return 0xFFFFFFFFLL;
          result = 40;
          break;
        case 'l':
          if (*(_QWORD *)a1 != 0x6F632D6568636163 || *((_DWORD *)a1 + 2) != 1869771886)
            return 0xFFFFFFFFLL;
          result = 23;
          break;
        case 'n':
          if (*(_QWORD *)a1 != 0x7A69726F68747561 || *((_DWORD *)a1 + 2) != 1869182049)
            return 0xFFFFFFFFLL;
          result = 22;
          break;
        default:
          if (a1[12] != 115)
            return 0xFFFFFFFFLL;
          if (*(_QWORD *)a1 != 0x722D747065636361 || *((_DWORD *)a1 + 2) != 1701277281)
            return 0xFFFFFFFFLL;
          result = 17;
          break;
      }
      return result;
    case 14:
      v20 = a1[13];
      if (v20 == 116)
      {
        if (*(_QWORD *)a1 == 0x632D747065636361 && *(_QWORD *)(a1 + 5) == 0x6573726168632D74)
          return 14;
      }
      else if (v20 == 104 && *(_QWORD *)a1 == 0x2D746E65746E6F63 && *(_QWORD *)(a1 + 5) == 0x74676E656C2D746ELL)
      {
        return 27;
      }
      return 0xFFFFFFFFLL;
    case 15:
      v22 = a1[14];
      if (v22 == 103)
      {
        if (*(_QWORD *)a1 == 0x652D747065636361 && *(_QWORD *)(a1 + 6) == 0x6E69646F636E652DLL)
          return 15;
      }
      else if (v22 == 101 && *(_QWORD *)a1 == 0x6C2D747065636361 && *(_QWORD *)(a1 + 6) == 0x676175676E616C2DLL)
      {
        return 16;
      }
      return 0xFFFFFFFFLL;
    case 16:
      v24 = a1[15];
      switch(v24)
      {
        case 'n':
          if (*(_QWORD *)a1 == 0x2D746E65746E6F63 && *(_QWORD *)(a1 + 7) == 0x6F697461636F6C2DLL)
            return 28;
          if (*(_QWORD *)a1 == 0x6F632D79786F7270 && *(_QWORD *)(a1 + 7) == 0x6F697463656E6E6FLL)
            return 64;
          break;
        case 'g':
          if (*(_QWORD *)a1 == 0x2D746E65746E6F63 && *(_QWORD *)(a1 + 7) == 0x6E69646F636E652DLL)
            return 25;
          break;
        case 'e':
          if (*(_QWORD *)a1 == 0x2D746E65746E6F63 && *(_QWORD *)(a1 + 7) == 0x676175676E616C2DLL)
            return 26;
          if (*(_QWORD *)a1 == 0x687475612D777777 && *(_QWORD *)(a1 + 7) == 0x74616369746E6568)
            return 60;
          break;
        default:
          return 0xFFFFFFFFLL;
      }
      return 0xFFFFFFFFLL;
    case 17:
      v27 = a1[16];
      if (v27 == 103)
      {
        if (*(_QWORD *)a1 == 0x726566736E617274 && *((_QWORD *)a1 + 1) == 0x6E69646F636E652DLL)
          return 56;
      }
      else if (v27 == 101 && *(_QWORD *)a1 == 0x6669646F6D2D6669 && *((_QWORD *)a1 + 1) == 0x636E69732D646569)
      {
        return 39;
      }
      return 0xFFFFFFFFLL;
    case 18:
      if (a1[17] != 101)
        return 0xFFFFFFFFLL;
      v29 = *(_QWORD *)a1 == 0x75612D79786F7270 && *((_QWORD *)a1 + 1) == 0x616369746E656874;
      if (!v29 || a1[16] != 116)
        return 0xFFFFFFFFLL;
      return 47;
    case 19:
      v31 = a1[18];
      if (v31 == 110)
      {
        if (*(_QWORD *)a1 == 0x2D746E65746E6F63
          && *((_QWORD *)a1 + 1) == 0x7469736F70736964
          && *((_WORD *)a1 + 8) == 28521)
        {
          return 24;
        }
        if (*(_QWORD *)a1 == 0x75612D79786F7270
          && *((_QWORD *)a1 + 1) == 0x74617A69726F6874
          && *((_WORD *)a1 + 8) == 28521)
        {
          return 48;
        }
      }
      else if (v31 == 101)
      {
        v32 = *(_QWORD *)a1 == 0x646F6D6E752D6669 && *((_QWORD *)a1 + 1) == 0x69732D6465696669;
        if (v32 && *((_WORD *)a1 + 8) == 25454)
          return 42;
      }
      return 0xFFFFFFFFLL;
    case 25:
      if (a1[24] != 121)
        return 0xFFFFFFFFLL;
      v34 = *(_QWORD *)a1 == 0x742D746369727473 && *((_QWORD *)a1 + 1) == 0x74726F70736E6172;
      if (!v34 || *((_QWORD *)a1 + 2) != 0x746972756365732DLL)
        return 0xFFFFFFFFLL;
      return 55;
    case 27:
      if (a1[26] != 110)
        return 0xFFFFFFFFLL;
      v36 = *(_QWORD *)a1 == 0x632D737365636361 && *((_QWORD *)a1 + 1) == 0x612D6C6F72746E6FLL;
      v37 = v36 && *((_QWORD *)a1 + 2) == 0x69726F2D776F6C6CLL;
      if (!v37 || *((_WORD *)a1 + 12) != 26983)
        return 0xFFFFFFFFLL;
      return 19;
    default:
      return 0xFFFFFFFFLL;
  }
}

uint64_t nghttp2_hd_inflate_hd_nv(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned __int8 *a4, uint64_t a5, int a6)
{
  size_t v6;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t huff;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v52;
  unint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  _DWORD *v56;
  int v57;
  int v58;
  __int128 v59;
  uint64_t v60;

  v58 = 0;
  if (*(_BYTE *)(a1 + 60))
    return -523;
  v13 = *(_QWORD *)(a1 + 32);
  nghttp2_rcbuf_decref(*(_QWORD *)(a1 + 176));
  nghttp2_rcbuf_decref(*(_QWORD *)(a1 + 168));
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  v14 = a4;
  *a3 = 0;
  if (!a5)
    goto LABEL_70;
  v55 = a2;
  v56 = a3;
  v57 = a6;
  v14 = &a4[a5];
  v15 = (uint64_t *)(a1 + 160);
  v16 = (uint64_t *)(a1 + 152);
  v17 = a1 + 72;
  v18 = a4;
  while (2)
  {
    v19 = *(_DWORD *)(a1 + 228);
    switch(v19)
    {
      case 0:
        if ((*v18 & 0xE0) != 0x20)
          goto LABEL_76;
        goto LABEL_10;
      case 1:
      case 2:
        v20 = *v18;
        if ((v20 & 0xE0) == 0x20)
        {
          if (v19 == 2)
            goto LABEL_76;
LABEL_10:
          *(_QWORD *)(a1 + 224) = 0x300000001;
        }
        else if ((v20 & 0x80) != 0)
        {
          *(_QWORD *)(a1 + 224) = 0x400000001;
        }
        else
        {
          if (!*v18 || v20 == 16)
          {
            v38 = 1;
            v39 = 0x500000002;
          }
          else
          {
            v38 = 1;
            v39 = 0x500000002;
            if (v20 != 64)
            {
              v38 = 0;
              v39 = 0x400000003;
            }
          }
          *(_QWORD *)(a1 + 224) = v39;
          *(_BYTE *)(a1 + 233) = (*v18 & 0x40) != 0;
          *(_BYTE *)(a1 + 234) = (*v18 & 0xF0) == 16;
          v18 += v38;
        }
        LOBYTE(v23) = 0;
        *(_QWORD *)(a1 + 184) = 0;
        *(_QWORD *)(a1 + 216) = 0;
        goto LABEL_67;
      case 3:
        v58 = 0;
        if (*(_QWORD *)(a1 + 208) >= *(_QWORD *)(a1 + 200))
          v21 = *(_QWORD *)(a1 + 200);
        else
          v21 = *(_QWORD *)(a1 + 208);
        v22 = hd_inflate_read_len(a1, &v58, v18, v14, 5, v21);
        v6 = v22;
        if (v22 < 0)
          goto LABEL_77;
        v18 += v22;
        if (!v58)
          goto LABEL_74;
        *(_QWORD *)(a1 + 208) = 0xFFFFFFFFLL;
        *(_QWORD *)(a1 + 48) = *(_QWORD *)(a1 + 184);
        hd_context_shrink_table_size((_QWORD *)a1, 0);
        LOBYTE(v23) = 0;
        *(_DWORD *)(a1 + 228) = 1;
        goto LABEL_67;
      case 4:
        if (*(_DWORD *)(a1 + 224) == 1)
        {
          v24 = 7;
        }
        else if (*(_BYTE *)(a1 + 233))
        {
          v24 = 6;
        }
        else
        {
          v24 = 4;
        }
        v58 = 0;
        v47 = hd_inflate_read_len(a1, &v58, v18, v14, v24, *(_QWORD *)(a1 + 24) + 61);
        v6 = v47;
        if (v47 < 0)
          goto LABEL_77;
        v18 += v47;
        if (!v58)
          goto LABEL_74;
        v48 = *(_QWORD *)(a1 + 184);
        if (!v48)
          goto LABEL_76;
        v49 = *(_DWORD *)(a1 + 224);
        *(_QWORD *)(a1 + 192) = v48 - 1;
        if (v49 == 1)
        {
          v59 = 0uLL;
          v60 = 0;
          nghttp2_hd_table_get(&v59, (_QWORD *)a1, v48 - 1);
          *(_OWORD *)v55 = v59;
          *(_QWORD *)(v55 + 16) = v60;
          *(_DWORD *)(a1 + 228) = 2;
          *v56 |= 2u;
          return v18 - a4;
        }
        LOBYTE(v23) = 0;
LABEL_62:
        *(_DWORD *)(a1 + 228) = 9;
        goto LABEL_67;
      case 5:
        *(_BYTE *)(a1 + 232) = *v18 >> 7;
        *(_DWORD *)(a1 + 228) = 6;
        *(_QWORD *)(a1 + 184) = 0;
        *(_QWORD *)(a1 + 216) = 0;
        goto LABEL_20;
      case 6:
LABEL_20:
        v58 = 0;
        v25 = hd_inflate_read_len(a1, &v58, v18, v14, 7, 0x10000uLL);
        v6 = v25;
        if (v25 < 0)
          goto LABEL_77;
        v18 += v25;
        if (!v58)
          goto LABEL_74;
        if (*(_BYTE *)(a1 + 232))
        {
          *(_WORD *)(a1 + 64) = 0x4000;
          v26 = (2 * *(_QWORD *)(a1 + 184)) | 1;
          v27 = 7;
        }
        else
        {
          v26 = *(_QWORD *)(a1 + 184) + 1;
          v27 = 8;
        }
        *(_DWORD *)(a1 + 228) = v27;
        v40 = nghttp2_rcbuf_new(v16, v26, v13);
        if (v40)
          goto LABEL_94;
        v41 = *(_QWORD *)(a1 + 152);
        v42 = *(_QWORD *)(v41 + 16);
        v43 = *(_QWORD *)(v41 + 24);
        *(_QWORD *)(a1 + 96) = v42;
        *(_QWORD *)(a1 + 104) = v42;
        *(_QWORD *)(a1 + 80) = v42;
        *(_QWORD *)(a1 + 88) = v42;
        *(_QWORD *)(a1 + 72) = v42;
        if (v43)
        {
          LOBYTE(v23) = 0;
          *(_QWORD *)(a1 + 80) = v42 + v43;
        }
        else
        {
LABEL_48:
          LOBYTE(v23) = 0;
        }
        goto LABEL_67;
      case 7:
        huff = hd_inflate_read_huff(a1, v17, v18, v14);
        v6 = huff;
        if (huff < 0)
          goto LABEL_77;
        v18 += huff;
        v23 = *(_QWORD *)(a1 + 184);
        if (v23)
          goto LABEL_74;
        **(_BYTE **)(a1 + 96) = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 152) + 24) = *(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88);
        goto LABEL_62;
      case 8:
        v29 = v13;
        v30 = v17;
        v31 = v16;
        v32 = v15;
        v33 = *(_QWORD *)(a1 + 184);
        if (v14 - v18 >= v33)
          v6 = *(_QWORD *)(a1 + 184);
        else
          v6 = v14 - v18;
        v34 = *(_BYTE **)(a1 + 96);
        if (v6)
        {
          memcpy(*(void **)(a1 + 96), v18, v6);
          v34 += v6;
          *(_QWORD *)(a1 + 96) = v34;
          v33 = *(_QWORD *)(a1 + 184);
          *(_QWORD *)(a1 + 184) = v33 - v6;
          if ((v6 & 0x8000000000000000) != 0)
            goto LABEL_77;
        }
        v18 += v6;
        if (v33 != v6)
          goto LABEL_74;
        LOBYTE(v23) = 0;
        *v34 = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 152) + 24) = *(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88);
        *(_DWORD *)(a1 + 228) = 9;
        v15 = v32;
        v16 = v31;
        v17 = v30;
        v13 = v29;
        goto LABEL_67;
      case 9:
        *(_BYTE *)(a1 + 232) = *v18 >> 7;
        *(_DWORD *)(a1 + 228) = 10;
        *(_QWORD *)(a1 + 184) = 0;
        *(_QWORD *)(a1 + 216) = 0;
        goto LABEL_35;
      case 10:
LABEL_35:
        v58 = 0;
        v35 = hd_inflate_read_len(a1, &v58, v18, v14, 7, 0x10000uLL);
        v6 = v35;
        if (v35 < 0)
          goto LABEL_77;
        v18 += v35;
        if (!v58)
        {
LABEL_74:
          v50 = v57;
LABEL_75:
          if (v50)
          {
LABEL_76:
            v6 = -523;
            goto LABEL_77;
          }
          return v18 - a4;
        }
        if (*(_BYTE *)(a1 + 232))
        {
          *(_WORD *)(a1 + 64) = 0x4000;
          v36 = (2 * *(_QWORD *)(a1 + 184)) | 1;
          v37 = 11;
        }
        else
        {
          v36 = *(_QWORD *)(a1 + 184) + 1;
          v37 = 12;
        }
        *(_DWORD *)(a1 + 228) = v37;
        v40 = nghttp2_rcbuf_new(v15, v36, v13);
        if (v40)
        {
LABEL_94:
          v6 = v40;
LABEL_77:
          *(_BYTE *)(a1 + 60) = 1;
          return v6;
        }
        v44 = *(_QWORD *)(a1 + 160);
        v45 = *(_QWORD *)(v44 + 16);
        v46 = *(_QWORD *)(v44 + 24);
        *(_QWORD *)(a1 + 136) = v45;
        *(_QWORD *)(a1 + 144) = v45;
        *(_QWORD *)(a1 + 120) = v45;
        *(_QWORD *)(a1 + 128) = v45;
        *(_QWORD *)(a1 + 112) = v45;
        if (v46)
          *(_QWORD *)(a1 + 120) = v45 + v46;
        LOBYTE(v23) = 1;
LABEL_67:
        if (v18 != v14 || (v23 & 1) != 0)
          continue;
        a6 = v57;
        a3 = v56;
LABEL_70:
        if (a6)
        {
          if ((*(_DWORD *)(a1 + 228) - 1) > 1)
            goto LABEL_76;
          *a3 |= 1u;
        }
        return v14 - a4;
      case 11:
        v52 = hd_inflate_read_huff(a1, a1 + 112, v18, v14);
        v6 = v52;
        if (v52 < 0)
          goto LABEL_77;
        v18 += v52;
        v50 = v57;
        if (*(_QWORD *)(a1 + 184))
          goto LABEL_75;
        **(_BYTE **)(a1 + 136) = 0;
        goto LABEL_89;
      case 12:
        v53 = *(_QWORD *)(a1 + 184);
        if (v14 - v18 >= v53)
          v6 = *(_QWORD *)(a1 + 184);
        else
          v6 = v14 - v18;
        v54 = *(_BYTE **)(a1 + 136);
        if (v6)
        {
          memcpy(*(void **)(a1 + 136), v18, v6);
          v54 += v6;
          *(_QWORD *)(a1 + 136) = v54;
          v53 = *(_QWORD *)(a1 + 184);
          *(_QWORD *)(a1 + 184) = v53 - v6;
          if ((v6 & 0x8000000000000000) != 0)
            goto LABEL_77;
        }
        v18 += v6;
        v50 = v57;
        if (v53 != v6)
          goto LABEL_75;
        *v54 = 0;
LABEL_89:
        *(_QWORD *)(*(_QWORD *)(a1 + 160) + 24) = *(_QWORD *)(a1 + 136) - *(_QWORD *)(a1 + 128);
        if (*(_DWORD *)(a1 + 224) == 2)
          hd_inflate_commit_newname(a1, v55);
        else
          hd_inflate_commit_indname(a1, v55);
        if (v40)
          goto LABEL_94;
        *(_DWORD *)(a1 + 228) = 2;
        *v56 |= 2u;
        return v18 - a4;
      default:
        goto LABEL_48;
    }
  }
}

uint64_t nghttp2_rcbuf_decref(uint64_t result)
{
  int v1;
  int v2;

  if (result)
  {
    v1 = *(_DWORD *)(result + 32);
    if (v1 != -1)
    {
      if (v1 <= 0)
        __assert_rtn("nghttp2_rcbuf_decref", "nghttp2_rcbuf.c", 88, "rcbuf->ref > 0");
      v2 = v1 - 1;
      *(_DWORD *)(result + 32) = v2;
      if (!v2)
        return (*(uint64_t (**)(uint64_t, _QWORD))(result + 8))(result, *(_QWORD *)result);
    }
  }
  return result;
}

uint64_t hd_inflate_read_len(uint64_t a1, _DWORD *a2, _BYTE *a3, _BYTE *a4, char a5, unint64_t a6)
{
  unsigned int v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;

  v6 = *(_DWORD *)(a1 + 184);
  v7 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = 0;
  *a2 = 0;
  v8 = a3;
  if (!v6)
  {
    v6 = ~(-1 << a5);
    v13 = v6 & *a3;
    if (v13 == v6)
    {
      v8 = a3 + 1;
      if (a3 + 1 != a4)
        goto LABEL_2;
      v12 = 1;
    }
    else
    {
      v12 = 1;
      *a2 = 1;
      v6 = v13;
    }
LABEL_17:
    if (v6 <= a6)
    {
      *(_QWORD *)(a1 + 184) = v6;
      return v12;
    }
    return -523;
  }
LABEL_2:
  if (v8 != a4)
  {
    v9 = -7 * (_QWORD)v8 + v7 - (_QWORD)a4 + 8 * (_QWORD)a4;
    while (v7 <= 0x1F)
    {
      v10 = *v8 & 0x7F;
      if (0xFFFFFFFF >> v7 < v10)
        break;
      v11 = v10 << v7;
      if (__CFADD__(v11, v6))
        break;
      v6 += v11;
      if (((char)*v8 & 0x80000000) == 0)
      {
        *(_QWORD *)(a1 + 216) = v7;
        *a2 = 1;
        a4 = v8 + 1;
        goto LABEL_11;
      }
      ++v8;
      v7 += 7;
      if (v8 == a4)
      {
        v7 = v9;
        goto LABEL_10;
      }
    }
    return -523;
  }
LABEL_10:
  *(_QWORD *)(a1 + 216) = v7;
LABEL_11:
  v12 = a4 - a3;
  if (a4 - a3 != -1)
    goto LABEL_17;
  return -523;
}

uint64_t nghttp2_rcbuf_new(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;
  uint64_t v9;

  v6 = (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 8))(a2 + 40, *(_QWORD *)a3);
  if (!v6)
    return 4294966395;
  v7 = (_QWORD *)v6;
  result = 0;
  *a1 = (uint64_t)v7;
  *v7 = *(_QWORD *)a3;
  *(_QWORD *)(*a1 + 8) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(*a1 + 16) = v7 + 5;
  v9 = *a1;
  *(_QWORD *)(v9 + 24) = a2;
  *(_DWORD *)(v9 + 32) = 1;
  return result;
}

void *default_malloc(size_t a1)
{
  return malloc_type_malloc(a1, 0x7693B7D9uLL);
}

uint64_t hd_inflate_read_huff(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  char *v13;
  int v14;
  char v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char v19;
  char *v20;
  BOOL v21;
  uint64_t v22;

  v4 = a4 - a3;
  v5 = *(_QWORD *)(a1 + 184);
  v6 = &a3[v5];
  if (a4 - a3 < v5)
    v6 = a4;
  v7 = *(unsigned __int16 *)(a1 + 64);
  v8 = v6 - a3;
  if (v8)
  {
    v9 = v8;
    do
    {
      v11 = *a3++;
      v10 = v11;
      v12 = (unint64_t)v11 >> 4;
      v13 = (char *)&huff_decode_table + 64 * (unint64_t)(v7 & 0x1FF);
      v14 = *(__int16 *)&v13[4 * v12];
      if (v14 < 0)
      {
        v15 = v13[4 * v12 + 2];
        v16 = *(char **)(a2 + 24);
        *(_QWORD *)(a2 + 24) = v16 + 1;
        *v16 = v15;
      }
      v17 = v10 & 0xF;
      v18 = (char *)&huff_decode_table + 64 * (unint64_t)(v14 & 0x1FF);
      v7 = *(__int16 *)&v18[4 * v17];
      if (v7 < 0)
      {
        v19 = v18[4 * v17 + 2];
        v20 = *(char **)(a2 + 24);
        *(_QWORD *)(a2 + 24) = v20 + 1;
        *v20 = v19;
      }
      v7 = (unsigned __int16)v7;
      --v9;
    }
    while (v9);
  }
  v21 = (v7 & 0x4000) == 0 && v4 >= v5;
  *(_WORD *)(a1 + 64) = v7;
  v22 = -523;
  if (!v21)
    v22 = v8;
  if ((v22 & 0x8000000000000000) == 0)
  {
    if (v7 == 256)
      return -523;
    else
      *(_QWORD *)(a1 + 184) -= v22;
  }
  return v22;
}

_QWORD *nghttp2_hd_table_get(_QWORD *result, _QWORD *a2, unint64_t a3)
{
  _QWORD *v3;
  char *v4;

  if (a2[3] + 61 <= a3)
    __assert_rtn("nghttp2_hd_table_get", "nghttp2_hd.c", 1303, "INDEX_RANGE_VALID(context, idx)");
  v3 = result;
  if (a3 < 0x3D)
  {
    v4 = (char *)&static_table + 128 * a3;
    *result = v4;
    result[1] = v4 + 40;
    result[2] = 0;
    *((_DWORD *)result + 4) = *((_DWORD *)v4 + 30);
  }
  else
  {
    result = (_QWORD *)hd_ringbuf_get(a2, a3 - 61);
    *(_OWORD *)v3 = *(_OWORD *)result;
    v3[2] = result[2];
  }
  return result;
}

uint64_t emit_string(uint64_t a1, char *a2, unint64_t a3)
{
  char *v4;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;
  char v18;
  _BYTE *v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  char __src;
  _BYTE v29[23];

  v4 = a2;
  *(_QWORD *)&v29[15] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = 0;
    v7 = a2;
    v8 = a3;
    do
    {
      v9 = *v7++;
      v6 += huff_sym_table[2 * v9];
      --v8;
    }
    while (v8);
    v10 = (unint64_t)(v6 + 7) >> 3;
  }
  else
  {
    v10 = 0;
  }
  if (v10 >= a3)
    v11 = a3;
  else
    v11 = v10;
  if (v11 > 0x7E)
  {
    v13 = v11 - 127;
    if (v13 < 0x80)
    {
      if (v10 < a3)
        v18 = -1;
      else
        v18 = 127;
      __src = v18;
      v19 = v29;
      v12 = 2;
    }
    else
    {
      v14 = 0;
      v15 = v13;
      do
      {
        v16 = v15 >> 14;
        v15 >>= 7;
        ++v14;
      }
      while (v16);
      if (v14 > 0xE)
        return 4294966773;
      if (v10 < a3)
        v20 = -1;
      else
        v20 = 127;
      __src = v20;
      v19 = v29;
      do
      {
        *v19++ = v13 | 0x80;
        v21 = v13 >> 14;
        v13 >>= 7;
      }
      while (v21);
      v12 = v14 + 2;
    }
    *v19 = v13;
  }
  else
  {
    __src = v11 | ((v10 < a3) << 7);
    v12 = 1;
  }
  result = nghttp2_bufs_add(a1, &__src, v12);
  if (!(_DWORD)result)
  {
    if (v10 >= a3)
      return nghttp2_bufs_add(a1, v4, a3);
    v22 = 0;
    v23 = 0;
    v24 = &v4[a3];
    v25 = *(_QWORD *)(a1 + 8);
    v26 = *(_QWORD *)(v25 + 16) - *(_QWORD *)(v25 + 32);
    while (1)
    {
      v27 = *v4++;
      v23 |= (unint64_t)huff_sym_table[2 * v27 + 1] << (32 - v22);
      v22 += huff_sym_table[2 * v27];
      if (v22 >= 0x20)
      {
        if (v26 <= 3)
        {
          while (1)
          {
            result = nghttp2_bufs_addb(a1, SHIBYTE(v23));
            if ((_DWORD)result)
              return result;
            v23 <<= 8;
            v22 -= 8;
            if (v22 <= 7)
            {
              v25 = *(_QWORD *)(a1 + 8);
              v26 = *(_QWORD *)(v25 + 16) - *(_QWORD *)(v25 + 32);
              goto LABEL_37;
            }
          }
        }
        **(_DWORD **)(v25 + 32) = bswap32(HIDWORD(v23));
        v25 = *(_QWORD *)(a1 + 8);
        *(_QWORD *)(v25 + 32) += 4;
        v26 -= 4;
        v23 <<= 32;
        v22 -= 32;
      }
LABEL_37:
      if (v4 == v24)
      {
        if (v22 < 8)
        {
LABEL_41:
          if (!v22)
            return 0;
          result = nghttp2_bufs_addb(a1, HIBYTE(v23) | ~(-1 << (8 - v22)));
          if (!(_DWORD)result)
            return 0;
        }
        else
        {
          while (1)
          {
            result = nghttp2_bufs_addb(a1, SHIBYTE(v23));
            if ((_DWORD)result)
              break;
            v23 <<= 8;
            v22 -= 8;
            if (v22 <= 7)
              goto LABEL_41;
          }
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t nghttp2_bufs_addb(uint64_t a1, char a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_BYTE **)(v3 + 32);
  if (*(_BYTE **)(v3 + 16) != v4)
    goto LABEL_2;
  result = bufs_alloc_chain(a1);
  if (!(_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 8);
    v4 = *(_BYTE **)(v3 + 32);
LABEL_2:
    result = 0;
    *(_QWORD *)(v3 + 32) = v4 + 1;
    *v4 = a2;
  }
  return result;
}

uint64_t add_hd_table_incremental(uint64_t *a1, _QWORD *a2, uint64_t a3, int a4)
{
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t **v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;

  v8 = *(_QWORD *)(*a2 + 24) + *(_QWORD *)(a2[1] + 24) + 32;
  v9 = (_QWORD *)a1[4];
  v10 = a1[5] + v8;
  v11 = a1[6];
  while (v10 > v11)
  {
    v12 = a1[3];
    if (!v12)
      break;
    v13 = (uint64_t *)hd_ringbuf_get(a1, v12 - 1);
    v14 = v13[1];
    a1[5] = a1[5] - (*(_QWORD *)(*v13 + 24) + *(_QWORD *)(v14 + 24)) - 32;
    v15 = a1[3];
    if (!v15)
      __assert_rtn("hd_ringbuf_pop_back", "nghttp2_hd.c", 670, "ringbuf->len > 0");
    a1[3] = v15 - 1;
    if (a3)
    {
      v16 = (uint64_t **)(a3 + 8 * (*((_DWORD *)v13 + 19) & 0x7F));
      v17 = *v16;
      if (*v16)
      {
        if (v17 == v13)
        {
LABEL_11:
          *v16 = (uint64_t *)v13[8];
          v13[8] = 0;
          v14 = v13[1];
        }
        else
        {
          while (1)
          {
            v18 = v17;
            v17 = (uint64_t *)v17[8];
            if (!v17)
              break;
            if (v17 == v13)
            {
              v16 = (uint64_t **)(v18 + 8);
              goto LABEL_11;
            }
          }
        }
      }
    }
    nghttp2_rcbuf_decref(v14);
    nghttp2_rcbuf_decref(*v13);
    ((void (*)(uint64_t *, _QWORD))v9[2])(v13, *v9);
    v11 = a1[6];
    v10 = a1[5] + v8;
  }
  if (v8 > v11)
    return 0;
  v20 = ((uint64_t (*)(uint64_t, _QWORD))v9[1])(80, *v9);
  if (!v20)
    return 4294966395;
  v21 = v20;
  v22 = *(_OWORD *)a2;
  *(_QWORD *)(v20 + 16) = a2[2];
  *(_OWORD *)v20 = v22;
  v23 = a2[1];
  v24 = *(_QWORD *)(*a2 + 24);
  v26 = *(_QWORD *)(v23 + 16);
  v25 = *(_QWORD *)(v23 + 24);
  *(_QWORD *)(v20 + 24) = *(_QWORD *)(*a2 + 16);
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v24;
  *(_QWORD *)(v20 + 48) = v25;
  *(_BYTE *)(v20 + 56) = *((_BYTE *)a2 + 20);
  *(_QWORD *)(v20 + 64) = 0;
  *(_DWORD *)(v20 + 76) = 0;
  v27 = *(_DWORD *)(*(_QWORD *)v20 + 32);
  if (v27 != -1)
    *(_DWORD *)(*(_QWORD *)v20 + 32) = v27 + 1;
  v28 = *(_QWORD *)(v20 + 8);
  v29 = *(_DWORD *)(v28 + 32);
  if (v29 != -1)
    *(_DWORD *)(v28 + 32) = v29 + 1;
  v30 = a1[3] + 1;
  v31 = a1[1];
  if (v31 + 1 < v30)
  {
    v32 = 1;
    do
    {
      v33 = v32;
      v32 *= 2;
    }
    while (v33 < v30);
    v34 = ((uint64_t (*)(unint64_t, _QWORD))v9[1])(8 * v33, *v9);
    if (v34)
    {
      v35 = v34;
      if (a1[3])
      {
        v36 = 0;
        do
        {
          *(_QWORD *)(v35 + 8 * v36) = hd_ringbuf_get(a1, v36);
          ++v36;
        }
        while (v36 < a1[3]);
      }
      ((void (*)(uint64_t, _QWORD))v9[2])(*a1, *v9);
      v31 = v33 - 1;
      *a1 = v35;
      a1[1] = v33 - 1;
      v30 = a1[3] + 1;
      v37 = -1;
      goto LABEL_29;
    }
    nghttp2_rcbuf_decref(*(_QWORD *)(v21 + 8));
    nghttp2_rcbuf_decref(*(_QWORD *)v21);
    ((void (*)(uint64_t, _QWORD))v9[2])(v21, *v9);
    return 4294966395;
  }
  v35 = *a1;
  v37 = a1[2] - 1;
LABEL_29:
  *(_QWORD *)(v35 + 8 * (v37 & v31)) = v21;
  a1[2] = v37;
  a1[3] = v30;
  v38 = *((_DWORD *)a1 + 14);
  *((_DWORD *)a1 + 14) = v38 + 1;
  *(_DWORD *)(v21 + 72) = v38;
  *(_DWORD *)(v21 + 76) = a4;
  if (a3)
  {
    v39 = *(_QWORD *)(a3 + 8 * (a4 & 0x7F));
    if (v39)
      *(_QWORD *)(v21 + 64) = v39;
    *(_QWORD *)(a3 + 8 * (a4 & 0x7F)) = v21;
  }
  result = 0;
  a1[5] += v8;
  return result;
}

double hd_inflate_commit_newname(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  double result;
  __int128 v9;
  uint64_t v10;

  v4 = a1 + 152;
  v5 = *(_QWORD *)(a1 + 152);
  v6 = *(_BYTE *)(a1 + 234) != 0;
  v10 = 0;
  BYTE4(v10) = v6;
  v7 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)&v9 = v5;
  *((_QWORD *)&v9 + 1) = v7;
  LODWORD(v10) = lookup_token(*(_BYTE **)(v5 + 16), *(_QWORD *)(v5 + 24));
  if (!*(_BYTE *)(v4 + 81) || !add_hd_table_incremental((uint64_t *)a1, &v9, 0, 0))
  {
    result = *(double *)&v9;
    *(_OWORD *)a2 = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_QWORD *)(a1 + 168) = v5;
    *(_QWORD *)(a1 + 176) = v7;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
  }
  return result;
}

double hd_inflate_commit_indname(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  double result;
  __int128 v8;
  uint64_t v9;

  nghttp2_hd_table_get(&v8, (_QWORD *)a1, *(_QWORD *)(a1 + 192));
  BYTE4(v9) = *(_BYTE *)(a1 + 234) != 0;
  v4 = v8;
  v5 = *(_DWORD *)(v8 + 32);
  if (v5 != -1)
    *(_DWORD *)(v8 + 32) = v5 + 1;
  v6 = *(_QWORD *)(a1 + 160);
  *((_QWORD *)&v8 + 1) = v6;
  if (*(_BYTE *)(a1 + 233) && add_hd_table_incremental((uint64_t *)a1, &v8, 0, 0))
  {
    nghttp2_rcbuf_decref(v4);
  }
  else
  {
    result = *(double *)&v8;
    *(_OWORD *)a2 = v8;
    *(_QWORD *)(a2 + 16) = v9;
    *(_QWORD *)(a1 + 168) = v4;
    *(_QWORD *)(a1 + 176) = v6;
    *(_QWORD *)(a1 + 160) = 0;
  }
  return result;
}

uint64_t hd_ringbuf_get(_QWORD *a1, unint64_t a2)
{
  if (a1[3] <= a2)
    __assert_rtn("hd_ringbuf_get", "nghttp2_hd.c", 610, "idx < ringbuf->len");
  return *(_QWORD *)(*a1 + 8 * ((a1[2] + a2) & a1[1]));
}

uint64_t nghttp2_nv_array_copy(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  size_t v18;
  uint64_t *v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  size_t v26;
  uint64_t *v27;
  size_t v28;
  uint64_t v29;
  uint64_t result;

  if (a3)
  {
    v7 = 0;
    v8 = (_BYTE *)(a2 + 32);
    v9 = a3;
    do
    {
      if ((*v8 & 2) == 0)
        v7 += *((_QWORD *)v8 - 2) + 1;
      if ((*v8 & 4) == 0)
        v7 += *((_QWORD *)v8 - 1) + 1;
      v8 += 40;
      --v9;
    }
    while (v9);
    v10 = (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 8))(v7 + 40 * a3, *(_QWORD *)a4);
    *a1 = v10;
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = (char *)(v10 + 40 * a3);
      while (1)
      {
        v14 = a2 + 40 * v12;
        v15 = (_BYTE *)(v14 + 32);
        *(_BYTE *)(v11 + 32) = *(_BYTE *)(v14 + 32);
        v16 = *(_BYTE *)(v14 + 32);
        if ((v16 & 2) != 0)
        {
          *(_QWORD *)v11 = *(_QWORD *)v14;
          *(_QWORD *)(v11 + 16) = *(_QWORD *)(a2 + 40 * v12 + 16);
          if ((v16 & 4) == 0)
            goto LABEL_20;
        }
        else
        {
          v17 = a2 + 40 * v12;
          v20 = *(_QWORD *)(v17 + 16);
          v19 = (uint64_t *)(v17 + 16);
          v18 = v20;
          if (v20)
          {
            memcpy(v13, *(const void **)v14, v18);
            v21 = *v19;
          }
          else
          {
            v21 = 0;
          }
          *(_QWORD *)v11 = v13;
          *(_QWORD *)(v11 + 16) = v21;
          v13[v21] = 0;
          v23 = *(_QWORD *)(v11 + 16);
          if (v23)
          {
            v24 = *(_BYTE **)v11;
            do
            {
              *v24 = DOWNCASE_TBL[*v24];
              ++v24;
              --v23;
            }
            while (v23);
          }
          v13 += *v19 + 1;
          if ((*v15 & 4) == 0)
          {
LABEL_20:
            v25 = a2 + 40 * v12;
            v28 = *(_QWORD *)(v25 + 24);
            v27 = (uint64_t *)(v25 + 24);
            v26 = v28;
            if (v28)
            {
              memcpy(v13, *(const void **)(a2 + 40 * v12 + 8), v26);
              v29 = *v27;
            }
            else
            {
              v29 = 0;
            }
            *(_QWORD *)(v11 + 8) = v13;
            *(_QWORD *)(v11 + 24) = v29;
            v13[v29] = 0;
            v13 += *v27 + 1;
            goto LABEL_24;
          }
        }
        v22 = a2 + 40 * v12;
        *(_QWORD *)(v11 + 8) = *(_QWORD *)(v22 + 8);
        *(_QWORD *)(v11 + 24) = *(_QWORD *)(v22 + 24);
LABEL_24:
        v11 += 40;
        if (++v12 == a3)
          return 0;
      }
    }
    return 4294966395;
  }
  else
  {
    result = 0;
    *a1 = 0;
  }
  return result;
}

void *default_calloc(size_t a1, size_t a2)
{
  return malloc_type_calloc(a1, a2, 0x17A2610EuLL);
}

uint64_t nghttp2_iv_check(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;

  if (a2)
  {
    v2 = (_DWORD *)(a1 + 4);
    while (2)
    {
      switch(*(v2 - 1))
      {
        case 2:
        case 8:
          if (*v2 < 2u)
            goto LABEL_11;
          return 0;
        case 4:
          if ((*v2 & 0x80000000) != 0)
            return 0;
          goto LABEL_11;
        case 5:
          if ((*v2 - 0x1000000) < 0xFF004000)
            return 0;
          goto LABEL_11;
        case 9:
          if (*v2 <= 1u)
            goto LABEL_11;
          return 0;
        default:
LABEL_11:
          v2 += 2;
          if (!--a2)
            return 1;
          continue;
      }
    }
  }
  return 1;
}

uint64_t nghttp2_hd_inflate_init(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  *(_QWORD *)(a1 + 32) = a2;
  *(_BYTE *)(a1 + 60) = 0;
  *(_QWORD *)(a1 + 48) = 4096;
  v3 = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 8))(1024, *(_QWORD *)a2);
  *(_QWORD *)a1 = v3;
  if (!v3)
    return 4294966395;
  result = 0;
  *(_OWORD *)(a1 + 200) = xmmword_1DF25D850;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 127;
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 224) = 0x100000000;
  *(_BYTE *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_WORD *)(a1 + 233) = 0;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  return result;
}

uint64_t nghttp2_hd_deflate_init2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char v6;
  uint64_t result;

  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 60) = 0;
  *(_QWORD *)(a1 + 48) = 4096;
  v5 = (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 8))(1024, *(_QWORD *)a3);
  *(_QWORD *)a1 = v5;
  if (!v5)
    return 4294966395;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 127;
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  bzero((void *)(a1 + 64), 0x400uLL);
  v6 = 0;
  if (a2 <= 0xFFF)
  {
    *(_QWORD *)(a1 + 48) = a2;
    v6 = 1;
  }
  result = 0;
  *(_BYTE *)(a1 + 1104) = v6;
  *(_QWORD *)(a1 + 1088) = a2;
  *(_QWORD *)(a1 + 1096) = 0xFFFFFFFFLL;
  return result;
}

uint64_t buf_chain_new(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v6 = (_QWORD *)((uint64_t (*)(uint64_t, _QWORD))a3[1])(48, *a3);
  *a1 = v6;
  if (v6)
  {
    *v6 = 0;
    v7 = *a1;
    *(_QWORD *)(v7 + 40) = 0;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 8) = 0u;
    if (!a2)
      return 0;
    v8 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD))a3[4])(0, a2, *a3);
    if (v8)
    {
      v9 = v8;
      result = 0;
      v11 = *(_QWORD *)(v7 + 8);
      v12 = v9 + *(_QWORD *)(v7 + 32) - v11;
      *(_QWORD *)(v7 + 24) = v9 + *(_QWORD *)(v7 + 24) - v11;
      *(_QWORD *)(v7 + 32) = v12;
      *(_QWORD *)(v7 + 40) = v9 + *(_QWORD *)(v7 + 40) - v11;
      *(_QWORD *)(v7 + 8) = v9;
      *(_QWORD *)(v7 + 16) = v9 + a2;
      return result;
    }
    ((void (*)(_QWORD, _QWORD))a3[2])(*a1, *a3);
  }
  return 4294966395;
}

void *default_realloc(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x89B77B64uLL);
}

uint64_t emit_table_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE *v8;
  unint64_t v9;
  char __src;
  _BYTE v11[23];

  *(_QWORD *)&v11[15] = *MEMORY[0x1E0C80C00];
  if (a2 > 0x1E)
  {
    v3 = a2 - 31;
    if (a2 - 31 < 0x80)
    {
      __src = 63;
      v8 = v11;
      v2 = 2;
    }
    else
    {
      v4 = 0;
      v5 = a2 - 31;
      do
      {
        v6 = v5 >> 14;
        v5 >>= 7;
        ++v4;
      }
      while (v6);
      if (v4 > 0xE)
        return 4294966773;
      __src = 63;
      v8 = v11;
      do
      {
        *v8++ = v3 | 0x80;
        v9 = v3 >> 14;
        v3 >>= 7;
      }
      while (v9);
      v2 = v4 + 2;
    }
    *v8 = v3;
  }
  else
  {
    __src = a2 | 0x20;
    v2 = 1;
  }
  return nghttp2_bufs_add(a1, &__src, v2);
}

uint64_t session_ob_data_push(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t result;

  if ((*(_BYTE *)(a2 + 216) & 0x10) == 0)
    __assert_rtn("session_ob_data_push", "nghttp2_session.c", 952, "stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES");
  if (*(_BYTE *)(a2 + 218))
    __assert_rtn("session_ob_data_push", "nghttp2_session.c", 953, "stream->queued == 0");
  v3 = *(_BYTE *)(a2 + 220);
  if ((v3 & 0x7Fu) >= 8)
    __assert_rtn("session_ob_data_push", "nghttp2_session.c", 958, "urgency < NGHTTP2_EXTPRI_URGENCY_LEVELS");
  v4 = a1 + 40 * (*(_BYTE *)(a2 + 220) & 0x7F);
  v5 = (uint64_t *)(v4 + 328);
  v6 = *(_QWORD *)(v4 + 344);
  if (v6)
    v6 = *(_QWORD *)(*(_QWORD *)*v5 + 72);
  *(_QWORD *)(a2 + 72) = v6;
  if (v3 < 0)
    *(_QWORD *)(a2 + 72) = *(_QWORD *)(a2 + 160) + v6;
  result = nghttp2_pq_push(v5, (unint64_t *)a2);
  if (!(_DWORD)result)
    *(_BYTE *)(a2 + 218) = 1;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_frame_recv_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_rfc9113_leading_and_trailing_ws_validation(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x4000u;
  *(_DWORD *)(result + 100) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_auto_window_update(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 1u;
  *(_DWORD *)(result + 72) = a2;
  return result;
}

uint64_t nghttp2_priority_spec_init(uint64_t result, int a2, int a3, int a4)
{
  *(_DWORD *)result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(_BYTE *)(result + 8) = a4 != 0;
  return result;
}

uint64_t nghttp2_session_set_next_stream_id(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2 >= 1 && *(_DWORD *)(a1 + 2800) <= a2)
  {
    if (*(_BYTE *)(a1 + 2932))
    {
      if ((a2 & 1) == 0)
      {
LABEL_5:
        result = 0;
        *(_DWORD *)(a1 + 2800) = a2;
        return result;
      }
    }
    else if ((a2 & 1) != 0)
    {
      goto LABEL_5;
    }
  }
  return 4294966795;
}

uint64_t session_process_ping_frame(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned int (*v4)(uint64_t, uint64_t, _QWORD);

  v2 = a1 + 728;
  *(_QWORD *)(a1 + 744) = **(_QWORD **)(a1 + 848);
  if (*(_DWORD *)(a1 + 736))
    return session_handle_invalid_connection(a1, a1 + 728, 4294966791, "PING: stream_id != 0");
  if ((*(_BYTE *)(a1 + 2916) & 8) != 0
    || (*(_BYTE *)(a1 + 741) & 1) != 0
    || session_is_closing(a1)
    || (result = nghttp2_session_add_ping(a1, 1, (uint64_t *)(a1 + 744)), !(_DWORD)result))
  {
    v4 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a1 + 2376);
    if (v4 && v4(a1, v2, *(_QWORD *)(a1 + 2608)))
      return 4294966394;
    else
      return 0;
  }
  return result;
}

uint64_t nghttp2_session_predicate_data_send(uint64_t a1, uint64_t a2)
{
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;

  if (!a2)
    return 4294966786;
  if (session_is_closing(a1))
    return 4294966766;
  if ((*(_BYTE *)(a2 + 217) & 2) != 0)
    return 4294966784;
  v5 = *(_DWORD *)(a2 + 168);
  if (v5 && ((v5 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) == 0)
  {
    v8 = *(_DWORD *)(a2 + 204);
    if (v8 == 4)
      v9 = -514;
    else
      v9 = 0;
    if (v8 == 3)
      return 4294966785;
    else
      return v9;
  }
  else
  {
    v6 = *(_DWORD *)(a2 + 204);
    if (v6 == 3)
      v7 = -511;
    else
      v7 = -514;
    if (v6 == 2)
      return 0;
    else
      return v7;
  }
}

BOOL session_is_closing(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 2933) & 1) != 0)
    return 1;
  if ((*(_BYTE *)(a1 + 2933) & 2) == 0
    && (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a1 + 2736) + *(_QWORD *)(a1 + 2728) || (*(_BYTE *)(a1 + 2933) & 0xC) == 0))
  {
    return 0;
  }
  return !nghttp2_session_want_write(a1);
}

uint64_t nghttp2_session_set_stream_user_data(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  _QWORD *v10;

  v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (v6 && (*(_BYTE *)(v6 + 216) & 2) == 0 && *(_DWORD *)(v6 + 204) != 5)
  {
    v10 = (_QWORD *)(v6 + 144);
LABEL_14:
    result = 0;
    *v10 = a3;
    return result;
  }
  result = 4294966795;
  if ((a2 & 1) != 0 && !*(_BYTE *)(a1 + 2932))
  {
    v8 = *(_QWORD *)(a1 + 304);
    if (v8)
    {
      if (*(_BYTE *)(v8 + 12) != 1)
        __assert_rtn("nghttp2_session_set_stream_user_data", "nghttp2_session.c", 7910, "frame->hd.type == NGHTTP2_HEADERS");
      if (*(_DWORD *)(v8 + 8) <= a2 && *(_DWORD *)(a1 + 2800) > a2)
      {
        while (1)
        {
          v9 = *(_DWORD *)(v8 + 8);
          if (v9 >= a2)
            break;
          v8 = *(_QWORD *)(v8 + 144);
          if (!v8)
            return 4294966795;
        }
        if (v9 > a2)
          return 4294966795;
        v10 = (_QWORD *)(v8 + 120);
        goto LABEL_14;
      }
    }
  }
  return result;
}

uint64_t nghttp2_session_get_stream_remote_window_size(uint64_t *a1, int a2)
{
  uint64_t v2;

  v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(_BYTE *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5)
    return 0xFFFFFFFFLL;
  else
    return *(_DWORD *)(v2 + 172) & ~(*(int *)(v2 + 172) >> 31);
}

void session_close_stream_on_goaway(uint64_t a1, int a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v8 = a1;
  v9 = 0;
  v10 = a2;
  v11 = a3;
  if (nghttp2_map_each(a1, find_stream_on_goaway_func, (uint64_t)&v8))
    __assert_rtn("session_close_stream_on_goaway", "nghttp2_session.c", 2838, "rv == 0");
  v4 = v9;
  while (v4)
  {
    v5 = *(_QWORD *)(v4 + 136);
    *(_QWORD *)(v4 + 136) = 0;
    nghttp2_session_close_stream(a1, *(unsigned int *)(v4 + 168), 7);
    v4 = v5;
    if (v6 <= -901)
    {
      if (v5)
      {
        do
        {
          v7 = *(_QWORD *)(v5 + 136);
          *(_QWORD *)(v5 + 136) = 0;
          v5 = v7;
        }
        while (v7);
      }
      return;
    }
  }
}

uint64_t nghttp2_session_consume_stream(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  if (!a2)
    return 4294966795;
  if ((*(_BYTE *)(a1 + 2916) & 1) == 0)
    return 4294966777;
  result = nghttp2_map_find((uint64_t *)a1, a2);
  if (result)
  {
    if ((*(_BYTE *)(result + 216) & 2) != 0 || *(_DWORD *)(result + 204) == 5)
    {
      return 0;
    }
    else
    {
      LODWORD(result) = session_update_consumed_size(a1, (int *)(result + 180), (_DWORD *)(result + 176), *(unsigned __int8 *)(result + 219), *(_DWORD *)(result + 168), a3, *(_DWORD *)(result + 188));
      if ((int)result <= -901)
        return result;
      else
        return 0;
    }
  }
  return result;
}

uint64_t nghttp2_session_consume(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  if (!a2)
    return 4294966795;
  if ((*(_BYTE *)(a1 + 2916) & 1) == 0)
    return 4294966777;
  result = session_update_consumed_size(a1, (int *)(a1 + 2836), (_DWORD *)(a1 + 2832), *(unsigned __int8 *)(a1 + 2934), 0, a3, *(_DWORD *)(a1 + 2844));
  if ((int)result >= -900)
  {
    result = nghttp2_map_find((uint64_t *)a1, a2);
    if (result)
    {
      if ((*(_BYTE *)(result + 216) & 2) != 0 || *(_DWORD *)(result + 204) == 5)
      {
        return 0;
      }
      else
      {
        LODWORD(result) = session_update_consumed_size(a1, (int *)(result + 180), (_DWORD *)(result + 176), *(unsigned __int8 *)(result + 219), *(_DWORD *)(result + 168), a3, *(_DWORD *)(result + 188));
        if ((int)result <= -901)
          return result;
        else
          return 0;
      }
    }
  }
  return result;
}

uint64_t nghttp2_map_each(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  unint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (*(_QWORD *)(a1 + 16))
  {
    v4 = *(unsigned int *)(a1 + 24);
    if ((_DWORD)v4)
    {
      v7 = 0;
      v8 = 8;
      do
      {
        v9 = *(_QWORD *)(*(_QWORD *)a1 + v8);
        if (v9)
        {
          result = a2(v9, a3);
          if ((_DWORD)result)
            return result;
          v4 = *(unsigned int *)(a1 + 24);
        }
        ++v7;
        v8 += 16;
      }
      while (v7 < v4);
    }
  }
  return 0;
}

uint64_t nghttp2_session_consume_connection(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((*(_BYTE *)(a1 + 2916) & 1) == 0)
    return 4294966777;
  LODWORD(result) = session_update_consumed_size(a1, (int *)(a1 + 2836), (_DWORD *)(a1 + 2832), *(unsigned __int8 *)(a1 + 2934), 0, a2, *(_DWORD *)(a1 + 2844));
  if ((int)result <= -901)
    return result;
  else
    return 0;
}

uint64_t session_update_consumed_size(uint64_t a1, int *a2, _DWORD *a3, int a4, int a5, uint64_t a6, int a7)
{
  unint64_t v7;
  uint64_t result;
  int v10;
  int v12;
  int v13;
  int v14;

  v7 = *a2;
  if (0x7FFFFFFF - a6 < v7)
    return session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 3, 0);
  v10 = v7 + a6;
  *a2 = v10;
  if (a4)
    return 0;
  v12 = v10 >= *a3 ? *a3 : v10;
  v13 = a7 >= 0 ? a7 : a7 + 1;
  v14 = v13 >> 1;
  if (v12 < 1 || v14 > v12)
    return 0;
  result = nghttp2_session_add_window_update(a1, a5, v12);
  if (!(_DWORD)result)
  {
    *a3 -= v12;
    *a2 -= v12;
  }
  return result;
}

uint64_t update_local_initial_window_size_func(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  int v9;
  int v10;

  v3 = *(int *)(a1 + 188);
  v4 = *(int *)(a2 + 8) - (uint64_t)*(int *)(a2 + 12);
  v5 = v4 + v3;
  if (v4 + v3 != (_DWORD)v4 + (_DWORD)v3)
    return nghttp2_session_add_rst_stream(*(_QWORD *)a2, *(_DWORD *)(a1 + 168), 3);
  *(_DWORD *)(a1 + 188) = v5;
  if (*(_BYTE *)(a1 + 219))
    return 0;
  v7 = *(_QWORD *)a2;
  if ((*(_BYTE *)(*(_QWORD *)a2 + 2916) & 1) != 0)
    return session_update_consumed_size(v7, (int *)(a1 + 180), (_DWORD *)(a1 + 176), 0, *(_DWORD *)(a1 + 168), 0, v5);
  v8 = *(_DWORD *)(a1 + 176);
  v9 = v5 >= 0 ? v4 + v3 : v5 + 1;
  v10 = v9 >> 1;
  if (v8 < 1 || v10 > v8)
    return 0;
  result = nghttp2_session_add_window_update(v7, *(_DWORD *)(a1 + 168), v8);
  if (!(_DWORD)result)
    *(_DWORD *)(a1 + 176) = 0;
  return result;
}

uint64_t update_remote_initial_window_size_func(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(int *)(a2 + 8) - (uint64_t)*(int *)(a2 + 12) + *(int *)(a1 + 172);
  if (v2 != (int)v2)
    return nghttp2_session_add_rst_stream(*(_QWORD *)a2, *(_DWORD *)(a1 + 168), 3);
  *(_DWORD *)(a1 + 172) = v2;
  if ((int)v2 < 1)
    return 0;
  if (!*(_QWORD *)(a1 + 152))
    return 0;
  if ((*(_BYTE *)(a1 + 216) & 4) == 0)
    return 0;
  result = session_resume_deferred_stream_item(*(_QWORD *)a2, a1, 4);
  if ((int)result >= -900)
    return 0;
  return result;
}

uint64_t nghttp2_submit_request(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6)
{
  uint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  if (a5)
  {
    LODWORD(v7) = 1;
    v8 = *a5;
    a5 = (__int128 *)&v7;
  }
  return submit_request_shared(a1, a2, a3, a4, (uint64_t)a5, a6);
}

uint64_t nghttp2_session_get_stream_user_data(uint64_t *a1, int a2)
{
  uint64_t result;

  result = nghttp2_map_find(a1, a2);
  if (result)
  {
    if ((*(_BYTE *)(result + 216) & 2) != 0 || *(_DWORD *)(result + 204) == 5)
      return 0;
    else
      return *(_QWORD *)(result + 144);
  }
  return result;
}

uint64_t nghttp2_map_find(uint64_t *a1, int a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v7;
  int v8;
  uint64_t v9;

  if (!a1[2])
    return 0;
  v3 = *((_DWORD *)a1 + 7);
  v4 = (-1640531527 * a2) >> -(char)v3;
  v5 = *a1;
  result = *(_QWORD *)(*a1 + 16 * v4 + 8);
  if (result)
  {
    v7 = 32 - v3;
    v8 = *((_DWORD *)a1 + 6) - 1;
    v9 = -1;
    while (*(_DWORD *)(v5 + 16 * v4 + 4) != a2)
    {
      v4 = ((_DWORD)v4 + 1) & v8;
      result = *(_QWORD *)(v5 + 16 * v4 + 8);
      if (!result)
        break;
      if (++v9 >= (unint64_t)(((_DWORD)v4 - (*(_DWORD *)(v5 + 16 * v4) >> v7)) & v8))
        return 0;
    }
  }
  return result;
}

uint64_t nghttp2_session_mem_send_internal(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int *v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  uint64_t (*v63)(uint64_t);
  _QWORD *v64;
  _QWORD *v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t, _QWORD);
  int v74;
  unsigned int (*v75)(uint64_t, uint64_t, uint64_t, _QWORD);
  int v76;
  unsigned int *v77;
  uint64_t v78;
  uint64_t i;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t *v84;
  uint64_t v85;
  _WORD *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  int v104;
  unsigned int (*v105)(uint64_t, uint64_t, uint64_t, _QWORD);
  int v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  int v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t *v114;

  nghttp2_session_adjust_idle_stream(a1);
  if ((int)result < -900)
    return (int)result;
  v114 = (uint64_t *)(a1 + 656);
  v113 = a1 + 992;
  while (2)
  {
    switch(*(_DWORD *)(a1 + 720))
    {
      case 0:
        v7 = *(_QWORD *)(a1 + 256);
        if (v7)
        {
          v8 = *(_QWORD *)(v7 + 144);
          *(_QWORD *)(a1 + 256) = v8;
          *(_QWORD *)(v7 + 144) = 0;
          v9 = (_QWORD *)(a1 + 272);
          v10 = (_QWORD *)(a1 + 264);
          if (v8)
          {
LABEL_7:
            --*v9;
            *(_BYTE *)(v7 + 152) = 0;
            goto LABEL_8;
          }
LABEL_6:
          *v10 = 0;
          goto LABEL_7;
        }
        v7 = *(_QWORD *)(a1 + 280);
        if (v7)
        {
          v23 = *(_QWORD *)(v7 + 144);
          *(_QWORD *)(a1 + 280) = v23;
          *(_QWORD *)(v7 + 144) = 0;
          v9 = (_QWORD *)(a1 + 296);
          v10 = (_QWORD *)(a1 + 288);
          if (v23)
            goto LABEL_7;
          goto LABEL_6;
        }
        if (*(_QWORD *)(a1 + 2696) < (unint64_t)*(unsigned int *)(a1 + 2860))
        {
          v7 = *(_QWORD *)(a1 + 304);
          if (v7)
          {
            v24 = *(_QWORD *)(v7 + 144);
            *(_QWORD *)(a1 + 304) = v24;
            *(_QWORD *)(v7 + 144) = 0;
            v9 = (_QWORD *)(a1 + 320);
            v10 = (_QWORD *)(a1 + 312);
            if (v24)
              goto LABEL_7;
            goto LABEL_6;
          }
        }
        if (*(int *)(a1 + 2828) < 1)
          return 0;
        v25 = a1 + 32;
        do
        {
          v7 = *(_QWORD *)(v25 + 152);
          if (v7 && (*(_BYTE *)(v25 + 216) & 0xC) == 0)
          {
            for (i = *(_QWORD *)(v25 + 96); i; i = *(_QWORD *)(i + 96))
            {
              *(_QWORD *)(i + 64) = *(_QWORD *)(v25 + 72);
              v25 = i;
            }
            goto LABEL_8;
          }
          if (!*(_QWORD *)(v25 + 24))
            break;
          v25 = **(_QWORD **)(v25 + 8);
        }
        while (v25);
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)(a1 + v26 + 344))
          {
            v27 = **(_QWORD **)(a1 + v26 + 328);
            if (v27)
              break;
          }
          v26 += 40;
          if (v26 == 320)
            return 0;
        }
        v7 = *(_QWORD *)(v27 + 152);
        if (v7)
        {
LABEL_8:
          v11 = *(unsigned __int8 *)(v7 + 12);
          switch(*(_BYTE *)(v7 + 12))
          {
            case 0:
              v12 = *(_DWORD *)(v7 + 8);
              v13 = nghttp2_map_find((uint64_t *)a1, v12);
              if (!v13 || (v14 = v13, (*(_BYTE *)(v13 + 216) & 2) != 0) || *(_DWORD *)(v13 + 204) == 5)
              {
                v15 = 4294966786;
LABEL_13:
                v14 = nghttp2_map_find((uint64_t *)a1, v12);
                if (!v14)
                  goto LABEL_248;
LABEL_14:
                session_detach_stream_item(a1, v14);
                goto LABEL_248;
              }
              if (*(_QWORD *)(v13 + 152) != v7)
                __assert_rtn("session_prep_frame", "nghttp2_session.c", 2367, "stream->item == item");
              v15 = nghttp2_session_predicate_data_send(a1, v13);
              if ((_DWORD)v15)
                goto LABEL_13;
              v93 = *(_DWORD *)(v14 + 172);
              v94 = *(_DWORD *)(a1 + 2828);
              if (v93 >= v94)
                v93 = *(_DWORD *)(a1 + 2828);
              if (v93 >= *(_DWORD *)(a1 + 2868))
                v93 = *(_DWORD *)(a1 + 2868);
              if (v93 >= 0x4000)
                v95 = 0x4000;
              else
                v95 = v93;
              if ((int)v95 <= 0)
              {
                if (v94 <= 0)
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2390, "session->remote_window_size > 0");
                session_defer_stream_item(a1, v14, 4);
                *(_QWORD *)(a1 + 648) = 0;
                goto LABEL_27;
              }
              v96 = nghttp2_session_pack_data(a1, v114, v95, v7, v7 + 96, v14);
              v15 = v96;
              if ((int)v96 <= -509)
              {
                if ((_DWORD)v96 != -521)
                {
                  if ((_DWORD)v96 == -526)
                    return 0;
                  goto LABEL_14;
                }
                session_detach_stream_item(a1, v14);
                v15 = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v7 + 8), 2);
                if ((int)v15 > -901)
                {
                  v15 = 4294966775;
LABEL_251:
                  v36 = *(unsigned __int8 *)(v7 + 12);
                  if (!*(_BYTE *)(v7 + 12))
                  {
                    v106 = 0;
                    goto LABEL_266;
                  }
LABEL_252:
                  v105 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 2416);
                  if (v105 && v15 >= 0xFFFFFC7D && v36 != 8)
                  {
                    if (!v105(a1, v7, v15, *(_QWORD *)(a1 + 2608)))
                    {
                      v36 = *(unsigned __int8 *)(v7 + 12);
                      goto LABEL_258;
                    }
                    nghttp2_outbound_item_free(v7, a1 + 2568);
                    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v7, *(_QWORD *)(a1 + 2568));
                    return -902;
                  }
LABEL_258:
                  if (v36 == 5)
                  {
                    v107 = *(unsigned int *)(v7 + 40);
                    v108 = 2;
                    if (!(_DWORD)v107)
                      goto LABEL_263;
                  }
                  else
                  {
                    if (v36 != 1 || *(_DWORD *)(v7 + 56))
                    {
LABEL_263:
                      v106 = 0;
                      goto LABEL_266;
                    }
                    v107 = *(unsigned int *)(v7 + 8);
                    if (*(_BYTE *)(v7 + 132))
                    {
                      v108 = *(unsigned int *)(v7 + 128);
                      if (!(_DWORD)v107)
                        goto LABEL_263;
                    }
                    else
                    {
                      v108 = 7;
                      if (!(_DWORD)v107)
                        goto LABEL_263;
                    }
                  }
                  nghttp2_session_close_stream(a1, v107, v108);
                  v106 = v109;
LABEL_266:
                  nghttp2_outbound_item_free(v7, a1 + 2568);
                  (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v7, *(_QWORD *)(a1 + 2568));
                  active_outbound_item_reset((uint64_t *)(a1 + 648), a1 + 2568);
                  if (v106 <= -901)
                    return v106;
                  if ((_DWORD)v15 == -523)
                    LODWORD(v15) = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 2, 0);
                  if ((int)v15 <= -901)
                    return (int)v15;
                  continue;
                }
LABEL_248:
                if ((_DWORD)v15 == -508)
                  continue;
                if ((_DWORD)v15 == -526)
                  return 0;
                if ((v15 & 0x80000000) != 0)
                  goto LABEL_251;
              }
              else if ((_DWORD)v96)
              {
                if ((_DWORD)v96 != -508)
                  goto LABEL_14;
                session_defer_stream_item(a1, v14, 8);
                *(_QWORD *)(a1 + 648) = 0;
                active_outbound_item_reset((uint64_t *)(a1 + 648), a1 + 2568);
                continue;
              }
LABEL_146:
              *(_QWORD *)(a1 + 648) = v7;
              *(_QWORD *)(a1 + 664) = *(_QWORD *)(a1 + 656);
              if (!*(_BYTE *)(v7 + 12))
              {
                if (*(_BYTE *)(v7 + 122))
                {
                  *(_DWORD *)(a1 + 720) = 2;
                  continue;
                }
LABEL_158:
                *(_DWORD *)(a1 + 720) = 1;
                continue;
              }
              v73 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 2400);
              if (!v73)
                goto LABEL_158;
              v74 = v73(a1, v7, *(_QWORD *)(a1 + 2608));
              if (!v74)
                goto LABEL_158;
              if (v74 != -535)
                return -902;
              v75 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 2416);
              if (v75)
              {
                if (v75(a1, v7, 4294966761, *(_QWORD *)(a1 + 2608)))
                  return -902;
              }
              v76 = *(unsigned __int8 *)(v7 + 12);
              if (v76 == 5)
              {
                v77 = (unsigned int *)(v7 + 40);
                v78 = 2;
              }
              else
              {
                if (v76 != 1 || *(_DWORD *)(v7 + 56))
                  goto LABEL_27;
                v77 = (unsigned int *)(v7 + 8);
                v78 = 7;
              }
              v92 = *v77;
              if (!(_DWORD)v92)
                goto LABEL_27;
              nghttp2_session_close_stream(a1, v92, v78);
              break;
            case 1:
              v31 = *(_DWORD *)(v7 + 8);
              if (!*(_DWORD *)(v7 + 56))
              {
                v68 = nghttp2_session_open_stream(a1, v31, (uint64_t *)(v7 + 24), 0, *(_QWORD *)(v7 + 120));
                if (!v68)
                {
                  v15 = 4294966395;
                  goto LABEL_251;
                }
                if (*(_BYTE *)(v7 + 132))
                  goto LABEL_136;
                if ((*(_BYTE *)(a1 + 2933) & 8) != 0)
                  goto LABEL_203;
                v97 = v68;
                if (session_is_closing(a1))
                  goto LABEL_203;
                if ((*(_BYTE *)(a1 + 2916) & 4) == 0)
                  nghttp2_http_record_request_method(v97, v7);
                goto LABEL_230;
              }
              v32 = nghttp2_map_find((uint64_t *)a1, v31);
              if (!v32 || (v33 = v32, (*(_BYTE *)(v32 + 216) & 2) != 0) || (v34 = *(_DWORD *)(v32 + 204), v34 == 5))
              {
                *(_DWORD *)(v7 + 56) = 3;
                goto LABEL_125;
              }
              if (v34 == 4)
              {
                v15 = session_predicate_push_response_headers_send(a1, v32);
                if ((_DWORD)v15)
                  goto LABEL_248;
                *(_DWORD *)(v7 + 56) = 2;
                v35 = *(_QWORD *)(v7 + 120);
                if (v35)
                  *(_QWORD *)(v33 + 144) = v35;
                goto LABEL_230;
              }
              if (!session_is_closing(a1)
                && (*(_BYTE *)(v33 + 217) & 2) == 0
                && (*(_BYTE *)(a1 + 2932) || (~*(_DWORD *)(a1 + 2916) & 0x84) == 0)
                && (!*(_DWORD *)(v33 + 168) || (*(_BYTE *)(a1 + 2932) == 0) != (*(_DWORD *)(v33 + 168) & 1))
                && v34 == 1)
              {
                *(_DWORD *)(v7 + 56) = 1;
LABEL_230:
                v101 = *(_QWORD *)(v7 + 48);
                v102 = 12 * v101 + 12;
                if (v101)
                {
                  v103 = (_QWORD *)(*(_QWORD *)(v7 + 40) + 24);
                  do
                  {
                    v102 += *(v103 - 1) + *v103;
                    v103 += 5;
                    --v101;
                  }
                  while (v101);
                }
                if ((unint64_t)(v102 + 5) > *(_QWORD *)(a1 + 2768))
                  goto LABEL_234;
                v15 = nghttp2_frame_pack_headers((uint64_t)v114, v7, v113);
                if ((_DWORD)v15)
                  goto LABEL_248;
                v15 = session_headers_add_pad((_QWORD *)a1, (uint64_t *)v7);
                if ((_DWORD)v15)
                  goto LABEL_248;
                if (*(_DWORD *)(v7 + 56))
                  goto LABEL_146;
                v104 = *(_DWORD *)(v7 + 8);
                if (*(_DWORD *)(a1 + 2804) >= v104)
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2518, "session->last_sent_stream_id < frame->hd.stream_id");
                goto LABEL_274;
              }
              *(_DWORD *)(v7 + 56) = 3;
              if (session_is_closing(a1))
                goto LABEL_217;
              if ((*(_BYTE *)(v33 + 217) & 2) != 0)
                goto LABEL_225;
              v99 = *(_DWORD *)(v33 + 204);
              if (v99 == 2)
                goto LABEL_230;
              if (v99 == 3)
                goto LABEL_136;
              v100 = *(_DWORD *)(v33 + 168);
              if (v100)
              {
                if (((v100 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) == 0)
                  goto LABEL_230;
              }
LABEL_224:
              v15 = 4294966782;
              goto LABEL_251;
            case 2:
              if (session_is_closing(a1))
              {
                v36 = 2;
                goto LABEL_69;
              }
              v38 = *(_QWORD **)(a1 + 656);
              if (v38 != *(_QWORD **)(a1 + 664))
                __assert_rtn("nghttp2_frame_pack_priority", "nghttp2_frame.c", 436, "bufs->head == bufs->cur");
              if (v38[2] - v38[4] <= 4uLL)
                __assert_rtn("nghttp2_frame_pack_priority", "nghttp2_frame.c", 440, "nghttp2_buf_avail(buf) >= NGHTTP2_PRIORITY_SPECLEN");
              v69 = v38[3];
              v38[3] = v69 - 9;
              *(_DWORD *)(v69 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(_BYTE *)(v69 - 6) = *(_BYTE *)(v7 + 12);
              *(_BYTE *)(v69 - 5) = *(_BYTE *)(v7 + 13);
              *(_DWORD *)(v69 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              v70 = v38[4];
              v71 = bswap32(*(_DWORD *)(v7 + 16));
              *(_DWORD *)v70 = v71;
              if (*(_BYTE *)(v7 + 24))
                *(_BYTE *)v70 = v71 | 0x80;
              *(_BYTE *)(v70 + 4) = *(_BYTE *)(v7 + 20) - 1;
              v46 = v38[4] + 5;
              goto LABEL_145;
            case 3:
              if (session_is_closing(a1))
              {
                v36 = 3;
LABEL_69:
                v15 = 4294966766;
                goto LABEL_252;
              }
              v38 = *(_QWORD **)(a1 + 656);
              if (v38 != *(_QWORD **)(a1 + 664))
                __assert_rtn("nghttp2_frame_pack_rst_stream", "nghttp2_frame.c", 460, "bufs->head == bufs->cur");
              if (v38[2] - v38[4] <= 3uLL)
                __assert_rtn("nghttp2_frame_pack_rst_stream", "nghttp2_frame.c", 464, "nghttp2_buf_avail(buf) >= 4");
LABEL_144:
              v72 = v38[3];
              v38[3] = v72 - 9;
              *(_DWORD *)(v72 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(_BYTE *)(v72 - 6) = *(_BYTE *)(v7 + 12);
              *(_BYTE *)(v72 - 5) = *(_BYTE *)(v7 + 13);
              *(_DWORD *)(v72 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              *(_DWORD *)v38[4] = bswap32(*(_DWORD *)(v7 + 16));
              v46 = v38[4] + 4;
LABEL_145:
              v38[4] = v46;
              goto LABEL_146;
            case 4:
              if ((*(_BYTE *)(v7 + 13) & 1) != 0)
              {
                v37 = *(_QWORD *)(a1 + 2752);
                if (!v37)
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2546, "session->obq_flood_counter_ > 0");
                *(_QWORD *)(a1 + 2752) = v37 - 1;
                if (session_is_closing(a1))
                  goto LABEL_217;
              }
              v38 = *(_QWORD **)(a1 + 656);
              if (v38 != *(_QWORD **)(a1 + 664))
                __assert_rtn("nghttp2_frame_pack_settings", "nghttp2_frame.c", 482, "bufs->head == bufs->cur");
              v39 = *(_QWORD *)v7;
              if (v38[2] - v38[4] < *(_QWORD *)v7)
                goto LABEL_234;
              v40 = v38[3];
              v38[3] = v40 - 9;
              *(_DWORD *)(v40 - 9) = bswap32(v39) >> 8;
              *(_BYTE *)(v40 - 6) = *(_BYTE *)(v7 + 12);
              *(_BYTE *)(v40 - 5) = *(_BYTE *)(v7 + 13);
              *(_DWORD *)(v40 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              v41 = v38[4];
              v42 = *(_QWORD *)(v7 + 16);
              if (v42)
              {
                v43 = (unsigned int *)(*(_QWORD *)(v7 + 24) + 4);
                v44 = *(_QWORD *)(v7 + 16);
                do
                {
                  *(_WORD *)v41 = bswap32(*((unsigned __int16 *)v43 - 2)) >> 16;
                  v45 = *v43;
                  v43 += 2;
                  *(_DWORD *)(v41 + 2) = bswap32(v45);
                  v41 += 6;
                  --v44;
                }
                while (v44);
                v41 = v38[4];
              }
              v46 = v41 + 6 * v42;
              goto LABEL_145;
            case 5:
              v47 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v7 + 8));
              if (!v47 || (*(_BYTE *)(v47 + 216) & 2) != 0)
              {
                v48 = 0;
              }
              else if (*(_DWORD *)(v47 + 204) == 5)
              {
                v48 = 0;
              }
              else
              {
                v48 = v47;
              }
              if (!*(_BYTE *)(a1 + 2932))
              {
                v15 = 4294966791;
                goto LABEL_251;
              }
              if (!v48)
                goto LABEL_125;
              if (session_is_closing(a1))
                goto LABEL_217;
              if ((*(_BYTE *)(v48 + 217) & 2) != 0)
              {
LABEL_225:
                v15 = 4294966784;
                goto LABEL_251;
              }
              if (!*(_DWORD *)(a1 + 2856))
              {
                v15 = 4294966768;
                goto LABEL_251;
              }
              if (*(_DWORD *)(v48 + 204) == 3)
                goto LABEL_136;
              if ((*(_BYTE *)(a1 + 2933) & 8) != 0)
              {
LABEL_203:
                v15 = 4294966780;
                goto LABEL_251;
              }
              v60 = *(_QWORD *)(v7 + 32);
              v61 = 12 * v60 + 12;
              if (v60)
              {
                v62 = (_QWORD *)(*(_QWORD *)(v7 + 24) + 24);
                do
                {
                  v61 += *(v62 - 1) + *v62;
                  v62 += 5;
                  --v60;
                }
                while (v60);
              }
              if (v61 > *(_QWORD *)(a1 + 2768))
                goto LABEL_234;
              v15 = nghttp2_frame_pack_push_promise((uint64_t)v114, v7, v113);
              if ((_DWORD)v15)
                goto LABEL_248;
              v15 = session_headers_add_pad((_QWORD *)a1, (uint64_t *)v7);
              if ((_DWORD)v15)
                goto LABEL_248;
              v104 = *(_DWORD *)(v7 + 40);
              if (*(_DWORD *)(a1 + 2804) + 2 > v104)
                __assert_rtn("session_prep_frame", "nghttp2_session.c", 2597, "session->last_sent_stream_id + 2 <= frame->push_promise.promised_stream_id");
LABEL_274:
              *(_DWORD *)(a1 + 2804) = v104;
              goto LABEL_146;
            case 6:
              if ((*(_BYTE *)(v7 + 13) & 1) != 0)
              {
                v49 = *(_QWORD *)(a1 + 2752);
                if (!v49)
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2604, "session->obq_flood_counter_ > 0");
                *(_QWORD *)(a1 + 2752) = v49 - 1;
              }
              if ((*(_BYTE *)(a1 + 2933) & 1) != 0)
                goto LABEL_217;
              v38 = *(_QWORD **)(a1 + 656);
              if (v38 != *(_QWORD **)(a1 + 664))
                __assert_rtn("nghttp2_frame_pack_ping", "nghttp2_frame.c", 600, "bufs->head == bufs->cur");
              if (v38[2] - v38[4] <= 7uLL)
                __assert_rtn("nghttp2_frame_pack_ping", "nghttp2_frame.c", 604, "nghttp2_buf_avail(buf) >= 8");
              v50 = v38[3];
              v38[3] = v50 - 9;
              *(_DWORD *)(v50 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(_BYTE *)(v50 - 6) = *(_BYTE *)(v7 + 12);
              *(_BYTE *)(v50 - 5) = *(_BYTE *)(v7 + 13);
              *(_DWORD *)(v50 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              v51 = (_QWORD *)v38[4];
              *v51 = *(_QWORD *)(v7 + 16);
              v46 = (uint64_t)(v51 + 1);
              goto LABEL_145;
            case 7:
              v52 = *(_QWORD *)(a1 + 656);
              if (v52 != *(_QWORD *)(a1 + 664))
                __assert_rtn("nghttp2_frame_pack_goaway", "nghttp2_frame.c", 623, "bufs->head == bufs->cur");
              v53 = *(_QWORD *)(v52 + 24);
              *(_QWORD *)(v52 + 24) = v53 - 9;
              *(_DWORD *)(v53 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(_BYTE *)(v53 - 6) = *(_BYTE *)(v7 + 12);
              *(_BYTE *)(v53 - 5) = *(_BYTE *)(v7 + 13);
              *(_DWORD *)(v53 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              **(_DWORD **)(v52 + 32) = bswap32(*(_DWORD *)(v7 + 16));
              v54 = *(_QWORD *)(v52 + 32);
              *(_QWORD *)(v52 + 32) = v54 + 4;
              *(_DWORD *)(v54 + 4) = bswap32(*(_DWORD *)(v7 + 20));
              *(_QWORD *)(v52 + 32) += 4;
              v55 = nghttp2_bufs_add((uint64_t)v114, *(char **)(v7 + 24), *(_QWORD *)(v7 + 32));
              if ((_DWORD)v55 == -502)
                goto LABEL_234;
              v15 = v55;
              if ((_DWORD)v55)
                goto LABEL_248;
              *(_DWORD *)(a1 + 2820) = *(_DWORD *)(v7 + 16);
              goto LABEL_146;
            case 8:
              v56 = *(_DWORD *)(v7 + 8);
              if (session_is_closing(a1))
                goto LABEL_217;
              if (!v56)
                goto LABEL_105;
              v57 = nghttp2_map_find((uint64_t *)a1, v56);
              if (!v57 || (*(_BYTE *)(v57 + 216) & 2) != 0)
                goto LABEL_125;
              v58 = *(_DWORD *)(v57 + 204);
              switch(v58)
              {
                case 3:
                  goto LABEL_136;
                case 5:
                  goto LABEL_125;
                case 4:
                  v59 = *(_DWORD *)(v57 + 168);
                  if (v59)
                  {
                    if (((v59 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) == 0)
                      goto LABEL_224;
                  }
                  break;
              }
LABEL_105:
              v38 = *(_QWORD **)(a1 + 656);
              if (v38 != *(_QWORD **)(a1 + 664))
                __assert_rtn("nghttp2_frame_pack_window_update", "nghttp2_frame.c", 695, "bufs->head == bufs->cur");
              if (v38[2] - v38[4] <= 3uLL)
                __assert_rtn("nghttp2_frame_pack_window_update", "nghttp2_frame.c", 699, "nghttp2_buf_avail(buf) >= 4");
              goto LABEL_144;
            case 9:
              __assert_rtn("session_prep_frame", "nghttp2_session.c", 2632, "0");
            default:
              if (!*(_BYTE *)(v7 + 96))
              {
                if (session_is_closing(a1))
                  goto LABEL_217;
                v63 = *(uint64_t (**)(uint64_t))(a1 + 2528);
                if (!v63)
                {
                  v63 = *(uint64_t (**)(uint64_t))(a1 + 2520);
                  if (!v63)
                    __assert_rtn("session_pack_extension", "nghttp2_session.c", 2311, "session->callbacks.pack_extension_callback2 || session->callbacks.pack_extension_callback");
                }
                v64 = *(_QWORD **)(a1 + 656);
                v65 = v64 + 4;
                if (v64[2] - v64[4] >= 0x4000uLL)
                  v66 = 0x4000;
                else
                  v66 = v64[2] - v64[4];
                v67 = v63(a1);
                if (v67 == -535)
                {
                  v15 = 4294966761;
                  goto LABEL_251;
                }
                v15 = 4294966394;
                if ((v67 & 0x8000000000000000) == 0 && v67 <= v66)
                {
                  *(_QWORD *)v7 = v67;
                  v98 = v64[3];
                  if (v98 != *v65)
                    __assert_rtn("session_pack_extension", "nghttp2_session.c", 2335, "buf->pos == buf->last");
                  *v65 = v98 + v67;
                  v64[3] = v98 - 9;
                  *(_DWORD *)(v98 - 9) = bswap32(v67) >> 8;
                  *(_BYTE *)(v98 - 6) = *(_BYTE *)(v7 + 12);
                  *(_BYTE *)(v98 - 5) = *(_BYTE *)(v7 + 13);
                  *(_DWORD *)(v98 - 4) = bswap32(*(_DWORD *)(v7 + 8));
                  goto LABEL_146;
                }
                goto LABEL_251;
              }
              if (v11 == 16)
              {
                if (session_is_closing(a1))
                  goto LABEL_217;
                v80 = nghttp2_map_find((uint64_t *)a1, **(_DWORD **)(v7 + 16));
                if (!v80 || (*(_BYTE *)(v80 + 216) & 2) != 0)
                  goto LABEL_171;
                v81 = *(_DWORD *)(v80 + 204);
                if (v81 == 3)
                  goto LABEL_136;
                if (v81 == 5 || (*(_BYTE *)(v80 + 217) & 1) == 0)
                {
LABEL_171:
                  nghttp2_frame_pack_priority_update((uint64_t)v114, v7);
                  goto LABEL_146;
                }
                goto LABEL_224;
              }
              if (v11 != 12)
              {
                if (v11 != 10)
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2685, "0");
                v28 = *(_DWORD *)(v7 + 8);
                if (!session_is_closing(a1))
                {
                  if (!v28)
                    goto LABEL_56;
                  v29 = nghttp2_map_find((uint64_t *)a1, v28);
                  if (!v29 || (*(_BYTE *)(v29 + 216) & 2) != 0)
                    goto LABEL_125;
                  v30 = *(_DWORD *)(v29 + 204);
                  if (v30 != 3)
                  {
                    if (v30 != 5)
                    {
LABEL_56:
                      nghttp2_frame_pack_altsvc((uint64_t)v114, v7);
                      goto LABEL_146;
                    }
LABEL_125:
                    v15 = 4294966786;
                    goto LABEL_251;
                  }
LABEL_136:
                  v15 = 4294966785;
                  goto LABEL_251;
                }
LABEL_217:
                v15 = 4294966766;
                goto LABEL_251;
              }
              if (session_is_closing(a1))
                goto LABEL_217;
              v82 = *v114;
              v83 = *(_QWORD *)v7;
              if (*(_QWORD *)(*v114 + 16) - *(_QWORD *)(*v114 + 32) < *(_QWORD *)v7)
              {
LABEL_234:
                v15 = 4294966774;
                goto LABEL_251;
              }
              v111 = a3;
              v112 = a2;
              v84 = *(unint64_t **)(v7 + 16);
              v85 = *(_QWORD *)(v82 + 24);
              *(_QWORD *)(v82 + 24) = v85 - 9;
              *(_DWORD *)(v85 - 9) = bswap32(v83) >> 8;
              *(_BYTE *)(v85 - 6) = *(_BYTE *)(v7 + 12);
              *(_BYTE *)(v85 - 5) = *(_BYTE *)(v7 + 13);
              *(_DWORD *)(v85 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              v86 = *(_WORD **)(v82 + 32);
              if (*v84)
              {
                v87 = 0;
                v88 = 0;
                do
                {
                  v89 = v84[1];
                  *v86 = bswap32(*(unsigned __int16 *)(v89 + v87 + 8)) >> 16;
                  v90 = *(_QWORD *)(v82 + 32);
                  v86 = (_WORD *)(v90 + 2);
                  *(_QWORD *)(v82 + 32) = v90 + 2;
                  v91 = *(_QWORD *)(v89 + v87 + 8);
                  if (v91)
                  {
                    memcpy((void *)(v90 + 2), *(const void **)(v89 + v87), *(_QWORD *)(v89 + v87 + 8));
                    v86 = (_WORD *)((char *)v86 + v91);
                  }
                  *(_QWORD *)(v82 + 32) = v86;
                  ++v88;
                  v87 += 16;
                }
                while (v88 < *v84);
              }
              a2 = v112;
              a3 = v111;
              if ((_WORD *)((char *)v86 - *(_QWORD *)(v82 + 24)) != (_WORD *)(*(_QWORD *)v7 + 9))
                __assert_rtn("nghttp2_frame_pack_origin", "nghttp2_frame.c", 814, "nghttp2_buf_len(buf) == NGHTTP2_FRAME_HDLEN + frame->hd.length");
              goto LABEL_146;
          }
LABEL_184:
          if ((int)result <= -901)
            return (int)result;
LABEL_27:
          active_outbound_item_reset((uint64_t *)(a1 + 648), a1 + 2568);
          continue;
        }
        return 0;
      case 1:
        v16 = *(_QWORD *)(a1 + 664);
        v17 = *(_QWORD *)(v16 + 24);
        if (v17 != *(_QWORD *)(v16 + 32))
          goto LABEL_276;
        if (!a3)
        {
          session_after_frame_sent1(a1);
          if ((result & 0x80000000) != 0)
          {
            if (result >= 0xFFFFFC7C)
              __assert_rtn("nghttp2_session_mem_send_internal", "nghttp2_session.c", 3466, "nghttp2_is_fatal(rv)");
            return (int)result;
          }
        }
        session_after_frame_sent2(a1);
        continue;
      case 2:
        v18 = *(_QWORD *)(a1 + 648);
        v19 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v18 + 8));
        if (!v19)
          goto LABEL_27;
        v20 = v19;
        if ((*(_BYTE *)(v19 + 216) & 2) != 0 || *(_DWORD *)(v19 + 204) == 5)
          goto LABEL_27;
        v21 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(a1 + 2512))(a1, v18, *(_QWORD *)(*(_QWORD *)(a1 + 664) + 24), *(_QWORD *)v18 - *(_QWORD *)(v18 + 16), v18 + 104, *(_QWORD *)(a1 + 2608));
        v22 = v21;
        if (v21 > -505)
        {
          if (v21)
          {
            if (v21 == -504)
              return 0;
            return -902;
          }
        }
        else if (v21 != -526)
        {
          if (v21 != -521)
            return -902;
          session_detach_stream_item(a1, v20);
          LODWORD(result) = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v18 + 8), 2);
          goto LABEL_184;
        }
        session_after_frame_sent1(a1);
        if ((result & 0x80000000) != 0)
        {
          if (result >= 0xFFFFFC7C)
            __assert_rtn("nghttp2_session_mem_send_internal", "nghttp2_session.c", 3529, "nghttp2_is_fatal(rv)");
          return (int)result;
        }
        session_after_frame_sent2(a1);
        if (v22 == -526)
          return 0;
        continue;
      case 3:
        v16 = *(_QWORD *)(a1 + 664);
        v17 = *(_QWORD *)(v16 + 24);
        if (v17 == *(_QWORD *)(v16 + 32))
          goto LABEL_27;
LABEL_276:
        *a2 = v17;
        v110 = *(_QWORD *)(v16 + 32);
        result = v110 - *(_QWORD *)(v16 + 24);
        *(_QWORD *)(v16 + 24) = v110;
        return result;
      default:
        continue;
    }
  }
}

void nghttp2_session_adjust_idle_stream(uint64_t a1)
{
  unsigned int v1;
  unint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  unint64_t v9;

  v1 = *(_DWORD *)(a1 + 2892);
  if (v1 >= *(_DWORD *)(a1 + 2920))
    v1 = *(_DWORD *)(a1 + 2920);
  if (v1 <= 0x10)
    v1 = 16;
  if (v1 >= 0x64)
    v2 = 100;
  else
    v2 = v1;
  if (*(_QWORD *)(a1 + 2736) > v2)
  {
    v4 = (_QWORD *)(a1 + 2640);
    v5 = *(_QWORD *)(a1 + 2632);
    do
    {
      if (!v5)
        __assert_rtn("nghttp2_session_adjust_idle_stream", "nghttp2_session.c", 1737, "head");
      v6 = *(_QWORD *)(v5 + 136);
      nghttp2_session_destroy_stream(a1, v5);
      if (v7)
        break;
      *(_QWORD *)(a1 + 2632) = v6;
      v8 = (_QWORD *)(v6 + 128);
      if (!v6)
        v8 = v4;
      *v8 = 0;
      v9 = *(_QWORD *)(a1 + 2736) - 1;
      *(_QWORD *)(a1 + 2736) = v9;
      v5 = v6;
    }
    while (v9 > v2);
  }
}

void session_after_frame_sent1(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD);
  unsigned int (*v9)(uint64_t, _QWORD, _QWORD);
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, _QWORD);
  char v17;
  int *v18;
  _DWORD *v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;

  v2 = *(_QWORD *)(a1 + 648);
  v3 = *(unsigned __int8 *)(v2 + 12);
  if (v3 == 5 || v3 == 1)
  {
    v5 = **(_QWORD **)(a1 + 664);
    if (v5 && *(_QWORD *)(v5 + 32) != *(_QWORD *)(v5 + 24))
      return;
    goto LABEL_16;
  }
  if (*(_BYTE *)(v2 + 12))
  {
LABEL_16:
    v9 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD))(a1 + 2408);
    if (v9)
    {
      if (v9(a1, *(_QWORD *)(a1 + 648), *(_QWORD *)(a1 + 2608)))
        return;
      v3 = *(unsigned __int8 *)(v2 + 12);
    }
    switch(v3)
    {
      case 1:
        v10 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v2 + 8));
        if (v10 && (*(_BYTE *)(v10 + 216) & 2) == 0 && *(_DWORD *)(v10 + 204) != 5)
        {
          switch(*(_DWORD *)(v2 + 56))
          {
            case 0:
              v11 = 1;
              goto LABEL_56;
            case 1:
              goto LABEL_55;
            case 2:
              *(_BYTE *)(v10 + 216) &= ~1u;
              ++*(_QWORD *)(a1 + 2696);
LABEL_55:
              v11 = 2;
LABEL_56:
              *(_DWORD *)(v10 + 204) = v11;
              break;
            case 3:
              break;
            default:
              __assert_rtn("session_after_frame_sent1", "nghttp2_session.c", 3047, "0");
          }
          v24 = *(unsigned __int8 *)(v10 + 217);
          if ((*(_BYTE *)(v2 + 13) & 1) != 0)
          {
            v24 |= 2u;
            *(_BYTE *)(v10 + 217) = v24;
          }
          if ((~v24 & 3) != 0 || (nghttp2_session_close_stream(a1, *(unsigned int *)(v10 + 168), 0), v25 >= -900))
          {
            if (*(_QWORD *)(v2 + 112))
              nghttp2_submit_data_shared(a1, 1, *(_DWORD *)(v2 + 8), (__int128 *)(v2 + 96));
          }
        }
        return;
      case 2:
        if (*(_BYTE *)(a1 + 2932) || *(_BYTE *)(a1 + 2930) == 1)
          return;
        v12 = *(_DWORD *)(v2 + 8);
        v13 = nghttp2_map_find((uint64_t *)a1, v12);
        if (v13)
        {
          if ((int)nghttp2_session_reprioritize_stream(a1, v13, (int *)(v2 + 16)) < -900)
            return;
        }
        else
        {
          if (!v12)
            return;
          v23 = (v12 & 1) != 0 ? *(_DWORD *)(a1 + 2804) : *(_DWORD *)(a1 + 2808);
          if (v23 >= v12 || !nghttp2_session_open_stream(a1, v12, (uint64_t *)(v2 + 16), 5, 0))
            return;
        }
        nghttp2_session_adjust_idle_stream(a1);
        return;
      case 3:
        nghttp2_session_close_stream(a1, *(unsigned int *)(v2 + 8), *(unsigned int *)(v2 + 16));
        return;
      case 7:
        if ((*(_BYTE *)(v2 + 96) & 2) == 0)
        {
          *(_BYTE *)(a1 + 2933) |= (2 * (*(_BYTE *)(v2 + 96) & 1)) | 4;
          session_close_stream_on_goaway(a1, *(_DWORD *)(v2 + 16), 1);
        }
        return;
      case 8:
        v14 = *(_DWORD *)(v2 + 8);
        if (v14)
        {
          v15 = nghttp2_map_find((uint64_t *)a1, v14);
          if (!v15)
            return;
          if ((*(_BYTE *)(v15 + 216) & 2) != 0)
            return;
          if (*(_DWORD *)(v15 + 204) == 5)
            return;
          *(_BYTE *)(v15 + 219) = 0;
          if ((*(_BYTE *)(v15 + 217) & 1) != 0)
            return;
          if ((*(_BYTE *)(a1 + 2916) & 1) == 0)
          {
            nghttp2_session_update_recv_stream_window_size(a1, v15, 0, 1);
            return;
          }
          v18 = (int *)(v15 + 180);
          v19 = (_DWORD *)(v15 + 176);
          v22 = *(_DWORD *)(v15 + 168);
          v20 = *(_DWORD *)(v15 + 188);
          v21 = a1;
        }
        else
        {
          *(_BYTE *)(a1 + 2934) = 0;
          if ((*(_BYTE *)(a1 + 2916) & 1) == 0)
          {
            nghttp2_session_update_recv_connection_window_size(a1, 0);
            return;
          }
          v18 = (int *)(a1 + 2836);
          v19 = (_DWORD *)(a1 + 2832);
          v20 = *(_DWORD *)(a1 + 2844);
          v21 = a1;
          v22 = 0;
        }
        session_update_consumed_size(v21, v18, v19, 0, v22, 0, v20);
        return;
      default:
        return;
    }
  }
  v6 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v2 + 8));
  if (!v6 || (v7 = v6, (*(_BYTE *)(v6 + 216) & 2) != 0) || *(_DWORD *)(v6 + 204) == 5)
  {
    *(_DWORD *)(a1 + 2828) -= *(_DWORD *)v2;
    goto LABEL_14;
  }
  *(_DWORD *)(a1 + 2828) -= *(_DWORD *)v2;
  *(_DWORD *)(v6 + 172) -= *(_DWORD *)v2;
  if (!*(_BYTE *)(v2 + 121))
  {
LABEL_14:
    v8 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 2408);
    if (v8)
      v8(a1, v2, *(_QWORD *)(a1 + 2608));
    return;
  }
  session_detach_stream_item(a1, v6);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a1 + 2408);
  if ((!v16 || !v16(a1, v2, *(_QWORD *)(a1 + 2608))) && (*(_BYTE *)(v2 + 13) & 1) != 0)
  {
    v17 = *(_BYTE *)(v7 + 217);
    *(_BYTE *)(v7 + 217) = v17 | 2;
    if ((v17 & 1) != 0)
      nghttp2_session_close_stream(a1, *(unsigned int *)(v7 + 168), 0);
  }
}

uint64_t session_after_frame_sent2(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = result;
  v2 = (uint64_t *)(result + 648);
  v3 = *(_QWORD *)(result + 648);
  v4 = result + 2568;
  v5 = *(unsigned __int8 *)(v3 + 12);
  if (*(_BYTE *)(v3 + 12))
  {
    if (v5 == 5 || v5 == 1)
    {
      v7 = **(_QWORD **)(result + 664);
      if (v7)
      {
        if (*(_QWORD *)(v7 + 32) != *(_QWORD *)(v7 + 24))
        {
          *(_QWORD *)(result + 664) = v7;
          return result;
        }
      }
    }
  }
  else if (!*(_BYTE *)(v3 + 121))
  {
    *(_BYTE *)(v3 + 122) = 0;
    v8 = nghttp2_map_find((uint64_t *)result, *(_DWORD *)(v3 + 8));
    if (!v8 || (*(_BYTE *)(v8 + 216) & 2) != 0)
    {
      v9 = 0;
    }
    else if (*(_DWORD *)(v8 + 204) == 5)
    {
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }
    if (nghttp2_session_predicate_data_send(v1, v9))
    {
      if (v9)
        session_detach_stream_item(v1, v9);
    }
    else
    {
      *v2 = 0;
    }
  }
  return active_outbound_item_reset(v2, v4);
}

uint64_t nghttp2_session_update_recv_connection_window_size(uint64_t a1, int a2)
{
  int v3;
  int v4;
  uint64_t result;
  int v7;
  int v8;
  int v9;

  v3 = *(_DWORD *)(a1 + 2844);
  v4 = *(_DWORD *)(a1 + 2832);
  if (v4 > v3 - a2 || v4 > (a2 ^ 0x7FFFFFFF))
    return session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 3, 0);
  v7 = v4 + a2;
  *(_DWORD *)(a1 + 2832) = v4 + a2;
  if ((*(_BYTE *)(a1 + 2916) & 1) != 0)
    return 0;
  result = 0;
  v8 = v3 + (v3 < 0);
  if (!*(_BYTE *)(a1 + 2934))
  {
    v9 = v8 >> 1;
    if (v7 >= 1 && v9 <= v7)
    {
      result = nghttp2_session_add_window_update(a1, 0, v7);
      if (!(_DWORD)result)
        *(_DWORD *)(a1 + 2832) = 0;
    }
  }
  return result;
}

uint64_t nghttp2_session_update_recv_stream_window_size(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v5;
  int v6;
  int v9;
  uint64_t v10;
  int v11;
  int v12;

  v5 = *(_DWORD *)(a2 + 188);
  v6 = *(_DWORD *)(a2 + 176);
  if (v6 > v5 - a3 || v6 > (a3 ^ 0x7FFFFFFF))
    return nghttp2_session_add_rst_stream(a1, *(_DWORD *)(a2 + 168), 3);
  v9 = v6 + a3;
  *(_DWORD *)(a2 + 176) = v9;
  if (!a4 || (*(_BYTE *)(a1 + 2916) & 1) != 0)
    return 0;
  v10 = 0;
  v11 = v5 + (v5 < 0);
  if (!*(_BYTE *)(a2 + 219))
  {
    v12 = v11 >> 1;
    if (v9 >= 1 && v12 <= v9)
    {
      v10 = nghttp2_session_add_window_update(a1, *(_DWORD *)(a2 + 168), v9);
      if (!(_DWORD)v10)
        *(_DWORD *)(a2 + 176) = 0;
    }
  }
  return v10;
}

void nghttp2_session_on_data_received(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int (*v8)(uint64_t, uint64_t, _QWORD);
  char v9;
  uint64_t v10;

  v4 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a2 + 8));
  if (v4)
  {
    v5 = v4;
    if ((*(_BYTE *)(v4 + 216) & 2) == 0)
    {
      v6 = *(_DWORD *)(v4 + 204);
      if (v6 != 3 && v6 != 5)
      {
        if ((*(_BYTE *)(a1 + 2916) & 4) != 0
          || (*(_BYTE *)(a2 + 13) & 1) == 0
          || (*(_BYTE *)(v4 + 213) & 0x40) == 0
          && ((v10 = *(_QWORD *)(v4 + 48), v10 == -1) || v10 == *(_QWORD *)(v4 + 56)))
        {
          v8 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a1 + 2376);
          if ((!v8 || !v8(a1, a2, *(_QWORD *)(a1 + 2608))) && (*(_BYTE *)(a2 + 13) & 1) != 0)
          {
            v9 = *(_BYTE *)(v5 + 217);
            *(_BYTE *)(v5 + 217) = v9 | 1;
            if ((v9 & 2) != 0)
              nghttp2_session_close_stream(a1, *(unsigned int *)(v5 + 168), 0);
          }
        }
        else if ((int)nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v4 + 168), 1) >= -900)
        {
          *(_BYTE *)(v5 + 217) |= 1u;
        }
      }
    }
  }
}

uint64_t nghttp2_session_on_settings_received(uint64_t a1, uint64_t a2, int a3)
{
  char *v5;
  uint64_t v6;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  BOOL v23;
  unsigned int v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  char v37;
  int v38;
  int *v39;
  int v40;
  int v41;
  _DWORD *v42;
  _DWORD *v43;
  unsigned int (*v44)(uint64_t, uint64_t, _QWORD);
  char *v45;
  uint64_t v46;
  int v47;
  int v48;

  if (*(_DWORD *)(a2 + 8))
  {
    v5 = "SETTINGS: stream_id != 0";
LABEL_3:
    v6 = 4294966791;
    return session_handle_invalid_connection(a1, a2, v6, v5);
  }
  if ((*(_BYTE *)(a2 + 13) & 1) != 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v5 = "SETTINGS: ACK and payload != 0";
      v6 = 4294966774;
      return session_handle_invalid_connection(a1, a2, v6, v5);
    }
    v31 = *(_QWORD **)(a1 + 2648);
    if (!v31)
    {
      v5 = "SETTINGS: unexpected ACK";
      goto LABEL_3;
    }
    v32 = v31[2];
    if (!v32)
      goto LABEL_89;
    v33 = 0;
    v34 = 0;
    v35 = v31[1];
    v36 = -1;
    v37 = 1;
    v38 = -1;
LABEL_57:
    v39 = (int *)(v35 + 4 + 8 * v34);
    while (1)
    {
      v40 = *(v39 - 1);
      if (v40 == 4)
      {
        v38 = *v39;
      }
      else if (v40 == 1)
      {
        v37 = 0;
        v33 = *(_DWORD *)(v35 + 8 * v34 + 4);
        if (v36 >= v33)
          v36 = *(_DWORD *)(v35 + 8 * v34 + 4);
        if (++v34 == v32)
        {
LABEL_73:
          if (v36 >= v33 || (v20 = nghttp2_hd_inflate_change_table_size(a1 + 2104, v36), !(_DWORD)v20))
          {
            v20 = nghttp2_hd_inflate_change_table_size(a1 + 2104, v33);
            if (!(_DWORD)v20)
              goto LABEL_76;
          }
          goto LABEL_90;
        }
        goto LABEL_57;
      }
      ++v34;
      v39 += 2;
      if (v32 == v34)
      {
        if ((v37 & 1) == 0)
          goto LABEL_73;
LABEL_76:
        if (v38 == -1
          || (v41 = *(_DWORD *)(a1 + 2896),
              v46 = a1,
              v47 = v38,
              v48 = v41,
              v20 = nghttp2_map_each(a1, update_local_initial_window_size_func, (uint64_t)&v46),
              !(_DWORD)v20))
        {
          v42 = (_DWORD *)(v35 + 4);
          do
          {
            v43 = (_DWORD *)(a1 + 2884);
            switch(*(v42 - 1))
            {
              case 1:
                goto LABEL_87;
              case 2:
                v43 = (_DWORD *)(a1 + 2888);
                goto LABEL_87;
              case 3:
                v43 = (_DWORD *)(a1 + 2892);
                goto LABEL_87;
              case 4:
                v43 = (_DWORD *)(a1 + 2896);
                goto LABEL_87;
              case 5:
                v43 = (_DWORD *)(a1 + 2900);
                goto LABEL_87;
              case 6:
                v43 = (_DWORD *)(a1 + 2904);
                goto LABEL_87;
              case 8:
                v43 = (_DWORD *)(a1 + 2908);
                goto LABEL_87;
              case 9:
                v43 = (_DWORD *)(a1 + 2912);
LABEL_87:
                *v43 = *v42;
                break;
              default:
                break;
            }
            v42 += 2;
            --v32;
          }
          while (v32);
LABEL_89:
          v20 = 0;
        }
LABEL_90:
        *(_QWORD *)(a1 + 2648) = *v31;
        (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(v31[1], *(_QWORD *)(a1 + 2568));
        (*(void (**)(_QWORD *, _QWORD))(a1 + 2584))(v31, *(_QWORD *)(a1 + 2568));
        if ((_DWORD)v20)
        {
          if ((int)v20 < -900)
            return v20;
          return session_handle_invalid_connection(a1, a2, v20, 0);
        }
LABEL_93:
        v44 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a1 + 2376);
        if (v44 && v44(a1, a2, *(_QWORD *)(a1 + 2608)))
          return 4294966394;
        else
          return 0;
      }
    }
  }
  if (!*(_BYTE *)(a1 + 2848))
  {
    *(_DWORD *)(a1 + 2860) = -1;
    *(_BYTE *)(a1 + 2848) = 1;
  }
  if (!*(_QWORD *)(a2 + 16))
  {
LABEL_46:
    if (*(_DWORD *)(a1 + 2880) == -1)
    {
      *(_DWORD *)(a1 + 2880) = 0;
      if (*(_BYTE *)(a1 + 2932))
      {
        if (*(_BYTE *)(a1 + 2930) && (*(_BYTE *)(a1 + 2916) & 0x20) != 0)
          *(_BYTE *)(a1 + 2931) = 1;
      }
    }
    if (!a3 && !session_is_closing(a1))
    {
      v27 = nghttp2_session_add_settings(a1, 1, 0, 0);
      if ((_DWORD)v27)
      {
        v20 = v27;
        if ((int)v27 >= -900)
        {
          v28 = a1;
          v29 = a2;
          v30 = 4294966762;
          goto LABEL_105;
        }
        return v20;
      }
    }
    goto LABEL_93;
  }
  v9 = 0;
  v10 = 0;
  while (1)
  {
    v11 = *(_QWORD *)(a2 + 24);
    switch(*(_DWORD *)(v11 + v9))
    {
      case 1:
        v12 = v11 + v9;
        v13 = *(unsigned int *)(v11 + v9 + 4);
        if (v13 >= *(_QWORD *)(a1 + 2080))
          v13 = *(_QWORD *)(a1 + 2080);
        *(_QWORD *)(a1 + 1040) = v13;
        if (*(_QWORD *)(a1 + 2088) < v13)
          v13 = *(_QWORD *)(a1 + 2088);
        *(_QWORD *)(a1 + 2088) = v13;
        *(_BYTE *)(a1 + 2096) = 1;
        hd_context_shrink_table_size((_QWORD *)(a1 + 992), a1 + 1056);
        *(_DWORD *)(a1 + 2852) = *(_DWORD *)(v12 + 4);
        goto LABEL_45;
      case 2:
        v14 = *(_DWORD *)(v11 + v9 + 4);
        if (v14 >= 2)
        {
          v45 = "SETTINGS: invalid SETTINGS_ENBLE_PUSH";
LABEL_106:
          v28 = a1;
          v29 = a2;
          v30 = 4294966791;
          return session_handle_invalid_connection(v28, v29, v30, v45);
        }
        if (v14)
          v15 = *(_BYTE *)(a1 + 2932) == 0;
        else
          v15 = 0;
        if (v15)
        {
          v45 = "SETTINGS: server attempted to enable push";
          goto LABEL_106;
        }
        *(_DWORD *)(a1 + 2856) = v14;
LABEL_45:
        ++v10;
        v9 += 8;
        if (v10 >= *(_QWORD *)(a2 + 16))
          goto LABEL_46;
        break;
      case 3:
        *(_DWORD *)(a1 + 2860) = *(_DWORD *)(v11 + v9 + 4);
        goto LABEL_45;
      case 4:
        v16 = v11 + v9;
        v17 = *(_DWORD *)(v11 + v9 + 4);
        if (v17 < 0)
        {
          v45 = "SETTINGS: too large SETTINGS_INITIAL_WINDOW_SIZE";
          v28 = a1;
          v29 = a2;
          v30 = 4294966772;
          return session_handle_invalid_connection(v28, v29, v30, v45);
        }
        v46 = a1;
        v18 = *(_DWORD *)(a1 + 2864);
        v47 = v17;
        v48 = v18;
        v19 = nghttp2_map_each(a1, update_remote_initial_window_size_func, (uint64_t)&v46);
        v20 = v19;
        if ((int)v19 < -900)
          return v20;
        if (!(_DWORD)v19)
        {
          *(_DWORD *)(a1 + 2864) = *(_DWORD *)(v16 + 4);
          goto LABEL_45;
        }
        v28 = a1;
        v29 = a2;
        v30 = 4294966772;
LABEL_105:
        v45 = 0;
        return session_handle_invalid_connection(v28, v29, v30, v45);
      case 5:
        v21 = *(_DWORD *)(v11 + v9 + 4);
        if ((v21 - 0x1000000) > 0xFF003FFF)
        {
          *(_DWORD *)(a1 + 2868) = v21;
          goto LABEL_45;
        }
        v45 = "SETTINGS: invalid SETTINGS_MAX_FRAME_SIZE";
        goto LABEL_106;
      case 6:
        *(_DWORD *)(a1 + 2872) = *(_DWORD *)(v11 + v9 + 4);
        goto LABEL_45;
      case 8:
        v22 = *(_DWORD *)(v11 + v9 + 4);
        if (v22 >= 2)
        {
          v45 = "SETTINGS: invalid SETTINGS_ENABLE_CONNECT_PROTOCOL";
        }
        else
        {
          if (*(_BYTE *)(a1 + 2932) || (!v22 ? (v23 = *(_DWORD *)(a1 + 2876) == 0) : (v23 = 1), v23))
          {
            *(_DWORD *)(a1 + 2876) = v22;
            goto LABEL_45;
          }
          v45 = "SETTINGS: server attempted to disable SETTINGS_ENABLE_CONNECT_PROTOCOL";
        }
        goto LABEL_106;
      case 9:
        v24 = *(_DWORD *)(v11 + v9 + 4);
        if (v24 >= 2)
        {
          v45 = "SETTINGS: invalid SETTINGS_NO_RFC7540_PRIORITIES";
        }
        else
        {
          v25 = *(_DWORD *)(a1 + 2880);
          if (v25 == -1 || v25 == v24)
          {
            *(_DWORD *)(a1 + 2880) = v24;
            goto LABEL_45;
          }
          v45 = "SETTINGS: SETTINGS_NO_RFC7540_PRIORITIES cannot be changed";
        }
        goto LABEL_106;
      default:
        goto LABEL_45;
    }
  }
}

uint64_t nghttp2_session_open_stream(uint64_t a1, int a2, uint64_t *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  char v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int v25;
  char v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  int v40;

  v10 = nghttp2_map_find((uint64_t *)a1, a2);
  v11 = v10;
  v12 = *(_BYTE *)(a1 + 2916);
  if (v10)
  {
    if (*(_DWORD *)(v10 + 204) != 5)
      __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1340, "stream->state == NGHTTP2_STREAM_IDLE");
    v13 = *(_BYTE *)(v10 + 216);
    if ((v13 & 0x10) == 0
      && !*(_QWORD *)(v10 + 96)
      && !*(_QWORD *)(v10 + 104)
      && !*(_QWORD *)(v10 + 112)
      && !*(_QWORD *)(v10 + 120))
    {
      __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1342, "(stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES) || nghttp2_stream_in_dep_tree(stream)");
    }
    v14 = *(_QWORD *)(v10 + 128);
    v15 = *(_QWORD *)(v10 + 136);
    v16 = (_QWORD *)(a1 + 2632);
    if (v14)
      v16 = (_QWORD *)(v14 + 136);
    *v16 = v15;
    if (v15)
      v17 = (_QWORD *)(v15 + 128);
    else
      v17 = (_QWORD *)(a1 + 2640);
    *v17 = v14;
    *(_QWORD *)(v10 + 128) = 0;
    *(_QWORD *)(v10 + 136) = 0;
    --*(_QWORD *)(a1 + 2736);
    if (*(_QWORD *)(v10 + 96)
      || *(_QWORD *)(v10 + 104)
      || *(_QWORD *)(v10 + 112)
      || (v18 = v10, *(_QWORD *)(v10 + 120)))
    {
      if ((v13 & 0x10) != 0)
        __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1347, "!(stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES)");
      nghttp2_stream_dep_remove(v10);
      if (v19)
        return 0;
      v18 = v11;
      if (*(_BYTE *)(a1 + 2930) == 1)
      {
        v18 = v11;
        if (!*(_BYTE *)(a1 + 2931))
        {
          *(_BYTE *)(v11 + 216) |= 0x10u;
          v18 = v11;
        }
      }
    }
  }
  else
  {
    v18 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(224, *(_QWORD *)(a1 + 2568));
    if (!v18)
      return v18;
  }
  v20 = v12 & 0x40;
  v40 = 0;
  v39 = 0;
  v21 = *(unsigned __int8 *)(a1 + 2930);
  if (v21 == 1 && !*(_BYTE *)(a1 + 2931) || *(_DWORD *)(a1 + 2880) == 1)
  {
    if (*(_BYTE *)(a1 + 2932) || *(_DWORD *)(a1 + 2880) == 1)
    {
      v39 = 0x1000000000;
      a3 = &v39;
    }
    v22 = 0;
    if (v21 == 1)
      v20 |= 0x10u;
    goto LABEL_48;
  }
  v23 = *(unsigned int *)a3;
  if (!(_DWORD)v23)
  {
    v22 = 0;
    goto LABEL_48;
  }
  v24 = (_QWORD *)nghttp2_map_find((uint64_t *)a1, *(_DWORD *)a3);
  v22 = (uint64_t)v24;
  if (v24)
  {
    if (v24[12] || v24[13] || v24[14] || v24[15])
      goto LABEL_48;
LABEL_47:
    v39 = 0x1000000000;
    a3 = &v39;
    goto LABEL_48;
  }
  if ((v23 & 1) == (*(_BYTE *)(a1 + 2932) == 0))
    v25 = *(_DWORD *)(a1 + 2804);
  else
    v25 = *(_DWORD *)(a1 + 2808);
  if (v25 >= (int)v23)
    goto LABEL_47;
  v39 = 0x1000000000;
  v22 = nghttp2_session_open_stream(a1, v23, &v39, 5, 0);
  if (!v22)
  {
    if (v11)
      return 0;
LABEL_93:
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v18, *(_QWORD *)(a1 + 2568));
    return 0;
  }
LABEL_48:
  v26 = v20 | (a4 == 4);
  if (v11)
  {
    *(_BYTE *)(v18 + 216) = v26;
    *(_DWORD *)(v18 + 204) = a4;
    *(_DWORD *)(v18 + 192) = *((_DWORD *)a3 + 1);
    *(_QWORD *)(v18 + 144) = a5;
    goto LABEL_50;
  }
  v27 = *((_DWORD *)a3 + 1);
  v28 = *(_DWORD *)(a1 + 2864);
  v29 = *(_DWORD *)(a1 + 2896);
  *(_QWORD *)(v18 + 8) = 0;
  *(_QWORD *)(v18 + 16) = a1 + 2568;
  *(_QWORD *)(v18 + 24) = 0;
  *(_QWORD *)(v18 + 32) = 0;
  *(_QWORD *)(v18 + 40) = stream_less;
  *(_BYTE *)(v18 + 216) = v26;
  *(_DWORD *)(v18 + 204) = a4;
  *(_QWORD *)(v18 + 144) = a5;
  *(_QWORD *)(v18 + 152) = 0;
  *(_DWORD *)(v18 + 168) = a2;
  *(_DWORD *)(v18 + 172) = v28;
  *(_QWORD *)(v18 + 176) = 0;
  *(_DWORD *)(v18 + 184) = 0;
  *(_DWORD *)(v18 + 188) = v29;
  *(_OWORD *)(v18 + 112) = 0u;
  *(_OWORD *)(v18 + 128) = 0u;
  *(_DWORD *)(v18 + 192) = v27;
  *(_DWORD *)(v18 + 212) = 0;
  *(_WORD *)(v18 + 208) = -1;
  *(_QWORD *)(v18 + 196) = 0;
  *(_QWORD *)(v18 + 160) = 0;
  *(_OWORD *)(v18 + 80) = 0u;
  *(_OWORD *)(v18 + 96) = 0u;
  *(_OWORD *)(v18 + 48) = xmmword_1DF25D870;
  *(_OWORD *)(v18 + 64) = 0u;
  *(_BYTE *)(v18 + 221) = 3;
  *(_DWORD *)(v18 + 217) = 50331648;
  if (*(_BYTE *)(a1 + 2930) == 1 && !*(_BYTE *)(a1 + 2931))
  {
    v30 = *(_QWORD *)(a1 + 2688);
    *(_QWORD *)(a1 + 2688) = v30 + 1;
    *(_QWORD *)(v18 + 88) = v30;
  }
  v31 = *(_DWORD *)(a1 + 24);
  if (4 * *(_QWORD *)(a1 + 16) + 4 > (unint64_t)(3 * v31))
  {
    if (v31)
    {
      if (v31 < 0)
        goto LABEL_92;
      v32 = 2 * v31;
      v33 = *(_DWORD *)(a1 + 28) + 1;
      v34 = a1;
    }
    else
    {
      v34 = a1;
      v32 = 16;
      v33 = 4;
    }
    if (!map_resize(v34, v32, v33))
      goto LABEL_91;
LABEL_92:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v18 + 16) + 16))(*(_QWORD *)(v18 + 8), **(_QWORD **)(v18 + 16));
    *(_QWORD *)(v18 + 8) = 0;
    goto LABEL_93;
  }
LABEL_91:
  if (insert(*(_QWORD *)a1, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), -1640531527 * a2, a2, v18))
    goto LABEL_92;
  ++*(_QWORD *)(a1 + 16);
LABEL_50:
  if (a4 == 5)
  {
    v35 = *(_QWORD *)(a1 + 2640);
    if (v35)
    {
      *(_QWORD *)(v35 + 136) = v18;
      *(_QWORD *)(v18 + 128) = v35;
    }
    else
    {
      *(_QWORD *)(a1 + 2632) = v18;
    }
    *(_QWORD *)(a1 + 2640) = v18;
    ++*(_QWORD *)(a1 + 2736);
  }
  else if (a4 == 4)
  {
    if (a2 && ((a2 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) == 0)
    {
      *(_BYTE *)(v18 + 217) |= 1u;
    }
    else
    {
      *(_BYTE *)(v18 + 217) |= 2u;
      ++*(_QWORD *)(a1 + 2712);
    }
  }
  else if (a2 && ((a2 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) == 0)
  {
    ++*(_QWORD *)(a1 + 2696);
  }
  else
  {
    ++*(_QWORD *)(a1 + 2704);
  }
  if ((*(_BYTE *)(v18 + 216) & 0x10) == 0)
  {
    if (*(_DWORD *)a3)
      v36 = v22;
    else
      v36 = a1 + 32;
    if (!v36)
      __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1478, "dep_stream");
    if (*((_BYTE *)a3 + 8))
    {
      *(_DWORD *)(v18 + 200) = *(_DWORD *)(v36 + 200);
      *(_DWORD *)(v36 + 200) = *(_DWORD *)(v18 + 192);
      v37 = *(_QWORD *)(v36 + 104);
      if (v37)
      {
        while (1)
        {
          *(_QWORD *)(v37 + 96) = v18;
          if (*(_BYTE *)(v37 + 218))
          {
            if (stream_obq_move(v18, v36, v37))
              return 0;
          }
          v37 = *(_QWORD *)(v37 + 120);
          if (!v37)
          {
            if ((!*(_QWORD *)(v18 + 152) || (*(_BYTE *)(v18 + 216) & 0xC) != 0) && !*(_QWORD *)(v18 + 24)
              || !stream_obq_push(v36, (uint64_t *)v18))
            {
              *(_QWORD *)(v18 + 104) = *(_QWORD *)(v36 + 104);
              goto LABEL_88;
            }
            return 0;
          }
        }
      }
      goto LABEL_88;
    }
    *(_DWORD *)(v36 + 200) += *(_DWORD *)(v18 + 192);
    if (!*(_QWORD *)(v36 + 104))
    {
LABEL_88:
      *(_QWORD *)(v36 + 104) = v18;
      *(_QWORD *)(v18 + 96) = v36;
      return v18;
    }
    insert_link_dep(v36, (_QWORD *)v18);
  }
  return v18;
}

uint64_t nghttp2_http_record_request_method(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *i;
  int *v9;
  int v10;
  int v11;
  uint64_t v13;
  int *v14;
  int v15;
  int v16;
  int v18;

  v2 = *(unsigned __int8 *)(a2 + 12);
  if (v2 == 5)
  {
    v3 = (uint64_t *)(a2 + 24);
    v4 = (uint64_t *)(a2 + 32);
  }
  else
  {
    if (v2 != 1)
      return result;
    v3 = (uint64_t *)(a2 + 40);
    v4 = (uint64_t *)(a2 + 48);
  }
  v5 = *v4;
  if (*v4)
  {
    v6 = 0;
    v7 = *v3;
    for (i = (_QWORD *)(v7 + 16); ; i += 5)
    {
      if (*i == 7)
      {
        v9 = (int *)*(i - 2);
        if (*((_BYTE *)v9 + 6) == 100)
        {
          v10 = *v9;
          v11 = *((unsigned __int16 *)v9 + 2);
          if (v10 == 1952804154 && v11 == 28520)
            break;
        }
      }
      if (v5 == ++v6)
        return result;
    }
    v13 = *(_QWORD *)(v7 + 40 * v6 + 24);
    if (v13 == 4)
    {
      if (**(_DWORD **)(v7 + 40 * v6 + 8) != 1145128264)
        return result;
      v18 = 256;
    }
    else
    {
      if (v13 != 7)
        return result;
      v14 = *(int **)(v7 + 40 * v6 + 8);
      v15 = *v14;
      v16 = *(int *)((char *)v14 + 3);
      if (v15 != 1313754947 || v16 != 1413694798)
        return result;
      v18 = 128;
    }
    *(_DWORD *)(result + 212) |= v18;
  }
  return result;
}

uint64_t nghttp2_frame_pack_headers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t **v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  unsigned int v12;
  uint64_t **v13;
  int64_t v14;

  v3 = *(uint64_t ***)a1;
  if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8))
    __assert_rtn("nghttp2_frame_pack_headers", "nghttp2_frame.c", 367, "bufs->head == bufs->cur");
  if ((*(_BYTE *)(a2 + 13) & 0x20) != 0)
    v6 = -5;
  else
    v6 = 0;
  v7 = 5;
  if ((*(_BYTE *)(a2 + 13) & 0x20) == 0)
    v7 = 0;
  v8 = (uint64_t *)((char *)v3[3] + v7);
  v3[3] = v8;
  v3[4] = v8;
  v9 = nghttp2_hd_deflate_hd_bufs(a3, a1, *(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 48));
  if (v9 == -502)
    v10 = 4294966773;
  else
    v10 = v9;
  v11 = (uint64_t *)((char *)v3[3] + v6);
  v3[3] = v11;
  if (!(_DWORD)v10)
  {
    if ((*(_BYTE *)(a2 + 13) & 0x20) != 0)
    {
      v12 = bswap32(*(_DWORD *)(a2 + 24));
      *(_DWORD *)v11 = v12;
      if (*(_BYTE *)(a2 + 32))
        *(_BYTE *)v11 = v12 | 0x80;
      *((_BYTE *)v11 + 4) = *(_BYTE *)(a2 + 28) - 1;
    }
    *(_QWORD *)(a2 + 16) = 0;
    v13 = *(uint64_t ***)a1;
    if (*(_QWORD *)a1)
    {
      v14 = 0;
      do
      {
        v14 = (char *)v13[4] + v14 - (char *)v13[3];
        v13 = (uint64_t **)*v13;
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }
    *(_QWORD *)a2 = v14;
    frame_pack_headers_shared((uint64_t ***)a1, a2);
  }
  return v10;
}

uint64_t insert(uint64_t a1, int a2, char a3, unsigned int a4, int a5, uint64_t a6)
{
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4 >> -a3;
  v7 = (unsigned int *)(a1 + 16 * v6);
  v8 = *((_QWORD *)v7 + 1);
  if (v8)
  {
    v9 = 0;
    v10 = 32 - a3;
    v11 = a2 - 1;
    do
    {
      v12 = *v7;
      v13 = a1 + 16 * v6;
      v16 = *(_DWORD *)(v13 + 4);
      v14 = (_DWORD *)(v13 + 4);
      v15 = v16;
      if (v9 <= (((_DWORD)v6 - (*v7 >> v10)) & v11))
      {
        if (v15 == a5)
          return 4294966795;
      }
      else
      {
        *v7 = a4;
        *v14 = a5;
        a4 = v12;
        a5 = v15;
        *(_QWORD *)(a1 + 16 * v6 + 8) = a6;
        a6 = v8;
        v9 = ((_DWORD)v6 - (v12 >> v10)) & v11;
      }
      ++v9;
      v6 = ((_DWORD)v6 + 1) & v11;
      v7 = (unsigned int *)(a1 + 16 * v6);
      v8 = *((_QWORD *)v7 + 1);
    }
    while (v8);
  }
  v17 = 0;
  *v7 = a4;
  v18 = a1 + 16 * v6;
  *(_DWORD *)(v18 + 4) = a5;
  *(_QWORD *)(v18 + 8) = a6;
  return v17;
}

uint64_t ***frame_pack_headers_shared(uint64_t ***result, uint64_t a2)
{
  unsigned int v2;
  char v3;
  char v4;
  uint64_t *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t *v8;
  uint64_t *i;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;

  v2 = *(_DWORD *)(a2 + 8);
  v3 = *(_BYTE *)(a2 + 12);
  v4 = *(_BYTE *)(a2 + 13);
  v5 = (*result)[3];
  v6 = *((_DWORD *)*result + 8) - (_DWORD)v5;
  if (*result != result[1])
    v4 &= ~4u;
  (*result)[3] = (uint64_t *)((char *)v5 - 9);
  *(_DWORD *)((char *)v5 - 9) = bswap32(v6) >> 8;
  *((_BYTE *)v5 - 6) = v3;
  *((_BYTE *)v5 - 5) = v4;
  v7 = bswap32(v2);
  *((_DWORD *)v5 - 1) = v7;
  v8 = (uint64_t *)result[1];
  if (*result != (uint64_t **)v8)
  {
    for (i = **result; i != v8; i = (uint64_t *)*i)
    {
      v10 = i[3];
      v11 = *((_DWORD *)i + 8) - v10;
      i[3] = v10 - 9;
      *(_DWORD *)(v10 - 9) = bswap32(v11) >> 8;
      *(_WORD *)(v10 - 6) = 9;
      *(_DWORD *)(v10 - 4) = v7;
    }
    v12 = v8[3];
    v13 = *((_DWORD *)v8 + 8) - v12;
    v8[3] = v12 - 9;
    *(_DWORD *)(v12 - 9) = bswap32(v13) >> 8;
    *(_BYTE *)(v12 - 6) = 9;
    *(_BYTE *)(v12 - 5) = 4;
    *(_DWORD *)(v12 - 4) = v7;
  }
  return result;
}

uint64_t nghttp2_http_on_response_headers(uint64_t a1)
{
  int v1;
  uint64_t v2;
  __int16 v3;

  v1 = *(_DWORD *)(a1 + 212);
  if ((v1 & 0x20) == 0)
    return 0xFFFFFFFFLL;
  v3 = *(_WORD *)(a1 + 208);
  if ((unsigned __int16)(v3 - 100) > 0x63u)
  {
    *(_DWORD *)(a1 + 212) = v1 & 0xFFFFBFFF;
    if ((v1 & 0x100) != 0 || (v3 - 100) < 0x64 || v3 == 304 || v3 == 204)
    {
      v2 = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }
    else
    {
      v2 = 0;
      if ((v1 & 0x480) != 0)
        *(_QWORD *)(a1 + 48) = -1;
    }
  }
  else
  {
    v2 = 0;
    *(_DWORD *)(a1 + 212) = *(_DWORD *)(a1 + 212) & 0x780 | 0x4000;
    *(_QWORD *)(a1 + 48) = -1;
    *(_WORD *)(a1 + 208) = -1;
  }
  return v2;
}

uint64_t session_process_headers_frame(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, _QWORD);
  int v22;
  unsigned int v23;
  unint64_t v24;
  int v25;
  uint64_t v27;

  v2 = a1 + 728;
  v3 = (uint64_t *)(a1 + 752);
  if ((*(_BYTE *)(a1 + 741) & 0x20) != 0)
  {
    v6 = *(unsigned int **)(a1 + 848);
    v7 = *v6;
    v5 = bswap32(*v6 & 0xFFFFFF7F);
    LODWORD(v6) = *((unsigned __int8 *)v6 + 4) + 1;
    *(_DWORD *)(a1 + 752) = v5;
    *(_DWORD *)(a1 + 756) = (_DWORD)v6;
    v4 = (v7 >> 7) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
    v5 = 0;
    *v3 = 0x1000000000;
  }
  *(_BYTE *)(a1 + 760) = v4;
  *(_QWORD *)(a1 + 776) = 0;
  *(_QWORD *)(a1 + 768) = 0;
  v8 = *(_DWORD *)(a1 + 736);
  v9 = nghttp2_map_find((uint64_t *)a1, v8);
  if (!v9 || (*(_BYTE *)(v9 + 216) & 2) != 0)
    goto LABEL_9;
  v10 = *(_DWORD *)(v9 + 204);
  if (v10 == 1)
  {
    if (v8)
    {
      if ((v8 & 1) == (*(_BYTE *)(a1 + 2932) == 0))
      {
        *(_DWORD *)(a1 + 784) = 1;
        if (*(_DWORD *)(v9 + 204) != 1)
          __assert_rtn("nghttp2_session_on_response_headers_received", "nghttp2_session.c", 4318, "stream->state == NGHTTP2_STREAM_OPENING && nghttp2_session_is_my_stream_id(session, frame->hd.stream_id)");
        if ((*(_BYTE *)(v9 + 217) & 1) == 0)
        {
          *(_DWORD *)(v9 + 204) = 2;
          goto LABEL_51;
        }
        goto LABEL_49;
      }
      *(_DWORD *)(a1 + 784) = 3;
LABEL_35:
      if ((*(_BYTE *)(v9 + 217) & 1) == 0)
      {
        v17 = *(_DWORD *)(v9 + 204);
        if (((v8 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) != 0)
        {
          if (v17 != 3)
            goto LABEL_51;
        }
        else if (v17 == 2)
        {
          goto LABEL_51;
        }
        return 4294967193;
      }
LABEL_49:
      v12 = "HEADERS: stream closed";
      v18 = a1;
      v19 = v2;
      v20 = 4294966786;
LABEL_64:
      v25 = session_handle_invalid_connection(v18, v19, v20, v12);
      goto LABEL_65;
    }
    *(_DWORD *)(a1 + 784) = 3;
LABEL_44:
    v12 = "HEADERS: stream_id == 0";
    goto LABEL_63;
  }
  if (v10 == 4)
  {
    *(_DWORD *)(a1 + 784) = 2;
    if (*(_DWORD *)(v9 + 204) != 4)
      __assert_rtn("nghttp2_session_on_push_response_headers_received", "nghttp2_session.c", 4347, "stream->state == NGHTTP2_STREAM_RESERVED");
    if (!v8)
    {
      v12 = "push response HEADERS: stream_id == 0";
      goto LABEL_63;
    }
    if (*(_BYTE *)(a1 + 2932))
    {
      v12 = "HEADERS: no HEADERS allowed from client in reserved state";
      goto LABEL_63;
    }
    v24 = *(_QWORD *)(a1 + 2704);
    if (v24 >= *(unsigned int *)(a1 + 2892))
    {
      v12 = "push response HEADERS: max concurrent streams exceeded";
      goto LABEL_63;
    }
    if ((*(_BYTE *)(a1 + 2933) & 5) == 0)
    {
      if (v24 < *(unsigned int *)(a1 + 2920))
      {
        *(_DWORD *)(v9 + 204) = 2;
        *(_BYTE *)(v9 + 216) &= ~1u;
        if ((*(_BYTE *)(v9 + 168) & 1) == 0)
          --*(_QWORD *)(a1 + 2712);
        *(_QWORD *)(a1 + 2704) = v24 + 1;
        goto LABEL_51;
      }
LABEL_77:
      v25 = session_handle_invalid_stream2(a1, v8, v2, 4294966763);
LABEL_65:
      if (v25 <= -901)
        return v25;
      else
        return 4294967193;
    }
    return 4294967193;
  }
  if (v10 != 5)
  {
    *(_DWORD *)(a1 + 784) = 3;
    if (v8)
      goto LABEL_35;
    goto LABEL_44;
  }
LABEL_9:
  *(_DWORD *)(a1 + 784) = 0;
  if (!v8)
  {
    v12 = "request HEADERS: stream_id == 0";
    goto LABEL_63;
  }
  if (!*(_BYTE *)(a1 + 2932) && (~*(_DWORD *)(a1 + 2916) & 0x84) != 0)
  {
    if ((v8 & 1) != 0)
      v16 = *(_DWORD *)(a1 + 2804);
    else
      v16 = *(_DWORD *)(a1 + 2808);
    if (v16 < v8)
    {
      v12 = "request HEADERS: client received request";
      goto LABEL_63;
    }
    return 4294967193;
  }
  if ((v8 & 1) == (*(_BYTE *)(a1 + 2932) == 0))
  {
    v12 = "request HEADERS: invalid stream_id";
    goto LABEL_63;
  }
  if (*(_DWORD *)(a1 + 2808) >= v8)
  {
    v13 = nghttp2_map_find((uint64_t *)a1, v8);
    if (v13)
    {
      v14 = 4294967193;
      if ((*(_BYTE *)(v13 + 217) & 1) != 0)
      {
        v15 = session_handle_invalid_connection(a1, v2, 4294966786, "HEADERS: stream closed");
        if (v15 <= -901)
          return v15;
        else
          return 4294967193;
      }
      return v14;
    }
    return 4294967193;
  }
  *(_DWORD *)(a1 + 2808) = v8;
  v11 = *(_QWORD *)(a1 + 2704);
  if (v11 >= *(unsigned int *)(a1 + 2892))
  {
    v12 = "request HEADERS: max concurrent streams exceeded";
    goto LABEL_63;
  }
  if ((*(_BYTE *)(a1 + 2933) & 5) != 0)
    return 4294967193;
  if (v5 == v8)
  {
    v12 = "request HEADERS: depend on itself";
LABEL_63:
    v18 = a1;
    v19 = v2;
    v20 = 4294966791;
    goto LABEL_64;
  }
  if (v11 >= *(unsigned int *)(a1 + 2920))
    goto LABEL_77;
  if (!nghttp2_session_open_stream(a1, v8, v3, 1, 0))
    return 4294966395;
  nghttp2_session_adjust_closed_stream(a1);
  v14 = v27;
  if ((int)v27 >= -900)
  {
    *(_DWORD *)(a1 + 2812) = *(_DWORD *)(a1 + 2808);
LABEL_51:
    v21 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 2432);
    if (v21)
    {
      v22 = v21(a1, v2, *(_QWORD *)(a1 + 2608));
      if (v22)
        v23 = -902;
      else
        v23 = 0;
      if (v22 == -521)
        return 4294966775;
      else
        return v23;
    }
    else
    {
      return 0;
    }
  }
  return v14;
}

uint64_t parse_uint(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  int v5;
  uint64_t v7;

  if (a2)
  {
    result = 0;
    while (1)
    {
      v5 = *a1++;
      v4 = v5;
      if ((v5 - 58) < 0xFFFFFFF6 || result > 0xCCCCCCCCCCCCCCCLL)
        break;
      v7 = (v4 - 48);
      if (10 * result > (v7 ^ 0x7FFFFFFFFFFFFFFFLL))
        break;
      result = v7 + 10 * result;
      if (!--a2)
        return result;
    }
  }
  return -1;
}

uint64_t session_detach_stream_item(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = nghttp2_stream_detach_item(a2);
  if ((*(_BYTE *)(a2 + 216) & 0x10) != 0)
  {
    if (*(_BYTE *)(a2 + 218))
      return session_ob_data_remove(a1, a2);
  }
  return result;
}

uint64_t insert_link_dep(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  if (a2[14])
    __assert_rtn("insert_link_dep", "nghttp2_stream.c", 668, "stream->sib_prev == NULL");
  v2 = *(_QWORD *)(result + 104);
  a2[15] = v2;
  if (v2)
    *(_QWORD *)(v2 + 112) = a2;
  *(_QWORD *)(result + 104) = a2;
  a2[12] = result;
  return result;
}

uint64_t map_resize(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v6 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 24))(a2, 16, **(_QWORD **)(a1 + 8));
  if (!v6)
    return 4294966395;
  v7 = v6;
  v8 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v8)
  {
    v9 = 0;
    for (i = 0; i < v8; ++i)
    {
      v11 = *(_QWORD *)a1 + v9;
      v12 = *(_QWORD *)(v11 + 8);
      if (v12)
      {
        if (insert(v7, a2, a3, *(_DWORD *)v11, *(_DWORD *)(v11 + 4), v12))
          __assert_rtn("map_resize", "nghttp2_map.c", 207, "0 == rv");
        v8 = *(unsigned int *)(a1 + 24);
      }
      v9 += 16;
    }
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)a1, **(_QWORD **)(a1 + 8));
  result = 0;
  *(_DWORD *)(a1 + 24) = a2;
  *(_DWORD *)(a1 + 28) = a3;
  *(_QWORD *)a1 = v7;
  return result;
}

uint64_t session_defer_stream_item(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v4;
  char v5;

  if (!*(_QWORD *)(a2 + 152))
    __assert_rtn("nghttp2_stream_defer_item", "nghttp2_stream.c", 518, "stream->item");
  v4 = result;
  v5 = *(_BYTE *)(a2 + 216) | a3;
  *(_BYTE *)(a2 + 216) = v5;
  if ((v5 & 0x10) != 0 || !*(_QWORD *)(a2 + 24) && (result = stream_obq_remove(a2), (*(_BYTE *)(a2 + 216) & 0x10) != 0))
  {
    if (*(_BYTE *)(a2 + 218))
      return session_ob_data_remove(v4, a2);
  }
  return result;
}

uint64_t session_process_window_update_frame(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  char v13;
  int v14;
  unsigned int (*v15)(uint64_t, uint64_t, _QWORD);
  int v16;
  int v17;

  v1 = a1;
  v2 = a1 + 728;
  v3 = **(_DWORD **)(a1 + 848) & 0xFFFFFF7F;
  v4 = bswap32(v3);
  *(_DWORD *)(a1 + 744) = v4;
  v5 = *(_DWORD *)(a1 + 736);
  if (!v5)
  {
    if (v3)
    {
      v8 = *(_DWORD *)(a1 + 2828);
      if ((int)(v4 ^ 0x7FFFFFFF) < v8)
      {
        v9 = a1 + 728;
        v10 = 4294966772;
        v11 = 0;
        return session_handle_invalid_connection(a1, v9, v10, v11);
      }
      *(_DWORD *)(a1 + 2828) = v8 + v4;
LABEL_18:
      v15 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v1 + 2376);
      if (v15 && v15(v1, v2, *(_QWORD *)(v1 + 2608)))
        return 4294966394;
      return 0;
    }
LABEL_26:
    v11 = "WINDOW_UPDATE: window_size_increment == 0";
    goto LABEL_27;
  }
  v6 = *(unsigned __int8 *)(a1 + 2932);
  if ((*(_DWORD *)(a1 + 736) & 1) == (*(_BYTE *)(a1 + 2932) == 0))
    v7 = *(_DWORD *)(a1 + 2804);
  else
    v7 = *(_DWORD *)(a1 + 2808);
  if (v7 < v5)
  {
    v11 = "WINDOW_UPDATE to idle stream";
LABEL_27:
    a1 = v1;
    v9 = v2;
    v10 = 4294966791;
    return session_handle_invalid_connection(a1, v9, v10, v11);
  }
  result = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
  if (result)
  {
    v13 = *(_BYTE *)(result + 216);
    if ((v13 & 2) != 0)
      return 0;
    v14 = *(_DWORD *)(result + 204);
    if (v14 == 5)
      return 0;
    if (v14 == 4 && (!*(_DWORD *)(result + 168) || (*(_DWORD *)(result + 168) & 1) != (v6 == 0)))
    {
      v11 = "WINDOW_UPADATE to reserved stream";
      goto LABEL_27;
    }
    if (v3)
    {
      v16 = *(_DWORD *)(result + 172);
      if ((int)(v4 ^ 0x7FFFFFFF) < v16)
        return session_handle_invalid_stream2(v1, v5, v2, 4294966772);
      v17 = v16 + v4;
      *(_DWORD *)(result + 172) = v17;
      if (v17 >= 1)
      {
        if (*(_QWORD *)(result + 152))
        {
          if ((v13 & 4) != 0)
          {
            result = session_resume_deferred_stream_item(v1, result, 4);
            if ((int)result < -900)
              return result;
          }
        }
      }
      goto LABEL_18;
    }
    goto LABEL_26;
  }
  return result;
}

_QWORD *hd_context_shrink_table_size(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t *v11;

  if (result[5] > result[6])
  {
    v3 = result;
    v4 = result[4];
    do
    {
      v5 = v3[3];
      if (!v5)
        break;
      v6 = (uint64_t *)hd_ringbuf_get(v3, v5 - 1);
      v7 = v6[1];
      v3[5] = v3[5] - (*(_QWORD *)(*v6 + 24) + *(_QWORD *)(v7 + 24)) - 32;
      v8 = v3[3];
      if (!v8)
        __assert_rtn("hd_ringbuf_pop_back", "nghttp2_hd.c", 670, "ringbuf->len > 0");
      v3[3] = v8 - 1;
      if (a2)
      {
        v9 = (uint64_t **)(a2 + 8 * (*((_DWORD *)v6 + 19) & 0x7F));
        v10 = *v9;
        if (*v9)
        {
          if (v10 == v6)
          {
LABEL_11:
            *v9 = (uint64_t *)v6[8];
            v6[8] = 0;
            v7 = v6[1];
          }
          else
          {
            while (1)
            {
              v11 = v10;
              v10 = (uint64_t *)v10[8];
              if (!v10)
                break;
              if (v10 == v6)
              {
                v9 = (uint64_t **)(v11 + 8);
                goto LABEL_11;
              }
            }
          }
        }
      }
      nghttp2_rcbuf_decref(v7);
      nghttp2_rcbuf_decref(*v6);
      result = (_QWORD *)(*(uint64_t (**)(uint64_t *, _QWORD))(v4 + 16))(v6, *(_QWORD *)v4);
    }
    while (v3[5] > v3[6]);
  }
  return result;
}

uint64_t nghttp2_option_new(_QWORD *a1)
{
  void *v2;

  v2 = malloc_type_calloc(1uLL, 0x88uLL, 0x1000040B5CA6940uLL);
  *a1 = v2;
  if (v2)
    return 0;
  else
    return 4294966395;
}

uint64_t nghttp2_session_resume_data(uint64_t *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t result;
  uint64_t v7;

  v3 = nghttp2_map_find(a1, a2);
  if (!v3)
    return 4294966795;
  v4 = v3;
  v5 = *(_BYTE *)(v3 + 216);
  if ((v5 & 2) != 0 || *(_DWORD *)(v3 + 204) == 5)
    return 4294966795;
  v7 = *(_QWORD *)(v3 + 152);
  result = 4294966795;
  if (v7 && (v5 & 0xC) != 0)
  {
    LODWORD(result) = session_resume_deferred_stream_item((uint64_t)a1, v4, 8);
    if ((int)result <= -901)
      return result;
    else
      return 0;
  }
  return result;
}

uint64_t session_resume_deferred_stream_item(uint64_t a1, uint64_t a2, char a3)
{
  char v5;
  uint64_t result;

  if (!*(_QWORD *)(a2 + 152))
    __assert_rtn("nghttp2_stream_resume_deferred_item", "nghttp2_stream.c", 533, "stream->item");
  v5 = *(_BYTE *)(a2 + 216) & ~a3;
  *(_BYTE *)(a2 + 216) = v5;
  if ((v5 & 0x1C) == 0)
  {
    result = stream_obq_push(*(_QWORD *)(a2 + 96), (uint64_t *)a2);
    if ((_DWORD)result)
      return result;
    v5 = *(_BYTE *)(a2 + 216);
  }
  if ((v5 & 0x1C) == 0x10)
    return session_ob_data_push(a1, a2);
  else
    return 0;
}

uint64_t nghttp2_session_pack_data(uint64_t a1, uint64_t *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  uint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  uint64_t v31;

  v6 = (_QWORD *)*a2;
  if (*a2 != a2[1])
    __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7734, "bufs->head == bufs->cur");
  v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 2496);
  if (v13
    || (v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 2488)) != 0)
  {
    v14 = v13(a1, *(unsigned __int8 *)(a4 + 12), *(unsigned int *)(a6 + 168), *(unsigned int *)(a1 + 2828), *(unsigned int *)(a6 + 172), *(unsigned int *)(a1 + 2868), *(_QWORD *)(a1 + 2608));
    v15 = *(_DWORD *)(a6 + 172);
    if (v14 < v15)
      v15 = v14;
    if (v15 >= *(_DWORD *)(a1 + 2828))
      v15 = *(_DWORD *)(a1 + 2828);
    if (v15 >= *(_DWORD *)(a1 + 2868))
      v15 = *(_DWORD *)(a1 + 2868);
    if (v15 < 1)
      return 4294966394;
    v16 = v15;
    if (v6[2] - v6[4] >= (unint64_t)v15)
      goto LABEL_16;
    if (*(_QWORD *)(a1 + 712) <= (unint64_t)(v15 + 10))
    {
      v31 = 0;
      if (!buf_chain_new(&v31, v15 + 10, *(_QWORD **)(a1 + 672)))
      {
        nghttp2_bufs_free((_QWORD **)(a1 + 656));
        v17 = v31;
        *(_QWORD *)(a1 + 656) = v31;
        *(_QWORD *)(a1 + 664) = v17;
        v18 = *(_QWORD *)(a1 + 712);
        v19 = *(_QWORD *)(v17 + 24) + v18;
        v20 = *(_QWORD *)(v17 + 32) + v18;
        *(_QWORD *)(v17 + 24) = v19;
        *(_QWORD *)(v17 + 32) = v20;
        *(_QWORD *)(a1 + 680) = v16 + 10;
        *(_QWORD *)(a1 + 696) = 1;
        if ((uint64_t *)(a1 + 656) != a2)
          __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7777, "&session->aob.framebufs == bufs");
        v6 = (_QWORD *)a2[1];
LABEL_16:
        a3 = v16;
      }
    }
  }
  if (v6[2] - v6[4] < a3)
    __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7786, "nghttp2_buf_avail(buf) >= datamax");
  v30 = 0;
  if ((*(_DWORD *)a5 - 1) >= 2)
    __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7803, "0");
  result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, unint64_t, int *, uint64_t, _QWORD))(a5 + 16))(a1, *(unsigned int *)(a4 + 8), v6[3], a3, &v30, a5 + 8, *(_QWORD *)(a1 + 2608));
  v22 = result;
  if ((unint64_t)(result + 526) > 0x12 || ((1 << (result + 14)) & 0x40021) == 0)
  {
    result = 4294966394;
    if ((v22 & 0x8000000000000000) == 0 && a3 >= v22)
    {
      v24 = v6[3];
      v6[3] = v24 - 9;
      v6[4] = v24 + v22;
      *(_BYTE *)(a4 + 13) = 0;
      v25 = v30;
      if ((v30 & 1) != 0)
      {
        *(_BYTE *)(a5 + 25) = 1;
        if ((v25 & 2) == 0 && (*(_BYTE *)(a5 + 24) & 1) != 0)
          *(_BYTE *)(a4 + 13) |= 1u;
      }
      if ((v25 & 4) == 0)
        goto LABEL_33;
      if (*(_QWORD *)(a1 + 2512))
      {
        *(_BYTE *)(a5 + 26) = 1;
LABEL_33:
        *(_QWORD *)a4 = v22;
        *(_QWORD *)(a4 + 16) = 0;
        if (a3 >= v22 + 256)
          v26 = v22 + 256;
        else
          v26 = a3;
        result = session_call_select_padding((_QWORD *)a1, (uint64_t *)a4, v26);
        if ((int)result >= -900)
        {
          *(_QWORD *)(a4 + 16) = result - v22;
          v27 = v6[3];
          *(_DWORD *)v27 = bswap32(*(_DWORD *)a4) >> 8;
          *(_BYTE *)(v27 + 3) = *(_BYTE *)(a4 + 12);
          *(_BYTE *)(v27 + 4) = *(_BYTE *)(a4 + 13);
          *(_DWORD *)(v27 + 5) = bswap32(*(_DWORD *)(a4 + 8));
          nghttp2_frame_add_pad(a2, a4, *(_QWORD *)(a4 + 16), *(unsigned __int8 *)(a5 + 26));
          v28 = **(_QWORD **)(a6 + 152);
          *(_QWORD *)(a6 + 160) = v28;
          if ((*(_BYTE *)(a6 + 216) & 0x10) != 0)
          {
            if (*(_BYTE *)(a1 + 2932))
            {
              if ((*(_BYTE *)(a6 + 220) & 0x7Fu) >= 8)
                __assert_rtn("session_sched_reschedule_stream", "nghttp2_session.c", 1100, "urgency < NGHTTP2_EXTPRI_URGENCY_LEVELS");
              if ((*(_BYTE *)(a6 + 220) & 0x80) != 0)
              {
                v29 = (uint64_t *)(a1 + 40 * (*(_BYTE *)(a6 + 220) & 0x7F) + 328);
                if (v29[2] != 1)
                {
                  nghttp2_pq_remove((uint64_t)v29, (unint64_t *)a6);
                  *(_QWORD *)(a6 + 72) += v28;
                  if (nghttp2_pq_push(v29, (unint64_t *)a6))
                    __assert_rtn("session_sched_reschedule_stream", "nghttp2_session.c", 1114, "0 == rv");
                }
              }
            }
          }
          else
          {
            nghttp2_stream_reschedule(a6);
          }
          if (*(_QWORD *)a4 || (~v30 & 3) != 0)
            return 0;
          else
            return 4294966761;
        }
        return result;
      }
      return 4294966394;
    }
  }
  return result;
}

uint64_t session_headers_add_pad(_QWORD *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t result;
  uint64_t *v6;
  uint64_t v7;

  if ((unint64_t)(*a2 + 256) >= 0x4000)
    v4 = 0x4000;
  else
    v4 = *a2 + 256;
  result = session_call_select_padding(a1, a2, v4);
  if ((int)result >= -900)
  {
    v6 = a1 + 82;
    v7 = result - *a2;
    nghttp2_frame_add_pad(v6, (uint64_t)a2, v7, 0);
    result = 0;
    a2[2] = v7;
  }
  return result;
}

uint64_t session_call_select_padding(_QWORD *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t (*v5)(_QWORD *, uint64_t *, uint64_t, _QWORD);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v3 = *a2;
  if (*a2 < a3)
  {
    v5 = (uint64_t (*)(_QWORD *, uint64_t *, uint64_t, _QWORD))a1[310];
    if (v5 || (v5 = (uint64_t (*)(_QWORD *, uint64_t *, uint64_t, _QWORD))a1[309]) != 0)
    {
      v6 = v3 + 256;
      if (v6 >= a3)
        v7 = a3;
      else
        v7 = v6;
      v8 = v5(a1, a2, v7, a1[326]);
      v9 = v8 >= *a2 && v8 <= v7;
      v3 = -902;
      if (v9)
        return v8;
    }
  }
  return v3;
}

void nghttp2_frame_add_pad(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    v5 = *a1;
    v6 = a3 - 1;
    if (*(_QWORD *)(*a1 + 16) - *(_QWORD *)(*a1 + 32) < (unint64_t)(a3 - 1))
      __assert_rtn("nghttp2_frame_add_pad", "nghttp2_frame.c", 1214, "nghttp2_buf_avail(buf) >= padlen - 1");
    v8 = *(_QWORD *)(v5 + 24);
    *(_QWORD *)(v8 - 1) = *(_QWORD *)v8;
    *(_BYTE *)(v8 + 7) = *(_BYTE *)(v8 + 8);
    v9 = *(_QWORD *)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9 - 1;
    *(_BYTE *)(v9 + 3) |= 8u;
    **(_DWORD **)(v5 + 24) = bswap32((bswap32(**(_DWORD **)(v5 + 24)) + ((_DWORD)a3 << 8)) & 0xFFFFFF00 | HIBYTE(**(_DWORD **)(v5 + 24)));
    if (!a4)
    {
      *(_BYTE *)(*(_QWORD *)(v5 + 24) + 9) = v6;
      bzero(*(void **)(v5 + 32), a3 - 1);
      *(_QWORD *)(v5 + 32) += v6;
    }
    *(_QWORD *)a2 += a3;
    *(_BYTE *)(a2 + 13) |= 8u;
  }
}

uint64_t nghttp2_stream_reschedule(uint64_t result)
{
  unint64_t *v1;
  _QWORD *i;
  unint64_t *v3;
  uint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if (!*(_BYTE *)(result + 218))
    __assert_rtn("nghttp2_stream_reschedule", "nghttp2_stream.c", 229, "stream->queued");
  v1 = (unint64_t *)result;
  for (i = *(_QWORD **)(result + 96); i; v1 = v3)
  {
    v3 = i;
    v4 = i + 1;
    nghttp2_pq_remove((uint64_t)(i + 1), v1);
    v5 = *((unsigned int *)v1 + 48);
    v6 = *((unsigned int *)v1 + 49) + (v1[20] << 8);
    v1[9] = v6 / v5 + v3[8];
    *((_DWORD *)v1 + 49) = v6 % v5;
    v7 = v3[10];
    v3[10] = v7 + 1;
    v1[11] = v7;
    result = nghttp2_pq_push(v4, v1);
    v3[20] = v1[20];
    i = (_QWORD *)v3[12];
  }
  return result;
}

uint64_t stream_obq_remove(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (*(_BYTE *)(result + 218))
  {
    v1 = result;
    do
    {
      v2 = *(_QWORD *)(v1 + 96);
      if (!v2)
        break;
      result = nghttp2_pq_remove(v2 + 8, (unint64_t *)v1);
      if (!*(_BYTE *)(v1 + 218))
        __assert_rtn("stream_obq_remove", "nghttp2_stream.c", 191, "stream->queued");
      *(_BYTE *)(v1 + 218) = 0;
      *(_DWORD *)(v1 + 196) = 0;
      *(_QWORD *)(v1 + 160) = 0;
      *(_QWORD *)(v1 + 64) = 0;
      *(_QWORD *)(v1 + 72) = 0;
      if (*(_QWORD *)(v2 + 152))
      {
        if ((*(_BYTE *)(v2 + 216) & 0xC) == 0)
          break;
      }
      v1 = v2;
    }
    while (!*(_QWORD *)(v2 + 24));
  }
  return result;
}

uint64_t nghttp2_pq_remove(uint64_t result, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v9;
  int v10;

  v2 = *(_QWORD **)result;
  v3 = *a2;
  if (*(unint64_t **)(*(_QWORD *)result + 8 * *a2) != a2)
    __assert_rtn("nghttp2_pq_remove", "nghttp2_pq.c", 134, "pq->q[item->index] == item");
  v4 = result;
  v5 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v6 = v5 - 1;
    if (v3 == v6)
    {
      *(_QWORD *)(result + 16) = v3;
      return result;
    }
    v2[v3] = v2[v6];
    v9 = *(_QWORD **)result;
    **(_QWORD **)(*(_QWORD *)result + 8 * v3) = v3;
    *(_QWORD *)(result + 16) = v6;
    v10 = (*(uint64_t (**)(unint64_t *, _QWORD))(result + 32))(a2, v9[*a2]);
    v7 = *a2;
    if (v10)
    {
      result = v4;
      return bubble_down(result, v7);
    }
    return bubble_up(v4, v7);
  }
  else if (v5)
  {
    *v2 = v2[v5 - 1];
    ***(_QWORD ***)result = 0;
    *(_QWORD *)(result + 16) = v5 - 1;
    v7 = 0;
    return bubble_down(result, v7);
  }
  return result;
}

uint64_t bubble_down(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t i;
  char v5;
  unint64_t v6;
  char v7;
  unint64_t *v8;
  unint64_t *v9;

  v2 = a2;
  v3 = result;
  for (i = a2; ; v2 = i)
  {
    v5 = 1;
    v6 = (2 * v2) | 1;
    do
    {
      v7 = v5;
      if (v6 >= *(_QWORD *)(v3 + 16))
        break;
      result = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 32))(*(_QWORD *)(*(_QWORD *)v3 + 8 * v6), *(_QWORD *)(*(_QWORD *)v3 + 8 * i));
      v5 = 0;
      if ((_DWORD)result)
        i = v6;
      ++v6;
    }
    while ((v7 & 1) != 0);
    if (i == v2)
      break;
    v8 = *(unint64_t **)(*(_QWORD *)v3 + 8 * v2);
    v9 = *(unint64_t **)(*(_QWORD *)v3 + 8 * i);
    *(_QWORD *)(*(_QWORD *)v3 + 8 * v2) = v9;
    *v9 = v2;
    *(_QWORD *)(*(_QWORD *)v3 + 8 * i) = v8;
    *v8 = i;
  }
  return result;
}

uint64_t stream_obq_push(uint64_t result, uint64_t *a2)
{
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = (uint64_t *)result;
    do
    {
      if (*((_BYTE *)a2 + 218))
        break;
      v4 = *((unsigned int *)a2 + 48);
      v5 = *((unsigned int *)a2 + 49) + (a2[20] << 8);
      a2[9] = v5 / v4 + v3[8];
      *((_DWORD *)a2 + 49) = v5 % v4;
      v6 = v3[10];
      v3[10] = v6 + 1;
      a2[11] = v6;
      result = nghttp2_pq_push(v3 + 1, (unint64_t *)a2);
      if ((_DWORD)result)
        return result;
      *((_BYTE *)a2 + 218) = 1;
      a2 = v3;
      v3 = (uint64_t *)v3[12];
    }
    while (v3);
    return 0;
  }
  return result;
}

uint64_t nghttp2_pq_push(uint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a1[2];
  v5 = a1[3];
  if (v5 > v4)
  {
    v6 = *a1;
LABEL_9:
    *(_QWORD *)(v6 + 8 * v4) = a2;
    *a2 = v4;
    a1[2] = v4 + 1;
    bubble_up((uint64_t)a1, v4);
    return 0;
  }
  v7 = 2 * v5;
  if (v7 <= 4)
    v8 = 4;
  else
    v8 = v7;
  if (!(v8 >> 61))
  {
    v6 = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(a1[1] + 32))(*a1, 8 * v8, *(_QWORD *)a1[1]);
    if (v6)
    {
      a1[3] = v8;
      *a1 = v6;
      v4 = a1[2];
      goto LABEL_9;
    }
  }
  return 4294966395;
}

uint64_t bubble_up(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t *v7;

  if (a2)
  {
    v2 = a2;
    v3 = result;
    do
    {
      v4 = v2 - 1;
      v5 = (v2 - 1) >> 1;
      result = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 32))(*(_QWORD *)(*(_QWORD *)v3 + 8 * v2), *(_QWORD *)(*(_QWORD *)v3 + 8 * v5));
      if (!(_DWORD)result)
        break;
      v6 = *(unint64_t **)(*(_QWORD *)v3 + 8 * v5);
      v7 = *(unint64_t **)(*(_QWORD *)v3 + 8 * v2);
      *(_QWORD *)(*(_QWORD *)v3 + 8 * v5) = v7;
      *v7 = v5;
      *(_QWORD *)(*(_QWORD *)v3 + 8 * v2) = v6;
      *v6 = v2;
      v2 = (v2 - 1) >> 1;
    }
    while (v4 > 1);
  }
  return result;
}

BOOL stream_less(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = *(_QWORD *)(a2 + 72) - *(_QWORD *)(a1 + 72);
  if (v2)
    return HIDWORD(v2) == 0;
  else
    return *(_QWORD *)(a1 + 88) < *(_QWORD *)(a2 + 88);
}

uint64_t nghttp2_session_callbacks_set_on_stream_close_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_invalid_header_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 112) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_invalid_frame_recv_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_header_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 96) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_frame_send_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 64) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_frame_not_send_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 72) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_data_chunk_recv_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_begin_headers_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 88) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_error_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 216) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_before_frame_send_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 56) = a2;
  return result;
}

uint64_t nghttp2_session_send(_QWORD *a1)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *, uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  while (1)
  {
    v2 = nghttp2_session_mem_send_internal((uint64_t)a1, &v8, 0);
    if (v2 <= 0)
      break;
    v3 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t, _QWORD, _QWORD))a1[294];
    if (!v3)
      v3 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t, _QWORD, _QWORD))a1[293];
    v4 = v3(a1, v8, v2, 0, a1[326]);
    if (v4 < 0)
    {
      if (v4 != -504)
        return 4294966394;
      v5 = a1[83];
      v6 = *(_QWORD *)(v5 + 24) - v2;
      v2 = 0;
      *(_QWORD *)(v5 + 24) = v6;
      return v2;
    }
    *(_QWORD *)(a1[83] + 24) += v4 - v2;
  }
  return v2;
}

void nghttp2_session_close_stream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v9;
  char v10;
  _QWORD *v11;
  char v12;
  char v13;
  uint64_t v14;

  v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (!v6)
    return;
  v7 = v6;
  if ((*(_BYTE *)(v6 + 216) & 2) != 0)
    return;
  if (*(_DWORD *)(v6 + 204) == 5)
    return;
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 2424);
  if (v8)
  {
    if (v8(a1, a2, a3, *(_QWORD *)(a1 + 2608)))
      return;
  }
  v9 = *(_QWORD *)(v7 + 152);
  if (v9)
  {
    session_detach_stream_item(a1, v7);
    if (!*(_BYTE *)(v9 + 152) && v9 != *(_QWORD *)(a1 + 648))
    {
      nghttp2_outbound_item_free(v9, a1 + 2568);
      (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v9, *(_QWORD *)(a1 + 2568));
    }
  }
  if (!(_DWORD)a2)
  {
    v10 = *(_BYTE *)(v7 + 216);
    if ((v10 & 1) == 0)
      goto LABEL_16;
    goto LABEL_18;
  }
  v10 = *(_BYTE *)(v7 + 216);
  if ((v10 & 1) == 0)
  {
    if ((((*(_BYTE *)(a1 + 2932) == 0) ^ a2) & 1) == 0)
    {
      v11 = (_QWORD *)(a1 + 2696);
      v12 = 1;
LABEL_19:
      --*v11;
      goto LABEL_20;
    }
LABEL_16:
    v12 = 0;
    v11 = (_QWORD *)(a1 + 2704);
    goto LABEL_19;
  }
  if ((((*(_BYTE *)(a1 + 2932) == 0) ^ a2) & 1) != 0)
  {
LABEL_18:
    v12 = 0;
    v11 = (_QWORD *)(a1 + 2712);
    goto LABEL_19;
  }
  v12 = 1;
LABEL_20:
  *(_BYTE *)(v7 + 216) = v10 | 2;
  if (*(_BYTE *)(a1 + 2930) != 1
    && (*(_BYTE *)(a1 + 2916) & 0x10) == 0
    && (!*(_BYTE *)(a1 + 2932) ? (v13 = 1) : (v13 = v12),
        (v13 & 1) == 0
     && (*(_QWORD *)(v7 + 96) || *(_QWORD *)(v7 + 104) || *(_QWORD *)(v7 + 112) || *(_QWORD *)(v7 + 120))))
  {
    v14 = *(_QWORD *)(a1 + 2624);
    if (v14)
    {
      *(_QWORD *)(v14 + 136) = v7;
      *(_QWORD *)(v7 + 128) = v14;
    }
    else
    {
      *(_QWORD *)(a1 + 2616) = v7;
    }
    *(_QWORD *)(a1 + 2624) = v7;
    ++*(_QWORD *)(a1 + 2728);
  }
  else
  {
    nghttp2_session_destroy_stream(a1, v7);
  }
}

void nghttp2_session_destroy_stream(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!*(_QWORD *)(a2 + 96) && !*(_QWORD *)(a2 + 104) && !*(_QWORD *)(a2 + 112) && !*(_QWORD *)(a2 + 120)
    || (nghttp2_stream_dep_remove(a2), !v4))
  {
    if (*(_BYTE *)(a2 + 218) && (*(_BYTE *)(a2 + 216) & 0x10) != 0)
      session_ob_data_remove(a1, a2);
    v5 = *(_QWORD *)(a1 + 16);
    if (v5)
    {
      v6 = *(_DWORD *)(a2 + 168);
      v7 = *(_DWORD *)(a1 + 28);
      v8 = (-1640531527 * v6) >> -(char)v7;
      v9 = *(_QWORD *)a1;
      if (*(_QWORD *)(*(_QWORD *)a1 + 16 * v8 + 8))
      {
        v10 = 32 - v7;
        v11 = *(_DWORD *)(a1 + 24);
        v12 = v11 - 1;
        v13 = -1;
        do
        {
          if (++v13 > (unint64_t)(((_DWORD)v8 - (*(_DWORD *)(v9 + 16 * v8) >> v10)) & v12))
            break;
          v14 = v9 + 16 * v8;
          if (*(_DWORD *)(v14 + 4) == v6)
          {
            v15 = ((_DWORD)v8 + 1) & v12;
            v16 = v9 + 16 * v15;
            *(_QWORD *)v14 = 0;
            *(_QWORD *)(v14 + 8) = 0;
            if (*(_QWORD *)(v16 + 8))
            {
              do
              {
                if ((((_DWORD)v15 - (*(_DWORD *)v16 >> -*(_BYTE *)(a1 + 28))) & (v11 - 1)) == 0)
                  break;
                *(_OWORD *)(v9 + 16 * v8) = *(_OWORD *)v16;
                *(_DWORD *)v16 = 0;
                v17 = v9 + 16 * v15;
                *(_DWORD *)(v17 + 4) = 0;
                *(_QWORD *)(v17 + 8) = 0;
                v11 = *(_DWORD *)(a1 + 24);
                v8 = v15;
                v15 = ((_DWORD)v15 + 1) & (v11 - 1);
                v9 = *(_QWORD *)a1;
                v16 = *(_QWORD *)a1 + 16 * v15;
              }
              while (*(_QWORD *)(v16 + 8));
              v5 = *(_QWORD *)(a1 + 16);
            }
            *(_QWORD *)(a1 + 16) = v5 - 1;
            break;
          }
          v8 = ((_DWORD)v8 + 1) & v12;
        }
        while (*(_QWORD *)(v9 + 16 * v8 + 8));
      }
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a2 + 16) + 16))(*(_QWORD *)(a2 + 8), **(_QWORD **)(a2 + 16));
    *(_QWORD *)(a2 + 8) = 0;
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(a2, *(_QWORD *)(a1 + 2568));
  }
}

double nghttp2_stream_dep_remove(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  double result;
  uint64_t v6;
  uint64_t *v7;
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

  v2 = -*(_DWORD *)(a1 + 192);
  v3 = *(_QWORD *)(a1 + 104);
  if (!v3)
  {
LABEL_8:
    v7 = (uint64_t *)(a1 + 96);
    v6 = *(_QWORD *)(a1 + 96);
    if (!v6)
      __assert_rtn("nghttp2_stream_dep_remove", "nghttp2_stream.c", 792, "stream->dep_prev");
    *(_DWORD *)(v6 + 200) += v2;
    if (*(_BYTE *)(a1 + 218))
      stream_obq_remove(a1);
    v8 = *(_QWORD *)(a1 + 112);
    if (!v8)
    {
      v13 = *(_QWORD *)(a1 + 96);
      if (!v13)
        __assert_rtn("unlink_dep", "nghttp2_stream.c", 719, "prev");
      v14 = *(_QWORD *)(a1 + 104);
      if (v14)
      {
        *(_QWORD *)(v13 + 104) = v14;
        *(_QWORD *)(v14 + 96) = v13;
        v15 = *v7;
        v16 = v14;
        do
        {
          *(_QWORD *)(v16 + 96) = v15;
          v16 = *(_QWORD *)(v16 + 120);
        }
        while (v16);
        v17 = *(_QWORD *)(a1 + 120);
        if (v17)
        {
          do
          {
            v18 = v14;
            v14 = *(_QWORD *)(v14 + 120);
          }
          while (v14);
          *(_QWORD *)(v18 + 120) = v17;
          *(_QWORD *)(v17 + 112) = v18;
        }
      }
      else
      {
        v19 = *(_QWORD *)(a1 + 120);
        if (v19)
        {
          *(_QWORD *)(v19 + 112) = 0;
          *(_QWORD *)(v13 + 104) = v19;
          *(_QWORD *)(v19 + 96) = v13;
        }
        else
        {
          *(_QWORD *)(v13 + 104) = 0;
        }
      }
      goto LABEL_27;
    }
    v9 = *(_QWORD *)(a1 + 104);
    if (v9)
    {
      *(_QWORD *)(v8 + 120) = v9;
      *(_QWORD *)(v9 + 112) = v8;
      v10 = v9;
      v11 = *v7;
      do
      {
        *(_QWORD *)(v10 + 96) = v11;
        v10 = *(_QWORD *)(v10 + 120);
      }
      while (v10);
      v12 = *(_QWORD *)(a1 + 120);
      if (!v12)
        goto LABEL_27;
      do
      {
        v8 = v9;
        v9 = *(_QWORD *)(v9 + 120);
      }
      while (v9);
      *(_QWORD *)(v8 + 120) = v12;
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 120);
      *(_QWORD *)(v8 + 120) = v12;
      if (!v12)
      {
LABEL_27:
        *(_DWORD *)(a1 + 200) = 0;
        result = 0.0;
        *(_OWORD *)v7 = 0u;
        *(_OWORD *)(a1 + 112) = 0u;
        return result;
      }
    }
    *(_QWORD *)(v12 + 112) = v8;
    goto LABEL_27;
  }
  while (1)
  {
    v4 = *(_DWORD *)(a1 + 192) * *(_DWORD *)(v3 + 192) / *(_DWORD *)(a1 + 200) <= 1
       ? 1
       : *(_DWORD *)(a1 + 192) * *(_DWORD *)(v3 + 192) / *(_DWORD *)(a1 + 200);
    *(_DWORD *)(v3 + 192) = v4;
    if (*(_BYTE *)(v3 + 218))
    {
      if (stream_obq_move(*(_QWORD *)(a1 + 96), a1, v3))
        return result;
    }
    v2 += v4;
    v3 = *(_QWORD *)(v3 + 120);
    if (!v3)
      goto LABEL_8;
  }
}

uint64_t nghttp2_submit_window_update(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t result;
  uint64_t v7;
  int v8;
  int *v9;
  int v10;

  v10 = a4;
  if (a4)
  {
    if (a3)
    {
      result = nghttp2_map_find((uint64_t *)a1, a3);
      if (!result)
        return result;
      v7 = result;
      if ((*(_BYTE *)(result + 216) & 2) == 0 && *(_DWORD *)(result + 204) != 5)
      {
        result = nghttp2_adjust_local_window_size((int *)(result + 188), (int *)(result + 176), (int *)(result + 184), &v10);
        if ((_DWORD)result)
          return result;
        v8 = v10;
        if (v10 > 0)
        {
          v9 = (int *)(v7 + 180);
LABEL_12:
          *v9 = (*v9 - v8) & ~((*v9 - v8) >> 31);
          return nghttp2_session_add_window_update(a1, a3, v8);
        }
      }
    }
    else
    {
      result = nghttp2_adjust_local_window_size((int *)(a1 + 2844), (int *)(a1 + 2832), (int *)(a1 + 2840), &v10);
      if ((_DWORD)result)
        return result;
      v8 = v10;
      if (v10 > 0)
      {
        v9 = (int *)(a1 + 2836);
        goto LABEL_12;
      }
    }
  }
  return 0;
}

uint64_t nghttp2_adjust_local_window_size(int *a1, int *a2, int *a3, int *a4)
{
  int v5;
  int v6;
  uint64_t result;
  int v8;
  int v9;
  int v10;

  v5 = *a4;
  if (*a4 < 1)
  {
    v8 = *a1 + v5;
    if (v8 >= 0 && *a2 >= (int)(0x80000000 - v5) && *a3 <= v5 + 0x7FFFFFFF)
    {
      result = 0;
      *a1 = v8;
      *a2 += *a4;
      *a3 -= *a4;
      *a4 = 0;
      return result;
    }
    return 4294966772;
  }
  v6 = (*a2 & ~(*a2 >> 31)) - v5;
  if (v6 >= 0)
  {
    result = 0;
    *a2 = v6;
    return result;
  }
  v9 = *a1;
  if (*a1 > v6 + 0x7FFFFFFF)
    return 4294966772;
  result = 0;
  *a1 = v9 - v6;
  if (*a3 >= -v6)
    v10 = -v6;
  else
    v10 = *a3;
  *a3 -= v10;
  *a2 = (*a2 & (*a2 >> 31)) + v10;
  *a4 -= v10;
  return result;
}

uint64_t nghttp2_session_terminate_session(uint64_t a1, int a2)
{
  return session_terminate_session(a1, *(_DWORD *)(a1 + 2812), a2, 0);
}

uint64_t nghttp2_session_del(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  if (result)
  {
    v1 = result;
    v2 = result + 2568;
    v3 = *(_QWORD **)(result + 2648);
    if (v3)
    {
      do
      {
        v4 = (_QWORD *)*v3;
        (*(void (**)(_QWORD, _QWORD))(v1 + 2584))(v3[1], *(_QWORD *)(v1 + 2568));
        (*(void (**)(_QWORD *, _QWORD))(v1 + 2584))(v3, *(_QWORD *)(v1 + 2568));
        v3 = v4;
      }
      while (v4);
    }
    for (i = 0; i != 320; i += 40)
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + i + 336) + 16))(*(_QWORD *)(v1 + i + 328), **(_QWORD **)(v1 + i + 336));
      *(_QWORD *)(v1 + i + 328) = 0;
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 48) + 16))(*(_QWORD *)(v1 + 40), **(_QWORD **)(v1 + 48));
    *(_QWORD *)(v1 + 40) = 0;
    v6 = *(unsigned int *)(v1 + 24);
    if ((_DWORD)v6)
    {
      v7 = 0;
      v8 = 8;
      do
      {
        v9 = *(_QWORD **)(*(_QWORD *)v1 + v8);
        if (v9)
        {
          v10 = v9[19];
          if (v10 && !*(_BYTE *)(v10 + 152) && v10 != *(_QWORD *)(v1 + 648))
          {
            nghttp2_outbound_item_free(v9[19], v2);
            (*(void (**)(uint64_t, _QWORD))(v1 + 2584))(v10, *(_QWORD *)(v1 + 2568));
          }
          (*(void (**)(_QWORD, _QWORD))(v9[2] + 16))(v9[1], *(_QWORD *)v9[2]);
          v9[1] = 0;
          (*(void (**)(_QWORD *, _QWORD))(v1 + 2584))(v9, *(_QWORD *)(v1 + 2568));
          v6 = *(unsigned int *)(v1 + 24);
        }
        ++v7;
        v8 += 16;
      }
      while (v7 < v6);
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 8) + 16))(*(_QWORD *)v1, **(_QWORD **)(v1 + 8));
    ob_q_free(*(_QWORD *)(v1 + 256), v2);
    ob_q_free(*(_QWORD *)(v1 + 280), v2);
    ob_q_free(*(_QWORD *)(v1 + 304), v2);
    active_outbound_item_reset((uint64_t *)(v1 + 648), v2);
    session_inbound_frame_reset(v1);
    hd_context_free((_QWORD *)(v1 + 992));
    nghttp2_hd_inflate_free((_QWORD *)(v1 + 2104));
    nghttp2_bufs_free((_QWORD **)(v1 + 656));
    return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 2584))(v1, *(_QWORD *)(v1 + 2568));
  }
  return result;
}

uint64_t ob_q_free(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    do
    {
      v4 = *(_QWORD *)(v3 + 144);
      nghttp2_outbound_item_free(v3, a2);
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(v3, *(_QWORD *)a2);
      v3 = v4;
    }
    while (v4);
  }
  return result;
}

uint64_t hd_context_free(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;

  v2 = (_QWORD *)a1[4];
  if (a1[3])
  {
    v3 = 0;
    do
    {
      v4 = (uint64_t *)hd_ringbuf_get(a1, v3);
      nghttp2_rcbuf_decref(v4[1]);
      nghttp2_rcbuf_decref(*v4);
      ((void (*)(uint64_t *, _QWORD))v2[2])(v4, *v2);
      ++v3;
    }
    while (v3 < a1[3]);
  }
  return ((uint64_t (*)(_QWORD, _QWORD))v2[2])(*a1, *v2);
}

uint64_t nghttp2_hd_inflate_free(_QWORD *a1)
{
  nghttp2_rcbuf_decref(a1[22]);
  nghttp2_rcbuf_decref(a1[21]);
  a1[21] = 0;
  a1[22] = 0;
  nghttp2_rcbuf_decref(a1[20]);
  nghttp2_rcbuf_decref(a1[19]);
  return hd_context_free(a1);
}

_QWORD **nghttp2_bufs_free(_QWORD **result)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  if (result)
  {
    v1 = result;
    v2 = *result;
    if (*result)
    {
      do
      {
        v3 = (_QWORD *)v1[2];
        v4 = (_QWORD *)*v2;
        ((void (*)(_QWORD, _QWORD))v3[2])(v2[1], *v3);
        v2[1] = 0;
        result = (_QWORD **)((uint64_t (*)(_QWORD *, _QWORD))v3[2])(v2, *v3);
        v2 = v4;
      }
      while (v4);
    }
    *v1 = 0;
  }
  return result;
}

uint64_t nghttp2_session_callbacks_new(_QWORD *a1)
{
  void *v2;

  v2 = malloc_type_calloc(1uLL, 0xE0uLL, 0x800401140A6BDuLL);
  *a1 = v2;
  if (v2)
    return 0;
  else
    return 4294966395;
}

uint64_t nghttp2_submit_rst_stream(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a3)
    return nghttp2_session_add_rst_stream(a1, a3, a4);
  else
    return 4294966795;
}

uint64_t session_terminate_session(uint64_t a1, int a2, int a3, char *__s)
{
  int v5;
  int v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t result;

  if ((*(_BYTE *)(a1 + 2933) & 1) != 0)
    return 0;
  v5 = a3;
  v6 = a2;
  v7 = a1;
  *(_DWORD *)(a1 + 952) = 15;
  if (__s)
  {
    v8 = strlen(__s);
    a1 = v7;
    a2 = v6;
    a3 = v5;
    v9 = __s;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  result = nghttp2_session_add_goaway(a1, a2, a3, v9, v8, 1);
  if (!(_DWORD)result)
    *(_BYTE *)(v7 + 2933) |= 1u;
  return result;
}

uint64_t nghttp2_session_add_goaway(uint64_t a1, int a2, int a3, const void *a4, size_t a5, char a6)
{
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  if (a2 && (a2 & 1) == (*(_BYTE *)(a1 + 2932) == 0))
    return 4294966795;
  if (a5)
  {
    if (a5 - 16377 < 0xFFFFFFFFFFFFBFFFLL)
      return 4294966795;
    v14 = (void *)(*(uint64_t (**)(size_t, _QWORD))(a1 + 2576))(a5, *(_QWORD *)(a1 + 2568));
    if (!v14)
      return 4294966395;
    v13 = v14;
    memcpy(v14, a4, a5);
  }
  else
  {
    v13 = 0;
  }
  v15 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v15)
  {
    (*(void (**)(void *, _QWORD))(a1 + 2584))(v13, *(_QWORD *)(a1 + 2568));
    return 4294966395;
  }
  v16 = v15;
  *(_OWORD *)(v15 + 137) = 0u;
  *(_OWORD *)(v15 + 112) = 0u;
  *(_OWORD *)(v15 + 128) = 0u;
  *(_OWORD *)(v15 + 96) = 0u;
  v17 = *(_DWORD *)(a1 + 2820);
  if (a2 < v17)
    v17 = a2;
  *(_QWORD *)v15 = a5 + 8;
  *(_WORD *)(v15 + 12) = 7;
  *(_DWORD *)(v15 + 8) = 0;
  *(_BYTE *)(v15 + 14) = 0;
  *(_DWORD *)(v15 + 16) = v17;
  *(_DWORD *)(v15 + 20) = a3;
  *(_QWORD *)(v15 + 24) = v13;
  *(_QWORD *)(v15 + 32) = a5;
  *(_BYTE *)(v15 + 40) = 0;
  *(_BYTE *)(v15 + 96) = a6;
  v12 = nghttp2_session_add_item(a1, v15);
  if ((_DWORD)v12)
  {
    (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(v16 + 24), *(_QWORD *)(a1 + 2568));
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v16, *(_QWORD *)(a1 + 2568));
  }
  else
  {
    *(_BYTE *)(a1 + 2933) |= 0x10u;
  }
  return v12;
}

uint64_t nghttp2_session_add_rst_stream(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (v6 && (*(_BYTE *)(v6 + 216) & 2) == 0 && *(_DWORD *)(v6 + 204) == 3)
    return 0;
  if (a2)
  {
    v7 = *(unsigned __int8 *)(a1 + 2932);
    if (((a2 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) == 0)
    {
      if (*(_DWORD *)(a1 + 2800) > a2)
        goto LABEL_10;
      return 0;
    }
  }
  if (*(_DWORD *)(a1 + 2808) < a2)
    return 0;
  if (a2)
  {
    v7 = *(unsigned __int8 *)(a1 + 2932);
LABEL_10:
    if (!v7 && (a2 & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 304);
      if (v8)
      {
        if (*(_BYTE *)(v8 + 12) != 1)
          __assert_rtn("nghttp2_session_add_rst_stream", "nghttp2_session.c", 1274, "headers_frame->hd.type == NGHTTP2_HEADERS");
        if (*(_DWORD *)(v8 + 8) <= a2)
        {
          while (1)
          {
            v9 = *(_DWORD *)(v8 + 8);
            if (v9 >= a2)
              break;
            v8 = *(_QWORD *)(v8 + 144);
            if (!v8)
              goto LABEL_21;
          }
          if (v9 <= a2 && !*(_BYTE *)(v8 + 132))
          {
            v10 = 0;
            *(_DWORD *)(v8 + 128) = a3;
            *(_BYTE *)(v8 + 132) = 1;
            return v10;
          }
        }
      }
    }
  }
LABEL_21:
  v11 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v11)
    return 4294966395;
  v12 = v11;
  *(_OWORD *)(v11 + 137) = 0u;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 96) = 0u;
  *(_QWORD *)v11 = 4;
  *(_WORD *)(v11 + 12) = 3;
  *(_DWORD *)(v11 + 8) = a2;
  *(_BYTE *)(v11 + 14) = 0;
  *(_DWORD *)(v11 + 16) = a3;
  v10 = nghttp2_session_add_item(a1, v11);
  if ((_DWORD)v10)
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v12, *(_QWORD *)(a1 + 2568));
  return v10;
}

_QWORD *nghttp2_session_callbacks_set_send_callback(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_send_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 8) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_recv_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_recv_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_header_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 104) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_invalid_header_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 120) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_select_padding_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 128) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_select_padding_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 136) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_data_source_read_length_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 144) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_data_source_read_length_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 152) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_begin_frame_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 160) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_send_data_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 168) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_pack_extension_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 176) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_pack_extension_callback2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 184) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_unpack_extension_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 192) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_extension_chunk_recv_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 200) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_error_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 208) = a2;
  return result;
}

uint64_t nghttp2_option_set_peer_max_concurrent_streams(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 2u;
  *(_DWORD *)(result + 60) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_recv_client_magic(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 4u;
  *(_DWORD *)(result + 76) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_http_messaging(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 8u;
  *(_DWORD *)(result + 80) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_reserved_remote_streams(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x10u;
  *(_DWORD *)(result + 64) = a2;
  return result;
}

uint64_t nghttp2_option_set_user_recv_extension_type(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xA)
  {
    *(_DWORD *)(result + 56) |= 0x20u;
    *(_BYTE *)(result + ((unint64_t)a2 >> 3) + 104) |= 1 << (a2 & 7);
  }
  return result;
}

uint64_t nghttp2_option_set_builtin_recv_extension_type(uint64_t result, int a2)
{
  int v2;

  switch(a2)
  {
    case 10:
      v2 = 1;
      break;
    case 16:
      v2 = 4;
      break;
    case 12:
      v2 = 2;
      break;
    default:
      return result;
  }
  *(_DWORD *)(result + 56) |= 0x80u;
  *(_DWORD *)(result + 68) |= v2;
  return result;
}

uint64_t nghttp2_option_set_no_auto_ping_ack(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x40u;
  *(_DWORD *)(result + 84) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_send_header_block_length(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x100u;
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_deflate_dynamic_table_size(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x200u;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_closed_streams(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x400u;
  *(_DWORD *)(result + 88) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_outbound_ack(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x800u;
  *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_settings(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x1000u;
  *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t nghttp2_option_set_server_fallback_rfc7540_priorities(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x2000u;
  *(_DWORD *)(result + 96) = a2;
  return result;
}

uint64_t nghttp2_option_set_stream_reset_rate_limit(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(result + 56) |= 0x8000u;
  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  return result;
}

uint64_t nghttp2_option_set_max_continuations(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x10000u;
  *(_QWORD *)(result + 48) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_http_semantics(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x80000000;
  *(_DWORD *)(result + 92) = a2;
  return result;
}

uint64_t nghttp2_stream_detach_item(uint64_t result)
{
  char v1;

  *(_QWORD *)(result + 152) = 0;
  v1 = *(_BYTE *)(result + 216);
  *(_BYTE *)(result + 216) = v1 & 0xF3;
  if ((v1 & 0x10) == 0 && !*(_QWORD *)(result + 24))
    return stream_obq_remove(result);
  return result;
}

uint64_t stream_obq_move(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a3 + 218))
    return 0;
  nghttp2_pq_remove(a2 + 8, (unint64_t *)a3);
  *(_BYTE *)(a3 + 218) = 0;
  return stream_obq_push(a1, (uint64_t *)a3);
}

uint64_t nghttp2_stream_dep_add_subtree(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_DWORD *)(a1 + 200) += *(_DWORD *)(a2 + 192);
  if (*(_QWORD *)(a1 + 104))
  {
    insert_link_dep(a1, (_QWORD *)a2);
  }
  else
  {
    *(_QWORD *)(a1 + 104) = a2;
    *(_QWORD *)(a2 + 96) = a1;
  }
  if ((!*(_QWORD *)(a2 + 152) || (*(_BYTE *)(a2 + 216) & 0xC) != 0) && !*(_QWORD *)(a2 + 24))
    return 0;
  result = stream_obq_push(a1, (uint64_t *)a2);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t nghttp2_stream_dep_remove_subtree(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(result + 96);
  if (!v1)
    __assert_rtn("nghttp2_stream_dep_remove_subtree", "nghttp2_stream.c", 904, "stream->dep_prev");
  v2 = result;
  v4 = *(_QWORD *)(result + 112);
  v3 = *(_QWORD *)(result + 120);
  v5 = (_QWORD *)(result + 112);
  if (!v4)
  {
    *(_QWORD *)(v1 + 104) = v3;
    if (!v3)
      goto LABEL_8;
    v4 = 0;
    *(_QWORD *)(v3 + 96) = v1;
    goto LABEL_7;
  }
  *(_QWORD *)(v4 + 120) = v3;
  if (v3)
LABEL_7:
    *(_QWORD *)(v3 + 112) = v4;
LABEL_8:
  *(_DWORD *)(v1 + 200) -= *(_DWORD *)(result + 192);
  if (*(_BYTE *)(result + 218))
    result = stream_obq_remove(result);
  *(_QWORD *)(v2 + 96) = 0;
  *v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t nghttp2_stream_get_state(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 216) & 2) != 0)
    return 7;
  if ((*(_BYTE *)(a1 + 216) & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 217) & 1) != 0)
      return 3;
    if ((*(_BYTE *)(a1 + 217) & 2) != 0)
      return 4;
  }
  else if ((*(_BYTE *)(a1 + 217) & 1) != 0)
  {
    return 6;
  }
  if ((*(_BYTE *)(a1 + 217) & 2) != 0)
    return 5;
  if (*(_DWORD *)(a1 + 204) == 5)
    return 1;
  return 2;
}

uint64_t nghttp2_stream_get_parent(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

uint64_t nghttp2_stream_get_next_sibling(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

uint64_t nghttp2_stream_get_previous_sibling(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

uint64_t nghttp2_stream_get_first_child(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

uint64_t nghttp2_stream_get_weight(uint64_t a1)
{
  return *(unsigned int *)(a1 + 192);
}

uint64_t nghttp2_stream_get_sum_dependency_weight(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

uint64_t nghttp2_stream_get_stream_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 168);
}

uint64_t nghttp2_frame_pack_push_promise(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t **v3;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t **v10;
  int64_t v11;

  v3 = *(uint64_t ***)a1;
  if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8))
    __assert_rtn("nghttp2_frame_pack_push_promise", "nghttp2_frame.c", 561, "bufs->head == bufs->cur");
  v6 = (uint64_t)v3[3] + 4;
  v3[3] = (uint64_t *)v6;
  v3[4] = (uint64_t *)v6;
  v7 = nghttp2_hd_deflate_hd_bufs(a3, a1, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32));
  if (v7 == -502)
    v8 = 4294966773;
  else
    v8 = v7;
  v9 = (uint64_t *)((char *)v3[3] - 4);
  v3[3] = v9;
  if (!(_DWORD)v8)
  {
    *(_DWORD *)v9 = bswap32(*(_DWORD *)(a2 + 40));
    *(_QWORD *)(a2 + 16) = 0;
    v10 = *(uint64_t ***)a1;
    if (*(_QWORD *)a1)
    {
      v11 = 0;
      do
      {
        v11 = (char *)v10[4] + v11 - (char *)v10[3];
        v10 = (uint64_t **)*v10;
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    *(_QWORD *)a2 = v11;
    frame_pack_headers_shared((uint64_t ***)a1, a2);
  }
  return v8;
}

uint64_t nghttp2_frame_pack_altsvc(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t result;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 16) - *(_QWORD *)(*(_QWORD *)a1 + 32) < (unint64_t)(*(_QWORD *)(v2 + 8)
                                                                                                + *(_QWORD *)(v2 + 24)
                                                                                                + 2))
    __assert_rtn("nghttp2_frame_pack_altsvc", "nghttp2_frame.c", 728, "nghttp2_buf_avail(buf) >= 2 + altsvc->origin_len + altsvc->field_value_len");
  v5 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v5 - 9;
  *(_DWORD *)(v5 - 9) = bswap32(*(_DWORD *)a2) >> 8;
  *(_BYTE *)(v5 - 6) = *(_BYTE *)(a2 + 12);
  *(_BYTE *)(v5 - 5) = *(_BYTE *)(a2 + 13);
  *(_DWORD *)(v5 - 4) = bswap32(*(_DWORD *)(a2 + 8));
  **(_WORD **)(v3 + 32) = bswap32(*(unsigned __int16 *)(v2 + 8)) >> 16;
  *(_QWORD *)(v3 + 32) += 2;
  if (nghttp2_bufs_add(a1, *(char **)v2, *(_QWORD *)(v2 + 8)))
    __assert_rtn("nghttp2_frame_pack_altsvc", "nghttp2_frame.c", 739, "rv == 0");
  result = nghttp2_bufs_add(a1, *(char **)(v2 + 16), *(_QWORD *)(v2 + 24));
  if ((_DWORD)result)
    __assert_rtn("nghttp2_frame_pack_altsvc", "nghttp2_frame.c", 743, "rv == 0");
  return result;
}

uint64_t nghttp2_frame_pack_priority_update(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 16) - *(_QWORD *)(*(_QWORD *)a1 + 32) < (unint64_t)(*(_QWORD *)(v2 + 16)
                                                                                                + 4))
    __assert_rtn("nghttp2_frame_pack_priority_update", "nghttp2_frame.c", 904, "nghttp2_buf_avail(buf) >= 4 + priority_update->field_value_len");
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 - 9;
  *(_DWORD *)(v4 - 9) = bswap32(*(_DWORD *)a2) >> 8;
  *(_BYTE *)(v4 - 6) = *(_BYTE *)(a2 + 12);
  *(_BYTE *)(v4 - 5) = *(_BYTE *)(a2 + 13);
  *(_DWORD *)(v4 - 4) = bswap32(*(_DWORD *)(a2 + 8));
  **(_DWORD **)(v3 + 32) = bswap32(*(_DWORD *)v2);
  *(_QWORD *)(v3 + 32) += 4;
  result = nghttp2_bufs_add(a1, *(char **)(v2 + 8), *(_QWORD *)(v2 + 16));
  if ((_DWORD)result)
    __assert_rtn("nghttp2_frame_pack_priority_update", "nghttp2_frame.c", 916, "rv == 0");
  return result;
}

uint64_t nghttp2_nv_compare_name(uint64_t a1, uint64_t a2)
{
  const void *v4;
  size_t v5;
  const void *v6;
  size_t v7;
  uint64_t result;

  v4 = *(const void **)a1;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(const void **)a2;
  v7 = *(_QWORD *)(a2 + 16);
  if (v5 == v7)
    return memcmp(v4, v6, v5);
  if (v5 >= v7)
  {
    LODWORD(result) = memcmp(v4, v6, v7);
    if (result <= 1)
      return 1;
    else
      return result;
  }
  else
  {
    LODWORD(result) = memcmp(v4, v6, v5);
    if ((_DWORD)result)
      return result;
    else
      return 0xFFFFFFFFLL;
  }
}

uint64_t nghttp2_hd_deflate_change_table_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = *(_QWORD *)(a1 + 1088);
  if (a2 < v2)
    v2 = a2;
  *(_QWORD *)(a1 + 48) = v2;
  if (*(_QWORD *)(a1 + 1096) < v2)
    v2 = *(_QWORD *)(a1 + 1096);
  *(_QWORD *)(a1 + 1096) = v2;
  *(_BYTE *)(a1 + 1104) = 1;
  hd_context_shrink_table_size((_QWORD *)a1, a1 + 64);
  return 0;
}

uint64_t nghttp2_hd_inflate_change_table_size(uint64_t a1, unint64_t a2)
{
  if (*(_DWORD *)(a1 + 228) > 1u)
    return 4294966777;
  *(_QWORD *)(a1 + 200) = a2;
  if (*(_QWORD *)(a1 + 48) > a2)
  {
    *(_DWORD *)(a1 + 228) = 0;
    *(_QWORD *)(a1 + 208) = a2;
    *(_QWORD *)(a1 + 48) = a2;
    hd_context_shrink_table_size((_QWORD *)a1, 0);
  }
  return 0;
}

uint64_t emit_indname_block(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  _BYTE *v14;
  unint64_t v15;
  char __src;
  _BYTE v17[23];

  *(_QWORD *)&v17[15] = *MEMORY[0x1E0C80C00];
  v6 = a2 + 1;
  if (a4)
    v7 = 15;
  else
    v7 = 63;
  v8 = v6 - v7;
  if (v6 >= v7)
  {
    if (v8 < 0x80)
    {
      __src = (0x100040u >> (8 * a4)) | v7;
      v14 = v17;
      v9 = 2;
    }
    else
    {
      v10 = 0;
      v11 = v8;
      do
      {
        v12 = v11 >> 14;
        v11 >>= 7;
        ++v10;
      }
      while (v12);
      if (v10 > 0xE)
        return 4294966773;
      __src = (0x100040u >> (8 * a4)) | v7;
      v14 = v17;
      do
      {
        *v14++ = v8 | 0x80;
        v15 = v8 >> 14;
        v8 >>= 7;
      }
      while (v15);
      v9 = v10 + 2;
    }
    *v14 = v8;
  }
  else
  {
    __src = (0x100040u >> (8 * a4)) & ~(_BYTE)v7 | v6;
    v9 = 1;
  }
  result = nghttp2_bufs_add(a1, &__src, v9);
  if (!(_DWORD)result)
    return emit_string(a1, *(char **)(a3 + 8), *(_QWORD *)(a3 + 24));
  return result;
}

uint64_t nghttp2_hd_deflate_hd2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  __int128 v21;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(v10 + 8))(48, *(_QWORD *)v10);
  if (!v11)
    return -901;
  v11[4] = a2;
  v11[5] = a2;
  v11[2] = a2;
  v11[3] = a2;
  *v11 = 0;
  v11[1] = a2;
  if (a3)
    v11[2] = a2 + a3;
  v17[0] = v11;
  v17[1] = v11;
  v18 = v10;
  v19 = a3;
  v20 = vdupq_n_s64(1uLL);
  v21 = xmmword_1DF25D860;
  v12 = nghttp2_hd_deflate_hd_bufs(a1, (uint64_t)v17, a4, a5);
  if (v17[0])
  {
    v13 = 0;
    v14 = (_QWORD *)v17[0];
    do
    {
      v13 = v13 + v14[4] - v14[3];
      v14 = (_QWORD *)*v14;
    }
    while (v14);
    (*(void (**)(void))(v18 + 16))();
  }
  else
  {
    v13 = 0;
  }
  v16 = v12;
  if (!v12)
    v16 = v13;
  if (v12 == -502)
    return -525;
  else
    return v16;
}

uint64_t nghttp2_hd_deflate_hd_vec2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int64x2_t *v17;
  unint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  _OWORD *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  int64x2_t v29;
  __int128 v30;
  uint64_t v31;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = *(_QWORD **)(a1 + 32);
  if (a3)
  {
    v31 = ((uint64_t (*)(uint64_t, _QWORD))v8[1])(48 * a3, *v8);
    if (v31)
    {
      v11 = 0;
      v12 = 0;
      v13 = (uint64_t *)(a2 + 8);
      v14 = &v31;
      v15 = a3;
      do
      {
        v16 = v31;
        v17 = (int64x2_t *)(v31 + v11);
        v17->i64[0] = 0;
        v18 = *(v13 - 1);
        v19 = *v13;
        v20 = vdupq_n_s64(v18);
        v17[1] = v20;
        v17[2] = v20;
        v17->i64[1] = v18;
        if (v19)
          v17[1].i64[0] = v18 + v19;
        *v14 = (uint64_t)v17;
        v14 = (uint64_t *)(v16 + 48 * v12);
        v13 += 2;
        ++v12;
        v11 += 48;
        --v15;
      }
      while (v15);
      *(_QWORD *)&v27 = v31;
      *((_QWORD *)&v27 + 1) = v31;
      v28 = (unint64_t)v8;
      v29.i64[0] = a3;
      v29.i64[1] = a3;
      v30 = (unint64_t)a3;
      goto LABEL_10;
    }
    return -901;
  }
  v21 = (_OWORD *)((uint64_t (*)(uint64_t, _QWORD))v8[1])(48, *v8);
  if (!v21)
    return -901;
  v21[1] = 0u;
  v21[2] = 0u;
  *v21 = 0u;
  *(_QWORD *)&v27 = v21;
  *((_QWORD *)&v27 + 1) = v21;
  v28 = (unint64_t)v8;
  v29 = vdupq_n_s64(1uLL);
  v30 = xmmword_1DF25D860;
LABEL_10:
  v22 = nghttp2_hd_deflate_hd_bufs(a1, (uint64_t)&v27, a4, a5);
  if ((_QWORD)v27)
  {
    v23 = 0;
    v24 = (_QWORD *)v27;
    do
    {
      v23 = v23 + v24[4] - v24[3];
      v24 = (_QWORD *)*v24;
    }
    while (v24);
    (*(void (**)(void))(v28 + 16))();
  }
  else
  {
    v23 = 0;
  }
  v26 = v22;
  if (!v22)
    v26 = v23;
  if (v22 == -502)
    return -525;
  else
    return v26;
}

uint64_t nghttp2_hd_deflate_bound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v4;

  result = 12 * a3 + 12;
  if (a3)
  {
    v4 = (_QWORD *)(a2 + 24);
    do
    {
      result += *(v4 - 1) + *v4;
      v4 += 5;
      --a3;
    }
    while (a3);
  }
  return result;
}

uint64_t nghttp2_hd_deflate_new(uint64_t *a1, unint64_t a2)
{
  return nghttp2_hd_deflate_new2(a1, a2, 0);
}

uint64_t nghttp2_hd_deflate_new2(uint64_t *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
    v5 = a3;
  else
    v5 = &mem_default;
  v6 = ((uint64_t (*)(uint64_t, _QWORD))v5[1])(1112, *v5);
  if (!v6)
    return 4294966395;
  v7 = v6;
  v8 = nghttp2_hd_deflate_init2(v6, a2, (uint64_t)v5);
  if ((_DWORD)v8)
    ((void (*)(uint64_t, _QWORD))v5[2])(v7, *v5);
  else
    *a1 = v7;
  return v8;
}

uint64_t nghttp2_hd_deflate_del(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[4];
  hd_context_free(a1);
  return (*(uint64_t (**)(_QWORD *, _QWORD))(v2 + 16))(a1, *(_QWORD *)v2);
}

uint64_t nghttp2_hd_inflate_hd3(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned __int8 *a4, uint64_t a5, int a6)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  result = nghttp2_hd_inflate_hd_nv(a1, (uint64_t)&v11, a3, a4, a5, a6);
  if ((result & 0x8000000000000000) == 0 && (*(_BYTE *)a3 & 2) != 0)
  {
    v9 = v11;
    v10 = v12;
    *(_QWORD *)a2 = *(_QWORD *)(v11 + 16);
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(v9 + 24);
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(v10 + 16);
    *(_QWORD *)(a2 + 24) = *(_QWORD *)(v10 + 24);
    *(_BYTE *)(a2 + 32) = BYTE4(v13);
  }
  return result;
}

uint64_t nghttp2_hd_inflate_end_headers(uint64_t a1)
{
  nghttp2_rcbuf_decref(*(_QWORD *)(a1 + 176));
  nghttp2_rcbuf_decref(*(_QWORD *)(a1 + 168));
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_DWORD *)(a1 + 228) = 1;
  return 0;
}

uint64_t nghttp2_hd_inflate_new(uint64_t *a1)
{
  return nghttp2_hd_inflate_new2(a1, 0);
}

uint64_t nghttp2_hd_inflate_new2(uint64_t *a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v3 = a2;
  else
    v3 = &mem_default;
  v4 = ((uint64_t (*)(uint64_t, _QWORD))v3[1])(240, *v3);
  if (!v4)
    return 4294966395;
  v5 = v4;
  v6 = nghttp2_hd_inflate_init(v4, (uint64_t)v3);
  if ((_DWORD)v6)
    ((void (*)(uint64_t, _QWORD))v3[2])(v5, *v3);
  else
    *a1 = v5;
  return v6;
}

uint64_t nghttp2_hd_inflate_del(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[4];
  nghttp2_hd_inflate_free(a1);
  return (*(uint64_t (**)(_QWORD *, _QWORD))(v2 + 16))(a1, *(_QWORD *)v2);
}

uint64_t nghttp2_hd_deflate_get_num_table_entries(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) + 61;
}

_DWORD *hd_get_table_entry(_QWORD *a1, uint64_t a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  v2 = a2 - 1;
  if (a2 - 1 >= (unint64_t)(a1[3] + 61))
    return 0;
  if (v2 < 0x3D)
    return &static_table[32 * v2 + 20];
  return (_DWORD *)(hd_ringbuf_get(a1, a2 - 62) + 24);
}

uint64_t nghttp2_hd_deflate_get_dynamic_table_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t nghttp2_hd_deflate_get_max_dynamic_table_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t nghttp2_hd_inflate_get_num_table_entries(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) + 61;
}

uint64_t nghttp2_hd_inflate_get_dynamic_table_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t nghttp2_hd_inflate_get_max_dynamic_table_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t nghttp2_select_next_protocol(_QWORD *a1, _BYTE *a2, uint64_t a3, unsigned int a4)
{
  if (!select_alpn(a1, a2, a3, a4, "\x02h2", 3uLL))
    return 1;
  if (select_alpn(a1, a2, a3, a4, "\bhttp/1.1", 9uLL))
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t select_alpn(_QWORD *a1, _BYTE *a2, uint64_t a3, unsigned int a4, void *__s2, size_t __n)
{
  uint64_t result;
  int v7;
  unsigned int v13;
  size_t v14;
  _BYTE *v15;

  if (__n > a4)
    return 0xFFFFFFFFLL;
  v7 = __n;
  v13 = 0;
  v14 = __n;
  while (1)
  {
    v15 = (_BYTE *)(a3 + v13);
    result = memcmp(v15, __s2, v14);
    if (!(_DWORD)result)
      break;
    v13 += *v15 + 1;
    if (v13 + v7 > a4)
      return 0xFFFFFFFFLL;
  }
  *a1 = a3 + v13 + 1;
  *a2 = *v15;
  return result;
}

uint64_t nghttp2_select_alpn(_QWORD *a1, _BYTE *a2, uint64_t a3, unsigned int a4)
{
  if (!select_alpn(a1, a2, a3, a4, "\x02h2", 3uLL))
    return 1;
  if (select_alpn(a1, a2, a3, a4, "\bhttp/1.1", 9uLL))
    return 0xFFFFFFFFLL;
  return 0;
}

double nghttp2_priority_spec_default_init(uint64_t a1)
{
  double result;

  *(_QWORD *)&result = 0x1000000000;
  *(_QWORD *)a1 = 0x1000000000;
  *(_BYTE *)(a1 + 8) = 0;
  return result;
}

BOOL nghttp2_priority_spec_check_default(uint64_t a1)
{
  return !*(_DWORD *)a1 && *(_DWORD *)(a1 + 4) == 16 && *(_BYTE *)(a1 + 8) == 0;
}

uint64_t parser_skip_inner_list(uint64_t a1)
{
  int v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  unsigned __int8 *v6;
  int v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 16) & 3;
LABEL_2:
  if (v2 == 3)
    goto LABEL_10;
  if (v2 != 1)
  {
    if (v2)
      __assert_rtn("sf_parser_inner_list", "sfparse.c", 746, "0");
    v3 = *(unsigned __int8 **)a1;
    v4 = *(unsigned __int8 **)(a1 + 8);
    while (v3 != v4)
    {
      v5 = *v3;
      if (v5 != 32)
      {
        if (v3 == v4)
          return 0xFFFFFFFFLL;
        goto LABEL_17;
      }
      *(_QWORD *)a1 = ++v3;
    }
    return 0xFFFFFFFFLL;
  }
  if (!parser_skip_params(a1))
  {
LABEL_10:
    v3 = *(unsigned __int8 **)a1;
    v6 = *(unsigned __int8 **)(a1 + 8);
    if (*(unsigned __int8 **)a1 != v6)
    {
      v7 = *v3;
      if (v7 == 32)
      {
        v8 = v3 + 1;
        while (1)
        {
          *(_QWORD *)a1 = v8;
          if (v8 == v6)
            break;
          v9 = *v8++;
          v5 = v9;
          if (v9 != 32)
          {
            v3 = v8 - 1;
LABEL_17:
            if (v5 == 41)
              goto LABEL_21;
            if (parser_bare_item((uint64_t *)a1, 0))
              return 0xFFFFFFFFLL;
            *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFFFC | 1;
            v2 = 1;
            goto LABEL_2;
          }
        }
      }
      else if (v7 == 41)
      {
LABEL_21:
        result = 0;
        *(_QWORD *)a1 = v3 + 1;
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFFF8 | 1;
        return result;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t parser_key(unsigned __int8 **a1, _QWORD *a2)
{
  uint64_t v2;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t result;

  v2 = (uint64_t)*a1;
  v3 = **a1;
  if ((v3 - 97) >= 0x1A && v3 != 42)
    return 0xFFFFFFFFLL;
  v4 = a1[1];
  v5 = (unsigned __int8 *)(v2 + 1);
  *a1 = (unsigned __int8 *)(v2 + 1);
  if ((unsigned __int8 *)(v2 + 1) == v4)
  {
LABEL_5:
    v5 = v4;
  }
  else
  {
    while (2)
    {
      switch(*v5)
      {
        case '*':
        case '-':
        case '.':
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
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
          *a1 = ++v5;
          if (v5 == v4)
            goto LABEL_5;
          continue;
        default:
          goto LABEL_6;
      }
    }
  }
LABEL_6:
  result = 0;
  if (a2)
  {
    *a2 = v2;
    a2[1] = &v5[-v2];
  }
  return result;
}

uint64_t parser_bare_item(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  uint64_t result;

  v2 = *a1;
  v3 = 0xFFFFFFFFLL;
  switch(*(_BYTE *)*a1)
  {
    case '"':
      result = parser_string(a1, (uint64_t)a2);
      break;
    case '*':
    case 'A':
    case 'B':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 's':
    case 't':
    case 'u':
    case 'v':
    case 'w':
    case 'x':
    case 'y':
    case 'z':
      v4 = (_BYTE *)a1[1];
      v5 = (_BYTE *)(v2 + 1);
      *a1 = v2 + 1;
      if ((_BYTE *)(v2 + 1) != v4)
      {
        while (2)
        {
          switch(*v5)
          {
            case '!':
            case '#':
            case '$':
            case '%':
            case '&':
            case '\'':
            case '*':
            case '+':
            case '-':
            case '.':
            case '/':
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
            case ':':
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
            case '^':
            case '_':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'f':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
            case 'w':
            case 'x':
            case 'y':
            case 'z':
            case '|':
            case '~':
              *a1 = (uint64_t)++v5;
              if (v5 != v4)
                continue;
              break;
            default:
              goto LABEL_5;
          }
          break;
        }
      }
LABEL_5:
      v3 = 0;
      if (a2)
      {
        *a2 = 4;
        a2[1] = v2;
        a2[2] = *a1 - v2;
      }
      goto LABEL_7;
    case '-':
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
      result = parser_number(a1, a2);
      break;
    case ':':
      result = parser_byteseq(a1, a2);
      break;
    case '?':
      result = parser_BOOLean(a1, (uint64_t)a2);
      break;
    case '@':
      result = parser_date(a1, (uint64_t)a2);
      break;
    default:
LABEL_7:
      result = v3;
      break;
  }
  return result;
}

uint64_t parser_string(_QWORD *a1, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  _BYTE *v4;
  int v5;
  uint64_t v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;

  v2 = (_BYTE *)*a1;
  if (*(_BYTE *)*a1 != 34)
    __assert_rtn("parser_string", "sfparse.c", 380, "'\"' == *sfp->pos");
  v3 = v2 + 1;
  v4 = (_BYTE *)a1[1];
  *a1 = v2 + 1;
  if (v2 + 1 != v4)
  {
    v5 = 0;
    v6 = 1;
    v7 = v2 + 1;
    while (2)
    {
      switch(v2[v6])
      {
        case ' ':
        case '!':
        case '#':
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
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
        case ':':
        case ';':
        case '<':
        case '=':
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '[':
        case ']':
        case '^':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
        case '{':
        case '|':
        case '}':
        case '~':
          goto LABEL_5;
        case '"':
          if (a2)
          {
            *(_DWORD *)a2 = 3;
            *(_DWORD *)(a2 + 4) = v5;
            if (v6 == 1)
              v3 = 0;
            *(_QWORD *)(a2 + 8) = v3;
            *(_QWORD *)(a2 + 16) = v6 - 1;
            v7 = (_BYTE *)*a1;
          }
          v9 = 0;
          *a1 = v7 + 1;
          return v9;
        case '\\':
          *a1 = &v2[++v6];
          if (&v2[v6] == v4)
            return 0xFFFFFFFFLL;
          v8 = v2[v6];
          v5 = 1;
          if (v8 != 34 && v8 != 92)
            return 0xFFFFFFFFLL;
LABEL_5:
          v7 = &v2[++v6];
          *a1 = &v2[v6];
          if (&v2[v6] == v4)
            return 0xFFFFFFFFLL;
          continue;
        default:
          return 0xFFFFFFFFLL;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t parser_number(uint64_t *a1, _QWORD *a2)
{
  unint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;

  v2 = *a1;
  if (*(_BYTE *)*a1 != 45)
  {
    v3 = (_BYTE *)a1[1];
    v4 = 1;
    goto LABEL_5;
  }
  *a1 = ++v2;
  v3 = (_BYTE *)a1[1];
  if ((_BYTE *)v2 != v3)
  {
    v4 = -1;
LABEL_5:
    if ((_BYTE *)v2 == v3)
      __assert_rtn("parser_number", "sfparse.c", 259, "!parser_eof(sfp)");
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = (_BYTE *)(v2 + v5);
      v8 = *(unsigned __int8 *)(v2 + v5);
      if ((v8 - 48) > 9)
        break;
      if (v5 == 15)
        return 0xFFFFFFFFLL;
      v9 = (_BYTE *)(v2 + v5++);
      v6 = v8 + 10 * v6 - 48;
      *a1 = (uint64_t)(v9 + 1);
      if ((_BYTE *)(v2 + v5) == v3)
        goto LABEL_20;
    }
    if (!v5)
      return 0xFFFFFFFFLL;
    if ((_DWORD)v8 == 46)
    {
      if (v5 > 0xC)
        return 0xFFFFFFFFLL;
      *a1 = (uint64_t)(v7 + 1);
      if (v7 + 1 == v3)
      {
        v11 = v5;
      }
      else
      {
        v10 = 0;
        v11 = (unint64_t)&v3[~v2];
        while (1)
        {
          v12 = *(unsigned __int8 *)(v2 + v10 + v5 + 1);
          if ((v12 - 48) > 9)
            break;
          if (v5 + v10 == 15)
            return 0xFFFFFFFFLL;
          v6 = v12 + 10 * v6 - 48;
          v13 = v2 + v5 + v10 + 2;
          *a1 = v13;
          ++v10;
          if ((_BYTE *)v13 == v3)
            goto LABEL_24;
        }
        v11 = v5 + v10;
      }
LABEL_24:
      v15 = v11 - v5;
      if (v11 == v5 || v15 > 3)
        return 0xFFFFFFFFLL;
      if (a2)
      {
        *a2 = 2;
        a2[1] = v6 * v4;
        switch(v15)
        {
          case 3uLL:
            result = 0;
            v16 = 1000;
            goto LABEL_36;
          case 2uLL:
            result = 0;
            v16 = 100;
            goto LABEL_36;
          case 1uLL:
            result = 0;
            v16 = 10;
LABEL_36:
            a2[2] = v16;
            return result;
        }
      }
    }
    else
    {
LABEL_20:
      if (a2)
      {
        result = 0;
        *a2 = 1;
        a2[1] = v6 * v4;
        return result;
      }
    }
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t parser_date(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t result;
  __int128 v6;
  uint64_t v7;

  v6 = 0uLL;
  v7 = 0;
  if (*(_BYTE *)*a1 != 64)
    __assert_rtn("parser_date", "sfparse.c", 350, "'@' == *sfp->pos");
  v2 = *a1 + 1;
  *a1 = v2;
  if (v2 == a1[1])
    return 0xFFFFFFFFLL;
  v4 = parser_number(a1, &v6);
  result = 0xFFFFFFFFLL;
  if (!v4 && (_DWORD)v6 == 1)
  {
    result = 0;
    if (a2)
    {
      *(_OWORD *)a2 = v6;
      *(_QWORD *)(a2 + 16) = v7;
      *(_DWORD *)a2 = 7;
    }
  }
  return result;
}

uint64_t parser_byteseq(_QWORD *a1, _QWORD *a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  _BYTE *v8;
  int v9;
  _BYTE *v10;
  _BYTE *v11;
  int v12;
  unsigned int v13;

  v2 = (_BYTE *)*a1;
  if (*(_BYTE *)*a1 != 58)
    __assert_rtn("parser_byteseq", "sfparse.c", 473, "':' == *sfp->pos");
  v3 = (_BYTE *)a1[1];
  *a1 = v2 + 1;
  if (v2 + 1 == v3)
    return 0xFFFFFFFFLL;
  v4 = 1;
  while (2)
  {
    v5 = 0xFFFFFFFFLL;
    switch(v2[v4])
    {
      case '+':
      case '/':
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
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'M':
      case 'N':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'h':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'q':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case 'z':
        *a1 = &v2[++v4];
        if (v3 - v2 == v4)
          return 0xFFFFFFFFLL;
        continue;
      case ':':
        if ((((_BYTE)v4 - 1) & 3) != 0)
          return 0xFFFFFFFFLL;
        goto LABEL_16;
      case '=':
        v7 = ((int)v4 - 1) & 3;
        if (v7 < 2)
          return 0xFFFFFFFFLL;
        v8 = &v2[v4];
        if (v7 == 3)
        {
          v9 = *(v8 - 1);
          if (((v9 - 48) > 0x3F || ((1 << (v9 - 48)) & 0x8888022222220111) == 0)
            && v9 != 115
            && v9 != 119)
          {
            return 0xFFFFFFFFLL;
          }
        }
        else
        {
          v12 = *(v8 - 1);
          v5 = 0xFFFFFFFFLL;
          v13 = v12 - 65;
          if (v13 > 0x36 || ((1 << v13) & 0x40004000010001) == 0)
            return v5;
          *a1 = &v2[++v4];
          if (&v2[v4] == v3 || v2[v4] != 61)
            return 0xFFFFFFFFLL;
        }
        *a1 = &v2[++v4];
        if (&v2[v4] == v3 || v2[v4] != 58)
          return 0xFFFFFFFFLL;
LABEL_16:
        if (a2)
        {
          *a2 = 5;
          if (v4 == 1)
            v10 = 0;
          else
            v10 = v2 + 1;
          a2[1] = v10;
          a2[2] = v4 - 1;
          v11 = (_BYTE *)*a1;
        }
        else
        {
          v11 = &v2[v4];
        }
        v5 = 0;
        *a1 = v11 + 1;
        break;
      default:
        return v5;
    }
    return v5;
  }
}

uint64_t parser_BOOLean(_QWORD *a1, uint64_t a2)
{
  _BYTE *v2;
  int v3;
  int v4;
  uint64_t result;

  v2 = (_BYTE *)*a1;
  if (*(_BYTE *)*a1 != 63)
    __assert_rtn("parser_BOOLean", "sfparse.c", 570, "'?' == *sfp->pos");
  *a1 = v2 + 1;
  if (v2 + 1 == (_BYTE *)a1[1])
    return 0xFFFFFFFFLL;
  v3 = v2[1];
  if (v3 != 48)
  {
    if (v3 == 49)
    {
      v4 = 1;
      goto LABEL_8;
    }
    return 0xFFFFFFFFLL;
  }
  v4 = 0;
LABEL_8:
  *a1 = v2 + 2;
  result = 0;
  if (a2)
  {
    *(_QWORD *)a2 = 0;
    *(_DWORD *)(a2 + 8) = v4;
  }
  return result;
}

uint64_t parser_skip_params(uint64_t a1)
{
  unsigned int v2;
  _BYTE *v3;
  unsigned __int8 *v4;
  _BYTE *i;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t result;

LABEL_1:
  v2 = *(_DWORD *)(a1 + 16);
  if ((v2 & 3) != 2)
  {
    if ((v2 & 3) != 1)
    {
      if ((v2 & 3) != 0)
        __assert_rtn("sf_parser_param", "sfparse.c", 643, "0");
      if (parser_skip_inner_list(a1))
        return 0xFFFFFFFFLL;
      v2 = *(_DWORD *)(a1 + 16);
    }
    v2 = v2 & 0xFFFFFFFC | 2;
    *(_DWORD *)(a1 + 16) = v2;
  }
  v4 = *(unsigned __int8 **)a1;
  v3 = *(_BYTE **)(a1 + 8);
  if (*(_BYTE **)a1 == v3 || *v4 != 59)
  {
    result = 0;
    *(_DWORD *)(a1 + 16) = v2 | 3;
    return result;
  }
  for (i = v4 + 1; ; ++i)
  {
    *(_QWORD *)a1 = i;
    if (i == v3)
      break;
    if (*i != 32)
    {
      if (i == v3 || parser_key((unsigned __int8 **)a1, 0))
        return 0xFFFFFFFFLL;
      v7 = *(unsigned __int8 **)a1;
      v6 = *(unsigned __int8 **)(a1 + 8);
      if (*(unsigned __int8 **)a1 != v6 && *v7 == 61)
      {
        v8 = v7 + 1;
        *(_QWORD *)a1 = v8;
        if (v8 == v6)
          return 0xFFFFFFFFLL;
        result = parser_bare_item((uint64_t *)a1, 0);
        if ((_DWORD)result)
        {
          if ((_DWORD)result != -1)
            __assert_rtn("parser_skip_params", "sfparse.c", 697, "0");
          return result;
        }
      }
      goto LABEL_1;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t bufs_alloc_chain(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = **(_QWORD **)(a1 + 8);
  if (v2)
  {
    result = 0;
    *(_QWORD *)(a1 + 8) = v2;
  }
  else if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a1 + 40))
  {
    return 4294966794;
  }
  else
  {
    v8 = 0;
    result = buf_chain_new(&v8, *(_QWORD *)(a1 + 24), *(_QWORD **)(a1 + 16));
    if (!(_DWORD)result)
    {
      ++*(_QWORD *)(a1 + 40);
      v4 = v8;
      **(_QWORD **)(a1 + 8) = v8;
      *(_QWORD *)(a1 + 8) = v4;
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(_QWORD *)(v4 + 24) + v5;
      v7 = *(_QWORD *)(v4 + 32) + v5;
      *(_QWORD *)(v4 + 24) = v6;
      *(_QWORD *)(v4 + 32) = v7;
    }
  }
  return result;
}

uint64_t nghttp2_http_parse_priority(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  int v4;
  int v5;
  int v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *j;
  int v10;
  unsigned __int8 *i;
  int v13;
  unsigned __int8 *v15;
  int v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  uint64_t v25;

  v4 = 0;
  v6 = *a1;
  v5 = a1[1];
  v21 = 0;
  v22 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v7 = &a2[a3];
  if (a3)
  {
    v8 = a2;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v24 = v7;
  v25 = 0;
  v23 = v8;
LABEL_5:
  if (v4 > 10)
  {
    if (parser_skip_inner_list((uint64_t)&v23))
      return 4294966795;
  }
  else if (!v4)
  {
    for (i = v23; i != v24; ++i)
    {
      if (*i != 32)
      {
        v23 = i;
        if (i == v24)
          goto LABEL_50;
LABEL_32:
        if (parser_key(&v23, &v21))
          return 4294966795;
        v15 = v23;
        if (v23 == v24 || *v23 != 61)
        {
          v18 = 0;
          v4 = 9;
          LODWORD(v19) = 1;
        }
        else
        {
          ++v23;
          if (v15 + 1 == v24)
            return 4294966795;
          if (v15[1] == 40)
          {
            v18 = 6;
            v23 = v15 + 2;
            v4 = 12;
          }
          else
          {
            if (parser_bare_item((uint64_t *)&v23, &v18))
              return 4294966795;
            v4 = 9;
          }
        }
        LODWORD(v25) = v4;
        if (v22 != 1)
          goto LABEL_5;
        v16 = *v21;
        if (v16 != 117)
        {
          if (v16 != 105)
            goto LABEL_5;
          if (!(_DWORD)v18)
          {
            v5 = v19;
            goto LABEL_5;
          }
          return 4294966795;
        }
        result = 4294966795;
        if ((_DWORD)v18 == 1)
        {
          v6 = v19;
          if ((v19 & 0x8000000000000000) == 0 && v19 <= 7)
            goto LABEL_5;
        }
        return result;
      }
    }
    goto LABEL_50;
  }
  if (!parser_skip_params((uint64_t)&v23))
  {
    for (j = v23; j != v24; ++j)
    {
      v10 = *j;
      if (v10 != 32 && v10 != 9)
      {
        if (j == v24)
          break;
        if (v10 == 44)
        {
          while (1)
          {
            v23 = ++j;
            if (j == v24)
              break;
            v13 = *j;
            if (v13 != 32 && v13 != 9)
            {
              if (j != v24)
                goto LABEL_32;
              return 4294966795;
            }
          }
        }
        return 4294966795;
      }
    }
LABEL_50:
    result = 0;
    *a1 = v6;
    a1[1] = v5;
    return result;
  }
  return 4294966795;
}

uint64_t nghttp2_http_on_request_headers(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  BOOL v4;

  v2 = *(_DWORD *)(a1 + 212);
  if ((v2 & 0x8080) != 0x80)
  {
    v4 = (~v2 & 0xE) != 0 || (v2 & 0x11) == 0;
    if (!v4 && ((v2 & 0x8000) == 0 || (v2 & 0x81) == 0x81) && ((v2 & 0x2800) != 0x2000 || (v2 & 0x1200) == 0x1200))
      goto LABEL_4;
    return 0xFFFFFFFFLL;
  }
  if ((v2 & 0xB) != 1)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 48) = -1;
LABEL_4:
  v3 = 0;
  if (*(_BYTE *)(a2 + 12) == 5)
  {
    *(_DWORD *)(a1 + 212) = v2 & 0x780;
    *(_QWORD *)(a1 + 48) = -1;
  }
  return v3;
}

uint64_t nghttp2_rcbuf_incref(uint64_t result)
{
  int v1;

  v1 = *(_DWORD *)(result + 32);
  if (v1 != -1)
    *(_DWORD *)(result + 32) = v1 + 1;
  return result;
}

uint64_t nghttp2_rcbuf_get_buf(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

BOOL nghttp2_rcbuf_is_static(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) == -1;
}

void *nghttp2_version(int a1)
{
  if (a1 <= 81408)
    return &version;
  else
    return 0;
}

uint64_t nghttp2_submit_trailer(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 1)
    return 4294966795;
  else
    return submit_headers_shared_nva(a1, 1, a2, 0, a3, a4, 0, 0);
}

uint64_t nghttp2_submit_headers(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v7;
  int v8;
  int v9;

  if (a3 == -1)
  {
    if (*(_BYTE *)(a1 + 2932) && (~*(_DWORD *)(a1 + 2916) & 0x84) != 0)
      return 4294966791;
  }
  else if (a3 < 1)
  {
    return 4294966795;
  }
  v7 = a2 & 1;
  if (a4)
  {
    v8 = *(_DWORD *)a4;
    if ((*(_DWORD *)a4 || *(_DWORD *)(a4 + 4) != 16 || *(_BYTE *)(a4 + 8)) && *(_DWORD *)(a1 + 2880) != 1)
    {
      if (a3 == -1)
      {
        v9 = *(_DWORD *)(a1 + 2800);
      }
      else
      {
        v9 = *(_DWORD *)a4;
        v8 = a3;
      }
      if (v9 == v8)
        return 4294966795;
      v7 |= 0x20u;
    }
    else
    {
      a4 = 0;
    }
  }
  return submit_headers_shared_nva(a1, v7, a3, a4, a5, a6, 0, a7);
}

uint64_t nghttp2_submit_ping(uint64_t a1, char a2, uint64_t *a3)
{
  return nghttp2_session_add_ping(a1, a2 & 1, a3);
}

uint64_t nghttp2_submit_priority(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v4;
  int v7;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_DWORD *)(a1 + 2880) == 1)
    return 0;
  v4 = 4294966795;
  if (a3 && a4)
  {
    v7 = *a4;
    if (*a4 == a3)
    {
      return 4294966795;
    }
    else
    {
      v9 = a4[1];
      if (v9 < 1)
      {
        v9 = 1;
      }
      else if (v9 >= 0x101)
      {
        v9 = 256;
      }
      v10 = a4[2];
      v11 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
      if (v11)
      {
        v12 = v11;
        *(_OWORD *)(v11 + 137) = 0u;
        *(_OWORD *)(v11 + 112) = 0u;
        *(_OWORD *)(v11 + 128) = 0u;
        *(_OWORD *)(v11 + 96) = 0u;
        *(_QWORD *)v11 = 5;
        *(_WORD *)(v11 + 12) = 2;
        *(_DWORD *)(v11 + 8) = a3;
        *(_BYTE *)(v11 + 14) = 0;
        *(_DWORD *)(v11 + 16) = v7;
        *(_DWORD *)(v11 + 20) = v9;
        *(_DWORD *)(v11 + 24) = v10;
        v4 = nghttp2_session_add_item(a1, v11);
        if ((_DWORD)v4)
          (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v12, *(_QWORD *)(a1 + 2568));
      }
      else
      {
        return 4294966395;
      }
    }
  }
  return v4;
}

uint64_t nghttp2_submit_goaway(uint64_t a1, uint64_t a2, int a3, int a4, const void *a5, size_t a6)
{
  if ((*(_BYTE *)(a1 + 2933) & 1) != 0)
    return 0;
  else
    return nghttp2_session_add_goaway(a1, a3, a4, a5, a6, 0);
}

uint64_t nghttp2_submit_shutdown_notice(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 2932))
    return 4294966777;
  if (*(_BYTE *)(a1 + 2933))
    return 0;
  return nghttp2_session_add_goaway(a1, 0x7FFFFFFF, 0, 0, 0, 2);
}

uint64_t nghttp2_submit_push_promise(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v6 = 4294966795;
  if (a3 >= 1)
  {
    v6 = ((a3 & 1) == 0) != (*(_BYTE *)(a1 + 2932) == 0) ? 4294966795 : 4294966791;
    if (*(_BYTE *)(a1 + 2932) && (a3 & 1) != 0)
    {
      if ((*(_DWORD *)(a1 + 2800) & 0x80000000) != 0)
      {
        return 4294966787;
      }
      else
      {
        v12 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
        if (v12)
        {
          v13 = v12;
          v19 = 0;
          *(_OWORD *)(v12 + 96) = 0u;
          *(_OWORD *)(v12 + 112) = 0u;
          *(_OWORD *)(v12 + 128) = 0u;
          *(_OWORD *)(v12 + 137) = 0u;
          *(_QWORD *)(v12 + 120) = a6;
          v14 = nghttp2_nv_array_copy(&v19, a4, a5, a1 + 2568);
          if ((v14 & 0x80000000) != 0)
          {
            v6 = v14;
            goto LABEL_15;
          }
          v6 = *(unsigned int *)(a1 + 2800);
          *(_DWORD *)(a1 + 2800) = v6 + 2;
          v15 = v19;
          *(_QWORD *)v13 = 0;
          *(_WORD *)(v13 + 12) = 1029;
          *(_DWORD *)(v13 + 8) = a3;
          *(_BYTE *)(v13 + 14) = 0;
          *(_QWORD *)(v13 + 16) = 0;
          *(_QWORD *)(v13 + 24) = v15;
          *(_QWORD *)(v13 + 32) = a5;
          *(_DWORD *)(v13 + 40) = v6;
          *(_BYTE *)(v13 + 44) = 0;
          v16 = nghttp2_session_add_item(a1, v13);
          if ((_DWORD)v16)
          {
            v17 = v16;
            (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(v13 + 24), *(_QWORD *)(a1 + 2568));
            v6 = v17;
LABEL_15:
            (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v13, *(_QWORD *)(a1 + 2568));
          }
        }
        else
        {
          return 4294966395;
        }
      }
    }
  }
  return v6;
}

uint64_t nghttp2_session_set_local_window_size(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t result;
  uint64_t v8;
  int *v9;
  int v10;
  int *v11;
  int *v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;

  if (a4 < 0)
    return 4294966795;
  if (a3)
  {
    result = nghttp2_map_find((uint64_t *)a1, a3);
    if (!result)
      return result;
    v8 = result;
    if ((*(_BYTE *)(result + 216) & 2) == 0 && *(_DWORD *)(result + 204) != 5)
    {
      v9 = (int *)(result + 188);
      v10 = a4 - *(_DWORD *)(v8 + 188);
      v17 = v10;
      if (v10)
      {
        v11 = (int *)(v8 + 176);
        v12 = (int *)(v8 + 184);
        if ((v10 & 0x80000000) == 0)
        {
          result = nghttp2_increase_local_window_size(v9, v11, v12, &v17);
          if (!(_DWORD)result)
          {
            v13 = v17;
            v14 = a1;
            if (v17 >= 1)
            {
              v15 = a3;
              return nghttp2_session_add_window_update(v14, v15, v13);
            }
            return nghttp2_session_update_recv_stream_window_size(a1, v8, 0, 1);
          }
          return result;
        }
        return nghttp2_adjust_local_window_size(v9, v11, v12, &v17);
      }
    }
    return 0;
  }
  v16 = a4 - *(_DWORD *)(a1 + 2844);
  v17 = v16;
  if (!v16)
    return 0;
  v9 = (int *)(a1 + 2844);
  v11 = (int *)(a1 + 2832);
  v12 = (int *)(a1 + 2840);
  if (v16 < 0)
    return nghttp2_adjust_local_window_size(v9, v11, v12, &v17);
  result = nghttp2_increase_local_window_size(v9, v11, v12, &v17);
  if (!(_DWORD)result)
  {
    v13 = v17;
    v14 = a1;
    if (v17 >= 1)
    {
      v15 = 0;
      return nghttp2_session_add_window_update(v14, v15, v13);
    }
    return nghttp2_session_update_recv_connection_window_size(a1, 0);
  }
  return result;
}

uint64_t nghttp2_submit_altsvc(uint64_t a1, uint64_t a2, int a3, const void *a4, size_t a5, const void *a6, size_t a7)
{
  unint64_t v9;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;

  if (!*(_BYTE *)(a1 + 2932))
    return 4294966777;
  v9 = a5 + a7 + 2;
  if (v9 > 0x4000)
    return 4294966795;
  if (a3)
  {
    if (!a5)
    {
      v13 = (_BYTE *)(*(uint64_t (**)(size_t, _QWORD))(a1 + 2576))(a7 + 2, *(_QWORD *)(a1 + 2568));
      v14 = v13;
      if (!v13)
        return 4294966395;
      goto LABEL_11;
    }
    return 4294966795;
  }
  if (!a5)
    return 4294966795;
  v17 = (_BYTE *)(*(uint64_t (**)(size_t, _QWORD))(a1 + 2576))(a5 + a7 + 2, *(_QWORD *)(a1 + 2568));
  if (!v17)
    return 4294966395;
  v13 = v17;
  memcpy(v17, a4, a5);
  v14 = &v13[a5];
LABEL_11:
  *v14 = 0;
  v18 = v14 + 1;
  v19 = v18;
  if (a7)
  {
    memcpy(v18, a6, a7);
    v19 = &v18[a7];
  }
  *v19 = 0;
  v20 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v20)
  {
    free(v13);
    return 4294966395;
  }
  v21 = v20;
  *(_QWORD *)(v20 + 145) = 0;
  *(_OWORD *)(v20 + 129) = 0u;
  *(_OWORD *)(v20 + 113) = 0u;
  *(_OWORD *)(v20 + 97) = 0u;
  *(_BYTE *)(v20 + 96) = 1;
  *(_QWORD *)(v20 + 64) = v13;
  *(_QWORD *)(v20 + 16) = v20 + 64;
  *(_QWORD *)v20 = v9;
  *(_WORD *)(v20 + 12) = 10;
  *(_DWORD *)(v20 + 8) = a3;
  *(_BYTE *)(v20 + 14) = 0;
  *(_QWORD *)(v20 + 72) = a5;
  *(_QWORD *)(v20 + 80) = v18;
  *(_QWORD *)(v20 + 88) = a7;
  v15 = nghttp2_session_add_item(a1, v20);
  if ((_DWORD)v15)
  {
    v22 = *(_QWORD **)(v21 + 16);
    if (v22)
      (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*v22, *(_QWORD *)(a1 + 2568));
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v21, *(_QWORD *)(a1 + 2568));
  }
  return v15;
}

uint64_t nghttp2_submit_origin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (!*(_BYTE *)(a1 + 2932))
    return 4294966777;
  if (a4)
  {
    v7 = 0;
    v8 = (uint64_t *)(a3 + 8);
    v9 = a4;
    do
    {
      v10 = *v8;
      v8 += 2;
      v7 += v10;
      --v9;
    }
    while (v9);
    if ((unint64_t)(v7 + 2 * a4) > 0x4000)
      return 4294966795;
    v13 = 17 * a4 + v7;
    v14 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(v13, *(_QWORD *)(a1 + 2568));
    if (!v14)
      return 4294966395;
    v12 = (char *)v14;
    v15 = 0;
    v16 = (_BYTE *)(v14 + 16 * a4);
    v17 = a4;
    do
    {
      v18 = &v12[v15];
      v19 = *(_QWORD *)(a3 + v15 + 8);
      *(_QWORD *)v18 = v16;
      *((_QWORD *)v18 + 1) = v19;
      v20 = *(_QWORD *)(a3 + v15 + 8);
      if (v20)
      {
        memcpy(v16, *(const void **)(a3 + v15), *(_QWORD *)(a3 + v15 + 8));
        v16 += v20;
      }
      *v16++ = 0;
      v15 += 16;
      --v17;
    }
    while (v17);
    if (v16 - v12 != v13)
      __assert_rtn("nghttp2_submit_origin", "nghttp2_submit.c", 634, "(size_t)(p - (uint8_t *)ov_copy) == nov * sizeof(nghttp2_origin_entry) + len + nov");
  }
  else
  {
    v12 = 0;
  }
  v21 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v21)
  {
    free(v12);
    return 4294966395;
  }
  v22 = v21;
  *(_QWORD *)(v21 + 145) = 0;
  *(_OWORD *)(v21 + 129) = 0u;
  *(_OWORD *)(v21 + 113) = 0u;
  *(_OWORD *)(v21 + 97) = 0u;
  *(_BYTE *)(v21 + 96) = 1;
  *(_QWORD *)(v21 + 16) = v21 + 64;
  v23 = 0;
  if (a4)
  {
    v24 = (uint64_t *)(v12 + 8);
    v25 = a4;
    do
    {
      v26 = *v24;
      v24 += 2;
      v23 += v26 + 2;
      --v25;
    }
    while (v25);
  }
  *(_QWORD *)v21 = v23;
  *(_WORD *)(v21 + 12) = 12;
  *(_DWORD *)(v21 + 8) = 0;
  *(_BYTE *)(v21 + 14) = 0;
  *(_QWORD *)(v21 + 64) = a4;
  *(_QWORD *)(v21 + 72) = v12;
  v11 = nghttp2_session_add_item(a1, v21);
  if ((_DWORD)v11)
  {
    v27 = *(_QWORD *)(v22 + 16);
    if (v27)
      (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(v27 + 8), *(_QWORD *)(a1 + 2568));
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v22, *(_QWORD *)(a1 + 2568));
  }
  return v11;
}

uint64_t nghttp2_submit_priority_update(uint64_t a1, uint64_t a2, int a3, const void *a4, size_t a5)
{
  uint64_t v5;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*(_BYTE *)(a1 + 2932))
    return 4294966777;
  if (!*(_DWORD *)(a1 + 2880))
    return 0;
  v5 = 4294966795;
  if (a3 && a5 - 16381 >= 0xFFFFFFFFFFFFBFFFLL)
  {
    if (a5)
    {
      v11 = (_BYTE *)(*(uint64_t (**)(size_t, _QWORD))(a1 + 2576))(a5 + 1, *(_QWORD *)(a1 + 2568));
      if (!v11)
        return 4294966395;
      v12 = v11;
      memcpy(v11, a4, a5);
      v12[a5] = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
    if (v13)
    {
      v14 = v13;
      *(_QWORD *)(v13 + 145) = 0;
      *(_OWORD *)(v13 + 129) = 0u;
      *(_OWORD *)(v13 + 113) = 0u;
      *(_OWORD *)(v13 + 97) = 0u;
      *(_BYTE *)(v13 + 96) = 1;
      *(_DWORD *)(v13 + 64) = a3;
      *(_QWORD *)(v13 + 16) = v13 + 64;
      *(_QWORD *)v13 = a5 + 4;
      *(_WORD *)(v13 + 12) = 16;
      *(_DWORD *)(v13 + 8) = 0;
      *(_BYTE *)(v13 + 14) = 0;
      *(_QWORD *)(v13 + 72) = v12;
      *(_QWORD *)(v13 + 80) = a5;
      v5 = nghttp2_session_add_item(a1, v13);
      if ((_DWORD)v5)
      {
        v15 = *(_QWORD *)(v14 + 16);
        if (v15)
          (*(void (**)(_QWORD, _QWORD))(a1 + 2584))(*(_QWORD *)(v15 + 8), *(_QWORD *)(a1 + 2568));
        (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v14, *(_QWORD *)(a1 + 2568));
      }
      return v5;
    }
    free(v12);
    return 4294966395;
  }
  return v5;
}

uint64_t submit_request_shared(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  char v10;

  if (*(_BYTE *)(a1 + 2932))
    return 4294966791;
  v9 = a2;
  if (a2)
  {
    if ((*(_DWORD *)a2 || *(_DWORD *)(a2 + 4) != 16 || *(_BYTE *)(a2 + 8)) && *(_DWORD *)(a1 + 2880) != 1)
    {
      if (*(_DWORD *)(a1 + 2800) == *(_DWORD *)a2)
        return 4294966795;
    }
    else
    {
      v9 = 0;
    }
  }
  if (a5 && *(_QWORD *)(a5 + 16))
  {
    v10 = 32 * (v9 != 0);
  }
  else if (v9)
  {
    v10 = 33;
  }
  else
  {
    v10 = 1;
  }
  return submit_headers_shared_nva(a1, v10, -1, v9, a3, a4, (__int128 *)a5, a6);
}

uint64_t nghttp2_submit_request2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6)
{
  uint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  if (a5)
  {
    LODWORD(v7) = 2;
    v8 = *a5;
    a5 = (__int128 *)&v7;
  }
  return submit_request_shared(a1, a2, a3, a4, (uint64_t)a5, a6);
}

uint64_t nghttp2_submit_response(uint64_t a1, int a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v6;
  __int128 v7;

  v6 = 0;
  v7 = 0uLL;
  if (a5)
  {
    LODWORD(v6) = 1;
    v7 = *a5;
    a5 = (__int128 *)&v6;
  }
  return submit_response_shared(a1, a2, a3, a4, (uint64_t)a5);
}

uint64_t submit_response_shared(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v8;

  if (a2 < 1)
    return 4294966795;
  if (!*(_BYTE *)(a1 + 2932))
    return 4294966791;
  v8 = !a5 || !*(_QWORD *)(a5 + 16);
  return submit_headers_shared_nva(a1, v8, a2, 0, a3, a4, (__int128 *)a5, 0);
}

uint64_t nghttp2_submit_response2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v6;
  __int128 v7;

  v6 = 0;
  v7 = 0uLL;
  if (a5)
  {
    LODWORD(v6) = 2;
    v7 = *a5;
    a5 = (__int128 *)&v6;
  }
  return submit_response_shared(a1, a2, a3, a4, (uint64_t)a5);
}

uint64_t nghttp2_submit_data_shared(uint64_t a1, char a2, int a3, __int128 *a4)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  if (!a3)
    return 4294966795;
  v8 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v8)
    return 4294966395;
  v9 = v8;
  *(_OWORD *)(v8 + 137) = 0u;
  *(_OWORD *)(v8 + 112) = 0u;
  *(_OWORD *)(v8 + 128) = 0u;
  *(_OWORD *)(v8 + 96) = 0u;
  v10 = *a4;
  *(_QWORD *)(v8 + 112) = *((_QWORD *)a4 + 2);
  *(_OWORD *)(v8 + 96) = v10;
  *(_BYTE *)(v8 + 120) = a2 & 1;
  *(_QWORD *)v8 = 0;
  *(_WORD *)(v8 + 12) = 0;
  *(_DWORD *)(v8 + 8) = a3;
  *(_BYTE *)(v8 + 14) = 0;
  *(_QWORD *)(v8 + 16) = 0;
  v11 = nghttp2_session_add_item(a1, v8);
  if ((_DWORD)v11)
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v9, *(_QWORD *)(a1 + 2568));
  return v11;
}

uint64_t nghttp2_submit_data2(uint64_t a1, char a2, int a3, __int128 *a4)
{
  uint64_t v5;
  __int128 v6;

  if (!a4)
    __assert_rtn("nghttp2_submit_data2", "nghttp2_submit.c", 911, "data_prd");
  v5 = 2;
  v6 = *a4;
  return nghttp2_submit_data_shared(a1, a2, a3, (__int128 *)&v5);
}

uint64_t nghttp2_pack_settings_payload2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  unsigned int *v9;
  unsigned int v10;

  v4 = a4;
  if (!nghttp2_iv_check(a3, a4))
    return -501;
  result = 6 * v4;
  if (6 * v4 > a2)
    return -525;
  if (v4)
  {
    v9 = (unsigned int *)(a3 + 4);
    do
    {
      *(_WORD *)a1 = bswap32(*((unsigned __int16 *)v9 - 2)) >> 16;
      v10 = *v9;
      v9 += 2;
      *(_DWORD *)(a1 + 2) = bswap32(v10);
      a1 += 6;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t nghttp2_submit_extension(uint64_t a1, unsigned int a2, char a3, int a4, uint64_t a5)
{
  uint64_t v5;
  char v9;
  uint64_t v11;
  uint64_t v12;

  if (a2 < 0xA)
    return 4294966795;
  v9 = a2;
  if (!*(_QWORD *)(a1 + 2528) && !*(_QWORD *)(a1 + 2520))
    return 4294966777;
  v11 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(160, *(_QWORD *)(a1 + 2568));
  if (!v11)
    return 4294966395;
  v12 = v11;
  *(_QWORD *)v11 = 0;
  *(_OWORD *)(v11 + 96) = 0u;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 137) = 0u;
  *(_BYTE *)(v11 + 12) = v9;
  *(_BYTE *)(v11 + 13) = a3;
  *(_DWORD *)(v11 + 8) = a4;
  *(_BYTE *)(v11 + 14) = 0;
  *(_QWORD *)(v11 + 16) = a5;
  v5 = nghttp2_session_add_item(a1, v11);
  if ((_DWORD)v5)
    (*(void (**)(uint64_t, _QWORD))(a1 + 2584))(v12, *(_QWORD *)(a1 + 2568));
  return v5;
}

BOOL nghttp2_is_fatal(int a1)
{
  return a1 < -900;
}

uint64_t nghttp2_session_terminate_session2(uint64_t a1, int a2, int a3)
{
  return session_terminate_session(a1, a2, a3, 0);
}

uint64_t nghttp2_session_client_new(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  result = session_new(&v6, a2, a3, 0, 0, 0);
  if (!(_DWORD)result)
  {
    v5 = v6;
    *(_DWORD *)(v6 + 2800) = 1;
    *a1 = v5;
  }
  return result;
}

BOOL stream_less_214(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = *(_QWORD *)(a2 + 72) - *(_QWORD *)(a1 + 72);
  if (v2)
    return v2 >> 24 == 0;
  else
    return *(_QWORD *)(a1 + 88) < *(_QWORD *)(a2 + 88);
}

uint64_t nghttp2_session_client_new3(uint64_t *a1, _OWORD *a2, uint64_t a3, __int128 *a4, uint64_t (**a5)(uint64_t, uint64_t, _QWORD))
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v8 = 0;
  result = session_new(&v8, a2, a3, 0, a4, a5);
  if (!(_DWORD)result)
  {
    v7 = v8;
    *(_DWORD *)(v8 + 2800) = 1;
    *a1 = v7;
  }
  return result;
}

uint64_t nghttp2_session_server_new(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  result = session_new(&v6, a2, a3, 1, 0, 0);
  if (!(_DWORD)result)
  {
    v5 = v6;
    *(_DWORD *)(v6 + 2800) = 2;
    *a1 = v5;
  }
  return result;
}

uint64_t nghttp2_session_server_new3(uint64_t *a1, _OWORD *a2, uint64_t a3, __int128 *a4, uint64_t (**a5)(uint64_t, uint64_t, _QWORD))
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v8 = 0;
  result = session_new(&v8, a2, a3, 1, a4, a5);
  if (!(_DWORD)result)
  {
    v7 = v8;
    *(_DWORD *)(v8 + 2800) = 2;
    *a1 = v7;
  }
  return result;
}

uint64_t nghttp2_session_server_new2(uint64_t *a1, _OWORD *a2, uint64_t a3, __int128 *a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  result = session_new(&v7, a2, a3, 1, a4, 0);
  if (!(_DWORD)result)
  {
    v6 = v7;
    *(_DWORD *)(v7 + 2800) = 2;
    *a1 = v6;
  }
  return result;
}

uint64_t nghttp2_session_reprioritize_stream(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t *v3;
  int v6;
  int v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  v3 = (uint64_t *)a3;
  v6 = *(unsigned __int8 *)(a1 + 2932);
  v7 = *(unsigned __int8 *)(a1 + 2930);
  if (*(_BYTE *)(a1 + 2932))
  {
    if (v7 == 1 && !*(_BYTE *)(a1 + 2931))
LABEL_4:
      __assert_rtn("nghttp2_session_reprioritize_stream", "nghttp2_session.c", 866, "(!session->server && session->pending_no_rfc7540_priorities != 1) || (session->server && !session_no_rfc7540_pri_no_fallback(session))");
  }
  else if (v7 == 1)
  {
    goto LABEL_4;
  }
  v8 = *a3;
  if (*a3 == *(_DWORD *)(a2 + 168))
    __assert_rtn("nghttp2_session_reprioritize_stream", "nghttp2_session.c", 867, "pri_spec->stream_id != stream->stream_id");
  if (!*(_QWORD *)(a2 + 96) && !*(_QWORD *)(a2 + 104) && !*(_QWORD *)(a2 + 112) && !*(_QWORD *)(a2 + 120))
    return 0;
  v26 = 0;
  v25 = 0;
  if (!v8)
    goto LABEL_31;
  v9 = (_QWORD *)nghttp2_map_find((uint64_t *)a1, v8);
  if (v9)
  {
    v10 = (uint64_t)v9;
    if (!v9[12] && !v9[13] && !v9[14] && !v9[15])
    {
LABEL_30:
      v25 = 0x1000000000;
      v3 = &v25;
LABEL_31:
      v10 = a1 + 32;
      goto LABEL_32;
    }
  }
  else
  {
    if ((v8 & 1) == (v6 == 0))
      v11 = *(_DWORD *)(a1 + 2804);
    else
      v11 = *(_DWORD *)(a1 + 2808);
    if (v11 >= v8)
      goto LABEL_30;
    v25 = 0x1000000000;
    v12 = nghttp2_session_open_stream(a1, v8, &v25, 5, 0);
    if (!v12)
      return 4294966395;
    v10 = v12;
    if (!*(_DWORD *)v3)
      goto LABEL_31;
  }
  v13 = v10;
  while (v13 != a2)
  {
    v13 = *(_QWORD *)(v13 + 96);
    if (!v13)
      goto LABEL_32;
  }
  nghttp2_stream_dep_remove_subtree(v10);
  result = nghttp2_stream_dep_add_subtree(*(_QWORD *)(a2 + 96), v10);
  if (!(_DWORD)result)
  {
LABEL_32:
    if (v10 == *(_QWORD *)(a2 + 96) && !*((_BYTE *)v3 + 8))
    {
      v19 = *((_DWORD *)v3 + 1);
      v20 = *(unsigned int *)(a2 + 192);
      if (v19 != (_DWORD)v20)
      {
        *(_DWORD *)(a2 + 192) = v19;
        *(_DWORD *)(v10 + 200) += v19 - v20;
        if (*(_BYTE *)(a2 + 218))
        {
          nghttp2_pq_remove(v10 + 8, (unint64_t *)a2);
          v21 = *(unsigned int *)(a2 + 192);
          v22 = ((*(_DWORD *)(a2 + 196) + v20)
               + (*(_QWORD *)(a2 + 160) << 8) / v20 * v20
               - (*(_QWORD *)(a2 + 160) << 8))
              % v20
              + (*(_QWORD *)(a2 + 160) << 8);
          v23 = v22 / v21 + *(_QWORD *)(a2 + 72) - v22 / v20;
          *(_QWORD *)(a2 + 72) = v23;
          *(_DWORD *)(a2 + 196) = v22 % v21;
          v24 = *(_QWORD *)(v10 + 64);
          if (!((v24 - v23) >> 32))
            *(_QWORD *)(a2 + 72) = v24;
          nghttp2_pq_push((uint64_t *)(v10 + 8), (unint64_t *)a2);
        }
      }
    }
    else
    {
      nghttp2_stream_dep_remove_subtree(a2);
      v15 = *((_DWORD *)v3 + 1);
      *(_DWORD *)(a2 + 192) = v15;
      if (!*((_BYTE *)v3 + 8))
        return nghttp2_stream_dep_add_subtree(v10, a2);
      *(_DWORD *)(a2 + 200) += *(_DWORD *)(v10 + 200);
      *(_DWORD *)(v10 + 200) = v15;
      v16 = *(_QWORD *)(v10 + 104);
      *(_QWORD *)(v10 + 104) = a2;
      *(_QWORD *)(a2 + 96) = v10;
      if (v16)
      {
        v17 = *(_QWORD *)(a2 + 104);
        if (v17)
        {
          do
          {
            v18 = v17;
            v17 = *(_QWORD *)(v17 + 120);
          }
          while (v17);
          *(_QWORD *)(v18 + 120) = v16;
          *(_QWORD *)(v16 + 112) = v18;
        }
        else
        {
          *(_QWORD *)(a2 + 104) = v16;
          *(_QWORD *)(v16 + 96) = a2;
        }
        do
        {
          *(_QWORD *)(v16 + 96) = a2;
          if (*(_BYTE *)(v16 + 218))
          {
            result = stream_obq_move(a2, v10, v16);
            if ((_DWORD)result)
              return result;
          }
          v16 = *(_QWORD *)(v16 + 120);
        }
        while (v16);
      }
      if (*(_QWORD *)(a2 + 152) && (*(_BYTE *)(a2 + 216) & 0xC) == 0 || *(_QWORD *)(a2 + 24))
      {
        result = stream_obq_push(v10, (uint64_t *)a2);
        if ((_DWORD)result)
          return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t session_ob_data_remove(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((*(_BYTE *)(a2 + 216) & 0x10) == 0)
    __assert_rtn("session_ob_data_remove", "nghttp2_session.c", 981, "stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES");
  if (*(_BYTE *)(a2 + 218) != 1)
    __assert_rtn("session_ob_data_remove", "nghttp2_session.c", 982, "stream->queued == 1");
  if ((*(_BYTE *)(a2 + 220) & 0x7Fu) >= 8)
    __assert_rtn("session_ob_data_remove", "nghttp2_session.c", 986, "urgency < NGHTTP2_EXTPRI_URGENCY_LEVELS");
  result = nghttp2_pq_remove(a1 + 40 * (*(_BYTE *)(a2 + 220) & 0x7F) + 328, (unint64_t *)a2);
  *(_BYTE *)(a2 + 218) = 0;
  return result;
}

void nghttp2_session_adjust_closed_stream(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;

  v2 = *(_DWORD *)(a1 + 2892);
  if (v2 == -1)
    v2 = *(_DWORD *)(a1 + 2920);
  v3 = *(_QWORD *)(a1 + 2728);
  if (v3)
  {
    v4 = v2;
    do
    {
      if (*(_QWORD *)(a1 + 2704) + v3 <= v4)
        break;
      v5 = *(_QWORD *)(a1 + 2616);
      if (!v5)
        __assert_rtn("nghttp2_session_adjust_closed_stream", "nghttp2_session.c", 1692, "head_stream");
      v6 = *(_QWORD *)(v5 + 136);
      nghttp2_session_destroy_stream(a1, v5);
      if (v7)
        break;
      *(_QWORD *)(a1 + 2616) = v6;
      v8 = (_QWORD *)(v6 + 128);
      if (!v6)
        v8 = (_QWORD *)(a1 + 2624);
      *v8 = 0;
      v3 = *(_QWORD *)(a1 + 2728) - 1;
      *(_QWORD *)(a1 + 2728) = v3;
    }
    while (v3);
  }
}

BOOL nghttp2_session_check_request_allowed(uint64_t a1)
{
  return !*(_BYTE *)(a1 + 2932)
      && (*(_DWORD *)(a1 + 2800) & 0x80000000) == 0
      && (*(_BYTE *)(a1 + 2933) & 8) == 0
      && !session_is_closing(a1);
}

uint64_t nghttp2_session_mem_send2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unsigned int v4;

  *a2 = 0;
  v3 = nghttp2_session_mem_send_internal(a1, a2, 1);
  if (v3 >= 1)
  {
    if (*(_QWORD *)(a1 + 648))
    {
      session_after_frame_sent1(a1);
      if ((v4 & 0x80000000) != 0)
      {
        if (v4 >= 0xFFFFFC7C)
          __assert_rtn("nghttp2_session_mem_send2", "nghttp2_session.c", 3589, "nghttp2_is_fatal(rv)");
        return (int)v4;
      }
    }
  }
  return v3;
}

uint64_t find_stream_on_goaway_func(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;

  v2 = *(_DWORD *)(a1 + 168);
  if (v2 && ((v2 ^ (*(_BYTE *)(*(_QWORD *)a2 + 2932) == 0)) & 1) == 0)
  {
    if (*(_DWORD *)(a2 + 20))
      return 0;
  }
  else if (!*(_DWORD *)(a2 + 20))
  {
    return 0;
  }
  if (*(_DWORD *)(a1 + 204) != 5 && (*(_BYTE *)(a1 + 216) & 2) == 0 && v2 > *(_DWORD *)(a2 + 16))
  {
    if (*(_QWORD *)(a1 + 136))
      __assert_rtn("find_stream_on_goaway_func", "nghttp2_session.c", 2812, "stream->closed_next == NULL");
    if (*(_QWORD *)(a1 + 128))
      __assert_rtn("find_stream_on_goaway_func", "nghttp2_session.c", 2813, "stream->closed_prev == NULL");
    v3 = *(_QWORD *)(a2 + 8);
    if (v3)
      *(_QWORD *)(a1 + 136) = v3;
    *(_QWORD *)(a2 + 8) = a1;
  }
  return 0;
}

uint64_t session_predicate_push_response_headers_send(uint64_t a1, uint64_t a2)
{
  if (session_is_closing(a1))
    return 4294966766;
  if ((*(_BYTE *)(a2 + 217) & 2) != 0)
    return 4294966784;
  if (*(_BYTE *)(a1 + 2932) && *(_DWORD *)(a2 + 204) == 4)
    return (*(unsigned __int8 *)(a1 + 2933) << 28 >> 31) & 0xFFFFFDFC;
  return 4294966791;
}

uint64_t session_handle_invalid_connection(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  int v5;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t, _QWORD);
  int error_code_from_lib_error_code;

  v5 = a3;
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 2384);
  if (v7 && v7(a1, a2, a3, *(_QWORD *)(a1 + 2608)))
    return 4294966394;
  error_code_from_lib_error_code = get_error_code_from_lib_error_code(v5);
  return session_terminate_session(a1, *(_DWORD *)(a1 + 2812), error_code_from_lib_error_code, a4);
}

uint64_t session_handle_invalid_stream2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int error_code_from_lib_error_code;
  uint64_t result;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t, _QWORD);

  error_code_from_lib_error_code = get_error_code_from_lib_error_code(a4);
  result = nghttp2_session_add_rst_stream(a1, a2, error_code_from_lib_error_code);
  if (!(_DWORD)result)
  {
    v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 2384);
    if (v10 && v10(a1, a3, a4, *(_QWORD *)(a1 + 2608)))
      return 4294966394;
    else
      return 0;
  }
  return result;
}

uint64_t get_error_code_from_lib_error_code(int a1)
{
  switch(a1)
  {
    case -533:
      return 7;
    case -532:
    case -531:
      return 1;
    case -530:
    case -529:
    case -528:
    case -527:
    case -526:
    case -525:
      return 2;
    case -524:
      return 3;
    case -523:
      return 9;
    case -522:
      return 6;
    default:
      if (a1 == -510)
        return 5;
      if (a1 == -505)
        return 1;
      return 2;
  }
}

uint64_t session_update_stream_priority(uint64_t a1, uint64_t a2, int a3)
{
  char v3;

  if (*(unsigned __int8 *)(a2 + 220) != a3)
  {
    v3 = a3;
    if (*(_BYTE *)(a2 + 218))
    {
      session_ob_data_remove(a1, a2);
      *(_BYTE *)(a2 + 220) = v3;
      return session_ob_data_push(a1, a2);
    }
    *(_BYTE *)(a2 + 220) = a3;
  }
  return 0;
}

uint64_t nghttp2_session_mem_recv2(uint64_t a1, char *a2, size_t a3)
{
  __int16 *v3;
  size_t v4;
  char *v5;
  int updated;
  BOOL v8;
  char *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned __int8 v31;
  unsigned int v32;
  unsigned int (*v33)(uint64_t, uint64_t *, _QWORD);
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t (*v38)(uint64_t, _QWORD *, char *);
  int v39;
  int v40;
  unsigned int (*v41)(uint64_t, _QWORD *, _QWORD);
  int v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  __int16 *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _BOOL4 v56;
  uint64_t v57;
  uint64_t v58;
  size_t v59;
  uint64_t v60;
  _BOOL4 v61;
  size_t v62;
  size_t v63;
  char *v64;
  size_t v65;
  size_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  size_t v70;
  uint64_t v71;
  unsigned __int16 *v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int *v79;
  int v80;
  char *v81;
  char *v82;
  size_t v83;
  uint64_t v84;
  char *v85;
  size_t v86;
  size_t v87;
  size_t v88;
  uint64_t v89;
  unsigned int v90;
  unint64_t v91;
  unint64_t v92;
  unsigned int v93;
  unsigned int v94;
  int v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  size_t v101;
  unint64_t v102;
  char v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  __int16 *v108;
  size_t v109;
  size_t v110;
  uint64_t v111;
  unsigned __int16 *v112;
  char v113;
  uint64_t v114;
  int v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  _BOOL4 v119;
  int v120;
  BOOL v121;
  _DWORD *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  uint64_t v138;
  uint64_t v139;
  unsigned __int16 *v140;
  _QWORD *v141;
  unsigned __int16 *v142;
  uint64_t v143;
  unsigned int v144;
  unsigned int v145;
  unint64_t v146;
  uint64_t v147;
  unsigned __int8 *v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  int v155;
  unsigned __int8 *v156;
  uint64_t v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  unsigned __int8 *v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  unsigned __int8 *v165;
  int v166;
  int v167;
  uint64_t v169;
  unsigned __int8 *v170;
  unsigned __int8 *v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  uint64_t v175;
  unsigned __int8 *v176;
  uint64_t v177;
  _BYTE *v178;
  uint64_t v179;
  unsigned __int8 *v180;
  unsigned int v181;
  uint64_t v183;
  _BOOL4 v185;
  int v186;
  unsigned int v187;
  uint64_t v188;
  int v189;
  int v190;
  uint64_t v191;
  uint64_t v192;
  int v193;
  int v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  uint64_t (*v199)(uint64_t, _QWORD *, uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v200;
  uint64_t v201;
  int v202;
  uint64_t (*v203)(uint64_t, _QWORD *, const char *);
  int v204;
  int v205;
  size_t v206;
  uint64_t v207;
  unsigned int v208;
  int v209;
  uint64_t v210;
  int v211;
  uint64_t v212;
  int v213;
  uint64_t v214;
  uint64_t v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  int v224;
  BOOL v225;
  uint64_t v226;
  uint64_t v227;
  int *v229;
  int v230;
  int v231;
  int v232;
  uint64_t v234;
  int v235;
  int v236;
  uint64_t (*v237)(uint64_t, _QWORD *, uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t (*v238)(uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v239;
  int v240;
  int v241;
  uint64_t v243;
  uint64_t v244;
  int v245;
  int v246;
  uint64_t v247;
  BOOL v248;
  uint64_t v249;
  _QWORD *v250;
  char *v251;
  unsigned int v252;
  unsigned int v253;
  size_t v254;
  char *v255;
  uint64_t v256;
  _BOOL4 v257;
  int v258;
  unsigned int (*v259)(uint64_t, _QWORD *, _QWORD);
  int v260;
  int v261;
  unint64_t v262;
  uint64_t v263;
  uint64_t v264;
  unsigned int v265;
  uint64_t v266;
  int v267;
  int v268;
  unsigned int (*v269)(uint64_t, _QWORD *, _QWORD);
  unsigned int (*v270)(uint64_t, _QWORD *, uint64_t, _QWORD);
  uint64_t v271;
  uint64_t v272;
  int v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  unsigned int (*v277)(uint64_t, _QWORD *, _QWORD);
  unsigned int (*v278)(uint64_t, _QWORD *, _QWORD);
  int v279;
  char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  _DWORD *v284;
  unsigned int v285;
  unint64_t v286;
  uint64_t v287;
  int v288;
  uint64_t v289;
  int v290;
  unint64_t v291;
  unint64_t v292;
  unsigned int (*v293)(uint64_t, _QWORD *, _QWORD);
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  unint64_t v298;
  unint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  int v303;
  uint64_t v304;
  uint64_t v305;
  int v306;
  uint64_t (*v307)(uint64_t, _QWORD, _QWORD, char *, uint64_t, _QWORD);
  int v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  int *v318;
  int v319;
  uint64_t v320;
  unint64_t v321;
  uint64_t v322;
  uint64_t v323;
  int v324;
  uint64_t v325;
  uint64_t v326;
  int v327;
  int v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  unsigned int (*v332)(uint64_t, _QWORD *, _QWORD);
  int v333;
  char v334;
  uint64_t v335;
  uint64_t v336;
  int v337;
  int v338;
  int v339;
  char *v340;
  int v342;
  uint64_t v343;
  const char *v344;
  const char *v345;
  uint64_t v346;
  int v347;
  int v348;
  size_t v349;
  size_t v350;
  size_t v351;
  _BOOL4 v352;
  unint64_t v353;
  uint64_t v354;
  char *v355;
  _DWORD *v356;
  int *v357;
  uint64_t *v358;
  char *v359;
  char *v360;
  _OWORD *v361;
  uint64_t v362;
  _QWORD *v363;
  int v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  int v370;
  unsigned int v371;
  unsigned int v372;

  v4 = a3;
  v5 = a2;
  if (!a2)
  {
    if (a3)
      __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 5899, "inlen == 0");
    v5 = (char *)&unk_1DF25CC44;
  }
  nghttp2_session_adjust_idle_stream(a1);
  if (updated <= -901)
    return updated;
  if ((*(_BYTE *)(a1 + 2933) & 2) != 0)
    return v4;
  v8 = *(_QWORD *)(a1 + 16) != *(_QWORD *)(a1 + 2736) + *(_QWORD *)(a1 + 2728) || (*(_BYTE *)(a1 + 2933) & 0xC) == 0;
  if (!v8)
    return v4;
  v363 = (_QWORD *)(a1 + 728);
  v9 = &v5[v4];
  v365 = 0;
  v366 = 0;
  v356 = (_DWORD *)(a1 + 2832);
  v357 = (int *)(a1 + 2836);
  v358 = (uint64_t *)(a1 + 920);
  v361 = (_OWORD *)(a1 + 872);
  v354 = a1 + 792;
  v355 = v5;
LABEL_12:
  while (2)
  {
    v10 = *(_DWORD *)(a1 + 952);
    switch(v10)
    {
      case 0:
        v86 = *(_QWORD *)(a1 + 936);
        if (v4 >= v86)
          v87 = *(_QWORD *)(a1 + 936);
        else
          v87 = v4;
        if (memcmp(&aPriHttp20Sm[-v86 + 24], v5, v87))
          return -903;
        *(_QWORD *)(a1 + 936) = v86 - v87;
        v5 += v87;
        if (v86 <= v4)
        {
          session_inbound_frame_reset(a1);
          *(_DWORD *)(a1 + 952) = 1;
        }
        goto LABEL_745;
      case 1:
        v81 = *(char **)(a1 + 864);
        v82 = *(char **)(a1 + 856);
        if (v9 - v5 >= (unint64_t)(v81 - v82))
          v83 = v81 - v82;
        else
          v83 = v9 - v5;
        if (v83)
        {
          memcpy(*(void **)(a1 + 856), v5, v83);
          v82 += v83;
          v81 = *(char **)(a1 + 864);
        }
        *(_QWORD *)(a1 + 856) = v82;
        v5 += v83;
        if (v81 != v82)
          return v5 - v355;
        v84 = *(_QWORD *)(a1 + 848);
        if (*(_BYTE *)(v84 + 3) != 4 || (*(_BYTE *)(v84 + 4) & 1) != 0)
        {
          updated = session_call_error_callback(a1, 4294966760, "Remote peer returned unexpected data while we expected SETTINGS frame.  Perhaps, peer does not support HTTP/2 properly.");
          if (updated > -901)
          {
            v339 = *(_DWORD *)(a1 + 2812);
            v340 = "SETTINGS expected";
            goto LABEL_812;
          }
          return updated;
        }
        *(_DWORD *)(a1 + 952) = 2;
        v85 = v81;
LABEL_156:
        if (v9 - v5 >= (unint64_t)(v81 - v85))
          v88 = v81 - v85;
        else
          v88 = v9 - v5;
        if (v88)
        {
          memcpy(v85, v5, v88);
          v85 += v88;
          v81 = *(char **)(a1 + 864);
        }
        *(_QWORD *)(a1 + 856) = v85;
        v5 += v88;
        if (v81 != v85)
          return v5 - v355;
        v89 = *(_QWORD *)(a1 + 848);
        v90 = bswap32(*(_DWORD *)v89);
        v91 = v90 >> 8;
        *(_QWORD *)(a1 + 728) = v91;
        v92 = *(unsigned __int8 *)(v89 + 3);
        *(_BYTE *)(a1 + 740) = v92;
        v93 = *(unsigned __int8 *)(v89 + 4);
        *(_BYTE *)(a1 + 741) = v93;
        v94 = *(_DWORD *)(v89 + 5) & 0xFFFFFF7F;
        v95 = bswap32(v94);
        *(_DWORD *)(a1 + 736) = v95;
        *(_BYTE *)(a1 + 742) = 0;
        *(_QWORD *)(a1 + 936) = v91;
        if (v91 > *(_DWORD *)(a1 + 2900))
        {
          v339 = *(_DWORD *)(a1 + 2812);
          v340 = "too large frame size";
          v336 = a1;
          v337 = 6;
          goto LABEL_813;
        }
        switch((int)v92)
        {
          case 0:
            *(_BYTE *)(a1 + 741) = v93 & 9;
            if (v94)
            {
              v257 = *(_BYTE *)(a1 + 2932) == 0;
              if ((v95 & 1) == v257)
                v258 = *(_DWORD *)(a1 + 2804);
              else
                v258 = *(_DWORD *)(a1 + 2808);
              if (v258 >= v95)
              {
                v287 = nghttp2_map_find((uint64_t *)a1, v95);
                if (!v287 || (*(_BYTE *)(v287 + 216) & 2) != 0 || (v288 = *(_DWORD *)(v287 + 204), v288 == 5))
                {
                  v289 = nghttp2_map_find((uint64_t *)a1, v95);
                  if (!v289 || (*(_BYTE *)(v289 + 217) & 1) == 0)
                  {
LABEL_619:
                    v290 = -104;
                    goto LABEL_739;
                  }
                  v279 = 5;
                  v280 = "DATA: stream closed";
                }
                else if ((*(_BYTE *)(v287 + 217) & 1) != 0)
                {
                  v279 = 5;
                  v280 = "DATA: stream in half-closed(remote)";
                }
                else if (((v95 ^ v257) & 1) != 0)
                {
                  if (v288 == 3)
                    goto LABEL_619;
                  if (v288 != 4)
                    goto LABEL_761;
                  v279 = 1;
                  v280 = "DATA: stream in reserved";
                }
                else
                {
                  if (v288 == 3)
                    goto LABEL_619;
                  if (v288 == 2)
                  {
LABEL_761:
                    v290 = 0;
                    goto LABEL_739;
                  }
                  v279 = 1;
                  v280 = "DATA: stream not opened";
                }
              }
              else
              {
                v279 = 1;
                v280 = "DATA: stream in idle";
              }
            }
            else
            {
              v279 = 1;
              v280 = "DATA: stream_id == 0";
            }
            v324 = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), v279, v280);
            if (v324 <= -901)
              v290 = v324;
            else
              v290 = -104;
LABEL_739:
            if (*(_DWORD *)(a1 + 952) == 15)
              return v4;
            if (v290 == -104)
            {
LABEL_741:
              v273 = 14;
              goto LABEL_742;
            }
            if (v290 <= -901)
              return v290;
            if ((*(_BYTE *)(a1 + 741) & 8) != 0)
            {
              if (!*v363)
              {
                v339 = *(_DWORD *)(a1 + 2812);
                v340 = "DATA: insufficient padding space";
                goto LABEL_812;
              }
              v325 = *(_QWORD *)(a1 + 832);
              *(_QWORD *)(a1 + 856) = v325;
              *(_QWORD *)(a1 + 848) = v325;
              *(_QWORD *)(a1 + 864) = v325 + 1;
              v96 = 1;
              v267 = 12;
            }
            else
            {
              v96 = 1;
              v267 = 13;
            }
            goto LABEL_583;
          case 1:
            *(_BYTE *)(a1 + 741) = v93 & 0x2D;
            if ((v93 & 8) != 0)
            {
              if (v90 <= 0xFF)
              {
                v339 = *(_DWORD *)(a1 + 2812);
                v340 = "HEADERS: insufficient padding space";
                goto LABEL_812;
              }
              goto LABEL_582;
            }
            if ((v93 & 0x20) == 0)
            {
              v259 = *(unsigned int (**)(uint64_t, _QWORD *, _QWORD))(a1 + 2504);
              if (v259 && v259(a1, v363, *(_QWORD *)(a1 + 2608)))
                return -902;
              goto LABEL_510;
            }
            if (v91 < 5)
              goto LABEL_734;
            v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            v294 = *(_QWORD *)(a1 + 832);
            *(_QWORD *)(a1 + 856) = v294;
            *(_QWORD *)(a1 + 848) = v294;
            v98 = v294 + 5;
            goto LABEL_531;
          case 2:
            *(_BYTE *)(a1 + 741) = 0;
            if ((_DWORD)v91 != 5)
              goto LABEL_734;
            v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            v256 = *(_QWORD *)(a1 + 832);
            *(_QWORD *)(a1 + 856) = v256;
            *(_QWORD *)(a1 + 848) = v256;
            v98 = v256 + 5;
            goto LABEL_531;
          case 3:
          case 8:
            *(_BYTE *)(a1 + 741) = 0;
            if ((_DWORD)v91 == 4)
              goto LABEL_165;
            goto LABEL_734;
          case 4:
            v261 = v93 & 1;
            *(_BYTE *)(a1 + 741) = v93 & 1;
            v262 = ((v90 >> 8) * (unsigned __int128)0x2AAAAAAAAAAAAAABuLL) >> 64;
            if (-6 * v262 + v91)
              goto LABEL_734;
            if (v261)
            {
              if (v90 >= 0x100)
                goto LABEL_734;
              *(_DWORD *)(a1 + 952) = 8;
LABEL_632:
              v295 = *(_QWORD *)(a1 + 832);
              *(_QWORD *)(a1 + 864) = v295;
              *(_QWORD *)(a1 + 856) = v295;
              *(_QWORD *)(a1 + 848) = v295;
              goto LABEL_633;
            }
            if (*(_QWORD *)(a1 + 2752) >= *(_QWORD *)(a1 + 2760))
              return -904;
            *(_DWORD *)(a1 + 952) = 8;
            if (v90 < 0x100)
              goto LABEL_632;
            *(_QWORD *)(a1 + 928) = v262 + 1;
            if (v262 > *(_QWORD *)(a1 + 2776))
            {
              v339 = *(_DWORD *)(a1 + 2812);
              v340 = "SETTINGS: too many setting entries";
              v336 = a1;
              v337 = 11;
              goto LABEL_813;
            }
            v263 = (*(uint64_t (**)(unint64_t, _QWORD))(a1 + 2576))(8 * (v262 + 1), *(_QWORD *)(a1 + 2568));
            *(_QWORD *)(a1 + 824) = v263;
            if (!v263)
              return -901;
            v96 = 0;
            *(_QWORD *)(v263 + 8 * *(_QWORD *)(a1 + 928) - 8) = 0xFFFFFFFF00000001;
            v264 = *(_QWORD *)(a1 + 832);
            *(_QWORD *)(a1 + 856) = v264;
            *(_QWORD *)(a1 + 848) = v264;
            *(_QWORD *)(a1 + 864) = v264 + 6;
            v265 = *(_DWORD *)(a1 + 952);
            if (v265 > 0xF || ((1 << v265) & 0xC0E0) == 0)
              goto LABEL_584;
            goto LABEL_744;
          case 5:
            *(_BYTE *)(a1 + 741) = v93 & 0xC;
            if ((v93 & 8) != 0)
            {
              if (v90 <= 0xFF)
              {
                v339 = *(_DWORD *)(a1 + 2812);
                v340 = "PUSH_PROMISE: insufficient padding space";
                goto LABEL_812;
              }
LABEL_582:
              v96 = 0;
              v276 = *(_QWORD *)(a1 + 832);
              *(_QWORD *)(a1 + 856) = v276;
              *(_QWORD *)(a1 + 848) = v276;
              *(_QWORD *)(a1 + 864) = v276 + 1;
              v267 = 3;
              goto LABEL_583;
            }
            if (v90 <= 0x3FF)
              goto LABEL_734;
LABEL_165:
            v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            v97 = *(_QWORD *)(a1 + 832);
            *(_QWORD *)(a1 + 856) = v97;
            *(_QWORD *)(a1 + 848) = v97;
            v98 = v97 + 4;
LABEL_531:
            *(_QWORD *)(a1 + 864) = v98;
            goto LABEL_584;
          case 6:
            *(_BYTE *)(a1 + 741) = v93 & 1;
            if ((_DWORD)v91 != 8)
              goto LABEL_734;
            goto LABEL_530;
          case 7:
            *(_BYTE *)(a1 + 741) = 0;
            if (v90 <= 0x7FF)
              goto LABEL_734;
LABEL_530:
            v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            v266 = *(_QWORD *)(a1 + 832);
            *(_QWORD *)(a1 + 856) = v266;
            *(_QWORD *)(a1 + 848) = v266;
            v98 = v266 + 8;
            goto LABEL_531;
          case 9:
            v339 = *(_DWORD *)(a1 + 2812);
            v340 = "CONTINUATION: unexpected";
            goto LABEL_812;
          default:
            if (((*(unsigned __int8 *)(a1 + 2935 + (v92 >> 3)) >> (v92 & 7)) & 1) != 0)
            {
              if (!*(_QWORD *)(a1 + 2536))
                goto LABEL_647;
              v96 = 1;
              v267 = 18;
              goto LABEL_583;
            }
            switch((_DWORD)v92)
            {
              case 0x10:
                if ((*(_BYTE *)(a1 + 2924) & 4) == 0)
                  goto LABEL_647;
                *(_BYTE *)(a1 + 741) = 0;
                *(_QWORD *)(a1 + 744) = v354;
                if (!*(_BYTE *)(a1 + 2932))
                {
                  v339 = *(_DWORD *)(a1 + 2812);
                  v340 = "PRIORITY_UPDATE is received from server";
LABEL_812:
                  v336 = a1;
                  v337 = 1;
LABEL_813:
                  v338 = session_terminate_session(v336, v339, v337, v340);
                  if (v338 <= -901)
                    return v338;
                  return v4;
                }
                if (v90 <= 0x3FF)
                {
LABEL_734:
                  v273 = 7;
                  goto LABEL_742;
                }
                if (*(_BYTE *)(a1 + 2930) == 1 && v91 <= 0x20 && !*(_BYTE *)(a1 + 2931))
                {
                  *(_DWORD *)(a1 + 952) = 3;
                  v323 = *(_QWORD *)(a1 + 832);
                  *(_QWORD *)(a1 + 856) = v323;
                  *(_QWORD *)(a1 + 848) = v323;
                  v282 = v323 + v91;
LABEL_719:
                  *(_QWORD *)(a1 + 864) = v282;
LABEL_633:
                  v96 = 1;
LABEL_584:
                  v277 = *(unsigned int (**)(uint64_t, _QWORD *, _QWORD))(a1 + 2504);
                  if (v277 && v277(a1, v363, *(_QWORD *)(a1 + 2608)))
                    return -902;
                  goto LABEL_744;
                }
                break;
              case 0xC:
                if ((*(_BYTE *)(a1 + 2924) & 2) != 0)
                {
                  *(_QWORD *)(a1 + 744) = v354;
                  if (!*(_BYTE *)(a1 + 2932) && !v94 && v93 < 0x10)
                  {
                    *(_BYTE *)(a1 + 741) = 0;
                    if (v90 >= 0x100)
                    {
                      v329 = (*(uint64_t (**)(void))(a1 + 2576))();
                      *(_QWORD *)(a1 + 912) = v329;
                      if (!v329)
                        return -901;
                      v330 = *(_QWORD *)(a1 + 936);
                      *(_QWORD *)(a1 + 880) = v329;
                      *(_QWORD *)(a1 + 904) = v329;
                      *(_QWORD *)(a1 + 896) = v329;
                      *(_QWORD *)(a1 + 888) = v329;
                      *(_QWORD *)(a1 + 872) = v329;
                      v96 = 0;
                      if (v330)
                        *(_QWORD *)(a1 + 880) = v329 + v330;
                    }
                    else
                    {
                      v96 = 1;
                    }
                    v267 = 17;
LABEL_583:
                    *(_DWORD *)(a1 + 952) = v267;
                    goto LABEL_584;
                  }
                }
                break;
              case 0xA:
                if ((*(_BYTE *)(a1 + 2924) & 1) == 0)
                  goto LABEL_647;
                *(_BYTE *)(a1 + 741) = 0;
                *(_QWORD *)(a1 + 744) = v354;
                if (*(_BYTE *)(a1 + 2932))
                  goto LABEL_647;
                if (v90 <= 0x1FF)
                  goto LABEL_734;
                *(_DWORD *)(a1 + 952) = 3;
                v281 = *(_QWORD *)(a1 + 832);
                *(_QWORD *)(a1 + 856) = v281;
                *(_QWORD *)(a1 + 848) = v281;
                v282 = v281 + 2;
                goto LABEL_719;
              default:
                goto LABEL_647;
            }
            break;
        }
        goto LABEL_647;
      case 2:
        v81 = *(char **)(a1 + 864);
        v85 = *(char **)(a1 + 856);
        goto LABEL_156;
      case 3:
        v99 = *(_QWORD *)(a1 + 864);
        v100 = *(_QWORD *)(a1 + 856);
        if (v9 - v5 >= (unint64_t)(v99 - v100))
          v101 = v99 - v100;
        else
          v101 = v9 - v5;
        if (v101)
        {
          memcpy(*(void **)(a1 + 856), v5, v101);
          v100 += v101;
          v99 = *(_QWORD *)(a1 + 864);
        }
        *(_QWORD *)(a1 + 856) = v100;
        v5 += v101;
        v102 = *(_QWORD *)(a1 + 936) - v101;
        *(_QWORD *)(a1 + 936) = v102;
        if (v99 != v100)
          return v5 - v355;
        switch(*(_BYTE *)(a1 + 740))
        {
          case 1:
            if (*(_QWORD *)(a1 + 944))
              goto LABEL_510;
            v103 = *(_BYTE *)(a1 + 741);
            if ((v103 & 8) == 0)
              goto LABEL_510;
            v104 = 5;
            if ((*(_BYTE *)(a1 + 741) & 0x20) == 0)
              v104 = 0;
            v105 = **(unsigned __int8 **)(a1 + 848);
            if (v102 < v105 || (v106 = v105 + 1, *(_QWORD *)(a1 + 944) = v106, v106 + v104 > v102 + 1))
            {
              v339 = *(_DWORD *)(a1 + 2812);
              v340 = "HEADERS: invalid padding";
              goto LABEL_812;
            }
            *(_QWORD *)(a1 + 744) = v106;
            if ((v103 & 0x20) == 0)
            {
              v107 = *(_QWORD *)(a1 + 832);
              *(_QWORD *)(a1 + 864) = v107;
              *(_QWORD *)(a1 + 856) = v107;
              *(_QWORD *)(a1 + 848) = v107;
LABEL_510:
              updated = session_process_headers_frame(a1);
              if (updated <= -901)
                return updated;
              if (*(_DWORD *)(a1 + 952) == 15)
                return v4;
              if (updated == -103)
                goto LABEL_575;
              if (updated == -521)
              {
                v260 = *(_DWORD *)(a1 + 736);
LABEL_574:
                updated = nghttp2_session_add_rst_stream(a1, v260, 2);
                if (updated <= -901)
                  return updated;
LABEL_575:
                *(_DWORD *)(a1 + 952) = 5;
                goto LABEL_743;
              }
LABEL_607:
              v273 = 4;
              goto LABEL_742;
            }
            if (v102 < v104)
              goto LABEL_734;
            *(_DWORD *)(a1 + 952) = 3;
            v326 = *(_QWORD *)(a1 + 832);
            *(_QWORD *)(a1 + 856) = v326;
            *(_QWORD *)(a1 + 848) = v326;
            v312 = v326 + v104;
            break;
          case 2:
            if (*(_BYTE *)(a1 + 2930) == 1 && !*(_BYTE *)(a1 + 2931) || *(_DWORD *)(a1 + 2880) == 1)
              goto LABEL_706;
            session_process_priority_frame(a1);
            goto LABEL_704;
          case 3:
            session_process_rst_stream_frame(a1);
            goto LABEL_704;
          case 5:
            if (!*(_QWORD *)(a1 + 944) && (*(_BYTE *)(a1 + 741) & 8) != 0)
            {
              v321 = **(unsigned __int8 **)(a1 + 848);
              if (v102 < v321 || (*(_QWORD *)(a1 + 944) = v321 + 1, v321 + 5 > v102 + 1))
              {
                v339 = *(_DWORD *)(a1 + 2812);
                v340 = "PUSH_PROMISE: invalid padding";
                goto LABEL_812;
              }
              *(_QWORD *)(a1 + 744) = v321 + 1;
              if (v102 > 3)
              {
                *(_DWORD *)(a1 + 952) = 3;
                v322 = *(_QWORD *)(a1 + 832);
                *(_QWORD *)(a1 + 856) = v322;
                *(_QWORD *)(a1 + 848) = v322;
                v312 = v322 + 4;
                goto LABEL_693;
              }
              goto LABEL_734;
            }
            updated = session_process_push_promise_frame(a1);
            if (updated <= -901)
              return updated;
            if (*(_DWORD *)(a1 + 952) == 15)
              return v4;
            if (updated == -103)
              goto LABEL_575;
            if (updated != -521)
              goto LABEL_607;
            v260 = *(_DWORD *)(a1 + 768);
            goto LABEL_574;
          case 6:
            updated = session_process_ping_frame(a1);
            goto LABEL_704;
          case 7:
            v271 = *v363 - 8;
            if (*v363 == 8)
              goto LABEL_559;
            v272 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(*v363 - 8, *(_QWORD *)(a1 + 2568));
            *(_QWORD *)(a1 + 912) = v272;
            if (!v272)
              return -901;
            *(_QWORD *)(a1 + 904) = v272;
            *(_QWORD *)(a1 + 896) = v272;
            *(_QWORD *)(a1 + 888) = v272;
            *(_QWORD *)(a1 + 872) = v272;
            *(_QWORD *)(a1 + 880) = v272 + v271;
LABEL_559:
            v273 = 9;
            goto LABEL_742;
          case 8:
            updated = session_process_window_update_frame(a1);
            goto LABEL_704;
          case 0xA:
            if (v102 < bswap32(**(unsigned __int16 **)(a1 + 848)) >> 16)
              goto LABEL_734;
            if (*v363 < 3uLL)
              goto LABEL_566;
            v274 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2576))(*v363 - 2, *(_QWORD *)(a1 + 2568));
            *(_QWORD *)(a1 + 912) = v274;
            if (!v274)
              return -901;
            v275 = *(_QWORD *)(a1 + 728);
            *(_QWORD *)(a1 + 880) = v274;
            *(_QWORD *)(a1 + 904) = v274;
            *(_QWORD *)(a1 + 896) = v274;
            *(_QWORD *)(a1 + 888) = v274;
            *(_QWORD *)(a1 + 872) = v274;
            if (v275)
              *(_QWORD *)(a1 + 880) = v274 + v275;
LABEL_566:
            v273 = 16;
            goto LABEL_742;
          case 0x10:
            updated = session_process_priority_update_frame(a1);
            if (updated <= -901)
              return updated;
            goto LABEL_706;
          default:
            goto LABEL_706;
        }
        goto LABEL_693;
      case 4:
      case 5:
        v11 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v11)
          v12 = *(_QWORD *)(a1 + 936);
        else
          v12 = v9 - v5;
        v13 = v11 - v12;
        v14 = *(_QWORD *)(a1 + 944);
        v15 = *(unsigned __int8 *)(a1 + 741);
        if (v14)
          v16 = v14 - ((v15 >> 3) & 1);
        else
          v16 = 0;
        v17 = v11 - v16;
        if (v12 < v16 - v13)
          v17 = -1;
        if (v16 <= v13)
          v17 = v12;
        if (v17 == -1)
          v18 = 0;
        else
          v18 = v17;
        v19 = (v11 - v18 == v16) & (v15 >> 2);
        v364 = v19;
        if (v18)
          v19 = 0;
        if (v18 <= 0 && v19 == 0)
        {
          v5 += v12;
          *(_QWORD *)(a1 + 936) = v13;
          if (v13)
            goto LABEL_745;
LABEL_189:
          v113 = *(_BYTE *)(a1 + 741);
          if ((v113 & 4) == 0)
          {
            v114 = *(_QWORD *)(a1 + 832);
            *(_QWORD *)(a1 + 856) = v114;
            *(_QWORD *)(a1 + 848) = v114;
            *(_QWORD *)(a1 + 864) = v114 + 9;
            *(_QWORD *)(a1 + 944) = 0;
            if (v10 == 4)
              v115 = 10;
            else
              v115 = 11;
            *(_DWORD *)(a1 + 952) = v115;
            goto LABEL_745;
          }
          if (v10 != 4)
            goto LABEL_791;
          v243 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
          if (!v243)
            goto LABEL_791;
          v244 = v243;
          if ((*(_BYTE *)(v243 + 216) & 2) != 0)
            goto LABEL_791;
          v245 = *(_DWORD *)(v243 + 204);
          if (v245 == 3 || v245 == 5)
            goto LABEL_791;
          if ((*(_BYTE *)(a1 + 2916) & 4) != 0)
            goto LABEL_779;
          v246 = *(unsigned __int8 *)(a1 + 740);
          if (v246 == 5)
          {
            v247 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 768));
            if (!v247
              || (*(_BYTE *)(v247 + 216) & 2) != 0
              || *(_DWORD *)(v247 + 204) == 5
              || !nghttp2_http_on_request_headers(v247, (uint64_t)v363))
            {
              goto LABEL_779;
            }
LABEL_772:
            v331 = 736;
            if (*(_BYTE *)(a1 + 740) == 5)
              v331 = 768;
            updated = session_handle_invalid_stream2(a1, *(_DWORD *)(a1 + v331), (uint64_t)v363, 4294966764);
            if (updated < -900)
              return updated;
            if (*(_BYTE *)(a1 + 740) == 1 && (*(_BYTE *)(a1 + 741) & 1) != 0)
              *(_BYTE *)(v244 + 217) |= 1u;
            goto LABEL_791;
          }
          if (v246 != 1)
            __assert_rtn("session_after_header_block_received", "nghttp2_session.c", 4146, "frame->hd.type == NGHTTP2_HEADERS");
          v327 = *(_DWORD *)(a1 + 784);
          if ((v327 - 1) >= 2)
          {
            if (v327 != 3)
            {
              if (v327)
                __assert_rtn("session_after_header_block_received", "nghttp2_session.c", 4164, "0");
              v328 = nghttp2_http_on_request_headers(v243, (uint64_t)v363);
              goto LABEL_771;
            }
            if ((*(_BYTE *)(v243 + 213) & 0x40) == 0)
            {
              v328 = (v113 & 1) - 1;
              goto LABEL_771;
            }
            if (*(_BYTE *)(a1 + 2932))
              __assert_rtn("session_after_header_block_received", "nghttp2_session.c", 4157, "!session->server");
          }
          v328 = nghttp2_http_on_response_headers(v243);
LABEL_771:
          if (v328)
            goto LABEL_772;
          if ((*(_BYTE *)(a1 + 741) & 1) != 0)
          {
            if ((*(_BYTE *)(v244 + 213) & 0x40) != 0)
              goto LABEL_772;
            v335 = *(_QWORD *)(v244 + 48);
            if (v335 != -1 && v335 != *(_QWORD *)(v244 + 56))
              goto LABEL_772;
          }
LABEL_779:
          v332 = *(unsigned int (**)(uint64_t, _QWORD *, _QWORD))(a1 + 2376);
          if (v332 && v332(a1, v363, *(_QWORD *)(a1 + 2608)))
            return -902;
          if (*(_BYTE *)(a1 + 740) == 1)
          {
            if (*(_BYTE *)(a1 + 2932))
            {
              if ((*(_BYTE *)(a1 + 2916) & 4) == 0
                && !*(_DWORD *)(a1 + 784)
                && (*(_BYTE *)(v244 + 216) & 0x30) == 0x10
                && (*(_BYTE *)(v244 + 214) & 1) != 0)
              {
                v333 = session_update_stream_priority(a1, v244, *(unsigned __int8 *)(v244 + 221));
                if (v333)
                {
                  if (v333 >= -900)
                    __assert_rtn("session_end_stream_headers_received", "nghttp2_session.c", 4106, "nghttp2_is_fatal(rv)");
                  return -901;
                }
              }
            }
            if ((*(_BYTE *)(a1 + 741) & 1) != 0)
            {
              v334 = *(_BYTE *)(v244 + 217);
              *(_BYTE *)(v244 + 217) = v334 | 1;
              if ((v334 & 2) != 0)
              {
                nghttp2_session_close_stream(a1, *(unsigned int *)(v244 + 168), 0);
                if (updated <= -901)
                  return updated;
              }
            }
          }
LABEL_791:
          session_inbound_frame_reset(a1);
          *(_QWORD *)(a1 + 2792) = 0;
          goto LABEL_745;
        }
        v21 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
        v22 = a1 + 2104;
        if (!v21 || (*(_BYTE *)(v21 + 216) & 2) != 0)
        {
          v23 = 0;
        }
        else if (*(_DWORD *)(v21 + 204) == 5)
        {
          v23 = 0;
        }
        else
        {
          v23 = v21;
        }
        v116 = *(unsigned __int8 *)(a1 + 740);
        v359 = v9;
        v353 = v12;
        if (v116 == 5)
        {
          v117 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 768));
          if (!v117 || (*(_BYTE *)(v117 + 216) & 2) != 0)
          {
            v362 = 0;
            v352 = 0;
          }
          else
          {
            v352 = 0;
            if (*(_DWORD *)(v117 + 204) == 5)
              v118 = 0;
            else
              v118 = v117;
            v362 = v118;
          }
        }
        else
        {
          v119 = 0;
          if (v23 && v116 == 1)
          {
            v120 = *(_DWORD *)(a1 + 784);
            v121 = *(_BYTE *)(a1 + 2932) && v120 == 3;
            v119 = v121;
            if (!*(_BYTE *)(a1 + 2932) && v120 == 3)
              v119 = (*(_BYTE *)(v23 + 213) & 0x40) == 0;
          }
          v352 = v119;
          v362 = v23;
        }
        v147 = 0;
        v367 = 0;
        v368 = 0;
        v148 = (unsigned __int8 *)v5;
        v369 = 0;
        break;
      case 6:
        v46 = v9 - v5;
        v47 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v47)
          v48 = *(_QWORD *)(a1 + 936);
        else
          v48 = v9 - v5;
        *(_QWORD *)(a1 + 936) = v47 - v48;
        v5 += v48;
        if (v47 > v46)
          goto LABEL_745;
        v49 = *(unsigned __int8 *)(a1 + 740);
        if (v49 <= 9 && ((1 << v49) & 0x222) != 0)
          *(_BYTE *)(a1 + 2164) = 1;
        goto LABEL_706;
      case 7:
        updated = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 6, 0);
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) != 15)
          __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 6898, "iframe->state == NGHTTP2_IB_IGN_ALL");
        return v4;
      case 8:
        v68 = *(_QWORD *)(a1 + 864);
        v69 = *(_QWORD *)(a1 + 856);
        if (v9 - v5 >= (unint64_t)(v68 - v69))
          v70 = v68 - v69;
        else
          v70 = v9 - v5;
        if (v70)
        {
          memcpy(*(void **)(a1 + 856), v5, v70);
          v71 = *(_QWORD *)(a1 + 864);
          *(_QWORD *)(a1 + 856) = v69 + v70;
          *(_QWORD *)(a1 + 936) -= v70;
          v5 += v70;
          if (v71 != v69 + v70)
            goto LABEL_745;
          v72 = *(unsigned __int16 **)(a1 + 848);
          v73 = *v72;
          v74 = __rev16(v73);
          v75 = bswap32(*(_DWORD *)(v72 + 1));
          if ((v74 - 1) >= 6 && (v74 - 8) >= 2)
          {
            v309 = *(_QWORD *)(a1 + 824);
            v310 = *(_QWORD *)(a1 + 920);
            *(_QWORD *)(a1 + 920) = v310 + 1;
            *(_QWORD *)(v309 + 8 * v310) = v74 | (v75 << 32);
          }
          else
          {
            v76 = *(_QWORD *)(a1 + 920);
            v77 = *(_QWORD *)(a1 + 824);
            v78 = 0;
            if (!v76)
              goto LABEL_603;
            v79 = *(int **)(a1 + 824);
            while (1)
            {
              v80 = *v79;
              v79 += 2;
              if (v80 == (_DWORD)v74)
                break;
              if (v76 == ++v78)
              {
                v78 = *(_QWORD *)(a1 + 920);
                goto LABEL_603;
              }
            }
            *(_QWORD *)(v77 + 8 * v78) = v74 | (v75 << 32);
            if (v78 == *v358)
            {
              v77 = *(_QWORD *)(a1 + 824);
LABEL_603:
              *v358 = v78 + 1;
              *(_QWORD *)(v77 + 8 * v78) = v74 | (v75 << 32);
            }
            if (v73 == 256)
            {
              v283 = *(_QWORD *)(a1 + 824) + 8 * *(_QWORD *)(a1 + 928);
              v285 = *(_DWORD *)(v283 - 4);
              v284 = (_DWORD *)(v283 - 4);
              if (v75 < v285)
                *v284 = v75;
            }
          }
          v138 = *(_QWORD *)(a1 + 936);
          goto LABEL_691;
        }
        *(_QWORD *)(a1 + 856) = v69;
        v138 = *(_QWORD *)(a1 + 936);
        *(_QWORD *)(a1 + 936) = v138;
        if (v68 != v69)
          goto LABEL_745;
LABEL_691:
        if (v138)
        {
          v311 = *(_QWORD *)(a1 + 832);
          *(_QWORD *)(a1 + 856) = v311;
          *(_QWORD *)(a1 + 848) = v311;
          v312 = v311 + 6;
LABEL_693:
          *(_QWORD *)(a1 + 864) = v312;
          goto LABEL_745;
        }
        v313 = *(_QWORD *)(a1 + 928);
        v314 = *(_QWORD *)(a1 + 824);
        if (v313)
        {
          v315 = *(_QWORD *)(v314 + 8 * v313 - 8);
          if (HIDWORD(v315) != -1)
          {
            v316 = *v358;
            if (!*v358)
LABEL_835:
              __assert_rtn("session_process_settings_frame", "nghttp2_session.c", 5015, "i < iframe->niv");
            v317 = 0;
            v318 = *(int **)(a1 + 824);
            while (1)
            {
              v319 = *v318;
              v318 += 2;
              if (v319 == 1)
                break;
              if (v316 == ++v317)
                goto LABEL_835;
            }
            if (HIDWORD(v315) != *(_DWORD *)(v314 + 8 * v317 + 4))
            {
              *(_QWORD *)(a1 + 920) = v316 + 1;
              *(_QWORD *)(v314 + 8 * v316) = *(_QWORD *)(v314 + 8 * v317);
              v314 = *(_QWORD *)(a1 + 824);
              *(_QWORD *)(v314 + 8 * v317) = v315;
            }
          }
        }
        v320 = *(_QWORD *)(a1 + 920);
        *(_QWORD *)(a1 + 752) = v314;
        *(_QWORD *)(a1 + 744) = v320;
        *(_QWORD *)(a1 + 824) = 0;
        *v358 = 0;
        *(_QWORD *)(a1 + 928) = 0;
        updated = nghttp2_session_on_settings_received(a1, (uint64_t)v363, 0);
LABEL_704:
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
        goto LABEL_706;
      case 9:
        v62 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v62)
          v63 = *(_QWORD *)(a1 + 936);
        else
          v63 = v9 - v5;
        if (v63)
        {
          v64 = *(char **)(a1 + 896);
          memcpy(v64, v5, v63);
          *(_QWORD *)(a1 + 896) = &v64[v63];
          v62 = *(_QWORD *)(a1 + 936) - v63;
          *(_QWORD *)(a1 + 936) = v62;
          v5 += v63;
        }
        if (v62)
        {
          if (*(_QWORD *)(a1 + 880) == *(_QWORD *)(a1 + 896))
            __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 6952, "nghttp2_buf_avail(&iframe->lbuf) > 0");
          goto LABEL_745;
        }
        v122 = *(_DWORD **)(a1 + 848);
        v123 = *(_QWORD *)(a1 + 888);
        v124 = *(_QWORD *)(a1 + 896) - v123;
        *(_DWORD *)(a1 + 744) = bswap32(*v122 & 0xFFFFFF7F);
        *(_DWORD *)(a1 + 748) = bswap32(v122[1]);
        *(_QWORD *)(a1 + 752) = v123;
        *(_QWORD *)(a1 + 760) = v124;
        *(_QWORD *)(a1 + 904) = 0;
        *v361 = 0u;
        *(_OWORD *)(a1 + 888) = 0u;
        if (*(_DWORD *)(a1 + 736))
        {
          v125 = a1;
          v126 = a1 + 728;
          v127 = "GOAWAY: stream_id != 0";
LABEL_540:
          updated = session_handle_invalid_connection(v125, v126, 4294966791, v127);
          goto LABEL_704;
        }
        v268 = *(_DWORD *)(a1 + 744);
        if (v268 >= 1 && ((v268 ^ (*(_BYTE *)(a1 + 2932) == 0)) & 1) != 0 || *(_DWORD *)(a1 + 2824) < v268)
        {
          v125 = a1;
          v126 = a1 + 728;
          v127 = "GOAWAY: invalid last_stream_id";
          goto LABEL_540;
        }
        *(_BYTE *)(a1 + 2933) |= 8u;
        *(_DWORD *)(a1 + 2824) = v268;
        v293 = *(unsigned int (**)(uint64_t, _QWORD *, _QWORD))(a1 + 2376);
        if (v293)
        {
          if (v293(a1, v363, *(_QWORD *)(a1 + 2608)))
            return -902;
          v268 = *(_DWORD *)(a1 + 744);
        }
        session_close_stream_on_goaway(a1, v268, 0);
        goto LABEL_704;
      case 10:
      case 11:
        v24 = *(_QWORD *)(a1 + 2792) + 1;
        *(_QWORD *)(a1 + 2792) = v24;
        if (v24 > *(_QWORD *)(a1 + 2784))
          return -905;
        v25 = *(_QWORD *)(a1 + 864);
        v26 = *(_QWORD *)(a1 + 856);
        if (v9 - v5 >= (unint64_t)(v25 - v26))
          v27 = v25 - v26;
        else
          v27 = v9 - v5;
        if (v27)
        {
          memcpy(*(void **)(a1 + 856), v5, v27);
          v26 += v27;
          v25 = *(_QWORD *)(a1 + 864);
        }
        *(_QWORD *)(a1 + 856) = v26;
        v5 += v27;
        if (v25 != v26)
          return v5 - v355;
        v28 = *(_QWORD *)(a1 + 848);
        v29 = bswap32(*(_DWORD *)v28) >> 8;
        v365 = v29;
        BYTE4(v366) = *(_BYTE *)(v28 + 3);
        v30 = BYTE4(v366);
        v31 = *(_BYTE *)(v28 + 4);
        *(_WORD *)((char *)&v366 + 5) = v31;
        v32 = bswap32(*(_DWORD *)(v28 + 5) & 0xFFFFFF7F);
        LODWORD(v366) = v32;
        *(_QWORD *)(a1 + 936) = v29;
        if (v30 != 9 || v32 != *(_DWORD *)(a1 + 736))
        {
          v339 = *(_DWORD *)(a1 + 2812);
          v340 = "unexpected non-CONTINUATION frame or stream_id is invalid";
          goto LABEL_812;
        }
        *(_BYTE *)(a1 + 741) |= v31 & 4;
        *(_QWORD *)(a1 + 728) += v29;
        if (*(_DWORD *)(a1 + 952) != 10)
          goto LABEL_575;
        *(_DWORD *)(a1 + 952) = 4;
        v33 = *(unsigned int (**)(uint64_t, uint64_t *, _QWORD))(a1 + 2504);
        if (v33 && v33(a1, &v365, *(_QWORD *)(a1 + 2608)))
          return -902;
        goto LABEL_743;
      case 12:
        v57 = *(_QWORD *)(a1 + 864);
        v58 = *(_QWORD *)(a1 + 856);
        if (v9 - v5 >= (unint64_t)(v57 - v58))
          v59 = v57 - v58;
        else
          v59 = v9 - v5;
        if (v59)
        {
          memcpy(*(void **)(a1 + 856), v5, v59);
          v58 += v59;
          v57 = *(_QWORD *)(a1 + 864);
        }
        *(_QWORD *)(a1 + 856) = v58;
        v5 += v59;
        *(_QWORD *)(a1 + 936) -= v59;
        if (v57 != v58)
          return v5 - v355;
        updated = nghttp2_session_update_recv_connection_window_size(a1, v59);
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
        updated = nghttp2_session_consume(a1, *(_DWORD *)(a1 + 736), v59);
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
        v60 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
        if (v60 && (*(_BYTE *)(v60 + 216) & 2) == 0 && *(_DWORD *)(v60 + 204) != 5)
        {
          v61 = *(_QWORD *)(a1 + 936) || (*(_BYTE *)(a1 + 741) & 1) == 0;
          updated = nghttp2_session_update_recv_stream_window_size(a1, v60, v59, v61);
          if (updated <= -901)
            return updated;
        }
        v291 = **(unsigned __int8 **)(a1 + 848);
        if (*(_QWORD *)(a1 + 936) < v291)
        {
          v339 = *(_DWORD *)(a1 + 2812);
          v340 = "DATA: invalid padding";
          goto LABEL_812;
        }
        v292 = v291 + 1;
        *(_QWORD *)(a1 + 944) = v292;
        *(_QWORD *)(a1 + 744) = v292;
        v273 = 13;
        goto LABEL_742;
      case 13:
        v50 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
        if (!v50)
          goto LABEL_741;
        v51 = v50;
        if ((*(_BYTE *)(v50 + 216) & 2) != 0 || *(_DWORD *)(v50 + 204) == 5)
          goto LABEL_741;
        v52 = v3;
        v53 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v53)
          v54 = *(_QWORD *)(a1 + 936);
        else
          v54 = v9 - v5;
        v55 = v53 - v54;
        *(_QWORD *)(a1 + 936) = v53 - v54;
        if (!v54)
          goto LABEL_683;
        updated = nghttp2_session_update_recv_connection_window_size(a1, v54);
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
        if (*(_QWORD *)(a1 + 936))
          v56 = 1;
        else
          v56 = (*(_BYTE *)(a1 + 741) & 1) == 0;
        updated = nghttp2_session_update_recv_stream_window_size(a1, v51, v54, v56);
        if (updated <= -901)
          return updated;
        v298 = *(_QWORD *)(a1 + 944);
        if (v298)
          v298 -= ((unint64_t)*(unsigned __int8 *)(a1 + 741) >> 3) & 1;
        v299 = *(_QWORD *)(a1 + 936);
        v300 = v54 - (v298 - v299);
        if (v54 < v298 - v299)
          v300 = -1;
        if (v298 <= v299)
          v301 = v54;
        else
          v301 = v300;
        if (v301 == -1)
          v302 = 0;
        else
          v302 = v301;
        if ((uint64_t)(v54 - v302) < 1)
          goto LABEL_669;
        updated = nghttp2_session_consume(a1, *(_DWORD *)(a1 + 736), v54 - v302);
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
LABEL_669:
        if (v302 < 1)
          goto LABEL_682;
        v303 = *(_DWORD *)(a1 + 2916);
        if ((v303 & 4) != 0
          || (v304 = *(_QWORD *)(v51 + 56) + v302, *(_QWORD *)(v51 + 56) = v304, (*(_BYTE *)(v51 + 213) & 0x40) == 0)
          && ((v305 = *(_QWORD *)(v51 + 48), v305 == -1) || v304 <= v305))
        {
          v307 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, char *, uint64_t, _QWORD))(a1 + 2392);
          if (v307)
          {
            v308 = v307(a1, *(unsigned __int8 *)(a1 + 741), *(unsigned int *)(a1 + 736), v5, v302, *(_QWORD *)(a1 + 2608));
            if (v308 == -526)
              return &v5[v54] - v355;
            if (v308 < -900)
              return -902;
          }
LABEL_682:
          v55 = *(_QWORD *)(a1 + 936);
LABEL_683:
          if (!v55)
          {
            nghttp2_session_on_data_received(a1, (uint64_t)v363);
            if (updated <= -901)
              return updated;
            session_inbound_frame_reset(a1);
          }
          v306 = 0;
        }
        else
        {
          if ((v303 & 1) != 0)
          {
            updated = session_update_consumed_size(a1, v357, v356, *(unsigned __int8 *)(a1 + 2934), 0, v302, *(_DWORD *)(a1 + 2844));
            if (updated <= -901)
              return updated;
            if (*(_DWORD *)(a1 + 952) == 14)
              return v4;
          }
          updated = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(a1 + 736), 1);
          if (updated <= -901)
            return updated;
          *(_DWORD *)(a1 + 952) = 14;
          v306 = 1;
        }
        v5 += v54;
        v3 = v52;
        if (v306)
          continue;
        goto LABEL_745;
      case 14:
        v43 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v43)
          v44 = *(_QWORD *)(a1 + 936);
        else
          v44 = v9 - v5;
        v45 = v43 - v44;
        *(_QWORD *)(a1 + 936) = v43 - v44;
        if (!v44)
          goto LABEL_77;
        updated = nghttp2_session_update_recv_connection_window_size(a1, v44);
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
        if ((*(_BYTE *)(a1 + 2916) & 1) == 0)
          goto LABEL_76;
        updated = session_update_consumed_size(a1, v357, v356, *(unsigned __int8 *)(a1 + 2934), 0, v44, *(_DWORD *)(a1 + 2844));
        if (updated <= -901)
          return updated;
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
LABEL_76:
        v45 = *(_QWORD *)(a1 + 936);
LABEL_77:
        v5 += v44;
        if (!v45)
          goto LABEL_706;
        goto LABEL_745;
      case 15:
        return v4;
      case 16:
        v65 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v65)
          v66 = *(_QWORD *)(a1 + 936);
        else
          v66 = v9 - v5;
        if (v66)
        {
          v67 = *(char **)(a1 + 896);
          memcpy(v67, v5, v66);
          *(_QWORD *)(a1 + 896) = &v67[v66];
          v65 = *(_QWORD *)(a1 + 936) - v66;
          *(_QWORD *)(a1 + 936) = v65;
          v5 += v66;
        }
        if (v65)
        {
          if (*(_QWORD *)(a1 + 880) == *(_QWORD *)(a1 + 896))
            __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 7318, "nghttp2_buf_avail(&iframe->lbuf) > 0");
          goto LABEL_745;
        }
        v128 = bswap32(**(unsigned __int16 **)(a1 + 848)) >> 16;
        v129 = *(_QWORD *)(a1 + 888);
        v130 = *(_QWORD *)(a1 + 896);
        v131 = *(_QWORD **)(a1 + 744);
        *v131 = v129;
        v131[1] = v128;
        v131[2] = v129 + v128;
        v131[3] = v130 - (v129 + v128);
        *v361 = 0u;
        *(_OWORD *)(a1 + 888) = 0u;
        *(_QWORD *)(a1 + 904) = 0;
        v132 = *(_QWORD *)(a1 + 744);
        v133 = *(_DWORD *)(a1 + 736);
        v134 = *(_QWORD *)(v132 + 8);
        if (v133)
        {
          if (v134)
            goto LABEL_546;
          v135 = nghttp2_map_find((uint64_t *)a1, v133);
          if (!v135 || (*(_BYTE *)(v135 + 216) & 2) != 0)
            goto LABEL_706;
          v136 = *(_DWORD *)(v135 + 204);
          if (v136 == 3 || v136 == 5)
            goto LABEL_706;
        }
        else if (!v134)
        {
          goto LABEL_546;
        }
        if (*(_QWORD *)(v132 + 24))
        {
          v269 = *(unsigned int (**)(uint64_t, _QWORD *, _QWORD))(a1 + 2376);
          if (v269 && v269(a1, v363, *(_QWORD *)(a1 + 2608)))
            return -902;
          goto LABEL_706;
        }
LABEL_546:
        v270 = *(unsigned int (**)(uint64_t, _QWORD *, uint64_t, _QWORD))(a1 + 2384);
        if (v270 && v270(a1, v363, 4294966791, *(_QWORD *)(a1 + 2608)))
          return -902;
        goto LABEL_706;
      case 17:
        v108 = v3;
        v109 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v109)
          v110 = *(_QWORD *)(a1 + 936);
        else
          v110 = v9 - v5;
        v111 = *(_QWORD *)(a1 + 896);
        if (v110)
        {
          memcpy(*(void **)(a1 + 896), v5, v110);
          v112 = (unsigned __int16 *)(v111 + v110);
          *(_QWORD *)(a1 + 896) = v111 + v110;
          v109 = *(_QWORD *)(a1 + 936) - v110;
          *(_QWORD *)(a1 + 936) = v109;
          v5 += v110;
          if (v109)
            goto LABEL_186;
        }
        else
        {
          v112 = *(unsigned __int16 **)(a1 + 896);
          if (v109)
          {
LABEL_186:
            if (*(unsigned __int16 **)(a1 + 880) == v112)
              __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 7347, "nghttp2_buf_avail(&iframe->lbuf) > 0");
            goto LABEL_592;
          }
        }
        v360 = v9;
        v139 = 0;
        v140 = *(unsigned __int16 **)(a1 + 888);
        v141 = *(_QWORD **)(a1 + 744);
        v142 = v140;
LABEL_227:
        v143 = v111 + v110 - (_QWORD)v142;
        while (v142 != v112)
        {
          v225 = v143 < 2;
          v143 -= 2;
          if (v225)
            goto LABEL_590;
          v145 = *v142++;
          v144 = v145;
          if (v145)
          {
            v146 = __rev16(v144);
            if ((char *)v112 - (char *)v142 < v146)
              goto LABEL_590;
            v142 = (unsigned __int16 *)((char *)v142 + v146);
            v109 += v146 + 1;
            ++v139;
            goto LABEL_227;
          }
        }
        if (v139)
        {
          v249 = (*(uint64_t (**)(size_t, _QWORD))(a1 + 2576))(v109 + 16 * v139, *(_QWORD *)(a1 + 2568));
          if (!v249)
            return -901;
          v250 = (_QWORD *)v249;
          *v141 = v139;
          v141[1] = v249;
          v251 = (char *)(v249 + 16 * v139);
          while (v140 != v112)
          {
            v253 = *v140++;
            v252 = v253;
            if (v253)
            {
              v254 = __rev16(v252);
              *v250 = v251;
              v250[1] = v254;
              v250 += 2;
              memcpy(v251, v140, v254);
              v255 = &v251[v254];
              *v255 = 0;
              v251 = v255 + 1;
              v140 = (unsigned __int16 *)((char *)v140 + v254);
            }
          }
        }
        else
        {
          *v141 = 0;
          v141[1] = 0;
        }
        v278 = *(unsigned int (**)(uint64_t, _QWORD *, _QWORD))(a1 + 2376);
        if (v278 && v278(a1, v363, *(_QWORD *)(a1 + 2608)))
          return -902;
LABEL_590:
        if (*(_DWORD *)(a1 + 952) == 15)
          return v4;
        session_inbound_frame_reset(a1);
        v9 = v360;
LABEL_592:
        v3 = v108;
        goto LABEL_745;
      case 18:
        v34 = *(_QWORD *)(a1 + 936);
        if (v9 - v5 >= v34)
          v35 = *(_QWORD *)(a1 + 936);
        else
          v35 = v9 - v5;
        v36 = v34 - v35;
        *(_QWORD *)(a1 + 936) = v34 - v35;
        v37 = &v5[v35];
        if (!v35)
          goto LABEL_58;
        v38 = *(uint64_t (**)(uint64_t, _QWORD *, char *))(a1 + 2544);
        if (!v38)
          goto LABEL_58;
        v39 = v38(a1, v363, v5);
        if (v39 == -535)
        {
          *(_DWORD *)(a1 + 952) = 6;
          v42 = 1;
        }
        else
        {
          if (v39)
            return -902;
          v36 = *(_QWORD *)(a1 + 936);
LABEL_58:
          if (!v36)
          {
            v367 = 0;
            v40 = (*(uint64_t (**)(uint64_t, uint64_t *, _QWORD *, _QWORD))(a1 + 2536))(a1, &v367, v363, *(_QWORD *)(a1 + 2608));
            if (v40 != -535)
            {
              if (v40)
                return -902;
              *(_QWORD *)(a1 + 744) = v367;
              v41 = *(unsigned int (**)(uint64_t, _QWORD *, _QWORD))(a1 + 2376);
              if (v41)
              {
                if (v41(a1, v363, *(_QWORD *)(a1 + 2608)))
                  return -902;
              }
            }
            session_inbound_frame_reset(a1);
          }
          v42 = 0;
        }
        v5 = v37;
        if (v42)
          continue;
        goto LABEL_745;
      default:
        goto LABEL_745;
    }
    break;
  }
  while (1)
  {
    v370 = 0;
    v149 = nghttp2_hd_inflate_hd_nv(v22, (uint64_t)&v367, &v370, v148, v18, v364);
    v150 = v149;
    if ((int)v149 < -900)
      return (int)v150;
    if (v149 < 0)
    {
      v248 = *(_DWORD *)(a1 + 952) != 4 || v362 == 0;
      if (!v248
        && *(_DWORD *)(v362 + 204) != 3
        && (v204 = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v362 + 168), 9), v204 < -900)
        || (v204 = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 9, 0), v3 = &jpt_1DF2540B0, v204 <= -901))
      {
LABEL_808:
        LODWORD(v150) = v204;
        return (int)v150;
      }
      v202 = -523;
      goto LABEL_641;
    }
    v147 += v149;
    v151 = v370;
    if (v10 != 4 || (v370 & 2) == 0 || !v362)
      goto LABEL_455;
    if ((*(_BYTE *)(a1 + 2916) & 4) == 0)
      break;
LABEL_450:
    v237 = *(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 2448);
    if (v237)
    {
      v202 = v237(a1, v363, v367, v368, BYTE4(v369), *(_QWORD *)(a1 + 2608));
      if (v202)
        goto LABEL_608;
    }
    else
    {
      v238 = *(uint64_t (**)(uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 2440);
      if (v238)
      {
        v202 = v238(a1, v363, *(_QWORD *)(v367 + 16), *(_QWORD *)(v367 + 24), *(_QWORD *)(v368 + 16), *(_QWORD *)(v368 + 24), BYTE4(v369), *(_QWORD *)(a1 + 2608));
        if (v202)
        {
LABEL_608:
          if (v202 != -526)
          {
            v3 = &jpt_1DF2540B0;
            v286 = v353;
            if (v202 != -521)
              goto LABEL_804;
            goto LABEL_642;
          }
          goto LABEL_640;
        }
      }
    }
LABEL_455:
    if ((v151 & 1) != 0)
    {
      nghttp2_rcbuf_decref(*(_QWORD *)(a1 + 2280));
      nghttp2_rcbuf_decref(*(_QWORD *)(a1 + 2272));
      v202 = 0;
      *(_QWORD *)(a1 + 2272) = 0;
      *(_QWORD *)(a1 + 2280) = 0;
      *(_DWORD *)(a1 + 2332) = 1;
      goto LABEL_640;
    }
    v148 += v150;
    v18 -= v150;
    if (!v18 && (v151 & 2) == 0)
    {
      v202 = 0;
LABEL_640:
      v3 = &jpt_1DF2540B0;
LABEL_641:
      v286 = v353;
LABEL_642:
      v10 = *(_DWORD *)(a1 + 952);
      if (v10 == 15)
        return v4;
      if (v202 == -521)
      {
        *(_QWORD *)(a1 + 936) -= v147;
        v297 = 736;
        if (*(_BYTE *)(a1 + 740) == 5)
          v297 = 768;
        updated = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(a1 + v297), 2);
        if (updated <= -901)
          return updated;
        v5 += v147;
        *(_DWORD *)(a1 + 952) = 5;
        v9 = v359;
      }
      else
      {
        if (v202 == -526)
        {
          *(_QWORD *)(a1 + 936) -= v147;
          return &v5[v147] - v355;
        }
        v5 += v286;
        v296 = *(_QWORD *)(a1 + 936);
        *(_QWORD *)(a1 + 936) = v296 - v286;
        if (v202 != -523)
        {
          v9 = v359;
          if (v296 != v286)
            goto LABEL_745;
          goto LABEL_189;
        }
        v9 = v359;
        if (v296 == v286)
        {
LABEL_706:
          session_inbound_frame_reset(a1);
          goto LABEL_745;
        }
LABEL_647:
        v273 = 6;
LABEL_742:
        *(_DWORD *)(a1 + 952) = v273;
LABEL_743:
        v96 = 1;
LABEL_744:
        if (!v96)
        {
LABEL_745:
          if (v5 == v9)
            return v4;
        }
      }
      goto LABEL_12;
    }
  }
  v152 = v367;
  v153 = *(const char **)(v367 + 16);
  v154 = *(_QWORD *)(v367 + 24);
  if (!v154)
    goto LABEL_355;
  v155 = *(unsigned __int8 *)v153;
  v156 = *(unsigned __int8 **)(v367 + 16);
  v157 = *(_QWORD *)(v367 + 24);
  if (v155 != 58)
    goto LABEL_245;
  v157 = v154 - 1;
  if (v154 == 1)
    goto LABEL_637;
  v156 = (unsigned __int8 *)(v153 + 1);
  do
  {
LABEL_245:
    if (!VALID_HD_NAME_CHARS[*v156])
    {
      if (*v153 != 58)
      {
        v162 = 0;
        while (v153[v162] - 91 < 0xFFFFFFE6)
        {
          if (v154 == ++v162)
            goto LABEL_355;
        }
      }
      goto LABEL_637;
    }
    ++v156;
    --v157;
  }
  while (v157);
  v158 = v369;
  switch((int)v369)
  {
    case 0:
      goto LABEL_270;
    case 1:
      v159 = v368;
      v160 = *(_QWORD *)(v368 + 24);
      if (!v160)
        goto LABEL_354;
      v161 = *(unsigned __int8 **)(v368 + 16);
      while (VALID_METHOD_CHARS[*v161])
      {
        ++v161;
        if (!--v160)
          goto LABEL_304;
      }
      goto LABEL_354;
    case 2:
    case 4:
      goto LABEL_277;
    case 3:
      v159 = v368;
      v175 = *(_QWORD *)(v368 + 24);
      if (!v175)
        goto LABEL_304;
      v176 = *(unsigned __int8 **)(v368 + 16);
      while (VALID_PATH_CHARS[*v176])
      {
        ++v176;
        if (!--v175)
          goto LABEL_304;
      }
      goto LABEL_354;
    case 5:
      v159 = v368;
      v177 = *(_QWORD *)(v368 + 24);
      if (!v177)
        goto LABEL_354;
      v178 = *(_BYTE **)(v368 + 16);
      if ((*v178 & 0xDFu) - 65 > 0x19)
        goto LABEL_354;
      v179 = v177 - 1;
      if (!v179)
        goto LABEL_304;
      v180 = v178 + 1;
      while (1)
      {
        v181 = *v180;
        if (v181 - 48 >= 0xA && (v181 & 0xFFFFFFDF) - 65 >= 0x1A)
        {
          v225 = v181 > 0x2E;
          v183 = (1 << v181) & 0x680000000000;
          if (v225 || v183 == 0)
            goto LABEL_354;
        }
        ++v180;
        if (!--v179)
          goto LABEL_304;
      }
    default:
      if ((_DWORD)v369 != 37)
      {
        if ((_DWORD)v369 == 66)
        {
          v163 = *(_BYTE *)(v362 + 216);
          v159 = v368;
          if ((v163 & 0x40) != 0)
          {
            v164 = *(_QWORD *)(v368 + 24);
            if (!v164)
              goto LABEL_354;
            v165 = *(unsigned __int8 **)(v368 + 16);
            while (1)
            {
              v167 = *v165++;
              v166 = v167;
              if (v167 != 32 && v166 != 9)
                break;
              if (!--v164)
                goto LABEL_354;
            }
          }
        }
        else
        {
LABEL_277:
          v163 = *(_BYTE *)(v362 + 216);
          v159 = v368;
        }
        v171 = *(unsigned __int8 **)(v159 + 16);
        v172 = *(_QWORD *)(v159 + 24);
        if ((v163 & 0x40) == 0)
        {
LABEL_279:
          v342 = v369;
          v343 = v159;
          v346 = *(_QWORD *)(v367 + 24);
          v349 = v4;
          v173 = v367;
          v344 = *(const char **)(v367 + 16);
          v174 = nghttp2_check_header_value_rfc9113(v171, v172);
          v153 = v344;
          LODWORD(v154) = v346;
          v152 = v173;
          v4 = v349;
          v158 = v342;
          v159 = v343;
          if (!v174)
            goto LABEL_354;
          goto LABEL_304;
        }
        if (v172)
        {
          while (VALID_HD_VALUE_CHARS[*v171])
          {
            ++v171;
            if (!--v172)
              goto LABEL_304;
          }
          goto LABEL_354;
        }
LABEL_304:
        if (*(_BYTE *)(a1 + 2932))
        {
          v185 = *(_BYTE *)(a1 + 2929) != 0;
          goto LABEL_308;
        }
        if (*(_BYTE *)(a1 + 740) == 5)
        {
          v185 = 0;
LABEL_308:
          if (v155 == 58 && (v352 || (*(_BYTE *)(v362 + 212) & 0x40) != 0))
            goto LABEL_637;
          if (v158 > 36)
          {
            switch(v158)
            {
              case '8':
              case '>':
              case '?':
              case '@':
              case 'A':
                goto LABEL_637;
              case '9':
              case ':':
              case ';':
              case '<':
                goto LABEL_362;
              case '=':
                if (*(_QWORD *)(v159 + 24) != 8)
                  goto LABEL_637;
                v188 = 0;
                while (1)
                {
                  v189 = aTrailers[v188];
                  if ((v189 - 65) < 0x1A)
                    LOBYTE(v189) = v189 + 32;
                  v190 = *(unsigned __int8 *)(*(_QWORD *)(v159 + 16) + v188);
                  if ((v190 - 65) < 0x1A)
                    LOBYTE(v190) = v190 + 32;
                  if (v189 != v190)
                    goto LABEL_637;
                  if (++v188 == 8)
                    goto LABEL_447;
                }
              case 'B':
                if (!v185)
                  goto LABEL_637;
                v205 = *(_DWORD *)(v362 + 212);
                if ((v205 & 0x8000) != 0 || !*(_QWORD *)(v159 + 24))
                  goto LABEL_637;
                v187 = v205 | 0x8000;
                goto LABEL_446;
              case 'C':
                if (v352
                  || (*(_BYTE *)(v362 + 168) & 1) == 0
                  || (*(_BYTE *)(v362 + 216) & 0x10) == 0
                  || (*(_BYTE *)(v362 + 214) & 2) != 0)
                {
                  break;
                }
                v206 = v4;
                v207 = v152;
                v208 = *(unsigned __int8 *)(v362 + 221);
                v371 = v208 & 0x7F;
                v372 = v208 >> 7;
                if (nghttp2_http_parse_priority((int *)&v371, *(unsigned __int8 **)(v159 + 16), *(_QWORD *)(v159 + 24)))
                {
                  v187 = *(_DWORD *)(v362 + 212) & 0xFFFCFFFF | 0x20000;
                }
                else
                {
                  *(_BYTE *)(v362 + 221) = v371 | ((_BYTE)v372 << 7);
                  v187 = *(_DWORD *)(v362 + 212) | 0x10000;
                }
                v152 = v207;
                v4 = v206;
                goto LABEL_446;
              default:
                if (v158 == 37)
                {
                  v198 = *(_DWORD *)(v362 + 212);
                  if ((v198 & 0x10) != 0 || !*(_QWORD *)(v159 + 24))
                    goto LABEL_637;
                  v187 = v198 | 0x10;
LABEL_446:
                  *(_DWORD *)(v362 + 212) = v187;
                }
                else
                {
LABEL_362:
                  if (v155 == 58)
                    goto LABEL_637;
                }
                break;
            }
          }
          else
          {
            switch(v158)
            {
              case 0:
                v186 = *(_DWORD *)(v362 + 212);
                if ((v186 & 1) != 0 || !*(_QWORD *)(v159 + 24))
                  goto LABEL_637;
                v187 = v186 | 1;
                goto LABEL_446;
              case 1:
                v209 = *(_DWORD *)(v362 + 212);
                if ((v209 & 4) != 0)
                  goto LABEL_637;
                v210 = *(_QWORD *)(v159 + 24);
                if (!v210)
                  goto LABEL_637;
                *(_DWORD *)(v362 + 212) = v209 | 4;
                if (v210 == 7)
                {
                  v229 = *(int **)(v159 + 16);
                  v230 = *((unsigned __int8 *)v229 + 6);
                  if (v230 == 83)
                  {
                    v240 = *v229;
                    v241 = *(int *)((char *)v229 + 3);
                    if (v240 == 1230262351 && v241 == 1397641033)
                    {
                      v211 = 516;
                      goto LABEL_445;
                    }
                  }
                  else if (v230 == 84)
                  {
                    v231 = *v229;
                    v232 = *(int *)((char *)v229 + 3);
                    if (v231 == 1313754947 && v232 == 1413694798)
                    {
                      if ((*(_BYTE *)(v362 + 168) & 1) == 0)
                        goto LABEL_637;
                      v211 = 132;
                      goto LABEL_445;
                    }
                  }
                }
                else if (v210 == 4 && **(_DWORD **)(v159 + 16) == 1145128264)
                {
                  v211 = 260;
LABEL_445:
                  v187 = v209 | v211;
                  goto LABEL_446;
                }
                break;
              case 2:
              case 4:
                goto LABEL_362;
              case 3:
                v209 = *(_DWORD *)(v362 + 212);
                if ((v209 & 2) != 0)
                  goto LABEL_637;
                v212 = *(_QWORD *)(v159 + 24);
                if (!v212)
                  goto LABEL_637;
                *(_DWORD *)(v362 + 212) = v209 | 2;
                v213 = **(unsigned __int8 **)(v159 + 16);
                if (v213 == 47)
                {
                  v211 = 2050;
                  goto LABEL_445;
                }
                if (v212 != 1 || v213 != 42)
                  break;
                v211 = 4098;
                goto LABEL_445;
              case 5:
                v209 = *(_DWORD *)(v362 + 212);
                if ((v209 & 8) != 0)
                  goto LABEL_637;
                v214 = *(_QWORD *)(v159 + 24);
                if (!v214)
                  goto LABEL_637;
                *(_DWORD *)(v362 + 212) = v209 | 8;
                if (v214 == 5)
                {
                  v234 = 0;
                  while (1)
                  {
                    v235 = aHttps[v234];
                    if ((v235 - 65) < 0x1A)
                      LOBYTE(v235) = v235 + 32;
                    v236 = *(unsigned __int8 *)(*(_QWORD *)(v159 + 16) + v234);
                    if ((v236 - 65) < 0x1A)
                      LOBYTE(v236) = v236 + 32;
                    if (v235 != v236)
                      break;
                    if (++v234 == 5)
                    {
LABEL_444:
                      v211 = 8200;
                      goto LABEL_445;
                    }
                  }
                }
                else
                {
                  if (v214 != 4)
                    break;
                  v215 = 0;
                  while (1)
                  {
                    v216 = aHttp[v215];
                    if ((v216 - 65) < 0x1A)
                      LOBYTE(v216) = v216 + 32;
                    v217 = *(unsigned __int8 *)(*(_QWORD *)(v159 + 16) + v215);
                    if ((v217 - 65) < 0x1A)
                      LOBYTE(v217) = v217 + 32;
                    if (v216 != v217)
                      break;
                    if (++v215 == 4)
                      goto LABEL_444;
                  }
                }
                break;
              default:
                if (v158 != 27)
                  goto LABEL_362;
                if (*(_QWORD *)(v362 + 48) != -1)
                  goto LABEL_637;
                v347 = v154;
                v350 = v4;
                v195 = v153;
                v196 = v152;
                v197 = parse_uint(*(unsigned __int8 **)(v159 + 16), *(_QWORD *)(v159 + 24));
                v152 = v196;
                LODWORD(v154) = v347;
                v4 = v350;
                v153 = v195;
                *(_QWORD *)(v362 + 48) = v197;
                if (v197 == -1)
                  goto LABEL_637;
                break;
            }
          }
LABEL_447:
          if (**(_BYTE **)(v152 + 16) != 58)
            *(_DWORD *)(v362 + 212) |= 0x40u;
          v22 = a1 + 2104;
          goto LABEL_450;
        }
        if (v155 == 58 && (v352 || (*(_BYTE *)(v362 + 212) & 0x40) != 0))
          goto LABEL_637;
        v191 = (v158 - 27);
        if (v191 <= 0x26)
        {
          if (v158 == 27)
          {
            v218 = *(unsigned __int16 *)(v362 + 208);
            if (v218 == 204)
            {
              v22 = a1 + 2104;
              if (*(_QWORD *)(v362 + 48) != -1 || *(_QWORD *)(v159 + 24) != 1)
                goto LABEL_637;
              v219 = **(unsigned __int8 **)(v159 + 16);
              if ((v219 - 65) < 0x1A)
                LOBYTE(v219) = v219 + 32;
              if (v219 != 48)
                goto LABEL_637;
              *(_QWORD *)(v362 + 48) = 0;
              goto LABEL_455;
            }
            v22 = a1 + 2104;
            if ((v218 - 100) < 0x64)
              goto LABEL_637;
            if ((v218 - 200) <= 0x63 && (*(_BYTE *)(v362 + 212) & 0x80) != 0)
              goto LABEL_455;
            v345 = v153;
            v348 = v154;
            if (*(_QWORD *)(v362 + 48) != -1)
              goto LABEL_637;
            v239 = parse_uint(*(unsigned __int8 **)(v159 + 16), *(_QWORD *)(v159 + 24));
            *(_QWORD *)(v362 + 48) = v239;
            v153 = v345;
            LODWORD(v154) = v348;
            if (v239 == -1)
              goto LABEL_637;
            goto LABEL_464;
          }
          if (v191 == 34)
          {
            v22 = a1 + 2104;
            if (*(_QWORD *)(v159 + 24) == 8)
            {
              v192 = 0;
              while (1)
              {
                v193 = aTrailers[v192];
                if ((v193 - 65) < 0x1A)
                  LOBYTE(v193) = v193 + 32;
                v194 = *(unsigned __int8 *)(*(_QWORD *)(v159 + 16) + v192);
                if ((v194 - 65) < 0x1A)
                  LOBYTE(v194) = v194 + 32;
                if (v193 != v194)
                  break;
                if (++v192 == 8)
                  goto LABEL_464;
              }
            }
LABEL_637:
            v204 = session_call_error_callback(a1, 4294966765, "Invalid HTTP header field was received: frame type: %u, stream: %d, name: [%.*s], value: [%.*s]", *(unsigned __int8 *)(a1 + 740), *(_DWORD *)(a1 + 736), v154, v153, *(_QWORD *)(v368 + 24), *(const char **)(v368 + 16));
            if (v204 < -900)
              goto LABEL_808;
            v204 = session_handle_invalid_stream2(a1, *(_DWORD *)(v362 + 168), (uint64_t)v363, 4294966765);
            if (v204 <= -901)
              goto LABEL_808;
            v202 = -521;
            goto LABEL_640;
          }
          if (((1 << (v158 - 27)) & 0x6820000000) != 0)
            goto LABEL_637;
        }
        if (v158 == 7)
        {
          v220 = *(_DWORD *)(v362 + 212);
          if ((v220 & 0x20) == 0)
          {
            v221 = *(_QWORD *)(v159 + 24);
            v22 = a1 + 2104;
            if (v221)
            {
              *(_DWORD *)(v362 + 212) = v220 | 0x20;
              if (v221 == 3)
              {
                v222 = 0;
                v223 = 0;
                do
                {
                  v224 = *(unsigned __int8 *)(*(_QWORD *)(v159 + 16) + v222);
                  v225 = (v224 - 58) >= 0xFFFFFFF6 && v223 <= 0xCCCCCCCCCCCCCCCLL;
                  if (!v225
                    || (v226 = 10 * v223, v227 = (v224 - 48), v226 > (v227 ^ 0x7FFFFFFFFFFFFFFFLL)))
                  {
                    *(_WORD *)(v362 + 208) = -1;
                    goto LABEL_637;
                  }
                  v223 = v227 + v226;
                  ++v222;
                }
                while (v222 != 3);
                *(_WORD *)(v362 + 208) = v223;
                if ((unsigned __int16)v223 != 101 && (unsigned __int16)v223 != 0xFFFF)
                  goto LABEL_464;
              }
            }
          }
          goto LABEL_637;
        }
        v8 = v155 == 58;
        v22 = a1 + 2104;
        if (v8)
          goto LABEL_637;
LABEL_464:
        if (*v153 != 58)
          *(_DWORD *)(v362 + 212) |= 0x40u;
        goto LABEL_450;
      }
LABEL_270:
      if (*(_BYTE *)(a1 + 2932) || *(_BYTE *)(a1 + 740) == 5)
      {
        v159 = v368;
        v169 = *(_QWORD *)(v368 + 24);
        if (v169)
        {
          v170 = *(unsigned __int8 **)(v368 + 16);
          while (VALID_AUTHORITY_CHARS[*v170])
          {
            ++v170;
            if (!--v169)
              goto LABEL_304;
          }
          goto LABEL_354;
        }
        goto LABEL_304;
      }
      v159 = v368;
      v171 = *(unsigned __int8 **)(v368 + 16);
      v172 = *(_QWORD *)(v368 + 24);
      if ((*(_BYTE *)(v362 + 216) & 0x40) == 0)
        goto LABEL_279;
      if (!v172)
        goto LABEL_304;
      while (VALID_HD_VALUE_CHARS[*v171])
      {
        ++v171;
        if (!--v172)
          goto LABEL_304;
      }
LABEL_354:
      if (v155 == 58)
        goto LABEL_637;
LABEL_355:
      *(_DWORD *)(v362 + 212) |= 0x40u;
      v199 = *(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 2464);
      v351 = v4;
      if (v199)
      {
        v200 = v368;
        v201 = v152;
        v202 = v199(a1, v363, v152, v368, BYTE4(v369), *(_QWORD *)(a1 + 2608));
      }
      else
      {
        v203 = *(uint64_t (**)(uint64_t, _QWORD *, const char *))(a1 + 2456);
        if (!v203)
          goto LABEL_637;
        v201 = v152;
        v200 = v368;
        v202 = v203(a1, v363, v153);
      }
      switch(v202)
      {
        case 0:
          v204 = session_call_error_callback(a1, 4294966765, "Ignoring received invalid HTTP header field: frame type: %u, stream: %d, name: [%.*s], value: [%.*s]", *(unsigned __int8 *)(a1 + 740), *(_DWORD *)(a1 + 736), *(_QWORD *)(v201 + 24), *(const char **)(v201 + 16), *(_QWORD *)(v200 + 24), *(const char **)(v200 + 16));
          v22 = a1 + 2104;
          v4 = v351;
          if (v204 <= -901)
            goto LABEL_808;
          goto LABEL_455;
        case -526:
          v3 = &jpt_1DF2540B0;
          v286 = v353;
          v4 = v351;
          goto LABEL_642;
        case -521:
          v153 = *(const char **)(v201 + 16);
          v154 = *(_QWORD *)(v201 + 24);
          v4 = v351;
          goto LABEL_637;
      }
LABEL_804:
      LODWORD(v150) = -902;
      return (int)v150;
  }
}

uint64_t session_call_error_callback(uint64_t a1, uint64_t a2, char *__format, ...)
{
  int v6;
  size_t v7;
  char *v8;
  char *v9;
  unsigned int v10;
  uint64_t (*v11)(uint64_t, uint64_t, char *, _QWORD, _QWORD);
  int v12;
  int v14;
  va_list va;

  va_start(va, __format);
  if (*(_OWORD *)(a1 + 2552) == 0)
    return 0;
  v6 = vsnprintf(0, 0, __format, va);
  if (v6 < 0)
    return 4294966395;
  v7 = (v6 + 1);
  v8 = (char *)(*(uint64_t (**)(size_t, _QWORD))(a1 + 2576))(v7, *(_QWORD *)(a1 + 2568));
  if (!v8)
    return 4294966395;
  v9 = v8;
  v10 = vsnprintf(v8, v7, __format, va);
  if ((v10 & 0x80000000) != 0)
  {
    (*(void (**)(char *, _QWORD))(a1 + 2584))(v9, *(_QWORD *)(a1 + 2568));
    return 0;
  }
  v11 = *(uint64_t (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 2560);
  if (v11)
    v12 = v11(a1, a2, v9, v10, *(_QWORD *)(a1 + 2608));
  else
    v12 = (*(uint64_t (**)(uint64_t, char *, _QWORD, _QWORD))(a1 + 2552))(a1, v9, v10, *(_QWORD *)(a1 + 2608));
  v14 = v12;
  (*(void (**)(char *, _QWORD))(a1 + 2584))(v9, *(_QWORD *)(a1 + 2568));
  if (v14)
    return 4294966394;
  else
    return 0;
}

void session_process_priority_frame(uint64_t a1)
{
  int v2;
  int *v3;
  int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t, uint64_t, _QWORD);

  v2 = *(unsigned __int8 *)(a1 + 2930);
  if (v2 == 1 && !*(_BYTE *)(a1 + 2931))
    __assert_rtn("session_process_priority_frame", "nghttp2_session.c", 4526, "!session_no_rfc7540_pri_no_fallback(session)");
  v3 = *(int **)(a1 + 848);
  v4 = *v3;
  v5 = bswap32(*v3 & 0xFFFFFF7F);
  LODWORD(v3) = *((unsigned __int8 *)v3 + 4) + 1;
  *(_DWORD *)(a1 + 744) = v5;
  *(_DWORD *)(a1 + 748) = (_DWORD)v3;
  *(_BYTE *)(a1 + 752) = (v4 & 0x80) != 0;
  if (v2 == 1 && !*(_BYTE *)(a1 + 2931))
    __assert_rtn("nghttp2_session_on_priority_received", "nghttp2_session.c", 4467, "!session_no_rfc7540_pri_no_fallback(session)");
  v6 = *(_DWORD *)(a1 + 736);
  if (!v6)
  {
    session_handle_invalid_connection(a1, a1 + 728, 4294966791, "PRIORITY: stream_id == 0");
    return;
  }
  if (v5 == v6)
  {
    session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 1, "depend on itself");
    return;
  }
  if (!*(_BYTE *)(a1 + 2932))
    goto LABEL_20;
  v7 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
  if (v7)
  {
    if ((int)nghttp2_session_reprioritize_stream(a1, v7, (int *)(a1 + 744)) < -900)
      return;
    nghttp2_session_adjust_idle_stream(a1);
    if (v8 < -900)
      return;
LABEL_20:
    v11 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 2376);
    if (v11)
      v11(a1, a1 + 728, *(_QWORD *)(a1 + 2608));
    return;
  }
  if ((v6 & 1) != 0)
    v9 = *(_DWORD *)(a1 + 2808);
  else
    v9 = *(_DWORD *)(a1 + 2804);
  if (v9 < v6)
  {
    if (nghttp2_session_open_stream(a1, v6, (uint64_t *)(a1 + 744), 5, 0))
    {
      nghttp2_session_adjust_idle_stream(a1);
      if (v10 > -901)
        goto LABEL_20;
    }
  }
}

void session_process_rst_stream_frame(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  char *v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, _QWORD);
  int v8;
  unint64_t tv_sec;
  time_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  timespec v18;

  v2 = a1 + 728;
  *(_DWORD *)(a1 + 744) = bswap32(**(_DWORD **)(a1 + 848));
  v3 = *(_DWORD *)(a1 + 736);
  if (!v3)
  {
    v5 = "RST_STREAM: stream_id == 0";
LABEL_8:
    session_handle_invalid_connection(a1, a1 + 728, 4294966791, v5);
    return;
  }
  if ((*(_DWORD *)(a1 + 736) & 1) == (*(_BYTE *)(a1 + 2932) == 0))
    v4 = *(_DWORD *)(a1 + 2804);
  else
    v4 = *(_DWORD *)(a1 + 2808);
  if (v4 < v3)
  {
    v5 = "RST_STREAM: stream in idle";
    goto LABEL_8;
  }
  v6 = nghttp2_map_find((uint64_t *)a1, v3);
  if (v6 && (*(_BYTE *)(v6 + 216) & 2) == 0 && *(_DWORD *)(v6 + 204) != 5)
    *(_BYTE *)(v6 + 217) |= 1u;
  v7 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a1 + 2376);
  if (!v7 || !v7(a1, v2, *(_QWORD *)(a1 + 2608)))
  {
    nghttp2_session_close_stream(a1, *(unsigned int *)(a1 + 736), *(unsigned int *)(a1 + 744));
    if (v8 >= -900 && *(_BYTE *)(a1 + 2932) && (*(_BYTE *)(a1 + 2933) & 0x10) == 0)
    {
      v18.tv_sec = 0;
      v18.tv_nsec = 0;
      if (clock_gettime(_CLOCK_MONOTONIC, &v18) == -1)
      {
        v10 = time(0);
        if (v10 == -1)
          tv_sec = 0;
        else
          tv_sec = v10;
      }
      else
      {
        tv_sec = v18.tv_sec;
      }
      v11 = *(_QWORD *)(a1 + 2680);
      v12 = tv_sec >= v11;
      v13 = tv_sec - v11;
      if (v13)
      {
        if (v13 == 0 || !v12)
          v13 = 1;
        *(_QWORD *)(a1 + 2680) = tv_sec;
        v15 = *(_QWORD *)(a1 + 2664);
        if (!is_mul_ok(v13, v15) || (v16 = v15 * v13, v17 = *(_QWORD *)(a1 + 2672), __CFADD__(v16, v17)))
        {
          v14 = *(_QWORD *)(a1 + 2656);
        }
        else
        {
          v14 = v17 + v16;
          if (v14 >= *(_QWORD *)(a1 + 2656))
            v14 = *(_QWORD *)(a1 + 2656);
        }
        *(_QWORD *)(a1 + 2672) = v14;
      }
      else
      {
        v14 = *(_QWORD *)(a1 + 2672);
      }
      if (v14)
        *(_QWORD *)(a1 + 2672) = v14 - 1;
      else
        nghttp2_session_add_goaway(a1, *(_DWORD *)(a1 + 2808), 2, 0, 0, 0);
    }
  }
}

uint64_t session_process_push_promise_frame(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  BOOL v10;
  uint64_t v11;
  int v12;
  uint64_t (*v13)(uint64_t, uint64_t, _QWORD);
  int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;

  v1 = a1;
  v2 = a1 + 728;
  v3 = **(_DWORD **)(a1 + 848) & 0xFFFFFF7F;
  v4 = bswap32(v3);
  *(_DWORD *)(a1 + 768) = v4;
  *(_QWORD *)(a1 + 760) = 0;
  *(_QWORD *)(a1 + 752) = 0;
  v5 = *(_DWORD *)(a1 + 736);
  if (!v5)
  {
    v6 = "PUSH_PROMISE: stream_id == 0";
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 2932) || !*(_DWORD *)(a1 + 2888))
  {
    v6 = "PUSH_PROMISE: push disabled";
LABEL_5:
    v7 = a1 + 728;
    v8 = 4294966791;
    goto LABEL_6;
  }
  if ((v5 & 1) == 0)
  {
    v6 = "PUSH_PROMISE: invalid stream_id";
    goto LABEL_5;
  }
  if ((*(_BYTE *)(a1 + 2933) & 5) != 0)
    return 4294967193;
  if (v3)
    v10 = (v4 & 1) == 0;
  else
    v10 = 0;
  if (!v10 || *(_DWORD *)(a1 + 2808) >= v4)
  {
    v6 = "PUSH_PROMISE: invalid promised_stream_id";
    goto LABEL_5;
  }
  if (*(_DWORD *)(a1 + 2804) < v5)
  {
    v6 = "PUSH_PROMISE: stream in idle";
    goto LABEL_5;
  }
  *(_DWORD *)(a1 + 2808) = v4;
  v11 = nghttp2_map_find((uint64_t *)a1, v5);
  if (!v11
    || (*(_BYTE *)(v11 + 216) & 2) != 0
    || (v12 = *(_DWORD *)(v11 + 204), v12 == 3)
    || v12 == 5
    || !*(_BYTE *)(v1 + 2928)
    || *(_QWORD *)(v1 + 2712) >= *(_QWORD *)(v1 + 2720))
  {
    LODWORD(result) = nghttp2_session_add_rst_stream(v1, v4, 8);
    if ((_DWORD)result)
      return result;
    else
      return 4294967193;
  }
  else
  {
    if ((*(_BYTE *)(v11 + 217) & 1) != 0)
    {
      v6 = "PUSH_PROMISE: stream closed";
      a1 = v1;
      v7 = v2;
      v8 = 4294966786;
LABEL_6:
      LODWORD(result) = session_handle_invalid_connection(a1, v7, v8, v6);
      if ((int)result <= -901)
        return result;
      else
        return 4294967193;
    }
    v16 = *(_DWORD *)(v11 + 168);
    v17 = 16;
    if (nghttp2_session_open_stream(v1, v4, (uint64_t *)&v16, 4, 0))
    {
      *(_DWORD *)(v1 + 2812) = *(_DWORD *)(v1 + 2808);
      v13 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 2432);
      if (v13)
      {
        v14 = v13(v1, v2, *(_QWORD *)(v1 + 2608));
        if (v14)
          v15 = -902;
        else
          v15 = 0;
        if (v14 == -521)
          return 4294966775;
        else
          return v15;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 4294966395;
    }
  }
}

uint64_t session_process_priority_update_frame(uint64_t a1)
{
  int *v1;
  unint64_t v2;
  uint64_t v4;
  _DWORD *v5;
  int v6;
  unint64_t v7;
  char *v8;
  uint64_t v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int (*v16)(uint64_t, uint64_t, _QWORD);
  uint64_t v17;
  uint64_t v18;
  int v19;

  v1 = *(int **)(a1 + 848);
  v2 = *(_QWORD *)(a1 + 856) - (_QWORD)v1;
  if (v2 <= 3)
    __assert_rtn("nghttp2_frame_unpack_priority_update_payload", "nghttp2_frame.c", 924, "payloadlen >= 4");
  v4 = *(_QWORD *)(a1 + 744);
  v6 = *v1;
  v5 = v1 + 1;
  *(_DWORD *)v4 = bswap32(v6 & 0xFFFFFF7F);
  v7 = v2 - 4;
  if (!v7)
    v5 = 0;
  *(_QWORD *)(v4 + 8) = v5;
  *(_QWORD *)(v4 + 16) = v7;
  if (!*(_BYTE *)(a1 + 2932))
    __assert_rtn("nghttp2_session_on_priority_update_received", "nghttp2_session.c", 5337, "session->server");
  if (*(_DWORD *)(a1 + 736))
  {
    v8 = "PRIORITY_UPDATE: stream_id == 0";
    return session_handle_invalid_connection(a1, a1 + 728, 4294966791, v8);
  }
  v10 = *(_QWORD *)(a1 + 744);
  v19 = 0;
  v17 = 3;
  v11 = *(_DWORD *)v10;
  if (*(_DWORD *)v10)
    v12 = (*(_DWORD *)v10 & 1) == 0;
  else
    v12 = 0;
  if (v12)
  {
    if (*(_DWORD *)(a1 + 2804) < v11)
    {
      v8 = "PRIORITY_UPDATE: prioritizing idle push is not allowed";
      return session_handle_invalid_connection(a1, a1 + 728, 4294966791, v8);
    }
    goto LABEL_27;
  }
  v13 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)v10);
  if (v13)
  {
    v14 = v13;
    if ((*(_BYTE *)(v13 + 216) & 0x20) != 0)
      goto LABEL_27;
  }
  else
  {
    if (!v11)
      goto LABEL_27;
    v15 = (v11 & 1) != 0 ? *(_DWORD *)(a1 + 2808) : *(_DWORD *)(a1 + 2804);
    if (v15 >= v11)
      goto LABEL_27;
    if (*(_QWORD *)(a1 + 2704) + *(_QWORD *)(a1 + 2736) >= (unint64_t)*(unsigned int *)(a1 + 2892))
    {
      v8 = "PRIORITY_UPDATE: max concurrent streams exceeded";
      return session_handle_invalid_connection(a1, a1 + 728, 4294966791, v8);
    }
    v18 = 0x1000000000;
    v14 = nghttp2_session_open_stream(a1, v11, &v18, 5, 0);
    if (!v14)
      return 4294966395;
  }
  if (!nghttp2_http_parse_priority((int *)&v17, *(unsigned __int8 **)(v10 + 8), *(_QWORD *)(v10 + 16))
    && (int)session_update_stream_priority(a1, v14, ((BYTE4(v17) & 1) << 7) | v17) < -900)
  {
    return 4294966395;
  }
LABEL_27:
  v16 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a1 + 2376);
  if (v16 && v16(a1, a1 + 728, *(_QWORD *)(a1 + 2608)))
    return 4294966394;
  else
    return 0;
}

uint64_t nghttp2_session_recv()
{
  _QWORD *v0;
  uint64_t (*v1)(_QWORD *, char *, uint64_t, _QWORD, _QWORD);
  int64_t v2;
  int64_t v3;
  uint64_t result;
  char v6[16384];
  uint64_t v7;

  v0 = (_QWORD *)MEMORY[0x1E0C80A78]();
  v7 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    v1 = (uint64_t (*)(_QWORD *, char *, uint64_t, _QWORD, _QWORD))v0[296];
    if (!v1)
      v1 = (uint64_t (*)(_QWORD *, char *, uint64_t, _QWORD, _QWORD))v0[295];
    v2 = v1(v0, v6, 0x4000, 0, v0[326]);
    v3 = v2;
    if (v2 < 1)
      break;
    if ((unint64_t)v2 > 0x4000)
      return 4294966394;
    result = nghttp2_session_mem_recv2((uint64_t)v0, v6, v2);
    if (result < 0)
      return result;
    if (result != v3)
      __assert_rtn("nghttp2_session_recv", "nghttp2_session.c", 7390, "proclen == readlen");
  }
  if (v2 != -507)
  {
    if (v2 == -504 || v2 == 0)
      return 0;
    return 4294966394;
  }
  return 4294966789;
}

uint64_t nghttp2_session_get_outbound_queue_size(_QWORD *a1)
{
  return a1[37] + a1[34] + a1[40];
}

uint64_t nghttp2_session_get_stream_effective_recv_data_length(uint64_t *a1, int a2)
{
  uint64_t v2;

  v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(_BYTE *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5)
    return 0xFFFFFFFFLL;
  else
    return *(_DWORD *)(v2 + 176) & ~(*(int *)(v2 + 176) >> 31);
}

uint64_t nghttp2_session_get_stream_effective_local_window_size(uint64_t *a1, int a2)
{
  uint64_t v2;

  v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(_BYTE *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5)
    return 0xFFFFFFFFLL;
  else
    return *(unsigned int *)(v2 + 188);
}

uint64_t nghttp2_session_get_stream_local_window_size(uint64_t *a1, int a2)
{
  uint64_t v2;
  int v4;

  v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(_BYTE *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5)
    return 0xFFFFFFFFLL;
  v4 = *(_DWORD *)(v2 + 188) - *(_DWORD *)(v2 + 176);
  return v4 & ~(v4 >> 31);
}

uint64_t nghttp2_session_get_effective_recv_data_length(uint64_t a1)
{
  return *(_DWORD *)(a1 + 2832) & ~(*(int *)(a1 + 2832) >> 31);
}

uint64_t nghttp2_session_get_effective_local_window_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2844);
}

uint64_t nghttp2_session_get_remote_settings(unsigned int *a1, int a2)
{
  unsigned int *v2;

  switch(a2)
  {
    case 1:
      v2 = a1 + 713;
      break;
    case 2:
      v2 = a1 + 714;
      break;
    case 3:
      v2 = a1 + 715;
      break;
    case 4:
      v2 = a1 + 716;
      break;
    case 5:
      v2 = a1 + 717;
      break;
    case 6:
      v2 = a1 + 718;
      break;
    case 8:
      v2 = a1 + 719;
      break;
    case 9:
      v2 = a1 + 720;
      break;
    default:
      __assert_rtn("nghttp2_session_get_remote_settings", "nghttp2_session.c", 8053, "0");
  }
  return *v2;
}

uint64_t nghttp2_session_get_local_settings(unsigned int *a1, int a2)
{
  unsigned int *v2;

  switch(a2)
  {
    case 1:
      v2 = a1 + 721;
      break;
    case 2:
      v2 = a1 + 722;
      break;
    case 3:
      v2 = a1 + 723;
      break;
    case 4:
      v2 = a1 + 724;
      break;
    case 5:
      v2 = a1 + 725;
      break;
    case 6:
      v2 = a1 + 726;
      break;
    case 8:
      v2 = a1 + 727;
      break;
    case 9:
      v2 = a1 + 728;
      break;
    default:
      __assert_rtn("nghttp2_session_get_local_settings", "nghttp2_session.c", 8078, "0");
  }
  return *v2;
}

uint64_t nghttp2_session_upgrade(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = nghttp2_session_upgrade_internal((uint64_t)a1, a2, a3, a4);
  if (!(_DWORD)v5)
  {
    v6 = nghttp2_map_find(a1, 1);
    if (!v6 || (*(_BYTE *)(v6 + 216) & 2) != 0 || *(_DWORD *)(v6 + 204) == 5)
      __assert_rtn("nghttp2_session_upgrade", "nghttp2_session.c", 8166, "stream");
    *(_DWORD *)(v6 + 212) |= 0x400u;
  }
  return v5;
}

uint64_t nghttp2_session_upgrade_internal(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  _DWORD *v12;
  unsigned int *v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  if (*(_BYTE *)(a1 + 2932))
  {
    if (*(int *)(a1 + 2808) > 0)
      return 4294966791;
  }
  else if (*(_DWORD *)(a1 + 2800) != 1)
  {
    return 4294966791;
  }
  v9 = a3 / 6;
  if (a3 % 6)
    return 4294966795;
  if (v9 > *(_QWORD *)(a1 + 2776))
    return 4294966759;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0;
  if (a3 >= 6)
  {
    v11 = (*(uint64_t (**)(unint64_t, _QWORD))(a1 + 2576))(8 * v9, *(_QWORD *)(a1 + 2568));
    if (!v11)
      return 4294966395;
    v10 = (_DWORD *)v11;
    v12 = (_DWORD *)(v11 + 4);
    v13 = (unsigned int *)(a2 + 2);
    v14 = a3 / 6;
    do
    {
      *(v12 - 1) = bswap32(*((unsigned __int16 *)v13 - 1)) >> 16;
      v15 = *v13;
      v13 = (unsigned int *)((char *)v13 + 6);
      *v12 = bswap32(v15);
      v12 += 2;
      --v14;
    }
    while (v14);
  }
  else
  {
    v10 = 0;
  }
  if (*(_BYTE *)(a1 + 2932))
  {
    *(_QWORD *)&v23 = a3;
    WORD6(v23) = 4;
    DWORD2(v23) = 0;
    BYTE14(v23) = 0;
    *(_QWORD *)&v24 = a3 / 6;
    *((_QWORD *)&v24 + 1) = v10;
    v16 = nghttp2_session_on_settings_received(a1, (uint64_t)&v23, 1);
  }
  else
  {
    v16 = nghttp2_session_add_settings(a1, 0, v10, a3 / 6);
  }
  v8 = v16;
  (*(void (**)(_DWORD *, _QWORD))(a1 + 2584))(v10, *(_QWORD *)(a1 + 2568));
  if (!(_DWORD)v8)
  {
    v21 = 0x1000000000;
    LOBYTE(v22) = 0;
    if (*(_BYTE *)(a1 + 2932))
      v17 = 0;
    else
      v17 = a4;
    v18 = nghttp2_session_open_stream(a1, 1, &v21, 1, v17);
    if (v18)
    {
      v19 = *(_BYTE *)(v18 + 217);
      v8 = 0;
      if (*(_BYTE *)(a1 + 2932))
      {
        *(_BYTE *)(v18 + 217) = v19 | 1;
        *(_QWORD *)(a1 + 2808) = 0x100000001;
      }
      else
      {
        *(_BYTE *)(v18 + 217) = v19 | 2;
        *(_DWORD *)(a1 + 2804) = 1;
        *(_DWORD *)(a1 + 2800) += 2;
      }
      return v8;
    }
    return 4294966395;
  }
  return v8;
}

uint64_t nghttp2_session_upgrade2(uint64_t *a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;

  v7 = nghttp2_session_upgrade_internal((uint64_t)a1, a2, a3, a5);
  if (!(_DWORD)v7)
  {
    v8 = nghttp2_map_find(a1, 1);
    if (!v8 || (*(_BYTE *)(v8 + 216) & 2) != 0 || *(_DWORD *)(v8 + 204) == 5)
      __assert_rtn("nghttp2_session_upgrade2", "nghttp2_session.c", 8195, "stream");
    if (a4)
      *(_DWORD *)(v8 + 212) |= 0x100u;
  }
  return v7;
}

uint64_t nghttp2_session_get_stream_local_close(uint64_t *a1, int a2)
{
  uint64_t v2;

  v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(_BYTE *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5)
    return 0xFFFFFFFFLL;
  else
    return (*(unsigned __int8 *)(v2 + 217) >> 1) & 1;
}

uint64_t nghttp2_session_get_stream_remote_close(uint64_t *a1, int a2)
{
  uint64_t v2;

  v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(_BYTE *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5)
    return 0xFFFFFFFFLL;
  else
    return *(_BYTE *)(v2 + 217) & 1;
}

uint64_t nghttp2_session_get_last_proc_stream_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2812);
}

uint64_t nghttp2_session_find_stream(uint64_t *a1, int a2)
{
  if (a2)
    return nghttp2_map_find(a1, a2);
  else
    return (uint64_t)(a1 + 4);
}

uint64_t nghttp2_session_get_root_stream(uint64_t a1)
{
  return a1 + 32;
}

uint64_t nghttp2_session_check_server_session(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2932);
}

uint64_t nghttp2_session_change_stream_priority(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;

  if (*(_BYTE *)(a1 + 2930) == 1)
    return 0;
  if (!a2)
    return 4294966795;
  if (*a3 == a2)
    return 4294966795;
  v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (!v6)
    return 4294966795;
  v8 = *(_QWORD *)a3;
  v9 = a3[2];
  if (SHIDWORD(v8) < 1)
  {
    v7 = 1;
  }
  else
  {
    if (HIDWORD(v8) < 0x101)
      goto LABEL_13;
    v7 = 256;
  }
  HIDWORD(v8) = v7;
LABEL_13:
  LODWORD(result) = nghttp2_session_reprioritize_stream(a1, v6, (int *)&v8);
  if ((int)result <= -901)
    return result;
  else
    return 0;
}

uint64_t nghttp2_session_create_idle_stream(uint64_t a1, int a2, _DWORD *a3)
{
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  if (*(_BYTE *)(a1 + 2930) == 1)
    return 0;
  if (!a2 || *a3 == a2)
    return 4294966795;
  v7 = (a2 & 1) == (*(_BYTE *)(a1 + 2932) == 0) ? *(_DWORD *)(a1 + 2804) : *(_DWORD *)(a1 + 2808);
  if (v7 >= a2 || nghttp2_map_find((uint64_t *)a1, a2))
    return 4294966795;
  v9 = *(_QWORD *)a3;
  v10 = a3[2];
  if (SHIDWORD(v9) < 1)
  {
    v8 = 1;
  }
  else
  {
    if (HIDWORD(v9) < 0x101)
      goto LABEL_17;
    v8 = 256;
  }
  HIDWORD(v9) = v8;
LABEL_17:
  if (nghttp2_session_open_stream(a1, a2, &v9, 5, 0))
    return 0;
  else
    return 4294966395;
}

uint64_t nghttp2_session_get_hd_inflate_dynamic_table_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2144);
}

uint64_t nghttp2_session_get_hd_deflate_dynamic_table_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1032);
}

uint64_t nghttp2_session_set_user_data(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 2608) = a2;
  return result;
}

uint64_t nghttp2_session_change_extpri_stream_priority(uint64_t a1, int a2, unint64_t *a3, int a4)
{
  unint64_t v6;
  uint64_t v7;
  char v8;

  if (!*(_BYTE *)(a1 + 2932))
    return 4294966777;
  if (*(_BYTE *)(a1 + 2930) != 1)
    return 0;
  if (!a2)
    return 4294966795;
  v6 = *a3;
  v7 = nghttp2_map_find((uint64_t *)a1, a2);
  if (!v7)
    return 4294966795;
  if ((v6 & 0xFFFFFFF8) != 0)
    v8 = 7;
  else
    v8 = v6;
  if (a4)
    *(_BYTE *)(v7 + 216) |= 0x20u;
  return session_update_stream_priority(a1, v7, (v6 >> 25) & 0x80 | v8);
}

uint64_t nghttp2_session_get_extpri_stream_priority(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 2932))
    return 4294966777;
  if (*(_BYTE *)(a1 + 2930) != 1)
    return 0;
  if (!a3)
    return 4294966795;
  v4 = nghttp2_map_find((uint64_t *)a1, a3);
  if (!v4)
    return 4294966795;
  v5 = v4;
  result = 0;
  LODWORD(v5) = *(unsigned __int8 *)(v5 + 220);
  *a2 = v5 & 0x7F;
  a2[1] = v5 >> 7;
  return result;
}

uint64_t nghttp2_increase_local_window_size(int *a1, _DWORD *a2, int *a3, int *a4)
{
  int v4;
  int v6;
  uint64_t result;

  v4 = *a4;
  if (*a4 < 0)
    __assert_rtn("nghttp2_increase_local_window_size", "nghttp2_helper.c", 225, "delta >= 0");
  v6 = *a1;
  if (*a1 > (v4 ^ 0x7FFFFFFF))
    return 4294966772;
  result = 0;
  *a1 = v6 + v4;
  if (*a3 < v4)
    v4 = *a3;
  *a3 -= v4;
  *a2 += v4;
  *a4 -= v4;
  return result;
}

const char *nghttp2_strerror(int a1)
{
  const char *result;

  switch(a1)
  {
    case -537:
      result = "SETTINGS frame contained more than the maximum allowed entries";
      break;
    case -536:
      result = "When a local endpoint expects to receive SETTINGS frame, it receives an other type of frame";
      break;
    case -535:
      result = "Cancel";
      break;
    case -534:
      result = "Internal error";
      break;
    case -533:
      result = "Stream was refused";
      break;
    case -532:
      result = "Violation in HTTP messaging rule";
      break;
    case -531:
      result = "Invalid HTTP header field was received";
      break;
    case -530:
      result = "The current session is closing";
      break;
    case -529:
      result = "DATA or HEADERS frame has already been submitted for the stream";
      break;
    case -528:
      result = "Server push is disabled by peer";
      break;
    case -527:
      result = "Too many inflight SETTINGS";
      break;
    case -526:
      result = "Callback was paused by the application";
      break;
    case -525:
      result = "Insufficient buffer size given to function";
      break;
    case -524:
      result = "Flow control error";
      break;
    case -523:
      result = "Header compression/decompression error";
      break;
    case -522:
      result = "The length of the frame is invalid";
      break;
    case -521:
      result = "The user callback function failed due to the temporal error";
      break;
    case -520:
LABEL_7:
      result = "Unknown error code";
      break;
    case -519:
      result = "Invalid state";
      break;
    case -518:
      result = "Invalid header block";
      break;
    case -517:
      result = "GOAWAY has already been sent";
      break;
    case -516:
      result = "request HEADERS is not allowed";
      break;
    case -515:
      result = "Another DATA frame has already been deferred";
      break;
    case -514:
      result = "Invalid stream state";
      break;
    case -513:
      result = "Stream ID is invalid";
      break;
    case -512:
      result = "The transmission is not allowed for this stream";
      break;
    case -511:
      result = "Stream is closing";
      break;
    case -510:
      result = "Stream was already closed or invalid";
      break;
    case -509:
      result = "No more Stream ID available";
      break;
    case -508:
      result = "Data transfer deferred";
      break;
    case -507:
      result = "EOF";
      break;
    case -506:
      result = "Invalid frame octets";
      break;
    case -505:
      result = "Protocol error";
      break;
    case -504:
      result = "Operation would block";
      break;
    case -503:
      result = "Unsupported SPDY version";
      break;
    case -502:
      result = "Out of buffer space";
      break;
    case -501:
      result = "Invalid argument";
      break;
    default:
      switch(a1)
      {
        case -905:
          result = "Too many CONTINUATION frames following a HEADER frame";
          break;
        case -904:
          result = "Flooding was detected in this HTTP/2 session, and it must be closed";
          break;
        case -903:
          result = "Received bad client magic byte string";
          break;
        case -902:
          result = "The user callback function failed";
          break;
        case -901:
          result = "Out of memory";
          break;
        default:
          if (a1)
            goto LABEL_7;
          result = "Success";
          break;
      }
      break;
  }
  return result;
}

uint64_t nghttp2_check_header_value_rfc9113(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;

  if (!a2)
    return 1;
  v2 = 0;
  v3 = *a1;
  if (v3 != 9 && v3 != 32)
  {
    v2 = 0;
    v4 = a1[a2 - 1];
    if (v4 != 9 && v4 != 32)
    {
      while (VALID_HD_VALUE_CHARS[*a1])
      {
        ++a1;
        if (!--a2)
          return 1;
      }
      return 0;
    }
  }
  return v2;
}

uint64_t nghttp2_check_method(unsigned __int8 *a1, uint64_t a2)
{
  if (a2)
  {
    while (VALID_METHOD_CHARS[*a1])
    {
      ++a1;
      if (!--a2)
        return 1;
    }
  }
  return 0;
}

uint64_t nghttp2_check_path(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2)
    return 1;
  while (VALID_PATH_CHARS[*a1])
  {
    ++a1;
    if (!--a2)
      return 1;
  }
  return 0;
}

uint64_t nghttp2_check_authority(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2)
    return 1;
  while (VALID_AUTHORITY_CHARS[*a1])
  {
    ++a1;
    if (!--a2)
      return 1;
  }
  return 0;
}

const char *nghttp2_http2_strerror(unsigned int a1)
{
  if (a1 > 0xD)
    return "unknown";
  else
    return (&off_1EA9822C0)[a1];
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

