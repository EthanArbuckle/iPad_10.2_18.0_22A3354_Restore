uint64_t OSLogCopyFormattedString(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc(MEMORY[0x24BDD1458]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("liblog_SystemConfiguration: Not yet supported os_log formatting type: %s"), a1);
  v4 = objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

const __CFString *OSStateCreateStringWithData(char *__s1, uint64_t a2, unsigned int *a3)
{
  uint64_t v6;
  char i;
  char v8;

  v6 = 0;
  for (i = 1; ; i = 0)
  {
    v8 = i;
    if (!strcmp(__s1, (&OSStateCreateStringWithData_formatters)[2 * v6]))
      break;
    v6 = 1;
    if ((v8 & 1) == 0)
      return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("liblog_SystemConfiguration: Not yet supported os_state formatting type: %s"), __s1);
  }
  return ((const __CFString *(*)(uint64_t, unsigned int *))(&OSStateCreateStringWithData_formatters)[2 * v6 + 1])(a2, a3);
}

const __CFString *_SC_OSStateCopyFormattedString_dnsinfo(uint64_t a1, unsigned int *a2)
{
  __CFString *v2;
  size_t v5;
  size_t v6;
  NSObject *v7;
  os_log_type_t v8;
  os_log_type_t v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  int *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  _QWORD *v52;
  int v53;
  int v54;
  int v55;
  unsigned int *v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
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
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("No DNS configuration");
  if (!(_DWORD)a1 || !a2)
    return v2;
  if (a1 <= 0x37)
    return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("DNS configuration: size error (%u < %zu)"), a1, 56);
  v5 = a1;
  if (bswap32(a2[12]) + 56 != a1)
  {
    _SC_LOG_DEFAULT();
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      goto LABEL_17;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    os_log_type_enabled(v7, v9);
    v10 = (__int128 *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v10 == &v70)
      goto LABEL_17;
    v11 = v10;
    goto LABEL_16;
  }
  v6 = bswap32(a2[13]);
  if (0x100000 - (unint64_t)a1 < v6)
  {
    _SC_LOG_DEFAULT();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      goto LABEL_17;
    goto LABEL_14;
  }
  if (v6 + a1 > 0x100000)
  {
    _SC_LOG_DEFAULT();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      goto LABEL_17;
LABEL_14:
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    os_log_type_enabled(v7, v8);
    v12 = (__int128 *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v12 != &v70)
    {
      v11 = v12;
LABEL_16:
      free(v11);
    }
LABEL_17:

    return CFSTR("DNS configuration: data error");
  }
  v13 = (int *)malloc_type_malloc(v6 + a1, 0x158E9C56uLL);
  memcpy(v13, a2, v5);
  bzero((char *)v13 + v5, v6);
  if (!v13)
    return CFSTR("DNS configuration: data error");
  v15 = v13[12];
  v16 = bswap32(v13[13]);
  v17 = bswap32(*v13);
  *v13 = v17;
  if (v16 < 8 * v17)
    goto LABEL_101;
  v18 = bswap32(v15);
  v19 = 8 * v17;
  v20 = 8 * v17 ? (uint64_t)v13 + v18 + 56 : 0;
  v21 = v16 - v19;
  *(_QWORD *)(v13 + 1) = v20;
  v22 = bswap32(v13[3]);
  v13[3] = v22;
  if (v21 < 8 * v22
    || ((v23 = 8 * v22, v24 = (uint64_t)v13 + v18 + v19 + 56, v23) ? (v25 = v24) : (v25 = 0),
        v26 = v21 - v23,
        *((_QWORD *)v13 + 2) = v25,
        v27 = bswap32(v13[8]),
        v13[8] = v27,
        v26 < 8 * v27))
  {
LABEL_101:
    free(v13);
    return CFSTR("DNS configuration: expansion error");
  }
  v28 = 8 * v27;
  v29 = v24 + v23;
  if (8 * v27)
    v30 = v24 + v23;
  else
    v30 = 0;
  *(_QWORD *)(v13 + 9) = v30;
  if (v18 < 8)
  {
    v33 = 0;
    v32 = 0;
    v31 = 0;
    goto LABEL_82;
  }
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = v13 + 14;
  v35 = v26 - v28;
  v14 = v29 + v28;
  do
  {
    v36 = bswap32(v34[1]);
    v37 = bswap32(*v34);
    if (v37 - 1 > 2)
      goto LABEL_79;
    if (v36 - 8 < 0x64)
      goto LABEL_101;
    *((_QWORD *)v34 + 1) = 0;
    v38 = bswap32(v34[4]);
    v34[4] = v38;
    if (v35 < 8 * v38)
      goto LABEL_101;
    v39 = 8 * v38;
    v40 = 8 * v38 ? v14 : 0;
    v41 = v35 - v39;
    *(_QWORD *)(v34 + 5) = v40;
    *((_WORD *)v34 + 14) = bswap32(*((unsigned __int16 *)v34 + 14)) >> 16;
    v42 = bswap32(v34[8]);
    v34[8] = v42;
    if (v41 < 8 * v42)
      goto LABEL_101;
    v43 = 8 * v42;
    v44 = v14 + v39;
    v45 = 8 * v42 ? v44 : 0;
    v46 = v41 - v43;
    *(_QWORD *)(v34 + 9) = v45;
    v47 = bswap32(v34[11]);
    v34[11] = v47;
    if (v46 < 8 * v47)
      goto LABEL_101;
    v48 = 8 * v47;
    v49 = v44 + v43;
    v50 = 8 * v47 ? v49 : 0;
    *((_QWORD *)v34 + 6) = v50;
    *((_QWORD *)v34 + 7) = 0;
    *((int8x16_t *)v34 + 4) = vrev32q_s8(*((int8x16_t *)v34 + 4));
    *((int8x8_t *)v34 + 10) = vrev32_s8(*(int8x8_t *)(v34 + 20));
    v51 = v36 - 108;
    if (v36 - 108 != bswap32(v34[26]))
      goto LABEL_101;
    v52 = v34 + 2;
    if (v51 < 8)
    {
      v55 = 0;
      v54 = 0;
      v53 = 0;
    }
    else
    {
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = (unsigned int *)(v34 + 27);
      do
      {
        v57 = v56[1];
        switch(bswap32(*v56))
        {
          case 0xAu:
            *v52 = v56 + 2;
            break;
          case 0xBu:
            v58 = *(_QWORD *)(v34 + 5);
            if (!v58)
              goto LABEL_101;
            *(_QWORD *)(v58 + 8 * v55++) = v56 + 2;
            break;
          case 0xCu:
            v59 = *(_QWORD *)(v34 + 9);
            if (!v59)
              goto LABEL_101;
            *(_QWORD *)(v59 + 8 * v54++) = v56 + 2;
            break;
          case 0xDu:
            v60 = *((_QWORD *)v34 + 6);
            if (!v60)
              goto LABEL_101;
            *(_QWORD *)(v60 + 8 * v53++) = v56 + 2;
            break;
          case 0xEu:
            *((_QWORD *)v34 + 7) = v56 + 2;
            break;
          case 0xFu:
            *((_QWORD *)v34 + 11) = v56 + 2;
            break;
          case 0x10u:
            *((_QWORD *)v34 + 12) = v56 + 2;
            break;
          default:
            break;
        }
        v61 = bswap32(v57);
        v56 = (unsigned int *)((char *)v56 + v61);
        v51 -= v61;
      }
      while (v51 > 7);
    }
    if (v55 != v38 || v54 != v42 || v53 != v47)
      goto LABEL_101;
    v14 = v49 + v48;
    v35 = v46 - v48;
    switch(v37)
    {
      case 3u:
        v62 = *(_QWORD *)(v13 + 9);
        if (!v62)
          goto LABEL_101;
        v63 = v31++;
        break;
      case 2u:
        v62 = *((_QWORD *)v13 + 2);
        if (!v62)
          goto LABEL_101;
        v63 = v32++;
        break;
      case 1u:
        v62 = *(_QWORD *)(v13 + 1);
        if (!v62)
          goto LABEL_101;
        v63 = v33++;
        break;
      default:
        goto LABEL_79;
    }
    *(_QWORD *)(v62 + 8 * v63) = v52;
LABEL_79:
    v34 = (int *)((char *)v34 + v36);
    v18 -= v36;
  }
  while (v18 > 7);
  v17 = *v13;
