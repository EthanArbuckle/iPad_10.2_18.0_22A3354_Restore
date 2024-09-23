uint64_t _dnssec_obj_validation_manager_compare()
{
  return 2;
}

void _dnssec_obj_validation_manager_finalize(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t i;
  _QWORD *v7;
  void *v8;

  v2 = (_QWORD *)a1[2];
  if (v2)
  {
    ref_count_obj_release(v2);
    a1[2] = 0;
  }
  v3 = (_QWORD *)a1[4];
  if (v3)
  {
    ref_count_obj_release(v3);
    a1[4] = 0;
  }
  v4 = (_QWORD *)a1[5];
  if (v4)
  {
    ref_count_obj_release(v4);
    a1[5] = 0;
  }
  _dnssec_obj_validation_manager_reset_validation_key_requestor((uint64_t)a1);
  _dnssec_obj_validation_manager_reset_insecure_validation((uint64_t)a1);
  v5 = a1[16];
  if (v5)
  {
    for (i = 0; i < v5; ++i)
    {
      v7 = *(_QWORD **)(a1[15] + 8 * i);
      if (v7)
      {
        ref_count_obj_release(v7);
        v5 = a1[16];
        *(_QWORD *)(a1[15] + 8 * i) = 0;
      }
    }
  }
  v8 = (void *)a1[15];
  if (v8)
  {
    free(v8);
    a1[15] = 0;
  }
}

void _dnssec_obj_validation_manager_reset_validation_key_requestor(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v6;
  unsigned int v7;
  void *v8;
  _QWORD *v9;
  _DWORD v10[2];
  __int16 v11;
  unsigned int v12;

  *(_BYTE *)(a1 + 72) = 0;
  v2 = *(_QWORD *)(a1 + 56);
  if (!v2)
    goto LABEL_13;
  v3 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    goto LABEL_10;
  }
  v3 = mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    v6 = *(unsigned __int16 *)(a1 + 24);
    v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    v10[0] = 67109376;
    v10[1] = v6;
    v11 = 1024;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Canceling the existing validation key requestor", (uint8_t *)v10, 0xEu);
  }
LABEL_11:
  mDNS_StopQuery((unsigned int *)&mDNSStorage, *(_QWORD *)(a1 + 56));
  v8 = *(void **)(a1 + 56);
  if (v8)
  {
    free(v8);
    *(_QWORD *)(a1 + 56) = 0;
  }
LABEL_13:
  v9 = *(_QWORD **)(a1 + 64);
  if (v9)
  {
    ref_count_obj_release(v9);
    *(_QWORD *)(a1 + 64) = 0;
  }
}

void _dnssec_obj_validation_manager_reset_insecure_validation(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v6;
  unsigned int v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;

  v2 = *(_QWORD *)(a1 + 80);
  if (!v2)
    goto LABEL_13;
  v3 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    goto LABEL_10;
  }
  v3 = mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    v6 = *(unsigned __int16 *)(a1 + 24);
    v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    v8 = *(_DWORD *)(a1 + 112);
    v9 = *(_QWORD *)(a1 + 88) != 0;
    v11[0] = 67109888;
    v11[1] = v6;
    v12 = 1024;
    v13 = v7;
    v14 = 1026;
    v15 = v8;
    v16 = 1024;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Canceling the existing insecure validation - state: %{public, mdns:dnssec_inval_state}d, validated: %{mdns:yesno}d", (uint8_t *)v11, 0x1Au);
  }
LABEL_11:
  mDNS_StopQuery((unsigned int *)&mDNSStorage, *(_QWORD *)(a1 + 80));
  v10 = *(void **)(a1 + 80);
  if (v10)
  {
    free(v10);
    *(_QWORD *)(a1 + 80) = 0;
  }
LABEL_13:
  *(_DWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  _dnssec_obj_validation_manager_stop_negative_ds_query(a1);
}

void _dnssec_obj_validation_manager_stop_negative_ds_query(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  void *v10;
  _QWORD *v11;
  _DWORD v12[2];
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 96);
  if (!v2)
    goto LABEL_18;
  v3 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    v5 = *(unsigned __int16 *)(a1 + 24);
    v6 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    v7 = *(_QWORD *)(a1 + 104);
    if (v7)
    {
      v8 = *(_DWORD *)(v7 + 24);
      v7 = *(_QWORD *)(v7 + 16);
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_15;
  }
  v3 = mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(unsigned __int16 *)(a1 + 24);
    v6 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    v7 = *(_QWORD *)(a1 + 104);
    if (v7)
    {
      v8 = *(_DWORD *)(v7 + 24);
      v7 = *(_QWORD *)(v7 + 16);
    }
    else
    {
      v8 = 0;
    }
LABEL_15:
    v12[0] = 67110147;
    v12[1] = v5;
    v13 = 1024;
    v14 = v6;
    v15 = 2160;
    v16 = 1752392040;
    v17 = 1040;
    v18 = v8;
    v19 = 2101;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[Q%u->SubQ%u] Stop DS denial look up question - DS denial lookup name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", (uint8_t *)v12, 0x28u);
  }
LABEL_16:
  mDNS_StopQuery((unsigned int *)&mDNSStorage, *(_QWORD *)(a1 + 96));
  v10 = *(void **)(a1 + 96);
  if (v10)
  {
    free(v10);
    *(_QWORD *)(a1 + 96) = 0;
  }
LABEL_18:
  v11 = *(_QWORD **)(a1 + 104);
  if (v11)
  {
    ref_count_obj_release(v11);
    *(_QWORD *)(a1 + 104) = 0;
  }
}

BOOL dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  unsigned __int8 *v5;
  uint64_t v6;
  _BOOL8 result;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  _BYTE v24[20];
  int v25;
  __int16 v26;
  uint64_t v27;

  if (!a1)
  {
    v2 = a2;
    if (a2)
      goto LABEL_5;
    return 0;
  }
  v2 = a1;
  if (a2)
    return 0;
LABEL_5:
  v3 = *(_DWORD *)(v2 + 40);
  if (v3 != 4 && v3 != 2)
    return 0;
  if (!*(_QWORD *)(v2 + 32))
  {
    v19 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
    }
    else
    {
      v19 = mDNSLogCategory_DNSSEC_redacted;
      result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
    }
    v21 = 136447234;
    v22 = (uint64_t)"dnssec_obj_rrset_get_rr_count(me) > 0";
    v23 = 2082;
    *(_QWORD *)v24 = "";
    *(_WORD *)&v24[8] = 2082;
    *(_QWORD *)&v24[10] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
    *(_WORD *)&v24[18] = 1024;
    v25 = 361;
    v26 = 2048;
    v27 = 0;
    v16 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    v17 = v19;
    v18 = 48;
    goto LABEL_39;
  }
  v5 = *(unsigned __int8 **)(v2 + 24);
  if (**(unsigned __int8 **)v5 != 240)
  {
    v8 = 0;
    do
    {
      while (1)
      {
        v9 = *(unsigned __int16 *)(*(_QWORD *)v5 + 4);
        if (v9 != 43)
        {
          if (v9 == 46)
            return 0;
          if (v9 != 48)
            break;
        }
        v5 = (unsigned __int8 *)*((_QWORD *)v5 + 1);
        v8 = 1;
        if (!v5)
          goto LABEL_23;
      }
      v5 = (unsigned __int8 *)*((_QWORD *)v5 + 1);
    }
    while (v5);
    if ((v8 & 1) == 0)
      return 1;
LABEL_23:
    v10 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
      v12 = *(_QWORD *)(v2 + 16);
      if (v12)
      {
        v13 = *(_DWORD *)(v12 + 24);
        v14 = *(_QWORD *)(v12 + 16);
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
    }
    else
    {
      v10 = mDNSLogCategory_DNSSEC_redacted;
      result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
      v15 = *(_QWORD *)(v2 + 16);
      if (v15)
      {
        v13 = *(_DWORD *)(v15 + 24);
        v14 = *(_QWORD *)(v15 + 16);
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
    }
    v21 = 141558787;
    v22 = 1752392040;
    v23 = 1040;
    *(_DWORD *)v24 = v13;
    *(_WORD *)&v24[4] = 2101;
    *(_QWORD *)&v24[6] = v14;
    *(_WORD *)&v24[14] = 1024;
    *(_DWORD *)&v24[16] = dnssec_obj_rrset_get_rr_type(v2);
    v16 = "Received positive DNSKEY or DS RRSet without RRSIG, malformed - name: %{sensitive, mask.hash, mdnsresponder:do"
          "main_name}.*P, type: %{mdns:rrtype}d.";
    v17 = v10;
    v18 = 34;
LABEL_39:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v16, (uint8_t *)&v21, v18);
    return 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)v5 + 56);
  return !v6 || *(_DWORD *)(v6 + 32) || *(_BYTE *)(v6 + 40) || *(_QWORD *)(v6 + 48) == 0;
}

_DWORD *_dnssec_obj_validation_manager_start_sub_query(uint64_t a1, __int16 a2, __int16 a3, int a4, uint64_t a5, uint64_t a6, int *a7)
{
  _DWORD *result;
  uint64_t v15;
  int started;
  int v17;

  result = malloc_type_calloc(1uLL, 0x2B8uLL, 0xF1748037uLL);
  if (result)
  {
    v15 = (uint64_t)result;
    result[53] = -1;
    *((_QWORD *)result + 17) = *(_QWORD *)(*(_QWORD *)(a5 + 24) + 136);
    result[81] = a4;
    __memcpy_chk(result + 94, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), 320);
    *(_WORD *)(v15 + 344) = a2;
    *(_WORD *)(v15 + 342) = a3;
    *(_BYTE *)(v15 + 655) = (a4 & 0x200000) != 0;
    *(_BYTE *)(v15 + 635) = (a4 & 0x1000) != 0;
    *(_DWORD *)(v15 + 244) = getpid();
    *(_QWORD *)(v15 + 152) = a6;
    *(_QWORD *)(v15 + 176) = a5;
    started = mDNS_StartQuery((unsigned int *)&mDNSStorage, v15);
    if (a7)
    {
      if (started)
        v17 = -6736;
      else
        v17 = 0;
      *a7 = v17;
    }
    if (started)
    {
      free((void *)v15);
      return 0;
    }
    return (_DWORD *)v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void dnssec_obj_validation_manager_start_insecure_validation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned __int8 *v17;
  int v18;
  int started;
  NSObject *v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  int v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;

  *(_QWORD *)(a1 + 48) = 0xFFFFE5C200000000;
  _dnssec_obj_validation_manager_reset_validation_key_requestor(a1);
  _dnssec_obj_validation_manager_reset_insecure_validation(a1);
  *(_DWORD *)(a1 + 140) = 0;
  *(_BYTE *)(a1 + 144) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    v4 = *(_QWORD *)(a1 + 40);
  v26 = 0;
  if (*(_QWORD *)(a1 + 80))
    return;
  if (*(_DWORD *)(a1 + 112) || !v4 || ((v5 = *(_DWORD *)(v4 + 40), v5 != 2) ? (v6 = v5 == 4) : (v6 = 1), !v6))
  {
    v17 = 0;
    v18 = -6709;
LABEL_27:
    v26 = v18;
    goto LABEL_28;
  }
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(unsigned __int8 **)(v7 + 16);
  v9 = *v8;
  if (!*v8)
    goto LABEL_39;
  v10 = *(_QWORD *)(a2 + 24);
  if (!v10)
    goto LABEL_39;
  v11 = -1;
  v12 = *(_QWORD *)(v7 + 16);
  do
  {
    v13 = v11;
    v14 = v12 + v9;
    v15 = *(unsigned __int8 *)(v14 + 1);
    v12 = v14 + 1;
    v9 = v15;
    ++v11;
  }
  while (v15);
  if (*(_WORD *)(v10 + 342) == 43 && v13 + 2 <= 1)
  {
LABEL_39:
    v17 = 0;
    v18 = -6736;
    goto LABEL_27;
  }
  v17 = dnssec_obj_domain_name_copy_parent_domain(v8, v11, &v26);
  v18 = v26;
  if (v26)
    goto LABEL_28;
  started = _dnssec_obj_validation_manager_start_negative_ds_query(a1, (uint64_t)v17, a2);
  v26 = started;
  if (started)
  {
    v18 = started;
LABEL_28:
    _dnssec_obj_validation_manager_fail_insecure_validation(a1, v18);
    if (!v17)
      return;
    goto LABEL_37;
  }
  v20 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
      goto LABEL_32;
  }
  else
  {
    v20 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
      goto LABEL_32;
  }
  v21 = *(unsigned __int16 *)(a1 + 24);
  v22 = bswap32(*(unsigned __int16 *)(*(_QWORD *)(a1 + 96) + 340)) >> 16;
  v24 = *(_QWORD *)(v7 + 16);
  v23 = *(_QWORD *)(v7 + 24);
  *(_DWORD *)buf = 67110147;
  v28 = v21;
  v29 = 1024;
  v30 = v22;
  v31 = 2160;
  v32 = 1752392040;
  v33 = 1040;
  v34 = v23;
  v35 = 2101;
  v36 = v24;
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Start insecure validation - unsigned domain: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x28u);
LABEL_32:
  *(_DWORD *)(a1 + 112) = 1;
  if (v17)
    ++*(_DWORD *)v17;
  v25 = *(_QWORD **)(a1 + 104);
  if (v25)
    ref_count_obj_release(v25);
  *(_QWORD *)(a1 + 104) = v17;
  v26 = 0;
  if (v17)
LABEL_37:
    ref_count_obj_release(v17);
}

uint64_t _dnssec_obj_validation_manager_start_negative_ds_query(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int16 rr_class;
  _DWORD *started;
  _DWORD *v9;
  NSObject *v10;
  int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  unsigned int v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;

  v18 = 0;
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (!v6)
      return -6709;
  }
  if (*(_QWORD *)(a1 + 96))
    return -6709;
  rr_class = dnssec_obj_rrset_get_rr_class(v6);
  started = _dnssec_obj_validation_manager_start_sub_query(a2, rr_class, 43, 4096, a3, (uint64_t)_query_record_with_insecure_validation_reply, (int *)&v18);
  *(_QWORD *)(a1 + 96) = started;
  if (!v18)
  {
    v9 = started;
    v10 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
      {
        v12 = *(unsigned __int16 *)(a1 + 24);
        v13 = bswap32(*((unsigned __int16 *)v9 + 170)) >> 16;
        if (a2)
        {
          v14 = *(_DWORD *)(a2 + 24);
          v15 = *(_QWORD *)(a2 + 16);
        }
        else
        {
          v14 = 0;
          v15 = 0;
        }
        goto LABEL_18;
      }
    }
    else
    {
      v10 = mDNSLogCategory_DNSSEC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
      {
        v12 = *(unsigned __int16 *)(a1 + 24);
        v13 = bswap32(*((unsigned __int16 *)v9 + 170)) >> 16;
        if (a2)
        {
          v14 = *(_DWORD *)(a2 + 24);
          v15 = *(_QWORD *)(a2 + 16);
        }
        else
        {
          v14 = 0;
          v15 = 0;
        }
LABEL_18:
        *(_DWORD *)buf = 67110147;
        v20 = v12;
        v21 = 1024;
        v22 = v13;
        v23 = 2160;
        v24 = 1752392040;
        v25 = 1040;
        v26 = v14;
        v27 = 2101;
        v28 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Searching for DS denial - q_name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x28u);
      }
    }
  }
  return v18;
}

void _dnssec_obj_validation_manager_fail_insecure_validation(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;

  v4 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 104);
      if (v6)
      {
        v7 = *(_DWORD *)(v6 + 24);
        v6 = *(_QWORD *)(v6 + 16);
      }
      else
      {
        v7 = 0;
      }
      v9 = *(_QWORD *)(a1 + 96);
      if (v9)
        LODWORD(v9) = bswap32(*(unsigned __int16 *)(v9 + 340)) >> 16;
      v10 = *(unsigned __int16 *)(a1 + 24);
      v11 = *(_DWORD *)(a1 + 112);
      v12 = *(_QWORD *)(a1 + 80);
      if (v12)
        LODWORD(v12) = bswap32(*(unsigned __int16 *)(v12 + 340)) >> 16;
      goto LABEL_23;
    }
  }
  else
  {
    v4 = mDNSLogCategory_DNSSEC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 104);
      if (v6)
      {
        v7 = *(_DWORD *)(v6 + 24);
        v6 = *(_QWORD *)(v6 + 16);
      }
      else
      {
        v7 = 0;
      }
      v9 = *(_QWORD *)(a1 + 96);
      if (v9)
        LODWORD(v9) = bswap32(*(unsigned __int16 *)(v9 + 340)) >> 16;
      v10 = *(unsigned __int16 *)(a1 + 24);
      v11 = *(_DWORD *)(a1 + 112);
      v12 = *(_QWORD *)(a1 + 80);
      if (v12)
        LODWORD(v12) = bswap32(*(unsigned __int16 *)(v12 + 340)) >> 16;
LABEL_23:
      v13[0] = 67110659;
      v13[1] = v10;
      v14 = 1026;
      v15 = v11;
      v16 = 2160;
      v17 = 1752392040;
      v18 = 1040;
      v19 = v7;
      v20 = 2101;
      v21 = v6;
      v22 = 1024;
      v23 = v9;
      v24 = 1024;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[Q%u] Insecure validation failed - state: %{public, mdns:dnssec_inval_state}d, DS denial lookup name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, DS denial lookup q: Q%u, secure DS denial q: Q%u", (uint8_t *)v13, 0x34u);
    }
  }
  _dnssec_obj_validation_manager_reset_insecure_validation(a1);
  *(_DWORD *)(a1 + 112) = 3;
  *(_DWORD *)(a1 + 48) = 3;
  *(_DWORD *)(a1 + 52) = a2;
}

uint64_t _update_validated_cache_with_rrset(uint64_t a1, int a2)
{
  size_t v2;
  uint64_t cache_record;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t *v13;
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
  size_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  int v39;
  BOOL v40;
  unsigned int v41;
  uint64_t *v42;
  uint64_t v43;
  __int128 *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
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
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t NewCacheEntry;
  int v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  int v69;
  NSObject *v70;
  uint64_t v71;
  _BYTE *v72;
  uint64_t v73;
  unsigned __int16 v74;
  unsigned __int16 v75;
  int v76;
  int v77;
  int v78;
  NSObject *v79;
  int v80;
  int actual_ttl;
  int v82;
  int v83;
  NSObject *v84;
  unsigned int v85;
  uint64_t *v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v90;
  unsigned int v91;
  _BYTE *v92;
  uint64_t v93;
  _BOOL4 v94;
  _BYTE *v95;
  uint64_t v96;
  int v97;
  int v98;
  int v99;
  _BOOL4 v100;
  int v101;
  NSObject *v103;
  NSObject *v105;
  NSObject *v106;
  unsigned int v110;
  NSObject *v111;
  int v112;
  _BYTE *v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t *v123;
  uint64_t v124;
  size_t v125;
  unsigned int v126;
  uint8_t buf[4];
  _BYTE v128[44];
  int v129;
  __int16 v130;
  unsigned int v131;
  __int16 v132;
  _BOOL4 v133;
  __int16 v134;
  int v135;
  __int16 v136;
  uint64_t v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  size_t v141;
  __int16 v142;
  uint64_t v143;
  _QWORD v144[256];

  v126 = 0;
  v119 = *(_DWORD *)(a1 + 44);
  v125 = 0;
  v123 = dnssec_obj_rrset_copy_rrs((_QWORD *)a1, &v125, &v126);
  if (v126)
    goto LABEL_199;
  v2 = v125;
  if (!v125)
    goto LABEL_223;
  cache_record = resource_record_get_cache_record(*(_QWORD *)(*v123 + 56));
  if (!cache_record)
  {
    v103 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_DNSSEC != mDNSLogCategory_State)
    {
      v103 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        goto LABEL_223;
      goto LABEL_222;
    }
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
    {
LABEL_222:
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)v128 = "cr != NULL";
      *(_WORD *)&v128[8] = 2082;
      *(_QWORD *)&v128[10] = "";
      *(_WORD *)&v128[18] = 2082;
      *(_QWORD *)&v128[20] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_mdns_core.c";
      *(_WORD *)&v128[28] = 1024;
      *(_DWORD *)&v128[30] = 314;
      *(_WORD *)&v128[34] = 2048;
      *(_QWORD *)&v128[36] = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
    }
LABEL_223:
    v126 = -6736;
    goto LABEL_199;
  }
  v4 = *(_QWORD *)(cache_record + 96);
  if (!v4)
    goto LABEL_223;
  v121 = CacheGroupForName((uint64_t)mDNSStorage, *(_DWORD *)(v4 + 200), (_BYTE *)(v4 + 376));
  if (!v121)
    goto LABEL_223;
  v5 = *v123;
  v6 = resource_record_get_cache_record(*(_QWORD *)(*v123 + 56));
  if (v6)
  {
    if ((*(_DWORD *)(v6 + 80) + 1000 * a2) <= 1)
      v7 = 1;
    else
      v7 = *(_DWORD *)(v6 + 80) + 1000 * a2;
    v8 = v121[2];
    if (v8)
    {
      while (1)
      {
        v9 = *(_QWORD *)(v5 + 48);
        if (v9)
          v9 = *(_QWORD *)(v9 + 24);
        v10 = *(_QWORD *)(v8 + 56);
        if (v10)
          v10 = *(_QWORD *)(v10 + 24);
        if (v9 == v10)
        {
          v11 = *(_QWORD *)(v8 + 64);
          if (v11)
          {
            if (*(_DWORD *)(v11 + 32) == 1 && identical_dnssec_validated_same_name_resource_record(v5, v8 + 8))
              break;
          }
        }
        v8 = *(_QWORD *)v8;
        if (!v8)
          goto LABEL_27;
      }
      if (*(_BYTE *)(v8 + 109))
        v12 = dword_100158E08 + 939524096;
      else
        v12 = *(_DWORD *)(v8 + 80) + 1000 * *(_DWORD *)(v8 + 16);
      if (v12 <= 1)
        v12 = 1;
      if ((int)(v7 - v12) <= 999)
      {
        v126 = 0;
        goto LABEL_199;
      }
    }
    goto LABEL_27;
  }
  v105 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
      goto LABEL_27;
  }
  else
  {
    v105 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
      goto LABEL_27;
  }
  *(_DWORD *)buf = 136447234;
  *(_QWORD *)v128 = "rr_cr != NULL";
  *(_WORD *)&v128[8] = 2082;
  *(_QWORD *)&v128[10] = "";
  *(_WORD *)&v128[18] = 2082;
  *(_QWORD *)&v128[20] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj"
                         "_validation_manager.c";
  *(_WORD *)&v128[28] = 1024;
  *(_DWORD *)&v128[30] = 1759;
  *(_WORD *)&v128[34] = 2048;
  *(_QWORD *)&v128[36] = 0;
  _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
LABEL_27:
  v13 = CacheGroupForName((uint64_t)mDNSStorage, *(_DWORD *)(v4 + 200), (_BYTE *)(v4 + 376));
  if (v13 && (v19 = v13[2]) != 0)
  {
    v20 = 0;
    do
    {
      v21 = *(_QWORD *)(v19 + 64);
      if (v21
        && *(_DWORD *)(v21 + 32) == 1
        && SameNameRecordAnswersQuestion((unsigned __int8 *)(v19 + 8), 0, v4, v14, v15, v16, v17, v18))
      {
        *(_DWORD *)(v19 + 80) = dword_100158E08 + ~(1000 * *(_DWORD *)(v19 + 16));
        *(_BYTE *)(v19 + 108) = 4;
        SetNextCacheCheckTimeForRecord((uint64_t)mDNSStorage, v19);
        ++v20;
      }
      v19 = *(_QWORD *)v19;
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }
  bzero(v144, 0x800uLL);
  if (v2 > 0x100)
  {
    v126 = -6751;
    v106 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        goto LABEL_199;
    }
    else
    {
      v106 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        goto LABEL_199;
    }
    v110 = bswap32(*(unsigned __int16 *)(v4 + 340));
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v128 = HIWORD(v110);
    *(_WORD *)&v128[4] = 2048;
    *(_QWORD *)&v128[6] = v2;
    *(_WORD *)&v128[14] = 2048;
    *(_QWORD *)&v128[16] = 256;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_FAULT, "[Q%u] RRSet size too large, unable to process - rr_count: %zu, size limit: %zu", buf, 0x1Cu);
    goto LABEL_199;
  }
  v117 = 0;
  v118 = v20;
  v114 = (_BYTE *)(v4 + 376);
  v115 = v4;
  v22 = 0;
  v124 = 0;
  v23 = 0;
  if (v2 <= 1)
    v24 = 1;
  else
    v24 = v2;
  v120 = v24;
  while (1)
  {
    v25 = v23;
    v26 = v2;
    v27 = (unsigned __int8 *)v123[v22];
    v28 = resource_record_get_cache_record(*((_QWORD *)v27 + 7));
    if (!v28)
      break;
    v29 = v121[2];
    if (v29)
    {
      v30 = v28;
      while (1)
      {
        v31 = *((_QWORD *)v27 + 6);
        if (v31)
          v31 = *(_QWORD *)(v31 + 24);
        v32 = *(_QWORD *)(v29 + 56);
        if (v32)
          v32 = *(_QWORD *)(v32 + 24);
        if (v31 == v32)
        {
          v33 = *(_QWORD *)(v29 + 64);
          if (v33)
          {
            if (*(_DWORD *)(v33 + 32) == 1
              && identical_dnssec_validated_same_name_resource_record((uint64_t)v27, v29 + 8))
            {
              break;
            }
          }
        }
        v29 = *(_QWORD *)v29;
        if (!v29)
          goto LABEL_66;
      }
      v116 = *(_DWORD *)(v29 + 16);
      *(_DWORD *)(v29 + 80) = *(_DWORD *)(v30 + 80);
      *(_DWORD *)(v29 + 16) = a2;
      *(_BYTE *)(v29 + 108) = 0;
      SetNextCacheCheckTimeForRecord((uint64_t)mDNSStorage, v29);
      v34 = mDNSLogCategory_DNSSEC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG))
        {
          v71 = *(_QWORD *)(v30 + 40);
          if (v71)
          {
            v72 = *(_BYTE **)(v30 + 40);
            if (v71 == -256)
            {
LABEL_132:
              while (v72)
              {
                v73 = *v72;
                if (v73 > 0x3F)
                  break;
                if (!*v72)
                {
                  v75 = (_WORD)v72 - v71 + 1;
                  goto LABEL_145;
                }
                v72 += v73 + 1;
                if (v71 != -256)
                  goto LABEL_131;
              }
            }
            else
            {
LABEL_131:
              if ((unint64_t)v72 < v71 + 256)
                goto LABEL_132;
            }
            v75 = 257;
LABEL_145:
            v112 = v75;
          }
          else
          {
            v112 = 0;
          }
          v80 = *(unsigned __int16 *)(v30 + 12);
          actual_ttl = resource_record_get_actual_ttl((uint64_t)mDNSStorage, v29 + 8);
          *(_DWORD *)buf = 68158978;
          *(_DWORD *)v128 = v112;
          *(_WORD *)&v128[4] = 2098;
          *(_QWORD *)&v128[6] = v71;
          *(_WORD *)&v128[14] = 1024;
          *(_DWORD *)&v128[16] = v80;
          *(_WORD *)&v128[20] = 1024;
          *(_DWORD *)&v128[22] = v116;
          *(_WORD *)&v128[26] = 1024;
          *(_DWORD *)&v128[28] = a2;
          *(_WORD *)&v128[32] = 1024;
          *(_DWORD *)&v128[34] = actual_ttl;
          v79 = v34;
LABEL_147:
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Rescuing DNSSEC validated record - name: %{public, mdnsresponder:domain_name}.*P, type: %{mdns:rrtype}d, old original ttl: %u, new original ttl: %u, new actual ttl: %u", buf, 0x2Au);
        }
      }
      else
      {
        v35 = mDNSLogCategory_DNSSEC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
        {
          v36 = *(_QWORD *)(v30 + 40);
          v111 = v35;
          if (v36)
          {
            v37 = *(_BYTE **)(v30 + 40);
            if (v36 == -256)
            {
LABEL_61:
              while (v37)
              {
                v38 = *v37;
                if (v38 > 0x3F)
                  break;
                if (!*v37)
                {
                  v74 = (_WORD)v37 - v36 + 1;
                  goto LABEL_142;
                }
                v37 += v38 + 1;
                if (v36 != -256)
                  goto LABEL_60;
              }
            }
            else
            {
LABEL_60:
              if ((unint64_t)v37 < v36 + 256)
                goto LABEL_61;
            }
            v74 = 257;
LABEL_142:
            v76 = v74;
          }
          else
          {
            v76 = 0;
          }
          v77 = *(unsigned __int16 *)(v30 + 12);
          v78 = resource_record_get_actual_ttl((uint64_t)mDNSStorage, v29 + 8);
          *(_DWORD *)buf = 68158978;
          *(_DWORD *)v128 = v76;
          *(_WORD *)&v128[4] = 2098;
          *(_QWORD *)&v128[6] = v36;
          *(_WORD *)&v128[14] = 1024;
          *(_DWORD *)&v128[16] = v77;
          *(_WORD *)&v128[20] = 1024;
          *(_DWORD *)&v128[22] = v116;
          *(_WORD *)&v128[26] = 1024;
          *(_DWORD *)&v128[28] = a2;
          *(_WORD *)&v128[32] = 1024;
          *(_DWORD *)&v128[34] = v78;
          v79 = v111;
          goto LABEL_147;
        }
      }
      if (*(_BYTE *)(v29 + 109))
      {
        v82 = dword_100158E08;
        v83 = dword_100158E08 + 939524096;
      }
      else
      {
        v83 = *(_DWORD *)(v29 + 80) + 1000 * *(_DWORD *)(v29 + 16);
        v82 = dword_100158E08;
      }
      v2 = v26;
      v23 = v25;
      v65 = v120;
      if (v83 - v82 > 0)
      {
LABEL_152:
        ++v117;
        --v118;
        goto LABEL_107;
      }
      v84 = mDNSLogCategory_DNSSEC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
          goto LABEL_152;
      }
      else
      {
        v84 = mDNSLogCategory_DNSSEC_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
          goto LABEL_152;
      }
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)v128 = "RRExpireTime(cr) - mDNSStorage.timenow > 0";
      *(_WORD *)&v128[8] = 2082;
      *(_QWORD *)&v128[10] = "";
      *(_WORD *)&v128[18] = 2082;
      *(_QWORD *)&v128[20] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec"
                             "_obj_validation_manager.c";
      *(_WORD *)&v128[28] = 1024;
      *(_DWORD *)&v128[30] = 1826;
      *(_WORD *)&v128[34] = 2048;
      *(_QWORD *)&v128[36] = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
      goto LABEL_152;
    }
LABEL_66:
    if (*((_QWORD *)v27 + 7))
      v39 = -6705;
    else
      v39 = -6709;
    if (*((_QWORD *)v27 + 7))
      v40 = (v119 - 3) >= 0xFFFFFFFE;
    else
      v40 = 0;
    if (!v40)
    {
      v29 = 0;
LABEL_155:
      v2 = v26;
      goto LABEL_102;
    }
    v41 = *((_DWORD *)v27 + 4);
    v42 = CacheGroupForName((uint64_t)mDNSStorage, v41, *((_BYTE **)v27 + 4));
    v44 = *(__int128 **)(*((_QWORD *)v27 + 7) + 16);
    if (v44)
    {
      v45 = (uint64_t)v42;
      if (dword_100158E08 <= 1)
        v46 = 1;
      else
        v46 = dword_100158E08;
      v47 = *(void **)((char *)&dword_100158E08 + &loc_100009410);
      v48 = v46;
      if (v47)
      {
        os_release(v47);
        v48 = dword_100158E08;
        if (dword_100158E08 <= 1)
          v48 = 1;
      }
      xmmword_1001622A0 = 0u;
      unk_1001622B0 = 0u;
      xmmword_100162280 = 0u;
      unk_100162290 = 0u;
      xmmword_100162260 = 0u;
      unk_100162270 = 0u;
      xmmword_100162240 = 0u;
      *(_OWORD *)&qword_100162250 = 0u;
      xmmword_100162220 = 0u;
      unk_100162230 = 0u;
      unk_100162200 = 0u;
      *(_OWORD *)&qword_100162210 = 0u;
      xmmword_1001621E0 = 0u;
      xmmword_1001621F0 = 0u;
      v49 = v44[1];
      xmmword_1001621E0 = *v44;
      v50 = v44[2];
      v51 = v44[3];
      v52 = v44[5];
      xmmword_100162220 = v44[4];
      unk_100162230 = v52;
      v53 = v44[8];
      v54 = v44[9];
      v55 = v44[7];
      xmmword_100162240 = v44[6];
      *(_OWORD *)&qword_100162250 = v55;
      unk_100162200 = v50;
      *(_OWORD *)&qword_100162210 = v51;
      xmmword_1001621F0 = v49;
      xmmword_100162260 = v53;
      unk_100162270 = v54;
      v56 = v44[10];
      v57 = v44[11];
      v58 = v44[13];
      xmmword_1001622A0 = v44[12];
      unk_1001622B0 = v58;
      xmmword_100162280 = v56;
      unk_100162290 = v57;
      *(_QWORD *)&xmmword_1001621E0 = 0;
      *((_QWORD *)&xmmword_100162220 + 1) = 0;
      dword_100162234 = v48;
      *(_QWORD *)&xmmword_100162240 = 0;
      BYTE12(xmmword_100162240) = 0;
      qword_100162250 = 0;
      unk_100162258 = 0;
      LODWORD(xmmword_1001621F0) = a2;
      if (*((_QWORD *)&v51 + 1))
        os_retain(*((void **)&v51 + 1));
      if (v119 == 1)
      {
        v59 = 4;
LABEL_87:
        if (*v27 == 240)
        {
          v60 = *((_QWORD *)v27 + 7);
          if (v60)
          {
            if (!*(_DWORD *)(v60 + 32) && !*(_BYTE *)(v60 + 40))
            {
              v61 = *(_QWORD *)(v60 + 48);
              if (v61)
              {
                if (*(_BYTE *)(v61 + 107))
                  v59 = v59 | 0x10;
                else
                  v59 = v59;
              }
            }
          }
        }
        NewCacheEntry = CreateNewCacheEntryEx((uint64_t)mDNSStorage, v41 % 0x1F3, v45, v46, 1, (uint64_t)v44 + 132, v59, v43);
        v29 = NewCacheEntry;
        if (NewCacheEntry)
        {
          v63 = *(_DWORD *)(NewCacheEntry + 84);
          v64 = (char *)mDNSStorage + 4 * (v41 % 0x1F3);
          v2 = v26;
          if (*((_DWORD *)v64 + 1066) - v63 >= 1)
            *((_DWORD *)v64 + 1066) = v63;
          v23 = v25;
          v39 = 0;
          if (dword_100158E20 - v63 >= 1)
            dword_100158E20 = v63;
          goto LABEL_103;
        }
        v39 = -6728;
        goto LABEL_155;
      }
      if (v119 == 2)
      {
        v59 = 8;
        goto LABEL_87;
      }
      v29 = 0;
      v39 = -6736;
    }
    else
    {
      v29 = 0;
      v39 = -6709;
    }
    v2 = v26;
LABEL_102:
    v23 = v25;
LABEL_103:
    v65 = v120;
    v126 = v39;
    if (qword_100162218)
    {
      os_release((void *)qword_100162218);
      v39 = v126;
    }
    xmmword_1001622A0 = 0u;
    unk_1001622B0 = 0u;
    xmmword_100162280 = 0u;
    unk_100162290 = 0u;
    xmmword_100162260 = 0u;
    unk_100162270 = 0u;
    xmmword_100162240 = 0u;
    *(_OWORD *)&qword_100162250 = 0u;
    xmmword_100162220 = 0u;
    unk_100162230 = 0u;
    unk_100162200 = 0u;
    *(_OWORD *)&qword_100162210 = 0u;
    xmmword_1001621E0 = 0u;
    xmmword_1001621F0 = 0u;
    if (v39)
      goto LABEL_197;
    ++v124;
LABEL_107:
    v66 = *(_QWORD *)(v29 + 64);
    if (!v66)
      goto LABEL_197;
    *(_QWORD *)(v66 + 24) = v2;
    v144[v22] = v29 + 8;
    if (*(_BYTE *)(v29 + 109))
      v67 = dword_100158E08 + 939524096;
    else
      v67 = *(_DWORD *)(v29 + 80) + 1000 * *(_DWORD *)(v29 + 16);
    if (v67 <= 1)
      v68 = 1;
    else
      v68 = v67;
    if ((_DWORD)v23)
    {
      v69 = v23 - v68;
      if ((_DWORD)v23 != (_DWORD)v68)
      {
        v70 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
            goto LABEL_122;
        }
        else
        {
          v70 = mDNSLogCategory_DNSSEC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
          {
LABEL_122:
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v128 = v69 / 1000;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_FAULT, "DNSSEC validated records in the same RRSet have different expiration time - difference in second: %d", buf, 8u);
          }
        }
        if (v69 <= 0)
          v23 = v23;
        else
          v23 = v68;
      }
    }
    else
    {
      v23 = v68;
    }
    if (++v22 == v65)
    {
      if ((int)v23 - dword_100158E08 >= 1)
      {
        v85 = ((int)v23 - dword_100158E08) / 0x3E8u;
        if (v118 && !v124)
        {
          v86 = v144;
          do
          {
            v87 = *v86++;
            *(_BYTE *)(*(_QWORD *)(v87 + 56) + 36) = 1;
            --v65;
          }
          while (v65);
        }
        v88 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          v90 = v117;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
          {
            v91 = bswap32(*(unsigned __int16 *)(v115 + 340)) >> 16;
            v92 = v114;
            if (v115 == -632)
            {
LABEL_175:
              while (v92)
              {
                v93 = *v92;
                if (v93 > 0x3F)
                  break;
                if (!*v92)
                {
                  v97 = (unsigned __int16)((_WORD)v92 - (_WORD)v114 + 1);
                  goto LABEL_192;
                }
                v92 += v93 + 1;
                if (v115 != -632)
                  goto LABEL_174;
              }
            }
            else
            {
LABEL_174:
              if ((unint64_t)v92 < v115 + 632)
                goto LABEL_175;
            }
            v97 = 257;
LABEL_192:
            v98 = *(unsigned __int16 *)(v115 + 342);
            v99 = *(unsigned __int16 *)(*v123 + 4);
            v100 = *(unsigned __int8 *)*v123 != 240;
            *(_DWORD *)buf = 67112451;
            *(_DWORD *)v128 = v91;
            *(_WORD *)&v128[4] = 2160;
            *(_QWORD *)&v128[6] = 1752392040;
            *(_WORD *)&v128[14] = 1040;
            *(_DWORD *)&v128[16] = v97;
            *(_WORD *)&v128[20] = 2101;
            *(_QWORD *)&v128[22] = v114;
            *(_WORD *)&v128[30] = 1024;
            *(_DWORD *)&v128[32] = v98;
            *(_WORD *)&v128[36] = 1024;
            *(_DWORD *)&v128[38] = v99;
            *(_WORD *)&v128[42] = 1024;
            v129 = a2;
            v130 = 1024;
            v131 = v85;
            v132 = 1024;
            v133 = v100;
            v134 = 1026;
            v135 = v119;
            v136 = 2048;
            v137 = v117;
            v138 = 2048;
            v139 = v124;
            v140 = 2048;
            v141 = v2;
            v142 = 2048;
            v143 = v118;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "[Q%u] Update cache for DNSSEC question - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rr_type: %{mdns:rrtype}d, new original ttl: %u, actual ttl: %u, %{mdns:pos/neg}d, DNSSEC result: %{public, mdns:dnssec_result}d, rescued: %zu, added: %zu, total: %zu, purged: %zu.", buf, 0x6Eu);
          }
        }
        else
        {
          v88 = mDNSLogCategory_DNSSEC_redacted;
          v94 = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO);
          v90 = v117;
          if (v94)
          {
            v91 = bswap32(*(unsigned __int16 *)(v115 + 340)) >> 16;
            v95 = v114;
            if (v115 == -632)
            {
LABEL_183:
              while (v95)
              {
                v96 = *v95;
                if (v96 > 0x3F)
                  break;
                if (!*v95)
                {
                  v97 = (unsigned __int16)((_WORD)v95 - (_WORD)v114 + 1);
                  goto LABEL_192;
                }
                v95 += v96 + 1;
                if (v115 != -632)
                  goto LABEL_182;
              }
            }
            else
            {
LABEL_182:
              if ((unint64_t)v95 < v115 + 632)
                goto LABEL_183;
            }
            v97 = 257;
            goto LABEL_192;
          }
        }
        if (v90)
        {
          v101 = dword_100158E08;
          if (dword_100158E08 <= 1)
            v101 = 1;
          dword_100158E68 = v101;
        }
LABEL_197:
        if (!(_DWORD)v23)
          goto LABEL_199;
      }
LABEL_198:
      *(_BYTE *)(a1 + 60) = 1;
      *(_DWORD *)(a1 + 52) = v23;
      goto LABEL_199;
    }
  }
  v126 = -6736;
  LODWORD(v23) = v25;
  if ((_DWORD)v25)
    goto LABEL_198;
LABEL_199:
  free(v123);
  return v126;
}

void dnssec_obj_validation_manager_remove_validated_cache(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int expiration_time;
  NSObject *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  size_t v30;
  int v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  _BYTE v35[20];
  int v36;
  __int16 v37;
  uint64_t v38;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v31 = 0;
    if (*(_BYTE *)(v2 + 60))
    {
      v30 = 0;
      v3 = dnssec_obj_rrset_copy_rrs((_QWORD *)v2, &v30, &v31);
      v4 = v31;
      if (v31)
      {
        v27 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
            return;
        }
        else
        {
          v27 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
            return;
        }
        *(_DWORD *)buf = 136447234;
        v33 = (uint64_t)"err == 0";
        v34 = 2082;
        *(_QWORD *)v35 = "";
        *(_WORD *)&v35[8] = 2082;
        *(_QWORD *)&v35[10] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnsse"
                              "c_obj_validation_manager.c";
        *(_WORD *)&v35[18] = 1024;
        v36 = 1267;
        v37 = 2048;
        v38 = v4;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
        return;
      }
      v5 = v3;
      v6 = v30;
      if (v30)
      {
        v7 = 0;
        while (1)
        {
          v8 = v5[v7];
          mDNS_Lock_((unsigned int *)&mDNSStorage, (uint64_t)"_purge_validated_record_from_cache", 1933);
          v9 = *(_QWORD *)(v8 + 56);
          if (!v9 || *(_DWORD *)(v9 + 32))
            goto LABEL_44;
          v10 = CacheGroupForName((uint64_t)&mDNSStorage, *(_DWORD *)(v8 + 16), *(_BYTE **)(v8 + 32)) + 2;
          do
          {
            v10 = (uint64_t *)*v10;
            if (!v10)
              goto LABEL_44;
          }
          while (!identical_dnssec_validated_same_name_resource_record(v8, (uint64_t)(v10 + 1)));
          expiration_time = resource_record_get_expiration_time(*(_QWORD *)(v8 + 56));
          if (expiration_time)
          {
            if (expiration_time - dword_100158E08 >= 4000)
            {
              v12 = mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                {
                  v13 = *(_QWORD *)(v8 + 32);
                  if (v13)
                  {
                    v14 = *(_BYTE **)(v8 + 32);
                    if (v13 == -256)
                    {
LABEL_28:
                      while (v14)
                      {
                        v16 = *v14;
                        if (v16 > 0x3F)
                          break;
                        if (!*v14)
                        {
                          LOWORD(v14) = (_WORD)v14 - v13 + 1;
                          goto LABEL_40;
                        }
                        v14 += v16 + 1;
                        if (v13 != -256)
                          goto LABEL_27;
                      }
                    }
                    else
                    {
LABEL_27:
                      if ((unint64_t)v14 < v13 + 256)
                        goto LABEL_28;
                    }
                    LOWORD(v14) = 257;
LABEL_40:
                    LODWORD(v14) = (unsigned __int16)v14;
                  }
                  else
                  {
                    LODWORD(v14) = 0;
                  }
LABEL_41:
                  v17 = *(unsigned __int16 *)(v8 + 4);
                  *(_DWORD *)buf = 141558787;
                  v33 = 1752392040;
                  v34 = 1040;
                  *(_DWORD *)v35 = (_DWORD)v14;
                  *(_WORD *)&v35[4] = 2101;
                  *(_QWORD *)&v35[6] = v13;
                  *(_WORD *)&v35[14] = 1024;
                  *(_DWORD *)&v35[16] = v17;
                  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Make validated RR expire soon - name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, rr_type: %{mdns:rrtype}d", buf, 0x22u);
                }
              }
              else
              {
                v12 = mDNSLogCategory_DNSSEC_redacted;
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                {
                  v13 = *(_QWORD *)(v8 + 32);
                  if (v13)
                  {
                    v14 = *(_BYTE **)(v8 + 32);
                    if (v13 == -256)
                    {
LABEL_19:
                      while (v14)
                      {
                        v15 = *v14;
                        if (v15 > 0x3F)
                          break;
                        if (!*v14)
                        {
                          LOWORD(v14) = (_WORD)v14 - v13 + 1;
                          goto LABEL_38;
                        }
                        v14 += v15 + 1;
                        if (v13 != -256)
                          goto LABEL_18;
                      }
                    }
                    else
                    {
LABEL_18:
                      if ((unint64_t)v14 < v13 + 256)
                        goto LABEL_19;
                    }
                    LOWORD(v14) = 257;
LABEL_38:
                    LODWORD(v14) = (unsigned __int16)v14;
                  }
                  else
                  {
                    LODWORD(v14) = 0;
                  }
                  goto LABEL_41;
                }
              }
              *((_DWORD *)v10 + 20) = dword_100158E08 + 1000 * (3 - *((_DWORD *)v10 + 4));
            }
            *((_BYTE *)v10 + 108) = 4;
            goto LABEL_44;
          }
          v18 = mDNSLogCategory_DNSSEC;
          if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_DNSSEC != mDNSLogCategory_State)
            break;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
          {
            v20 = *(_QWORD *)(v8 + 32);
            if (v20)
            {
              v21 = *(_BYTE **)(v8 + 32);
              if (v20 == -256)
              {
LABEL_55:
                while (v21)
                {
                  v22 = *v21;
                  if (v22 > 0x3F)
                    break;
                  if (!*v21)
                  {
                    LOWORD(v21) = (_WORD)v21 - v20 + 1;
                    goto LABEL_74;
                  }
                  v21 += v22 + 1;
                  if (v20 != -256)
                    goto LABEL_54;
                }
              }
              else
              {
LABEL_54:
                if ((unint64_t)v21 < v20 + 256)
                  goto LABEL_55;
              }
              LOWORD(v21) = 257;
LABEL_74:
              LODWORD(v21) = (unsigned __int16)v21;
            }
            else
            {
              LODWORD(v21) = 0;
            }
LABEL_77:
            v25 = *(unsigned __int16 *)(v8 + 4);
            *(_DWORD *)buf = 141558787;
            v33 = 1752392040;
            v34 = 1040;
            *(_DWORD *)v35 = (_DWORD)v21;
            *(_WORD *)&v35[4] = 2101;
            *(_QWORD *)&v35[6] = v20;
            *(_WORD *)&v35[14] = 1024;
            *(_DWORD *)&v35[16] = v25;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Invalid expiration time for the current DNSSEC validated record - name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, rr_type: %{mdns:rrtype}d", buf, 0x22u);
          }
LABEL_44:
          mDNS_Unlock_((uint64_t)&mDNSStorage, (uint64_t)"_purge_validated_record_from_cache", 1962);
          if (++v7 == v6)
            goto LABEL_78;
        }
        v18 = mDNSLogCategory_DNSSEC_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
          goto LABEL_44;
        v20 = *(_QWORD *)(v8 + 32);
        if (v20)
        {
          v21 = *(_BYTE **)(v8 + 32);
          if (v20 == -256)
          {
LABEL_64:
            while (v21)
            {
              v24 = *v21;
              if (v24 > 0x3F)
                break;
              if (!*v21)
              {
                LOWORD(v21) = (_WORD)v21 - v20 + 1;
                goto LABEL_76;
              }
              v21 += v24 + 1;
              if (v20 != -256)
                goto LABEL_63;
            }
          }
          else
          {
LABEL_63:
            if ((unint64_t)v21 < v20 + 256)
              goto LABEL_64;
          }
          LOWORD(v21) = 257;
LABEL_76:
          LODWORD(v21) = (unsigned __int16)v21;
        }
        else
        {
          LODWORD(v21) = 0;
        }
        goto LABEL_77;
      }
LABEL_78:
      v26 = *(_QWORD *)(a1 + 32);
      *(_BYTE *)(v26 + 60) = 0;
      *(_DWORD *)(v26 + 52) = 0;
      free(v5);
    }
  }
}

uint64_t dnssd_svcb_service_name_is_empty(uint64_t a1, unint64_t a2)
{
  _BOOL4 v3;
  unint64_t v4;
  _BOOL4 v5;
  _BYTE *v6;
  BOOL v7;
  unint64_t v8;

  if (a2 < 2)
    return 0;
  v3 = 0;
  v4 = a1 + 2;
  if (a1 == -2)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if (a1 + a2 > v4)
    {
      v6 = (_BYTE *)(a1 + 2);
      while (*v6)
      {
        v6 += *v6 + 1;
        if (v6)
          v7 = (unint64_t)v6 >= a1 + a2;
        else
          v7 = 1;
        if (v7)
        {
          v3 = 0;
          v5 = 0;
          return v3 & v5;
        }
      }
      v8 = (unsigned __int16)((_WORD)v6 - v4 + 1);
      v5 = v8 < 0x101;
      v3 = v8 == 1;
    }
  }
  return v3 & v5;
}

uint64_t __dnssd_svcb_is_valid_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  if (a2 && a3)
  {
    if ((a3 & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
    else
    {
      v3 = (unsigned __int16)(a3 >> 1);
      if ((unsigned __int16)(a3 >> 1))
      {
        do
        {
          v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          if (*(_BYTE *)(v4 + 24))
            break;
          v5 = bswap32(*a2) >> 16;
          if (v5 - 1 >= 7 && v5 - 0x8000 >= 2)
            *(_BYTE *)(v4 + 24) = 1;
          ++a2;
          --v3;
        }
        while (v3);
      }
    }
  }
  return 0;
}

_WORD *_dnssd_svcb_extract_values(_WORD *result, unint64_t a2, int a3, uint64_t a4)
{
  _WORD *v4;
  _BYTE *v7;
  BOOL v8;
  unint64_t v9;
  unsigned __int16 *v10;
  unint64_t v11;
  unint64_t v13;
  unsigned __int16 *v14;

  if (a2 >= 2)
  {
    if (*result)
    {
      v4 = result + 1;
      if (result != (_WORD *)-2 && (_WORD *)((char *)result + a2) > v4)
      {
        v7 = result + 1;
        while (*v7)
        {
          v7 += *v7 + 1;
          if (v7)
            v8 = v7 >= (_BYTE *)result + a2;
          else
            v8 = 1;
          if (v8)
            return result;
        }
        v9 = (unsigned __int16)((_WORD)v7 - (_WORD)v4 + 1);
        if (v9 <= 0x100)
        {
          v10 = (_WORD *)((char *)v4 + v9);
          v11 = a2 - 2 - v9;
          while (v11 >= 4 && v10 != 0)
          {
            v13 = bswap32(v10[1]) >> 16;
            v8 = v11 - 4 >= v13;
            v11 = v11 - 4 - v13;
            if (!v8)
              break;
            v14 = v10 + 2;
            if (a3 == bswap32(*v10) >> 16)
            {
              result = (_WORD *)(*(uint64_t (**)(uint64_t, unsigned __int16 *, unint64_t))(a4 + 16))(a4, v10 + 2, v13);
              if (!(_DWORD)result)
                break;
            }
            v10 = (unsigned __int16 *)((char *)v14 + v13);
          }
        }
      }
    }
  }
  return result;
}

uint64_t __dnssd_svcb_get_port_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3 == 2)
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = bswap32(*a2) >> 16;
  return 0;
}

uint64_t __dnssd_svcb_copy_doh_uri_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3)
    asprintf((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "%.*s", a3, a2);
  return 0;
}

uint64_t __dnssd_svcb_copy_doh_path_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3)
    asprintf((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "%.*s", a3, a2);
  return 0;
}

void *__dnssd_svcb_copy_odoh_config_block_invoke(uint64_t a1, const void *a2, size_t size)
{
  void *result;

  if (!a2 || !size)
    return 0;
  result = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    **(_QWORD **)(a1 + 40) = size;
    memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, size);
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t __dnssd_svcb_access_alpn_values_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[16];

  if (a2 && a3)
  {
    v6 = 0;
    do
    {
      v7 = *(unsigned __int8 *)(a2 + v6);
      v8 = v6 + 1;
      v6 += 1 + v7;
      memset(v16, 0, 255);
      if (v6 > a3)
        break;
      __memcpy_chk(v16, a2 + v8, v7, 255);
      if (((*(uint64_t (**)(_QWORD, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v16, v9, v10, v11, v12, v13, v14) & 1) == 0)break;
    }
    while (v6 < a3);
  }
  return 0;
}

void ___mdns_get_dns_over_bytestream_protocol_definition_block_invoke(id a1)
{
  _mdns_get_dns_over_bytestream_protocol_definition_s_framer_def = (uint64_t)nw_framer_create_definition("DNS over bytestream", 0, &__block_literal_global_14_6172);
}

int ___mdns_create_dns_over_bytestream_framer_block_invoke_4(id a1, const nw_framer *a2)
{
  nw_framer_set_input_handler((nw_framer_t)a2, &__block_literal_global_4_6169);
  nw_framer_set_output_handler((nw_framer_t)a2, &__block_literal_global_10_6170);
  return 1;
}

void ___mdns_create_dns_over_bytestream_framer_block_invoke_3(id a1, const nw_framer *a2, const nw_protocol_metadata *a3, unint64_t a4, BOOL a5)
{
  uint8_t output_buffer[2];

  if (a4 < 0x10000)
  {
    *(_WORD *)output_buffer = bswap32(a4) >> 16;
    nw_framer_write_output((nw_framer_t)a2, output_buffer, 2uLL);
    nw_framer_write_output_no_copy((nw_framer_t)a2, a4);
  }
  else
  {
    nw_framer_mark_failed_with_error((nw_framer_t)a2, 40);
  }
}

unint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_6177(id a1, nw_framer *a2)
{
  size_t v3;
  NSObject *v4;
  uint8_t temp_buffer[2];

  do
  {
    *(_WORD *)temp_buffer = 0;
    if (!nw_framer_parse_input((nw_framer_t)a2, 2uLL, 2uLL, temp_buffer, &__block_literal_global_7_6180))
      break;
    v3 = __rev16(*(unsigned __int16 *)temp_buffer);
    v4 = nw_framer_message_create((nw_framer_t)a2);
    LODWORD(v3) = nw_framer_deliver_input_no_copy((nw_framer_t)a2, v3, v4, 1);
    nw_release(v4);
  }
  while ((_DWORD)v3);
  return 2;
}

unint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_2(id a1, char *a2, unint64_t a3, BOOL a4)
{
  return 2 * (a3 > 1);
}

uint64_t GetAddrInfoClientRequestStart(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t RecordOpStart;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  char v28;
  _BYTE *v29;
  int v30;
  char v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  int v37;
  uint64_t v38;
  uint8_t buf[32];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _OWORD v43[2];
  unsigned __int8 v44;
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
  _BYTE v59[31];

  memset(v59, 0, sizeof(v59));
  v58 = 0u;
  RecordOpStart = 4294901756;
  v57 = 0u;
  v56 = 0u;
  v55 = 0u;
  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  v51 = 0u;
  v50 = 0u;
  v49 = 0u;
  v48 = 0u;
  v47 = 0u;
  v46 = 0u;
  v45 = 0u;
  v13 = (unsigned __int8 *)*((_QWORD *)a2 + 1);
  v44 = 0;
  if (!AppendDNSNameString(&v44, v13, a3, a4, a5, a6, a7, a8))
  {
    v25 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
    }
    else
    {
      v25 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
    }
    v26 = *a2;
    v27 = *((_QWORD *)a2 + 1);
    *(_DWORD *)buf = 67109635;
    *(_DWORD *)&buf[4] = v26;
    *(_WORD *)&buf[8] = 2160;
    *(_QWORD *)&buf[10] = 1752392040;
    *(_WORD *)&buf[18] = 2085;
    *(_QWORD *)&buf[20] = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[R%u] ERROR: bad hostname '%{sensitive, mask.hash}s'", buf, 0x1Cu);
LABEL_40:
    GetAddrInfoClientRequestStop(a1, v14, v15, v16, v17, v18, v19, v20);
    return RecordOpStart;
  }
  v21 = a2[6];
  if (v21 > 3)
    goto LABEL_40;
  if (v21)
  {
    v22 = a2[5];
  }
  else
  {
    v21 = 3;
    v22 = a2[5] | 0x8000;
  }
  *(_DWORD *)(a1 + 8) = v21;
  if ((v22 & 0x10000000) != 0)
  {
    if (mDNS_LoggingEnabled == 1)
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "GetAddrInfoClientRequestStart: kDNSServiceFlagsServiceIndex is SET by the client", v16, v17, v18, v19, v20, v37);
    v24 = 0;
    v23 = a2[4];
  }
  else
  {
    v38 = 0;
    RecordOpStart = InterfaceIndexToInterfaceID(a2[4], &v38, v15, v16, v17, v18, v19, v20);
    if ((_DWORD)RecordOpStart)
      goto LABEL_40;
    v23 = -1;
    v24 = v38;
  }
  v28 = 0;
  *(_QWORD *)a1 = v24;
  v29 = (_BYTE *)*((_QWORD *)a2 + 1);
  while (1)
  {
    v30 = *v29++;
    if (v30 == 46)
      break;
    if (v30 == 92)
    {
      ++v28;
    }
    else
    {
      if (!*(v29 - 1))
        goto LABEL_27;
LABEL_24:
      v28 = 0;
    }
  }
  if (*v29)
    goto LABEL_24;
  if ((v28 & 1) == 0)
    goto LABEL_31;
LABEL_27:
  if (AlwaysAppendSearchDomains || v44 && !*(&v44 + v44 + 1))
  {
    v31 = 1;
    goto LABEL_32;
  }
LABEL_31:
  v31 = 0;
LABEL_32:
  memset(buf, 0, sizeof(buf));
  v40 = 0u;
  v41 = 0u;
  memset(v43, 0, sizeof(v43));
  v42 = 0u;
  *(_DWORD *)buf = *a2;
  *(_QWORD *)&buf[8] = &v44;
  *(_WORD *)&buf[18] = 1;
  *(_QWORD *)&buf[24] = v24;
  *(_QWORD *)&v40 = __PAIR64__(v22, v23);
  BYTE8(v40) = v31;
  HIDWORD(v40) = a2[7];
  *(_QWORD *)&v41 = *((_QWORD *)a2 + 4);
  DWORD2(v41) = a2[10];
  v32 = *((_QWORD *)a2 + 7);
  *(_QWORD *)&v42 = *((_QWORD *)a2 + 6);
  *((_QWORD *)&v42 + 1) = v32;
  LODWORD(v43[0]) = a2[16];
  *(_OWORD *)((char *)v43 + 8) = *(_OWORD *)(a2 + 18);
  BYTE12(v41) = *((_BYTE *)a2 + 88);
  WORD4(v43[1]) = *(_WORD *)((char *)a2 + 89);
  v33 = *(_DWORD *)(a1 + 8);
  if ((v33 & 2) != 0)
  {
    v34 = malloc_type_calloc(1uLL, 0x320uLL, 0xF1748037uLL);
    if (v34)
    {
      *(_QWORD *)(a1 + 24) = v34;
      *(_WORD *)&buf[16] = 28;
      RecordOpStart = QueryRecordOpStart((uint64_t)v34, (uint64_t)buf, a3, a4);
      if (!(_DWORD)RecordOpStart)
      {
        v33 = *(_DWORD *)(a1 + 8);
        goto LABEL_36;
      }
      goto LABEL_40;
    }
LABEL_42:
    __break(1u);
  }
LABEL_36:
  if ((v33 & 1) == 0)
    return 0;
  v35 = malloc_type_calloc(1uLL, 0x320uLL, 0xF1748037uLL);
  if (!v35)
    goto LABEL_42;
  *(_QWORD *)(a1 + 16) = v35;
  *(_WORD *)&buf[16] = 1;
  RecordOpStart = QueryRecordOpStart((uint64_t)v35, (uint64_t)buf, a3, a4);
  if ((_DWORD)RecordOpStart)
    goto LABEL_40;
  return RecordOpStart;
}

uint64_t InterfaceIndexToInterfaceID(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v10 = mDNSPlatformInterfaceIDfromInterfaceIndex(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  v16 = v10;
  if (!a1 || v10)
  {
LABEL_9:
    v17 = 0;
    *a2 = v16;
    return v17;
  }
  if (InterfaceIndexToInterfaceID_getLoopbackIndexOnce != -1)
    dispatch_once(&InterfaceIndexToInterfaceID_getLoopbackIndexOnce, &__block_literal_global_6222);
  if (a1 <= 0xFFFFFFFB && InterfaceIndexToInterfaceID_loopbackIndex != a1)
  {
    v16 = a1;
    if (mDNS_LoggingEnabled == 1)
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "Query pending for interface index %d", v11, v12, v13, v14, v15, a1);
    goto LABEL_9;
  }
  v17 = 4294901756;
  if (mDNS_LoggingEnabled == 1)
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ERROR: bad interfaceIndex %d", v11, v12, v13, v14, v15, a1);
  return v17;
}

uint64_t QueryRecordOpStart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v8;
  _BYTE *v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  int v14;
  int v15;
  _OWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  char v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned int v29;
  int16x8_t v30;
  int v31;
  BOOL v32;
  _OWORD *v33;
  _BYTE *v34;
  int v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t RecordOpStartQuestion;
  uint64_t v47;
  _BYTE *v48;
  unsigned int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  const char *i;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  void *v62;
  unsigned int v63;
  unint64_t v64;
  NSObject *v65;
  int v67;
  _BYTE *j;
  uint64_t v69;
  _BYTE *k;
  uint64_t v72;
  int v73;
  const char *v74;
  _DWORD v75[2];
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  int v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  const char *v83;

  v8 = *(_BYTE **)(a2 + 8);
  v9 = v8;
  if (v8 == (_BYTE *)-256)
    goto LABEL_5;
LABEL_2:
  v10 = 257;
  if (v9 < v8 + 256 && v9)
  {
    while (1)
    {
      v11 = *v9;
      if (v11 > 0x3F)
      {
LABEL_10:
        v10 = 257;
        goto LABEL_12;
      }
      if (!*v9)
        break;
      v9 += v11 + 1;
      if (v8 != (_BYTE *)-256)
        goto LABEL_2;
LABEL_5:
      if (!v9)
        goto LABEL_10;
    }
    v10 = (unsigned __int16)((_WORD)v9 - (_WORD)v8 + 1);
    if ((_WORD)v9 - (_WORD)v8 == 0xFFFF)
      goto LABEL_129;
  }
LABEL_12:
  v12 = v10;
  v13 = malloc_type_malloc(v10, 0xA172743EuLL);
  if (!v13)
    goto LABEL_129;
  *(_QWORD *)(a1 + 696) = v13;
  memcpy(v13, *(const void **)(a2 + 8), v12);
  *(_QWORD *)(a1 + 704) = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 728) = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 712) = a3;
  *(_QWORD *)(a1 + 720) = a4;
  *(_BYTE *)(a1 + 759) = *(_BYTE *)(a2 + 61);
  *(_WORD *)(a1 + 764) = *(_WORD *)(a2 + 81);
  v14 = *(unsigned __int8 *)(a2 + 83);
  *(_BYTE *)(a1 + 766) = v14;
  v15 = *(unsigned __int8 *)(a2 + 84);
  *(_BYTE *)(a1 + 767) = v15;
  *(_WORD *)(a1 + 762) = *(_WORD *)(a2 + 16);
  if (!v14 || v15)
  {
    v16 = *(_OWORD **)(a2 + 64);
    if (v16)
      *(_OWORD *)(a1 + 768) = *v16;
  }
  v17 = *(void **)(a2 + 88);
  if (v17)
    os_retain(v17);
  v18 = *(void **)(a1 + 784);
  if (v18)
    os_release(v18);
  *(_QWORD *)(a1 + 784) = *(_QWORD *)(a2 + 88);
  v19 = *(void **)(a2 + 96);
  if (v19)
    os_retain(v19);
  v20 = *(void **)(a1 + 792);
  if (v20)
    os_release(v20);
  v21 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 792) = v21;
  v22 = *(_DWORD *)(a2 + 36);
  if (EnableAllowExpired)
    v23 = v22 < 0;
  else
    v23 = 0;
  v24 = v23;
  *(_BYTE *)(a1 + 646) = v24;
  *(_DWORD *)(a1 + 280) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 653) = *(_BYTE *)(a2 + 60);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a1 + 784);
  *(_QWORD *)(a1 + 128) = v21;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 324) = v22;
  v25 = *(_BYTE **)(a2 + 8);
  v26 = v25;
  if (v25 == (_BYTE *)-256)
  {
LABEL_33:
    while (v26)
    {
      v27 = *v26;
      if (v27 > 0x3F)
        break;
      if (!*v26)
      {
        v28 = (_WORD)v26 - (_WORD)v25 + 1;
        if (v28 > 0x100u)
          break;
        memcpy((void *)(a1 + 376), v25, v28);
        goto LABEL_41;
      }
      v26 += v27 + 1;
      if (v25 != (_BYTE *)-256)
        goto LABEL_32;
    }
  }
  else
  {
LABEL_32:
    if (v26 < v25 + 256)
      goto LABEL_33;
  }
  *(_BYTE *)(a1 + 376) = 0;
LABEL_41:
  *(_DWORD *)(a1 + 342) = *(_DWORD *)(a2 + 16);
  v29 = *(_DWORD *)(a2 + 36);
  *(_BYTE *)(a1 + 632) = BYTE1(v29) & 1;
  v30 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v29), (uint32x4_t)xmmword_1001009E0);
  *(int8x8_t *)v30.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v30), (int8x8_t)0x1000100010001);
  *(_DWORD *)(a1 + 634) = vmovn_s16(v30).u32[0];
  *(_BYTE *)(a1 + 640) = (v29 & 0x80000) != 0;
  *(_BYTE *)(a1 + 655) = _os_feature_enabled_impl("mDNSResponder", "dnssec") & (v29 >> 21);
  v31 = *(unsigned __int8 *)(a2 + 40);
  *(_BYTE *)(a1 + 641) = v31;
  v32 = *(_WORD *)(a2 + 16) == 1 && *(_BYTE *)(a2 + 105) != 0;
  *(_BYTE *)(a1 + 644) = v32;
  *(_BYTE *)(a1 + 647) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)a1 = *(_QWORD *)(a2 + 72);
  *(_WORD *)(a1 + 650) = *(_WORD *)(a1 + 766);
  if (*(_BYTE *)(a1 + 765))
  {
    *(_BYTE *)(a1 + 643) = 1;
    if (!*(_QWORD *)(a1 + 136))
      *(_BYTE *)(a1 + 642) = 1;
  }
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a1 + 768);
  *(_BYTE *)(a1 + 357) = 0;
  *(_BYTE *)(a1 + 689) = *(_BYTE *)(a2 + 104);
  *(_DWORD *)(a1 + 244) = *(_DWORD *)(a2 + 44);
  v33 = *(_OWORD **)(a2 + 48);
  if (v33)
    *(_OWORD *)(a1 + 656) = *v33;
  *(_DWORD *)(a1 + 248) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 252) = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 152) = QueryRecordOpCallback;
  *(_QWORD *)(a1 + 160) = QueryRecordOpResetHandler;
  *(_QWORD *)(a1 + 168) = QueryRecordOpEventHandler;
  if (v31)
  {
    v34 = *(_BYTE **)(a1 + 696);
    if (*v34)
    {
      if (!v34[*v34 + 1])
        *(_QWORD *)(a1 + 136) = -2;
    }
  }
  v35 = *(unsigned __int16 *)(a1 + 342);
  if (v35 != 1 && v35 != 28)
  {
    if (v35 != 33)
      goto LABEL_65;
    v36 = (_BYTE *)(a1 + 376);
    v37 = *(_BYTE *)(a1 + 376) ? *(unsigned __int8 *)(a1 + 376) + 1 : 0;
    if (!SameDomainLabelPointer(&v36[v37], "\x04_tcp"))
    {
      v38 = *v36 ? *v36 + 1 : 0;
      if (!SameDomainLabelPointer(&v36[v38], "\x04_udp"))
        goto LABEL_65;
    }
  }
  if (*(_BYTE *)(a1 + 634))
    goto LABEL_65;
  v57 = a1 + 376;
  v58 = *(unsigned __int8 *)(a1 + 376);
  if (*(_BYTE *)(a1 + 376))
  {
    do
    {
      v59 = v57;
      v60 = v57 + v58;
      v61 = *(unsigned __int8 *)(v60 + 1);
      v57 = v60 + 1;
      v58 = v61;
    }
    while (v61);
  }
  else
  {
    v59 = a1 + 376;
  }
  if (!SameDomainLabelPointer(v59, "\x05local"))
  {
LABEL_65:
    v39 = 0;
    goto LABEL_66;
  }
  v62 = malloc_type_calloc(1uLL, 0x2B8uLL, 0xF1748037uLL);
  if (!v62)
LABEL_129:
    __break(1u);
  *(_QWORD *)(a1 + 744) = v62;
  memcpy(v62, (const void *)a1, 0x2B8uLL);
  v39 = 1;
LABEL_66:
  RecordOpStartQuestion = QueryRecordOpStartQuestion(a1, a1);
  if (!(_DWORD)RecordOpStartQuestion)
  {
    if (callExternalHelpers(*(_QWORD *)(a1 + 136), (_BYTE *)(a1 + 376), *(unsigned int *)(a1 + 324), v40, v41, v42, v43, v44))
    {
      external_start_browsing_for_service(*(_QWORD *)(a1 + 136), (unsigned __int8 *)(a1 + 376), *(unsigned __int16 *)(a1 + 342), *(_DWORD *)(a1 + 324), *(_DWORD *)(a1 + 244));
    }
    if (!v39)
      return 0;
    v47 = *(_QWORD *)(a1 + 744);
    if (!v47)
    {
      RecordOpStartQuestion = 4294901754;
      goto LABEL_67;
    }
    v48 = (_BYTE *)(v47 + 376);
    v49 = *(unsigned __int8 *)(v47 + 376);
    if (*(_BYTE *)(v47 + 376))
    {
      v50 = 0;
      v51 = v47 + 376;
      do
      {
        ++v50;
        v52 = v51 + v49;
        v53 = *(unsigned __int8 *)(v52 + 1);
        v51 = v52 + 1;
        v49 = v53;
      }
      while (v53);
      if (v50 == 2
        && !SameDomainNameBytes((_BYTE *)(v47 + 376), ActiveDirectoryPrimaryDomain)
        && !DomainNameIsInSearchList((_BYTE *)(v47 + 376), 0))
      {
        *(_WORD *)(a1 + 752) = *(_WORD *)(v47 + 342);
        *(_BYTE *)(a1 + 754) = *(_BYTE *)(v47 + 632);
        *(_BYTE *)(a1 + 755) = *(_BYTE *)(v47 + 635);
        *(_BYTE *)(a1 + 756) = *(_BYTE *)(v47 + 637);
        *(_BYTE *)(a1 + 757) = *(_BYTE *)(v47 + 641);
        for (i = "\x05local"; ; i += v56 + 1)
        {
          if ("\x05local" == (char *)-256)
          {
            if (!i)
              goto LABEL_101;
          }
          else if (i >= "wed" || i == 0)
          {
            goto LABEL_101;
          }
          v56 = *(unsigned __int8 *)i;
          if (v56 > 0x3F)
            goto LABEL_101;
          if (!*i)
            break;
        }
        v63 = (_DWORD)i - "\x05local" + 1;
        if ((unsigned __int16)v63 <= 0x100u)
        {
          memcpy((void *)(v47 + 376), "\x05local", (unsigned __int16)v63);
          goto LABEL_102;
        }
LABEL_101:
        *v48 = 0;
LABEL_102:
        *(_WORD *)(v47 + 342) = 6;
        *(_BYTE *)(v47 + 635) = 1;
        *(_BYTE *)(v47 + 637) = 0;
        *(_BYTE *)(v47 + 641) = 0;
      }
    }
    *(_BYTE *)(v47 + 638) = 1;
    v64 = v47 + 632;
    *(_BYTE *)(v47 + 632) = 0;
    v65 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_127;
      v67 = *(_DWORD *)(a1 + 728);
      for (j = (_BYTE *)(v47 + 376); ; j += v69 + 1)
      {
        if ((unint64_t)j >= v64 || !j || (v69 = *j, v69 > 0x3F))
        {
          v73 = 257;
          goto LABEL_126;
        }
        if (!*j)
          break;
      }
      v73 = (unsigned __int16)((_WORD)j - (_WORD)v48 + 1);
    }
    else
    {
      v65 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
      {
LABEL_127:
        RecordOpStartQuestion = QueryRecordOpStartQuestion(a1, v47);
        if (!(_DWORD)RecordOpStartQuestion)
          return RecordOpStartQuestion;
        goto LABEL_67;
      }
      v67 = *(_DWORD *)(a1 + 728);
      for (k = (_BYTE *)(v47 + 376); ; k += v72 + 1)
      {
        if ((unint64_t)k >= v64 || !k || (v72 = *k, v72 > 0x3F))
        {
          v73 = 257;
          goto LABEL_126;
        }
        if (!*k)
          break;
      }
      v73 = (unsigned __int16)((_WORD)k - (_WORD)v48 + 1);
    }
LABEL_126:
    v74 = DNSTypeName(*(unsigned __int16 *)(v47 + 342));
    v75[0] = 67110147;
    v75[1] = v67;
    v76 = 2160;
    v77 = 1752392040;
    v78 = 1040;
    v79 = v73;
    v80 = 2101;
    v81 = v47 + 376;
    v82 = 2082;
    v83 = v74;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "[R%u] QueryRecordOpStart: starting parallel unicast query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P %{public}s", (uint8_t *)v75, 0x2Cu);
    goto LABEL_127;
  }
LABEL_67:
  QueryRecordOpStop(a1);
  return RecordOpStartQuestion;
}

void GetAddrInfoClientRequestStop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;

  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
    QueryRecordOpStop(v9);
  v10 = *(_QWORD *)(a1 + 24);
  if (v10)
  {
    QueryRecordOpStop(v10);
    v11 = *(_QWORD *)(a1 + 24);
  }
  else
  {
    v11 = 0;
  }
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12 || *(_BYTE *)(v12 + 758))
  {
    if (!v11)
      goto LABEL_16;
    goto LABEL_9;
  }
  if (*(_BYTE *)(v12 + 637))
    mDNSPlatformUpdateDNSStatus(*(_QWORD *)(a1 + 16));
  v12 = 0;
  if (v11)
  {
LABEL_9:
    if (!*(_BYTE *)(v11 + 758))
    {
      if (*(_BYTE *)(v11 + 637))
        mDNSPlatformUpdateDNSStatus(v11);
      v11 = 0;
    }
  }
LABEL_16:
  mDNSPlatformTriggerDNSRetry(v12, v11, a3, a4, a5, a6, a7, a8, v15);
  v13 = *(void **)(a1 + 16);
  if (v13)
  {
    free(v13);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v14 = *(void **)(a1 + 24);
  if (v14)
  {
    free(v14);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void QueryRecordOpStop(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;

  if (*(_QWORD *)(a1 + 176))
  {
    resolved_cache_delete(a1);
    mDNS_StopQuery((unsigned int *)mDNSStorage, a1);
    *(_QWORD *)(a1 + 176) = 0;
    if (callExternalHelpers(*(_QWORD *)(a1 + 136), *(_BYTE **)(a1 + 696), *(unsigned int *)(a1 + 324), v2, v3, v4, v5, v6))
    {
      external_stop_browsing_for_service(*(_QWORD *)(a1 + 136), (unsigned __int8 *)(a1 + 376), *(unsigned __int16 *)(a1 + 342), *(_DWORD *)(a1 + 324), *(_DWORD *)(a1 + 244));
    }
  }
  v7 = *(void **)(a1 + 696);
  if (v7)
  {
    free(v7);
    *(_QWORD *)(a1 + 696) = 0;
  }
  v8 = *(_QWORD **)(a1 + 744);
  if (v8)
  {
    if (!v8[22]
      || (resolved_cache_delete(*(_QWORD *)(a1 + 744)),
          mDNS_StopQuery((unsigned int *)mDNSStorage, (uint64_t)v8),
          v8[22] = 0,
          (v8 = *(_QWORD **)(a1 + 744)) != 0))
    {
      free(v8);
    }
    *(_QWORD *)(a1 + 744) = 0;
  }
  v9 = *(void **)(a1 + 784);
  if (v9)
  {
    os_release(v9);
    *(_QWORD *)(a1 + 784) = 0;
  }
  v10 = *(void **)(a1 + 792);
  if (v10)
  {
    os_release(v10);
    *(_QWORD *)(a1 + 792) = 0;
  }
}

void QueryRecordOpCallback(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t *SearchDomain;
  NSObject *v22;
  uint64_t v23;
  int v25;
  _BYTE *v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  int v30;
  _BYTE *v31;
  uint64_t v32;
  char v33;
  uint64_t *v34;
  _BYTE *v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  int v40;
  _BYTE *v41;
  int v42;
  int v43;
  NSObject *v44;
  int v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  _BYTE *v60;
  uint64_t v61;
  NSObject *v62;
  int v63;
  _BYTE *v64;
  uint64_t v65;
  int v66;
  const char *v67;
  _BYTE *v68;
  uint64_t v69;
  _BYTE *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  int v74;
  void (*v75)(uint64_t, uint64_t, unsigned __int8 *, _BOOL8, uint64_t, uint64_t, _QWORD);
  _BOOL8 v76;
  char v77;
  int v78;
  uint64_t *v79;
  CFIndex v80;
  CFDataRef v81;
  CFDataRef v82;
  int v83;
  int v84;
  _BYTE *v85;
  uint64_t v86;
  const char *v87;
  int v88;
  uint64_t *v89;
  int v90;
  int v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  int v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  uint64_t v101;

  v12 = *(_QWORD *)(a2 + 176);
  if (*(_QWORD *)(v12 + 744) == a2 && *(_WORD *)(a2 + 342) == 6)
  {
    if (*((_WORD *)a3 + 2) == 6)
    {
      resolved_cache_delete(a2);
      mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
      *(_QWORD *)(a2 + 176) = 0;
      *(_WORD *)(a2 + 342) = *(_WORD *)(v12 + 752);
      *(_BYTE *)(a2 + 632) = *(_BYTE *)(v12 + 754);
      *(_BYTE *)(a2 + 635) = *(_BYTE *)(v12 + 755);
      *(_BYTE *)(a2 + 637) = *(_BYTE *)(v12 + 756);
      v20 = *(unsigned __int8 *)(v12 + 757);
      *(_BYTE *)(a2 + 641) = v20;
      if (*a3 == 240)
      {
        if (v20)
        {
          SearchDomain = NextSearchDomain(v12, v13, v14, v15, v16, v17, v18, v19);
          if (SearchDomain)
            QueryRecordOpRestartUnicastQuestion(v12, a2, SearchDomain);
        }
      }
      else
      {
        QueryRecordOpRestartUnicastQuestion(v12, a2, 0);
      }
    }
    return;
  }
  if ((_DWORD)a4 != 1 || *(_BYTE *)(a2 + 646) != 1)
  {
    if ((_DWORD)a4 != 4)
      goto LABEL_30;
    v22 = mDNSLogCategory_Default;
    v23 = 4294901742;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEBUG))
      {
LABEL_123:
        v33 = 0;
        goto LABEL_144;
      }
      v25 = *(_DWORD *)(v12 + 728);
      v26 = (_BYTE *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_25:
        while (v26)
        {
          v27 = *v26;
          if (v27 > 0x3F)
            break;
          if (!*v26)
          {
            v40 = (unsigned __int16)((_WORD)v26 - (a2 + 376) + 1);
            goto LABEL_122;
          }
          v26 += v27 + 1;
          if (a2 != -632)
            goto LABEL_24;
        }
      }
      else
      {
LABEL_24:
        if ((unint64_t)v26 < a2 + 632)
          goto LABEL_25;
      }
      v40 = 257;
    }
    else
    {
      v22 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEBUG))
        goto LABEL_123;
      v25 = *(_DWORD *)(v12 + 728);
      v36 = (_BYTE *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_54:
        while (v36)
        {
          v37 = *v36;
          if (v37 > 0x3F)
            break;
          if (!*v36)
          {
            v40 = (unsigned __int16)((_WORD)v36 - (a2 + 376) + 1);
            goto LABEL_122;
          }
          v36 += v37 + 1;
          if (a2 != -632)
            goto LABEL_53;
        }
      }
      else
      {
LABEL_53:
        if ((unint64_t)v36 < a2 + 632)
          goto LABEL_54;
      }
      v40 = 257;
    }
LABEL_122:
    v67 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
    v90 = 67110147;
    v91 = v25;
    v92 = 2160;
    v93 = 1752392040;
    v94 = 1040;
    v95 = v40;
    v96 = 2101;
    v97 = a2 + 376;
    v98 = 2082;
    v99 = v67;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[R%u] QueryRecordOpCallback: Suppressed question %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s)", (uint8_t *)&v90, 0x2Cu);
    goto LABEL_123;
  }
  if (*((_WORD *)a3 + 2) != 5)
    goto LABEL_30;
  if (a3[2] == 2)
    *(_BYTE *)(v12 + 760) = 1;
  if (*(_BYTE *)(a2 + 635) || *(_WORD *)(a2 + 342) == 5)
  {
LABEL_30:
    if (*a3 != 240)
    {
      v23 = 0;
      goto LABEL_44;
    }
    if (*(_BYTE *)(a2 + 637))
    {
      mDNS_Lock_((unsigned int *)a1, (uint64_t)"GetTimeNow", 723);
      v28 = *(_DWORD *)(a1 + 64);
      mDNS_Unlock_(a1, (uint64_t)"GetTimeNow", 725);
      if (v28 - *(_DWORD *)(a2 + 240) >= 0)
      {
        v29 = mDNSLogCategory_Default;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
        {
          v23 = 4294901728;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
          {
            v30 = *(_DWORD *)(v12 + 728);
            v38 = (_BYTE *)(a2 + 376);
            if (a2 == -632)
            {
LABEL_62:
              while (v38)
              {
                v39 = *v38;
                if (v39 > 0x3F)
                  break;
                if (!*v38)
                {
                  v66 = (unsigned __int16)((_WORD)v38 - (a2 + 376) + 1);
                  goto LABEL_142;
                }
                v38 += v39 + 1;
                if (a2 != -632)
                  goto LABEL_61;
              }
            }
            else
            {
LABEL_61:
              if ((unint64_t)v38 < a2 + 632)
                goto LABEL_62;
            }
            v66 = 257;
            goto LABEL_142;
          }
        }
        else
        {
          v29 = mDNSLogCategory_Default_redacted;
          v23 = 4294901728;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
          {
            v30 = *(_DWORD *)(v12 + 728);
            v31 = (_BYTE *)(a2 + 376);
            if (a2 == -632)
            {
LABEL_38:
              while (v31)
              {
                v32 = *v31;
                if (v32 > 0x3F)
                  break;
                if (!*v31)
                {
                  v66 = (unsigned __int16)((_WORD)v31 - (a2 + 376) + 1);
                  goto LABEL_142;
                }
                v31 += v32 + 1;
                if (a2 != -632)
                  goto LABEL_37;
              }
            }
            else
            {
LABEL_37:
              if ((unint64_t)v31 < a2 + 632)
                goto LABEL_38;
            }
            v66 = 257;
LABEL_142:
            v72 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
            v73 = *(_QWORD *)(a2 + 136);
            v90 = 67110403;
            v91 = v30;
            v92 = 2160;
            v93 = 1752392040;
            v94 = 1040;
            v95 = v66;
            v96 = 2101;
            v97 = a2 + 376;
            v98 = 2082;
            v99 = v72;
            v100 = 2048;
            v101 = v73;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[R%u] QueryRecordOpCallback: Question %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s) timing out, InterfaceID %p", (uint8_t *)&v90, 0x36u);
          }
        }
        v33 = 1;
LABEL_144:
        if (&_NEHelperTrackerGetAppInfo)
        {
          v74 = 1;
          if (!(_DWORD)a4)
            goto LABEL_152;
        }
        else
        {
          v74 = _os_feature_enabled_impl("symptomsd", "networking_transparency");
          if (!(_DWORD)a4)
          {
LABEL_152:
            v75 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *, _BOOL8, uint64_t, uint64_t, _QWORD))(v12 + 712);
            if (v75)
            {
              if ((_DWORD)a4 == 1)
              {
                if (*(_BYTE *)(v12 + 760))
                  v76 = 1;
                else
                  v76 = a3[2] == 2;
              }
              else
              {
                v76 = 0;
              }
              v75(a1, a2, a3, v76, a4, v23, *(_QWORD *)(v12 + 720));
            }
            v77 = v33 ^ 1;
            if (*(_QWORD *)(a1 + 208) != a2)
              v77 = 1;
            if ((v77 & 1) == 0)
            {
              resolved_cache_delete(a2);
              mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
              *(_QWORD *)(a2 + 176) = 0;
            }
            return;
          }
        }
        if (v74
          && *(_WORD *)(a2 + 340)
          && ((unint64_t)(*((_QWORD *)a3 + 3) + 5) > 3 || *((_QWORD *)a3 + 3) == -4)
          && *a3 != 240)
        {
          v78 = *((unsigned __int16 *)a3 + 2);
          if (v78 == 28 || v78 == 1)
          {
            v79 = &s_head_0;
            while (1)
            {
              v79 = (uint64_t *)*v79;
              if (!v79)
                break;
              if (v79[1] == a2)
              {
                if (v78 == 1)
                  v80 = 4;
                else
                  v80 = 16;
                v81 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(*((_QWORD *)a3 + 5) + 4), v80);
                if (v81)
                {
                  v82 = v81;
                  CFArrayAppendValue((CFMutableArrayRef)v79[6], v81);
                  CFRelease(v82);
                }
                goto LABEL_152;
              }
            }
          }
        }
        goto LABEL_152;
      }
    }
    if (*(_BYTE *)(a2 + 641))
    {
      if ((_DWORD)a4)
      {
        if ((*(_DWORD *)(v12 + 732) & 0x80000000) == 0)
        {
          v34 = NextSearchDomain(v12, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
          if (v34 || (v41 = *(_BYTE **)(v12 + 696), *v41) && !v41[*v41 + 1])
          {
            resolved_cache_delete(a2);
            mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
            *(_QWORD *)(a2 + 176) = 0;
            QueryRecordOpRestartUnicastQuestion(v12, a2, v34);
            return;
          }
        }
      }
    }
    if (!*(_BYTE *)(v12 + 759) || *(_WORD *)(a2 + 342) != 28 || (v42 = a3[1], v42 == 3))
    {
      if (*(_BYTE *)(v12 + 764))
      {
        if (!*(_BYTE *)(a2 + 643))
        {
          v48 = *(_QWORD *)(a2 + 80);
          if (v48)
          {
            v49 = *(_QWORD *)(v48 + 96);
            if (v49)
            {
              if (nw_resolver_config_get_allow_failover(v49))
              {
                QueryRecordOpStopQuestion(a2);
                v50 = *(unsigned __int16 *)(v12 + 762);
                *(_WORD *)(a2 + 342) = v50;
                *(_BYTE *)(a2 + 643) = 1;
                if (!*(_QWORD *)(a2 + 136))
                  *(_BYTE *)(a2 + 642) = 1;
                v51 = mDNSLogCategory_Default;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
                {
                  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEBUG))
                  {
                    v59 = *(_DWORD *)(v12 + 728);
                    v85 = (_BYTE *)(a2 + 376);
                    if (a2 == -632)
                    {
LABEL_182:
                      while (v85)
                      {
                        v86 = *v85;
                        if (v86 > 0x3F)
                          break;
                        if (!*v85)
                        {
                          v88 = (unsigned __int16)((_WORD)v85 - (a2 + 376) + 1);
                          goto LABEL_198;
                        }
                        v85 += v86 + 1;
                        if (a2 != -632)
                          goto LABEL_181;
                      }
                    }
                    else
                    {
LABEL_181:
                      if ((unint64_t)v85 < a2 + 632)
                        goto LABEL_182;
                    }
                    v88 = 257;
                    goto LABEL_198;
                  }
                }
                else
                {
                  v51 = mDNSLogCategory_Default_redacted;
                  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEBUG))
                  {
                    v59 = *(_DWORD *)(v12 + 728);
                    v60 = (_BYTE *)(a2 + 376);
                    if (a2 == -632)
                    {
LABEL_103:
                      while (v60)
                      {
                        v61 = *v60;
                        if (v61 > 0x3F)
                          break;
                        if (!*v60)
                        {
                          v88 = (unsigned __int16)((_WORD)v60 - (a2 + 376) + 1);
                          goto LABEL_198;
                        }
                        v60 += v61 + 1;
                        if (a2 != -632)
                          goto LABEL_102;
                      }
                    }
                    else
                    {
LABEL_102:
                      if ((unint64_t)v60 < a2 + 632)
                        goto LABEL_103;
                    }
                    v88 = 257;
LABEL_198:
                    v90 = 67110147;
                    v91 = v59;
                    v92 = 2160;
                    v93 = 1752392040;
                    v94 = 1040;
                    v95 = v88;
                    v96 = 2101;
                    v97 = a2 + 376;
                    v98 = 2082;
                    v99 = DNSTypeName(v50);
                    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "[R%u] Restarting question for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s) due to DNS service failover", (uint8_t *)&v90, 0x2Cu);
                  }
                }
                if (*(_BYTE *)(a2 + 641))
                {
                  *(_QWORD *)(v12 + 732) = 0;
                  v89 = NextSearchDomain(v12, v52, v53, v54, v55, v56, v57, v58);
                }
                else
                {
                  v89 = 0;
                }
                QueryRecordOpRestartUnicastQuestion(v12, a2, v89);
                return;
              }
            }
          }
        }
      }
      v23 = 4294901742;
      if (*((_QWORD *)a3 + 3) || !IsLocalDomain(*((_BYTE **)a3 + 4)))
        goto LABEL_44;
      v43 = *(unsigned __int16 *)(a2 + 342);
      if ((v43 != 28 && v43 != 1 || a3[1]) && !DomainNameIsInSearchList((_BYTE *)(a2 + 376), 1))
        return;
      v44 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        v45 = *(_DWORD *)(v12 + 728);
        v70 = (_BYTE *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_135:
          while (v70)
          {
            v71 = *v70;
            if (v71 > 0x3F)
              break;
            if (!*v70)
            {
              v84 = (unsigned __int16)((_WORD)v70 - (a2 + 376) + 1);
              goto LABEL_193;
            }
            v70 += v71 + 1;
            if (a2 != -632)
              goto LABEL_134;
          }
        }
        else
        {
LABEL_134:
          if ((unint64_t)v70 < a2 + 632)
            goto LABEL_135;
        }
        v84 = 257;
      }
      else
      {
        v44 = mDNSLogCategory_Default_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        v45 = *(_DWORD *)(v12 + 728);
        v46 = (_BYTE *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_88:
          while (v46)
          {
            v47 = *v46;
            if (v47 > 0x3F)
              break;
            if (!*v46)
            {
              v84 = (unsigned __int16)((_WORD)v46 - (a2 + 376) + 1);
              goto LABEL_193;
            }
            v46 += v47 + 1;
            if (a2 != -632)
              goto LABEL_87;
          }
        }
        else
        {
LABEL_87:
          if ((unint64_t)v46 < a2 + 632)
            goto LABEL_88;
        }
        v84 = 257;
      }
LABEL_193:
      v87 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
      v90 = 67110147;
      v91 = v45;
      v92 = 2160;
      v93 = 1752392040;
      v94 = 1040;
      v95 = v84;
      v96 = 2101;
      v97 = a2 + 376;
      v98 = 2082;
      v99 = v87;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[R%u] QueryRecordOpCallback: Question %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s) answering local with negative unicast response", (uint8_t *)&v90, 0x2Cu);
LABEL_44:
      if ((_DWORD)a4 == 1)
      {
        v33 = 0;
        *(_BYTE *)(v12 + 758) = 1;
        goto LABEL_144;
      }
      goto LABEL_123;
    }
    v62 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEBUG))
      {
        v63 = *(_DWORD *)(v12 + 728);
        v68 = (_BYTE *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_127:
          while (v68)
          {
            v69 = *v68;
            if (v69 > 0x3F)
              break;
            if (!*v68)
            {
              v83 = (unsigned __int16)((_WORD)v68 - (a2 + 376) + 1);
              goto LABEL_189;
            }
            v68 += v69 + 1;
            if (a2 != -632)
              goto LABEL_126;
          }
        }
        else
        {
LABEL_126:
          if ((unint64_t)v68 < a2 + 632)
            goto LABEL_127;
        }
        v83 = 257;
        goto LABEL_189;
      }
    }
    else
    {
      v62 = mDNSLogCategory_Default_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEBUG))
      {
        v63 = *(_DWORD *)(v12 + 728);
        v64 = (_BYTE *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_113:
          while (v64)
          {
            v65 = *v64;
            if (v65 > 0x3F)
              break;
            if (!*v64)
            {
              v83 = (unsigned __int16)((_WORD)v64 - (a2 + 376) + 1);
              goto LABEL_189;
            }
            v64 += v65 + 1;
            if (a2 != -632)
              goto LABEL_112;
          }
        }
        else
        {
LABEL_112:
          if ((unint64_t)v64 < a2 + 632)
            goto LABEL_113;
        }
        v83 = 257;
LABEL_189:
        v90 = 67110147;
        v91 = v63;
        v92 = 2160;
        v93 = 1752392040;
        v94 = 1040;
        v95 = v83;
        v96 = 2101;
        v97 = a2 + 376;
        v98 = 1024;
        LODWORD(v99) = v42;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "[R%u] Restarting question for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P AAAA record as question for A record (RCODE %d)", (uint8_t *)&v90, 0x28u);
      }
    }
    resolved_cache_delete(a2);
    mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
    *(_QWORD *)(a2 + 176) = 0;
    *(_WORD *)(a2 + 342) = 1;
    QueryRecordOpStartQuestion(v12, a2);
  }
}

_QWORD *QueryRecordOpResetHandler(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  unsigned __int16 v6;
  _BYTE *v7;
  uint64_t *v8;

  v1 = result;
  v2 = (_QWORD *)result[22];
  v3 = (_BYTE *)v2[87];
  v4 = v3;
  if (v3 == (_BYTE *)-256)
  {
LABEL_3:
    while (v4)
    {
      v5 = *v4;
      if (v5 > 0x3F)
        break;
      if (!*v4)
      {
        v6 = (_WORD)v4 - (_WORD)v3 + 1;
        if (v6 > 0x100u)
          break;
        result = memcpy(result + 47, v3, v6);
        goto LABEL_11;
      }
      v4 += v5 + 1;
      if (v3 != (_BYTE *)-256)
        goto LABEL_2;
    }
  }
  else
  {
LABEL_2:
    if (v4 < v3 + 256)
      goto LABEL_3;
  }
  *((_BYTE *)result + 376) = 0;
LABEL_11:
  if (*((_BYTE *)v1 + 641) && (v7 = (_BYTE *)v2[87], *v7) && !v7[*v7 + 1])
    v8 = &mDNSInterface_LocalOnly;
  else
    v8 = v2 + 88;
  v1[17] = *v8;
  *(_QWORD *)((char *)v2 + 732) = 0;
  return result;
}

uint64_t QueryRecordOpEventHandler(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  unsigned int v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  int v23;
  _BYTE *v24;
  uint64_t v25;
  int v26;
  _BYTE *v27;
  _BYTE *v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t *SearchDomain;
  _DWORD v32[2];
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;

  if (a2 != 1)
    return result;
  v2 = result;
  if (*(_BYTE *)(result + 646) != 1)
    return result;
  v3 = *(_QWORD *)(result + 176);
  if (!*(_BYTE *)(v3 + 760))
    return result;
  resolved_cache_delete(result);
  mDNS_StopQuery((unsigned int *)mDNSStorage, v2);
  *(_QWORD *)(v2 + 176) = 0;
  v4 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_Default != mDNSLogCategory_State)
  {
    v4 = mDNSLogCategory_Default_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_INFO))
      goto LABEL_52;
    v6 = *(_DWORD *)(v3 + 728);
    v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    v17 = (_BYTE *)(v2 + 376);
    if (v2 == -632)
    {
LABEL_20:
      while (v17)
      {
        v18 = *v17;
        if (v18 > 0x3F)
          break;
        if (!*v17)
        {
          v19 = (unsigned __int16)((_WORD)v17 - (v2 + 376) + 1);
          goto LABEL_39;
        }
        v17 += v18 + 1;
        if (v2 != -632)
          goto LABEL_19;
      }
    }
    else
    {
LABEL_19:
      if ((unint64_t)v17 < v2 + 632)
        goto LABEL_20;
    }
    v19 = 257;
LABEL_39:
    v20 = *(_QWORD *)(v3 + 696);
    if (v20)
    {
      v24 = *(_BYTE **)(v3 + 696);
      if (v20 == -256)
      {
LABEL_42:
        while (v24)
        {
          v25 = *v24;
          if (v25 > 0x3F)
            break;
          if (!*v24)
          {
            v23 = (unsigned __int16)((_WORD)v24 - v20 + 1);
            goto LABEL_51;
          }
          v24 += v25 + 1;
          if (v20 != -256)
            goto LABEL_41;
        }
      }
      else
      {
LABEL_41:
        if ((unint64_t)v24 < v20 + 256)
          goto LABEL_42;
      }
      v23 = 257;
    }
    else
    {
      v23 = 0;
    }
    goto LABEL_51;
  }
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(v3 + 728);
    v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    v8 = (_BYTE *)(v2 + 376);
    if (v2 == -632)
    {
LABEL_12:
      while (v8)
      {
        v9 = *v8;
        if (v9 > 0x3F)
          break;
        if (!*v8)
        {
          v19 = (unsigned __int16)((_WORD)v8 - (v2 + 376) + 1);
          goto LABEL_28;
        }
        v8 += v9 + 1;
        if (v2 != -632)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      if ((unint64_t)v8 < v2 + 632)
        goto LABEL_12;
    }
    v19 = 257;
LABEL_28:
    v20 = *(_QWORD *)(v3 + 696);
    if (v20)
    {
      v21 = *(_BYTE **)(v3 + 696);
      if (v20 == -256)
      {
LABEL_31:
        while (v21)
        {
          v22 = *v21;
          if (v22 > 0x3F)
            break;
          if (!*v21)
          {
            v23 = (unsigned __int16)((_WORD)v21 - v20 + 1);
            goto LABEL_51;
          }
          v21 += v22 + 1;
          if (v20 != -256)
            goto LABEL_30;
        }
      }
      else
      {
LABEL_30:
        if ((unint64_t)v21 < v20 + 256)
          goto LABEL_31;
      }
      v23 = 257;
    }
    else
    {
      v23 = 0;
    }
LABEL_51:
    v26 = *(unsigned __int16 *)(v2 + 342);
    v32[0] = 67111171;
    v32[1] = v6;
    v33 = 1024;
    v34 = v7;
    v35 = 2160;
    v36 = 1752392040;
    v37 = 1040;
    v38 = v19;
    v39 = 2101;
    v40 = v2 + 376;
    v41 = 2160;
    v42 = 1752392040;
    v43 = 1040;
    v44 = v23;
    v45 = 2101;
    v46 = v20;
    v47 = 1024;
    v48 = v26;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[R%u->Q%u] Restarting question that got expired CNAMEs -- current name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, original name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, type: %{mdns:rrtype}d", (uint8_t *)v32, 0x48u);
  }
LABEL_52:
  *(_BYTE *)(v3 + 760) = 0;
  v27 = *(_BYTE **)(v3 + 696);
  v28 = v27;
  if (v27 == (_BYTE *)-256)
  {
LABEL_54:
    while (v28)
    {
      v29 = *v28;
      if (v29 > 0x3F)
        break;
      if (!*v28)
      {
        v30 = (_WORD)v28 - (_WORD)v27 + 1;
        if (v30 > 0x100u)
          break;
        memcpy((void *)(v2 + 376), v27, v30);
        goto LABEL_62;
      }
      v28 += v29 + 1;
      if (v27 != (_BYTE *)-256)
        goto LABEL_53;
    }
  }
  else
  {
LABEL_53:
    if (v28 < v27 + 256)
      goto LABEL_54;
  }
  *(_BYTE *)(v2 + 376) = 0;
LABEL_62:
  *(_BYTE *)(v2 + 646) = 2;
  *(_OWORD *)(v2 + 360) = *(_OWORD *)(v3 + 768);
  if (*(_BYTE *)(v2 + 641) && *(int *)(v3 + 732) >= 1)
  {
    *(_DWORD *)(v3 + 732) = *(_DWORD *)(v3 + 736);
    SearchDomain = NextSearchDomain(v3, (uint64_t)v27, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    SearchDomain = 0;
  }
  return QueryRecordOpRestartUnicastQuestion(v3, v2, SearchDomain);
}

uint64_t QueryRecordOpStartQuestion(uint64_t a1, uint64_t a2)
{
  uint64_t started;
  NSObject *v5;
  int v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  _DWORD v16[2];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  *(_QWORD *)(a2 + 176) = a1;
  started = mDNS_StartQuery((unsigned int *)mDNSStorage, a2);
  if ((_DWORD)started)
  {
    v5 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        *(_QWORD *)(a2 + 176) = 0;
        return started;
      }
      v7 = *(_DWORD *)(a1 + 728);
      v8 = (_BYTE *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_10:
        while (v8)
        {
          v9 = *v8;
          if (v9 > 0x3F)
            break;
          if (!*v8)
          {
            v13 = (unsigned __int16)((_WORD)v8 - (a2 + 376) + 1);
            goto LABEL_27;
          }
          v8 += v9 + 1;
          if (a2 != -632)
            goto LABEL_9;
        }
      }
      else
      {
LABEL_9:
        if ((unint64_t)v8 < a2 + 632)
          goto LABEL_10;
      }
      v13 = 257;
    }
    else
    {
      v5 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v7 = *(_DWORD *)(a1 + 728);
      v11 = (_BYTE *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_18:
        while (v11)
        {
          v12 = *v11;
          if (v12 > 0x3F)
            break;
          if (!*v11)
          {
            v13 = (unsigned __int16)((_WORD)v11 - (a2 + 376) + 1);
            goto LABEL_27;
          }
          v11 += v12 + 1;
          if (a2 != -632)
            goto LABEL_17;
        }
      }
      else
      {
LABEL_17:
        if ((unint64_t)v11 < a2 + 632)
          goto LABEL_18;
      }
      v13 = 257;
    }
LABEL_27:
    v14 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
    v16[0] = 67110403;
    v16[1] = v7;
    v17 = 2160;
    v18 = 1752392040;
    v19 = 1040;
    v20 = v13;
    v21 = 2101;
    v22 = a2 + 376;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = started;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[R%u] ERROR: QueryRecordOpStartQuestion mDNS_StartQuery for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P %{public}s failed with error %d", (uint8_t *)v16, 0x32u);
    goto LABEL_28;
  }
  return started;
}

uint64_t DomainNameIsInSearchList(_BYTE *a1, int a2)
{
  int v4;
  int v5;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int8 *v15;
  int v16;

  v4 = *a1;
  if (*a1)
  {
    v5 = 0;
    v6 = a1;
    do
    {
      ++v5;
      v7 = &v6[v4];
      v8 = v7[1];
      v6 = v7 + 1;
      v4 = v8;
    }
    while (v8);
  }
  else
  {
    v5 = 0;
  }
  v9 = SearchList;
  if (!SearchList)
    return 0;
  while (1)
  {
    if (!a2 || !SameDomainNameBytes((_BYTE *)(v9 + 8), "\x05local"))
    {
      v10 = *(unsigned __int8 *)(v9 + 8);
      if (*(_BYTE *)(v9 + 8))
      {
        v11 = 0;
        v12 = v9 + 8;
        do
        {
          ++v11;
          v13 = v12 + v10;
          v14 = *(unsigned __int8 *)(v13 + 1);
          v12 = v13 + 1;
          v10 = v14;
        }
        while (v14);
      }
      else
      {
        v11 = 0;
      }
      if (v5 >= v11)
      {
        v15 = a1;
        if (v5 - v11 >= 1)
        {
          v16 = v5 + 1 - v11;
          v15 = a1;
          do
          {
            if (!*v15)
              break;
            v15 += *v15 + 1;
            --v16;
          }
          while (v16 > 1);
        }
        if (SameDomainNameBytes((_BYTE *)(v9 + 8), v15))
          break;
      }
    }
    v9 = *(_QWORD *)v9;
    if (!v9)
      return 0;
  }
  return 1;
}

uint64_t *NextSearchDomain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  unsigned int v13;
  uint64_t *v14;
  int v15;
  uint64_t *v16;
  int v17;
  char *v18;
  unsigned int v19;
  unsigned __int8 *v20;
  _BYTE *v21;
  _BYTE *i;
  unsigned __int16 v23;
  uint64_t v24;
  int v25;
  _BYTE *v26;
  unsigned __int16 v27;
  uint64_t v28;

  v9 = *(_DWORD *)(a1 + 732);
  v10 = &SearchList;
  *(_DWORD *)(a1 + 736) = v9;
  while ((v9 & 0x80000000) == 0)
  {
    v11 = *(_QWORD *)(a1 + 704);
    do
    {
      v10 = (uint64_t *)*v10;
      v12 = v9-- != 0;
    }
    while (v12 && v10);
    while (1)
    {
      if (!v10)
        goto LABEL_52;
      v14 = v10 + 1;
      v13 = *((unsigned __int8 *)v10 + 8);
      if (*((_BYTE *)v10 + 8))
      {
        v15 = -1;
        v16 = v10 + 1;
        do
        {
          v17 = v15;
          v18 = (char *)v16 + v13;
          v19 = v18[1];
          v16 = (uint64_t *)(v18 + 1);
          v13 = v19;
          ++v15;
        }
        while (v19);
        if (v17 + 2 >= 2)
        {
          v20 = (unsigned __int8 *)(v10 + 1);
          if (v17)
          {
            v20 = (unsigned __int8 *)(v10 + 1);
            do
            {
              if (!*v20)
                break;
              --v15;
              v20 += *v20 + 1;
            }
            while (v15 > 1);
          }
          if (SameDomainNameBytes(v20, "\ain-addr\x04arpa")
            || SameDomainNameBytes(v20, "\x03ip6\x04arpa"))
          {
            if (mDNS_LoggingEnabled == 1)
              LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain: skipping search domain %##s, InterfaceID %p", a4, a5, a6, a7, a8, (_DWORD)v10 + 8);
            ++*(_DWORD *)(a1 + 732);
            goto LABEL_9;
          }
        }
      }
      ++*(_DWORD *)(a1 + 732);
      if (v10[34] == v11)
        break;
      if (mDNS_LoggingEnabled)
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain skipping domain %##s, InterfaceID %p", a4, a5, a6, a7, a8, (_DWORD)v10 + 8);
LABEL_9:
      v10 = (uint64_t *)*v10;
    }
    if (mDNS_LoggingEnabled)
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain returning domain %##s, InterfaceID %p", a4, a5, a6, a7, a8, (_DWORD)v10 + 8);
    v21 = *(_BYTE **)(a1 + 696);
    for (i = v21; v21 == (_BYTE *)-256; i += v24 + 1)
    {
      if (!i)
        goto LABEL_36;
LABEL_32:
      v24 = *i;
      if (v24 > 0x3F)
      {
LABEL_36:
        v23 = 257;
        goto LABEL_38;
      }
      if (!*i)
      {
        v23 = (_WORD)i - (_WORD)v21 + 1;
        goto LABEL_38;
      }
    }
    v23 = 257;
    if (i < v21 + 256 && i)
      goto LABEL_32;
LABEL_38:
    v25 = v23 - 1;
    v26 = v10 + 1;
    if (v10 != (uint64_t *)-264)
    {
LABEL_39:
      v27 = 257;
      if (v26 >= (_BYTE *)v10 + 264 || !v26)
        goto LABEL_49;
      goto LABEL_43;
    }
    while (v26)
    {
LABEL_43:
      v28 = *v26;
      if (v28 > 0x3F)
        break;
      if (!*v26)
      {
        v27 = (_WORD)v26 - (_WORD)v14 + 1;
        goto LABEL_49;
      }
      v26 += v28 + 1;
      if (v10 != (uint64_t *)-264)
        goto LABEL_39;
    }
    v27 = 257;
LABEL_49:
    if (v25 + v27 < 257)
      return v14;
    v9 = *(_DWORD *)(a1 + 732);
    v10 = &SearchList;
  }
  LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain: count %d less than zero", a4, a5, a6, a7, a8, v9);
LABEL_52:
  v14 = 0;
  *(_DWORD *)(a1 + 732) = -1;
  return v14;
}

uint64_t QueryRecordOpRestartUnicastQuestion(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  unsigned __int16 v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  *(_QWORD *)(a2 + 136) = *(_QWORD *)(a1 + 704);
  v6 = *(_BYTE **)(a1 + 696);
  v7 = v6;
  if (v6 == (_BYTE *)-256)
  {
LABEL_3:
    while (v7)
    {
      v8 = *v7;
      if (v8 > 0x3F)
        break;
      if (!*v7)
      {
        v9 = (_WORD)v7 - (_WORD)v6 + 1;
        if (v9 > 0x100u)
          break;
        memcpy((void *)(a2 + 376), v6, v9);
        if (a3)
          goto LABEL_12;
        goto LABEL_13;
      }
      v7 += v8 + 1;
      if (v6 != (_BYTE *)-256)
        goto LABEL_2;
    }
  }
  else
  {
LABEL_2:
    if (v7 < v6 + 256)
      goto LABEL_3;
  }
  *(_BYTE *)(a2 + 376) = 0;
  if (a3)
LABEL_12:
    AppendDomainName((_BYTE *)(a2 + 376), a3);
LABEL_13:
  v10 = a2 + 376;
  v11 = *(unsigned __int8 *)(a2 + 376);
  if (*(_BYTE *)(a2 + 376))
  {
    do
    {
      v12 = v10;
      v13 = v10 + v11;
      v14 = *(unsigned __int8 *)(v13 + 1);
      v10 = v13 + 1;
      v11 = v14;
    }
    while (v14);
  }
  else
  {
    v12 = a2 + 376;
  }
  *(_BYTE *)(a2 + 638) = SameDomainLabelPointer(v12, "\x05local") != 0;
  return QueryRecordOpStartQuestion(a1, a2);
}

void QueryRecordOpStopQuestion(uint64_t a1)
{
  resolved_cache_delete(a1);
  mDNS_StopQuery((unsigned int *)mDNSStorage, a1);
  *(_QWORD *)(a1 + 176) = 0;
}

BOOL GetAddrInfoClientRequestIsMulticast(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BOOL8 result;

  v1 = *(_QWORD *)(a1 + 16);
  result = 1;
  if (!v1 || *(_WORD *)(v1 + 340) || *(int *)(v1 + 212) <= 0)
  {
    v2 = *(_QWORD *)(a1 + 24);
    if (!v2 || *(_WORD *)(v2 + 340) || *(int *)(v2 + 212) <= 0)
      return 0;
  }
  return result;
}

uint64_t QueryRecordClientRequestStart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t RecordOpStart;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned __int8 *v18;
  int v19;
  char v20;
  _BYTE *v21;
  int v22;
  NSObject *v23;
  char v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint8_t buf[32];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  unsigned __int8 v36[264];

  memset(v36, 0, 256);
  if (*(_BYTE *)(a2 + 68))
  {
    v12 = *(_QWORD *)(a2 + 72);
    RecordOpStart = 4294901741;
    if (!v12)
      goto LABEL_8;
    v14 = (void *)xpc_copy_entitlement_for_token("com.apple.private.dnssd.resolver-override", v12 + 24);
    if (!v14)
      goto LABEL_8;
    v15 = v14;
    xpc_release(v14);
    if (v15 != &_xpc_BOOL_true)
      goto LABEL_8;
    v16 = *(_QWORD *)(a2 + 48);
    if (!v16)
    {
      RecordOpStart = 4294901756;
      goto LABEL_8;
    }
    Querier_RegisterPathResolver(v16);
  }
  v30 = 0;
  RecordOpStart = InterfaceIndexToInterfaceID(*(_DWORD *)(a2 + 16), &v30, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)RecordOpStart)
  {
LABEL_8:
    QueryRecordClientRequestStop(a1, a2, a3, a4, a5, a6, a7, a8, v29);
    return RecordOpStart;
  }
  v18 = *(unsigned __int8 **)(a2 + 8);
  v36[0] = 0;
  if (!AppendDNSNameString(v36, v18, a3, a4, a5, a6, a7, a8))
  {
    RecordOpStart = 4294901756;
    v23 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
    }
    else
    {
      v23 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
    }
    v25 = *(_DWORD *)a2;
    v26 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)buf = 67109635;
    *(_DWORD *)&buf[4] = v25;
    *(_WORD *)&buf[8] = 2160;
    *(_QWORD *)&buf[10] = 1752392040;
    *(_WORD *)&buf[18] = 2085;
    *(_QWORD *)&buf[20] = v26;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[R%u] ERROR: bad domain name '%{sensitive, mask.hash}s'", buf, 0x1Cu);
    goto LABEL_8;
  }
  v19 = *(unsigned __int16 *)(a2 + 24);
  if (v19 != 28 && v19 != 1)
    goto LABEL_33;
  v20 = 0;
  v21 = *(_BYTE **)(a2 + 8);
  while (1)
  {
    v22 = *v21++;
    if (v22 == 46)
      break;
    if (v22 == 92)
    {
      ++v20;
    }
    else
    {
      if (!*(v21 - 1))
        goto LABEL_27;
LABEL_19:
      v20 = 0;
    }
  }
  if (*v21)
    goto LABEL_19;
  if ((v20 & 1) == 0)
    goto LABEL_33;
LABEL_27:
  if (AlwaysAppendSearchDomains || v36[0] && !v36[v36[0] + 1])
    v24 = 1;
  else
LABEL_33:
    v24 = 0;
  memset(buf, 0, sizeof(buf));
  memset(v35, 0, sizeof(v35));
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  *(_DWORD *)buf = *(_DWORD *)a2;
  *(_QWORD *)&buf[8] = v36;
  v27 = *(_DWORD *)(a2 + 20);
  LODWORD(v32) = -1;
  DWORD1(v32) = v27;
  *(_WORD *)&buf[16] = v19;
  *(_WORD *)&buf[18] = *(_WORD *)(a2 + 26);
  *(_QWORD *)&buf[24] = v30;
  BYTE8(v32) = v24;
  HIDWORD(v32) = *(_DWORD *)(a2 + 28);
  *(_QWORD *)&v33 = *(_QWORD *)(a2 + 32);
  DWORD2(v33) = *(_DWORD *)(a2 + 40);
  v28 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)&v34 = *(_QWORD *)(a2 + 48);
  *((_QWORD *)&v34 + 1) = v28;
  LODWORD(v35[0]) = *(_DWORD *)(a2 + 64);
  BYTE4(v35[0]) = *(_BYTE *)(a2 + 68);
  *(_OWORD *)((char *)v35 + 8) = *(_OWORD *)(a2 + 72);
  WORD6(v33) = *(_WORD *)(a2 + 88);
  BYTE8(v35[1]) = *(_BYTE *)(a2 + 90);
  RecordOpStart = QueryRecordOpStart(a1, (uint64_t)buf, a3, a4);
  if ((_DWORD)RecordOpStart)
    goto LABEL_8;
  return RecordOpStart;
}

void QueryRecordClientRequestStop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  QueryRecordOpStop(a1);
  if (*(_BYTE *)(a1 + 758))
  {
    v16 = *(unsigned __int16 *)(a1 + 342);
    if (v16 == 1)
      v17 = a1;
    else
      v17 = 0;
    if (v16 == 28)
      v18 = a1;
    else
      v18 = 0;
    mDNSPlatformTriggerDNSRetry(v17, v18, v10, v11, v12, v13, v14, v15, a9);
  }
}

uint64_t DNSProxyStartHandler(const void *a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _UNKNOWN **v20;
  void (*v21)(_QWORD *);
  CFMutableArrayRef Mutable;
  uint64_t v23;
  CFIndex Count;
  uint64_t v25;
  const __CFArray *v26;
  int v27;
  int v28;
  int v29;
  int v30;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v59;
  _QWORD v60[5];

  v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = gProxyManager;
  if (gProxyManager)
    goto LABEL_16;
  v11 = _os_object_alloc(OS_mrcs_dns_proxy_manager, 32);
  if (!v11)
  {
    gProxyManager = 0;
    v23 = 4294960568;
    goto LABEL_42;
  }
  v19 = (_QWORD *)v11;
  v20 = &_mrcs_dns_proxy_manager_kind;
  *(_QWORD *)(v11 + 16) = &_mrcs_dns_proxy_manager_kind;
  do
  {
    v21 = (void (*)(_QWORD *))v20[2];
    if (v21)
      v21(v19);
    v20 = (_UNKNOWN **)*v20;
  }
  while (v20);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mrcs_cfarray_callbacks);
  v19[3] = Mutable;
  if (Mutable)
    v10 = (uint64_t)v19;
  else
    v10 = 0;
  if (Mutable)
    v23 = 0;
  else
    v23 = 4294960567;
  if (!Mutable)
    os_release(v19);
  gProxyManager = v10;
  if (!(_DWORD)v23)
  {
LABEL_16:
    Count = CFArrayGetCount(*(CFArrayRef *)(v10 + 24));
    v25 = gProxyManager;
    v26 = *(const __CFArray **)(gProxyManager + 24);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 0x40000000;
    v60[2] = ___mrcs_dns_proxy_manager_conflicts_with_proxy_block_invoke;
    v60[3] = &__block_descriptor_tmp_17_4082;
    v60[4] = a1;
    if (mdns_cfarray_enumerate(v26, (uint64_t)v60))
    {
      CFArrayAppendValue(*(CFMutableArrayRef *)(v25 + 24), a1);
      v23 = 0;
      if (Count)
        goto LABEL_42;
    }
    else
    {
      v23 = 4294960537;
      if (Count)
        goto LABEL_42;
    }
    if (CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
    {
      v27 = socket(2, 2, 17);
      v28 = socket(30, 2, 17);
      v29 = socket(2, 1, 6);
      v30 = socket(30, 1, 6);
      v31 = v30;
      if (v27 < 0 || v28 < 0 || v29 < 0 || v30 < 0)
      {
        if ((v27 & 0x80000000) == 0)
          close(v27);
        if ((v28 & 0x80000000) == 0)
          close(v28);
        if ((v29 & 0x80000000) == 0)
          close(v29);
        if ((v31 & 0x80000000) == 0)
          close(v31);
      }
      BindDPSocket(v27, 2, 2);
      BindDPSocket(v28, 30, 2);
      BindDPSocket(v29, 2, 1);
      BindDPSocket(v31, 30, 1);
      if (mDNS_LoggingEnabled == 1)
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "mDNSPlatformInitDNSProxySkts: Opened Listener Sockets for DNS Proxy : %d, %d, %d, %d", v32, v33, v34, v35, v36, v27);
      v37 = mDNSStorage[0];
      *(_QWORD *)(mDNSStorage[0] + 976) = ProxyUDPCallback;
      *(_QWORD *)(v37 + 984) = ProxyTCPCallback;
      *(_WORD *)(v37 + 704) = 13568;
      *(_QWORD *)(v37 + 872) = mDNSStorage;
      *(_WORD *)(v37 + 800) = 13568;
      *(_QWORD *)(v37 + 960) = mDNSStorage;
      *(_WORD *)(v37 + 888) = 13568;
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: %d, %d, %d, %d", v32, v33, v34, v35, v36, v27);
      *(_BYTE *)(v37 + 792) = 1;
      if (SetupUDPProxySocket(v27, (_QWORD *)(v37 + 704), 2, v38, v39, v40, v41, v42))
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! UDPv4 Socket", v43, v44, v45, v46, v47, v59);
      if (SetupUDPProxySocket(v28, (_QWORD *)(v37 + 704), 30, v43, v44, v45, v46, v47))
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! UDPv6 Socket", v48, v49, v50, v51, v52, v59);
      if (SetupTCPProxySocket(v29, v37 + 800))
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! TCPv4 Socket", v53, v54, v55, v56, v57, v59);
      if (SetupTCPProxySocket(v31, v37 + 888))
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! TCPv6 Socket", v14, v15, v16, v17, v18, v59);
      dp_listener = v27;
      unk_100158CF0 = v28;
      dword_100158CF4 = v29;
      unk_100158CF8 = v31;
    }
  }
LABEL_42:
  KQueueUnlock((uint64_t)"DNSProxyStartHandler", v12, v13, v14, v15, v16, v17, v18);
  return v23;
}

uint64_t DNSProxyStopHandler(const void *a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex Count;
  uint64_t v18;
  CFIndex v19;
  CFIndex v20;
  CFIndex v21;
  uint64_t v22;
  uint64_t i;
  int v25;

  v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  if (gProxyManager)
  {
    Count = CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24));
    v18 = gProxyManager;
    v19 = CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24));
    if (v19 < 1)
    {
LABEL_6:
      v22 = 4294960569;
    }
    else
    {
      v20 = v19;
      v21 = 0;
      while (CFArrayGetValueAtIndex(*(CFArrayRef *)(v18 + 24), v21) != a1)
      {
        if (v20 == ++v21)
          goto LABEL_6;
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v18 + 24), v21);
      if (Count)
      {
        if (!CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
        {
          for (i = 0; i != 4; ++i)
            close(dp_listener[i]);
          if (mDNS_LoggingEnabled == 1)
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "mDNSPlatformCloseDNSProxySkts: Closing DNS Proxy Listener Sockets", v12, v13, v14, v15, v16, v25);
        }
      }
      v22 = 0;
    }
  }
  else
  {
    v22 = 4294901754;
  }
  KQueueUnlock((uint64_t)"DNSProxyStopHandler", v10, v11, v12, v13, v14, v15, v16);
  return v22;
}

char *DNSProxyGetStateHandler()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v16)(void);
  char *v17;

  v0 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v0, v1, v2, v3, v4, v5, v6, v7);
  if (gProxyManager && CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
  {
    v15 = (_QWORD *)(gProxyManager + 16);
    while (1)
    {
      v15 = (_QWORD *)*v15;
      if (!v15)
        goto LABEL_9;
      v16 = (uint64_t (*)(void))v15[3];
      if (v16)
      {
        v17 = (char *)v16();
        goto LABEL_10;
      }
    }
  }
  v17 = strdup("‹No DNS Proxies›");
  if (!v17)
  {
    __break(1u);
LABEL_9:
    v17 = 0;
  }
LABEL_10:
  KQueueUnlock((uint64_t)"DNSProxyGetStateHandler", v8, v9, v10, v11, v12, v13, v14);
  return v17;
}

void ProxyUDPCallback(unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  unsigned __int16 v10;

  v10 = a5;
  if (mDNS_LoggingEnabled == 1)
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyUDPCallback: DNS Message from %#a:%d to %#a:%d length %d", (uint64_t)a4, a5, a6, a7, a8, (int)a4);
  ProxyCallbackCommon(a1, a2, a3, a4, v10, a8, 0, a9);
}

void ProxyTCPCallback(unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  unsigned __int16 v10;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;

  v10 = a5;
  if (mDNS_LoggingEnabled == 1)
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPCallback: DNS Message from %#a:%d to %#a:%d length %d", (uint64_t)a4, a5, a6, a7, a8, (int)a4);
  if ((unsigned __int8 *)a3 != a2
    && gProxyManager
    && mrcs_dns_proxy_manager_get_proxy_by_input_interface(*(const __CFArray **)(gProxyManager + 24), a8))
  {
    ProxyCallbackCommon(a1, a2, a3, a4, v10, a8, 1, a9);
  }
  else
  {
    v15 = &DNSProxyClients;
    v16 = &DNSProxyClients;
    do
    {
      v17 = v16;
      v16 = v15;
      v15 = (uint64_t *)*v15;
      if (!v15)
      {
        mDNSPlatformDisposeProxyContext(a1);
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPCallback: socket cannot be found", v18, v19, v20, v21, v22, (int)a9);
        return;
      }
    }
    while ((unsigned __int16 *)v15[5] != a1);
    *v17 = *v15;
    if (mDNS_LoggingEnabled == 1)
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPCallback: free", (uint64_t)a4, a5, a6, a7, a8, v23);
    mDNSPlatformDisposeProxyContext(a1);
    FreeDNSProxyClient((_QWORD *)*v16);
  }
}

void FreeDNSProxyClient(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[7];
  if (v2)
    free(v2);
  v3 = (void *)a1[132];
  if (v3)
    free(v3);
  v4 = (void *)a1[133];
  if (v4)
    os_release(v4);
  free(a1);
}

void ProxyCallbackCommon(unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8)
{
  int v10;
  unsigned __int16 v11;
  uint64_t proxy_by_input_interface;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned __int16 v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *OptRR;
  unint64_t v34;
  int v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t *i;
  uint64_t v70;
  unsigned int v71;
  void *v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  NSObject *v90;
  unsigned int v91;
  NSObject *v92;
  _BYTE *v93;
  int v94;
  __int128 v95;
  _QWORD v96[4];
  _BYTE v97[342];
  unsigned __int16 v98;
  unsigned __int16 v99;
  _BYTE v100[256];
  uint64_t v101;

  if (!gProxyManager
    || (v10 = a7,
        v11 = a5,
        (proxy_by_input_interface = mrcs_dns_proxy_manager_get_proxy_by_input_interface(*(const __CFArray **)(gProxyManager + 24), a6)) == 0))
  {
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Rejecting DNS Query coming from InterfaceID %p", (uint64_t)a4, a5, a6, a7, (uint64_t)a8, a6);
    return;
  }
  if ((((_DWORD)a3 - (_DWORD)a2) & 0xFFFFFFFC) >= 0xCuLL)
  {
    v17 = __rev16(*((unsigned __int16 *)a2 + 2));
    *((_WORD *)a2 + 2) = v17;
    v18 = __rev16(*((unsigned __int16 *)a2 + 3));
    *((_WORD *)a2 + 3) = v18;
    v19 = __rev16(*((unsigned __int16 *)a2 + 4));
    *((_WORD *)a2 + 4) = v19;
    *((_WORD *)a2 + 5) = bswap32(*((unsigned __int16 *)a2 + 5)) >> 16;
    if ((a2[2] & 0xF8) != 0)
    {
      if (mDNS_LoggingEnabled == 1)
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Not a query(%d) for pkt from %#a:%d", (uint64_t)a4, a5, a6, a7, (uint64_t)a8, a2[2] & 0xF8);
      v20 = v11;
      v21 = 4;
      goto LABEL_25;
    }
    if (v17 != 1 || v18 || v19)
    {
      if (mDNS_LoggingEnabled == 1)
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Malformed pkt from %#a:%d, Q:%d, An:%d, Au:%d", (uint64_t)a4, a5, a6, a7, (uint64_t)a8, (int)a4);
    }
    else
    {
      v22 = (void *)proxy_by_input_interface;
      bzero(v97, 0x2B8uLL);
      if (getQuestion((unint64_t)a2, a2 + 12, a3, a6, v97))
      {
        if (mDNS_LoggingEnabled)
        {
          v92 = mDNSLogCategory_Default;
          DNSTypeName(v98);
          LogMsgWithLevel(v92, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Question %##s (%s)", v28, v29, v30, v31, v32, (int)v100);
        }
        OptRR = LocateOptRR((unint64_t)a2, a3, 0);
        v93 = OptRR;
        if (OptRR)
        {
          v34 = a3;
          v35 = (int)OptRR;
          v36 = skipResourceRecord((unint64_t)a2, OptRR, v34);
          if (v36)
          {
            v91 = (_DWORD)v36 - v35;
            if (mDNS_LoggingEnabled == 1)
            {
              v90 = mDNSLogCategory_Default;
              v42 = (_DWORD)v36 - v35;
              DNSTypeName(v98);
              LogMsgWithLevel(v90, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: EDNS0 opt length %u present in Question %##s (%s)", v43, v44, v45, v46, v47, v42);
            }
LABEL_32:
            v54 = DNSProxyClients;
            if (DNSProxyClients)
            {
              v55 = *(unsigned __int16 *)a2;
              while (!mDNSSameAddress((int *)(v54 + 8), a4)
                   || *(unsigned __int16 *)(v54 + 28) != v11
                   || *(unsigned __int16 *)(v54 + 30) != v55
                   || *(unsigned __int16 *)(v54 + 1032) != v98
                   || *(unsigned __int16 *)(v54 + 680) != v99
                   || !SameDomainNameBytes((_BYTE *)(v54 + 80), v100))
              {
                v54 = *(_QWORD *)v54;
                if (!v54)
                  goto LABEL_41;
              }
              if ((mDNS_LoggingEnabled & 1) != 0)
              {
                LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "IsDuplicateClient: Found a duplicate client in the list", v56, v57, v58, v59, v60, v89);
                if (mDNS_LoggingEnabled == 1)
                  LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Found a duplicate for pkt from %#a:%d, ignoring this", v84, v85, v86, v87, v88, (int)a4);
              }
              return;
            }
LABEL_41:
            v61 = malloc_type_calloc(1uLL, 0x430uLL, 0xF1748037uLL);
            if (v61)
            {
              v62 = (uint64_t)v61;
              DNSProxyPrepareOmsg(0x1F4u, (uint64_t)v61);
              *(_QWORD *)(v62 + 1064) = v22;
              os_retain(v22);
              v68 = a4[4];
              *(_OWORD *)(v62 + 8) = *(_OWORD *)a4;
              *(_DWORD *)(v62 + 24) = v68;
              *(_WORD *)(v62 + 28) = v11;
              *(_WORD *)(v62 + 30) = *(_WORD *)a2;
              *(_QWORD *)(v62 + 32) = a6;
              *(_QWORD *)(v62 + 40) = a1;
              *(_BYTE *)(v62 + 48) = v10;
              *(_WORD *)(v62 + 50) = *((_WORD *)a2 + 1);
              *(_QWORD *)(v62 + 72) = a8;
              for (i = (uint64_t *)v100; i < &v101; i = (uint64_t *)((char *)i + v70 + 1))
              {
                if (!i)
                  break;
                v70 = *(unsigned __int8 *)i;
                if (v70 > 0x3F)
                  break;
                if (!*(_BYTE *)i)
                {
                  v71 = (_DWORD)i - v100 + 1;
                  if ((unsigned __int16)v71 <= 0x100u)
                  {
                    memcpy((void *)(v62 + 80), v100, (unsigned __int16)v71);
                    goto LABEL_51;
                  }
                  break;
                }
              }
              *(_BYTE *)(v62 + 80) = 0;
LABEL_51:
              if (!v93)
                goto LABEL_57;
              if (v91 <= 0xA)
              {
                if (mDNS_LoggingEnabled == 1)
                  LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Invalid EDNS0 option for pkt from %#a:%d, ignoring this", v63, v64, v65, v66, v67, (int)a4);
                goto LABEL_57;
              }
              *(_WORD *)(v62 + 68) = bswap32(*(unsigned __int16 *)(v93 + 3)) >> 16;
              v72 = malloc_type_malloc(v91, 0xA172743EuLL);
              if (v72)
              {
                *(_QWORD *)(v62 + 56) = v72;
                memcpy(v72, v93, v91);
                *(_DWORD *)(v62 + 64) = v91;
LABEL_57:
                mDNS_SetupQuestion(v62 + 336, *(unsigned int *)(*(_QWORD *)(v62 + 1064) + 64), v100, v98, v62);
                *(_BYTE *)(v62 + 973) = 1;
                *(_BYTE *)(v62 + 971) = 1;
                *(_BYTE *)(v62 + 988) = 1;
                *(_WORD *)(v62 + 682) = 0;
                v73 = *(_QWORD *)(v62 + 1064);
                *(_DWORD *)(v62 + 584) = *(_DWORD *)(v73 + 72);
                v74 = *(unsigned __int16 *)(v62 + 678);
                *(_WORD *)(v62 + 1032) = v74;
                if (*(_BYTE *)(v73 + 76))
                  v75 = v73 + 24;
                else
                  v75 = 0;
                if (*(_BYTE *)(v73 + 76))
                {
                  if (v74 == 28)
                  {
                    if (*(_BYTE *)(v73 + 77))
                    {
                      *(_DWORD *)(v62 + 1036) = 1;
                      *(_WORD *)(v62 + 678) = 1;
                    }
                  }
                  else if (v74 == 12)
                  {
                    v95 = 0uLL;
                    v94 = 0;
                    if (GetReverseIPv6Addr((_BYTE *)(v62 + 80), &v95))
                    {
                      if (nw_nat64_extract_v4(v75, &v95, &v94))
                      {
                        memset(v96, 0, 30);
                        mDNS_snprintf(v96);
                        *(_BYTE *)(v62 + 712) = 0;
                        AppendDNSNameString((_BYTE *)(v62 + 712), (unsigned __int8 *)v96, v76, v77, v78, v79, v80, v81);
                        *(_DWORD *)(v62 + 536) = DomainNameHashValue(v62 + 712);
                        *(_DWORD *)(v62 + 1036) = 2;
                      }
                    }
                  }
                }
                v82 = &DNSProxyClients;
                do
                {
                  v83 = v82;
                  v82 = (uint64_t *)*v82;
                }
                while (v82);
                *v83 = v62;
                mDNS_StartQuery((unsigned int *)mDNSStorage, v62 + 336);
                return;
              }
            }
            __break(1u);
          }
          if (mDNS_LoggingEnabled == 1)
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: EDNS0 cannot be parsed for pkt from %#a:%d, ignoring", v37, v38, v39, v40, v41, (int)a4);
        }
        else if (mDNS_LoggingEnabled == 1)
        {
          v48 = mDNSLogCategory_Default;
          DNSTypeName(v98);
          LogMsgWithLevel(v48, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: EDNS0 opt not present in Question %##s (%s), ptr %p", v49, v50, v51, v52, v53, (int)v100);
        }
        v91 = 0;
        goto LABEL_32;
      }
      if (mDNS_LoggingEnabled)
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Question cannot be parsed for pkt from %#a:%d", v23, v24, v25, v26, v27, (int)a4);
    }
    v20 = v11;
    v21 = 1;
LABEL_25:
    SendError(a1, (uint64_t)a2, a3, a4, v20, a6, v10, a8, v21);
  }
}

void SendError(unsigned __int16 *a1, uint64_t a2, int a3, int *a4, unsigned __int16 a5, uint64_t a6, int a7, _DWORD *a8, char a9)
{
  int v15;
  int v16;
  char *v17;

  if (a3 - (int)a2 >= 8940)
    v15 = 8940;
  else
    v15 = a3 - a2;
  v16 = *(_DWORD *)(a2 + 8);
  qword_10015FEE8 = *(_QWORD *)a2;
  dword_10015FEF0 = v16;
  BYTE2(qword_10015FEE8) |= 0x80u;
  BYTE3(qword_10015FEE8) = a9;
  memcpy(&unk_10015FEF4, (const void *)(a2 + 12), (v15 - 12));
  v17 = (char *)&qword_10015FEE8 + v15;
  if (a7)
    mDNSSendDNSMessage((uint64_t)mDNSStorage, (unint64_t)mDNSStorage + &loc_100007120, (unint64_t)v17, a6, a1, 0, a4, a5, 0, 0);
  else
    mDNSSendDNSMessage((uint64_t)mDNSStorage, (unint64_t)mDNSStorage + &loc_100007120, (unint64_t)v17, a6, 0, a1, a4, a5, 0, 0);
  mDNSPlatformDisposeProxyContext(a8);
}

void DNSProxyPrepareOmsg(unsigned int a1, uint64_t a2)
{
  __int16 v3;
  size_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const void *v13;
  size_t v14;
  void *v15;

  v3 = a1;
  v4 = a1 + 12;
  v5 = *(_QWORD *)(a2 + 1056);
  v6 = (char *)malloc_type_calloc(1uLL, v4, 0xF1748037uLL);
  if (v6)
  {
    v12 = v6;
    if (v5)
    {
      v13 = *(const void **)(a2 + 1056);
      v5 = *(_QWORD *)(a2 + 1040) - (_QWORD)v13 - 12;
      if (mDNS_LoggingEnabled == 1)
      {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "DNSProxyPrepareOmsg: Preserving offset %ld in size %d", v7, v8, v9, v10, v11, *(_DWORD *)(a2 + 1040) - (_DWORD)v13 - 12);
        v13 = *(const void **)(a2 + 1056);
      }
      if ((unint64_t)*(unsigned __int16 *)(a2 + 1048) + 12 >= v4)
        v14 = v4;
      else
        v14 = *(unsigned __int16 *)(a2 + 1048) + 12;
      memcpy(v12, v13, v14);
      v15 = *(void **)(a2 + 1056);
      if (v15)
        free(v15);
    }
    *(_QWORD *)(a2 + 1056) = v12;
    *(_WORD *)(a2 + 1048) = v3;
    *(_QWORD *)(a2 + 1040) = &v12[v5 + 12];
  }
  else
  {
    __break(1u);
  }
}

void ProxyClientCallback(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned __int8 *v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  unsigned __int8 *v40;
  _WORD *v41;
  unsigned int v42;
  _BYTE *v43;
  _BYTE *v44;
  uint64_t v45;
  unsigned __int16 v46;
  unint64_t v47;
  _BYTE *v48;
  _BOOL4 v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  unsigned __int8 *v54;
  __int128 v55;
  __int128 v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  int v85;
  _BYTE *v86;
  char *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  unsigned int v95;
  int v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  __int16 v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  BOOL v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unsigned __int16 *v136;
  int *v137;
  unsigned __int16 v138;
  uint64_t *v139;
  uint64_t *v140;
  BOOL v141;
  NSObject *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  uint64_t v155;
  _BOOL4 v157;
  uint64_t *v158;
  uint64_t v159;
  _BYTE *__src;
  unsigned __int8 *v161;
  int v162;
  unint64_t v163;
  __int128 v164;
  int v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint64_t v170;
  int v171;
  int v172;
  _OWORD v173[2];
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _BYTE v187[28];

  v8 = a2;
  v10 = *a3 == 240 || *((unsigned __int16 *)a3 + 2) == *(unsigned __int16 *)(a2 + 342);
  v157 = v10;
  if (!a4)
    return;
  v11 = *(_QWORD *)(a2 + 176);
  if (mDNS_LoggingEnabled == 1)
  {
    v12 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
    LogMsgWithLevel(v12, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: %##s (%s)", v13, v14, v15, v16, v17, v11 + 80);
  }
  v18 = *(_DWORD *)(v11 + 1036);
  if (!*(_BYTE *)(*(_QWORD *)(v11 + 1064) + 76))
  {
    if (v18 != 4)
      goto LABEL_17;
LABEL_131:
    v126 = *(_QWORD *)(v11 + 1056);
    *(_WORD *)v126 = *(_WORD *)(v11 + 30);
    *(_WORD *)(v126 + 2) = 896;
    *(_QWORD *)(v126 + 4) = 0;
    v86 = putQuestion(*(_QWORD *)(v11 + 1056), *(_QWORD *)(v11 + 1056) + 12, *(_QWORD *)(v11 + 1056) + 12 + *(unsigned __int16 *)(v11 + 1048), (unsigned __int8 *)(v11 + 80), *(unsigned __int16 *)(v11 + 1032), *(unsigned __int16 *)(v11 + 680), a7, a8);
    if (v86)
      v127 = 1;
    else
      v127 = mDNS_LoggingEnabled == 0;
    if (!v127)
    {
      v128 = mDNSLogCategory_Default;
      DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
      LogMsgWithLevel(v128, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: putQuestion NULL for %##s (%s)", v129, v130, v131, v132, v133, v11 + 80);
      v86 = 0;
    }
    goto LABEL_143;
  }
  if (v18 == 4)
    goto LABEL_131;
  if (v18 == 2)
  {
    if (*a3 != 240 && *(_WORD *)(v8 + 342) == 12 && *((_WORD *)a3 + 2) == 12 && *((_WORD *)a3 + 3) == 1)
    {
      *(_DWORD *)(v11 + 1036) = 3;
      goto LABEL_17;
    }
    *(_DWORD *)(v11 + 1036) = 4;
    goto LABEL_131;
  }
  if (!v18 && *a3 == 240 && *(_WORD *)(v8 + 342) == 28 && *((_WORD *)a3 + 2) == 28 && *((_WORD *)a3 + 3) == 1)
  {
    mDNS_StopQuery((unsigned int *)a1, v8);
    *(_DWORD *)(v11 + 1036) = 1;
    *(_WORD *)(v8 + 342) = 1;
    mDNS_StartQuery((unsigned int *)a1, v8);
    return;
  }
LABEL_17:
  v155 = v8;
  __src = (_BYTE *)(v11 + 712);
  v19 = (unsigned __int8 *)(v11 + 80);
  v20 = v11 + 968;
  v21 = *(uint64_t **)(v11 + 1056);
  v22 = *(_QWORD *)(v11 + 1040);
  v161 = (unsigned __int8 *)(v11 + 80);
  while (2)
  {
    v170 = *v21;
    v171 = *((_DWORD *)v21 + 2);
    v172 = 0;
    mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"AddResourceRecord", 305);
    v162 = dword_100158E08;
    mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"AddResourceRecord", 307);
    if (*(_BYTE *)(v11 + 48))
    {
      v28 = *(_WORD *)(v11 + 1048);
LABEL_21:
      v29 = v28;
      goto LABEL_22;
    }
    v29 = *(_WORD *)(v11 + 68);
    v28 = *(_WORD *)(v11 + 1048);
    if ((unsigned __int16)(v29 - 1) >= v28)
      goto LABEL_21;
LABEL_22:
    v163 = *(_QWORD *)(v11 + 1056) + v29 + 12;
    if (mDNS_LoggingEnabled == 1)
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Limit is %d", v23, v24, v25, v26, v27, v163 - *(_DWORD *)(v11 + 1040));
    v30 = CacheGroupForName((uint64_t)mDNSStorage, *(_DWORD *)(v11 + 536), __src);
    if (!v30)
    {
      if (mDNS_LoggingEnabled == 1)
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: CacheGroup not found for %##s", v31, v32, v33, v34, v35, (int)__src);
      v48 = 0;
      v85 = 0;
      goto LABEL_95;
    }
    v158 = v21;
    v159 = v22;
    v36 = v30[2];
    if (!v36)
    {
LABEL_81:
      if (mDNS_LoggingEnabled == 1)
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Did not find any valid ResourceRecords", v31, v32, v33, v34, v35, v154);
      v48 = 0;
      v85 = 0;
      goto LABEL_94;
    }
    v37 = 0;
    v38 = 0;
    v39 = 12;
    while (1)
    {
      v40 = (unsigned __int8 *)(v36 + 8);
      if (!SameNameRecordAnswersQuestion((unsigned __int8 *)(v36 + 8), 0, v11 + 336, v31, v32, v33, v34, v35))
        goto LABEL_66;
      v41 = *(_WORD **)(v11 + 1056);
      if (!v41[2])
        break;
      if (!v38)
        v38 = *(_QWORD *)(v11 + 1040);
LABEL_44:
      if (*v40 == 240)
      {
        v49 = 0;
      }
      else
      {
        v186 = 0u;
        memset(v187, 0, sizeof(v187));
        v184 = 0u;
        v185 = 0u;
        v182 = 0u;
        v183 = 0u;
        v180 = 0u;
        v181 = 0u;
        v178 = 0u;
        v179 = 0u;
        v176 = 0u;
        v177 = 0u;
        v174 = 0u;
        v175 = 0u;
        memset(v173, 0, sizeof(v173));
        v168 = 0u;
        v169 = 0u;
        v50 = *(_QWORD *)(v11 + 1064);
        v51 = *(unsigned __int8 *)(v50 + 76);
        v52 = v50 + 24;
        if (v51)
          v53 = v52;
        else
          v53 = 0;
        v54 = (unsigned __int8 *)(v36 + 8);
        v166 = 0uLL;
        v167 = 0uLL;
        if (v51)
        {
          v54 = (unsigned __int8 *)(v36 + 8);
          if (*(_DWORD *)(v11 + 1036) == 1)
          {
            v54 = (unsigned __int8 *)(v36 + 8);
            if (*(_WORD *)(v36 + 12) == 1)
            {
              v164 = 0uLL;
              v55 = *(_OWORD *)(v36 + 24);
              v166 = *(_OWORD *)v40;
              v167 = v55;
              v56 = *(_OWORD *)(v36 + 56);
              *(_QWORD *)&v168 = *(_QWORD *)(v36 + 40);
              v169 = v56;
              WORD2(v166) = 28;
              WORD6(v166) = 16;
              LOWORD(v173[0]) = 16;
              *((_QWORD *)&v168 + 1) = v173;
              v165 = *(_DWORD *)(*(_QWORD *)(v36 + 48) + 4);
              if (!nw_nat64_synthesize_v6(v53, &v165, &v164))
                goto LABEL_66;
              *(_OWORD *)((char *)v173 + 4) = v164;
              v54 = (unsigned __int8 *)&v166;
            }
          }
        }
        if (mDNS_LoggingEnabled == 1)
        {
          v57 = mDNSLogCategory_Default;
          GetRRDisplayString_rdb(v54, (unsigned __int16 *)(*((_QWORD *)v54 + 5) + 4), word_100164580);
          v20 = v11 + 968;
          LogMsgWithLevel(v57, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Answering question with %s", v58, v59, v60, v61, v62, (int)word_100164580);
        }
        v63 = -274877907 * (v162 - *(_DWORD *)(v36 + 80));
        v64 = PutResourceRecordTTLWithLimit(*(_QWORD *)(v11 + 1056), v38, (_WORD *)(*(_QWORD *)(v11 + 1056) + 6), (uint64_t)v54, (v63 >> 38) + ((unint64_t)v63 >> 63) + *(_DWORD *)(v36 + 16), v163, v34, v35);
        v48 = *(_BYTE **)(v11 + 1040);
        if (!v64)
          goto LABEL_93;
        v38 = v64;
        v39 += v64 - (_DWORD)v48;
        *(_QWORD *)(v11 + 1040) = v64;
        v49 = *(unsigned __int16 *)(v36 + 12) == 5;
      }
      if (*(_QWORD *)(v36 + 120))
      {
        v37 = *(_QWORD *)(v36 + 120);
        if (mDNS_LoggingEnabled == 1)
        {
          v65 = mDNSLogCategory_Default;
          GetRRDisplayString_rdb((unsigned __int8 *)(v36 + 8), (unsigned __int16 *)(*(_QWORD *)(v36 + 48) + 4), word_100164580);
          LogMsgWithLevel(v65, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: soa set for %s", v66, v67, v68, v69, v70, (int)word_100164580);
          v37 = *(_QWORD *)(v36 + 120);
        }
      }
      v71 = *(unsigned __int16 *)(v36 + 12);
      if (*(unsigned __int16 *)(v11 + 678) != v71 && v71 == 5 && mDNS_LoggingEnabled)
      {
        v72 = mDNSLogCategory_Default;
        GetRRDisplayString_rdb((unsigned __int8 *)(v36 + 8), (unsigned __int16 *)(*(_QWORD *)(v36 + 48) + 4), word_100164580);
        v20 = v11 + 968;
        LogMsgWithLevel(v72, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: cname set for %s", v73, v74, v75, v76, v77, (int)word_100164580);
      }
      if (v49)
      {
LABEL_67:
        if (v37)
        {
          v19 = (unsigned __int8 *)(v11 + 80);
          if (mDNS_LoggingEnabled == 1)
          {
            v78 = mDNSLogCategory_Default;
            GetRRDisplayString_rdb((unsigned __int8 *)(v37 + 8), (unsigned __int16 *)(*(_QWORD *)(v37 + 48) + 4), word_100164580);
            LogMsgWithLevel(v78, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: SOA Answering question with %s", v79, v80, v81, v82, v83, (int)word_100164580);
          }
          v84 = PutResourceRecordTTLWithLimit(*(_QWORD *)(v11 + 1056), v38, (_WORD *)(*(_QWORD *)(v11 + 1056) + 8), v37 + 8, *(unsigned int *)(v37 + 16), v163, v34, v35);
          v48 = *(_BYTE **)(v11 + 1040);
          if (v84)
          {
            v38 = v84;
            v39 += v84 - (_DWORD)v48;
            *(_QWORD *)(v11 + 1040) = v84;
            goto LABEL_76;
          }
LABEL_91:
          v85 = 1;
          goto LABEL_94;
        }
        v19 = (unsigned __int8 *)(v11 + 80);
        if (!v38)
          goto LABEL_81;
LABEL_76:
        if (v157 && *(_WORD *)(v11 + 68))
        {
          v86 = (_BYTE *)(v38 + 11);
          if (v38 + 11 <= v163)
          {
            ++*(_WORD *)(*(_QWORD *)(v11 + 1056) + 10);
            *(_QWORD *)v38 = 271122432;
            *(_DWORD *)(v38 + 7) = 0;
            v87 = "AddEDNS0 option added to response";
            v22 = v159;
            if (mDNS_LoggingEnabled == 1)
              goto LABEL_85;
          }
          else
          {
            if ((mDNS_LoggingEnabled & 1) == 0)
            {
              v48 = *(_BYTE **)(v11 + 1040);
              goto LABEL_91;
            }
            v86 = 0;
            v87 = "AddEDNS0Option: not enough space";
            v22 = v159;
LABEL_85:
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, v87, v31, v32, v33, v34, v35, v154);
          }
          v48 = *(_BYTE **)(v11 + 1040);
          if (!v86)
          {
            v85 = 1;
            v21 = v158;
            goto LABEL_95;
          }
          v39 += (_DWORD)v86 - (_DWORD)v48;
          *(_QWORD *)(v11 + 1040) = v86;
        }
        else
        {
          v86 = (_BYTE *)v38;
        }
        v8 = v155;
        if (mDNS_LoggingEnabled == 1)
          LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Added %d bytes to the packet", v31, v32, v33, v34, v35, v39);
        goto LABEL_142;
      }
LABEL_66:
      v36 = *(_QWORD *)v36;
      if (!v36)
        goto LABEL_67;
    }
    v42 = *(_WORD *)(v36 + 110) & 0xFE | *(_BYTE *)(v11 + 50) & 1 | ((*(_BYTE *)(v11 + 51) & 0x10 | HIBYTE(*(unsigned __int16 *)(v36 + 110)) & 0xFFFFFFEF) << 8);
    *v41 = *(_WORD *)(v11 + 30);
    v41[1] = v42;
    *(_QWORD *)(v41 + 2) = 0;
    v43 = putQuestion(*(_QWORD *)(v11 + 1056), *(_QWORD *)(v11 + 1056) + 12, v163, v161, *(unsigned __int16 *)(v11 + 1032), *(unsigned __int16 *)(v11 + 680), v34, v35);
    if (v43)
    {
      v38 = (unint64_t)v43;
      v39 += (_DWORD)v43 - *(_DWORD *)(v11 + 1040);
      *(_QWORD *)(v11 + 1040) = v43;
      if (*(_DWORD *)(v11 + 1036) == 3)
      {
        v186 = 0u;
        memset(v187, 0, sizeof(v187));
        v184 = 0u;
        v185 = 0u;
        v182 = 0u;
        v183 = 0u;
        v180 = 0u;
        v181 = 0u;
        v178 = 0u;
        v179 = 0u;
        v176 = 0u;
        v177 = 0u;
        v174 = 0u;
        v175 = 0u;
        memset(v173, 0, sizeof(v173));
        v169 = 0u;
        v166 = 0u;
        v167 = 0u;
        LOBYTE(v166) = -64;
        DWORD1(v166) = 65541;
        v44 = (_BYTE *)(v11 + 712);
        v168 = (unint64_t)v161;
        if (v20)
        {
LABEL_34:
          if ((unint64_t)v44 < v20)
            goto LABEL_35;
        }
        else
        {
LABEL_35:
          while (v44)
          {
            v45 = *v44;
            if (v45 > 0x3F)
              break;
            if (!*v44)
            {
              v46 = (_WORD)v44 - (_WORD)__src + 1;
              if (v46 <= 0x100u)
                memcpy((char *)v173 + 4, __src, v46);
              break;
            }
            v44 += v45 + 1;
            if (v20)
              goto LABEL_34;
          }
        }
        LOWORD(v173[0]) = 264;
        *((_QWORD *)&v168 + 1) = v173;
        v47 = PutResourceRecordTTLWithLimit(*(_QWORD *)(v11 + 1056), v38, (_WORD *)(*(_QWORD *)(v11 + 1056) + 6), (uint64_t)&v166, 0, v163, v34, v35);
        v48 = *(_BYTE **)(v11 + 1040);
        if (!v47)
          goto LABEL_93;
        v38 = v47;
        v39 += v47 - (_DWORD)v48;
        *(_QWORD *)(v11 + 1040) = v47;
      }
      goto LABEL_44;
    }
    if (mDNS_LoggingEnabled == 1)
    {
      v88 = mDNSLogCategory_Default;
      v19 = (unsigned __int8 *)(v11 + 80);
      DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
      LogMsgWithLevel(v88, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: putQuestion NULL for %##s (%s)", v89, v90, v91, v92, v93, (int)v161);
      v48 = 0;
      goto LABEL_91;
    }
    v48 = 0;
LABEL_93:
    v85 = 1;
    v19 = (unsigned __int8 *)(v11 + 80);
LABEL_94:
    v21 = v158;
    v22 = v159;
LABEL_95:
    if (*(_BYTE *)(v11 + 48))
    {
      v94 = 8940;
    }
    else
    {
      v95 = *(unsigned __int16 *)(v11 + 68);
      if (*(_WORD *)(v11 + 68))
      {
        if (v95 - 12 >= 0x22EC)
          v96 = 8940;
        else
          v96 = (unsigned __int16)(v95 - 12);
        if (v95 <= 0xC)
          v94 = 500;
        else
          v94 = v96;
      }
      else
      {
        v94 = 500;
      }
    }
    if (*(unsigned __int16 *)(v11 + 1048) < v94)
    {
      if (mDNS_LoggingEnabled == 1)
      {
        v97 = mDNSLogCategory_Default;
        DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
        LogMsgWithLevel(v97, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: Increase omsg buffer size to %d for %##s (%s)", v98, v99, v100, v101, v102, v94);
      }
      v103 = v22 - (_QWORD)v21 - 12;
      DNSProxyPrepareOmsg(v94, v11);
      v104 = *(_QWORD *)(v11 + 1056);
      *(_QWORD *)v104 = v170;
      *(_DWORD *)(v104 + 8) = v171;
      v21 = *(uint64_t **)(v11 + 1056);
      v22 = (uint64_t)v21 + v103 + 12;
      *(_QWORD *)(v11 + 1040) = v22;
      continue;
    }
    break;
  }
  if (mDNS_LoggingEnabled == 1)
  {
    v105 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
    LogMsgWithLevel(v105, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: AddResourceRecord NULL for %##s (%s)", v106, v107, v108, v109, v110, (int)v19);
  }
  if (v48)
    v111 = v85;
  else
    v111 = 0;
  v8 = v155;
  if (v111 == 1)
  {
    if (*(_BYTE *)(v11 + 48))
    {
      if (mDNS_LoggingEnabled == 1)
      {
        v112 = mDNSLogCategory_Default;
        DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
        LogMsgWithLevel(v112, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: ERROR!! Not enough space to return in TCP for %##s (%s)", v113, v114, v115, v116, v117, (int)v19);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(v11 + 1056) + 2) |= 2u;
    }
    v86 = v48;
    goto LABEL_142;
  }
  if (mDNS_LoggingEnabled == 1)
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: No response", v31, v32, v33, v34, v35, v154);
  v118 = *(_WORD *)(v11 + 682);
  if (!v118)
    v118 = 640;
  v119 = *(_QWORD *)(v11 + 1056);
  *(_WORD *)v119 = *(_WORD *)(v11 + 30);
  *(_WORD *)(v119 + 2) = v118;
  *(_QWORD *)(v119 + 4) = 0;
  v86 = putQuestion(*(_QWORD *)(v11 + 1056), *(_QWORD *)(v11 + 1056) + 12, *(_QWORD *)(v11 + 1056) + 12 + *(unsigned __int16 *)(v11 + 1048), v19, *(unsigned __int16 *)(v11 + 1032), *(unsigned __int16 *)(v11 + 680), v34, v35);
  if (v86)
  {
LABEL_142:
    if (!v157)
    {
      if (mDNS_LoggingEnabled == 1)
      {
        v148 = mDNSLogCategory_Default;
        GetRRDisplayString_rdb(a3, (unsigned __int16 *)(*((_QWORD *)a3 + 5) + 4), (_BYTE *)(a1 + 47032));
        LogMsgWithLevel(v148, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: Received %s, not answering yet", v149, v150, v151, v152, v153, a1 + 47032);
      }
      return;
    }
LABEL_143:
    v134 = *(_QWORD *)(v11 + 1056);
    v135 = *(_QWORD *)(v11 + 32);
    v136 = *(unsigned __int16 **)(v11 + 40);
    v137 = (int *)(v11 + 8);
    v138 = *(_WORD *)(v11 + 28);
    if (*(_BYTE *)(v11 + 48))
      mDNSSendDNSMessage(a1, v134, (unint64_t)v86, v135, v136, 0, v137, v138, 0, 0);
    else
      mDNSSendDNSMessage(a1, v134, (unint64_t)v86, v135, 0, v136, v137, v138, 0, 0);
    goto LABEL_146;
  }
  if (mDNS_LoggingEnabled == 1)
  {
    v120 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
    LogMsgWithLevel(v120, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: putQuestion NULL for %##s (%s)", v121, v122, v123, v124, v125, (int)v19);
  }
LABEL_146:
  mDNS_StopQuery((unsigned int *)a1, v8);
  v139 = &DNSProxyClients;
  do
  {
    v140 = v139;
    v139 = (uint64_t *)*v139;
    if (v139)
      v141 = v139 == (uint64_t *)v11;
    else
      v141 = 1;
  }
  while (!v141);
  if (v139)
  {
    *v140 = *(_QWORD *)v11;
    mDNSPlatformDisposeProxyContext(*(_DWORD **)(v11 + 72));
    FreeDNSProxyClient((_QWORD *)v11);
  }
  else
  {
    v142 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v8 + 342));
    LogMsgWithLevel(v142, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: question %##s (%s) not found", v143, v144, v145, v146, v147, v8 + 376);
  }
}

void dnssec_query_record_result_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v4;
  _BYTE *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  _QWORD *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  unsigned __int16 v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  unsigned __int16 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  int v42;
  int v43;
  int actual_ttl;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  const char *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint32_t v63;
  uint64_t v64;
  unsigned int v69;
  uint64_t v70;
  int v71;
  int v72;
  _BOOL4 v73;
  _BOOL4 v74;
  _BOOL4 v75;
  int v76;
  _BOOL4 v77;
  int v78;
  int v79;
  NSObject *log;
  int loga;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t, unsigned __int8 *, uint64_t);
  int v84;
  uint8_t buf[4];
  _BYTE v86[20];
  _BYTE v87[10];
  _BYTE v88[6];
  uint64_t v89;
  _BOOL4 v90;
  __int16 v91;
  _BOOL4 v92;
  __int16 v93;
  int v94;
  __int16 v95;
  int v96;
  __int16 v97;
  int v98;
  __int16 v99;
  int v100;
  __int16 v101;
  int v102;
  __int16 v103;
  int v104;

  v4 = *(_QWORD *)(a2 + 144);
  if (!v4 || !*(_BYTE *)(v4 + 24))
  {
    v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        return;
    }
    else
    {
      v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        return;
    }
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v86 = "dns_question_is_primary_dnssec_requestor(question)";
    *(_WORD *)&v86[8] = 2082;
    *(_QWORD *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(_QWORD *)v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)v88 = 145;
    *(_WORD *)&v88[4] = 2048;
    v89 = 0;
    v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }
  if (a4 > 1)
    return;
  v7 = &unk_100164000;
  v8 = &unk_100158000;
  v9 = &unk_100164000;
  if (!*((_QWORD *)a3 + 7))
  {
    v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        return;
    }
    else
    {
      v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        return;
    }
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v86 = "answer->dnssec != NULL";
    *(_WORD *)&v86[8] = 2082;
    *(_QWORD *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(_QWORD *)v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)v88 = 155;
    *(_WORD *)&v88[4] = 2048;
    v89 = 0;
    v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }
  v11 = *(_QWORD *)(v4 + 16);
  v12 = *(_QWORD *)(v11 + 64);
  if (*(_QWORD *)(v12 + 96) == a2)
  {
    v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        return;
    }
    else
    {
      v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        return;
    }
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v86 = "!_is_insecure_validation_question(dnssec_context, question)";
    *(_WORD *)&v86[8] = 2082;
    *(_QWORD *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(_QWORD *)v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)v88 = 156;
    *(_WORD *)&v88[4] = 2048;
    v89 = 0;
    v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }
  v13 = a1;
  v83 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *, uint64_t))(v11 + 40);
  v84 = *(unsigned __int8 *)(v11 + 36);
  v14 = *(_DWORD **)(a1 + 20000);
  v15 = *(_QWORD **)(v11 + 56);
  if (v15 != (_QWORD *)v14)
  {
    if (v14)
      ++*v14;
    if (v15)
    {
      ref_count_obj_release(v15);
      v12 = *(_QWORD *)(v11 + 64);
    }
    *(_QWORD *)(v11 + 56) = v14;
  }
  *(_WORD *)(v12 + 24) = bswap32(*(unsigned __int16 *)(*(_QWORD *)(v11 + 24) + 340)) >> 16;
  v16 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
    {
      v22 = *((_QWORD *)a3 + 4);
      if (v22)
      {
        v23 = (_BYTE *)*((_QWORD *)a3 + 4);
        if (v22 == -256)
          goto LABEL_31;
LABEL_28:
        v24 = 257;
        if ((unint64_t)v23 < v22 + 256 && v23)
        {
          while (1)
          {
            v25 = *v23;
            if (v25 > 0x3F)
            {
LABEL_39:
              v24 = 257;
              goto LABEL_55;
            }
            if (!*v23)
              break;
            v23 += v25 + 1;
            if (v22 != -256)
              goto LABEL_28;
LABEL_31:
            if (!v23)
              goto LABEL_39;
          }
          v24 = (_WORD)v23 - v22 + 1;
        }
LABEL_55:
        v72 = v24;
      }
      else
      {
        v72 = 0;
      }
      v77 = *a3 != 240;
      v36 = *((_QWORD *)a3 + 7);
      if (v36)
      {
        if (*(_DWORD *)(v36 + 32) || *(_BYTE *)(v36 + 40))
          v37 = 0;
        else
          v37 = *(_QWORD *)(v36 + 48);
        v75 = v37 != 0;
      }
      else
      {
        v75 = 0;
      }
      v38 = bswap32(*(unsigned __int16 *)(a2 + 340));
      v39 = *((_QWORD *)a3 + 3);
      v40 = v39 + 5;
      v82 = v13;
      if ((unint64_t)(v39 + 5) < 6 && ((0x2Du >> v40) & 1) != 0)
        LODWORD(v39) = dword_1001008B0[v40];
      v41 = HIWORD(v38);
      v42 = *(unsigned __int16 *)(a2 + 342);
      v43 = *((unsigned __int16 *)a3 + 2);
      v79 = a3[2];
      loga = *((_DWORD *)a3 + 2);
      actual_ttl = resource_record_get_actual_ttl(v82, (uint64_t)a3);
      v45 = *((_QWORD *)a3 + 7);
      if (v45)
        LODWORD(v45) = *(_DWORD *)(v45 + 32) == 1;
      *(_DWORD *)buf = 67112451;
      *(_DWORD *)v86 = v41;
      *(_WORD *)&v86[4] = 2160;
      *(_QWORD *)&v86[6] = 1752392040;
      *(_WORD *)&v86[14] = 1040;
      *(_DWORD *)&v86[16] = v72;
      *(_WORD *)v87 = 2101;
      *(_QWORD *)&v87[2] = v22;
      *(_WORD *)v88 = 1024;
      *(_DWORD *)&v88[2] = v42;
      LOWORD(v89) = 1024;
      *(_DWORD *)((char *)&v89 + 2) = v43;
      HIWORD(v89) = 1024;
      v90 = v77;
      v91 = 1024;
      v92 = v75;
      v93 = 1024;
      v94 = a4;
      v95 = 1024;
      v96 = v39;
      v97 = 1024;
      v98 = v79;
      v99 = 1024;
      v100 = loga;
      v101 = 1024;
      v102 = actual_ttl;
      v103 = 1024;
      v104 = v45;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[Q%u] DNSSEC record changes - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rrtype: %{mdns:rrtype}d, %{mdns:pos/neg}d, contains denial: %{mdns:yesno}d, %{mdns:addrmv}d, interface index: %d, motality: %{mdns:mortality}d, original ttl: %u, actual ttl: %u, validated: %{mdns:yesno}d.", buf, 0x5Eu);
      v9 = &unk_100164000;
      v8 = &unk_100158000;
      v7 = &unk_100164000;
      v13 = v82;
    }
  }
  else
  {
    v17 = mDNSLogCategory_DNSSEC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
    {
      v18 = *((_QWORD *)a3 + 4);
      if (v18)
      {
        v19 = (_BYTE *)*((_QWORD *)a3 + 4);
        if (v18 == -256)
          goto LABEL_20;
LABEL_17:
        v20 = 257;
        if ((unint64_t)v19 < v18 + 256 && v19)
        {
          while (1)
          {
            v21 = *v19;
            if (v21 > 0x3F)
            {
LABEL_38:
              v20 = 257;
              goto LABEL_41;
            }
            if (!*v19)
              break;
            v19 += v21 + 1;
            if (v18 != -256)
              goto LABEL_17;
LABEL_20:
            if (!v19)
              goto LABEL_38;
          }
          v20 = (_WORD)v19 - v18 + 1;
        }
LABEL_41:
        v71 = v20;
      }
      else
      {
        v71 = 0;
      }
      v74 = *a3 != 240;
      v26 = *((_QWORD *)a3 + 7);
      if (v26)
      {
        if (*(_DWORD *)(v26 + 32) || *(_BYTE *)(v26 + 40))
          v27 = 0;
        else
          v27 = *(_QWORD *)(v26 + 48);
        v73 = v27 != 0;
      }
      else
      {
        v73 = 0;
      }
      v28 = bswap32(*(unsigned __int16 *)(a2 + 340));
      v29 = *((_QWORD *)a3 + 3);
      v30 = v29 + 5;
      log = v17;
      if ((unint64_t)(v29 + 5) < 6 && ((0x2Du >> v30) & 1) != 0)
        LODWORD(v29) = dword_1001008C8[v30];
      v31 = HIWORD(v28);
      v32 = *(unsigned __int16 *)(a2 + 342);
      v33 = *((unsigned __int16 *)a3 + 2);
      v76 = a3[2];
      v78 = *((_DWORD *)a3 + 2);
      v34 = resource_record_get_actual_ttl(v13, (uint64_t)a3);
      v35 = *((_QWORD *)a3 + 7);
      if (v35)
        LODWORD(v35) = *(_DWORD *)(v35 + 32) == 1;
      *(_DWORD *)buf = 67112451;
      *(_DWORD *)v86 = v31;
      *(_WORD *)&v86[4] = 2160;
      *(_QWORD *)&v86[6] = 1752392040;
      *(_WORD *)&v86[14] = 1040;
      *(_DWORD *)&v86[16] = v71;
      *(_WORD *)v87 = 2101;
      *(_QWORD *)&v87[2] = v18;
      *(_WORD *)v88 = 1024;
      *(_DWORD *)&v88[2] = v32;
      LOWORD(v89) = 1024;
      *(_DWORD *)((char *)&v89 + 2) = v33;
      HIWORD(v89) = 1024;
      v90 = v74;
      v91 = 1024;
      v92 = v73;
      v93 = 1024;
      v94 = a4;
      v95 = 1024;
      v96 = v29;
      v97 = 1024;
      v98 = v76;
      v99 = 1024;
      v100 = v78;
      v101 = 1024;
      v102 = v34;
      v103 = 1024;
      v104 = v35;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[Q%u] DNSSEC record changes - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rrtype: %{mdns:rrtype}d, %{mdns:pos/neg}d, contains denial: %{mdns:yesno}d, %{mdns:addrmv}d, interface index: %d, motality: %{mdns:mortality}d, original ttl: %u, actual ttl: %u, validated: %{mdns:yesno}d.", buf, 0x5Eu);
      v9 = (_QWORD *)&unk_100164000;
      v8 = (_QWORD *)&unk_100158000;
      v7 = (_BYTE *)&unk_100164000;
    }
  }
  v46 = *((_QWORD *)a3 + 7);
  if (v46)
  {
    v47 = *(_DWORD *)(v46 + 32);
    if (v47)
    {
      if (v47 == 1 && (v84 || *a3 != 240 && (*((_WORD *)a3 + 2) != 5 || *(_WORD *)(a2 + 342) == 5)))
        v83(v13, a2, a3, a4);
      return;
    }
    v48 = *(_QWORD *)(v11 + 64);
    if ((_DWORD)a4 != 1)
    {
      dnssec_obj_validation_manager_remove_validated_cache(*(_QWORD *)(v11 + 64));
      v51 = *(_QWORD *)(v11 + 64);
      if (*a3 == 240)
        v52 = 40;
      else
        v52 = 32;
      v53 = *(_QWORD *)(v51 + v52);
      if (!v53)
        goto LABEL_140;
      v54 = dnssec_obj_rrset_remove_rr(v53, a3);
      if (!v54)
      {
        v55 = *(_QWORD **)(v51 + v52);
        if (!v55[4] && v55)
        {
          ref_count_obj_release(v55);
          *(_QWORD *)(v51 + v52) = 0;
        }
        *(_QWORD *)(v51 + 48) = 0xFFFFE5C200000000;
        *(_DWORD *)(v51 + 140) = 0;
        *(_BYTE *)(v51 + 144) = 0;
        if (*((_WORD *)a3 + 2) == 46)
          *(_BYTE *)(v51 + 72) = 1;
        goto LABEL_106;
      }
      if (v54 == -6727)
      {
LABEL_140:
        v58 = v8[403];
        if (v7[2416] != 1 || v58 == v9[296])
        {
          if (!os_log_type_enabled((os_log_t)v8[403], OS_LOG_TYPE_DEBUG))
            return;
        }
        else
        {
          v58 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
            return;
        }
        v69 = bswap32(*(unsigned __int16 *)(a2 + 340)) >> 16;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v86 = v69;
        v60 = "[Q%u] Added record not found due to possible primary DNSSEC question change";
        goto LABEL_110;
      }
      v70 = v54;
      v64 = v8[403];
      if (v7[2416] != 1 || v64 == v9[296])
      {
        if (!os_log_type_enabled((os_log_t)v8[403], OS_LOG_TYPE_FAULT))
          return;
      }
      else
      {
        v64 = mDNSLogCategory_DNSSEC_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
          return;
      }
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)v86 = "err == 0";
      *(_WORD *)&v86[8] = 2082;
      *(_QWORD *)&v86[10] = "";
      *(_WORD *)&v86[18] = 2082;
      *(_QWORD *)v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
      *(_WORD *)&v87[8] = 1024;
      *(_DWORD *)v88 = 207;
      *(_WORD *)&v88[4] = 2048;
      v89 = v70;
      v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
LABEL_138:
      v61 = v64;
      v62 = OS_LOG_TYPE_FAULT;
      v63 = 48;
      goto LABEL_111;
    }
    *(_DWORD *)buf = 0;
    v49 = 32;
    if (*a3 == 240)
      v49 = 40;
    v50 = *(_QWORD **)(v48 + v49);
    if (v50)
    {
      ++*(_DWORD *)v50;
    }
    else
    {
      v50 = dnssec_obj_rrset_create(*(_DWORD **)(v48 + 16), *(_DWORD *)(v48 + 136), buf);
      if (*(_DWORD *)buf)
      {
LABEL_100:
        ref_count_obj_release(v50);
        v57 = *(int *)buf;
        if (*(_DWORD *)buf == -6730)
        {
          v58 = v8[403];
          if (v7[2416] != 1 || v58 == v9[296])
          {
            if (!os_log_type_enabled((os_log_t)v8[403], OS_LOG_TYPE_DEBUG))
              return;
          }
          else
          {
            v58 = mDNSLogCategory_DNSSEC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
              return;
          }
          v59 = bswap32(*(unsigned __int16 *)(a2 + 340)) >> 16;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v86 = v59;
          v60 = "[Q%u] Getting duplicate record add event due to possible primary DNSSEC question change";
LABEL_110:
          v61 = v58;
          v62 = OS_LOG_TYPE_DEBUG;
          v63 = 8;
LABEL_111:
          _os_log_impl((void *)&_mh_execute_header, v61, v62, v60, buf, v63);
          return;
        }
        if (!*(_DWORD *)buf)
        {
LABEL_106:
          _dnssec_fetch_key_records(v11);
          _dnssec_make_validation_progress(*(_QWORD *)(v11 + 64));
          _dnssec_fetch_key_records(v11);
          return;
        }
        v64 = v8[403];
        if (v7[2416] != 1 || v64 == v9[296])
        {
          if (!os_log_type_enabled((os_log_t)v8[403], OS_LOG_TYPE_FAULT))
            return;
        }
        else
        {
          v64 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
            return;
        }
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)v86 = "err == 0";
        *(_WORD *)&v86[8] = 2082;
        *(_QWORD *)&v86[10] = "";
        *(_WORD *)&v86[18] = 2082;
        *(_QWORD *)v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
        *(_WORD *)&v87[8] = 1024;
        *(_DWORD *)v88 = 193;
        *(_WORD *)&v88[4] = 2048;
        v89 = v57;
        v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
        goto LABEL_138;
      }
    }
    *(_DWORD *)buf = dnssec_obj_rrset_add_rr((uint64_t)v50, a3);
    if (!*(_DWORD *)buf)
    {
      if (*a3 == 240)
        v56 = (_QWORD *)(v48 + 40);
      else
        v56 = (_QWORD *)(v48 + 32);
      if (!*v56)
      {
        *v56 = v50;
        ++*(_DWORD *)v50;
      }
      *(_QWORD *)(v48 + 48) = 0xFFFFE5C200000000;
      *(_DWORD *)(v48 + 140) = 0;
      *(_BYTE *)(v48 + 144) = 0;
      *(_DWORD *)buf = 0;
    }
    goto LABEL_100;
  }
}

void _dnssec_fetch_key_records(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int rr_class;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  int v18;
  char v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  size_t v38;
  _QWORD *v39;
  uint64_t v40;
  _DWORD *v41;
  int v42;
  _DWORD *started;
  _DWORD *v44;
  NSObject *v45;
  int v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  _BYTE v60[14];
  __int16 v61;
  _BYTE v62[20];
  int v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  int v67;

  v1 = *(_QWORD *)(a1 + 64);
  if (!*(_DWORD *)(v1 + 48))
  {
    if (dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40)))
    {
      if (!*(_DWORD *)(v1 + 112))
        dnssec_obj_validation_manager_start_insecure_validation(v1, a1);
      return;
    }
    v55 = 0;
    if (!*(_QWORD *)(v1 + 56) || *(_BYTE *)(v1 + 72))
    {
      *(_DWORD *)buf = 0;
      v3 = *(_QWORD *)(v1 + 32);
      if (v3 && *(_DWORD *)(v3 + 40) != 3 && *(_QWORD *)(v3 + 32))
      {
        v4 = dnssec_obj_rrset_copy_signer_name(v3, (int *)buf);
        v5 = *(_DWORD *)buf;
        if (*(_DWORD *)buf && *(_DWORD *)buf != -6727)
        {
          v6 = 0;
          v7 = 0;
LABEL_27:
          v55 = v5;
          if (v4)
            ref_count_obj_release(v4);
          if (v7)
            ref_count_obj_release(v7);
          v9 = v55;
          if (v55)
          {
            v17 = 0;
            goto LABEL_115;
          }
          v10 = *(_QWORD *)(v1 + 32);
          if (!v10)
            goto LABEL_40;
          if (dnssec_obj_rrset_get_rr_type(v10) == 43
            && !ref_count_obj_compare(*(_QWORD *)(v1 + 16), v6, 1))
          {
            goto LABEL_133;
          }
          v11 = *(_QWORD *)(v1 + 32);
          if (v11)
          {
            if (dnssec_obj_rrset_is_dnskey(v11))
              v12 = 43;
            else
              v12 = 48;
            rr_class = dnssec_obj_rrset_get_rr_class(*(_QWORD *)(v1 + 32));
          }
          else
          {
LABEL_40:
            v14 = *(_QWORD *)(v1 + 40);
            if (!v14)
            {
              v17 = 0;
              v9 = -6745;
              goto LABEL_110;
            }
            rr_class = dnssec_obj_rrset_get_rr_class(v14);
            v12 = 48;
          }
          v15 = *(_QWORD *)(v1 + 56);
          if (!v15 || !*(_BYTE *)(v1 + 72))
          {
            v17 = 0;
            goto LABEL_75;
          }
          if (*(unsigned __int16 *)(v15 + 342) != v12 || *(unsigned __int16 *)(v15 + 344) != rr_class)
          {
            v17 = 0;
            v9 = -6700;
            goto LABEL_110;
          }
          v16 = dnssec_obj_domain_name_create_with_labels((unsigned __int8 *)(v15 + 376), 0, &v55);
          v17 = v16;
          v9 = v55;
          if (v55)
          {
LABEL_115:
            *(_DWORD *)(v1 + 48) = 3;
            *(_DWORD *)(v1 + 52) = v9;
LABEL_116:
            if (!v6)
              goto LABEL_118;
            goto LABEL_117;
          }
          *(_BYTE *)(v1 + 72) = 0;
          v18 = ref_count_obj_compare((uint64_t)v16, v6, 1);
          v19 = gSensitiveLoggingEnabled;
          v20 = mDNSLogCategory_DNSSEC;
          if (mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
            v19 = 0;
          if (!v18)
          {
            if ((v19 & 1) != 0)
            {
              v23 = mDNSLogCategory_DNSSEC_redacted;
              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                goto LABEL_125;
              v24 = *(unsigned __int16 *)(v1 + 24);
              if (v17)
              {
                v25 = *((_DWORD *)v17 + 6);
                v26 = *((_QWORD *)v17 + 2);
              }
              else
              {
                v25 = 0;
                v26 = 0;
              }
              *(_DWORD *)buf = 67110147;
              v58 = v24;
              v59 = 2160;
              *(_QWORD *)v60 = 1752392040;
              *(_WORD *)&v60[8] = 1040;
              *(_DWORD *)&v60[10] = v25;
              v61 = 2101;
              *(_QWORD *)v62 = v26;
              *(_WORD *)&v62[8] = 1024;
              *(_DWORD *)&v62[10] = v12;
              v50 = v23;
            }
            else
            {
              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                goto LABEL_125;
              v27 = *(unsigned __int16 *)(v1 + 24);
              if (v17)
              {
                v28 = *((_DWORD *)v17 + 6);
                v29 = *((_QWORD *)v17 + 2);
              }
              else
              {
                v28 = 0;
                v29 = 0;
              }
              *(_DWORD *)buf = 67110147;
              v58 = v27;
              v59 = 2160;
              *(_QWORD *)v60 = 1752392040;
              *(_WORD *)&v60[8] = 1040;
              *(_DWORD *)&v60[10] = v28;
              v61 = 2101;
              *(_QWORD *)v62 = v29;
              *(_WORD *)&v62[8] = 1024;
              *(_DWORD *)&v62[10] = v12;
              v50 = v20;
            }
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[Q%u] The existing validation key requestor can still be reused - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d", buf, 0x28u);
LABEL_125:
            v55 = 0;
            if (!v6)
            {
LABEL_118:
              if (v17)
                ref_count_obj_release(v17);
              return;
            }
LABEL_117:
            ref_count_obj_release((_QWORD *)v6);
            goto LABEL_118;
          }
          if ((v19 & 1) != 0)
          {
            v20 = mDNSLogCategory_DNSSEC_redacted;
            if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
            {
              if (v6)
              {
                v21 = *(_DWORD *)(v6 + 24);
                v22 = *(_QWORD *)(v6 + 16);
              }
              else
              {
                v21 = 0;
                v22 = 0;
              }
              v30 = *(unsigned __int16 *)(v1 + 24);
              if (v17)
              {
                v31 = *((_DWORD *)v17 + 6);
                v32 = *((_QWORD *)v17 + 2);
              }
              else
              {
                v31 = 0;
                v32 = 0;
              }
LABEL_73:
              *(_DWORD *)buf = 67110915;
              v58 = v30;
              v59 = 2160;
              *(_QWORD *)v60 = 1752392040;
              *(_WORD *)&v60[8] = 1040;
              *(_DWORD *)&v60[10] = v21;
              v61 = 2101;
              *(_QWORD *)v62 = v22;
              *(_WORD *)&v62[8] = 2160;
              *(_QWORD *)&v62[10] = 1752392040;
              *(_WORD *)&v62[18] = 1040;
              v63 = v31;
              v64 = 2101;
              v65 = v32;
              v66 = 1024;
              v67 = v12;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[Q%u] New validation key requestor replaces the old one - new name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, old name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d", buf, 0x42u);
            }
          }
          else if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
          {
            if (v6)
            {
              v21 = *(_DWORD *)(v6 + 24);
              v22 = *(_QWORD *)(v6 + 16);
            }
            else
            {
              v21 = 0;
              v22 = 0;
            }
            v30 = *(unsigned __int16 *)(v1 + 24);
            if (v17)
            {
              v31 = *((_DWORD *)v17 + 6);
              v32 = *((_QWORD *)v17 + 2);
            }
            else
            {
              v31 = 0;
              v32 = 0;
            }
            goto LABEL_73;
          }
          _dnssec_obj_validation_manager_reset_validation_key_requestor(v1);
LABEL_75:
          if (v12 != 43)
            goto LABEL_99;
          v33 = **(unsigned __int8 **)(v6 + 16);
          v34 = *(_DWORD *)(a1 + 48);
          v35 = *(_QWORD **)(v1 + 120);
          if (!v35)
          {
            v36 = *(_QWORD *)(a1 + 56);
            if (v36)
            {
              *(_QWORD *)(v1 + 128) = 0;
              v37 = (_QWORD *)(v36 + 16);
              do
              {
                v37 = (_QWORD *)*v37;
                if (!v37)
                {
                  v35 = 0;
                  v42 = -6727;
LABEL_90:
                  v55 = v42;
                  *(_QWORD *)(v1 + 120) = v35;
                  *(_DWORD *)(v1 + 140) = 0;
                  *(_BYTE *)(v1 + 144) = 0;
                  goto LABEL_91;
                }
              }
              while (ref_count_obj_compare(*(_QWORD *)(*(_QWORD *)(v37[2] + 16) + 16), v6, 1));
              v38 = 0;
              v39 = v37;
              do
              {
                ++v38;
                v39 = (_QWORD *)v39[1];
              }
              while (v39);
              if (v38)
              {
                if (!(v38 >> 61))
                {
                  v35 = malloc_type_calloc(v38, 8uLL, 0xF1748037uLL);
                  if (v35)
                  {
                    v40 = *(_QWORD *)(v1 + 128);
                    do
                    {
                      v41 = (_DWORD *)v37[2];
                      v35[v40] = v41;
                      ++*v41;
                      ++v40;
                      v37 = (_QWORD *)v37[1];
                    }
                    while (v37);
                    v42 = 0;
                    *(_QWORD *)(v1 + 128) = v40;
                    goto LABEL_90;
                  }
                }
              }
              __break(1u);
LABEL_133:
              v51 = mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
                {
                  v52 = *(unsigned __int16 *)(v1 + 24);
                  if (v6)
                  {
                    v53 = *(_DWORD *)(v6 + 24);
                    v54 = *(_QWORD *)(v6 + 16);
                  }
                  else
                  {
                    v53 = 0;
                    v54 = 0;
                  }
                  goto LABEL_143;
                }
              }
              else
              {
                v51 = mDNSLogCategory_DNSSEC_redacted;
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
                {
                  v52 = *(unsigned __int16 *)(v1 + 24);
                  if (v6)
                  {
                    v53 = *(_DWORD *)(v6 + 24);
                    v54 = *(_QWORD *)(v6 + 16);
                  }
                  else
                  {
                    v53 = 0;
                    v54 = 0;
                  }
LABEL_143:
                  *(_DWORD *)buf = 67109891;
                  v58 = v52;
                  v59 = 2160;
                  *(_QWORD *)v60 = 1752392040;
                  *(_WORD *)&v60[8] = 1040;
                  *(_DWORD *)&v60[10] = v53;
                  v61 = 2101;
                  *(_QWORD *)v62 = v54;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "[Q%u] Unable to continue the trust chain validation since DS is self-signed - name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x22u);
                }
              }
              v17 = 0;
              v9 = -88993;
              goto LABEL_110;
            }
          }
LABEL_91:
          if (v34 == 1)
          {
            if (v35)
              goto LABEL_125;
          }
          else
          {
            if (v34)
            {
              v9 = -6735;
              goto LABEL_110;
            }
            if (v35)
            {
              if (*(_BYTE *)(v1 + 144))
              {
                if (!v33)
                {
LABEL_96:
                  v9 = -6754;
                  goto LABEL_110;
                }
LABEL_99:
                v56 = 0;
                if (*(_QWORD *)(v1 + 64))
                {
                  v9 = -6709;
                  goto LABEL_110;
                }
                started = _dnssec_obj_validation_manager_start_sub_query(v6, rr_class, v12, 0x200000, a1, (uint64_t)_dnssec_query_key_record_result_reply, &v56);
                *(_QWORD *)(v1 + 56) = started;
                v9 = v56;
                if (v56)
                {
LABEL_110:
                  v55 = v9;
                  goto LABEL_115;
                }
                v44 = started;
                v45 = mDNSLogCategory_DNSSEC;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                {
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                    goto LABEL_114;
                  v46 = *(unsigned __int16 *)(v1 + 24);
                  v47 = bswap32(*((unsigned __int16 *)v44 + 170)) >> 16;
                  if (v6)
                  {
                    v48 = *(_DWORD *)(v6 + 24);
                    v49 = *(_QWORD *)(v6 + 16);
                  }
                  else
                  {
                    v48 = 0;
                    v49 = 0;
                  }
                }
                else
                {
                  v45 = mDNSLogCategory_DNSSEC_redacted;
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                    goto LABEL_114;
                  v46 = *(unsigned __int16 *)(v1 + 24);
                  v47 = bswap32(*((unsigned __int16 *)v44 + 170)) >> 16;
                  if (v6)
                  {
                    v48 = *(_DWORD *)(v6 + 24);
                    v49 = *(_QWORD *)(v6 + 16);
                  }
                  else
                  {
                    v48 = 0;
                    v49 = 0;
                  }
                }
                *(_DWORD *)buf = 67110403;
                v58 = v46;
                v59 = 1024;
                *(_DWORD *)v60 = v47;
                *(_WORD *)&v60[4] = 2160;
                *(_QWORD *)&v60[6] = 1752392040;
                v61 = 1040;
                *(_DWORD *)v62 = v48;
                *(_WORD *)&v62[4] = 2101;
                *(_QWORD *)&v62[6] = v49;
                *(_WORD *)&v62[14] = 1024;
                *(_DWORD *)&v62[16] = v12;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Start to query validated key records to validate the RRSet - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d", buf, 0x2Eu);
LABEL_114:
                v9 = v56;
                v55 = v56;
                if (!v56)
                  goto LABEL_116;
                goto LABEL_115;
              }
              goto LABEL_125;
            }
          }
          if (!v33)
            goto LABEL_96;
          goto LABEL_99;
        }
      }
      else
      {
        v4 = 0;
      }
      v8 = *(_QWORD *)(v1 + 40);
      if (v8 && *(_DWORD *)(v8 + 40) != 3 && *(_QWORD *)(v8 + 32))
      {
        v7 = dnssec_obj_rrset_copy_signer_name(v8, (int *)buf);
        v5 = *(_DWORD *)buf;
        if (*(_DWORD *)buf && *(_DWORD *)buf != -6727)
        {
          v6 = 0;
          goto LABEL_27;
        }
      }
      else
      {
        v7 = 0;
      }
      if (v4)
        v6 = (uint64_t)v4;
      else
        v6 = (uint64_t)v7;
      if (v6)
      {
        v5 = 0;
        ++*(_DWORD *)v6;
        *(_DWORD *)buf = 0;
      }
      else
      {
        v5 = -6745;
        *(_DWORD *)buf = -6745;
      }
      goto LABEL_27;
    }
  }
}

void _dnssec_make_validation_progress(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  uint64_t *v6;
  int v7;
  _QWORD *v9;
  _QWORD *v10;
  _BOOL4 v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  unsigned int v26;
  size_t v27;
  size_t v28;
  _QWORD *v29;
  int v30;
  _QWORD *v31;
  _DWORD **v32;
  int v33;
  int v34;
  size_t v35;
  size_t v36;
  _QWORD *v37;
  uint64_t v38;
  int v39;
  int v41;
  unsigned __int8 *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 *v45;
  unsigned __int8 *v46;
  BOOL is_sub_domain_of;
  int v48;
  size_t v49;
  size_t v50;
  _QWORD *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  size_t v57;
  unsigned __int8 **v58;
  unsigned __int8 *v59;
  int v60;
  size_t v61;
  _DWORD **v62;
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t denial_of_existence;
  int v70;
  uint64_t v71;
  int v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  _QWORD *v77;
  uint64_t v78;
  _BYTE *v79;
  int v80;
  unint64_t v81;
  _BYTE *v82;
  int v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v86;
  int v87;
  _BYTE *v88;
  int v89;
  uint64_t v90;
  _BYTE *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  NSObject *v96;
  int v99;
  int v100;
  NSObject *v101;
  int v104;
  NSObject *v105;
  size_t v106;
  size_t v107;
  int v108;
  _BYTE buf[14];
  const char *v110;
  __int16 v111;
  const char *v112;
  __int16 v113;
  int v114;
  __int16 v115;
  uint64_t v116;

  if (*(_DWORD *)(a1 + 48))
    return;
  LODWORD(v106) = 0;
  *(_QWORD *)buf = 0;
  v107 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_DWORD *)(v2 + 40);
    if (v3 != 4 && v3 != 2)
      goto LABEL_21;
    v6 = (uint64_t *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 40);
    if (!v5)
    {
      if (!*(_DWORD *)(a1 + 112))
        goto LABEL_20;
LABEL_18:
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)(a1 + 88) != 0;
      goto LABEL_24;
    }
  }
  else
  {
    v6 = (uint64_t *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 40);
    if (!v5)
    {
LABEL_21:
      v9 = 0;
LABEL_22:
      v10 = 0;
LABEL_23:
      v11 = 0;
      goto LABEL_24;
    }
  }
  v7 = *(_DWORD *)(v5 + 40);
  if (v7 != 4 && v7 != 2)
    goto LABEL_21;
  if (*(_DWORD *)(a1 + 112))
    goto LABEL_18;
  if (!v2)
  {
LABEL_34:
    v15 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_35;
  }
LABEL_20:
  if (*(_DWORD *)(v2 + 44))
    goto LABEL_21;
  if (!dnssec_obj_rrset_is_dnskey(v2))
  {
    v19 = *(_QWORD *)(a1 + 56);
    if (!v19)
      goto LABEL_21;
    if (*(_WORD *)(v19 + 342) != 48)
      goto LABEL_21;
    v20 = *(_QWORD **)(a1 + 64);
    if (!v20 || !v20[4])
      goto LABEL_21;
    v9 = dnssec_obj_rrset_copy_dnskeys(v20, &v107, (int *)&v106);
    if ((_DWORD)v106)
      goto LABEL_22;
    v15 = v107;
    v10 = 0;
    if (!dnssec_obj_rrset_matches_dnskey_key_tag(*(_QWORD *)(a1 + 32), (uint64_t)v9, v107))
      goto LABEL_23;
LABEL_35:
    v16 = *v6;
    if (*v6)
    {
      v17 = *(_QWORD *)(a1 + 56);
      if (!v17)
        goto LABEL_23;
      if (*(_WORD *)(v17 + 342) != 48)
        goto LABEL_23;
      if (*(_DWORD *)(v16 + 44))
        goto LABEL_23;
      v18 = *(_QWORD *)(a1 + 64);
      if (!v18 || !*(_QWORD *)(v18 + 32))
        goto LABEL_23;
      if (!v9)
      {
        v9 = dnssec_obj_rrset_copy_dnskeys(*(_QWORD **)(a1 + 64), &v107, (int *)&v106);
        if ((_DWORD)v106)
          goto LABEL_23;
        v16 = *v6;
        v15 = v107;
      }
      if (!dnssec_obj_rrset_matches_dnskey_key_tag(v16, (uint64_t)v9, v15))
        goto LABEL_23;
    }
    v11 = 1;
LABEL_24:
    v12 = *(_QWORD *)buf;
    if (*(_QWORD *)buf)
      goto LABEL_25;
LABEL_70:
    if (!v10)
      goto LABEL_72;
    goto LABEL_71;
  }
  if (*(_QWORD *)(a1 + 128))
  {
    if (*(_DWORD *)(a1 + 140) || *(_BYTE *)(a1 + 144))
      goto LABEL_21;
    goto LABEL_34;
  }
  v21 = *(_QWORD *)(a1 + 56);
  if (!v21)
    goto LABEL_21;
  if (*(_WORD *)(v21 + 342) != 43)
    goto LABEL_21;
  v22 = *(_QWORD *)(a1 + 64);
  if (!v22 || !*(_QWORD *)(v22 + 32))
    goto LABEL_21;
  v23 = dnssec_obj_rrset_copy_dses_with_supported_algorithm(v22, (size_t *)buf, (int *)&v106);
  v10 = (_QWORD *)v23;
  if ((_DWORD)v106 == -6727)
  {
LABEL_68:
    v15 = 0;
    v9 = 0;
    goto LABEL_35;
  }
  if ((_DWORD)v106)
  {
LABEL_59:
    v9 = 0;
    goto LABEL_23;
  }
  v12 = *(_QWORD *)buf;
  v24 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 24);
  if (v24)
  {
    while (*(_WORD *)(*v24 + 4) != 46 || !*(_QWORD *)buf)
    {
LABEL_66:
      v24 = (_QWORD *)v24[1];
      if (!v24)
        goto LABEL_59;
    }
    v25 = 0;
    v26 = __rev16(*(unsigned __int16 *)(*(_QWORD *)(*v24 + 40) + 20));
    while (v26 != bswap32(**(unsigned __int16 **)(*(_QWORD *)(v23 + 8 * v25) + 24)) >> 16)
    {
      if (*(_QWORD *)buf == ++v25)
        goto LABEL_66;
    }
    goto LABEL_68;
  }
  v9 = 0;
  v11 = 0;
  if (!*(_QWORD *)buf)
    goto LABEL_70;
LABEL_25:
  v13 = 0;
  do
  {
    v14 = (_QWORD *)v10[v13];
    if (v14)
    {
      ref_count_obj_release(v14);
      v10[v13] = 0;
    }
    ++v13;
  }
  while (v13 < v12);
LABEL_71:
  free(v10);
LABEL_72:
  v27 = v107;
  if (v107)
  {
    v28 = 0;
    do
    {
      v29 = (_QWORD *)v9[v28];
      if (v29)
      {
        ref_count_obj_release(v29);
        v9[v28] = 0;
      }
      ++v28;
    }
    while (v28 < v27);
  }
  else if (!v9)
  {
    goto LABEL_80;
  }
  free(v9);
LABEL_80:
  if (!v11)
    return;
  v106 = 0;
  v107 = 0;
  v30 = *(_DWORD *)(a1 + 48);
  if (v30)
  {
    v31 = 0;
    v32 = 0;
    v33 = *(_DWORD *)(a1 + 52);
LABEL_83:
    v108 = v33;
    goto LABEL_84;
  }
  v38 = *(_QWORD *)(a1 + 32);
  if (v38)
  {
    v39 = *(_DWORD *)(v38 + 40);
    if (v39 != 2 && v39 != 4)
    {
      v31 = 0;
      v32 = 0;
      v30 = 0;
      v33 = -6745;
      goto LABEL_83;
    }
  }
  v108 = -6745;
  v41 = *(_DWORD *)(a1 + 112);
  if (v41)
  {
    v42 = *(unsigned __int8 **)(a1 + 88);
    if (!v42)
    {
      if (v41 != 3)
      {
        v31 = 0;
        v32 = 0;
        v30 = 0;
        v108 = 0;
        goto LABEL_84;
      }
      goto LABEL_106;
    }
    if (*v42 != 240
      || (v43 = *((_QWORD *)v42 + 7)) == 0
      || *(_DWORD *)(v43 + 32) != 1
      || (v44 = *(_QWORD *)(a1 + 16), dnssec_obj_resource_record_member_get_validation_result(v43) != 1)
      || !resource_record_get_insecure_validation_usable(v42))
    {
LABEL_106:
      v31 = 0;
      v32 = 0;
      v48 = -6700;
LABEL_107:
      v108 = v48;
      goto LABEL_264;
    }
    *(_DWORD *)buf = 0;
    v45 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)v42 + 4), 0, (int *)buf);
    v46 = v45;
    if (*(_DWORD *)buf)
    {
      if (v45)
        ref_count_obj_release(v45);
      goto LABEL_106;
    }
    if (ref_count_obj_compare(v44, (uint64_t)v45, 1))
    {
      is_sub_domain_of = dnssec_obj_domain_name_is_sub_domain_of(*(unsigned __int8 **)(v44 + 16), *((unsigned __int8 **)v46 + 2));
      ref_count_obj_release(v46);
      if (!is_sub_domain_of)
        goto LABEL_106;
    }
    else if (v46)
    {
      ref_count_obj_release(v46);
    }
    v93 = *(_QWORD *)(a1 + 32);
    if (v93)
      *(_QWORD *)(v93 + 44) = 2;
    v94 = *(_QWORD *)(a1 + 40);
    if (v94)
      *(_QWORD *)(v94 + 44) = 2;
    v32 = 0;
    v31 = 0;
    goto LABEL_233;
  }
  v52 = *(_QWORD *)(a1 + 64);
  if (v52)
  {
    v53 = *(_DWORD *)(v52 + 44);
    if (v53 == 3)
      goto LABEL_274;
    v54 = *(_QWORD *)(v52 + 32);
  }
  else
  {
    v53 = 0;
    v54 = 0;
  }
  if (!v38)
    goto LABEL_150;
  v55 = *(_DWORD *)(v38 + 40);
  if (v55 != 4 && v55 != 2)
    goto LABEL_150;
  v56 = *(_DWORD *)(v38 + 44);
  if (v56)
  {
    v57 = 0;
    v31 = 0;
    v32 = 0;
    v108 = *(_DWORD *)(v38 + 48);
    goto LABEL_130;
  }
  if (*(_QWORD *)(v38 + 32))
  {
    v58 = *(unsigned __int8 ***)(v38 + 24);
    if (v58)
    {
      v59 = *v58;
      if (*v59 != 240)
      {
        v60 = *((unsigned __int16 *)v59 + 2);
        if (v60 != 48 && (v60 != 46 || __rev16(*(unsigned __int16 *)(*((_QWORD *)v59 + 5) + 4)) != 48))
        {
          if (v54)
          {
            if (v53 == 1)
            {
              v31 = dnssec_obj_rrset_copy_dnskeys((_QWORD *)v52, &v107, &v108);
              if (!v108)
              {
                v57 = v107;
                v56 = dnssec_obj_rrset_validate_with_dnskeys(*(uint64_t **)(a1 + 32), (_DWORD **)v31, v107, (unsigned __int8 *)&v108);
                v32 = 0;
LABEL_130:
                if (v56 == 3)
                  goto LABEL_264;
                goto LABEL_152;
              }
              v32 = 0;
LABEL_291:
              v30 = 0;
              goto LABEL_84;
            }
            if (v53 == 2)
            {
              v32 = 0;
              goto LABEL_238;
            }
            goto LABEL_274;
          }
          goto LABEL_150;
        }
      }
      goto LABEL_138;
    }
  }
  v105 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
      goto LABEL_138;
  }
  else
  {
    v105 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
      goto LABEL_138;
  }
  *(_DWORD *)buf = 136447234;
  *(_QWORD *)&buf[4] = "me->rr_count > 0 && me->rrs != NULL";
  *(_WORD *)&buf[12] = 2082;
  v110 = "";
  v111 = 2082;
  v112 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
  v113 = 1024;
  v114 = 267;
  v115 = 2048;
  v116 = 0;
  _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
LABEL_138:
  v61 = *(_QWORD *)(a1 + 128);
  if (v61)
  {
    v62 = *(_DWORD ***)(a1 + 120);
    if (v62)
    {
      if (!*(_BYTE *)(a1 + 144))
      {
        v86 = *(_QWORD *)(a1 + 32);
        v87 = dnssec_obj_rrset_validate_with_dses_or_trust_anchors(v86, 0, 0, v62, v61, &v108);
        if (v87 == 3)
        {
          if (!*(_DWORD *)(v86 + 56))
            *(_DWORD *)(v86 + 44) = 0;
          v31 = 0;
          v32 = 0;
          *(_BYTE *)(a1 + 144) = 1;
          goto LABEL_264;
        }
        v56 = v87;
        v57 = 0;
        goto LABEL_151;
      }
    }
  }
  if (v54)
  {
    if (v53 == 1)
    {
      v32 = (_DWORD **)dnssec_obj_rrset_copy_dses_with_supported_algorithm(*(_QWORD *)(a1 + 64), &v106, &v108);
      if (v108 != -6727)
      {
        if (!v108)
        {
          v56 = dnssec_obj_rrset_validate_with_dses_or_trust_anchors(*(_QWORD *)(a1 + 32), v32, v106, 0, 0, &v108);
          v57 = 0;
          v31 = 0;
          goto LABEL_130;
        }
        v31 = 0;
        goto LABEL_291;
      }
      goto LABEL_209;
    }
    if (v53 == 2)
    {
      v32 = 0;
LABEL_209:
      v38 = *(_QWORD *)(a1 + 32);
LABEL_238:
      v57 = 0;
      v31 = 0;
      v56 = 2;
      *(_QWORD *)(v38 + 44) = 2;
      v63 = 1;
      goto LABEL_153;
    }
LABEL_274:
    v31 = 0;
    v32 = 0;
    v48 = -6709;
    goto LABEL_107;
  }
LABEL_150:
  v57 = 0;
  v56 = 0;
LABEL_151:
  v32 = 0;
  v31 = 0;
LABEL_152:
  v63 = 0;
LABEL_153:
  v64 = *(_QWORD *)(a1 + 40);
  if (!v64)
    goto LABEL_167;
  v65 = *(_DWORD *)(v64 + 40);
  if (v65 != 4 && v65 != 2)
    goto LABEL_167;
  v66 = *(_DWORD *)(v64 + 44);
  if (!v66)
  {
    if (v54)
    {
      if (v53 != 1)
      {
        if (v53 == 2)
        {
          *(_QWORD *)(v64 + 44) = 2;
LABEL_233:
          v108 = 0;
          v67 = 2;
          goto LABEL_251;
        }
        v95 = -6709;
        goto LABEL_242;
      }
      if (!v31)
      {
        v31 = dnssec_obj_rrset_copy_dnskeys(*(_QWORD **)(a1 + 64), &v107, &v108);
        if (v108)
        {
          v67 = 0;
          if (!v63)
            goto LABEL_263;
LABEL_251:
          v96 = mDNSLogCategory_DNSSEC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
            {
LABEL_260:
              v100 = dword_100158E08;
              if (dword_100158E08 <= 1)
                v100 = 1;
              dword_100158E68 = v100;
LABEL_263:
              v30 = v67;
              if (v67 != 3)
                goto LABEL_84;
LABEL_264:
              v101 = mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                {
LABEL_273:
                  v30 = 3;
                  goto LABEL_84;
                }
              }
              else
              {
                v101 = mDNSLogCategory_DNSSEC_redacted;
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                  goto LABEL_273;
              }
              v104 = *(unsigned __int16 *)(a1 + 24);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v104;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v108;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "[Q%u] Bogus RRSet failed DNSSEC validation - error: %d", buf, 0xEu);
              goto LABEL_273;
            }
          }
          else
          {
            v96 = mDNSLogCategory_DNSSEC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
              goto LABEL_260;
          }
          v99 = *(unsigned __int16 *)(a1 + 24);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v99;
          *(_WORD *)&buf[8] = 1026;
          *(_DWORD *)&buf[10] = v67;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "[Q%u] A new RRSet has been validated, scheduling cache update - result: %{public, mdns:dnssec_result}d", buf, 0xEu);
          goto LABEL_260;
        }
        v64 = *(_QWORD *)(a1 + 40);
        v57 = v107;
      }
      v66 = dnssec_obj_rrset_validate_with_dnskeys((uint64_t *)v64, (_DWORD **)v31, v57, (unsigned __int8 *)&v108);
      goto LABEL_158;
    }
LABEL_167:
    v66 = 0;
    goto LABEL_168;
  }
  v108 = *(_DWORD *)(v64 + 48);
LABEL_158:
  if (v66 == 3)
    goto LABEL_159;
LABEL_168:
  v108 = 0;
  if (v56 == 2 || v66 == 2)
  {
    v67 = 2;
    v30 = 2;
    if ((v63 & 1) != 0)
      goto LABEL_251;
  }
  else
  {
    v68 = *(_QWORD *)(a1 + 40);
    if (!v68)
    {
      v75 = *(_QWORD *)(a1 + 32);
      if (!v75)
        goto LABEL_241;
      v76 = *(_DWORD *)(v75 + 40);
      if (v76 != 2 && v76 != 4)
      {
        v84 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
            goto LABEL_250;
        }
        else
        {
          v84 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
            goto LABEL_250;
        }
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "dnssec_obj_rrset_is_completed(me)";
        *(_WORD *)&buf[12] = 2082;
        v110 = "";
        v111 = 2082;
        v112 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
        v113 = 1024;
        v114 = 416;
        v115 = 2048;
        v116 = 0;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
LABEL_250:
        v108 = -6745;
        v67 = 0;
        v30 = 0;
        if ((v63 & 1) == 0)
          goto LABEL_84;
        goto LABEL_251;
      }
      v77 = *(_QWORD **)(v75 + 24);
      if (!v77)
        goto LABEL_250;
      while (1)
      {
        v78 = *v77;
        if (*(_WORD *)(*v77 + 4) == 46)
          break;
        v77 = (_QWORD *)v77[1];
        if (!v77)
          goto LABEL_250;
      }
      v88 = *(_BYTE **)(v78 + 32);
      v89 = *v88;
      if (*v88)
      {
        v90 = 0;
        do
        {
          ++v90;
          v91 = &v88[v89];
          v92 = v91[1];
          v88 = v91 + 1;
          v89 = v92;
        }
        while (v92);
      }
      else
      {
        v90 = 0;
      }
      if (v90 != *(unsigned __int8 *)(*(_QWORD *)(v78 + 40) + 7) || !v56)
        goto LABEL_250;
      if (v56 != 1)
        goto LABEL_241;
LABEL_204:
      v108 = 0;
      v67 = 1;
      goto LABEL_251;
    }
    *(_DWORD *)buf = 0;
    denial_of_existence = dnssec_obj_rrset_get_denial_of_existence(v68, (int *)buf);
    if (*(_DWORD *)buf)
    {
      v108 = *(_DWORD *)buf;
LABEL_159:
      v67 = 3;
      if (!v63)
        goto LABEL_263;
      goto LABEL_251;
    }
    v70 = *(_DWORD *)(denial_of_existence + 16);
    v108 = 0;
    v71 = *(_QWORD *)(a1 + 32);
    if (v71)
    {
      if (v56 == 1 && v66 == 1)
      {
        v72 = *(_DWORD *)(v71 + 40);
        if (v72 == 2 || v72 == 4)
        {
          v73 = *(_QWORD **)(v71 + 24);
          if (v73)
          {
            while (1)
            {
              v74 = *v73;
              if (*(_WORD *)(*v73 + 4) == 46)
                break;
              v73 = (_QWORD *)v73[1];
              if (!v73)
                goto LABEL_241;
            }
            v79 = *(_BYTE **)(v74 + 32);
            v80 = *v79;
            if (*v79)
            {
              v81 = 0;
              do
              {
                ++v81;
                v82 = &v79[v80];
                v83 = v82[1];
                v79 = v82 + 1;
                v80 = v83;
              }
              while (v83);
              if (v81 > *(unsigned __int8 *)(*(_QWORD *)(v74 + 40) + 7) && v70 == 5)
                goto LABEL_204;
            }
          }
          goto LABEL_241;
        }
        v85 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
          {
LABEL_240:
            *(_DWORD *)buf = 136447234;
            *(_QWORD *)&buf[4] = "dnssec_obj_rrset_is_completed(me)";
            *(_WORD *)&buf[12] = 2082;
            v110 = "";
            v111 = 2082;
            v112 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
            v113 = 1024;
            v114 = 396;
            v115 = 2048;
            v116 = 0;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
          }
        }
        else
        {
          v85 = mDNSLogCategory_DNSSEC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
            goto LABEL_240;
        }
LABEL_241:
        v95 = -6736;
LABEL_242:
        v108 = v95;
        if ((v63 & 1) == 0)
          goto LABEL_264;
        v67 = 3;
        goto LABEL_251;
      }
      if (v56 && v66)
        goto LABEL_241;
      goto LABEL_250;
    }
    if (!v70 || v70 == 2)
      goto LABEL_241;
    if (v70 != 5)
    {
      if (!v66)
        goto LABEL_250;
      if (v66 != 1)
        goto LABEL_241;
      goto LABEL_204;
    }
    v67 = 0;
    v30 = 0;
    v108 = -6745;
    if ((v63 & 1) != 0)
      goto LABEL_251;
  }
LABEL_84:
  v34 = v108;
  *(_DWORD *)(a1 + 48) = v30;
  *(_DWORD *)(a1 + 52) = v34;
  v35 = v107;
  if (v107)
  {
    v36 = 0;
    do
    {
      v37 = (_QWORD *)v31[v36];
      if (v37)
      {
        ref_count_obj_release(v37);
        v31[v36] = 0;
      }
      ++v36;
    }
    while (v36 < v35);
    goto LABEL_109;
  }
  if (v31)
LABEL_109:
    free(v31);
  v49 = v106;
  if (v106)
  {
    v50 = 0;
    do
    {
      v51 = v32[v50];
      if (v51)
      {
        ref_count_obj_release(v51);
        v32[v50] = 0;
      }
      ++v50;
    }
    while (v50 < v49);
  }
  else if (!v32)
  {
    return;
  }
  free(v32);
}

void _query_record_with_insecure_validation_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  unsigned __int8 *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  __int16 v45;
  _DWORD *started;
  int v47;
  _DWORD *v48;
  NSObject *v49;
  int v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  _BYTE *v54;
  int v55;
  uint64_t v56;
  _BYTE *v57;
  int v58;
  uint64_t v59;
  unsigned __int8 *v60;
  int v61;
  _QWORD *v62;
  _QWORD *v63;
  int v70;
  int v71;
  uint8_t buf[4];
  _BYTE v73[20];
  __int128 v74;
  uint64_t v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;

  if (*(_QWORD *)(a2 + 144))
  {
    v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        return;
    }
    else
    {
      v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        return;
    }
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v73 = "!dns_question_is_dnssec_requestor(question)";
    *(_WORD *)&v73[8] = 2082;
    *(_QWORD *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(_QWORD *)&v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 330;
    HIWORD(v74) = 2048;
    v75 = 0;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
    return;
  }
  v7 = *((unsigned __int16 *)a3 + 2);
  if (v7 != 5 && v7 != 43)
  {
    v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        return;
    }
    else
    {
      v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        return;
    }
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v73 = "answer->rrtype == kDNSRecordType_DS || answer->rrtype == kDNSRecordType_CNAME";
    *(_WORD *)&v73[8] = 2082;
    *(_QWORD *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(_QWORD *)&v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 331;
    HIWORD(v74) = 2048;
    v75 = 0;
    goto LABEL_27;
  }
  v8 = *(_QWORD *)(a2 + 176);
  v9 = *(_QWORD *)(v8 + 64);
  if (!*(_DWORD *)(v9 + 112))
  {
    v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        return;
    }
    else
    {
      v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        return;
    }
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v73 = "_insecure_validation_in_progress(dnssec_context)";
    *(_WORD *)&v73[8] = 2082;
    *(_QWORD *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(_QWORD *)&v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 334;
    HIWORD(v74) = 2048;
    v75 = 0;
    goto LABEL_27;
  }
  if (*(_QWORD *)(v9 + 96) != a2)
  {
    v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
        return;
    }
    else
    {
      v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
        return;
    }
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v73 = "_is_insecure_validation_question(dnssec_context, question)";
    *(_WORD *)&v73[8] = 2082;
    *(_QWORD *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(_QWORD *)&v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 335;
    HIWORD(v74) = 2048;
    v75 = 0;
    goto LABEL_27;
  }
  if (v7 == 5)
    return;
  v10 = *(_QWORD *)(v8 + 24);
  v11 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
      goto LABEL_53;
    v20 = bswap32(*(unsigned __int16 *)(v10 + 340));
    v21 = bswap32(*(unsigned __int16 *)(a2 + 340));
    v14 = *((_QWORD *)a3 + 4);
    if (v14)
    {
      v15 = (_BYTE *)*((_QWORD *)a3 + 4);
      if (v14 == -256)
      {
LABEL_32:
        while (v15)
        {
          v22 = *v15;
          if (v22 > 0x3F)
            break;
          if (!*v15)
          {
            LOWORD(v15) = (_WORD)v15 - v14 + 1;
            goto LABEL_48;
          }
          v15 += v22 + 1;
          if (v14 != -256)
            goto LABEL_31;
        }
      }
      else
      {
LABEL_31:
        if ((unint64_t)v15 < v14 + 256)
          goto LABEL_32;
      }
      LOWORD(v15) = 257;
LABEL_48:
      LODWORD(v15) = (unsigned __int16)v15;
    }
    else
    {
      LODWORD(v15) = 0;
    }
    v23 = HIWORD(v20);
    v24 = HIWORD(v21);
    v25 = *a3 != 240;
    v26 = *((_QWORD *)a3 + 3);
    v28 = v26 + 5;
    if ((unint64_t)(v26 + 5) < 6 && ((0x2Du >> v28) & 1) != 0)
      LODWORD(v26) = dword_1001008E0[v28];
  }
  else
  {
    v11 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
      goto LABEL_53;
    v12 = bswap32(*(unsigned __int16 *)(v10 + 340));
    v13 = bswap32(*(unsigned __int16 *)(a2 + 340));
    v14 = *((_QWORD *)a3 + 4);
    if (v14)
    {
      v15 = (_BYTE *)*((_QWORD *)a3 + 4);
      if (v14 == -256)
      {
LABEL_13:
        while (v15)
        {
          v16 = *v15;
          if (v16 > 0x3F)
            break;
          if (!*v15)
          {
            LOWORD(v15) = (_WORD)v15 - v14 + 1;
            goto LABEL_42;
          }
          v15 += v16 + 1;
          if (v14 != -256)
            goto LABEL_12;
        }
      }
      else
      {
LABEL_12:
        if ((unint64_t)v15 < v14 + 256)
          goto LABEL_13;
      }
      LOWORD(v15) = 257;
LABEL_42:
      LODWORD(v15) = (unsigned __int16)v15;
    }
    else
    {
      LODWORD(v15) = 0;
    }
    v23 = HIWORD(v12);
    v24 = HIWORD(v13);
    v25 = *a3 != 240;
    v26 = *((_QWORD *)a3 + 3);
    v27 = v26 + 5;
    if ((unint64_t)(v26 + 5) < 6 && ((0x2Du >> v27) & 1) != 0)
      LODWORD(v26) = dword_1001008F8[v27];
  }
  v29 = a3[2];
  v30 = *((_DWORD *)a3 + 2);
  *(_DWORD *)buf = 67111427;
  *(_DWORD *)v73 = v23;
  *(_WORD *)&v73[4] = 1024;
  *(_DWORD *)&v73[6] = v24;
  *(_WORD *)&v73[10] = 2160;
  *(_QWORD *)&v73[12] = 1752392040;
  LOWORD(v74) = 1040;
  *(_DWORD *)((char *)&v74 + 2) = (_DWORD)v15;
  WORD3(v74) = 2101;
  *((_QWORD *)&v74 + 1) = v14;
  LOWORD(v75) = 1024;
  *(_DWORD *)((char *)&v75 + 2) = v25;
  HIWORD(v75) = 1024;
  v76 = a4;
  v77 = 1024;
  v78 = v26;
  v79 = 1024;
  v80 = v29;
  v81 = 1024;
  v82 = v30;
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] DS denial lookup record changes - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, %{mdns:pos/neg}d, %{mdns:addrmv}d, interface index: %d, mortality: %{mdns:mortality}d, ttl: %u", buf, 0x46u);
LABEL_53:
  v31 = *(_QWORD *)(v8 + 64);
  v70 = 0;
  if (*(_DWORD *)(v31 + 112) != 1)
  {
    v33 = 0;
    v60 = 0;
    v63 = 0;
    v47 = -6709;
    goto LABEL_115;
  }
  if (*((_QWORD *)a3 + 7) || a4 != 1)
  {
    v33 = 0;
    goto LABEL_140;
  }
  if (*((_WORD *)a3 + 2) != 43)
  {
    v33 = 0;
    v60 = 0;
    v63 = 0;
    v47 = -6756;
    goto LABEL_115;
  }
  v32 = *(_QWORD *)(v31 + 16);
  v33 = *(_QWORD *)(v31 + 104);
  if (v33)
    ++*(_DWORD *)v33;
  if (*a3 == 240)
  {
    v34 = *(_QWORD *)(v8 + 24);
    if (!ref_count_obj_compare(v32, v33, 1) && *(_WORD *)(v34 + 342) == 43)
    {
      v35 = mDNSLogCategory_DNSSEC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
        {
          v36 = bswap32(*(unsigned __int16 *)(v34 + 340)) >> 16;
          if (v32)
          {
            v37 = *(_DWORD *)(v32 + 24);
            v38 = *(_QWORD *)(v32 + 16);
          }
          else
          {
            v37 = 0;
            v38 = 0;
          }
          goto LABEL_113;
        }
      }
      else
      {
        v35 = mDNSLogCategory_DNSSEC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
        {
          v36 = bswap32(*(unsigned __int16 *)(v34 + 340)) >> 16;
          if (v32)
          {
            v37 = *(_DWORD *)(v32 + 24);
            v38 = *(_QWORD *)(v32 + 16);
          }
          else
          {
            v37 = 0;
            v38 = 0;
          }
LABEL_113:
          *(_DWORD *)buf = 67109891;
          *(_DWORD *)v73 = v36;
          *(_WORD *)&v73[4] = 2160;
          *(_QWORD *)&v73[6] = 1752392040;
          *(_WORD *)&v73[14] = 1040;
          *(_DWORD *)&v73[16] = v37;
          LOWORD(v74) = 2101;
          *(_QWORD *)((char *)&v74 + 2) = v38;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "[Q%u] The discovered possible denial of existence for DS record points back to the current question itself, insecure delegation validation fails due to possible missing RRSIG of the original response - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x22u);
        }
      }
      v60 = 0;
      v63 = 0;
      v47 = -90020;
LABEL_115:
      v70 = v47;
      goto LABEL_116;
    }
    v45 = *(_WORD *)(*(_QWORD *)(v31 + 96) + 344);
    if (v33)
      ++*(_DWORD *)v33;
    _dnssec_obj_validation_manager_stop_negative_ds_query(v31);
    *(_DWORD *)(v31 + 112) = 2;
    if (*(_QWORD *)(v31 + 80))
    {
      v47 = -6709;
    }
    else
    {
      v71 = 0;
      started = _dnssec_obj_validation_manager_start_sub_query(v33, v45, 43, 2101248, v8, (uint64_t)_dnssec_query_key_record_result_reply, &v71);
      *(_QWORD *)(v31 + 80) = started;
      v47 = v71;
      if (!v71)
      {
        v48 = started;
        v49 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
          {
            v50 = *(unsigned __int16 *)(v31 + 24);
            v51 = bswap32(*((unsigned __int16 *)v48 + 170)) >> 16;
            if (v33)
            {
              v52 = *(_DWORD *)(v33 + 24);
              v53 = *(_QWORD *)(v33 + 16);
            }
            else
            {
              v52 = 0;
              v53 = 0;
            }
            goto LABEL_102;
          }
        }
        else
        {
          v49 = mDNSLogCategory_DNSSEC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
          {
            v50 = *(unsigned __int16 *)(v31 + 24);
            v51 = bswap32(*((unsigned __int16 *)v48 + 170)) >> 16;
            if (v33)
            {
              v52 = *(_DWORD *)(v33 + 24);
              v53 = *(_QWORD *)(v33 + 16);
            }
            else
            {
              v52 = 0;
              v53 = 0;
            }
LABEL_102:
            *(_DWORD *)buf = 67110147;
            *(_DWORD *)v73 = v50;
            *(_WORD *)&v73[4] = 1024;
            *(_DWORD *)&v73[6] = v51;
            *(_WORD *)&v73[10] = 2160;
            *(_QWORD *)&v73[12] = 1752392040;
            LOWORD(v74) = 1040;
            *(_DWORD *)((char *)&v74 + 2) = v52;
            WORD3(v74) = 2101;
            *((_QWORD *)&v74 + 1) = v53;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Possible DS denial found, starting secure DS denial query - DS name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x28u);
          }
        }
        v60 = 0;
        v63 = (_QWORD *)v33;
        goto LABEL_104;
      }
    }
    v60 = 0;
    v70 = v47;
    v63 = (_QWORD *)v33;
LABEL_116:
    _dnssec_obj_validation_manager_fail_insecure_validation(v31, v47);
    if (!v33)
      goto LABEL_106;
    goto LABEL_105;
  }
  if (!dnssec_obj_domain_name_is_sub_domain_of(*(unsigned __int8 **)(v32 + 16), *(unsigned __int8 **)(v33 + 16)))
  {
LABEL_140:
    v60 = 0;
    v63 = 0;
    v47 = -6736;
    goto LABEL_115;
  }
  v39 = *(unsigned __int8 **)(v32 + 16);
  v40 = *v39;
  if (*v39)
  {
    v41 = 0;
    v42 = *(_QWORD *)(v32 + 16);
    do
    {
      ++v41;
      v43 = v42 + v40;
      v44 = *(unsigned __int8 *)(v43 + 1);
      v42 = v43 + 1;
      v40 = v44;
    }
    while (v44);
  }
  else
  {
    v41 = 0;
  }
  v54 = *(_BYTE **)(v33 + 16);
  v55 = *v54;
  if (*v54)
  {
    v56 = -1;
    do
    {
      v57 = &v54[v55];
      v58 = v57[1];
      v54 = v57 + 1;
      v55 = v58;
      ++v56;
    }
    while (v58);
    v59 = -2 - v56;
  }
  else
  {
    v59 = -1;
  }
  v60 = dnssec_obj_domain_name_copy_parent_domain(v39, v41 + v59, &v70);
  v47 = v70;
  if (v70)
    goto LABEL_150;
  _dnssec_obj_validation_manager_stop_negative_ds_query(v31);
  v61 = _dnssec_obj_validation_manager_start_negative_ds_query(v31, v60, v8);
  v70 = v61;
  if (v61)
  {
    v47 = v61;
LABEL_150:
    v63 = 0;
    goto LABEL_116;
  }
  if (v60)
    ++*(_DWORD *)v60;
  v62 = *(_QWORD **)(v31 + 104);
  if (v62)
    ref_count_obj_release(v62);
  v63 = 0;
  *(_QWORD *)(v31 + 104) = v60;
LABEL_104:
  v70 = 0;
  if (v33)
LABEL_105:
    ref_count_obj_release((_QWORD *)v33);
LABEL_106:
  if (v60)
    ref_count_obj_release(v60);
  if (v63)
    ref_count_obj_release(v63);
}

void _dnssec_query_key_record_result_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  unsigned __int8 *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  _QWORD *v32;
  NSObject *v33;
  _BYTE *v34;
  uint64_t v35;
  unsigned __int8 *v36;
  NSObject *v37;
  unsigned int v38;
  const char *v39;
  int v40;
  int v41;
  int v42;
  unsigned int v43;
  int v44;
  uint8_t buf[4];
  _BYTE v46[10];
  const char *v47;
  _BYTE v48[10];
  __int128 v49;
  int v50;
  __int16 v51;
  int v52;

  v6 = *((unsigned __int16 *)a3 + 2);
  if (v6 != 5 || *a3 == 240)
  {
    if (*(_QWORD *)(a2 + 144))
    {
      if (a4 <= 1)
      {
        v7 = *(_QWORD *)(a2 + 176);
        if (v6 == 48 || v6 == 43)
        {
          v8 = *((_QWORD *)a3 + 7);
          if (v8)
          {
            if (dnssec_obj_resource_record_member_get_validation_result(v8) - 3 >= 0xFFFFFFFE)
            {
              v44 = 0;
              v9 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)a3 + 4), 0, &v44);
              if (v44)
                goto LABEL_113;
              v10 = *(_QWORD *)(v7 + 24);
              v11 = mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                  goto LABEL_21;
                v12 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                v13 = *a3 != 240;
                if (v9)
                {
                  v14 = *((_DWORD *)v9 + 6);
                  v15 = *((_QWORD *)v9 + 2);
                }
                else
                {
                  v14 = 0;
                  v15 = 0;
                }
              }
              else
              {
                v11 = mDNSLogCategory_DNSSEC_redacted;
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                  goto LABEL_21;
                v12 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                v13 = *a3 != 240;
                if (v9)
                {
                  v14 = *((_DWORD *)v9 + 6);
                  v15 = *((_QWORD *)v9 + 2);
                }
                else
                {
                  v14 = 0;
                  v15 = 0;
                }
              }
              v16 = *((unsigned __int16 *)a3 + 2);
              v17 = *((unsigned __int16 *)a3 + 6);
              *(_DWORD *)buf = 67110915;
              *(_DWORD *)v46 = v12;
              *(_WORD *)&v46[4] = 1024;
              *(_DWORD *)&v46[6] = v13;
              LOWORD(v47) = 1024;
              *(_DWORD *)((char *)&v47 + 2) = a4;
              HIWORD(v47) = 2160;
              *(_QWORD *)v48 = 1752392040;
              *(_WORD *)&v48[8] = 1040;
              LODWORD(v49) = v14;
              WORD2(v49) = 2101;
              *(_QWORD *)((char *)&v49 + 6) = v15;
              HIWORD(v49) = 1024;
              v50 = v16;
              v51 = 1024;
              v52 = v17;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Q%u] DNSSEC secure record changes - %{mdns:pos/neg}d, %{mdns:addrmv}d, qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rd_len: %u.", buf, 0x3Au);
LABEL_21:
              v18 = *(_QWORD *)(v7 + 64);
              if (a4)
              {
                if (!*(_DWORD *)(v18 + 112))
                {
                  v19 = *((unsigned __int16 *)a3 + 2);
                  if (v19 == 43 || v19 == 48)
                  {
                    *(_DWORD *)buf = 0;
                    v20 = *(_QWORD **)(v18 + 64);
                    if (v20)
                    {
                      v21 = 0;
                      ++*(_DWORD *)v20;
                    }
                    else
                    {
                      v36 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)a3 + 4), 1, (int *)buf);
                      v21 = v36;
                      if (*(_DWORD *)buf)
                      {
                        v20 = 0;
                        if (!v36)
                        {
LABEL_78:
                          if (v20)
                            ref_count_obj_release(v20);
                          v44 = *(_DWORD *)buf;
                          if (*(_DWORD *)buf)
                          {
                            if (*(_DWORD *)buf != -6730)
                              goto LABEL_113;
                            v37 = mDNSLogCategory_DNSSEC;
                            if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                            {
                              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG))
                                goto LABEL_113;
                            }
                            else
                            {
                              v37 = mDNSLogCategory_DNSSEC_redacted;
                              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
                                goto LABEL_113;
                            }
                            v38 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                            *(_DWORD *)buf = 67109120;
                            *(_DWORD *)v46 = v38;
                            v39 = "[Q%u] Getting duplicate secure record add event due to possible primary DNSSEC question change";
                            goto LABEL_94;
                          }
                          goto LABEL_112;
                        }
LABEL_77:
                        ref_count_obj_release(v21);
                        goto LABEL_78;
                      }
                      v20 = dnssec_obj_rrset_create(v36, *(_DWORD *)(v18 + 136), buf);
                      if (*(_DWORD *)buf)
                      {
LABEL_76:
                        if (!v21)
                          goto LABEL_78;
                        goto LABEL_77;
                      }
                    }
                    *(_DWORD *)buf = dnssec_obj_rrset_add_rr((uint64_t)v20, a3);
                    if (!*(_DWORD *)buf && !*(_QWORD *)(v18 + 64))
                    {
                      if (v20)
                        ++*(_DWORD *)v20;
                      *(_QWORD *)(v18 + 64) = v20;
                    }
                    goto LABEL_76;
                  }
                  v33 = mDNSLogCategory_DNSSEC;
                  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                  {
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
                      goto LABEL_59;
                  }
                  else
                  {
                    v33 = mDNSLogCategory_DNSSEC_redacted;
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
                    {
LABEL_59:
                      *(_DWORD *)buf = 136447234;
                      *(_QWORD *)v46 = "validated_key->rrtype == kDNSRecordType_DNSKEY || validated_key->rrtype == kDNSRecordType_DS";
                      *(_WORD *)&v46[8] = 2082;
                      v47 = "";
                      *(_WORD *)v48 = 2082;
                      *(_QWORD *)&v48[2] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
                      LOWORD(v49) = 1024;
                      *(_DWORD *)((char *)&v49 + 2) = 387;
                      WORD3(v49) = 2048;
                      *((_QWORD *)&v49 + 1) = 0;
LABEL_97:
                      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
                    }
                  }
LABEL_98:
                  v44 = -6756;
                  goto LABEL_113;
                }
LABEL_28:
                if (*a3 == 240
                  && (v22 = *((_QWORD *)a3 + 7)) != 0
                  && *(_DWORD *)(v22 + 32) == 1
                  && dnssec_obj_resource_record_member_get_validation_result(v22) == 1)
                {
                  if (*((_WORD *)a3 + 2) == 43)
                  {
                    if (a4 != 1)
                    {
                      *(_QWORD *)(v18 + 48) = 0xFFFFE5C200000000;
                      _dnssec_obj_validation_manager_reset_validation_key_requestor(v18);
                      _dnssec_obj_validation_manager_reset_insecure_validation(v18);
                      goto LABEL_110;
                    }
                    if (resource_record_get_insecure_validation_usable(a3))
                    {
                      v23 = mDNSLogCategory_DNSSEC;
                      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                      {
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                        {
                          v24 = *(unsigned __int16 *)(v18 + 24);
                          v25 = bswap32(*(unsigned __int16 *)(*(_QWORD *)(v18 + 80) + 340)) >> 16;
                          v26 = *((_QWORD *)a3 + 4);
                          if (v26)
                          {
                            v34 = (_BYTE *)*((_QWORD *)a3 + 4);
                            if (v26 == -256)
                            {
LABEL_64:
                              while (v34)
                              {
                                v35 = *v34;
                                if (v35 > 0x3F)
                                  break;
                                if (!*v34)
                                {
                                  v40 = (unsigned __int16)((_WORD)v34 - v26 + 1);
                                  goto LABEL_105;
                                }
                                v34 += v35 + 1;
                                if (v26 != -256)
                                  goto LABEL_63;
                              }
                            }
                            else
                            {
LABEL_63:
                              if ((unint64_t)v34 < v26 + 256)
                                goto LABEL_64;
                            }
                            v40 = 257;
                          }
                          else
                          {
                            v40 = 0;
                          }
                          goto LABEL_105;
                        }
                      }
                      else
                      {
                        v23 = mDNSLogCategory_DNSSEC_redacted;
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                        {
                          v24 = *(unsigned __int16 *)(v18 + 24);
                          v25 = bswap32(*(unsigned __int16 *)(*(_QWORD *)(v18 + 80) + 340)) >> 16;
                          v26 = *((_QWORD *)a3 + 4);
                          if (v26)
                          {
                            v27 = (_BYTE *)*((_QWORD *)a3 + 4);
                            if (v26 == -256)
                            {
LABEL_41:
                              while (v27)
                              {
                                v28 = *v27;
                                if (v28 > 0x3F)
                                  break;
                                if (!*v27)
                                {
                                  v40 = (unsigned __int16)((_WORD)v27 - v26 + 1);
                                  goto LABEL_105;
                                }
                                v27 += v28 + 1;
                                if (v26 != -256)
                                  goto LABEL_40;
                              }
                            }
                            else
                            {
LABEL_40:
                              if ((unint64_t)v27 < v26 + 256)
                                goto LABEL_41;
                            }
                            v40 = 257;
                          }
                          else
                          {
                            v40 = 0;
                          }
LABEL_105:
                          v41 = *((_DWORD *)a3 + 2);
                          *(_DWORD *)buf = 67110403;
                          *(_DWORD *)v46 = v24;
                          *(_WORD *)&v46[4] = 1024;
                          *(_DWORD *)&v46[6] = v25;
                          strcpy((char *)&v47, "p\bhash");
                          HIBYTE(v47) = 0;
                          *(_DWORD *)v48 = 68157440;
                          *(_DWORD *)&v48[4] = v40;
                          *(_WORD *)&v48[8] = 2101;
                          *(_QWORD *)&v49 = v26;
                          WORD4(v49) = 1024;
                          *(_DWORD *)((char *)&v49 + 10) = v41;
                          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Insecure validation complete, scheduling cache update - insecure zone: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, ttl: %u", buf, 0x2Eu);
                        }
                      }
                      *(_QWORD *)(v18 + 88) = a3;
                      v42 = dword_100158E08;
                      if (dword_100158E08 <= 1)
                        v42 = 1;
                      dword_100158E68 = v42;
LABEL_109:
                      if (a4)
                      {
LABEL_112:
                        _dnssec_make_validation_progress(*(_QWORD *)(v7 + 64));
                        goto LABEL_113;
                      }
LABEL_110:
                      if (dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(*(_QWORD *)(v18 + 32), *(_QWORD *)(v18 + 40)))
                      {
                        dnssec_obj_validation_manager_start_insecure_validation(v18, v7);
                      }
                      goto LABEL_112;
                    }
                    v29 = -90021;
                  }
                  else
                  {
                    v29 = -6756;
                  }
                }
                else
                {
                  v29 = -6736;
                }
                _dnssec_obj_validation_manager_fail_insecure_validation(v18, v29);
                goto LABEL_109;
              }
              dnssec_obj_validation_manager_remove_validated_cache(*(_QWORD *)(v7 + 64));
              v18 = *(_QWORD *)(v7 + 64);
              if (*(_DWORD *)(v18 + 112))
                goto LABEL_28;
              v30 = *((unsigned __int16 *)a3 + 2);
              if (v30 != 43 && v30 != 48)
              {
                v33 = mDNSLogCategory_DNSSEC;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                {
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
                    goto LABEL_98;
                }
                else
                {
                  v33 = mDNSLogCategory_DNSSEC_redacted;
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
                    goto LABEL_98;
                }
                *(_DWORD *)buf = 136447234;
                *(_QWORD *)v46 = "validated_key->rrtype == kDNSRecordType_DNSKEY || validated_key->rrtype == kDNSRecordType_DS";
                *(_WORD *)&v46[8] = 2082;
                v47 = "";
                *(_WORD *)v48 = 2082;
                *(_QWORD *)&v48[2] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
                LOWORD(v49) = 1024;
                *(_DWORD *)((char *)&v49 + 2) = 397;
                WORD3(v49) = 2048;
                *((_QWORD *)&v49 + 1) = 0;
                goto LABEL_97;
              }
              v31 = dnssec_obj_rrset_remove_rr(*(_QWORD *)(v18 + 64), a3);
              if (!v31)
              {
                v32 = *(_QWORD **)(v18 + 64);
                if (!v32[4] && v32)
                {
                  ref_count_obj_release(v32);
                  *(_QWORD *)(v18 + 64) = 0;
                }
                *(_QWORD *)(v18 + 48) = 0xFFFFE5C200000000;
                *(_DWORD *)(v18 + 140) = 0;
                *(_BYTE *)(v18 + 144) = 0;
                v44 = 0;
                goto LABEL_113;
              }
              v44 = v31;
              if (v31 == -6727)
              {
                v37 = mDNSLogCategory_DNSSEC;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                {
                  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG))
                    goto LABEL_122;
                }
                else
                {
                  v37 = mDNSLogCategory_DNSSEC_redacted;
                  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
                  {
LABEL_122:
                    v43 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v46 = v43;
                    v39 = "[Q%u] Added secure record not found due to possible primary DNSSEC question change";
LABEL_94:
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, v39, buf, 8u);
                  }
                }
              }
LABEL_113:
              if (v9)
                ref_count_obj_release(v9);
            }
          }
        }
      }
    }
  }
}

uint64_t _dnssec_obj_resource_record_member_compare()
{
  return 2;
}

void _dnssec_obj_resource_record_member_finalize(uint64_t a1)
{
  _QWORD *v2;

  if (!*(_DWORD *)(a1 + 32) && !*(_BYTE *)(a1 + 40))
  {
    v2 = *(_QWORD **)(a1 + 48);
    if (v2)
    {
      ref_count_obj_release(v2);
      *(_QWORD *)(a1 + 48) = 0;
    }
  }
}

_DWORD *_dnssec_obj_resource_record_member_new()
{
  _DWORD *result;
  _DWORD *v1;
  _UNKNOWN **v2;
  void (*v3)(_DWORD *);

  result = malloc_type_calloc(1uLL, 0x38uLL, 0xF1748037uLL);
  if (result)
  {
    v1 = result;
    v2 = &_dnssec_obj_resource_record_member_kind;
    *((_QWORD *)result + 1) = &_dnssec_obj_resource_record_member_kind;
    do
    {
      v3 = (void (*)(_DWORD *))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    ++*v1;
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t dnssec_obj_resource_record_member_get_validation_result(uint64_t a1)
{
  uint64_t result;
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;

  if (*(_DWORD *)(a1 + 32) == 1)
    return *(unsigned int *)(a1 + 40);
  v2 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
LABEL_12:
      v4 = 136447234;
      v5 = "me->aware_type == dnssec_aware_rr_validated";
      v6 = 2082;
      v7 = "";
      v8 = 2082;
      v9 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_resource_record_member.c";
      v10 = 1024;
      v11 = 210;
      v12 = 2048;
      v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v4, 0x30u);
      return 0;
    }
  }
  else
  {
    v2 = mDNSLogCategory_DNSSEC_redacted;
    result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
      goto LABEL_12;
  }
  return result;
}

id _mdns_heuristics_log()
{
  if (_mdns_heuristics_log_s_once != -1)
    dispatch_once(&_mdns_heuristics_log_s_once, &__block_literal_global_36);
  return (id)_mdns_heuristics_log_s_log;
}

void ___mdns_heuristics_log_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mdns", "heuristics");
  v2 = (void *)_mdns_heuristics_log_s_log;
  _mdns_heuristics_log_s_log = (uint64_t)v1;

}

id getHeuristicsQueue()
{
  if (getHeuristicsQueue_onceToken != -1)
    dispatch_once(&getHeuristicsQueue_onceToken, &__block_literal_global_39);
  return (id)getHeuristicsQueue_queue;
}

void __dns_heuristics_report_resolution_failure_block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;

  v2 = _mdns_heuristics_log();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 1024;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_failure %@ %d", (uint8_t *)&v7, 0x12u);
  }

  v6 = objc_autoreleasePoolPush();
  +[DNSHeuristics reportResolutionFailure:isTimeout:](DNSHeuristics, "reportResolutionFailure:isTimeout:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  objc_autoreleasePoolPop(v6);
}

void __getHeuristicsQueue_block_invoke(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("DNSHeuristicsQueue", 0);
  v2 = (void *)getHeuristicsQueue_queue;
  getHeuristicsQueue_queue = (uint64_t)v1;

}

void __dns_heuristics_report_resolution_success_block_invoke(id a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v1 = _mdns_heuristics_log();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_success", v4, 2u);
  }

  v3 = objc_autoreleasePoolPush();
  +[DNSHeuristics updateHeuristicState:isTimeout:](DNSHeuristics, "updateHeuristicState:isTimeout:", 1, 0);
  objc_autoreleasePoolPop(v3);
}

void __mhc_bpf_open_block_invoke(uint64_t a1, xpc_object_t object)
{
  NSObject *v4;
  const void *v5;
  int v6;
  int v7;
  xpc_object_t v8;
  int v9;
  int v10;
  unsigned int int64_limited;
  NSObject *v12;
  const void *v13;
  _QWORD v14[5];
  int v15;
  int v16;

  v5 = *(const void **)(a1 + 32);
  v4 = *(NSObject **)(a1 + 40);
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v6 = -1;
    v7 = -6700;
    goto LABEL_12;
  }
  v8 = _mdns_xpc_dictionary_get_object(object, "bpf_fd", (const _xpc_type_s *)&_xpc_type_fd);
  if (v8)
  {
    v9 = xpc_fd_dup(v8);
    if ((v9 & 0x80000000) == 0)
    {
      v6 = v9;
      v7 = 0;
      goto LABEL_12;
    }
    v10 = -6700;
  }
  else
  {
    v10 = -6712;
  }
  int64_limited = _mdns_xpc_dictionary_get_int64_limited(object, "error", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (int64_limited)
    v7 = int64_limited;
  else
    v7 = v10;
  v6 = -1;
LABEL_12:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = ___mhc_bpf_open_reply_handler_block_invoke;
  v14[3] = &unk_10013EC60;
  v14[4] = _Block_copy(v5);
  v15 = v6;
  v16 = v7;
  dispatch_async(v4, v14);
  v12 = *(NSObject **)(a1 + 40);
  if (v12)
    dispatch_release(v12);
  v13 = *(const void **)(a1 + 32);
  if (v13)
    _Block_release(v13);
}

void ___mhc_send_message_with_reply_block_invoke(uint64_t a1, xpc_object_t object)
{
  _mhc_common_reply_handler(*(_xpc_connection_s **)(a1 + 40), *(void **)(a1 + 48), object, *(void (***)(_QWORD, _QWORD))(a1 + 32));
}

void _mhc_common_reply_handler(_xpc_connection_s *a1, void *a2, xpc_object_t object, void (**a4)(_QWORD, _QWORD))
{
  const char *string;
  NSObject *v9;
  _QWORD handler[7];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  _xpc_connection_s *v14;
  __int16 v15;
  const char *v16;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, "command");
    if (_mhc_log_s_once != -1)
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4_6482);
    v9 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_ERROR))
    {
      if (!string)
        string = "<NO COMMAND>";
      *(_DWORD *)buf = 136446722;
      v12 = string;
      v13 = 2114;
      v14 = a1;
      v15 = 2082;
      v16 = xpc_dictionary_get_string(object, _xpc_error_key_description);
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s request received error reply -- connection: %{public}@, error: %{public}s", buf, 0x20u);
    }
  }
  if (object == &_xpc_error_connection_interrupted)
  {
    if (_mhc_queue_s_once != -1)
      dispatch_once(&_mhc_queue_s_once, &__block_literal_global_12_6479);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = ___mhc_common_reply_handler_block_invoke;
    handler[3] = &unk_10013EC38;
    handler[5] = a1;
    handler[6] = a2;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(a1, a2, (dispatch_queue_t)_mhc_queue_s_queue, handler);
  }
  else
  {
    if (a1)
    {
      xpc_connection_cancel(a1);
      xpc_release(a1);
    }
    if (a2)
      xpc_release(a2);
    if (a4)
    {
      ((void (**)(_QWORD, xpc_object_t))a4)[2](a4, object);
      _Block_release(a4);
    }
  }
}

uint64_t ___mhc_common_reply_handler_block_invoke(uint64_t a1, xpc_object_t object)
{
  return _mhc_common_reply_handler(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), object);
}

void ___mhc_log_block_invoke(id a1)
{
  _mhc_log_s_log = (uint64_t)os_log_create("com.apple.mDNSResponder", "helper_client");
}

void ___mhc_queue_block_invoke(id a1)
{
  _mhc_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mhc", 0);
}

void ___mhc_create_connection_block_invoke(uint64_t a1, xpc_object_t object)
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *string;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (_mhc_log_s_once != -1)
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4_6482);
    v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2082;
      string = xpc_dictionary_get_string(object, _xpc_error_key_description);
      v6 = "Connection received error event -- connnection: %{public}@, error: %{public}s";
      goto LABEL_11;
    }
  }
  else
  {
    if (_mhc_log_s_once != -1)
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4_6482);
    v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v5;
      v10 = 2112;
      string = (const char *)object;
      v6 = "Connection received unexpected event -- connection: %{public}@, event: %@";
LABEL_11:
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v8, 0x16u);
    }
  }
}

void ___mhc_bpf_open_reply_handler_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

void BindDPSocket(int a1, int a2, int a3)
{
  int v5;
  NSObject *v6;
  const char *v8;
  NSObject *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v18;
  NSObject *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BYTE v27[24];
  _DWORD v28[4];

  v26 = 1;
  if (a3 == 1 && setsockopt(a1, 0xFFFF, 4, &v26, 4u))
  {
    v5 = *__error();
    v6 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
        return;
      if (a2 == 2)
        v8 = "IPv4";
      else
        v8 = "IPv6";
      goto LABEL_22;
    }
    v6 = mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
    {
      if (a2 == 2)
        v8 = "IPv4";
      else
        v8 = "IPv6";
LABEL_22:
      v18 = strerror(v5);
      *(_DWORD *)v27 = 136446978;
      *(_QWORD *)&v27[4] = v8;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = a1;
      *(_WORD *)&v27[18] = 1024;
      *(_DWORD *)&v27[20] = v5;
      LOWORD(v28[0]) = 2082;
      *(_QWORD *)((char *)v28 + 2) = v18;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BindDPSocket: setsockopt SO_REUSEADDR failed for %{public}s %d errno %d (%{public}s)", v27, 0x22u);
    }
  }
  else if (a2 == 2)
  {
    *(_QWORD *)v27 = 889192960;
    *(_QWORD *)&v27[8] = 0;
    if (bind(a1, (const sockaddr *)v27, 0x10u))
    {
      v9 = mDNSLogCategory_Default;
      __error();
      v10 = __error();
      strerror(*v10);
      LogMsgWithLevel(v9, OS_LOG_TYPE_DEFAULT, "BindDPSocket: bind %d errno %d (%s)", v11, v12, v13, v14, v15, a1);
    }
  }
  else
  {
    if (setsockopt(a1, 41, 27, &v26, 4u) < 0)
    {
      v16 = "DPFBindSocket: setsockopt IPV6_V6ONLY %d errno %d (%s)";
    }
    else
    {
      *(_QWORD *)v27 = 889200128;
      *(_QWORD *)&v27[8] = 0;
      v28[0] = 0;
      *(_QWORD *)&v27[16] = 0;
      if (!bind(a1, (const sockaddr *)v27, 0x1Cu))
        return;
      v16 = "BindDPSocket: bind6 %d errno %d (%s)";
    }
    v19 = mDNSLogCategory_Default;
    __error();
    v20 = __error();
    strerror(*v20);
    LogMsgWithLevel(v19, OS_LOG_TYPE_DEFAULT, v16, v21, v22, v23, v24, v25, a1);
  }
}

uint64_t SetupUDPProxySocket(int a1, _QWORD *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v52;
  int v53;

  v53 = 1;
  a2[1] = mDNSStorage;
  a2[10] = 0;
  if (a3 == 2)
    v10 = 2;
  else
    v10 = 6;
  if (a3 == 2)
    v11 = 3;
  else
    v11 = 7;
  if (a3 == 2)
    v12 = a2 + 3;
  else
    v12 = a2 + 7;
  if (a3 != 2)
  {
    if (a3 != 30)
    {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: wrong family %d", a4, a5, a6, a7, a8, a3);
      return 0xFFFFFFFFLL;
    }
    v22 = setsockopt(a1, 41, 61, &v53, 4u);
    if ((v22 & 0x80000000) != 0)
    {
      v14 = v22;
      v37 = mDNSLogCategory_Default;
      __error();
      v38 = __error();
      strerror(*v38);
      LogMsgWithLevel(v37, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IPV6_RECVPKTINFO %d errno %d (%s)", v39, v40, v41, v42, v43, a1);
      return v14;
    }
    v14 = setsockopt(a1, 41, 37, &v53, 4u);
    if ((v14 & 0x80000000) != 0)
    {
      v44 = mDNSLogCategory_Default;
      __error();
      v45 = __error();
      strerror(*v45);
      LogMsgWithLevel(v44, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IPV6_RECVHOPLIMIT %d errno %d (%s)", v46, v47, v48, v49, v50, a1);
      return v14;
    }
LABEL_17:
    v23 = fcntl(a1, 3, 0);
    if ((fcntl(a1, 4, v23 | 4u) & 0x80000000) == 0)
    {
      LODWORD(a2[v10]) = a1;
      a2[v11] = myKQSocketCallBack;
      v12[1] = a2;
      v12[2] = "UDP Proxy packet reception";
      KQueueSet(a1, 1u, -1, v12);
      return v14;
    }
    v31 = mDNSLogCategory_Default;
    v52 = *__error();
    LogMsgWithLevel(v31, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: fnctl failed %d", v32, v33, v34, v35, v36, v52);
    return 0xFFFFFFFFLL;
  }
  v13 = setsockopt(a1, 0, 7, &v53, 4u);
  if ((v13 & 0x80000000) != 0)
  {
    v14 = v13;
    v24 = mDNSLogCategory_Default;
    __error();
    v25 = __error();
    strerror(*v25);
    LogMsgWithLevel(v24, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IP_RECVDSTADDR %d errno %d (%s)", v26, v27, v28, v29, v30, a1);
    return v14;
  }
  v14 = setsockopt(a1, 0, 20, &v53, 4u);
  if ((v14 & 0x80000000) == 0)
    goto LABEL_17;
  v15 = mDNSLogCategory_Default;
  __error();
  v16 = __error();
  strerror(*v16);
  LogMsgWithLevel(v15, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IP_RECVIF %d errno %d (%s)", v17, v18, v19, v20, v21, a1);
  return v14;
}

uint64_t SetupTCPProxySocket(int a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v4 = listen(a1, 100);
  if ((_DWORD)v4)
  {
    v5 = mDNSLogCategory_Default;
    __error();
    v6 = __error();
    strerror(*v6);
    LogMsgWithLevel(v5, OS_LOG_TYPE_DEFAULT, "SetupTCPProxySocket: listen %d errno %d (%s)", v7, v8, v9, v10, v11, a1);
  }
  else
  {
    v12 = fcntl(a1, 3, 0);
    fcntl(a1, 4, v12 | 4u);
    *(_QWORD *)(a2 + 24) = ProxyTCPAccept;
    *(_DWORD *)(a2 + 16) = a1;
    *(_QWORD *)(a2 + 32) = a2;
    *(_QWORD *)(a2 + 40) = "TCP Accept";
    *(_QWORD *)(a2 + 72) = mDNSStorage;
    KQueueSet(a1, 1u, -1, (void *)(a2 + 24));
  }
  return v4;
}

uint64_t ProxyTCPAccept(int a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  uint64_t result;
  int v7;
  _DWORD *v8;
  _DWORD *v9;
  int v10;
  NSObject *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  socklen_t v19;
  sockaddr v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = (sockaddr)0;
  v21 = 0u;
  v18 = 1;
  v19 = 128;
  v5 = "ProxyTCPAccept: IP_RECVIF %d errno %d (%s)";
  while (1)
  {
    result = accept(a1, &v20, &v19);
    if ((_DWORD)result == -1)
      return result;
    v7 = result;
    v8 = malloc_type_calloc(1uLL, 0x68uLL, 0xF1748037uLL);
    if (!v8)
      __break(1u);
    v9 = v8;
    v8[4] = -1;
    *((_QWORD *)v8 + 9) = *(_QWORD *)(a3 + 72);
    v10 = fcntl(v7, 3, 0);
    fcntl(v7, 4, v10 | 4u);
    if (v20.sa_family == 2)
    {
      if (setsockopt(v7, 0, 20, &v18, 4u))
        goto LABEL_10;
    }
    else if (setsockopt(v7, 41, 61, &v18, 4u))
    {
      v5 = "ProxyTCPAccept: IP_RECVPKTINFO %d errno %d (%s)";
LABEL_10:
      v11 = mDNSLogCategory_Default;
      __error();
      v12 = __error();
      strerror(*v12);
      LogMsgWithLevel(v11, OS_LOG_TYPE_DEFAULT, v5, v13, v14, v15, v16, v17, v7);
      mDNSPlatformDisposeProxyContext(v9);
      return close(v7);
    }
    *((_QWORD *)v9 + 3) = ProxyTCPSocketCallBack;
    v9[4] = v7;
    *((_QWORD *)v9 + 4) = v9;
    *((_QWORD *)v9 + 5) = "TCP Proxy packet reception";
    *((_BYTE *)v9 + 65) = 1;
    *((_QWORD *)v9 + 9) = *(_QWORD *)(a3 + 72);
    KQueueSet(v7, 1u, -1, v9 + 6);
  }
}

void ProxyTCPSocketCallBack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  ssize_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  char *v13;
  ssize_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  NSObject *v29;
  size_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unsigned int v39;
  char *v40;
  int v41;
  int v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  socklen_t v48;
  socklen_t v49;
  _OWORD v50[3];
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
  __int128 v61;
  __int128 v62;
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
  uint64_t v73;
  _QWORD v74[3];
  _QWORD v75[3];
  sockaddr v76[2];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  sockaddr v83[2];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  memset(v83, 0, sizeof(v83));
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  memset(v76, 0, sizeof(v76));
  memset(v75, 0, 20);
  memset(v74, 0, 20);
  v73 = 0;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  memset(v50, 0, sizeof(v50));
  v49 = 408;
  LOBYTE(v48) = 0;
  v5 = *(unsigned int *)(a3 + 100);
  if (v5 >= 2)
  {
    v13 = *(char **)(a3 + 88);
  }
  else
  {
    v6 = mDNSPlatformReadTCP(a3, (void *)(a3 + v5 + 96), 2 - v5, &v48);
    if (v6 < 0 || (_BYTE)v48)
    {
      v29 = mDNSLogCategory_Default;
      v28 = "ProxyTCPRead: attempt to read message length failed";
      goto LABEL_18;
    }
    v12 = *(_DWORD *)(a3 + 100) + v6;
    *(_DWORD *)(a3 + 100) = v12;
    if (v12 <= 1)
    {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPRead: nread %d, n %d", v7, v8, v9, v10, v11, v12);
      return;
    }
    v30 = __rev16(*(unsigned __int16 *)(a3 + 96));
    *(_WORD *)(a3 + 96) = v30;
    if (v30 <= 0xB)
    {
      v27 = mDNSLogCategory_Default;
      v41 = v30;
      v28 = "ProxyTCPRead: Message length too short (%d bytes)";
      goto LABEL_16;
    }
    v13 = (char *)malloc_type_malloc(v30, 0xA172743EuLL);
    if (!v13)
      __break(1u);
    *(_QWORD *)(a3 + 88) = v13;
    LODWORD(v5) = *(_DWORD *)(a3 + 100);
  }
  v14 = mDNSPlatformReadTCP(a3, &v13[(v5 - 2)], *(unsigned __int16 *)(a3 + 96) - ((_DWORD)v5 - 2), &v48);
  if (v14 < 0 || (_BYTE)v48)
  {
    v27 = mDNSLogCategory_Default;
    v41 = v14;
    v28 = "ProxyTCPRead: read failure n %d, closed %d";
LABEL_16:
    v29 = v27;
LABEL_18:
    LogMsgWithLevel(v29, OS_LOG_TYPE_DEFAULT, v28, v7, v8, v9, v10, v11, v41);
    mDNSPlatformDisposeProxyContext((_DWORD *)a3);
    return;
  }
  v15 = *(_DWORD *)(a3 + 100) + v14;
  *(_DWORD *)(a3 + 100) = v15;
  if (v15 - 2 == *(unsigned __int16 *)(a3 + 96))
  {
    KQueueSet(a1, 2u, -1, (void *)(a3 + 24));
    memset(v76, 0, sizeof(v76));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    memset(v83, 0, sizeof(v83));
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v48 = 128;
    if (getsockname(a1, v76, &v48) < 0)
    {
      v31 = mDNSLogCategory_Default;
      v42 = a1;
      __error();
      v37 = "ProxyTCPReceive: getsockname(fd=%d) errno %d";
    }
    else
    {
      if ((getpeername(a1, v83, &v48) & 0x80000000) == 0)
      {
        if (getsockopt(a1, 6, 512, v50, &v49))
        {
          v21 = mDNSLogCategory_Default;
          __error();
          LogMsgWithLevel(v21, OS_LOG_TYPE_DEFAULT, "ProxyTCPReceive: getsockopt for TCP_INFO failed (fd=%d) errno %d", v22, v23, v24, v25, v26, a1);
          return;
        }
        v38 = SHIDWORD(v51);
        if (v83[0].sa_family == 30)
        {
          LODWORD(v75[0]) = 6;
          *(sockaddr *)((char *)v75 + 4) = *(sockaddr *)&v83[0].sa_data[6];
          v39 = *(unsigned __int16 *)v83[0].sa_data;
          LODWORD(v74[0]) = 6;
          *(sockaddr *)((char *)v74 + 4) = *(sockaddr *)&v76[0].sa_data[6];
          if ((mDNS_LoggingEnabled & 1) != 0)
          {
            v40 = "ProxyTCPReceive received IPv6 packet(len %d) from %#-15a to %#-15a on skt %d %s ifindex %d";
            goto LABEL_34;
          }
LABEL_35:
          (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD *, _QWORD, _QWORD *, uint64_t, uint64_t, uint64_t, _QWORD *, _QWORD *, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(a3 + 72) + 984))(a3, *(_QWORD *)(a3 + 88), *(_QWORD *)(a3 + 88) + *(unsigned __int16 *)(a3 + 96), v75, v39, v74, 13568, v38, a3, v43, v44, v45, v46, v47);
          return;
        }
        if (v83[0].sa_family == 2)
        {
          LODWORD(v75[0]) = 4;
          HIDWORD(v75[0]) = *(_DWORD *)&v83[0].sa_data[2];
          v39 = *(unsigned __int16 *)v83[0].sa_data;
          LODWORD(v74[0]) = 4;
          HIDWORD(v74[0]) = *(_DWORD *)&v76[0].sa_data[2];
          if ((mDNS_LoggingEnabled & 1) != 0)
          {
            v40 = "ProxyTCPReceive received IPv4 packet(len %d) from %#-15a to %#-15a on skt %d %s ifindex %d";
LABEL_34:
            v46 = 0;
            v47 = SHIDWORD(v51);
            v44 = v74;
            v45 = a1;
            v43 = v75;
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, v40, v16, v17, v18, v19, v20, *(unsigned __int16 *)(a3 + 96));
            goto LABEL_35;
          }
          goto LABEL_35;
        }
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPReceive from is unknown address family %d", v16, v17, v18, v19, v20, v83[0].sa_family);
        goto LABEL_26;
      }
      v31 = mDNSLogCategory_Default;
      v42 = a1;
      __error();
      v37 = "ProxyTCPReceive: getpeername(fd=%d) errno %d";
    }
    LogMsgWithLevel(v31, OS_LOG_TYPE_DEFAULT, v37, v32, v33, v34, v35, v36, v42);
LABEL_26:
    mDNSPlatformDisposeProxyContext((_DWORD *)a3);
  }
}

void mDNSPlatformDisposeProxyContext(_DWORD *a1)
{
  int v2;
  void *v3;

  if (a1)
  {
    v2 = a1[4];
    if ((v2 & 0x80000000) == 0)
    {
      close(v2);
      a1[4] = -1;
    }
    v3 = (void *)*((_QWORD *)a1 + 11);
    if (v3)
      free(v3);
    free(a1);
  }
}

void __mdns_system_log_block_invoke(id a1)
{
  mdns_system_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "system");
}

const __SCPreferences *_mdns_system_create_locked_prefs(int *a1)
{
  const __SCPreferences *v2;
  int v3;
  const __SCPreferences *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;

  v2 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, CFSTR("com.apple.mDNSResponder"), 0, kSCPreferencesUseEntitlementAuthorization);
  if (!v2)
  {
    if (SCError())
    {
      v3 = SCError();
      if (!v3)
        goto LABEL_4;
      v5 = v3;
    }
    else
    {
      v5 = -6700;
    }
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6694);
    v6 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "SCPreferencesCreateWithAuthorization failed: %{mdns:err}ld", (uint8_t *)&v9, 0xCu);
    }
    v4 = 0;
LABEL_23:
    v2 = 0;
    if (!a1)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_4:
  if (SCPreferencesLock(v2, 0))
  {
    v4 = 0;
    v5 = 0;
    if (!a1)
      goto LABEL_25;
LABEL_24:
    *a1 = v5;
    goto LABEL_25;
  }
  if (!SCError())
  {
    v5 = -6700;
    goto LABEL_18;
  }
  v5 = SCError();
  if (v5)
  {
LABEL_18:
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6694);
    v7 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed: %{mdns:err}ld", (uint8_t *)&v9, 0xCu);
    }
    v4 = v2;
    goto LABEL_23;
  }
  v4 = 0;
  if (a1)
    goto LABEL_24;
LABEL_25:
  if (v4)
    CFRelease(v4);
  return v2;
}

uint64_t _mdns_system_commit_and_apply_prefs(const __SCPreferences *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v7;
  uint64_t v8;

  if (!SCPreferencesCommitChanges(a1))
  {
    if (SCError())
    {
      v2 = SCError();
      if (!(_DWORD)v2)
        goto LABEL_4;
      v3 = v2;
    }
    else
    {
      v3 = 4294960596;
    }
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6694);
    v4 = mdns_system_log_s_log;
    if (!os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
      return v3;
    v7 = 134217984;
    v8 = (int)v3;
    v5 = "SCPreferencesCommitChanges failed: %{mdns:err}ld";
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0xCu);
    return v3;
  }
LABEL_4:
  if (SCPreferencesApplyChanges(a1))
    return 0;
  if (SCError())
  {
    v3 = SCError();
    if (!(_DWORD)v3)
      return v3;
  }
  else
  {
    v3 = 4294960596;
  }
  if (mdns_system_log_s_once != -1)
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6694);
  v4 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v7 = 134217984;
    v8 = (int)v3;
    v5 = "SCPreferencesApplyChanges failed: %{mdns:err}ld";
    goto LABEL_20;
  }
  return v3;
}

void _mdns_system_unlock_and_forget_prefs(const __SCPreferences **a1)
{
  const __SCPreferences *v1;
  int v2;
  int v3;
  NSObject *v4;
  int v5;
  uint64_t v6;

  v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    if (!SCPreferencesUnlock(v1))
    {
      if (!SCError())
      {
        v3 = -6700;
        goto LABEL_7;
      }
      v2 = SCError();
      if (v2)
      {
        v3 = v2;
LABEL_7:
        if (mdns_system_log_s_once != -1)
          dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6694);
        v4 = mdns_system_log_s_log;
        if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v5 = 134217984;
          v6 = v3;
          _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "SCPreferencesUnlock failed: %{mdns:err}ld", (uint8_t *)&v5, 0xCu);
        }
      }
    }
    CFRelease(v1);
  }
}

char *mdns_system_interface_index_to_name(unsigned int a1)
{
  char *v2;
  char *result;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  char v9[8];
  uint64_t v10;
  char v11;

  *(_QWORD *)v9 = 0;
  v10 = 0;
  v11 = 0;
  v2 = if_indextoname(a1, v9);
  if (v2)
  {
    result = strdup(v2);
    if (result)
      return result;
    goto LABEL_6;
  }
  if (!*__error())
  {
LABEL_7:
    v4 = -6700;
    goto LABEL_8;
  }
  v4 = *__error();
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
LABEL_8:
  if (mdns_system_log_s_once != -1)
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6694);
  v5 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109376;
    v6[1] = a1;
    v7 = 2048;
    v8 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "if_indextoname() for %u failed: %{darwin.errno}ld", (uint8_t *)v6, 0x12u);
  }
  return 0;
}

uint64_t mdns_system_pid_to_uuid(int a1, unsigned __int8 *a2)
{
  _OWORD v4[3];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  if (proc_pidinfo(a1, 17, 1uLL, v4, 56) != 56)
    return 4294960596;
  if (a2)
    uuid_copy(a2, (const unsigned __int8 *)v4);
  return 0;
}

uint64_t mdns_system_pid_to_name(int a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  __int128 v6;
  _OWORD v7[3];

  v6 = 0u;
  memset(v7, 0, sizeof(v7));
  if (proc_pidinfo(a1, 13, 1uLL, &v6, 64) != 64)
    return 0;
  if (!a2)
    __break(1u);
  v3 = 0;
  while (1)
  {
    v4 = *((unsigned __int8 *)v7 + v3);
    *(_BYTE *)(a2 + v3) = v4;
    if (!v4)
      break;
    if (++v3 == 15)
    {
      *(_BYTE *)(a2 + 15) = 0;
      return a2;
    }
  }
  return a2;
}

void *_mdns_push_server_copy_description(uint64_t a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int appended;
  const __CFArray *v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  const char *v15;
  int v16;
  _QWORD v18[7];
  char v19;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
  {
    v11 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  if (a2)
  {
    appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1);
    *((_DWORD *)v22 + 6) = appended;
    if (appended)
      goto LABEL_13;
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 64)) >= 1)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2000000000;
    v20[3] = "addresses: {";
    v9 = *(const __CFArray **)(a1 + 64);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 0x40000000;
    v18[2] = ___mdns_push_server_copy_description_block_invoke;
    v18[3] = &unk_10013EDA8;
    v18[5] = v20;
    v18[6] = v7;
    v18[4] = &v21;
    v19 = a3;
    mdns_cfarray_enumerate(v9, (uint64_t)v18);
    v10 = mdns_string_builder_append_formatted(v7, "}");
    *((_DWORD *)v22 + 6) = v10;
    _Block_object_dispose(v20, 8);
    v11 = 0;
    if (v10)
      goto LABEL_14;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v12 = mdns_string_builder_append_formatted(v7, "srv name: ");
    *((_DWORD *)v22 + 6) = v12;
    if (v12)
      goto LABEL_13;
    v13 = mdns_string_builder_append_description(v7, *(_QWORD *)(a1 + 48), a3);
    *((_DWORD *)v22 + 6) = v13;
    if (v13)
      goto LABEL_13;
  }
  v14 = mdns_string_builder_append_formatted(v7, ", ");
  *((_DWORD *)v22 + 6) = v14;
  if (v14)
    goto LABEL_13;
  v15 = *(const char **)(a1 + 56);
  if (!v15)
    v15 = "";
  v16 = mdns_string_builder_append_formatted(v7, "interface: %s/%u", v15, *(_DWORD *)(a1 + 96));
  *((_DWORD *)v22 + 6) = v16;
  if (v16)
LABEL_13:
    v11 = 0;
  else
    v11 = mdns_string_builder_copy_string((uint64_t)v7);
LABEL_14:
  os_release(v7);
LABEL_15:
  _Block_object_dispose(&v21, 8);
  return v11;
}

void _mdns_push_server_finalize(_QWORD *a1)
{
  void *v2;
  const void *v3;
  const void *v4;
  void *v5;

  v2 = (void *)a1[6];
  if (v2)
  {
    os_release(v2);
    a1[6] = 0;
  }
  v3 = (const void *)a1[8];
  if (v3)
  {
    CFRelease(v3);
    a1[8] = 0;
  }
  v4 = (const void *)a1[9];
  if (v4)
  {
    CFRelease(v4);
    a1[9] = 0;
  }
  v5 = (void *)a1[7];
  if (v5)
  {
    free(v5);
    a1[7] = 0;
  }
}

BOOL ___mdns_push_server_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

_QWORD *mdns_push_server_create()
{
  uint64_t v0;
  _QWORD *v1;
  _UNKNOWN **v2;
  void (*v3)(_QWORD *);
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v5;

  v0 = _os_object_alloc(OS_mdns_push_server, 104);
  v1 = (_QWORD *)v0;
  if (v0)
  {
    v2 = &_mdns_push_server_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_push_server_kind;
    do
    {
      v3 = (void (*)(_QWORD *))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
    v1[8] = Mutable;
    if (!Mutable || (v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks), (v1[9] = v5) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

void mdns_push_server_set_srv_name(uint64_t a1, void *object)
{
  void *v4;

  if (!*(_BYTE *)(a1 + 103))
  {
    os_retain(object);
    v4 = *(void **)(a1 + 48);
    if (v4)
      os_release(v4);
    *(_QWORD *)(a1 + 48) = object;
  }
}

_QWORD *mdns_push_server_create_subscriber(void *a1)
{
  uint64_t v2;
  _QWORD *v3;
  _UNKNOWN **v4;
  void (*v5)(_QWORD *);
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = _os_object_alloc(OS_mdns_subscriber, 136);
  if (!v2)
    return 0;
  v3 = (_QWORD *)v2;
  v4 = &_mdns_subscriber_kind;
  *(_QWORD *)(v2 + 16) = &_mdns_subscriber_kind;
  do
  {
    v5 = (void (*)(_QWORD *))v4[2];
    if (v5)
      v5(v3);
    v4 = (_UNKNOWN **)*v4;
  }
  while (v4);
  do
  {
    v6 = __ldxr(&mdns_push_server_create_subscriber_s_last_id);
    v7 = v6 + 1;
  }
  while (__stxr(v7, &mdns_push_server_create_subscriber_s_last_id));
  v3[15] = v7;
  os_retain(a1);
  v8 = (void *)v3[7];
  if (v8)
    os_release(v8);
  v3[7] = a1;
  if (_mdns_domain_name_get_root_s_once != -1)
    dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
  v9 = _mdns_domain_name_get_root_s_root;
  v3[10] = _mdns_domain_name_get_root_s_root;
  if (v9)
    v10 = v3;
  else
    v10 = 0;
  if (!v9)
    os_release(v3);
  return v10;
}

void *_mdns_subscriber_copy_description(uint64_t a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v11)(void);
  char *v12;
  const char *v13;
  int v14;
  int v15;
  const char *v16;

  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (!a2
    || !mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1))
  {
    v9 = *(_QWORD *)(a1 + 80);
    if (v9)
    {
      if (a3)
      {
        v10 = (_QWORD *)(v9 + 16);
        while (1)
        {
          v10 = (_QWORD *)*v10;
          if (!v10)
            break;
          v11 = (uint64_t (*)(void))v10[3];
          if (v11)
          {
            v12 = (char *)v11();
            goto LABEL_14;
          }
        }
        v12 = 0;
LABEL_14:
        v13 = "«REDACTED»";
        if (v12)
          v13 = v12;
      }
      else
      {
        v12 = 0;
        v13 = *(const char **)(v9 + 40);
      }
    }
    else
    {
      v12 = 0;
      v13 = "«NO NAME»";
    }
    if (mdns_string_builder_append_formatted(v7, "name: %s, type: ", v13))
      goto LABEL_34;
    v14 = DNSRecordTypeValueToString(*(unsigned __int16 *)(a1 + 128))
        ? mdns_string_builder_append_formatted(v7, "%s")
        : mdns_string_builder_append_formatted(v7, "TYPE%u");
    if (v14 || mdns_string_builder_append_formatted(v7, ", class: "))
      goto LABEL_34;
    v15 = *(unsigned __int16 *)(a1 + 130);
    v16 = "ANY";
    if (v15 != 255)
      v16 = 0;
    if (v15 == 1)
      v16 = "IN";
    if (v16
       ? mdns_string_builder_append_formatted(v7, "%s")
       : mdns_string_builder_append_formatted(v7, "CLASS%u"))
    {
LABEL_34:
      v8 = 0;
      if (!v12)
        goto LABEL_32;
    }
    else
    {
      v8 = mdns_string_builder_copy_string((uint64_t)v7);
      if (!v12)
        goto LABEL_32;
    }
    free(v12);
    goto LABEL_32;
  }
  v8 = 0;
LABEL_32:
  os_release(v7);
  return v8;
}

void _mdns_subscriber_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  unint64_t *v4;
  const void *v5;
  const void *v6;

  v2 = (void *)a1[7];
  if (v2)
  {
    os_release(v2);
    a1[7] = 0;
  }
  v3 = (void *)a1[10];
  if (v3)
  {
    os_release(v3);
    a1[10] = 0;
  }
  v4 = a1 + 12;
  do
    v5 = (const void *)__ldxr(v4);
  while (__stxr(0, v4));
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[14];
  if (v6)
  {
    CFRelease(v6);
    a1[14] = 0;
  }
}

uint64_t _mdns_subscriber_get_internal_queue()
{
  if (_mdns_push_notifications_queue_s_once != -1)
    dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_35_6754);
  return _mdns_push_notifications_queue_s_queue;
}

void _mdns_subscriber_set_query(uint64_t a1, void *object, __int16 a3, __int16 a4)
{
  void *v8;

  if (object)
    os_retain(object);
  v8 = *(void **)(a1 + 80);
  if (v8)
    os_release(v8);
  *(_QWORD *)(a1 + 80) = object;
  *(_WORD *)(a1 + 128) = a3;
  *(_WORD *)(a1 + 130) = a4;
}

void _mdns_subscriber_activate(_WORD *object)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _UNKNOWN **v5;
  void (*v6)(uint64_t);
  CFMutableArrayRef Mutable;
  const __CFArray *v8;
  void *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  const __CFData *ValueAtIndex;
  const __CFData *v14;
  CFMutableArrayRef v15;
  SecCertificateRef v16;
  SecCertificateRef v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD aBlock[6];
  _QWORD v44[5];
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  _WORD *v51;
  __int16 v52;
  _WORD *v53;
  __int16 v54;
  _WORD *v55;

  v2 = *((_QWORD *)object + 7);
  v45 = 0;
  if ((_mdns_subscriber_list_insert_conditionally((uint64_t *)(v2 + 24), object, 0, &v45) & 1) == 0)
    _mdns_subscriber_list_insert_conditionally((uint64_t *)(v2 + 32), object, 1, 0);
  if (!*(_QWORD *)(v2 + 40))
  {
    v3 = _os_object_alloc(OS_mdns_dso_client_session, 216);
    v4 = v3;
    if (v3)
    {
      v5 = &_mdns_dso_client_session_kind;
      *(_QWORD *)(v3 + 16) = &_mdns_dso_client_session_kind;
      do
      {
        v6 = (void (*)(uint64_t))v5[2];
        if (v6)
          v6(v4);
        v5 = (_UNKNOWN **)*v5;
      }
      while (v5);
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
      *(_QWORD *)(v4 + 152) = Mutable;
      if (!Mutable)
        v4 = 0;
    }
    if (CFArrayGetCount(*(CFArrayRef *)(v2 + 64)) < 1)
    {
      v9 = *(void **)(v2 + 48);
      if (v9 && !*(_BYTE *)(v4 + 124))
      {
        *(_QWORD *)(v4 + 136) = v9;
        os_retain(v9);
      }
    }
    else
    {
      v8 = *(const __CFArray **)(v2 + 64);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 0x40000000;
      v44[2] = ___mdns_push_server_add_subscriber_block_invoke;
      v44[3] = &__block_descriptor_tmp_20_6753;
      v44[4] = v4;
      mdns_cfarray_enumerate(v8, (uint64_t)v44);
    }
    Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 72));
    if (Count >= 1)
    {
      v11 = Count;
      for (i = 0; i != v11; ++i)
      {
        ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 72), i);
        if (!*(_BYTE *)(v4 + 124))
        {
          v14 = ValueAtIndex;
          if (*(_QWORD *)(v4 + 160)
            || (v15 = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks),
                (*(_QWORD *)(v4 + 160) = v15) != 0))
          {
            v16 = SecCertificateCreateWithData(kCFAllocatorDefault, v14);
            if (v16)
            {
              v17 = v16;
              CFArrayAppendValue(*(CFMutableArrayRef *)(v4 + 160), v16);
              CFRelease(v17);
            }
          }
        }
      }
    }
    if (!*(_BYTE *)(v4 + 124))
      *(_DWORD *)(v4 + 208) = *(_DWORD *)(v2 + 96);
    if (_mdns_push_notifications_queue_s_once != -1)
      dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_35_6754);
    if (!*(_BYTE *)(v4 + 124))
    {
      v18 = _mdns_push_notifications_queue_s_queue;
      v19 = *(NSObject **)(v4 + 48);
      if (v19)
        dispatch_release(v19);
      *(_QWORD *)(v4 + 48) = v18;
      dispatch_retain(v18);
      if (!*(_BYTE *)(v4 + 124))
      {
        *(int32x2_t *)(v4 + 116) = vdup_n_s32(0x3A98u);
        *(_WORD *)(v4 + 212) = 1;
      }
    }
    os_retain((void *)v2);
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 0x40000000;
    aBlock[2] = ___mdns_push_server_add_subscriber_block_invoke_2;
    aBlock[3] = &__block_descriptor_tmp_23_6755;
    aBlock[4] = v2;
    aBlock[5] = v4;
    if (!*(_BYTE *)(v4 + 124))
    {
      v20 = _Block_copy(aBlock);
      v21 = *(const void **)(v4 + 200);
      if (v21)
        _Block_release(v21);
      *(_QWORD *)(v4 + 200) = v20;
    }
    if (*(_QWORD *)(v2 + 88) && *(_QWORD *)(v2 + 80) && !*(_BYTE *)(v4 + 124))
      *(_BYTE *)(v4 + 215) = 1;
    *(_QWORD *)(v2 + 40) = v4;
    os_retain((void *)v4);
    v22 = *(_QWORD *)(v2 + 40);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 0x40000000;
    v42[2] = ___mdns_push_server_add_subscriber_block_invoke_4;
    v42[3] = &__block_descriptor_tmp_25_6756;
    v42[4] = v2;
    if (!*(_BYTE *)(v22 + 124))
    {
      v23 = _Block_copy(v42);
      v24 = *(const void **)(v22 + 64);
      if (v24)
        _Block_release(v24);
      *(_QWORD *)(v22 + 64) = v23;
      v25 = *(_QWORD *)(v2 + 40);
      if (!*(_BYTE *)(v25 + 124))
      {
        if (*(_QWORD *)(v25 + 48))
        {
          if (*(_QWORD *)(v25 + 64))
          {
            v26 = *(_QWORD *)(v25 + 16);
            if (!(*(unsigned int (**)(_QWORD))(v26 + 56))(*(_QWORD *)(v2 + 40)))
            {
              if (_mdns_dso_session_log_s_once != -1)
                dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5946);
              v27 = _mdns_dso_session_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
              {
                v28 = *(_QWORD *)(v25 + 40);
                *(_DWORD *)buf = 134218242;
                v47 = v28;
                v48 = 2112;
                v49 = v25;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[DSO%llu] DSO session start -- session: %@", buf, 0x16u);
              }
              v29 = (*(uint64_t (**)(uint64_t))(v26 + 48))(v25);
              *(_QWORD *)(v25 + 24) = mdns_get_monotonic_time_ns();
              if (!v29)
                *(_BYTE *)(v25 + 124) = 1;
            }
          }
        }
      }
    }
  }
  _mdns_push_server_send_pending_subscribe_requests(v2);
  if (!v45)
  {
    v37 = *(_QWORD *)(v2 + 40);
    v38 = *((_QWORD *)object + 15);
    if (v37)
    {
      if (_mdns_push_notifications_log_s_once != -1)
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
      v39 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
        return;
      v40 = *(_QWORD *)(v37 + 40);
      *(_DWORD *)buf = 134218754;
      v47 = v38;
      v48 = 2048;
      v49 = v40;
      v50 = 2112;
      v51 = (_WORD *)v2;
      v52 = 2112;
      v53 = object;
      v34 = "[Sub%llu->DSO%llu] New subscription added to the session -- server: %@, subscriber: %@";
      v35 = v39;
      v36 = 42;
    }
    else
    {
      if (_mdns_push_notifications_log_s_once != -1)
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
      v41 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 134218498;
      v47 = v38;
      v48 = 2112;
      v49 = v2;
      v50 = 2112;
      v51 = object;
      v34 = "[Sub%llu] New subscription added to the session -- server: %@, subscriber: %@";
      v35 = v41;
      v36 = 32;
    }
LABEL_70:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    return;
  }
  if (_mdns_push_notifications_log_s_once != -1)
    dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
  v30 = _mdns_push_notifications_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    v31 = *((_QWORD *)object + 15);
    v32 = *(_QWORD *)(v45 + 120);
    v33 = *(_QWORD *)(v2 + 40);
    if (v33)
      v33 = *(_QWORD *)(v33 + 40);
    *(_DWORD *)buf = 134219010;
    v47 = v31;
    v48 = 2048;
    v49 = v32;
    v50 = 2048;
    v51 = (_WORD *)v33;
    v52 = 2112;
    v53 = (_WORD *)v2;
    v54 = 2112;
    v55 = object;
    v34 = "[DupSub%llu->Sub%llu->DSO%llu] Existing subscription in the session -- server: %@, subscriber: %@";
    v35 = v30;
    v36 = 52;
    goto LABEL_70;
  }
}

void _mdns_subscriber_invalidate(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  const void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _WORD *v23;
  _UNKNOWN **v24;
  void (*v25)(_WORD *);
  NSObject **message;
  _QWORD *v27;
  _QWORD v28[5];
  unsigned __int8 v29;
  _BYTE buf[24];
  void *v31;
  _BYTE v32[12];
  _BYTE v33[6];
  int v34;
  __int16 v35;
  int v36;

  v2 = *(_QWORD *)(a1 + 56);
  v29 = 0;
  v3 = _mdns_subscriber_list_remove((uint64_t *)(v2 + 24), (_QWORD *)a1, &v29);
  if ((v3 & 1) != 0)
  {
    if (!v29)
      goto LABEL_15;
  }
  else
  {
    _mdns_subscriber_list_remove((uint64_t *)(v2 + 32), (_QWORD *)a1, &v29);
  }
  v4 = v3 ^ 1;
  v5 = *(_QWORD *)(v2 + 40);
  v6 = *(_QWORD *)(a1 + 120);
  if (v5)
  {
    if (_mdns_push_notifications_log_s_once != -1)
      dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
    v7 = _mdns_push_notifications_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v5 + 40);
      v9 = *(unsigned __int8 *)(v2 + 102);
      *(_DWORD *)buf = 134219522;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v31 = (void *)v2;
      *(_WORD *)v32 = 2112;
      *(_QWORD *)&v32[2] = a1;
      *(_WORD *)&v32[10] = 1024;
      *(_DWORD *)v33 = v4;
      *(_WORD *)&v33[4] = 1024;
      v34 = v29;
      v35 = 1024;
      v36 = v9;
      v10 = "[Sub%llu->DSO%llu] Subscriber removed -- server: %@, subscriber: %@, pending: %{mdns:yesno}d, duplicate: %{m"
            "dns:yesno}d, session ready: %{mdns:yesno}d";
      v11 = v7;
      v12 = 60;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else
  {
    if (_mdns_push_notifications_log_s_once != -1)
      dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
    v13 = _mdns_push_notifications_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(unsigned __int8 *)(v2 + 102);
      *(_DWORD *)buf = 134219266;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      v31 = (void *)a1;
      *(_WORD *)v32 = 1024;
      *(_DWORD *)&v32[2] = v4;
      *(_WORD *)&v32[6] = 1024;
      *(_DWORD *)&v32[8] = v29;
      *(_WORD *)v33 = 1024;
      *(_DWORD *)&v33[2] = v14;
      v10 = "[Sub%llu] Subscriber removed -- server: %@, subscriber: %@, pending: %{mdns:yesno}d, duplicate: %{mdns:yesno"
            "}d, session ready: %{mdns:yesno}d";
      v11 = v13;
      v12 = 50;
      goto LABEL_14;
    }
  }
LABEL_15:
  if (*(_WORD *)(a1 + 132))
  {
    if (!v29)
    {
      v18 = *(_QWORD *)(v2 + 40);
      if (v18)
      {
        if (*(_BYTE *)(v2 + 102))
        {
          v19 = *(_QWORD *)(a1 + 120);
          if (_mdns_push_notifications_log_s_once != -1)
            dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
          v20 = _mdns_push_notifications_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_QWORD *)(v18 + 40);
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v21;
            *(_WORD *)&buf[22] = 2112;
            v31 = (void *)v2;
            *(_WORD *)v32 = 2112;
            *(_QWORD *)&v32[2] = a1;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Sub%llu->DSO%llu] Subscriber removed and unsubscribing from the session -- server: %@, subscriber: %@", buf, 0x2Au);
          }
          v22 = _os_object_alloc(OS_mdns_dso_unsubscribe_message_builder, 40);
          v23 = (_WORD *)v22;
          if (v22)
          {
            v24 = &_mdns_dso_unsubscribe_message_builder_kind;
            *(_QWORD *)(v22 + 16) = &_mdns_dso_unsubscribe_message_builder_kind;
            do
            {
              v25 = (void (*)(_WORD *))v24[2];
              if (v25)
                v25(v23);
              v24 = (_UNKNOWN **)*v24;
            }
            while (v24);
          }
          v23[14] = 0;
          v23[16] = *(_WORD *)(a1 + 132);
          message = (NSObject **)mdns_dso_message_builder_create_message((uint64_t)v23);
          mdns_dso_session_send(*(_QWORD **)(v2 + 40), message[3]);
          os_release(message);
          os_release(v23);
          v27 = *(_QWORD **)(v2 + 40);
          if ((*(unsigned int (**)(_QWORD *))(v27[2] + 104))(v27))
          {
            os_retain(v27);
            if (_mdns_dso_session_queue_s_once != -1)
              dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
            *(_QWORD *)buf = _NSConcreteStackBlock;
            *(_QWORD *)&buf[8] = 0x40000000;
            *(_QWORD *)&buf[16] = __mdns_dso_session_remove_activity_block_invoke;
            v31 = &__block_descriptor_tmp_4_6006;
            *(_QWORD *)v32 = v27;
            dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, buf);
          }
        }
      }
    }
    *(_WORD *)(a1 + 132) = 0;
  }
  v15 = *(NSObject **)(a1 + 88);
  if (v15)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 88));
    dispatch_release(v15);
    *(_QWORD *)(a1 + 88) = 0;
  }
  v16 = *(const void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = 0;
  if (v16)
  {
    v17 = *(NSObject **)(a1 + 24);
    if (v17)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 0x40000000;
      v28[2] = ___mdns_subscriber_invalidate_block_invoke;
      v28[3] = &unk_10013EF30;
      v28[4] = v16;
      dispatch_async(v17, v28);
    }
    _Block_release(v16);
  }
}

uint64_t _mdns_subscriber_get_name(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

uint64_t _mdns_subscriber_get_type(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 128);
}

uint64_t _mdns_subscriber_get_class(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 130);
}

uint64_t _mdns_subscriber_list_remove(uint64_t *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v4 = *a1;
  if (!*a1)
    goto LABEL_5;
  v6 = a1;
  while ((_mdns_subscriber_equal(v4, (uint64_t)a2) & 1) == 0)
  {
    v6 = (uint64_t *)(v4 + 64);
    v4 = *(_QWORD *)(v4 + 64);
    if (!v4)
      goto LABEL_5;
  }
  if ((_QWORD *)v4 != a2)
  {
    do
    {
      v8 = v4;
      v4 = *(_QWORD *)(v4 + 72);
      if (v4)
        v9 = v4 == (_QWORD)a2;
      else
        v9 = 1;
    }
    while (!v9);
    if (v4)
    {
      *(_QWORD *)(v8 + 72) = a2[9];
LABEL_18:
      LOBYTE(v4) = 1;
      goto LABEL_19;
    }
LABEL_5:
    result = 0;
    if (!a3)
      return result;
    goto LABEL_6;
  }
  v10 = a2[9];
  if (v10)
  {
    *v6 = v10;
    *(_QWORD *)(v10 + 64) = a2[8];
    goto LABEL_18;
  }
  LOBYTE(v4) = 0;
  *v6 = a2[8];
LABEL_19:
  a2[8] = 0;
  a2[9] = 0;
  os_release(a2);
  result = 1;
  if (a3)
LABEL_6:
    *a3 = v4;
  return result;
}

uint64_t ___mdns_subscriber_invalidate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___mdns_push_notifications_log_block_invoke(id a1)
{
  _mdns_push_notifications_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "push_notifications");
}

uint64_t _mdns_subscriber_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2)
    return 1;
  if (*(unsigned __int16 *)(a1 + 128) == *(unsigned __int16 *)(a2 + 128)
    && *(unsigned __int16 *)(a1 + 130) == *(unsigned __int16 *)(a2 + 130))
  {
    return _mdns_domain_name_equal(*(_QWORD *)(a1 + 80), *(_QWORD *)(a2 + 80));
  }
  return 0;
}

uint64_t _mdns_subscriber_list_insert_conditionally(uint64_t *a1, _WORD *object, char a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v7 = *a1;
  if (*a1)
  {
    while (1)
    {
      v8 = v7;
      if ((_mdns_subscriber_equal(v7, (uint64_t)object) & 1) != 0)
        break;
      v7 = *(_QWORD *)(v8 + 64);
      if (!v7)
      {
        a1 = (uint64_t *)(v8 + 64);
        goto LABEL_5;
      }
    }
    object[66] = *(_WORD *)(v8 + 132);
    v13 = v8;
    do
    {
      v14 = v13;
      v13 = *(_QWORD *)(v13 + 72);
    }
    while (v13);
    a1 = (uint64_t *)(v14 + 72);
    v9 = 1;
LABEL_12:
    *a1 = (uint64_t)object;
    os_retain(object);
    v10 = v8;
    v11 = v9;
    if (!a4)
      return v11;
    goto LABEL_7;
  }
LABEL_5:
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if ((a3 & 1) != 0)
    goto LABEL_12;
  if (a4)
LABEL_7:
    *a4 = v10;
  return v11;
}

uint64_t ___mdns_push_server_add_subscriber_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 124))
    CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 152), a2);
  return 1;
}

void ___mdns_push_server_add_subscriber_block_invoke_2(uint64_t a1, int a2, int a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  int v18;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7 = *(void **)(v6 + 40);
  if (v7 == v5)
  {
    switch(a2)
    {
      case 1:
        *(_WORD *)(v6 + 100) = 0;
        v8 = *(void **)(v6 + 24);
        if (v8)
        {
          v9 = (_QWORD *)(v6 + 32);
          do
          {
            v10 = v9;
            v11 = *v9;
            v9 = (_QWORD *)(*v9 + 64);
          }
          while (v11);
          *v10 = v8;
          os_retain(v8);
          v12 = *(void **)(v6 + 24);
          if (v12)
          {
            os_release(v12);
            *(_QWORD *)(v6 + 24) = 0;
          }
        }
        for (i = *(_QWORD *)(v6 + 32); i; i = *(_QWORD *)(i + 64))
        {
          v14 = i;
          do
          {
            *(_WORD *)(v14 + 132) = 0;
            v14 = *(_QWORD *)(v14 + 72);
          }
          while (v14);
        }
        goto LABEL_2;
      case 2:
        v15 = *(_QWORD *)(v6 + 88);
        if (v15)
        {
          v16 = *(NSObject **)(v6 + 80);
          if (v16)
          {
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 0x40000000;
            v17[2] = ___mdns_push_server_add_subscriber_block_invoke_3;
            v17[3] = &unk_10013EE20;
            v17[4] = v15;
            v18 = a3;
            dispatch_async(v16, v17);
          }
        }
        break;
      case 3:
        *(_BYTE *)(v6 + 102) = 1;
        _mdns_push_server_send_pending_subscribe_requests(v6);
        break;
      case 4:
        if (v7)
        {
          mdns_dso_session_invalidate(v7);
          os_release(*(void **)(*(_QWORD *)(a1 + 32) + 40));
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
          v6 = *(_QWORD *)(a1 + 32);
        }
        *(_BYTE *)(v6 + 102) = 0;
        break;
      case 5:
        goto LABEL_4;
      default:
        return;
    }
  }
  else
  {
LABEL_2:
    if (a2 == 5)
    {
      v6 = *(_QWORD *)(a1 + 32);
LABEL_4:
      os_release((void *)v6);
      os_release(*(void **)(a1 + 40));
    }
  }
}

void ___mdns_push_server_add_subscriber_block_invoke_4(uint64_t a1, NSObject *a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
  _BYTE *v7;
  unsigned __int16 *v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  CFMutableArrayRef Mutable;
  const __CFArray *v26;
  CFMutableSetRef v27;
  const __CFSet *v28;
  int64_t v29;
  unint64_t v30;
  char *v31;
  int64_t v32;
  char *v33;
  _QWORD *v34;
  char *v35;
  void *Value;
  __CFArray *v37;
  unint64_t v38;
  const __CFSet *v39;
  char *v40;
  int v41;
  char *v42;
  unsigned __int16 v43;
  void *v44;
  void *v45;
  const __CFArray *v46;
  _QWORD *v47;
  uint64_t v48;
  size_t v49;
  void **v50;
  unint64_t v51;
  NSObject *v52;
  dispatch_source_t v53;
  NSObject *v54;
  NSObject *v55;
  unint64_t *v56;
  const void *v57;
  const void *v58;
  NSObject *v59;
  _QWORD *v60;
  _BYTE *v61;
  unint64_t v62;
  _QWORD handler[5];
  size_t size[5];
  void *__src;
  void **p_src;
  uint64_t v67;
  uint64_t v68;
  int v69[2];
  int v70;
  int v71;
  uint8_t buf[32];
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
  __int128 v85;
  __int128 v86;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = mdns_message_create_with_dispatch_data(a2, 0);
  if (v3)
  {
    v4 = v3;
    v5 = (_UNKNOWN **)*((_QWORD *)v3 + 2);
    if (!v5)
      goto LABEL_102;
    v6 = (_UNKNOWN **)*((_QWORD *)v3 + 2);
    while (v6 != &_mdns_dso_message_kind)
    {
      v6 = (_UNKNOWN **)*v6;
      if (!v6)
        goto LABEL_102;
    }
    if (*((_WORD *)v5 + 28))
    {
      if (*((_WORD *)v5 + 28) == 3)
      {
        while (v5 != (_UNKNOWN **)&_mdns_dso_push_message_kind)
        {
          v5 = (_UNKNOWN **)*v5;
          if (!v5)
          {
            v7 = 0;
            goto LABEL_34;
          }
        }
        v7 = v3;
LABEL_34:
        Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
        if (Mutable)
        {
          v26 = Mutable;
          v60 = v2;
          v27 = CFSetCreateMutable(kCFAllocatorDefault, 0, (const CFSetCallBacks *)&mdns_domain_name_cf_set_callbacks);
          v61 = v4;
          if (v27)
          {
            v28 = v27;
            v29 = 0;
            v30 = *((_QWORD *)v7 + 5);
            v62 = *((_QWORD *)v7 + 4);
            if (v30 < 0xC)
            {
              v31 = 0;
            }
            else
            {
              v31 = 0;
              if ((v30 & 0xFFFFFFFFFFFFFFFCLL) != 0xC)
              {
                v32 = __rev16(*(unsigned __int16 *)(v62 + 14));
                if ((uint64_t)(v30 - 16) >= v32)
                  v31 = (char *)(v62 + 16);
                else
                  v31 = 0;
                if ((uint64_t)(v30 - 16) >= v32)
                  v29 = v32;
                else
                  v29 = 0;
              }
            }
            v33 = &v31[v29];
            handler[0] = v31;
            if (v31 < &v31[v29])
            {
              v34 = 0;
              v35 = 0;
              while (1)
              {
                v85 = 0u;
                v86 = 0u;
                v83 = 0u;
                v84 = 0u;
                v81 = 0u;
                v82 = 0u;
                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                v75 = 0u;
                v76 = 0u;
                v73 = 0u;
                v74 = 0u;
                memset(buf, 0, sizeof(buf));
                v70 = 0;
                v71 = 0;
                __src = 0;
                *(_QWORD *)v69 = 0;
                if (_DNSMessageExtractRecordEx(v62, v30, v31, (char *)buf, (_WORD *)&v71 + 1, &v71, &v70, (unsigned __int16 **)&__src, (unint64_t *)v69, 0, 0, 0, 0, handler))break;
                v31 = (char *)handler[0];
                if (handler[0] > (unint64_t)v33)
                  break;
                if (v70 >= -2)
                {
                  if (v34)
                    os_release(v34);
                  v34 = mdns_domain_name_create_with_labels(buf, 0);
                  if (!v34)
                    break;
                  Value = (void *)CFSetGetValue(v28, v34);
                  if (!Value)
                  {
                    CFSetAddValue(v28, v34);
                    Value = v34;
                  }
                  v37 = v26;
                  if (v35)
                    free(v35);
                  v38 = *(_QWORD *)v69;
                  if (*(_QWORD *)v69)
                  {
                    v39 = v28;
                    v40 = (char *)__src;
                    v41 = HIWORD(v71);
                    size[0] = 0;
                    if (DNSMessageExtractRData(v62, v30, (char *)__src, *(unint64_t *)v69, HIWORD(v71), 0, 0, 0, size)|| !size[0])
                    {
                      goto LABEL_77;
                    }
                    v42 = (char *)malloc_type_calloc(1uLL, size[0], 0xF1748037uLL);
                    if (!v42)
                    {
                      __break(1u);
LABEL_76:
                      free(v35);
LABEL_77:
                      v35 = 0;
                      v28 = v39;
                      v26 = v37;
                      break;
                    }
                    v35 = v42;
                    if (DNSMessageExtractRData(v62, v30, v40, v38, v41, v42, size[0], 0, 0))
                      goto LABEL_76;
                    v43 = size[0];
                    v28 = v39;
                  }
                  else
                  {
                    v43 = 0;
                    v35 = 0;
                  }
                  v44 = mdns_resource_record_create(Value, SHIWORD(v71), v71, v70, v35, v43);
                  v26 = v37;
                  if (!v44)
                    break;
                  v45 = v44;
                  CFArrayAppendValue(v37, v44);
                  os_release(v45);
                  v31 = (char *)handler[0];
                }
                if (v31 >= v33)
                {
                  v46 = 0;
                  goto LABEL_79;
                }
              }
              v46 = v26;
              v26 = 0;
LABEL_79:
              v47 = v60;
              if (v34)
                os_release(v34);
              CFRelease(v28);
              if (v35)
                free(v35);
              v4 = v61;
              if (!v46)
              {
LABEL_85:
                if (v26)
                {
                  v49 = v47[3];
                  if (v49)
                  {
                    while (1)
                    {
                      __src = 0;
                      p_src = &__src;
                      v67 = 0x2000000000;
                      v68 = 0;
                      *(_QWORD *)buf = _NSConcreteStackBlock;
                      *(_QWORD *)&buf[8] = 0x40000000;
                      *(_QWORD *)&buf[16] = ___mdns_subscriber_process_change_notifications_block_invoke;
                      *(_QWORD *)&buf[24] = &unk_10013EE88;
                      *(_QWORD *)&v73 = &__src;
                      *((_QWORD *)&v73 + 1) = v49;
                      if (mdns_cfarray_enumerate(v26, (uint64_t)buf))
                      {
                        v50 = p_src;
                        v51 = (unint64_t)p_src[3];
                        if (v51)
                        {
                          if (*(_QWORD *)(v49 + 88))
                            goto LABEL_93;
                          v52 = *(NSObject **)(v49 + 24);
                          if (!v52)
                            goto LABEL_93;
                          v53 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v52);
                          *(_QWORD *)(v49 + 88) = v53;
                          if (v53)
                            break;
                        }
                      }
LABEL_98:
                      v58 = p_src[3];
                      if (v58)
                      {
                        CFRelease(v58);
                        p_src[3] = 0;
                      }
                      _Block_object_dispose(&__src, 8);
                      v49 = *(_QWORD *)(v49 + 64);
                      if (!v49)
                        goto LABEL_101;
                    }
                    os_retain((void *)v49);
                    v54 = *(NSObject **)(v49 + 88);
                    size[0] = (size_t)_NSConcreteStackBlock;
                    size[1] = 0x40000000;
                    size[2] = (size_t)___mdns_subscriber_process_change_notifications_block_invoke_2;
                    size[3] = (size_t)&__block_descriptor_tmp_28_6762;
                    size[4] = v49;
                    dispatch_source_set_event_handler(v54, size);
                    v55 = *(NSObject **)(v49 + 88);
                    handler[0] = _NSConcreteStackBlock;
                    handler[1] = 0x40000000;
                    handler[2] = ___mdns_subscriber_process_change_notifications_block_invoke_3;
                    handler[3] = &__block_descriptor_tmp_29_6763;
                    handler[4] = v49;
                    dispatch_source_set_cancel_handler(v55, handler);
                    dispatch_activate(*(dispatch_object_t *)(v49 + 88));
                    v50 = p_src;
                    v51 = (unint64_t)p_src[3];
LABEL_93:
                    v56 = (unint64_t *)(v49 + 96);
                    do
                      v57 = (const void *)__ldxr(v56);
                    while (__stxr(v51, v56));
                    if (v57)
                    {
                      CFRelease(v57);
                      v50 = p_src;
                    }
                    v50[3] = 0;
                    dispatch_source_merge_data(*(dispatch_source_t *)(v49 + 88), 1uLL);
                    goto LABEL_98;
                  }
LABEL_101:
                  CFRelease(v26);
                  v4 = v61;
                }
                goto LABEL_102;
              }
LABEL_84:
              CFRelease(v46);
              goto LABEL_85;
            }
            v46 = v27;
          }
          else
          {
            v46 = v26;
            v26 = 0;
          }
          v47 = v60;
          goto LABEL_84;
        }
      }
      goto LABEL_102;
    }
    v8 = (unsigned __int16 *)*((_QWORD *)v3 + 4);
    v9 = *((_QWORD *)v4 + 5);
    if (v8)
      v10 = v9 >= 0xC;
    else
      v10 = 0;
    if (!v10 || ((char)v8[1] & 0x80000000) == 0 || !__rev16(*v8))
      goto LABEL_102;
    v11 = __rev16(*(unsigned __int16 *)_mdns_dso_message_get_header((uint64_t)v8, v9));
    if (!v11)
    {
      if (_mdns_push_notifications_log_s_once != -1)
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
      v59 = _mdns_push_notifications_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "Unexpected DSO response message ID: %u", buf, 8u);
      }
      goto LABEL_102;
    }
    v13 = v2 + 4;
    v12 = v2[4];
    if (!v12)
      goto LABEL_102;
    if (*(unsigned __int16 *)(v12 + 132) != v11)
    {
      while (1)
      {
        v14 = v12;
        v12 = *(_QWORD *)(v12 + 64);
        if (!v12)
          goto LABEL_102;
        if (*(unsigned __int16 *)(v12 + 132) == v11)
        {
          v13 = (_QWORD *)(v14 + 64);
          break;
        }
      }
    }
    if ((*(_BYTE *)(_mdns_dso_message_get_header(*((_QWORD *)v4 + 4), *((_QWORD *)v4 + 5)) + 3) & 0xF) != 0)
    {
LABEL_102:
      os_release(v4);
      return;
    }
    *v13 = *(_QWORD *)(v12 + 64);
    *(_QWORD *)(v12 + 64) = 0;
    v15 = v2 + 3;
    do
    {
      v16 = v15;
      v17 = *v15;
      v15 = (_QWORD *)(*v15 + 64);
    }
    while (v17);
    *v16 = v12;
    os_retain((void *)v12);
    v18 = v2[5];
    v19 = *(_QWORD *)(v12 + 120);
    if (v18)
    {
      if (_mdns_push_notifications_log_s_once != -1)
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
      v20 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_74;
      v21 = *(_QWORD *)(v18 + 40);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v21;
      v22 = "[Sub%llu->DSO%llu] Subscription is now active.";
      v23 = v20;
      v24 = 22;
    }
    else
    {
      if (_mdns_push_notifications_log_s_once != -1)
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6744);
      v48 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_74;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v19;
      v22 = "[Sub%llu] Subscription is now active.";
      v23 = v48;
      v24 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_74:
    os_release((void *)v12);
    goto LABEL_102;
  }
}

void _mdns_push_server_send_pending_subscribe_requests(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject **message;
  _QWORD *v15;
  uint64_t v16;
  _QWORD block[5];

  if (*(_QWORD *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 102))
    {
      v2 = *(_QWORD *)(a1 + 32);
      if (v2)
      {
        v3 = 0;
        while (1)
        {
          if (*(_WORD *)(v2 + 132))
            goto LABEL_36;
          v4 = *(unsigned __int16 *)(a1 + 100);
          v5 = v4 + 1;
          while (v5 < 2u)
          {
LABEL_8:
            if (v4 == ++v5)
              goto LABEL_37;
          }
          v6 = *(_QWORD *)(a1 + 24);
          if (v6)
          {
            while (*(unsigned __int16 *)(v6 + 132) != v5)
            {
              v6 = *(_QWORD *)(v6 + 64);
              if (!v6)
                goto LABEL_13;
            }
            goto LABEL_8;
          }
LABEL_13:
          v7 = *(_QWORD *)(a1 + 32);
          if (v7)
            break;
LABEL_16:
          *(_WORD *)(a1 + 100) = v5;
          if (!v3)
          {
            v8 = _os_object_alloc(OS_mdns_dso_subscribe_message_builder, 48);
            v3 = v8;
            if (v8)
            {
              v9 = &_mdns_dso_subscribe_message_builder_kind;
              *(_QWORD *)(v8 + 16) = &_mdns_dso_subscribe_message_builder_kind;
              do
              {
                v10 = (void (*)(uint64_t))v9[2];
                if (v10)
                  v10(v3);
                v9 = (_UNKNOWN **)*v9;
              }
              while (v9);
              if (_mdns_domain_name_get_root_s_once != -1)
                dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
              v11 = _mdns_domain_name_get_root_s_root;
              *(_QWORD *)(v3 + 32) = _mdns_domain_name_get_root_s_root;
              if (!v11)
              {
                os_release((void *)v3);
                v3 = 0;
              }
            }
          }
          *(_WORD *)(v3 + 28) = v5;
          v12 = *(_QWORD *)(v2 + 80);
          if (v12)
            os_retain(*(void **)(v2 + 80));
          v13 = *(void **)(v3 + 32);
          if (v13)
            os_release(v13);
          *(_QWORD *)(v3 + 32) = v12;
          *(_DWORD *)(v3 + 40) = *(_DWORD *)(v2 + 128);
          message = (NSObject **)mdns_dso_message_builder_create_message(v3);
          mdns_dso_session_send(*(_QWORD **)(a1 + 40), message[3]);
          v15 = *(_QWORD **)(a1 + 40);
          if ((*(unsigned int (**)(_QWORD *))(v15[2] + 104))(v15))
          {
            os_retain(v15);
            if (_mdns_dso_session_queue_s_once != -1)
              dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
            block[0] = _NSConcreteStackBlock;
            block[1] = 0x40000000;
            block[2] = __mdns_dso_session_add_activity_block_invoke;
            block[3] = &__block_descriptor_tmp_3_6005;
            block[4] = v15;
            dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
          }
          os_release(message);
          v16 = v2;
          do
          {
            *(_WORD *)(v16 + 132) = v5;
            v16 = *(_QWORD *)(v16 + 72);
          }
          while (v16);
LABEL_36:
          v2 = *(_QWORD *)(v2 + 64);
          if (!v2)
          {
LABEL_37:
            if (v3)
              os_release((void *)v3);
            return;
          }
        }
        while (*(unsigned __int16 *)(v7 + 132) != v5)
        {
          v7 = *(_QWORD *)(v7 + 64);
          if (!v7)
            goto LABEL_16;
        }
        goto LABEL_8;
      }
    }
  }
}

uint64_t ___mdns_subscriber_process_change_notifications_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_DWORD *)(a2 + 40);
  if (v5 < -1)
  {
    if (v5 != -2)
      return 1;
    if (*(_WORD *)(a2 + 56))
      return 1;
    v10 = *(unsigned __int16 *)(a2 + 54);
    if (v10 != 255)
    {
      if (v10 != *(unsigned __int16 *)(v4 + 130))
        return 1;
      v11 = *(unsigned __int16 *)(a2 + 52);
      if (v11 != 255 && v11 != *(unsigned __int16 *)(v4 + 128))
        return 1;
    }
  }
  else
  {
    v6 = *(unsigned __int16 *)(v4 + 130);
    if (v6 != 255 && *(unsigned __int16 *)(a2 + 54) != v6)
      return 1;
    v8 = *(unsigned __int16 *)(v4 + 128);
    v9 = v8 == 255 || *(unsigned __int16 *)(a2 + 52) == v8;
    if (!v9 || (_mdns_domain_name_equal(*(_QWORD *)(a2 + 24), *(_QWORD *)(v4 + 80)) & 1) == 0)
      return 1;
  }
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result
    || (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks), (result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) != 0))
  {
    CFArrayAppendValue((CFMutableArrayRef)result, (const void *)a2);
    return 1;
  }
  return result;
}

uint64_t ___mdns_subscriber_process_change_notifications_block_invoke_2(uint64_t result)
{
  uint64_t v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  const void *v5;

  v1 = result;
  v2 = (unint64_t *)(*(_QWORD *)(result + 32) + 96);
  do
    v3 = __ldxr(v2);
  while (__stxr(0, v2));
  if (v3)
  {
    v4 = *(_QWORD *)(result + 32);
    v5 = *(const void **)(v4 + 112);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 112) = 0;
      v4 = *(_QWORD *)(v1 + 32);
    }
    *(_QWORD *)(v4 + 112) = v3;
    result = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 104);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

void ___mdns_subscriber_process_change_notifications_block_invoke_3(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
}

uint64_t ___mdns_push_server_add_subscriber_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, *(unsigned int *)(a1 + 40));
}

void ___mdns_push_notifications_queue_block_invoke(id a1)
{
  _mdns_push_notifications_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mdns.push-notifications-queue", 0);
}

void mdns_push_server_invalidate(_BYTE *a1)
{
  _QWORD block[5];

  a1[103] = 1;
  os_retain(a1);
  if (_mdns_push_notifications_queue_s_once != -1)
    dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_35_6754);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __mdns_push_server_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_2_6783;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_push_notifications_queue_s_queue, block);
}

void __mdns_push_server_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    mdns_dso_session_invalidate(*(void **)(v2 + 40));
    os_release(*(void **)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(_QWORD *)(v2 + 88);
  if (v3)
  {
    v4 = *(NSObject **)(v2 + 80);
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = __mdns_push_server_invalidate_block_invoke_2;
      block[3] = &unk_10013ECF8;
      block[4] = v3;
      dispatch_async(v4, block);
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_QWORD *)(v2 + 80))
  {
    dispatch_release(*(dispatch_object_t *)(v2 + 80));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 88))
  {
    _Block_release(*(const void **)(v2 + 88));
    v2 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v2 + 88) = 0;
  }
  os_release((void *)v2);
}

uint64_t __mdns_push_server_invalidate_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void mdns_subscriber_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 49))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 104);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 104) = v3;
  }
}

uint64_t mdns_memcmp_us_ascii_case_insensitive@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char a4@<W8>)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  if (a3)
  {
    while (1)
    {
      v5 = *a1++;
      v4 = v5;
      v6 = v5 + 32;
      if (v5 - 65 < 0x1A)
        v4 = v6;
      v8 = *a2++;
      v7 = v8;
      v9 = v8 + 32;
      if (v8 - 65 < 0x1A)
        v7 = v9;
      if (v4 > v7)
        a4 = 1;
      if (v4 < v7)
        a4 = -1;
      if (v4 != v7)
        break;
      if (!--a3)
        return 0;
    }
  }
  else
  {
    return 0;
  }
  return a4;
}

void mDNSPlatformGetDNSRoutePolicy(uint64_t a1)
{
  __int16 v2;
  nw_endpoint_t host;
  nw_endpoint_t v4;
  nw_parameters_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  unsigned int v17;
  _BYTE *v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  unsigned int v30;
  int v31;
  uint8_t *v32;
  uint64_t evaluator_for_endpoint;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  int flow_divert_unit;
  int v38;
  uint64_t v39;
  unsigned int v40;
  _BYTE *v41;
  uint64_t v42;
  NSObject *v43;
  unsigned int v44;
  _BYTE *v45;
  uint64_t v46;
  NSObject *v47;
  unsigned int v48;
  _BYTE *v49;
  uint64_t v50;
  char v51;
  _BYTE *v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  int v56;
  const char *v57;
  int v58;
  int v59;
  int v60;
  NSObject *v61;
  NSObject *v62;
  uint32_t index;
  uint64_t v64;
  int v65;
  _BYTE *v66;
  uint64_t v67;
  const char *v68;
  int v69;
  int v70;
  int v71;
  NSObject *v72;
  int v73;
  const char *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  const char *v79;
  int v80;
  int v81;
  int v82;
  unsigned int v83;
  const char *v84;
  NSObject *v85;
  uint32_t v86;
  uint64_t v87;
  _QWORD v88[8];
  _QWORD v89[3];
  int v90;
  _QWORD v91[3];
  char v92;
  uint8_t buf[8];
  __int128 v94;
  _BYTE v95[10];
  __int16 v96;
  const char *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  char hostname[1009];

  *(_DWORD *)(a1 + 280) = -1;
  if (!*(_WORD *)(a1 + 340) || (*(_DWORD *)(a1 + 244) & 0x80000000) != 0)
    goto LABEL_162;
  bzero(hostname, 0x3F1uLL);
  v2 = a1 + 376;
  ConvertDomainNameToCString_withescape((unsigned __int8 *)(a1 + 376), (unsigned __int8 *)hostname);
  host = nw_endpoint_create_host(hostname, "0");
  if (host)
  {
    v4 = host;
    v5 = nw_parameters_create();
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 136);
      if (v7 == -4 || v7 == -5 || v7 == -3 || v7 == -1 || v7 == -2 || v7 == 0)
        v13 = 0;
      else
        v13 = v7;
      if ((_DWORD)v13)
      {
        v14 = nw_interface_create_with_index(v13);
        if (v14)
        {
          v15 = v14;
          nw_parameters_require_interface(v6, v14);
          nw_release(v15);
          goto LABEL_70;
        }
        v28 = mDNSLogCategory_Default;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_70;
        }
        else
        {
          v28 = mDNSLogCategory_Default_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
            goto LABEL_70;
        }
        v30 = bswap32(*(unsigned __int16 *)(a1 + 340));
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = HIWORD(v30);
        LOWORD(v94) = 1024;
        *(_DWORD *)((char *)&v94 + 2) = v13;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[Q%u] mDNSPlatformGetDNSRoutePolicy: nw_interface_create_with_index() returned NULL for index %u", buf, 0xEu);
      }
LABEL_70:
      nw_parameters_set_uid(v6, *(unsigned int *)(a1 + 248));
      if (*(_DWORD *)(a1 + 244))
      {
        nw_parameters_set_pid(v6);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&v94 = 0;
        if (mdns_system_pid_to_uuid(*(_DWORD *)(a1 + 244), buf))
        {
          v31 = 0;
          goto LABEL_76;
        }
        v32 = buf;
      }
      else
      {
        v32 = (uint8_t *)(a1 + 656);
      }
      nw_parameters_set_e_proc_uuid(v6, v32);
      v31 = 1;
LABEL_76:
      evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v4, v6);
      if (evaluator_for_endpoint)
      {
        v34 = (void *)evaluator_for_endpoint;
        nw_release(v4);
        nw_release(v6);
        v35 = nw_path_evaluator_copy_path(v34);
        if (v35)
        {
          v36 = v35;
          if (nw_path_get_status(v35) == nw_path_status_satisfied)
          {
            flow_divert_unit = nw_path_get_flow_divert_unit(v36);
            if (!flow_divert_unit)
            {
              v61 = nw_path_copy_scoped_interface(v36);
              if (!v61)
                goto LABEL_176;
              v62 = v61;
              index = nw_interface_get_index(v61);
              *(_QWORD *)(a1 + 136) = index;
              nw_release(v62);
              if (index == (_DWORD)v13)
                goto LABEL_176;
              v64 = mDNSLogCategory_Default;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
              {
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_176;
              }
              else
              {
                v64 = mDNSLogCategory_Default_redacted;
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_176;
              }
              v83 = bswap32(*(unsigned __int16 *)(a1 + 340));
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&buf[4] = HIWORD(v83);
              LOWORD(v94) = 1024;
              *(_DWORD *)((char *)&v94 + 2) = v13;
              WORD3(v94) = 1024;
              DWORD2(v94) = index;
              v84 = "[Q%u] mDNSPlatformGetDNSRoutePolicy: DNS Route Policy has changed the scoped ifindex from [%d] to [%d]";
              v85 = v64;
              v86 = 20;
LABEL_175:
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, v84, buf, v86);
              goto LABEL_176;
            }
            v38 = flow_divert_unit;
            *(_DWORD *)(a1 + 280) = flow_divert_unit;
            v39 = mDNSLogCategory_Default;
            if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
            {
              if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
              {
                v40 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
                v66 = (_BYTE *)(a1 + 376);
                if (a1 == -632)
                {
LABEL_146:
                  while (v66)
                  {
                    v67 = *v66;
                    if (v67 > 0x3F)
                      break;
                    if (!*v66)
                    {
                      v78 = (unsigned __int16)((_WORD)v66 - v2 + 1);
                      goto LABEL_174;
                    }
                    v66 += v67 + 1;
                    if (a1 != -632)
                      goto LABEL_145;
                  }
                }
                else
                {
LABEL_145:
                  if ((unint64_t)v66 < a1 + 632)
                    goto LABEL_146;
                }
                v78 = 257;
                goto LABEL_174;
              }
            }
            else
            {
              v39 = mDNSLogCategory_Default_redacted;
              if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
              {
                v40 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
                v41 = (_BYTE *)(a1 + 376);
                if (a1 == -632)
                {
LABEL_85:
                  while (v41)
                  {
                    v42 = *v41;
                    if (v42 > 0x3F)
                      break;
                    if (!*v41)
                    {
                      v78 = (unsigned __int16)((_WORD)v41 - v2 + 1);
                      goto LABEL_174;
                    }
                    v41 += v42 + 1;
                    if (a1 != -632)
                      goto LABEL_84;
                  }
                }
                else
                {
LABEL_84:
                  if ((unint64_t)v41 < a1 + 632)
                    goto LABEL_85;
                }
                v78 = 257;
LABEL_174:
                *(_DWORD *)buf = 67110147;
                *(_DWORD *)&buf[4] = v40;
                LOWORD(v94) = 2160;
                *(_QWORD *)((char *)&v94 + 2) = 1752392040;
                WORD5(v94) = 1040;
                HIDWORD(v94) = v78;
                *(_WORD *)v95 = 2101;
                *(_QWORD *)&v95[2] = a1 + 376;
                v96 = 1024;
                LODWORD(v97) = v38;
                v84 = "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}."
                      "*P service ID is set ->service_ID:[%d] ";
                v85 = v39;
                v86 = 40;
                goto LABEL_175;
              }
            }
          }
          else if (v31
                 && nw_path_get_status(v36) == nw_path_status_unsatisfied
                 && nw_path_get_reason(v36) != 3)
          {
            v51 = 1;
LABEL_182:
            nw_release(v36);
            goto LABEL_183;
          }
LABEL_176:
          if (!*(_BYTE *)(a1 + 651))
          {
            uuid_clear((unsigned __int8 *)(a1 + 360));
            *(_QWORD *)buf = 0;
            *(_QWORD *)&v94 = buf;
            *((_QWORD *)&v94 + 1) = 0x2000000000;
            *(_QWORD *)v95 = 0;
            v91[0] = 0;
            v91[1] = v91;
            v91[2] = 0x2000000000;
            v92 = 0;
            v89[0] = 0;
            v89[1] = v89;
            v89[2] = 0x2000000000;
            v90 = 0;
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 0x40000000;
            v88[2] = __mDNSPlatformGetDNSRoutePolicy_block_invoke;
            v88[3] = &unk_10013EF98;
            v88[4] = v89;
            v88[5] = buf;
            v88[6] = v91;
            v88[7] = a1;
            nw_path_enumerate_resolver_configs(v36, v88);
            v87 = *(_QWORD *)(v94 + 24);
            if (v87)
              nw_resolver_config_get_identifier(v87, a1 + 360);
            _Block_object_dispose(v89, 8);
            _Block_object_dispose(v91, 8);
            _Block_object_dispose(buf, 8);
            if (!uuid_is_null((const unsigned __int8 *)(a1 + 360)))
              Querier_RegisterPathResolver(a1 + 360);
          }
          v51 = 0;
          goto LABEL_182;
        }
        v47 = mDNSLogCategory_Default;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
          {
            v48 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
            v54 = (_BYTE *)(a1 + 376);
            if (a1 == -632)
            {
LABEL_125:
              while (v54)
              {
                v55 = *v54;
                if (v55 > 0x3F)
                  break;
                if (!*v54)
                {
                  v73 = (unsigned __int16)((_WORD)v54 - v2 + 1);
                  goto LABEL_168;
                }
                v54 += v55 + 1;
                if (a1 != -632)
                  goto LABEL_124;
              }
            }
            else
            {
LABEL_124:
              if ((unint64_t)v54 < a1 + 632)
                goto LABEL_125;
            }
            v73 = 257;
            goto LABEL_168;
          }
        }
        else
        {
          v47 = mDNSLogCategory_Default_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
          {
            v48 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
            v49 = (_BYTE *)(a1 + 376);
            if (a1 == -632)
            {
LABEL_105:
              while (v49)
              {
                v50 = *v49;
                if (v50 > 0x3F)
                  break;
                if (!*v49)
                {
                  v73 = (unsigned __int16)((_WORD)v49 - v2 + 1);
                  goto LABEL_168;
                }
                v49 += v50 + 1;
                if (a1 != -632)
                  goto LABEL_104;
              }
            }
            else
            {
LABEL_104:
              if ((unint64_t)v49 < a1 + 632)
                goto LABEL_105;
            }
            v73 = 257;
LABEL_168:
            v79 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
            v80 = *(_DWORD *)(a1 + 244);
            v81 = *(_DWORD *)(a1 + 248);
            v82 = *(_DWORD *)(a1 + 280);
            *(_DWORD *)buf = 67110915;
            *(_DWORD *)&buf[4] = v48;
            LOWORD(v94) = 2160;
            *(_QWORD *)((char *)&v94 + 2) = 1752392040;
            WORD5(v94) = 1040;
            HIDWORD(v94) = v73;
            *(_WORD *)v95 = 2101;
            *(_QWORD *)&v95[2] = a1 + 376;
            v96 = 2082;
            v97 = v79;
            v98 = 1024;
            v99 = v80;
            v100 = 1024;
            v101 = v81;
            v102 = 1024;
            v103 = v82;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] path is NULL", buf, 0x3Eu);
          }
        }
        v51 = 0;
LABEL_183:
        nw_release(v34);
        goto LABEL_163;
      }
      v43 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
        {
          v44 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
          v52 = (_BYTE *)(a1 + 376);
          if (a1 == -632)
          {
LABEL_117:
            while (v52)
            {
              v53 = *v52;
              if (v53 > 0x3F)
                break;
              if (!*v52)
              {
                v65 = (unsigned __int16)((_WORD)v52 - v2 + 1);
                goto LABEL_159;
              }
              v52 += v53 + 1;
              if (a1 != -632)
                goto LABEL_116;
            }
          }
          else
          {
LABEL_116:
            if ((unint64_t)v52 < a1 + 632)
              goto LABEL_117;
          }
          v65 = 257;
          goto LABEL_159;
        }
      }
      else
      {
        v43 = mDNSLogCategory_Default_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
        {
          v44 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
          v45 = (_BYTE *)(a1 + 376);
          if (a1 == -632)
          {
LABEL_95:
            while (v45)
            {
              v46 = *v45;
              if (v46 > 0x3F)
                break;
              if (!*v45)
              {
                v65 = (unsigned __int16)((_WORD)v45 - v2 + 1);
                goto LABEL_159;
              }
              v45 += v46 + 1;
              if (a1 != -632)
                goto LABEL_94;
            }
          }
          else
          {
LABEL_94:
            if ((unint64_t)v45 < a1 + 632)
              goto LABEL_95;
          }
          v65 = 257;
LABEL_159:
          v74 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
          v75 = *(_DWORD *)(a1 + 244);
          v76 = *(_DWORD *)(a1 + 248);
          v77 = *(_DWORD *)(a1 + 280);
          *(_DWORD *)buf = 67110915;
          *(_DWORD *)&buf[4] = v44;
          LOWORD(v94) = 2160;
          *(_QWORD *)((char *)&v94 + 2) = 1752392040;
          WORD5(v94) = 1040;
          HIDWORD(v94) = v65;
          *(_WORD *)v95 = 2101;
          *(_QWORD *)&v95[2] = a1 + 376;
          v96 = 2082;
          v97 = v74;
          v98 = 1024;
          v99 = v75;
          v100 = 1024;
          v101 = v76;
          v102 = 1024;
          v103 = v77;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] evaluator is NULL", buf, 0x3Eu);
        }
      }
      nw_release(v4);
      v72 = v6;
      goto LABEL_161;
    }
    v20 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
      {
        v21 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
        v26 = (_BYTE *)(a1 + 376);
        if (a1 == -632)
        {
LABEL_57:
          while (v26)
          {
            v27 = *v26;
            if (v27 > 0x3F)
              break;
            if (!*v26)
            {
              v56 = (unsigned __int16)((_WORD)v26 - v2 + 1);
              goto LABEL_153;
            }
            v26 += v27 + 1;
            if (a1 != -632)
              goto LABEL_56;
          }
        }
        else
        {
LABEL_56:
          if ((unint64_t)v26 < a1 + 632)
            goto LABEL_57;
        }
        v56 = 257;
        goto LABEL_153;
      }
    }
    else
    {
      v20 = mDNSLogCategory_Default_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
      {
        v21 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
        v22 = (_BYTE *)(a1 + 376);
        if (a1 == -632)
        {
LABEL_41:
          while (v22)
          {
            v23 = *v22;
            if (v23 > 0x3F)
              break;
            if (!*v22)
            {
              v56 = (unsigned __int16)((_WORD)v22 - v2 + 1);
              goto LABEL_153;
            }
            v22 += v23 + 1;
            if (a1 != -632)
              goto LABEL_40;
          }
        }
        else
        {
LABEL_40:
          if ((unint64_t)v22 < a1 + 632)
            goto LABEL_41;
        }
        v56 = 257;
LABEL_153:
        v68 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
        v69 = *(_DWORD *)(a1 + 244);
        v70 = *(_DWORD *)(a1 + 248);
        v71 = *(_DWORD *)(a1 + 280);
        *(_DWORD *)buf = 67110915;
        *(_DWORD *)&buf[4] = v21;
        LOWORD(v94) = 2160;
        *(_QWORD *)((char *)&v94 + 2) = 1752392040;
        WORD5(v94) = 1040;
        HIDWORD(v94) = v56;
        *(_WORD *)v95 = 2101;
        *(_QWORD *)&v95[2] = a1 + 376;
        v96 = 2082;
        v97 = v68;
        v98 = 1024;
        v99 = v69;
        v100 = 1024;
        v101 = v70;
        v102 = 1024;
        v103 = v71;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] parameters is NULL", buf, 0x3Eu);
      }
    }
    v72 = v4;
LABEL_161:
    nw_release(v72);
    goto LABEL_162;
  }
  v16 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
    {
      v17 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
      v24 = (_BYTE *)(a1 + 376);
      if (a1 == -632)
      {
LABEL_49:
        while (v24)
        {
          v25 = *v24;
          if (v25 > 0x3F)
            break;
          if (!*v24)
          {
            v29 = (unsigned __int16)((_WORD)v24 - v2 + 1);
            goto LABEL_134;
          }
          v24 += v25 + 1;
          if (a1 != -632)
            goto LABEL_48;
        }
      }
      else
      {
LABEL_48:
        if ((unint64_t)v24 < a1 + 632)
          goto LABEL_49;
      }
      v29 = 257;
      goto LABEL_134;
    }
  }
  else
  {
    v16 = mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
    {
      v17 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
      v18 = (_BYTE *)(a1 + 376);
      if (a1 == -632)
      {
LABEL_31:
        while (v18)
        {
          v19 = *v18;
          if (v19 > 0x3F)
            break;
          if (!*v18)
          {
            v29 = (unsigned __int16)((_WORD)v18 - v2 + 1);
            goto LABEL_134;
          }
          v18 += v19 + 1;
          if (a1 != -632)
            goto LABEL_30;
        }
      }
      else
      {
LABEL_30:
        if ((unint64_t)v18 < a1 + 632)
          goto LABEL_31;
      }
      v29 = 257;
LABEL_134:
      v57 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
      v58 = *(_DWORD *)(a1 + 244);
      v59 = *(_DWORD *)(a1 + 248);
      v60 = *(_DWORD *)(a1 + 280);
      *(_DWORD *)buf = 67110915;
      *(_DWORD *)&buf[4] = v17;
      LOWORD(v94) = 2160;
      *(_QWORD *)((char *)&v94 + 2) = 1752392040;
      WORD5(v94) = 1040;
      HIDWORD(v94) = v29;
      *(_WORD *)v95 = 2101;
      *(_QWORD *)&v95[2] = a1 + 376;
      v96 = 2082;
      v97 = v57;
      v98 = 1024;
      v99 = v58;
      v100 = 1024;
      v101 = v59;
      v102 = 1024;
      v103 = v60;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] host is NULL", buf, 0x3Eu);
    }
  }
LABEL_162:
  v51 = 0;
LABEL_163:
  *(_BYTE *)(a1 + 654) = v51;
}

uint64_t __mDNSPlatformGetDNSRoutePolicy_block_invoke(_QWORD *a1, uint64_t a2)
{
  int allow_failover;
  unsigned int v5;
  uint64_t v6;

  allow_failover = nw_resolver_config_get_allow_failover(a2);
  v5 = nw_resolver_config_get_class(a2);
  if (v5 && (!allow_failover || !*(_BYTE *)(a1[7] + 643)))
  {
    v6 = *(_QWORD *)(a1[4] + 8);
    if (*(_DWORD *)(v6 + 24) - 1 >= v5)
    {
      *(_DWORD *)(v6 + 24) = v5;
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = allow_failover;
    }
  }
  return 1;
}

uint64_t _dnssec_obj_trust_anchor_compare(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24) && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28))
    return 2 * (ref_count_obj_compare(*(_QWORD *)(a1 + 16), *(_QWORD *)(a2 + 16), 1) != 0);
  else
    return 2;
}

void _dnssec_obj_trust_anchor_finalize(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    ref_count_obj_release(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
}

_QWORD *dnssec_obj_trust_anchor_create_with_ds_data(unsigned __int8 *a1, __int16 a2, char a3, __int128 *a4, int a5, int a6, int *a7)
{
  __int128 v12;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  _QWORD *v16;
  _QWORD *v17;
  _UNKNOWN **v18;
  void (*v19)(_QWORD *);
  int v21;
  _BYTE v22[4];
  __int128 v23;
  __int128 v24;
  int v25;

  v21 = 0;
  v22[0] = HIBYTE(a2);
  v22[1] = a2;
  v22[2] = a3;
  v22[3] = 2;
  bzero(&v25, 0xFDCuLL);
  v12 = a4[1];
  v23 = *a4;
  v24 = v12;
  v13 = dnssec_obj_rr_ds_create(a1, 1, v22, 0x24u, 1, &v21);
  v14 = v13;
  v15 = v21;
  if (v21)
  {
    v17 = 0;
  }
  else if (v13)
  {
    v16 = malloc_type_calloc(1uLL, 0x20uLL, 0xF1748037uLL);
    if (!v16)
      __break(1u);
    v17 = v16;
    v18 = &_dnssec_obj_trust_anchor_kind;
    v16[1] = &_dnssec_obj_trust_anchor_kind;
    do
    {
      v19 = (void (*)(_QWORD *))v18[2];
      if (v19)
        v19(v17);
      v18 = (_UNKNOWN **)*v18;
    }
    while (v18);
    v15 = 0;
    ++*(_DWORD *)v17;
    v17[2] = v14;
    ++*(_DWORD *)v14;
    *((_DWORD *)v17 + 6) = a5;
    *((_DWORD *)v17 + 7) = a6;
    v21 = 0;
  }
  else
  {
    v17 = 0;
    v15 = -6728;
    v21 = -6728;
  }
  if (a7)
    *a7 = v15;
  if (v14)
    ref_count_obj_release(v14);
  return v17;
}

size_t mdns_snprintf_add(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  size_t v11;
  size_t v12;
  size_t v13;

  if (a1)
    v10 = *a1;
  else
    v10 = 0;
  if (a1)
    v11 = a2 - (_QWORD)v10;
  else
    v11 = 0;
  v12 = vsnprintf(v10, v11, a3, &a9);
  v13 = v12;
  if (a1 && v11 && (v12 & 0x80000000) == 0)
  {
    if (v11 <= v12)
      v12 = strlen(v10);
    else
      v12 = v12;
    *a1 = &v10[v12];
  }
  return v13;
}

void mdns_replace_string(void **a1, char *__s1)
{
  char *v3;

  if (__s1)
  {
    v3 = strdup(__s1);
    if (v3)
      goto LABEL_5;
    __break(1u);
  }
  v3 = 0;
LABEL_5:
  if (*a1)
    free(*a1);
  *a1 = v3;
}

uint64_t mdns_get_monotonic_time_ns()
{
  __uint64_t v0;

  v0 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (!v0 && (!*__error() || *__error()))
    return 1;
  return v0;
}

char *_mdns_message_copy_description(uint64_t a1, uint64_t a2, int a3)
{
  char *result;
  char v5;
  int v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unsigned __int8 *v13;
  char *v14;
  unsigned int v15;
  char *v16;

  v16 = 0;
  result = *(char **)(a1 + 32);
  if (result)
  {
    v5 = a3;
    v6 = *(_BYTE *)(a1 + 48) ? 36 : 4;
    v7 = a3 ? v6 | 8 : v6;
    DNSMessageToString(result, *(_QWORD *)(a1 + 40), v7, (uint64_t)&v16);
    result = v16;
    if (!v16 && (v5 & 1) == 0)
    {
      result = 0;
      v8 = *(_BYTE *)(a1 + 48) ? 12 : 0;
      v9 = *(_QWORD *)(a1 + 40);
      if (v9 >= v8)
      {
        v10 = v9 - v8;
        if ((uint64_t)(v9 - v8) < 0)
        {
          return 0;
        }
        else
        {
          v11 = *(_QWORD *)(a1 + 32);
          result = (char *)malloc_type_malloc((2 * v10) | 1, 0xA172743EuLL);
          if (result)
          {
            v12 = result;
            if (v9 != v8)
            {
              v13 = (unsigned __int8 *)(v11 + v8);
              v14 = result;
              do
              {
                v15 = *v13++;
                *v14 = a0123456789abcd_0[(unint64_t)v15 >> 4];
                v12 = v14 + 2;
                v14[1] = a0123456789abcd_0[v15 & 0xF];
                v14 += 2;
                --v10;
              }
              while (v10);
            }
            *v12 = 0;
          }
          else
          {
            __break(1u);
          }
        }
      }
    }
  }
  return result;
}

void _mdns_message_finalize(uint64_t a1)
{
  NSObject *v2;

  *(_QWORD *)(a1 + 32) = 0;
  v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

_BYTE *mdns_message_create_with_dispatch_data(NSObject *a1, char a2)
{
  dispatch_data_t v3;
  NSObject *v4;
  void *v5;
  size_t v6;
  BOOL v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _UNKNOWN **v15;
  void (*v16)(_BYTE *);
  uint64_t v18;
  uint64_t (**v19)();
  uint64_t v20;
  _UNKNOWN ***v21;
  void (*v22)(_BYTE *);
  uint64_t v23;
  _UNKNOWN ***v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  _UNKNOWN ***v27;
  void (*v28)(_BYTE *);
  uint64_t v29;
  _UNKNOWN ***v30;
  void (*v31)(_BYTE *);
  uint64_t v32;
  _UNKNOWN ***v33;
  void (*v34)(_BYTE *);
  uint64_t v35;
  _UNKNOWN ***v36;
  void (*v37)(_BYTE *);
  uint64_t v38;
  _UNKNOWN ***v39;
  void (*v40)(_BYTE *);
  size_t v41;
  void *buffer_ptr;

  v41 = 0;
  buffer_ptr = 0;
  v3 = dispatch_data_create_map(a1, (const void **)&buffer_ptr, &v41);
  if (!v3)
    return 0;
  v4 = v3;
  v6 = v41;
  v5 = buffer_ptr;
  if (buffer_ptr)
    v7 = v41 >= 0xC;
  else
    v7 = 0;
  if (v7
    && (*((_BYTE *)buffer_ptr + 2) & 0x78) == 0x30
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 2))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 3))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 4))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 5))
    && ((*((_BYTE *)buffer_ptr + 2) & 0x80) == 0 || __rev16(*(unsigned __int16 *)buffer_ptr)))
  {
    v8 = 0;
    v9 = (char *)buffer_ptr + 12;
    v10 = (char *)buffer_ptr + v41;
    while (v9 < v10)
    {
      if ((unint64_t)(v10 - v9) >= 4)
      {
        v11 = __rev16(*((unsigned __int16 *)v9 + 1));
        v12 = v10 - (v9 + 4);
        v9 += v11 + 4;
        ++v8;
        if (v12 >= v11)
          continue;
      }
      goto LABEL_21;
    }
    if ((*((_BYTE *)buffer_ptr + 2) & 0x80) != 0 || v8)
    {
      v18 = 0;
      v19 = &off_10013F270;
      do
      {
        if ((((uint64_t (*)(void *, size_t))*v19)(v5, v6) & 1) != 0)
        {
          switch(*((_WORD *)&off_10013F270 + 8 * v18 + 4))
          {
            case 0:
              goto LABEL_34;
            case 1:
              v23 = _os_object_alloc(OS_mdns_dso_keepalive_message, 56);
              v14 = (_BYTE *)v23;
              if (!v23)
                goto LABEL_29;
              v24 = &_mdns_dso_keepalive_message_kind;
              *(_QWORD *)(v23 + 16) = &_mdns_dso_keepalive_message_kind;
              do
              {
                v25 = (void (*)(_BYTE *))v24[2];
                if (v25)
                  v25(v14);
                v24 = (_UNKNOWN ***)*v24;
              }
              while (v24);
              break;
            case 2:
              v26 = _os_object_alloc(OS_mdns_dso_retry_delay_message, 56);
              v14 = (_BYTE *)v26;
              if (!v26)
                goto LABEL_29;
              v27 = &_mdns_dso_retry_delay_message_kind;
              *(_QWORD *)(v26 + 16) = &_mdns_dso_retry_delay_message_kind;
              do
              {
                v28 = (void (*)(_BYTE *))v27[2];
                if (v28)
                  v28(v14);
                v27 = (_UNKNOWN ***)*v27;
              }
              while (v27);
              break;
            case 3:
              v29 = _os_object_alloc(OS_mdns_dso_push_message, 56);
              v14 = (_BYTE *)v29;
              if (!v29)
                goto LABEL_29;
              v30 = &_mdns_dso_push_message_kind;
              *(_QWORD *)(v29 + 16) = &_mdns_dso_push_message_kind;
              do
              {
                v31 = (void (*)(_BYTE *))v30[2];
                if (v31)
                  v31(v14);
                v30 = (_UNKNOWN ***)*v30;
              }
              while (v30);
              break;
            case 4:
              v32 = _os_object_alloc(OS_mdns_dso_subscribe_message, 56);
              v14 = (_BYTE *)v32;
              if (!v32)
                goto LABEL_29;
              v33 = &_mdns_dso_subscribe_message_kind;
              *(_QWORD *)(v32 + 16) = &_mdns_dso_subscribe_message_kind;
              do
              {
                v34 = (void (*)(_BYTE *))v33[2];
                if (v34)
                  v34(v14);
                v33 = (_UNKNOWN ***)*v33;
              }
              while (v33);
              break;
            case 5:
              v35 = _os_object_alloc(OS_mdns_dso_unsubscribe_message, 56);
              v14 = (_BYTE *)v35;
              if (!v35)
                goto LABEL_29;
              v36 = &_mdns_dso_unsubscribe_message_kind;
              *(_QWORD *)(v35 + 16) = &_mdns_dso_unsubscribe_message_kind;
              do
              {
                v37 = (void (*)(_BYTE *))v36[2];
                if (v37)
                  v37(v14);
                v36 = (_UNKNOWN ***)*v36;
              }
              while (v36);
              break;
            case 6:
              v38 = _os_object_alloc(OS_mdns_dso_reconfirm_message, 56);
              v14 = (_BYTE *)v38;
              if (!v38)
                goto LABEL_29;
              v39 = &_mdns_dso_reconfirm_message_kind;
              *(_QWORD *)(v38 + 16) = &_mdns_dso_reconfirm_message_kind;
              do
              {
                v40 = (void (*)(_BYTE *))v39[2];
                if (v40)
                  v40(v14);
                v39 = (_UNKNOWN ***)*v39;
              }
              while (v39);
              break;
            default:
              goto LABEL_79;
          }
          goto LABEL_26;
        }
        ++v18;
        v19 += 2;
      }
      while (v18 != 6);
LABEL_34:
      v20 = _os_object_alloc(OS_mdns_dso_unspecified_message, 56);
      v14 = (_BYTE *)v20;
      if (!v20)
        goto LABEL_29;
      v21 = &_mdns_dso_unspecified_message_kind;
      *(_QWORD *)(v20 + 16) = &_mdns_dso_unspecified_message_kind;
      do
      {
        v22 = (void (*)(_BYTE *))v21[2];
        if (v22)
          v22(v14);
        v21 = (_UNKNOWN ***)*v21;
      }
      while (v21);
      goto LABEL_26;
    }
  }
LABEL_21:
  v13 = _os_object_alloc(OS_mdns_message, 56);
  v14 = (_BYTE *)v13;
  if (v13)
  {
    v15 = &_mdns_message_kind;
    *(_QWORD *)(v13 + 16) = &_mdns_message_kind;
    do
    {
      v16 = (void (*)(_BYTE *))v15[2];
      if (v16)
        v16(v14);
      v15 = (_UNKNOWN **)*v15;
    }
    while (v15);
LABEL_26:
    if ((a2 & 1) != 0)
      v14[48] = 1;
    if (_mdns_message_set_msg_data(v14, v4))
    {
      os_release(v14);
LABEL_79:
      v14 = 0;
    }
  }
LABEL_29:
  dispatch_release(v4);
  return v14;
}

uint64_t _mdns_message_set_msg_data(_QWORD *a1, dispatch_data_t data)
{
  dispatch_data_t v3;
  uint64_t result;
  NSObject *v5;
  void *v6;
  size_t v7;
  void *buffer_ptr;

  v7 = 0;
  buffer_ptr = 0;
  if (data)
  {
    v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v7);
    if (!v3)
      return 4294960568;
  }
  else
  {
    v7 = 0;
    buffer_ptr = 0;
    v3 = (dispatch_data_t)&_dispatch_data_empty;
  }
  v5 = a1[3];
  if (v5)
    dispatch_release(v5);
  result = 0;
  v6 = buffer_ptr;
  a1[3] = v3;
  a1[4] = v6;
  a1[5] = v7;
  return result;
}

BOOL _mdns_dso_keepalive_message_validator(uint64_t a1, unint64_t a2)
{
  int64_t v2;
  unsigned int v3;
  BOOL v4;
  BOOL v5;

  if (a2 >= 0x18
    && (a2 & 0xFFFFFFFFFFFFFFFCLL) != 0xC
    && (v2 = __rev16(*(unsigned __int16 *)(a1 + 14)), (uint64_t)(a2 - 16) >= v2)
    && ((v3 = __rev16(*(unsigned __int16 *)(a1 + 12)), (_DWORD)v2 == 8) ? (v4 = a1 == -16) : (v4 = 1),
        !v4 ? (v5 = v3 == 1) : (v5 = 0),
        v5))
  {
    return bswap32(*(_DWORD *)(a1 + 20)) >> 4 > 0x270;
  }
  else
  {
    return 0;
  }
}

uint64_t _mdns_dso_retry_delay_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  BOOL v5;
  int64_t v6;
  unsigned int v7;
  _BOOL4 v9;
  _BOOL4 v10;

  v2 = 0;
  if (a1 && a2 >= 0x14)
  {
    v2 = 0;
    v3 = *((char *)a1 + 2);
    v4 = __rev16(*a1);
    v5 = !v4 && v3 < 0;
    if (!v5 && (v3 & 0x80000000) == 0 && !v4)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC || (v6 = __rev16(a1[7]), (uint64_t)(a2 - 16) < v6))
      {
        v10 = 0;
        v9 = 0;
      }
      else
      {
        v7 = __rev16(a1[6]);
        v9 = a1 != (unsigned __int16 *)-16 && v7 == 2;
        v10 = v6 == 4;
      }
      return v10 & v9;
    }
  }
  return v2;
}

BOOL _mdns_dso_push_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;
  int v7;
  unsigned int v8;
  BOOL v9;
  int64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  _QWORD v17[9];

  if (a2 > 0x3FFE)
    return 0;
  v17[7] = v2;
  v17[8] = v3;
  result = 0;
  if (a1 && a2 >= 0xC)
  {
    result = 0;
    v7 = *((char *)a1 + 2);
    v8 = __rev16(*a1);
    v9 = !v8 && v7 < 0;
    if (!v9 && (v7 & 0x80000000) == 0 && !v8)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
        return 0;
      v10 = __rev16(a1[7]);
      if ((uint64_t)(a2 - 16) < v10)
        return 0;
      result = 0;
      v11 = (char *)(a1 + 8);
      if (a1 != (unsigned __int16 *)-16 && __rev16(a1[6]) == 65)
      {
        v12 = &v11[v10];
        v17[0] = a1 + 8;
        if (v11 < &v11[v10])
        {
          v13 = 0;
          while (1)
          {
            v16 = 0;
            v15 = 0;
            v14 = 0;
            if (_DNSMessageExtractRecordEx((unint64_t)a1, a2, v11, 0, (_WORD *)&v16 + 1, &v16, &v15, 0, &v14, 0, 0, 0, 0, v17))return 0;
            v11 = (char *)v17[0];
            if (v17[0] > (unint64_t)v12)
              return 0;
            if ((v15 & 0x80000000) == 0)
              break;
            if (v15 == -2)
            {
              if (v14)
                return 0;
            }
            else if (v15 == -1)
            {
              break;
            }
LABEL_21:
            ++v13;
            if (v17[0] >= (unint64_t)v12)
              return v13 != 0;
          }
          if (HIWORD(v16) == 255 || (unsigned __int16)v16 == 255)
            return 0;
          goto LABEL_21;
        }
        return 0;
      }
    }
  }
  return result;
}

BOOL _mdns_dso_subscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v4;
  int64_t v5;
  char *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  int v13;
  int64_t v14;
  _BOOL4 v16;

  result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      result = 0;
      if (((char)a1[1] & 0x80000000) == 0)
      {
        if (__rev16(*a1))
        {
          if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
            return 0;
          result = 0;
          v4 = a1 + 8;
          if (a1 == (unsigned __int16 *)-16)
            return result;
          v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) < v5)
            return result;
          if (__rev16(a1[6]) != 64)
            return 0;
          v6 = (char *)v4 + v5;
          if (v4 >= (unsigned __int16 *)((char *)v4 + v5))
            return 0;
          v7 = v4;
          while (1)
          {
            v8 = *(unsigned __int8 *)v7;
            if (!*(_BYTE *)v7)
              break;
            if (v8 > 0x3F)
              return 0;
            result = 0;
            v9 = (char *)v7 + v8;
            v12 = __OFSUB__(v6 - (char *)v7, v8);
            v10 = v6 - (char *)v7 == v8;
            v11 = v6 - (char *)v7 - v8 < 0;
            if (v6 - (char *)v7 > v8)
              v7 = (unsigned __int16 *)(v9 + 1);
            if (v11 ^ v12 | v10 || v9 + 1 - (_BYTE *)v4 >= 256)
              return result;
          }
          v13 = (unsigned __int16)((_WORD)v7 - (_WORD)v4) + 1;
          v14 = v5 - (unsigned __int16)((_WORD)v7 - (_WORD)v4 + 1);
          v16 = v5 > (unsigned __int16)v13 && v14 == 4;
          return (v13 & 0x10000) == 0 && v16;
        }
      }
    }
  }
  return result;
}

BOOL _mdns_dso_unsubscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  _BOOL8 result;
  int64_t v4;

  result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      result = 0;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
        {
          return 0;
        }
        else
        {
          result = 0;
          if (a1 != (unsigned __int16 *)-16)
          {
            v4 = __rev16(a1[7]);
            if ((uint64_t)(a2 - 16) >= v4)
              return __rev16(a1[6]) == 66 && (_DWORD)v4 == 2;
          }
        }
      }
    }
  }
  return result;
}

BOOL _mdns_dso_reconfirm_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v4;
  int64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  unsigned __int16 v9;

  result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      result = 0;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
          return 0;
        result = 0;
        v4 = a1 + 8;
        if (a1 != (unsigned __int16 *)-16)
        {
          v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) >= v5)
          {
            if (__rev16(a1[6]) == 67 && v4 < (unsigned __int16 *)((char *)v4 + v5))
            {
              v6 = a1 + 8;
              while (1)
              {
                v7 = *v6;
                if (!*v6)
                  break;
                if (v7 > 0x3F)
                  return 0;
                result = 0;
                v8 = &v6[v7];
                if ((char *)v4 + v5 - v6 > v7)
                {
                  v6 = v8 + 1;
                  if (v8 + 1 - (_BYTE *)v4 < 256)
                    continue;
                }
                return result;
              }
              v9 = (_WORD)v6 - (_WORD)v4 + 1;
              if ((_WORD)v6 - (_WORD)v4 != 0xFFFF)
                return v5 > v9 && v5 - v9 > 3;
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdns_query_message_create()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v0 = _os_object_alloc(OS_mdns_query_message, 96);
  v1 = v0;
  if (v0)
  {
    v2 = &_mdns_query_message_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_query_message_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    *(_BYTE *)(v1 + 48) = 1;
    if (_mdns_message_set_msg_data((_QWORD *)v1, 0))
      goto LABEL_11;
    if (_mdns_domain_name_get_root_s_once != -1)
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
    v4 = _mdns_domain_name_get_root_s_root;
    *(_QWORD *)(v1 + 56) = _mdns_domain_name_get_root_s_root;
    if (!v4)
    {
LABEL_11:
      os_release((void *)v1);
      return 0;
    }
  }
  return v1;
}

void _mdns_query_message_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    os_release(v2);
    *(_QWORD *)(a1 + 56) = 0;
  }
}

void mdns_query_message_set_qname(uint64_t a1, void *object)
{
  void *v4;

  if ((*(_BYTE *)(a1 + 70) & 0x20) == 0)
  {
    if (object)
      os_retain(object);
    v4 = *(void **)(a1 + 56);
    if (v4)
      os_release(v4);
    *(_QWORD *)(a1 + 56) = object;
  }
}

uint64_t mdns_query_message_construct(uint64_t a1)
{
  unsigned int v2;
  _BYTE *v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  _BYTE *v7;
  int v8;
  _BYTE *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  size_t v16;
  char v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  char *v21;
  __int16 v22;
  void *v23;
  size_t v24;
  _WORD *v25;
  unint64_t v26;
  char *v27;
  char *v28;
  NSObject *v29;
  NSObject *v30;
  _OWORD v32[32];

  v2 = *(unsigned __int8 *)(a1 + 70);
  memset(v32, 0, sizeof(v32));
  v3 = *(_BYTE **)(*(_QWORD *)(a1 + 56) + 24);
  v4 = *(_WORD *)(a1 + 68);
  v5 = *(_WORD *)(a1 + 64);
  v6 = *(_WORD *)(a1 + 66);
  *(_DWORD *)((char *)v32 + 6) = 0;
  WORD5(v32[0]) = 0;
  LOBYTE(v32[0]) = HIBYTE(v4);
  BYTE1(v32[0]) = v4;
  BYTE2(v32[0]) = 1;
  BYTE3(v32[0]) = (__rbit32(v2) >> 26) & 0x30;
  WORD2(v32[0]) = 256;
  v7 = v3;
  v8 = *v3;
  if (*v3)
  {
    v7 = v3;
    do
    {
      v9 = &v7[v8];
      v10 = v9[1];
      v7 = v9 + 1;
      v8 = v10;
    }
    while (v10);
  }
  v11 = v7 - v3;
  v12 = v11 + 1;
  if ((unint64_t)(v11 + 1) > 0x100)
    return 4294960553;
  memcpy((void *)((unint64_t)v32 | 0xC), v3, v11 + 1);
  v13 = ((unint64_t)v32 | 0xC) + v12;
  *(_BYTE *)v13 = HIBYTE(v5);
  *(_BYTE *)(v13 + 1) = v5;
  *(_BYTE *)(v13 + 2) = HIBYTE(v6);
  *(_BYTE *)(v13 + 3) = v6;
  v14 = (char *)(v13 + 4);
  v15 = v13 + 4 - (_QWORD)v32;
  if ((v2 & 0x1C) == 0 && !*(_BYTE *)(a1 + 71))
  {
    v19 = v14 - (char *)v32;
    goto LABEL_31;
  }
  if (v15 > 0x200)
    return 4294960553;
  *(_DWORD *)(((unint64_t)v32 | 0xC) + v12 + 11) = 0;
  *(_QWORD *)v14 = 0;
  *(_DWORD *)(v13 + 5) = 141568;
  if ((v2 & 4) != 0)
    *(_BYTE *)(v13 + 11) = 0x80;
  v16 = v15 + 11;
  WORD5(v32[0]) = 256;
  v17 = *(_BYTE *)(a1 + 71);
  if (!v17)
  {
    v19 = v15 + 11;
    if ((v2 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_21;
  }
  v18 = *(unsigned __int8 *)(a1 + 72);
  v19 = v15 + ((v18 + 7) >> 3) + 19;
  v20 = 4294960553;
  if (v19 <= v16 || v19 > 0x200)
    return v20;
  v21 = (char *)v32 + v16;
  bzero((char *)v32 + v16, (char *)v32 + v19 - ((char *)v32 + v16));
  *(_WORD *)(v13 + 13) = bswap32(v32 + v19 - v13 - 15) >> 16;
  *(_WORD *)v21 = 2048;
  v21[4] = 0;
  v22 = (unsigned __int16)v32 + v19 - ((_WORD)v21 + 4);
  v21[2] = HIBYTE(v22);
  v21[3] = v22;
  v21[5] = v17;
  v21[6] = v18;
  v21[7] = 0;
  v23 = v21 + 8;
  if (v18 >= 8)
    memcpy(v23, (const void *)(a1 + 73), v18 >> 3);
  if ((v18 & 7) != 0)
    *((_BYTE *)v23 + (v18 >> 3)) = *((_BYTE *)v23 + (v18 >> 3)) & ~(-1 << (8 - (v18 & 7))) | *(_BYTE *)(a1 + 73 + (v18 >> 3)) & (-1 << (8 - (v18 & 7)));
  if ((v2 & 0x10) != 0)
  {
LABEL_21:
    if (v19 <= 0x1FA)
    {
      v20 = 4294960554;
      if (v19 <= v15 || v19 - v15 < 0xB)
        return v20;
      v24 = v19 + 6;
      v25 = (_WORD *)((char *)v32 + v19);
      bzero(v25, (char *)v32 + v24 - (char *)v25);
      *(_WORD *)(v13 + 13) = bswap32(v32 + v24 - v13 - 15) >> 16;
      *(_DWORD *)v25 = 33558272;
      v25[2] = 0;
      v19 = v24;
      if ((v2 & 8) == 0)
        goto LABEL_31;
      goto LABEL_25;
    }
    return 4294960553;
  }
LABEL_18:
  if ((v2 & 8) != 0)
  {
LABEL_25:
    v26 = (v19 + 131) & 0xFFFFFFFFFFFFFF80;
    v20 = 4294960553;
    if (v26 <= v19)
      return v20;
    if (v26 > 0x200)
      return v20;
    v20 = 4294960554;
    if (v19 <= v15 || v19 - v15 < 0xB)
      return v20;
    v27 = (char *)v32 + v19;
    v28 = (char *)((char *)v32 + v26 - v27);
    bzero(v27, (size_t)v28);
    *(_WORD *)(v13 + 13) = bswap32(v32 + v26 - v13 - 15) >> 16;
    *(_WORD *)v27 = 3072;
    v27[2] = (unsigned __int16)((_WORD)v28 - 4) >> 8;
    v27[3] = (_BYTE)v28 - 4;
    v19 = v26;
  }
LABEL_31:
  v29 = dispatch_data_create(v32, v19, 0, 0);
  if (!v29)
    return 4294960568;
  v30 = v29;
  v20 = _mdns_message_set_msg_data((_QWORD *)a1, v29);
  dispatch_release(v30);
  if (!(_DWORD)v20)
    *(_BYTE *)(a1 + 70) |= 0x20u;
  return v20;
}

uint64_t _mdns_dso_message_get_header(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  if (a2 < 0xC || !result)
  {
    v2 = _os_assert_log(0);
    result = _os_crash(v2);
    __break(1u);
  }
  return result;
}

BOOL mdns_dso_message_is_unidirectional(unsigned __int16 *a1, unint64_t a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;
  _BOOL8 result;

  if (!a1 || a2 < 0xC)
    return 0;
  v2 = *((char *)a1 + 2);
  v3 = __rev16(*a1);
  v4 = v2 >= 0 && v3 == 0;
  result = v4;
  if (v2 < 0 && !v3)
    return 0;
  return result;
}

void *_mdns_extended_dns_error_copy_description(uint64_t a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  int appended;
  void *v11;
  uint64_t v13;

  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v7, "code: %u", *(unsigned __int16 *)(a1 + 32))|| (v9 = *(unsigned __int16 *)(a1 + 32), v9 <= 0x18)&& mdns_string_builder_append_formatted(v7, " (%s)", off_10013E0E8[v9])|| mdns_string_builder_append_formatted(v7, ", extra-text: ")|| (!a3? ((v11 = *(void **)(a1 + 24)) == 0 || !xpc_string_get_string_ptr(v11)? (appended = mdns_string_builder_append_formatted(v7, "«EXTRA TEXT»")): (appended = mdns_string_builder_append_formatted(v7, "'%s'"))): (appended = mdns_string_builder_append_formatted(v7, "«REDACTED»", v13)), appended))
  {
    v8 = 0;
  }
  else
  {
    v8 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v8;
}

void _mdns_extended_dns_error_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void ___mdns_copy_empty_string_block_invoke(id a1)
{
  _mdns_copy_empty_string_s_empty_string = (uint64_t)xpc_string_create("");
}

BOOL type_bit_maps_check_length(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t i;
  uint64_t v5;
  NSObject *v7;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;

  v2 = a1;
  v3 = a1 + a2;
  for (i = a1 + 1; i < v3; i = v5 + 3)
  {
    v5 = *(unsigned __int8 *)(v2 + 1) + v2;
    v2 = v5 + 2;
  }
  if (v2 != v3)
  {
    v7 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT))
        return v2 == v3;
    }
    else
    {
      v7 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT))
        return v2 == v3;
    }
    v10 = 136447234;
    v11 = "ptr == ptr_limit";
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    v16 = 1024;
    v17 = 42;
    v18 = 2048;
    v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v10, 0x30u);
  }
  return v2 == v3;
}

uint64_t rdata_parser_type_bit_maps_cover_dns_type(unsigned __int8 *a1, int a2, unsigned int a3)
{
  unint64_t v3;
  char v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;

  v3 = (unint64_t)&a1[a2];
  if ((unint64_t)(a1 + 1) >= v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = a1[1];
      v6 = &a1[v5 + 2];
      if ((unint64_t)v6 > v3)
        break;
      v7 = 8 * v5;
      if (a3 >> 8 == *a1 && v7 > a3)
        v4 |= ((1 << (~(_BYTE)a3 & 7)) & a1[((unint64_t)a3 >> 3) + 2]) != 0;
      a1 = v6;
    }
    while ((unint64_t)(v6 + 1) < v3);
  }
  return v4 & 1;
}

uint64_t rdata_parser_ds_get_digest_length(unsigned int a1)
{
  NSObject *v3;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;

  if (a1 <= 3)
  {
    v3 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT))
        return 0;
    }
    else
    {
      v3 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT))
        return 0;
    }
    v6 = 136447234;
    v7 = "rdata_len >= offsetof(rdata_ds_t, digest)";
    v8 = 2082;
    v9 = "";
    v10 = 2082;
    v11 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    v12 = 1024;
    v13 = 351;
    v14 = 2048;
    v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v6, 0x30u);
    return 0;
  }
  return (unsigned __int16)(a1 - 4);
}

BOOL rdata_parser_rrsig_check_validity(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  _BOOL8 result;
  NSObject *v11;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;

  if (a2 <= 0x13)
  {
    v11 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
    }
    else
    {
      v11 = mDNSLogCategory_Default_redacted;
      result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
    }
    v14 = 136447234;
    v15 = "rdata_len >= min_rdata_len_rrsig";
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    v20 = 1024;
    v21 = 474;
    v22 = 2048;
    v23 = 0;
    goto LABEL_22;
  }
  v2 = *(unsigned __int8 *)(a1 + 18);
  if (*(_BYTE *)(a1 + 18))
  {
    v3 = a1 + a2;
    v4 = a1 + 18;
    while (!v3 || v4 + (unint64_t)v2 + 1 <= v3)
    {
      v5 = v2 + v4;
      v6 = *(unsigned __int8 *)(v5 + 1);
      v4 = v5 + 1;
      v2 = v6;
      if (!v6)
        goto LABEL_9;
    }
  }
  else
  {
    v4 = a1 + 18;
LABEL_9:
    v7 = v4 - (a1 + 18);
    v8 = __CFADD__(v7, 1);
    v9 = v7 + 1;
    if (!v8)
    {
      if (v9 < (unint64_t)a2 - 18)
        return 1;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        v11 = mDNSLogCategory_Default;
        result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
        if (!result)
          return result;
      }
      else
      {
        v11 = mDNSLogCategory_Default_redacted;
        result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
        if (!result)
          return result;
      }
      v14 = 136447234;
      v15 = "signer_name_len < rdata_len - offsetof(rdata_rrsig_t, signer_name)";
      v16 = 2082;
      v17 = "";
      v18 = 2082;
      v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
      v20 = 1024;
      v21 = 481;
      v22 = 2048;
      v23 = 0;
      goto LABEL_22;
    }
  }
  v11 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
    if (result)
    {
LABEL_21:
      v14 = 136447234;
      v15 = "signer_name_len >= 1";
      v16 = 2082;
      v17 = "";
      v18 = 2082;
      v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
      v20 = 1024;
      v21 = 479;
      v22 = 2048;
      v23 = 0;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v14, 0x30u);
      return 0;
    }
  }
  else
  {
    v11 = mDNSLogCategory_Default_redacted;
    result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
    if (result)
      goto LABEL_21;
  }
  return result;
}

uint64_t rdata_parser_dnskey_get_public_key_size(unsigned int a1)
{
  NSObject *v3;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;

  if (a1 <= 3)
  {
    v3 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT))
        return 0;
    }
    else
    {
      v3 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT))
        return 0;
    }
    v6 = 136447234;
    v7 = "rdata_len >= offsetof(rdata_dnskey_t, public_key)";
    v8 = 2082;
    v9 = "";
    v10 = 2082;
    v11 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    v12 = 1024;
    v13 = 539;
    v14 = 2048;
    v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v6, 0x30u);
    return 0;
  }
  return (unsigned __int16)(a1 - 4);
}

void dnssd_analytics_update_dns_query_info(int a1, int a2, int a3, unsigned int a4, unsigned int a5, int a6)
{
  int v7;
  unsigned int v8;
  _QWORD *v9;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;

  if (a2)
  {
    v7 = 3;
    if (a2 == 1)
      v7 = 1;
    v8 = 2 * (a2 != 1);
    if (a1)
      v8 = v7;
    v9 = (_QWORD *)&s_dns_analytics + 13 * v8;
    if (v9)
    {
      switch(a3)
      {
        case 65:
          v14 = (char *)&s_dns_analytics + 104 * v8 + 80;
          break;
        case 28:
          v14 = (char *)&s_dns_analytics + 104 * v8 + 56;
          break;
        case 1:
          v14 = (char *)&s_dns_analytics + 104 * v8 + 32;
          break;
        default:
          return;
      }
      ++*v9;
      *((_QWORD *)&s_dns_analytics + 13 * v8 + 1) += a5;
      *(_QWORD *)v14 += a4;
      v15 = 16;
      if (a6)
        v15 = 8;
      ++*(_QWORD *)&v14[v15];
      v16 = mDNSLogCategory_Analytics;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEBUG))
          return;
      }
      else
      {
        v16 = mDNSLogCategory_Analytics_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEBUG))
          return;
      }
      v17[0] = 67110144;
      v17[1] = a1;
      v18 = 1024;
      v19 = a3;
      v20 = 1024;
      v21 = a4;
      v22 = 1024;
      v23 = a5;
      v24 = 1024;
      v25 = a6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "dnssd_analytics_update_dns_query_info cell %d qtype %d queries %u latency %d pos %d", (uint8_t *)v17, 0x20u);
    }
  }
}

void dnssd_analytics_update_cache_request(int a1, int a2)
{
  uint64_t v4;
  const char *v6;
  NSObject *v8;
  uint64_t v9;
  int v14;
  int v15;

  if (a1)
  {
    if (a1 != 1)
    {
      v4 = mDNSLogCategory_Analytics;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
          return;
        v14 = 67109120;
        v15 = a1;
        v6 = "dnssd_analytics_update_cache_request:  unknown CacheRequestType %d";
      }
      else
      {
        v4 = mDNSLogCategory_Analytics_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
          return;
        v14 = 67109120;
        v15 = a1;
        v6 = "dnssd_analytics_update_cache_request:  unknown CacheRequestType %d";
      }
      v8 = v4;
LABEL_40:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, 8u);
      return;
    }
    if (a2 == 1)
    {
      ++sCacheRequest_UnicastMissCount;
      return;
    }
    if (!a2)
    {
      ++sCacheRequest_UnicastHitCount;
      return;
    }
    v9 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
        return;
      v14 = 67109120;
      v15 = a2;
      v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for unicast";
      goto LABEL_39;
    }
    v9 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      v15 = a2;
      v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for unicast";
LABEL_39:
      v8 = v9;
      goto LABEL_40;
    }
  }
  else
  {
    if (a2 == 1)
    {
      ++sCacheRequest_MulticastMissCount;
      return;
    }
    if (!a2)
    {
      ++sCacheRequest_MulticastHitCount;
      return;
    }
    v9 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
        return;
      v14 = 67109120;
      v15 = a2;
      v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for multicast";
      goto LABEL_39;
    }
    v9 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      v15 = a2;
      v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for multicast";
      goto LABEL_39;
    }
  }
}

void __dnssd_analytics_init_block_invoke(id a1)
{
  xpc_object_t v1;

  dnssd_analytics_init_sAnalyticsQueue = (uint64_t)dispatch_queue_create("com.apple.mDNSResponder.analytics-reporting-queue", 0);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v1, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v1, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v1, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v1, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_string(v1, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_activity_register("com.apple.mDNSResponder.analytics.daily", v1, &__block_literal_global_7_7166);
  if (v1)
    xpc_release(v1);
}

void __dnssd_analytics_init_block_invoke_2(id a1, _xpc_activity_s *a2)
{
  _BOOL4 v3;
  char v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v9;
  os_log_type_t v10;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  uint8_t buf[2];
  __int16 v16;
  __int16 v17;

  if (xpc_activity_should_defer(a2))
  {
    v3 = xpc_activity_set_state(a2, 3);
    v4 = gSensitiveLoggingEnabled;
    v5 = mDNSLogCategory_Analytics;
    if (mDNSLogCategory_Analytics == mDNSLogCategory_State)
      v4 = 0;
    if (v3)
    {
      if ((v4 & 1) != 0)
      {
        v5 = mDNSLogCategory_Analytics_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
          return;
        v16 = 0;
        v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer";
        v7 = (uint8_t *)&v16;
      }
      else
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
          return;
        v17 = 0;
        v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer";
        v7 = (uint8_t *)&v17;
      }
      v9 = v5;
      v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
    if ((v4 & 1) != 0)
    {
      v5 = mDNSLogCategory_Analytics_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_ERROR))
        return;
      v14 = 0;
      v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer but failed to set state";
      v7 = (uint8_t *)&v14;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_ERROR))
        return;
      *(_WORD *)buf = 0;
      v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer but failed to set state";
      v7 = buf;
    }
LABEL_26:
    v9 = v5;
    v10 = OS_LOG_TYPE_ERROR;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v6, v7, 2u);
    return;
  }
  dispatch_async((dispatch_queue_t)dnssd_analytics_init_sAnalyticsQueue, &__block_literal_global_10_7173);
  if (xpc_activity_set_state(a2, 5))
    return;
  v5 = mDNSLogCategory_Analytics;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_ERROR))
      return;
    v13 = 0;
    v6 = "com.apple.mDNSResponder.analytics.daily: Analytics XPC_ACTIVITY_STATE_DONE failed";
    v7 = (uint8_t *)&v13;
    goto LABEL_26;
  }
  v5 = mDNSLogCategory_Analytics_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_ERROR))
  {
    v12 = 0;
    v6 = "com.apple.mDNSResponder.analytics.daily: Analytics XPC_ACTIVITY_STATE_DONE failed";
    v7 = (uint8_t *)&v12;
    goto LABEL_26;
  }
}

void __dnssd_analytics_init_block_invoke_8(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  unint64_t v10;
  __int128 *v11;
  char *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[16];
  uint8_t buf[8];
  uint64_t v26;
  xpc_object_t (*v27)(uint64_t);
  void *v28;
  char *v29;
  char *v30;
  __int128 *v31;

  v1 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v1, v2, v3, v4, v5, v6, v7, v8);
  mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"dnssd_analytics_init_block_invoke", 606);
  if (sCacheRequest_UnicastHitCount)
  {
    _post_cache_request_count(1, 0, sCacheRequest_UnicastHitCount, v9);
    sCacheRequest_UnicastHitCount = 0;
  }
  if (sCacheRequest_UnicastMissCount)
  {
    _post_cache_request_count(1, 1, sCacheRequest_UnicastMissCount, v9);
    sCacheRequest_UnicastMissCount = 0;
  }
  if (sCacheRequest_MulticastHitCount)
  {
    _post_cache_request_count(0, 0, sCacheRequest_MulticastHitCount, v9);
    sCacheRequest_MulticastHitCount = 0;
  }
  if (sCacheRequest_MulticastMissCount)
  {
    _post_cache_request_count(0, 1, sCacheRequest_MulticastMissCount, v9);
    sCacheRequest_MulticastMissCount = 0;
  }
  if (__PAIR128__(sCacheUsage_MulticastMissCount, sCacheUsage_MulticastHitCount) != 0)
  {
    _post_cache_usage_counts_for_type(0, sCacheUsage_MulticastHitCount, sCacheUsage_MulticastMissCount, v9);
    sCacheUsage_MulticastHitCount = 0;
    sCacheUsage_MulticastMissCount = 0;
  }
  if (__PAIR128__(sCacheUsage_UnicastMissCount, sCacheUsage_UnicastHitCount) != 0)
  {
    _post_cache_usage_counts_for_type(1, sCacheUsage_UnicastHitCount, sCacheUsage_UnicastMissCount, v9);
    sCacheUsage_UnicastHitCount = 0;
    sCacheUsage_UnicastMissCount = 0;
  }
  v10 = 0;
  v11 = &s_dns_analytics;
  do
  {
    if (*(_QWORD *)v11)
    {
      v12 = off_10013F4D0[v10];
      v13 = v10 >= 2 ? "encrypted" : "standard";
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v26 = 0x40000000;
      v27 = ___post_dns_analytic_block_invoke;
      v28 = &__block_descriptor_tmp_64_7179;
      v29 = v12;
      v30 = v13;
      v31 = v11;
      if ((analytics_send_event_lazy("com.apple.mDNSResponder.dnsqueryinfo", buf, v9) & 1) == 0)
      {
        v14 = mDNSLogCategory_Analytics;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
        }
        else
        {
          v14 = mDNSLogCategory_Analytics_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
        }
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.dnsqueryinfo: Analytic not posted", v24, 2u);
      }
    }
LABEL_25:
    ++v10;
    v11 = (__int128 *)((char *)v11 + 104);
  }
  while (v10 != 4);
  xmmword_100164900 = 0u;
  unk_100164910 = 0u;
  xmmword_1001648E0 = 0u;
  unk_1001648F0 = 0u;
  xmmword_1001648C0 = 0u;
  unk_1001648D0 = 0u;
  xmmword_1001648A0 = 0u;
  unk_1001648B0 = 0u;
  xmmword_100164880 = 0u;
  unk_100164890 = 0u;
  xmmword_100164860 = 0u;
  unk_100164870 = 0u;
  xmmword_100164840 = 0u;
  unk_100164850 = 0u;
  xmmword_100164820 = 0u;
  unk_100164830 = 0u;
  xmmword_100164800 = 0u;
  unk_100164810 = 0u;
  xmmword_1001647E0 = 0u;
  unk_1001647F0 = 0u;
  xmmword_1001647C0 = 0u;
  *(_OWORD *)&qword_1001647D0 = 0u;
  xmmword_1001647A0 = 0u;
  *(_OWORD *)&qword_1001647B0 = 0u;
  s_dns_analytics = 0u;
  *(_OWORD *)algn_100164790 = 0u;
  if ((analytics_send_event_lazy("com.apple.mDNSResponder.unicastassist", &__block_literal_global_67, (__n128)0) & 1) == 0)
  {
    v15 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.unicastassist: Analytic not posted", buf, 2u);
      }
    }
    else
    {
      v15 = mDNSLogCategory_Analytics_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        goto LABEL_33;
      }
    }
  }
  sUnicastAssist_UnicastCount = 0;
  sUnicastAssist_MulticastCount = 0;
  sNonUnicastAssist_UnicastCount = 0;
  sNonUnicastAssist_MulticastCount = 0;
  v16 = mDNSLogCategory_Analytics;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
LABEL_40:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.analytics.daily Complete", buf, 2u);
    }
  }
  else
  {
    v16 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      goto LABEL_40;
    }
  }
  mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"dnssd_analytics_init_block_invoke", 618);
  KQueueUnlock((uint64_t)"Analytics Update", v17, v18, v19, v20, v21, v22, v23);
}

void _post_cache_request_count(int a1, int a2, uint64_t a3, __n128 a4)
{
  NSObject *v4;
  uint8_t v7[16];
  _QWORD v8[5];
  int v9;
  int v10;

  v8[0] = _NSConcreteStackBlock;
  a4.n128_u64[0] = 0x40000000;
  v8[1] = 0x40000000;
  v8[2] = ___post_cache_request_count_block_invoke;
  v8[3] = &__block_descriptor_tmp_44_7218;
  v9 = a1;
  v10 = a2;
  v8[4] = a3;
  if ((analytics_send_event_lazy("com.apple.mDNSResponder.CacheUsage.request", v8, a4) & 1) == 0)
  {
    v4 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
        return;
      *(_WORD *)v7 = 0;
      goto LABEL_11;
    }
    v4 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.CacheUsage.request: Analytic not posted", v7, 2u);
    }
  }
}

void _post_cache_usage_counts_for_type(int a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  NSObject *v4;
  uint8_t v7[8];
  _QWORD v8[6];
  int v9;

  v8[0] = _NSConcreteStackBlock;
  a4.n128_u64[0] = 0x40000000;
  v8[1] = 0x40000000;
  v8[2] = ___post_cache_usage_counts_for_type_block_invoke;
  v8[3] = &__block_descriptor_tmp_48_7211;
  v9 = a1;
  v8[4] = a2;
  v8[5] = a3;
  if ((analytics_send_event_lazy("com.apple.mDNSResponder.CacheUsage.entries", v8, a4) & 1) == 0)
  {
    v4 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
        return;
      *(_WORD *)v7 = 0;
      goto LABEL_11;
    }
    v4 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.CacheUsage.entries: Analytic not posted", v7, 2u);
    }
  }
}

xpc_object_t ___post_dns_analytic_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "network", *(const char **)(a1 + 32));
  xpc_dictionary_set_string(v2, "transport", *(const char **)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "latency_ms", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) / **(_QWORD **)(a1 + 48));
  xpc_dictionary_set_uint64(v2, "query_bytes", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
  xpc_dictionary_set_uint64(v2, "reply_bytes", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24));
  xpc_dictionary_set_uint64(v2, "v4_queries", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
  xpc_dictionary_set_uint64(v2, "v4_reply_pos", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));
  xpc_dictionary_set_uint64(v2, "v4_reply_neg", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  xpc_dictionary_set_uint64(v2, "v6_queries", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56));
  xpc_dictionary_set_uint64(v2, "v6_reply_pos", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64));
  xpc_dictionary_set_uint64(v2, "v6_reply_neg", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72));
  xpc_dictionary_set_uint64(v2, "https_queries", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80));
  xpc_dictionary_set_uint64(v2, "https_reply_pos", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));
  xpc_dictionary_set_uint64(v2, "https_reply_neg", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96));
  return v2;
}

void *__cdecl ___post_unicast_assist_block_invoke(id a1)
{
  xpc_object_t v1;

  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v1, "unicast", sUnicastAssist_UnicastCount);
  xpc_dictionary_set_uint64(v1, "multicast", sUnicastAssist_MulticastCount);
  xpc_dictionary_set_uint64(v1, "non_unicast", sNonUnicastAssist_UnicastCount);
  xpc_dictionary_set_uint64(v1, "non_multicast", sNonUnicastAssist_MulticastCount);
  return v1;
}

void *___post_cache_usage_counts_for_type_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (*(_DWORD *)(a1 + 48))
    v4 = "unicast";
  else
    v4 = "multicast";
  xpc_dictionary_set_string(v2, "requestType", v4);
  xpc_dictionary_set_uint64(v3, "hitCount", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_uint64(v3, "missCount", *(_QWORD *)(a1 + 40));
  return v3;
}

void *___post_cache_request_count_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;
  const char *v5;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (*(_DWORD *)(a1 + 40))
    v4 = "unicast";
  else
    v4 = "multicast";
  xpc_dictionary_set_string(v2, "requestType", v4);
  if (*(_DWORD *)(a1 + 44))
    v5 = "miss";
  else
    v5 = "hit";
  xpc_dictionary_set_string(v3, "cacheState", v5);
  xpc_dictionary_set_uint64(v3, "requestCount", *(_QWORD *)(a1 + 32));
  return v3;
}

void *_mdns_dso_message_builder_copy_description(_QWORD *a1, int a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
    v6 = 0;
  else
    v6 = mdns_string_builder_copy_string((uint64_t)v5);
  os_release(v5);
  return v6;
}

_BYTE *mdns_dso_message_builder_create_message(uint64_t a1)
{
  uint64_t v2;
  char v3;
  char v4;
  dispatch_data_t v5;
  NSObject *v6;
  uint64_t (*v7)(uint64_t);
  NSObject *v8;
  NSObject *v9;
  dispatch_data_t concat;
  _BYTE *v11;
  __int16 buffer;
  char v14;
  char v15;
  uint64_t v16;

  v16 = 0;
  buffer = bswap32(*(unsigned __int16 *)(a1 + 28)) >> 16;
  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 30) & 0xF;
  if (*(_BYTE *)(v2 + 56))
    v4 = -80;
  else
    v4 = 48;
  v14 = v4;
  v15 = v3;
  v5 = dispatch_data_create(&buffer, 0xCuLL, 0, 0);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(uint64_t (**)(uint64_t))(v2 + 48);
  if (v7)
  {
    v8 = v7(a1);
    if (!v8)
    {
      v11 = 0;
      goto LABEL_12;
    }
    v9 = v8;
    concat = dispatch_data_create_concat(v6, v8);
    dispatch_release(v6);
    if (!concat)
    {
      v11 = 0;
      v6 = v9;
LABEL_12:
      dispatch_release(v6);
      return v11;
    }
    v6 = concat;
  }
  else
  {
    v9 = 0;
  }
  v11 = mdns_message_create_with_dispatch_data(v6, *(_DWORD *)(a1 + 24));
  dispatch_release(v6);
  v6 = v9;
  if (v9)
    goto LABEL_12;
  return v11;
}

dispatch_data_t _mdns_dso_keepalive_message_builder_create_primary_tlv(uint64_t a1)
{
  void *v1;
  _DWORD *v3;
  int v4;
  int v5;
  dispatch_data_t result;

  v3 = malloc_type_calloc(1uLL, 0xCuLL, 0xF1748037uLL);
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  v1 = v3;
  *v3 = 134217984;
  v5 = *(_DWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 36);
  *((_BYTE *)v3 + 4) = HIBYTE(v5);
  *((_BYTE *)v3 + 5) = BYTE2(v5);
  *((_BYTE *)v3 + 6) = BYTE1(v5);
  *((_BYTE *)v3 + 7) = v5;
  *((_BYTE *)v3 + 8) = HIBYTE(v4);
  *((_BYTE *)v3 + 9) = BYTE2(v4);
  *((_BYTE *)v3 + 10) = BYTE1(v4);
  *((_BYTE *)v3 + 11) = v4;
  result = dispatch_data_create(v3, 0xCuLL, 0, _dispatch_data_destructor_free);
  if (!result)
  {
LABEL_5:
    free(v1);
    return 0;
  }
  return result;
}

void _mdns_dso_subscribe_message_builder_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    os_release(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
}

char *_mdns_dso_subscribe_message_builder_create_primary_tlv(uint64_t a1)
{
  char *result;
  size_t v3;
  size_t v4;
  size_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  size_t v9;
  _WORD __src[2];

  result = 0;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = v3 + 4;
  if (v3 < 0xFFFFFFFFFFFFFFFCLL && !(v4 >> 16))
  {
    v5 = v3 + 8;
    result = (char *)malloc_type_calloc(1uLL, v3 + 8, 0xF1748037uLL);
    if (result)
    {
      v6 = result;
      *(_WORD *)result = 0x4000;
      result[2] = BYTE1(v4);
      result[3] = v4;
      if (v4 < v3)
        v3 += 4;
      if (v3)
      {
        memcpy(result + 4, *(const void **)(*(_QWORD *)(a1 + 32) + 24), v3);
        v7 = v3 + 4;
      }
      else
      {
        v7 = 4;
      }
      __src[0] = bswap32(*(unsigned __int16 *)(a1 + 40)) >> 16;
      __src[1] = bswap32(*(unsigned __int16 *)(a1 + 42)) >> 16;
      v8 = v5 - v7;
      if (v5 - v7 >= 4)
        v9 = 4;
      else
        v9 = v5 - v7;
      if (v9)
        memcpy(&v6[v7], __src, v9);
      if (v8 < 4 || (result = (char *)dispatch_data_create(v6, v4 + 4, 0, _dispatch_data_destructor_free)) == 0)
      {
        free(v6);
        return 0;
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

dispatch_data_t _mdns_dso_unsubscribe_message_builder_create_primary_tlv(uint64_t a1)
{
  void *v1;
  _DWORD *v3;
  dispatch_data_t result;

  v3 = malloc_type_calloc(1uLL, 6uLL, 0xF1748037uLL);
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  v1 = v3;
  *v3 = 33571328;
  *((_WORD *)v3 + 2) = bswap32(*(unsigned __int16 *)(a1 + 32)) >> 16;
  result = dispatch_data_create(v3, 6uLL, 0, _dispatch_data_destructor_free);
  if (!result)
  {
LABEL_5:
    free(v1);
    return 0;
  }
  return result;
}

void __init_log_utility_service_block_invoke(id a1, void *a2)
{
  xpc_type_t type;
  char v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  NSObject *v9;
  uint32_t v10;
  _BYTE v12[24];
  void *v13;
  void *v14;

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v7 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        xpc_retain(a2);
        xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)log_utility_server_queue);
        *(_QWORD *)v12 = _NSConcreteStackBlock;
        *(_QWORD *)&v12[8] = 0x40000000;
        *(_QWORD *)&v12[16] = __accept_client_block_invoke;
        v13 = &__block_descriptor_tmp_3_7301;
        v14 = a2;
        xpc_connection_set_event_handler((xpc_connection_t)a2, v12);
        xpc_connection_resume((xpc_connection_t)a2);
        return;
      }
      *(_DWORD *)v12 = 134217984;
      *(_QWORD *)&v12[4] = a2;
    }
    else
    {
      v7 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)v12 = 134217984;
      *(_QWORD *)&v12[4] = a2;
    }
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "C%p {action='receives connection'}", v12, 0xCu);
    goto LABEL_24;
  }
  v4 = gSensitiveLoggingEnabled;
  v5 = mDNSLogCategory_XPC;
  if (mDNSLogCategory_XPC == mDNSLogCategory_State)
    v4 = 0;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if ((v4 & 1) != 0)
    {
      v5 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
        return;
    }
    else if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
    {
      return;
    }
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = a2;
    *(_WORD *)&v12[12] = 2082;
    *(_QWORD *)&v12[14] = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    v6 = "C%p {xpc_error=\n%{public}s\n}";
    v9 = v5;
    v10 = 22;
  }
  else
  {
    if ((v4 & 1) != 0)
    {
      v5 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)v12 = 134217984;
      *(_QWORD *)&v12[4] = a2;
      v6 = "C%p {error='receives unknown xpc request'}";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)v12 = 134217984;
      *(_QWORD *)&v12[4] = a2;
      v6 = "C%p {error='receives unknown xpc request'}";
    }
    v9 = v5;
    v10 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v6, v12, v10);
}

void __accept_client_block_invoke(uint64_t a1, xpc_object_t object)
{
  NSObject *v4;
  uint64_t v6;
  _xpc_connection_s *remote_connection;
  NSObject *v8;
  uint64_t v11;
  void *v12;
  xpc_object_t reply;
  void *v15;
  uid_t euid;
  pid_t pid;
  NSObject *v18;
  NSObject *v19;
  int uint64;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  DIR *v34;
  DIR *v35;
  __darwin_time_t v36;
  dirent *v37;
  dirent *v38;
  const char *d_name;
  __darwin_time_t tv_sec;
  unsigned int d_namlen;
  NSObject *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  int *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  size_t v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  int *v58;
  char *v59;
  std::error_code *v60;
  int v61;
  unsigned int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  size_t v66;
  size_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  const char *v72;
  int v73;
  off_t st_size;
  int v75;
  int v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  std::error_code *v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  std::error_code *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  NSObject *v94;
  uint32_t v95;
  int *v96;
  char *v97;
  NSObject *v98;
  const char *v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v103;
  size_t v104;
  const char *v105;
  NSObject *v106;
  uint32_t v107;
  int *v108;
  char *v109;
  uint64_t v110;
  const char *v111;
  NSObject *v112;
  uint32_t v113;
  uint64_t v114;
  int *v115;
  char *v116;
  uint64_t v118;
  int *v119;
  char *v120;
  uint64_t v121;
  NSObject *v122;
  int *v123;
  char *v124;
  int v125;
  __darwin_time_t v126;
  NSObject *oslog;
  int v128;
  unsigned __int8 v129;
  uint64_t v130;
  int v131;
  timeval v132;
  timeval v133;
  std::__fs::filesystem::path __str;
  char v135;
  char __s[1024];
  uint8_t v137[4];
  _BYTE v138[10];
  char *v139;
  uint8_t v140[32];
  stat buf[7];
  stat v142;

  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v6 = *(_QWORD *)(a1 + 32);
      buf[0].st_dev = 134217984;
      *(_QWORD *)&buf[0].st_mode = v6;
    }
    else
    {
      v4 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        v12 = *(void **)(a1 + 32);
        if (v12)
          goto LABEL_57;
        return;
      }
      v11 = *(_QWORD *)(a1 + 32);
      buf[0].st_dev = 134217984;
      *(_QWORD *)&buf[0].st_mode = v11;
    }
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "C%p {status='client closed the connection'}", (uint8_t *)buf, 0xCu);
    goto LABEL_19;
  }
  remote_connection = xpc_dictionary_get_remote_connection(object);
  v8 = mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    buf[0].st_dev = 134217984;
    *(_QWORD *)&buf[0].st_mode = remote_connection;
    goto LABEL_23;
  }
  v8 = mDNSLogCategory_XPC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
  {
    buf[0].st_dev = 134217984;
    *(_QWORD *)&buf[0].st_mode = remote_connection;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "C%p {action='handling log utility request'}", (uint8_t *)buf, 0xCu);
  }
LABEL_24:
  reply = xpc_dictionary_create_reply(object);
  if (!reply)
  {
    v19 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
        return;
      buf[0].st_dev = 134217984;
      *(_QWORD *)&buf[0].st_mode = remote_connection;
    }
    else
    {
      v19 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
        return;
      buf[0].st_dev = 134217984;
      *(_QWORD *)&buf[0].st_mode = remote_connection;
    }
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "C%p {error='cannot create reply response dictionary'}", (uint8_t *)buf, 0xCu);
    return;
  }
  v15 = reply;
  euid = xpc_connection_get_euid(remote_connection);
  pid = xpc_connection_get_pid(remote_connection);
  if (euid)
  {
    v18 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
    }
    else
    {
      v18 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
    }
    buf[0].st_dev = 134218240;
    *(_QWORD *)&buf[0].st_mode = remote_connection;
    WORD2(buf[0].st_ino) = 1024;
    *(_DWORD *)((char *)&buf[0].st_ino + 6) = pid;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "C%p {client_pid=%d,error='not running as root'}", (uint8_t *)buf, 0x12u);
LABEL_43:
    if (IsEntitled((uint64_t)remote_connection))
    {
      v30 = "Client must be running as root";
LABEL_55:
      xpc_dictionary_set_string(v15, "ErrorDescription", v30);
      v32 = 3;
      goto LABEL_56;
    }
LABEL_45:
    v31 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
      {
LABEL_53:
        buf[0].st_dev = 134218240;
        *(_QWORD *)&buf[0].st_mode = remote_connection;
        WORD2(buf[0].st_ino) = 1024;
        *(_DWORD *)((char *)&buf[0].st_ino + 6) = pid;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "C%p {client_pid=%d,error='Client is missing entitlement'}", (uint8_t *)buf, 0x12u);
      }
    }
    else
    {
      v31 = mDNSLogCategory_XPC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
        goto LABEL_53;
    }
    v30 = "Client is missing the entitlement";
    goto LABEL_55;
  }
  if (!IsEntitled((uint64_t)remote_connection))
    goto LABEL_45;
  if (!xpc_dictionary_get_uint64(object, "mDNSResponderStateDump"))
  {
    v33 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
      {
        buf[0].st_dev = 134217984;
        *(_QWORD *)&buf[0].st_mode = remote_connection;
        goto LABEL_89;
      }
    }
    else
    {
      v33 = mDNSLogCategory_XPC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
      {
        buf[0].st_dev = 134217984;
        *(_QWORD *)&buf[0].st_mode = remote_connection;
LABEL_89:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "C%p {error='unknown log utility request from client'}", (uint8_t *)buf, 0xCu);
      }
    }
    xpc_dictionary_set_string(v15, "ErrorDescription", "unknown log utility request from client");
    v32 = 2;
    goto LABEL_56;
  }
  uint64 = xpc_dictionary_get_uint64(object, "mDNSResponderStateDump");
  bzero(&__str, 0x400uLL);
  if (is_apple_internal_build_s_once != -1)
    dispatch_once(&is_apple_internal_build_s_once, &__block_literal_global_2_6036);
  if (!is_apple_internal_build_is_internal)
  {
    v30 = "State dump is only enabled in internal builds";
    goto LABEL_55;
  }
  v21 = xpc_dictionary_dup_fd(object, "mDNSResponderDumpFD");
  v132.tv_sec = 0;
  *(_QWORD *)&v132.tv_usec = 0;
  gettimeofday(&v132, 0);
  KQueueLock();
  if (uint64 == 3)
  {
    dump_state_to_fd(v21);
    v29 = 0;
    goto LABEL_243;
  }
  bzero(__s, 0x400uLL);
  v131 = uint64;
  v128 = v21;
  if ((snprintf((char *)&__str, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", "mDNSResponder_state_dump")- 1024) <= 0xFFFFFC00)
  {
    v45 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
        goto LABEL_121;
    }
    else
    {
      v45 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
        goto LABEL_121;
    }
    buf[0].st_dev = 67109632;
    *(_DWORD *)&buf[0].st_mode = 1024;
    LOWORD(buf[0].st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = 30;
    HIWORD(buf[0].st_uid) = 2048;
    *(_QWORD *)&buf[0].st_gid = 24;
    v47 = "snprintf truncates the final string - full name buffer length: %u, directory name length: %zu, file name length: %zu";
    v48 = v45;
    v49 = 28;
    goto LABEL_103;
  }
  v34 = opendir("/private/var/log/mDNSResponder");
  if (!v34)
  {
    v46 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
        goto LABEL_121;
    }
    else
    {
      v46 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
        goto LABEL_121;
    }
    v50 = __error();
    v51 = strerror(*v50);
    buf[0].st_dev = 136446466;
    *(_QWORD *)&buf[0].st_mode = "/private/var/log/mDNSResponder";
    WORD2(buf[0].st_ino) = 2082;
    *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v51;
    v47 = "State Dump: directory %{public}s cannot be opened, reason: %{public}s";
    v48 = v46;
    v49 = 22;
LABEL_103:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, v47, (uint8_t *)buf, v49);
LABEL_121:
    v133.tv_sec = 0;
    *(_QWORD *)&v133.tv_usec = 0;
    memset(buf, 0, 56);
    memset(&v142, 0, 32);
    memset(v140, 0, sizeof(v140));
    gettimeofday(&v133, 0);
    localtime_r(&v133.tv_sec, (tm *)buf);
    strftime((char *)&v142, 0x20uLL, "%F_%H-%M-%S", (const tm *)buf);
    strftime((char *)v140, 0x20uLL, "%z", (const tm *)buf);
    v61 = snprintf((char *)&__str, 0x400uLL, "%s/%s_%s-%06lu%s.txt", "/private/var/log/mDNSResponder", "mDNSResponder_state_dump", (const char *)&v142, v133.tv_usec, (const char *)v140);
    if ((v61 - 1024) > 0xFFFFFC00)
    {
      v62 = open((const char *)&__str, 513, 420);
      if ((v62 & 0x80000000) == 0)
      {
        v63 = v62;
        dump_state_to_fd(v62);
        close(v63);
        if (uint64 != 2)
        {
LABEL_144:
          v29 = 0;
          goto LABEL_242;
        }
        memset(&v142, 0, sizeof(v142));
        bzero(buf, 0x400uLL);
        v64 = archive_write_new();
        if (v64)
        {
          v65 = v64;
          archive_write_add_filter_bzip2();
          archive_write_set_format_ustar(v65);
          v66 = strlen((const char *)&__str);
          v67 = v66 + 4;
          if (v66 + 4 < 0x400)
          {
            snprintf((char *)buf, 0x400uLL, "%.*s%s", v66 - 3, (const char *)&__str, "tar.bz2");
            if (!archive_write_open_filename(v65, buf))
            {
              v68 = stat((const char *)&__str, &v142);
              v69 = archive_entry_new(v68);
              if (v69)
              {
                v70 = v69;
                v71 = strstr((char *)&__str, "mDNSResponder_state_dump");
                if (v71)
                  v72 = v71;
                else
                  v72 = "mDNSResponder_state_dump.txt";
                archive_entry_copy_stat(v70, &v142);
                archive_entry_set_pathname(v70, v72);
                do
                  v73 = archive_write_header(v65, v70);
                while (v73 == -10);
                if (!v73)
                {
                  st_size = v142.st_size;
                  if ((unint64_t)(v142.st_size - 0x100000000) < 0xFFFFFFFF00000001)
                    goto LABEL_230;
                  v75 = open((const char *)&__str, 0);
                  if (v75 == -1)
                    goto LABEL_230;
                  v76 = v75;
                  v77 = mmap(0, st_size, 1, 2, v75, 0);
                  if (v77 != (void *)-1)
                  {
                    v78 = v77;
                    v130 = v65;
                    v79 = archive_write_data(v65, v77, st_size);
                    v80 = v79;
                    if ((v79 & 0x8000000000000000) == 0 && v79 == st_size)
                    {
                      munmap(v78, st_size);
                      close(v76);
                      archive_entry_free(v70);
                      archive_write_close(v130);
                      archive_write_free(v130);
                      remove(&__str, v81);
                      if (strlen((const char *)buf) <= 0x3FF)
                      {
                        v82 = 0;
                        uint64 = v131;
                        while (1)
                        {
                          v83 = *((unsigned __int8 *)&buf[0].st_dev + v82);
                          __str.__pn_.__r_.__value_.__s.__data_[v82] = v83;
                          if (!v83)
                            goto LABEL_144;
                          if (++v82 == 1023)
                          {
                            v29 = 0;
                            v135 = 0;
                            goto LABEL_242;
                          }
                        }
                      }
LABEL_235:
                      __str.__pn_.__r_.__value_.__s.__data_[0] = 0;
                      v122 = mDNSLogCategory_XPC;
                      uint64 = v131;
                      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                      {
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
                        {
LABEL_240:
                          v123 = __error();
                          v124 = strerror(*v123);
                          buf[0].st_dev = 136315138;
                          *(_QWORD *)&buf[0].st_mode = v124;
                          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "State Dump: Error happens when trying to compress the state dump, reason: %s", (uint8_t *)buf, 0xCu);
                        }
                      }
                      else
                      {
                        v122 = mDNSLogCategory_XPC_redacted;
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
                          goto LABEL_240;
                      }
                      v29 = 255;
                      goto LABEL_242;
                    }
                    oslog = mDNSLogCategory_XPC;
                    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                    {
                      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                      {
LABEL_250:
                        *(_DWORD *)v140 = 134218240;
                        *(_QWORD *)&v140[4] = v80;
                        *(_WORD *)&v140[12] = 1024;
                        *(_DWORD *)&v140[14] = st_size;
                        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "archive_write_data fails: amount_written(%ld) != (%u)", v140, 0x12u);
                      }
                    }
                    else
                    {
                      oslog = mDNSLogCategory_XPC_redacted;
                      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
                        goto LABEL_250;
                    }
                    munmap(v78, st_size);
                    close(v76);
                    archive_entry_free(v70);
                    archive_write_close(v130);
                    v121 = v130;
                    goto LABEL_233;
                  }
                  v103 = mDNSLogCategory_XPC;
                  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                  {
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                    {
LABEL_228:
                      v119 = __error();
                      v120 = strerror(*v119);
                      *(_DWORD *)v140 = 136446210;
                      *(_QWORD *)&v140[4] = v120;
                      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEBUG, "mmap fails: %{public}s", v140, 0xCu);
                    }
                  }
                  else
                  {
                    v103 = mDNSLogCategory_XPC_redacted;
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
                      goto LABEL_228;
                  }
                  close(v76);
                  goto LABEL_230;
                }
                v101 = mDNSLogCategory_XPC;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                {
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                  {
LABEL_230:
                    archive_entry_free(v70);
                    goto LABEL_231;
                  }
                }
                else
                {
                  v101 = mDNSLogCategory_XPC_redacted;
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
                    goto LABEL_230;
                }
                v118 = archive_error_string(v65);
                *(_DWORD *)v140 = 136446210;
                *(_QWORD *)&v140[4] = v118;
                _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEBUG, "archive_write_header fails: %{public}s", v140, 0xCu);
                goto LABEL_230;
              }
              v100 = mDNSLogCategory_XPC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                {
LABEL_224:
                  v115 = __error();
                  v116 = strerror(*v115);
                  *(_DWORD *)v140 = 136446210;
                  *(_QWORD *)&v140[4] = v116;
                  _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEBUG, "archive_entry_new fails: %{public}s", v140, 0xCu);
                }
              }
              else
              {
                v100 = mDNSLogCategory_XPC_redacted;
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
                  goto LABEL_224;
              }
LABEL_231:
              archive_write_close(v65);
              goto LABEL_232;
            }
            v92 = mDNSLogCategory_XPC;
            if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
            {
              if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
              {
LABEL_221:
                v114 = archive_error_string(v65);
                *(_DWORD *)v140 = 136446210;
                *(_QWORD *)&v140[4] = v114;
                v111 = "archive_write_open_filename fails: %{public}s";
                v112 = v92;
                v113 = 12;
                goto LABEL_222;
              }
            }
            else
            {
              v92 = mDNSLogCategory_XPC_redacted;
              if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
                goto LABEL_221;
            }
LABEL_232:
            v121 = v65;
LABEL_233:
            archive_write_free(v121);
            goto LABEL_234;
          }
          v91 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
              goto LABEL_232;
          }
          else
          {
            v91 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
              goto LABEL_232;
          }
          *(_DWORD *)v140 = 134218240;
          *(_QWORD *)&v140[4] = 1024;
          *(_WORD *)&v140[12] = 2048;
          *(_QWORD *)&v140[14] = v67;
          v111 = "buffer is not large enough to hold the file name - buffer length: %zu, required length: %zu";
          v112 = v91;
          v113 = 22;
LABEL_222:
          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEBUG, v111, v140, v113);
          goto LABEL_232;
        }
        v89 = mDNSLogCategory_XPC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
          {
LABEL_217:
            v110 = archive_error_string(0);
            *(_DWORD *)v140 = 136446210;
            *(_QWORD *)&v140[4] = v110;
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "archive_write_new fails: %{public}s", v140, 0xCu);
          }
        }
        else
        {
          v89 = mDNSLogCategory_XPC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
            goto LABEL_217;
        }
LABEL_234:
        remove(&__str, v90);
        goto LABEL_235;
      }
      v86 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
        {
LABEL_176:
          v96 = __error();
          v97 = strerror(*v96);
          *(_DWORD *)v137 = 136446466;
          *(_QWORD *)v138 = &__str;
          *(_WORD *)&v138[8] = 2082;
          v139 = v97;
          v93 = "State Dump: file %{public}s cannot be opened, reason: %{public}s";
          v94 = v86;
          v95 = 22;
          goto LABEL_177;
        }
      }
      else
      {
        v86 = mDNSLogCategory_Default_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
          goto LABEL_176;
      }
LABEL_178:
      v98 = mDNSLogCategory_XPC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0].st_dev) = 0;
          v99 = "create_new_state_dump_file fails";
          goto LABEL_214;
        }
      }
      else
      {
        v98 = mDNSLogCategory_XPC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0].st_dev) = 0;
          v99 = "create_new_state_dump_file fails";
          goto LABEL_214;
        }
      }
      goto LABEL_215;
    }
    v84 = v61;
    v85 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
        goto LABEL_178;
    }
    else
    {
      v85 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
        goto LABEL_178;
    }
    *(_DWORD *)v137 = 67109376;
    *(_DWORD *)v138 = v84;
    *(_WORD *)&v138[4] = 1024;
    *(_DWORD *)&v138[6] = 1024;
    v93 = "State Dump: snprintf truncates the final string - minimal buffer size: %d, actual buffer size: %u";
    v94 = v85;
    v95 = 14;
LABEL_177:
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, v93, v137, v95);
    goto LABEL_178;
  }
  v35 = v34;
  v129 = 0;
  v36 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v37 = readdir(v35);
    if (!v37)
      break;
    v38 = v37;
    if (v37->d_namlen >= 0x19u)
    {
      d_name = v37->d_name;
      if (!strncmp(v37->d_name, "mDNSResponder_state_dump", 0x18uLL))
      {
        memset(buf, 0, 144);
        if ((snprintf((char *)&__str, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", v38->d_name)
                          - 1024) <= 0xFFFFFC00)
        {
          v52 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
              break;
          }
          else
          {
            v52 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
              break;
          }
          v54 = strlen(d_name);
          v142.st_dev = 67109632;
          *(_DWORD *)&v142.st_mode = 1024;
          LOWORD(v142.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v142.st_ino + 2) = 30;
          HIWORD(v142.st_uid) = 2048;
          *(_QWORD *)&v142.st_gid = v54;
          v55 = "snprintf truncates the final string - full name buffer length: %u, directory name length: %zu, file name length: %zu";
          v56 = v52;
          v57 = 28;
LABEL_117:
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, v55, (uint8_t *)&v142, v57);
          break;
        }
        if (stat((const char *)&__str, buf))
        {
          v53 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
              break;
          }
          else
          {
            v53 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
              break;
          }
          v58 = __error();
          v59 = strerror(*v58);
          v142.st_dev = 136446210;
          *(_QWORD *)&v142.st_mode = v59;
          v55 = "State Dump: error when reading file properties - reason: %{public}s";
          v56 = v53;
          v57 = 12;
          goto LABEL_117;
        }
        tv_sec = buf[0].st_birthtimespec.tv_sec;
        if (v36 <= buf[0].st_birthtimespec.tv_sec)
        {
LABEL_86:
          ++v129;
        }
        else
        {
          d_namlen = v38->d_namlen;
          if (d_namlen <= 0x3FF)
          {
            v43 = 0;
            while (1)
            {
              v44 = d_name[v43];
              __s[v43] = v44;
              if (!v44)
                break;
              if (++v43 == 1023)
              {
                __s[1023] = 0;
                break;
              }
            }
            v36 = tv_sec;
            goto LABEL_86;
          }
          v126 = buf[0].st_birthtimespec.tv_sec;
          v42 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
              goto LABEL_80;
          }
          else
          {
            v42 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
              goto LABEL_80;
          }
          v142.st_dev = 141558787;
          *(_QWORD *)&v142.st_mode = 1752392040;
          WORD2(v142.st_ino) = 2085;
          *(__darwin_ino64_t *)((char *)&v142.st_ino + 6) = (__darwin_ino64_t)d_name;
          HIWORD(v142.st_gid) = 1024;
          v142.st_rdev = d_namlen;
          *((_WORD *)&v142.st_rdev + 2) = 1024;
          *(dev_t *)((char *)&v142.st_rdev + 6) = 1024;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "State Dump: filename is too long to be put into the buffer, ignoring the current file - file name to be copied: %{sensitive, mask.hash}s, length: %u, buffer length: %u", (uint8_t *)&v142, 0x22u);
LABEL_80:
          v36 = v126;
        }
      }
    }
  }
  closedir(v35);
  bzero(buf, 0x400uLL);
  if (v129 < 5u)
    goto LABEL_121;
  if ((snprintf((char *)buf, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", __s) - 1024) <= 0xFFFFFC00)
  {
    v87 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
        goto LABEL_208;
    }
    else
    {
      v87 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
        goto LABEL_208;
    }
    v104 = strlen(__s);
    v142.st_dev = 134218496;
    *(_QWORD *)&v142.st_mode = 1024;
    WORD2(v142.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v142.st_ino + 6) = 30;
    HIWORD(v142.st_gid) = 2048;
    *(_QWORD *)&v142.st_rdev = v104;
    v105 = "State Dump: snprintf truncates the final string - buffer length: %zu, directory name length: %zu, old file name length: %zu";
    v106 = v87;
    v107 = 32;
    goto LABEL_207;
  }
  if (!remove((const std::__fs::filesystem::path *)buf, v60))
    goto LABEL_121;
  v88 = mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
      goto LABEL_206;
  }
  else
  {
    v88 = mDNSLogCategory_XPC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
    {
LABEL_206:
      v108 = __error();
      v109 = strerror(*v108);
      v142.st_dev = 136446466;
      *(_QWORD *)&v142.st_mode = buf;
      WORD2(v142.st_ino) = 2082;
      *(__darwin_ino64_t *)((char *)&v142.st_ino + 6) = (__darwin_ino64_t)v109;
      v105 = "State Dump: file %{public}s cannot be deleted, reason: %{public}s";
      v106 = v88;
      v107 = 22;
LABEL_207:
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, v105, (uint8_t *)&v142, v107);
    }
  }
LABEL_208:
  v98 = mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0].st_dev) = 0;
      v99 = "remove_state_dump_if_too_many fails";
LABEL_214:
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, v99, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    v98 = mDNSLogCategory_XPC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0].st_dev) = 0;
      v99 = "remove_state_dump_if_too_many fails";
      goto LABEL_214;
    }
  }
LABEL_215:
  v29 = 255;
  uint64 = v131;
LABEL_242:
  v21 = v128;
LABEL_243:
  KQueueUnlock((uint64_t)"State Dump", v22, v23, v24, v25, v26, v27, v28);
  buf[0].st_ino = 0;
  *(_QWORD *)&buf[0].st_dev = 0;
  gettimeofday((timeval *)buf, 0);
  v125 = timediff_ms((uint64_t *)&buf[0].st_dev, &v132.tv_sec);
  if (v29)
  {
    xpc_dictionary_set_string(v15, "ErrorDescription", "State dump fails");
    v32 = 3;
  }
  else
  {
    xpc_dictionary_set_int64(v15, "mDNSResponderDumpTimeUsed", v125);
    if (uint64 != 3)
      xpc_dictionary_set_string(v15, "mDNSResponderDumpFilePath", (const char *)&__str);
    v32 = 0;
  }
  close(v21);
LABEL_56:
  xpc_dictionary_set_uint64(v15, "DaemonReplyStatusToClient", v32);
  xpc_connection_send_message(remote_connection, v15);
  v12 = v15;
LABEL_57:
  xpc_release(v12);
}

uint64_t timediff_ms(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v7;
  int v8;

  v2 = *a1;
  v3 = *a2;
  if (*a1 < *a2)
    return -timediff_ms(a2, a1);
  v4 = *((_DWORD *)a1 + 2);
  v5 = *((_DWORD *)a2 + 2);
  if (v2 == v3 && v4 < v5)
    return -timediff_ms(a2, a1);
  v7 = v2 - v3;
  v8 = v4 + 1000000;
  if (v4 >= v5)
    v8 = *((_DWORD *)a1 + 2);
  return (v8 - v5) / 1000 + 1000 * (v7 - (v4 < v5));
}

void __mdns_trust_checks_init_block_invoke(id a1)
{
  id v1;
  NSObject *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v1 = _mdns_trust_log();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Initializing Launch Services -- PENDING", v6, 2u);
  }

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.dnssd.trust.init", v4);

  dispatch_async(v5, &__block_literal_global_3);
}

id _mdns_trust_log()
{
  if (_mdns_trust_log_s_once != -1)
    dispatch_once(&_mdns_trust_log_s_once, &__block_literal_global_12_7415);
  return (id)_mdns_trust_log_s_log;
}

void __mdns_trust_checks_init_block_invoke_2(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v1 = _mdns_trust_log();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Initializing Launch Services -- START", buf, 2u);
  }

  atomic_store(1u, g_is_initialized);
  v3 = _mdns_trust_log();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Initializing Launch Services -- COMPLETE", v5, 2u);
  }

}

void ___mdns_trust_log_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mdns", "trust");
  v2 = (void *)_mdns_trust_log_s_log;
  _mdns_trust_log_s_log = (uint64_t)v1;

}

id _mdns_trust_checks_bundle_record_for_app(_OWORD *a1)
{
  __int128 v1;
  _OWORD v3[2];
  uint64_t v4;

  v4 = 0;
  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v3, &v4));
}

uint64_t _mdns_trust_checks_app_is_local_network_allowed(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v1 = a1;
  if (objc_opt_class(NEPathController))
  {
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v2 = +[NEPathController copyAggregatePathRules](NEPathController, "copyAggregatePathRules");
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v17;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleIdentifier", (_QWORD)v16));
          if (v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "matchSigningIdentifier"));
            v10 = objc_msgSend(v9, "isEqualToString:", v8);

            if (v10)
            {
              v12 = objc_msgSend(v7, "denyMulticast");
              v13 = objc_msgSend(v7, "multicastPreferenceSet");

              if (v13)
                v14 = 0;
              else
                v14 = 2;
              if (v12)
                v11 = v14;
              else
                v11 = 1;
              goto LABEL_19;
            }
          }

          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v4)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_19:

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __mdns_trust_checks_local_network_access_policy_update_block_invoke(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v3 = _mdns_trust_log();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v5 > 2)
      v6 = "<INVALID STATE>";
    else
      v6 = off_10013F728[v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedShortName"));
    v9 = 136446466;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Local network alert policy status '%{public}s' for (%{public}@).", (uint8_t *)&v9, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __mdns_trust_checks_local_network_access_policy_update_block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t mdns_trust_checks_check(_OWORD *a1, int a2, unsigned __int8 *a3, unsigned __int8 *a4, int a5, char a6, int *a7)
{
  unsigned __int8 v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint8_t *v23;
  uint8_t *v24;
  uint8_t *v25;
  uint8_t *v26;
  uint8_t *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  int is_local_network_allowed;
  int v35;
  uint64_t v36;
  void *v37;
  unsigned __int8 v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  unsigned int v45;
  int v47;
  uint8_t *v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  char v52;
  int v53;
  uint8_t *v54;
  int v55;
  socklen_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  unsigned __int8 v60;
  id v61;
  void *v62;
  id v63;
  NSObject *v64;
  unsigned int v65;
  uint8_t *v66;
  uint8_t *v67;
  int v68;
  char v69;
  uint64_t v70;
  uint8_t v71;
  id v72;
  NSObject *v73;
  id v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  unsigned __int8 *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  NSObject *v85;
  id v86;
  id v87;
  uint64_t v88;
  void *i;
  unsigned __int8 *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  NSObject *v104;
  id v105;
  char *v106;
  unsigned __int8 *v107;
  char *v108;
  void *v109;
  __objc2_prot_list **p_base_prots;
  id v111;
  uint64_t v112;
  NSObject *v113;
  NSObject *v114;
  __objc2_prot_list *v115;
  NSObject *v116;
  uint64_t v117;
  __CFString *v118;
  void *v119;
  __CFString *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  NSObject *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  NSObject *v129;
  NSObject *v130;
  void *v131;
  NSObject *v132;
  void *v133;
  int v134;
  void *v135;
  unsigned __int8 *v136;
  unsigned __int8 *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t v142[128];
  char v143[16];
  _OWORD v144[15];
  uint8_t buf[264];

  v8 = atomic_load(g_is_initialized);
  if ((v8 & 1) != 0)
  {
    v21 = objc_autoreleasePoolPush();
    if (a2 != 2 || (a6 & 1) != 0)
      goto LABEL_14;
    memset(buf, 0, 256);
    if (AppendDNSNameString(buf, a3, v15, v16, v17, v18, v19, v20))
    {
      v22 = buf[0];
      if (buf[0])
      {
        v23 = 0;
        v24 = buf;
        do
        {
          v25 = v24;
          v26 = v23;
          v27 = &v24[v22];
          v28 = v27[1];
          v24 = v27 + 1;
          v22 = v28;
          v23 = v25;
        }
        while (v28);
        if (SameDomainNameBytes(v25, "\x05local"))
          goto LABEL_14;
      }
      else
      {
        v26 = 0;
      }
      if ((a5 == 255 || a5 == 12) && IsLocalDomain(buf))
      {
LABEL_14:
        v29 = _mdns_trust_checks_bundle_record_for_app(a1);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = v30;
        if (!v30)
        {
          v33 = 2;
          is_local_network_allowed = 1;
          v35 = 1;
          goto LABEL_27;
        }
        v32 = v30;
        if (-[NSObject developerType](v32, "developerType") == 1
          || (v137 = a3, -[NSObject developerType](v32, "developerType") == -1)
          && (v36 = objc_opt_class(LSApplicationExtensionRecord),
              (objc_opt_isKindOfClass(v32, v36) & 1) != 0)
          && (v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bundleIdentifier](v32, "bundleIdentifier")),
              v38 = objc_msgSend(v37, "hasPrefix:", CFSTR("com.apple.")),
              v37,
              (v38 & 1) != 0))
        {
          v33 = 2;
          is_local_network_allowed = 1;
          goto LABEL_17;
        }

        v39 = v32;
        v40 = xpc_copy_entitlement_for_token("com.apple.developer.on-demand-install-capable", a1);
        if (v40)
        {
          v41 = (void *)v40;
          v42 = _mdns_trust_log();
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedShortName](v39, "localizedShortName"));
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "com.apple.developer.on-demand-install-capable";
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v44;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Entitlement '%{public}s' disallows request for (%{public}@)", buf, 0x16u);

          }
          v33 = 0;
          v35 = 0;
          is_local_network_allowed = 1;
          v32 = v39;
LABEL_25:

          goto LABEL_26;
        }

        v57 = (void *)xpc_copy_entitlement_for_token("com.apple.developer.media-device-discovery-extension", a1);
        v135 = v21;
        v136 = a4;
        if (v57 == &_xpc_BOOL_true)
        {
          v58 = objc_autoreleasePoolPush();
          if (objc_opt_class(DASession))
          {
            *(_QWORD *)v143 = 0;
            v59 = a1[1];
            *(_OWORD *)buf = *a1;
            *(_OWORD *)&buf[16] = v59;
            v60 = +[DASession processAllowedWithAuditToken:error:](DASession, "processAllowedWithAuditToken:error:", buf, v143);
            v61 = *(id *)v143;
            if (v61)
            {
              v62 = v61;
              v63 = _system_util_log();
              v64 = objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "description"));
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v133;
                _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "DASession processAllowedWithAuditToken err %@", buf, 0xCu);

              }
            }
            objc_autoreleasePoolPop(v58);
            if ((v60 & 1) != 0)
            {

              v33 = 4;
              v21 = v135;
              goto LABEL_102;
            }
          }
          else
          {
            v72 = _system_util_log();
            v73 = objc_claimAutoreleasedReturnValue(v72);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "DASession.class not available", buf, 2u);
            }

            objc_autoreleasePoolPop(v58);
          }
          v74 = _mdns_trust_log();
          v75 = objc_claimAutoreleasedReturnValue(v74);
          v21 = v135;
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Media access not allowed with valid entitlment", buf, 2u);
          }

        }
        if (_os_feature_enabled_impl("mDNSResponder", "bonjour_privacy"))
        {
          v76 = v39;
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "14.0"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject SDKVersion](v76, "SDKVersion"));

          v79 = objc_msgSend(v78, "compare:options:", v77, 64);
          v80 = v136;

          v33 = 0;
          if (v136 && (unint64_t)v79 <= 1)
          {
            v81 = (void *)xpc_copy_entitlement_for_token("com.apple.developer.networking.multicast", a1);

            v132 = v76;
            if (v81 == &_xpc_BOOL_true)
            {
              v134 = 0;
              v85 = 0;
              v33 = 1;
              p_base_prots = &OS_mdns_trust__metaData.base_prots;
              v111 = -[NSObject bundleIdentifier](v76, "bundleIdentifier", &__kCFBooleanTrue);
            }
            else
            {
              v128 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject infoDictionary](v76, "infoDictionary"));
              v82 = objc_msgSend(v128, "objectForKey:ofClass:", CFSTR("NSBonjourServices"), objc_opt_class(NSArray));
              v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
              v130 = v76;
              v84 = v83;
              v138 = 0u;
              v139 = 0u;
              v140 = 0u;
              v141 = 0u;
              v85 = v84;
              v86 = -[NSObject countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
              if (v86)
              {
                v87 = v86;
                v88 = *(_QWORD *)v139;
                while (2)
                {
                  for (i = 0; i != v87; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v139 != v88)
                      objc_enumerationMutation(v85);
                    v90 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)i)), "UTF8String");
                    *(_OWORD *)v143 = 0u;
                    memset(v144, 0, sizeof(v144));
                    memset(buf, 0, 256);
                    if (AppendDNSNameString(buf, v136, v91, v92, v93, v94, v95, v96))
                    {
                      v143[0] = 0;
                      if (AppendDNSNameString(v143, v90, v97, v98, v99, v100, v101, v102))
                      {
                        if (SameDomainNameBytes(buf, v143))
                        {
                          v134 = 0;
                          v104 = v85;
                          goto LABEL_110;
                        }
                      }
                    }
                  }
                  v87 = -[NSObject countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
                  if (v87)
                    continue;
                  break;
                }
              }

              v103 = _mdns_trust_log();
              v104 = objc_claimAutoreleasedReturnValue(v103);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                v126 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedShortName](v130, "localizedShortName"));
                *(_DWORD *)buf = 136446466;
                v80 = v136;
                *(_QWORD *)&buf[4] = v136;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v126;
                _os_log_error_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "App Info.plist(NSBonjourServices) does not allow '%{public}s' for (%{public}@)", buf, 0x16u);

                v134 = 1;
              }
              else
              {
                v134 = 1;
LABEL_110:
                v80 = v136;
              }
              p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);

              v33 = 0;
              v111 = -[NSObject bundleIdentifier](v132, "bundleIdentifier", &__kCFBooleanFalse);
            }
            v112 = objc_claimAutoreleasedReturnValue(v111);
            v113 = v85;
            v114 = &__NSArray0__struct;
            v129 = v113;
            if (v113)
              v114 = v113;
            v115 = p_base_prots[214];
            v116 = v114;
            v117 = objc_claimAutoreleasedReturnValue(-[__objc2_prot_list stringWithUTF8String:](v115, "stringWithUTF8String:", v80));
            v118 = CFSTR("<empty>");
            v131 = (void *)v112;
            if (v112)
              v118 = (__CFString *)v112;
            v119 = (void *)v117;
            v120 = v118;
            v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            *(_QWORD *)v143 = CFSTR("bundleID");
            *(_QWORD *)&v143[8] = CFSTR("entitlement");
            *(_QWORD *)buf = v120;
            *(_QWORD *)&buf[8] = v127;
            v122 = &__kCFBooleanFalse;
            if (!v134)
              v122 = &__kCFBooleanTrue;
            *(_QWORD *)&v144[0] = CFSTR("allowed");
            *((_QWORD *)&v144[0] + 1) = CFSTR("services");
            *(_QWORD *)&buf[16] = v122;
            *(_QWORD *)&buf[24] = v116;
            *(_QWORD *)&v144[1] = CFSTR("service");
            *(_QWORD *)&buf[32] = v119;
            v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v143, 5));

            _flatten_metric_dictionary(v123, v121, &stru_10013FAA0);
            v124 = _mdns_trust_log();
            v125 = objc_claimAutoreleasedReturnValue(v124);
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v142 = 138412290;
              *(_QWORD *)&v142[4] = v121;
              _os_log_debug_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEBUG, "_mdns_trust_post_analytic flattenedDictionary %@\n", v142, 0xCu);
            }

            AnalyticsSendEvent(CFSTR("com.apple.network.localnetwork.check"), v121);
            if ((v134 & 1) != 0)
            {
              v35 = 0;
              is_local_network_allowed = 1;
              v21 = v135;
              goto LABEL_27;
            }
            v21 = v135;
LABEL_103:
            v32 = v39;
            is_local_network_allowed = _mdns_trust_checks_app_is_local_network_allowed(v32);
            if (is_local_network_allowed != 1)
            {
              v105 = _mdns_trust_log();
              v39 = objc_claimAutoreleasedReturnValue(v105);
              v35 = 1;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v106 = off_10013F710[a2];
                if (v136)
                  v107 = v136;
                else
                  v107 = v137;
                v108 = off_10013F728[is_local_network_allowed];
                v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedShortName](v32, "localizedShortName"));
                *(_DWORD *)buf = 136446979;
                *(_QWORD *)&buf[4] = v106;
                *(_WORD *)&buf[12] = 2081;
                *(_QWORD *)&buf[14] = v107;
                *(_WORD *)&buf[22] = 2082;
                *(_QWORD *)&buf[24] = v108;
                v21 = v135;
                *(_WORD *)&buf[32] = 2114;
                *(_QWORD *)&buf[34] = v109;
                v35 = 1;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Local network access to %{public}s(%{private}s) policy '%{public}s' for (%{public}@).", buf, 0x2Au);

              }
              goto LABEL_25;
            }
LABEL_17:
            v35 = 1;
LABEL_26:

LABEL_27:
            goto LABEL_28;
          }
        }
        else
        {
          v33 = 0;
        }
LABEL_102:

        goto LABEL_103;
      }
      if (v26 && (a5 == 255 || a5 == 12))
      {
        if (SameDomainNameBytes(v26, "\ain-addr\x04arpa"))
        {
          v47 = 0;
          memset(v143, 0, sizeof(v143));
          v48 = buf;
          v49 = 1;
          *(_DWORD *)v142 = 0;
          LODWORD(v138) = 0;
LABEL_40:
          v142[4 - v49] = 0;
          v50 = *v48;
          if ((v50 - 4) >= 0xFFFFFFFD)
          {
            LOBYTE(v51) = 0;
            v52 = 0;
            ++v48;
            while (1)
            {
              v53 = *v48;
              if ((v53 - 58) < 0xFFFFFFF6)
                break;
              v51 = v53 + 10 * v51 - 48;
              if (v51 > 0xFF)
                break;
              v142[4 - v49] = v51;
              if ((v52 & 1) == 0 && ++v47 > 4)
                break;
              ++v48;
              v52 = 1;
              if (!--v50)
              {
                if (v49 != v47)
                  break;
                if (++v49 != 5)
                  goto LABEL_40;
                if (v47 == 4)
                {
                  LODWORD(v138) = *(_DWORD *)v142;
                  if (SameDomainNameBytes(v48, "\ain-addr\x04arpa"))
                  {
                    v54 = (uint8_t *)&v138;
                    v55 = 2;
                    v56 = 16;
                    goto LABEL_74;
                  }
                }
                break;
              }
            }
          }
        }
        else if (SameDomainNameBytes(v26, "\x03ip6\x04arpa"))
        {
          v65 = 0;
          *(_OWORD *)v143 = 0u;
          memset(v144, 0, 30);
          *(_OWORD *)v142 = 0uLL;
          v66 = buf;
          while (1)
          {
            v67 = v66;
            if (*v66 != 1)
              break;
            v68 = v66[1];
            if ((v68 - 48) >= 0xA)
            {
              if ((v68 - 97) >= 6)
              {
                if ((v68 - 65) > 5)
                  break;
                v69 = -55;
              }
              else
              {
                v69 = -87;
              }
            }
            else
            {
              v69 = -48;
            }
            v70 = 15 - (v65 >> 1);
            v71 = v69 + v68;
            if ((v65 & 1) != 0)
              v71 = v142[v70] | (16 * v71);
            v142[v70] = v71;
            ++v65;
            v66 = v67 + 2;
            if (v65 == 32)
            {
              if (SameDomainNameBytes(v67 + 2, "\x03ip6\x04arpa"))
              {
                v54 = v142;
                v55 = 30;
                v56 = 46;
LABEL_74:
                inet_ntop(v55, v54, v143, v56);
                if ((_mdns_trust_checks_is_local_address(v143) & 1) != 0)
                  goto LABEL_14;
              }
              break;
            }
          }
        }
      }
    }
    v33 = 0;
    is_local_network_allowed = 1;
    v35 = 1;
LABEL_28:
    objc_autoreleasePoolPop(v21);
    if (!a7)
      goto LABEL_30;
    goto LABEL_29;
  }
  v33 = 0;
  is_local_network_allowed = 1;
  v35 = 1;
  if (a7)
LABEL_29:
    *a7 = v33;
LABEL_30:
  v45 = 2 * (is_local_network_allowed == 2);
  if (is_local_network_allowed == 1)
    v45 = 1;
  if (v35)
    return v45;
  else
    return 3;
}

uint64_t _mdns_trust_checks_is_local_address(const char *a1)
{
  nw_endpoint_t host;
  void *evaluator_for_endpoint;
  void *v3;
  uint64_t is_direct;

  host = nw_endpoint_create_host(a1, "0");
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(host, 0);
  v3 = (void *)nw_path_evaluator_copy_path();
  is_direct = nw_path_is_direct();

  return is_direct;
}

void _flatten_metric_dictionary(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  id obj;
  id obja;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v5 && v6)
  {
    if (v7)
    {
      v9 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
      {
        v41 = v5;
        v10 = v5;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v49 != v13)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
              v17 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v15, v17) & 1) == 0)
              {
                v18 = _mdns_trust_log();
                v19 = objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v54 = v15;
                  v55 = 2112;
                  v56 = v8;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Bad key %@ at path %@\n", buf, 0x16u);
                }

              }
              v20 = objc_msgSend(v8, "length");
              v21 = objc_alloc((Class)NSString);
              if (v20)
                v22 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@_%@"), v8, v15);
              else
                v22 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@"), v15, v40);
              v23 = v22;
              _flatten_metric_dictionary(v16, v6, v22);

            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          }
          while (v12);
        }

LABEL_35:
        v5 = v41;
        goto LABEL_39;
      }
      v26 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v5, v26) & 1) != 0)
      {
        v41 = v5;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        obja = v5;
        v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v27)
        {
          v28 = v27;
          v29 = 0;
          v30 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v28; j = (char *)j + 1)
            {
              if (*(_QWORD *)v45 != v30)
                objc_enumerationMutation(obja);
              v32 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
              v33 = objc_msgSend(v8, "length");
              v34 = objc_alloc((Class)NSString);
              if (v33)
                v35 = objc_msgSend(v34, "initWithFormat:", CFSTR("%@_%zu"), v8, (char *)j + v29);
              else
                v35 = objc_msgSend(v34, "initWithFormat:", CFSTR("%zu"), (char *)j + v29, v40);
              v36 = v35;
              _flatten_metric_dictionary(v32, v6, v35);

            }
            v29 += (uint64_t)j;
            v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v28);
        }

        goto LABEL_35;
      }
      v37 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v5, v37) & 1) != 0
        || (v38 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v38) & 1) != 0))
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);
        goto LABEL_39;
      }
      v39 = _mdns_trust_log();
      v25 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v54 = v5;
        v55 = 2112;
        v56 = v8;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Bad value %@ at path %@, ignoring\n", buf, 0x16u);
      }
    }
    else
    {
      v24 = _mdns_trust_log();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Cannot have nil path when flattening, skipping object: %@\n", buf, 0xCu);
      }
    }

  }
LABEL_39:

}

void *_mdns_dso_server_endpoint_copy_description(_QWORD *a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  const char *description;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
    v6 = 0;
  }
  else
  {
    description = (const char *)nw_endpoint_get_description(a1[3]);
    mdns_string_builder_append_formatted(v5, "[endpoint: %s", description);
    mdns_string_builder_append_formatted(v5, ", abort count: %zu", a1[4]);
    v8 = a1[5];
    if (v8)
    {
      v9 = v8 - mach_continuous_time();
      if (v9 >= 1)
      {
        v10 = mdns_ticks_to_milliseconds(v9);
        mdns_string_builder_append_formatted(v5, ", delayed retry in %llums", v10);
      }
    }
    mdns_string_builder_append_formatted(v5, "]");
    v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

void _mdns_dso_server_endpoint_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    nw_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

const char *_mdns_dso_server_endpoint_manager_copy_description()
{
  return "<This is a DSO server endpoint manager object>";
}

void _mdns_dso_server_endpoint_manager_finalize(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t _mdns_dso_server_endpoint_is_usable_now(uint64_t a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) >= 2uLL)
  {
    if (v6)
      goto LABEL_7;
    v7 = mach_continuous_time();
    if (mdns_mach_ticks_per_second_s_once != -1)
    {
      v12 = v7;
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3428);
      v7 = v12;
    }
    v6 = v7 + 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
    *(_QWORD *)(a1 + 40) = v6;
  }
  if (!v6)
  {
    result = 1;
    v9 = -1;
    if (a2)
      goto LABEL_16;
    goto LABEL_17;
  }
LABEL_7:
  v8 = mach_continuous_time() - *(_QWORD *)(a1 + 40);
  if (v8 >= 0)
  {
    v9 = 0;
    LODWORD(v6) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    result = 1;
    if (!a2)
      goto LABEL_17;
LABEL_16:
    *a2 = v6;
    goto LABEL_17;
  }
  v11 = mdns_ticks_to_milliseconds(-v8);
  result = 0;
  v9 = -1;
  if (v11 < 0xFFFFFFFF)
    v9 = v11;
  if (HIDWORD(v11))
    LODWORD(v6) = -6737;
  else
    LODWORD(v6) = -6760;
  if (a2)
    goto LABEL_16;
LABEL_17:
  if (a3)
    *a3 = v9;
  return result;
}

void ref_count_obj_release(_QWORD *a1)
{
  _QWORD *i;
  void (*v4)(_QWORD *);

  if ((*(_DWORD *)a1)-- == 1)
  {
    for (i = (_QWORD *)a1[1]; i; i = (_QWORD *)*i)
    {
      v4 = (void (*)(_QWORD *))i[4];
      if (v4)
        v4(a1);
    }
    free(a1);
  }
}

uint64_t ref_count_obj_compare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);

  if (a1 == a2)
    return 0;
  v6 = *(_QWORD **)(a1 + 8);
  if (v6 == *(_QWORD **)(a2 + 8))
  {
    while (v6)
    {
      v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v6[3];
      if (v8)
      {
        result = v8(a1, a2, a3);
        if ((_DWORD)result != 3)
          return result;
      }
      v6 = (_QWORD *)*v6;
    }
    return 3;
  }
  else if ((_DWORD)a3)
  {
    return 2;
  }
  else
  {
    return 3;
  }
}

uint64_t _cache_item_get_tracker_state(uint64_t a1)
{
  uint64_t v2;
  uint64_t AppInfo;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  BOOL v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  int DispositionRedactLogs;
  unsigned __int16 v18;
  int v20;
  uint64_t v21;
  __int128 v22;
  pid_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  audit_token_t atoken;

  if (*(_QWORD *)(a1 + 16))
  {
    DispositionRedactLogs = *(_DWORD *)(a1 + 32);
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 8);
    AppInfo = NEHelperTrackerGetAppInfo();
    if (!AppInfo)
    {
      v18 = 0;
      *(_QWORD *)(a1 + 16) = 0;
      return v18;
    }
    v9 = AppInfo;
    memset(v25, 0, sizeof(v25));
    v10 = *(_QWORD *)(v2 + 120);
    v11 = *(_QWORD *)(v2 + 128);
    v12 = (_OWORD *)(v10 + 24);
    v13 = v10 == 0;
    v14 = v25;
    if (v13)
      v12 = v25;
    if (v11)
      v14 = (_OWORD *)(v11 + 24);
    v15 = v14[1];
    *(_OWORD *)atoken.val = *v14;
    *(_OWORD *)&atoken.val[4] = v15;
    v16 = v12[1];
    v24[0] = *v12;
    v24[1] = v16;
    ((void (*)(uint64_t, audit_token_t *, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))NEHelperTrackerAppInfoSetAuditToken)(AppInfo, &atoken, v24, v4, v5, v6, v7, v8);
    if (!*(_QWORD *)(v2 + 128))
    {
      v20 = *(_DWORD *)(v2 + 244);
      if (v20)
      {
        v21 = *(_QWORD *)(v2 + 120);
        if (v21)
        {
          v22 = *(_OWORD *)(v21 + 40);
          *(_OWORD *)atoken.val = *(_OWORD *)(v21 + 24);
          *(_OWORD *)&atoken.val[4] = v22;
          v23 = audit_token_to_pid(&atoken);
          v20 = *(_DWORD *)(v2 + 244);
        }
        else
        {
          v23 = 0;
        }
        if (v23 != v20)
          NEHelperTrackerAppInfoSetPID(v9);
      }
      else
      {
        if (_create_tracker_app_info_s_once != -1)
          dispatch_once(&_create_tracker_app_info_s_once, &__block_literal_global_7525);
        *(_OWORD *)atoken.val = *(_OWORD *)(v2 + 656);
        NEHelperTrackerAppInfoSetUUID(v9, &atoken, &_create_tracker_app_info_s_null_uuid);
      }
    }
    if (*(_BYTE *)(v2 + 653))
      NEHelperTrackerAppInfoSetIsBrowser(v9);
    *(_QWORD *)(a1 + 16) = v9;
    DispositionRedactLogs = NEHelperTrackerGetDispositionRedactLogs(v9, *(_QWORD *)(a1 + 40), a1 + 24, 0, gSensitiveLoggingEnabled);
    *(_DWORD *)(a1 + 32) = DispositionRedactLogs;
  }
  if (DispositionRedactLogs)
    return 2;
  else
    return 1;
}

void ___create_tracker_app_info_block_invoke(id a1)
{
  uuid_clear(_create_tracker_app_info_s_null_uuid);
}

uint64_t resolved_cache_get_tracker_state(uint64_t a1, _QWORD *a2, _QWORD *a3, BOOL *a4, _BYTE *a5)
{
  uint64_t *v9;
  uint64_t result;

  if (!&_NEHelperTrackerGetAppInfo)
    return 0;
  v9 = &s_head_0;
  do
  {
    v9 = (uint64_t *)*v9;
    if (!v9)
      return 0;
  }
  while (v9[1] != a1);
  result = _cache_item_get_tracker_state((uint64_t)v9);
  if ((_DWORD)result == 2)
  {
    if (a4)
      *a4 = *((_DWORD *)v9 + 8) == 3;
    if (a2)
      *a2 = NEHelperTrackerContextGetDomain(v9[3]);
    if (a3)
      *a3 = NEHelperTrackerContextGetDomainOwner(v9[3]);
    if (a5)
      *a5 = NEHelperTrackerContextCanBlockRequest(v9[3]);
    return 2;
  }
  return result;
}

void _cache_item_report(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  _OWORD *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  _BOOL4 v9;
  unsigned int v10;
  _OWORD *v11;
  int v12;
  const unsigned __int8 *v13;
  __int128 v14;
  BOOL v15;
  _OWORD v16[2];
  audit_token_t atoken;

  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 48)))
  {
    if (_os_feature_enabled_impl("symptomsd", "networking_transparency"))
    {
      v2 = *(_QWORD *)(a1 + 8);
      memset(v16, 0, sizeof(v16));
      v3 = *(_QWORD *)(v2 + 120);
      v4 = *(_QWORD *)(v2 + 128);
      if (v3)
        v5 = (_OWORD *)(v3 + 24);
      else
        v5 = v16;
      if (v4)
      {
        v6 = (_OWORD *)(v4 + 24);
        v7 = *(const __CFArray **)(a1 + 40);
        v8 = *(const __CFArray **)(a1 + 48);
        v9 = *(_BYTE *)(v2 + 653) != 0;
        v10 = *(_DWORD *)(v2 + 252);
        v11 = v5;
        v12 = 0;
        v13 = 0;
      }
      else
      {
        v12 = *(_DWORD *)(v2 + 244);
        if (v12)
        {
          if (v3)
          {
            v14 = *(_OWORD *)(v3 + 40);
            *(_OWORD *)atoken.val = *(_OWORD *)(v3 + 24);
            *(_OWORD *)&atoken.val[4] = v14;
            LODWORD(v3) = audit_token_to_pid(&atoken);
            v12 = *(_DWORD *)(v2 + 244);
          }
          v7 = *(const __CFArray **)(a1 + 40);
          v8 = *(const __CFArray **)(a1 + 48);
          v10 = *(_DWORD *)(v2 + 252);
          v15 = (_DWORD)v3 == v12 || v12 == 0;
          v9 = *(unsigned __int8 *)(v2 + 653) != 0;
          v11 = v5;
          if (v15)
            v12 = 0;
          v13 = 0;
        }
        else
        {
          v7 = *(const __CFArray **)(a1 + 40);
          v8 = *(const __CFArray **)(a1 + 48);
          v9 = *(_BYTE *)(v2 + 653) != 0;
          v10 = *(_DWORD *)(v2 + 252);
          v13 = (const unsigned __int8 *)(v2 + 656);
          v11 = v5;
        }
        v6 = 0;
      }
      _mdns_symptoms_report_resolved(v7, v8, v11, v9, v10, v12, v13, v6);
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 48));
  }
}

void resolved_cache_delete(uint64_t a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *i;
  const void *v5;
  const void *v6;

  if (&_NEHelperTrackerGetAppInfo || _os_feature_enabled_impl("symptomsd", "networking_transparency"))
  {
    v2 = &s_head_0;
    v3 = &s_head_0;
    while (1)
    {
      v3 = (uint64_t *)*v3;
      if (!v3)
        break;
      if (v3[1] == a1)
      {
        _cache_item_report((uint64_t)v3);
        for (i = (uint64_t *)s_head_0; i != v3; i = (uint64_t *)*i)
          v2 = i;
        *v2 = *v3;
        v5 = (const void *)v3[5];
        if (v5)
        {
          CFRelease(v5);
          v3[5] = 0;
        }
        v6 = (const void *)v3[6];
        if (v6)
        {
          CFRelease(v6);
          v3[6] = 0;
        }
        if (v3[2])
          NEHelperTrackerFreeAppInfo();
        free(v3);
        return;
      }
    }
  }
}

id objc_msgSend_DNSHeuristicsFailureStateInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DNSHeuristicsFailureStateInfo");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SDKVersion");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__adoptEffectiveConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_adoptEffectiveConfiguration:");
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDispatchData");
}

id objc_msgSend__disableATS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disableATS");
}

id objc_msgSend__disableAppSSO(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disableAppSSO");
}

id objc_msgSend__effectiveConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_effectiveConfiguration");
}

id objc_msgSend__initWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithConfiguration:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPolicy:");
}

id objc_msgSend_addQhash_forInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addQhash:forInterface:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_allInterfaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allInterfaces");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_apply(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apply");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertPresence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertPresence");
}

id objc_msgSend_assertPresenceWithPresencePayload_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertPresenceWithPresencePayload:completion:");
}

id objc_msgSend_authRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authRecords");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_clearNetworkAsFiltered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearNetworkAsFiltered:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copyAggregatePathRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyAggregatePathRules");
}

id objc_msgSend_copyEmptyHeuristicState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyEmptyHeuristicState");
}

id objc_msgSend_copyNetworkSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyNetworkSettings:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countersExceedThreshold_burstCounter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countersExceedThreshold:burstCounter:");
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentKnownNetworkProfile");
}

id objc_msgSend_currentTimeMs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTimeMs");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_denyMulticast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyMulticast");
}

id objc_msgSend_describeAddr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "describeAddr");
}

id objc_msgSend_describeQHashes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "describeQHashes");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "developerType");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_fetchStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchStatusWithCompletionHandler:");
}

id objc_msgSend_filterObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterObjectsUsingBlock:");
}

id objc_msgSend_flowRemoteAddressEmpty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flowRemoteAddressEmpty");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getNetworkFilteredFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNetworkFilteredFlag:");
}

id objc_msgSend_getPartialIPsWithAuditToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPartialIPsWithAuditToken:error:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_indexOfObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initFromPrivilegedProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFromPrivilegedProcess");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithOrder_result_conditions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOrder:result:conditions:");
}

id objc_msgSend_initWithPresenceIdentifier_isPersonal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPresenceIdentifier:isPersonal:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceName");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_isBlueAtlasNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBlueAtlasNetwork");
}

id objc_msgSend_isCarPlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCarPlay");
}

id objc_msgSend_isDNSHeuristicsFilteredNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDNSHeuristicsFilteredNetwork");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSelfDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSelfDevice");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadAllFromPreferencesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAllFromPreferencesWithCompletionHandler:");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedShortName");
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mask");
}

id objc_msgSend_matchSigningIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchSigningIdentifier");
}

id objc_msgSend_multicastPreferenceSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multicastPreferenceSet");
}

id objc_msgSend_networkingAllowedWithUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkingAllowedWithUUID:error:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_payloadDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDictionary");
}

id objc_msgSend_presence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presence");
}

id objc_msgSend_presencePayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presencePayload");
}

id objc_msgSend_presentDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentDevices");
}

id objc_msgSend_processAllowedWithAuditToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAllowedWithAuditToken:error:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_removeAllPolicies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllPolicies");
}

id objc_msgSend_removeNetworkAgentUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeNetworkAgentUUID:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeQhash_forInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeQhash:forInterface:");
}

id objc_msgSend_reportResolutionFailure_isTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportResolutionFailure:isTimeout:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retainTransientSubscriptionAssertionWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retainTransientSubscriptionAssertionWithCompletion:");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setBoundInterfaceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoundInterfaceIdentifier:");
}

id objc_msgSend_setDNSHeuristicsFailureStateInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDNSHeuristicsFailureStateInfo:");
}

id objc_msgSend_setDNSHeuristicsFilteredNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDNSHeuristicsFilteredNetwork:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setFormatterBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatterBehavior:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setNetworkAsFiltered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkAsFiltered:");
}

id objc_msgSend_setNetworkAsFiltered_filtered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkAsFiltered:filtered:");
}

id objc_msgSend_setNetworkSettings_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkSettings:value:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLCache:");
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLCredentialStorage:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_allowsTCPFastOpen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_allowsTCPFastOpen:");
}

id objc_msgSend_set_allowsTLSSessionTickets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_allowsTLSSessionTickets:");
}

id objc_msgSend_set_disableAPWakeOnIdleConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_disableAPWakeOnIdleConnections:");
}

id objc_msgSend_set_hostOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_hostOverride:");
}

id objc_msgSend_set_nw_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_nw_activity:");
}

id objc_msgSend_set_socketStreamProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_socketStreamProperties:");
}

id objc_msgSend_set_suppressedAutoAddedHTTPHeaders_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_suppressedAutoAddedHTTPHeaders:");
}

id objc_msgSend_sharedManagerForAllUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManagerForAllUsers");
}

id objc_msgSend_shortSSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortSSID");
}

id objc_msgSend_showLocalNetworkAlertForApp_withCompletionQueue_query_hasEntitlement_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showLocalNetworkAlertForApp:withCompletionQueue:query:hasEntitlement:handler:");
}

id objc_msgSend_startMonitoringEventType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringEventType:error:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopMonitoringEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringEventType:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateHeuristicState_isTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHeuristicState:isTimeout:");
}

id objc_msgSend_updateKnownNetworkProfile_properties_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateKnownNetworkProfile:properties:error:");
}

id objc_msgSend_updatePresenseData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePresenseData");
}
