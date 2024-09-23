@implementation SendQueries

BOOL __SendQueries_block_invoke(_QWORD *a1, int *a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  unsigned int v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  _BOOL8 result;
  NSObject *v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  int v38;
  const char *v39;
  int v40;
  uint8_t buf[4];
  _BYTE v43[14];
  __int16 v44;
  _BYTE v45[14];
  __int16 v46;
  _BYTE v47[14];
  __int16 v48;
  _BYTE v49[20];
  _DWORD v50[4];

  v7 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v8 = a1[6];
  v9 = *(unsigned __int16 *)(v8 + 342);
  if (!v7 || (v10 = *(uint64_t **)(v7 + 16)) == 0)
  {
LABEL_11:
    v14 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_INFO))
      {
        v16 = bswap32(*(unsigned __int16 *)(v8 + 340)) >> 16;
        v17 = (_BYTE *)(v8 + 376);
        if (v8 == -632)
        {
LABEL_19:
          while (v17)
          {
            v18 = *v17;
            if (v18 > 0x3F)
              break;
            if (!*v17)
            {
              v24 = (unsigned __int16)((_WORD)v17 - (v8 + 376) + 1);
              goto LABEL_36;
            }
            v17 += v18 + 1;
            if (v8 != -632)
              goto LABEL_18;
          }
        }
        else
        {
LABEL_18:
          if ((unint64_t)v17 < v8 + 632)
            goto LABEL_19;
        }
        v24 = 257;
        goto LABEL_36;
      }
    }
    else
    {
      v14 = mDNSLogCategory_Default_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_INFO))
      {
        v16 = bswap32(*(unsigned __int16 *)(v8 + 340)) >> 16;
        v22 = (_BYTE *)(v8 + 376);
        if (v8 == -632)
        {
LABEL_27:
          while (v22)
          {
            v23 = *v22;
            if (v23 > 0x3F)
              break;
            if (!*v22)
            {
              v24 = (unsigned __int16)((_WORD)v22 - (v8 + 376) + 1);
              goto LABEL_36;
            }
            v22 += v23 + 1;
            if (v8 != -632)
              goto LABEL_26;
          }
        }
        else
        {
LABEL_26:
          if ((unint64_t)v22 < v8 + 632)
            goto LABEL_27;
        }
        v24 = 257;
LABEL_36:
        v25 = *(_DWORD *)(v8 + 200);
        *(_DWORD *)buf = 67111427;
        *(_DWORD *)v43 = v16;
        *(_WORD *)&v43[4] = 2160;
        *(_QWORD *)&v43[6] = 1752392040;
        v44 = 1045;
        *(_DWORD *)v45 = 20;
        *(_WORD *)&v45[4] = 2101;
        *(_QWORD *)&v45[6] = a2;
        v46 = 1024;
        *(_DWORD *)v47 = a3;
        *(_WORD *)&v47[4] = 2160;
        *(_QWORD *)&v47[6] = 1752392040;
        v48 = 1040;
        *(_DWORD *)v49 = v24;
        *(_WORD *)&v49[4] = 2101;
        *(_QWORD *)&v49[6] = v8 + 376;
        *(_WORD *)&v49[14] = 1024;
        *(_DWORD *)&v49[16] = v9;
        LOWORD(v50[0]) = 1024;
        *(_DWORD *)((char *)v50 + 2) = v25;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[Q%u] Sending unicast assist query - %{sensitive, mask.hash, mdnsresponder:ip_addr}.20P %d %{sensitive, mask.hash, mdnsresponder:domain_name}.*P %{mdns:rrtype}d qhash %x", buf, 0x4Eu);
      }
    }
    v26 = a1[7] + 28960;
    *(_WORD *)v26 = *(_WORD *)(a1[6] + 340);
    *(_WORD *)(v26 + 2) = 0;
    *(_QWORD *)(v26 + 4) = 0;
    v27 = putQuestion(a1[7] + 28960, a1[7] + 28972, a1[7] + 37912, (unsigned __int8 *)(a1[6] + 376), *(unsigned __int16 *)(a1[6] + 342), *(unsigned __int16 *)(a1[6] + 344) | 0x8000u, v20, v21);
    mDNSSendDNSMessage(a1[7], a1[7] + 28960, (unint64_t)v27, a3, 0, 0, a2, 0xE914u, 0, *(_BYTE *)(a1[6] + 640));
    v28 = a1[6];
    v29 = *(_DWORD *)(a1[7] + 64);
    *(_DWORD *)(v28 + 208) = v29;
    *(_DWORD *)(v28 + 256) = v29;
    *(_DWORD *)(v28 + 224) = 0;
    *(_QWORD *)(v28 + 64) = 0;
    v30 = *(_DWORD *)(a1[7] + 64);
    if (v30 <= 1)
      v30 = 1;
    *(_DWORD *)(a1[6] + 216) = v30;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
    return 1;
  }
  v11 = dword_100158E08;
  v12 = dword_100158E08 + 939524096;
  while (1)
  {
    if (*((unsigned __int16 *)v10 + 6) == v9 && v10[4] == a3)
    {
      v13 = v12;
      if (!*((_BYTE *)v10 + 109))
        v13 = *((_DWORD *)v10 + 20) + 1000 * *((_DWORD *)v10 + 4);
      if (v13 - v11 >= 300001 && mDNSSameAddress((int *)v10 + 33, a2))
        break;
    }
    v10 = (uint64_t *)*v10;
    if (!v10)
      goto LABEL_11;
  }
  v32 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_INFO);
    if (result)
    {
      v33 = v8 + 376;
      v36 = (_BYTE *)(v8 + 376);
      if (v8 == -632)
      {
LABEL_54:
        while (v36)
        {
          v37 = *v36;
          if (v37 > 0x3F)
            break;
          if (!*v36)
          {
            v38 = (unsigned __int16)((_WORD)v36 - v33 + 1);
            goto LABEL_63;
          }
          v36 += v37 + 1;
          if (v8 != -632)
            goto LABEL_53;
        }
      }
      else
      {
LABEL_53:
        if ((unint64_t)v36 < v8 + 632)
          goto LABEL_54;
      }
      v38 = 257;
      goto LABEL_63;
    }
  }
  else
  {
    v32 = mDNSLogCategory_Default_redacted;
    result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_INFO);
    if (result)
    {
      v33 = v8 + 376;
      v34 = (_BYTE *)(v8 + 376);
      if (v8 == -632)
      {
LABEL_46:
        while (v34)
        {
          v35 = *v34;
          if (v35 > 0x3F)
            break;
          if (!*v34)
          {
            v38 = (unsigned __int16)((_WORD)v34 - v33 + 1);
            goto LABEL_63;
          }
          v34 += v35 + 1;
          if (v8 != -632)
            goto LABEL_45;
        }
      }
      else
      {
LABEL_45:
        if ((unint64_t)v34 < v8 + 632)
          goto LABEL_46;
      }
      v38 = 257;
LABEL_63:
      v39 = DNSTypeName(v9);
      v40 = *(_DWORD *)(a1[6] + 200);
      *(_DWORD *)buf = 141560067;
      *(_QWORD *)v43 = 1752392040;
      *(_WORD *)&v43[8] = 1045;
      *(_DWORD *)&v43[10] = 20;
      v44 = 2101;
      *(_QWORD *)v45 = a2;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)&v45[10] = a3;
      v46 = 2160;
      *(_QWORD *)v47 = 1752392040;
      *(_WORD *)&v47[8] = 1040;
      *(_DWORD *)&v47[10] = v38;
      v48 = 2101;
      *(_QWORD *)v49 = v33;
      *(_WORD *)&v49[8] = 2082;
      *(_QWORD *)&v49[10] = v39;
      *(_WORD *)&v49[18] = 1024;
      v50[0] = v40;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "SKIPPED unicast assist query - %{sensitive, mask.hash, mdnsresponder:ip_addr}.20P %d %{sensitive, mask.hash, mdnsresponder:domain_name}.*P %{public}s qhash %x", buf, 0x4Cu);
      return 0;
    }
  }
  return result;
}

@end