LABEL_82:
  if (v33 != v17 || v32 != v13[3] || v31 != v13[8])
    goto LABEL_101;
  objc_msgSend(MEMORY[0x24BDD16A8], "string", v14);
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%s\n"), "DNS configuration");
  if (*v13 >= 1)
  {
    v64 = 0;
    do
    {
      v65 = *(_QWORD *)(*(_QWORD *)(v13 + 1) + 8 * v64++);
      _dns_resolver_log(v13[11], v65, v64, v2);
    }
    while (v64 < *v13);
  }
  if (v13[3] >= 1)
  {
    if (*((_QWORD *)v13 + 2))
    {
      -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%s\n"), "");
      -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%s\n"), "DNS configuration (for scoped queries)");
      if (v13[3] >= 1)
      {
        v66 = 0;
        do
        {
          v67 = *(_QWORD *)(*((_QWORD *)v13 + 2) + 8 * v66++);
          _dns_resolver_log(v13[11], v67, v66, v2);
        }
        while (v66 < v13[3]);
      }
    }
  }
  if (v13[8] >= 1)
  {
    if (*(_QWORD *)(v13 + 9))
    {
      -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%s\n"), "");
      -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%s\n"), "DNS configuration (for service-specific queries)");
      if (v13[8] >= 1)
      {
        v68 = 0;
        do
        {
          v69 = *(_QWORD *)(*(_QWORD *)(v13 + 9) + 8 * v68++);
          _dns_resolver_log(v13[11], v69, v68, v2);
        }
        while (v68 < v13[8]);
      }
    }
  }

  if (!-[__CFString length](v2, "length"))
    -[__CFString appendString:](v2, "appendString:", CFSTR("DNS configuration: not available"));
  free(v13);
  return v2;
}

