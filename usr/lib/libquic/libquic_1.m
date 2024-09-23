void qlog_abort_internal(char *__format, ...)
{
  uint64_t v1;
  char v2[512];
  va_list v3;
  va_list va;

  va_start(va, __format);
  va_copy(v3, va);
  vsnprintf(v2, 0x200uLL, __format, va);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v1 = _os_log_pack_fill();
    *(_DWORD *)v1 = 136446466;
    *(_QWORD *)(v1 + 4) = "qlog_abort_internal";
    *(_WORD *)(v1 + 12) = 2082;
    *(_QWORD *)(v1 + 14) = v2;
    qlog_internal(OS_LOG_TYPE_ERROR);
  }
  qword_2545F56A8 = (uint64_t)v2;
  __break(1u);
  JUMPOUT(0x20A2727ECLL);
}

uint64_t quic_tp_get_preferred_address(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 1112) & 1) != 0)
      return a1 + 1048;
    else
      return 0;
  }
  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v2 = _os_log_pack_size();
      v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v4 = _os_log_pack_fill();
      *(_DWORD *)v4 = 136446210;
      *(_QWORD *)(v4 + 4) = "quic_tp_get_preferred_address";
      qlog_internal(17, (uint64_t)v3, 1210);
    }
    return 0;
  }
}

BOOL quic_tp_deserialize_rscid(uint64_t a1, void **a2, _WORD *a3, unsigned int a4)
{
  _BOOL8 result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (a4 <= 0x14 && (unsigned __int16)*a3 >= a4)
  {
    *(_QWORD *)(a1 + 72) |= 1uLL;
    if (a4)
    {
      quic_cid_read(*a2, a4, (_BYTE *)(a1 + 8));
      *a2 = (char *)*a2 + a4;
      *a3 -= a4;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v12 = _os_log_pack_size();
      v13 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v14 = _os_log_pack_fill();
      v15 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3 == 2)
        v15 = &quic_cid_describe_cid_buf2;
      if (quic_cid_describe_state % 3)
        v16 = v15;
      else
        v16 = &quic_cid_describe_cid_buf1;
      ++quic_cid_describe_state;
      if (*(unsigned __int8 *)(a1 + 8) >= 0x14u)
        v17 = 20;
      else
        v17 = *(unsigned __int8 *)(a1 + 8);
      *v16 = 0u;
      v16[1] = 0u;
      *(_OWORD *)((char *)v16 + 25) = 0u;
      if ((_DWORD)v17)
      {
        v18 = (unsigned __int8 *)(a1 + 9);
        do
        {
          v19 = *v18++;
          snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v19);
          --v17;
        }
        while (v17);
      }
      *(_DWORD *)v14 = 136446722;
      *(_QWORD *)(v14 + 4) = "quic_tp_deserialize_rscid";
      *(_WORD *)(v14 + 12) = 2082;
      *(_QWORD *)(v14 + 14) = "retry_scid";
      *(_WORD *)(v14 + 22) = 2082;
      *(_QWORD *)(v14 + 24) = v16;
      qlog_internal(2, (uint64_t)v13, 725);
      return 1;
    }
    else
    {
      return 1;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "quic_tp_deserialize_rscid";
    qlog_internal(16, (uint64_t)v8, 713);
    return 0;
  }
  return result;
}

BOOL quic_tp_deserialize_pa(uint64_t a1, void **a2, unsigned __int16 *a3, unsigned int a4)
{
  unsigned int v6;
  _BOOL8 result;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  const void *v18;
  _DWORD *v19;
  unsigned int v20;
  unsigned __int16 v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  const char *v25;
  int v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  _DWORD *v33;
  unsigned int v34;
  unsigned __int16 v35;
  uint64_t v36;
  unsigned __int16 v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  const char *v41;
  int v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  _BYTE v59[10];
  char v60[46];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  if (a4 - 62 >= 0xFFFFFFEB && (v6 = *a3, v6 >= a4))
  {
    if (v6 > 3)
    {
      *(_DWORD *)(a1 + 8) = *(_DWORD *)*a2;
      v18 = (const void *)(a1 + 8);
      v19 = *a2;
      *a2 = (char *)*a2 + 4;
      v20 = (unsigned __int16)(*a3 - 4);
      *a3 -= 4;
      if (v20 <= 1)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          v30 = _os_log_pack_size();
          v31 = &v59[-((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0)];
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v32 = _os_log_pack_fill();
          *(_DWORD *)v32 = 136446210;
          *(_QWORD *)(v32 + 4) = "quic_tp_deserialize_pa";
          v11 = (uint64_t)v31;
          v12 = 773;
          goto LABEL_7;
        }
      }
      else
      {
        *(_WORD *)(a1 + 12) = bswap32(*((unsigned __int16 *)v19 + 2)) >> 16;
        *a2 = (char *)v19 + 6;
        v21 = *a3 - 2;
        *a3 = v21;
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          v22 = _os_log_pack_size();
          v23 = &v59[-((MEMORY[0x24BDAC7A8](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0)];
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v24 = _os_log_pack_fill();
          v25 = inet_ntop(2, v18, v60, 0x2Eu);
          v26 = *(unsigned __int16 *)(a1 + 12);
          *(_DWORD *)v24 = 136446722;
          *(_QWORD *)(v24 + 4) = "quic_tp_deserialize_pa";
          *(_WORD *)(v24 + 12) = 2082;
          *(_QWORD *)(v24 + 14) = v25;
          *(_WORD *)(v24 + 22) = 1024;
          *(_DWORD *)(v24 + 24) = v26;
          qlog_internal(2, (uint64_t)v23, 780);
          v21 = *a3;
        }
        if (v21 > 0xFu)
        {
          *(_OWORD *)(a1 + 14) = *(_OWORD *)*a2;
          v33 = *a2;
          *a2 = (char *)*a2 + 16;
          v34 = (unsigned __int16)(*a3 - 16);
          *a3 -= 16;
          if (v34 <= 1)
          {
            if (qlog_debug_enabled
              || (qlog_nwlog_enabled & 1) != 0
              || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
            {
              v46 = _os_log_pack_size();
              v47 = &v59[-((MEMORY[0x24BDAC7A8](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0)];
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v48 = _os_log_pack_fill();
              *(_DWORD *)v48 = 136446210;
              *(_QWORD *)(v48 + 4) = "quic_tp_deserialize_pa";
              v11 = (uint64_t)v47;
              v12 = 793;
              goto LABEL_7;
            }
            return result;
          }
          *(_WORD *)(a1 + 30) = bswap32(*((unsigned __int16 *)v33 + 8)) >> 16;
          *a2 = (char *)v33 + 18;
          v35 = *a3;
          *a3 -= 2;
          if (v35 == 2)
            return 0;
          v36 = *((unsigned __int8 *)v33 + 18);
          *a2 = (char *)v33 + 19;
          v37 = v35 - 3;
          *a3 = v35 - 3;
          if (qlog_debug_enabled
            || (qlog_nwlog_enabled & 1) != 0
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            v38 = _os_log_pack_size();
            v39 = &v59[-((MEMORY[0x24BDAC7A8](v38, v38) + 15) & 0xFFFFFFFFFFFFFFF0)];
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v40 = _os_log_pack_fill();
            v41 = inet_ntop(30, (const void *)(a1 + 14), v60, 0x2Eu);
            v42 = *(unsigned __int16 *)(a1 + 30);
            *(_DWORD *)v40 = 136446722;
            *(_QWORD *)(v40 + 4) = "quic_tp_deserialize_pa";
            *(_WORD *)(v40 + 12) = 2082;
            *(_QWORD *)(v40 + 14) = v41;
            *(_WORD *)(v40 + 22) = 1024;
            *(_DWORD *)(v40 + 24) = v42;
            qlog_internal(2, (uint64_t)v39, 806);
            v37 = *a3;
          }
          if ((_DWORD)v36)
          {
            if (v36 > v37)
            {
              if (qlog_debug_enabled
                || (qlog_nwlog_enabled & 1) != 0
                || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
              {
                v43 = _os_log_pack_size();
                v44 = &v59[-((MEMORY[0x24BDAC7A8](v43, v43) + 15) & 0xFFFFFFFFFFFFFFF0)];
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                v45 = _os_log_pack_fill();
                *(_DWORD *)v45 = 136446210;
                *(_QWORD *)(v45 + 4) = "quic_tp_deserialize_pa";
                v11 = (uint64_t)v44;
                v12 = 809;
                goto LABEL_7;
              }
              return result;
            }
            quic_cid_read(*a2, v36, (_BYTE *)(a1 + 32));
            if (qlog_debug_enabled
              || (qlog_nwlog_enabled & 1) != 0
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
            {
              v49 = _os_log_pack_size();
              v50 = &v59[-((MEMORY[0x24BDAC7A8](v49, v49) + 15) & 0xFFFFFFFFFFFFFFF0)];
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v51 = _os_log_pack_fill();
              v52 = quic_cid_describe((unsigned __int8 *)(a1 + 32));
              *(_DWORD *)v51 = 136446466;
              *(_QWORD *)(v51 + 4) = "quic_tp_deserialize_pa";
              *(_WORD *)(v51 + 12) = 2082;
              *(_QWORD *)(v51 + 14) = v52;
              qlog_internal(2, (uint64_t)v50, 816);
            }
            *a2 = (char *)*a2 + v36;
            v37 = *a3 - v36;
            *a3 = v37;
          }
          if (v37 > 0xFu)
          {
            *(_OWORD *)(a1 + 53) = *(_OWORD *)*a2;
            if (qlog_debug_enabled
              || (qlog_nwlog_enabled & 1) != 0
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
            {
              v56 = _os_log_pack_size();
              v57 = &v59[-((MEMORY[0x24BDAC7A8](v56, v56) + 15) & 0xFFFFFFFFFFFFFFF0)];
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v58 = _os_log_pack_fill();
              quic_tp_srt_describe((unsigned __int8 *)*a2);
              *(_DWORD *)v58 = 136446466;
              *(_QWORD *)(v58 + 4) = "quic_tp_deserialize_pa";
              *(_WORD *)(v58 + 12) = 2082;
              *(_QWORD *)(v58 + 14) = quic_tp_srt_describe_token_str;
              qlog_internal(2, (uint64_t)v57, 828);
            }
            *a2 = (char *)*a2 + 16;
            *a3 -= 16;
            *(_QWORD *)(a1 + 72) |= 1uLL;
            return 1;
          }
          else if (qlog_debug_enabled
                 || (qlog_nwlog_enabled & 1) != 0
                 || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
          {
            v53 = _os_log_pack_size();
            v54 = &v59[-((MEMORY[0x24BDAC7A8](v53, v53) + 15) & 0xFFFFFFFFFFFFFFF0)];
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v55 = _os_log_pack_fill();
            *(_DWORD *)v55 = 136446210;
            *(_QWORD *)(v55 + 4) = "quic_tp_deserialize_pa";
            v11 = (uint64_t)v54;
            v12 = 822;
            goto LABEL_7;
          }
          return result;
        }
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          v27 = _os_log_pack_size();
          v28 = &v59[-((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0)];
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v29 = _os_log_pack_fill();
          *(_DWORD *)v29 = 136446210;
          *(_QWORD *)(v29 + 4) = "quic_tp_deserialize_pa";
          v11 = (uint64_t)v28;
          v12 = 784;
          goto LABEL_7;
        }
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
    {
      v13 = _os_log_pack_size();
      v14 = &v59[-((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0)];
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v15 = _os_log_pack_fill();
      *(_DWORD *)v15 = 136446210;
      *(_QWORD *)(v15 + 4) = "quic_tp_deserialize_pa";
      v11 = (uint64_t)v14;
      v12 = 765;
      goto LABEL_7;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
  {
    v8 = _os_log_pack_size();
    v9 = &v59[-((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0)];
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446466;
    *(_QWORD *)(v10 + 4) = "quic_tp_deserialize_pa";
    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v10 + 14) = a4;
    v11 = (uint64_t)v9;
    v12 = 761;
LABEL_7:
    qlog_internal(16, v11, v12);
    return 0;
  }
  return result;
}

uint64_t quic_tp_srt_describe(unsigned __int8 *a1)
{
  return snprintf(quic_tp_srt_describe_token_str, 0x21uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
}

void quic_tp_set_original_dcid(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      *(_BYTE *)(a1 + 8) = *(_BYTE *)a2;
      v2 = *(_DWORD *)(a2 + 17);
      *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 1);
      *(_DWORD *)(a1 + 25) = v2;
      *(_QWORD *)(a1 + 72) |= 1uLL;
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_tp_set_original_dcid";
      v6 = (uint64_t)v9;
      v7 = 1097;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_tp_set_original_dcid";
    v6 = (uint64_t)v4;
    v7 = 1096;
LABEL_13:
    qlog_internal(17, v6, v7);
  }
}

void quic_tp_set_retry_scid(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      *(_BYTE *)(a1 + 1288) = *(_BYTE *)a2;
      v2 = *(_DWORD *)(a2 + 17);
      *(_OWORD *)(a1 + 1289) = *(_OWORD *)(a2 + 1);
      *(_DWORD *)(a1 + 1305) = v2;
      *(_QWORD *)(a1 + 1352) |= 1uLL;
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_tp_set_retry_scid";
      v6 = (uint64_t)v9;
      v7 = 1153;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_tp_set_retry_scid";
    v6 = (uint64_t)v4;
    v7 = 1152;
LABEL_13:
    qlog_internal(17, v6, v7);
  }
}

void quic_tp_set_stateless_reset_token(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      *(_OWORD *)(a1 + 168) = *a2;
      *(_QWORD *)(a1 + 232) |= 1uLL;
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136446210;
      *(_QWORD *)(v9 + 4) = "quic_tp_set_stateless_reset_token";
      v5 = (uint64_t)v8;
      v6 = 1182;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_tp_set_stateless_reset_token";
    v5 = (uint64_t)v3;
    v6 = 1181;
LABEL_13:
    qlog_internal(17, v5, v6);
  }
}

_QWORD *qpod_conn_create(NSObject *a1, NSObject *a2, NSObject *a3, NSObject *a4, int a5)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  size_t size;
  char v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  char v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _WORD *v26;
  _WORD *v27;
  __int16 v28;
  __int16 v29;
  uint64_t v30;
  unsigned __int8 *v31;
  unsigned __int8 *v32;
  NSObject *v33;
  char v34;
  _QWORD *result;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  nw_protocol_copy_qpod_definition();
  v10 = quic_conn_allocate();
  v11 = malloc_type_calloc(1uLL, 0x48uLL, 0xEAFB8F1AuLL);
  if (!v11)
  {
    v36 = 72;
    goto LABEL_35;
  }
  v38 = a3;
  v39 = a4;
  *v11 = 0;
  v11[1] = v11;
  v11[3] = 0;
  v11[4] = v11 + 3;
  v11[6] = 0;
  v11[7] = v11 + 6;
  *(_QWORD *)(v10 + 1320) = v11;
  v12 = quic_path_create((uint64_t *)(v10 + 1360), v10, *MEMORY[0x24BDE0898], 0, 0, 1);
  *(_QWORD *)(v10 + 1112) = v12;
  size = dispatch_data_get_size(a1);
  if (size <= 0x14 && (v14 = size, quic_dispatch_data_copyout(a1, v12 + 39, 20) == size))
  {
    *(_BYTE *)(v12 + 38) = v14;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
  {
    v15 = _os_log_pack_size();
    v16 = (char *)&v37 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136446210;
    *(_QWORD *)(v17 + 4) = "qpod_conn_create";
    qlog_internal(16, (uint64_t)v16, 68);
  }
  v18 = *(_QWORD *)(v10 + 1112);
  v19 = dispatch_data_get_size(a2);
  if (v19 <= 0x14 && (v20 = v19, quic_dispatch_data_copyout(a2, v18 + 18, 20) == v19))
  {
    *(_BYTE *)(v18 + 17) = v20;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
  {
    v21 = _os_log_pack_size();
    v22 = (char *)&v37 - ((MEMORY[0x24BDAC7A8](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136446210;
    *(_QWORD *)(v23 + 4) = "qpod_conn_create";
    qlog_internal(16, (uint64_t)v22, 72);
  }
  v24 = *(_QWORD *)(v10 + 1320);
  v25 = malloc_type_calloc(1uLL, 0x60uLL, 0xEAFB8F1AuLL);
  if (!v25)
  {
    v36 = 96;
    goto LABEL_35;
  }
  *v25 = v24;
  v25[1] = v24 + 24;
  v25[4] = 0;
  v25[5] = v25 + 4;
  v25[6] = 0;
  v25[7] = v25 + 6;
  v25[8] = 0;
  v25[9] = v25 + 8;
  *(_QWORD *)(v10 + 560) = v25;
  quic_packet_builder_set_version((uint64_t)v25, 1u);
  v26 = malloc_type_calloc(1uLL, 0x40uLL, 0xEAFB8F1AuLL);
  if (!v26)
  {
    v36 = 64;
    goto LABEL_35;
  }
  v27 = v26;
  if (*(_QWORD *)v10)
    nw_protocol_instance_ignore_future_path_changes();
  v28 = v27[29];
  if (a5)
    v29 = 64;
  else
    v29 = 0;
  *((_QWORD *)v27 + 2) = -1;
  *((_QWORD *)v27 + 3) = -1;
  *((_QWORD *)v27 + 4) = v10;
  *((_DWORD *)v27 + 11) = 0;
  v27[29] = v28 & 0xFBBF | v29;
  *((_QWORD *)v27 + 6) = 0;
  *(_QWORD *)(v10 + 1120) = v27;
  *(_QWORD *)(v10 + 960) = quic_ack_alloc();
  v30 = *(_QWORD *)(v10 + 1112);
  v31 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0xC98uLL, 0xEAFB8F1AuLL);
  v32 = v31;
  v33 = v39;
  if (a5)
  {
    if (v31)
    {
      v34 = 0;
      goto LABEL_28;
    }
LABEL_33:
    v36 = 3224;
    goto LABEL_35;
  }
  if (!v31)
    goto LABEL_33;
  v34 = 1;
LABEL_28:
  v31[3216] = v34;
  quic_protector_derive_initial_secrets((uint64_t)v31, (unsigned __int8 *)(v30 + 17));
  *((_QWORD *)v32 + 400) = 0;
  *((_QWORD *)v32 + 401) = v32 + 3200;
  *(_QWORD *)(v10 + 568) = v32;
  *(_BYTE *)(v10 + 477) = 9;
  *(_WORD *)(v10 + 588) = 2000;
  quic_protector_qpod_key_update(v32, v33, a5);
  quic_protector_qpod_key_update(*(unsigned __int8 **)(v10 + 568), v38, a5 ^ 1);
  result = malloc_type_calloc(1uLL, 8uLL, 0xEAFB8F1AuLL);
  if (!result)
  {
    v36 = 8;
LABEL_35:
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v36);
  }
  *result = v10;
  return result;
}

void qpod_conn_free(uint64_t *a1)
{
  int v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = nw_protocol_copy_qpod_definition();
  v3 = *a1;
  quic_conn_dealloc_globals(v2, *(_QWORD **)(*a1 + 1320));
  v4 = *(_QWORD **)(v3 + 560);
  if (v4)
  {
    quic_packet_builder_destroy(v4);
    *(_QWORD *)(v3 + 560) = 0;
  }
  _quic_migration_destroy(*(void ***)(v3 + 1120));
  *(_QWORD *)(v3 + 1120) = 0;
  _quic_ack_destroy(*(_QWORD **)(v3 + 960));
  *(_QWORD *)(v3 + 960) = 0;
  _quic_path_destroy(v3 + 1360, (_QWORD *)v3, *(_QWORD **)(v3 + 1112));
  *(_QWORD *)(v3 + 1112) = 0;
  quic_conn_deallocate(v5, v3);
  free(a1);
}

BOOL qpod_conn_encode_datagram(uint64_t *a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  __int16 v12;
  __int16 tag_size;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  uint64_t v17;
  unsigned __int16 v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _BOOL8 v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char v35[2000];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = *a1;
  v7 = nw_frame_create();
  if (!v7)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      v31 = _os_log_pack_size();
      v32 = &v35[-((MEMORY[0x24BDAC7A8](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v33 = _os_log_pack_fill();
      *(_DWORD *)v33 = 136446210;
      *(_QWORD *)(v33 + 4) = "qpod_conn_encode_datagram";
      qlog_internal(16, (uint64_t)v32, 147);
    }
    return 0;
  }
  if (*(_BYTE *)(v6 + 477) != 9)
    return 0;
  v8 = (void *)v7;
  v9 = *(_QWORD *)(v6 + 568);
  if (!v9)
    qlog_abort_internal("%s null protector", "quic_protector_get_pn");
  v10 = *(_DWORD *)(v9 + 3192);
  v11 = (39 - __clz(v10)) >> 3;
  v12 = a3 + 1;
  tag_size = quic_protector_get_tag_size(v9, 4u);
  v14 = tag_size;
  if (v10)
    v15 = v11;
  else
    v15 = 1;
  v16 = tag_size + v12 + v15;
  if (((v16 - 4) & 0xFFF0) == 0)
    quic_frame_alloc_PADDING(*(_QWORD *)(v6 + 560), (__int16)(20 - v16), 3u, 0, 0);
  v17 = *(_QWORD *)(v6 + 560);
  v18 = nw_frame_unclaimed_length();
  quic_frame_alloc_DATAGRAM(v17, v18, -5, 0, 0, (uint64_t)v8, 1);
  bzero(v35, 0x7D0uLL);
  v19 = quic_packet_builder_calculate_size(*(_QWORD *)(v6 + 560), *(_QWORD *)(v6 + 568), 4u, *(_QWORD *)(v6 + 1112), 0, 0, 0x7D0u);
  v20 = *(_QWORD *)(v6 + 560);
  v21 = *(_QWORD *)(v6 + 1112);
  v22 = quic_packet_create(*(_QWORD *)(v20 + 8));
  if (!_quic_packet_builder_assemble(v20, v6, 4, v21, 0, 0, v35, v19, v14, (uint64_t)v22))
  {
    _quic_packet_destroy(v22);
LABEL_14:
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      v24 = _os_log_pack_size();
      v25 = &v35[-((MEMORY[0x24BDAC7A8](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v26 = _os_log_pack_fill();
      *(_DWORD *)v26 = 136446210;
      *(_QWORD *)(v26 + 4) = "qpod_conn_encode_datagram";
      qlog_internal(16, (uint64_t)v25, 209);
    }
    v23 = 0;
    goto LABEL_24;
  }
  if (!v22)
    goto LABEL_14;
  v23 = quic_protector_seal(*(_QWORD *)(v6 + 568), (uint64_t)v22);
  if (v23)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(a4 + 16))(a4, v35, (unsigned __int16)(v19 + v14));
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
  {
    v27 = _os_log_pack_size();
    v28 = &v35[-((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136446210;
    *(_QWORD *)(v29 + 4) = "qpod_conn_encode_datagram";
    qlog_internal(16, (uint64_t)v28, 205);
  }
  _quic_packet_destroy(v22);
LABEL_24:
  nw_release(v8);
  return v23;
}

uint64_t qpod_datagram_frame_finalizer()
{
  return nw_frame_reset();
}

uint64_t qpod_conn_decode_datagram(uint64_t *a1, unsigned __int8 *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  unsigned __int8 **v7;
  __int128 v8;
  unsigned __int8 **v9;
  unsigned __int8 *v10;
  char v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  __int128 v23;
  __int16 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v24 = 0;
  if (*(_BYTE *)(v4 + 477) != 9)
  {
LABEL_25:
    v11 = 0;
    return v11 & 1;
  }
  v7 = quic_packet_parser(v4, *(_QWORD *)(v4 + 1112), a2, a3, 0, (uint64_t *)&v24);
  if (!v7 || (v9 = v7, (*((_BYTE *)v7 + 233) & 4) != 0))
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      v16 = _os_log_pack_size();
      v17 = (char *)&v23 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v18 = _os_log_pack_fill();
      *(_DWORD *)v18 = 136446210;
      *(_QWORD *)(v18 + 4) = "qpod_conn_decode_datagram";
      qlog_internal(16, (uint64_t)v17, 232);
    }
    if (*(_QWORD *)(v4 + 1280) >= 0x10000uLL)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      {
        v19 = _os_log_pack_size();
        v20 = (char *)&v23 - ((MEMORY[0x24BDAC7A8](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v21 = _os_log_pack_fill();
        *(_DWORD *)v21 = 136446210;
        *(_QWORD *)(v21 + 4) = "qpod_conn_decode_datagram";
        qlog_internal(16, (uint64_t)v20, 236);
      }
      *(_BYTE *)(v4 + 477) = 11;
      (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(a4 + 16))(a4, a2, 0xFFFFLL);
    }
    goto LABEL_25;
  }
  v10 = v7[19];
  if (v10)
  {
    v11 = 0;
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(_QWORD *)&v8 = 136446466;
    v23 = v8;
    do
    {
      if (*(_QWORD *)v10 == 48 && (v11 & 1) == 0)
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD))(a4 + 16))(a4, *((_QWORD *)v10 + 6), *((unsigned __int16 *)v10 + 20));
        v11 = 1;
      }
      else if (*(_QWORD *)v10
             && (qlog_debug_enabled
              || (qlog_nwlog_enabled & 1) != 0
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
      {
        v12 = _os_log_pack_size();
        v13 = (char *)&v23 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
        v14 = _os_log_pack_fill();
        v15 = *(_QWORD *)v10;
        *(_DWORD *)v14 = v23;
        *(_QWORD *)(v14 + 4) = "qpod_conn_decode_datagram";
        *(_WORD *)(v14 + 12) = 2048;
        *(_QWORD *)(v14 + 14) = v15;
        qlog_internal(17, (uint64_t)v13, 250);
      }
      v10 = (unsigned __int8 *)*((_QWORD *)v10 + 12);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  _quic_packet_destroy(v9);
  return v11 & 1;
}

void cubic_process_ecn(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unsigned int a8, unint64_t a9, void *a10)
{
  _QWORD *v10;
  unint64_t v18;
  char v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v23 = _os_log_pack_size();
    v24 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v25 = _os_log_pack_fill();
    *(_DWORD *)v25 = 136446210;
    *(_QWORD *)(v25 + 4) = "cubic_process_ecn";
    v26 = (uint64_t)v24;
    v27 = 423;
LABEL_23:
    qlog_internal(17, v26, v27);
    return;
  }
  v10 = *(_QWORD **)(a1 + 8);
  if (!v10)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v28 = _os_log_pack_size();
    v29 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v30 = _os_log_pack_fill();
    *(_DWORD *)v30 = 136446210;
    *(_QWORD *)(v30 + 4) = "cubic_process_ecn";
    v26 = (uint64_t)v29;
    v27 = 424;
    goto LABEL_23;
  }
  v18 = v10[4];
  if (v18 > a3
    && (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    v31 = _os_log_pack_size();
    v32 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v33 = _os_log_pack_fill();
    v34 = v10[4];
    *(_DWORD *)v33 = 136446722;
    *(_QWORD *)(v33 + 4) = "cubic_process_ecn";
    *(_WORD *)(v33 + 12) = 2048;
    *(_QWORD *)(v33 + 14) = a3;
    *(_WORD *)(v33 + 22) = 2048;
    *(_QWORD *)(v33 + 24) = v34;
    qlog_internal(17, (uint64_t)v32, 432);
    v18 = v10[4];
  }
  v10[2] = a4;
  v10[3] = a3;
  if (v18 != a3)
  {
    v19 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled)
        v19 = 1;
      if ((v19 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v35 = _os_log_pack_size();
        v36 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v37 = _os_log_pack_fill();
        v38 = v10[11];
        v39 = a3 - v10[4];
        *(_DWORD *)v37 = 136446722;
        *(_QWORD *)(v37 + 4) = "cubic_process_ecn";
        *(_WORD *)(v37 + 12) = 2048;
        *(_QWORD *)(v37 + 14) = v38;
        *(_WORD *)(v37 + 22) = 2048;
        *(_QWORD *)(v37 + 24) = v39;
        qlog_internal(2, (uint64_t)v36, 450);
      }
    }
    v10[4] = a3;
    v10[11] = 0;
    v20 = v10[5];
    if (v20)
      v21 = v20 >= a6;
    else
      v21 = 0;
    if (!v21)
    {
      cubic_cong_event((uint64_t)v10, a7, a8, 0, a10);
      if (a2)
      {
        v22 = 1000000 * (v10[7] << (v10[7] < v10[8])) / a9;
        *(_QWORD *)(a2 + 24) = v22;
        *(_DWORD *)(a2 + 40) = v22 >> 10;
      }
      v10[5] = a5;
    }
  }
}

void cubic_link_flow_controlled(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
    {
      cubic_cong_event(*(_QWORD *)(a1 + 8), a2, a3, 0, a4);
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v5 = _os_log_pack_size();
        v6 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v7 = _os_log_pack_fill();
        v8 = *(_QWORD *)(v4 + 56);
        *(_DWORD *)v7 = 136446466;
        *(_QWORD *)(v7 + 4) = "cubic_link_flow_controlled";
        *(_WORD *)(v7 + 12) = 2048;
        *(_QWORD *)(v7 + 14) = v8;
        v9 = 2;
        v10 = (uint64_t)v6;
        v11 = 490;
LABEL_7:
        qlog_internal(v9, v10, v11);
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v17 = _os_log_pack_fill();
      *(_DWORD *)v17 = 136446210;
      *(_QWORD *)(v17 + 4) = "cubic_link_flow_controlled";
      v9 = 17;
      v10 = (uint64_t)v16;
      v11 = 483;
      goto LABEL_7;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "cubic_link_flow_controlled";
    v9 = 17;
    v10 = (uint64_t)v13;
    v11 = 482;
    goto LABEL_7;
  }
}

void cubic_persistent_congestion(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v3;
  unint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "cubic_persistent_congestion";
    v11 = (uint64_t)v9;
    v12 = 530;
LABEL_16:
    qlog_internal(17, v11, v12);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "cubic_persistent_congestion";
    v11 = (uint64_t)v14;
    v12 = 531;
    goto LABEL_16;
  }
  v5 = 2 * a2;
  v6 = (double)*(unint64_t *)(v3 + 56) * 0.7;
  if (v5 <= (unint64_t)v6)
    v7 = (unint64_t)v6;
  else
    v7 = v5;
  *(_QWORD *)(v3 + 56) = v5;
  *(_QWORD *)(v3 + 64) = v7;
  quic_cc_log_update(a3, v5, -1, v7);
  if (a3)
  {
    v16[0] = a3;
    objc_msgSend(v16[0], "logCongestionStateUpdated:new_state:trigger:", 5, 0, 0);

  }
}

void cubic_idle_timeout(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v11 = _os_log_pack_size();
    v12 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "cubic_idle_timeout";
    v14 = (uint64_t)v12;
    v15 = 569;
LABEL_26:
    qlog_internal(17, v14, v15);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v16 = _os_log_pack_size();
    v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136446210;
    *(_QWORD *)(v18 + 4) = "cubic_idle_timeout";
    v14 = (uint64_t)v17;
    v15 = 570;
    goto LABEL_26;
  }
  v4 = *(_QWORD *)(v3 + 56);
  v5 = (unint64_t)((double)v4 * 0.7);
  LODWORD(v6) = 10 * a2;
  v7 = 2 * a2;
  if ((2 * a2) <= 0x3980)
    v7 = 14720;
  if (v6 >= v7)
    v6 = v7;
  else
    v6 = v6;
  if (v5 <= v6)
    v5 = v6;
  if (v5 <= *(_QWORD *)(v3 + 64))
    v8 = *(_QWORD *)(v3 + 64);
  else
    v8 = v5;
  if (v4 >= v6)
    v9 = v6;
  else
    v9 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v9;
  *(_QWORD *)(v3 + 64) = v8;
  quic_cc_log_update(a3, v9, -1, v8);
  *(_DWORD *)(v3 + 160) = 0;
  *(_QWORD *)(v3 + 152) = 0;
  *(_QWORD *)(v3 + 168) = 0;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_QWORD *)(v3 + 200) = 0;
  *(_QWORD *)(v3 + 208) = 0;
  v10 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 184) = 0;
  *(_QWORD *)(v3 + 192) = v10;
  *(_BYTE *)(v3 + 144) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_QWORD *)(v3 + 128) = 0;
}

uint64_t cubic_get_cwnd(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "cubic_get_cwnd";
    v6 = (uint64_t)v4;
    v7 = 606;
    goto LABEL_13;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "cubic_get_cwnd";
    v6 = (uint64_t)v9;
    v7 = 607;
LABEL_13:
    qlog_internal(17, v6, v7);
    return 0;
  }
  return *(_QWORD *)(v1 + 56);
}

void cubic_switch(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4;
  unint64_t cwnd;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v12 = _os_log_pack_size();
    v13 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "cubic_switch";
    v15 = (uint64_t)v13;
    v16 = 688;
LABEL_19:
    qlog_internal(17, v15, v16);
    return;
  }
  v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v17 = _os_log_pack_size();
    v18 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "cubic_switch";
    v15 = (uint64_t)v18;
    v16 = 689;
    goto LABEL_19;
  }
  *(_QWORD *)(v4 + 48) = quic_cc_get_bytes_in_flight(a2);
  cwnd = quic_cc_get_cwnd(a2);
  v9 = 10 * a3;
  v10 = 2 * a3;
  if ((2 * a3) <= 0x3980)
    v10 = 14720;
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  if (cwnd > v11)
    v11 = quic_cc_get_cwnd(a2);
  *(_QWORD *)(v4 + 56) = v11;
  *(_QWORD *)(v4 + 64) = 0xFFFFFFFFLL;
  *(_DWORD *)(v4 + 160) = 0;
  *(_QWORD *)(v4 + 152) = 0;
  *(_QWORD *)(v4 + 168) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  *(_QWORD *)(v4 + 200) = 0;
  *(_QWORD *)(v4 + 208) = 0;
  *(_QWORD *)(v4 + 184) = 0;
  *(_QWORD *)(v4 + 192) = v11;
  *(_BYTE *)(v4 + 144) = 0;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_QWORD *)(v4 + 128) = 0;
  quic_cc_log_update(a4, v11, -1, 0xFFFFFFFFLL);
}

void __quic_cc_ledbat_identifier_block_invoke()
{
  qword_253D0A710 = 0;
  unk_253D0A718 = 0;
  qword_253D0A700 = *(_QWORD *)"ledbat++";
  *(_QWORD *)&byte_253D0A708 = 0;
  qword_253D0A670 = (uint64_t)ledbat_packet_sent;
  unk_253D0A678 = ledbat_packet_discarded;
  qword_253D0A680 = (uint64_t)ledbat_packet_acked;
  unk_253D0A688 = ledbat_ack_begin;
  qword_253D0A690 = (uint64_t)ledbat_ack_end;
  unk_253D0A698 = ledbat_packets_lost;
  qword_253D0A6A0 = (uint64_t)ledbat_process_ecn;
  unk_253D0A6A8 = ledbat_link_flow_controlled;
  qword_253D0A6B0 = (uint64_t)ledbat_process_link_congestion_info;
  unk_253D0A6B8 = ledbat_spurious_rxmt;
  qword_253D0A6C0 = (uint64_t)ledbat_persistent_congestion;
  unk_253D0A6C8 = ledbat_idle_timeout;
  qword_253D0A6D0 = (uint64_t)ledbat_can_send_packet;
  unk_253D0A6D8 = ledbat_get_cwnd;
  qword_253D0A6E0 = (uint64_t)ledbat_get_allowed_cwnd;
  unk_253D0A6E8 = ledbat_get_bytes_in_flight;
  quic_cc_ledbat_identifier_ledbat = (uint64_t)ledbat_create;
  *(_QWORD *)algn_253D0A658 = ledbat_init;
  qword_253D0A6F0 = (uint64_t)ledbat_switch;
  unk_253D0A6F8 = ledbat_fillout_data_transfer_snapshot;
  qword_253D0A660 = (uint64_t)ledbat_destroy;
  unk_253D0A668 = ledbat_mss_changed;
}

void ledbat_mss_changed(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v4 = _os_log_pack_size();
    v5 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "ledbat_mss_changed";
    v7 = (uint64_t)v5;
    v8 = 97;
LABEL_15:
    qlog_internal(17, v7, v8);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v9 = _os_log_pack_size();
    v10 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136446210;
    *(_QWORD *)(v11 + 4) = "ledbat_mss_changed";
    v7 = (uint64_t)v10;
    v8 = 98;
    goto LABEL_15;
  }
  if (*(_QWORD *)(v3 + 56) <= (unint64_t)a2)
    a2 = a2;
  else
    a2 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 56) = a2;
  quic_cc_log_update(a3, a2, -1, -1);
}

void ledbat_packet_sent(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      quic_cc_inc_bytes_in_flight(v3 + 16, a2);
      if (a3)
      {
        v5 = *(_QWORD *)(v3 + 48);
        LOBYTE(v14) = -1;
        v15[0] = a3;
        objc_msgSend(v15[0], "metricsUpdated:smoothed_rtt:latest_rtt:rtt_variance:pto_count:congestion_window:bytes_in_flight:ssthresh:packets_in_flight:in_recovery:", -1, -1, -1, -1, -1, -1, v5, -1, -1, v14);

      }
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v13 = _os_log_pack_fill();
      *(_DWORD *)v13 = 136446210;
      *(_QWORD *)(v13 + 4) = "ledbat_packet_sent";
      v9 = (uint64_t)v12;
      v10 = 112;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "ledbat_packet_sent";
    v9 = (uint64_t)v7;
    v10 = 111;
LABEL_13:
    qlog_internal(17, v9, v10);
  }
}

void ledbat_packet_discarded(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      quic_cc_dec_bytes_in_flight(v3 + 16, a2);
      if (a3)
      {
        v5 = *(_QWORD *)(v3 + 48);
        LOBYTE(v14) = -1;
        v15[0] = a3;
        objc_msgSend(v15[0], "metricsUpdated:smoothed_rtt:latest_rtt:rtt_variance:pto_count:congestion_window:bytes_in_flight:ssthresh:packets_in_flight:in_recovery:", -1, -1, -1, -1, -1, -1, v5, -1, -1, v14);

      }
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v13 = _os_log_pack_fill();
      *(_DWORD *)v13 = 136446210;
      *(_QWORD *)(v13 + 4) = "ledbat_packet_discarded";
      v9 = (uint64_t)v12;
      v10 = 307;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "ledbat_packet_discarded";
    v9 = (uint64_t)v7;
    v10 = 306;
LABEL_13:
    qlog_internal(17, v9, v10);
  }
}

void ledbat_ack_begin(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 8);
    if (v1)
    {
      *(_QWORD *)(v1 + 88) = 0;
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136446210;
      *(_QWORD *)(v9 + 4) = "ledbat_ack_begin";
      v5 = (uint64_t)v8;
      v6 = 125;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "ledbat_ack_begin";
    v5 = (uint64_t)v3;
    v6 = 124;
LABEL_13:
    qlog_internal(17, v5, v6);
  }
}

void ledbat_ack_end(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, char a5, void *a6)
{
  uint64_t v6;
  unint64_t smoothed_rtt;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  unint64_t v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v40 = _os_log_pack_size();
    v41 = (char *)v51 - ((MEMORY[0x24BDAC7A8](v40, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v42 = _os_log_pack_fill();
    *(_DWORD *)v42 = 136446210;
    *(_QWORD *)(v42 + 4) = "ledbat_ack_end";
    v43 = (uint64_t)v41;
    v44 = 157;
LABEL_58:
    qlog_internal(17, v43, v44);
    return;
  }
  v6 = *(_QWORD *)(a1 + 8);
  if (!v6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v45 = _os_log_pack_size();
    v46 = (char *)v51 - ((MEMORY[0x24BDAC7A8](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v47 = _os_log_pack_fill();
    *(_DWORD *)v47 = 136446210;
    *(_QWORD *)(v47 + 4) = "ledbat_ack_end";
    v43 = (uint64_t)v46;
    v44 = 158;
    goto LABEL_58;
  }
  if ((a5 & 1) != 0 || !*(_QWORD *)(v6 + 88))
    return;
  smoothed_rtt = quic_rtt_get_smoothed_rtt(a2);
  if (!quic_cc_is_validated((_QWORD *)(v6 + 16), smoothed_rtt))
  {
    *(_QWORD *)(v6 + 88) = 0;
    return;
  }
  v11 = *(_QWORD *)(a2 + 128);
  if (v11 == 0xFFFFFFFF || (v12 = *(_QWORD *)(a2 + 8), v13 = v12 - v11, v12 < v11))
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v48 = _os_log_pack_size();
    v49 = (char *)v51 - ((MEMORY[0x24BDAC7A8](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v50 = _os_log_pack_fill();
    *(_DWORD *)v50 = 136446210;
    *(_QWORD *)(v50 + 4) = "ledbat_ack_end";
    v43 = (uint64_t)v49;
    v44 = 184;
    goto LABEL_58;
  }
  v14 = mach_continuous_time();
  if (timebase_info_once != -1)
    dispatch_once(&timebase_info_once, &__block_literal_global_397);
  v15 = timebase_info_info * v14 / dword_253D0A9BC / 0x3E8;
  v16 = *(_QWORD *)(v6 + 160);
  if (v16 - 1 >= v15)
    goto LABEL_18;
  if (!*(_QWORD *)(v6 + 168))
  {
    *(_QWORD *)(v6 + 168) = v15;
    ++*(_DWORD *)(v6 + 184);
  }
  if (v15 >= v16 + 2 * smoothed_rtt)
  {
LABEL_18:
    v20 = *(_QWORD *)(v6 + 56);
    v19 = *(_QWORD *)(v6 + 64);
    if (v20 < v19 && (*(_DWORD *)(v6 + 184) || v13 <= 0xAFC7))
    {
      v36 = ceil(120000.0 / (double)v11);
      v37 = 1.0 / v36;
      v30 = v36 <= 16.0;
      v38 = 0.0625;
      if (v30)
        v38 = v37;
      v32 = v20 + (unint64_t)(fmin((double)*(unint64_t *)(v6 + 88), (double)(int)(10 * a4)) * v38);
      *(_QWORD *)(v6 + 56) = v32;
      if (v16)
        *(_QWORD *)(v6 + 160) = 0;
    }
    else
    {
      if (!v16)
      {
        if (v19 >= v20)
          v19 = *(_QWORD *)(v6 + 56);
        v22 = *(_QWORD *)(v6 + 168);
        v21 = *(_QWORD *)(v6 + 176);
        if (v21)
          v23 = 1;
        else
          v23 = *(_DWORD *)(v6 + 184) == 0;
        *(_QWORD *)(v6 + 64) = v19;
        if (v23)
          v24 = v21;
        else
          v24 = v15;
        v25 = v24 - v22;
        v23 = v25 == 0;
        v26 = 9 * v25;
        v27 = 2 * smoothed_rtt;
        if (!v23)
          v27 = 0;
        *(_QWORD *)(v6 + 168) = 0;
        *(_QWORD *)(v6 + 176) = 0;
        *(_QWORD *)(v6 + 160) = v26 + v15 + v27;
      }
      if (v13 >> 5 > 0x752)
      {
        v33 = fmin((double)v13 * 0.0000166666667 + -1.0, 0.5);
        v34 = *(_QWORD *)(v6 + 88);
        if (v34 >= v20)
          v34 = v20;
        v35 = v33 * (double)v34;
        v32 = v20 - (unint64_t)v35;
        if (v19 >= v32)
          v19 = v20 - (unint64_t)v35;
        *(_QWORD *)(v6 + 56) = v32;
        *(_QWORD *)(v6 + 64) = v19;
      }
      else
      {
        v28 = ceil(120000.0 / (double)v11);
        v29 = 1.0 / v28;
        v30 = v28 <= 16.0;
        v31 = 0.0625;
        if (v30)
          v31 = v29;
        v32 = v20 + (unint64_t)(v31 * ((double)a4 * (double)*(unint64_t *)(v6 + 88)) / (double)v20);
        *(_QWORD *)(v6 + 56) = v32;
      }
    }
    v39 = 2 * a4;
    if (v32 < v39)
    {
      if (v19 <= v39)
        v19 = 2 * a4;
      *(_QWORD *)(v6 + 56) = v39;
      *(_QWORD *)(v6 + 64) = v19;
      v32 = 2 * a4;
    }
    quic_cc_log_update(a6, v32, *(_QWORD *)(v6 + 48), v19);
  }
  else
  {
    v17 = *(_QWORD *)(v6 + 56);
    v18 = 2 * a4;
    if (v17 > v18)
    {
      *(_QWORD *)(v6 + 56) = v18;
      *(_QWORD *)(v6 + 64) = v17;
    }
  }
}

void ledbat_packet_acked(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v7 = _os_log_pack_size();
    v8 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "ledbat_packet_acked";
    v10 = 17;
    v11 = (uint64_t)v8;
    v12 = 135;
LABEL_21:
    qlog_internal(v10, v11, v12);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "ledbat_packet_acked";
    v10 = 17;
    v11 = (uint64_t)v14;
    v12 = 136;
    goto LABEL_21;
  }
  quic_cc_dec_bytes_in_flight(v3 + 16, a2);
  if (*(_QWORD *)(v3 + 80) < a3)
  {
    *(_QWORD *)(v3 + 88) += a2;
    return;
  }
  v6 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled || qlog_nwlog_enabled)
  {
    if (qlog_debug_enabled)
      v6 = 1;
    if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v16 = _os_log_pack_size();
      v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v18 = _os_log_pack_fill();
      *(_DWORD *)v18 = 136446210;
      *(_QWORD *)(v18 + 4) = "ledbat_packet_acked";
      v10 = 2;
      v11 = (uint64_t)v17;
      v12 = 144;
      goto LABEL_21;
    }
  }
}

void ledbat_packets_lost(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned int a5, uint64_t a6, _BYTE *a7, void *a8)
{
  uint64_t v8;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v20 = _os_log_pack_size();
    v21 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136446210;
    *(_QWORD *)(v22 + 4) = "ledbat_packets_lost";
    v23 = (uint64_t)v21;
    v24 = 340;
LABEL_27:
    qlog_internal(17, v23, v24);
    return;
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (!v8)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v25 = _os_log_pack_size();
    v26 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136446210;
    *(_QWORD *)(v27 + 4) = "ledbat_packets_lost";
    v23 = (uint64_t)v26;
    v24 = 341;
    goto LABEL_27;
  }
  quic_cc_dec_bytes_in_flight(v8 + 16, a3);
  if (*(_QWORD *)(v8 + 80) < a4)
  {
    if (a7)
      *a7 = 1;
    v13 = mach_continuous_time();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    v14 = timebase_info_info * v13 / dword_253D0A9BC / 0x3E8;
    v15 = *(_QWORD *)(v8 + 56);
    if (!quic_cc_cwnd_validated((_QWORD *)(v8 + 16)))
    {
      if (*(_QWORD *)(v8 + 120) <= *(_QWORD *)(v8 + 48))
        v15 = *(_QWORD *)(v8 + 48);
      else
        v15 = *(_QWORD *)(v8 + 120);
    }
    v16 = *(_QWORD *)(v8 + 48);
    *(_QWORD *)(v8 + 152) = *(_QWORD *)(v8 + 56);
    v17 = (double)v15 * 0.5;
    if (2 * (unint64_t)a5 > (unint64_t)v17)
      v18 = 2 * a5;
    else
      v18 = (unint64_t)v17;
    *(_QWORD *)(v8 + 72) = *(_QWORD *)(v8 + 64);
    *(_QWORD *)(v8 + 80) = v14;
    *(_QWORD *)(v8 + 56) = v18;
    *(_QWORD *)(v8 + 64) = v18;
    quic_cc_log_update(a8, v18, v16, v18);
    if (a8)
    {
      v19 = a8;
      objc_msgSend(v19, "logCongestionStateUpdated:new_state:trigger:", 5, 3, 2);

    }
    *(_BYTE *)(v8 + 144) = 0;
    *(_OWORD *)(v8 + 96) = 0u;
    *(_OWORD *)(v8 + 112) = 0u;
  }
}

void ledbat_process_ecn(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unsigned int a8, uint64_t a9, void *a10)
{
  uint64_t v10;
  unint64_t v17;
  char v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v27 = _os_log_pack_size();
    v28 = (char *)v44 - ((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136446210;
    *(_QWORD *)(v29 + 4) = "ledbat_process_ecn";
    v30 = (uint64_t)v28;
    v31 = 357;
LABEL_33:
    qlog_internal(17, v30, v31);
    return;
  }
  v10 = *(_QWORD *)(a1 + 8);
  if (!v10)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v32 = _os_log_pack_size();
    v33 = (char *)v44 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136446210;
    *(_QWORD *)(v34 + 4) = "ledbat_process_ecn";
    v30 = (uint64_t)v33;
    v31 = 358;
    goto LABEL_33;
  }
  v17 = *(_QWORD *)(v10 + 32);
  if (v17 > a3
    && (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    v35 = _os_log_pack_size();
    v36 = (char *)v44 - ((MEMORY[0x24BDAC7A8](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v37 = _os_log_pack_fill();
    v38 = *(_QWORD *)(v10 + 32);
    *(_DWORD *)v37 = 136446722;
    *(_QWORD *)(v37 + 4) = "ledbat_process_ecn";
    *(_WORD *)(v37 + 12) = 2048;
    *(_QWORD *)(v37 + 14) = a3;
    *(_WORD *)(v37 + 22) = 2048;
    *(_QWORD *)(v37 + 24) = v38;
    qlog_internal(17, (uint64_t)v36, 365);
    v17 = *(_QWORD *)(v10 + 32);
  }
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a3;
  if (v17 != a3)
  {
    v18 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled)
        v18 = 1;
      if ((v18 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v39 = _os_log_pack_size();
        v40 = (char *)v44 - ((MEMORY[0x24BDAC7A8](v39, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v41 = _os_log_pack_fill();
        v42 = *(_QWORD *)(v10 + 88);
        v43 = a3 - *(_QWORD *)(v10 + 32);
        *(_DWORD *)v41 = 136446722;
        *(_QWORD *)(v41 + 4) = "ledbat_process_ecn";
        *(_WORD *)(v41 + 12) = 2048;
        *(_QWORD *)(v41 + 14) = v42;
        *(_WORD *)(v41 + 22) = 2048;
        *(_QWORD *)(v41 + 24) = v43;
        qlog_internal(2, (uint64_t)v40, 384);
      }
    }
    *(_QWORD *)(v10 + 32) = a3;
    *(_QWORD *)(v10 + 88) = 0;
    v19 = *(_QWORD *)(v10 + 40);
    if (v19)
      v20 = v19 >= a6;
    else
      v20 = 0;
    if (!v20)
    {
      if (*(_QWORD *)(v10 + 80) < a7)
      {
        v21 = mach_continuous_time();
        if (timebase_info_once != -1)
          dispatch_once(&timebase_info_once, &__block_literal_global_397);
        v22 = timebase_info_info * v21 / dword_253D0A9BC / 0x3E8;
        v23 = *(_QWORD *)(v10 + 56);
        if (!quic_cc_cwnd_validated((_QWORD *)(v10 + 16)))
        {
          if (*(_QWORD *)(v10 + 120) <= *(_QWORD *)(v10 + 48))
            v23 = *(_QWORD *)(v10 + 48);
          else
            v23 = *(_QWORD *)(v10 + 120);
        }
        *(_QWORD *)(v10 + 80) = v22;
        *(_QWORD *)(v10 + 152) = *(_QWORD *)(v10 + 56);
        v24 = (unint64_t)((double)v23 * 0.5);
        if (2 * (unint64_t)a8 > v24)
          v24 = 2 * a8;
        v25 = *(_QWORD *)(v10 + 64);
        *(_QWORD *)(v10 + 64) = v24;
        *(_QWORD *)(v10 + 72) = v25;
        *(_QWORD *)(v10 + 56) = v24;
        quic_cc_log_update(a10, v24, *(_QWORD *)(v10 + 48), v24);
        if (a10)
        {
          v26 = a10;
          objc_msgSend(v26, "logCongestionStateUpdated:new_state:trigger:", 5, 3, 2);

        }
        *(_BYTE *)(v10 + 144) = 0;
        *(_OWORD *)(v10 + 96) = 0u;
        *(_OWORD *)(v10 + 112) = 0u;
      }
      *(_QWORD *)(v10 + 40) = a5;
    }
  }
}

void ledbat_link_flow_controlled(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
    {
      if (*(_QWORD *)(v4 + 80) < a2)
      {
        v7 = mach_continuous_time();
        if (timebase_info_once != -1)
          dispatch_once(&timebase_info_once, &__block_literal_global_397);
        v8 = timebase_info_info * v7 / dword_253D0A9BC / 0x3E8;
        v9 = *(_QWORD *)(v4 + 56);
        if (!quic_cc_cwnd_validated((_QWORD *)(v4 + 16)))
        {
          if (*(_QWORD *)(v4 + 120) <= *(_QWORD *)(v4 + 48))
            v9 = *(_QWORD *)(v4 + 48);
          else
            v9 = *(_QWORD *)(v4 + 120);
        }
        v10 = *(_QWORD *)(v4 + 48);
        *(_QWORD *)(v4 + 152) = *(_QWORD *)(v4 + 56);
        v11 = (double)v9 * 0.5;
        if (2 * (unint64_t)a3 > (unint64_t)v11)
          v12 = 2 * a3;
        else
          v12 = (unint64_t)v11;
        *(_QWORD *)(v4 + 72) = *(_QWORD *)(v4 + 64);
        *(_QWORD *)(v4 + 80) = v8;
        *(_QWORD *)(v4 + 56) = v12;
        *(_QWORD *)(v4 + 64) = v12;
        quic_cc_log_update(a4, v12, v10, v12);
        if (a4)
        {
          v13 = a4;
          objc_msgSend(v13, "logCongestionStateUpdated:new_state:trigger:", 5, 3, 2);

        }
        *(_BYTE *)(v4 + 144) = 0;
        *(_OWORD *)(v4 + 96) = 0u;
        *(_OWORD *)(v4 + 112) = 0u;
      }
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v14 = _os_log_pack_size();
        v15 = (char *)v27 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v16 = _os_log_pack_fill();
        v17 = *(_QWORD *)(v4 + 56);
        *(_DWORD *)v16 = 136446466;
        *(_QWORD *)(v16 + 4) = "ledbat_link_flow_controlled";
        *(_WORD *)(v16 + 12) = 2048;
        *(_QWORD *)(v16 + 14) = v17;
        v18 = 2;
        v19 = (uint64_t)v15;
        v20 = 419;
LABEL_20:
        qlog_internal(v18, v19, v20);
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v24 = _os_log_pack_size();
      v25 = (char *)v27 - ((MEMORY[0x24BDAC7A8](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v26 = _os_log_pack_fill();
      *(_DWORD *)v26 = 136446210;
      *(_QWORD *)(v26 + 4) = "ledbat_link_flow_controlled";
      v18 = 17;
      v19 = (uint64_t)v25;
      v20 = 412;
      goto LABEL_20;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v21 = _os_log_pack_size();
    v22 = (char *)v27 - ((MEMORY[0x24BDAC7A8](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136446210;
    *(_QWORD *)(v23 + 4) = "ledbat_link_flow_controlled";
    v18 = 17;
    v19 = (uint64_t)v22;
    v20 = 411;
    goto LABEL_20;
  }
}

void ledbat_spurious_rxmt(uint64_t a1, void *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v5 = _os_log_pack_size();
    v6 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "ledbat_spurious_rxmt";
    v8 = (uint64_t)v6;
    v9 = 437;
LABEL_24:
    qlog_internal(17, v8, v9);
    return;
  }
  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v10 = _os_log_pack_size();
    v11 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "ledbat_spurious_rxmt";
    v8 = (uint64_t)v11;
    v9 = 438;
    goto LABEL_24;
  }
  v3 = v2[19];
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "ledbat_spurious_rxmt";
    v8 = (uint64_t)v14;
    v9 = 441;
    goto LABEL_24;
  }
  v4 = v2[9];
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v16 = _os_log_pack_size();
    v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136446210;
    *(_QWORD *)(v18 + 4) = "ledbat_spurious_rxmt";
    v8 = (uint64_t)v17;
    v9 = 442;
    goto LABEL_24;
  }
  if (v3 <= v2[7])
    v3 = v2[7];
  v2[7] = v3;
  v2[8] = v4;
  quic_cc_log_update(a2, v3, -1, v4);
}

void ledbat_persistent_congestion(uint64_t a1, unsigned int a2, void *a3)
{
  _QWORD *v3;
  double v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "ledbat_persistent_congestion";
    v11 = (uint64_t)v9;
    v12 = 457;
LABEL_16:
    qlog_internal(17, v11, v12);
    return;
  }
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "ledbat_persistent_congestion";
    v11 = (uint64_t)v14;
    v12 = 458;
    goto LABEL_16;
  }
  v5 = (double)(unint64_t)v3[7] * 0.5;
  v6 = 2 * a2;
  if (v6 <= (unint64_t)v5)
    v7 = (unint64_t)v5;
  else
    v7 = v6;
  v3[7] = v6;
  v3[8] = v7;
  quic_cc_log_update(a3, v6, v3[6], v7);
  if (a3)
  {
    v16[0] = a3;
    objc_msgSend(v16[0], "logCongestionStateUpdated:new_state:trigger:", 5, 0, 0);

  }
}

void ledbat_idle_timeout(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v11 = _os_log_pack_size();
    v12 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "ledbat_idle_timeout";
    v14 = (uint64_t)v12;
    v15 = 495;
LABEL_23:
    qlog_internal(17, v14, v15);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v16 = _os_log_pack_size();
    v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136446210;
    *(_QWORD *)(v18 + 4) = "ledbat_idle_timeout";
    v14 = (uint64_t)v17;
    v15 = 496;
    goto LABEL_23;
  }
  v4 = *(_QWORD *)(v3 + 48);
  v5 = *(_QWORD *)(v3 + 56);
  v6 = (double)v5 * 0.5;
  LODWORD(v7) = 2 * a2;
  if ((2 * a2) >= 0xB80)
    v7 = 2944;
  else
    v7 = v7;
  v8 = (unint64_t)v6;
  if ((unint64_t)v6 <= v7)
    v8 = v7;
  if (*(_QWORD *)(v3 + 64) <= v8)
    v9 = v8;
  else
    v9 = *(_QWORD *)(v3 + 64);
  if (v5 >= v7)
    v10 = v7;
  else
    v10 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v10;
  *(_QWORD *)(v3 + 64) = v9;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_OWORD *)(v3 + 152) = 0u;
  *(_OWORD *)(v3 + 168) = 0u;
  *(_DWORD *)(v3 + 184) = 0;
  *(_BYTE *)(v3 + 144) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_QWORD *)(v3 + 128) = 0;
  quic_cc_log_update(a3, v10, v4, v9);
}

uint64_t ledbat_can_send_packet(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v4 = _os_log_pack_size();
    v5 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "ledbat_can_send_packet";
    v7 = (uint64_t)v5;
    v8 = 523;
    goto LABEL_12;
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    return quic_cc_can_send(v2 + 16, a2);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v9 = _os_log_pack_size();
    v10 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136446210;
    *(_QWORD *)(v11 + 4) = "ledbat_can_send_packet";
    v7 = (uint64_t)v10;
    v8 = 524;
LABEL_12:
    qlog_internal(17, v7, v8);
  }
  return 0;
}

uint64_t ledbat_get_cwnd(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "ledbat_get_cwnd";
    v6 = (uint64_t)v4;
    v7 = 533;
    goto LABEL_13;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "ledbat_get_cwnd";
    v6 = (uint64_t)v9;
    v7 = 534;
LABEL_13:
    qlog_internal(17, v6, v7);
    return 0;
  }
  return *(_QWORD *)(v1 + 56);
}

unint64_t ledbat_get_allowed_cwnd(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "ledbat_get_allowed_cwnd";
    v11 = (uint64_t)v9;
    v12 = 543;
    goto LABEL_15;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "ledbat_get_allowed_cwnd";
    v11 = (uint64_t)v14;
    v12 = 544;
LABEL_15:
    qlog_internal(17, v11, v12);
    return 0;
  }
  v4 = v1 + 48;
  v2 = *(_QWORD *)(v1 + 48);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = v3 >= v2;
  v6 = v3 - v2;
  if (v5)
    return v6;
  else
    return 0;
}

uint64_t ledbat_get_bytes_in_flight(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "ledbat_get_bytes_in_flight";
    v6 = (uint64_t)v4;
    v7 = 553;
    goto LABEL_13;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "ledbat_get_bytes_in_flight";
    v6 = (uint64_t)v9;
    v7 = 554;
LABEL_13:
    qlog_internal(17, v6, v7);
    return 0;
  }
  return *(_QWORD *)(v1 + 48);
}

void ledbat_fillout_data_transfer_snapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v3 = _os_log_pack_size();
    v4 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "ledbat_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v4;
    v7 = 564;
LABEL_18:
    qlog_internal(17, v6, v7);
    return;
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "ledbat_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v9;
    v7 = 565;
    goto LABEL_18;
  }
  if (a2)
  {
    *(_OWORD *)(a2 + 152) = *(_OWORD *)(v2 + 56);
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "ledbat_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v12;
    v7 = 567;
    goto LABEL_18;
  }
}

void ledbat_init(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v5 = _os_log_pack_size();
    v6 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "ledbat_init";
    v8 = (uint64_t)v6;
    v9 = 578;
LABEL_15:
    qlog_internal(17, v8, v9);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v10 = _os_log_pack_size();
    v11 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "ledbat_init";
    v8 = (uint64_t)v11;
    v9 = 579;
    goto LABEL_15;
  }
  if ((2 * a2) >= 0xB80)
    v4 = 2944;
  else
    v4 = (2 * a2);
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 64) = 0xFFFFFFFFLL;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_OWORD *)(v3 + 152) = 0u;
  *(_OWORD *)(v3 + 168) = 0u;
  *(_DWORD *)(v3 + 184) = 0;
  *(_BYTE *)(v3 + 144) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_QWORD *)(v3 + 128) = 0;
  quic_cc_log_update(a3, v4, *(_QWORD *)(v3 + 48), 0xFFFFFFFFLL);
}

uint64_t ledbat_create(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  _QWORD *v7;
  _QWORD *v8;

  v7 = malloc_type_calloc(1uLL, 0xC0uLL, 0xEAFB8F1AuLL);
  if (v7)
  {
    v8 = v7;
    *v7 = a1;
    v7[1] = v7;
    ledbat_init((uint64_t)v7, a3, a4);
    return (uint64_t)v8;
  }
  else
  {
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0xC0uLL);
    return ledbat_switch();
  }
}

void ledbat_switch(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  unint64_t cwnd;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v9 = _os_log_pack_size();
    v10 = (char *)v17 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136446210;
    *(_QWORD *)(v11 + 4) = "ledbat_switch";
    v12 = (uint64_t)v10;
    v13 = 607;
LABEL_15:
    qlog_internal(17, v12, v13);
    return;
  }
  v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v14 = _os_log_pack_size();
    v15 = (char *)v17 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136446210;
    *(_QWORD *)(v16 + 4) = "ledbat_switch";
    v12 = (uint64_t)v15;
    v13 = 608;
    goto LABEL_15;
  }
  *(_QWORD *)(v4 + 48) = quic_cc_get_bytes_in_flight(a2);
  cwnd = quic_cc_get_cwnd(a2);
  v8 = *(_QWORD *)(v4 + 56);
  if (cwnd < v8)
    v8 = quic_cc_get_cwnd(a2);
  *(_QWORD *)(v4 + 56) = v8;
  quic_cc_log_update(a4, v8, *(_QWORD *)(v4 + 48), -1);
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  *(_OWORD *)(v4 + 152) = 0u;
  *(_OWORD *)(v4 + 168) = 0u;
  *(_DWORD *)(v4 + 184) = 0;
  *(_BYTE *)(v4 + 144) = 0;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_QWORD *)(v4 + 128) = 0;
}

void ledbat_destroy(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    if (v1)
      free(v1);
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "ledbat_destroy";
    qlog_internal(17, (uint64_t)v3, 628);
  }
}

uint64_t __quic_pmtud_create_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1[5] == a2)
    return 1;
  v4 = (void *)nw_protocol_instance_copy_interface_for_path();
  if (v4 != (void *)a1[7] || (v6 = *(_QWORD *)(a2 + 400)) == 0)
  {
    v5 = 1;
    if (!v4)
      return v5;
    goto LABEL_8;
  }
  v5 = 0;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v6;
  if (v4)
LABEL_8:
    nw_release(v4);
  return v5;
}

void ___quic_pmtud_create_block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "_quic_pmtud_create_block_invoke";
    qlog_internal(2, (uint64_t)v3, 223);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(v5 + 90);
  if ((v6 & 4) != 0)
    *(_BYTE *)(v5 + 21) = 0;
  *(_BYTE *)(v5 + 90) = v6 & 0xFB;
  quic_pmtud_update_probe_size(*(_QWORD *)(a1 + 32), 1);
}

void quic_pmtud_change_path(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 **v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD v25[5];
  _QWORD v26[2];
  BOOL (*v27)(uint64_t, uint64_t);
  void *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 0x40000000;
    v27 = __quic_pmtud_change_path_block_invoke;
    v28 = &__block_descriptor_tmp_14_2075;
    v29 = a1;
    v5 = *(_QWORD *)(a2 + 1360);
    while (v5)
    {
      v6 = v5;
      v5 = *(_QWORD *)(v5 + 312);
      if ((((uint64_t (*)(_QWORD *, uint64_t))v27)(v26, v6) & 1) == 0)
      {
        *(_QWORD *)(a1 + 80) = v6;
        v7 = *(unsigned __int8 ***)(a2 + 576);
        if (v7)
        {
          v8 = *v7;
          if (*v7)
          {
            v9 = *(unsigned __int8 *)(a1 + 22);
            if (*v8 == v9)
            {
              v10 = (unsigned __int8 *)*((_QWORD *)v8 + 4);
              v11 = *v7;
LABEL_23:
              *v7 = v10;
              *((_QWORD *)v11 + 4) = 0;
              *v11 = 0;
              v19 = (const void *)*((_QWORD *)v11 + 2);
              if (v19)
                _Block_release(v19);
              free(v11);
            }
            else
            {
              v11 = *v7;
              while (1)
              {
                v11 = (unsigned __int8 *)*((_QWORD *)v11 + 4);
                if (!v11)
                  break;
                if (*v11 == v9)
                {
                  if (v8 == v11)
                  {
                    v8 = (unsigned __int8 *)*((_QWORD *)v8 + 4);
                  }
                  else
                  {
                    v17 = *v7;
                    do
                    {
                      v18 = v17;
                      v17 = (unsigned __int8 *)*((_QWORD *)v17 + 4);
                    }
                    while (v17 != v11);
                    *((_QWORD *)v18 + 4) = *((_QWORD *)v11 + 4);
                  }
                  *((_QWORD *)v11 + 4) = v8;
                  v10 = v8;
                  goto LABEL_23;
                }
              }
            }
          }
          v20 = *(_QWORD *)(a2 + 576);
          v25[0] = v4;
          v25[1] = 0x40000000;
          v25[2] = __quic_pmtud_change_path_block_invoke_16;
          v25[3] = &__block_descriptor_tmp_17_2078;
          v25[4] = a1;
          *(_BYTE *)(a1 + 22) = quic_timer_insert(v20, (uint64_t)"PMTUD", 0, v25);
        }
        return;
      }
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v12 = _os_log_pack_size();
      v13 = (char *)&v25[-1] - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v14 = _os_log_pack_fill();
      *(_DWORD *)v14 = 136446210;
      *(_QWORD *)(v14 + 4) = "quic_pmtud_change_path";
      v15 = (uint64_t)v13;
      v16 = 355;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v21 = _os_log_pack_size();
    v22 = (char *)&v25[-1] - ((MEMORY[0x24BDAC7A8](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136446210;
    *(_QWORD *)(v23 + 4) = "quic_pmtud_change_path";
    v15 = (uint64_t)v22;
    v16 = 344;
LABEL_13:
    qlog_internal(17, v15, v16);
  }
}

BOOL __quic_pmtud_change_path_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 400);
  return v2 != *(_QWORD *)(a1 + 32) || *(_QWORD *)(v2 + 80) == a2;
}

void __quic_pmtud_change_path_block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_pmtud_change_path_block_invoke";
    qlog_internal(2, (uint64_t)v3, 364);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(v5 + 90);
  if ((v6 & 4) != 0)
    *(_BYTE *)(v5 + 21) = 0;
  *(_BYTE *)(v5 + 90) = v6 & 0xFB;
  quic_pmtud_update_probe_size(*(_QWORD *)(a1 + 32), 1);
}

void quic_pmtud_search_complete(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  _OWORD *v9;
  _OWORD *v10;
  int v11;
  unsigned int v12;
  __int128 v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE *)(a1 + 90);
  *(_BYTE *)(a1 + 20) = 0;
  *(_BYTE *)(a1 + 90) = v2 & 0xF2 | 4;
  quic_pmtud_timer_reschedule(a1, 600000000);
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
      && *(_QWORD *)(v3 + 1112))
    {
      v4 = _os_log_pack_size();
      v29 = &v27;
      v5 = (char *)&v27 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v6 = _os_log_pack_fill();
      v7 = *(_QWORD *)(a1 + 72);
      v28 = v7 + 976;
      v8 = *(unsigned __int8 **)(v7 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v9 = &quic_cid_describe_cid_buf2;
      else
        v9 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v10 = v9;
      else
        v10 = &quic_cid_describe_cid_buf1;
      v11 = ++quic_cid_describe_state;
      v12 = v8[38];
      v13 = 0uLL;
      *(_OWORD *)((char *)v10 + 25) = 0u;
      if (v12 >= 0x14)
        v14 = 20;
      else
        v14 = v12;
      *v10 = 0uLL;
      v10[1] = 0uLL;
      if ((_DWORD)v14)
      {
        v15 = v8 + 39;
        do
        {
          v16 = *v15++;
          snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v16);
          --v14;
        }
        while (v14);
        v8 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 72) + 1112);
        v11 = quic_cid_describe_state;
        v13 = 0uLL;
      }
      if (v11 % 3 == 2)
        v17 = &quic_cid_describe_cid_buf2;
      else
        v17 = &quic_cid_describe_cid_buf3;
      if (v11 % 3)
        v18 = v17;
      else
        v18 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v11 + 1;
      if (v8[17] >= 0x14u)
        v19 = 20;
      else
        v19 = v8[17];
      *v18 = v13;
      v18[1] = v13;
      *(_OWORD *)((char *)v18 + 25) = v13;
      if ((_DWORD)v19)
      {
        v20 = v8 + 18;
        do
        {
          v21 = *v20++;
          snprintf((char *)v18, 0x29uLL, "%s%02x", (const char *)v18, v21);
          --v19;
        }
        while (v19);
      }
      v22 = *(unsigned __int16 *)(a1 + 8);
      *(_DWORD *)v6 = 136447234;
      *(_QWORD *)(v6 + 4) = "quic_pmtud_search_complete";
      *(_WORD *)(v6 + 12) = 2082;
      *(_QWORD *)(v6 + 14) = v28;
      *(_WORD *)(v6 + 22) = 2082;
      *(_QWORD *)(v6 + 24) = v10;
      *(_WORD *)(v6 + 32) = 2082;
      *(_QWORD *)(v6 + 34) = v18;
      *(_WORD *)(v6 + 42) = 1024;
      *(_DWORD *)(v6 + 44) = v22;
      qlog_internal(0, (uint64_t)v5, 189);
    }
  }
  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
  {
    v23 = _os_log_pack_size();
    v24 = (char *)&v27 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v25 = _os_log_pack_fill();
    v26 = *(unsigned __int16 *)(a1 + 8);
    *(_DWORD *)v25 = 136446466;
    *(_QWORD *)(v25 + 4) = "quic_pmtud_search_complete";
    *(_WORD *)(v25 + 12) = 1024;
    *(_DWORD *)(v25 + 14) = v26;
    qlog_internal(1, (uint64_t)v24, 192);
  }
}

void quic_pmtud_detect_blackhole(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  int v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a1 + 90) & 0xA) != 0)
  {
    if (*(unsigned __int16 *)(a1 + 8) <= 0x4FFu
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      v2 = _os_log_pack_size();
      v3 = (char *)v6 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v4 = _os_log_pack_fill();
      v5 = *(unsigned __int16 *)(a1 + 8);
      *(_DWORD *)v4 = 136446466;
      *(_QWORD *)(v4 + 4) = "quic_pmtud_detect_blackhole";
      *(_WORD *)(v4 + 12) = 1024;
      *(_DWORD *)(v4 + 14) = v5;
      qlog_internal(17, (uint64_t)v3, 465);
    }
    quic_pmtud_enter_blackhole_detection(a1);
  }
}

void quic_pmtud_enter_blackhole_detection(uint64_t a1)
{
  char v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  _OWORD *v9;
  _OWORD *v10;
  int v11;
  unsigned int v12;
  __int128 v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v1 = *(_BYTE *)(a1 + 90);
  if ((v1 & 2) != 0)
  {
    v3 = *(_QWORD *)(a1 + 72);
    if (v3)
    {
      if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT)
        || !*(_QWORD *)(v3 + 1112))
      {
        goto LABEL_36;
      }
      v4 = _os_log_pack_size();
      v27 = &v25;
      v5 = (char *)&v25 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v6 = _os_log_pack_fill();
      v7 = *(_QWORD *)(a1 + 72);
      v26 = v7 + 976;
      v8 = *(unsigned __int8 **)(v7 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v9 = &quic_cid_describe_cid_buf2;
      else
        v9 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v10 = v9;
      else
        v10 = &quic_cid_describe_cid_buf1;
      v11 = ++quic_cid_describe_state;
      v12 = v8[38];
      v13 = 0uLL;
      *(_OWORD *)((char *)v10 + 25) = 0u;
      if (v12 >= 0x14)
        v14 = 20;
      else
        v14 = v12;
      *v10 = 0uLL;
      v10[1] = 0uLL;
      if ((_DWORD)v14)
      {
        v15 = v8 + 39;
        do
        {
          v16 = *v15++;
          snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v16);
          --v14;
        }
        while (v14);
        v8 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 72) + 1112);
        v11 = quic_cid_describe_state;
        v13 = 0uLL;
      }
      if (v11 % 3 == 2)
        v17 = &quic_cid_describe_cid_buf2;
      else
        v17 = &quic_cid_describe_cid_buf3;
      if (v11 % 3)
        v18 = v17;
      else
        v18 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v11 + 1;
      if (v8[17] >= 0x14u)
        v19 = 20;
      else
        v19 = v8[17];
      *v18 = v13;
      v18[1] = v13;
      *(_OWORD *)((char *)v18 + 25) = v13;
      if ((_DWORD)v19)
      {
        v20 = v8 + 18;
        do
        {
          v21 = *v20++;
          snprintf((char *)v18, 0x29uLL, "%s%02x", (const char *)v18, v21);
          --v19;
        }
        while (v19);
      }
      *(_DWORD *)v6 = 136447234;
      *(_QWORD *)(v6 + 4) = "quic_pmtud_enter_blackhole_detection";
      *(_WORD *)(v6 + 12) = 2082;
      *(_QWORD *)(v6 + 14) = v26;
      *(_WORD *)(v6 + 22) = 2082;
      *(_QWORD *)(v6 + 24) = v10;
      *(_WORD *)(v6 + 32) = 2082;
      *(_QWORD *)(v6 + 34) = v18;
      *(_WORD *)(v6 + 42) = 1024;
      *(_DWORD *)(v6 + 44) = 1280;
      qlog_internal(0, (uint64_t)v5, 440);
    }
    else
    {
      if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      {
        goto LABEL_36;
      }
      v22 = _os_log_pack_size();
      v23 = (char *)&v25 - ((MEMORY[0x24BDAC7A8](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v24 = _os_log_pack_fill();
      *(_DWORD *)v24 = 136446466;
      *(_QWORD *)(v24 + 4) = "quic_pmtud_enter_blackhole_detection";
      *(_WORD *)(v24 + 12) = 1024;
      *(_DWORD *)(v24 + 14) = 1280;
      qlog_internal(1, (uint64_t)v23, 444);
    }
    v1 = *(_BYTE *)(a1 + 90);
LABEL_36:
    *(_WORD *)(a1 + 8) = 1280;
    *(_BYTE *)(a1 + 90) = v1 & 0xFB;
    *(_BYTE *)(a1 + 20) = 0;
    quic_pmtud_conn_set_mss(a1, (unsigned __int16)(1280 - *(_WORD *)(a1 + 12)));
    quic_pmtud_timer_reschedule(a1, 0);
    quic_pmtud_update_probe_size(a1, 1);
  }
}

void quic_pmtud_ptb_received(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  _OWORD *v12;
  _OWORD *v13;
  int v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  int v35;
  unsigned int v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  int v44;
  __int16 v45;
  __int16 v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  __int16 v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a1 + 90) & 2) != 0)
  {
    v4 = *(_QWORD *)(a1 + 72);
    v5 = 0x2545F5000uLL;
    v6 = 0x2545F5000uLL;
    if (v4)
    {
      if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
        && *(_QWORD *)(v4 + 1112))
      {
        v7 = _os_log_pack_size();
        v54 = &v52;
        v8 = (char *)&v52 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v9 = _os_log_pack_fill();
        v10 = *(_QWORD *)(a1 + 72);
        v53 = v10 + 976;
        v11 = *(unsigned __int8 **)(v10 + 1112);
        if (quic_cid_describe_state % 3 == 2)
          v12 = &quic_cid_describe_cid_buf2;
        else
          v12 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v13 = v12;
        else
          v13 = &quic_cid_describe_cid_buf1;
        v14 = ++quic_cid_describe_state;
        v15 = v11[38];
        v16 = 0uLL;
        *(_OWORD *)((char *)v13 + 25) = 0u;
        if (v15 >= 0x14)
          v17 = 20;
        else
          v17 = v15;
        *v13 = 0uLL;
        v13[1] = 0uLL;
        if ((_DWORD)v17)
        {
          v18 = v11 + 39;
          do
          {
            v19 = *v18++;
            snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
            --v17;
          }
          while (v17);
          v11 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 72) + 1112);
          v14 = quic_cid_describe_state;
          v6 = 0x2545F5000;
          v16 = 0uLL;
        }
        if (v14 % 3 == 2)
          v20 = &quic_cid_describe_cid_buf2;
        else
          v20 = &quic_cid_describe_cid_buf3;
        if (v14 % 3)
          v21 = v20;
        else
          v21 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v14 + 1;
        if (v11[17] >= 0x14u)
          v22 = 20;
        else
          v22 = v11[17];
        *v21 = v16;
        v21[1] = v16;
        *(_OWORD *)((char *)v21 + 25) = v16;
        if ((_DWORD)v22)
        {
          v23 = v11 + 18;
          do
          {
            v24 = *v23++;
            snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
            --v22;
          }
          while (v22);
        }
        *(_DWORD *)v9 = 136447234;
        *(_QWORD *)(v9 + 4) = "quic_pmtud_ptb_received";
        *(_WORD *)(v9 + 12) = 2082;
        *(_QWORD *)(v9 + 14) = v53;
        *(_WORD *)(v9 + 22) = 2082;
        *(_QWORD *)(v9 + 24) = v13;
        *(_WORD *)(v9 + 32) = 2082;
        *(_QWORD *)(v9 + 34) = v21;
        *(_WORD *)(v9 + 42) = 1024;
        *(_DWORD *)(v9 + 44) = a2;
        qlog_internal(0, (uint64_t)v8, 482);
        v5 = 0x2545F5000;
      }
    }
    else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    {
      v25 = _os_log_pack_size();
      v26 = (char *)&v52 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v27 = _os_log_pack_fill();
      *(_DWORD *)v27 = 136446466;
      *(_QWORD *)(v27 + 4) = "quic_pmtud_ptb_received";
      *(_WORD *)(v27 + 12) = 1024;
      *(_DWORD *)(v27 + 14) = a2;
      qlog_internal(1, (uint64_t)v26, 484);
    }
    if (a2 > 0x4FF)
    {
      v31 = *(unsigned __int16 *)(a1 + 8);
      if (v31 == a2)
      {
        if (*(_BYTE *)(v5 + 3232)
          || (*(_BYTE *)(v6 + 3233) & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        {
          v32 = _os_log_pack_size();
          v33 = (char *)&v52 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v34 = _os_log_pack_fill();
          v35 = *(unsigned __int16 *)(a1 + 8);
          *(_DWORD *)v34 = 136446466;
          *(_QWORD *)(v34 + 4) = "quic_pmtud_ptb_received";
          *(_WORD *)(v34 + 12) = 1024;
          *(_DWORD *)(v34 + 14) = v35;
          qlog_internal(1, (uint64_t)v33, 492);
        }
        quic_pmtud_search_complete(a1);
      }
      else
      {
        v36 = *(unsigned __int16 *)(a1 + 16);
        if (v36 >= a2)
        {
          if (v31 <= a2)
          {
            if (v31 < a2 && v36 > a2)
            {
              if (*(_BYTE *)(v5 + 3232)
                || (*(_BYTE *)(v6 + 3233) & 1) != 0
                || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
              {
                v47 = _os_log_pack_size();
                v48 = (char *)&v52 - ((MEMORY[0x24BDAC7A8](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0);
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                v49 = _os_log_pack_fill();
                *(_DWORD *)v49 = 136446210;
                *(_QWORD *)(v49 + 4) = "quic_pmtud_ptb_received";
                qlog_internal(1, (uint64_t)v48, 506);
              }
              if (*(unsigned __int16 *)(a1 + 18) >= a2)
                v50 = a2;
              else
                v50 = *(_WORD *)(a1 + 18);
              if (*(_WORD *)(a1 + 18))
                v51 = v50;
              else
                v51 = a2;
              *(_WORD *)(a1 + 18) = v51;
            }
          }
          else
          {
            if (*(_BYTE *)(v5 + 3232)
              || (*(_BYTE *)(v6 + 3233) & 1) != 0
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
            {
              v41 = _os_log_pack_size();
              v42 = (char *)&v52 - ((MEMORY[0x24BDAC7A8](v41, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v43 = _os_log_pack_fill();
              v44 = *(unsigned __int16 *)(a1 + 8);
              *(_DWORD *)v43 = 136446466;
              *(_QWORD *)(v43 + 4) = "quic_pmtud_ptb_received";
              *(_WORD *)(v43 + 12) = 1024;
              *(_DWORD *)(v43 + 14) = v44;
              qlog_internal(1, (uint64_t)v42, 499);
            }
            if (*(unsigned __int16 *)(a1 + 18) >= a2)
              v45 = a2;
            else
              v45 = *(_WORD *)(a1 + 18);
            if (*(_WORD *)(a1 + 18))
              v46 = v45;
            else
              v46 = a2;
            *(_WORD *)(a1 + 18) = v46;
            quic_pmtud_enter_blackhole_detection(a1);
          }
        }
        else if (*(_BYTE *)(v5 + 3232)
               || (*(_BYTE *)(v6 + 3233) & 1) != 0
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        {
          v37 = _os_log_pack_size();
          v38 = (char *)&v52 - ((MEMORY[0x24BDAC7A8](v37, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v39 = _os_log_pack_fill();
          v40 = *(unsigned __int16 *)(a1 + 16);
          *(_DWORD *)v39 = 136446466;
          *(_QWORD *)(v39 + 4) = "quic_pmtud_ptb_received";
          *(_WORD *)(v39 + 12) = 1024;
          *(_DWORD *)(v39 + 14) = v40;
          qlog_internal(1, (uint64_t)v38, 496);
        }
      }
    }
    else if (*(_BYTE *)(v5 + 3232)
           || (*(_BYTE *)(v6 + 3233) & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    {
      v28 = _os_log_pack_size();
      v29 = (char *)&v52 - ((MEMORY[0x24BDAC7A8](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v30 = _os_log_pack_fill();
      *(_DWORD *)v30 = 136446466;
      *(_QWORD *)(v30 + 4) = "quic_pmtud_ptb_received";
      *(_WORD *)(v30 + 12) = 1024;
      *(_DWORD *)(v30 + 14) = 1280;
      qlog_internal(1, (uint64_t)v29, 488);
    }
  }
}

void quic_pmtud_probe_lost(uint64_t a1, __int16 a2, unint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*(_QWORD *)a1 <= a3)
    {
      v9 = (unsigned __int16)(*(_WORD *)(a1 + 12) + a2);
      if (v9 <= *(unsigned __int16 *)(a1 + 14) && (*(_BYTE *)(a1 + 90) & 4) == 0)
      {
        v10 = *(_BYTE *)(a1 + 20) + 1;
        *(_BYTE *)(a1 + 20) = v10;
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        {
          v11 = _os_log_pack_size();
          v12 = (char *)v21 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v13 = _os_log_pack_fill();
          v14 = *(unsigned __int8 *)(a1 + 20);
          *(_DWORD *)v13 = 136446722;
          *(_QWORD *)(v13 + 4) = "quic_pmtud_probe_lost";
          *(_WORD *)(v13 + 12) = 1024;
          *(_DWORD *)(v13 + 14) = v9;
          *(_WORD *)(v13 + 18) = 1024;
          *(_DWORD *)(v13 + 20) = v14;
          qlog_internal(1, (uint64_t)v12, 529);
          v10 = *(_BYTE *)(a1 + 20);
        }
        if (v10 == 3)
        {
          if (qlog_debug_enabled
            || (qlog_nwlog_enabled & 1) != 0
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          {
            v15 = _os_log_pack_size();
            v16 = (char *)v21 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v17 = _os_log_pack_fill();
            *(_DWORD *)v17 = 136446210;
            *(_QWORD *)(v17 + 4) = "quic_pmtud_probe_lost";
            qlog_internal(1, (uint64_t)v16, 532);
          }
          quic_pmtud_search_complete(a1);
        }
        else
        {
          quic_pmtud_update_probe_size(a1, 0);
        }
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v5 = _os_log_pack_size();
      v6 = (char *)v21 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v7 = _os_log_pack_fill();
      v8 = *(_QWORD *)a1;
      *(_DWORD *)v7 = 136446722;
      *(_QWORD *)(v7 + 4) = "quic_pmtud_probe_lost";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      *(_WORD *)(v7 + 22) = 2048;
      *(_QWORD *)(v7 + 24) = v8;
      qlog_internal(2, (uint64_t)v6, 519);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v18 = _os_log_pack_size();
    v19 = (char *)v21 - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136446210;
    *(_QWORD *)(v20 + 4) = "quic_pmtud_probe_lost";
    qlog_internal(17, (uint64_t)v19, 516);
  }
}

void quic_pmtud_message_size_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v6[6];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v6[1] = MEMORY[0x24BDAC760];
    v6[2] = 0x40000000;
    v6[3] = __quic_pmtud_message_size_handler_block_invoke;
    v6[4] = &__block_descriptor_tmp_5_2128;
    v6[5] = a2;
    v7 = a3;
    nw_protocol_instance_access_state();
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v3 = _os_log_pack_size();
    v4 = (char *)v6 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_pmtud_message_size_handler";
    qlog_internal(17, (uint64_t)v4, 544);
  }
}

uint64_t __quic_pmtud_message_size_handler_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = quic_conn_lookup_nw_path(a2, *(_QWORD *)(a1 + 32));
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 400);
    if (v4)
    {
      quic_pmtud_ptb_received(v4, *(unsigned __int16 *)(a1 + 40));
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v5 = _os_log_pack_size();
      v6 = (char *)v9 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v7 = _os_log_pack_fill();
      *(_DWORD *)v7 = 136446210;
      *(_QWORD *)(v7 + 4) = "quic_pmtud_message_size_handler_block_invoke";
      qlog_internal(2, (uint64_t)v6, 553);
    }
  }
  return 1;
}

void quic_pmtud_pto_event(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      v6 = (*(unsigned __int16 *)(a2 + 431) >> 12) & 1;
    }
    else
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v10 = _os_log_pack_size();
        v11 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v12 = _os_log_pack_fill();
        *(_DWORD *)v12 = 136446210;
        *(_QWORD *)(v12 + 4) = "quic_path_is_flow_controlled";
        qlog_internal(17, (uint64_t)v11, 526);
      }
      LOBYTE(v6) = 0;
    }
    if (a3 >= 4 && (v6 & 1) == 0 && (*(_BYTE *)(a1 + 90) & 2) != 0 && *(_QWORD *)(a1 + 80) == a2)
      quic_pmtud_detect_blackhole(a1);
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "quic_pmtud_pto_event";
    qlog_internal(17, (uint64_t)v8, 723);
  }
}

void __quic_cc_prague_identifier_block_invoke()
{
  unk_253D0A637 = 0;
  unk_253D0A62F = 0;
  byte_253D0A647 = 0;
  unk_253D0A63F = 0;
  strcpy((char *)dword_253D0A628, "prague");
  qword_253D0A598 = (uint64_t)prague_packet_sent;
  unk_253D0A5A0 = prague_packet_discarded;
  qword_253D0A5A8 = (uint64_t)prague_packet_acked;
  unk_253D0A5B0 = prague_ack_begin;
  qword_253D0A5B8 = (uint64_t)prague_ack_end;
  unk_253D0A5C0 = prague_packets_lost;
  qword_253D0A5C8 = (uint64_t)prague_process_ecn;
  unk_253D0A5D0 = prague_link_flow_controlled;
  qword_253D0A5D8 = (uint64_t)prague_process_link_congestion_info;
  unk_253D0A5E0 = prague_spurious_rxmt;
  qword_253D0A5E8 = (uint64_t)prague_persistent_congestion;
  unk_253D0A5F0 = prague_idle_timeout;
  qword_253D0A5F8 = (uint64_t)prague_can_send_packet;
  unk_253D0A600 = prague_get_cwnd;
  qword_253D0A608 = (uint64_t)prague_get_allowed_cwnd;
  unk_253D0A610 = prague_get_bytes_in_flight;
  quic_cc_prague_identifier_prague = (uint64_t)prague_create;
  unk_253D0A580 = prague_init;
  qword_253D0A618 = (uint64_t)prague_switch;
  unk_253D0A620 = prague_fillout_data_transfer_snapshot;
  qword_253D0A588 = (uint64_t)prague_destroy;
  unk_253D0A590 = prague_mss_changed;
}

void prague_mss_changed(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v4 = _os_log_pack_size();
    v5 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "prague_mss_changed";
    v7 = (uint64_t)v5;
    v8 = 398;
LABEL_15:
    qlog_internal(17, v7, v8);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v9 = _os_log_pack_size();
    v10 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136446210;
    *(_QWORD *)(v11 + 4) = "prague_mss_changed";
    v7 = (uint64_t)v10;
    v8 = 399;
    goto LABEL_15;
  }
  if (*(_QWORD *)(v3 + 56) <= (unint64_t)a2)
    a2 = a2;
  else
    a2 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 56) = a2;
  quic_cc_log_update(a3, a2, -1, -1);
}

void prague_packet_sent(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      quic_cc_inc_bytes_in_flight(v3 + 16, a2);
      if (a3)
      {
        v5 = *(_QWORD *)(v3 + 48);
        LOBYTE(v14) = -1;
        v15[0] = a3;
        objc_msgSend(v15[0], "metricsUpdated:smoothed_rtt:latest_rtt:rtt_variance:pto_count:congestion_window:bytes_in_flight:ssthresh:packets_in_flight:in_recovery:", -1, -1, -1, -1, -1, -1, v5, -1, -1, v14);

      }
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v13 = _os_log_pack_fill();
      *(_DWORD *)v13 = 136446210;
      *(_QWORD *)(v13 + 4) = "prague_packet_sent";
      v9 = (uint64_t)v12;
      v10 = 414;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "prague_packet_sent";
    v9 = (uint64_t)v7;
    v10 = 413;
LABEL_13:
    qlog_internal(17, v9, v10);
  }
}

void prague_packet_discarded(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      quic_cc_dec_bytes_in_flight(v3 + 16, a2);
      if (a3)
      {
        v5 = *(_QWORD *)(v3 + 48);
        LOBYTE(v14) = -1;
        v15[0] = a3;
        objc_msgSend(v15[0], "metricsUpdated:smoothed_rtt:latest_rtt:rtt_variance:pto_count:congestion_window:bytes_in_flight:ssthresh:packets_in_flight:in_recovery:", -1, -1, -1, -1, -1, -1, v5, -1, -1, v14);

      }
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v13 = _os_log_pack_fill();
      *(_DWORD *)v13 = 136446210;
      *(_QWORD *)(v13 + 4) = "prague_packet_discarded";
      v9 = (uint64_t)v12;
      v10 = 511;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "prague_packet_discarded";
    v9 = (uint64_t)v7;
    v10 = 510;
LABEL_13:
    qlog_internal(17, v9, v10);
  }
}

void prague_ack_begin(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 8);
    if (v1)
    {
      *(_QWORD *)(v1 + 88) = 0;
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136446210;
      *(_QWORD *)(v9 + 4) = "prague_ack_begin";
      v5 = (uint64_t)v8;
      v6 = 427;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "prague_ack_begin";
    v5 = (uint64_t)v3;
    v6 = 426;
LABEL_13:
    qlog_internal(17, v5, v6);
  }
}

void prague_ack_end(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, char a5, void *a6)
{
  uint64_t v6;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v40 = _os_log_pack_size();
    v41 = (char *)v55 - ((MEMORY[0x24BDAC7A8](v40, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v42 = _os_log_pack_fill();
    *(_DWORD *)v42 = 136446210;
    *(_QWORD *)(v42 + 4) = "prague_ack_end";
    v43 = (uint64_t)v41;
    v44 = 458;
LABEL_60:
    qlog_internal(17, v43, v44);
    return;
  }
  v6 = *(_QWORD *)(a1 + 8);
  if (!v6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v45 = _os_log_pack_size();
    v46 = (char *)v55 - ((MEMORY[0x24BDAC7A8](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v47 = _os_log_pack_fill();
    *(_DWORD *)v47 = 136446210;
    *(_QWORD *)(v47 + 4) = "prague_ack_end";
    v43 = (uint64_t)v46;
    v44 = 459;
    goto LABEL_60;
  }
  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v48 = _os_log_pack_size();
    v49 = (char *)v55 - ((MEMORY[0x24BDAC7A8](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v50 = _os_log_pack_fill();
    *(_DWORD *)v50 = 136446210;
    *(_QWORD *)(v50 + 4) = "prague_ack_end";
    v43 = (uint64_t)v49;
    v44 = 460;
    goto LABEL_60;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v51 = _os_log_pack_size();
    v52 = (char *)v55 - ((MEMORY[0x24BDAC7A8](v51, v51) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v53 = _os_log_pack_fill();
    *(_DWORD *)v53 = 136446210;
    *(_QWORD *)(v53 + 4) = "prague_ack_end";
    v43 = (uint64_t)v52;
    v44 = 461;
    goto LABEL_60;
  }
  if ((a5 & 1) != 0 || !*(_QWORD *)(v6 + 88))
    return;
  v10 = *(_QWORD *)(a2 + 16);
  if (!quic_cc_is_validated((_QWORD *)(v6 + 16), v10))
  {
    *(_QWORD *)(v6 + 88) = 0;
    return;
  }
  v11 = *(_QWORD *)(v6 + 56);
  if (v11 < *(_QWORD *)(v6 + 64))
  {
    v12 = *(_QWORD *)(v6 + 88);
    if (v12 >= 10 * (unint64_t)a4)
      v12 = 10 * a4;
    v13 = v12 + v11;
    *(_QWORD *)(v6 + 56) = v13;
    goto LABEL_27;
  }
  v14 = *(_QWORD *)(v6 + 88);
  if (!*(_BYTE *)(v6 + 156))
  {
    *(_QWORD *)(v6 + 208) += v14;
    if (!*(_QWORD *)(v6 + 248))
    {
      *(_QWORD *)(v6 + 248) = quic_now();
      v15 = *(_QWORD *)(v6 + 56);
      v16 = *(_QWORD *)(v6 + 232);
      v17 = 0.0;
      v18 = v15;
      if (v16 > v15)
      {
        v17 = cbrt((double)(v16 - v15) * 2.5 / (double)a4);
        v18 = v16;
      }
      *(_QWORD *)(v6 + 240) = v18;
      *(double *)(v6 + 200) = v17;
      *(_QWORD *)(v6 + 256) = v15;
      *(_QWORD *)(v6 + 216) = 0;
    }
    v19 = mach_continuous_time();
    if (timebase_info_once != -1)
    {
      v54 = v19;
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
      v19 = v54;
    }
    v20 = *(_QWORD *)(v6 + 256);
    v21 = -(*(double *)(v6 + 200)
          - (double)(v10
                   + timebase_info_info * v19 / dword_253D0A9BC / 0x3E8
                   - *(_QWORD *)(v6 + 248))
          * 0.000001);
    v22 = (uint64_t)((double)*(unint64_t *)(v6 + 240) + v21 * v21 * ((double)a4 * 0.4) * v21);
    v23 = v22 & ~(v22 >> 63);
    v24 = *(_QWORD *)(v6 + 216) + v14;
    *(_QWORD *)(v6 + 216) = v24;
    v25 = 0.529411765;
    if (v20 >= *(_QWORD *)(v6 + 232))
      v25 = 1.0;
    v26 = v20 + (unint64_t)((double)v14 * ((double)a4 * v25) / (double)v20);
    *(_QWORD *)(v6 + 256) = v26;
    v13 = *(_QWORD *)(v6 + 56);
    v27 = v23 > v13;
    v28 = v23 - v13;
    if (v27)
    {
      v34 = (unint64_t)((double)*(unint64_t *)(v6 + 208) * (double)v28 / (double)v13);
      LODWORD(v35) = 10 * a4;
      v36 = 2 * a4;
      if (2 * a4 <= 0x3980)
        v36 = 14720;
      if (v35 >= v36)
        v35 = v36;
      else
        v35 = v35;
      if (v34 >= v35)
        v34 = v35;
      v13 += v34;
      *(_QWORD *)(v6 + 56) = v13;
      *(_QWORD *)(v6 + 208) = 0;
      if (v13 >= v26)
      {
LABEL_26:
        if (*(_WORD *)(v6 + 152))
          goto LABEL_27;
LABEL_43:
        *(_QWORD *)(v6 + 232) = v13;
        goto LABEL_27;
      }
    }
    else if (v13 >= v26)
    {
      goto LABEL_26;
    }
    *(_QWORD *)(v6 + 56) = v26;
    v37 = *(_QWORD *)(v6 + 208);
    v38 = v37 >= v24;
    v39 = v37 - v24;
    if (!v38)
      v39 = 0;
    *(_QWORD *)(v6 + 208) = v39;
    *(_QWORD *)(v6 + 216) = 0;
    v13 = v26;
    if (*(_WORD *)(v6 + 152))
      goto LABEL_27;
    goto LABEL_43;
  }
  v13 = v11 + (((v14 * a4 * *(_QWORD *)(v6 + 176) + (v11 >> 1)) / v11) >> 20);
  *(_QWORD *)(v6 + 56) = v13;
LABEL_27:
  v29 = 2 * a4;
  if (v13 < v29)
  {
    *(_QWORD *)(v6 + 56) = v29;
    v13 = 2 * a4;
  }
  v30 = *(_QWORD *)(v6 + 64);
  v31 = v13 << (v13 < v30);
  v32 = 100000;
  if (v10)
    v32 = v10;
  v33 = 1000000 * v31 / v32;
  *(_QWORD *)(a3 + 24) = v33;
  *(_DWORD *)(a3 + 40) = v33 >> 12;
  *(_DWORD *)(a3 + 44) = v33 >> 10;
  quic_cc_log_update(a6, *(_QWORD *)(v6 + 56), *(_QWORD *)(v6 + 48), v30);
}

void prague_packet_acked(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v7 = _os_log_pack_size();
    v8 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "prague_packet_acked";
    v10 = 17;
    v11 = (uint64_t)v8;
    v12 = 437;
LABEL_21:
    qlog_internal(v10, v11, v12);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "prague_packet_acked";
    v10 = 17;
    v11 = (uint64_t)v14;
    v12 = 438;
    goto LABEL_21;
  }
  quic_cc_dec_bytes_in_flight(v3 + 16, a2);
  if (*(_QWORD *)(v3 + 80) < a3)
  {
    *(_QWORD *)(v3 + 88) += a2;
    return;
  }
  v6 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled || qlog_nwlog_enabled)
  {
    if (qlog_debug_enabled)
      v6 = 1;
    if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v16 = _os_log_pack_size();
      v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v18 = _os_log_pack_fill();
      *(_DWORD *)v18 = 136446210;
      *(_QWORD *)(v18 + 4) = "prague_packet_acked";
      v10 = 2;
      v11 = (uint64_t)v17;
      v12 = 446;
      goto LABEL_21;
    }
  }
}

void prague_packets_lost(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned int a5, unint64_t a6, _BYTE *a7, void *a8)
{
  uint64_t v8;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v17 = _os_log_pack_size();
    v18 = (char *)v25 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "prague_packets_lost";
    v20 = (uint64_t)v18;
    v21 = 647;
LABEL_14:
    qlog_internal(17, v20, v21);
    return;
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (!v8)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v22 = _os_log_pack_size();
    v23 = (char *)v25 - ((MEMORY[0x24BDAC7A8](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136446210;
    *(_QWORD *)(v24 + 4) = "prague_packets_lost";
    v20 = (uint64_t)v23;
    v21 = 648;
    goto LABEL_14;
  }
  quic_cc_dec_bytes_in_flight(v8 + 16, a3);
  prague_cong_event(v8, a4, a5, a7, a8);
  v15 = 100000;
  if (a6)
    v15 = a6;
  v16 = 1000000 * (*(_QWORD *)(v8 + 56) << (*(_QWORD *)(v8 + 56) < *(_QWORD *)(v8 + 64))) / v15;
  quic_pacer_set_rate(a2, v16);
  quic_pacer_set_burst_size(a2, v16 >> 12);
  quic_pacer_set_gap(a2, v16 >> 10);
}

void prague_process_ecn(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unsigned int a8, unint64_t a9, void *a10)
{
  uint64_t v10;
  uint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  long double v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  _BOOL4 v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v10 = *(_QWORD *)(a1 + 8);
    if (!v10)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v46 = _os_log_pack_size();
        v47 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v48 = _os_log_pack_fill();
        *(_DWORD *)v48 = 136446210;
        *(_QWORD *)(v48 + 4) = "prague_process_ecn";
        v36 = 17;
        v37 = (uint64_t)v47;
        v38 = 670;
        goto LABEL_51;
      }
      return;
    }
    if (!a2)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v49 = _os_log_pack_size();
        v50 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v49, v49) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v51 = _os_log_pack_fill();
        *(_DWORD *)v51 = 136446210;
        *(_QWORD *)(v51 + 4) = "prague_process_ecn";
        v36 = 17;
        v37 = (uint64_t)v50;
        v38 = 671;
        goto LABEL_51;
      }
      return;
    }
    if (*(_QWORD *)(v10 + 32) > a3
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      v52 = _os_log_pack_size();
      v53 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v52, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v54 = _os_log_pack_fill();
      v55 = *(_QWORD *)(v10 + 32);
      *(_DWORD *)v54 = 136446722;
      *(_QWORD *)(v54 + 4) = "prague_process_ecn";
      *(_WORD *)(v54 + 12) = 2048;
      *(_QWORD *)(v54 + 14) = a3;
      *(_WORD *)(v54 + 22) = 2048;
      *(_QWORD *)(v54 + 24) = v55;
      qlog_internal(17, (uint64_t)v53, 679);
    }
    if (*(_QWORD *)(v10 + 16) < a4)
      prague_update_alpha(v10, a5, a6, a3, a4);
    v18 = *(_QWORD *)(v10 + 32);
    if (v18 == a3)
      return;
    v19 = 0x253D0A000uLL;
    v20 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled)
        v20 = 1;
      if ((v20 & 1) != 0
        || (v56 = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG), v19 = 0x253D0A000uLL, v56))
      {
        v57 = _os_log_pack_size();
        v58 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v57, v57) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v59 = _os_log_pack_fill();
        v60 = *(_QWORD *)(v10 + 88);
        v61 = a3 - *(_QWORD *)(v10 + 32);
        *(_DWORD *)v59 = 136446722;
        *(_QWORD *)(v59 + 4) = "prague_process_ecn";
        *(_WORD *)(v59 + 12) = 2048;
        *(_QWORD *)(v59 + 14) = v60;
        *(_WORD *)(v59 + 22) = 2048;
        *(_QWORD *)(v59 + 24) = v61;
        qlog_internal(2, (uint64_t)v58, 698);
        v19 = 0x253D0A000;
        v18 = *(_QWORD *)(v10 + 32);
      }
    }
    v21 = (a3 - v18) * a8;
    v22 = *(_QWORD *)(v10 + 88);
    v23 = v22 >= v21;
    v24 = v22 - v21;
    if (!v23)
      v24 = 0;
    *(_QWORD *)(v10 + 88) = v24;
    *(_QWORD *)(v10 + 32) = a3;
    v25 = *(unsigned __int8 *)(v10 + 157);
    if (v25 == 1)
    {
      if (a9)
      {
        v27 = v19;
        v28 = log2((double)(a9 + 14000));
        v29 = log2((double)(2 * a9 + 7000));
        v30 = log2((double)a9);
        v19 = v27;
        v26 = (unint64_t)((v28 * 754974.72 + -9643397.2) / (v29 - v30));
        goto LABEL_19;
      }
    }
    else
    {
      if (v25 != 2)
      {
LABEL_20:
        v31 = *(_QWORD *)(v10 + 40);
        if (v31 && v31 >= a6)
        {
          v32 = qlog_nwlog_enabled;
          if (*(_BYTE *)(v19 + 2464) || qlog_nwlog_enabled)
          {
            if (qlog_debug_enabled)
              v32 = 1;
            if ((v32 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
            {
              v33 = _os_log_pack_size();
              v34 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v35 = _os_log_pack_fill();
              *(_DWORD *)v35 = 136446210;
              *(_QWORD *)(v35 + 4) = "prague_process_ecn";
              v36 = 2;
              v37 = (uint64_t)v34;
              v38 = 723;
LABEL_51:
              qlog_internal(v36, v37, v38);
              return;
            }
          }
        }
        else
        {
          ++*(_WORD *)(v10 + 154);
          if (*(_QWORD *)(v10 + 80) < a7)
          {
            v39 = *(_QWORD *)(v10 + 56) - ((*(_QWORD *)(v10 + 56) * (*(_QWORD *)(v10 + 168) >> 4)) >> 21) < 2 * (unint64_t)a8
                ? 2 * a8
                : *(_QWORD *)(v10 + 56) - ((*(_QWORD *)(v10 + 56) * (*(_QWORD *)(v10 + 168) >> 4)) >> 21);
            *(_QWORD *)(v10 + 56) = v39;
            *(_QWORD *)(v10 + 64) = v39;
            *(_BYTE *)(v10 + 156) = 1;
            quic_cc_log_update(a10, v39, -1, v39);
            if (a10)
            {
              v40 = a10;
              objc_msgSend(v40, "logCongestionStateUpdated:new_state:trigger:", 5, 4, 2);

            }
          }
          v41 = 100000;
          if (a9)
            v41 = a9;
          v42 = 1000000 * (*(_QWORD *)(v10 + 56) << (*(_QWORD *)(v10 + 56) < *(_QWORD *)(v10 + 64))) / v41;
          *(_QWORD *)(a2 + 24) = v42;
          *(_DWORD *)(a2 + 40) = v42 >> 12;
          *(_DWORD *)(a2 + 44) = v42 >> 10;
          *(_QWORD *)(v10 + 40) = a5;
        }
        return;
      }
      if (a9 <= 0x4E20)
      {
        v26 = (((a9 * a9) << 20) + 200000000) / 0x17D78400;
LABEL_19:
        *(_QWORD *)(v10 + 176) = v26;
        goto LABEL_20;
      }
    }
    v26 = 0x100000;
    goto LABEL_19;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v43 = _os_log_pack_size();
    v44 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v43, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v45 = _os_log_pack_fill();
    *(_DWORD *)v45 = 136446210;
    *(_QWORD *)(v45 + 4) = "prague_process_ecn";
    v36 = 17;
    v37 = (uint64_t)v44;
    v38 = 669;
    goto LABEL_51;
  }
}

void prague_link_flow_controlled(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
    {
      prague_cong_event(*(_QWORD *)(a1 + 8), a2, a3, 0, a4);
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v5 = _os_log_pack_size();
        v6 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v7 = _os_log_pack_fill();
        v8 = *(_QWORD *)(v4 + 56);
        *(_DWORD *)v7 = 136446466;
        *(_QWORD *)(v7 + 4) = "prague_link_flow_controlled";
        *(_WORD *)(v7 + 12) = 2048;
        *(_QWORD *)(v7 + 14) = v8;
        v9 = 2;
        v10 = (uint64_t)v6;
        v11 = 750;
LABEL_7:
        qlog_internal(v9, v10, v11);
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v17 = _os_log_pack_fill();
      *(_DWORD *)v17 = 136446210;
      *(_QWORD *)(v17 + 4) = "prague_link_flow_controlled";
      v9 = 17;
      v10 = (uint64_t)v16;
      v11 = 743;
      goto LABEL_7;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "prague_link_flow_controlled";
    v9 = 17;
    v10 = (uint64_t)v13;
    v11 = 742;
    goto LABEL_7;
  }
}

void prague_process_link_congestion_info(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "prague_process_link_congestion_info";
    v11 = (uint64_t)v9;
    v12 = 758;
LABEL_18:
    qlog_internal(17, v11, v12);
    return;
  }
  v1 = *(_DWORD **)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "prague_process_link_congestion_info";
    v11 = (uint64_t)v14;
    v12 = 759;
    goto LABEL_18;
  }
  v16[0] = 0;
  nw_link_get_local_congestion_info();
  v2 = v1[46];
  v3 = v2 == 0;
  v4 = -v2;
  if (v4 != 0 && v3)
  {
    v5 = v1[47];
    v3 = v5 == 0;
    v6 = -v5;
    if (v6 != 0 && v3)
    {
      v7 = v6 + v1[49];
      v1[48] += v4;
      v1[49] = v7;
    }
  }
  v1[46] = 0;
  v1[47] = 0;
}

void prague_spurious_rxmt(uint64_t a1, void *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v5 = _os_log_pack_size();
    v6 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "prague_spurious_rxmt";
    v8 = (uint64_t)v6;
    v9 = 782;
LABEL_24:
    qlog_internal(17, v8, v9);
    return;
  }
  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v10 = _os_log_pack_size();
    v11 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "prague_spurious_rxmt";
    v8 = (uint64_t)v11;
    v9 = 783;
    goto LABEL_24;
  }
  v3 = v2[29];
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "prague_spurious_rxmt";
    v8 = (uint64_t)v14;
    v9 = 788;
    goto LABEL_24;
  }
  v4 = v2[9];
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v16 = _os_log_pack_size();
    v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136446210;
    *(_QWORD *)(v18 + 4) = "prague_spurious_rxmt";
    v8 = (uint64_t)v17;
    v9 = 789;
    goto LABEL_24;
  }
  if (v3 <= v2[7])
    v3 = v2[7];
  v2[7] = v3;
  v2[8] = v4;
  quic_cc_log_update(a2, v3, -1, v4);
}

void prague_persistent_congestion(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v3;
  unint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "prague_persistent_congestion";
    v11 = (uint64_t)v9;
    v12 = 805;
LABEL_16:
    qlog_internal(17, v11, v12);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "prague_persistent_congestion";
    v11 = (uint64_t)v14;
    v12 = 806;
    goto LABEL_16;
  }
  v5 = 2 * a2;
  v6 = (double)*(unint64_t *)(v3 + 56) * 0.7;
  if (v5 <= (unint64_t)v6)
    v7 = (unint64_t)v6;
  else
    v7 = v5;
  *(_QWORD *)(v3 + 56) = v5;
  *(_QWORD *)(v3 + 64) = v7;
  quic_cc_log_update(a3, v5, -1, v7);
  if (a3)
  {
    v16[0] = a3;
    objc_msgSend(v16[0], "logCongestionStateUpdated:new_state:trigger:", 5, 0, 0);

  }
}

void prague_idle_timeout(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v11 = _os_log_pack_size();
    v12 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "prague_idle_timeout";
    v14 = (uint64_t)v12;
    v15 = 850;
LABEL_26:
    qlog_internal(17, v14, v15);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v16 = _os_log_pack_size();
    v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136446210;
    *(_QWORD *)(v18 + 4) = "prague_idle_timeout";
    v14 = (uint64_t)v17;
    v15 = 851;
    goto LABEL_26;
  }
  v4 = *(_QWORD *)(v3 + 56);
  v5 = (unint64_t)((double)v4 * 0.7);
  LODWORD(v6) = 10 * a2;
  v7 = 2 * a2;
  if ((2 * a2) <= 0x3980)
    v7 = 14720;
  if (v6 >= v7)
    v6 = v7;
  else
    v6 = v6;
  if (v5 <= v6)
    v5 = v6;
  if (v5 <= *(_QWORD *)(v3 + 64))
    v8 = *(_QWORD *)(v3 + 64);
  else
    v8 = v5;
  if (v4 >= v6)
    v9 = v6;
  else
    v9 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v9;
  *(_QWORD *)(v3 + 64) = v8;
  quic_cc_log_update(a3, v9, -1, v8);
  *(_DWORD *)(v3 + 152) = 0;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_QWORD *)(v3 + 200) = 0;
  *(_QWORD *)(v3 + 208) = 0;
  *(_QWORD *)(v3 + 240) = 0;
  *(_QWORD *)(v3 + 248) = 0;
  v10 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 224) = 0;
  *(_QWORD *)(v3 + 232) = v10;
  *(_BYTE *)(v3 + 157) = 2;
  *(_QWORD *)(v3 + 176) = 0x100000;
  *(_BYTE *)(v3 + 144) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_QWORD *)(v3 + 128) = 0;
}

uint64_t prague_can_send_packet(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v4 = _os_log_pack_size();
    v5 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "prague_can_send_packet";
    v7 = (uint64_t)v5;
    v8 = 878;
    goto LABEL_12;
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    return quic_cc_can_send(v2 + 16, a2);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v9 = _os_log_pack_size();
    v10 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136446210;
    *(_QWORD *)(v11 + 4) = "prague_can_send_packet";
    v7 = (uint64_t)v10;
    v8 = 879;
LABEL_12:
    qlog_internal(17, v7, v8);
  }
  return 0;
}

uint64_t prague_get_cwnd(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "prague_get_cwnd";
    v6 = (uint64_t)v4;
    v7 = 889;
    goto LABEL_13;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "prague_get_cwnd";
    v6 = (uint64_t)v9;
    v7 = 890;
LABEL_13:
    qlog_internal(17, v6, v7);
    return 0;
  }
  return *(_QWORD *)(v1 + 56);
}

unint64_t prague_get_allowed_cwnd(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "prague_get_allowed_cwnd";
    v11 = (uint64_t)v9;
    v12 = 900;
    goto LABEL_15;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "prague_get_allowed_cwnd";
    v11 = (uint64_t)v14;
    v12 = 901;
LABEL_15:
    qlog_internal(17, v11, v12);
    return 0;
  }
  v4 = v1 + 48;
  v2 = *(_QWORD *)(v1 + 48);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = v3 >= v2;
  v6 = v3 - v2;
  if (v5)
    return v6;
  else
    return 0;
}

uint64_t prague_get_bytes_in_flight(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "prague_get_bytes_in_flight";
    v6 = (uint64_t)v4;
    v7 = 911;
    goto LABEL_13;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "prague_get_bytes_in_flight";
    v6 = (uint64_t)v9;
    v7 = 912;
LABEL_13:
    qlog_internal(17, v6, v7);
    return 0;
  }
  return *(_QWORD *)(v1 + 48);
}

void prague_fillout_data_transfer_snapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v3 = _os_log_pack_size();
    v4 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "prague_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v4;
    v7 = 923;
LABEL_18:
    qlog_internal(17, v6, v7);
    return;
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "prague_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v9;
    v7 = 924;
    goto LABEL_18;
  }
  if (a2)
  {
    *(_OWORD *)(a2 + 152) = *(_OWORD *)(v2 + 56);
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "prague_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v12;
    v7 = 925;
    goto LABEL_18;
  }
}

void prague_init(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v8 = _os_log_pack_size();
    v9 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "prague_init";
    v11 = (uint64_t)v9;
    v12 = 938;
LABEL_18:
    qlog_internal(17, v11, v12);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "prague_init";
    v11 = (uint64_t)v14;
    v12 = 939;
    goto LABEL_18;
  }
  v5 = 10 * a2;
  v6 = 2 * a2;
  if ((2 * a2) <= 0x3980)
    v6 = 14720;
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  *(_QWORD *)(v3 + 56) = v7;
  *(_QWORD *)(v3 + 64) = 0xFFFFFFFFLL;
  *(_DWORD *)(v3 + 152) = 0;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_QWORD *)(v3 + 200) = 0;
  *(_QWORD *)(v3 + 208) = 0;
  *(_QWORD *)(v3 + 240) = 0;
  *(_QWORD *)(v3 + 248) = 0;
  *(_QWORD *)(v3 + 224) = 0;
  *(_QWORD *)(v3 + 232) = v7;
  *(_BYTE *)(v3 + 157) = 2;
  *(_OWORD *)(v3 + 168) = xmmword_20A2A2230;
  *(_BYTE *)(v3 + 144) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_QWORD *)(v3 + 128) = 0;
  quic_cc_log_update(a3, v7, -1, 0xFFFFFFFFLL);
  if (a3)
  {
    v16[0] = a3;
    objc_msgSend(v16[0], "logCongestionStateUpdated:new_state:trigger:", 5, 0, 2);

  }
}

uint64_t prague_create(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = malloc_type_calloc(1uLL, 0x108uLL, 0xEAFB8F1AuLL);
  if (v8)
  {
    v9 = v8;
    *v8 = a1;
    v8[1] = v8;
    prague_init((uint64_t)v8, a3, a4);
    quic_pacer_set_initial_state(a2, (unint64_t)((((31250 * v9[7]) & 0x7FFFFFFFFFFFFFFLL) * (unsigned __int128)0xA7C5AC471B47843uLL) >> 64) >> 7, a3);
    return (uint64_t)v9;
  }
  else
  {
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0x108uLL);
    return prague_switch();
  }
}

void prague_switch(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4;
  unint64_t cwnd;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v12 = _os_log_pack_size();
    v13 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "prague_switch";
    v15 = (uint64_t)v13;
    v16 = 975;
LABEL_19:
    qlog_internal(17, v15, v16);
    return;
  }
  v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v17 = _os_log_pack_size();
    v18 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "prague_switch";
    v15 = (uint64_t)v18;
    v16 = 976;
    goto LABEL_19;
  }
  *(_QWORD *)(v4 + 48) = quic_cc_get_bytes_in_flight(a2);
  cwnd = quic_cc_get_cwnd(a2);
  v9 = 10 * a3;
  v10 = 2 * a3;
  if ((2 * a3) <= 0x3980)
    v10 = 14720;
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  if (cwnd > v11)
    v11 = quic_cc_get_cwnd(a2);
  *(_QWORD *)(v4 + 56) = v11;
  *(_QWORD *)(v4 + 64) = 0xFFFFFFFFLL;
  *(_DWORD *)(v4 + 152) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  *(_QWORD *)(v4 + 200) = 0;
  *(_QWORD *)(v4 + 208) = 0;
  *(_QWORD *)(v4 + 240) = 0;
  *(_QWORD *)(v4 + 248) = 0;
  *(_QWORD *)(v4 + 224) = 0;
  *(_QWORD *)(v4 + 232) = v11;
  *(_BYTE *)(v4 + 157) = 2;
  *(_OWORD *)(v4 + 168) = xmmword_20A2A2230;
  *(_BYTE *)(v4 + 144) = 0;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_QWORD *)(v4 + 128) = 0;
  quic_cc_log_update(a4, v11, -1, 0xFFFFFFFFLL);
}

void prague_destroy(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    if (v1)
      free(v1);
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "prague_destroy";
    qlog_internal(17, (uint64_t)v3, 1000);
  }
}

void prague_cong_event(uint64_t a1, unint64_t a2, unsigned int a3, _BYTE *a4, void *a5)
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  if (*(_QWORD *)(a1 + 80) < a2)
  {
    if (a4)
      *a4 = 1;
    v8 = *(_QWORD *)(a1 + 56);
    if (!quic_cc_cwnd_validated((_QWORD *)(a1 + 16)))
    {
      if (*(_QWORD *)(a1 + 120) <= *(_QWORD *)(a1 + 48))
        v8 = *(_QWORD *)(a1 + 48);
      else
        v8 = *(_QWORD *)(a1 + 120);
    }
    v9 = mach_continuous_time();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    *(_QWORD *)(a1 + 80) = timebase_info_info * v9 / dword_253D0A9BC / 0x3E8;
    v10 = *(_QWORD *)(a1 + 232);
    v11 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 224) = v10;
    *(_QWORD *)(a1 + 232) = v11;
    v12 = (unint64_t)((double)v8 * 0.7);
    v13 = 2 * a3;
    if (v13 > v12)
      v12 = 2 * a3;
    v14 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v12;
    *(_QWORD *)(a1 + 72) = v14;
    *(_QWORD *)(a1 + 56) = v12;
    if (v11 < v10)
    {
      v11 = (unint64_t)((double)v11 * 0.85);
      if (v13 > v11)
        v11 = 2 * a3;
      *(_QWORD *)(a1 + 232) = v11;
    }
    if (v11)
      v15 = cbrt((double)(v11 - v12) * 2.5 / (double)a3);
    else
      v15 = 0.0;
    *(double *)(a1 + 200) = v15;
    v16 = mach_continuous_time();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    v17 = timebase_info_info * v16 / dword_253D0A9BC / 0x3E8;
    *(_QWORD *)(a1 + 240) = *(_QWORD *)(a1 + 232);
    *(_QWORD *)(a1 + 248) = v17;
    v18 = *(_QWORD *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 256) = v18;
    *(_QWORD *)(a1 + 216) = 0;
    ++*(_WORD *)(a1 + 152);
    *(_BYTE *)(a1 + 156) = 0;
    *(_BYTE *)(a1 + 144) = 0;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    quic_cc_log_update(a5, v18, -1, v19);
    if (a5)
    {
      v20 = a5;
      objc_msgSend(v20, "logCongestionStateUpdated:new_state:trigger:", 5, 3, 2);

    }
  }
}

void prague_update_alpha(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v5;
  BOOL v6;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  BOOL v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 160);
  if (v5)
    v6 = v5 >= a3;
  else
    v6 = 0;
  if (v6)
  {
    v25 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled)
      v26 = 0;
    else
      v26 = qlog_nwlog_enabled == 0;
    if (!v26)
    {
      if (qlog_debug_enabled)
        v25 = 1;
      if ((v25 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v27 = _os_log_pack_size();
        v28 = (char *)v31 - ((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v29 = _os_log_pack_fill();
        *(_DWORD *)v29 = 136446210;
        *(_QWORD *)(v29 + 4) = "prague_update_alpha";
        qlog_internal(2, (uint64_t)v28, 573);
      }
    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 16);
    v11 = *(_QWORD *)(a1 + 24);
    v6 = a4 >= v11;
    v14 = a4 - v11;
    v13 = v14 != 0 && v6;
    v15 = v14 << 20;
    if (v13)
      v16 = v15;
    else
      v16 = 0;
    v17 = a5 - v12;
    if (a5 <= v12)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      {
        v18 = _os_log_pack_size();
        v19 = (char *)v31 - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v20 = _os_log_pack_fill();
        *(_DWORD *)v20 = 136446210;
        *(_QWORD *)(v20 + 4) = "prague_update_alpha";
        qlog_internal(16, (uint64_t)v19, 587);
      }
      v17 = 0;
    }
    v21 = *(_QWORD *)(a1 + 168);
    v22 = *(unsigned int *)(a1 + 196);
    if ((_DWORD)v22)
    {
      v23 = (unint64_t)*(unsigned int *)(a1 + 192) << 20;
      *(_QWORD *)(a1 + 192) = 0;
      v24 = v23 / v22;
    }
    else
    {
      v24 = 0;
    }
    v30 = v21 - (v21 >> 4) + v24 + v16 / v17 - v16 / v17 * v24;
    if (v30 >= 0x1000000)
      v30 = 0x1000000;
    *(_QWORD *)(a1 + 160) = a2;
    *(_QWORD *)(a1 + 168) = v30;
    *(_QWORD *)(a1 + 16) = a5;
    *(_QWORD *)(a1 + 24) = a4;
  }
}

_QWORD *quic_cc_new_reno_create(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  _QWORD *v7;
  _QWORD *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v16 = _os_log_pack_size();
      v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v18 = _os_log_pack_fill();
      *(_DWORD *)v18 = 136446210;
      *(_QWORD *)(v18 + 4) = "quic_cc_new_reno_create";
      qlog_internal(17, (uint64_t)v17, 119);
      return 0;
    }
    return 0;
  }
  v7 = malloc_type_calloc(1uLL, 0xA0uLL, 0xEAFB8F1AuLL);
  if (!v7)
  {
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0xA0uLL);
    return 0;
  }
  v8 = v7;
  *v7 = a1;
  v7[1] = v7;
  v9 = 10 * a3;
  v10 = 2 * a3;
  v7[8] = 0xFFFFFFFFLL;
  v7[4] = 0;
  if ((2 * a3) <= 0x3908)
    v10 = 14600;
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  v7[6] = 0;
  v7[7] = v11;
  v7[10] = 0;
  *((_BYTE *)v7 + 144) = 0;
  *((_OWORD *)v7 + 6) = 0u;
  *((_OWORD *)v7 + 7) = 0u;
  quic_cc_log_update(a4, v11, 0, 0xFFFFFFFFLL);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446466;
    *(_QWORD *)(v14 + 4) = "quic_cc_new_reno_create";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = v8;
    qlog_internal(2, (uint64_t)v13, 127);
  }
  return v8;
}

void quic_cc_new_reno_reset(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_12:
    v7 = _os_log_pack_size();
    v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "quic_cc_new_reno_reset";
    qlog_internal(17, (uint64_t)v8, 162);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_12;
  }
  v4 = 10 * a2;
  v5 = 2 * a2;
  if ((2 * a2) <= 0x3908)
    v5 = 14600;
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  *(_QWORD *)(v3 + 56) = v6;
  *(_QWORD *)(v3 + 64) = 0xFFFFFFFFLL;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_BYTE *)(v3 + 144) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  quic_cc_log_update(a3, v6, 0, 0xFFFFFFFFLL);
}

void quic_cc_new_reno_destroy(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_10:
    v5 = _os_log_pack_size();
    v6 = (char *)v8 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_cc_new_reno_destroy";
    qlog_internal(17, (uint64_t)v6, 169);
    return;
  }
  v1 = *(void **)(a1 + 8);
  if (!v1)
  {
    if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_10;
  }
  if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v8 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446466;
    *(_QWORD *)(v4 + 4) = "quic_cc_new_reno_destroy";
    *(_WORD *)(v4 + 12) = 2048;
    *(_QWORD *)(v4 + 14) = v1;
    qlog_internal(2, (uint64_t)v3, 170);
  }
  free(v1);
}

void quic_cc_new_reno_mss_changed(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_10:
    v4 = _os_log_pack_size();
    v5 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "quic_cc_new_reno_mss_changed";
    qlog_internal(17, (uint64_t)v5, 179);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_10;
  }
  if (*(_QWORD *)(v3 + 56) <= (unint64_t)a2)
    a2 = a2;
  else
    a2 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 56) = a2;
  quic_cc_log_update(a3, a2, -1, -1);
}

void quic_cc_new_reno_packet_sent(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      quic_cc_inc_bytes_in_flight(v3 + 16, a2);
      if (a3)
      {
        v5 = *(_QWORD *)(v3 + 48);
        LOBYTE(v9) = -1;
        v10[0] = a3;
        objc_msgSend(v10[0], "metricsUpdated:smoothed_rtt:latest_rtt:rtt_variance:pto_count:congestion_window:bytes_in_flight:ssthresh:packets_in_flight:in_recovery:", -1, -1, -1, -1, -1, -1, v5, -1, -1, v9);

      }
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
LABEL_8:
      v6 = _os_log_pack_size();
      v7 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      *(_DWORD *)v8 = 136446210;
      *(_QWORD *)(v8 + 4) = "quic_cc_new_reno_packet_sent";
      qlog_internal(17, (uint64_t)v7, 193);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    goto LABEL_8;
  }
}

void quic_cc_new_reno_packet_discarded(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      quic_cc_dec_bytes_in_flight(v3 + 16, a2);
      if (a3)
      {
        v5 = *(_QWORD *)(v3 + 48);
        LOBYTE(v9) = -1;
        v10[0] = a3;
        objc_msgSend(v10[0], "metricsUpdated:smoothed_rtt:latest_rtt:rtt_variance:pto_count:congestion_window:bytes_in_flight:ssthresh:packets_in_flight:in_recovery:", -1, -1, -1, -1, -1, -1, v5, -1, -1, v9);

      }
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
LABEL_8:
      v6 = _os_log_pack_size();
      v7 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      *(_DWORD *)v8 = 136446210;
      *(_QWORD *)(v8 + 4) = "quic_cc_new_reno_packet_discarded";
      qlog_internal(17, (uint64_t)v7, 203);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    goto LABEL_8;
  }
}

void quic_cc_new_reno_packet_acked(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_9:
    v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "quic_cc_new_reno_packet_acked";
    v9 = (uint64_t)v7;
    v10 = 220;
LABEL_10:
    qlog_internal(17, v9, v10);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_9;
  }
  if (a3)
  {
    quic_cc_dec_bytes_in_flight(v3 + 16, a2);
    if (*(_QWORD *)(v3 + 80) < a3)
      *(_QWORD *)(v3 + 88) += a2;
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "quic_cc_new_reno_packet_acked";
    v9 = (uint64_t)v12;
    v10 = 221;
    goto LABEL_10;
  }
}

void quic_cc_new_reno_process_ecn(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unsigned int a8, uint64_t a9, void *a10)
{
  _QWORD *v10;
  unint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_14;
  }
  v10 = *(_QWORD **)(a1 + 8);
  if (!v10)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_14:
    v20 = _os_log_pack_size();
    v21 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136446210;
    *(_QWORD *)(v22 + 4) = "quic_cc_new_reno_process_ecn";
    v23 = (uint64_t)v21;
    v24 = 299;
    goto LABEL_15;
  }
  if (!a7)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v25 = _os_log_pack_size();
    v26 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136446210;
    *(_QWORD *)(v27 + 4) = "quic_cc_new_reno_process_ecn";
    v23 = (uint64_t)v26;
    v24 = 300;
LABEL_15:
    qlog_internal(17, v23, v24);
    return;
  }
  v17 = v10[4];
  if (v17 > a3
    && (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    v28 = _os_log_pack_size();
    v29 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v30 = _os_log_pack_fill();
    v31 = v10[4];
    *(_DWORD *)v30 = 136446722;
    *(_QWORD *)(v30 + 4) = "quic_cc_new_reno_process_ecn";
    *(_WORD *)(v30 + 12) = 2048;
    *(_QWORD *)(v30 + 14) = a3;
    *(_WORD *)(v30 + 22) = 2048;
    *(_QWORD *)(v30 + 24) = v31;
    qlog_internal(17, (uint64_t)v29, 305);
    v17 = v10[4];
  }
  v10[2] = a4;
  v10[3] = a3;
  if (v17 != a3)
  {
    v18 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled)
        v18 = 1;
      if ((v18 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v32 = _os_log_pack_size();
        v33 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v34 = _os_log_pack_fill();
        v35 = v10[11];
        v36 = a3 - v10[4];
        *(_DWORD *)v34 = 136446722;
        *(_QWORD *)(v34 + 4) = "quic_cc_new_reno_process_ecn";
        *(_WORD *)(v34 + 12) = 2048;
        *(_QWORD *)(v34 + 14) = v35;
        *(_WORD *)(v34 + 22) = 2048;
        *(_QWORD *)(v34 + 24) = v36;
        qlog_internal(2, (uint64_t)v33, 324);
      }
    }
    v10[4] = a3;
    v10[11] = 0;
    v19 = v10[5];
    if (!v19 || v19 < a6)
    {
      quic_new_reno_congestion_event((uint64_t)v10, a7, a8, 0, a10);
      v10[5] = a5;
    }
  }
}

void quic_new_reno_congestion_event(uint64_t a1, unint64_t a2, unsigned int a3, _BYTE *a4, void *a5)
{
  char v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 80) < a2)
  {
    v9 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled)
      v10 = 0;
    else
      v10 = qlog_nwlog_enabled == 0;
    if (!v10)
    {
      if (qlog_debug_enabled)
        v9 = 1;
      if ((v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v16 = _os_log_pack_size();
        v17 = (char *)v19 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v18 = _os_log_pack_fill();
        *(_DWORD *)v18 = 136446210;
        *(_QWORD *)(v18 + 4) = "quic_new_reno_congestion_event";
        qlog_internal(2, (uint64_t)v17, 91);
      }
    }
    if (a4)
      *a4 = 1;
    v11 = mach_continuous_time();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    *(_QWORD *)(a1 + 80) = timebase_info_info * v11 / dword_253D0A9BC / 0x3E8;
    v12 = *(_QWORD *)(a1 + 56);
    if (quic_cc_cwnd_validated((_QWORD *)(a1 + 16)))
    {
      v13 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 48);
      if (*(_QWORD *)(a1 + 120) <= v13)
        v12 = *(_QWORD *)(a1 + 48);
      else
        v12 = *(_QWORD *)(a1 + 120);
    }
    v14 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a1 + 56);
    if (v12 >> 1 <= 2 * (unint64_t)a3)
      v15 = 2 * a3;
    else
      v15 = v12 >> 1;
    *(_QWORD *)(a1 + 64) = v15;
    *(_QWORD *)(a1 + 72) = v14;
    *(_QWORD *)(a1 + 56) = v15;
    *(_BYTE *)(a1 + 144) = 0;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    quic_cc_log_update(a5, v15, v13, v15);
  }
}

void quic_cc_new_reno_packets_lost(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned int a5, uint64_t a6, _BYTE *a7, void *a8)
{
  uint64_t v8;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_9;
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (!v8)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_9:
    v13 = _os_log_pack_size();
    v14 = (char *)v24 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "quic_cc_new_reno_packets_lost";
    v16 = (uint64_t)v14;
    v17 = 356;
    goto LABEL_10;
  }
  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v18 = _os_log_pack_size();
    v19 = (char *)v24 - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136446210;
    *(_QWORD *)(v20 + 4) = "quic_cc_new_reno_packets_lost";
    v16 = (uint64_t)v19;
    v17 = 357;
LABEL_10:
    qlog_internal(17, v16, v17);
    return;
  }
  if (a4)
  {
    quic_cc_dec_bytes_in_flight(v8 + 16, a3);
    quic_new_reno_congestion_event(v8, a4, a5, a7, a8);
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v21 = _os_log_pack_size();
    v22 = (char *)v24 - ((MEMORY[0x24BDAC7A8](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136446210;
    *(_QWORD *)(v23 + 4) = "quic_cc_new_reno_packets_lost";
    v16 = (uint64_t)v22;
    v17 = 358;
    goto LABEL_10;
  }
}

void quic_cc_new_reno_spurious_rxmt(uint64_t a1, void *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_11;
  }
  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_11:
    v5 = _os_log_pack_size();
    v6 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_cc_new_reno_spurious_rxmt";
    v8 = (uint64_t)v6;
    v9 = 395;
    goto LABEL_12;
  }
  v3 = v2[19];
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v10 = _os_log_pack_size();
    v11 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "quic_cc_new_reno_spurious_rxmt";
    v8 = (uint64_t)v11;
    v9 = 397;
LABEL_12:
    qlog_internal(17, v8, v9);
    return;
  }
  v4 = v2[9];
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "quic_cc_new_reno_spurious_rxmt";
    v8 = (uint64_t)v14;
    v9 = 398;
    goto LABEL_12;
  }
  if (v3 <= v2[7])
    v3 = v2[7];
  v2[7] = v3;
  v2[8] = v4;
  quic_cc_log_update(a2, v3, -1, v4);
}

void quic_cc_new_reno_idle_timeout(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_20:
    v10 = _os_log_pack_size();
    v11 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "quic_cc_new_reno_idle_timeout";
    qlog_internal(17, (uint64_t)v11, 432);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_20;
  }
  *(_QWORD *)(v3 + 152) = 0;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  v4 = *(_QWORD *)(v3 + 56);
  v5 = v4 >> 1;
  LODWORD(v6) = 10 * a2;
  v7 = 2 * a2;
  if ((2 * a2) <= 0x3908)
    v7 = 14600;
  if (v6 >= v7)
    v6 = v7;
  else
    v6 = v6;
  if (v5 <= v6)
    v5 = v6;
  if (v5 <= *(_QWORD *)(v3 + 64))
    v8 = *(_QWORD *)(v3 + 64);
  else
    v8 = v5;
  if (v4 >= v6)
    v9 = v6;
  else
    v9 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v9;
  *(_QWORD *)(v3 + 64) = v8;
  *(_BYTE *)(v3 + 144) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_QWORD *)(v3 + 128) = 0;
  quic_cc_log_update(a3, v9, -1, v8);
}

double __quic_cc_new_reno_identifier_block_invoke()
{
  double result;

  result = 0.0;
  *(_OWORD *)&byte_2545F57E0 = 0u;
  unk_2545F57B0 = 0u;
  qword_2545F57F0 = 0;
  g_new_reno_identifier = (uint64_t)quic_cc_new_reno_create;
  unk_2545F5730 = quic_cc_new_reno_reset;
  qword_2545F5738 = (uint64_t)quic_cc_new_reno_destroy;
  unk_2545F5740 = quic_cc_new_reno_mss_changed;
  qword_2545F5748 = (uint64_t)quic_cc_new_reno_packet_sent;
  unk_2545F5750 = quic_cc_new_reno_packet_discarded;
  qword_2545F5758 = (uint64_t)quic_cc_new_reno_packet_acked;
  unk_2545F5760 = quic_cc_new_reno_ack_begin;
  qword_2545F5768 = (uint64_t)quic_cc_new_reno_ack_end;
  unk_2545F5770 = quic_cc_new_reno_packets_lost;
  qword_2545F5778 = (uint64_t)quic_cc_new_reno_process_ecn;
  unk_2545F5780 = quic_cc_new_reno_link_flow_controlled;
  qword_2545F5788 = (uint64_t)quic_cc_new_reno_process_link_congestion_info;
  unk_2545F5790 = quic_cc_new_reno_spurious_rxmt;
  qword_2545F5798 = (uint64_t)quic_cc_new_reno_persistent_congestion;
  unk_2545F57A0 = quic_cc_new_reno_idle_timeout;
  qword_2545F57A8 = (uint64_t)quic_cc_new_reno_can_send_packet;
  qword_2545F57B8 = (uint64_t)quic_cc_new_reno_get_allowed_cwnd;
  qword_2545F57C0 = (uint64_t)quic_cc_new_reno_get_bytes_in_flight;
  unk_2545F57C8 = quic_cc_new_reno_switch;
  qword_2545F57D0 = (uint64_t)quic_cc_new_reno_fillout_data_transfer_snapshot;
  unk_2545F57D8 = *(_QWORD *)"new_reno";
  return result;
}

void quic_cc_new_reno_switch(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4;
  unint64_t cwnd;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_14:
    v12 = _os_log_pack_size();
    v13 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "quic_cc_new_reno_switch";
    qlog_internal(17, (uint64_t)v13, 135);
    return;
  }
  v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_14;
  }
  *(_QWORD *)(v4 + 48) = quic_cc_get_bytes_in_flight(a2);
  cwnd = quic_cc_get_cwnd(a2);
  v9 = 10 * a3;
  v10 = 2 * a3;
  if ((2 * a3) <= 0x3908)
    v10 = 14600;
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  if (cwnd > v11)
    v11 = quic_cc_get_cwnd(a2);
  *(_QWORD *)(v4 + 56) = v11;
  *(_QWORD *)(v4 + 64) = 0xFFFFFFFFLL;
  *(_QWORD *)(v4 + 152) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  *(_BYTE *)(v4 + 144) = 0;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  quic_cc_log_update(a4, v11, -1, 0xFFFFFFFFLL);
}

void quic_cc_new_reno_ack_begin(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 8);
    if (v1)
    {
      *(_QWORD *)(v1 + 88) = 0;
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      goto LABEL_7;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
LABEL_7:
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_cc_new_reno_ack_begin";
    qlog_internal(17, (uint64_t)v3, 212);
  }
}

void quic_cc_new_reno_ack_end(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, char a5, void *a6)
{
  _QWORD *v6;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_21;
  }
  v6 = *(_QWORD **)(a1 + 8);
  if (!v6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_21:
    v20 = _os_log_pack_size();
    v21 = (char *)v35 - ((MEMORY[0x24BDAC7A8](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136446210;
    *(_QWORD *)(v22 + 4) = "quic_cc_new_reno_ack_end";
    v23 = (uint64_t)v21;
    v24 = 247;
    goto LABEL_22;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v32 = _os_log_pack_size();
    v33 = (char *)v35 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136446210;
    *(_QWORD *)(v34 + 4) = "quic_cc_new_reno_ack_end";
    v23 = (uint64_t)v33;
    v24 = 248;
LABEL_22:
    qlog_internal(17, v23, v24);
    return;
  }
  if ((a5 & 1) == 0 && v6[11])
  {
    if (!quic_cc_is_validated(v6 + 2, *(_QWORD *)(a2 + 16)))
    {
      v6[11] = 0;
      return;
    }
    v9 = v6[7];
    v10 = v6[8];
    v11 = v6[11];
    if (v9 >= v10)
    {
      v25 = v11 * a4 / v9;
      v12 = v9 + v25;
      v6[7] = v9 + v25;
      if (!__CFADD__(v9, v25))
      {
LABEL_33:
        if (v12 >= 2 * (unint64_t)a4)
          goto LABEL_34;
        v12 = 2 * a4;
LABEL_32:
        v6[7] = v12;
LABEL_34:
        quic_cc_log_update(a6, v12, v6[6], v10);
        return;
      }
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v26 = _os_log_pack_size();
        v27 = (char *)v35 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v28 = _os_log_pack_fill();
        v29 = v6[7];
        v30 = v6[11] * a4;
        *(_DWORD *)v28 = 136447234;
        *(_QWORD *)(v28 + 4) = "quic_cc_new_reno_ack_end";
        *(_WORD *)(v28 + 12) = 2082;
        *(_QWORD *)(v28 + 14) = "new_reno->c.congestion_window";
        *(_WORD *)(v28 + 22) = 2048;
        v31 = v30 / v29;
        *(_QWORD *)(v28 + 24) = v29 - v31;
        *(_WORD *)(v28 + 32) = 2048;
        *(_QWORD *)(v28 + 34) = v31;
        *(_WORD *)(v28 + 42) = 2048;
        *(_QWORD *)(v28 + 44) = v29;
        v18 = (uint64_t)v27;
        v19 = 279;
LABEL_30:
        qlog_internal(17, v18, v19);
        v10 = v6[8];
      }
    }
    else
    {
      if (v11 >= 10 * (unint64_t)a4)
        v11 = 10 * a4;
      v12 = v9 + v11;
      v6[7] = v9 + v11;
      if (!__CFADD__(v9, v11))
        goto LABEL_33;
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v13 = _os_log_pack_size();
        v14 = (char *)v35 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v15 = _os_log_pack_fill();
        v16 = v6[7];
        v17 = v6[11];
        if (v17 >= 10 * (unint64_t)a4)
          v17 = 10 * a4;
        *(_DWORD *)v15 = 136447234;
        *(_QWORD *)(v15 + 4) = "quic_cc_new_reno_ack_end";
        *(_WORD *)(v15 + 12) = 2082;
        *(_QWORD *)(v15 + 14) = "new_reno->c.congestion_window";
        *(_WORD *)(v15 + 22) = 2048;
        *(_QWORD *)(v15 + 24) = v16 - v17;
        *(_WORD *)(v15 + 32) = 2048;
        *(_QWORD *)(v15 + 34) = v17;
        *(_WORD *)(v15 + 42) = 2048;
        *(_QWORD *)(v15 + 44) = v16;
        v18 = (uint64_t)v14;
        v19 = 274;
        goto LABEL_30;
      }
    }
    v12 = -1;
    goto LABEL_32;
  }
}

void quic_cc_new_reno_link_flow_controlled(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_8:
    v5 = _os_log_pack_size();
    v6 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_cc_new_reno_link_flow_controlled";
    v8 = (uint64_t)v6;
    v9 = 372;
LABEL_9:
    qlog_internal(17, v8, v9);
    return;
  }
  v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_8;
  }
  if (a2)
  {
    quic_new_reno_congestion_event(v4, a2, a3, 0, a4);
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "quic_cc_new_reno_link_flow_controlled";
    v8 = (uint64_t)v11;
    v9 = 373;
    goto LABEL_9;
  }
}

void quic_cc_new_reno_persistent_congestion(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_11:
    v7 = _os_log_pack_size();
    v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "quic_cc_new_reno_persistent_congestion";
    qlog_internal(17, (uint64_t)v8, 413);
    return;
  }
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_11;
  }
  v5 = 2 * a2;
  if (*(_QWORD *)(v3 + 56) >> 1 <= v5)
    v6 = v5;
  else
    v6 = *(_QWORD *)(v3 + 56) >> 1;
  *(_QWORD *)(v3 + 56) = v5;
  *(_QWORD *)(v3 + 64) = v6;
  quic_cc_log_update(a3, v5, -1, v6);
  if (a3)
  {
    v10[0] = a3;
    objc_msgSend(v10[0], "logCongestionStateUpdated:new_state:trigger:", 5, 0, 0);

  }
}

uint64_t quic_cc_new_reno_can_send_packet(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    goto LABEL_7;
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    return quic_cc_can_send(v2 + 16, a2);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
LABEL_7:
    v4 = _os_log_pack_size();
    v5 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "quic_cc_new_reno_can_send_packet";
    qlog_internal(17, (uint64_t)v5, 462);
  }
  return 0;
}

unint64_t quic_cc_new_reno_get_allowed_cwnd(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
LABEL_9:
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "quic_cc_new_reno_get_allowed_cwnd";
    qlog_internal(17, (uint64_t)v9, 476);
    return 0;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    goto LABEL_9;
  }
  v4 = v1 + 48;
  v2 = *(_QWORD *)(v1 + 48);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = v3 >= v2;
  v6 = v3 - v2;
  if (v5)
    return v6;
  else
    return 0;
}

uint64_t quic_cc_new_reno_get_bytes_in_flight(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    goto LABEL_7;
  }
  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    return *(_QWORD *)(v1 + 48);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
LABEL_7:
    v3 = _os_log_pack_size();
    v4 = (char *)v6 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_cc_new_reno_get_bytes_in_flight";
    qlog_internal(17, (uint64_t)v4, 483);
  }
  return 0;
}

void quic_cc_new_reno_fillout_data_transfer_snapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
LABEL_8:
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_cc_new_reno_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v4;
    v7 = 491;
LABEL_9:
    qlog_internal(17, v6, v7);
    return;
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    goto LABEL_8;
  }
  if (a2)
  {
    *(_OWORD *)(a2 + 152) = *(_OWORD *)(v2 + 56);
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "quic_cc_new_reno_fillout_data_transfer_snapshot";
    v6 = (uint64_t)v9;
    v7 = 492;
    goto LABEL_9;
  }
}

uint64_t __quic_crypto_tls_ready_inner_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  quic_stream_close(*(_QWORD *)(a1 + 32), a3);
  return 1;
}

uint64_t ____quic_signpost_is_enabled_block_invoke_2528()
{
  uint64_t result;

  result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_2527 = result;
  return result;
}

uint64_t __quic_crypto_encryption_secret_update_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a3 + 250) && !*(_BYTE *)(a3 + 251))
    quic_stream_send_create(*(_QWORD *)(a1 + 32), a2, a3);
  return 1;
}

uint64_t quic_crypto_supports_external_data()
{
  return 1;
}

size_t quic_crypto_build_pseudo_retry(unsigned __int8 *a1, int *a2, unsigned __int8 *a3, unsigned __int8 *a4, const void *a5, unsigned int a6, _QWORD *a7)
{
  size_t v13;
  size_t v14;
  size_t v15;
  _BYTE *v16;
  _BYTE *v17;
  const void *v18;
  _BYTE *v19;
  size_t v20;
  size_t v21;
  char *v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  size_t v43;
  int v44;
  char v45;
  _QWORD __src[2];
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v24 = _os_log_pack_size();
    v25 = (char *)&v41 - ((MEMORY[0x24BDAC7A8](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v26 = _os_log_pack_fill();
    *(_DWORD *)v26 = 136446210;
    *(_QWORD *)(v26 + 4) = "quic_crypto_build_pseudo_retry";
    v27 = (uint64_t)v25;
    v28 = 1572;
    goto LABEL_35;
  }
  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v29 = _os_log_pack_size();
    v30 = (char *)&v41 - ((MEMORY[0x24BDAC7A8](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136446210;
    *(_QWORD *)(v31 + 4) = "quic_crypto_build_pseudo_retry";
    v27 = (uint64_t)v30;
    v28 = 1573;
    goto LABEL_35;
  }
  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v32 = _os_log_pack_size();
    v33 = (char *)&v41 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136446210;
    *(_QWORD *)(v34 + 4) = "quic_crypto_build_pseudo_retry";
    v27 = (uint64_t)v33;
    v28 = 1574;
    goto LABEL_35;
  }
  if (!a5)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v35 = _os_log_pack_size();
    v36 = (char *)&v41 - ((MEMORY[0x24BDAC7A8](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v37 = _os_log_pack_fill();
    *(_DWORD *)v37 = 136446210;
    *(_QWORD *)(v37 + 4) = "quic_crypto_build_pseudo_retry";
    v27 = (uint64_t)v36;
    v28 = 1575;
LABEL_35:
    qlog_internal(17, v27, v28);
    return 0;
  }
  if (!a7)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v38 = _os_log_pack_size();
      v39 = (char *)&v41 - ((MEMORY[0x24BDAC7A8](v38, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v40 = _os_log_pack_fill();
      *(_DWORD *)v40 = 136446210;
      *(_QWORD *)(v40 + 4) = "quic_crypto_build_pseudo_retry";
      v27 = (uint64_t)v39;
      v28 = 1577;
      goto LABEL_35;
    }
    return 0;
  }
  __src[0] = 0;
  __src[1] = 0;
  v47 = 0;
  v13 = *a1;
  v14 = *a3;
  v15 = *a4;
  v42 = a6;
  v43 = a6 + v13 + v14 + v15 + 8;
  v16 = malloc_type_malloc(v43, 0xF2B69DE5uLL);
  if (!v16)
    qlog_abort_internal("%s strict_malloc(%zu) failed", "strict_malloc", v43);
  v44 = *a2;
  v45 = *((_BYTE *)a2 + 4);
  *a7 = v16;
  *v16 = v13;
  v17 = v16 + 1;
  if ((_DWORD)v13)
  {
    quic_cid_write(a1, __src, v13);
    memcpy(v17, __src, v13);
    v17 += v13;
  }
  v18 = a5;
  *(_DWORD *)v17 = v44;
  v17[4] = v45;
  v19 = v17 + 6;
  v17[5] = v14;
  if ((_DWORD)v14)
  {
    quic_cid_write(a3, __src, v14);
    memcpy(v17 + 6, __src, v14);
    v19 += v14;
  }
  v21 = v42;
  v20 = v43;
  *v19 = v15;
  v22 = v19 + 1;
  if ((_DWORD)v15)
  {
    quic_cid_write(a4, __src, v15);
    memcpy(v22, __src, v15);
    v22 += v15;
  }
  memcpy(v22, v18, v21);
  return v20;
}

void quic_cid_copy(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v2 = *(_OWORD *)(a2 + 1);
      *(_DWORD *)(a1 + 17) = *(_DWORD *)(a2 + 17);
      *(_OWORD *)(a1 + 1) = v2;
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_cid_copy";
      v6 = (uint64_t)v9;
      v7 = 108;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_cid_copy";
    v6 = (uint64_t)v4;
    v7 = 107;
LABEL_13:
    qlog_internal(17, v6, v7);
  }
}

BOOL quic_cid_equal(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  _BOOL8 result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
    }
    v14 = _os_log_pack_size();
    v15 = (char *)v22 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136446210;
    *(_QWORD *)(v16 + 4) = "quic_cid_equal";
    v17 = (uint64_t)v15;
    v18 = 135;
    goto LABEL_26;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
    }
    v19 = _os_log_pack_size();
    v20 = (char *)v22 - ((MEMORY[0x24BDAC7A8](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136446210;
    *(_QWORD *)(v21 + 4) = "quic_cid_equal";
    v17 = (uint64_t)v20;
    v18 = 136;
LABEL_26:
    qlog_internal(17, v17, v18);
    return 0;
  }
  v2 = *a1;
  if ((_DWORD)v2 != *a2)
    return 0;
  if (v2 >= 0x14)
    v3 = 20;
  else
    v3 = *a1;
  if (!v3)
    return 1;
  if (v2 >= 0x14)
    v2 = 20;
  v4 = v2 - 1;
  v5 = a2 + 1;
  v6 = a1 + 1;
  do
  {
    v8 = *v6++;
    v7 = v8;
    v10 = *v5++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

dispatch_data_t quic_cid_to_dispatch_data(unsigned __int8 *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
    return dispatch_data_create(a1 + 1, *a1, 0, 0);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_cid_to_dispatch_data";
    qlog_internal(17, (uint64_t)v3, 170);
  }
  return 0;
}

uint64_t __quic_cid_from_dispatch_data_block_invoke(uint64_t a1, int a2, int a3, void *__src, uint64_t a5)
{
  if (*(_QWORD *)(a1 + 32) == a5)
    quic_cid_read(__src, a5, *(_BYTE **)(a1 + 40));
  return 0;
}

void quic_cid_entry_erase(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 40) = 0;
    *(_OWORD *)(a1 + 1) = 0u;
    *(_OWORD *)(a1 + 17) = 0u;
    *(_QWORD *)(a1 + 30) = 0;
    *(_BYTE *)(a1 + 38) &= 0xFCu;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v1 = _os_log_pack_size();
    v2 = (char *)v4 - ((MEMORY[0x24BDAC7A8](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v3 = _os_log_pack_fill();
    *(_DWORD *)v3 = 136446210;
    *(_QWORD *)(v3 + 4) = "quic_cid_entry_erase";
    qlog_internal(17, (uint64_t)v2, 228);
  }
}

void quic_cid_array_remove_by_seq_num(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*a1)
    {
      v2 = 0;
      v3 = *((_QWORD *)a1 + 1);
      v4 = (uint64_t *)(v3 + 40);
      while (1)
      {
        v5 = *v4;
        v4 += 6;
        if (v5 == a2)
          break;
        if (*a1 == ++v2)
          return;
      }
      quic_cid_entry_erase(v3 + 48 * v2);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v9 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "quic_cid_array_remove_by_seq_num";
    qlog_internal(17, (uint64_t)v7, 341);
  }
}

uint64_t quic_cid_array_find_next_cid(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  unsigned __int8 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *a1;
    v3 = *((_QWORD *)a1 + 1);
    if (v2 <= (a2 + 1))
    {
LABEL_8:
      v7 = 0;
      while ((*(_BYTE *)(v3 + 48 * v7 + 38) & 5) != 0 || !*(_BYTE *)(v3 + 48 * v7 + 1))
      {
        if (a2 < ++v7)
          return 0;
      }
      return v3 + 48 * v7;
    }
    else
    {
      v4 = (a2 + 1);
      v5 = (_BYTE *)(v3 + 48 * v4 + 38);
      while ((*v5 & 5) != 0 || !*(v5 - 37))
      {
        ++v4;
        v5 += 48;
        if (v2 == v4)
          goto LABEL_8;
      }
      return v3 + 48 * v4;
    }
  }
  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_cid_array_find_next_cid";
      qlog_internal(17, (uint64_t)v9, 373);
    }
    return 0;
  }
}

uint64_t quic_cid_array_find_by_srt(unsigned __int8 *a1, int8x16_t *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "quic_cid_array_find_by_srt";
    v9 = (uint64_t)v7;
    v10 = 412;
LABEL_18:
    qlog_internal(17, v9, v10);
    return 0;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }
    v11 = _os_log_pack_size();
    v12 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "quic_cid_array_find_by_srt";
    v9 = (uint64_t)v12;
    v10 = 413;
    goto LABEL_18;
  }
  v3 = *a1;
  if (!*a1)
    return 0;
  result = 0;
  v5 = *((_QWORD *)a1 + 1);
  do
  {
    if ((vmaxvq_u8((uint8x16_t)vmvnq_s8(vceqq_s8(*(int8x16_t *)(v5 + 22), *a2))) & 1) == 0
      && (*(_BYTE *)(v5 + 38) & 2) != 0)
    {
      result = v5;
    }
    v5 += 48;
    --v3;
  }
  while (v3);
  return result;
}

uint64_t quic_cid_array_is_empty(unsigned __int8 *a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136446210;
      *(_QWORD *)(v9 + 4) = "quic_cid_array_is_empty";
      qlog_internal(17, (uint64_t)v8, 437);
    }
    return 0;
  }
  v1 = *a1;
  if (!*a1)
    return 1;
  v2 = *((_QWORD *)a1 + 1);
  if (*(_BYTE *)(v2 + 1))
    return 0;
  v4 = 0;
  v5 = (unsigned __int8 *)(v2 + 49);
  while (v1 - 1 != v4)
  {
    v6 = *v5;
    v5 += 48;
    ++v4;
    if (v6)
      return v4 >= v1;
  }
  v4 = *a1;
  return v4 >= v1;
}

void quic_cid_array_apply(unsigned __int8 *a1, uint64_t a2)
{
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v7 = _os_log_pack_size();
    v8 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "quic_cid_array_apply";
    v10 = (uint64_t)v8;
    v11 = 451;
LABEL_17:
    qlog_internal(17, v10, v11);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v12 = _os_log_pack_size();
    v13 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "quic_cid_array_apply";
    v10 = (uint64_t)v13;
    v11 = 452;
    goto LABEL_17;
  }
  v4 = *a1;
  if (*a1)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      if (*(_BYTE *)(*((_QWORD *)a1 + 1) + v6))
      {
        if (!(*(unsigned int (**)(uint64_t))(a2 + 16))(a2))
          return;
        v4 = *a1;
      }
      ++v5;
      v6 += 48;
    }
    while (v5 < v4);
  }
}

uint64_t quic_cid_entry_cid(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
    return a1 + 1;
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_cid_entry_cid";
    qlog_internal(17, (uint64_t)v3, 466);
  }
  return 0;
}

uint64_t quic_cid_entry_seq_number(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
    return *(_QWORD *)(a1 + 40);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_cid_entry_seq_number";
    qlog_internal(17, (uint64_t)v3, 506);
  }
  return 0;
}

uint64_t __quic_ack_send_pending_acks_block_invoke(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (quic_path_is_initial(a2) || quic_path_is_validated(a2))
  {
    v4 = (char *)a1[4];
    v5 = a1[5];
    v6 = a1[6];
    v7 = a1[7];
    if (quic_ack_assemble_all(v4, *(_QWORD *)(v5 + 536), v6, *(_QWORD *)(v5 + 968), a2, *(_QWORD *)(a2 + 336))&& quic_conn_send_internal(v5, a2, 0))
    {
      quic_ack_sent((uint64_t)v4, v7);
    }
  }
  return 1;
}

void quic_ack_destroy_multipath_pn_space(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2 != -1 && (*(_BYTE *)(a1 + 233) & 0x10) != 0)
    {
      v2 = *(_QWORD **)(a1 + 192);
      while (v2)
      {
        v3 = v2;
        v2 = (_QWORD *)v2[10];
        if (v3[8] == a2)
        {
          v4 = (_QWORD *)v3[11];
          if (v2)
          {
            v2[11] = v4;
            v4 = (_QWORD *)v3[11];
          }
          else
          {
            *(_QWORD *)(a1 + 200) = v4;
          }
          *v4 = v2;
          while (1)
          {
            v5 = (_QWORD *)*v3;
            if (!*v3)
              break;
            v6 = v5[2];
            v7 = (_QWORD *)v5[3];
            if (v6)
            {
              *(_QWORD *)(v6 + 24) = v7;
              v7 = (_QWORD *)v5[3];
            }
            else
            {
              v3[1] = v7;
            }
            *v7 = v6;
            free(v5);
          }
          free(v3);
          return;
        }
      }
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "quic_ack_destroy_multipath_pn_space";
    qlog_internal(17, (uint64_t)v9, 528);
  }
}

void quic_ack_supports_ack_frequency(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_BYTE *)(a1 + 233) |= 2u;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v1 = _os_log_pack_size();
    v2 = (char *)v4 - ((MEMORY[0x24BDAC7A8](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v3 = _os_log_pack_fill();
    *(_DWORD *)v3 = 136446210;
    *(_QWORD *)(v3 + 4) = "quic_ack_supports_ack_frequency";
    qlog_internal(17, (uint64_t)v2, 888);
  }
}

BOOL quic_ack_process_frequency(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  unint64_t v7;
  BOOL v8;
  int v12;
  char v13;
  char v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  double v31;
  char v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return a1 != 0;
    }
    v34 = _os_log_pack_size();
    v35 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136446210;
    *(_QWORD *)(v36 + 4) = "quic_ack_process_frequency";
    v21 = 17;
    v22 = (uint64_t)v35;
    v23 = 956;
LABEL_17:
    qlog_internal(v21, v22, v23);
    return a1 != 0;
  }
  v7 = *(_QWORD *)(a1 + 272);
  if (v7)
    v8 = v7 >= a2;
  else
    v8 = 0;
  if (v8)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      return a1 != 0;
    }
    v18 = _os_log_pack_size();
    v19 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136446466;
    *(_QWORD *)(v20 + 4) = "quic_ack_process_frequency";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = a2;
    v21 = 2;
    v22 = (uint64_t)v19;
    v23 = 959;
    goto LABEL_17;
  }
  *(_QWORD *)(a1 + 272) = a2;
  v12 = qlog_debug_enabled;
  v13 = qlog_nwlog_enabled;
  if (a3 <= 0xFFFE)
  {
    if (qlog_debug_enabled)
      v14 = 1;
    else
      v14 = qlog_nwlog_enabled;
    if ((v14 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v17 = _os_log_pack_fill();
      *(_DWORD *)v17 = 136446466;
      *(_QWORD *)(v17 + 4) = "quic_ack_process_frequency";
      *(_WORD *)(v17 + 12) = 2048;
      *(_QWORD *)(v17 + 14) = a3;
      qlog_internal(1, (uint64_t)v16, 965);
      v12 = qlog_debug_enabled;
      v13 = qlog_nwlog_enabled;
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }
    *(_DWORD *)(a1 + 236) = a3;
    *(_BYTE *)(a1 + 233) |= 8u;
  }
  if (v12)
    v24 = 1;
  else
    v24 = v13;
  if (*(_QWORD *)(a1 + 248) == a4)
  {
    if ((v24 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v25 = _os_log_pack_size();
      v26 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v27 = _os_log_pack_fill();
      *(_DWORD *)v27 = 136446210;
      *(_QWORD *)(v27 + 4) = "quic_ack_process_frequency";
      qlog_internal(2, (uint64_t)v26, 987);
    }
  }
  else
  {
    if ((v24 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    {
      v28 = _os_log_pack_size();
      v29 = (char *)v37 - ((MEMORY[0x24BDAC7A8](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v30 = _os_log_pack_fill();
      v31 = (double)*(unint64_t *)(a1 + 248) * 0.001;
      *(_DWORD *)v30 = 136446722;
      *(_QWORD *)(v30 + 4) = "quic_ack_process_frequency";
      *(_WORD *)(v30 + 12) = 2048;
      *(double *)(v30 + 14) = (double)(unint64_t)a4 * 0.001;
      *(_WORD *)(v30 + 22) = 2048;
      *(double *)(v30 + 24) = v31;
      qlog_internal(1, (uint64_t)v29, 979);
    }
    *(_QWORD *)(a1 + 248) = a4;
    if ((*(_BYTE *)(a1 + 233) & 1) != 0)
      quic_timer_reschedule(*(unsigned __int8 ***)(a1 + 208), *(unsigned __int8 *)(a1 + 232), a4);
  }
  if (a5)
    v32 = 4;
  else
    v32 = 0;
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a1 + 233) & 0xFB | v32;
  return a1 != 0;
}

void quic_pacer_service_queue(uint64_t a1, void **a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  int v27;
  _QWORD v28[8];

  v28[7] = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v16 = _os_log_pack_size();
    v17 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136446210;
    *(_QWORD *)(v18 + 4) = "quic_pacer_service_queue";
    v19 = (uint64_t)v17;
    v20 = 228;
LABEL_42:
    qlog_internal(17, v19, v20);
    return;
  }
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v21 = _os_log_pack_size();
    v22 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136446210;
    *(_QWORD *)(v23 + 4) = "quic_pacer_service_queue";
    v19 = (uint64_t)v22;
    v20 = 229;
    goto LABEL_42;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v4 = 0;
    while (1)
    {
      v5 = *(_DWORD *)(a1 + 40);
      if (v5)
      {
        v6 = 0;
        do
        {
          v7 = *(_QWORD *)(a1 + 64);
          if (!v7)
            break;
          v8 = *(_QWORD *)(v7 + 24);
          v9 = *(_QWORD **)(v7 + 32);
          if (v8)
          {
            *(_QWORD *)(v8 + 32) = v9;
            v9 = *(_QWORD **)(v7 + 32);
          }
          else
          {
            *(_QWORD *)(a1 + 72) = v9;
          }
          *v9 = v8;
          *(_QWORD *)(v7 + 24) = 0;
          *(_QWORD *)(v7 + 32) = 0;
          v6 += *(unsigned __int16 *)(v7 + 16);
          if (v6 > v5 || !*(_QWORD *)(a1 + 64))
            *(_DWORD *)(*(_QWORD *)(v7 + 8) + 232) &= ~8u;
          quic_pacer_send_now(a1, (_QWORD *)v7);
          v5 = *(_DWORD *)(a1 + 40);
        }
        while (v6 < v5);
      }
      else
      {
        v6 = 0;
      }
      if (!*(_QWORD *)(a1 + 64))
      {
        *(_BYTE *)(a1 + 50) &= ~1u;
        return;
      }
      v4 += v6;
      if (v4 >= *(_DWORD *)(a1 + 44))
        break;
      v10 = *(_QWORD *)a1;
      v11 = *(unsigned int *)(a1 + 32);
      if (*(_QWORD *)a1 || (_DWORD)v11)
      {
        if (timebase_info_once != -1)
          dispatch_once(&timebase_info_once, &__block_literal_global_397);
        v12 = dword_253D0A9BC * (v10 + v11);
        if (timebase_info_info <= v12)
          mach_wait_until(v12 / timebase_info_info);
      }
      if (!*(_QWORD *)(a1 + 64))
        return;
    }
    v13 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled)
      v14 = 0;
    else
      v14 = qlog_nwlog_enabled == 0;
    if (!v14)
    {
      if (qlog_debug_enabled)
        v13 = 1;
      if ((v13 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v24 = _os_log_pack_size();
        v25 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v26 = _os_log_pack_fill();
        v27 = *(_DWORD *)(a1 + 44);
        *(_DWORD *)v26 = 136446722;
        *(_QWORD *)(v26 + 4) = "quic_pacer_service_queue";
        *(_WORD *)(v26 + 12) = 1024;
        *(_DWORD *)(v26 + 14) = v4;
        *(_WORD *)(v26 + 18) = 1024;
        *(_DWORD *)(v26 + 20) = v27;
        qlog_internal(2, (uint64_t)v25, 246);
      }
    }
    v15 = *a2;
    nw_retain(v15);
    v28[1] = MEMORY[0x24BDAC760];
    v28[2] = 0x40000000;
    v28[3] = __quic_pacer_service_queue_block_invoke;
    v28[4] = &__block_descriptor_tmp_3008;
    v28[5] = a1;
    v28[6] = v15;
    nw_protocol_instance_async();
  }
}

void quic_pacer_send_now(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  int generation_count;
  char v9;
  unint64_t size;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    if (a2)
    {
      v4 = a2[1];
      if (v4)
      {
        if (*a2)
        {
          v6 = mach_continuous_time();
          if (timebase_info_once != -1)
            dispatch_once(&timebase_info_once, &__block_literal_global_397);
          v7 = timebase_info_info * v6 / dword_253D0A9BC / 0x3E8;
          if ((*(_BYTE *)(v4 + 233) & 0x20) != 0)
          {
            generation_count = quic_ack_get_generation_count(*(char **)(v2 + 960), *(unsigned __int8 *)(v4 + 83), *(_QWORD *)(v4 + 224), v7);
            v9 = qlog_nwlog_enabled;
            if (qlog_datapath_enabled || qlog_nwlog_enabled)
            {
              if (qlog_debug_enabled)
                v9 = 1;
              if ((v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
              {
                v29 = _os_log_pack_size();
                v30 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                v31 = _os_log_pack_fill();
                *(_DWORD *)v31 = 136446466;
                *(_QWORD *)(v31 + 4) = "quic_pacer_send_now";
                *(_WORD *)(v31 + 12) = 1024;
                *(_DWORD *)(v31 + 14) = generation_count;
                qlog_internal(2, (uint64_t)v30, 142);
              }
            }
            nw_protocol_data_set_compression_generation_count();
          }
          size = nw_protocol_data_get_size();
          v11 = *((unsigned __int16 *)a2 + 8);
          if (size > v11)
          {
            nw_protocol_data_trim();
            LODWORD(v11) = *((unsigned __int16 *)a2 + 8);
          }
          v12 = *(_QWORD **)(v2 + 1312);
          if (v12)
          {
            v13 = v12[1] + v11;
            ++*v12;
            v12[1] = v13;
          }
          *(_QWORD *)(v2 + 1168) += v11;
          ++*(_QWORD *)(v2 + 1160);
          if ((*(_DWORD *)(v4 + 232) & 0x80) != 0)
            ++*(_QWORD *)(v2 + 1248);
          nw_protocol_instance_add_outbound();
          if (__quic_signpost_is_enabled__quic_signposts_once_3025 != -1)
            dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3025, &__block_literal_global_3026);
          if (__quic_signpost_is_enabled__quic_signposts_enabled_3027 && kdebug_is_enabled())
          {
            kdebug_trace();
            v14 = (void *)*a2;
            if (!*a2)
              goto LABEL_23;
          }
          else
          {
            v14 = (void *)*a2;
            if (!*a2)
            {
LABEL_23:
              quic_conn_packet_dispatched(v2, (_QWORD *)v4, *((_BYTE *)a2 + 18) & 1, v7);
              if ((*((_BYTE *)a2 + 18) & 2) != 0)
                quic_ack_sent(*(_QWORD *)(v2 + 960), v7);
              v15 = *(_QWORD *)(a1 + 80);
              if (v15 && *(_DWORD *)(v15 + 16) < 0x1000u)
              {
                a2[4] = 0;
                *(_OWORD *)a2 = 0u;
                *((_OWORD *)a2 + 1) = 0u;
                v16 = *(_QWORD **)(v15 + 8);
                a2[4] = v16;
                *v16 = a2;
                *(_QWORD *)(v15 + 8) = a2 + 3;
                ++*(_DWORD *)(v15 + 16);
              }
              else
              {
                free(a2);
              }
              return;
            }
          }
          nw_release(v14);
          *a2 = 0;
          goto LABEL_23;
        }
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          v26 = _os_log_pack_size();
          v27 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v28 = _os_log_pack_fill();
          *(_DWORD *)v28 = 136446210;
          *(_QWORD *)(v28 + 4) = "quic_pacer_send_now";
          qlog_internal(17, (uint64_t)v27, 128);
        }
      }
      else if (qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v23 = _os_log_pack_size();
        v24 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v25 = _os_log_pack_fill();
        *(_DWORD *)v25 = 136446210;
        *(_QWORD *)(v25 + 4) = "quic_pacer_send_now";
        qlog_internal(17, (uint64_t)v24, 127);
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v20 = _os_log_pack_size();
      v21 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v22 = _os_log_pack_fill();
      *(_DWORD *)v22 = 136446210;
      *(_QWORD *)(v22 + 4) = "quic_pacer_send_now";
      qlog_internal(17, (uint64_t)v21, 126);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v17 = _os_log_pack_size();
    v18 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "quic_pacer_send_now";
    qlog_internal(17, (uint64_t)v18, 125);
  }
}

void __quic_pacer_service_queue_block_invoke(uint64_t a1)
{
  quic_pacer_continue_sending(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  nw_release(*(void **)(a1 + 40));
}

void quic_pacer_continue_sending(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v5[1] = MEMORY[0x24BDAC760];
    v5[2] = 0x40000000;
    v5[3] = __quic_pacer_continue_sending_block_invoke;
    v5[4] = &__block_descriptor_tmp_3_3012;
    v5[5] = a1;
    v5[6] = a2;
    nw_protocol_instance_access_state();
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_pacer_continue_sending";
    qlog_internal(17, (uint64_t)v3, 204);
  }
}

uint64_t __quic_pacer_continue_sending_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v4 = mach_absolute_time();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    v5 = *(_QWORD *)(a1 + 32);
    if (timebase_info_info * v4 / dword_253D0A9BC < *(_QWORD *)v5
                                                                               + (unint64_t)*(unsigned int *)(v5 + 32))
    {
      v6 = *(unsigned int *)(v5 + 32);
      if (*(_QWORD *)v5 || (_DWORD)v6)
      {
        v7 = *(_QWORD *)v5 + v6;
        if (timebase_info_once != -1)
        {
          v10 = *(_QWORD *)v5 + v6;
          dispatch_once(&timebase_info_once, &__block_literal_global_397);
          v7 = v10;
        }
        v8 = dword_253D0A9BC * v7;
        if (timebase_info_info <= v8)
          mach_wait_until(v8 / timebase_info_info);
      }
      v5 = *(_QWORD *)(a1 + 32);
    }
    quic_pacer_service_queue(v5, a2);
    nw_protocol_implementation_finalize_pending_frames();
  }
  return 1;
}

uint64_t ____quic_signpost_is_enabled_block_invoke_3028()
{
  uint64_t result;

  result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_3027 = result;
  return result;
}

void quic_pacer_wait_until_next_deadline(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = *(unsigned int *)(a1 + 32);
    if (*(_QWORD *)a1)
      v2 = 0;
    else
      v2 = (_DWORD)v1 == 0;
    if (!v2)
    {
      v3 = *(_QWORD *)a1 + v1;
      if (timebase_info_once != -1)
        dispatch_once(&timebase_info_once, &__block_literal_global_397);
      v4 = dword_253D0A9BC * v3;
      if (timebase_info_info <= v4)
        mach_wait_until(v4 / timebase_info_info);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v5 = _os_log_pack_size();
    v6 = (char *)v8 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_pacer_wait_until_next_deadline";
    qlog_internal(17, (uint64_t)v6, 471);
  }
}

void quic_pacer_send_packet(uint64_t a1, void *a2, uint64_t a3, unsigned int a4, char a5, int a6)
{
  void **v7;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  _DWORD *v17;
  unsigned int v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  _QWORD v36[8];

  v36[7] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v25 = _os_log_pack_size();
    v26 = (char *)v36 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136446210;
    *(_QWORD *)(v27 + 4) = "quic_pacer_send_packet";
    v28 = (uint64_t)v26;
    v29 = 274;
LABEL_34:
    qlog_internal(17, v28, v29);
    return;
  }
  v7 = *(void ***)(a1 + 56);
  if (!v7)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v30 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v32 = _os_log_pack_fill();
    *(_DWORD *)v32 = 136446210;
    *(_QWORD *)(v32 + 4) = "quic_pacer_send_packet";
    v28 = (uint64_t)v31;
    v29 = 275;
    goto LABEL_34;
  }
  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v33 = _os_log_pack_size();
    v34 = (char *)v36 - ((MEMORY[0x24BDAC7A8](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v35 = _os_log_pack_fill();
    *(_DWORD *)v35 = 136446210;
    *(_QWORD *)(v35 + 4) = "quic_pacer_send_packet";
    v28 = (uint64_t)v34;
    v29 = 278;
    goto LABEL_34;
  }
  paced_packet_create(*(void ***)(a1 + 80));
  v14 = v13;
  nw_retain(a2);
  *(_QWORD *)v14 = a2;
  *(_QWORD *)(v14 + 8) = a3;
  *(_WORD *)(v14 + 16) = a4;
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_BYTE *)(v14 + 18) = v15 | a5 | *(_BYTE *)(v14 + 18) & 0xFC;
  v16 = 1000000000 * (unint64_t)a4 / *(_QWORD *)(a1 + 24);
  if (v16 >= 0x989681)
  {
    v17 = (_DWORD *)(a1 + 32);
    goto LABEL_9;
  }
  v17 = (_DWORD *)(a1 + 32);
  if (v16 >= 0xC351)
LABEL_9:
    LODWORD(v16) = 50000;
  *(_DWORD *)(a1 + 32) = v16;
  v18 = *(unsigned __int16 *)(a1 + 48);
  v19 = v16 >= v18;
  v20 = v16 - v18;
  if (v20 != 0 && v19)
    *v17 = v20;
  v21 = mach_absolute_time();
  if (timebase_info_once != -1)
    dispatch_once(&timebase_info_once, &__block_literal_global_397);
  if (timebase_info_info * v21 / dword_253D0A9BC <= *(_QWORD *)a1
                                                                               + (unint64_t)*(unsigned int *)(a1 + 32))
  {
    *(_QWORD *)(v14 + 24) = 0;
    v23 = *(_QWORD **)(a1 + 72);
    *(_QWORD *)(v14 + 32) = v23;
    *v23 = v14;
    *(_QWORD *)(a1 + 72) = v14 + 24;
    if ((*(_BYTE *)(a1 + 50) & 1) == 0)
    {
      *(_BYTE *)(a1 + 50) |= 1u;
      v24 = *v7;
      nw_retain(v24);
      v36[1] = MEMORY[0x24BDAC760];
      v36[2] = 0x40000000;
      v36[3] = __quic_pacer_send_packet_block_invoke;
      v36[4] = &__block_descriptor_tmp_1_3042;
      v36[5] = a1;
      v36[6] = v24;
      nw_protocol_instance_async();
    }
  }
  else if (*(_QWORD *)(a1 + 64))
  {
    *(_QWORD *)(v14 + 24) = 0;
    v22 = *(_QWORD **)(a1 + 72);
    *(_QWORD *)(v14 + 32) = v22;
    *v22 = v14;
    *(_QWORD *)(a1 + 72) = v14 + 24;
    quic_pacer_service_queue(a1, v7);
  }
  else
  {
    quic_pacer_send_now(a1, (_QWORD *)v14);
  }
}

void paced_packet_create(void **a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = a1;
    v2 = *a1;
    if (v2)
    {
      v4 = v2[3];
      v5 = (_QWORD *)v2[4];
      v3 = v2 + 3;
      if (v4)
      {
        *(_QWORD *)(v4 + 32) = v5;
        v5 = (_QWORD *)v2[4];
LABEL_8:
        *v5 = v4;
        *v3 = 0;
        v3[1] = 0;
        --*((_DWORD *)v1 + 4);
        goto LABEL_9;
      }
    }
    else
    {
      v2 = malloc_type_malloc(0x28uLL, 0xF2B69DE5uLL);
      if (v2)
      {
LABEL_9:
        v2[4] = 0;
        *(_OWORD *)v2 = 0u;
        *((_OWORD *)v2 + 1) = 0u;
        return;
      }
      qlog_abort_internal("%s strict_malloc(%zu) failed", "strict_malloc", 0x28uLL);
    }
    v1[1] = v5;
    goto LABEL_8;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v9 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "paced_packet_create";
    qlog_internal(17, (uint64_t)v7, 89);
  }
}

void __quic_pacer_send_packet_block_invoke(uint64_t a1)
{
  quic_pacer_continue_sending(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  nw_release(*(void **)(a1 + 40));
}

uint64_t quic_pacer_get_packet_interval(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t name;
  uint64_t cwnd;
  uint64_t smoothed_rtt;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = 10000000;
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v3 = 1000000000 * (unint64_t)a3 / v4;
    if (v3 > 0x989680)
      return 10000000;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    v10 = *(_QWORD *)(a2 + 16);
    name = quic_cc_get_name(*(_QWORD **)(a1 + 360));
    cwnd = quic_cc_get_cwnd(*(_QWORD *)(a1 + 360));
    smoothed_rtt = quic_rtt_get_smoothed_rtt(*(_QWORD *)(a1 + 272));
    *(_DWORD *)v9 = 136447234;
    *(_QWORD *)(v9 + 4) = "quic_pacer_get_packet_interval";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = v10;
    *(_WORD *)(v9 + 22) = 2080;
    *(_QWORD *)(v9 + 24) = name;
    *(_WORD *)(v9 + 32) = 2048;
    *(_QWORD *)(v9 + 34) = cwnd;
    *(_WORD *)(v9 + 42) = 2048;
    *(_QWORD *)(v9 + 44) = smoothed_rtt;
    qlog_internal(17, (uint64_t)v8, 356);
  }
  return v3;
}

void quic_pacer_packet_sent(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = mach_absolute_time();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    *a1 = timebase_info_info * v2 / dword_253D0A9BC;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v3 = _os_log_pack_size();
    v4 = (char *)v6 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_pacer_packet_sent";
    qlog_internal(17, (uint64_t)v4, 338);
  }
}

void quic_pacer_get_packet_tx_time(uint64_t a1, uint64_t a2, unsigned int a3, unint64_t *a4, _QWORD *a5)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v16 = 0;
    mach_get_times();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    v17 = 0uLL / dword_253D0A9BC;
    v16 = timebase_info_info * v16 / dword_253D0A9BC;
    v10 = *(_QWORD *)(a2 + 8);
    if (v10)
    {
      quic_pacer_get_packet_tx_time_size += a3;
      if (quic_pacer_get_packet_tx_time_size <= *(_DWORD *)(a2 + 40))
      {
        v11 = v17;
        goto LABEL_11;
      }
      v10 = *(_QWORD *)(a2 + 8) + quic_pacer_get_packet_interval(a1, a2, a3);
      *(_QWORD *)(a2 + 8) = v10;
      quic_pacer_get_packet_tx_time_size = a3;
      v11 = v17;
      if (v17 <= v10)
      {
LABEL_11:
        *a4 = v10;
        *a5 = v16 + *(_QWORD *)(a2 + 8) - v11;
        return;
      }
      *(_QWORD *)(a2 + 8) = v17;
    }
    else
    {
      v11 = v17;
      *(_QWORD *)(a2 + 8) = v17;
      quic_pacer_get_packet_tx_time_size = a3;
    }
    v10 = v11;
    goto LABEL_11;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v12 = _os_log_pack_size();
    v13 = (char *)&v15 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "quic_pacer_get_packet_tx_time";
    qlog_internal(17, (uint64_t)v13, 376);
  }
}

void quic_pacer_set_rate(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 24) = a2;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_pacer_set_rate";
    qlog_internal(17, (uint64_t)v3, 426);
  }
}

void quic_pacer_set_burst_size(uint64_t a1, int a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_DWORD *)(a1 + 40) = a2;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_pacer_set_burst_size";
    qlog_internal(17, (uint64_t)v3, 438);
  }
}

uint64_t quic_pacer_get_burst_gap(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
    return *(unsigned int *)(a1 + 44);
  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_pacer_get_burst_gap";
    qlog_internal(17, (uint64_t)v3, 445);
    return 0;
  }
  return result;
}

void quic_pacer_set_gap(uint64_t a1, int a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_DWORD *)(a1 + 44) = a2;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_pacer_set_gap";
    qlog_internal(17, (uint64_t)v3, 464);
  }
}

void quic_pacer_set_initial_state(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 16) = a2;
    *(_DWORD *)(a1 + 36) = a3;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v3 = _os_log_pack_size();
    v4 = (char *)v6 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_pacer_set_initial_state";
    qlog_internal(17, (uint64_t)v4, 493);
  }
}

void quic_pacer_reset(uint64_t a1)
{
  int v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16);
    v1 = *(_DWORD *)(a1 + 36);
    *(_DWORD *)(a1 + 40) = v1;
    *(_DWORD *)(a1 + 44) = v1;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_pacer_reset";
    qlog_internal(17, (uint64_t)v3, 506);
  }
}

void quic_pacer_create(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 1380);
  v3 = malloc_type_calloc(1uLL, 0x58uLL, 0xEAFB8F1AuLL);
  if (v3)
  {
    v4 = v3;
    if ((v2 & 0x200000000) != 0)
    {
LABEL_5:
      v4[7] = a1;
      *((_WORD *)v4 + 24) = 100;
      return;
    }
    v5 = malloc_type_calloc(1uLL, 0x18uLL, 0xEAFB8F1AuLL);
    if (v5)
    {
      v4[8] = 0;
      v4[9] = v4 + 8;
      v4[10] = v5;
      *v5 = 0;
      v5[1] = v5;
      goto LABEL_5;
    }
    v6 = 24;
  }
  else
  {
    v6 = 88;
  }
  qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v6);
  _quic_pacer_destroy(v7);
}

void _quic_pacer_destroy(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  void *buffer;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(*((_QWORD *)a1 + 7) + 1384) & 2) != 0)
  {
    if (!*((_QWORD *)a1 + 8))
    {
LABEL_30:
      free(a1);
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v9 = _os_log_pack_size();
      v10 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v11 = _os_log_pack_fill();
      *(_DWORD *)v11 = 136446210;
      *(_QWORD *)(v11 + 4) = "_quic_pacer_destroy";
      v12 = (uint64_t)v10;
      v13 = 590;
LABEL_35:
      qlog_internal(17, v12, v13);
    }
  }
  else
  {
    v2 = *((_QWORD *)a1 + 10);
    if (v2)
    {
      v3 = *((_QWORD *)a1 + 8);
      if (v3)
      {
        do
        {
          v5 = *(_QWORD *)(v3 + 24);
          v6 = *(_QWORD **)(v3 + 32);
          if (v5)
          {
            *(_QWORD *)(v5 + 32) = v6;
            v6 = *(_QWORD **)(v3 + 32);
          }
          else
          {
            *((_QWORD *)a1 + 9) = v6;
          }
          *v6 = v5;
          *(_QWORD *)(v3 + 24) = 0;
          *(_QWORD *)(v3 + 32) = 0;
          if (*(_QWORD *)v3)
          {
            buffer = (void *)nw_frame_get_buffer();
            if (buffer)
              free(buffer);
            nw_frame_reset();
            if (*(_QWORD *)v3)
            {
              nw_release(*(void **)v3);
              *(_QWORD *)v3 = 0;
            }
          }
          v8 = *(_QWORD **)(v3 + 8);
          if (v8)
            _quic_packet_destroy(v8);
          free((void *)v3);
          v3 = *((_QWORD *)a1 + 8);
        }
        while (v3);
        v2 = *((_QWORD *)a1 + 10);
        v4 = *(_QWORD **)v2;
        if (!*(_QWORD *)v2)
          goto LABEL_23;
      }
      else
      {
        v4 = *(_QWORD **)v2;
        if (!*(_QWORD *)v2)
        {
LABEL_23:
          *(_DWORD *)(v2 + 16) = 0;
LABEL_29:
          free((void *)v2);
          goto LABEL_30;
        }
      }
      do
      {
        v14 = v4[3];
        v15 = (_QWORD *)v4[4];
        if (v14)
        {
          *(_QWORD *)(v14 + 32) = v15;
          v15 = (_QWORD *)v4[4];
        }
        else
        {
          *(_QWORD *)(v2 + 8) = v15;
        }
        *v15 = v14;
        free(v4);
        v4 = *(_QWORD **)v2;
      }
      while (*(_QWORD *)v2);
      v16 = *((_QWORD *)a1 + 10);
      *(_DWORD *)(v2 + 16) = 0;
      v2 = v16;
      if (!v16)
        goto LABEL_30;
      goto LABEL_29;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v17 = _os_log_pack_size();
      v18 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v19 = _os_log_pack_fill();
      *(_DWORD *)v19 = 136446210;
      *(_QWORD *)(v19 + 4) = "_quic_pacer_destroy";
      v12 = (uint64_t)v18;
      v13 = 546;
      goto LABEL_35;
    }
  }
}

uint64_t ____quic_signpost_is_enabled_block_invoke_3119()
{
  uint64_t result;

  result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_3118 = result;
  return result;
}

void quic_send_stream_fin(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v5 = _os_log_pack_size();
    v6 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_send_stream_fin";
    v8 = (uint64_t)v6;
    v9 = 697;
LABEL_20:
    qlog_internal(17, v8, v9);
    return;
  }
  if (*MEMORY[0x24BDE08A0] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v10 = _os_log_pack_size();
    v11 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "quic_send_stream_fin";
    v8 = (uint64_t)v11;
    v9 = 698;
    goto LABEL_20;
  }
  if (a3)
  {
    if (nw_frame_array_is_empty())
      send_stream_data(a1, 0, a3, 0, 0, 1);
    else
      *(_DWORD *)(a3 + 352) |= 8u;
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "quic_send_stream_fin";
    v8 = (uint64_t)v14;
    v9 = 699;
    goto LABEL_20;
  }
}

BOOL __quic_fc_stream_path_affinity_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a2 + 60) == *(_DWORD *)(*(_QWORD *)(a1 + 32) + 252);
}

void quic_send_stream_data_blocked(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t frame_pool;
  _QWORD *v9;
  __int16 v10;
  __int16 v11;
  uint64_t path;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a2 + 352);
  if (*(_BYTE *)(a2 + 250) == 1)
    quic_fsm_send_stream_change((_BYTE *)(a2 + 250), 2u);
  if ((v4 & 1) == 0)
  {
    *(_DWORD *)(a2 + 352) |= 1u;
    if (__quic_signpost_is_enabled__quic_signposts_once_3116 != -1)
      dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3116, &__block_literal_global_3117);
    if (__quic_signpost_is_enabled__quic_signposts_enabled_3118 && kdebug_is_enabled())
      kdebug_trace();
    v5 = *(_QWORD *)(a1 + 560);
    v6 = *(_QWORD *)a2;
    v7 = *(_QWORD *)(a2 + 32);
    frame_pool = quic_packet_builder_get_frame_pool(v5);
    v9 = quic_frame_create(frame_pool, 21);
    v9[2] = v6;
    v9[3] = v7;
    if (v6)
    {
      if (v6 >> 62)
      {
        qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v6);
        goto LABEL_25;
      }
      v10 = byte_20A2A277C[(73 - __clz(v6)) >> 3];
      if (v7)
      {
LABEL_12:
        if (!(v7 >> 62))
        {
          v11 = byte_20A2A277C[(73 - __clz(v7)) >> 3];
          goto LABEL_16;
        }
        qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v7);
LABEL_25:
        __asm { BL              ___stack_chk_fail }
      }
    }
    else
    {
      v10 = 1;
      if (v7)
        goto LABEL_12;
    }
    v11 = 1;
LABEL_16:
    *((_WORD *)v9 + 4) = v10 + v11 + 1;
    quic_packet_builder_append_for_pn_space(v5, (uint64_t)v9, 3u);
    path = quic_conn_select_next_path((_QWORD *)a1, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal(a1, path, 0) & 1) != 0)
    {
      ++*(_DWORD *)(a1 + 1204);
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v13 = _os_log_pack_size();
      v14 = (char *)v16 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v15 = _os_log_pack_fill();
      *(_DWORD *)v15 = 136446210;
      *(_QWORD *)(v15 + 4) = "quic_send_stream_data_blocked";
      qlog_internal(2, (uint64_t)v14, 1433);
    }
  }
}

void quic_send_data_blocked(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t frame_pool;
  _QWORD *v6;
  __int16 v7;
  uint64_t path;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 1380);
  if ((v1 & 8) == 0)
  {
    *(_QWORD *)(a1 + 1380) = v1 | 8;
    if (__quic_signpost_is_enabled__quic_signposts_once_3116 != -1)
      dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3116, &__block_literal_global_3117);
    if (__quic_signpost_is_enabled__quic_signposts_enabled_3118 && kdebug_is_enabled())
      kdebug_trace();
    v3 = *(_QWORD *)(a1 + 560);
    v4 = *(_QWORD *)(a1 + 512);
    frame_pool = quic_packet_builder_get_frame_pool(v3);
    v6 = quic_frame_create(frame_pool, 20);
    v6[2] = v4;
    if (v4)
    {
      if (v4 >> 62)
        qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v4);
      v7 = byte_20A2A277C[(73 - __clz(v4)) >> 3];
    }
    else
    {
      v7 = 1;
    }
    *((_WORD *)v6 + 4) = v7 + 1;
    quic_packet_builder_append_for_pn_space(v3, (uint64_t)v6, 3u);
    path = quic_conn_select_next_path((_QWORD *)a1, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal(a1, path, 0) & 1) != 0)
    {
      ++*(_DWORD *)(a1 + 1200);
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v9 = _os_log_pack_size();
      v10 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v11 = _os_log_pack_fill();
      *(_DWORD *)v11 = 136446210;
      *(_QWORD *)(v11 + 4) = "quic_send_data_blocked";
      qlog_internal(2, (uint64_t)v10, 1405);
    }
  }
}

uint64_t __quic_fc_stream_path_affinity_block_invoke_3()
{
  return 1;
}

uint64_t __quic_fc_stream_path_affinity_block_invoke_2()
{
  return 1;
}

void quic_process_max_stream_data(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v7;
  char v8;
  char v9;
  int v10;
  int v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v22 = _os_log_pack_size();
    v23 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136446210;
    *(_QWORD *)(v24 + 4) = "quic_process_max_stream_data";
    v25 = (uint64_t)v23;
    v26 = 1093;
LABEL_39:
    qlog_internal(17, v25, v26);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v27 = _os_log_pack_size();
    v28 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136446210;
    *(_QWORD *)(v29 + 4) = "quic_process_max_stream_data";
    v25 = (uint64_t)v28;
    v26 = 1094;
    goto LABEL_39;
  }
  if (*((unsigned __int8 *)a2 + 250) <= 2u)
  {
    v5 = a2[5];
    if (v5 >= a3)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v13 = _os_log_pack_size();
        v14 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v15 = _os_log_pack_fill();
        v16 = a2[5];
        *(_DWORD *)v15 = 136446722;
        *(_QWORD *)(v15 + 4) = "quic_process_max_stream_data";
        *(_WORD *)(v15 + 12) = 2048;
        *(_QWORD *)(v15 + 14) = a3;
        *(_WORD *)(v15 + 22) = 2048;
        *(_QWORD *)(v15 + 24) = v16;
        qlog_internal(2, (uint64_t)v14, 1105);
      }
    }
    else
    {
      a2[5] = a3;
      if (__quic_signpost_is_enabled__quic_signposts_once_3116 != -1)
        dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3116, &__block_literal_global_3117);
      if (__quic_signpost_is_enabled__quic_signposts_enabled_3118 && kdebug_is_enabled())
        kdebug_trace();
      v7 = 0x2545F5000uLL;
      v8 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled)
          v8 = 1;
        if ((v8 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          v30 = _os_log_pack_size();
          v31 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v32 = _os_log_pack_fill();
          v33 = *a2;
          v34 = a2[5];
          *(_DWORD *)v32 = 136446978;
          *(_QWORD *)(v32 + 4) = "quic_process_max_stream_data";
          *(_WORD *)(v32 + 12) = 2048;
          *(_QWORD *)(v32 + 14) = v33;
          *(_WORD *)(v32 + 22) = 2048;
          *(_QWORD *)(v32 + 24) = v5;
          *(_WORD *)(v32 + 32) = 2048;
          *(_QWORD *)(v32 + 34) = v34;
          v35 = (uint64_t)v31;
          v7 = 0x2545F5000;
          qlog_internal(2, v35, 1115);
        }
      }
      v9 = *(_BYTE *)(v7 + 3233);
      if (a2[5] <= (unint64_t)a2[4])
      {
        if (qlog_debug_enabled)
          v9 = 1;
        if ((v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          v17 = _os_log_pack_size();
          v18 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v19 = _os_log_pack_fill();
          v20 = a2[4];
          v21 = a2[5];
          *(_DWORD *)v19 = 136446722;
          *(_QWORD *)(v19 + 4) = "quic_process_max_stream_data";
          *(_WORD *)(v19 + 12) = 2048;
          *(_QWORD *)(v19 + 14) = v20;
          *(_WORD *)(v19 + 22) = 2048;
          *(_QWORD *)(v19 + 24) = v21;
          qlog_internal(17, (uint64_t)v18, 1121);
        }
        *(_QWORD *)(a1 + 1072) = 1;
      }
      else
      {
        if (qlog_datapath_enabled)
          v10 = 1;
        else
          v10 = *(unsigned __int8 *)(v7 + 3233);
        if (v10 == 1)
        {
          if (qlog_debug_enabled)
            v9 = 1;
          if ((v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            v36 = _os_log_pack_size();
            v37 = (char *)v40 - ((MEMORY[0x24BDAC7A8](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v38 = _os_log_pack_fill();
            v39 = *a2;
            *(_DWORD *)v38 = 136446466;
            *(_QWORD *)(v38 + 4) = "quic_process_max_stream_data";
            *(_WORD *)(v38 + 12) = 2048;
            *(_QWORD *)(v38 + 14) = v39;
            qlog_internal(2, (uint64_t)v37, 1126);
          }
        }
        v11 = *((_DWORD *)a2 + 88);
        if ((v11 & 0x400) == 0)
        {
          v12 = *(_QWORD **)(a1 + 1352);
          a2[40] = 0;
          a2[41] = (uint64_t)v12;
          *v12 = a2;
          *(_QWORD *)(a1 + 1352) = a2 + 40;
          v11 = *((_DWORD *)a2 + 88) | 0x400;
        }
        *((_DWORD *)a2 + 88) = v11 & 0xFFFFFFFE;
      }
    }
  }
}

void quic_fc_process_data_blocked(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  _OWORD *v8;
  _OWORD *v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (__quic_signpost_is_enabled__quic_signposts_once_3116 != -1)
      dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3116, &__block_literal_global_3117);
    if (__quic_signpost_is_enabled__quic_signposts_enabled_3118 && kdebug_is_enabled())
      kdebug_trace();
    if (*(unsigned __int8 *)(a1 + 477) <= 9u)
    {
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
        && *(_QWORD *)(a1 + 1112))
      {
        v4 = _os_log_pack_size();
        v5 = (char *)v29 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v6 = _os_log_pack_fill();
        v29[0] = a1 + 976;
        v7 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2)
          v8 = &quic_cid_describe_cid_buf2;
        else
          v8 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v9 = v8;
        else
          v9 = &quic_cid_describe_cid_buf1;
        v10 = ++quic_cid_describe_state;
        v11 = v7[38];
        v12 = 0uLL;
        *(_OWORD *)((char *)v9 + 25) = 0u;
        if (v11 >= 0x14)
          v13 = 20;
        else
          v13 = v11;
        *v9 = 0uLL;
        v9[1] = 0uLL;
        if ((_DWORD)v13)
        {
          v14 = v7 + 39;
          do
          {
            v15 = *v14++;
            snprintf((char *)v9, 0x29uLL, "%s%02x", (const char *)v9, v15);
            --v13;
          }
          while (v13);
          v7 = *(unsigned __int8 **)(a1 + 1112);
          v10 = quic_cid_describe_state;
          v12 = 0uLL;
        }
        if (v10 % 3 == 2)
          v16 = &quic_cid_describe_cid_buf2;
        else
          v16 = &quic_cid_describe_cid_buf3;
        if (v10 % 3)
          v17 = v16;
        else
          v17 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v10 + 1;
        if (v7[17] >= 0x14u)
          v18 = 20;
        else
          v18 = v7[17];
        *v17 = v12;
        v17[1] = v12;
        *(_OWORD *)((char *)v17 + 25) = v12;
        if ((_DWORD)v18)
        {
          v19 = v7 + 18;
          do
          {
            v20 = *v19++;
            snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v20);
            --v18;
          }
          while (v18);
        }
        v21 = *(_QWORD *)(a1 + 904);
        v22 = *(_QWORD *)(a1 + 920);
        v23 = *(_QWORD *)(a1 + 880);
        v24 = *(_QWORD *)(a1 + 856);
        v25 = *(_QWORD *)(a1 + 936);
        *(_DWORD *)v6 = 136448514;
        *(_QWORD *)(v6 + 4) = "quic_fc_process_data_blocked";
        *(_WORD *)(v6 + 12) = 2082;
        *(_QWORD *)(v6 + 14) = v29[0];
        *(_WORD *)(v6 + 22) = 2082;
        *(_QWORD *)(v6 + 24) = v9;
        *(_WORD *)(v6 + 32) = 2082;
        *(_QWORD *)(v6 + 34) = v17;
        *(_WORD *)(v6 + 42) = 2048;
        *(_QWORD *)(v6 + 44) = a2;
        *(_WORD *)(v6 + 52) = 2048;
        *(_QWORD *)(v6 + 54) = v21;
        *(_WORD *)(v6 + 62) = 2048;
        *(_QWORD *)(v6 + 64) = v22;
        *(_WORD *)(v6 + 72) = 2048;
        *(_QWORD *)(v6 + 74) = v23;
        *(_WORD *)(v6 + 82) = 2048;
        *(_QWORD *)(v6 + 84) = v24;
        *(_WORD *)(v6 + 92) = 2048;
        *(_QWORD *)(v6 + 94) = v25;
        qlog_internal(0, (uint64_t)v5, 1155);
      }
      ++*(_DWORD *)(a1 + 1208);
      quic_conn_send_fc_credit(a1);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v26 = _os_log_pack_size();
    v27 = (char *)v29 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136446210;
    *(_QWORD *)(v28 + 4) = "quic_fc_process_data_blocked";
    qlog_internal(17, (uint64_t)v27, 1139);
  }
}

void quic_fc_process_stream_data_blocked(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  _OWORD *v10;
  _OWORD *v11;
  int v12;
  unsigned int v13;
  __int128 v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v29 = _os_log_pack_size();
    v30 = (char *)&v37 - ((MEMORY[0x24BDAC7A8](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136446210;
    *(_QWORD *)(v31 + 4) = "quic_fc_process_stream_data_blocked";
    v32 = (uint64_t)v30;
    v33 = 1165;
LABEL_49:
    qlog_internal(17, v32, v33);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v34 = _os_log_pack_size();
    v35 = (char *)&v37 - ((MEMORY[0x24BDAC7A8](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136446210;
    *(_QWORD *)(v36 + 4) = "quic_fc_process_stream_data_blocked";
    v32 = (uint64_t)v35;
    v33 = 1166;
    goto LABEL_49;
  }
  if (a2[22] == -1)
  {
    if (__quic_signpost_is_enabled__quic_signposts_once_3116 != -1)
      dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3116, &__block_literal_global_3117);
    if (__quic_signpost_is_enabled__quic_signposts_enabled_3118 && kdebug_is_enabled())
      kdebug_trace();
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
      && *(_QWORD *)(a1 + 1112))
    {
      v6 = _os_log_pack_size();
      v39 = &v37;
      v7 = (char *)&v37 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      v38 = a1 + 976;
      v9 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v10 = &quic_cid_describe_cid_buf2;
      else
        v10 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v11 = v10;
      else
        v11 = &quic_cid_describe_cid_buf1;
      v12 = ++quic_cid_describe_state;
      v13 = v9[38];
      v14 = 0uLL;
      *(_OWORD *)((char *)v11 + 25) = 0u;
      if (v13 >= 0x14)
        v15 = 20;
      else
        v15 = v13;
      *v11 = 0uLL;
      v11[1] = 0uLL;
      if ((_DWORD)v15)
      {
        v16 = v9 + 39;
        do
        {
          v17 = *v16++;
          snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
          --v15;
        }
        while (v15);
        v9 = *(unsigned __int8 **)(a1 + 1112);
        v12 = quic_cid_describe_state;
        v14 = 0uLL;
      }
      if (v12 % 3 == 2)
        v18 = &quic_cid_describe_cid_buf2;
      else
        v18 = &quic_cid_describe_cid_buf3;
      if (v12 % 3)
        v19 = v18;
      else
        v19 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v12 + 1;
      if (v9[17] >= 0x14u)
        v20 = 20;
      else
        v20 = v9[17];
      *v19 = v14;
      v19[1] = v14;
      *(_OWORD *)((char *)v19 + 25) = v14;
      if ((_DWORD)v20)
      {
        v21 = v9 + 18;
        do
        {
          v22 = *v21++;
          snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
          --v20;
        }
        while (v20);
      }
      v23 = *a2;
      v24 = a2[13];
      v25 = quic_stream_inorder_unread((uint64_t)a2);
      v26 = a2[10];
      v27 = a2[6];
      v28 = a2[21];
      *(_DWORD *)v8 = 136448770;
      *(_QWORD *)(v8 + 4) = "quic_fc_process_stream_data_blocked";
      *(_WORD *)(v8 + 12) = 2082;
      *(_QWORD *)(v8 + 14) = v38;
      *(_WORD *)(v8 + 22) = 2082;
      *(_QWORD *)(v8 + 24) = v11;
      *(_WORD *)(v8 + 32) = 2082;
      *(_QWORD *)(v8 + 34) = v19;
      *(_WORD *)(v8 + 42) = 2048;
      *(_QWORD *)(v8 + 44) = v23;
      *(_WORD *)(v8 + 52) = 2048;
      *(_QWORD *)(v8 + 54) = a3;
      *(_WORD *)(v8 + 62) = 2048;
      *(_QWORD *)(v8 + 64) = v24;
      *(_WORD *)(v8 + 72) = 2048;
      *(_QWORD *)(v8 + 74) = v25;
      *(_WORD *)(v8 + 82) = 2048;
      *(_QWORD *)(v8 + 84) = v26;
      *(_WORD *)(v8 + 92) = 2048;
      *(_QWORD *)(v8 + 94) = v27;
      *(_WORD *)(v8 + 102) = 2048;
      *(_QWORD *)(v8 + 104) = v28;
      qlog_internal(0, (uint64_t)v7, 1184);
    }
    ++*(_DWORD *)(a1 + 1212);
    quic_stream_send_fc_credit(a1, (uint64_t)a2);
  }
}

void quic_process_max_streams_bidi(uint64_t a1, unint64_t a2)
{
  char v4;
  int v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _OWORD *v15;
  _OWORD *v16;
  int v17;
  unsigned int v18;
  __int128 v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (quic_fc_check_max_streams((_QWORD *)a1, a2))
    {
      v4 = qlog_nwlog_enabled;
      if (*(_QWORD *)(a1 + 656) >= a2)
      {
        if (qlog_debug_enabled)
          v4 = 1;
        if (((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)) && *(_QWORD *)(a1 + 1112))
        {
          v11 = _os_log_pack_size();
          v12 = (char *)&v35 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v13 = _os_log_pack_fill();
          v36 = a1 + 976;
          v14 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v15 = &quic_cid_describe_cid_buf2;
          else
            v15 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v16 = v15;
          else
            v16 = &quic_cid_describe_cid_buf1;
          v17 = ++quic_cid_describe_state;
          v18 = v14[38];
          v19 = 0uLL;
          *(_OWORD *)((char *)v16 + 25) = 0u;
          if (v18 >= 0x14)
            v20 = 20;
          else
            v20 = v18;
          *v16 = 0uLL;
          v16[1] = 0uLL;
          if ((_DWORD)v20)
          {
            v21 = v14 + 39;
            do
            {
              v22 = *v21++;
              snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
              --v20;
            }
            while (v20);
            v14 = *(unsigned __int8 **)(a1 + 1112);
            v17 = quic_cid_describe_state;
            v19 = 0uLL;
          }
          if (v17 % 3 == 2)
            v23 = &quic_cid_describe_cid_buf2;
          else
            v23 = &quic_cid_describe_cid_buf3;
          if (v17 % 3)
            v24 = v23;
          else
            v24 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v17 + 1;
          if (v14[17] >= 0x14u)
            v25 = 20;
          else
            v25 = v14[17];
          *v24 = v19;
          v24[1] = v19;
          *(_OWORD *)((char *)v24 + 25) = v19;
          if ((_DWORD)v25)
          {
            v26 = v14 + 18;
            do
            {
              v27 = *v26++;
              snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v27);
              --v25;
            }
            while (v25);
          }
          v28 = *(_QWORD *)(a1 + 656);
          *(_DWORD *)v13 = 136447490;
          *(_QWORD *)(v13 + 4) = "quic_process_max_streams_bidi";
          *(_WORD *)(v13 + 12) = 2082;
          *(_QWORD *)(v13 + 14) = v36;
          *(_WORD *)(v13 + 22) = 2082;
          *(_QWORD *)(v13 + 24) = v16;
          *(_WORD *)(v13 + 32) = 2082;
          *(_QWORD *)(v13 + 34) = v24;
          *(_WORD *)(v13 + 42) = 2048;
          *(_QWORD *)(v13 + 44) = a2;
          *(_WORD *)(v13 + 52) = 2048;
          *(_QWORD *)(v13 + 54) = v28;
          qlog_internal(1, (uint64_t)v12, 1239);
        }
      }
      else
      {
        if (qlog_datapath_enabled)
          v5 = 1;
        else
          v5 = qlog_nwlog_enabled;
        if (v5 == 1)
        {
          if (qlog_debug_enabled)
            v4 = 1;
          if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            v32 = _os_log_pack_size();
            v33 = (char *)&v35 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v34 = _os_log_pack_fill();
            *(_DWORD *)v34 = 136446466;
            *(_QWORD *)(v34 + 4) = "quic_process_max_streams_bidi";
            *(_WORD *)(v34 + 12) = 2048;
            *(_QWORD *)(v34 + 14) = a2;
            qlog_internal(2, (uint64_t)v33, 1242);
          }
        }
        v37 = MEMORY[0x24BDAC760];
        v38 = 0x40000000;
        v39 = __quic_process_max_streams_bidi_block_invoke;
        v40 = &__block_descriptor_tmp_8_3307;
        v41 = a1;
        v42 = a2;
        nw_quic_connection_execute_locked();
        *(_QWORD *)(a1 + 704) = (*(_QWORD *)(a1 + 1380) & 1 | (4 * a2)) - 4;
        v6 = *(uint64_t **)(a1 + 720);
        if (v6)
        {
          do
          {
            v7 = (uint64_t *)v6[36];
            if (!quic_stream_id_is_available((_QWORD *)a1, (4 * *(_DWORD *)(a1 + 680)) | *(_QWORD *)(a1 + 1380) & 1))break;
            *v6 = quic_stream_alloc_new_id((_QWORD *)a1, 0);
            quic_stream_reset_id((uint64_t)v6);
            quic_stream_unmark_pending(a1, v6);
            quic_stream_ready(a1, (uint64_t)v6, v6[3]);
            v6 = v7;
          }
          while (v7);
        }
        v43 = -1;
        nw_protocol_instance_get_flow_for_key();
        v8 = nw_protocol_instance_copy_options();
        if (v8)
        {
          v9 = (void *)v8;
          if (!nw_protocol_options_is_quic_stream()
            || (v10 = nw_quic_stream_copy_shared_connection_options(), nw_release(v9), (v9 = (void *)v10) != 0))
          {
            nw_quic_connection_execute_max_streams_update_block();
            nw_release(v9);
          }
        }
      }
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v29 = _os_log_pack_size();
    v30 = (char *)&v35 - ((MEMORY[0x24BDAC7A8](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136446210;
    *(_QWORD *)(v31 + 4) = "quic_process_max_streams_bidi";
    qlog_internal(17, (uint64_t)v30, 1230);
  }
}

BOOL quic_fc_check_max_streams(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  _OWORD *v8;
  _OWORD *v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int v20;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 0x1000000000000001)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      v4 = _os_log_pack_size();
      v24 = &v22;
      v5 = (char *)&v22 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v6 = _os_log_pack_fill();
      v23 = a1 + 122;
      v7 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2)
        v8 = &quic_cid_describe_cid_buf2;
      else
        v8 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v9 = v8;
      else
        v9 = &quic_cid_describe_cid_buf1;
      v10 = ++quic_cid_describe_state;
      v11 = v7[38];
      v12 = 0uLL;
      *(_OWORD *)((char *)v9 + 25) = 0u;
      if (v11 >= 0x14)
        v13 = 20;
      else
        v13 = v11;
      *v9 = 0uLL;
      v9[1] = 0uLL;
      if ((_DWORD)v13)
      {
        v14 = v7 + 39;
        do
        {
          v15 = *v14++;
          snprintf((char *)v9, 0x29uLL, "%s%02x", (const char *)v9, v15);
          --v13;
        }
        while (v13);
        v7 = (unsigned __int8 *)a1[139];
        v10 = quic_cid_describe_state;
        v12 = 0uLL;
      }
      if (v10 % 3 == 2)
        v16 = &quic_cid_describe_cid_buf2;
      else
        v16 = &quic_cid_describe_cid_buf3;
      if (v10 % 3)
        v17 = v16;
      else
        v17 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v10 + 1;
      if (v7[17] >= 0x14u)
        v18 = 20;
      else
        v18 = v7[17];
      *v17 = v12;
      v17[1] = v12;
      *(_OWORD *)((char *)v17 + 25) = v12;
      if ((_DWORD)v18)
      {
        v19 = v7 + 18;
        do
        {
          v20 = *v19++;
          snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v20);
          --v18;
        }
        while (v18);
      }
      *(_DWORD *)v6 = 136447234;
      *(_QWORD *)(v6 + 4) = "quic_fc_check_max_streams";
      *(_WORD *)(v6 + 12) = 2082;
      *(_QWORD *)(v6 + 14) = v23;
      *(_WORD *)(v6 + 22) = 2082;
      *(_QWORD *)(v6 + 24) = v9;
      *(_WORD *)(v6 + 32) = 2082;
      *(_QWORD *)(v6 + 34) = v17;
      *(_WORD *)(v6 + 42) = 2048;
      *(_QWORD *)(v6 + 44) = a2;
      qlog_internal(16, (uint64_t)v5, 1197);
    }
    a1[134] = 4;
    a1[135] = "MAX_STREAMS value over limit";
  }
  return a2 < 0x1000000000000001;
}

uint64_t __quic_process_max_streams_bidi_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 656) = *(_QWORD *)(result + 40);
  return result;
}

void quic_process_max_streams_uni(_QWORD *a1, unint64_t a2)
{
  char v4;
  int v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _OWORD *v15;
  _OWORD *v16;
  int v17;
  unsigned int v18;
  __int128 v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (quic_fc_check_max_streams(a1, a2))
    {
      v4 = qlog_nwlog_enabled;
      if (a1[92] >= a2)
      {
        if (qlog_debug_enabled)
          v4 = 1;
        if (((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)) && a1[139])
        {
          v11 = _os_log_pack_size();
          v12 = (char *)&v35 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v13 = _os_log_pack_fill();
          v36 = a1 + 122;
          v14 = (unsigned __int8 *)a1[139];
          if (quic_cid_describe_state % 3 == 2)
            v15 = &quic_cid_describe_cid_buf2;
          else
            v15 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v16 = v15;
          else
            v16 = &quic_cid_describe_cid_buf1;
          v17 = ++quic_cid_describe_state;
          v18 = v14[38];
          v19 = 0uLL;
          *(_OWORD *)((char *)v16 + 25) = 0u;
          if (v18 >= 0x14)
            v20 = 20;
          else
            v20 = v18;
          *v16 = 0uLL;
          v16[1] = 0uLL;
          if ((_DWORD)v20)
          {
            v21 = v14 + 39;
            do
            {
              v22 = *v21++;
              snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
              --v20;
            }
            while (v20);
            v14 = (unsigned __int8 *)a1[139];
            v17 = quic_cid_describe_state;
            v19 = 0uLL;
          }
          if (v17 % 3 == 2)
            v23 = &quic_cid_describe_cid_buf2;
          else
            v23 = &quic_cid_describe_cid_buf3;
          if (v17 % 3)
            v24 = v23;
          else
            v24 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v17 + 1;
          if (v14[17] >= 0x14u)
            v25 = 20;
          else
            v25 = v14[17];
          *v24 = v19;
          v24[1] = v19;
          *(_OWORD *)((char *)v24 + 25) = v19;
          if ((_DWORD)v25)
          {
            v26 = v14 + 18;
            do
            {
              v27 = *v26++;
              snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v27);
              --v25;
            }
            while (v25);
          }
          v28 = a1[92];
          *(_DWORD *)v13 = 136447490;
          *(_QWORD *)(v13 + 4) = "quic_process_max_streams_uni";
          *(_WORD *)(v13 + 12) = 2082;
          *(_QWORD *)(v13 + 14) = v36;
          *(_WORD *)(v13 + 22) = 2082;
          *(_QWORD *)(v13 + 24) = v16;
          *(_WORD *)(v13 + 32) = 2082;
          *(_QWORD *)(v13 + 34) = v24;
          *(_WORD *)(v13 + 42) = 2048;
          *(_QWORD *)(v13 + 44) = a2;
          *(_WORD *)(v13 + 52) = 2048;
          *(_QWORD *)(v13 + 54) = v28;
          qlog_internal(1, (uint64_t)v12, 1279);
        }
      }
      else
      {
        if (qlog_datapath_enabled)
          v5 = 1;
        else
          v5 = qlog_nwlog_enabled;
        if (v5 == 1)
        {
          if (qlog_debug_enabled)
            v4 = 1;
          if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            v32 = _os_log_pack_size();
            v33 = (char *)&v35 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v34 = _os_log_pack_fill();
            *(_DWORD *)v34 = 136446466;
            *(_QWORD *)(v34 + 4) = "quic_process_max_streams_uni";
            *(_WORD *)(v34 + 12) = 2048;
            *(_QWORD *)(v34 + 14) = a2;
            qlog_internal(2, (uint64_t)v33, 1282);
          }
        }
        v37 = MEMORY[0x24BDAC760];
        v38 = 0x40000000;
        v39 = __quic_process_max_streams_uni_block_invoke;
        v40 = &__block_descriptor_tmp_9_3318;
        v41 = a1;
        v42 = a2;
        nw_quic_connection_execute_locked();
        a1[98] = (*(_QWORD *)((char *)a1 + 1380) | 0xFFFFFFFFFFFFFFFELL) + 4 * a2;
        v6 = (uint64_t *)a1[100];
        if (v6)
        {
          do
          {
            v7 = (uint64_t *)v6[36];
            if (!quic_stream_id_is_available(a1, *(_QWORD *)((char *)a1 + 1380) & 1 | (4 * a1[95]) | 2))
              break;
            *v6 = quic_stream_alloc_new_id(a1, 1);
            quic_stream_reset_id((uint64_t)v6);
            quic_stream_unmark_pending((uint64_t)a1, v6);
            quic_stream_ready((uint64_t)a1, (uint64_t)v6, v6[3]);
            v6 = v7;
          }
          while (v7);
        }
        v43 = -1;
        nw_protocol_instance_get_flow_for_key();
        v8 = nw_protocol_instance_copy_options();
        if (v8)
        {
          v9 = (void *)v8;
          if (!nw_protocol_options_is_quic_stream()
            || (v10 = nw_quic_stream_copy_shared_connection_options(), nw_release(v9), (v9 = (void *)v10) != 0))
          {
            nw_quic_connection_execute_max_streams_update_block();
            nw_release(v9);
          }
        }
      }
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v29 = _os_log_pack_size();
    v30 = (char *)&v35 - ((MEMORY[0x24BDAC7A8](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136446210;
    *(_QWORD *)(v31 + 4) = "quic_process_max_streams_uni";
    qlog_internal(17, (uint64_t)v30, 1270);
  }
}

uint64_t __quic_process_max_streams_uni_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 736) = *(_QWORD *)(result + 40);
  return result;
}

BOOL quic_prepare_max_data(_QWORD *a1)
{
  unint64_t v2;
  char v3;
  BOOL v4;
  unint64_t v5;
  char v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v2 = a1[110] + a1[116];
  v3 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled)
    v4 = 0;
  else
    v4 = qlog_nwlog_enabled == 0;
  if (!v4)
  {
    if (qlog_debug_enabled)
      v3 = 1;
    if ((v3 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      v11 = a1[107];
      v12 = a1[116];
      v13 = a1[110];
      *(_DWORD *)v10 = 136446978;
      *(_QWORD *)(v10 + 4) = "quic_prepare_max_data";
      *(_WORD *)(v10 + 12) = 2048;
      *(_QWORD *)(v10 + 14) = v11;
      *(_WORD *)(v10 + 22) = 2048;
      *(_QWORD *)(v10 + 24) = v12;
      *(_WORD *)(v10 + 32) = 2048;
      *(_QWORD *)(v10 + 34) = v13;
      qlog_internal(2, (uint64_t)v9, 1340);
    }
  }
  v5 = a1[107];
  if (v2 > v5)
  {
    a1[107] = v2;
    *(_QWORD *)((char *)a1 + 1380) |= 0x40000uLL;
    if (__quic_signpost_is_enabled__quic_signposts_once_3116 != -1)
      dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3116, &__block_literal_global_3117);
    if (__quic_signpost_is_enabled__quic_signposts_enabled_3118 && kdebug_is_enabled())
      kdebug_trace();
    v6 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled)
        v6 = 1;
      if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v14 = _os_log_pack_size();
        v15 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v16 = _os_log_pack_fill();
        v17 = a1[107];
        *(_DWORD *)v16 = 136446466;
        *(_QWORD *)(v16 + 4) = "quic_prepare_max_data";
        *(_WORD *)(v16 + 12) = 2048;
        *(_QWORD *)(v16 + 14) = v17;
        qlog_internal(2, (uint64_t)v15, 1349);
      }
    }
  }
  return v2 > v5;
}

uint64_t quic_prepare_max_stream_data(uint64_t *a1)
{
  uint64_t v2;
  _BOOL8 v3;
  unint64_t v4;
  char v5;
  BOOL v6;
  char v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char *v17;
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
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = a1[22];
  v3 = v2 == -1;
  if (v2 != -1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      v11 = a1[22];
      *(_DWORD *)v10 = 136446466;
      *(_QWORD *)(v10 + 4) = "quic_prepare_max_stream_data";
      *(_WORD *)(v10 + 12) = 2048;
      *(_QWORD *)(v10 + 14) = v11;
      v12 = 17;
      v13 = (uint64_t)v9;
      v14 = 1363;
LABEL_32:
      qlog_internal(v12, v13, v14);
      return v3;
    }
    return 0;
  }
  v4 = a1[10] + quic_reassq_inorder_offset(a1[32]);
  v5 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled)
    v6 = 0;
  else
    v6 = qlog_nwlog_enabled == 0;
  if (!v6)
  {
    if (qlog_debug_enabled)
      v5 = 1;
    if ((v5 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v16 = _os_log_pack_size();
      v17 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v18 = _os_log_pack_fill();
      v19 = *a1;
      v20 = a1[6];
      v21 = quic_reassq_inorder_offset(a1[32]);
      v22 = a1[10];
      *(_DWORD *)v18 = 136447234;
      *(_QWORD *)(v18 + 4) = "quic_prepare_max_stream_data";
      *(_WORD *)(v18 + 12) = 2048;
      *(_QWORD *)(v18 + 14) = v19;
      *(_WORD *)(v18 + 22) = 2048;
      *(_QWORD *)(v18 + 24) = v20;
      *(_WORD *)(v18 + 32) = 2048;
      *(_QWORD *)(v18 + 34) = v21;
      *(_WORD *)(v18 + 42) = 2048;
      *(_QWORD *)(v18 + 44) = v22;
      qlog_internal(2, (uint64_t)v17, 1373);
    }
  }
  if (v4 <= a1[6])
    return 0;
  a1[6] = v4;
  *((_DWORD *)a1 + 88) |= 0x20000u;
  a1[15] = 0;
  if (__quic_signpost_is_enabled__quic_signposts_once_3116 != -1)
    dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3116, &__block_literal_global_3117);
  if (__quic_signpost_is_enabled__quic_signposts_enabled_3118 && kdebug_is_enabled())
    kdebug_trace();
  v7 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled || qlog_nwlog_enabled)
  {
    if (qlog_debug_enabled)
      v7 = 1;
    if ((v7 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v23 = _os_log_pack_size();
      v24 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v25 = _os_log_pack_fill();
      v26 = *a1;
      v27 = a1[6];
      *(_DWORD *)v25 = 136446722;
      *(_QWORD *)(v25 + 4) = "quic_prepare_max_stream_data";
      *(_WORD *)(v25 + 12) = 2048;
      *(_QWORD *)(v25 + 14) = v26;
      *(_WORD *)(v25 + 22) = 2048;
      *(_QWORD *)(v25 + 24) = v27;
      v12 = 2;
      v13 = (uint64_t)v24;
      v14 = 1385;
      goto LABEL_32;
    }
  }
  return 1;
}

void quic_send_max_streams_bidi(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  char v4;
  BOOL v5;
  uint64_t v6;
  uint64_t frame_pool;
  _QWORD *v8;
  __int16 v9;
  uint64_t path;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = a2;
    if (a2)
    {
      a1[84] = a2;
      a1[89] = (*(_QWORD *)((char *)a1 + 1380) & 1 ^ 0xFFFFFFFFFFFFFFFDLL) + 4 * a2;
      v4 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled)
        v5 = 0;
      else
        v5 = qlog_nwlog_enabled == 0;
      if (!v5)
      {
        if (qlog_debug_enabled)
          v4 = 1;
        if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          v23 = _os_log_pack_size();
          v24 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v25 = _os_log_pack_fill();
          v26 = a1[84];
          v27 = a1[89];
          *(_DWORD *)v25 = 136446722;
          *(_QWORD *)(v25 + 4) = "quic_send_max_streams_bidi";
          *(_WORD *)(v25 + 12) = 2048;
          *(_QWORD *)(v25 + 14) = v26;
          *(_WORD *)(v25 + 22) = 2048;
          *(_QWORD *)(v25 + 24) = v27;
          qlog_internal(2, (uint64_t)v24, 1451);
          v2 = a1[84];
        }
      }
      v6 = a1[70];
      frame_pool = quic_packet_builder_get_frame_pool(v6);
      v8 = quic_frame_create(frame_pool, 18);
      v8[2] = v2;
      if (v2)
      {
        if (v2 >> 62)
          qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v2);
        v9 = byte_20A2A277C[(73 - __clz(v2)) >> 3];
      }
      else
      {
        v9 = 1;
      }
      *((_WORD *)v8 + 4) = v9 + 1;
      quic_packet_builder_append_for_pn_space(v6, (uint64_t)v8, 3u);
      path = quic_conn_select_next_path(a1, (uint64_t)&__block_literal_global_98);
      if ((quic_conn_send_internal((uint64_t)a1, path, 0) & 1) == 0
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        v11 = _os_log_pack_size();
        v12 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v13 = _os_log_pack_fill();
        *(_DWORD *)v13 = 136446210;
        *(_QWORD *)(v13 + 4) = "quic_send_max_streams_bidi";
        v14 = 2;
        v15 = (uint64_t)v12;
        v16 = 1457;
LABEL_17:
        qlog_internal(v14, v15, v16);
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v20 = _os_log_pack_size();
      v21 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v22 = _os_log_pack_fill();
      *(_DWORD *)v22 = 136446210;
      *(_QWORD *)(v22 + 4) = "quic_send_max_streams_bidi";
      v14 = 17;
      v15 = (uint64_t)v21;
      v16 = 1444;
      goto LABEL_17;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v17 = _os_log_pack_size();
    v18 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "quic_send_max_streams_bidi";
    v14 = 17;
    v15 = (uint64_t)v18;
    v16 = 1443;
    goto LABEL_17;
  }
}

void quic_send_max_streams_uni(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  char v4;
  BOOL v5;
  uint64_t v6;
  uint64_t frame_pool;
  _QWORD *v8;
  __int16 v9;
  uint64_t path;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = a2;
    if (a2)
    {
      *(_QWORD *)(a1 + 752) = a2;
      *(_QWORD *)(a1 + 792) = (~*(_BYTE *)(a1 + 1380) | 0xFFFFFFFFFFFFFFFELL) + 4 * a2;
      v4 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled)
        v5 = 0;
      else
        v5 = qlog_nwlog_enabled == 0;
      if (!v5)
      {
        if (qlog_debug_enabled)
          v4 = 1;
        if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          v23 = _os_log_pack_size();
          v24 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v25 = _os_log_pack_fill();
          v26 = *(_QWORD *)(a1 + 752);
          v27 = *(_QWORD *)(a1 + 792);
          *(_DWORD *)v25 = 136446722;
          *(_QWORD *)(v25 + 4) = "quic_send_max_streams_uni";
          *(_WORD *)(v25 + 12) = 2048;
          *(_QWORD *)(v25 + 14) = v26;
          *(_WORD *)(v25 + 22) = 2048;
          *(_QWORD *)(v25 + 24) = v27;
          qlog_internal(2, (uint64_t)v24, 1472);
          v2 = *(_QWORD *)(a1 + 752);
        }
      }
      v6 = *(_QWORD *)(a1 + 560);
      frame_pool = quic_packet_builder_get_frame_pool(v6);
      v8 = quic_frame_create(frame_pool, 19);
      v8[2] = v2;
      if (v2)
      {
        if (v2 >> 62)
          qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v2);
        v9 = byte_20A2A277C[(73 - __clz(v2)) >> 3];
      }
      else
      {
        v9 = 1;
      }
      *((_WORD *)v8 + 4) = v9 + 1;
      quic_packet_builder_append_for_pn_space(v6, (uint64_t)v8, 3u);
      path = quic_conn_select_next_path((_QWORD *)a1, (uint64_t)&__block_literal_global_98);
      if ((quic_conn_send_internal(a1, path, 0) & 1) == 0
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        v11 = _os_log_pack_size();
        v12 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v13 = _os_log_pack_fill();
        *(_DWORD *)v13 = 136446210;
        *(_QWORD *)(v13 + 4) = "quic_send_max_streams_uni";
        v14 = 2;
        v15 = (uint64_t)v12;
        v16 = 1478;
LABEL_17:
        qlog_internal(v14, v15, v16);
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v20 = _os_log_pack_size();
      v21 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v22 = _os_log_pack_fill();
      *(_DWORD *)v22 = 136446210;
      *(_QWORD *)(v22 + 4) = "quic_send_max_streams_uni";
      v14 = 17;
      v15 = (uint64_t)v21;
      v16 = 1465;
      goto LABEL_17;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v17 = _os_log_pack_size();
    v18 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "quic_send_max_streams_uni";
    v14 = 17;
    v15 = (uint64_t)v18;
    v16 = 1464;
    goto LABEL_17;
  }
}

void quic_send_streams_blocked(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  _OWORD *v14;
  _OWORD *v15;
  int v16;
  unsigned int v17;
  __int128 v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  unsigned __int8 *v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t frame_pool;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unsigned __int8 *v34;
  _OWORD *v35;
  _OWORD *v36;
  int v37;
  unsigned int v38;
  __int128 v39;
  uint64_t v40;
  unsigned __int8 *v41;
  int v42;
  _OWORD *v43;
  _OWORD *v44;
  uint64_t v45;
  unsigned __int8 *v46;
  int v47;
  unint64_t v48;
  _QWORD *v49;
  __int16 v50;
  uint64_t path;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unsigned __int8 *v55;
  _OWORD *v56;
  _OWORD *v57;
  int v58;
  unsigned int v59;
  __int128 v60;
  uint64_t v61;
  unsigned __int8 *v62;
  int v63;
  _OWORD *v64;
  _OWORD *v65;
  uint64_t v66;
  unsigned __int8 *v67;
  int v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = *a3;
  if (*a3 != -1)
  {
    v5 = a3[1];
    if (v5 == -1 || v3 > v5)
    {
      a3[1] = v3;
      v8 = 0x2545F5000uLL;
      v9 = 0x2545F5000uLL;
      if (a2 == 22)
      {
        if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && a1[139])
        {
          v10 = _os_log_pack_size();
          v71 = &v69;
          v11 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v12 = _os_log_pack_fill();
          v70 = a1 + 122;
          v13 = (unsigned __int8 *)a1[139];
          if (quic_cid_describe_state % 3 == 2)
            v14 = &quic_cid_describe_cid_buf2;
          else
            v14 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v15 = v14;
          else
            v15 = &quic_cid_describe_cid_buf1;
          v16 = ++quic_cid_describe_state;
          v17 = v13[38];
          v18 = 0uLL;
          *(_OWORD *)((char *)v15 + 25) = 0u;
          if (v17 >= 0x14)
            v19 = 20;
          else
            v19 = v17;
          *v15 = 0uLL;
          v15[1] = 0uLL;
          if ((_DWORD)v19)
          {
            v20 = v13 + 39;
            do
            {
              v21 = *v20++;
              snprintf((char *)v15, 0x29uLL, "%s%02x", (const char *)v15, v21);
              --v19;
            }
            while (v19);
            v13 = (unsigned __int8 *)a1[139];
            v16 = quic_cid_describe_state;
            v18 = 0uLL;
          }
          if (v16 % 3 == 2)
            v22 = &quic_cid_describe_cid_buf2;
          else
            v22 = &quic_cid_describe_cid_buf3;
          if (v16 % 3)
            v23 = v22;
          else
            v23 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v16 + 1;
          if (v13[17] >= 0x14u)
            v24 = 20;
          else
            v24 = v13[17];
          *v23 = v18;
          v23[1] = v18;
          *(_OWORD *)((char *)v23 + 25) = v18;
          if ((_DWORD)v24)
          {
            v25 = v13 + 18;
            do
            {
              v26 = *v25++;
              snprintf((char *)v23, 0x29uLL, "%s%02x", (const char *)v23, v26);
              --v24;
            }
            while (v24);
          }
          v27 = *a3;
          *(_DWORD *)v12 = 136447234;
          *(_QWORD *)(v12 + 4) = "quic_send_streams_blocked";
          *(_WORD *)(v12 + 12) = 2082;
          *(_QWORD *)(v12 + 14) = v70;
          *(_WORD *)(v12 + 22) = 2082;
          *(_QWORD *)(v12 + 24) = v15;
          *(_WORD *)(v12 + 32) = 2082;
          *(_QWORD *)(v12 + 34) = v23;
          *(_WORD *)(v12 + 42) = 2048;
          *(_QWORD *)(v12 + 44) = v27;
          qlog_internal(0, (uint64_t)v11, 1502);
          v3 = *a3;
          v8 = 0x2545F5000;
          v9 = 0x2545F5000;
        }
        v28 = a1[70];
        frame_pool = quic_packet_builder_get_frame_pool(v28);
        v30 = 22;
      }
      else
      {
        if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && a1[139])
        {
          v31 = _os_log_pack_size();
          v71 = &v69;
          v32 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v33 = _os_log_pack_fill();
          v70 = a1 + 122;
          v34 = (unsigned __int8 *)a1[139];
          if (quic_cid_describe_state % 3 == 2)
            v35 = &quic_cid_describe_cid_buf2;
          else
            v35 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v36 = v35;
          else
            v36 = &quic_cid_describe_cid_buf1;
          v37 = ++quic_cid_describe_state;
          v38 = v34[38];
          v39 = 0uLL;
          *(_OWORD *)((char *)v36 + 25) = 0u;
          if (v38 >= 0x14)
            v40 = 20;
          else
            v40 = v38;
          *v36 = 0uLL;
          v36[1] = 0uLL;
          if ((_DWORD)v40)
          {
            v41 = v34 + 39;
            do
            {
              v42 = *v41++;
              snprintf((char *)v36, 0x29uLL, "%s%02x", (const char *)v36, v42);
              --v40;
            }
            while (v40);
            v34 = (unsigned __int8 *)a1[139];
            v37 = quic_cid_describe_state;
            v39 = 0uLL;
          }
          if (v37 % 3 == 2)
            v43 = &quic_cid_describe_cid_buf2;
          else
            v43 = &quic_cid_describe_cid_buf3;
          if (v37 % 3)
            v44 = v43;
          else
            v44 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v37 + 1;
          if (v34[17] >= 0x14u)
            v45 = 20;
          else
            v45 = v34[17];
          *v44 = v39;
          v44[1] = v39;
          *(_OWORD *)((char *)v44 + 25) = v39;
          if ((_DWORD)v45)
          {
            v46 = v34 + 18;
            do
            {
              v47 = *v46++;
              snprintf((char *)v44, 0x29uLL, "%s%02x", (const char *)v44, v47);
              --v45;
            }
            while (v45);
          }
          v48 = *a3;
          *(_DWORD *)v33 = 136447234;
          *(_QWORD *)(v33 + 4) = "quic_send_streams_blocked";
          *(_WORD *)(v33 + 12) = 2082;
          *(_QWORD *)(v33 + 14) = v70;
          *(_WORD *)(v33 + 22) = 2082;
          *(_QWORD *)(v33 + 24) = v36;
          *(_WORD *)(v33 + 32) = 2082;
          *(_QWORD *)(v33 + 34) = v44;
          *(_WORD *)(v33 + 42) = 2048;
          *(_QWORD *)(v33 + 44) = v48;
          qlog_internal(0, (uint64_t)v32, 1509);
          v3 = *a3;
          v8 = 0x2545F5000uLL;
          v9 = 0x2545F5000uLL;
        }
        v28 = a1[70];
        frame_pool = quic_packet_builder_get_frame_pool(v28);
        v30 = 23;
      }
      v49 = quic_frame_create(frame_pool, v30);
      v49[2] = v3;
      if (v3)
      {
        if (v3 >> 62)
          qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v3);
        v50 = byte_20A2A277C[(73 - __clz(v3)) >> 3];
      }
      else
      {
        v50 = 1;
      }
      *((_WORD *)v49 + 4) = v50 + 1;
      quic_packet_builder_append_for_pn_space(v28, (uint64_t)v49, 3u);
      path = quic_conn_select_next_path(a1, (uint64_t)&__block_literal_global_98);
      if ((quic_conn_send_internal((uint64_t)a1, path, 0) & 1) == 0
        && (*(_BYTE *)(v8 + 3232)
         || (*(_BYTE *)(v9 + 3233) & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && a1[139])
      {
        v52 = _os_log_pack_size();
        v71 = &v69;
        v53 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v52, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v54 = _os_log_pack_fill();
        v70 = a1 + 122;
        v55 = (unsigned __int8 *)a1[139];
        if (quic_cid_describe_state % 3 == 2)
          v56 = &quic_cid_describe_cid_buf2;
        else
          v56 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v57 = v56;
        else
          v57 = &quic_cid_describe_cid_buf1;
        v58 = ++quic_cid_describe_state;
        v59 = v55[38];
        v60 = 0uLL;
        *(_OWORD *)((char *)v57 + 25) = 0u;
        if (v59 >= 0x14)
          v61 = 20;
        else
          v61 = v59;
        *v57 = 0uLL;
        v57[1] = 0uLL;
        if ((_DWORD)v61)
        {
          v62 = v55 + 39;
          do
          {
            v63 = *v62++;
            snprintf((char *)v57, 0x29uLL, "%s%02x", (const char *)v57, v63);
            --v61;
          }
          while (v61);
          v55 = (unsigned __int8 *)a1[139];
          v58 = quic_cid_describe_state;
          v60 = 0uLL;
        }
        if (v58 % 3 == 2)
          v64 = &quic_cid_describe_cid_buf2;
        else
          v64 = &quic_cid_describe_cid_buf3;
        if (v58 % 3)
          v65 = v64;
        else
          v65 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v58 + 1;
        if (v55[17] >= 0x14u)
          v66 = 20;
        else
          v66 = v55[17];
        *v65 = v60;
        v65[1] = v60;
        *(_OWORD *)((char *)v65 + 25) = v60;
        if ((_DWORD)v66)
        {
          v67 = v55 + 18;
          do
          {
            v68 = *v67++;
            snprintf((char *)v65, 0x29uLL, "%s%02x", (const char *)v65, v68);
            --v66;
          }
          while (v66);
        }
        *(_DWORD *)v54 = 136446978;
        *(_QWORD *)(v54 + 4) = "quic_send_streams_blocked";
        *(_WORD *)(v54 + 12) = 2082;
        *(_QWORD *)(v54 + 14) = v70;
        *(_WORD *)(v54 + 22) = 2082;
        *(_QWORD *)(v54 + 24) = v57;
        *(_WORD *)(v54 + 32) = 2082;
        *(_QWORD *)(v54 + 34) = v65;
        qlog_internal(16, (uint64_t)v53, 1514);
      }
    }
  }
}

uint64_t __quic_fc_setup_streams_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (a3[250] || a3[251])
  {
    quic_fc_setup_stream(*(_QWORD *)(a1 + 32), (uint64_t)a3, a2);
    nw_protocol_instance_report_ready();
  }
  else if ((a3[352] & 0x20) == 0)
  {
    quic_stream_send_create(*(_QWORD *)(a1 + 32), a2, (uint64_t)a3);
  }
  return 1;
}

uint64_t __quic_stream_setup_metadata_handlers_block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 232) = a2;
  return result;
}

void quic_stream_set_usable_datagram_size(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_WORD *)(a1 + 248) = a2;
    nw_quic_stream_set_usable_datagram_frame_size();
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_stream_set_usable_datagram_size";
    qlog_internal(17, (uint64_t)v3, 309);
  }
}

void quic_stream_set_application_error(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (nw_protocol_metadata_is_quic_connection())
    {
      v1 = nw_quic_connection_copy_stream_metadata();
      if (v1)
      {
        v2 = (void *)v1;
        nw_quic_stream_set_application_error_internal();
        nw_release(v2);
      }
      v3 = nw_protocol_metadata_copy_original();
      if (v3)
      {
        v4 = (void *)v3;
        v5 = nw_quic_connection_copy_stream_metadata();
        if (v5)
        {
          v6 = (void *)v5;
          nw_quic_stream_set_application_error_internal();
          nw_release(v6);
        }
        nw_release(v4);
      }
    }
    else
    {
      nw_quic_stream_set_application_error_internal();
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "quic_stream_set_application_error";
    qlog_internal(17, (uint64_t)v8, 320);
  }
}

uint64_t __quic_stream_empty_pending_data_block_invoke()
{
  nw_frame_array_remove();
  nw_frame_finalize();
  return 1;
}

void quic_stream_zombie_create(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  _OWORD *v12;
  _OWORD *v13;
  int v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))&& a1[139])
    {
      v32 = a4;
      v8 = _os_log_pack_size();
      v31[1] = v31;
      v9 = (char *)v31 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      v31[0] = a1 + 122;
      v11 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2)
        v12 = &quic_cid_describe_cid_buf2;
      else
        v12 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v13 = v12;
      else
        v13 = &quic_cid_describe_cid_buf1;
      v14 = ++quic_cid_describe_state;
      v15 = v11[38];
      v16 = 0uLL;
      *(_OWORD *)((char *)v13 + 25) = 0u;
      if (v15 >= 0x14)
        v17 = 20;
      else
        v17 = v15;
      *v13 = 0uLL;
      v13[1] = 0uLL;
      if ((_DWORD)v17)
      {
        v18 = v11 + 39;
        do
        {
          v19 = *v18++;
          snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
          --v17;
        }
        while (v17);
        v11 = (unsigned __int8 *)a1[139];
        v14 = quic_cid_describe_state;
        v16 = 0uLL;
      }
      if (v14 % 3 == 2)
        v20 = &quic_cid_describe_cid_buf2;
      else
        v20 = &quic_cid_describe_cid_buf3;
      if (v14 % 3)
        v21 = v20;
      else
        v21 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v14 + 1;
      if (v11[17] >= 0x14u)
        v22 = 20;
      else
        v22 = v11[17];
      *v21 = v16;
      v21[1] = v16;
      *(_OWORD *)((char *)v21 + 25) = v16;
      if ((_DWORD)v22)
      {
        v23 = v11 + 18;
        do
        {
          v24 = *v23++;
          snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
          --v22;
        }
        while (v22);
      }
      *(_DWORD *)v10 = 136447490;
      *(_QWORD *)(v10 + 4) = "quic_stream_zombie_create";
      *(_WORD *)(v10 + 12) = 2082;
      *(_QWORD *)(v10 + 14) = v31[0];
      *(_WORD *)(v10 + 22) = 2082;
      *(_QWORD *)(v10 + 24) = v13;
      *(_WORD *)(v10 + 32) = 2082;
      *(_QWORD *)(v10 + 34) = v21;
      *(_WORD *)(v10 + 42) = 2048;
      *(_QWORD *)(v10 + 44) = a2;
      *(_WORD *)(v10 + 52) = 2048;
      *(_QWORD *)(v10 + 54) = a3;
      qlog_internal(1, (uint64_t)v9, 1672);
      a4 = v32;
    }
    v25 = malloc_type_calloc(1uLL, 0x28uLL, 0xEAFB8F1AuLL);
    if (!v25)
      qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0x28uLL);
    *v25 = a2;
    v25[1] = a3;
    v25[2] = a4;
    v26 = a1[102];
    v25[3] = v26;
    if (v26)
      v27 = (_QWORD *)(v26 + 32);
    else
      v27 = a1 + 103;
    *v27 = v25 + 3;
    a1[102] = v25;
    v25[4] = a1 + 102;
  }
  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v28 = _os_log_pack_size();
    v29 = (char *)v31 - ((MEMORY[0x24BDAC7A8](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v30 = _os_log_pack_fill();
    *(_DWORD *)v30 = 136446210;
    *(_QWORD *)(v30 + 4) = "quic_stream_zombie_create";
    qlog_internal(17, (uint64_t)v29, 1665);
  }
}

void quic_stream_send_reset_stream(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t frame_pool;
  _QWORD *v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  _OWORD *v17;
  _OWORD *v18;
  int v19;
  unsigned int v20;
  __int128 v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  _OWORD *v25;
  _OWORD *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  int v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = *(_QWORD *)a1;
    v5 = *(_QWORD *)(a2 + 560);
    v6 = *(_QWORD *)(a1 + 232);
    v7 = *(_QWORD *)(a1 + 32);
    frame_pool = quic_packet_builder_get_frame_pool(v5);
    v9 = quic_frame_create(frame_pool, 4);
    v9[2] = v4;
    v9[3] = v6;
    v9[4] = v7;
    if (v4)
    {
      if (v4 >> 62)
      {
        qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v4);
        goto LABEL_51;
      }
      v10 = byte_20A2A277C[(73 - __clz(v4)) >> 3];
      if (v6)
      {
LABEL_5:
        if (v6 >> 62)
        {
          qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v6);
          goto LABEL_51;
        }
        v11 = byte_20A2A277C[(73 - __clz(v6)) >> 3];
        if (v7)
        {
LABEL_7:
          if (!(v7 >> 62))
          {
            v12 = byte_20A2A277C[(73 - __clz(v7)) >> 3];
LABEL_12:
            *((_WORD *)v9 + 4) = v10 + v11 + v12 + 1;
            quic_packet_builder_append_for_pn_space(v5, (uint64_t)v9, 3u);
            if ((qlog_debug_enabled
               || (qlog_nwlog_enabled & 1) != 0
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
              && *(_QWORD *)(a2 + 1112))
            {
              v13 = _os_log_pack_size();
              v35 = &v33;
              v14 = (char *)&v33 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v15 = _os_log_pack_fill();
              v34 = a2 + 976;
              v16 = *(unsigned __int8 **)(a2 + 1112);
              if (quic_cid_describe_state % 3 == 2)
                v17 = &quic_cid_describe_cid_buf2;
              else
                v17 = &quic_cid_describe_cid_buf3;
              if (quic_cid_describe_state % 3)
                v18 = v17;
              else
                v18 = &quic_cid_describe_cid_buf1;
              v19 = ++quic_cid_describe_state;
              v20 = v16[38];
              v21 = 0uLL;
              *(_OWORD *)((char *)v18 + 25) = 0u;
              if (v20 >= 0x14)
                v22 = 20;
              else
                v22 = v20;
              *v18 = 0uLL;
              v18[1] = 0uLL;
              if ((_DWORD)v22)
              {
                v23 = v16 + 39;
                do
                {
                  v24 = *v23++;
                  snprintf((char *)v18, 0x29uLL, "%s%02x", (const char *)v18, v24);
                  --v22;
                }
                while (v22);
                v16 = *(unsigned __int8 **)(a2 + 1112);
                v19 = quic_cid_describe_state;
                v21 = 0uLL;
              }
              if (v19 % 3 == 2)
                v25 = &quic_cid_describe_cid_buf2;
              else
                v25 = &quic_cid_describe_cid_buf3;
              if (v19 % 3)
                v26 = v25;
              else
                v26 = &quic_cid_describe_cid_buf1;
              quic_cid_describe_state = v19 + 1;
              if (v16[17] >= 0x14u)
                v27 = 20;
              else
                v27 = v16[17];
              *v26 = v21;
              v26[1] = v21;
              *(_OWORD *)((char *)v26 + 25) = v21;
              if ((_DWORD)v27)
              {
                v28 = v16 + 18;
                do
                {
                  v29 = *v28++;
                  snprintf((char *)v26, 0x29uLL, "%s%02x", (const char *)v26, v29);
                  --v27;
                }
                while (v27);
              }
              *(_DWORD *)v15 = 136447234;
              *(_QWORD *)(v15 + 4) = "quic_stream_send_reset_stream";
              *(_WORD *)(v15 + 12) = 2082;
              *(_QWORD *)(v15 + 14) = v34;
              *(_WORD *)(v15 + 22) = 2082;
              *(_QWORD *)(v15 + 24) = v18;
              *(_WORD *)(v15 + 32) = 2082;
              *(_QWORD *)(v15 + 34) = v26;
              *(_WORD *)(v15 + 42) = 2048;
              *(_QWORD *)(v15 + 44) = v4;
              qlog_internal(0, (uint64_t)v14, 1631);
            }
            *(_DWORD *)(a1 + 352) |= 0x8000u;
            quic_fsm_send_stream_change((_BYTE *)(a1 + 250), 4u);
            return;
          }
          qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v7);
LABEL_51:
          __asm { BL              ___stack_chk_fail }
        }
LABEL_11:
        v12 = 1;
        goto LABEL_12;
      }
    }
    else
    {
      v10 = 1;
      if (v6)
        goto LABEL_5;
    }
    v11 = 1;
    if (v7)
      goto LABEL_7;
    goto LABEL_11;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v30 = _os_log_pack_size();
    v31 = (char *)&v33 - ((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v32 = _os_log_pack_fill();
    *(_DWORD *)v32 = 136446210;
    *(_QWORD *)(v32 + 4) = "quic_stream_send_reset_stream";
    qlog_internal(17, (uint64_t)v31, 1620);
  }
}

void quic_stream_unmark_pending(uint64_t a1, uint64_t *a2)
{
  int v3;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v12 = _os_log_pack_size();
    v13 = (char *)v23 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "quic_stream_unmark_pending";
    v15 = (uint64_t)v13;
    v16 = 1295;
LABEL_26:
    qlog_internal(17, v15, v16);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v17 = _os_log_pack_size();
    v18 = (char *)v23 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "quic_stream_unmark_pending";
    v15 = (uint64_t)v18;
    v16 = 1296;
    goto LABEL_26;
  }
  v3 = *((_DWORD *)a2 + 88);
  if ((v3 & 0x20) != 0)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v5 = _os_log_pack_size();
      v6 = (char *)v23 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v7 = _os_log_pack_fill();
      v8 = *a2;
      v9 = a2[3];
      *(_DWORD *)v7 = 136446722;
      *(_QWORD *)(v7 + 4) = "quic_stream_unmark_pending";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = v8;
      *(_WORD *)(v7 + 22) = 2048;
      *(_QWORD *)(v7 + 24) = v9;
      qlog_internal(2, (uint64_t)v6, 1304);
      v3 = *((_DWORD *)a2 + 88);
    }
    v10 = a2[36];
    v11 = (_QWORD *)a2[37];
    if ((v3 & 0x4000) != 0)
    {
      if (!v10)
      {
        *(_QWORD *)(a1 + 808) = v11;
        goto LABEL_13;
      }
    }
    else if (!v10)
    {
      *(_QWORD *)(a1 + 728) = v11;
LABEL_13:
      *v11 = v10;
      a2[36] = 0;
      a2[37] = 0;
      *((_DWORD *)a2 + 88) &= ~0x20u;
      return;
    }
    *(_QWORD *)(v10 + 296) = v11;
    v11 = (_QWORD *)a2[37];
    goto LABEL_13;
  }
  if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v20 = _os_log_pack_size();
    v21 = (char *)v23 - ((MEMORY[0x24BDAC7A8](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136446210;
    *(_QWORD *)(v22 + 4) = "quic_stream_unmark_pending";
    v15 = (uint64_t)v21;
    v16 = 1300;
    goto LABEL_26;
  }
}

void quic_stream_send_stop_sending(unint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    quic_frame_alloc_STOP_SENDING(*(_QWORD *)(a2 + 560), *a1, a1[29]);
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_stream_send_stop_sending";
    qlog_internal(17, (uint64_t)v3, 1603);
  }
}

void quic_replace_stream_flow(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  char v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (*MEMORY[0x24BDE08A0] == a3)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v24 = _os_log_pack_size();
        v25 = (char *)v30 - ((MEMORY[0x24BDAC7A8](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v26 = _os_log_pack_fill();
        *(_DWORD *)v26 = 136446210;
        *(_QWORD *)(v26 + 4) = "quic_replace_stream_flow";
        v10 = 17;
        v11 = (uint64_t)v25;
        v12 = 503;
        goto LABEL_24;
      }
    }
    else if (*MEMORY[0x24BDE08A0] == a4)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v27 = _os_log_pack_size();
        v28 = (char *)v30 - ((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v29 = _os_log_pack_fill();
        *(_DWORD *)v29 = 136446210;
        *(_QWORD *)(v29 + 4) = "quic_replace_stream_flow";
        v10 = 17;
        v11 = (uint64_t)v28;
        v12 = 504;
        goto LABEL_24;
      }
    }
    else if (a2[3] == a3)
    {
      a2[3] = a4;
      if (*a2 == -4)
      {
        v6 = qlog_nwlog_enabled;
        if (qlog_datapath_enabled || qlog_nwlog_enabled)
        {
          if (qlog_debug_enabled)
            v6 = 1;
          if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            v7 = _os_log_pack_size();
            v8 = (char *)v30 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v9 = _os_log_pack_fill();
            *(_DWORD *)v9 = 136446210;
            *(_QWORD *)(v9 + 4) = "quic_replace_stream_flow";
            v10 = 2;
            v11 = (uint64_t)v8;
            v12 = 529;
LABEL_24:
            qlog_internal(v10, v11, v12);
          }
        }
      }
      else
      {
        v17 = (_QWORD *)a2[1];
        if (v17 && *v17)
        {
          nw_protocol_instance_clear_flow_for_key();
          nw_protocol_instance_set_flow_for_key();
          return;
        }
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          v18 = _os_log_pack_size();
          v19 = (char *)v30 - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v20 = _os_log_pack_fill();
          *(_DWORD *)v20 = 136446210;
          *(_QWORD *)(v20 + 4) = "quic_replace_stream_flow";
          v10 = 17;
          v11 = (uint64_t)v19;
          v12 = 525;
          goto LABEL_24;
        }
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v13 = _os_log_pack_size();
      v14 = (char *)v30 - ((MEMORY[0x24BDAC7A8](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v15 = _os_log_pack_fill();
      v16 = a2[3];
      *(_DWORD *)v15 = 136446722;
      *(_QWORD *)(v15 + 4) = "quic_replace_stream_flow";
      *(_WORD *)(v15 + 12) = 2048;
      *(_QWORD *)(v15 + 14) = a3;
      *(_WORD *)(v15 + 22) = 2048;
      *(_QWORD *)(v15 + 24) = v16;
      qlog_internal(17, (uint64_t)v14, 510);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v21 = _os_log_pack_size();
    v22 = (char *)v30 - ((MEMORY[0x24BDAC7A8](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136446210;
    *(_QWORD *)(v23 + 4) = "quic_replace_stream_flow";
    v10 = 17;
    v11 = (uint64_t)v22;
    v12 = 502;
    goto LABEL_24;
  }
}

uint64_t quic_stream_closed_already(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _OWORD *v15;
  _OWORD *v16;
  int v17;
  unsigned int v18;
  __int128 v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  _QWORD *v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  int v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unsigned __int8 *v36;
  _OWORD *v37;
  _OWORD *v38;
  int v39;
  unsigned int v40;
  __int128 v41;
  uint64_t v42;
  unsigned __int8 *v43;
  int v44;
  _OWORD *v45;
  _OWORD *v46;
  uint64_t v47;
  unsigned __int8 *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unsigned __int8 *v55;
  _OWORD *v56;
  _OWORD *v57;
  int v58;
  unsigned int v59;
  __int128 v60;
  uint64_t v61;
  unsigned __int8 *v62;
  int v63;
  _OWORD *v64;
  _OWORD *v65;
  uint64_t v66;
  unsigned __int8 *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v71 = _os_log_pack_size();
      v72 = (char *)&v82 - ((MEMORY[0x24BDAC7A8](v71, v71) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v73 = _os_log_pack_fill();
      *(_DWORD *)v73 = 136446210;
      *(_QWORD *)(v73 + 4) = "quic_stream_closed_already";
      qlog_internal(17, (uint64_t)v72, 787);
    }
    return 0;
  }
  v4 = 96;
  if ((a2 & 2) == 0)
    v4 = 86;
  v5 = a1[v4];
  if (v5 == -4)
    return 0;
  v8 = 97;
  if ((a2 & 2) == 0)
    v8 = 87;
  v9 = a1[v8];
  if (v9 == -4)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v74 = _os_log_pack_size();
      v75 = (char *)&v82 - ((MEMORY[0x24BDAC7A8](v74, v74) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v76 = _os_log_pack_fill();
      *(_DWORD *)v76 = 136446210;
      *(_QWORD *)(v76 + 4) = "quic_stream_closed_already";
      qlog_internal(17, (uint64_t)v75, 806);
    }
    v6 = 0;
    a1[134] = 1;
    a1[135] = "inconsistent next inbound stream ID";
    return v6;
  }
  if ((*((_BYTE *)a1 + 1380) & 1) != 0)
  {
    if ((a2 & 1) == 0)
    {
LABEL_12:
      if ((a2 & 2) != 0)
      {
        if (!a1[94])
          goto LABEL_126;
        v10 = a1[99];
      }
      else
      {
        if (!a1[84])
          goto LABEL_126;
        v10 = a1[89];
      }
      if (v10 >= a2)
      {
        if (v9 <= a2)
          return 0;
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (v6 = 1, os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)))
        {
          if (a1[139])
          {
            v33 = _os_log_pack_size();
            v34 = (char *)&v82 - ((MEMORY[0x24BDAC7A8](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v35 = _os_log_pack_fill();
            v84 = a1 + 122;
            v36 = (unsigned __int8 *)a1[139];
            if (quic_cid_describe_state % 3 == 2)
              v37 = &quic_cid_describe_cid_buf2;
            else
              v37 = &quic_cid_describe_cid_buf3;
            if (quic_cid_describe_state % 3)
              v38 = v37;
            else
              v38 = &quic_cid_describe_cid_buf1;
            v39 = ++quic_cid_describe_state;
            v40 = v36[38];
            v41 = 0uLL;
            *(_OWORD *)((char *)v38 + 25) = 0u;
            if (v40 >= 0x14)
              v42 = 20;
            else
              v42 = v40;
            *v38 = 0uLL;
            v38[1] = 0uLL;
            if ((_DWORD)v42)
            {
              v43 = v36 + 39;
              do
              {
                v44 = *v43++;
                snprintf((char *)v38, 0x29uLL, "%s%02x", (const char *)v38, v44);
                --v42;
              }
              while (v42);
              v36 = (unsigned __int8 *)a1[139];
              v39 = quic_cid_describe_state;
              v41 = 0uLL;
            }
            if (v39 % 3 == 2)
              v45 = &quic_cid_describe_cid_buf2;
            else
              v45 = &quic_cid_describe_cid_buf3;
            if (v39 % 3)
              v46 = v45;
            else
              v46 = &quic_cid_describe_cid_buf1;
            quic_cid_describe_state = v39 + 1;
            if (v36[17] >= 0x14u)
              v47 = 20;
            else
              v47 = v36[17];
            *v46 = v41;
            v46[1] = v41;
            *(_OWORD *)((char *)v46 + 25) = v41;
            if ((_DWORD)v47)
            {
              v48 = v36 + 18;
              do
              {
                v49 = *v48++;
                snprintf((char *)v46, 0x29uLL, "%s%02x", (const char *)v46, v49);
                --v47;
              }
              while (v47);
            }
            *(_DWORD *)v35 = 136447234;
            *(_QWORD *)(v35 + 4) = "quic_stream_closed_already";
            *(_WORD *)(v35 + 12) = 2082;
            *(_QWORD *)(v35 + 14) = v84;
            *(_WORD *)(v35 + 22) = 2082;
            *(_QWORD *)(v35 + 24) = v38;
            *(_WORD *)(v35 + 32) = 2082;
            *(_QWORD *)(v35 + 34) = v46;
            *(_WORD *)(v35 + 42) = 2048;
            *(_QWORD *)(v35 + 44) = a2;
            v6 = 1;
            v50 = (uint64_t)v34;
            v51 = 851;
LABEL_115:
            qlog_internal(1, v50, v51);
            return v6;
          }
          return 1;
        }
        return v6;
      }
LABEL_126:
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && a1[139])
      {
        v77 = _os_log_pack_size();
        v78 = (char *)&v82 - ((MEMORY[0x24BDAC7A8](v77, v77) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v79 = _os_log_pack_fill();
        v80 = quic_cid_describe((unsigned __int8 *)(a1[139] + 38));
        v81 = quic_cid_describe((unsigned __int8 *)(a1[139] + 17));
        *(_DWORD *)v79 = 136447234;
        *(_QWORD *)(v79 + 4) = "quic_stream_closed_already";
        *(_WORD *)(v79 + 12) = 2082;
        *(_QWORD *)(v79 + 14) = a1 + 122;
        *(_WORD *)(v79 + 22) = 2082;
        *(_QWORD *)(v79 + 24) = v80;
        *(_WORD *)(v79 + 32) = 2082;
        *(_QWORD *)(v79 + 34) = v81;
        *(_WORD *)(v79 + 42) = 2048;
        *(_QWORD *)(v79 + 44) = a2;
        qlog_internal(16, (uint64_t)v78, 842);
      }
      v6 = 0;
      a1[134] = 4;
      a1[135] = "exceeded maximum stream ID";
      return v6;
    }
  }
  else if ((a2 & 1) != 0)
  {
    goto LABEL_12;
  }
  if (v5 >= a2)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || (v6 = 1, os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)))
    {
      if (a1[139])
      {
        v52 = _os_log_pack_size();
        v53 = (char *)&v82 - ((MEMORY[0x24BDAC7A8](v52, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v54 = _os_log_pack_fill();
        v84 = a1 + 122;
        v55 = (unsigned __int8 *)a1[139];
        if (quic_cid_describe_state % 3 == 2)
          v56 = &quic_cid_describe_cid_buf2;
        else
          v56 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v57 = v56;
        else
          v57 = &quic_cid_describe_cid_buf1;
        v58 = ++quic_cid_describe_state;
        v59 = v55[38];
        v60 = 0uLL;
        *(_OWORD *)((char *)v57 + 25) = 0u;
        if (v59 >= 0x14)
          v61 = 20;
        else
          v61 = v59;
        *v57 = 0uLL;
        v57[1] = 0uLL;
        if ((_DWORD)v61)
        {
          v62 = v55 + 39;
          do
          {
            v63 = *v62++;
            snprintf((char *)v57, 0x29uLL, "%s%02x", (const char *)v57, v63);
            --v61;
          }
          while (v61);
          v55 = (unsigned __int8 *)a1[139];
          v58 = quic_cid_describe_state;
          v60 = 0uLL;
        }
        if (v58 % 3 == 2)
          v64 = &quic_cid_describe_cid_buf2;
        else
          v64 = &quic_cid_describe_cid_buf3;
        if (v58 % 3)
          v65 = v64;
        else
          v65 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v58 + 1;
        if (v55[17] >= 0x14u)
          v66 = 20;
        else
          v66 = v55[17];
        *v65 = v60;
        v65[1] = v60;
        *(_OWORD *)((char *)v65 + 25) = v60;
        if ((_DWORD)v66)
        {
          v67 = v55 + 18;
          do
          {
            v68 = *v67++;
            snprintf((char *)v65, 0x29uLL, "%s%02x", (const char *)v65, v68);
            --v66;
          }
          while (v66);
        }
        v69 = a1[86];
        v70 = a1[96];
        *(_DWORD *)v54 = 136447746;
        *(_QWORD *)(v54 + 4) = "quic_stream_closed_already";
        *(_WORD *)(v54 + 12) = 2082;
        *(_QWORD *)(v54 + 14) = v84;
        *(_WORD *)(v54 + 22) = 2082;
        *(_QWORD *)(v54 + 24) = v57;
        *(_WORD *)(v54 + 32) = 2082;
        *(_QWORD *)(v54 + 34) = v65;
        *(_WORD *)(v54 + 42) = 2048;
        *(_QWORD *)(v54 + 44) = a2;
        *(_WORD *)(v54 + 52) = 2048;
        *(_QWORD *)(v54 + 54) = v69;
        *(_WORD *)(v54 + 62) = 2048;
        *(_QWORD *)(v54 + 64) = v70;
        v6 = 1;
        v50 = (uint64_t)v53;
        v51 = 822;
        goto LABEL_115;
      }
      return 1;
    }
  }
  else
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      v11 = _os_log_pack_size();
      v84 = &v82;
      v12 = (char *)&v82 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v13 = _os_log_pack_fill();
      v83 = a1 + 122;
      v14 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2)
        v15 = &quic_cid_describe_cid_buf2;
      else
        v15 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v16 = v15;
      else
        v16 = &quic_cid_describe_cid_buf1;
      v17 = ++quic_cid_describe_state;
      v18 = v14[38];
      v19 = 0uLL;
      *(_OWORD *)((char *)v16 + 25) = 0u;
      if (v18 >= 0x14)
        v20 = 20;
      else
        v20 = v18;
      *v16 = 0uLL;
      v16[1] = 0uLL;
      if ((_DWORD)v20)
      {
        v21 = v14 + 39;
        do
        {
          v22 = *v21++;
          snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
          --v20;
        }
        while (v20);
        v14 = (unsigned __int8 *)a1[139];
        v17 = quic_cid_describe_state;
        v19 = 0uLL;
      }
      v23 = (_QWORD *)((char *)a1 + 1380);
      if (v17 % 3 == 2)
        v24 = &quic_cid_describe_cid_buf2;
      else
        v24 = &quic_cid_describe_cid_buf3;
      if (v17 % 3)
        v25 = v24;
      else
        v25 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v17 + 1;
      if (v14[17] >= 0x14u)
        v26 = 20;
      else
        v26 = v14[17];
      *v25 = v19;
      v25[1] = v19;
      *(_OWORD *)((char *)v25 + 25) = v19;
      if ((_DWORD)v26)
      {
        v27 = v14 + 18;
        do
        {
          v28 = *v27++;
          snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
          --v26;
        }
        while (v26);
      }
      v29 = "server";
      v30 = a1[86];
      if ((*v23 & 1) != 0)
        v31 = "server";
      else
        v31 = "client";
      v32 = a1[96];
      if ((*v23 & 1) != 0)
        v29 = "client";
      *(_DWORD *)v13 = 136448258;
      *(_QWORD *)(v13 + 4) = "quic_stream_closed_already";
      *(_WORD *)(v13 + 12) = 2082;
      *(_QWORD *)(v13 + 14) = v83;
      *(_WORD *)(v13 + 22) = 2082;
      *(_QWORD *)(v13 + 24) = v16;
      *(_WORD *)(v13 + 32) = 2082;
      *(_QWORD *)(v13 + 34) = v25;
      *(_WORD *)(v13 + 42) = 2082;
      *(_QWORD *)(v13 + 44) = v31;
      *(_WORD *)(v13 + 52) = 2082;
      *(_QWORD *)(v13 + 54) = v29;
      *(_WORD *)(v13 + 62) = 2048;
      *(_QWORD *)(v13 + 64) = a2;
      *(_WORD *)(v13 + 72) = 2048;
      *(_QWORD *)(v13 + 74) = v30;
      *(_WORD *)(v13 + 82) = 2048;
      *(_QWORD *)(v13 + 84) = v32;
      qlog_internal(16, (uint64_t)v12, 833);
    }
    v6 = 0;
    a1[134] = 5;
    a1[135] = "invalid stream ID";
  }
  return v6;
}

uint64_t quic_stream_compute_datagram_usable_frame_size(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned __int16 v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned __int8 *)(a2 + 17)
     + (unint64_t)quic_protector_get_tag_size(*(_QWORD *)(a1 + 568), *(unsigned __int8 *)(a1 + 600))+ 5;
  v7 = quic_tp_get(*(_BYTE **)(a1 + 544), 3);
  v8 = *(unsigned __int16 *)(a2 + 426);
  if (v7 < v8)
    LOWORD(v8) = quic_tp_get(*(_BYTE **)(a1 + 544), 3);
  v9 = (unsigned __int16)v8 - (_DWORD)v6;
  if ((v9 & 0xFFFF0000) != 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v10 = _os_log_pack_size();
      v11 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v12 = _os_log_pack_fill();
      *(_DWORD *)v12 = 136447234;
      *(_QWORD *)(v12 + 4) = "quic_stream_compute_datagram_usable_frame_size";
      *(_WORD *)(v12 + 12) = 2082;
      *(_QWORD *)(v12 + 14) = "remote_usable_udp_payload_size";
      *(_WORD *)(v12 + 22) = 2048;
      *(_QWORD *)(v12 + 24) = (unsigned __int16)v9 + v6;
      *(_WORD *)(v12 + 32) = 2048;
      *(_QWORD *)(v12 + 34) = v6;
      *(_WORD *)(v12 + 42) = 2048;
      *(_QWORD *)(v12 + 44) = (unsigned __int16)v9;
      qlog_internal(17, (uint64_t)v11, 1338);
      v13 = 1;
      LOWORD(v9) = 0;
      goto LABEL_11;
    }
  }
  else if ((_WORD)v8 != (_WORD)v6)
  {
    v13 = byte_20A2A277C[(73 - __clz((unsigned __int16)(v8 - v6))) >> 3];
    goto LABEL_11;
  }
  LOWORD(v9) = 0;
  v13 = 1;
LABEL_11:
  v14 = (v13 + 1);
  v15 = *(unsigned __int16 *)(a1 + 586);
  if (v15 >= (unsigned __int16)v9)
    v15 = (unsigned __int16)v9;
  v16 = v15 - v14;
  if (((v15 - (_DWORD)v14) & 0xFFFF0000) != 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v17 = _os_log_pack_size();
      v18 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v19 = _os_log_pack_fill();
      *(_DWORD *)v19 = 136447234;
      *(_QWORD *)(v19 + 4) = "quic_stream_compute_datagram_usable_frame_size";
      *(_WORD *)(v19 + 12) = 2082;
      *(_QWORD *)(v19 + 14) = "usable_datagram_frame_size";
      *(_WORD *)(v19 + 22) = 2048;
      *(_QWORD *)(v19 + 24) = v16 + v14;
      *(_WORD *)(v19 + 32) = 2048;
      *(_QWORD *)(v19 + 34) = v14;
      *(_WORD *)(v19 + 42) = 2048;
      *(_QWORD *)(v19 + 44) = v16;
      qlog_internal(17, (uint64_t)v18, 1347);
    }
    v16 = 0;
  }
  if ((*(_BYTE *)(a1 + 1383) & 0x10) != 0)
  {
    v20 = *(_QWORD *)a3 & 0x7FFFFFFFFFFFFFFFLL;
    if (v20)
    {
      if (v20 >> 62)
        qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v20);
      v21 = byte_20A2A277C[(73 - __clz(v20)) >> 3];
    }
    else
    {
      v21 = 1;
    }
    v22 = v16 - v21;
    v16 -= v21;
    if ((v22 & 0xFFFF0000) != 0)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v23 = _os_log_pack_size();
        v24 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v25 = _os_log_pack_fill();
        *(_DWORD *)v25 = 136447234;
        *(_QWORD *)(v25 + 4) = "quic_stream_compute_datagram_usable_frame_size";
        *(_WORD *)(v25 + 12) = 2082;
        *(_QWORD *)(v25 + 14) = "usable_datagram_frame_size";
        *(_WORD *)(v25 + 22) = 2048;
        *(_QWORD *)(v25 + 24) = (unsigned __int16)v22 + (unint64_t)v21;
        *(_WORD *)(v25 + 32) = 2048;
        *(_QWORD *)(v25 + 34) = v21;
        *(_WORD *)(v25 + 42) = 2048;
        *(_QWORD *)(v25 + 44) = (unsigned __int16)v22;
        qlog_internal(17, (uint64_t)v24, 1353);
      }
      v16 = 0;
    }
  }
  quic_stream_set_usable_datagram_size(a3, v16);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v26 = _os_log_pack_size();
    v27 = (char *)v32 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v28 = _os_log_pack_fill();
    v29 = *(_QWORD *)a3;
    v30 = *(unsigned __int16 *)(a3 + 248);
    *(_DWORD *)v28 = 136446722;
    *(_QWORD *)(v28 + 4) = "quic_stream_compute_datagram_usable_frame_size";
    *(_WORD *)(v28 + 12) = 2048;
    *(_QWORD *)(v28 + 14) = v29;
    *(_WORD *)(v28 + 22) = 1024;
    *(_DWORD *)(v28 + 24) = v30;
    qlog_internal(2, (uint64_t)v27, 1358);
  }
  return nw_protocol_instance_set_flow_is_datagram();
}

void quic_stream_send_fc_credit(uint64_t a1, uint64_t a2)
{
  _BOOL4 v4;
  int v5;
  int v6;
  uint64_t path;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      if (*(unsigned __int8 *)(a1 + 477) <= 9u)
      {
        v4 = quic_prepare_max_data((_QWORD *)a1);
        v5 = quic_prepare_max_stream_data((uint64_t *)a2);
        v6 = v5;
        if (v4 || v5)
        {
          if (v4)
            quic_frame_alloc_MAX_DATA(*(_QWORD *)(a1 + 560), *(_QWORD *)(a1 + 856));
          if (v6)
            quic_frame_alloc_MAX_STREAM_DATA(*(_QWORD *)(a1 + 560), *(_QWORD *)a2, *(_QWORD *)(a2 + 48));
          path = quic_conn_select_next_path((_QWORD *)a1, (uint64_t)&__block_literal_global_98);
          if ((quic_conn_send_internal(a1, path, 0) & 1) == 0
            && (qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
          {
            v8 = _os_log_pack_size();
            v9 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v10 = _os_log_pack_fill();
            *(_DWORD *)v10 = 136446210;
            *(_QWORD *)(v10 + 4) = "quic_stream_send_fc_credit";
            v11 = 2;
            v12 = (uint64_t)v9;
            v13 = 1496;
LABEL_15:
            qlog_internal(v11, v12, v13);
          }
        }
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v17 = _os_log_pack_size();
      v18 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v19 = _os_log_pack_fill();
      *(_DWORD *)v19 = 136446210;
      *(_QWORD *)(v19 + 4) = "quic_stream_send_fc_credit";
      v11 = 17;
      v12 = (uint64_t)v18;
      v13 = 1464;
      goto LABEL_15;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136446210;
    *(_QWORD *)(v16 + 4) = "quic_stream_send_fc_credit";
    v11 = 17;
    v12 = (uint64_t)v15;
    v13 = 1463;
    goto LABEL_15;
  }
}

uint64_t ____quic_signpost_is_enabled_block_invoke_3650()
{
  uint64_t result;

  result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_3647 = result;
  return result;
}

void quic_stream_close(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      *(_DWORD *)(a2 + 352) |= 0x40u;
      nw_protocol_instance_clear_flow_for_key();
      nw_protocol_instance_report_done();
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136446210;
      *(_QWORD *)(v9 + 4) = "quic_stream_close";
      v5 = (uint64_t)v8;
      v6 = 1369;
      goto LABEL_12;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_stream_close";
    v5 = (uint64_t)v3;
    v6 = 1368;
LABEL_12:
    qlog_internal(17, v5, v6);
  }
}

void quic_stream_reset_id(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (nw_protocol_metadata_is_quic_connection())
  {
    v2 = nw_quic_connection_copy_stream_metadata();
    if (v2)
    {
      v3 = (void *)v2;
      nw_quic_stream_set_id();
      if ((*(_BYTE *)(a1 + 353) & 0x10) == 0)
        quic_stream_id_to_type(*(_QWORD *)a1);
      nw_quic_stream_set_type();
      nw_release(v3);
    }
    v4 = nw_protocol_metadata_copy_original();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = nw_quic_connection_copy_stream_metadata();
      if (v6)
      {
        v7 = (void *)v6;
        nw_quic_stream_set_id();
        if ((*(_BYTE *)(a1 + 353) & 0x10) == 0)
          quic_stream_id_to_type(*(_QWORD *)a1);
        nw_quic_stream_set_type();
        nw_release(v7);
      }
      nw_release(v5);
    }
  }
  else
  {
    nw_quic_stream_set_id();
    if ((*(_BYTE *)(a1 + 353) & 0x10) == 0)
      quic_stream_id_to_type(*(_QWORD *)a1);
    nw_quic_stream_set_type();
  }
}

void quic_stream_zombie_final_size(_QWORD *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t updated;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  _OWORD *v39;
  _OWORD *v40;
  int v41;
  unsigned int v42;
  __int128 v43;
  uint64_t v44;
  unsigned __int8 *v45;
  int v46;
  _OWORD *v47;
  _OWORD *v48;
  uint64_t v49;
  unsigned __int8 *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  _QWORD *v59;
  char *v60;
  _QWORD *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
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
  __int128 v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v3 = 0x2545F5000uLL;
  if (a1)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)&v59 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      v10 = *a2;
      v11 = a2[1];
      *(_DWORD *)v9 = 136446978;
      *(_QWORD *)(v9 + 4) = "quic_stream_zombie_final_size";
      *(_WORD *)(v9 + 12) = 2048;
      *(_QWORD *)(v9 + 14) = v10;
      *(_WORD *)(v9 + 22) = 2048;
      *(_QWORD *)(v9 + 24) = a3;
      *(_WORD *)(v9 + 32) = 2048;
      *(_QWORD *)(v9 + 34) = v11;
      qlog_internal(2, (uint64_t)v8, 1712);
    }
    v12 = a3 - 1;
    if (a3)
      v13 = a3 - 1;
    else
      v13 = 0;
    v14 = a2[1];
    if (v14)
      v15 = v14 - 1;
    else
      v15 = 0;
    if (v14 < a3)
    {
      v16 = qlog_debug_enabled;
      v17 = qlog_nwlog_enabled;
      v18 = v12 - v14;
      if (v12 < v14)
      {
        if (qlog_debug_enabled)
          v17 = 1;
        if ((v17 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          v19 = _os_log_pack_size();
          v20 = (char *)&v59 - ((MEMORY[0x24BDAC7A8](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v21 = _os_log_pack_fill();
          v22 = a2[1];
          *(_DWORD *)v21 = 136447234;
          *(_QWORD *)(v21 + 4) = "quic_stream_zombie_final_size";
          *(_WORD *)(v21 + 12) = 2082;
          *(_QWORD *)(v21 + 14) = "inorder_offset_delta";
          *(_WORD *)(v21 + 22) = 2048;
          *(_QWORD *)(v21 + 24) = v22 + v18;
          *(_WORD *)(v21 + 32) = 2048;
          *(_QWORD *)(v21 + 34) = v22;
          *(_WORD *)(v21 + 42) = 2048;
          *(_QWORD *)(v21 + 44) = v18;
          qlog_internal(17, (uint64_t)v20, 1724);
          v16 = qlog_debug_enabled;
          v17 = qlog_nwlog_enabled;
        }
        else
        {
          v17 = 0;
          v16 = 0;
        }
        v18 = -1;
      }
      v23 = a1[116];
      a1[116] = v23 + v18;
      if (__CFADD__(v23, v18))
      {
        if (v16)
          v17 = 1;
        if ((v17 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          v24 = _os_log_pack_size();
          v25 = (char *)&v59 - ((MEMORY[0x24BDAC7A8](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v26 = _os_log_pack_fill();
          v27 = a1[116];
          *(_DWORD *)v26 = 136447234;
          *(_QWORD *)(v26 + 4) = "quic_stream_zombie_final_size";
          *(_WORD *)(v26 + 12) = 2082;
          *(_QWORD *)(v26 + 14) = "conn->inorder_offset";
          *(_WORD *)(v26 + 22) = 2048;
          *(_QWORD *)(v26 + 24) = v27 - v18;
          *(_WORD *)(v26 + 32) = 2048;
          *(_QWORD *)(v26 + 34) = v18;
          *(_WORD *)(v26 + 42) = 2048;
          *(_QWORD *)(v26 + 44) = v27;
          qlog_internal(17, (uint64_t)v25, 1726);
          v3 = 0x2545F5000uLL;
          v28 = qlog_debug_enabled;
          v17 = qlog_nwlog_enabled;
        }
        else
        {
          v17 = 0;
          v28 = 0;
          v3 = 0x2545F5000uLL;
        }
        a1[116] = -1;
        if (v28)
          goto LABEL_33;
      }
      else
      {
        v3 = 0x2545F5000;
        if (v16)
        {
LABEL_33:
          v29 = _os_log_pack_size();
          v30 = (char *)&v59 - ((MEMORY[0x24BDAC7A8](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v31 = _os_log_pack_fill();
          v32 = *a2;
          v33 = a1[116];
          *(_DWORD *)v31 = 136446722;
          *(_QWORD *)(v31 + 4) = "quic_stream_zombie_final_size";
          *(_WORD *)(v31 + 12) = 2048;
          *(_QWORD *)(v31 + 14) = v32;
          *(_WORD *)(v31 + 22) = 2048;
          *(_QWORD *)(v31 + 24) = v33;
          qlog_internal(2, (uint64_t)v30, 1729);
          goto LABEL_34;
        }
      }
      if ((v17 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        goto LABEL_33;
    }
LABEL_34:
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
    v77 = 0u;
    v76 = 0u;
    v75 = 0u;
    v74 = 0u;
    v73 = 0u;
    v72 = 0u;
    v71 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v62 = *a2;
    BYTE3(v78) = 1;
    *(_QWORD *)&v73 = v15;
    *((_QWORD *)&v73 + 1) = -1;
    *((_QWORD *)&v65 + 1) = a2[2];
    updated = quic_stream_update_last_offset(a1, (uint64_t)&v62, v13, a3, 1);
    if (updated)
    {
      if (updated != -1)
      {
        quic_conn_send_fc_credit((uint64_t)a1);
        v54 = a2[3];
        v55 = (_QWORD *)a2[4];
        if (v54)
          goto LABEL_67;
        goto LABEL_69;
      }
      if ((*(_BYTE *)(v3 + 3232)
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && a1[139])
      {
        v35 = _os_log_pack_size();
        v61 = &v59;
        v36 = MEMORY[0x24BDAC7A8](v35, v35);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v60 = (char *)&v59 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
        v37 = _os_log_pack_fill();
        v59 = a1 + 122;
        v38 = (unsigned __int8 *)a1[139];
        if (quic_cid_describe_state % 3 == 2)
          v39 = &quic_cid_describe_cid_buf2;
        else
          v39 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v40 = v39;
        else
          v40 = &quic_cid_describe_cid_buf1;
        v41 = ++quic_cid_describe_state;
        v42 = v38[38];
        v43 = 0uLL;
        *(_OWORD *)((char *)v40 + 25) = 0u;
        if (v42 >= 0x14)
          v44 = 20;
        else
          v44 = v42;
        *v40 = 0uLL;
        v40[1] = 0uLL;
        if ((_DWORD)v44)
        {
          v45 = v38 + 39;
          do
          {
            v46 = *v45++;
            snprintf((char *)v40, 0x29uLL, "%s%02x", (const char *)v40, v46);
            --v44;
          }
          while (v44);
          v38 = (unsigned __int8 *)a1[139];
          v41 = quic_cid_describe_state;
          v43 = 0uLL;
        }
        if (v41 % 3 == 2)
          v47 = &quic_cid_describe_cid_buf2;
        else
          v47 = &quic_cid_describe_cid_buf3;
        if (v41 % 3)
          v48 = v47;
        else
          v48 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v41 + 1;
        if (v38[17] >= 0x14u)
          v49 = 20;
        else
          v49 = v38[17];
        *v48 = v43;
        v48[1] = v43;
        *(_OWORD *)((char *)v48 + 25) = v43;
        if ((_DWORD)v49)
        {
          v50 = v38 + 18;
          do
          {
            v51 = *v50++;
            snprintf((char *)v48, 0x29uLL, "%s%02x", (const char *)v48, v51);
            --v49;
          }
          while (v49);
        }
        v52 = *a2;
        *(_DWORD *)v37 = 136447490;
        *(_QWORD *)(v37 + 4) = "quic_stream_zombie_final_size";
        *(_WORD *)(v37 + 12) = 2082;
        v53 = (uint64_t)v60;
        *(_QWORD *)(v37 + 14) = v59;
        *(_WORD *)(v37 + 22) = 2082;
        *(_QWORD *)(v37 + 24) = v40;
        *(_WORD *)(v37 + 32) = 2082;
        *(_QWORD *)(v37 + 34) = v48;
        *(_WORD *)(v37 + 42) = 2048;
        *(_QWORD *)(v37 + 44) = v52;
        *(_WORD *)(v37 + 52) = 2048;
        *(_QWORD *)(v37 + 54) = a3;
        qlog_internal(16, v53, 1752);
      }
    }
    v54 = a2[3];
    v55 = (_QWORD *)a2[4];
    if (v54)
    {
LABEL_67:
      *(_QWORD *)(v54 + 32) = v55;
      v55 = (_QWORD *)a2[4];
LABEL_70:
      *v55 = v54;
      free(a2);
      return;
    }
LABEL_69:
    a1[103] = v55;
    goto LABEL_70;
  }
  if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v56 = _os_log_pack_size();
    v57 = (char *)&v59 - ((MEMORY[0x24BDAC7A8](v56, v56) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v58 = _os_log_pack_fill();
    *(_DWORD *)v58 = 136446210;
    *(_QWORD *)(v58 + 4) = "quic_stream_zombie_final_size";
    qlog_internal(17, (uint64_t)v57, 1707);
  }
}

uint64_t __quic_conn_initialize_inner_block_invoke(uint64_t a1, int a2, int a3, void *__src, unint64_t a5)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a5 < 0x15)
  {
    quic_cid_read(__src, a5, (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112) + 38));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
    if (!*(_WORD *)(v9 + 39)
      && !*(_BYTE *)(v9 + 41)
      && !*(_BYTE *)(v9 + 42)
      && !*(_BYTE *)(v9 + 43)
      && !*(_BYTE *)(v9 + 44)
      && !*(_BYTE *)(v9 + 45)
      && !*(_BYTE *)(v9 + 46)
      && !*(_BYTE *)(v9 + 47)
      && !*(_BYTE *)(v9 + 48)
      && !*(_BYTE *)(v9 + 49)
      && !*(_BYTE *)(v9 + 50)
      && !*(_BYTE *)(v9 + 51)
      && !*(_BYTE *)(v9 + 52)
      && !*(_BYTE *)(v9 + 53)
      && !*(_BYTE *)(v9 + 54)
      && !*(_BYTE *)(v9 + 55)
      && !*(_BYTE *)(v9 + 56)
      && !*(_BYTE *)(v9 + 57)
      && !*(_BYTE *)(v9 + 58))
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if (v10)
      {
        os_release(v10);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v5 = _os_log_pack_size();
    v6 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_conn_initialize_inner_block_invoke";
    qlog_internal(17, (uint64_t)v6, 391);
  }
  return 1;
}

const char *__quic_conn_initialize_inner_block_invoke_185(uint64_t a1)
{
  const char *result;

  result = getenv("QUIC_USE_L4S");
  if (result)
  {
    result = (const char *)strcmp(result, "1");
    if (!(_DWORD)result)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1380) |= 0x2000000uLL;
  }
  return result;
}

uint64_t __quic_conn_set_mss_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a1[5] != a2)
  {
    v4 = (void *)nw_protocol_instance_copy_interface_for_path();
    v5 = a1[5];
    if (v4 == (void *)a1[7])
    {
      *(_WORD *)(a2 + 426) = *(_WORD *)(v5 + 426);
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v6 = _os_log_pack_size();
        v7 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v8 = _os_log_pack_fill();
        v9 = a1[5];
        v10 = *(unsigned __int16 *)(v9 + 426);
        *(_DWORD *)v8 = 136446722;
        *(_QWORD *)(v8 + 4) = "quic_conn_set_mss_block_invoke";
        *(_WORD *)(v8 + 12) = 2048;
        *(_QWORD *)(v8 + 14) = v9;
        *(_WORD *)(v8 + 22) = 1024;
        *(_DWORD *)(v8 + 24) = v10;
        qlog_internal(2, (uint64_t)v7, 1233);
        v5 = a1[5];
      }
    }
    v11 = *(unsigned __int16 *)(v5 + 426);
    v12 = *(_QWORD *)(a1[4] + 8);
    if (v11 >= *(unsigned __int16 *)(v12 + 24))
      LOWORD(v11) = *(_WORD *)(v12 + 24);
    *(_WORD *)(v12 + 24) = v11;
    if (v4)
      nw_release(v4);
  }
  return 1;
}

uint64_t __quic_conn_set_mss_block_invoke_83(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(a3 + 353) & 0x10) != 0)
  {
    quic_stream_compute_datagram_usable_frame_size(a1[5], a1[6], a3);
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_10()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_16()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_22()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_28()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_33()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_37()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_41()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672);
    *(_DWORD *)v4 = 136446466;
    *(_QWORD *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke_5";
    *(_WORD *)(v4 + 12) = 2048;
    *(_QWORD *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1046);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_47(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 752);
    *(_DWORD *)v4 = 136446466;
    *(_QWORD *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v4 + 12) = 2048;
    *(_QWORD *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1052);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 752);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
    *(_DWORD *)v4 = 136446466;
    *(_QWORD *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v4 + 12) = 2048;
    *(_QWORD *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1058);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_51(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 736);
    *(_DWORD *)v4 = 136446466;
    *(_QWORD *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v4 + 12) = 2048;
    *(_QWORD *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1064);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 736);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_53(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
  if (!v1)
    return 0;
  v2 = 88;
  if ((*(_BYTE *)(v1 + 152) & 1) == 0)
    v2 = 80;
  return *(_QWORD *)(v1 + v2);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_2_55(uint64_t a1)
{
  return (unsigned __int16)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 616) / 0xF4240uLL);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_58()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_63()
{
  return nw_protocol_instance_async_if_needed();
}

void __quic_conn_set_metadata_handlers_block_invoke_3_68()
{
  NSObject *v0;
  dispatch_time_t v1;

  v0 = dispatch_semaphore_create(0);
  nw_protocol_instance_async_if_needed();
  v1 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v0, v1);
  if (v0)
    dispatch_release(v0);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_5_73()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_6()
{
  return nw_protocol_instance_set_link_flow_controlled();
}

intptr_t __quic_conn_set_metadata_handlers_block_invoke_4_69(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 477) == 9)
  {
    quic_conn_select_next_path(*(_QWORD **)(a1 + 32), (uint64_t)&__block_literal_global_194);
    quic_protector_get_tag_size(*(_QWORD *)(v2 + 568), *(unsigned __int8 *)(v2 + 600));
    nw_protocol_request_outbound_data();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __quic_conn_inject_packet_block_invoke_2()
{
  nw_protocol_data_access_buffer();
  return nw_protocol_instance_add_outbound();
}

BOOL __quic_conn_inject_packet_block_invoke_3(_BOOL8 result, char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t pn;
  unsigned int v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned int v16;
  size_t v17;
  uint64_t v18;
  char *v19;
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
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 32) == a3)
  {
    v4 = result;
    v24 = 0u;
    v25 = 0u;
    v34 = 0;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    BYTE11(v24) = 3;
    v5 = *(_QWORD *)(result + 40);
    BYTE10(v24) = *(_BYTE *)(v5 + 600);
    v6 = quic_migration_multipath_ready(*(_QWORD *)(v5 + 1120));
    v7 = 0;
    if (v6)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 328);
      *((_QWORD *)&v33 + 1) = v7;
    }
    pn = quic_protector_get_pn(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 568), 3u, v7);
    v9 = pn;
    *((_QWORD *)&v26 + 1) = pn;
    LODWORD(v34) = 0;
    v10 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 40) + 600);
    BYTE13(v24) = 4;
    if (v10 == 4)
      v11 = 67;
    else
      v11 = 71;
    v19 = a2;
    v12 = *(unsigned __int8 *)(v4 + 72);
    BYTE12(v24) = *(_BYTE *)(v4 + 72);
    *a2 = v11;
    v13 = *(_QWORD *)(v4 + 48);
    v16 = *(unsigned __int8 *)(v13 + 17);
    v14 = (unsigned __int8 *)(v13 + 17);
    v15 = v16;
    if (v16)
      quic_cid_write(v14, a2 + 1, 0x10uLL);
    *(_DWORD *)&a2[v15 + 1] = bswap32(v9);
    v18 = *(_QWORD *)(v4 + 48);
    v17 = *(_QWORD *)(v4 + 56);
    LOWORD(v25) = v17;
    *(_QWORD *)&v20 = &a2[v12];
    *((_QWORD *)&v20 + 1) = &a2[v12 + (unsigned __int16)v17];
    HIBYTE(v24) = *(_BYTE *)(v4 + 73);
    BYTE14(v24) = 16;
    *(_QWORD *)&v21 = &a2[v15 + 1];
    *((_QWORD *)&v21 + 1) = &a2[v15 + 5];
    *((_QWORD *)&v28 + 1) = v18;
    memcpy(&a2[v12], *(const void **)(v4 + 64), v17);
    return quic_protector_seal(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 568), (uint64_t)&v19);
  }
  return result;
}

uint64_t __quic_conn_inject_packet_block_invoke()
{
  return 1;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_64(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = nw_protocol_instance_copy_association();
  if (v2)
  {
    v3 = (void *)v2;
    nw_quic_access_application_result_on_queue();
    nw_release(v3);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0);
  }
}

void __quic_conn_set_metadata_handlers_block_invoke_4_59()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = nw_protocol_instance_copy_association();
  if (v0)
  {
    v1 = (void *)v0;
    nw_quic_report_application_result_on_queue();
    nw_release(v1);
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke_4";
    qlog_internal(17, (uint64_t)v3, 1084);
  }
}

void __quic_conn_keepalive_configure_block_invoke(uint64_t a1, unsigned __int8 **a2, int a3)
{
  quic_conn_keepalive_handler(*(_QWORD *)(a1 + 32), a2, a3);
}

void quic_conn_keepalive_handler(uint64_t a1, unsigned __int8 **a2, int a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t stats_region;
  void *v9;
  uint64_t stats;
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
  _DWORD *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unsigned __int8 *v43;
  _OWORD *v44;
  _OWORD *v45;
  int v46;
  unsigned int v47;
  __int128 v48;
  uint64_t v49;
  unsigned __int8 *v50;
  int v51;
  _OWORD *v52;
  _OWORD *v53;
  uint64_t v54;
  unsigned __int8 *v55;
  int v56;
  int v57;
  int v58;
  _QWORD *v59;
  unsigned __int8 **v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t frame_pool;
  _QWORD *v67;
  uint64_t path;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  unsigned __int8 *v87;
  _OWORD *v88;
  _OWORD *v89;
  int v90;
  unsigned int v91;
  __int128 v92;
  uint64_t v93;
  unsigned __int8 *v94;
  int v95;
  _OWORD *v96;
  _OWORD *v97;
  uint64_t v98;
  unsigned __int8 *v99;
  int v100;
  int v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  unsigned __int8 **v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v106 = _os_log_pack_size();
    v107 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v106, v106) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v108 = _os_log_pack_fill();
    *(_DWORD *)v108 = 136446210;
    *(_QWORD *)(v108 + 4) = "quic_conn_keepalive_handler";
    v109 = (uint64_t)v107;
    v110 = 4714;
LABEL_170:
    qlog_internal(17, v109, v110);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v111 = _os_log_pack_size();
    v112 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v111, v111) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v113 = _os_log_pack_fill();
    *(_DWORD *)v113 = 136446210;
    *(_QWORD *)(v113 + 4) = "quic_conn_keepalive_handler";
    v109 = (uint64_t)v112;
    v110 = 4715;
    goto LABEL_170;
  }
  v6 = mach_continuous_time();
  if (timebase_info_once != -1)
    dispatch_once(&timebase_info_once, &__block_literal_global_397);
  v7 = timebase_info_info * v6 / dword_253D0A9BC / 0x3E8;
  if (v7 < *(_QWORD *)(a1 + 632))
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v114 = _os_log_pack_size();
    v115 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v114, v114) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v116 = _os_log_pack_fill();
    *(_DWORD *)v116 = 136446210;
    *(_QWORD *)(v116 + 4) = "quic_conn_keepalive_handler";
    v109 = (uint64_t)v115;
    v110 = 4723;
    goto LABEL_170;
  }
  stats_region = nw_protocol_instance_get_stats_region();
  if (stats_region)
    v9 = (void *)stats_region;
  else
    v9 = &g_quic_stats;
  *(_QWORD *)(a1 + 1312) = v9;
  stats = nw_protocol_instance_get_stats();
  *(_QWORD *)(a1 + 1304) = stats;
  if (stats)
  {
    *(_QWORD *)(stats + 16) = *(_QWORD *)(a1 + 1144);
    v11 = *(_QWORD *)(a1 + 1304);
    if (v11)
    {
      *(_QWORD *)(v11 + 24) = *(_QWORD *)(a1 + 1152);
      v12 = *(_QWORD *)(a1 + 1304);
      if (v12)
      {
        *(_QWORD *)(v12 + 32) = *(_QWORD *)(a1 + 1160);
        v13 = *(_QWORD *)(a1 + 1304);
        if (v13)
        {
          *(_QWORD *)(v13 + 40) = *(_QWORD *)(a1 + 1168);
          v14 = *(_QWORD *)(a1 + 1304);
          if (v14)
          {
            *(_DWORD *)(v14 + 48) = *(_DWORD *)(a1 + 1176);
            v15 = *(_QWORD *)(a1 + 1304);
            if (v15)
            {
              *(_DWORD *)(v15 + 52) = *(_DWORD *)(a1 + 1180);
              v16 = *(_QWORD *)(a1 + 1304);
              if (v16)
              {
                *(_DWORD *)(v16 + 56) = *(_DWORD *)(a1 + 1188);
                v17 = *(_QWORD *)(a1 + 1304);
                if (v17)
                {
                  *(_DWORD *)(v17 + 60) = *(_DWORD *)(a1 + 1192);
                  v18 = *(_QWORD *)(a1 + 1304);
                  if (v18)
                  {
                    *(_DWORD *)(v18 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    v19 = *(_QWORD *)(a1 + 1304);
                    if (v19)
                      *(_DWORD *)(v19 + 124) = *(unsigned __int8 *)(a1 + 477);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v20 = *(_QWORD *)(a1 + 1112);
  v121 = a2;
  if (v20 && quic_rtt_has_initial_measurement(*(_QWORD *)(v20 + 272)))
  {
    v21 = *(_QWORD *)(a1 + 1304);
    if (!v21)
      goto LABEL_28;
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 68) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    v21 = *(_QWORD *)(a1 + 1304);
    if (!v21)
      goto LABEL_28;
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 72) = (unint64_t)((4
                                                                   * (quic_rtt_get_smoothed_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    v21 = *(_QWORD *)(a1 + 1304);
    if (!v21)
      goto LABEL_28;
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 76) = (unint64_t)((2
                                                                   * (quic_rtt_get_rtt_variance(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
  }
  v21 = *(_QWORD *)(a1 + 1304);
  if (v21)
  {
    *(_OWORD *)(v21 + 128) = *(_OWORD *)(a1 + 1288);
    v21 = *(_QWORD *)(a1 + 1304);
  }
LABEL_28:
  v22 = (_DWORD *)(a1 + 1380);
  if ((*(_BYTE *)(a1 + 1381) & 2) != 0)
  {
    if (!v21)
      goto LABEL_37;
    v23 = *(_DWORD *)(v21 + 116) | 1;
  }
  else
  {
    if (!v21)
      goto LABEL_37;
    v23 = *(_DWORD *)(v21 + 116) & 0xFFFFFFFE;
  }
  *(_DWORD *)(v21 + 116) = v23;
  v24 = *(_QWORD *)(a1 + 1304);
  if (v24)
  {
    *(_BYTE *)(v24 + 144) |= (*v22 & 0x200000) != 0;
    v25 = *(_QWORD *)(a1 + 1304);
    if (v25)
    {
      *(_BYTE *)(v25 + 144) |= (*v22 >> 22) & 2;
      v26 = *(_QWORD *)(a1 + 1304);
      if (v26)
        *(_BYTE *)(v26 + 144) |= (*v22 >> 19) & 8;
    }
  }
LABEL_37:
  v27 = *(_QWORD *)(a1 + 1312);
  if (v27)
    ++*(_QWORD *)(v27 + 608);
  v28 = v7 - *(_QWORD *)(a1 + 632);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v29 = _os_log_pack_size();
    v30 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v31 = _os_log_pack_fill();
    v32 = *(_QWORD *)(a1 + 632);
    v33 = *(_QWORD *)(a1 + 616);
    *(_DWORD *)v31 = 136447234;
    *(_QWORD *)(v31 + 4) = "quic_conn_keepalive_handler";
    *(_WORD *)(v31 + 12) = 2048;
    *(_QWORD *)(v31 + 14) = v7;
    *(_WORD *)(v31 + 22) = 2048;
    *(_QWORD *)(v31 + 24) = v32;
    *(_WORD *)(v31 + 32) = 2048;
    *(_QWORD *)(v31 + 34) = v28;
    *(_WORD *)(v31 + 42) = 2048;
    *(_QWORD *)(v31 + 44) = v33;
    qlog_internal(2, (uint64_t)v30, 4732);
  }
  v34 = *(_QWORD *)(a1 + 616);
  if (v28 + 1000 < v34)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v35 = _os_log_pack_size();
      v36 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v37 = _os_log_pack_fill();
      v38 = *(_QWORD *)(a1 + 616) - v28;
      *(_DWORD *)v37 = 136446466;
      *(_QWORD *)(v37 + 4) = "quic_conn_keepalive_handler";
      *(_WORD *)(v37 + 12) = 2048;
      *(_QWORD *)(v37 + 14) = v38;
      qlog_internal(2, (uint64_t)v36, 4775);
      v34 = *(_QWORD *)(a1 + 616);
    }
    quic_timer_reschedule(v121, a3, v34 - v28);
    return;
  }
  if (*(_WORD *)(a1 + 590))
  {
    v39 = qlog_nwlog_enabled;
    if (*(unsigned __int16 *)(a1 + 592) >= *(unsigned __int16 *)(a1 + 590))
    {
      if (qlog_debug_enabled)
        v39 = 1;
      if (((v39 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)) && *(_QWORD *)(a1 + 1112))
      {
        v84 = _os_log_pack_size();
        v121 = (unsigned __int8 **)&v117;
        v85 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v84, v84) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v86 = _os_log_pack_fill();
        v120 = a1 + 976;
        v87 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2)
          v88 = &quic_cid_describe_cid_buf2;
        else
          v88 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v89 = v88;
        else
          v89 = &quic_cid_describe_cid_buf1;
        v90 = ++quic_cid_describe_state;
        v91 = v87[38];
        v92 = 0uLL;
        *(_OWORD *)((char *)v89 + 25) = 0u;
        if (v91 >= 0x14)
          v93 = 20;
        else
          v93 = v91;
        *v89 = 0uLL;
        v89[1] = 0uLL;
        if ((_DWORD)v93)
        {
          v94 = v87 + 39;
          do
          {
            v95 = *v94++;
            snprintf((char *)v89, 0x29uLL, "%s%02x", (const char *)v89, v95);
            --v93;
          }
          while (v93);
          v87 = *(unsigned __int8 **)(a1 + 1112);
          v90 = quic_cid_describe_state;
          v92 = 0uLL;
        }
        if (v90 % 3 == 2)
          v96 = &quic_cid_describe_cid_buf2;
        else
          v96 = &quic_cid_describe_cid_buf3;
        if (v90 % 3)
          v97 = v96;
        else
          v97 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v90 + 1;
        if (v87[17] >= 0x14u)
          v98 = 20;
        else
          v98 = v87[17];
        *v97 = v92;
        v97[1] = v92;
        *(_OWORD *)((char *)v97 + 25) = v92;
        if ((_DWORD)v98)
        {
          v99 = v87 + 18;
          do
          {
            v100 = *v99++;
            snprintf((char *)v97, 0x29uLL, "%s%02x", (const char *)v97, v100);
            --v98;
          }
          while (v98);
        }
        v101 = *(unsigned __int16 *)(a1 + 590);
        *(_DWORD *)v86 = 136447234;
        *(_QWORD *)(v86 + 4) = "quic_conn_keepalive_handler";
        *(_WORD *)(v86 + 12) = 2082;
        *(_QWORD *)(v86 + 14) = v120;
        *(_WORD *)(v86 + 22) = 2082;
        *(_QWORD *)(v86 + 24) = v89;
        *(_WORD *)(v86 + 32) = 2082;
        *(_QWORD *)(v86 + 34) = v97;
        *(_WORD *)(v86 + 42) = 1024;
        *(_DWORD *)(v86 + 44) = v101;
        qlog_internal(16, (uint64_t)v85, 4742);
      }
      *(_QWORD *)(a1 + 1072) = 0;
      *(_QWORD *)(a1 + 1080) = "keepalive limit reached";
      v102 = *(void **)(a1 + 1104);
      if (v102)
      {
        nw_release(v102);
        *(_QWORD *)(a1 + 1104) = 0;
      }
      *(_QWORD *)(a1 + 1104) = nw_error_create_posix_error();
      quic_conn_close(a1);
      return;
    }
    if (qlog_debug_enabled)
      goto LABEL_56;
LABEL_54:
    if ((v39 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      goto LABEL_83;
    goto LABEL_56;
  }
  v39 = qlog_nwlog_enabled;
  if (!qlog_debug_enabled)
    goto LABEL_54;
LABEL_56:
  if (*(_QWORD *)(a1 + 1112))
  {
    LODWORD(v120) = a3;
    v40 = _os_log_pack_size();
    v119 = &v117;
    v41 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v40, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v42 = _os_log_pack_fill();
    v118 = a1 + 976;
    v43 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v44 = &quic_cid_describe_cid_buf2;
    else
      v44 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v45 = v44;
    else
      v45 = &quic_cid_describe_cid_buf1;
    v46 = ++quic_cid_describe_state;
    v47 = v43[38];
    v48 = 0uLL;
    *(_OWORD *)((char *)v45 + 25) = 0u;
    if (v47 >= 0x14)
      v49 = 20;
    else
      v49 = v47;
    *v45 = 0uLL;
    v45[1] = 0uLL;
    if ((_DWORD)v49)
    {
      v50 = v43 + 39;
      do
      {
        v51 = *v50++;
        snprintf((char *)v45, 0x29uLL, "%s%02x", (const char *)v45, v51);
        --v49;
      }
      while (v49);
      v43 = *(unsigned __int8 **)(a1 + 1112);
      v46 = quic_cid_describe_state;
      v48 = 0uLL;
    }
    if (v46 % 3 == 2)
      v52 = &quic_cid_describe_cid_buf2;
    else
      v52 = &quic_cid_describe_cid_buf3;
    if (v46 % 3)
      v53 = v52;
    else
      v53 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v46 + 1;
    if (v43[17] >= 0x14u)
      v54 = 20;
    else
      v54 = v43[17];
    *v53 = v48;
    v53[1] = v48;
    *(_OWORD *)((char *)v53 + 25) = v48;
    if ((_DWORD)v54)
    {
      v55 = v43 + 18;
      do
      {
        v56 = *v55++;
        snprintf((char *)v53, 0x29uLL, "%s%02x", (const char *)v53, v56);
        --v54;
      }
      while (v54);
    }
    v57 = *(unsigned __int16 *)(a1 + 592);
    *(_DWORD *)v42 = 136447234;
    *(_QWORD *)(v42 + 4) = "quic_conn_keepalive_handler";
    *(_WORD *)(v42 + 12) = 2082;
    *(_QWORD *)(v42 + 14) = v118;
    *(_WORD *)(v42 + 22) = 2082;
    *(_QWORD *)(v42 + 24) = v45;
    *(_WORD *)(v42 + 32) = 2082;
    *(_QWORD *)(v42 + 34) = v53;
    *(_WORD *)(v42 + 42) = 1024;
    *(_DWORD *)(v42 + 44) = v57;
    qlog_internal(1, (uint64_t)v41, 4752);
    a3 = v120;
  }
LABEL_83:
  v58 = (unsigned __int16)(*(_WORD *)(a1 + 592))++ + 1;
  v59 = (_QWORD *)(a1 + 1380);
  v60 = v121;
  if ((v58 & 0x10000) != 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v61 = _os_log_pack_size();
      v62 = (char *)&v117 - ((MEMORY[0x24BDAC7A8](v61, v61) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v63 = _os_log_pack_fill();
      v64 = *(unsigned __int16 *)(a1 + 592);
      *(_DWORD *)v63 = 136447234;
      *(_QWORD *)(v63 + 4) = "quic_conn_keepalive_handler";
      *(_WORD *)(v63 + 12) = 2082;
      *(_QWORD *)(v63 + 14) = "conn->unacked_keepalive_count";
      *(_WORD *)(v63 + 22) = 2048;
      *(_QWORD *)(v63 + 24) = v64 - 1;
      *(_WORD *)(v63 + 32) = 2048;
      *(_QWORD *)(v63 + 34) = 1;
      *(_WORD *)(v63 + 42) = 2048;
      *(_QWORD *)(v63 + 44) = v64;
      qlog_internal(17, (uint64_t)v62, 4754);
    }
    *(_WORD *)(a1 + 592) = -1;
  }
  v65 = *(_QWORD *)(a1 + 560);
  frame_pool = quic_packet_builder_get_frame_pool(v65);
  v67 = quic_frame_create(frame_pool, 1);
  *((_WORD *)v67 + 4) = 1;
  *((_BYTE *)v67 + 120) = v67[15] & 0xF9 | 4;
  quic_packet_builder_append_for_pn_space(v65, (uint64_t)v67, 3u);
  quic_timer_reschedule(v60, a3, *(_QWORD *)(a1 + 616));
  path = quic_conn_select_next_path((_QWORD *)a1, (uint64_t)&__block_literal_global_96);
  quic_conn_send_internal(a1, path, 1u);
  ++*(_DWORD *)(a1 + 1216);
  quic_migration_keepalive_loss_event(*(_QWORD *)(a1 + 1120), a1, *(_QWORD *)(a1 + 1112), *(unsigned __int16 *)(a1 + 592));
  if ((*v59 & 0x200000) == 0 || *(unsigned __int16 *)(a1 + 592) < 5u)
    return;
  *v59 |= 0x800000uLL;
  v69 = nw_protocol_instance_get_stats_region();
  if (v69)
    v70 = (void *)v69;
  else
    v70 = &g_quic_stats;
  *(_QWORD *)(a1 + 1312) = v70;
  v71 = nw_protocol_instance_get_stats();
  *(_QWORD *)(a1 + 1304) = v71;
  if (v71)
  {
    *(_QWORD *)(v71 + 16) = *(_QWORD *)(a1 + 1144);
    v72 = *(_QWORD *)(a1 + 1304);
    if (v72)
    {
      *(_QWORD *)(v72 + 24) = *(_QWORD *)(a1 + 1152);
      v73 = *(_QWORD *)(a1 + 1304);
      if (v73)
      {
        *(_QWORD *)(v73 + 32) = *(_QWORD *)(a1 + 1160);
        v74 = *(_QWORD *)(a1 + 1304);
        if (v74)
        {
          *(_QWORD *)(v74 + 40) = *(_QWORD *)(a1 + 1168);
          v75 = *(_QWORD *)(a1 + 1304);
          if (v75)
          {
            *(_DWORD *)(v75 + 48) = *(_DWORD *)(a1 + 1176);
            v76 = *(_QWORD *)(a1 + 1304);
            if (v76)
            {
              *(_DWORD *)(v76 + 52) = *(_DWORD *)(a1 + 1180);
              v77 = *(_QWORD *)(a1 + 1304);
              if (v77)
              {
                *(_DWORD *)(v77 + 56) = *(_DWORD *)(a1 + 1188);
                v78 = *(_QWORD *)(a1 + 1304);
                if (v78)
                {
                  *(_DWORD *)(v78 + 60) = *(_DWORD *)(a1 + 1192);
                  v79 = *(_QWORD *)(a1 + 1304);
                  if (v79)
                  {
                    *(_DWORD *)(v79 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    v80 = *(_QWORD *)(a1 + 1304);
                    if (v80)
                      *(_DWORD *)(v80 + 124) = *(unsigned __int8 *)(a1 + 477);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v81 = *(_QWORD *)(a1 + 1112);
  if (!v81 || !quic_rtt_has_initial_measurement(*(_QWORD *)(v81 + 272)))
    goto LABEL_111;
  v82 = *(_QWORD *)(a1 + 1304);
  if (v82)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 68) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    v82 = *(_QWORD *)(a1 + 1304);
    if (v82)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 72) = (unint64_t)((4
                                                                     * (quic_rtt_get_smoothed_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                     * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      v82 = *(_QWORD *)(a1 + 1304);
      if (v82)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 76) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
LABEL_111:
        v82 = *(_QWORD *)(a1 + 1304);
        if (v82)
        {
          *(_OWORD *)(v82 + 128) = *(_OWORD *)(a1 + 1288);
          v82 = *(_QWORD *)(a1 + 1304);
        }
      }
    }
  }
  if ((*(_BYTE *)(a1 + 1381) & 2) != 0)
  {
    if (!v82)
      return;
    v83 = *(_DWORD *)(v82 + 116) | 1;
  }
  else
  {
    if (!v82)
      return;
    v83 = *(_DWORD *)(v82 + 116) & 0xFFFFFFFE;
  }
  *(_DWORD *)(v82 + 116) = v83;
  v103 = *(_QWORD *)(a1 + 1304);
  if (v103)
  {
    *(_BYTE *)(v103 + 144) |= (*(_DWORD *)v59 & 0x200000) != 0;
    v104 = *(_QWORD *)(a1 + 1304);
    if (v104)
    {
      *(_BYTE *)(v104 + 144) |= (*(_DWORD *)v59 >> 22) & 2;
      v105 = *(_QWORD *)(a1 + 1304);
      if (v105)
        *(_BYTE *)(v105 + 144) |= (*(_DWORD *)v59 >> 19) & 8;
    }
  }
}

uint64_t __quic_conn_send_frames_block_invoke()
{
  return 1;
}

uint64_t *quic_conn_refresh_path(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *result;
  char v6;
  int v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  _OWORD *v16;
  _OWORD *v17;
  int v18;
  unsigned int v19;
  __int128 v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v32 = _os_log_pack_size();
      v33 = (char *)v35 - ((MEMORY[0x24BDAC7A8](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v34 = _os_log_pack_fill();
      *(_DWORD *)v34 = 136446210;
      *(_QWORD *)(v34 + 4) = "quic_conn_refresh_path";
      v29 = 17;
      v30 = (uint64_t)v33;
      v31 = 1923;
LABEL_53:
      qlog_internal(v29, v30, v31);
      return 0;
    }
    return 0;
  }
  v4 = *(uint64_t **)(a1 + 1112);
  if (v4 && *v4 == a2)
    return v4;
  result = *(uint64_t **)(a1 + 1360);
  if (*MEMORY[0x24BDE0898] == a2)
  {
    if (result)
    {
      while ((*(_WORD *)((_BYTE *)result + 431) & 1) == 0)
      {
        result = (uint64_t *)result[39];
        if (!result)
          goto LABEL_12;
      }
      return result;
    }
LABEL_12:
    v6 = qlog_nwlog_enabled;
    if (v4)
    {
      if (qlog_datapath_enabled)
        v7 = 1;
      else
        v7 = qlog_nwlog_enabled;
      if (v7 == 1)
      {
        if (qlog_debug_enabled)
          v6 = 1;
        if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          v8 = _os_log_pack_size();
          v9 = (char *)v35 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v10 = _os_log_pack_fill();
          v11 = *v4;
          *(_DWORD *)v10 = 136446722;
          *(_QWORD *)(v10 + 4) = "quic_conn_refresh_path";
          *(_WORD *)(v10 + 12) = 2050;
          *(_QWORD *)(v10 + 14) = a2;
          *(_WORD *)(v10 + 22) = 2050;
          *(_QWORD *)(v10 + 24) = v11;
          qlog_internal(2, (uint64_t)v9, 1936);
        }
      }
      return v4;
    }
    if (qlog_debug_enabled)
      v6 = 1;
    if (((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)) && *(_QWORD *)(a1 + 1112))
    {
      v12 = _os_log_pack_size();
      v13 = (char *)v35 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v14 = _os_log_pack_fill();
      v35[0] = a1 + 976;
      v15 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v16 = &quic_cid_describe_cid_buf2;
      else
        v16 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v17 = v16;
      else
        v17 = &quic_cid_describe_cid_buf1;
      v18 = ++quic_cid_describe_state;
      v19 = v15[38];
      v20 = 0uLL;
      *(_OWORD *)((char *)v17 + 25) = 0u;
      if (v19 >= 0x14)
        v21 = 20;
      else
        v21 = v19;
      *v17 = 0uLL;
      v17[1] = 0uLL;
      if ((_DWORD)v21)
      {
        v22 = v15 + 39;
        do
        {
          v23 = *v22++;
          snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v23);
          --v21;
        }
        while (v21);
        v15 = *(unsigned __int8 **)(a1 + 1112);
        v18 = quic_cid_describe_state;
        v20 = 0uLL;
      }
      if (v18 % 3 == 2)
        v24 = &quic_cid_describe_cid_buf2;
      else
        v24 = &quic_cid_describe_cid_buf3;
      if (v18 % 3)
        v25 = v24;
      else
        v25 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v18 + 1;
      if (v15[17] >= 0x14u)
        v26 = 20;
      else
        v26 = v15[17];
      *v25 = v20;
      v25[1] = v20;
      *(_OWORD *)((char *)v25 + 25) = v20;
      if ((_DWORD)v26)
      {
        v27 = v15 + 18;
        do
        {
          v28 = *v27++;
          snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
          --v26;
        }
        while (v26);
      }
      *(_DWORD *)v14 = 136447234;
      *(_QWORD *)(v14 + 4) = "quic_conn_refresh_path";
      *(_WORD *)(v14 + 12) = 2082;
      *(_QWORD *)(v14 + 14) = v35[0];
      *(_WORD *)(v14 + 22) = 2082;
      *(_QWORD *)(v14 + 24) = v17;
      *(_WORD *)(v14 + 32) = 2082;
      *(_QWORD *)(v14 + 34) = v25;
      *(_WORD *)(v14 + 42) = 2050;
      *(_QWORD *)(v14 + 44) = a2;
      v29 = 16;
      v30 = (uint64_t)v13;
      v31 = 1942;
      goto LABEL_53;
    }
    return 0;
  }
  if (!result)
    goto LABEL_12;
  while (*result != a2)
  {
    result = (uint64_t *)result[39];
    if (!result)
      goto LABEL_12;
  }
  return result;
}

void quic_conn_handle_sent_packet(uint64_t a1, uint64_t a2, _QWORD *a3, unsigned int a4, char a5, unint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v22 = _os_log_pack_size();
    v23 = (char *)v36 - ((MEMORY[0x24BDAC7A8](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136446210;
    *(_QWORD *)(v24 + 4) = "quic_conn_handle_sent_packet";
    v25 = (uint64_t)v23;
    v26 = 1952;
LABEL_45:
    qlog_internal(17, v25, v26);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v27 = _os_log_pack_size();
    v28 = (char *)v36 - ((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136446210;
    *(_QWORD *)(v29 + 4) = "quic_conn_handle_sent_packet";
    v25 = (uint64_t)v28;
    v26 = 1953;
    goto LABEL_45;
  }
  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v30 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v32 = _os_log_pack_fill();
    *(_DWORD *)v32 = 136446210;
    *(_QWORD *)(v32 + 4) = "quic_conn_handle_sent_packet";
    v25 = (uint64_t)v31;
    v26 = 1954;
    goto LABEL_45;
  }
  if (!a6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v33 = _os_log_pack_size();
    v34 = (char *)v36 - ((MEMORY[0x24BDAC7A8](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v35 = _os_log_pack_fill();
    *(_DWORD *)v35 = 136446210;
    *(_QWORD *)(v35 + 4) = "quic_conn_handle_sent_packet";
    v25 = (uint64_t)v34;
    v26 = 1955;
    goto LABEL_45;
  }
  v11 = a1 + 1380;
  v12 = *(_QWORD *)(a1 + 1380);
  if ((v12 & 0x200000000) != 0
    && *(unsigned __int8 *)(a1 + 477) >= 9u
    && (v12 & 0x200) == 0
    && (v16 = *(_QWORD *)(a2 + 416)) != 0
    && *(_QWORD *)(a2 + 392)
    && quic_ecn_get_state(v16) == 4)
  {
    quic_pacer_get_packet_tx_time(a2, *(_QWORD *)(a2 + 392), a4, v36, a6);
    v18 = *a6;
    v19 = *(_QWORD *)(a1 + 1128);
    if (v19)
      quic_shorthand_process_packet(v19, (uint64_t)a3, 1);
    v20 = *(void **)(a1 + 1136);
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v21, "packetSent:", a3);

    }
    if ((a5 & 1) != 0 || (*(_BYTE *)(v11 + 3) & 2) != 0)
      quic_recovery_sent_packet(*(_QWORD *)(a1 + 952), (uint64_t)a3, v18 / 0x3E8);
    else
      _quic_packet_destroy(a3);
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 1128);
    if (v13)
      quic_shorthand_process_packet(v13, (uint64_t)a3, 1);
    v14 = *(void **)(a1 + 1136);
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v15, "packetSent:", a3);

    }
    if ((a5 & 1) != 0 || (*(_BYTE *)(v11 + 3) & 2) != 0)
      quic_recovery_sent_packet(*(_QWORD *)(a1 + 952), (uint64_t)a3, 0);
    else
      _quic_packet_destroy(a3);
  }
}

void __quic_conn_send_frames_for_key_state_block_invoke_207(uint64_t a1, void *__dst, size_t a3)
{
  size_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _OWORD *v11;
  _OWORD *v12;
  int v13;
  unsigned int v14;
  __int128 v15;
  uint64_t v16;
  unsigned __int8 *v17;
  int v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 *v41;
  _OWORD *v42;
  _OWORD *v43;
  int v44;
  unsigned int v45;
  __int128 v46;
  uint64_t v47;
  unsigned __int8 *v48;
  int v49;
  _OWORD *v50;
  _OWORD *v51;
  uint64_t v52;
  unsigned __int8 *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = *(unsigned __int16 *)(a1 + 120);
  if (v4 > a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(_QWORD *)(*(_QWORD *)(a1 + 88) + 1112))
    {
      v6 = _os_log_pack_size();
      v7 = (char *)&v55 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      v9 = *(_QWORD *)(a1 + 88);
      v57 = (uint64_t *)(v9 + 976);
      v10 = *(unsigned __int8 **)(v9 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v11 = &quic_cid_describe_cid_buf2;
      else
        v11 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v12 = v11;
      else
        v12 = &quic_cid_describe_cid_buf1;
      v13 = ++quic_cid_describe_state;
      v14 = v10[38];
      v15 = 0uLL;
      *(_OWORD *)((char *)v12 + 25) = 0u;
      if (v14 >= 0x14)
        v16 = 20;
      else
        v16 = v14;
      *v12 = 0uLL;
      v12[1] = 0uLL;
      if ((_DWORD)v16)
      {
        v17 = v10 + 39;
        do
        {
          v18 = *v17++;
          snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v18);
          --v16;
        }
        while (v16);
        v10 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 88) + 1112);
        v13 = quic_cid_describe_state;
        v15 = 0uLL;
      }
      if (v13 % 3 == 2)
        v19 = &quic_cid_describe_cid_buf2;
      else
        v19 = &quic_cid_describe_cid_buf3;
      if (v13 % 3)
        v20 = v19;
      else
        v20 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v13 + 1;
      if (v10[17] >= 0x14u)
        v21 = 20;
      else
        v21 = v10[17];
      *v20 = v15;
      v20[1] = v15;
      *(_OWORD *)((char *)v20 + 25) = v15;
      if ((_DWORD)v21)
      {
        v22 = v10 + 18;
        do
        {
          v23 = *v22++;
          snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
          --v21;
        }
        while (v21);
      }
      v24 = *(unsigned __int16 *)(a1 + 120);
      *(_DWORD *)v8 = 136447490;
      *(_QWORD *)(v8 + 4) = "quic_conn_send_frames_for_key_state_block_invoke";
      *(_WORD *)(v8 + 12) = 2082;
      *(_QWORD *)(v8 + 14) = v57;
      *(_WORD *)(v8 + 22) = 2082;
      *(_QWORD *)(v8 + 24) = v12;
      *(_WORD *)(v8 + 32) = 2082;
      *(_QWORD *)(v8 + 34) = v20;
      *(_WORD *)(v8 + 42) = 2048;
      *(_QWORD *)(v8 + 44) = a3;
      *(_WORD *)(v8 + 52) = 1024;
      *(_DWORD *)(v8 + 54) = v24;
      qlog_internal(16, (uint64_t)v7, 2237);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = quic_conn_refresh_path(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(_QWORD *)(v25 + 24);
    v26 = (uint64_t *)(v25 + 24);
    v27 = v28;
    if (v28)
    {
      *(_QWORD *)(v27 + 144) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      quic_conn_handle_sent_packet(*(_QWORD *)(a1 + 88), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (unsigned __int16)a3, *(_BYTE *)(a1 + 122), (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    }
    else
    {
      quic_conn_handle_small_buffer(*(_QWORD **)(a1 + 88), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned __int16 *)(a1 + 120), v26, *(_BYTE *)(a1 + 122), *(unsigned __int8 *)(a1 + 123), *(uint64_t **)(a1 + 104), (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    }
    v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v33)
    {
      free(v33);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    return;
  }
  v30 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v30)
  {
    memcpy(__dst, v30, v4);
    v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v31)
    {
      free(v31);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    v32 = mach_continuous_time();
    if (timebase_info_once != -1)
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = timebase_info_info
                                                                * v32
                                                                / dword_253D0A9BC
                                                                / 0x3E8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = quic_conn_refresh_path(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    goto LABEL_44;
  }
  if (quic_conn_assemble_and_encrypt(*(_QWORD **)(a1 + 88), *(unsigned __int8 *)(a1 + 123), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(uint64_t **)(a1 + 104), (char *)__dst, v4))
  {
LABEL_44:
    quic_ecn_outgoing_ip_codepoint(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 968), *(_QWORD *)(a1 + 88), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    nw_protocol_data_set_ecn_flag();
    v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (*(_BYTE *)(v34 + 83) == 3)
      v35 = *(unsigned __int8 *)(v34 + 232) >> 7;
    else
      LOBYTE(v35) = 0;
    quic_conn_continue_sending(*(_QWORD *)(a1 + 88), *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v34, *(unsigned __int8 *)(a1 + 122), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(unsigned __int8 *)(a1 + 124), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(void **)(a1 + 112), v4, v35, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    return;
  }
  v36 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v36)
  {
    _quic_packet_destroy(v36);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && *(_QWORD *)(*(_QWORD *)(a1 + 88) + 1112))
  {
    v37 = _os_log_pack_size();
    v57 = &v55;
    v38 = (char *)&v55 - ((MEMORY[0x24BDAC7A8](v37, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v39 = _os_log_pack_fill();
    v40 = *(_QWORD *)(a1 + 88);
    v56 = v40 + 976;
    v41 = *(unsigned __int8 **)(v40 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v42 = &quic_cid_describe_cid_buf2;
    else
      v42 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v43 = v42;
    else
      v43 = &quic_cid_describe_cid_buf1;
    v44 = ++quic_cid_describe_state;
    v45 = v41[38];
    v46 = 0uLL;
    *(_OWORD *)((char *)v43 + 25) = 0u;
    if (v45 >= 0x14)
      v47 = 20;
    else
      v47 = v45;
    *v43 = 0uLL;
    v43[1] = 0uLL;
    if ((_DWORD)v47)
    {
      v48 = v41 + 39;
      do
      {
        v49 = *v48++;
        snprintf((char *)v43, 0x29uLL, "%s%02x", (const char *)v43, v49);
        --v47;
      }
      while (v47);
      v41 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 88) + 1112);
      v44 = quic_cid_describe_state;
      v46 = 0uLL;
    }
    if (v44 % 3 == 2)
      v50 = &quic_cid_describe_cid_buf2;
    else
      v50 = &quic_cid_describe_cid_buf3;
    if (v44 % 3)
      v51 = v50;
    else
      v51 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v44 + 1;
    if (v41[17] >= 0x14u)
      v52 = 20;
    else
      v52 = v41[17];
    *v51 = v46;
    v51[1] = v46;
    *(_OWORD *)((char *)v51 + 25) = v46;
    if ((_DWORD)v52)
    {
      v53 = v41 + 18;
      do
      {
        v54 = *v53++;
        snprintf((char *)v51, 0x29uLL, "%s%02x", (const char *)v51, v54);
        --v52;
      }
      while (v52);
    }
    *(_DWORD *)v39 = 136446978;
    *(_QWORD *)(v39 + 4) = "quic_conn_send_frames_for_key_state_block_invoke";
    *(_WORD *)(v39 + 12) = 2082;
    *(_QWORD *)(v39 + 14) = v56;
    *(_WORD *)(v39 + 22) = 2082;
    *(_QWORD *)(v39 + 24) = v43;
    *(_WORD *)(v39 + 32) = 2082;
    *(_QWORD *)(v39 + 34) = v51;
    qlog_internal(16, (uint64_t)v38, 2271);
  }
}

void quic_conn_handle_small_buffer(_QWORD *a1, unint64_t a2, size_t size, uint64_t *a4, char a5, uint64_t a6, uint64_t *a7, unint64_t *a8)
{
  uint64_t v8;
  unsigned int v13;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  _OWORD *v23;
  _OWORD *v24;
  int v25;
  unsigned int v26;
  __int128 v27;
  uint64_t v28;
  unsigned __int8 *v29;
  int v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  unsigned __int8 *v34;
  int v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v36 = _os_log_pack_size();
    v37 = (char *)&v53 - ((MEMORY[0x24BDAC7A8](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v38 = _os_log_pack_fill();
    *(_DWORD *)v38 = 136446210;
    *(_QWORD *)(v38 + 4) = "quic_conn_handle_small_buffer";
    v39 = (uint64_t)v37;
    v40 = 1975;
LABEL_64:
    qlog_internal(17, v39, v40);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v41 = _os_log_pack_size();
    v42 = (char *)&v53 - ((MEMORY[0x24BDAC7A8](v41, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v43 = _os_log_pack_fill();
    *(_DWORD *)v43 = 136446210;
    *(_QWORD *)(v43 + 4) = "quic_conn_handle_small_buffer";
    v39 = (uint64_t)v42;
    v40 = 1976;
    goto LABEL_64;
  }
  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v44 = _os_log_pack_size();
    v45 = (char *)&v53 - ((MEMORY[0x24BDAC7A8](v44, v44) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v46 = _os_log_pack_fill();
    *(_DWORD *)v46 = 136446210;
    *(_QWORD *)(v46 + 4) = "quic_conn_handle_small_buffer";
    v39 = (uint64_t)v45;
    v40 = 1977;
    goto LABEL_64;
  }
  if (!a7)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v47 = _os_log_pack_size();
    v48 = (char *)&v53 - ((MEMORY[0x24BDAC7A8](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v49 = _os_log_pack_fill();
    *(_DWORD *)v49 = 136446210;
    *(_QWORD *)(v49 + 4) = "quic_conn_handle_small_buffer";
    v39 = (uint64_t)v48;
    v40 = 1978;
    goto LABEL_64;
  }
  if (!a8)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v50 = _os_log_pack_size();
    v51 = (char *)&v53 - ((MEMORY[0x24BDAC7A8](v50, v50) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v52 = _os_log_pack_fill();
    *(_DWORD *)v52 = 136446210;
    *(_QWORD *)(v52 + 4) = "quic_conn_handle_small_buffer";
    v39 = (uint64_t)v51;
    v40 = 1979;
    goto LABEL_64;
  }
  v13 = size;
  if (!(_DWORD)size)
  {
    qlog_abort_internal("%s strict_calloc called with size 0", "strict_calloc");
LABEL_66:
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v8);
  }
  v8 = size;
  v17 = (char *)malloc_type_calloc(1uLL, size, 0xEAFB8F1AuLL);
  if (!v17)
    goto LABEL_66;
  v18 = v17;
  if (quic_conn_assemble_and_encrypt(a1, a6, a2, a4, a7, v17, v13))
  {
    quic_conn_handle_sent_packet((uint64_t)a1, a2, (_QWORD *)*a4, v13, a5, a8);
    free(v18);
  }
  else
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      v19 = _os_log_pack_size();
      v55 = &v53;
      v20 = (char *)&v53 - ((MEMORY[0x24BDAC7A8](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v21 = _os_log_pack_fill();
      v54 = a1 + 122;
      v22 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2)
        v23 = &quic_cid_describe_cid_buf2;
      else
        v23 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v24 = v23;
      else
        v24 = &quic_cid_describe_cid_buf1;
      v25 = ++quic_cid_describe_state;
      v26 = v22[38];
      v27 = 0uLL;
      *(_OWORD *)((char *)v24 + 25) = 0u;
      if (v26 >= 0x14)
        v28 = 20;
      else
        v28 = v26;
      *v24 = 0uLL;
      v24[1] = 0uLL;
      if ((_DWORD)v28)
      {
        v29 = v22 + 39;
        do
        {
          v30 = *v29++;
          snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v30);
          --v28;
        }
        while (v28);
        v22 = (unsigned __int8 *)a1[139];
        v25 = quic_cid_describe_state;
        v27 = 0uLL;
      }
      if (v25 % 3 == 2)
        v31 = &quic_cid_describe_cid_buf2;
      else
        v31 = &quic_cid_describe_cid_buf3;
      if (v25 % 3)
        v32 = v31;
      else
        v32 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v25 + 1;
      if (v22[17] >= 0x14u)
        v33 = 20;
      else
        v33 = v22[17];
      *v32 = v27;
      v32[1] = v27;
      *(_OWORD *)((char *)v32 + 25) = v27;
      if ((_DWORD)v33)
      {
        v34 = v22 + 18;
        do
        {
          v35 = *v34++;
          snprintf((char *)v32, 0x29uLL, "%s%02x", (const char *)v32, v35);
          --v33;
        }
        while (v33);
      }
      *(_DWORD *)v21 = 136446978;
      *(_QWORD *)(v21 + 4) = "quic_conn_handle_small_buffer";
      *(_WORD *)(v21 + 12) = 2082;
      *(_QWORD *)(v21 + 14) = v54;
      *(_WORD *)(v21 + 22) = 2082;
      *(_QWORD *)(v21 + 24) = v24;
      *(_WORD *)(v21 + 32) = 2082;
      *(_QWORD *)(v21 + 34) = v32;
      qlog_internal(16, (uint64_t)v20, 1990);
    }
    if (*a4)
    {
      _quic_packet_destroy((_QWORD *)*a4);
      *a4 = 0;
    }
    free(v18);
  }
}

uint64_t ____quic_signpost_is_enabled_block_invoke_3884()
{
  uint64_t result;

  result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_3883 = result;
  return result;
}

uint64_t __quic_conn_force_send_frames_block_invoke()
{
  return 1;
}

void __quic_conn_close_block_invoke_2(uint64_t a1)
{
  quic_conn_drain(*(_QWORD *)(a1 + 32));
}

void __quic_conn_write_quiclog_block_invoke_2(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  int v4;
  size_t v5;
  const char *v6;
  const char *v7;
  pid_t v8;
  void *v9;
  char __str[1024];
  char __s[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)__s = 0u;
  v12 = 0u;
  bzero(__str, 0x400uLL);
  v2 = *(const char **)(a1 + 40);
  if (strlen(v2) >= 2)
  {
    v3 = 0;
    while (1)
    {
      v4 = v2[v3 + 1];
      __s[v3] = v4;
      if (!v4)
        break;
      if (++v3 == 127)
      {
        HIBYTE(v18) = 0;
        break;
      }
    }
  }
  v5 = strlen(__s);
  if (v5)
    __s[v5 - 1] = 0;
  v6 = getprogname();
  if (v6)
    v7 = v6;
  else
    v7 = "unknown";
  v8 = getpid();
  snprintf(__str, 0x400uLL, "%s/%s-%d-%s.qlog", &quiclog_directory, v7, v8, __s);
  quiclog_dump_to_file(*(void **)(a1 + 48), (uint64_t)__str, *(unsigned __int8 *)(a1 + 56));
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v9)
  {
    os_release(v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

dispatch_queue_t __quic_conn_write_quiclog_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.network.quic.quiclog", MEMORY[0x24BDAC9C0]);
  quic_conn_write_quiclog_quiclog_queue = (uint64_t)result;
  return result;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_38(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v1 + 1096) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v1 + 1380) |= 0x8000000uLL;
  quic_conn_close(*(_QWORD *)(a1 + 32));
}

void __quic_conn_set_metadata_handlers_block_invoke_2_34(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  char v5;
  char v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  int v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t v23;
  unsigned __int8 *v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  _OWORD *v32;
  int v33;
  unsigned int v34;
  __int128 v35;
  uint64_t v36;
  unsigned __int8 *v37;
  int v38;
  uint64_t v39;
  _OWORD *v40;
  _OWORD *v41;
  uint64_t v42;
  unsigned __int8 *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) <= *(_QWORD *)(v2 + 752))
    v3 = *(_QWORD *)(v2 + 752);
  else
    v3 = *(_QWORD *)(a1 + 32);
  v4 = qlog_debug_enabled;
  v5 = qlog_nwlog_enabled;
  if (v3 >= 0x1000000000000001)
  {
    if (qlog_debug_enabled)
      v6 = 1;
    else
      v6 = qlog_nwlog_enabled;
    if ((v6 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      v5 = 0;
      v3 = 0x1000000000000000;
      goto LABEL_40;
    }
    if (*(_QWORD *)(v2 + 1112))
    {
      v7 = _os_log_pack_size();
      v47 = &v45;
      v8 = (char *)&v45 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      v10 = *(_QWORD *)(a1 + 40);
      v46 = v10 + 976;
      v11 = *(_QWORD *)(v10 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v12 = &quic_cid_describe_cid_buf2;
      else
        v12 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v13 = v12;
      else
        v13 = &quic_cid_describe_cid_buf1;
      v14 = ++quic_cid_describe_state;
      v15 = *(unsigned __int8 *)(v11 + 38);
      v16 = 0uLL;
      *(_OWORD *)((char *)v13 + 25) = 0u;
      if (v15 >= 0x14)
        v17 = 20;
      else
        v17 = v15;
      *v13 = 0uLL;
      v13[1] = 0uLL;
      if ((_DWORD)v17)
      {
        v18 = (unsigned __int8 *)(v11 + 39);
        do
        {
          v19 = *v18++;
          snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
          --v17;
        }
        while (v17);
        v14 = quic_cid_describe_state;
        v16 = 0uLL;
      }
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
      if (v14 % 3 == 2)
        v21 = &quic_cid_describe_cid_buf2;
      else
        v21 = &quic_cid_describe_cid_buf3;
      if (v14 % 3)
        v22 = v21;
      else
        v22 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v14 + 1;
      if (*(unsigned __int8 *)(v20 + 17) >= 0x14u)
        v23 = 20;
      else
        v23 = *(unsigned __int8 *)(v20 + 17);
      *v22 = v16;
      v22[1] = v16;
      *(_OWORD *)((char *)v22 + 25) = v16;
      if ((_DWORD)v23)
      {
        v24 = (unsigned __int8 *)(v20 + 18);
        do
        {
          v25 = *v24++;
          snprintf((char *)v22, 0x29uLL, "%s%02x", (const char *)v22, v25);
          --v23;
        }
        while (v23);
      }
      *(_DWORD *)v9 = 136447490;
      *(_QWORD *)(v9 + 4) = "quic_conn_set_metadata_handlers_block_invoke_2";
      *(_WORD *)(v9 + 12) = 2082;
      *(_QWORD *)(v9 + 14) = v46;
      *(_WORD *)(v9 + 22) = 2082;
      *(_QWORD *)(v9 + 24) = v13;
      *(_WORD *)(v9 + 32) = 2082;
      *(_QWORD *)(v9 + 34) = v22;
      *(_WORD *)(v9 + 42) = 2048;
      *(_QWORD *)(v9 + 44) = v3;
      *(_WORD *)(v9 + 52) = 2048;
      v3 = 0x1000000000000000;
      *(_QWORD *)(v9 + 54) = 0x1000000000000000;
      qlog_internal(16, (uint64_t)v8, 1014);
      v5 = qlog_nwlog_enabled;
      if (qlog_debug_enabled)
        goto LABEL_42;
LABEL_40:
      if ((v5 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      goto LABEL_42;
    }
    v3 = 0x1000000000000000;
  }
  if (!v4)
    goto LABEL_40;
LABEL_42:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112))
  {
    v26 = _os_log_pack_size();
    v27 = (char *)&v45 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v28 = _os_log_pack_fill();
    v29 = *(_QWORD *)(a1 + 40);
    v47 = (uint64_t *)(v29 + 976);
    v30 = *(_QWORD *)(v29 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v31 = &quic_cid_describe_cid_buf2;
    else
      v31 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v32 = v31;
    else
      v32 = &quic_cid_describe_cid_buf1;
    v33 = ++quic_cid_describe_state;
    v34 = *(unsigned __int8 *)(v30 + 38);
    v35 = 0uLL;
    *(_OWORD *)((char *)v32 + 25) = 0u;
    if (v34 >= 0x14)
      v36 = 20;
    else
      v36 = v34;
    *v32 = 0uLL;
    v32[1] = 0uLL;
    if ((_DWORD)v36)
    {
      v37 = (unsigned __int8 *)(v30 + 39);
      do
      {
        v38 = *v37++;
        snprintf((char *)v32, 0x29uLL, "%s%02x", (const char *)v32, v38);
        --v36;
      }
      while (v36);
      v33 = quic_cid_describe_state;
      v35 = 0uLL;
    }
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
    if (v33 % 3 == 2)
      v40 = &quic_cid_describe_cid_buf2;
    else
      v40 = &quic_cid_describe_cid_buf3;
    if (v33 % 3)
      v41 = v40;
    else
      v41 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v33 + 1;
    if (*(unsigned __int8 *)(v39 + 17) >= 0x14u)
      v42 = 20;
    else
      v42 = *(unsigned __int8 *)(v39 + 17);
    *v41 = v35;
    v41[1] = v35;
    *(_OWORD *)((char *)v41 + 25) = v35;
    if ((_DWORD)v42)
    {
      v43 = (unsigned __int8 *)(v39 + 18);
      do
      {
        v44 = *v43++;
        snprintf((char *)v41, 0x29uLL, "%s%02x", (const char *)v41, v44);
        --v42;
      }
      while (v42);
    }
    *(_DWORD *)v28 = 136447234;
    *(_QWORD *)(v28 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v28 + 12) = 2082;
    *(_QWORD *)(v28 + 14) = v47;
    *(_WORD *)(v28 + 22) = 2082;
    *(_QWORD *)(v28 + 24) = v32;
    *(_WORD *)(v28 + 32) = 2082;
    *(_QWORD *)(v28 + 34) = v41;
    *(_WORD *)(v28 + 42) = 2048;
    *(_QWORD *)(v28 + 44) = v3;
    qlog_internal(1, (uint64_t)v27, 1018);
  }
LABEL_69:
  quic_send_max_streams_uni(*(_QWORD *)(a1 + 40), v3);
}

void __quic_conn_set_metadata_handlers_block_invoke_2_29(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  char v6;
  char v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  int v15;
  unsigned int v16;
  __int128 v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int v20;
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  unsigned __int8 *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  int v35;
  unsigned int v36;
  __int128 v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  uint64_t v41;
  _OWORD *v42;
  _OWORD *v43;
  uint64_t v44;
  unsigned __int8 *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 <= *(_QWORD *)(v3 + 672))
    v4 = *(_QWORD *)(v3 + 672);
  else
    v4 = *(_QWORD *)(a1 + 32);
  v5 = qlog_debug_enabled;
  v6 = qlog_nwlog_enabled;
  if (v2 >= 0x1000000000000001)
  {
    if (qlog_debug_enabled)
      v7 = 1;
    else
      v7 = qlog_nwlog_enabled;
    if ((v7 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      v6 = 0;
      v4 = 0x1000000000000000;
      goto LABEL_40;
    }
    if (*(_QWORD *)(v3 + 1112))
    {
      v8 = _os_log_pack_size();
      v49 = &v47;
      v9 = (char *)&v47 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      v11 = *(_QWORD *)(a1 + 40);
      v48 = v11 + 976;
      v12 = *(_QWORD *)(v11 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v13 = &quic_cid_describe_cid_buf2;
      else
        v13 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v14 = v13;
      else
        v14 = &quic_cid_describe_cid_buf1;
      v15 = ++quic_cid_describe_state;
      v16 = *(unsigned __int8 *)(v12 + 38);
      v17 = 0uLL;
      *(_OWORD *)((char *)v14 + 25) = 0u;
      if (v16 >= 0x14)
        v18 = 20;
      else
        v18 = v16;
      *v14 = 0uLL;
      v14[1] = 0uLL;
      if ((_DWORD)v18)
      {
        v19 = (unsigned __int8 *)(v12 + 39);
        do
        {
          v20 = *v19++;
          snprintf((char *)v14, 0x29uLL, "%s%02x", (const char *)v14, v20);
          --v18;
        }
        while (v18);
        v15 = quic_cid_describe_state;
        v17 = 0uLL;
      }
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
      if (v15 % 3 == 2)
        v22 = &quic_cid_describe_cid_buf2;
      else
        v22 = &quic_cid_describe_cid_buf3;
      if (v15 % 3)
        v23 = v22;
      else
        v23 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v15 + 1;
      if (*(unsigned __int8 *)(v21 + 17) >= 0x14u)
        v24 = 20;
      else
        v24 = *(unsigned __int8 *)(v21 + 17);
      *v23 = v17;
      v23[1] = v17;
      *(_OWORD *)((char *)v23 + 25) = v17;
      if ((_DWORD)v24)
      {
        v25 = (unsigned __int8 *)(v21 + 18);
        do
        {
          v26 = *v25++;
          snprintf((char *)v23, 0x29uLL, "%s%02x", (const char *)v23, v26);
          --v24;
        }
        while (v24);
      }
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v10 = 136447490;
      *(_QWORD *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke_2";
      *(_WORD *)(v10 + 12) = 2082;
      *(_QWORD *)(v10 + 14) = v48;
      *(_WORD *)(v10 + 22) = 2082;
      *(_QWORD *)(v10 + 24) = v14;
      *(_WORD *)(v10 + 32) = 2082;
      *(_QWORD *)(v10 + 34) = v23;
      *(_WORD *)(v10 + 42) = 2048;
      *(_QWORD *)(v10 + 44) = v27;
      *(_WORD *)(v10 + 52) = 2048;
      v4 = 0x1000000000000000;
      *(_QWORD *)(v10 + 54) = 0x1000000000000000;
      qlog_internal(16, (uint64_t)v9, 996);
      v6 = qlog_nwlog_enabled;
      if (qlog_debug_enabled)
        goto LABEL_42;
LABEL_40:
      if ((v6 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      goto LABEL_42;
    }
    v4 = 0x1000000000000000;
  }
  if (!v5)
    goto LABEL_40;
LABEL_42:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112))
  {
    v28 = _os_log_pack_size();
    v29 = (char *)&v47 - ((MEMORY[0x24BDAC7A8](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v30 = _os_log_pack_fill();
    v31 = *(_QWORD *)(a1 + 40);
    v49 = (uint64_t *)(v31 + 976);
    v32 = *(_QWORD *)(v31 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v33 = &quic_cid_describe_cid_buf2;
    else
      v33 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v34 = v33;
    else
      v34 = &quic_cid_describe_cid_buf1;
    v35 = ++quic_cid_describe_state;
    v36 = *(unsigned __int8 *)(v32 + 38);
    v37 = 0uLL;
    *(_OWORD *)((char *)v34 + 25) = 0u;
    if (v36 >= 0x14)
      v38 = 20;
    else
      v38 = v36;
    *v34 = 0uLL;
    v34[1] = 0uLL;
    if ((_DWORD)v38)
    {
      v39 = (unsigned __int8 *)(v32 + 39);
      do
      {
        v40 = *v39++;
        snprintf((char *)v34, 0x29uLL, "%s%02x", (const char *)v34, v40);
        --v38;
      }
      while (v38);
      v35 = quic_cid_describe_state;
      v37 = 0uLL;
    }
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
    if (v35 % 3 == 2)
      v42 = &quic_cid_describe_cid_buf2;
    else
      v42 = &quic_cid_describe_cid_buf3;
    if (v35 % 3)
      v43 = v42;
    else
      v43 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v35 + 1;
    if (*(unsigned __int8 *)(v41 + 17) >= 0x14u)
      v44 = 20;
    else
      v44 = *(unsigned __int8 *)(v41 + 17);
    *v43 = v37;
    v43[1] = v37;
    *(_OWORD *)((char *)v43 + 25) = v37;
    if ((_DWORD)v44)
    {
      v45 = (unsigned __int8 *)(v41 + 18);
      do
      {
        v46 = *v45++;
        snprintf((char *)v43, 0x29uLL, "%s%02x", (const char *)v43, v46);
        --v44;
      }
      while (v44);
    }
    *(_DWORD *)v30 = 136447234;
    *(_QWORD *)(v30 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v30 + 12) = 2082;
    *(_QWORD *)(v30 + 14) = v49;
    *(_WORD *)(v30 + 22) = 2082;
    *(_QWORD *)(v30 + 24) = v34;
    *(_WORD *)(v30 + 32) = 2082;
    *(_QWORD *)(v30 + 34) = v43;
    *(_WORD *)(v30 + 42) = 2048;
    *(_QWORD *)(v30 + 44) = v4;
    qlog_internal(1, (uint64_t)v29, 1000);
  }
LABEL_69:
  quic_send_max_streams_bidi(*(_QWORD **)(a1 + 40), v4);
}

void __quic_conn_set_metadata_handlers_block_invoke_2_23(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t flow_for_key;
  _QWORD *v6;
  uint64_t path;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, _BYTE *);
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    v3 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    v12[2] = __quic_conn_set_metadata_handlers_block_invoke_3_24;
    v12[3] = &__block_descriptor_tmp_25_3940;
    v4 = *(_QWORD *)(a1 + 40);
    v12[4] = v1;
    v12[5] = v4;
    v13 = -1;
    flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(v1 + 477) == 9)
    {
      v13 = v3;
      v14 = 0x40000000;
      v15 = __quic_enumerate_open_data_streams_block_invoke;
      v16 = &unk_24C2E1C10;
      v17 = v12;
      v18 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }
    v6 = *(_QWORD **)(a1 + 32);
    path = quic_conn_select_next_path(v6, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal((uint64_t)v6, path, 0) & 1) == 0
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)&v12[-1] - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
      qlog_internal(2, (uint64_t)v9, 983);
    }
  }
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_24(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = *a3;
  if ((*a3 & 2) != 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1380) & 1) != 0)
    {
      if ((v3 & 1) != 0)
        return 1;
    }
    else if ((v3 & 1) == 0)
    {
      return 1;
    }
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 > a3[6])
    {
      a3[6] = v6;
      if (__quic_signpost_is_enabled__quic_signposts_once_3882[0] != -1)
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3882, &__block_literal_global_192);
      if (__quic_signpost_is_enabled__quic_signposts_enabled_3883 && kdebug_is_enabled())
        kdebug_trace();
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v7 = _os_log_pack_size();
        v8 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v9 = _os_log_pack_fill();
        v10 = *a3;
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v9 = 136446722;
        *(_QWORD *)(v9 + 4) = "quic_conn_set_metadata_handlers_block_invoke_3";
        *(_WORD *)(v9 + 12) = 2048;
        *(_QWORD *)(v9 + 14) = v10;
        *(_WORD *)(v9 + 22) = 2048;
        *(_QWORD *)(v9 + 24) = v11;
        qlog_internal(2, (uint64_t)v8, 974);
      }
      quic_frame_alloc_MAX_STREAM_DATA(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), *a3, a3[6]);
    }
  }
  return 1;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_17(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t flow_for_key;
  _QWORD *v6;
  uint64_t path;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, _BYTE *);
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    v3 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    v12[2] = __quic_conn_set_metadata_handlers_block_invoke_3_18;
    v12[3] = &__block_descriptor_tmp_19;
    v4 = *(_QWORD *)(a1 + 40);
    v12[4] = v1;
    v12[5] = v4;
    v13 = -1;
    flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(v1 + 477) == 9)
    {
      v13 = v3;
      v14 = 0x40000000;
      v15 = __quic_enumerate_open_data_streams_block_invoke;
      v16 = &unk_24C2E1C10;
      v17 = v12;
      v18 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }
    v6 = *(_QWORD **)(a1 + 32);
    path = quic_conn_select_next_path(v6, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal((uint64_t)v6, path, 0) & 1) == 0
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)&v12[-1] - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
      qlog_internal(2, (uint64_t)v9, 947);
    }
  }
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_18(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = *a3;
  if ((*a3 & 2) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1380) & 1) != 0)
    {
      if ((v3 & 1) != 0)
        return 1;
    }
    else if ((v3 & 1) == 0)
    {
      return 1;
    }
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 > a3[6])
    {
      a3[6] = v6;
      if (__quic_signpost_is_enabled__quic_signposts_once_3882[0] != -1)
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3882, &__block_literal_global_192);
      if (__quic_signpost_is_enabled__quic_signposts_enabled_3883 && kdebug_is_enabled())
        kdebug_trace();
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v7 = _os_log_pack_size();
        v8 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v9 = _os_log_pack_fill();
        v10 = *a3;
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v9 = 136446722;
        *(_QWORD *)(v9 + 4) = "quic_conn_set_metadata_handlers_block_invoke_3";
        *(_WORD *)(v9 + 12) = 2048;
        *(_QWORD *)(v9 + 14) = v10;
        *(_WORD *)(v9 + 22) = 2048;
        *(_QWORD *)(v9 + 24) = v11;
        qlog_internal(2, (uint64_t)v8, 938);
      }
      quic_frame_alloc_MAX_STREAM_DATA(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), *a3, a3[6]);
    }
  }
  return 1;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t flow_for_key;
  _QWORD *v6;
  uint64_t path;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, _BYTE *);
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    v3 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    v12[2] = __quic_conn_set_metadata_handlers_block_invoke_3;
    v12[3] = &__block_descriptor_tmp_13_3947;
    v4 = *(_QWORD *)(a1 + 40);
    v12[4] = v1;
    v12[5] = v4;
    v13 = -1;
    flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(v1 + 477) == 9)
    {
      v13 = v3;
      v14 = 0x40000000;
      v15 = __quic_enumerate_open_data_streams_block_invoke;
      v16 = &unk_24C2E1C10;
      v17 = v12;
      v18 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }
    v6 = *(_QWORD **)(a1 + 32);
    path = quic_conn_select_next_path(v6, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal((uint64_t)v6, path, 0) & 1) == 0
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)&v12[-1] - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
      qlog_internal(2, (uint64_t)v9, 911);
    }
  }
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = *a3;
  if ((*a3 & 2) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if ((*(_BYTE *)(v6 + 1380) & 1) != 0)
    {
      if ((v3 & 1) == 0)
        return 1;
    }
    else if ((v3 & 1) != 0)
    {
      return 1;
    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7 > a3[6])
    {
      a3[6] = v7;
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v8 = _os_log_pack_size();
        v9 = (char *)v14 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v10 = _os_log_pack_fill();
        v11 = *a3;
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v10 = 136446722;
        *(_QWORD *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke_3";
        *(_WORD *)(v10 + 12) = 2048;
        *(_QWORD *)(v10 + 14) = v11;
        *(_WORD *)(v10 + 22) = 2048;
        *(_QWORD *)(v10 + 24) = v12;
        qlog_internal(2, (uint64_t)v9, 902);
        v7 = a3[6];
        v6 = *(_QWORD *)(a1 + 32);
        v3 = *a3;
      }
      quic_frame_alloc_MAX_STREAM_DATA(*(_QWORD *)(v6 + 560), v3, v7);
    }
  }
  return 1;
}

void __quic_conn_set_metadata_handlers_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t path;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 > *(_QWORD *)(v1 + 856))
    {
      *(_QWORD *)(v1 + 856) = v3;
      if (__quic_signpost_is_enabled__quic_signposts_once_3882[0] != -1)
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3882, &__block_literal_global_192);
      if (__quic_signpost_is_enabled__quic_signposts_enabled_3883 && kdebug_is_enabled())
        kdebug_trace();
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v4 = _os_log_pack_size();
        v5 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v6 = _os_log_pack_fill();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 856);
        *(_DWORD *)v6 = 136446466;
        *(_QWORD *)(v6 + 4) = "quic_conn_set_metadata_handlers_block_invoke_2";
        *(_WORD *)(v6 + 12) = 2048;
        *(_QWORD *)(v6 + 14) = v7;
        qlog_internal(2, (uint64_t)v5, 873);
      }
      quic_frame_alloc_MAX_DATA(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 856));
      v8 = *(_QWORD **)(a1 + 32);
      path = quic_conn_select_next_path(v8, (uint64_t)&__block_literal_global_98);
      if ((quic_conn_send_internal((uint64_t)v8, path, 0) & 1) == 0
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        v10 = _os_log_pack_size();
        v11 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v12 = _os_log_pack_fill();
        *(_DWORD *)v12 = 136446210;
        *(_QWORD *)(v12 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
        qlog_internal(2, (uint64_t)v11, 877);
      }
    }
  }
}

void quic_conn_dealloc_globals(int a1, _QWORD *a2)
{
  _QWORD *i;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;

  for (i = (_QWORD *)*a2; *a2; i = (_QWORD *)*a2)
  {
    v7 = i[12];
    v8 = (_QWORD *)i[13];
    if (v7)
    {
      *(_QWORD *)(v7 + 104) = v8;
      v8 = (_QWORD *)i[13];
    }
    else
    {
      a2[1] = v8;
    }
    *v8 = v7;
    free(i);
  }
  *((_DWORD *)a2 + 4) = 0;
  while (1)
  {
    v4 = (_QWORD *)a2[3];
    if (!v4)
      break;
    v5 = v4[21];
    v6 = (_QWORD *)v4[22];
    if (v5)
    {
      *(_QWORD *)(v5 + 176) = v6;
      v6 = (_QWORD *)v4[22];
    }
    else
    {
      a2[4] = v6;
    }
    *v6 = v5;
    free(v4);
  }
  *((_DWORD *)a2 + 10) = 0;
  while (1)
  {
    v9 = (_QWORD *)a2[6];
    if (!v9)
      break;
    v10 = v9[5];
    v11 = (_QWORD *)v9[6];
    if (v10)
    {
      *(_QWORD *)(v10 + 48) = v11;
      v11 = (_QWORD *)v9[6];
    }
    else
    {
      a2[7] = v11;
    }
    *v11 = v10;
    free(v9);
  }
  free(a2);
}

uint64_t __quic_conn_copy_metadata_block_invoke_77()
{
  nw_quic_stream_set_connection_metadata();
  return 1;
}

uint64_t __quic_conn_copy_metadata_block_invoke_3()
{
  nw_quic_stream_set_connection_metadata();
  return 1;
}

uint64_t quic_conn_get_min_mss_path(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v15 = 0x2000000000;
    v9[0] = MEMORY[0x24BDAC760];
    v10 = __quic_conn_get_min_mss_path_block_invoke;
    v11 = &unk_24C2E22A0;
    v13 = 0;
    v14 = &v13;
    v16 = 0;
    v9[1] = 0x40000000;
    v12 = &v13;
    v1 = *(_QWORD *)(a1 + 1360);
    do
    {
      if (!v1)
        break;
      v2 = *(_QWORD *)(v1 + 312);
      v3 = ((uint64_t (*)(_QWORD *))v10)(v9);
      v1 = v2;
    }
    while ((v3 & 1) != 0);
    v4 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v6 = _os_log_pack_size();
      v7 = (char *)v9 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      *(_DWORD *)v8 = 136446210;
      *(_QWORD *)(v8 + 4) = "quic_conn_get_min_mss_path";
      qlog_internal(17, (uint64_t)v7, 1337);
    }
    return 0;
  }
  return v4;
}

uint64_t quic_conn_get_mss_from_interface(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD v20[2];
  uint64_t (*v21)(_QWORD *);
  void *v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  if (!*a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v15 = _os_log_pack_size();
      v16 = (char *)&v20[-1] - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v17 = _os_log_pack_fill();
      *(_DWORD *)v17 = 136446210;
      *(_QWORD *)(v17 + 4) = "quic_conn_get_mss_from_interface";
      qlog_internal(17, (uint64_t)v16, 1285);
      return 1200;
    }
    return 1200;
  }
  v5 = nw_protocol_instance_copy_interface_for_path();
  if (!v5)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v11 = _os_log_pack_size();
      v12 = (char *)&v20[-1] - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v13 = _os_log_pack_fill();
      v14 = *a2;
      *(_DWORD *)v13 = 136446466;
      *(_QWORD *)(v13 + 4) = "quic_conn_get_mss_from_interface";
      *(_WORD *)(v13 + 12) = 2048;
      *(_QWORD *)(v13 + 14) = v14;
      qlog_internal(17, (uint64_t)v12, 1293);
      return 1200;
    }
    return 1200;
  }
  v6 = (void *)v5;
  v29 = 0x2000000000;
  v30 = *((_WORD *)a1 + 298);
  v20[0] = MEMORY[0x24BDAC760];
  v21 = (uint64_t (*)(_QWORD *))__quic_conn_get_mss_from_interface_block_invoke;
  v22 = &unk_24C2E2278;
  v27 = 0;
  v28 = &v27;
  v20[1] = 0x40000000;
  v25 = v2;
  v26 = v5;
  v23 = &v27;
  v24 = a2;
  v7 = a1[170];
  do
  {
    if (!v7)
      break;
    v8 = *(_QWORD *)(v7 + 312);
    v9 = v21(v20);
    v7 = v8;
  }
  while ((v9 & 1) != 0);
  nw_release(v6);
  v10 = *((unsigned __int16 *)v28 + 12);
  _Block_object_dispose(&v27, 8);
  return v10;
}

BOOL __quic_conn_get_mss_from_interface_block_invoke(_QWORD *a1, uint64_t *a2)
{
  void *v4;
  _BOOL8 result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if ((uint64_t *)a1[5] == a2)
    return 1;
  v4 = (void *)nw_protocol_instance_copy_interface_for_path();
  if (v4)
  {
    if (v4 != (void *)a1[7])
    {
      nw_release(v4);
      return 1;
    }
    *(_WORD *)(*(_QWORD *)(a1[4] + 8) + 24) = *((_WORD *)a2 + 213);
    nw_release(v4);
    v10 = *(_QWORD *)(a1[4] + 8);
    if (*(_WORD *)(v10 + 24))
    {
      if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
        || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        v11 = _os_log_pack_size();
        v12 = (char *)v21 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v13 = _os_log_pack_fill();
        v14 = (uint64_t *)a1[5];
        v15 = *(unsigned __int16 *)(*(_QWORD *)(a1[4] + 8) + 24);
        v16 = *v14;
        v17 = *a2;
        *(_DWORD *)v13 = 136447490;
        *(_QWORD *)(v13 + 4) = "quic_conn_get_mss_from_interface_block_invoke";
        *(_WORD *)(v13 + 12) = 1024;
        *(_DWORD *)(v13 + 14) = v15;
        *(_WORD *)(v13 + 18) = 2048;
        *(_QWORD *)(v13 + 20) = v14;
        *(_WORD *)(v13 + 28) = 2048;
        *(_QWORD *)(v13 + 30) = v16;
        *(_WORD *)(v13 + 38) = 2048;
        *(_QWORD *)(v13 + 40) = a2;
        *(_WORD *)(v13 + 48) = 2048;
        *(_QWORD *)(v13 + 50) = v17;
        qlog_internal(2, (uint64_t)v12, 1322);
        return 0;
      }
    }
    else
    {
      if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v18 = _os_log_pack_size();
        v19 = (char *)v21 - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v20 = _os_log_pack_fill();
        *(_DWORD *)v20 = 136446210;
        *(_QWORD *)(v20 + 4) = "quic_conn_get_mss_from_interface_block_invoke";
        qlog_internal(17, (uint64_t)v19, 1315);
        v10 = *(_QWORD *)(a1[4] + 8);
      }
      result = 0;
      *(_WORD *)(v10 + 24) = 1200;
    }
  }
  else
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 1;
    }
    v6 = _os_log_pack_size();
    v7 = (char *)v21 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    v9 = *a2;
    *(_DWORD *)v8 = 136446466;
    *(_QWORD *)(v8 + 4) = "quic_conn_get_mss_from_interface_block_invoke";
    *(_WORD *)(v8 + 12) = 2048;
    *(_QWORD *)(v8 + 14) = v9;
    qlog_internal(17, (uint64_t)v7, 1307);
    return 1;
  }
  return result;
}

void quic_conn_set_application_error(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    nw_quic_connection_set_application_error_internal();
    nw_quic_connection_set_application_error_reason();
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v1 = _os_log_pack_size();
    v2 = (char *)v4 - ((MEMORY[0x24BDAC7A8](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v3 = _os_log_pack_fill();
    *(_DWORD *)v3 = 136446210;
    *(_QWORD *)(v3 + 4) = "quic_conn_set_application_error";
    qlog_internal(17, (uint64_t)v2, 1358);
  }
}

uint64_t quic_conn_get_scid_seq(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  if (!quic_conn_scid_len(a1))
    return 0;
  result = quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 376), a2);
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

void quic_conn_outbound_data_pending(uint64_t a1, int a2)
{
  char v2;
  int v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[4];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = qlog_nwlog_enabled;
  if (a1)
  {
    if (qlog_datapath_enabled)
      v4 = 1;
    else
      v4 = qlog_nwlog_enabled;
    if (v4 == 1)
    {
      if (qlog_debug_enabled)
        v2 = 1;
      if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v8 = _os_log_pack_size();
        v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v10 = _os_log_pack_fill();
        *(_DWORD *)v10 = 136446466;
        *(_QWORD *)(v10 + 4) = "quic_conn_outbound_data_pending";
        *(_WORD *)(v10 + 12) = 1024;
        *(_DWORD *)(v10 + 14) = a2;
        qlog_internal(2, (uint64_t)v9, 2597);
      }
    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 0x40000000;
    v11[2] = __quic_conn_outbound_data_pending_block_invoke;
    v11[3] = &__block_descriptor_tmp_103;
    v12 = a2;
    nw_protocol_instance_access_state();
  }
  else
  {
    if (qlog_debug_enabled)
      v2 = 1;
    if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v5 = _os_log_pack_size();
      v6 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v7 = _os_log_pack_fill();
      *(_DWORD *)v7 = 136446210;
      *(_QWORD *)(v7 + 4) = "quic_conn_outbound_data_pending";
      qlog_internal(17, (uint64_t)v6, 2594);
    }
  }
}

uint64_t __quic_conn_outbound_data_pending_block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t path;

  v2 = *(_QWORD *)((char *)a2 + 1380);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (((v2 >> 8) & 1) != (_DWORD)v3)
  {
    *(_QWORD *)((char *)a2 + 1380) = v2 & 0xFFFFFFFFFFFFFEFFLL | (v3 << 8);
    if (!*(_BYTE *)(a1 + 32))
    {
      path = quic_conn_select_next_path(a2, (uint64_t)&__block_literal_global_98);
      quic_conn_send_internal((uint64_t)a2, path, 0);
    }
  }
  return 1;
}

BOOL quic_conn_pre_decryption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v4;
  uint64_t v5;
  int v7;
  unsigned int v9;
  int v10;
  void *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  char v19;
  int v20;
  _BOOL8 result;
  unsigned int v22;
  __int16 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD v29[7];
  __int16 v30;
  _DWORD v31[2];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (_DWORD *)(a1 + 1380);
    v5 = *(_QWORD *)(a1 + 1380);
    if ((v5 & 1) == 0)
      return 1;
    if ((*(_BYTE *)(a3 + 232) & 1) == 0)
      return 1;
    if ((**(_BYTE **)a3 & 0x30) != 0)
      return 1;
    v7 = *(unsigned __int8 *)(a1 + 477);
    if ((v7 - 1) > 2)
      return 1;
    v9 = *(_DWORD *)(a3 + 108);
    if (v9 == *(_DWORD *)(a1 + 1376))
    {
      if ((v5 & 0x4000) != 0 && v7 != 3)
      {
        *(_BYTE *)(a2 + 38) = 8;
        arc4random_buf((void *)(a2 + 39), 8uLL);
        *(_BYTE *)(a1 + 392) = *(_BYTE *)(a2 + 38);
        v10 = *(_DWORD *)(a2 + 55);
        *(_OWORD *)(a1 + 393) = *(_OWORD *)(a2 + 39);
        *(_DWORD *)(a1 + 409) = v10;
        *(_WORD *)(a1 + 598) = 128;
        v11 = malloc_type_malloc(0x80uLL, 0xF2B69DE5uLL);
        if (!v11)
          qlog_abort_internal("%s strict_malloc(%zu) failed", "strict_malloc", 0x80uLL);
        *(_QWORD *)(a1 + 1088) = v11;
        arc4random_buf(v11, *(unsigned __int16 *)(a1 + 598));
        quic_conn_send_retry(a1, a2, a3);
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
        {
          if (*(_QWORD *)(a1 + 1112))
          {
            v12 = _os_log_pack_size();
            v13 = (char *)v29 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v14 = _os_log_pack_fill();
            v15 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
            v16 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
            v17 = quic_cid_describe((unsigned __int8 *)(a3 + 40));
            *(_DWORD *)v14 = 136447234;
            *(_QWORD *)(v14 + 4) = "quic_conn_pre_decryption";
            *(_WORD *)(v14 + 12) = 2082;
            *(_QWORD *)(v14 + 14) = a1 + 976;
            *(_WORD *)(v14 + 22) = 2082;
            *(_QWORD *)(v14 + 24) = v15;
            *(_WORD *)(v14 + 32) = 2082;
            *(_QWORD *)(v14 + 34) = v16;
            *(_WORD *)(v14 + 42) = 2082;
            *(_QWORD *)(v14 + 44) = v17;
            qlog_internal(0, (uint64_t)v13, 2924);
          }
        }
        v19 = *(_BYTE *)(a3 + 40);
        v18 = a3 + 40;
        *(_BYTE *)(a1 + 434) = v19;
        v20 = *(_DWORD *)(v18 + 17);
        *(_OWORD *)(a1 + 435) = *(_OWORD *)(v18 + 1);
        *(_DWORD *)(a1 + 451) = v20;
        quic_path_set_scid(a2, v18, a1);
        quic_fsm_conn_change(a1, 3u);
        quic_crypto_tls_start(*(_QWORD *)a1, *(_QWORD *)(a1 + 368), *v4 & 1);
        return 0;
      }
      quic_fsm_conn_change(a1, 4u);
      *(_BYTE *)(a1 + 600) = 2;
      quic_protector_create_server((unsigned __int8 *)(a3 + 40));
      *(_QWORD *)(a1 + 568) = v25;
      return 1;
    }
    *(_DWORD *)(a1 + 520) = v9;
    quic_packet_builder_set_version(*(_QWORD *)(a1 + 560), v9);
    v22 = *(_DWORD *)(a1 + 1376);
    *(_DWORD *)(a1 + 524) = v22;
    quic_packet_builder_set_version(*(_QWORD *)(a1 + 560), v22);
    v31[0] = *(_DWORD *)(a1 + 1376);
    v31[1] = 438975050;
    v23 = quic_cid_len((unsigned __int8 *)(a3 + 40));
    v24 = quic_cid_len((unsigned __int8 *)(a3 + 61));
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 0x40000000;
    v29[2] = __quic_conn_send_vn_block_invoke;
    v29[3] = &__block_descriptor_tmp_211;
    v29[4] = a1;
    v29[5] = a3;
    v29[6] = v31;
    v30 = v23 + v24 + 15;
    nw_protocol_request_outbound_data();
    if (*(_BYTE *)(a1 + 477) != 2)
      quic_fsm_conn_change(a1, 2u);
    return 0;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    v26 = _os_log_pack_size();
    v27 = (char *)v29 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136446210;
    *(_QWORD *)(v28 + 4) = "quic_conn_pre_decryption";
    qlog_internal(17, (uint64_t)v27, 2888);
    return 0;
  }
  return result;
}

void quic_conn_process_vn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v8;
  unint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL v17;
  char v18;
  unint64_t v19;
  unint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char v28;
  unsigned __int16 v29;
  unsigned __int8 v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unsigned __int8 *v36;
  _OWORD *v37;
  _OWORD *v38;
  int v39;
  unsigned int v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 *v44;
  int v45;
  _OWORD *v46;
  _OWORD *v47;
  uint64_t v48;
  unsigned __int8 *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  unsigned __int8 *v56;
  _OWORD *v57;
  _OWORD *v58;
  int v59;
  unsigned int v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int8 *v64;
  int v65;
  _OWORD *v66;
  _OWORD *v67;
  uint64_t v68;
  unsigned __int8 *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned __int8 *v74;
  _OWORD *v75;
  _OWORD *v76;
  int v77;
  unsigned int v78;
  __int128 v79;
  uint64_t v80;
  unsigned __int8 *v81;
  int v82;
  _OWORD *v83;
  _OWORD *v84;
  int v85;
  uint64_t v86;
  unsigned __int8 *v87;
  int v88;
  uint64_t v89;
  _OWORD *v90;
  _OWORD *v91;
  int v92;
  unsigned int v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  unsigned __int8 *v97;
  int v98;
  _OWORD *v99;
  _OWORD *v100;
  unsigned int v101;
  uint64_t v102;
  unsigned __int8 *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unsigned __int8 *v108;
  _OWORD *v109;
  _OWORD *v110;
  int v111;
  unsigned int v112;
  __int128 v113;
  uint64_t v114;
  unsigned __int8 *v115;
  int v116;
  _OWORD *v117;
  _OWORD *v118;
  int v119;
  uint64_t v120;
  unsigned __int8 *v121;
  int v122;
  uint64_t v123;
  _OWORD *v124;
  _OWORD *v125;
  int v126;
  uint64_t v127;
  __int128 v128;
  uint64_t v129;
  unsigned __int8 *v130;
  int v131;
  _OWORD *v132;
  _OWORD *v133;
  uint64_t v134;
  unsigned __int8 *v135;
  int v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  const char *v145;
  const char *v146;
  int v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  const char *v157;
  const char *v158;
  const char *v159;
  uint64_t flow_for_key;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  char *v164;
  char **v165;
  uint64_t v166;
  uint64_t v167;

  v167 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v161 = _os_log_pack_size();
      v162 = (char *)&v164 - ((MEMORY[0x24BDAC7A8](v161, v161) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v163 = _os_log_pack_fill();
      *(_DWORD *)v163 = 136446210;
      *(_QWORD *)(v163 + 4) = "quic_conn_process_vn";
      qlog_internal(17, (uint64_t)v162, 2618);
    }
    return;
  }
  v4 = (_QWORD *)(a1 + 1380);
  v5 = *(_QWORD *)(a1 + 1380);
  if ((v5 & 1) != 0)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(_QWORD *)(a1 + 1112))
    {
      return;
    }
    v33 = _os_log_pack_size();
    v165 = &v164;
    v34 = (char *)&v164 - ((MEMORY[0x24BDAC7A8](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v35 = _os_log_pack_fill();
    v164 = (char *)(a1 + 976);
    v36 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v37 = &quic_cid_describe_cid_buf2;
    else
      v37 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v38 = v37;
    else
      v38 = &quic_cid_describe_cid_buf1;
    v39 = ++quic_cid_describe_state;
    v40 = v36[38];
    v41 = 0uLL;
    *(_OWORD *)((char *)v38 + 25) = 0u;
    if (v40 >= 0x14)
      v42 = 20;
    else
      v42 = v40;
    *v38 = 0uLL;
    v38[1] = 0uLL;
    if ((_DWORD)v42)
    {
      v43 = a1;
      v44 = v36 + 39;
      do
      {
        v45 = *v44++;
        snprintf((char *)v38, 0x29uLL, "%s%02x", (const char *)v38, v45);
        --v42;
      }
      while (v42);
      v36 = *(unsigned __int8 **)(v43 + 1112);
      v39 = quic_cid_describe_state;
      v41 = 0uLL;
    }
    if (v39 % 3 == 2)
      v46 = &quic_cid_describe_cid_buf2;
    else
      v46 = &quic_cid_describe_cid_buf3;
    if (v39 % 3)
      v47 = v46;
    else
      v47 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v39 + 1;
    if (v36[17] >= 0x14u)
      v48 = 20;
    else
      v48 = v36[17];
    *v47 = v41;
    v47[1] = v41;
    *(_OWORD *)((char *)v47 + 25) = v41;
    if ((_DWORD)v48)
    {
      v49 = v36 + 18;
      do
      {
        v50 = *v49++;
        snprintf((char *)v47, 0x29uLL, "%s%02x", (const char *)v47, v50);
        --v48;
      }
      while (v48);
    }
    *(_DWORD *)v35 = 136446978;
    *(_QWORD *)(v35 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v35 + 12) = 2082;
    *(_QWORD *)(v35 + 14) = v164;
    *(_WORD *)(v35 + 22) = 2082;
    *(_QWORD *)(v35 + 24) = v38;
    *(_WORD *)(v35 + 32) = 2082;
    *(_QWORD *)(v35 + 34) = v47;
    v51 = (uint64_t)v34;
    v52 = 2622;
LABEL_211:
    qlog_internal(16, v51, v52);
    return;
  }
  if ((v5 & 0x10) != 0)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(_QWORD *)(a1 + 1112))
    {
      return;
    }
    v53 = _os_log_pack_size();
    v165 = &v164;
    v54 = (char *)&v164 - ((MEMORY[0x24BDAC7A8](v53, v53) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v55 = _os_log_pack_fill();
    v164 = (char *)(a1 + 976);
    v56 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v57 = &quic_cid_describe_cid_buf2;
    else
      v57 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v58 = v57;
    else
      v58 = &quic_cid_describe_cid_buf1;
    v59 = ++quic_cid_describe_state;
    v60 = v56[38];
    v61 = 0uLL;
    *(_OWORD *)((char *)v58 + 25) = 0u;
    if (v60 >= 0x14)
      v62 = 20;
    else
      v62 = v60;
    *v58 = 0uLL;
    v58[1] = 0uLL;
    if ((_DWORD)v62)
    {
      v63 = a1;
      v64 = v56 + 39;
      do
      {
        v65 = *v64++;
        snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v65);
        --v62;
      }
      while (v62);
      v56 = *(unsigned __int8 **)(v63 + 1112);
      v59 = quic_cid_describe_state;
      v61 = 0uLL;
    }
    if (v59 % 3 == 2)
      v66 = &quic_cid_describe_cid_buf2;
    else
      v66 = &quic_cid_describe_cid_buf3;
    if (v59 % 3)
      v67 = v66;
    else
      v67 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v59 + 1;
    if (v56[17] >= 0x14u)
      v68 = 20;
    else
      v68 = v56[17];
    *v67 = v61;
    v67[1] = v61;
    *(_OWORD *)((char *)v67 + 25) = v61;
    if ((_DWORD)v68)
    {
      v69 = v56 + 18;
      do
      {
        v70 = *v69++;
        snprintf((char *)v67, 0x29uLL, "%s%02x", (const char *)v67, v70);
        --v68;
      }
      while (v68);
    }
    *(_DWORD *)v55 = 136446978;
    *(_QWORD *)(v55 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v55 + 12) = 2082;
    *(_QWORD *)(v55 + 14) = v164;
    *(_WORD *)(v55 + 22) = 2082;
    *(_QWORD *)(v55 + 24) = v58;
    *(_WORD *)(v55 + 32) = 2082;
    *(_QWORD *)(v55 + 34) = v67;
    v51 = (uint64_t)v54;
    v52 = 2630;
    goto LABEL_211;
  }
  v8 = *(unsigned __int8 *)(a3 + 40);
  if ((_DWORD)v8 != *(unsigned __int8 *)(a2 + 38))
    goto LABEL_248;
  if (v8 >= 0x14 ? 20 : *(unsigned __int8 *)(a3 + 40))
  {
    if (v8 >= 0x14)
      v8 = 20;
    v10 = v8 - 1;
    v11 = (unsigned __int8 *)(a2 + 39);
    v12 = (unsigned __int8 *)(a3 + 41);
    do
    {
      v14 = *v12++;
      v13 = v14;
      v16 = *v11++;
      v15 = v16;
      v17 = v10-- != 0;
      v18 = v17;
    }
    while (v13 == v15 && (v18 & 1) != 0);
    if (v13 != v15)
    {
LABEL_248:
      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(_QWORD *)(a1 + 1112))
      {
        return;
      }
      v71 = _os_log_pack_size();
      v165 = &v164;
      v72 = MEMORY[0x24BDAC7A8](v71, v71);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v164 = (char *)&v164 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
      v73 = _os_log_pack_fill();
      v74 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v75 = &quic_cid_describe_cid_buf2;
      else
        v75 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v76 = v75;
      else
        v76 = &quic_cid_describe_cid_buf1;
      v77 = ++quic_cid_describe_state;
      v78 = v74[38];
      v79 = 0uLL;
      *(_OWORD *)((char *)v76 + 25) = 0u;
      if (v78 >= 0x14)
        v80 = 20;
      else
        v80 = v78;
      *v76 = 0uLL;
      v76[1] = 0uLL;
      if ((_DWORD)v80)
      {
        v81 = v74 + 39;
        do
        {
          v82 = *v81++;
          snprintf((char *)v76, 0x29uLL, "%s%02x", (const char *)v76, v82);
          --v80;
        }
        while (v80);
        v74 = *(unsigned __int8 **)(a1 + 1112);
        v77 = quic_cid_describe_state;
        v79 = 0uLL;
      }
      if (v77 % 3 == 2)
        v83 = &quic_cid_describe_cid_buf2;
      else
        v83 = &quic_cid_describe_cid_buf3;
      if (v77 % 3)
        v84 = v83;
      else
        v84 = &quic_cid_describe_cid_buf1;
      v85 = v77 + 1;
      quic_cid_describe_state = v85;
      if (v74[17] >= 0x14u)
        v86 = 20;
      else
        v86 = v74[17];
      *v84 = v79;
      v84[1] = v79;
      *(_OWORD *)((char *)v84 + 25) = v79;
      if ((_DWORD)v86)
      {
        v87 = v74 + 18;
        do
        {
          v88 = *v87++;
          snprintf((char *)v84, 0x29uLL, "%s%02x", (const char *)v84, v88);
          --v86;
        }
        while (v86);
        v85 = quic_cid_describe_state;
      }
      v89 = a1 + 976;
      if (v85 % 3 == 2)
        v90 = &quic_cid_describe_cid_buf2;
      else
        v90 = &quic_cid_describe_cid_buf3;
      if (v85 % 3)
        v91 = v90;
      else
        v91 = &quic_cid_describe_cid_buf1;
      v92 = v85 + 1;
      quic_cid_describe_state = v85 + 1;
      v93 = *(unsigned __int8 *)(a3 + 40);
      v94 = 0uLL;
      *(_OWORD *)((char *)v91 + 25) = 0u;
      if (v93 >= 0x14)
        v95 = 20;
      else
        v95 = v93;
      *v91 = 0uLL;
      v91[1] = 0uLL;
      if ((_DWORD)v95)
      {
        v96 = v89;
        v97 = (unsigned __int8 *)(a3 + 41);
        do
        {
          v98 = *v97++;
          snprintf((char *)v91, 0x29uLL, "%s%02x", (const char *)v91, v98);
          --v95;
        }
        while (v95);
        v92 = quic_cid_describe_state;
        v89 = v96;
        v94 = 0uLL;
      }
      if (v92 % 3 == 2)
        v99 = &quic_cid_describe_cid_buf2;
      else
        v99 = &quic_cid_describe_cid_buf3;
      if (v92 % 3)
        v100 = v99;
      else
        v100 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v92 + 1;
      v101 = *(unsigned __int8 *)(a2 + 38);
      *(_OWORD *)((char *)v100 + 25) = v94;
      if (v101 >= 0x14)
        v102 = 20;
      else
        v102 = v101;
      *v100 = v94;
      v100[1] = v94;
      if ((_DWORD)v102)
      {
        v103 = (unsigned __int8 *)(a2 + 39);
        do
        {
          v104 = *v103++;
          snprintf((char *)v100, 0x29uLL, "%s%02x", (const char *)v100, v104);
          --v102;
        }
        while (v102);
      }
      *(_DWORD *)v73 = 136447490;
      *(_QWORD *)(v73 + 4) = "quic_conn_process_vn";
      *(_WORD *)(v73 + 12) = 2082;
      *(_QWORD *)(v73 + 14) = v89;
      *(_WORD *)(v73 + 22) = 2082;
      *(_QWORD *)(v73 + 24) = v76;
      *(_WORD *)(v73 + 32) = 2082;
      *(_QWORD *)(v73 + 34) = v84;
      *(_WORD *)(v73 + 42) = 2082;
      *(_QWORD *)(v73 + 44) = v91;
      *(_WORD *)(v73 + 52) = 2082;
      *(_QWORD *)(v73 + 54) = v100;
      v51 = (uint64_t)v164;
      v52 = 2643;
      goto LABEL_211;
    }
  }
  v19 = *(unsigned __int8 *)(a3 + 61);
  if ((_DWORD)v19 != *(unsigned __int8 *)(a2 + 17))
    goto LABEL_249;
  if (v19 >= 0x14 ? 20 : *(unsigned __int8 *)(a3 + 61))
  {
    if (v19 >= 0x14)
      v19 = 20;
    v21 = v19 - 1;
    v22 = (unsigned __int8 *)(a2 + 18);
    v23 = (unsigned __int8 *)(a3 + 62);
    do
    {
      v25 = *v23++;
      v24 = v25;
      v27 = *v22++;
      v26 = v27;
      v17 = v21-- != 0;
      v28 = v17;
    }
    while (v24 == v26 && (v28 & 1) != 0);
    if (v24 != v26)
    {
LABEL_249:
      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(_QWORD *)(a1 + 1112))
      {
        return;
      }
      v105 = _os_log_pack_size();
      v165 = &v164;
      v106 = MEMORY[0x24BDAC7A8](v105, v105);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v164 = (char *)&v164 - ((v106 + 15) & 0xFFFFFFFFFFFFFFF0);
      v107 = _os_log_pack_fill();
      v108 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v109 = &quic_cid_describe_cid_buf2;
      else
        v109 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v110 = v109;
      else
        v110 = &quic_cid_describe_cid_buf1;
      v111 = ++quic_cid_describe_state;
      v112 = v108[38];
      v113 = 0uLL;
      *(_OWORD *)((char *)v110 + 25) = 0u;
      if (v112 >= 0x14)
        v114 = 20;
      else
        v114 = v112;
      *v110 = 0uLL;
      v110[1] = 0uLL;
      if ((_DWORD)v114)
      {
        v115 = v108 + 39;
        do
        {
          v116 = *v115++;
          snprintf((char *)v110, 0x29uLL, "%s%02x", (const char *)v110, v116);
          --v114;
        }
        while (v114);
        v108 = *(unsigned __int8 **)(a1 + 1112);
        v111 = quic_cid_describe_state;
        v113 = 0uLL;
      }
      if (v111 % 3 == 2)
        v117 = &quic_cid_describe_cid_buf2;
      else
        v117 = &quic_cid_describe_cid_buf3;
      if (v111 % 3)
        v118 = v117;
      else
        v118 = &quic_cid_describe_cid_buf1;
      v119 = v111 + 1;
      quic_cid_describe_state = v119;
      if (v108[17] >= 0x14u)
        v120 = 20;
      else
        v120 = v108[17];
      *v118 = v113;
      v118[1] = v113;
      *(_OWORD *)((char *)v118 + 25) = v113;
      if ((_DWORD)v120)
      {
        v121 = v108 + 18;
        do
        {
          v122 = *v121++;
          snprintf((char *)v118, 0x29uLL, "%s%02x", (const char *)v118, v122);
          --v120;
        }
        while (v120);
        v119 = quic_cid_describe_state;
      }
      v123 = a1 + 976;
      if (v119 % 3 == 2)
        v124 = &quic_cid_describe_cid_buf2;
      else
        v124 = &quic_cid_describe_cid_buf3;
      if (v119 % 3)
        v125 = v124;
      else
        v125 = &quic_cid_describe_cid_buf1;
      v126 = v119 + 1;
      quic_cid_describe_state = v119 + 1;
      if (*(unsigned __int8 *)(a3 + 61) >= 0x14u)
        v127 = 20;
      else
        v127 = *(unsigned __int8 *)(a3 + 61);
      v128 = 0uLL;
      *v125 = 0u;
      v125[1] = 0u;
      *(_OWORD *)((char *)v125 + 25) = 0u;
      if ((_DWORD)v127)
      {
        v129 = v123;
        v130 = (unsigned __int8 *)(a3 + 62);
        do
        {
          v131 = *v130++;
          snprintf((char *)v125, 0x29uLL, "%s%02x", (const char *)v125, v131);
          --v127;
        }
        while (v127);
        v126 = quic_cid_describe_state;
        v123 = v129;
        v128 = 0uLL;
      }
      if (v126 % 3 == 2)
        v132 = &quic_cid_describe_cid_buf2;
      else
        v132 = &quic_cid_describe_cid_buf3;
      if (v126 % 3)
        v133 = v132;
      else
        v133 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v126 + 1;
      if (*(unsigned __int8 *)(a2 + 17) >= 0x14u)
        v134 = 20;
      else
        v134 = *(unsigned __int8 *)(a2 + 17);
      *v133 = v128;
      v133[1] = v128;
      *(_OWORD *)((char *)v133 + 25) = v128;
      if ((_DWORD)v134)
      {
        v135 = (unsigned __int8 *)(a2 + 18);
        do
        {
          v136 = *v135++;
          snprintf((char *)v133, 0x29uLL, "%s%02x", (const char *)v133, v136);
          --v134;
        }
        while (v134);
      }
      *(_DWORD *)v107 = 136447490;
      *(_QWORD *)(v107 + 4) = "quic_conn_process_vn";
      *(_WORD *)(v107 + 12) = 2082;
      *(_QWORD *)(v107 + 14) = v123;
      *(_WORD *)(v107 + 22) = 2082;
      *(_QWORD *)(v107 + 24) = v110;
      *(_WORD *)(v107 + 32) = 2082;
      *(_QWORD *)(v107 + 34) = v118;
      *(_WORD *)(v107 + 42) = 2082;
      *(_QWORD *)(v107 + 44) = v125;
      *(_WORD *)(v107 + 52) = 2082;
      *(_QWORD *)(v107 + 54) = v133;
      v51 = (uint64_t)v164;
      v52 = 2650;
      goto LABEL_211;
    }
  }
  if (!*(_WORD *)(a3 + 94))
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(_QWORD *)(a1 + 1112))
    {
      return;
    }
    v137 = _os_log_pack_size();
    v138 = (char *)&v164 - ((MEMORY[0x24BDAC7A8](v137, v137) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v139 = _os_log_pack_fill();
    v140 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
    v141 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
    *(_DWORD *)v139 = 136446978;
    *(_QWORD *)(v139 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v139 + 12) = 2082;
    *(_QWORD *)(v139 + 14) = a1 + 976;
    *(_WORD *)(v139 + 22) = 2082;
    *(_QWORD *)(v139 + 24) = v140;
    *(_WORD *)(v139 + 32) = 2082;
    *(_QWORD *)(v139 + 34) = v141;
    v51 = (uint64_t)v138;
    v52 = 2654;
    goto LABEL_211;
  }
  if (*(_BYTE *)(a1 + 477) != 6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(_QWORD *)(a1 + 1112))
    {
      return;
    }
    v142 = _os_log_pack_size();
    v143 = (char *)&v164 - ((MEMORY[0x24BDAC7A8](v142, v142) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v144 = _os_log_pack_fill();
    v145 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
    v146 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
    v147 = *(unsigned __int8 *)(a1 + 477);
    *(_DWORD *)v144 = 136447234;
    *(_QWORD *)(v144 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v144 + 12) = 2082;
    *(_QWORD *)(v144 + 14) = a1 + 976;
    *(_WORD *)(v144 + 22) = 2082;
    *(_QWORD *)(v144 + 24) = v145;
    *(_WORD *)(v144 + 32) = 2082;
    *(_QWORD *)(v144 + 34) = v146;
    *(_WORD *)(v144 + 42) = 1024;
    *(_DWORD *)(v144 + 44) = v147;
    v51 = (uint64_t)v143;
    v52 = 2658;
    goto LABEL_211;
  }
  v29 = 0;
  v30 = 0;
  while (1)
  {
    v31 = *(_DWORD *)(*(_QWORD *)(a3 + 96) + 4 * v30);
    v32 = bswap32(v31);
    if (v32 == *(_DWORD *)(a1 + 520))
      break;
    if (v31 == 0x1000000)
    {
      v32 = 1;
LABEL_224:
      quic_fsm_conn_change(a1, 5u);
      *v4 |= 0x10uLL;
      if (*(unsigned __int16 *)(a3 + 94) == v29)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        {
          if (*(_QWORD *)(a1 + 1112))
          {
            v148 = _os_log_pack_size();
            v149 = (char *)&v164 - ((MEMORY[0x24BDAC7A8](v148, v148) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v150 = _os_log_pack_fill();
            v151 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
            v152 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
            *(_DWORD *)v150 = 136446978;
            *(_QWORD *)(v150 + 4) = "quic_conn_process_vn";
            *(_WORD *)(v150 + 12) = 2082;
            *(_QWORD *)(v150 + 14) = a1 + 976;
            *(_WORD *)(v150 + 22) = 2082;
            *(_QWORD *)(v150 + 24) = v151;
            *(_WORD *)(v150 + 32) = 2082;
            *(_QWORD *)(v150 + 34) = v152;
            qlog_internal(16, (uint64_t)v149, 2685);
          }
        }
        *(_QWORD *)(a1 + 1072) = 1;
      }
      else
      {
        quic_path_assign_dcid(a2, a3 + 61, a1);
        *(_DWORD *)(a1 + 524) = v32;
        quic_packet_builder_set_version(*(_QWORD *)(a1 + 560), v32);
        quic_recovery_reset_pn_space(*(_QWORD **)(a1 + 952), 1u);
        quic_recovery_reset_pn_space(*(_QWORD **)(a1 + 952), 2u);
        quic_cc_reset(*(_QWORD *)(a2 + 360));
        v153 = *(_QWORD *)(a2 + 392);
        if (v153)
          quic_pacer_reset(v153);
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          && *(_QWORD *)(a1 + 1112))
        {
          v154 = _os_log_pack_size();
          v155 = (char *)&v164 - ((MEMORY[0x24BDAC7A8](v154, v154) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v156 = _os_log_pack_fill();
          v157 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
          v158 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
          if (v32 == 1)
          {
            v159 = "v1";
          }
          else
          {
            v159 = quic_version_describe_buffer;
            snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", v32);
          }
          *(_DWORD *)v156 = 136447234;
          *(_QWORD *)(v156 + 4) = "quic_conn_process_vn";
          *(_WORD *)(v156 + 12) = 2082;
          *(_QWORD *)(v156 + 14) = a1 + 976;
          *(_WORD *)(v156 + 22) = 2082;
          *(_QWORD *)(v156 + 24) = v157;
          *(_WORD *)(v156 + 32) = 2082;
          *(_QWORD *)(v156 + 34) = v158;
          *(_WORD *)(v156 + 42) = 2082;
          *(_QWORD *)(v156 + 44) = v159;
          qlog_internal(1, (uint64_t)v155, 2700);
        }
        v166 = -1;
        flow_for_key = nw_protocol_instance_get_flow_for_key();
        quic_crypto_tls_start(*(_QWORD *)a1, flow_for_key, *(_DWORD *)v4 & 1);
        quic_fsm_conn_change(a1, 6u);
      }
      return;
    }
    v29 = ++v30;
    if (*(unsigned __int16 *)(a3 + 94) <= v30)
      goto LABEL_224;
  }
}

void quic_conn_failed_decryption(uint64_t a1, uint64_t a2)
{
  int8x16_t *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  _OWORD *v8;
  _OWORD *v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 87) == 16)
  {
    v2 = *(int8x16_t **)(a2 + 16);
    if (*v2 != 0)
    {
      if (quic_cid_array_find_by_srt(*(unsigned __int8 **)(a1 + 384), v2))
      {
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && *(_QWORD *)(a1 + 1112))
        {
          v4 = _os_log_pack_size();
          v24 = &v22;
          v5 = (char *)&v22 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v6 = _os_log_pack_fill();
          v23 = a1 + 976;
          v7 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v8 = &quic_cid_describe_cid_buf2;
          else
            v8 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v9 = v8;
          else
            v9 = &quic_cid_describe_cid_buf1;
          v10 = ++quic_cid_describe_state;
          v11 = v7[38];
          v12 = 0uLL;
          *(_OWORD *)((char *)v9 + 25) = 0u;
          if (v11 >= 0x14)
            v13 = 20;
          else
            v13 = v11;
          *v9 = 0uLL;
          v9[1] = 0uLL;
          if ((_DWORD)v13)
          {
            v14 = v7 + 39;
            do
            {
              v15 = *v14++;
              snprintf((char *)v9, 0x29uLL, "%s%02x", (const char *)v9, v15);
              --v13;
            }
            while (v13);
            v7 = *(unsigned __int8 **)(a1 + 1112);
            v10 = quic_cid_describe_state;
            v12 = 0uLL;
          }
          if (v10 % 3 == 2)
            v16 = &quic_cid_describe_cid_buf2;
          else
            v16 = &quic_cid_describe_cid_buf3;
          if (v10 % 3)
            v17 = v16;
          else
            v17 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v10 + 1;
          if (v7[17] >= 0x14u)
            v18 = 20;
          else
            v18 = v7[17];
          *v17 = v12;
          v17[1] = v12;
          *(_OWORD *)((char *)v17 + 25) = v12;
          if ((_DWORD)v18)
          {
            v19 = v7 + 18;
            do
            {
              v20 = *v19++;
              snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v20);
              --v18;
            }
            while (v18);
          }
          *(_DWORD *)v6 = 136446978;
          *(_QWORD *)(v6 + 4) = "quic_conn_failed_decryption";
          *(_WORD *)(v6 + 12) = 2082;
          *(_QWORD *)(v6 + 14) = v23;
          *(_WORD *)(v6 + 22) = 2082;
          *(_QWORD *)(v6 + 24) = v9;
          *(_WORD *)(v6 + 32) = 2082;
          *(_QWORD *)(v6 + 34) = v17;
          qlog_internal(0, (uint64_t)v5, 2953);
        }
        v21 = *(void **)(a1 + 1104);
        if (v21)
        {
          nw_release(v21);
          *(_QWORD *)(a1 + 1104) = 0;
        }
        *(_QWORD *)(a1 + 1104) = nw_error_create_posix_error();
        quic_conn_drain(a1);
      }
    }
  }
}

void quic_conn_process_retry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  unsigned int v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  _OWORD *v12;
  _OWORD *v13;
  int v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unsigned __int8 *v29;
  _OWORD *v30;
  _OWORD *v31;
  int v32;
  unsigned int v33;
  __int128 v34;
  uint64_t v35;
  unsigned __int8 *v36;
  int v37;
  _OWORD *v38;
  _OWORD *v39;
  uint64_t v40;
  unsigned __int8 *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  unsigned __int8 *v48;
  _OWORD *v49;
  _OWORD *v50;
  int v51;
  unsigned int v52;
  __int128 v53;
  uint64_t v54;
  unsigned __int8 *v55;
  int v56;
  _OWORD *v57;
  _OWORD *v58;
  uint64_t v59;
  unsigned __int8 *v60;
  int v61;
  int *v63;
  unsigned __int8 *v64;
  size_t v65;
  unsigned __int8 *v66;
  unint64_t v67;
  unint64_t v69;
  unsigned __int8 *v70;
  unsigned __int8 *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  BOOL v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  int v85;
  uint64_t flow_for_key;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unsigned __int8 *v90;
  _OWORD *v91;
  _OWORD *v92;
  int v93;
  unsigned int v94;
  __int128 v95;
  uint64_t v96;
  unsigned __int8 *v97;
  int v98;
  _OWORD *v99;
  _OWORD *v100;
  uint64_t v101;
  unsigned __int8 *v102;
  int v103;
  int v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  void *v129[3];

  v129[2] = *(void **)MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = (_QWORD *)(a1 + 1380);
    v5 = *(_QWORD *)(a1 + 1380);
    if ((v5 & 1) != 0)
    {
      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(_QWORD *)(a1 + 1112))
      {
        return;
      }
      v26 = _os_log_pack_size();
      v128 = &v126;
      v27 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v28 = _os_log_pack_fill();
      v127 = a1 + 976;
      v29 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v30 = &quic_cid_describe_cid_buf2;
      else
        v30 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v31 = v30;
      else
        v31 = &quic_cid_describe_cid_buf1;
      v32 = ++quic_cid_describe_state;
      v33 = v29[38];
      v34 = 0uLL;
      *(_OWORD *)((char *)v31 + 25) = 0u;
      if (v33 >= 0x14)
        v35 = 20;
      else
        v35 = v33;
      *v31 = 0uLL;
      v31[1] = 0uLL;
      if ((_DWORD)v35)
      {
        v36 = v29 + 39;
        do
        {
          v37 = *v36++;
          snprintf((char *)v31, 0x29uLL, "%s%02x", (const char *)v31, v37);
          --v35;
        }
        while (v35);
        v29 = *(unsigned __int8 **)(a1 + 1112);
        v32 = quic_cid_describe_state;
        v34 = 0uLL;
      }
      if (v32 % 3 == 2)
        v38 = &quic_cid_describe_cid_buf2;
      else
        v38 = &quic_cid_describe_cid_buf3;
      if (v32 % 3)
        v39 = v38;
      else
        v39 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v32 + 1;
      if (v29[17] >= 0x14u)
        v40 = 20;
      else
        v40 = v29[17];
      *v39 = v34;
      v39[1] = v34;
      *(_OWORD *)((char *)v39 + 25) = v34;
      if ((_DWORD)v40)
      {
        v41 = v29 + 18;
        do
        {
          v42 = *v41++;
          snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v42);
          --v40;
        }
        while (v40);
      }
      *(_DWORD *)v28 = 136446978;
      *(_QWORD *)(v28 + 4) = "quic_conn_process_retry";
      *(_WORD *)(v28 + 12) = 2082;
      *(_QWORD *)(v28 + 14) = v127;
      *(_WORD *)(v28 + 22) = 2082;
      *(_QWORD *)(v28 + 24) = v31;
      *(_WORD *)(v28 + 32) = 2082;
      *(_QWORD *)(v28 + 34) = v39;
      v43 = (uint64_t)v27;
      v44 = 2751;
    }
    else
    {
      v7 = *(unsigned __int16 *)(a3 + 94);
      if (*(_WORD *)(a3 + 94))
      {
        if (v7 >= 0x3E9)
        {
          if ((qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
            && *(_QWORD *)(a1 + 1112))
          {
            v8 = _os_log_pack_size();
            v9 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v10 = _os_log_pack_fill();
            v128 = (uint64_t *)(a1 + 976);
            v11 = *(unsigned __int8 **)(a1 + 1112);
            if (quic_cid_describe_state % 3 == 2)
              v12 = &quic_cid_describe_cid_buf2;
            else
              v12 = &quic_cid_describe_cid_buf3;
            if (quic_cid_describe_state % 3)
              v13 = v12;
            else
              v13 = &quic_cid_describe_cid_buf1;
            v14 = ++quic_cid_describe_state;
            v15 = v11[38];
            v16 = 0uLL;
            *(_OWORD *)((char *)v13 + 25) = 0u;
            if (v15 >= 0x14)
              v17 = 20;
            else
              v17 = v15;
            *v13 = 0uLL;
            v13[1] = 0uLL;
            if ((_DWORD)v17)
            {
              v18 = v11 + 39;
              do
              {
                v19 = *v18++;
                snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
                --v17;
              }
              while (v17);
              v11 = *(unsigned __int8 **)(a1 + 1112);
              v14 = quic_cid_describe_state;
              v16 = 0uLL;
            }
            if (v14 % 3 == 2)
              v20 = &quic_cid_describe_cid_buf2;
            else
              v20 = &quic_cid_describe_cid_buf3;
            if (v14 % 3)
              v21 = v20;
            else
              v21 = &quic_cid_describe_cid_buf1;
            quic_cid_describe_state = v14 + 1;
            if (v11[17] >= 0x14u)
              v22 = 20;
            else
              v22 = v11[17];
            *v21 = v16;
            v21[1] = v16;
            *(_OWORD *)((char *)v21 + 25) = v16;
            if ((_DWORD)v22)
            {
              v23 = v11 + 18;
              do
              {
                v24 = *v23++;
                snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
                --v22;
              }
              while (v22);
            }
            v25 = *(unsigned __int16 *)(a3 + 94);
            *(_DWORD *)v10 = 136447234;
            *(_QWORD *)(v10 + 4) = "quic_conn_process_retry";
            *(_WORD *)(v10 + 12) = 2082;
            *(_QWORD *)(v10 + 14) = v128;
            *(_WORD *)(v10 + 22) = 2082;
            *(_QWORD *)(v10 + 24) = v13;
            *(_WORD *)(v10 + 32) = 2082;
            *(_QWORD *)(v10 + 34) = v21;
            *(_WORD *)(v10 + 42) = 1024;
            *(_DWORD *)(v10 + 44) = v25;
            qlog_internal(16, (uint64_t)v9, 2762);
          }
          return;
        }
        if (*(_BYTE *)(a1 + 477) == 6)
        {
          if ((v5 & 0x20) != 0)
          {
            if (!qlog_debug_enabled
              && (qlog_nwlog_enabled & 1) == 0
              && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
              || !*(_QWORD *)(a1 + 1112))
            {
              return;
            }
            v105 = _os_log_pack_size();
            v106 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v105, v105) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v107 = _os_log_pack_fill();
            v108 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
            v109 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
            *(_DWORD *)v107 = 136446978;
            *(_QWORD *)(v107 + 4) = "quic_conn_process_retry";
            *(_WORD *)(v107 + 12) = 2082;
            *(_QWORD *)(v107 + 14) = a1 + 976;
            *(_WORD *)(v107 + 22) = 2082;
            *(_QWORD *)(v107 + 24) = v108;
            *(_WORD *)(v107 + 32) = 2082;
            *(_QWORD *)(v107 + 34) = v109;
            v43 = (uint64_t)v106;
            v44 = 2775;
          }
          else
          {
            v63 = *(int **)a3;
            v129[0] = 0;
            v64 = (unsigned __int8 *)(a3 + 40);
            v65 = quic_crypto_build_pseudo_retry((unsigned __int8 *)(a2 + 17), v63, (unsigned __int8 *)(a3 + 40), (unsigned __int8 *)(a3 + 61), *(const void **)(a3 + 96), v7, v129);
            if (quic_protector_open_retry((uint64_t)v129[0], v65, *(_QWORD *)(a3 + 16)))
            {
              if (v129[0])
              {
                free(v129[0]);
                v129[0] = 0;
              }
              v66 = (unsigned __int8 *)(a2 + 38);
              v67 = *v64;
              if ((_DWORD)v67 != *(unsigned __int8 *)(a2 + 38))
                goto LABEL_175;
              if (!(v67 >= 0x14 ? 20 : *v64))
                goto LABEL_114;
              if (v67 >= 0x14)
                v67 = 20;
              v69 = v67 - 1;
              v70 = (unsigned __int8 *)(a2 + 39);
              v71 = (unsigned __int8 *)(a3 + 41);
              do
              {
                v73 = *v71++;
                v72 = v73;
                v75 = *v70++;
                v74 = v75;
                v77 = v69-- != 0;
              }
              while (v72 == v74 && v77);
              if (v72 == v74)
              {
LABEL_114:
                quic_fsm_conn_change(a1, 7u);
                *v4 |= 0x20uLL;
                *(_BYTE *)(a1 + 392) = *(_BYTE *)(a3 + 61);
                v78 = *(_DWORD *)(a3 + 78);
                *(_OWORD *)(a1 + 393) = *(_OWORD *)(a3 + 62);
                *(_DWORD *)(a1 + 409) = v78;
                quic_path_assign_dcid(a2, a3 + 61, a1);
                quic_packet_builder_set_initial_token(*(_QWORD *)(a1 + 560), *(unsigned __int16 *)(a3 + 94), *(const void **)(a3 + 96));
                quic_recovery_reset_pn_space(*(_QWORD **)(a1 + 952), 1u);
                quic_recovery_reset_pn_space(*(_QWORD **)(a1 + 952), 2u);
                quic_cc_reset(*(_QWORD *)(a2 + 360));
                v79 = *(_QWORD *)(a2 + 392);
                if (v79)
                  quic_pacer_reset(v79);
                if ((qlog_debug_enabled
                   || (qlog_nwlog_enabled & 1) != 0
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
                  && *(_QWORD *)(a1 + 1112))
                {
                  v80 = _os_log_pack_size();
                  v81 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v80, v80) + 15) & 0xFFFFFFFFFFFFFFF0);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  v82 = _os_log_pack_fill();
                  v83 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
                  v84 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
                  v85 = *(unsigned __int16 *)(a3 + 94);
                  *(_DWORD *)v82 = 136447234;
                  *(_QWORD *)(v82 + 4) = "quic_conn_process_retry";
                  *(_WORD *)(v82 + 12) = 2082;
                  *(_QWORD *)(v82 + 14) = a1 + 976;
                  *(_WORD *)(v82 + 22) = 2082;
                  *(_QWORD *)(v82 + 24) = v83;
                  *(_WORD *)(v82 + 32) = 2082;
                  *(_QWORD *)(v82 + 34) = v84;
                  *(_WORD *)(v82 + 42) = 1024;
                  *(_DWORD *)(v82 + 44) = v85;
                  qlog_internal(1, (uint64_t)v81, 2815);
                }
                v129[1] = (void *)-1;
                flow_for_key = nw_protocol_instance_get_flow_for_key();
                nw_protocol_instance_access_flow_state();
                quic_crypto_tls_start(*(_QWORD *)a1, flow_for_key, *(_DWORD *)v4 & 1);
                quic_fsm_conn_change(a1, 6u);
              }
              else
              {
LABEL_175:
                if ((qlog_debug_enabled
                   || (qlog_nwlog_enabled & 1) != 0
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
                  && *(_QWORD *)(a1 + 1112))
                {
                  v115 = _os_log_pack_size();
                  v116 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v115, v115) + 15) & 0xFFFFFFFFFFFFFFF0);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  v117 = _os_log_pack_fill();
                  v118 = a1 + 976;
                  v119 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
                  v120 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
                  v121 = quic_cid_describe(v64);
                  v122 = quic_cid_describe(v66);
                  *(_DWORD *)v117 = 136447490;
                  *(_QWORD *)(v117 + 4) = "quic_conn_process_retry";
                  *(_WORD *)(v117 + 12) = 2082;
                  *(_QWORD *)(v117 + 14) = v118;
                  *(_WORD *)(v117 + 22) = 2082;
                  *(_QWORD *)(v117 + 24) = v119;
                  *(_WORD *)(v117 + 32) = 2082;
                  *(_QWORD *)(v117 + 34) = v120;
                  *(_WORD *)(v117 + 42) = 2082;
                  *(_QWORD *)(v117 + 44) = v121;
                  *(_WORD *)(v117 + 52) = 2082;
                  *(_QWORD *)(v117 + 54) = v122;
                  qlog_internal(16, (uint64_t)v116, 2793);
                }
              }
              return;
            }
            if (!qlog_debug_enabled
              && (qlog_nwlog_enabled & 1) == 0
              && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
              || !*(_QWORD *)(a1 + 1112))
            {
              return;
            }
            v110 = _os_log_pack_size();
            v111 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v110, v110) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v112 = _os_log_pack_fill();
            v113 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
            v114 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
            *(_DWORD *)v112 = 136446978;
            *(_QWORD *)(v112 + 4) = "quic_conn_process_retry";
            *(_WORD *)(v112 + 12) = 2082;
            *(_QWORD *)(v112 + 14) = a1 + 976;
            *(_WORD *)(v112 + 22) = 2082;
            *(_QWORD *)(v112 + 24) = v113;
            *(_WORD *)(v112 + 32) = 2082;
            *(_QWORD *)(v112 + 34) = v114;
            v43 = (uint64_t)v111;
            v44 = 2785;
          }
        }
        else
        {
          if (!qlog_debug_enabled
            && (qlog_nwlog_enabled & 1) == 0
            && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
            || !*(_QWORD *)(a1 + 1112))
          {
            return;
          }
          v87 = _os_log_pack_size();
          v128 = &v126;
          v88 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v87, v87) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v89 = _os_log_pack_fill();
          v127 = a1 + 976;
          v90 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v91 = &quic_cid_describe_cid_buf2;
          else
            v91 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v92 = v91;
          else
            v92 = &quic_cid_describe_cid_buf1;
          v93 = ++quic_cid_describe_state;
          v94 = v90[38];
          v95 = 0uLL;
          *(_OWORD *)((char *)v92 + 25) = 0u;
          if (v94 >= 0x14)
            v96 = 20;
          else
            v96 = v94;
          *v92 = 0uLL;
          v92[1] = 0uLL;
          if ((_DWORD)v96)
          {
            v97 = v90 + 39;
            do
            {
              v98 = *v97++;
              snprintf((char *)v92, 0x29uLL, "%s%02x", (const char *)v92, v98);
              --v96;
            }
            while (v96);
            v90 = *(unsigned __int8 **)(a1 + 1112);
            v93 = quic_cid_describe_state;
            v95 = 0uLL;
          }
          if (v93 % 3 == 2)
            v99 = &quic_cid_describe_cid_buf2;
          else
            v99 = &quic_cid_describe_cid_buf3;
          if (v93 % 3)
            v100 = v99;
          else
            v100 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v93 + 1;
          if (v90[17] >= 0x14u)
            v101 = 20;
          else
            v101 = v90[17];
          *v100 = v95;
          v100[1] = v95;
          *(_OWORD *)((char *)v100 + 25) = v95;
          if ((_DWORD)v101)
          {
            v102 = v90 + 18;
            do
            {
              v103 = *v102++;
              snprintf((char *)v100, 0x29uLL, "%s%02x", (const char *)v100, v103);
              --v101;
            }
            while (v101);
          }
          v104 = *(unsigned __int8 *)(a1 + 477);
          *(_DWORD *)v89 = 136447234;
          *(_QWORD *)(v89 + 4) = "quic_conn_process_retry";
          *(_WORD *)(v89 + 12) = 2082;
          *(_QWORD *)(v89 + 14) = v127;
          *(_WORD *)(v89 + 22) = 2082;
          *(_QWORD *)(v89 + 24) = v92;
          *(_WORD *)(v89 + 32) = 2082;
          *(_QWORD *)(v89 + 34) = v100;
          *(_WORD *)(v89 + 42) = 1024;
          *(_DWORD *)(v89 + 44) = v104;
          v43 = (uint64_t)v88;
          v44 = 2766;
        }
      }
      else
      {
        if (!qlog_debug_enabled
          && (qlog_nwlog_enabled & 1) == 0
          && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
          || !*(_QWORD *)(a1 + 1112))
        {
          return;
        }
        v45 = _os_log_pack_size();
        v128 = &v126;
        v46 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v47 = _os_log_pack_fill();
        v127 = a1 + 976;
        v48 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2)
          v49 = &quic_cid_describe_cid_buf2;
        else
          v49 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v50 = v49;
        else
          v50 = &quic_cid_describe_cid_buf1;
        v51 = ++quic_cid_describe_state;
        v52 = v48[38];
        v53 = 0uLL;
        *(_OWORD *)((char *)v50 + 25) = 0u;
        if (v52 >= 0x14)
          v54 = 20;
        else
          v54 = v52;
        *v50 = 0uLL;
        v50[1] = 0uLL;
        if ((_DWORD)v54)
        {
          v55 = v48 + 39;
          do
          {
            v56 = *v55++;
            snprintf((char *)v50, 0x29uLL, "%s%02x", (const char *)v50, v56);
            --v54;
          }
          while (v54);
          v48 = *(unsigned __int8 **)(a1 + 1112);
          v51 = quic_cid_describe_state;
          v53 = 0uLL;
        }
        if (v51 % 3 == 2)
          v57 = &quic_cid_describe_cid_buf2;
        else
          v57 = &quic_cid_describe_cid_buf3;
        if (v51 % 3)
          v58 = v57;
        else
          v58 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v51 + 1;
        if (v48[17] >= 0x14u)
          v59 = 20;
        else
          v59 = v48[17];
        *v58 = v53;
        v58[1] = v53;
        *(_OWORD *)((char *)v58 + 25) = v53;
        if ((_DWORD)v59)
        {
          v60 = v48 + 18;
          do
          {
            v61 = *v60++;
            snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v61);
            --v59;
          }
          while (v59);
        }
        *(_DWORD *)v47 = 136446978;
        *(_QWORD *)(v47 + 4) = "quic_conn_process_retry";
        *(_WORD *)(v47 + 12) = 2082;
        *(_QWORD *)(v47 + 14) = v127;
        *(_WORD *)(v47 + 22) = 2082;
        *(_QWORD *)(v47 + 24) = v50;
        *(_WORD *)(v47 + 32) = 2082;
        *(_QWORD *)(v47 + 34) = v58;
        v43 = (uint64_t)v46;
        v44 = 2756;
      }
    }
    qlog_internal(16, v43, v44);
    return;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v123 = _os_log_pack_size();
    v124 = (char *)&v126 - ((MEMORY[0x24BDAC7A8](v123, v123) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v125 = _os_log_pack_fill();
    *(_DWORD *)v125 = 136446210;
    *(_QWORD *)(v125 + 4) = "quic_conn_process_retry";
    qlog_internal(17, (uint64_t)v124, 2745);
  }
}

void quic_conn_migrate_to_path(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  __int16 v8;
  BOOL v9;
  _BYTE *v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  _OWORD *v19;
  _OWORD *v20;
  int v21;
  unsigned int v22;
  __int128 v23;
  uint64_t v24;
  unsigned __int8 *v25;
  int v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  unsigned __int8 *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unsigned __int8 *v37;
  _OWORD *v38;
  _OWORD *v39;
  int v40;
  unsigned int v41;
  __int128 v42;
  uint64_t v43;
  unsigned __int8 *v44;
  int v45;
  _OWORD *v46;
  _OWORD *v47;
  uint64_t v48;
  unsigned __int8 *v49;
  int v50;
  uint64_t v51;
  uint64_t stats_region;
  void *v53;
  uint64_t stats;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t frame_pool;
  _QWORD *v72;
  uint64_t path;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  _OWORD *v80;
  _OWORD *v81;
  uint64_t v82;
  unsigned __int8 *v83;
  int v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  int v91;
  uint64_t *v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 1112);
    v7 = (unsigned __int8 *)(a2 + 17);
    v8 = *(_WORD *)(a2 + 431);
    if (*(_BYTE *)(a2 + 17))
      v9 = (v8 & 0x800) == 0;
    else
      v9 = 0;
    if (!v9)
    {
LABEL_9:
      *(_QWORD *)(a1 + 1112) = a2;
      *((_WORD *)v7 + 207) = *(_BYTE *)(a1 + 1381) & 0x20 | *((_WORD *)v7 + 207) & 0xFFDF;
      quic_conn_set_mss(a1, a2, *(unsigned __int16 *)(a1 + 596));
      v11 = *(_QWORD *)(a2 + 392);
      if (v11)
        quic_pacer_reset(v11);
      v12 = (_QWORD *)(a1 + 1380);
      quic_recovery_reset_timer(*(_QWORD *)(a1 + 952));
      quic_conn_setup_pmtud(a1, a2, *MEMORY[0x24BDE0890], 0);
      v13 = 0x2545F5000uLL;
      v14 = 0x2545F5000uLL;
      if ((v8 & 0x100) != 0)
      {
        if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && *(_QWORD *)(a1 + 1112))
        {
          v91 = a3;
          v34 = _os_log_pack_size();
          v90 = &v88;
          v35 = (char *)&v88 - ((MEMORY[0x24BDAC7A8](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v36 = _os_log_pack_fill();
          v89 = a1 + 976;
          v37 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v38 = &quic_cid_describe_cid_buf2;
          else
            v38 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v39 = v38;
          else
            v39 = &quic_cid_describe_cid_buf1;
          v40 = ++quic_cid_describe_state;
          v41 = v37[38];
          v42 = 0uLL;
          *(_OWORD *)((char *)v39 + 25) = 0u;
          if (v41 >= 0x14)
            v43 = 20;
          else
            v43 = v41;
          *v39 = 0uLL;
          v39[1] = 0uLL;
          v92 = (uint64_t *)v6;
          if ((_DWORD)v43)
          {
            v44 = v37 + 39;
            do
            {
              v45 = *v44++;
              snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v45);
              --v43;
            }
            while (v43);
            v37 = *(unsigned __int8 **)(a1 + 1112);
            v40 = quic_cid_describe_state;
            v42 = 0uLL;
          }
          if (v40 % 3 == 2)
            v46 = &quic_cid_describe_cid_buf2;
          else
            v46 = &quic_cid_describe_cid_buf3;
          if (v40 % 3)
            v47 = v46;
          else
            v47 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v40 + 1;
          if (v37[17] >= 0x14u)
            v48 = 20;
          else
            v48 = v37[17];
          *v47 = v42;
          v47[1] = v42;
          *(_OWORD *)((char *)v47 + 25) = v42;
          if ((_DWORD)v48)
          {
            v49 = v37 + 18;
            do
            {
              v50 = *v49++;
              snprintf((char *)v47, 0x29uLL, "%s%02x", (const char *)v47, v50);
              --v48;
            }
            while (v48);
          }
          v51 = *(_QWORD *)a2;
          *(_DWORD *)v36 = 136447490;
          *(_QWORD *)(v36 + 4) = "quic_conn_migrate_to_path";
          *(_WORD *)(v36 + 12) = 2082;
          *(_QWORD *)(v36 + 14) = v89;
          *(_WORD *)(v36 + 22) = 2082;
          *(_QWORD *)(v36 + 24) = v39;
          *(_WORD *)(v36 + 32) = 2082;
          *(_QWORD *)(v36 + 34) = v47;
          *(_WORD *)(v36 + 42) = 2082;
          *(_QWORD *)(v36 + 44) = a2 + 280;
          *(_WORD *)(v36 + 52) = 2048;
          *(_QWORD *)(v36 + 54) = v51;
          qlog_internal(0, (uint64_t)v35, 5065);
          v6 = (uint64_t)v92;
          a3 = v91;
          v13 = 0x2545F5000uLL;
          v14 = 0x2545F5000uLL;
        }
        if (quic_path_is_initial(v6))
          quic_path_fsm_change(v6, 1u);
      }
      else if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
             && *(_QWORD *)(a1 + 1112))
      {
        v91 = a3;
        v92 = (uint64_t *)v6;
        v15 = _os_log_pack_size();
        v90 = &v88;
        v16 = (char *)&v88 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v17 = _os_log_pack_fill();
        v89 = a1 + 976;
        v18 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2)
          v19 = &quic_cid_describe_cid_buf2;
        else
          v19 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v20 = v19;
        else
          v20 = &quic_cid_describe_cid_buf1;
        v21 = ++quic_cid_describe_state;
        v22 = v18[38];
        v23 = 0uLL;
        *(_OWORD *)((char *)v20 + 25) = 0u;
        if (v22 >= 0x14)
          v24 = 20;
        else
          v24 = v22;
        *v20 = 0uLL;
        v20[1] = 0uLL;
        if ((_DWORD)v24)
        {
          v25 = v18 + 39;
          do
          {
            v26 = *v25++;
            snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v26);
            --v24;
          }
          while (v24);
          v18 = *(unsigned __int8 **)(a1 + 1112);
          v21 = quic_cid_describe_state;
          v23 = 0uLL;
        }
        if (v21 % 3 == 2)
          v27 = &quic_cid_describe_cid_buf2;
        else
          v27 = &quic_cid_describe_cid_buf3;
        if (v21 % 3)
          v28 = v27;
        else
          v28 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v21 + 1;
        if (v18[17] >= 0x14u)
          v29 = 20;
        else
          v29 = v18[17];
        *v28 = v23;
        v28[1] = v23;
        *(_OWORD *)((char *)v28 + 25) = v23;
        if ((_DWORD)v29)
        {
          v30 = v18 + 18;
          do
          {
            v31 = *v30++;
            snprintf((char *)v28, 0x29uLL, "%s%02x", (const char *)v28, v31);
            --v29;
          }
          while (v29);
        }
        v6 = (uint64_t)v92;
        v32 = *v92;
        v33 = *(_QWORD *)a2;
        *(_DWORD *)v17 = 136448002;
        *(_QWORD *)(v17 + 4) = "quic_conn_migrate_to_path";
        *(_WORD *)(v17 + 12) = 2082;
        *(_QWORD *)(v17 + 14) = v89;
        *(_WORD *)(v17 + 22) = 2082;
        *(_QWORD *)(v17 + 24) = v20;
        *(_WORD *)(v17 + 32) = 2082;
        *(_QWORD *)(v17 + 34) = v28;
        *(_WORD *)(v17 + 42) = 2082;
        *(_QWORD *)(v17 + 44) = v6 + 280;
        *(_WORD *)(v17 + 52) = 2048;
        *(_QWORD *)(v17 + 54) = v32;
        *(_WORD *)(v17 + 62) = 2082;
        *(_QWORD *)(v17 + 64) = a2 + 280;
        *(_WORD *)(v17 + 72) = 2048;
        *(_QWORD *)(v17 + 74) = v33;
        qlog_internal(0, (uint64_t)v16, 5082);
        a3 = v91;
        v13 = 0x2545F5000;
        v14 = 0x2545F5000;
      }
      nw_protocol_instance_set_current_path();
      *v12 &= ~0x80000uLL;
      quic_ecn_reset(*(_QWORD *)(a1 + 968), a2);
      stats_region = nw_protocol_instance_get_stats_region();
      v53 = &g_quic_stats;
      if (stats_region)
        v53 = (void *)stats_region;
      *(_QWORD *)(a1 + 1312) = v53;
      stats = nw_protocol_instance_get_stats();
      *(_QWORD *)(a1 + 1304) = stats;
      if (stats)
      {
        *(_QWORD *)(stats + 16) = *(_QWORD *)(a1 + 1144);
        v55 = *(_QWORD *)(a1 + 1304);
        if (v55)
        {
          *(_QWORD *)(v55 + 24) = *(_QWORD *)(a1 + 1152);
          v56 = *(_QWORD *)(a1 + 1304);
          if (v56)
          {
            *(_QWORD *)(v56 + 32) = *(_QWORD *)(a1 + 1160);
            v57 = *(_QWORD *)(a1 + 1304);
            if (v57)
            {
              *(_QWORD *)(v57 + 40) = *(_QWORD *)(a1 + 1168);
              v58 = *(_QWORD *)(a1 + 1304);
              if (v58)
              {
                *(_DWORD *)(v58 + 48) = *(_DWORD *)(a1 + 1176);
                v59 = *(_QWORD *)(a1 + 1304);
                if (v59)
                {
                  *(_DWORD *)(v59 + 52) = *(_DWORD *)(a1 + 1180);
                  v60 = *(_QWORD *)(a1 + 1304);
                  if (v60)
                  {
                    *(_DWORD *)(v60 + 56) = *(_DWORD *)(a1 + 1188);
                    v61 = *(_QWORD *)(a1 + 1304);
                    if (v61)
                    {
                      *(_DWORD *)(v61 + 60) = *(_DWORD *)(a1 + 1192);
                      v62 = *(_QWORD *)(a1 + 1304);
                      if (v62)
                      {
                        *(_DWORD *)(v62 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                        v63 = *(_QWORD *)(a1 + 1304);
                        if (v63)
                          *(_DWORD *)(v63 + 124) = *(unsigned __int8 *)(a1 + 477);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v64 = *(_QWORD *)(a1 + 1112);
      if (v64 && quic_rtt_has_initial_measurement(*(_QWORD *)(v64 + 272)))
      {
        v65 = *(_QWORD *)(a1 + 1304);
        if (!v65)
          goto LABEL_93;
        *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 68) = (unint64_t)((4
                                                                       * (quic_rtt_get_min_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
        v65 = *(_QWORD *)(a1 + 1304);
        if (!v65)
          goto LABEL_93;
        *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 72) = (unint64_t)((4
                                                                       * (quic_rtt_get_smoothed_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
        v65 = *(_QWORD *)(a1 + 1304);
        if (!v65)
          goto LABEL_93;
        *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 76) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      }
      v65 = *(_QWORD *)(a1 + 1304);
      if (v65)
      {
        *(_OWORD *)(v65 + 128) = *(_OWORD *)(a1 + 1288);
        v65 = *(_QWORD *)(a1 + 1304);
      }
LABEL_93:
      if ((*(_BYTE *)(a1 + 1381) & 2) != 0)
      {
        if (v65)
        {
          v66 = *(_DWORD *)(v65 + 116) | 1;
          goto LABEL_98;
        }
      }
      else if (v65)
      {
        v66 = *(_DWORD *)(v65 + 116) & 0xFFFFFFFE;
LABEL_98:
        *(_DWORD *)(v65 + 116) = v66;
        v67 = *(_QWORD *)(a1 + 1304);
        if (v67)
        {
          *(_BYTE *)(v67 + 144) |= (*(_DWORD *)v12 & 0x200000) != 0;
          v68 = *(_QWORD *)(a1 + 1304);
          if (v68)
          {
            *(_BYTE *)(v68 + 144) |= (*(_DWORD *)v12 >> 22) & 2;
            v69 = *(_QWORD *)(a1 + 1304);
            if (v69)
              *(_BYTE *)(v69 + 144) |= (*(_DWORD *)v12 >> 19) & 8;
          }
        }
      }
      if (a3)
        nw_protocol_instance_assert_fallback_agent();
      else
        nw_protocol_instance_unassert_fallback_agent();
      ++*(_DWORD *)(a1 + 1244);
      if ((*(_BYTE *)v12 & 1) == 0)
      {
        v70 = *(_QWORD *)(a1 + 560);
        frame_pool = quic_packet_builder_get_frame_pool(v70);
        v72 = quic_frame_create(frame_pool, 1);
        *((_WORD *)v72 + 4) = 1;
        *((_BYTE *)v72 + 120) &= 0xF9u;
        quic_packet_builder_append_for_pn_space(v70, (uint64_t)v72, 3u);
        path = quic_conn_select_next_path((_QWORD *)a1, (uint64_t)&__block_literal_global_98);
        quic_conn_send_internal(a1, path, 0);
      }
      if ((*(_WORD *)(v6 + 431) & 0x80) != 0)
      {
        if (*(_BYTE *)(v13 + 3232)
          || (*(_BYTE *)(v14 + 3233) & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          v74 = _os_log_pack_size();
          v75 = (char *)&v88 - ((MEMORY[0x24BDAC7A8](v74, v74) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v76 = _os_log_pack_fill();
          *(_DWORD *)v76 = 136446466;
          *(_QWORD *)(v76 + 4) = "quic_conn_migrate_to_path";
          *(_WORD *)(v76 + 12) = 2048;
          *(_QWORD *)(v76 + 14) = v6;
          qlog_internal(2, (uint64_t)v75, 5102);
        }
        _quic_path_destroy(a1 + 1360, (_QWORD *)a1, (_QWORD *)v6);
      }
      return;
    }
    v10 = (_BYTE *)quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 384), (_BYTE *)(a2 + 17));
    if (v10)
    {
      *(_BYTE *)(a1 + 476) = *v10;
      goto LABEL_9;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v77 = _os_log_pack_size();
      v78 = (char *)&v88 - ((MEMORY[0x24BDAC7A8](v77, v77) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v79 = _os_log_pack_fill();
      v80 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3 == 2)
        v80 = &quic_cid_describe_cid_buf2;
      if (quic_cid_describe_state % 3)
        v81 = v80;
      else
        v81 = &quic_cid_describe_cid_buf1;
      ++quic_cid_describe_state;
      if (*v7 >= 0x14u)
        v82 = 20;
      else
        v82 = *v7;
      *v81 = 0u;
      v81[1] = 0u;
      *(_OWORD *)((char *)v81 + 25) = 0u;
      if ((_DWORD)v82)
      {
        v83 = (unsigned __int8 *)(a2 + 18);
        do
        {
          v84 = *v83++;
          snprintf((char *)v81, 0x29uLL, "%s%02x", (const char *)v81, v84);
          --v82;
        }
        while (v82);
      }
      *(_DWORD *)v79 = 136446466;
      *(_QWORD *)(v79 + 4) = "quic_conn_migrate_to_path";
      *(_WORD *)(v79 + 12) = 2082;
      *(_QWORD *)(v79 + 14) = v81;
      qlog_internal(17, (uint64_t)v78, 5040);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v85 = _os_log_pack_size();
    v86 = (char *)&v88 - ((MEMORY[0x24BDAC7A8](v85, v85) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v87 = _os_log_pack_fill();
    *(_DWORD *)v87 = 136446210;
    *(_QWORD *)(v87 + 4) = "quic_conn_migrate_to_path";
    qlog_internal(17, (uint64_t)v86, 5029);
  }
}

BOOL quic_conn_unknown_dcid(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;
  char v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  _OWORD *v23;
  _OWORD *v24;
  int v25;
  unsigned int v26;
  __int128 v27;
  uint64_t v28;
  unsigned __int8 *v29;
  int v30;
  uint64_t v31;
  _OWORD *v32;
  _OWORD *v33;
  uint64_t v34;
  unsigned __int8 *v35;
  int v36;
  const char *v37;
  _OWORD *v38;
  _OWORD *v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  unsigned __int8 *v43;
  int v44;
  char v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unsigned __int8 *v49;
  _OWORD *v50;
  _OWORD *v51;
  int v52;
  unsigned int v53;
  __int128 v54;
  uint64_t v55;
  unsigned __int8 *v56;
  int v57;
  _OWORD *v58;
  _OWORD *v59;
  uint64_t v60;
  unsigned __int8 *v61;
  int v62;
  __int16 v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  unsigned __int8 *v67;
  _OWORD *v68;
  _OWORD *v69;
  int v70;
  unsigned int v71;
  __int128 v72;
  uint64_t v73;
  unsigned __int8 *v74;
  int v75;
  _OWORD *v76;
  _OWORD *v77;
  uint64_t v78;
  unsigned __int8 *v79;
  int v80;
  const char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  unsigned __int8 *v85;
  _OWORD *v86;
  _OWORD *v87;
  int v88;
  unsigned int v89;
  __int128 v90;
  uint64_t v91;
  unsigned __int8 *v92;
  int v93;
  uint64_t v94;
  _OWORD *v95;
  _OWORD *v96;
  int v97;
  uint64_t v98;
  unsigned __int8 *v99;
  int v100;
  _OWORD *v101;
  _OWORD *v102;
  uint64_t v103;
  uint64_t v104;
  unsigned __int8 *v105;
  int v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  unsigned __int8 *v110;
  _OWORD *v111;
  _OWORD *v112;
  int v113;
  unsigned int v114;
  __int128 v115;
  uint64_t v116;
  unsigned __int8 *v117;
  int v118;
  _OWORD *v119;
  _OWORD *v120;
  uint64_t v121;
  unsigned __int8 *v122;
  int v123;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t *v128;
  unsigned __int8 *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v3 = a3;
  v132 = *MEMORY[0x24BDAC8D0];
  v6 = quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 376), a3);
  v7 = v6;
  if (!v6)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(_QWORD *)(a1 + 1112))
    {
      v129 = v3;
      v130 = a2;
      v131 = 0;
      v19 = _os_log_pack_size();
      v128 = &v125;
      v20 = (char *)&v125 - ((MEMORY[0x24BDAC7A8](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v21 = _os_log_pack_fill();
      v22 = *(unsigned __int8 **)(a1 + 1112);
      v23 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3 == 2)
        v23 = &quic_cid_describe_cid_buf2;
      if (quic_cid_describe_state % 3)
        v24 = v23;
      else
        v24 = &quic_cid_describe_cid_buf1;
      v25 = ++quic_cid_describe_state;
      v26 = v22[38];
      v27 = 0uLL;
      *(_OWORD *)((char *)v24 + 25) = 0u;
      if (v26 >= 0x14)
        v28 = 20;
      else
        v28 = v26;
      *v24 = 0uLL;
      v24[1] = 0uLL;
      if ((_DWORD)v28)
      {
        v29 = v22 + 39;
        do
        {
          v30 = *v29++;
          snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v30);
          --v28;
        }
        while (v28);
        v22 = *(unsigned __int8 **)(a1 + 1112);
        v25 = quic_cid_describe_state;
        v27 = 0uLL;
      }
      v31 = a1 + 976;
      v32 = &quic_cid_describe_cid_buf3;
      if (v25 % 3 == 2)
        v32 = &quic_cid_describe_cid_buf2;
      if (v25 % 3)
        v33 = v32;
      else
        v33 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v25 + 1;
      if (v22[17] >= 0x14u)
        v34 = 20;
      else
        v34 = v22[17];
      *v33 = v27;
      v33[1] = v27;
      *(_OWORD *)((char *)v33 + 25) = v27;
      if ((_DWORD)v34)
      {
        v35 = v22 + 18;
        do
        {
          v36 = *v35++;
          snprintf((char *)v33, 0x29uLL, "%s%02x", (const char *)v33, v36);
          --v34;
        }
        while (v34);
      }
      v37 = quic_cid_describe(v129);
      v38 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3 == 2)
        v38 = &quic_cid_describe_cid_buf2;
      if (quic_cid_describe_state % 3)
        v39 = v38;
      else
        v39 = &quic_cid_describe_cid_buf1;
      ++quic_cid_describe_state;
      v40 = v130;
      v41 = *(unsigned __int8 *)(v130 + 38);
      *(_OWORD *)((char *)v39 + 25) = 0u;
      if (v41 >= 0x14)
        v42 = 20;
      else
        v42 = v41;
      *v39 = 0uLL;
      v39[1] = 0uLL;
      if ((_DWORD)v42)
      {
        v43 = (unsigned __int8 *)(v40 + 39);
        do
        {
          v44 = *v43++;
          snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v44);
          --v42;
        }
        while (v42);
      }
      *(_DWORD *)v21 = 136447490;
      *(_QWORD *)(v21 + 4) = "quic_conn_unknown_dcid";
      *(_WORD *)(v21 + 12) = 2082;
      *(_QWORD *)(v21 + 14) = v31;
      *(_WORD *)(v21 + 22) = 2082;
      *(_QWORD *)(v21 + 24) = v24;
      *(_WORD *)(v21 + 32) = 2082;
      *(_QWORD *)(v21 + 34) = v33;
      *(_WORD *)(v21 + 42) = 2082;
      *(_QWORD *)(v21 + 44) = v37;
      *(_WORD *)(v21 + 52) = 2082;
      *(_QWORD *)(v21 + 54) = v39;
      qlog_internal(16, (uint64_t)v20, 3171);
      v7 = v131;
    }
    return v7 != 0;
  }
  v8 = qlog_debug_enabled;
  v9 = qlog_nwlog_enabled;
  if ((*(_BYTE *)(v6 + 38) & 1) != 0)
    goto LABEL_83;
  if (qlog_debug_enabled)
    v10 = 1;
  else
    v10 = qlog_nwlog_enabled;
  if ((v10 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v11 = _os_log_pack_size();
    v12 = (char *)&v125 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    v14 = *(_QWORD *)(v7 + 40);
    v15 = *(_QWORD *)(a1 + 496);
    v16 = quic_tp_get(*(_BYTE **)(a1 + 544), 14);
    *(_DWORD *)v13 = 136446978;
    *(_QWORD *)(v13 + 4) = "quic_conn_unknown_dcid";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = v14;
    *(_WORD *)(v13 + 22) = 2048;
    *(_QWORD *)(v13 + 24) = v15;
    *(_WORD *)(v13 + 32) = 2048;
    *(_QWORD *)(v13 + 34) = v16;
    qlog_internal(2, (uint64_t)v12, 3187);
  }
  v17 = quic_tp_get(*(_BYTE **)(a1 + 544), 14);
  v8 = qlog_debug_enabled;
  v9 = qlog_nwlog_enabled;
  if (*(_QWORD *)(a1 + 496) < v17)
  {
    v18 = 1;
    goto LABEL_84;
  }
  if (qlog_debug_enabled)
    v45 = 1;
  else
    v45 = qlog_nwlog_enabled;
  if ((v45 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
  {
    v9 = 0;
    v8 = 0;
    goto LABEL_83;
  }
  if (!*(_QWORD *)(a1 + 1112))
  {
LABEL_83:
    v18 = 0;
    goto LABEL_84;
  }
  v129 = v3;
  v130 = a2;
  v131 = v7;
  v46 = _os_log_pack_size();
  v47 = (char *)&v125 - ((MEMORY[0x24BDAC7A8](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v48 = _os_log_pack_fill();
  v128 = (uint64_t *)(a1 + 976);
  v49 = *(unsigned __int8 **)(a1 + 1112);
  if (quic_cid_describe_state % 3 == 2)
    v50 = &quic_cid_describe_cid_buf2;
  else
    v50 = &quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3)
    v51 = v50;
  else
    v51 = &quic_cid_describe_cid_buf1;
  v52 = ++quic_cid_describe_state;
  v53 = v49[38];
  v54 = 0uLL;
  *(_OWORD *)((char *)v51 + 25) = 0u;
  if (v53 >= 0x14)
    v55 = 20;
  else
    v55 = v53;
  *v51 = 0uLL;
  v51[1] = 0uLL;
  if ((_DWORD)v55)
  {
    v56 = v49 + 39;
    do
    {
      v57 = *v56++;
      snprintf((char *)v51, 0x29uLL, "%s%02x", (const char *)v51, v57);
      --v55;
    }
    while (v55);
    v49 = *(unsigned __int8 **)(a1 + 1112);
    v52 = quic_cid_describe_state;
    v54 = 0uLL;
  }
  if (v52 % 3 == 2)
    v58 = &quic_cid_describe_cid_buf2;
  else
    v58 = &quic_cid_describe_cid_buf3;
  if (v52 % 3)
    v59 = v58;
  else
    v59 = &quic_cid_describe_cid_buf1;
  quic_cid_describe_state = v52 + 1;
  if (v49[17] >= 0x14u)
    v60 = 20;
  else
    v60 = v49[17];
  *v59 = v54;
  v59[1] = v54;
  *(_OWORD *)((char *)v59 + 25) = v54;
  if ((_DWORD)v60)
  {
    v61 = v49 + 18;
    do
    {
      v62 = *v61++;
      snprintf((char *)v59, 0x29uLL, "%s%02x", (const char *)v59, v62);
      --v60;
    }
    while (v60);
  }
  *(_DWORD *)v48 = 136446978;
  *(_QWORD *)(v48 + 4) = "quic_conn_unknown_dcid";
  *(_WORD *)(v48 + 12) = 2082;
  *(_QWORD *)(v48 + 14) = v128;
  *(_WORD *)(v48 + 22) = 2082;
  *(_QWORD *)(v48 + 24) = v51;
  *(_WORD *)(v48 + 32) = 2082;
  *(_QWORD *)(v48 + 34) = v59;
  qlog_internal(1, (uint64_t)v47, 3195);
  v18 = 0;
  v8 = qlog_debug_enabled;
  v9 = qlog_nwlog_enabled;
  a2 = v130;
  v7 = v131;
  v3 = v129;
LABEL_84:
  *(_BYTE *)(v7 + 38) |= 1u;
  *(_OWORD *)(a1 + 1288) = *(_OWORD *)(v7 + 22);
  v63 = *(_WORD *)(a2 + 431);
  if ((v8 || (v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT)) && *(_QWORD *)(a1 + 1112))
  {
    LODWORD(v128) = v18;
    v129 = v3;
    v130 = a2;
    v131 = v7;
    v64 = _os_log_pack_size();
    v127 = (char *)&v125;
    v65 = (char *)&v125 - ((MEMORY[0x24BDAC7A8](v64, v64) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v66 = _os_log_pack_fill();
    v126 = a1 + 976;
    v67 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v68 = &quic_cid_describe_cid_buf2;
    else
      v68 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v69 = v68;
    else
      v69 = &quic_cid_describe_cid_buf1;
    v70 = ++quic_cid_describe_state;
    v71 = v67[38];
    v72 = 0uLL;
    *(_OWORD *)((char *)v69 + 25) = 0u;
    if (v71 >= 0x14)
      v73 = 20;
    else
      v73 = v71;
    *v69 = 0uLL;
    v69[1] = 0uLL;
    if ((_DWORD)v73)
    {
      v74 = v67 + 39;
      do
      {
        v75 = *v74++;
        snprintf((char *)v69, 0x29uLL, "%s%02x", (const char *)v69, v75);
        --v73;
      }
      while (v73);
      v67 = *(unsigned __int8 **)(a1 + 1112);
      v70 = quic_cid_describe_state;
      v72 = 0uLL;
    }
    if (v70 % 3 == 2)
      v76 = &quic_cid_describe_cid_buf2;
    else
      v76 = &quic_cid_describe_cid_buf3;
    if (v70 % 3)
      v77 = v76;
    else
      v77 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v70 + 1;
    if (v67[17] >= 0x14u)
      v78 = 20;
    else
      v78 = v67[17];
    *v77 = v72;
    v77[1] = v72;
    *(_OWORD *)((char *)v77 + 25) = v72;
    if ((_DWORD)v78)
    {
      v79 = v67 + 18;
      do
      {
        v80 = *v79++;
        snprintf((char *)v77, 0x29uLL, "%s%02x", (const char *)v77, v80);
        --v78;
      }
      while (v78);
    }
    v3 = v129;
    v81 = quic_cid_describe(v129);
    *(_DWORD *)v66 = 136447234;
    *(_QWORD *)(v66 + 4) = "quic_conn_unknown_dcid";
    *(_WORD *)(v66 + 12) = 2082;
    *(_QWORD *)(v66 + 14) = v126;
    *(_WORD *)(v66 + 22) = 2082;
    *(_QWORD *)(v66 + 24) = v69;
    *(_WORD *)(v66 + 32) = 2082;
    *(_QWORD *)(v66 + 34) = v77;
    *(_WORD *)(v66 + 42) = 2082;
    *(_QWORD *)(v66 + 44) = v81;
    qlog_internal(0, (uint64_t)v65, 3210);
    a2 = v130;
    v7 = v131;
    v18 = (int)v128;
  }
  quic_path_set_scid(a2, (uint64_t)v3, a1);
  if ((v63 & 0x40) != 0)
  {
    if (quic_conn_allocate_dcid(a1, a2))
    {
      if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT)
        || !*(_QWORD *)(a1 + 1112))
      {
        goto LABEL_188;
      }
      LODWORD(v128) = v18;
      v130 = a2;
      v131 = v7;
      v82 = _os_log_pack_size();
      v129 = (unsigned __int8 *)&v125;
      v83 = (char *)&v125 - ((MEMORY[0x24BDAC7A8](v82, v82) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v84 = _os_log_pack_fill();
      v85 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v86 = &quic_cid_describe_cid_buf2;
      else
        v86 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v87 = v86;
      else
        v87 = &quic_cid_describe_cid_buf1;
      v88 = ++quic_cid_describe_state;
      v89 = v85[38];
      v90 = 0uLL;
      *(_OWORD *)((char *)v87 + 25) = 0u;
      if (v89 >= 0x14)
        v91 = 20;
      else
        v91 = v89;
      *v87 = 0uLL;
      v87[1] = 0uLL;
      if ((_DWORD)v91)
      {
        v92 = v85 + 39;
        do
        {
          v93 = *v92++;
          snprintf((char *)v87, 0x29uLL, "%s%02x", (const char *)v87, v93);
          --v91;
        }
        while (v91);
        v85 = *(unsigned __int8 **)(a1 + 1112);
        v88 = quic_cid_describe_state;
        v90 = 0uLL;
      }
      v94 = a1 + 976;
      if (v88 % 3 == 2)
        v95 = &quic_cid_describe_cid_buf2;
      else
        v95 = &quic_cid_describe_cid_buf3;
      if (v88 % 3)
        v96 = v95;
      else
        v96 = &quic_cid_describe_cid_buf1;
      v97 = v88 + 1;
      quic_cid_describe_state = v97;
      if (v85[17] >= 0x14u)
        v98 = 20;
      else
        v98 = v85[17];
      *v96 = v90;
      v96[1] = v90;
      *(_OWORD *)((char *)v96 + 25) = v90;
      if ((_DWORD)v98)
      {
        v126 = a1 + 976;
        v127 = v83;
        v99 = v85 + 18;
        do
        {
          v100 = *v99++;
          snprintf((char *)v96, 0x29uLL, "%s%02x", (const char *)v96, v100);
          --v98;
        }
        while (v98);
        v97 = quic_cid_describe_state;
        v94 = v126;
        v83 = v127;
      }
      if (v97 % 3 == 2)
        v101 = &quic_cid_describe_cid_buf2;
      else
        v101 = &quic_cid_describe_cid_buf3;
      if (v97 % 3)
        v102 = v101;
      else
        v102 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v97 + 1;
      v103 = v130;
      if (*(unsigned __int8 *)(v130 + 17) >= 0x14u)
        v104 = 20;
      else
        v104 = *(unsigned __int8 *)(v130 + 17);
      *v102 = 0u;
      v102[1] = 0u;
      *(_OWORD *)((char *)v102 + 25) = 0u;
      if ((_DWORD)v104)
      {
        v105 = (unsigned __int8 *)(v103 + 18);
        do
        {
          v106 = *v105++;
          snprintf((char *)v102, 0x29uLL, "%s%02x", (const char *)v102, v106);
          --v104;
        }
        while (v104);
      }
      *(_DWORD *)v84 = 136447234;
      *(_QWORD *)(v84 + 4) = "quic_conn_unknown_dcid";
      *(_WORD *)(v84 + 12) = 2082;
      *(_QWORD *)(v84 + 14) = v94;
      *(_WORD *)(v84 + 22) = 2082;
      *(_QWORD *)(v84 + 24) = v87;
      *(_WORD *)(v84 + 32) = 2082;
      *(_QWORD *)(v84 + 34) = v96;
      *(_WORD *)(v84 + 42) = 2082;
      *(_QWORD *)(v84 + 44) = v102;
      qlog_internal(0, (uint64_t)v83, 3217);
    }
    else
    {
      if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(_QWORD *)(a1 + 1112))
      {
        goto LABEL_188;
      }
      LODWORD(v128) = v18;
      v131 = v7;
      v107 = _os_log_pack_size();
      v108 = (char *)&v125 - ((MEMORY[0x24BDAC7A8](v107, v107) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v109 = _os_log_pack_fill();
      v130 = a1 + 976;
      v110 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v111 = &quic_cid_describe_cid_buf2;
      else
        v111 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v112 = v111;
      else
        v112 = &quic_cid_describe_cid_buf1;
      v113 = ++quic_cid_describe_state;
      v114 = v110[38];
      v115 = 0uLL;
      *(_OWORD *)((char *)v112 + 25) = 0u;
      if (v114 >= 0x14)
        v116 = 20;
      else
        v116 = v114;
      *v112 = 0uLL;
      v112[1] = 0uLL;
      if ((_DWORD)v116)
      {
        v117 = v110 + 39;
        do
        {
          v118 = *v117++;
          snprintf((char *)v112, 0x29uLL, "%s%02x", (const char *)v112, v118);
          --v116;
        }
        while (v116);
        v110 = *(unsigned __int8 **)(a1 + 1112);
        v113 = quic_cid_describe_state;
        v115 = 0uLL;
      }
      if (v113 % 3 == 2)
        v119 = &quic_cid_describe_cid_buf2;
      else
        v119 = &quic_cid_describe_cid_buf3;
      if (v113 % 3)
        v120 = v119;
      else
        v120 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v113 + 1;
      if (v110[17] >= 0x14u)
        v121 = 20;
      else
        v121 = v110[17];
      *v120 = v115;
      v120[1] = v115;
      *(_OWORD *)((char *)v120 + 25) = v115;
      if ((_DWORD)v121)
      {
        v122 = v110 + 18;
        do
        {
          v123 = *v122++;
          snprintf((char *)v120, 0x29uLL, "%s%02x", (const char *)v120, v123);
          --v121;
        }
        while (v121);
      }
      *(_DWORD *)v109 = 136446978;
      *(_QWORD *)(v109 + 4) = "quic_conn_unknown_dcid";
      *(_WORD *)(v109 + 12) = 2082;
      *(_QWORD *)(v109 + 14) = v130;
      *(_WORD *)(v109 + 22) = 2082;
      *(_QWORD *)(v109 + 24) = v112;
      *(_WORD *)(v109 + 32) = 2082;
      *(_QWORD *)(v109 + 34) = v120;
      qlog_internal(16, (uint64_t)v108, 3219);
    }
    v7 = v131;
    v18 = (int)v128;
LABEL_188:
    if (v18)
      quic_conn_annouce_new_cids(a1, 1u);
  }
  return v7 != 0;
}

uint64_t quic_conn_allocate_dcid(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    result = quic_cid_array_find_next_cid(*(unsigned __int8 **)(a1 + 384), *(unsigned __int8 *)(a1 + 476));
    if (result)
    {
      *(_BYTE *)(result + 38) |= 1u;
      *(_BYTE *)(a1 + 476) = *(_BYTE *)result;
      quic_path_assign_dcid(a2, result + 1, a1);
      return 1;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  {
    v5 = _os_log_pack_size();
    v6 = (char *)v8 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_conn_allocate_dcid";
    qlog_internal(17, (uint64_t)v6, 4434);
    return 0;
  }
  return result;
}

void quic_conn_generate_dcid(uint64_t a1)
{
  unsigned int v2;
  NSObject *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 __buf;
  uint64_t buffer;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  buffer = 0;
  v33[0] = 0;
  *(_QWORD *)((char *)v33 + 5) = 0;
  __buf = 0uLL;
  v2 = quic_conn_scid_len(a1);
  if (v2)
  {
    quic_cid_create(v2, &buffer);
    v3 = dispatch_data_create(&buffer, 0x15uLL, 0, 0);
    nw_protocol_instance_notify_connection_id_changed();
    if (!v3)
      qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
    dispatch_release(v3);
    arc4random_buf(&__buf, 0x10uLL);
    quic_frame_alloc_NEW_CONNECTION_ID(*(_QWORD *)(a1 + 560), 0, *(_QWORD *)(a1 + 480), (unsigned __int8 *)&buffer, &__buf);
    quic_cid_array_insert(*(unsigned __int8 **)(a1 + 376), *(_QWORD *)(a1 + 480), (uint64_t)&buffer, &__buf);
    v4 = *(_QWORD *)(a1 + 496);
    v5 = __CFADD__(v4, 1);
    v6 = v4 + 1;
    v7 = v5;
    v8 = v7 << 63 >> 63;
    *(_QWORD *)(a1 + 496) = v6;
    v9 = qlog_debug_enabled;
    v10 = qlog_nwlog_enabled;
    if (v8 != v7 || v8 < 0)
    {
      if (qlog_debug_enabled)
        v10 = 1;
      if ((v10 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v11 = _os_log_pack_size();
        v12 = (char *)&__buf - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v13 = _os_log_pack_fill();
        v14 = *(_QWORD *)(a1 + 496);
        *(_DWORD *)v13 = 136447234;
        *(_QWORD *)(v13 + 4) = "quic_conn_generate_dcid";
        *(_WORD *)(v13 + 12) = 2082;
        *(_QWORD *)(v13 + 14) = "conn->num_active_local_cid";
        *(_WORD *)(v13 + 22) = 2048;
        *(_QWORD *)(v13 + 24) = v14 - 1;
        *(_WORD *)(v13 + 32) = 2048;
        *(_QWORD *)(v13 + 34) = 1;
        *(_WORD *)(v13 + 42) = 2048;
        *(_QWORD *)(v13 + 44) = v14;
        qlog_internal(17, (uint64_t)v12, 4237);
        v9 = qlog_debug_enabled;
        v10 = qlog_nwlog_enabled;
      }
      else
      {
        v10 = 0;
        v9 = 0;
      }
      *(_QWORD *)(a1 + 496) = -1;
    }
    if (v9 || (v10 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v18 = _os_log_pack_size();
      v19 = (char *)&__buf - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v20 = _os_log_pack_fill();
      v21 = *(_QWORD *)(a1 + 480);
      v22 = *(_QWORD *)(a1 + 496);
      *(_DWORD *)v20 = 136446722;
      *(_QWORD *)(v20 + 4) = "quic_conn_generate_dcid";
      *(_WORD *)(v20 + 12) = 2048;
      *(_QWORD *)(v20 + 14) = v21;
      *(_WORD *)(v20 + 22) = 2048;
      *(_QWORD *)(v20 + 24) = v22;
      qlog_internal(2, (uint64_t)v19, 4240);
    }
    v23 = *(_QWORD *)(a1 + 480);
    v24 = v23 + 1;
    v25 = v23 == -1;
    v26 = v25 << 63 >> 63;
    *(_QWORD *)(a1 + 480) = v24;
    if (v26 != v25 || v26 < 0)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v27 = _os_log_pack_size();
        v28 = (char *)&__buf - ((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v29 = _os_log_pack_fill();
        v30 = *(_QWORD *)(a1 + 480);
        *(_DWORD *)v29 = 136447234;
        *(_QWORD *)(v29 + 4) = "quic_conn_generate_dcid";
        *(_WORD *)(v29 + 12) = 2082;
        *(_QWORD *)(v29 + 14) = "conn->lcid_next_seq_num";
        *(_WORD *)(v29 + 22) = 2048;
        *(_QWORD *)(v29 + 24) = v30 - 1;
        *(_WORD *)(v29 + 32) = 2048;
        *(_QWORD *)(v29 + 34) = 1;
        *(_WORD *)(v29 + 42) = 2048;
        *(_QWORD *)(v29 + 44) = v30;
        qlog_internal(17, (uint64_t)v28, 4241);
      }
      *(_QWORD *)(a1 + 480) = -1;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v15 = _os_log_pack_size();
    v16 = (char *)&__buf - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136446210;
    *(_QWORD *)(v17 + 4) = "quic_conn_generate_dcid";
    qlog_internal(2, (uint64_t)v16, 4222);
  }
}

uint64_t __quic_conn_process_retry_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 208) = 0;
  return 1;
}

uint64_t __quic_conn_send_vn_block_invoke()
{
  return nw_protocol_data_access_buffer();
}

uint64_t quic_conn_send_retry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)(a3 + 61);
  quic_cid_len((unsigned __int8 *)(a2 + 17));
  quic_cid_len(v3);
  return nw_protocol_request_outbound_data();
}

uint64_t __quic_conn_send_retry_block_invoke()
{
  return nw_protocol_data_access_buffer();
}

void __quic_conn_send_retry_block_invoke_2(uint64_t a1, char *a2, unsigned __int16 a3)
{
  quic_packet_builder_assemble_retry(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), a2, a3, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 108), (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 61), (unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 38), (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 598), *(void **)(*(_QWORD *)(a1 + 32) + 1088));
  quic_conn_send_packet(*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int16 *)(a1 + 64), 0, 0, 0, 0, 0);
}

void __quic_conn_send_vn_block_invoke_2(uint64_t a1, char *a2, unsigned __int16 a3)
{
  quic_packet_builder_assemble_version_negotiation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), a2, a3, (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 61), (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40), *(unsigned int **)(a1 + 48));
  quic_conn_send_packet(*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int16 *)(a1 + 64), 0, 0, 0, 0, 0);
}

uint64_t quic_conn_lookup_nw_path(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*MEMORY[0x24BDE0898] == a2)
    {
      for (result = *(_QWORD *)(a1 + 1360); result; result = *(_QWORD *)(result + 312))
      {
        if ((*(_WORD *)(result + 431) & 1) != 0)
          break;
      }
    }
    else
    {
      for (result = *(_QWORD *)(a1 + 1360); result; result = *(_QWORD *)(result + 312))
      {
        if (*(_QWORD *)result == a2)
          break;
      }
    }
  }
  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v3 = _os_log_pack_size();
      v4 = (char *)v6 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v5 = _os_log_pack_fill();
      *(_DWORD *)v5 = 136446210;
      *(_QWORD *)(v5 + 4) = "quic_conn_lookup_nw_path";
      qlog_internal(17, (uint64_t)v4, 5626);
    }
    return 0;
  }
  return result;
}

void __quic_conn_idle_timeout_configure_block_invoke(uint64_t a1, unsigned __int8 **a2, int a3)
{
  quic_conn_idle_timeout_fired(*(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t __quic_conn_set_priority_block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t bg_cc;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    bg_cc = quic_path_get_or_create_bg_cc((uint64_t)a2, *(_QWORD *)(v4 + 1136));
    quic_cc_switch_cc(bg_cc);
    a2[45] = bg_cc;
    quic_ecn_set_disable_ect(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968), 1);
    v6 = (uint64_t)a2;
    v7 = 1;
    goto LABEL_9;
  }
  if ((*(_BYTE *)(v4 + 1383) & 2) == 0 || (v8 = a2[48]) == 0)
  {
    quic_cc_switch_cc(a2[46]);
    v9 = a2[46];
    goto LABEL_8;
  }
  if (a2[49])
  {
    quic_cc_switch_cc(v8);
    v9 = a2[48];
LABEL_8:
    a2[45] = v9;
    quic_ecn_set_disable_ect(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968), 0);
    v6 = (uint64_t)a2;
    v7 = 0;
LABEL_9:
    quic_ecn_path_set_disable_ect(v6, v7);
    v10 = a2[49];
    if (v10)
      quic_pacer_reset(v10);
    return 1;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v15 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136446210;
    *(_QWORD *)(v14 + 4) = "quic_conn_set_priority_block_invoke";
    qlog_internal(17, (uint64_t)v13, 4118);
  }
  return 1;
}

void quic_conn_new_scid(uint64_t a1, const void *a2)
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    quic_cid_array_insert(*(unsigned __int8 **)(a1 + 376), 0, (uint64_t)a2, 0);
    v3 = dispatch_data_create(a2, 0x15uLL, 0, 0);
    nw_protocol_instance_notify_connection_id_changed();
    if (!v3)
      qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
    dispatch_release(v3);
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v4 = _os_log_pack_size();
    v5 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "quic_conn_new_scid";
    qlog_internal(17, (uint64_t)v5, 4315);
  }
}

void quic_conn_retire_dcid_by_seq(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  _OWORD *v10;
  _OWORD *v11;
  int v12;
  unsigned int v13;
  __int128 v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  const void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = quic_cid_array_find_by_seq_num(*(unsigned __int8 **)(a1 + 384), a2);
    if (v4)
    {
      v5 = v4;
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        && *(_QWORD *)(a1 + 1112))
      {
        v6 = _os_log_pack_size();
        v31 = &v29;
        v7 = (char *)&v29 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v8 = _os_log_pack_fill();
        v30 = a1 + 976;
        v9 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2)
          v10 = &quic_cid_describe_cid_buf2;
        else
          v10 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v11 = v10;
        else
          v11 = &quic_cid_describe_cid_buf1;
        v12 = ++quic_cid_describe_state;
        v13 = v9[38];
        v14 = 0uLL;
        *(_OWORD *)((char *)v11 + 25) = 0u;
        if (v13 >= 0x14)
          v15 = 20;
        else
          v15 = v13;
        *v11 = 0uLL;
        v11[1] = 0uLL;
        if ((_DWORD)v15)
        {
          v16 = v9 + 39;
          do
          {
            v17 = *v16++;
            snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
            --v15;
          }
          while (v15);
          v9 = *(unsigned __int8 **)(a1 + 1112);
          v12 = quic_cid_describe_state;
          v14 = 0uLL;
        }
        if (v12 % 3 == 2)
          v18 = &quic_cid_describe_cid_buf2;
        else
          v18 = &quic_cid_describe_cid_buf3;
        if (v12 % 3)
          v19 = v18;
        else
          v19 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v12 + 1;
        if (v9[17] >= 0x14u)
          v20 = 20;
        else
          v20 = v9[17];
        *v19 = v14;
        v19[1] = v14;
        *(_OWORD *)((char *)v19 + 25) = v14;
        if ((_DWORD)v20)
        {
          v21 = v9 + 18;
          do
          {
            v22 = *v21++;
            snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
            --v20;
          }
          while (v20);
        }
        *(_DWORD *)v8 = 136447234;
        *(_QWORD *)(v8 + 4) = "quic_conn_retire_dcid_by_seq";
        *(_WORD *)(v8 + 12) = 2082;
        *(_QWORD *)(v8 + 14) = v30;
        *(_WORD *)(v8 + 22) = 2082;
        *(_QWORD *)(v8 + 24) = v11;
        *(_WORD *)(v8 + 32) = 2082;
        *(_QWORD *)(v8 + 34) = v19;
        *(_WORD *)(v8 + 42) = 2048;
        *(_QWORD *)(v8 + 44) = a2;
        qlog_internal(1, (uint64_t)v7, 4347);
      }
      v23 = (const void *)(v5 + 1);
      v24 = *(_QWORD *)(v5 + 40);
      v25 = dispatch_data_create(v23, 0x15uLL, 0, 0);
      nw_protocol_instance_notify_connection_id_changed();
      if (!v25)
        qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
      dispatch_release(v25);
      quic_migration_retire_dcid(*(_QWORD *)(a1 + 1120), (uint64_t)v23);
      quic_protector_destroy_mp_space(*(_QWORD *)(a1 + 568), v24);
      quic_cid_array_remove_by_seq_num(*(unsigned __int8 **)(a1 + 384), v24);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v26 = _os_log_pack_size();
    v27 = (char *)&v29 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136446210;
    *(_QWORD *)(v28 + 4) = "quic_conn_retire_dcid_by_seq";
    qlog_internal(17, (uint64_t)v27, 4340);
  }
}

uint64_t quic_conn_retire_dcid(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return -1;
    }
    v14 = _os_log_pack_size();
    v15 = (char *)v23 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136446210;
    *(_QWORD *)(v16 + 4) = "quic_conn_retire_dcid";
    v17 = (uint64_t)v15;
    v18 = 4368;
    goto LABEL_28;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return -1;
    }
    v19 = _os_log_pack_size();
    v20 = (char *)v23 - ((MEMORY[0x24BDAC7A8](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136446210;
    *(_QWORD *)(v21 + 4) = "quic_conn_retire_dcid";
    v17 = (uint64_t)v20;
    v18 = 4369;
LABEL_28:
    qlog_internal(17, v17, v18);
    return -1;
  }
  v4 = quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 384), a2);
  if (v4)
  {
    v5 = *(_QWORD *)(v4 + 40);
    quic_conn_retire_dcid_by_seq(a1, v5);
    return v5;
  }
  if (!qlog_debug_enabled
    && (qlog_nwlog_enabled & 1) == 0
    && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    return -1;
  }
  v6 = _os_log_pack_size();
  v7 = (char *)v23 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = _os_log_pack_fill();
  v9 = &quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3 == 2)
    v9 = &quic_cid_describe_cid_buf2;
  if (quic_cid_describe_state % 3)
    v10 = v9;
  else
    v10 = &quic_cid_describe_cid_buf1;
  ++quic_cid_describe_state;
  if (*a2 >= 0x14u)
    v11 = 20;
  else
    v11 = *a2;
  *v10 = 0u;
  v10[1] = 0u;
  *(_OWORD *)((char *)v10 + 25) = 0u;
  if ((_DWORD)v11)
  {
    v12 = a2 + 1;
    do
    {
      v13 = *v12++;
      snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v13);
      --v11;
    }
    while (v11);
  }
  *(_DWORD *)v8 = 136446466;
  *(_QWORD *)(v8 + 4) = "quic_conn_retire_dcid";
  *(_WORD *)(v8 + 12) = 2082;
  *(_QWORD *)(v8 + 14) = v10;
  qlog_internal(17, (uint64_t)v7, 4377);
  return -1;
}

void quic_conn_retire_scid_by_seq(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  _OWORD *v12;
  _OWORD *v13;
  int v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  const void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unsigned __int8 *v31;
  _OWORD *v32;
  _OWORD *v33;
  int v34;
  unsigned int v35;
  __int128 v36;
  uint64_t v37;
  unsigned __int8 *v38;
  int v39;
  _OWORD *v40;
  _OWORD *v41;
  uint64_t v42;
  unsigned __int8 *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  unsigned __int8 *v52;
  _OWORD *v53;
  _OWORD *v54;
  int v55;
  unsigned int v56;
  __int128 v57;
  uint64_t v58;
  unsigned __int8 *v59;
  int v60;
  _OWORD *v61;
  _OWORD *v62;
  uint64_t v63;
  unsigned __int8 *v64;
  int v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = quic_cid_array_find_by_seq_num(*(unsigned __int8 **)(a1 + 376), a2);
    if (v4)
    {
      v5 = v4;
      v6 = 0x2545F5000uLL;
      v7 = 0x2545F5000uLL;
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        && *(_QWORD *)(a1 + 1112))
      {
        v8 = _os_log_pack_size();
        v71 = &v69;
        v9 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v10 = _os_log_pack_fill();
        v70 = a1 + 976;
        v11 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2)
          v12 = &quic_cid_describe_cid_buf2;
        else
          v12 = &quic_cid_describe_cid_buf3;
        if (quic_cid_describe_state % 3)
          v13 = v12;
        else
          v13 = &quic_cid_describe_cid_buf1;
        v14 = ++quic_cid_describe_state;
        v15 = v11[38];
        v16 = 0uLL;
        *(_OWORD *)((char *)v13 + 25) = 0u;
        if (v15 >= 0x14)
          v17 = 20;
        else
          v17 = v15;
        *v13 = 0uLL;
        v13[1] = 0uLL;
        if ((_DWORD)v17)
        {
          v18 = v11 + 39;
          do
          {
            v19 = *v18++;
            snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
            --v17;
          }
          while (v17);
          v11 = *(unsigned __int8 **)(a1 + 1112);
          v14 = quic_cid_describe_state;
          v16 = 0uLL;
        }
        if (v14 % 3 == 2)
          v20 = &quic_cid_describe_cid_buf2;
        else
          v20 = &quic_cid_describe_cid_buf3;
        if (v14 % 3)
          v21 = v20;
        else
          v21 = &quic_cid_describe_cid_buf1;
        quic_cid_describe_state = v14 + 1;
        if (v11[17] >= 0x14u)
          v22 = 20;
        else
          v22 = v11[17];
        *v21 = v16;
        v21[1] = v16;
        *(_OWORD *)((char *)v21 + 25) = v16;
        if ((_DWORD)v22)
        {
          v23 = v11 + 18;
          do
          {
            v24 = *v23++;
            snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
            --v22;
          }
          while (v22);
        }
        *(_DWORD *)v10 = 136447234;
        *(_QWORD *)(v10 + 4) = "quic_conn_retire_scid_by_seq";
        *(_WORD *)(v10 + 12) = 2082;
        *(_QWORD *)(v10 + 14) = v70;
        *(_WORD *)(v10 + 22) = 2082;
        *(_QWORD *)(v10 + 24) = v13;
        *(_WORD *)(v10 + 32) = 2082;
        *(_QWORD *)(v10 + 34) = v21;
        *(_WORD *)(v10 + 42) = 2048;
        *(_QWORD *)(v10 + 44) = a2;
        qlog_internal(1, (uint64_t)v9, 4397);
        v7 = 0x2545F5000uLL;
        v6 = 0x2545F5000uLL;
      }
      v25 = (const void *)(v5 + 1);
      v26 = dispatch_data_create(v25, 0x15uLL, 0, 0);
      nw_protocol_instance_notify_connection_id_changed();
      if (!v26)
        qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
      dispatch_release(v26);
      quic_migration_retire_scid(*(_QWORD *)(a1 + 1120), (uint64_t)v25);
      quic_ack_destroy_multipath_pn_space(*(_QWORD *)(a1 + 960), a2);
      quic_cid_array_remove_by_seq_num(*(unsigned __int8 **)(a1 + 376), a2);
      v27 = *(_QWORD *)(a1 + 496);
      if (v27)
      {
        *(_QWORD *)(a1 + 496) = v27 - 1;
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          && *(_QWORD *)(a1 + 1112))
        {
          v28 = _os_log_pack_size();
          v29 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v30 = _os_log_pack_fill();
          v71 = (uint64_t *)(a1 + 976);
          v31 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v32 = &quic_cid_describe_cid_buf2;
          else
            v32 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v33 = v32;
          else
            v33 = &quic_cid_describe_cid_buf1;
          v34 = ++quic_cid_describe_state;
          v35 = v31[38];
          v36 = 0uLL;
          *(_OWORD *)((char *)v33 + 25) = 0u;
          if (v35 >= 0x14)
            v37 = 20;
          else
            v37 = v35;
          *v33 = 0uLL;
          v33[1] = 0uLL;
          if ((_DWORD)v37)
          {
            v38 = v31 + 39;
            do
            {
              v39 = *v38++;
              snprintf((char *)v33, 0x29uLL, "%s%02x", (const char *)v33, v39);
              --v37;
            }
            while (v37);
            v31 = *(unsigned __int8 **)(a1 + 1112);
            v34 = quic_cid_describe_state;
            v36 = 0uLL;
          }
          if (v34 % 3 == 2)
            v40 = &quic_cid_describe_cid_buf2;
          else
            v40 = &quic_cid_describe_cid_buf3;
          if (v34 % 3)
            v41 = v40;
          else
            v41 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v34 + 1;
          if (v31[17] >= 0x14u)
            v42 = 20;
          else
            v42 = v31[17];
          *v41 = v36;
          v41[1] = v36;
          *(_OWORD *)((char *)v41 + 25) = v36;
          if ((_DWORD)v42)
          {
            v43 = v31 + 18;
            do
            {
              v44 = *v43++;
              snprintf((char *)v41, 0x29uLL, "%s%02x", (const char *)v41, v44);
              --v42;
            }
            while (v42);
          }
          v45 = *(_QWORD *)(a1 + 496);
          *(_DWORD *)v30 = 136447234;
          *(_QWORD *)(v30 + 4) = "quic_conn_retire_scid_by_seq";
          *(_WORD *)(v30 + 12) = 2082;
          *(_QWORD *)(v30 + 14) = v71;
          *(_WORD *)(v30 + 22) = 2082;
          *(_QWORD *)(v30 + 24) = v33;
          *(_WORD *)(v30 + 32) = 2082;
          *(_QWORD *)(v30 + 34) = v41;
          *(_WORD *)(v30 + 42) = 2048;
          *(_QWORD *)(v30 + 44) = v45;
          qlog_internal(1, (uint64_t)v29, 4416);
          v7 = 0x2545F5000;
          v6 = 0x2545F5000;
        }
      }
      else if (qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        v46 = _os_log_pack_size();
        v47 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v48 = _os_log_pack_fill();
        *(_DWORD *)v48 = 136446210;
        *(_QWORD *)(v48 + 4) = "quic_conn_retire_scid_by_seq";
        qlog_internal(2, (uint64_t)v47, 4419);
      }
      if (*(_QWORD *)(a1 + 496) < (unint64_t)quic_tp_get(*(_BYTE **)(a1 + 544), 14))
      {
        if ((*(_BYTE *)(v6 + 3232)
           || (*(_BYTE *)(v7 + 3233) & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          && *(_QWORD *)(a1 + 1112))
        {
          v49 = _os_log_pack_size();
          v71 = &v69;
          v50 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v49, v49) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v51 = _os_log_pack_fill();
          v70 = a1 + 976;
          v52 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v53 = &quic_cid_describe_cid_buf2;
          else
            v53 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v54 = v53;
          else
            v54 = &quic_cid_describe_cid_buf1;
          v55 = ++quic_cid_describe_state;
          v56 = v52[38];
          v57 = 0uLL;
          *(_OWORD *)((char *)v54 + 25) = 0u;
          if (v56 >= 0x14)
            v58 = 20;
          else
            v58 = v56;
          *v54 = 0uLL;
          v54[1] = 0uLL;
          if ((_DWORD)v58)
          {
            v59 = v52 + 39;
            do
            {
              v60 = *v59++;
              snprintf((char *)v54, 0x29uLL, "%s%02x", (const char *)v54, v60);
              --v58;
            }
            while (v58);
            v52 = *(unsigned __int8 **)(a1 + 1112);
            v55 = quic_cid_describe_state;
            v57 = 0uLL;
          }
          if (v55 % 3 == 2)
            v61 = &quic_cid_describe_cid_buf2;
          else
            v61 = &quic_cid_describe_cid_buf3;
          if (v55 % 3)
            v62 = v61;
          else
            v62 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v55 + 1;
          if (v52[17] >= 0x14u)
            v63 = 20;
          else
            v63 = v52[17];
          *v62 = v57;
          v62[1] = v57;
          *(_OWORD *)((char *)v62 + 25) = v57;
          if ((_DWORD)v63)
          {
            v64 = v52 + 18;
            do
            {
              v65 = *v64++;
              snprintf((char *)v62, 0x29uLL, "%s%02x", (const char *)v62, v65);
              --v63;
            }
            while (v63);
          }
          *(_DWORD *)v51 = 136446978;
          *(_QWORD *)(v51 + 4) = "quic_conn_retire_scid_by_seq";
          *(_WORD *)(v51 + 12) = 2082;
          *(_QWORD *)(v51 + 14) = v70;
          *(_WORD *)(v51 + 22) = 2082;
          *(_QWORD *)(v51 + 24) = v54;
          *(_WORD *)(v51 + 32) = 2082;
          *(_QWORD *)(v51 + 34) = v62;
          qlog_internal(1, (uint64_t)v50, 4425);
        }
        quic_conn_annouce_new_cids(a1, 1u);
      }
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v66 = _os_log_pack_size();
    v67 = (char *)&v69 - ((MEMORY[0x24BDAC7A8](v66, v66) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v68 = _os_log_pack_fill();
    *(_DWORD *)v68 = 136446210;
    *(_QWORD *)(v68 + 4) = "quic_conn_retire_scid_by_seq";
    qlog_internal(17, (uint64_t)v67, 4390);
  }
}

uint64_t quic_conn_allocate_preferred_address_dcid(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    result = quic_cid_array_find_by_seq_num(*(unsigned __int8 **)(a1 + 384), 1);
    if (!result)
      return result;
    v5 = result;
    if ((*(_BYTE *)(result + 38) & 5) == 4)
    {
      quic_path_assign_dcid(a2, result + 1, a1);
      *(_BYTE *)(v5 + 38) |= 1u;
      return 1;
    }
    return 0;
  }
  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v9 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "quic_conn_allocate_preferred_address_dcid";
    qlog_internal(17, (uint64_t)v7, 4453);
    return 0;
  }
  return result;
}

void quic_conn_keepalive_acked(uint64_t a1)
{
  char *v2;
  int v3;
  char v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  _OWORD *v12;
  _OWORD *v13;
  int v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    LODWORD(v2) = (unsigned __int16)(*(_WORD *)(a1 + 592))-- - 1;
    v3 = qlog_debug_enabled;
    v4 = qlog_nwlog_enabled;
    if (v2 >= 0x10000)
    {
      if (qlog_debug_enabled)
        v4 = 1;
      if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v5 = _os_log_pack_size();
        v6 = (char *)&v29 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v7 = _os_log_pack_fill();
        v8 = *(unsigned __int16 *)(a1 + 592);
        *(_DWORD *)v7 = 136447234;
        *(_QWORD *)(v7 + 4) = "quic_conn_keepalive_acked";
        *(_WORD *)(v7 + 12) = 2082;
        *(_QWORD *)(v7 + 14) = "conn->unacked_keepalive_count";
        *(_WORD *)(v7 + 22) = 2048;
        *(_QWORD *)(v7 + 24) = v8 + 1;
        *(_WORD *)(v7 + 32) = 2048;
        *(_QWORD *)(v7 + 34) = 1;
        *(_WORD *)(v7 + 42) = 2048;
        *(_QWORD *)(v7 + 44) = v8;
        qlog_internal(17, (uint64_t)v6, 4699);
        v3 = qlog_debug_enabled;
        v4 = qlog_nwlog_enabled;
      }
      else
      {
        v4 = 0;
        v3 = 0;
      }
      LOWORD(v2) = 0;
      *(_WORD *)(a1 + 592) = 0;
    }
    if ((v3 || (v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)) && *(_QWORD *)(a1 + 1112))
    {
      v9 = _os_log_pack_size();
      v31 = &v29;
      v2 = (char *)&v29 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      v30 = a1 + 976;
      v11 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v12 = &quic_cid_describe_cid_buf2;
      else
        v12 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v13 = v12;
      else
        v13 = &quic_cid_describe_cid_buf1;
      v14 = ++quic_cid_describe_state;
      v15 = v11[38];
      v16 = 0uLL;
      *(_OWORD *)((char *)v13 + 25) = 0u;
      if (v15 >= 0x14)
        v17 = 20;
      else
        v17 = v15;
      *v13 = 0uLL;
      v13[1] = 0uLL;
      if ((_DWORD)v17)
      {
        v18 = v11 + 39;
        do
        {
          v19 = *v18++;
          snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
          --v17;
        }
        while (v17);
        v11 = *(unsigned __int8 **)(a1 + 1112);
        v14 = quic_cid_describe_state;
        v16 = 0uLL;
      }
      if (v14 % 3 == 2)
        v20 = &quic_cid_describe_cid_buf2;
      else
        v20 = &quic_cid_describe_cid_buf3;
      if (v14 % 3)
        v21 = v20;
      else
        v21 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v14 + 1;
      if (v11[17] >= 0x14u)
        v22 = 20;
      else
        v22 = v11[17];
      *v21 = v16;
      v21[1] = v16;
      *(_OWORD *)((char *)v21 + 25) = v16;
      if ((_DWORD)v22)
      {
        v23 = v11 + 18;
        do
        {
          v24 = *v23++;
          snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
          --v22;
        }
        while (v22);
      }
      v25 = *(unsigned __int16 *)(a1 + 592);
      *(_DWORD *)v10 = 136447234;
      *(_QWORD *)(v10 + 4) = "quic_conn_keepalive_acked";
      *(_WORD *)(v10 + 12) = 2082;
      *(_QWORD *)(v10 + 14) = v30;
      *(_WORD *)(v10 + 22) = 2082;
      *(_QWORD *)(v10 + 24) = v13;
      *(_WORD *)(v10 + 32) = 2082;
      *(_QWORD *)(v10 + 34) = v21;
      *(_WORD *)(v10 + 42) = 1024;
      *(_DWORD *)(v10 + 44) = v25;
      qlog_internal(1, (uint64_t)v2, 4703);
      LOWORD(v2) = *(_WORD *)(a1 + 592);
    }
    ++*(_DWORD *)(a1 + 1220);
    quic_migration_keepalive_loss_event(*(_QWORD *)(a1 + 1120), a1, *(_QWORD *)(a1 + 1112), (unsigned __int16)v2);
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v26 = _os_log_pack_size();
    v27 = (char *)&v29 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136446210;
    *(_QWORD *)(v28 + 4) = "quic_conn_keepalive_acked";
    qlog_internal(17, (uint64_t)v27, 4697);
  }
}

void quic_conn_probe_connectivity(uint64_t a1, char a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[4];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = __quic_conn_probe_connectivity_block_invoke;
    v5[3] = &__block_descriptor_tmp_129;
    v6 = a2;
    nw_protocol_instance_access_state();
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_conn_probe_connectivity";
    qlog_internal(17, (uint64_t)v3, 4947);
  }
}

uint64_t __quic_conn_probe_connectivity_block_invoke(uint64_t a1, uint64_t a2)
{
  quic_conn_probe_connectivity_internal(a2, *(unsigned __int8 *)(a1 + 32));
  return 1;
}

void quic_conn_probe_connectivity_internal(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  _OWORD *v10;
  _OWORD *v11;
  int v12;
  unsigned int v13;
  __int128 v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  _OWORD *v27;
  _OWORD *v28;
  int v29;
  unsigned int v30;
  __int128 v31;
  uint64_t v32;
  unsigned __int8 *v33;
  int v34;
  _OWORD *v35;
  _OWORD *v36;
  uint64_t v37;
  unsigned __int8 *v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unsigned __int8 *v44;
  _OWORD *v45;
  _OWORD *v46;
  int v47;
  unsigned int v48;
  __int128 v49;
  uint64_t v50;
  unsigned __int8 *v51;
  int v52;
  _OWORD *v53;
  _OWORD *v54;
  uint64_t v55;
  unsigned __int8 *v56;
  int v57;
  uint64_t stats_region;
  void *v59;
  uint64_t stats;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v76 = _os_log_pack_size();
      v77 = (char *)v79 - ((MEMORY[0x24BDAC7A8](v76, v76) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v78 = _os_log_pack_fill();
      *(_DWORD *)v78 = 136446210;
      *(_QWORD *)(v78 + 4) = "quic_conn_probe_connectivity_internal";
      qlog_internal(17, (uint64_t)v77, 4919);
    }
    return;
  }
  v4 = a1 + 1380;
  v5 = *(_QWORD *)(a1 + 1380);
  if (((v5 & 0x200000) == 0) != a2)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))&& *(_QWORD *)(a1 + 1112))
    {
      v6 = _os_log_pack_size();
      v7 = (char *)v79 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      v79[0] = a1 + 976;
      v9 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v10 = &quic_cid_describe_cid_buf2;
      else
        v10 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v11 = v10;
      else
        v11 = &quic_cid_describe_cid_buf1;
      v12 = ++quic_cid_describe_state;
      v13 = v9[38];
      v14 = 0uLL;
      *(_OWORD *)((char *)v11 + 25) = 0u;
      if (v13 >= 0x14)
        v15 = 20;
      else
        v15 = v13;
      *v11 = 0uLL;
      v11[1] = 0uLL;
      if ((_DWORD)v15)
      {
        v16 = v9 + 39;
        do
        {
          v17 = *v16++;
          snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
          --v15;
        }
        while (v15);
        v9 = *(unsigned __int8 **)(a1 + 1112);
        v12 = quic_cid_describe_state;
        v14 = 0uLL;
      }
      if (v12 % 3 == 2)
        v18 = &quic_cid_describe_cid_buf2;
      else
        v18 = &quic_cid_describe_cid_buf3;
      if (v12 % 3)
        v19 = v18;
      else
        v19 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v12 + 1;
      if (v9[17] >= 0x14u)
        v20 = 20;
      else
        v20 = v9[17];
      *v19 = v14;
      v19[1] = v14;
      *(_OWORD *)((char *)v19 + 25) = v14;
      if ((_DWORD)v20)
      {
        v21 = v9 + 18;
        do
        {
          v22 = *v21++;
          snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
          --v20;
        }
        while (v20);
      }
      *(_DWORD *)v8 = 136447234;
      *(_QWORD *)(v8 + 4) = "quic_conn_probe_connectivity_internal";
      *(_WORD *)(v8 + 12) = 2082;
      *(_QWORD *)(v8 + 14) = v79[0];
      *(_WORD *)(v8 + 22) = 2082;
      *(_QWORD *)(v8 + 24) = v11;
      *(_WORD *)(v8 + 32) = 2082;
      *(_QWORD *)(v8 + 34) = v19;
      *(_WORD *)(v8 + 42) = 1024;
      *(_DWORD *)(v8 + 44) = a2;
      qlog_internal(1, (uint64_t)v7, 4923);
    }
    return;
  }
  if (a2)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))&& *(_QWORD *)(a1 + 1112))
    {
      v23 = _os_log_pack_size();
      v24 = (char *)v79 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v25 = _os_log_pack_fill();
      v79[0] = a1 + 976;
      v26 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v27 = &quic_cid_describe_cid_buf2;
      else
        v27 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v28 = v27;
      else
        v28 = &quic_cid_describe_cid_buf1;
      v29 = ++quic_cid_describe_state;
      v30 = v26[38];
      v31 = 0uLL;
      *(_OWORD *)((char *)v28 + 25) = 0u;
      if (v30 >= 0x14)
        v32 = 20;
      else
        v32 = v30;
      *v28 = 0uLL;
      v28[1] = 0uLL;
      if ((_DWORD)v32)
      {
        v33 = v26 + 39;
        do
        {
          v34 = *v33++;
          snprintf((char *)v28, 0x29uLL, "%s%02x", (const char *)v28, v34);
          --v32;
        }
        while (v32);
        v26 = *(unsigned __int8 **)(a1 + 1112);
        v29 = quic_cid_describe_state;
        v31 = 0uLL;
      }
      if (v29 % 3 == 2)
        v35 = &quic_cid_describe_cid_buf2;
      else
        v35 = &quic_cid_describe_cid_buf3;
      if (v29 % 3)
        v36 = v35;
      else
        v36 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v29 + 1;
      if (v26[17] >= 0x14u)
        v37 = 20;
      else
        v37 = v26[17];
      *v36 = v31;
      v36[1] = v31;
      *(_OWORD *)((char *)v36 + 25) = v31;
      if ((_DWORD)v37)
      {
        v38 = v26 + 18;
        do
        {
          v39 = *v38++;
          snprintf((char *)v36, 0x29uLL, "%s%02x", (const char *)v36, v39);
          --v37;
        }
        while (v37);
      }
      *(_DWORD *)v25 = 136446978;
      *(_QWORD *)(v25 + 4) = "quic_conn_probe_connectivity_internal";
      *(_WORD *)(v25 + 12) = 2082;
      *(_QWORD *)(v25 + 14) = v79[0];
      *(_WORD *)(v25 + 22) = 2082;
      *(_QWORD *)(v25 + 24) = v28;
      *(_WORD *)(v25 + 32) = 2082;
      *(_QWORD *)(v25 + 34) = v36;
      qlog_internal(1, (uint64_t)v24, 4927);
      v5 = *(_QWORD *)v4;
    }
    *(_QWORD *)v4 = v5 | 0x200000;
    *(_QWORD *)(a1 + 624) = *(_QWORD *)(a1 + 616);
    LOWORD(v40) = 1;
  }
  else
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))&& *(_QWORD *)(a1 + 1112))
    {
      v41 = _os_log_pack_size();
      v42 = (char *)v79 - ((MEMORY[0x24BDAC7A8](v41, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v43 = _os_log_pack_fill();
      v79[0] = a1 + 976;
      v44 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v45 = &quic_cid_describe_cid_buf2;
      else
        v45 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v46 = v45;
      else
        v46 = &quic_cid_describe_cid_buf1;
      v47 = ++quic_cid_describe_state;
      v48 = v44[38];
      v49 = 0uLL;
      *(_OWORD *)((char *)v46 + 25) = 0u;
      if (v48 >= 0x14)
        v50 = 20;
      else
        v50 = v48;
      *v46 = 0uLL;
      v46[1] = 0uLL;
      if ((_DWORD)v50)
      {
        v51 = v44 + 39;
        do
        {
          v52 = *v51++;
          snprintf((char *)v46, 0x29uLL, "%s%02x", (const char *)v46, v52);
          --v50;
        }
        while (v50);
        v44 = *(unsigned __int8 **)(a1 + 1112);
        v47 = quic_cid_describe_state;
        v49 = 0uLL;
      }
      if (v47 % 3 == 2)
        v53 = &quic_cid_describe_cid_buf2;
      else
        v53 = &quic_cid_describe_cid_buf3;
      if (v47 % 3)
        v54 = v53;
      else
        v54 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v47 + 1;
      if (v44[17] >= 0x14u)
        v55 = 20;
      else
        v55 = v44[17];
      *v54 = v49;
      v54[1] = v49;
      *(_OWORD *)((char *)v54 + 25) = v49;
      if ((_DWORD)v55)
      {
        v56 = v44 + 18;
        do
        {
          v57 = *v56++;
          snprintf((char *)v54, 0x29uLL, "%s%02x", (const char *)v54, v57);
          --v55;
        }
        while (v55);
      }
      *(_DWORD *)v43 = 136446978;
      *(_QWORD *)(v43 + 4) = "quic_conn_probe_connectivity_internal";
      *(_WORD *)(v43 + 12) = 2082;
      *(_QWORD *)(v43 + 14) = v79[0];
      *(_WORD *)(v43 + 22) = 2082;
      *(_QWORD *)(v43 + 24) = v46;
      *(_WORD *)(v43 + 32) = 2082;
      *(_QWORD *)(v43 + 34) = v54;
      qlog_internal(1, (uint64_t)v42, 4932);
      v5 = *(_QWORD *)v4;
    }
    *(_QWORD *)v4 = v5 & 0xFFFFFFFFFF1FFFFFLL;
    v40 = *(_QWORD *)(a1 + 624) / 0xF4240uLL;
  }
  quic_conn_keepalive_configure(a1, (unsigned __int16)v40);
  stats_region = nw_protocol_instance_get_stats_region();
  v59 = &g_quic_stats;
  if (stats_region)
    v59 = (void *)stats_region;
  *(_QWORD *)(a1 + 1312) = v59;
  stats = nw_protocol_instance_get_stats();
  *(_QWORD *)(a1 + 1304) = stats;
  if (stats)
  {
    *(_QWORD *)(stats + 16) = *(_QWORD *)(a1 + 1144);
    v61 = *(_QWORD *)(a1 + 1304);
    if (v61)
    {
      *(_QWORD *)(v61 + 24) = *(_QWORD *)(a1 + 1152);
      v62 = *(_QWORD *)(a1 + 1304);
      if (v62)
      {
        *(_QWORD *)(v62 + 32) = *(_QWORD *)(a1 + 1160);
        v63 = *(_QWORD *)(a1 + 1304);
        if (v63)
        {
          *(_QWORD *)(v63 + 40) = *(_QWORD *)(a1 + 1168);
          v64 = *(_QWORD *)(a1 + 1304);
          if (v64)
          {
            *(_DWORD *)(v64 + 48) = *(_DWORD *)(a1 + 1176);
            v65 = *(_QWORD *)(a1 + 1304);
            if (v65)
            {
              *(_DWORD *)(v65 + 52) = *(_DWORD *)(a1 + 1180);
              v66 = *(_QWORD *)(a1 + 1304);
              if (v66)
              {
                *(_DWORD *)(v66 + 56) = *(_DWORD *)(a1 + 1188);
                v67 = *(_QWORD *)(a1 + 1304);
                if (v67)
                {
                  *(_DWORD *)(v67 + 60) = *(_DWORD *)(a1 + 1192);
                  v68 = *(_QWORD *)(a1 + 1304);
                  if (v68)
                  {
                    *(_DWORD *)(v68 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    v69 = *(_QWORD *)(a1 + 1304);
                    if (v69)
                      *(_DWORD *)(v69 + 124) = *(unsigned __int8 *)(a1 + 477);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v70 = *(_QWORD *)(a1 + 1112);
  if (!v70 || !quic_rtt_has_initial_measurement(*(_QWORD *)(v70 + 272)))
    goto LABEL_112;
  v71 = *(_QWORD *)(a1 + 1304);
  if (v71)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 68) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    v71 = *(_QWORD *)(a1 + 1304);
    if (v71)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 72) = (unint64_t)((4
                                                                     * (quic_rtt_get_smoothed_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                     * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      v71 = *(_QWORD *)(a1 + 1304);
      if (v71)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 76) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
LABEL_112:
        v71 = *(_QWORD *)(a1 + 1304);
        if (v71)
        {
          *(_OWORD *)(v71 + 128) = *(_OWORD *)(a1 + 1288);
          v71 = *(_QWORD *)(a1 + 1304);
        }
      }
    }
  }
  if ((*(_BYTE *)(v4 + 1) & 2) != 0)
  {
    if (!v71)
      return;
    v72 = *(_DWORD *)(v71 + 116) | 1;
  }
  else
  {
    if (!v71)
      return;
    v72 = *(_DWORD *)(v71 + 116) & 0xFFFFFFFE;
  }
  *(_DWORD *)(v71 + 116) = v72;
  v73 = *(_QWORD *)(a1 + 1304);
  if (v73)
  {
    *(_BYTE *)(v73 + 144) |= (*(_DWORD *)v4 & 0x200000) != 0;
    v74 = *(_QWORD *)(a1 + 1304);
    if (v74)
    {
      *(_BYTE *)(v74 + 144) |= (*(_DWORD *)v4 >> 22) & 2;
      v75 = *(_QWORD *)(a1 + 1304);
      if (v75)
        *(_BYTE *)(v75 + 144) |= (*(_DWORD *)v4 >> 19) & 8;
    }
  }
}

uint64_t quic_conn_max_message_size()
{
  return nw_protocol_instance_access_state();
}

uint64_t __quic_conn_max_message_size_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  BOOL v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;

  v2 = *(unsigned __int8 *)(a2 + 477);
  v3 = v2 == 9 || v2 == 6;
  if (v3 && nw_protocol_instance_get_level() != 3)
  {
    v6 = *(_QWORD *)(a2 + 544);
    if (v6)
    {
      v7 = 248;
      if ((*(_BYTE *)(v6 + 312) & 1) == 0)
        v7 = 240;
      LOWORD(v6) = *(_WORD *)(v6 + v7);
    }
    v13[0] = MEMORY[0x24BDAC760];
    v14 = __quic_conn_max_message_size_block_invoke_2;
    v15 = &__block_descriptor_tmp_133;
    v13[1] = 0x40000000;
    v8 = *(_QWORD *)(a1 + 32);
    v16 = a2;
    v17 = v8;
    v18 = v6;
    v9 = *(_QWORD *)(a2 + 1360);
    do
    {
      if (!v9)
        break;
      v10 = *(_QWORD *)(v9 + 312);
      v11 = ((uint64_t (*)(_QWORD *))v14)(v13);
      v9 = v10;
    }
    while ((v11 & 1) != 0);
  }
  return 1;
}

uint64_t __quic_conn_max_message_size_block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned __int16 maximum_message_size;
  uint64_t v5;
  unsigned int v7;
  unsigned __int16 v9;

  maximum_message_size = nw_protocol_instance_get_maximum_message_size();
  if (maximum_message_size)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 477) == 6)
    {
      if (maximum_message_size >= 0x4B0u && maximum_message_size <= *(unsigned __int16 *)(a2 + 424))
      {
        *(_WORD *)(a2 + 424) = maximum_message_size;
        quic_conn_set_mss(v5, a2, maximum_message_size);
        nw_retain(*(void **)(a1 + 40));
        nw_protocol_instance_async();
      }
    }
    else
    {
      v7 = *(unsigned __int16 *)(a1 + 48);
      if (maximum_message_size <= v7 || v7 == 0)
        v9 = maximum_message_size;
      else
        v9 = *(_WORD *)(a1 + 48);
      quic_conn_set_mss(*(_QWORD *)(a1 + 32), a2, v9);
    }
  }
  return 1;
}

void __quic_conn_max_message_size_block_invoke_3(uint64_t a1)
{
  nw_protocol_instance_access_state();
  nw_release(*(void **)(a1 + 32));
}

uint64_t __quic_conn_max_message_size_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _OWORD *v11;
  _OWORD *v12;
  int v13;
  unsigned int v14;
  __int128 v15;
  uint64_t v16;
  unsigned __int8 *v17;
  int v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int8 *)(a2 + 477) < 0xAu)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))&& *(_QWORD *)(a2 + 1112))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)v25 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      v25[0] = a2 + 976;
      v10 = *(unsigned __int8 **)(a2 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v11 = &quic_cid_describe_cid_buf2;
      else
        v11 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v12 = v11;
      else
        v12 = &quic_cid_describe_cid_buf1;
      v13 = ++quic_cid_describe_state;
      v14 = v10[38];
      v15 = 0uLL;
      *(_OWORD *)((char *)v12 + 25) = 0u;
      if (v14 >= 0x14)
        v16 = 20;
      else
        v16 = v14;
      *v12 = 0uLL;
      v12[1] = 0uLL;
      if ((_DWORD)v16)
      {
        v17 = v10 + 39;
        do
        {
          v18 = *v17++;
          snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v18);
          --v16;
        }
        while (v16);
        v10 = *(unsigned __int8 **)(a2 + 1112);
        v13 = quic_cid_describe_state;
        v15 = 0uLL;
      }
      if (v13 % 3 == 2)
        v19 = &quic_cid_describe_cid_buf2;
      else
        v19 = &quic_cid_describe_cid_buf3;
      if (v13 % 3)
        v20 = v19;
      else
        v20 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v13 + 1;
      if (v10[17] >= 0x14u)
        v21 = 20;
      else
        v21 = v10[17];
      *v20 = v15;
      v20[1] = v15;
      *(_OWORD *)((char *)v20 + 25) = v15;
      if ((_DWORD)v21)
      {
        v22 = v10 + 18;
        do
        {
          v23 = *v22++;
          snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
          --v21;
        }
        while (v21);
      }
      *(_DWORD *)v9 = 136446978;
      *(_QWORD *)(v9 + 4) = "quic_conn_max_message_size_block_invoke";
      *(_WORD *)(v9 + 12) = 2082;
      *(_QWORD *)(v9 + 14) = v25[0];
      *(_WORD *)(v9 + 22) = 2082;
      *(_QWORD *)(v9 + 24) = v12;
      *(_WORD *)(v9 + 32) = 2082;
      *(_QWORD *)(v9 + 34) = v20;
      qlog_internal(1, (uint64_t)v8, 5198);
    }
    quic_recovery_pto(*(_QWORD *)(a2 + 952), *(_QWORD *)(a1 + 32));
  }
  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v25 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_conn_max_message_size_block_invoke_4";
    qlog_internal(2, (uint64_t)v3, 5193);
  }
  return 1;
}

void quic_conn_link_advisory(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v13[6];
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v6 = _os_log_pack_size();
      v7 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      v9 = "admissable";
      if (a3)
        v9 = "flow controlled";
      *(_DWORD *)v8 = 136446466;
      *(_QWORD *)(v8 + 4) = "quic_conn_link_advisory";
      *(_WORD *)(v8 + 12) = 2082;
      *(_QWORD *)(v8 + 14) = v9;
      qlog_internal(2, (uint64_t)v7, 5229);
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = __quic_conn_link_advisory_block_invoke;
    v13[3] = &__block_descriptor_tmp_139;
    v14 = a3;
    v13[4] = a2;
    v13[5] = a1;
    nw_protocol_instance_access_state();
  }
  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v13 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "quic_conn_link_advisory";
    qlog_internal(17, (uint64_t)v11, 5225);
  }
}

uint64_t __quic_conn_link_advisory_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  BOOL is_flow_controlled;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t frame_pool;
  _QWORD *v9;
  uint64_t path;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _OWORD *v15;
  _OWORD *v16;
  int v17;
  unsigned int v18;
  __int128 v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  int v27;
  uint64_t v28;
  uint64_t flow_for_key;
  uint64_t stats_region;
  void *v31;
  uint64_t stats;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  _DWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t, _BYTE *);
  void *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = quic_conn_lookup_nw_path(a2, *(_QWORD *)(a1 + 32));
  if (!v4)
  {
    if (*(_QWORD *)(a1 + 32) != *MEMORY[0x24BDE0898])
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v47 = _os_log_pack_size();
        v48 = (char *)&v58 - ((MEMORY[0x24BDAC7A8](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v49 = _os_log_pack_fill();
        *(_DWORD *)v49 = 136446210;
        *(_QWORD *)(v49 + 4) = "quic_conn_link_advisory_block_invoke";
        qlog_internal(17, (uint64_t)v48, 5239);
      }
      return 1;
    }
    v4 = *(_QWORD *)(a2 + 1112);
  }
  is_flow_controlled = quic_path_is_flow_controlled(v4);
  quic_path_link_advisory(v4, *(unsigned __int8 *)(a1 + 48));
  v6 = quic_path_is_flow_controlled(v4);
  if (!is_flow_controlled)
  {
    if (v6)
    {
      if (__quic_signpost_is_enabled__quic_signposts_once_3882[0] != -1)
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3882, &__block_literal_global_192);
      if (__quic_signpost_is_enabled__quic_signposts_enabled_3883 && kdebug_is_enabled())
        kdebug_trace();
      if (*(_BYTE *)(a2 + 477) == 9 && *(_QWORD *)(a2 + 896))
      {
        v45 = *(unsigned __int8 *)(a2 + 600);
        if (v45 >= 6)
          v46 = 0;
        else
          v46 = 0x30303020100uLL >> (8 * v45);
        quic_recovery_get_largest_acked_sent_time(*(_QWORD *)(a2 + 952), v46 & 3, v4);
        quic_cc_link_flow_controlled(*(_QWORD *)(v4 + 360));
      }
    }
    return 1;
  }
  if (v6)
    return 1;
  if (__quic_signpost_is_enabled__quic_signposts_once_3882[0] != -1)
    dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3882, &__block_literal_global_192);
  if (__quic_signpost_is_enabled__quic_signposts_enabled_3883 && kdebug_is_enabled())
    kdebug_trace();
  if (*(_BYTE *)(a2 + 477) == 9)
  {
    quic_ack_immediately(*(_QWORD *)(a2 + 960));
    if (!quic_packet_builder_has_ack_eliciting_frame(*(_QWORD *)(a2 + 560), 3u))
    {
      v7 = *(_QWORD *)(a2 + 560);
      frame_pool = quic_packet_builder_get_frame_pool(v7);
      v9 = quic_frame_create(frame_pool, 1);
      *((_WORD *)v9 + 4) = 1;
      *((_BYTE *)v9 + 120) &= 0xF9u;
      quic_packet_builder_append_for_pn_space(v7, (uint64_t)v9, 3u);
    }
  }
  path = quic_conn_select_next_path((_QWORD *)a2, (uint64_t)&__block_literal_global_98);
  if ((quic_conn_send_internal(a2, path, 0) & 1) == 0
    && (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && *(_QWORD *)(a2 + 1112))
  {
    v11 = _os_log_pack_size();
    v12 = (char *)&v58 - ((MEMORY[0x24BDAC7A8](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = _os_log_pack_fill();
    v59 = a2 + 976;
    v14 = *(unsigned __int8 **)(a2 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v15 = &quic_cid_describe_cid_buf2;
    else
      v15 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v16 = v15;
    else
      v16 = &quic_cid_describe_cid_buf1;
    v17 = ++quic_cid_describe_state;
    v18 = v14[38];
    v19 = 0uLL;
    *(_OWORD *)((char *)v16 + 25) = 0u;
    if (v18 >= 0x14)
      v20 = 20;
    else
      v20 = v18;
    *v16 = 0uLL;
    v16[1] = 0uLL;
    if ((_DWORD)v20)
    {
      v21 = v14 + 39;
      do
      {
        v22 = *v21++;
        snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
        --v20;
      }
      while (v20);
      v14 = *(unsigned __int8 **)(a2 + 1112);
      v17 = quic_cid_describe_state;
      v19 = 0uLL;
    }
    if (v17 % 3 == 2)
      v23 = &quic_cid_describe_cid_buf2;
    else
      v23 = &quic_cid_describe_cid_buf3;
    if (v17 % 3)
      v24 = v23;
    else
      v24 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v17 + 1;
    if (v14[17] >= 0x14u)
      v25 = 20;
    else
      v25 = v14[17];
    *v24 = v19;
    v24[1] = v19;
    *(_OWORD *)((char *)v24 + 25) = v19;
    if ((_DWORD)v25)
    {
      v26 = v14 + 18;
      do
      {
        v27 = *v26++;
        snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v27);
        --v25;
      }
      while (v25);
    }
    *(_DWORD *)v13 = 136446978;
    *(_QWORD *)(v13 + 4) = "quic_conn_link_advisory_block_invoke";
    *(_WORD *)(v13 + 12) = 2082;
    *(_QWORD *)(v13 + 14) = v59;
    *(_WORD *)(v13 + 22) = 2082;
    *(_QWORD *)(v13 + 24) = v16;
    *(_WORD *)(v13 + 32) = 2082;
    *(_QWORD *)(v13 + 34) = v24;
    qlog_internal(16, (uint64_t)v12, 5286);
  }
  v28 = MEMORY[0x24BDAC760];
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 0x40000000;
  v60[2] = __quic_conn_link_advisory_block_invoke_137;
  v60[3] = &__block_descriptor_tmp_138;
  v60[4] = a2;
  if (a2)
  {
    v61 = -1;
    flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(a2 + 477) == 9)
    {
      v61 = v28;
      v62 = 0x40000000;
      v63 = __quic_enumerate_open_data_streams_block_invoke;
      v64 = &unk_24C2E1C10;
      v65 = v60;
      v66 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v55 = _os_log_pack_size();
    v56 = (char *)&v58 - ((MEMORY[0x24BDAC7A8](v55, v55) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v57 = _os_log_pack_fill();
    *(_DWORD *)v57 = 136446210;
    *(_QWORD *)(v57 + 4) = "quic_enumerate_open_data_streams";
    qlog_internal(17, (uint64_t)v56, 676);
  }
  nw_protocol_implementation_finalize_pending_frames();
  stats_region = nw_protocol_instance_get_stats_region();
  v31 = &g_quic_stats;
  if (stats_region)
    v31 = (void *)stats_region;
  *(_QWORD *)(a2 + 1312) = v31;
  stats = nw_protocol_instance_get_stats();
  *(_QWORD *)(a2 + 1304) = stats;
  if (stats)
  {
    *(_QWORD *)(stats + 16) = *(_QWORD *)(a2 + 1144);
    v33 = *(_QWORD *)(a2 + 1304);
    if (v33)
    {
      *(_QWORD *)(v33 + 24) = *(_QWORD *)(a2 + 1152);
      v34 = *(_QWORD *)(a2 + 1304);
      if (v34)
      {
        *(_QWORD *)(v34 + 32) = *(_QWORD *)(a2 + 1160);
        v35 = *(_QWORD *)(a2 + 1304);
        if (v35)
        {
          *(_QWORD *)(v35 + 40) = *(_QWORD *)(a2 + 1168);
          v36 = *(_QWORD *)(a2 + 1304);
          if (v36)
          {
            *(_DWORD *)(v36 + 48) = *(_DWORD *)(a2 + 1176);
            v37 = *(_QWORD *)(a2 + 1304);
            if (v37)
            {
              *(_DWORD *)(v37 + 52) = *(_DWORD *)(a2 + 1180);
              v38 = *(_QWORD *)(a2 + 1304);
              if (v38)
              {
                *(_DWORD *)(v38 + 56) = *(_DWORD *)(a2 + 1188);
                v39 = *(_QWORD *)(a2 + 1304);
                if (v39)
                {
                  *(_DWORD *)(v39 + 60) = *(_DWORD *)(a2 + 1192);
                  v40 = *(_QWORD *)(a2 + 1304);
                  if (v40)
                  {
                    *(_DWORD *)(v40 + 60) = *(unsigned __int8 *)(a2 + 477) == 9;
                    v41 = *(_QWORD *)(a2 + 1304);
                    if (v41)
                      *(_DWORD *)(v41 + 124) = *(unsigned __int8 *)(a2 + 477);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v42 = *(_QWORD *)(a2 + 1112);
  if (!v42 || !quic_rtt_has_initial_measurement(*(_QWORD *)(v42 + 272)))
    goto LABEL_67;
  v43 = *(_QWORD *)(a2 + 1304);
  if (v43)
  {
    *(_DWORD *)(*(_QWORD *)(a2 + 1304) + 68) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(_QWORD *)(*(_QWORD *)(a2 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    v43 = *(_QWORD *)(a2 + 1304);
    if (v43)
    {
      *(_DWORD *)(*(_QWORD *)(a2 + 1304) + 72) = (unint64_t)((4
                                                                     * (quic_rtt_get_smoothed_rtt(*(_QWORD *)(*(_QWORD *)(a2 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                     * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      v43 = *(_QWORD *)(a2 + 1304);
      if (v43)
      {
        *(_DWORD *)(*(_QWORD *)(a2 + 1304) + 76) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(_QWORD *)(*(_QWORD *)(a2 + 1112) + 272)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
LABEL_67:
        v43 = *(_QWORD *)(a2 + 1304);
        if (v43)
        {
          *(_OWORD *)(v43 + 128) = *(_OWORD *)(a2 + 1288);
          v43 = *(_QWORD *)(a2 + 1304);
        }
      }
    }
  }
  if ((*(_BYTE *)(a2 + 1381) & 2) != 0)
  {
    if (!v43)
      return 1;
    v44 = *(_DWORD *)(v43 + 116) | 1;
  }
  else
  {
    if (!v43)
      return 1;
    v44 = *(_DWORD *)(v43 + 116) & 0xFFFFFFFE;
  }
  *(_DWORD *)(v43 + 116) = v44;
  v50 = *(_QWORD *)(a2 + 1304);
  if (v50)
  {
    v51 = (_DWORD *)(a2 + 1380);
    *(_BYTE *)(v50 + 144) |= (*(_DWORD *)(a2 + 1380) & 0x200000) != 0;
    v52 = *(_QWORD *)(a2 + 1304);
    if (v52)
    {
      *(_BYTE *)(v52 + 144) |= (*v51 >> 22) & 2;
      v53 = *(_QWORD *)(a2 + 1304);
      if (v53)
        *(_BYTE *)(v53 + 144) |= (*v51 >> 19) & 8;
    }
  }
  return 1;
}

uint64_t __quic_conn_link_advisory_block_invoke_137(uint64_t a1, uint64_t a2, uint64_t a3)
{
  quic_fc_service_pending_send_data(*(_QWORD *)(a1 + 32), a2, a3);
  return 1;
}

void quic_conn_link_congestion_update(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a3)
    {
      v11[1] = MEMORY[0x24BDAC760];
      v11[2] = 0x40000000;
      v11[3] = __quic_conn_link_congestion_update_block_invoke;
      v11[4] = &__block_descriptor_tmp_140;
      v11[5] = a2;
      v11[6] = a3;
      nw_protocol_instance_access_state();
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)(v10 + 4) = "quic_conn_link_congestion_update";
      v6 = (uint64_t)v9;
      v7 = 5312;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v3 = _os_log_pack_size();
    v4 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136446210;
    *(_QWORD *)(v5 + 4) = "quic_conn_link_congestion_update";
    v6 = (uint64_t)v4;
    v7 = 5311;
LABEL_13:
    qlog_internal(17, v6, v7);
  }
}

uint64_t __quic_conn_link_congestion_update_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = quic_conn_lookup_nw_path(a2, *(_QWORD *)(a1 + 32));
  if (v4)
    goto LABEL_4;
  if (*(_QWORD *)(a1 + 32) == *MEMORY[0x24BDE0898])
  {
    v4 = *(_QWORD *)(a2 + 1112);
LABEL_4:
    quic_cc_process_link_congestion_info(*(_QWORD *)(v4 + 360));
    return 1;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v9 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "quic_conn_link_congestion_update_block_invoke";
    qlog_internal(17, (uint64_t)v7, 5323);
  }
  return 1;
}

uint64_t quic_conn_copy_info()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2000000000;
  v5 = 0;
  nw_protocol_instance_access_state();
  v0 = v3[3];
  _Block_object_dispose(&v2, 8);
  return v0;
}

uint64_t __quic_conn_copy_info_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  _OWORD *v16;
  _OWORD *v17;
  int v18;
  unsigned int v19;
  __int128 v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  int v28;
  unsigned __int8 *v29;
  _QWORD v31[2];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 477) == 9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nw_quic_info_allocate();
    if ((quic_migration_is_disabled(*(_QWORD *)(a2 + 1120)) & 1) == 0)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      *(_DWORD *)(v4 + 12) |= 2u;
      if (quic_migration_multipath_ready(*(_QWORD *)(a2 + 1120)))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        *(_DWORD *)(v5 + 12) |= 1u;
      }
      v6 = quic_migration_count_in_state(*(_QWORD *)(a2 + 1120), 5);
      v7 = quic_migration_count_in_state(*(_QWORD *)(a2 + 1120), 7) + v6;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 8) = v7
                                                                                     + quic_migration_count_in_state(*(_QWORD *)(a2 + 1120), 8);
    }
    if (quic_cid_array_is_empty(*(unsigned __int8 **)(a2 + 376)))
    {
      v8 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled)
          v8 = 1;
        if ((v8 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          v9 = _os_log_pack_size();
          v10 = (char *)v31 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v11 = _os_log_pack_fill();
          *(_DWORD *)v11 = 136446210;
          *(_QWORD *)(v11 + 4) = "quic_conn_copy_info_block_invoke";
          qlog_internal(2, (uint64_t)v10, 5483);
        }
      }
    }
    else
    {
      v29 = *(unsigned __int8 **)(a2 + 376);
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 0x40000000;
      v32[2] = __quic_conn_copy_info_block_invoke_143;
      v32[3] = &unk_24C2E2740;
      v32[4] = *(_QWORD *)(a1 + 32);
      quic_cid_array_apply(v29, (uint64_t)v32);
    }
  }
  else if ((qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
         && *(_QWORD *)(a2 + 1112))
  {
    v12 = _os_log_pack_size();
    v31[1] = v31;
    v13 = (char *)v31 - ((MEMORY[0x24BDAC7A8](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v14 = _os_log_pack_fill();
    v31[0] = a2 + 976;
    v15 = *(unsigned __int8 **)(a2 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v16 = &quic_cid_describe_cid_buf2;
    else
      v16 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v17 = v16;
    else
      v17 = &quic_cid_describe_cid_buf1;
    v18 = ++quic_cid_describe_state;
    v19 = v15[38];
    v20 = 0uLL;
    *(_OWORD *)((char *)v17 + 25) = 0u;
    if (v19 >= 0x14)
      v21 = 20;
    else
      v21 = v19;
    *v17 = 0uLL;
    v17[1] = 0uLL;
    if ((_DWORD)v21)
    {
      v22 = v15 + 39;
      do
      {
        v23 = *v22++;
        snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v23);
        --v21;
      }
      while (v21);
      v15 = *(unsigned __int8 **)(a2 + 1112);
      v18 = quic_cid_describe_state;
      v20 = 0uLL;
    }
    if (v18 % 3 == 2)
      v24 = &quic_cid_describe_cid_buf2;
    else
      v24 = &quic_cid_describe_cid_buf3;
    if (v18 % 3)
      v25 = v24;
    else
      v25 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v18 + 1;
    if (v15[17] >= 0x14u)
      v26 = 20;
    else
      v26 = v15[17];
    *v25 = v20;
    v25[1] = v20;
    *(_OWORD *)((char *)v25 + 25) = v20;
    if ((_DWORD)v26)
    {
      v27 = v15 + 18;
      do
      {
        v28 = *v27++;
        snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
        --v26;
      }
      while (v26);
    }
    *(_DWORD *)v14 = 136446978;
    *(_QWORD *)(v14 + 4) = "quic_conn_copy_info_block_invoke";
    *(_WORD *)(v14 + 12) = 2082;
    *(_QWORD *)(v14 + 14) = v31[0];
    *(_WORD *)(v14 + 22) = 2082;
    *(_QWORD *)(v14 + 24) = v17;
    *(_WORD *)(v14 + 32) = 2082;
    *(_QWORD *)(v14 + 34) = v25;
    qlog_internal(16, (uint64_t)v13, 5468);
  }
  return 1;
}

uint64_t __quic_conn_copy_info_block_invoke_143(uint64_t a1, unsigned __int8 *a2)
{
  NSObject *v2;

  v2 = quic_cid_to_dispatch_data(a2);
  nw_array_append();
  if (v2)
    dispatch_release(v2);
  return 1;
}

void quic_conn_handle_error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a4)
    {
      v12[1] = MEMORY[0x24BDAC760];
      v12[2] = 0x40000000;
      v12[3] = __quic_conn_handle_error_block_invoke;
      v12[4] = &__block_descriptor_tmp_147;
      v12[5] = a4;
      v12[6] = a3;
      nw_protocol_instance_access_state();
      return;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v9 = _os_log_pack_size();
      v10 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v11 = _os_log_pack_fill();
      *(_DWORD *)v11 = 136446210;
      *(_QWORD *)(v11 + 4) = "quic_conn_handle_error";
      v7 = (uint64_t)v10;
      v8 = 5590;
      goto LABEL_13;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v4 = _os_log_pack_size();
    v5 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v6 + 4) = "quic_conn_handle_error";
    v7 = (uint64_t)v5;
    v8 = 5589;
LABEL_13:
    qlog_internal(17, v7, v8);
  }
}

uint64_t __quic_conn_handle_error_block_invoke(uint64_t a1, uint64_t a2)
{
  quic_conn_handle_error_inner(a2, *(nw_error_t *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return 1;
}

void quic_conn_handle_error_inner(uint64_t a1, nw_error_t error, uint64_t a3)
{
  nw_error_domain_t error_domain;
  int error_code;
  int v8;
  _QWORD *v9;
  uint64_t stats_region;
  void *v11;
  uint64_t stats;
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
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  _OWORD *v40;
  _OWORD *v41;
  int v42;
  unsigned int v43;
  __int128 v44;
  uint64_t v45;
  unsigned __int8 *v46;
  int v47;
  _OWORD *v48;
  _OWORD *v49;
  uint64_t v50;
  unsigned __int8 *v51;
  int v52;
  char *v53;
  unint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  unsigned __int8 *v61;
  _OWORD *v62;
  _OWORD *v63;
  int v64;
  unsigned int v65;
  __int128 v66;
  uint64_t v67;
  unsigned __int8 *v68;
  int v69;
  _OWORD *v70;
  _OWORD *v71;
  uint64_t v72;
  unsigned __int8 *v73;
  int v74;
  void *v75;
  void *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t);
  void *v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v77 = _os_log_pack_size();
    v78 = (char *)&v80 - ((MEMORY[0x24BDAC7A8](v77, v77) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v79 = _os_log_pack_fill();
    *(_DWORD *)v79 = 136446210;
    *(_QWORD *)(v79 + 4) = "quic_conn_handle_error_inner";
    v28 = (uint64_t)v78;
    v29 = 5521;
LABEL_28:
    qlog_internal(17, v28, v29);
    return;
  }
  error_domain = nw_error_get_error_domain(error);
  error_code = nw_error_get_error_code(error);
  if (error_domain != nw_error_domain_posix)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v25 = _os_log_pack_size();
    v26 = (char *)&v80 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136446466;
    *(_QWORD *)(v27 + 4) = "quic_conn_handle_error_inner";
    *(_WORD *)(v27 + 12) = 1024;
    *(_DWORD *)(v27 + 14) = error_domain;
    v28 = (uint64_t)v26;
    v29 = 5527;
    goto LABEL_28;
  }
  v8 = error_code;
  v9 = (_QWORD *)MEMORY[0x24BDE0898];
  stats_region = nw_protocol_instance_get_stats_region();
  v11 = &g_quic_stats;
  if (stats_region)
    v11 = (void *)stats_region;
  *(_QWORD *)(a1 + 1312) = v11;
  stats = nw_protocol_instance_get_stats();
  *(_QWORD *)(a1 + 1304) = stats;
  if (stats)
  {
    *(_QWORD *)(stats + 16) = *(_QWORD *)(a1 + 1144);
    v13 = *(_QWORD *)(a1 + 1304);
    if (v13)
    {
      *(_QWORD *)(v13 + 24) = *(_QWORD *)(a1 + 1152);
      v14 = *(_QWORD *)(a1 + 1304);
      if (v14)
      {
        *(_QWORD *)(v14 + 32) = *(_QWORD *)(a1 + 1160);
        v15 = *(_QWORD *)(a1 + 1304);
        if (v15)
        {
          *(_QWORD *)(v15 + 40) = *(_QWORD *)(a1 + 1168);
          v16 = *(_QWORD *)(a1 + 1304);
          if (v16)
          {
            *(_DWORD *)(v16 + 48) = *(_DWORD *)(a1 + 1176);
            v17 = *(_QWORD *)(a1 + 1304);
            if (v17)
            {
              *(_DWORD *)(v17 + 52) = *(_DWORD *)(a1 + 1180);
              v18 = *(_QWORD *)(a1 + 1304);
              if (v18)
              {
                *(_DWORD *)(v18 + 56) = *(_DWORD *)(a1 + 1188);
                v19 = *(_QWORD *)(a1 + 1304);
                if (v19)
                {
                  *(_DWORD *)(v19 + 60) = *(_DWORD *)(a1 + 1192);
                  v20 = *(_QWORD *)(a1 + 1304);
                  if (v20)
                  {
                    *(_DWORD *)(v20 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    v21 = *(_QWORD *)(a1 + 1304);
                    if (v21)
                      *(_DWORD *)(v21 + 124) = *(unsigned __int8 *)(a1 + 477);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v22 = *(_QWORD *)(a1 + 1112);
  if (v22 && quic_rtt_has_initial_measurement(*(_QWORD *)(v22 + 272)))
  {
    if (!*(_QWORD *)(a1 + 1304))
      goto LABEL_29;
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 68) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    if (!*(_QWORD *)(a1 + 1304))
      goto LABEL_29;
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 72) = (unint64_t)((4
                                                                   * (quic_rtt_get_smoothed_rtt(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    if (!*(_QWORD *)(a1 + 1304))
      goto LABEL_29;
    *(_DWORD *)(*(_QWORD *)(a1 + 1304) + 76) = (unint64_t)((2
                                                                   * (quic_rtt_get_rtt_variance(*(_QWORD *)(*(_QWORD *)(a1 + 1112) + 272)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
  }
  v23 = *(_QWORD *)(a1 + 1304);
  if (v23)
  {
    *(_OWORD *)(v23 + 128) = *(_OWORD *)(a1 + 1288);
    v24 = *(_QWORD *)(a1 + 1304);
    goto LABEL_30;
  }
LABEL_29:
  v24 = 0;
LABEL_30:
  v30 = (uint64_t *)(a1 + 1380);
  v31 = *(_QWORD *)(a1 + 1380);
  if ((v31 & 0x200) != 0)
  {
    if (!v24)
      goto LABEL_39;
    v32 = *(_DWORD *)(v24 + 116) | 1;
  }
  else
  {
    if (!v24)
      goto LABEL_39;
    v32 = *(_DWORD *)(v24 + 116) & 0xFFFFFFFE;
  }
  *(_DWORD *)(v24 + 116) = v32;
  v33 = *(_QWORD *)(a1 + 1304);
  v31 = *v30;
  if (v33)
  {
    *(_BYTE *)(v33 + 144) |= (v31 & 0x200000) != 0;
    v34 = *(_QWORD *)(a1 + 1304);
    v31 = *v30;
    if (v34)
    {
      *(_BYTE *)(v34 + 144) |= (v31 >> 22) & 2;
      v35 = *(_QWORD *)(a1 + 1304);
      v31 = *v30;
      if (v35)
      {
        *(_BYTE *)(v35 + 144) |= (v31 >> 19) & 8;
        v31 = *v30;
      }
    }
  }
LABEL_39:
  if ((v31 & 0x10000) != 0)
    return;
  *v30 = v31 | 0x10000;
  if ((qlog_debug_enabled
     || (qlog_nwlog_enabled & 1) != 0
     || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
    && *(_QWORD *)(a1 + 1112))
  {
    LODWORD(v83) = v8;
    v36 = _os_log_pack_size();
    v82 = &v80;
    v37 = MEMORY[0x24BDAC7A8](v36, v36);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v81 = (char *)&v80 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    v39 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v40 = &quic_cid_describe_cid_buf2;
    else
      v40 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v41 = v40;
    else
      v41 = &quic_cid_describe_cid_buf1;
    v42 = ++quic_cid_describe_state;
    v43 = v39[38];
    v44 = 0uLL;
    *(_OWORD *)((char *)v41 + 25) = 0u;
    if (v43 >= 0x14)
      v45 = 20;
    else
      v45 = v43;
    *v41 = 0uLL;
    v41[1] = 0uLL;
    if ((_DWORD)v45)
    {
      v46 = v39 + 39;
      do
      {
        v47 = *v46++;
        snprintf((char *)v41, 0x29uLL, "%s%02x", (const char *)v41, v47);
        --v45;
      }
      while (v45);
      v39 = *(unsigned __int8 **)(a1 + 1112);
      v42 = quic_cid_describe_state;
      v44 = 0uLL;
    }
    v80 = a1 + 976;
    if (v42 % 3 == 2)
      v48 = &quic_cid_describe_cid_buf2;
    else
      v48 = &quic_cid_describe_cid_buf3;
    if (v42 % 3)
      v49 = v48;
    else
      v49 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v42 + 1;
    if (v39[17] >= 0x14u)
      v50 = 20;
    else
      v50 = v39[17];
    *v49 = v44;
    v49[1] = v44;
    *(_OWORD *)((char *)v49 + 25) = v44;
    if ((_DWORD)v50)
    {
      v51 = v39 + 18;
      do
      {
        v52 = *v51++;
        snprintf((char *)v49, 0x29uLL, "%s%02x", (const char *)v49, v52);
        --v50;
      }
      while (v50);
    }
    v8 = (int)v83;
    v53 = strerror((int)v83);
    v54 = *(unsigned __int8 *)(a1 + 477);
    if (v54 > 0xB)
      v55 = "???";
    else
      v55 = off_24C2E05F8[v54];
    *(_DWORD *)v38 = 136447746;
    *(_QWORD *)(v38 + 4) = "quic_conn_handle_error_inner";
    *(_WORD *)(v38 + 12) = 2082;
    v56 = (uint64_t)v81;
    *(_QWORD *)(v38 + 14) = v80;
    *(_WORD *)(v38 + 22) = 2082;
    *(_QWORD *)(v38 + 24) = v41;
    *(_WORD *)(v38 + 32) = 2082;
    *(_QWORD *)(v38 + 34) = v49;
    *(_WORD *)(v38 + 42) = 2082;
    *(_QWORD *)(v38 + 44) = v53;
    *(_WORD *)(v38 + 52) = 2080;
    *(_QWORD *)(v38 + 54) = v55;
    *(_WORD *)(v38 + 62) = 2048;
    *(_QWORD *)(v38 + 64) = a3;
    qlog_internal(0, v56, 5543);
    v9 = (_QWORD *)MEMORY[0x24BDE0898];
  }
  v57 = *(_QWORD *)(a1 + 1360);
  if (*v9 == a3)
  {
    if (!v57)
      goto LABEL_83;
    while ((*(_WORD *)(v57 + 431) & 1) == 0)
    {
      v57 = *(_QWORD *)(v57 + 312);
      if (!v57)
        goto LABEL_83;
    }
  }
  else
  {
    if (!v57)
      goto LABEL_83;
    while (*(_QWORD *)v57 != a3)
    {
      v57 = *(_QWORD *)(v57 + 312);
      if (!v57)
        goto LABEL_83;
    }
  }
  quic_migration_handle_error(*(_QWORD *)(a1 + 1120), v57);
LABEL_83:
  if ((v8 - 9) <= 0x38)
  {
    if (((1 << (v8 - 9)) & 0x101050000000000) != 0)
    {
      if (quic_migration_has_alternate_path(*(_QWORD *)(a1 + 1120), a3))
      {
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && *(_QWORD *)(a1 + 1112))
        {
          v58 = _os_log_pack_size();
          v83 = &v80;
          v59 = (char *)&v80 - ((MEMORY[0x24BDAC7A8](v58, v58) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v60 = _os_log_pack_fill();
          v82 = (uint64_t *)(a1 + 976);
          v61 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v62 = &quic_cid_describe_cid_buf2;
          else
            v62 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v63 = v62;
          else
            v63 = &quic_cid_describe_cid_buf1;
          v64 = ++quic_cid_describe_state;
          v65 = v61[38];
          v66 = 0uLL;
          *(_OWORD *)((char *)v63 + 25) = 0u;
          if (v65 >= 0x14)
            v67 = 20;
          else
            v67 = v65;
          *v63 = 0uLL;
          v63[1] = 0uLL;
          if ((_DWORD)v67)
          {
            v68 = v61 + 39;
            do
            {
              v69 = *v68++;
              snprintf((char *)v63, 0x29uLL, "%s%02x", (const char *)v63, v69);
              --v67;
            }
            while (v67);
            v61 = *(unsigned __int8 **)(a1 + 1112);
            v64 = quic_cid_describe_state;
            v66 = 0uLL;
          }
          if (v64 % 3 == 2)
            v70 = &quic_cid_describe_cid_buf2;
          else
            v70 = &quic_cid_describe_cid_buf3;
          if (v64 % 3)
            v71 = v70;
          else
            v71 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v64 + 1;
          if (v61[17] >= 0x14u)
            v72 = 20;
          else
            v72 = v61[17];
          *v71 = v66;
          v71[1] = v66;
          *(_OWORD *)((char *)v71 + 25) = v66;
          if ((_DWORD)v72)
          {
            v73 = v61 + 18;
            do
            {
              v74 = *v73++;
              snprintf((char *)v71, 0x29uLL, "%s%02x", (const char *)v71, v74);
              --v72;
            }
            while (v72);
          }
          *(_DWORD *)v60 = 136446978;
          *(_QWORD *)(v60 + 4) = "quic_conn_handle_error_inner";
          *(_WORD *)(v60 + 12) = 2082;
          *(_QWORD *)(v60 + 14) = v82;
          *(_WORD *)(v60 + 22) = 2082;
          *(_QWORD *)(v60 + 24) = v63;
          *(_WORD *)(v60 + 32) = 2082;
          *(_QWORD *)(v60 + 34) = v71;
          qlog_internal(0, (uint64_t)v59, 5553);
        }
        return;
      }
    }
    else if (v8 == 9 && !*(_QWORD *)(a1 + 1104))
    {
      v75 = *(void **)(a1 + 1104);
      if (v75)
      {
        nw_release(v75);
        *(_QWORD *)(a1 + 1104) = 0;
      }
      *(_QWORD *)(a1 + 1104) = nw_error_create_posix_error();
    }
  }
  if (!*(_QWORD *)(a1 + 1104))
    *(_QWORD *)(a1 + 1104) = nw_retain(error);
  nw_protocol_instance_report_done();
  v76 = nw_retain(*(void **)a1);
  v84 = MEMORY[0x24BDAC760];
  v85 = 0x40000000;
  v86 = __quic_conn_drain_connection_async_block_invoke;
  v87 = &__block_descriptor_tmp_247;
  v88 = v76;
  nw_protocol_instance_async();
  *v30 &= ~0x10000uLL;
}

void __quic_conn_drain_connection_async_block_invoke(uint64_t a1)
{
  nw_protocol_instance_access_state();
  nw_release(*(void **)(a1 + 32));
}

uint64_t __quic_conn_drain_connection_async_block_invoke_2(uint64_t a1, uint64_t a2)
{
  quic_conn_drain(a2);
  return 1;
}

void quic_conn_send_fc_credit(uint64_t a1)
{
  uint64_t path;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 477) <= 9u && quic_prepare_max_data((_QWORD *)a1))
    {
      quic_frame_alloc_MAX_DATA(*(_QWORD *)(a1 + 560), *(_QWORD *)(a1 + 856));
      path = quic_conn_select_next_path((_QWORD *)a1, (uint64_t)&__block_literal_global_98);
      if ((quic_conn_send_internal(a1, path, 0) & 1) == 0
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        v3 = _os_log_pack_size();
        v4 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v5 = _os_log_pack_fill();
        *(_DWORD *)v5 = 136446210;
        *(_QWORD *)(v5 + 4) = "quic_conn_send_fc_credit";
        v6 = 2;
        v7 = (uint64_t)v4;
        v8 = 5619;
LABEL_9:
        qlog_internal(v6, v7, v8);
      }
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v9 = _os_log_pack_size();
    v10 = (char *)v12 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136446210;
    *(_QWORD *)(v11 + 4) = "quic_conn_send_fc_credit";
    v6 = 17;
    v7 = (uint64_t)v10;
    v8 = 5604;
    goto LABEL_9;
  }
}

void quic_conn_destroy_path(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v10 = _os_log_pack_size();
    v11 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "quic_conn_destroy_path";
    v13 = (uint64_t)v11;
    v14 = 5707;
LABEL_24:
    qlog_internal(17, v13, v14);
    return;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v15 = _os_log_pack_size();
    v16 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136446210;
    *(_QWORD *)(v17 + 4) = "quic_conn_destroy_path";
    v13 = (uint64_t)v16;
    v14 = 5708;
    goto LABEL_24;
  }
  if (a1[139] == a2 && (quic_conn_change_current_path(a1, a2) & 1) == 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136446466;
      *(_QWORD *)(v9 + 4) = "quic_conn_destroy_path";
      *(_WORD *)(v9 + 12) = 2048;
      *(_QWORD *)(v9 + 14) = a2;
      qlog_internal(2, (uint64_t)v8, 5715);
    }
    *(_WORD *)(a2 + 431) |= 0x80u;
  }
  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v4 = _os_log_pack_size();
      v5 = (char *)v18 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v6 = _os_log_pack_fill();
      *(_DWORD *)v6 = 136446466;
      *(_QWORD *)(v6 + 4) = "quic_conn_destroy_path";
      *(_WORD *)(v6 + 12) = 2048;
      *(_QWORD *)(v6 + 14) = a2;
      qlog_internal(2, (uint64_t)v5, 5720);
    }
    _quic_path_destroy((uint64_t)(a1 + 170), a1, (_QWORD *)a2);
  }
}

uint64_t quic_conn_change_current_path(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  _OWORD *v10;
  _OWORD *v11;
  int v12;
  unsigned int v13;
  __int128 v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a1[170];
  if (v3)
  {
    v4 = 0;
    do
    {
      if (v3 != a2)
      {
        v5 = *(unsigned __int8 *)(v3 + 16);
        if (v5 == 8)
        {
          quic_migration_evaluate_primary(a1[140], v3);
          quic_migration_migrate(a1[140], (uint64_t)a1, v3, 0);
          return 1;
        }
        if (v5 > 3)
          v4 = v3;
      }
      v3 = *(_QWORD *)(v3 + 312);
    }
    while (v3);
    if (v4)
      return 0;
  }
  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && a1[139])
  {
    v6 = _os_log_pack_size();
    v26 = &v24;
    v7 = (char *)&v24 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    v25 = a1 + 122;
    v9 = (unsigned __int8 *)a1[139];
    if (quic_cid_describe_state % 3 == 2)
      v10 = &quic_cid_describe_cid_buf2;
    else
      v10 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v11 = v10;
    else
      v11 = &quic_cid_describe_cid_buf1;
    v12 = ++quic_cid_describe_state;
    v13 = v9[38];
    v14 = 0uLL;
    *(_OWORD *)((char *)v11 + 25) = 0u;
    if (v13 >= 0x14)
      v15 = 20;
    else
      v15 = v13;
    *v11 = 0uLL;
    v11[1] = 0uLL;
    if ((_DWORD)v15)
    {
      v16 = v9 + 39;
      do
      {
        v17 = *v16++;
        snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
        --v15;
      }
      while (v15);
      v9 = (unsigned __int8 *)a1[139];
      v12 = quic_cid_describe_state;
      v14 = 0uLL;
    }
    if (v12 % 3 == 2)
      v18 = &quic_cid_describe_cid_buf2;
    else
      v18 = &quic_cid_describe_cid_buf3;
    if (v12 % 3)
      v19 = v18;
    else
      v19 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v12 + 1;
    if (v9[17] >= 0x14u)
      v20 = 20;
    else
      v20 = v9[17];
    *v19 = v14;
    v19[1] = v14;
    *(_OWORD *)((char *)v19 + 25) = v14;
    if ((_DWORD)v20)
    {
      v21 = v9 + 18;
      do
      {
        v22 = *v21++;
        snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
        --v20;
      }
      while (v20);
    }
    *(_DWORD *)v8 = 136446978;
    *(_QWORD *)(v8 + 4) = "quic_conn_change_current_path";
    *(_WORD *)(v8 + 12) = 2082;
    *(_QWORD *)(v8 + 14) = v25;
    *(_WORD *)(v8 + 22) = 2082;
    *(_QWORD *)(v8 + 24) = v11;
    *(_WORD *)(v8 + 32) = 2082;
    *(_QWORD *)(v8 + 34) = v19;
    qlog_internal(16, (uint64_t)v7, 5785);
  }
  if (a1[70])
    quic_conn_close((uint64_t)a1);
  return 0;
}

BOOL __quic_packet_builder_find_ack_mp_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return v2 != v3;
}

void quic_packet_builder_set_initial_token(uint64_t a1, size_t size, const void *a3)
{
  unsigned int v4;
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = size;
    v6 = *(void **)(a1 + 88);
    if (v6)
    {
      free(v6);
      *(_QWORD *)(a1 + 88) = 0;
    }
    *(_WORD *)(a1 + 84) = v4;
    if (v4)
    {
      v7 = malloc_type_malloc(v4, 0xF2B69DE5uLL);
      if (!v7)
        qlog_abort_internal("%s strict_malloc(%zu) failed", "strict_malloc", v4);
      *(_QWORD *)(a1 + 88) = v7;
      memcpy(v7, a3, v4);
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)(v10 + 4) = "quic_packet_builder_set_initial_token";
    qlog_internal(17, (uint64_t)v9, 303);
  }
}

uint64_t quic_packet_builder_rough_size(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v4 = _os_log_pack_size();
      v5 = (char *)v7 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v6 = _os_log_pack_fill();
      *(_DWORD *)v6 = 136446210;
      *(_QWORD *)(v6 + 4) = "quic_packet_builder_rough_size";
      qlog_internal(17, (uint64_t)v5, 545);
    }
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 16 * a2 + 16);
  if (!v2)
    return 0;
  LODWORD(result) = 0;
  do
  {
    result = result + *(unsigned __int16 *)(v2 + 8);
    v2 = *(_QWORD *)(v2 + 96);
  }
  while (v2);
  return result;
}

void quic_packet_builder_assemble_version_negotiation(uint64_t a1, char *__buf, unsigned int a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned int *a6)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  char *v22;
  unsigned int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  char v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unsigned int v50;
  __int16 v51;
  __int16 __src;
  char __str[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  __src = 0;
  v51 = a3;
  if (a1)
  {
    if (__buf)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              HIBYTE(__src) = *a5;
              LOBYTE(__src) = *a4;
              if (__src + HIBYTE(__src) + 15 <= a3)
              {
                arc4random_buf(__buf, 1uLL);
                *__buf |= 0xC0u;
                *(_DWORD *)(__buf + 1) = 0;
                v16 = quic_safe_append(__buf + 5, &v51, &__src, 1uLL);
                if ((_BYTE)__src)
                {
                  quic_cid_write(a4, v16, __src);
                  v17 = __src;
                }
                else
                {
                  v17 = 0;
                }
                v18 = quic_safe_append(&v16[v17], &v51, (char *)&__src + 1, 1uLL);
                if (HIBYTE(__src))
                {
                  quic_cid_write(a5, v18, HIBYTE(__src));
                  v19 = HIBYTE(__src);
                }
                else
                {
                  v19 = 0;
                }
                v20 = &v18[v19];
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  v42 = quic_cid_describe(a4);
                  v43 = quic_cid_describe(a5);
                  snprintf(__str, 0x80uLL, ">> VN<dcid %s, scid %s", v42, v43);
                }
                v21 = *a6;
                v50 = bswap32(*a6);
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  if (v21 == 1)
                  {
                    v44 = "v1";
                  }
                  else
                  {
                    v44 = quic_version_describe_buffer;
                    snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", v21);
                  }
                  snprintf(__str, 0x80uLL, "%s, %s", __str, v44);
                }
                v22 = quic_safe_append(v20, &v51, &v50, 4uLL);
                v23 = a6[1];
                v50 = bswap32(v23);
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  if (v23 == 1)
                  {
                    v45 = "v1";
                  }
                  else
                  {
                    v45 = quic_version_describe_buffer;
                    snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", v23);
                  }
                  snprintf(__str, 0x80uLL, "%s, %s", __str, v45);
                }
                quic_safe_append(v22, &v51, &v50, 4uLL);
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  snprintf(__str, 0x80uLL, "%s>", __str);
                  v46 = qlog_nwlog_enabled;
                  if (qlog_datapath_enabled || qlog_nwlog_enabled)
                  {
                    if (qlog_debug_enabled)
                      v46 = 1;
                    if ((v46 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
                    {
                      v47 = _os_log_pack_size();
                      v48 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0);
                      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                      v49 = _os_log_pack_fill();
                      *(_DWORD *)v49 = 136446466;
                      *(_QWORD *)(v49 + 4) = "quic_packet_builder_assemble_version_negotiation";
                      *(_WORD *)(v49 + 12) = 2082;
                      *(_QWORD *)(v49 + 14) = __str;
                      v13 = 2;
                      v14 = (uint64_t)v48;
                      v15 = 629;
                      goto LABEL_12;
                    }
                  }
                }
              }
              else if (qlog_debug_enabled
                     || (qlog_nwlog_enabled & 1) != 0
                     || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
              {
                v10 = _os_log_pack_size();
                v11 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                v12 = _os_log_pack_fill();
                *(_DWORD *)v12 = 136446210;
                *(_QWORD *)(v12 + 4) = "quic_packet_builder_assemble_version_negotiation";
                v13 = 17;
                v14 = (uint64_t)v11;
                v15 = 594;
LABEL_12:
                qlog_internal(v13, v14, v15);
              }
            }
            else if (qlog_debug_enabled
                   || (qlog_nwlog_enabled & 1) != 0
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
            {
              v39 = _os_log_pack_size();
              v40 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v39, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v41 = _os_log_pack_fill();
              *(_DWORD *)v41 = 136446210;
              *(_QWORD *)(v41 + 4) = "quic_packet_builder_assemble_version_negotiation";
              v13 = 17;
              v14 = (uint64_t)v40;
              v15 = 585;
              goto LABEL_12;
            }
          }
          else if (qlog_debug_enabled
                 || (qlog_nwlog_enabled & 1) != 0
                 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
          {
            v36 = _os_log_pack_size();
            v37 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v38 = _os_log_pack_fill();
            *(_DWORD *)v38 = 136446210;
            *(_QWORD *)(v38 + 4) = "quic_packet_builder_assemble_version_negotiation";
            v13 = 17;
            v14 = (uint64_t)v37;
            v15 = 584;
            goto LABEL_12;
          }
        }
        else if (qlog_debug_enabled
               || (qlog_nwlog_enabled & 1) != 0
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          v33 = _os_log_pack_size();
          v34 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v35 = _os_log_pack_fill();
          *(_DWORD *)v35 = 136446210;
          *(_QWORD *)(v35 + 4) = "quic_packet_builder_assemble_version_negotiation";
          v13 = 17;
          v14 = (uint64_t)v34;
          v15 = 583;
          goto LABEL_12;
        }
      }
      else if (qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v30 = _os_log_pack_size();
        v31 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v32 = _os_log_pack_fill();
        *(_DWORD *)v32 = 136446210;
        *(_QWORD *)(v32 + 4) = "quic_packet_builder_assemble_version_negotiation";
        v13 = 17;
        v14 = (uint64_t)v31;
        v15 = 582;
        goto LABEL_12;
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v27 = _os_log_pack_size();
      v28 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v29 = _os_log_pack_fill();
      *(_DWORD *)v29 = 136446210;
      *(_QWORD *)(v29 + 4) = "quic_packet_builder_assemble_version_negotiation";
      v13 = 17;
      v14 = (uint64_t)v28;
      v15 = 581;
      goto LABEL_12;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v24 = _os_log_pack_size();
    v25 = (char *)&v50 - ((MEMORY[0x24BDAC7A8](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v26 = _os_log_pack_fill();
    *(_DWORD *)v26 = 136446210;
    *(_QWORD *)(v26 + 4) = "quic_packet_builder_assemble_version_negotiation";
    v13 = 17;
    v14 = (uint64_t)v25;
    v15 = 580;
    goto LABEL_12;
  }
}

void quic_packet_builder_assemble_retry(uint64_t a1, char *a2, unsigned int a3, unsigned int a4, unsigned __int8 *a5, unsigned __int8 *a6, unsigned __int8 *a7, size_t a8, void *a9)
{
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  size_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  __int16 v63;
  __int16 v64;
  int __src[2];
  _QWORD v66[2];
  _QWORD __dst[2];
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  memset(__src, 0, 5);
  v64 = 0;
  v63 = a3;
  __dst[0] = 0;
  __dst[1] = 0;
  v68 = 0;
  v66[0] = 0;
  v66[1] = 0;
  v62 = 0;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a5)
        {
          if (a6)
          {
            if (a7)
            {
              if ((_DWORD)a8)
              {
                if (a9)
                {
                  HIBYTE(v64) = *a6;
                  LOBYTE(v64) = *a5;
                  if (a3 >= (unsigned __int16)(a8 + HIBYTE(v64) + v64 + 23))
                  {
                    LOBYTE(__src[0]) = arc4random() | 0xF0;
                    *(int *)((char *)__src + 1) = bswap32(a4);
                    v21 = quic_crypto_build_pseudo_retry(a7, __src, a5, a6, a9, a8, &v62);
                    v22 = quic_safe_append(a2, &v63, __src, 5uLL);
                    v23 = quic_safe_append(v22, &v63, &v64, 1uLL);
                    if ((_BYTE)v64)
                    {
                      quic_cid_write(a5, __dst, v64);
                      v23 = quic_safe_append(v23, &v63, __dst, v64);
                    }
                    v24 = quic_safe_append(v23, &v63, (char *)&v64 + 1, 1uLL);
                    if (HIBYTE(v64))
                    {
                      quic_cid_write(a6, __dst, HIBYTE(v64));
                      v24 = quic_safe_append(v24, &v63, __dst, HIBYTE(v64));
                    }
                    v25 = quic_safe_append(v24, &v63, a9, a8);
                    if (!quic_protector_seal_retry((uint64_t)v62, v21, (uint64_t)v66)
                      && (qlog_debug_enabled
                       || (qlog_nwlog_enabled & 1) != 0
                       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
                    {
                      v26 = _os_log_pack_size();
                      v27 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
                      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                      v28 = _os_log_pack_fill();
                      *(_DWORD *)v28 = 136446210;
                      *(_QWORD *)(v28 + 4) = "quic_packet_builder_assemble_retry";
                      qlog_internal(17, (uint64_t)v27, 704);
                    }
                    if (v62)
                    {
                      free(v62);
                      v62 = 0;
                    }
                    quic_safe_append(v25, &v63, v66, 0x10uLL);
                    v29 = qlog_nwlog_enabled;
                    if (qlog_datapath_enabled || qlog_nwlog_enabled)
                    {
                      if (qlog_debug_enabled)
                        v29 = 1;
                      if ((v29 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
                      {
                        v54 = _os_log_pack_size();
                        v55 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v54, v54) + 15) & 0xFFFFFFFFFFFFFFF0);
                        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                        v56 = _os_log_pack_fill();
                        if (a4 == 1)
                        {
                          v57 = "v1";
                        }
                        else
                        {
                          v57 = quic_version_describe_buffer;
                          snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", a4);
                        }
                        v58 = quic_cid_describe(a5);
                        v59 = quic_cid_describe(a6);
                        v60 = quic_cid_describe(a7);
                        *(_DWORD *)v56 = 136447490;
                        *(_QWORD *)(v56 + 4) = "quic_packet_builder_assemble_retry";
                        *(_WORD *)(v56 + 12) = 2082;
                        *(_QWORD *)(v56 + 14) = v57;
                        *(_WORD *)(v56 + 22) = 2082;
                        *(_QWORD *)(v56 + 24) = v58;
                        *(_WORD *)(v56 + 32) = 2082;
                        *(_QWORD *)(v56 + 34) = v59;
                        *(_WORD *)(v56 + 42) = 1024;
                        *(_DWORD *)(v56 + 44) = a8;
                        *(_WORD *)(v56 + 48) = 2082;
                        *(_QWORD *)(v56 + 50) = v60;
                        v17 = 2;
                        v18 = (uint64_t)v55;
                        v19 = 713;
                        goto LABEL_14;
                      }
                    }
                  }
                  else if (qlog_debug_enabled
                         || (qlog_nwlog_enabled & 1) != 0
                         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
                  {
                    v14 = _os_log_pack_size();
                    v15 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
                    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                    v16 = _os_log_pack_fill();
                    *(_DWORD *)v16 = 136446210;
                    *(_QWORD *)(v16 + 4) = "quic_packet_builder_assemble_retry";
                    v17 = 17;
                    v18 = (uint64_t)v15;
                    v19 = 675;
LABEL_14:
                    qlog_internal(v17, v18, v19);
                  }
                }
                else if (qlog_debug_enabled
                       || (qlog_nwlog_enabled & 1) != 0
                       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
                {
                  v51 = _os_log_pack_size();
                  v52 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v51, v51) + 15) & 0xFFFFFFFFFFFFFFF0);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  v53 = _os_log_pack_fill();
                  *(_DWORD *)v53 = 136446210;
                  *(_QWORD *)(v53 + 4) = "quic_packet_builder_assemble_retry";
                  v17 = 17;
                  v18 = (uint64_t)v52;
                  v19 = 669;
                  goto LABEL_14;
                }
              }
              else if (qlog_debug_enabled
                     || (qlog_nwlog_enabled & 1) != 0
                     || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
              {
                v48 = _os_log_pack_size();
                v49 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0);
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                v50 = _os_log_pack_fill();
                *(_DWORD *)v50 = 136446210;
                *(_QWORD *)(v50 + 4) = "quic_packet_builder_assemble_retry";
                v17 = 17;
                v18 = (uint64_t)v49;
                v19 = 668;
                goto LABEL_14;
              }
            }
            else if (qlog_debug_enabled
                   || (qlog_nwlog_enabled & 1) != 0
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
            {
              v45 = _os_log_pack_size();
              v46 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v47 = _os_log_pack_fill();
              *(_DWORD *)v47 = 136446210;
              *(_QWORD *)(v47 + 4) = "quic_packet_builder_assemble_retry";
              v17 = 17;
              v18 = (uint64_t)v46;
              v19 = 667;
              goto LABEL_14;
            }
          }
          else if (qlog_debug_enabled
                 || (qlog_nwlog_enabled & 1) != 0
                 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
          {
            v42 = _os_log_pack_size();
            v43 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v42, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v44 = _os_log_pack_fill();
            *(_DWORD *)v44 = 136446210;
            *(_QWORD *)(v44 + 4) = "quic_packet_builder_assemble_retry";
            v17 = 17;
            v18 = (uint64_t)v43;
            v19 = 666;
            goto LABEL_14;
          }
        }
        else if (qlog_debug_enabled
               || (qlog_nwlog_enabled & 1) != 0
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          v39 = _os_log_pack_size();
          v40 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v39, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v41 = _os_log_pack_fill();
          *(_DWORD *)v41 = 136446210;
          *(_QWORD *)(v41 + 4) = "quic_packet_builder_assemble_retry";
          v17 = 17;
          v18 = (uint64_t)v40;
          v19 = 665;
          goto LABEL_14;
        }
      }
      else if (qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v36 = _os_log_pack_size();
        v37 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v38 = _os_log_pack_fill();
        *(_DWORD *)v38 = 136446210;
        *(_QWORD *)(v38 + 4) = "quic_packet_builder_assemble_retry";
        v17 = 17;
        v18 = (uint64_t)v37;
        v19 = 664;
        goto LABEL_14;
      }
    }
    else if (qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v33 = _os_log_pack_size();
      v34 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v35 = _os_log_pack_fill();
      *(_DWORD *)v35 = 136446210;
      *(_QWORD *)(v35 + 4) = "quic_packet_builder_assemble_retry";
      v17 = 17;
      v18 = (uint64_t)v34;
      v19 = 663;
      goto LABEL_14;
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v30 = _os_log_pack_size();
    v31 = (char *)&v61 - ((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v32 = _os_log_pack_fill();
    *(_DWORD *)v32 = 136446210;
    *(_QWORD *)(v32 + 4) = "quic_packet_builder_assemble_retry";
    v17 = 17;
    v18 = (uint64_t)v31;
    v19 = 662;
    goto LABEL_14;
  }
}

uint64_t quic_packet_builder_split_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t pn;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int tag_size;
  uint64_t v18;
  char v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      v23 = _os_log_pack_size();
      v24 = (char *)v27 - ((MEMORY[0x24BDAC7A8](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v25 = _os_log_pack_fill();
      *(_DWORD *)v25 = 136446210;
      *(_QWORD *)(v25 + 4) = "quic_packet_builder_split_frames";
      qlog_internal(17, (uint64_t)v24, 1226);
    }
    goto LABEL_25;
  }
  pn = quic_protector_get_pn(*(_QWORD *)(a2 + 568), 3u, *(_QWORD *)(a3 + 328));
  if (a4 == -1)
    v11 = 0;
  else
    v11 = a4;
  v12 = 2 * (pn - v11);
  v13 = pn & 0xFFFFFF;
  if (v12 >> 24)
    v13 = pn;
  if (v12 >> 16)
    v14 = v13;
  else
    v14 = (unsigned __int16)pn;
  if (v12 <= 0xFF)
    v15 = pn;
  else
    v15 = v14;
  v16 = *(unsigned __int8 *)(a3 + 17);
  tag_size = quic_protector_get_tag_size(*(_QWORD *)(a2 + 568), 4u);
  v18 = *(_QWORD *)(a1 + 64);
  if (!v18)
  {
LABEL_25:
    v19 = 0;
    return v19 & 1;
  }
  v19 = 0;
  v20 = (39 - __clz(v15)) >> 3;
  if (!v15)
    v20 = 1;
  v21 = v16 + tag_size + v20 + 1;
  do
  {
    v22 = v18;
    v18 = *(_QWORD *)(v18 + 96);
    if (*(_QWORD *)v22 == 8 && v21 + *(unsigned __int16 *)(v22 + 8) > a5)
    {
      quic_packet_builder_split_stream_frame(a1, a2, (_QWORD *)v22, a5 >> 1, v22);
      v19 = 1;
    }
  }
  while (v18);
  return v19 & 1;
}

void quic_packet_builder_split_stream_frame(uint64_t a1, uint64_t a2, _QWORD *a3, unsigned int a4, uint64_t a5)
{
  unsigned int v9;
  int v10;
  unint64_t v11;
  uint64_t stream_frame;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t (*v18)();
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[10];
  __int16 v27;
  _QWORD v28[3];
  int v29;
  _QWORD v30[4];

  v30[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v25 = a1;
    v26[0] = 0;
    v26[1] = 0;
    nw_frame_array_init();
    nw_frame_array_append_array();
    v9 = *((unsigned __int16 *)a3 + 20);
    if (*((_WORD *)a3 + 20))
    {
      v10 = 0;
      do
      {
        v11 = a3[4] - (unsigned __int16)v9 + a3[5];
        if (a4 >= (unsigned __int16)v9)
        {
          stream_frame = quic_stream_create_stream_frame(*(_QWORD *)(a2 + 560), a3[3], v11, (unsigned __int16)v9, (uint64_t)v26, a3[2] & 1);
          v13 = v9;
        }
        else
        {
          v30[0] = 0;
          v30[1] = 0;
          nw_frame_array_init();
          v28[0] = 0;
          v28[1] = v28;
          v29 = 0;
          v28[2] = 0x2000000000;
          v26[2] = MEMORY[0x24BDAC760];
          v26[3] = 0x40000000;
          v26[4] = __quic_packet_builder_split_frame_inner_block_invoke;
          v26[5] = &unk_24C2E2BF8;
          v26[6] = v28;
          v26[7] = v26;
          v27 = a4;
          v26[8] = v30;
          v26[9] = a2;
          nw_frame_array_foreach();
          stream_frame = quic_stream_create_stream_frame(*(_QWORD *)(a2 + 560), a3[3], v11, a4, (uint64_t)v30, 0);
          _Block_object_dispose(v28, 8);
          v13 = a4;
        }
        quic_packet_builder_insert_frame(*(_QWORD *)(a2 + 560), a5, stream_frame);
        if (!v10)
          v10 = *(unsigned __int16 *)(stream_frame + 8);
        v9 -= v13;
        a5 = stream_frame;
      }
      while ((_WORD)v9);
    }
    v14 = a3[12];
    v15 = (_QWORD *)a3[13];
    v16 = a3 + 12;
    if (v14)
    {
      *(_QWORD *)(v14 + 104) = v15;
      v15 = (_QWORD *)a3[13];
    }
    else
    {
      *(_QWORD *)(v25 + 72) = v15;
    }
    *v15 = v14;
    *v16 = 0;
    a3[13] = 0;
    if (*a3 <= 0xBAB9FFuLL)
      v17 = *a3;
    else
      v17 = *a3 - 12237272;
    if (quic_frame_is_type_index_valid(v17, *a3))
    {
      v18 = quic_frames[6 * v17 + 4];
      if (v18)
        ((void (*)(_QWORD *))v18)(a3);
      v19 = a3[14];
      if (v19 && *(_DWORD *)(v19 + 16) < 0x1000u)
      {
        *((_OWORD *)a3 + 6) = 0u;
        *((_OWORD *)a3 + 7) = 0u;
        *((_OWORD *)a3 + 4) = 0u;
        *((_OWORD *)a3 + 5) = 0u;
        *((_OWORD *)a3 + 2) = 0u;
        *((_OWORD *)a3 + 3) = 0u;
        *(_OWORD *)a3 = 0u;
        *((_OWORD *)a3 + 1) = 0u;
        a3[14] = v19;
        v20 = *(_QWORD **)(v19 + 8);
        a3[13] = v20;
        *v20 = a3;
        v21 = a3[14];
        *(_QWORD *)(v21 + 8) = v16;
        ++*(_DWORD *)(v21 + 16);
      }
      else
      {
        free(a3);
      }
    }
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v22 = _os_log_pack_size();
    v23 = (char *)&v26[-1] - ((MEMORY[0x24BDAC7A8](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136446210;
    *(_QWORD *)(v24 + 4) = "quic_packet_builder_split_stream_frame";
    qlog_internal(17, (uint64_t)v23, 1201);
  }
}

uint64_t __quic_packet_builder_split_frame_inner_block_invoke(uint64_t a1)
{
  int size;
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v6;
  void *v7;
  uint64_t v8;

  size = nw_protocol_data_get_size();
  if (size)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(_DWORD *)(v3 + 24);
    v5 = *(unsigned __int16 *)(a1 + 64);
    if (v4 + size <= v5)
    {
      *(_DWORD *)(v3 + 24) = v4 + size;
      v8 = 1;
      nw_frame_array_remove();
      nw_frame_array_append();
    }
    else
    {
      v6 = v5 - v4;
      v7 = (void *)nw_protocol_data_copy_outbound_subdata();
      nw_frame_array_remove();
      nw_frame_claim();
      nw_frame_array_append();
      nw_frame_array_prepend();
      if (v7)
        nw_release(v7);
      v8 = 0;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6;
    }
  }
  else
  {
    v8 = 1;
    nw_frame_array_remove();
  }
  return v8;
}

void quic_packet_builder_insert_frame(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = *(_QWORD *)(a2 + 96);
    v3 = (_QWORD *)(a2 + 96);
    *(_QWORD *)(a3 + 96) = v4;
    v5 = (_QWORD *)(v4 + 104);
    if (v4)
      v6 = v5;
    else
      v6 = (_QWORD *)(a1 + 72);
    *v6 = a3 + 96;
    *v3 = a3;
    *(_QWORD *)(a3 + 104) = v3;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "quic_packet_builder_insert_frame";
    qlog_internal(17, (uint64_t)v8, 134);
  }
}

double __os_log_helper_1_2_8_8_34_8_34_8_34_8_34_8_34_4_0_8_32_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  double result;

  *(_QWORD *)&result = 136448002;
  *(_DWORD *)a1 = 136448002;
  *(_QWORD *)(a1 + 4) = "quic_packet_parser_describe_header";
  *(_WORD *)(a1 + 12) = 2082;
  *(_QWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 22) = 2082;
  *(_QWORD *)(a1 + 24) = a3;
  *(_WORD *)(a1 + 32) = 2082;
  *(_QWORD *)(a1 + 34) = a4;
  *(_WORD *)(a1 + 42) = 2082;
  *(_QWORD *)(a1 + 44) = a5;
  *(_WORD *)(a1 + 52) = 1024;
  *(_DWORD *)(a1 + 54) = a6;
  *(_WORD *)(a1 + 58) = 2080;
  *(_QWORD *)(a1 + 60) = a7;
  *(_WORD *)(a1 + 68) = 2048;
  *(_QWORD *)(a1 + 70) = a8;
  return result;
}

BOOL quic_packet_parser_prelude(uint64_t a1, char *a2, unsigned int a3, uint64_t a4)
{
  unsigned int v5;
  unsigned int v7;
  unsigned __int16 v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  _BOOL8 result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  if (!a4)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v45 - ((MEMORY[0x24BDAC7A8](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v17 = _os_log_pack_fill();
      *(_DWORD *)v17 = 136446210;
      *(_QWORD *)(v17 + 4) = "quic_packet_parser_prelude";
      qlog_internal(17, (uint64_t)v16, 663);
      return 0;
    }
    return result;
  }
  *(_OWORD *)(a4 + 208) = 0u;
  *(_OWORD *)(a4 + 224) = 0u;
  *(_OWORD *)(a4 + 176) = 0u;
  *(_OWORD *)(a4 + 192) = 0u;
  *(_OWORD *)(a4 + 144) = 0u;
  *(_OWORD *)(a4 + 160) = 0u;
  *(_OWORD *)(a4 + 112) = 0u;
  *(_OWORD *)(a4 + 128) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_OWORD *)(a4 + 96) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  v5 = *a2;
  *(_DWORD *)(a4 + 232) = (v5 >> 7) & 1;
  *(_QWORD *)a4 = a2;
  if ((v5 & 0x80000000) == 0)
    return 1;
  if (a3 <= 4)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    if (!*(_QWORD *)(a1 + 1112))
      return 0;
    v18 = _os_log_pack_size();
    v19 = (char *)v45 - ((MEMORY[0x24BDAC7A8](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v20 = _os_log_pack_fill();
    v21 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
    v22 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
    *(_DWORD *)v20 = 136446978;
    *(_QWORD *)(v20 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v20 + 12) = 2082;
    *(_QWORD *)(v20 + 14) = a1 + 976;
    *(_WORD *)(v20 + 22) = 2082;
    *(_QWORD *)(v20 + 24) = v21;
    *(_WORD *)(v20 + 32) = 2082;
    *(_QWORD *)(v20 + 34) = v22;
    v23 = (uint64_t)v19;
    v24 = 673;
LABEL_43:
    qlog_internal(16, v23, v24);
    return 0;
  }
  *(_DWORD *)(a4 + 108) = bswap32(*(_DWORD *)(a2 + 1));
  if (a3 == 5)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    if (!*(_QWORD *)(a1 + 1112))
      return 0;
    v25 = _os_log_pack_size();
    v26 = (char *)v45 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v27 = _os_log_pack_fill();
    v28 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
    v29 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
    *(_DWORD *)v27 = 136446978;
    *(_QWORD *)(v27 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v27 + 12) = 2082;
    *(_QWORD *)(v27 + 14) = a1 + 976;
    *(_WORD *)(v27 + 22) = 2082;
    *(_QWORD *)(v27 + 24) = v28;
    *(_WORD *)(v27 + 32) = 2082;
    *(_QWORD *)(v27 + 34) = v29;
    v23 = (uint64_t)v26;
    v24 = 675;
    goto LABEL_43;
  }
  v7 = a2[5];
  v8 = a3 - 6;
  v9 = (unsigned __int8 *)(a2 + 6);
  if (!a2[5])
    goto LABEL_8;
  if (v7 > v8)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    if (!*(_QWORD *)(a1 + 1112))
      return 0;
    v35 = _os_log_pack_size();
    v36 = (char *)v45 - ((MEMORY[0x24BDAC7A8](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v37 = _os_log_pack_fill();
    v38 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
    v39 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
    *(_DWORD *)v37 = 136446978;
    *(_QWORD *)(v37 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v37 + 12) = 2082;
    *(_QWORD *)(v37 + 14) = a1 + 976;
    *(_WORD *)(v37 + 22) = 2082;
    *(_QWORD *)(v37 + 24) = v38;
    *(_WORD *)(v37 + 32) = 2082;
    *(_QWORD *)(v37 + 34) = v39;
    v23 = (uint64_t)v36;
    v24 = 678;
    goto LABEL_43;
  }
  v8 -= v7;
  v10 = &v9[a2[5]];
  quic_cid_read(v9, a2[5], (_BYTE *)(a4 + 40));
  v9 = v10;
LABEL_8:
  if (!v8)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    if (!*(_QWORD *)(a1 + 1112))
      return 0;
    v30 = _os_log_pack_size();
    v31 = (char *)v45 - ((MEMORY[0x24BDAC7A8](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v32 = _os_log_pack_fill();
    v33 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
    v34 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
    *(_DWORD *)v32 = 136446978;
    *(_QWORD *)(v32 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v32 + 12) = 2082;
    *(_QWORD *)(v32 + 14) = a1 + 976;
    *(_WORD *)(v32 + 22) = 2082;
    *(_QWORD *)(v32 + 24) = v33;
    *(_WORD *)(v32 + 32) = 2082;
    *(_QWORD *)(v32 + 34) = v34;
    v23 = (uint64_t)v31;
    v24 = 681;
    goto LABEL_43;
  }
  v13 = *v9;
  v11 = v9 + 1;
  v12 = v13;
  if (!v13)
    return 1;
  if (v12 <= (unsigned __int16)(v8 - 1))
  {
    quic_cid_read(v11, v12, (_BYTE *)(a4 + 61));
    return 1;
  }
  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
  {
    if (*(_QWORD *)(a1 + 1112))
    {
      v40 = _os_log_pack_size();
      v41 = (char *)v45 - ((MEMORY[0x24BDAC7A8](v40, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v42 = _os_log_pack_fill();
      v43 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 38));
      v44 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(a1 + 1112) + 17));
      *(_DWORD *)v42 = 136446978;
      *(_QWORD *)(v42 + 4) = "quic_packet_parser_prelude";
      *(_WORD *)(v42 + 12) = 2082;
      *(_QWORD *)(v42 + 14) = a1 + 976;
      *(_WORD *)(v42 + 22) = 2082;
      *(_QWORD *)(v42 + 24) = v43;
      *(_WORD *)(v42 + 32) = 2082;
      *(_QWORD *)(v42 + 34) = v44;
      v23 = (uint64_t)v41;
      v24 = 684;
      goto LABEL_43;
    }
    return 0;
  }
  return result;
}

const char *quic_frame_type_describe(uint64_t a1)
{
  const char *result;

  result = "PADDING";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "PING";
      break;
    case 2:
      result = "ACK";
      break;
    case 3:
      result = "ACK_ECN";
      break;
    case 4:
      result = "RESET_STREAM";
      break;
    case 5:
      result = "STOP_SENDING";
      break;
    case 6:
      result = "CRYPTO";
      break;
    case 7:
      result = "NEW_TOKEN";
      break;
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 173:
    case 174:
LABEL_30:
      if ((a1 & 0xFFFFFFFFFFFFFFF8) == 8)
        result = "STREAM";
      else
        result = "???";
      break;
    case 16:
      result = "MAX_DATA";
      break;
    case 17:
      result = "MAX_STREAM_DATA";
      break;
    case 18:
      result = "MAX_STREAMS_BIDI";
      break;
    case 19:
      result = "MAX_STREAMS_UNI";
      break;
    case 20:
      result = "DATA_BLOCKED";
      break;
    case 21:
      result = "STREAM_DATA_BLOCKED";
      break;
    case 22:
      result = "STREAMS_BLOCKED_BIDI";
      break;
    case 23:
      result = "STREAMS_BLOCKED_UNI";
      break;
    case 24:
      result = "NEW_CONNECTION_ID";
      break;
    case 25:
      result = "RETIRE_CONNECTION_ID";
      break;
    case 26:
      result = "PATH_CHALLENGE";
      break;
    case 27:
      result = "PATH_RESPONSE";
      break;
    case 28:
      result = "CONNECTION_CLOSE";
      break;
    case 29:
      result = "APPLICATION_CLOSE";
      break;
    case 30:
      result = "HANDSHAKE_DONE";
      break;
    case 48:
    case 49:
      result = "DATAGRAM";
      break;
    case 172:
      result = "IMMEDIATE_ACK";
      break;
    case 175:
      result = "ACK_FREQUENCY";
      break;
    default:
      switch(a1)
      {
        case 12237312:
          result = "ACK_MP";
          break;
        case 12237313:
          result = "ACK_MP_ECN";
          break;
        case 12237317:
          result = "PATH_ABANDON";
          break;
        case 12237318:
          result = "PATH_STATUS";
          break;
        default:
          goto LABEL_30;
      }
      break;
  }
  return result;
}

uint64_t quic_dispatch_data_copyout(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD applier[7];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2000000000;
  v14[3] = a2;
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      goto LABEL_14;
    }
    v5 = _os_log_pack_size();
    v6 = (char *)applier - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)(v7 + 4) = "quic_dispatch_data_copyout";
    v8 = (uint64_t)v6;
    v9 = 239;
    goto LABEL_13;
  }
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      goto LABEL_14;
    }
    v10 = _os_log_pack_size();
    v11 = (char *)applier - ((MEMORY[0x24BDAC7A8](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "quic_dispatch_data_copyout";
    v8 = (uint64_t)v11;
    v9 = 240;
LABEL_13:
    qlog_internal(17, v8, v9);
LABEL_14:
    v3 = 0;
    goto LABEL_4;
  }
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 0x40000000;
  applier[2] = __quic_dispatch_data_copyout_block_invoke;
  applier[3] = &unk_24C2E2C88;
  applier[4] = &v15;
  applier[5] = v14;
  applier[6] = a3;
  dispatch_data_apply(a1, applier);
  v3 = v16[3];
LABEL_4:
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  return v3;
}

uint64_t ____quic_signpost_is_enabled_block_invoke_4722()
{
  uint64_t result;

  result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_4712 = result;
  return result;
}

void quic_rtt_set_min_rtt(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 32) = a2;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v2 = _os_log_pack_size();
    v3 = (char *)v5 - ((MEMORY[0x24BDAC7A8](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v4 + 4) = "quic_rtt_set_min_rtt";
    qlog_internal(17, (uint64_t)v3, 284);
  }
}

void quic_shorthand_process_packet(uint64_t a1, uint64_t a2, int a3)
{
  int v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[9];
  __int128 v18;
  __int16 v19;
  char v20;
  unint64_t v21;

  v19 = 0;
  v5 = *(_DWORD *)(a2 + 232);
  if ((v5 & 0x200) != 0)
  {
    v6 = 6;
  }
  else if ((v5 & 0x100) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = *(_BYTE *)(a2 + 82);
  }
  v20 = v6;
  v7 = *(_QWORD *)(a2 + 112) & 0x3FFFFFFFFFFFFFFFLL | ((unint64_t)(v5 & 1) << 62);
  v8 = 0x8000000000000000;
  if (!a3)
    v8 = 0;
  v21 = v7 | v8;
  v9 = mach_continuous_time();
  if (timebase_info_once != -1)
    dispatch_once(&timebase_info_once, &__block_literal_global_397);
  v10 = (timebase_info_info * v9 / dword_253D0A9BC / 0x3E8) / 0x3E8;
  if (*(_DWORD *)a1)
    v19 = nw_log_ms_to_delta();
  if ((*(_BYTE *)(a1 + 18896) & 1) == 0)
    *(_DWORD *)a1 = v10;
  nw_log_ring_append();
  v11 = *(_QWORD *)(a2 + 152);
  if (v11)
  {
    v12 = MEMORY[0x24BDAC760];
    while (2)
    {
      v18 = 0u;
      memset(&v17[5], 0, 32);
      v17[5] = *(_QWORD *)v11;
      switch(v17[5])
      {
        case 0:
          LOWORD(v17[6]) = *(_WORD *)(v11 + 18);
          goto LABEL_29;
        case 1:
          goto LABEL_22;
        case 2:
        case 3:
          goto LABEL_20;
        case 4:
          *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 16);
          v17[8] = *(_QWORD *)(v11 + 32);
          goto LABEL_29;
        case 5:
          v17[7] = *(_QWORD *)(v11 + 24);
LABEL_28:
          v17[6] = *(_QWORD *)(v11 + 16);
          goto LABEL_29;
        case 6:
          *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 24);
          goto LABEL_29;
        default:
          if ((unint64_t)(v17[5] - 12237312) >= 2)
          {
LABEL_22:
            if ((unint64_t)(v17[5] - 8) > 6)
            {
              switch(v17[5])
              {
                case 0x10:
                case 0x12:
                case 0x13:
                case 0x14:
                case 0x16:
                case 0x17:
                case 0x19:
                  goto LABEL_28;
                case 0x11:
                case 0x15:
                case 0x18:
                case 0x1CLL:
                case 0x1DLL:
                  *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 16);
                  break;
                case 0x1ALL:
                case 0x1BLL:
                case 0x1ELL:
                case 0x1FLL:
                case 0x20:
                case 0x21:
                case 0x22:
                case 0x23:
                case 0x24:
                case 0x25:
                case 0x26:
                case 0x27:
                case 0x28:
                case 0x29:
                case 0x2ALL:
                case 0x2BLL:
                case 0x2CLL:
                case 0x2DLL:
                case 0x2ELL:
                case 0x2FLL:
                  break;
                case 0x30:
                case 0x31:
                  v15 = *(_QWORD *)(v11 + 40);
                  v17[6] = *(_QWORD *)(v11 + 24);
                  v17[7] = v15;
                  break;
                default:
                  if (v17[5] == 175)
                  {
                    *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 16);
                    v16 = *(_QWORD *)(v11 + 40) & 1;
                    v17[8] = *(_QWORD *)(v11 + 32);
                    *(_QWORD *)&v18 = v16;
                  }
                  break;
              }
            }
            else
            {
              v13 = *(_QWORD *)(v11 + 24);
              *(_OWORD *)&v17[7] = *(_OWORD *)(v11 + 32);
              v14 = v13 & 0x7FFFFFFFFFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(v11 + 16) << 63);
              v17[5] = 8;
              v17[6] = v14;
            }
          }
          else
          {
LABEL_20:
            v17[6] = *(_QWORD *)(v11 + 32);
            *(_OWORD *)&v17[7] = *(_OWORD *)(v11 + 48);
            *(_QWORD *)&v18 = *(_QWORD *)(v11 + 64);
            if (v17[5] >> 1 == 6118656)
              *((_QWORD *)&v18 + 1) = *(_QWORD *)(v11 + 24);
          }
LABEL_29:
          nw_log_ring_append();
          if ((*(_QWORD *)v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            v17[0] = v12;
            v17[1] = 0x40000000;
            v17[2] = __quic_shorthand_process_packet_block_invoke;
            v17[3] = &__block_descriptor_tmp_15_4780;
            v17[4] = a1;
            quic_ack_process_blocks((uint64_t *)v11, (uint64_t)v17);
          }
          v11 = *(_QWORD *)(v11 + 96);
          if (v11)
            continue;
          return;
      }
    }
  }
}

uint64_t __quic_shorthand_process_packet_block_invoke()
{
  nw_log_ring_append();
  return 1;
}

void quic_shorthand_describe_entry(int a1, uint64_t a2, uint64_t a3, char *a4, size_t a5)
{
  const char *v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v17 = _os_log_pack_size();
    v18 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "quic_shorthand_describe_entry";
    v20 = (uint64_t)v18;
    v21 = 534;
LABEL_65:
    qlog_internal(17, v20, v21);
    return;
  }
  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v22 = _os_log_pack_size();
    v23 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136446210;
    *(_QWORD *)(v24 + 4) = "quic_shorthand_describe_entry";
    v20 = (uint64_t)v23;
    v21 = 535;
    goto LABEL_65;
  }
  if (!a5)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }
    v25 = _os_log_pack_size();
    v26 = (char *)v28 - ((MEMORY[0x24BDAC7A8](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136446210;
    *(_QWORD *)(v27 + 4) = "quic_shorthand_describe_entry";
    v20 = (uint64_t)v26;
    v21 = 536;
    goto LABEL_65;
  }
  bzero(a4, a5);
  if (a1 == 1)
  {
    switch(a3)
    {
      case 48:
        if (a5 >= 3)
        {
          *(_WORD *)a4 = 2313;
          v13 = a5 - 2;
          if (v13 >= 3)
          {
            *((_WORD *)a4 + 1) = 63;
            v14 = *(_QWORD *)a2;
            if (*(uint64_t *)a2 > 12237311)
            {
              if ((unint64_t)(v14 - 12237312) < 2)
              {
                snprintf(a4 + 2, v13, "ACK_MP[space_id=%llu, largest=%llu]");
              }
              else if (v14 == 12237317)
              {
                snprintf(a4 + 2, v13, "PATH_ABANDON[id_type=%llu, id=%llu, code=%llu]");
              }
              else if (v14 == 12237318)
              {
                snprintf(a4 + 2, v13, "PATH_STATUS[id_type=%llu, id=%llu, seq=%llu val=%llu]");
              }
            }
            else
            {
              switch(v14)
              {
                case 0:
                  snprintf(a4 + 2, v13, "PADDING[%d]");
                  break;
                case 1:
                case 7:
                case 26:
                case 27:
                case 30:
                case 172:
                  quic_frame_type_describe(v14);
                  snprintf(a4 + 2, v13, "%s");
                  break;
                case 2:
                case 3:
                  snprintf(a4 + 2, v13, "ACK[%llu]");
                  break;
                case 4:
                  snprintf(a4 + 2, v13, "RESET_STREAM[id=%llu, code=%llu, fs=%llu]");
                  break;
                case 5:
                  snprintf(a4 + 2, v13, "STOP_SENDING[%llu, code=%llu]");
                  break;
                case 6:
                  snprintf(a4 + 2, v13, "CRYPTO[%llu;%llu]");
                  break;
                case 16:
                  snprintf(a4 + 2, v13, "MAX_DATA[%llu]");
                  break;
                case 17:
                  snprintf(a4 + 2, v13, "MAX_STREAM_DATA[id=%llu, %llu]");
                  break;
                case 18:
                  snprintf(a4 + 2, v13, "MAX_STREAMS_BIDI[%llu]");
                  break;
                case 19:
                  snprintf(a4 + 2, v13, "MAX_STREAMS_UNI[%llu]");
                  break;
                case 20:
                  snprintf(a4 + 2, v13, "DATA_BLOCKED[%llu]");
                  break;
                case 21:
                  snprintf(a4 + 2, v13, "STREAM_DATA_BLOCKED[id=%llu, %llu]");
                  break;
                case 22:
                  snprintf(a4 + 2, v13, "STREAMS_BLOCKED_BIDI[%llu]");
                  break;
                case 23:
                  snprintf(a4 + 2, v13, "STREAMS_BLOCKED_UNI[%llu]");
                  break;
                case 24:
                  snprintf(a4 + 2, v13, "NEW_CONNECTION_ID[seq=%llu, retire=%llu]");
                  break;
                case 25:
                  snprintf(a4 + 2, v13, "RETIRE_CONNECTION_ID[%llu]");
                  break;
                case 28:
                case 29:
                  quic_frame_type_describe(v14);
                  snprintf(a4 + 2, v13, "%s[code=%llu, type=%llu]");
                  break;
                case 48:
                case 49:
                  snprintf(a4 + 2, v13, "D%llu[%llu]");
                  break;
                case 175:
                  snprintf(a4 + 2, v13, "ACK_FREQUENCY[seq=%llu, threshold=%llu, delay=%llu, ignore_order=%llu]");
                  break;
                default:
                  break;
              }
            }
            if ((unint64_t)(*(_QWORD *)a2 - 8) <= 6)
              snprintf(a4 + 2, v13, "S%llu[%llu;%llu]%s");
          }
        }
        break;
      case 16:
        snprintf(a4, a5, "\t\t\t(%llu, %llu)");
        break;
      case 11:
        if (*(uint64_t *)(a2 + 3) < 0)
          v10 = "snd";
        else
          v10 = "rcv";
        v11 = nw_log_delta_to_ms();
        v12 = *(_QWORD *)(a2 + 3);
        if ((v12 & 0x4000000000000000) != 0)
        {
          v15 = *(unsigned __int8 *)(a2 + 2);
          if (v15 > 6)
            v16 = "???";
          else
            v16 = (&off_24C2E2D28)[v15];
          snprintf(a4, a5, "%s %4u.%.03us LH<%s, %llu>", v10, v11 / 0x3E8, v11 % 0x3E8, v16, v12 & 0x3FFFFFFFFFFFFFFFLL);
        }
        else
        {
          snprintf(a4, a5, "%s %4u.%.03us SH<%llu>");
        }
        break;
      default:
        snprintf(a4, a5, "<invalid entry length %zu>");
        break;
    }
  }
  else
  {
    snprintf(a4, a5, "<invalid version %u>");
  }
}

uint64_t CCCryptorChaCha20()
{
  return MEMORY[0x24BDAC0F8]();
}

uint64_t CCCryptorChaCha20Poly1305OneshotDecrypt()
{
  return MEMORY[0x24BDAC100]();
}

uint64_t CCCryptorChaCha20Poly1305OneshotEncrypt()
{
  return MEMORY[0x24BDAC108]();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC110](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC118](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

uint64_t CCCryptorGCMAddAAD()
{
  return MEMORY[0x24BDAC138]();
}

uint64_t CCCryptorGCMDecrypt()
{
  return MEMORY[0x24BDAC140]();
}

uint64_t CCCryptorGCMEncrypt()
{
  return MEMORY[0x24BDAC148]();
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x24BDAC150]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x24BDAC158]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

uint64_t CCCryptorGCMReset()
{
  return MEMORY[0x24BDAC168]();
}

uint64_t CCCryptorGCMSetIV()
{
  return MEMORY[0x24BDAC170]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x24BDAC190](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCHKDFExpand()
{
  return MEMORY[0x24BDAC228]();
}

uint64_t CCHKDFExtract()
{
  return MEMORY[0x24BDAC230]();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x24BDAC268]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x24BDAC270]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __nw_create_backtrace_string()
{
  return MEMORY[0x24BDE07F8]();
}

uint64_t __nwlog_fault()
{
  return MEMORY[0x24BDE0808]();
}

uint64_t __nwlog_handle_composed()
{
  return MEMORY[0x24BDE0810]();
}

uint64_t __nwlog_is_datapath_logging_enabled()
{
  return MEMORY[0x24BDE0818]();
}

uint64_t __nwlog_obj()
{
  return MEMORY[0x24BDE0820]();
}

uint64_t __nwlog_override_fd()
{
  return MEMORY[0x24BDE0828]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x24BDACB98]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x24BDACBA0]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cbrt(long double __x)
{
  long double result;

  MEMORY[0x24BDAD330](__x);
  return result;
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x24BDADD78](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
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

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x24BDAE888](a1, *(_QWORD *)&a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x24BDAE950]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x24BDAECC0](deadline);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

uint64_t network_config_get_BOOL_setting()
{
  return MEMORY[0x24BDE0908]();
}

uint64_t network_config_get_int64_setting()
{
  return MEMORY[0x24BDE0910]();
}

uint64_t network_config_get_quic_l4s_enabled()
{
  return MEMORY[0x24BDE0918]();
}

uint64_t network_config_get_string_setting()
{
  return MEMORY[0x24BDE0920]();
}

uint64_t network_config_setting_exists()
{
  return MEMORY[0x24BDE0938]();
}

uint64_t nw_array_append()
{
  return MEMORY[0x24BDE0A10]();
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

uint64_t nw_connection_copy_protocol_metadata_on_queue()
{
  return MEMORY[0x24BDE0B58]();
}

void nw_connection_force_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0BA8](connection);
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x24BDE0BB8]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

uint64_t nw_connection_state_to_string()
{
  return MEMORY[0x24BDE0CF0]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E68](address);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x24BDE0EC0](endpoint);
}

uint64_t nw_endpoint_get_address_family()
{
  return MEMORY[0x24BDE0ED0]();
}

uint64_t nw_endpoint_get_logging_description()
{
  return MEMORY[0x24BDE0F28]();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F50](endpoint);
}

uint64_t nw_endpoint_is_equal()
{
  return MEMORY[0x24BDE0F80]();
}

uint64_t nw_error_create_posix_error()
{
  return MEMORY[0x24BDE0FB0]();
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x24BDE0FB8](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x24BDE0FC8](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x24BDE1020]();
}

uint64_t nw_frame_array_append_array()
{
  return MEMORY[0x24BDE1028]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x24BDE1030]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x24BDE1038]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x24BDE1040]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x24BDE1048]();
}

uint64_t nw_frame_array_prepend()
{
  return MEMORY[0x24BDE1058]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x24BDE1068]();
}

uint64_t nw_frame_check_validity()
{
  return MEMORY[0x24BDE1078]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x24BDE1080]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x24BDE1088]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x24BDE1098]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x24BDE10A0]();
}

uint64_t nw_frame_get_external_data()
{
  return MEMORY[0x24BDE10A8]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x24BDE10B8]();
}

uint64_t nw_frame_set_external_data()
{
  return MEMORY[0x24BDE10C0]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x24BDE10D0]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x24BDE10D8]();
}

uint64_t nw_frame_uses_external_data()
{
  return MEMORY[0x24BDE10E0]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x24BDE13A8](interface);
}

uint64_t nw_interface_get_mtu()
{
  return MEMORY[0x24BDE13B0]();
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x24BDE13C0](interface);
}

uint64_t nw_link_get_local_congestion_info()
{
  return MEMORY[0x24BDE1438]();
}

uint64_t nw_log_delta_to_ms()
{
  return MEMORY[0x24BDE14B0]();
}

uint64_t nw_log_ms_to_delta()
{
  return MEMORY[0x24BDE14B8]();
}

uint64_t nw_log_ring_append()
{
  return MEMORY[0x24BDE14C0]();
}

uint64_t nw_log_ring_copyout()
{
  return MEMORY[0x24BDE14C8]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x24BDE1520]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x24BDE1528](parameters);
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x24BDE1760]();
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x24BDE17C0]();
}

uint64_t nw_path_get_mtu()
{
  return MEMORY[0x24BDE1910]();
}

uint64_t nw_path_get_rtt_values()
{
  return MEMORY[0x24BDE1928]();
}

uint64_t nw_path_is_direct()
{
  return MEMORY[0x24BDE19B0]();
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x24BDE1A68](path, *(_QWORD *)&interface_type);
}

uint64_t nw_protocol_copy_qpod_definition()
{
  return MEMORY[0x24BDE1B58]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x24BDE1B60]();
}

uint64_t nw_protocol_copy_quic_stream_definition()
{
  return MEMORY[0x24BDE1B70]();
}

uint64_t nw_protocol_copy_swift_tls_definition()
{
  return MEMORY[0x24BDE1B78]();
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1B88]();
}

uint64_t nw_protocol_create_inbound_data()
{
  return MEMORY[0x24BDE1B90]();
}

uint64_t nw_protocol_data_access_buffer()
{
  return MEMORY[0x24BDE1B98]();
}

uint64_t nw_protocol_data_copy_outbound_subdata()
{
  return MEMORY[0x24BDE1BA0]();
}

uint64_t nw_protocol_data_get_ecn_flag()
{
  return MEMORY[0x24BDE1BA8]();
}

uint64_t nw_protocol_data_get_size()
{
  return MEMORY[0x24BDE1BB0]();
}

uint64_t nw_protocol_data_set_compression_generation_count()
{
  return MEMORY[0x24BDE1BB8]();
}

uint64_t nw_protocol_data_set_ecn_flag()
{
  return MEMORY[0x24BDE1BC0]();
}

uint64_t nw_protocol_data_trim()
{
  return MEMORY[0x24BDE1BC8]();
}

uint64_t nw_protocol_definition_set_copy_data_transfer_snapshot()
{
  return MEMORY[0x24BDE1BE0]();
}

uint64_t nw_protocol_definition_set_copy_establishment_report()
{
  return MEMORY[0x24BDE1BE8]();
}

uint64_t nw_protocol_definition_set_copy_metadata()
{
  return MEMORY[0x24BDE1BF0]();
}

uint64_t nw_protocol_definition_set_copy_quic_info()
{
  return MEMORY[0x24BDE1BF8]();
}

uint64_t nw_protocol_definition_set_custom_flow_map_key_size()
{
  return MEMORY[0x24BDE1C00]();
}

uint64_t nw_protocol_definition_set_destroy()
{
  return MEMORY[0x24BDE1C08]();
}

uint64_t nw_protocol_definition_set_fallback_changed_handler()
{
  return MEMORY[0x24BDE1C10]();
}

uint64_t nw_protocol_definition_set_flow_state_allocator()
{
  return MEMORY[0x24BDE1C18]();
}

uint64_t nw_protocol_definition_set_globals_allocator()
{
  return MEMORY[0x24BDE1C20]();
}

uint64_t nw_protocol_definition_set_handle_error()
{
  return MEMORY[0x24BDE1C28]();
}

uint64_t nw_protocol_definition_set_handle_inbound()
{
  return MEMORY[0x24BDE1C30]();
}

uint64_t nw_protocol_definition_set_handle_outbound()
{
  return MEMORY[0x24BDE1C38]();
}

uint64_t nw_protocol_definition_set_inbound_events()
{
  return MEMORY[0x24BDE1C40]();
}

uint64_t nw_protocol_definition_set_initialize()
{
  return MEMORY[0x24BDE1C48]();
}

uint64_t nw_protocol_definition_set_instance_state_allocator()
{
  return MEMORY[0x24BDE1C50]();
}

uint64_t nw_protocol_definition_set_link_congestion_state_update()
{
  return MEMORY[0x24BDE1C58]();
}

uint64_t nw_protocol_definition_set_link_state_update()
{
  return MEMORY[0x24BDE1C60]();
}

uint64_t nw_protocol_definition_set_maximum_message_size_update()
{
  return MEMORY[0x24BDE1C68]();
}

uint64_t nw_protocol_definition_set_message_size_handler()
{
  return MEMORY[0x24BDE1C70]();
}

uint64_t nw_protocol_definition_set_multipath()
{
  return MEMORY[0x24BDE1C78]();
}

uint64_t nw_protocol_definition_set_outbound_events()
{
  return MEMORY[0x24BDE1C80]();
}

uint64_t nw_protocol_definition_set_path_changed_handler()
{
  return MEMORY[0x24BDE1C88]();
}

uint64_t nw_protocol_definition_set_probe_connectivity_update()
{
  return MEMORY[0x24BDE1C90]();
}

uint64_t nw_protocol_definition_set_start()
{
  return MEMORY[0x24BDE1C98]();
}

uint64_t nw_protocol_definition_set_stop()
{
  return MEMORY[0x24BDE1CA0]();
}

uint64_t nw_protocol_definition_set_supports_discontiguous_data()
{
  return MEMORY[0x24BDE1CA8]();
}

uint64_t nw_protocol_definition_set_traffic_mgmt_update()
{
  return MEMORY[0x24BDE1CB0]();
}

uint64_t nw_protocol_establishment_report_create()
{
  return MEMORY[0x24BDE1CF0]();
}

uint64_t nw_protocol_establishment_report_set_client_accurate_ecn_state()
{
  return MEMORY[0x24BDE1CF8]();
}

uint64_t nw_protocol_establishment_report_set_l4s_enabled()
{
  return MEMORY[0x24BDE1D00]();
}

uint64_t nw_protocol_implementation_finalize_pending_frames()
{
  return MEMORY[0x24BDE1D58]();
}

uint64_t nw_protocol_instance_access_flow_state()
{
  return MEMORY[0x24BDE1D80]();
}

uint64_t nw_protocol_instance_access_globals()
{
  return MEMORY[0x24BDE1D88]();
}

uint64_t nw_protocol_instance_access_state()
{
  return MEMORY[0x24BDE1D90]();
}

uint64_t nw_protocol_instance_add_inbound()
{
  return MEMORY[0x24BDE1D98]();
}

uint64_t nw_protocol_instance_add_new_flow()
{
  return MEMORY[0x24BDE1DA0]();
}

uint64_t nw_protocol_instance_add_outbound()
{
  return MEMORY[0x24BDE1DA8]();
}

uint64_t nw_protocol_instance_assert_fallback_agent()
{
  return MEMORY[0x24BDE1DB0]();
}

uint64_t nw_protocol_instance_async()
{
  return MEMORY[0x24BDE1DB8]();
}

uint64_t nw_protocol_instance_async_if_needed()
{
  return MEMORY[0x24BDE1DC0]();
}

uint64_t nw_protocol_instance_clear_flow_for_key()
{
  return MEMORY[0x24BDE1DC8]();
}

uint64_t nw_protocol_instance_copy_association()
{
  return MEMORY[0x24BDE1DD0]();
}

uint64_t nw_protocol_instance_copy_endpoint()
{
  return MEMORY[0x24BDE1DD8]();
}

uint64_t nw_protocol_instance_copy_interface_for_path()
{
  return MEMORY[0x24BDE1DE0]();
}

uint64_t nw_protocol_instance_copy_local_cid_for_path()
{
  return MEMORY[0x24BDE1DE8]();
}

uint64_t nw_protocol_instance_copy_options()
{
  return MEMORY[0x24BDE1DF0]();
}

uint64_t nw_protocol_instance_copy_override_endpoint_for_path()
{
  return MEMORY[0x24BDE1DF8]();
}

uint64_t nw_protocol_instance_copy_path()
{
  return MEMORY[0x24BDE1E00]();
}

uint64_t nw_protocol_instance_copy_remote_cid_for_path()
{
  return MEMORY[0x24BDE1E08]();
}

uint64_t nw_protocol_instance_create_extra_path()
{
  return MEMORY[0x24BDE1E10]();
}

uint64_t nw_protocol_instance_enumerate_flows()
{
  return MEMORY[0x24BDE1E18]();
}

uint64_t nw_protocol_instance_establish_path()
{
  return MEMORY[0x24BDE1E20]();
}

uint64_t nw_protocol_instance_flush_batched_input()
{
  return MEMORY[0x24BDE1E28]();
}

uint64_t nw_protocol_instance_get_flow_for_key()
{
  return MEMORY[0x24BDE1E30]();
}

uint64_t nw_protocol_instance_get_level()
{
  return MEMORY[0x24BDE1E38]();
}

uint64_t nw_protocol_instance_get_logging_disabled()
{
  return MEMORY[0x24BDE1E40]();
}

uint64_t nw_protocol_instance_get_maximum_message_size()
{
  return MEMORY[0x24BDE1E48]();
}

uint64_t nw_protocol_instance_get_multipath_service()
{
  return MEMORY[0x24BDE1E50]();
}

uint64_t nw_protocol_instance_get_priority_for_path()
{
  return MEMORY[0x24BDE1E58]();
}

uint64_t nw_protocol_instance_get_sensitive_redacted()
{
  return MEMORY[0x24BDE1E60]();
}

uint64_t nw_protocol_instance_get_stats()
{
  return MEMORY[0x24BDE1E68]();
}

uint64_t nw_protocol_instance_get_stats_region()
{
  return MEMORY[0x24BDE1E70]();
}

uint64_t nw_protocol_instance_ignore_future_path_changes()
{
  return MEMORY[0x24BDE1E78]();
}

uint64_t nw_protocol_instance_notify_connection_id_changed()
{
  return MEMORY[0x24BDE1E80]();
}

uint64_t nw_protocol_instance_notify_updated_message_properties()
{
  return MEMORY[0x24BDE1E88]();
}

uint64_t nw_protocol_instance_process_external_input()
{
  return MEMORY[0x24BDE1E90]();
}

uint64_t nw_protocol_instance_report_done()
{
  return MEMORY[0x24BDE1E98]();
}

uint64_t nw_protocol_instance_report_ready()
{
  return MEMORY[0x24BDE1EA0]();
}

uint64_t nw_protocol_instance_reset_after_early_data()
{
  return MEMORY[0x24BDE1EA8]();
}

uint64_t nw_protocol_instance_schedule_wakeup()
{
  return MEMORY[0x24BDE1EB0]();
}

uint64_t nw_protocol_instance_set_current_path()
{
  return MEMORY[0x24BDE1EB8]();
}

uint64_t nw_protocol_instance_set_flow_for_key()
{
  return MEMORY[0x24BDE1EC0]();
}

uint64_t nw_protocol_instance_set_flow_is_datagram()
{
  return MEMORY[0x24BDE1EC8]();
}

uint64_t nw_protocol_instance_set_is_datagram()
{
  return MEMORY[0x24BDE1ED0]();
}

uint64_t nw_protocol_instance_set_limit_outbound_data()
{
  return MEMORY[0x24BDE1ED8]();
}

uint64_t nw_protocol_instance_set_link_flow_controlled()
{
  return MEMORY[0x24BDE1EE0]();
}

uint64_t nw_protocol_instance_set_preferred_addresses()
{
  return MEMORY[0x24BDE1EE8]();
}

uint64_t nw_protocol_instance_set_wakeup_handler()
{
  return MEMORY[0x24BDE1EF0]();
}

uint64_t nw_protocol_instance_tear_down_path()
{
  return MEMORY[0x24BDE1EF8]();
}

uint64_t nw_protocol_instance_unassert_fallback_agent()
{
  return MEMORY[0x24BDE1F00]();
}

uint64_t nw_protocol_instance_update_outbound_data_limit()
{
  return MEMORY[0x24BDE1F08]();
}

uint64_t nw_protocol_instance_wait_for_early_data()
{
  return MEMORY[0x24BDE1F10]();
}

uint64_t nw_protocol_metadata_copy_original()
{
  return MEMORY[0x24BDE1F28]();
}

uint64_t nw_protocol_metadata_create_reply()
{
  return MEMORY[0x24BDE1F30]();
}

uint64_t nw_protocol_metadata_create_singleton()
{
  return MEMORY[0x24BDE1F38]();
}

uint64_t nw_protocol_metadata_is_quic_connection()
{
  return MEMORY[0x24BDE1F58]();
}

uint64_t nw_protocol_metadata_is_quic_stream()
{
  return MEMORY[0x24BDE1F60]();
}

uint64_t nw_protocol_metadata_supports_replies()
{
  return MEMORY[0x24BDE1F68]();
}

uint64_t nw_protocol_options_copy()
{
  return MEMORY[0x24BDE1F90]();
}

uint64_t nw_protocol_options_get_log_id_num()
{
  return MEMORY[0x24BDE1FA0]();
}

uint64_t nw_protocol_options_get_log_id_str()
{
  return MEMORY[0x24BDE1FA8]();
}

uint64_t nw_protocol_options_is_quic_stream()
{
  return MEMORY[0x24BDE1FB0]();
}

uint64_t nw_protocol_request_outbound_data()
{
  return MEMORY[0x24BDE1FE8]();
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
  MEMORY[0x24BDE2028](stack);
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x24BDE2040](stack, protocol);
}

uint64_t nw_protocol_stack_set_original_proxied_transport_protocol()
{
  return MEMORY[0x24BDE2050]();
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x24BDE2058](stack, protocol);
}

uint64_t nw_queue_context_target_dispatch_queue()
{
  return MEMORY[0x24BDE20B8]();
}

uint64_t nw_quic_access_0rtt_state_on_queue()
{
  return MEMORY[0x24BDE20D0]();
}

uint64_t nw_quic_access_application_result_on_queue()
{
  return MEMORY[0x24BDE20D8]();
}

uint64_t nw_quic_access_token_on_queue()
{
  return MEMORY[0x24BDE20E0]();
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x24BDE20E8]();
}

uint64_t nw_quic_connection_copy_stream_metadata()
{
  return MEMORY[0x24BDE20F0]();
}

uint64_t nw_quic_connection_execute_locked()
{
  return MEMORY[0x24BDE20F8]();
}

uint64_t nw_quic_connection_execute_max_streams_update_block()
{
  return MEMORY[0x24BDE2100]();
}

uint64_t nw_quic_connection_execute_session_state_update_block()
{
  return MEMORY[0x24BDE2108]();
}

uint64_t nw_quic_connection_get_ack_delay_size()
{
  return MEMORY[0x24BDE2110]();
}

uint64_t nw_quic_connection_get_application_result_handler()
{
  return MEMORY[0x24BDE2118]();
}

uint64_t nw_quic_connection_get_datagram_context_id()
{
  return MEMORY[0x24BDE2120]();
}

uint64_t nw_quic_connection_get_datagram_quarter_stream_id()
{
  return MEMORY[0x24BDE2128]();
}

uint64_t nw_quic_connection_get_datagram_variant_flow_id_enabled()
{
  return MEMORY[0x24BDE2130]();
}

uint64_t nw_quic_connection_get_disable_ecn()
{
  return MEMORY[0x24BDE2138]();
}

uint64_t nw_quic_connection_get_disable_ecn_echo()
{
  return MEMORY[0x24BDE2140]();
}

uint64_t nw_quic_connection_get_disable_spin_bit()
{
  return MEMORY[0x24BDE2148]();
}

uint64_t nw_quic_connection_get_enable_l4s()
{
  return MEMORY[0x24BDE2150]();
}

uint64_t nw_quic_connection_get_enable_multipath()
{
  return MEMORY[0x24BDE2158]();
}

uint64_t nw_quic_connection_get_force_version_negotiation()
{
  return MEMORY[0x24BDE2160]();
}

uint64_t nw_quic_connection_get_idle_timeout()
{
  return MEMORY[0x24BDE2168]();
}

uint64_t nw_quic_connection_get_initial_max_data()
{
  return MEMORY[0x24BDE2170]();
}

uint64_t nw_quic_connection_get_initial_max_stream_data_bidirectional_local()
{
  return MEMORY[0x24BDE2178]();
}

uint64_t nw_quic_connection_get_initial_max_stream_data_bidirectional_remote()
{
  return MEMORY[0x24BDE2180]();
}

uint64_t nw_quic_connection_get_initial_max_stream_data_unidirectional()
{
  return MEMORY[0x24BDE2188]();
}

uint64_t nw_quic_connection_get_initial_max_streams_bidirectional()
{
  return MEMORY[0x24BDE2190]();
}

uint64_t nw_quic_connection_get_initial_max_streams_unidirectional()
{
  return MEMORY[0x24BDE2198]();
}

uint64_t nw_quic_connection_get_initial_packet_size()
{
  return MEMORY[0x24BDE21A0]();
}

uint64_t nw_quic_connection_get_keepalive_count()
{
  return MEMORY[0x24BDE21A8]();
}

uint64_t nw_quic_connection_get_keepalive_handler()
{
  return MEMORY[0x24BDE21B0]();
}

uint64_t nw_quic_connection_get_local_max_streams_bidirectional_handler()
{
  return MEMORY[0x24BDE21B8]();
}

uint64_t nw_quic_connection_get_local_max_streams_unidirectional_handler()
{
  return MEMORY[0x24BDE21C0]();
}

uint64_t nw_quic_connection_get_max_datagram_frame_size()
{
  return MEMORY[0x24BDE21C8]();
}

uint64_t nw_quic_connection_get_max_paths_per_interface()
{
  return MEMORY[0x24BDE21D0]();
}

uint64_t nw_quic_connection_get_max_udp_payload_size()
{
  return MEMORY[0x24BDE21D8]();
}

uint64_t nw_quic_connection_get_migration_for_non_transport()
{
  return MEMORY[0x24BDE21E0]();
}

uint64_t nw_quic_connection_get_peer_idle_timeout_handler()
{
  return MEMORY[0x24BDE21E8]();
}

uint64_t nw_quic_connection_get_pmtud()
{
  return MEMORY[0x24BDE21F0]();
}

uint64_t nw_quic_connection_get_pmtud_for_non_transport()
{
  return MEMORY[0x24BDE21F8]();
}

uint64_t nw_quic_connection_get_pmtud_ignore_cost()
{
  return MEMORY[0x24BDE2200]();
}

uint64_t nw_quic_connection_get_probe_simultaneously()
{
  return MEMORY[0x24BDE2208]();
}

uint64_t nw_quic_connection_get_quic_state()
{
  return MEMORY[0x24BDE2210]();
}

uint64_t nw_quic_connection_get_remote_max_streams_bidirectional_handler()
{
  return MEMORY[0x24BDE2218]();
}

uint64_t nw_quic_connection_get_remote_max_streams_unidirectional_handler()
{
  return MEMORY[0x24BDE2220]();
}

uint64_t nw_quic_connection_get_retry()
{
  return MEMORY[0x24BDE2228]();
}

uint64_t nw_quic_connection_get_source_connection_id()
{
  return MEMORY[0x24BDE2230]();
}

uint64_t nw_quic_connection_get_stream_path_affinity()
{
  return MEMORY[0x24BDE2238]();
}

uint64_t nw_quic_connection_get_tls_state()
{
  return MEMORY[0x24BDE2240]();
}

uint64_t nw_quic_connection_get_use_swift_tls()
{
  return MEMORY[0x24BDE2248]();
}

uint64_t nw_quic_connection_inject_packet_handler()
{
  return MEMORY[0x24BDE2250]();
}

uint64_t nw_quic_connection_set_application_error_internal()
{
  return MEMORY[0x24BDE2258]();
}

uint64_t nw_quic_connection_set_application_error_reason()
{
  return MEMORY[0x24BDE2260]();
}

uint64_t nw_quic_connection_set_application_result_handler()
{
  return MEMORY[0x24BDE2268]();
}

uint64_t nw_quic_connection_set_close_with_error_handler()
{
  return MEMORY[0x24BDE2270]();
}

uint64_t nw_quic_connection_set_is_early_data_accepted()
{
  return MEMORY[0x24BDE2278]();
}

uint64_t nw_quic_connection_set_keepalive_handler()
{
  return MEMORY[0x24BDE2280]();
}

uint64_t nw_quic_connection_set_link_flow_controlled_handler()
{
  return MEMORY[0x24BDE2288]();
}

uint64_t nw_quic_connection_set_local_max_streams_bidirectional_handler()
{
  return MEMORY[0x24BDE2290]();
}

uint64_t nw_quic_connection_set_local_max_streams_unidirectional_handler()
{
  return MEMORY[0x24BDE2298]();
}

uint64_t nw_quic_connection_set_max_data_handler()
{
  return MEMORY[0x24BDE22A0]();
}

uint64_t nw_quic_connection_set_max_stream_data_bidirectional_local_handler()
{
  return MEMORY[0x24BDE22A8]();
}

uint64_t nw_quic_connection_set_max_stream_data_bidirectional_remote_handler()
{
  return MEMORY[0x24BDE22B0]();
}

uint64_t nw_quic_connection_set_max_stream_data_unidirectional_handler()
{
  return MEMORY[0x24BDE22B8]();
}

uint64_t nw_quic_connection_set_sec_protocol_metadata()
{
  return MEMORY[0x24BDE22C0]();
}

uint64_t nw_quic_connection_set_stream_metadata()
{
  return MEMORY[0x24BDE22C8]();
}

uint64_t nw_quic_create_connection_metadata()
{
  return MEMORY[0x24BDE22D8]();
}

uint64_t nw_quic_create_stream_metadata()
{
  return MEMORY[0x24BDE22E0]();
}

uint64_t nw_quic_get_remote_transport_parameters()
{
  return MEMORY[0x24BDE22E8]();
}

uint64_t nw_quic_info_allocate()
{
  return MEMORY[0x24BDE22F0]();
}

uint64_t nw_quic_report_application_result_on_queue()
{
  return MEMORY[0x24BDE22F8]();
}

uint64_t nw_quic_save_0rtt_state_on_queue()
{
  return MEMORY[0x24BDE2300]();
}

uint64_t nw_quic_save_token_on_queue()
{
  return MEMORY[0x24BDE2308]();
}

uint64_t nw_quic_stream_copy_shared_connection_options()
{
  return MEMORY[0x24BDE2318]();
}

uint64_t nw_quic_stream_get_associated_stream_id()
{
  return MEMORY[0x24BDE2320]();
}

uint64_t nw_quic_stream_get_datagram_context_id()
{
  return MEMORY[0x24BDE2328]();
}

uint64_t nw_quic_stream_get_is_datagram()
{
  return MEMORY[0x24BDE2330]();
}

uint64_t nw_quic_stream_get_is_unidirectional()
{
  return MEMORY[0x24BDE2338]();
}

uint64_t nw_quic_stream_set_application_error_handler()
{
  return MEMORY[0x24BDE2340]();
}

uint64_t nw_quic_stream_set_application_error_internal()
{
  return MEMORY[0x24BDE2348]();
}

uint64_t nw_quic_stream_set_connection_metadata()
{
  return MEMORY[0x24BDE2350]();
}

uint64_t nw_quic_stream_set_datagram_variant_flow_id()
{
  return MEMORY[0x24BDE2358]();
}

uint64_t nw_quic_stream_set_has_datagram_variant_flow_id()
{
  return MEMORY[0x24BDE2360]();
}

uint64_t nw_quic_stream_set_id()
{
  return MEMORY[0x24BDE2368]();
}

uint64_t nw_quic_stream_set_type()
{
  return MEMORY[0x24BDE2370]();
}

uint64_t nw_quic_stream_set_usable_datagram_frame_size()
{
  return MEMORY[0x24BDE2378]();
}

void nw_release(void *obj)
{
  MEMORY[0x24BDE2380](obj);
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x24BDE2498](obj);
}

uint64_t nw_settings_get_signposts_enabled()
{
  return MEMORY[0x24BDE24E8]();
}

uint64_t nw_settings_register_quic_log_debug_updates()
{
  return MEMORY[0x24BDE24F0]();
}

uint64_t nw_swift_tls_create_options()
{
  return MEMORY[0x24BDE24F8]();
}

sec_protocol_metadata_t nw_tls_copy_sec_protocol_metadata(nw_protocol_metadata_t metadata)
{
  return (sec_protocol_metadata_t)MEMORY[0x24BDE25F0](metadata);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE2600](options);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x24BDE2608]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return MEMORY[0x24BDAF370]();
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x24BDAF378]();
}

uint64_t os_log_pack_send_and_compose()
{
  return MEMORY[0x24BDAF380]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x24BDAF3F8](object);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

uint64_t sec_protocol_metadata_copy_quic_transport_parameters()
{
  return MEMORY[0x24BDE9598]();
}

uint64_t sec_protocol_metadata_copy_serialized_session()
{
  return MEMORY[0x24BDE95A0]();
}

BOOL sec_protocol_metadata_get_early_data_accepted(sec_protocol_metadata_t metadata)
{
  return MEMORY[0x24BDE95B0](metadata);
}

tls_ciphersuite_t sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x24BDE95B8](metadata);
}

uint64_t sec_protocol_options_copy_transport_specific_application_protocol()
{
  return MEMORY[0x24BDE95F8]();
}

uint64_t sec_protocol_options_set_allow_unknown_alpn_protos()
{
  return MEMORY[0x24BDE9608]();
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x24BDE9630](options, version);
}

uint64_t sec_protocol_options_set_output_handler_access_block()
{
  return MEMORY[0x24BDE9638]();
}

uint64_t sec_protocol_options_set_quic_transport_parameters()
{
  return MEMORY[0x24BDE9648]();
}

void sec_protocol_options_set_quic_use_legacy_codepoint(sec_protocol_options_t options, BOOL quic_use_legacy_codepoint)
{
  MEMORY[0x24BDE9650](options, quic_use_legacy_codepoint);
}

uint64_t sec_protocol_options_set_session_state()
{
  return MEMORY[0x24BDE9660]();
}

uint64_t sec_protocol_options_set_session_update_block()
{
  return MEMORY[0x24BDE9668]();
}

uint64_t sec_protocol_options_set_tls_certificate_compression_enabled()
{
  return MEMORY[0x24BDE9670]();
}

uint64_t sec_protocol_options_set_tls_encryption_level_update_block()
{
  return MEMORY[0x24BDE9680]();
}

uint64_t sec_protocol_options_set_tls_encryption_secret_update_block()
{
  return MEMORY[0x24BDE9688]();
}

void sec_release(void *obj)
{
  MEMORY[0x24BDE96B8](obj);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x24BDB0260](__b1, __b2, __len);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