uint64_t _SC_OSStateCopyFormattedString_nwi(uint64_t a1, unsigned int *a2)
{
  __CFString *v2;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = CFSTR("No network information");
  if (!(_DWORD)a1 || !a2)
    return (uint64_t)v2;
  if (a1 <= 0x97)
    return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: size error (%u < %zu)"), a1, 56, v20, v21);
  if (*a2 != 538379777)
    return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: version error (%u != %u)"), *a2, 538379777, v20, v21);
  v5 = a2[1];
  v6 = v5;
  v7 = 2 * v5;
  if (4 * v5 + 112 * (2 * v5) + 40 != a1)
    return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: size error (%u != %zu)"), a1, 4 * a2[1] + 224 * a2[1] + 40, v20, v21);
  v8 = a2[2];
  if ((int)v8 > v5)
    return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: ipv4 count error (%d > %d)"), a2[2], a2[1], v20, v21);
  v9 = a2[3];
  if ((int)v9 > v5)
    return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: ipv6 count error (%d > %d)"), a2[3], a2[1], v20, v21);
  v10 = a2[4];
  if (v10 > v5)
    return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: if_list count error (%d > %d)"), a2[4], a2[1], v20, v21);
  if ((int)v8 < 1)
  {
LABEL_21:
    if ((int)v9 >= 1)
    {
      v15 = 0;
      v16 = &a2[28 * v5 + 16];
      do
      {
        v18 = *v16;
        v16 += 28;
        v17 = v18;
        if (v18)
        {
          if ((int)v6 + (int)v15 + (int)v17 < 0 || (int)v6 + (int)v15 + (int)v17 >= (int)v8)
            return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: IPv6 alias [%d] offset error (%d < 0 || %d >= %d)"), v15, v17 + v6 + v15, v17 + v6 + v15, a2[2]);
        }
      }
      while (v9 != ++v15);
    }
    if (v10 >= 1)
    {
      v19 = &a2[28 * v7 + 10];
      while ((int)*v19 < v7)
      {
        ++v19;
        if (!--v10)
          goto LABEL_31;
      }
      return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: if_list index error (%d > %d)"), *v19, 2 * a2[1], v20, v21);
    }
LABEL_31:
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _nwi_state_log(a2, v2);
    if (!-[__CFString length](v2, "length"))
      -[__CFString appendString:](v2, "appendString:", CFSTR("Network information: not available"));
    return (uint64_t)v2;
  }
  v11 = 0;
  v12 = a2 + 16;
  while (1)
  {
    v14 = *v12;
    v12 += 28;
    v13 = v14;
    if (v14)
    {
      if ((int)v11 - v5 + (int)v13 < 0 || (int)v11 - v5 + (int)v13 >= (int)v9)
        return objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network information: IPv4 alias [%d] offset error (%d < 0 || %d >= %d)"), v11, v13 + -v5 + v11, v13 + -v5 + v11, a2[3]);
    }
    if (v8 == ++v11)
      goto LABEL_21;
  }
}

void _dns_resolver_log(unsigned int a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __CFString *Mutable;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  char v19[32];
  char __str[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(v7, "appendFormat:", CFSTR("%s\n"), "");
  objc_msgSend(v7, "appendFormat:", CFSTR("resolver #%d\n"), a3);
  if (*(_QWORD *)a2)
    objc_msgSend(v7, "appendFormat:", CFSTR("  domain   : %s\n"), *(_QWORD *)a2);
  if (*(int *)(a2 + 24) >= 1)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("  search domain[%d] : %s\n"), v8, *(_QWORD *)(*(_QWORD *)(a2 + 28) + 8 * v8));
      ++v8;
    }
    while (v8 < *(int *)(a2 + 24));
  }
  if (*(int *)(a2 + 8) >= 1)
  {
    v9 = 0;
    do
    {
      _SC_sockaddr_to_string();
      objc_msgSend(v7, "appendFormat:", CFSTR("  nameserver[%d] : %s\n"), v9++, __str);
    }
    while (v9 < *(int *)(a2 + 8));
  }
  if (*(int *)(a2 + 36) >= 1)
  {
    v10 = 0;
    do
    {
      inet_ntop(2, *(const void **)(*(_QWORD *)(a2 + 40) + 8 * v10), __str, 0x20u);
      inet_ntop(2, (const void *)(*(_QWORD *)(*(_QWORD *)(a2 + 40) + 8 * v10) + 4), v19, 0x20u);
      objc_msgSend(v7, "appendFormat:", CFSTR("  sortaddr[%d] : %s/%s\n"), v10++, __str, v19);
    }
    while (v10 < *(int *)(a2 + 36));
  }
  if (*(_QWORD *)(a2 + 48))
    objc_msgSend(v7, "appendFormat:", CFSTR("  options  : %s\n"), *(_QWORD *)(a2 + 48));
  if (*(_WORD *)(a2 + 20))
    objc_msgSend(v7, "appendFormat:", CFSTR("  port     : %hu\n"), *(unsigned __int16 *)(a2 + 20));
  if (*(_DWORD *)(a2 + 56))
    objc_msgSend(v7, "appendFormat:", CFSTR("  timeout  : %u\n"), *(unsigned int *)(a2 + 56));
  if (*(_DWORD *)(a2 + 64))
  {
    if (a1 < 0x133C785)
      v11 = 0;
    else
      v11 = *(const char **)(a2 + 88);
    if (!v11)
      v11 = "?";
    objc_msgSend(v7, "appendFormat:", CFSTR("  if_index : %u (%s)\n"), *(unsigned int *)(a2 + 64), v11);
  }
  if (*(_DWORD *)(a2 + 76))
    objc_msgSend(v7, "appendFormat:", CFSTR("  service_identifier : %u\n"), *(unsigned int *)(a2 + 76));
  v12 = *(unsigned int *)(a2 + 68);
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("  flags    : "));
  CFStringAppendFormat(Mutable, 0, CFSTR("0x%08x"), v12);
  if ((_DWORD)v12)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR(" ("));
    if ((v12 & 0x1000) != 0)
    {
      v12 = v12 & 0xFFFFEFFF;
      if ((_DWORD)v12)
        v14 = ", ";
      else
        v14 = "";
      CFStringAppendFormat(Mutable, 0, CFSTR("Scoped%s"), v14);
      if ((v12 & 0x2000) == 0)
      {
LABEL_30:
        if ((v12 & 0x4000) == 0)
          goto LABEL_31;
        goto LABEL_49;
      }
    }
    else if ((v12 & 0x2000) == 0)
    {
      goto LABEL_30;
    }
    v12 = v12 & 0xFFFFDFFF;
    if ((_DWORD)v12)
      v15 = ", ";
    else
      v15 = "";
    CFStringAppendFormat(Mutable, 0, CFSTR("Service-specific%s"), v15);
    if ((v12 & 0x4000) == 0)
    {
LABEL_31:
      if ((v12 & 2) == 0)
        goto LABEL_32;
      goto LABEL_53;
    }
LABEL_49:
    v12 = v12 & 0xFFFFBFFF;
    if ((_DWORD)v12)
      v16 = ", ";
    else
      v16 = "";
    CFStringAppendFormat(Mutable, 0, CFSTR("Supplemental%s"), v16);
    if ((v12 & 2) == 0)
    {
LABEL_32:
      if ((v12 & 4) == 0)
        goto LABEL_33;
      goto LABEL_57;
    }
LABEL_53:
    v12 = v12 & 0xFFFFFFFD;
    if ((_DWORD)v12)
      v17 = ", ";
    else
      v17 = "";
    CFStringAppendFormat(Mutable, 0, CFSTR("Request A records%s"), v17);
    if ((v12 & 4) == 0)
    {
LABEL_33:
      if (!(_DWORD)v12)
      {
LABEL_35:
        CFStringAppend(Mutable, CFSTR(")"));
        goto LABEL_36;
      }
LABEL_34:
      CFStringAppendFormat(Mutable, 0, CFSTR("0x%08x"), v12);
      goto LABEL_35;
    }
LABEL_57:
    v12 = v12 & 0xFFFFFFFB;
    if ((_DWORD)v12)
      v18 = ", ";
    else
      v18 = "";
    CFStringAppendFormat(Mutable, 0, CFSTR("Request AAAA records%s"), v18);
    if (!(_DWORD)v12)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_36:
  objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), Mutable);
  CFRelease(Mutable);
  __SCNetworkReachability_flags_string(*(_DWORD *)(a2 + 72), __str);
  objc_msgSend(v7, "appendFormat:", CFSTR("  reach    : %s\n"), __str);
  if (*(_DWORD *)(a2 + 60))
    objc_msgSend(v7, "appendFormat:", CFSTR("  order    : %u\n"), *(unsigned int *)(a2 + 60));
  if (*(_QWORD *)(a2 + 80))
    objc_msgSend(v7, "appendFormat:", CFSTR("  config id: %s\n"), *(_QWORD *)(a2 + 80));

}

unint64_t __SCNetworkReachability_flags_string(unsigned int a1, char *__str)
{
  unint64_t result;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;

  result = snprintf(__str, 0x64uLL, "0x%08x (", a1);
  if (a1 || result > 0x53)
  {
    v6 = (int)result;
    v5 = (int)result;
    v7 = a1;
    if ((a1 & 2) != 0)
    {
      v5 = (int)result;
      v7 = a1;
      if (result <= 0x57)
      {
        result = strlcat(__str, "Reachable,", 0x63uLL);
        v5 = result;
        v7 = a1 & 0xFFFFFFFD;
      }
    }
    if ((v7 & 1) != 0 && v5 <= 0x4C)
    {
      result = strlcat(__str, "Transient Connection,", 0x63uLL);
      v5 = result;
      v7 &= ~1u;
    }
    if ((v7 & 4) != 0 && v5 <= 0x4D)
    {
      result = strlcat(__str, "Connection Required,", 0x63uLL);
      v5 = result;
      v7 &= ~4u;
    }
    if ((v7 & 8) != 0 && v5 <= 0x41)
    {
      result = strlcat(__str, "Automatic Connection On Traffic,", 0x63uLL);
      v5 = result;
      v7 &= ~8u;
    }
    if ((v7 & 0x20) != 0 && v5 <= 0x42)
    {
      result = strlcat(__str, "Automatic Connection On Demand,", 0x63uLL);
      v5 = result;
      v7 &= ~0x20u;
    }
    if ((v7 & 0x10) != 0 && v5 < 0x4C)
    {
      result = strlcat(__str, "Intervention Required,", 0x63uLL);
      v5 = result;
      v7 &= ~0x10u;
    }
    if ((v7 & 0x10000) != 0 && v5 < 0x54)
    {
      result = strlcat(__str, "Local Address,", 0x63uLL);
      v5 = result;
      v7 &= ~0x10000u;
    }
    if ((v7 & 0x20000) != 0 && v5 <= 0x46)
    {
      result = strlcat(__str, "Directly Reachable Address,", 0x63uLL);
      v5 = result;
      v7 &= ~0x20000u;
    }
    if ((v7 & 0x40000) != 0 && v5 <= 0x5C)
    {
      result = strlcat(__str, "WWAN,", 0x63uLL);
      v5 = result;
      v7 &= ~0x40000u;
    }
    if (v7)
    {
      if (v5 >= 0x57)
      {
        __str[v6] = 0;
        v5 = v6;
        v7 = a1;
      }
      result = snprintf(&__str[v5], 99 - v5, "0x%08x,", v7);
      v5 += (int)result;
    }
  }
  else
  {
    result = strlcat(__str, "Not Reachable,", 0x63uLL);
    v5 = result;
  }
  if (v5)
    __str[v5 - 1] = 41;
  return result;
}

void _nwi_state_log(unsigned int *a1, void *a2)
{
  id v3;
  signed int v4;
  uint64_t v5;
  id v6;
  unsigned int reachability_flags;
  signed int v8;
  uint64_t v9;
  id v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  size_t v15;
  unsigned int interface_names;
  unsigned int v17;
  size_t v18;
  uint64_t v19;
  _BYTE v20[4];
  char __str[100];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "appendFormat:", CFSTR("Network information (generation %llu size=%lu)\n"), nwi_state_get_generation(), 4 * a1[1] + 224 * a1[1] + 40);
  objc_msgSend(v3, "appendFormat:", CFSTR("%s\n"), "IPv4 network interface information");
  if ((int)a1[2] < 1)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("%s\n"), "   No IPv4 states found");
  }
  else
  {
    v4 = 0;
    v5 = (uint64_t)(a1 + 10);
    do
    {
      _nwi_ifstate_log(v5, v3);
      ++v4;
      v5 += 112;
    }
    while (v4 < (int)a1[2]);
  }
  v6 = v3;
  reachability_flags = nwi_state_get_reachability_flags();
  __SCNetworkReachability_flags_string(reachability_flags, __str);
  objc_msgSend(v6, "appendFormat:", CFSTR("   REACH : flags %s\n"), __str);

  objc_msgSend(v6, "appendFormat:", CFSTR("%s\n"), "IPv6 network interface information");
  if ((int)a1[3] < 1)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%s\n"), "   No IPv6 states found\n");
  }
  else
  {
    v8 = 0;
    v9 = (uint64_t)&a1[28 * a1[1] + 10];
    do
    {
      _nwi_ifstate_log(v9, v6);
      ++v8;
      v9 += 112;
    }
    while (v8 < (int)a1[3]);
  }
  v10 = v6;
  v11 = nwi_state_get_reachability_flags();
  __SCNetworkReachability_flags_string(v11, __str);
  objc_msgSend(v10, "appendFormat:", CFSTR("   REACH : flags %s\n"), __str);

  if (nwi_state_get_interface_names())
  {
    MEMORY[0x24BDAC7A8]();
    v14 = &v20[-v13];
    v15 = v12 >= 0x200 ? 512 : v12;
    bzero(&v20[-v13], v15);
    interface_names = nwi_state_get_interface_names();
    if (interface_names)
    {
      v17 = interface_names;
      v18 = 17 * interface_names;
      MEMORY[0x24BDAC7A8]();
      bzero(&v20[-((v18 + 15) & 0x1FFFFFFF0)], v18);
      v19 = 0;
      do
      {
        if (v19)
          strlcat(&v20[-((v18 + 15) & 0x1FFFFFFF0)], " ", v18);
        strlcat(&v20[-((v18 + 15) & 0x1FFFFFFF0)], *(const char **)&v14[v19], v18);
        v19 += 8;
      }
      while (8 * v17 != v19);
      objc_msgSend(v10, "appendFormat:", CFSTR("Network interfaces: %s\n"), &v20[-((v18 + 15) & 0x1FFFFFFF0)]);
    }
  }

}

void _nwi_ifstate_log(uint64_t a1, void *a2)
{
  id v3;
  uint64_t flags;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t ifname;
  unsigned int reachability_flags;
  uint64_t v13;
  const char *v14;
  const UInt8 *signature;
  CFDataRef v16;
  uint64_t v17;
  char length[106];
  char v19[100];
  char v20[46];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  flags = nwi_ifstate_get_flags();
  v5 = *(_QWORD *)(a1 + 16) & 0xEFLL;
  v6 = v5 | flags & 0xFFFFFFFFFFFFFFEFLL;
  v7 = (v5 | flags & 0xEF);
  if (!(v5 | flags & 0xEF))
  {
    v19[0] = 0;
    goto LABEL_31;
  }
  v8 = __strlcpy_chk();
  v9 = v8;
  if ((v6 & 1) != 0 && v8 <= 0x62)
  {
    v10 = v7;
    if (v8 <= 0x5C)
    {
      v9 = __strlcat_chk();
      v10 = v6 & 0xEE;
    }
    if ((v10 & 2) == 0)
      goto LABEL_9;
    goto LABEL_7;
  }
  v10 = v7;
  if ((v7 & 2) != 0)
  {
LABEL_7:
    if (v9 <= 0x5C)
    {
      v9 = __strlcat_chk();
      v10 = v10 & 0xED;
    }
  }
LABEL_9:
  if ((v10 & 4) != 0 && v9 <= 0x5D)
  {
    v9 = __strlcat_chk();
    v10 &= ~4uLL;
  }
  if ((v10 & 0x40) != 0 && v9 <= 0x5A)
  {
    v9 = __strlcat_chk();
    v10 &= ~0x40uLL;
  }
  if ((v10 & 8) != 0 && v9 <= 0x55)
  {
    v9 = __strlcat_chk();
    v10 &= ~8uLL;
  }
  if ((v10 & 0x10) != 0 && v9 < 0x58)
  {
    v9 = __strlcat_chk();
    v10 &= ~0x10uLL;
  }
  if ((v10 & 0x20) != 0 && v9 < 0x54)
  {
    v9 = __strlcat_chk();
    v10 &= ~0x20uLL;
  }
  if (v10)
  {
    if (v9 >= 0x57)
    {
      v9 = __strlcpy_chk();
      v10 = v7;
    }
    v9 += snprintf(&v19[v9], 99 - v9, ",%p", (const void *)v10);
  }
  if (v9)
    v19[v9 - 1] = 41;
LABEL_31:
  ifname = nwi_ifstate_get_ifname();
  reachability_flags = nwi_ifstate_get_reachability_flags();
  if (!inet_ntop(*(unsigned __int8 *)(a1 + 32), (const void *)(a1 + 36), v20, 0x2Eu))
    __strlcpy_chk();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %7s : flags      : %p %s\n"), ifname, v6, v19);
  objc_msgSend(v3, "appendFormat:", CFSTR("           address    : %s\n"), v20);
  if (nwi_ifstate_get_vpn_server())
  {
    _SC_sockaddr_to_string();
    objc_msgSend(v3, "appendFormat:", CFSTR("           VPN server : %s\n"), &length[6]);
  }
  __SCNetworkReachability_flags_string(reachability_flags, &length[6]);
  objc_msgSend(v3, "appendFormat:", CFSTR("           reach      : %s\n"), &length[6]);
  v13 = *(unsigned int *)(a1 + 28);
  if (BYTE3(v13) > 4u)
    v14 = "???";
  else
    v14 = (&off_24F061090)[(char)HIBYTE(*(_DWORD *)(a1 + 28))];
  if ((v13 & 0xFFFFFF) == 0xFFFFFF)
    objc_msgSend(v3, "appendFormat:", CFSTR("           rank       : 0x%08x (%s, Last)\n"), *(unsigned int *)(a1 + 28), v14, v17);
  else
    objc_msgSend(v3, "appendFormat:", CFSTR("           rank       : 0x%08x (%s, %u)\n"), v13, v14, v13 & 0xFFFFFF);
  signature = (const UInt8 *)nwi_ifstate_get_signature();
  if (signature)
  {
    v16 = CFDataCreate(0, signature, 0);
    objc_msgSend(v3, "appendFormat:", CFSTR("           signature  : %@\n"), v16);
    CFRelease(v16);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("           generation : %llu\n"), nwi_ifstate_get_generation());

}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

uint64_t _SC_LOG_DEFAULT()
{
  return MEMORY[0x24BDF5928]();
}

uint64_t _SC_sockaddr_to_string()
{
  return MEMORY[0x24BDF5940]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x24BDF5948]();
}

uint64_t __SC_log_enabled()
{
  return MEMORY[0x24BDF5950]();
}

uint64_t __SC_log_send2()
{
  return MEMORY[0x24BDF5960]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x24BDAF1B0]();
}

uint64_t nwi_ifstate_get_generation()
{
  return MEMORY[0x24BDAF1B8]();
}

uint64_t nwi_ifstate_get_ifname()
{
  return MEMORY[0x24BDAF1C0]();
}

uint64_t nwi_ifstate_get_reachability_flags()
{
  return MEMORY[0x24BDAF1D0]();
}

uint64_t nwi_ifstate_get_signature()
{
  return MEMORY[0x24BDAF1D8]();
}

uint64_t nwi_ifstate_get_vpn_server()
{
  return MEMORY[0x24BDAF1E0]();
}

uint64_t nwi_state_get_generation()
{
  return MEMORY[0x24BDAF1F8]();
}

uint64_t nwi_state_get_interface_names()
{
  return MEMORY[0x24BDAF208]();
}

uint64_t nwi_state_get_reachability_flags()
{
  return MEMORY[0x24BDAF218]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

