@implementation DNSServiceSetDispatchQueue

void __DNSServiceSetDispatchQueue_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int all;
  int8x16_t v4;
  char *v5;
  unsigned int *v6;
  int v7;
  unint64_t v8;
  unsigned int *v10;
  unsigned int v11;
  unint64_t v12;
  fd_set *v13;
  int v14;
  _BOOL4 v15;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  size_t v25[2];
  __int128 v26;
  uint64_t v27;
  _BOOL4 v28;
  timeval v29[8];
  timeval v30;

  v1 = *(_QWORD *)(a1 + 32);
  v28 = 0;
  if (!v1)
  {
    syslog(4, "dnssd_clientstub DNSServiceProcessResult called with NULL DNSServiceRef");
    return;
  }
  v2 = *(_DWORD *)(v1 + 16);
  if (v2 < 0 || (*(_DWORD *)(v1 + 20) ^ v2) != 0x12345678)
  {
    syslog(4, "dnssd_clientstub DNSServiceProcessResult called with invalid DNSServiceRef %p %08X %08X");
    return;
  }
  if (*(_QWORD *)(v1 + 8))
  {
    syslog(4, "dnssd_clientstub DNSServiceProcessResult undefined for kDNSServiceFlagsShareConnection subordinate DNSServiceRef %p");
    return;
  }
  if (*(_QWORD *)(v1 + 56))
  {
    while (1)
    {
      v27 = 0;
      *(_OWORD *)v25 = 0u;
      v26 = 0u;
      all = read_all(*(_DWORD *)(v1 + 16), (char *)v25, 0x1CuLL);
      switch(all)
      {
        case -1:
LABEL_50:
          if (all == -3)
            v18 = 4294901727;
          else
            v18 = 4294901733;
          *(_QWORD *)(v1 + 56) = 0;
          v19 = *(NSObject **)(v1 + 88);
          if (v19)
          {
            dispatch_source_cancel(v19);
            v20 = *(NSObject **)(v1 + 88);
            if (v20)
            {
              dispatch_release(v20);
              *(_QWORD *)(v1 + 88) = 0;
            }
            CallbackWithError((uint64_t *)v1, v18);
          }
          return;
        case -2:
          if (v28)
          {
            v21 = *(_DWORD *)(v1 + 40);
            if (v21 <= 0x63)
            {
              *(_DWORD *)(v1 + 40) = v21 + 1;
              syslog(4, "dnssd_clientstub DNSServiceProcessResult error: select indicated data was waiting but read_all returned EWOULDBLOCK");
            }
          }
          return;
        case -3:
          goto LABEL_50;
      }
      v4 = vrev32q_s8(*(int8x16_t *)v25);
      *(int8x16_t *)v25 = v4;
      DWORD2(v26) = bswap32(DWORD2(v26));
      if (v4.i32[0] != 1)
      {
        syslog(4, "dnssd_clientstub DNSServiceProcessResult daemon version %d does not match client version %d", v4.i32[0], 1);
        *(_QWORD *)(v1 + 56) = 0;
        return;
      }
      if (!v4.i32[1] || (v5 = (char *)malloc_type_malloc(v4.u32[1], 0xA172743EuLL)) == 0)
      {
LABEL_70:
        __break(1u);
        return;
      }
      v6 = (unsigned int *)v5;
      v7 = read_all(*(_DWORD *)(v1 + 16), v5, HIDWORD(v25[0]));
      if (v7 < 0)
      {
        if (v7 == -3)
          v22 = 4294901727;
        else
          v22 = 4294901733;
        *(_QWORD *)(v1 + 56) = 0;
        v23 = *(NSObject **)(v1 + 88);
        if (v23)
        {
          dispatch_source_cancel(v23);
          v24 = *(NSObject **)(v1 + 88);
          if (v24)
          {
            dispatch_release(v24);
            *(_QWORD *)(v1 + 88) = 0;
          }
          CallbackWithError((uint64_t *)v1, v22);
        }
        free(v6);
        return;
      }
      v8 = (unint64_t)v6 + HIDWORD(v25[0]);
      if ((unint64_t)(v6 + 1) > v8)
        break;
      HIDWORD(v26) = bswap32(*v6);
      if (v6 == (unsigned int *)-4 || (unint64_t)(v6 + 2) > v8)
        goto LABEL_24;
      LODWORD(v27) = bswap32(v6[1]);
      v10 = v6 + 3;
      if (v6 == (unsigned int *)-8 || (unint64_t)v10 > v8)
      {
        v10 = 0;
        v11 = 0;
      }
      else
      {
        v11 = bswap32(v6[2]);
      }
LABEL_25:
      HIDWORD(v27) = v11;
      v12 = *(unsigned int *)(v1 + 16);
      v30.tv_sec = 0;
      *(_QWORD *)&v30.tv_usec = 0;
      if ((int)v12 >= 1024)
      {
        v13 = (fd_set *)malloc_type_calloc((v12 >> 5) + 1, 4uLL, 0xF1748037uLL);
        if (!v13)
          goto LABEL_70;
      }
      else
      {
        v13 = (fd_set *)v29;
      }
      memset(v29, 0, sizeof(v29));
      if (__darwin_check_fd_set_overflow(v12, v13, 0))
        *(__int32_t *)((char *)v13->fds_bits + (((unint64_t)(int)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v12;
      v14 = select(v12 + 1, v13, 0, 0, &v30);
      if (v13 != (fd_set *)v29)
        free(v13);
      v15 = v14 > 0;
      v28 = v15;
      if (v14 >= 1)
      {
        HIDWORD(v26) |= 1u;
        *(_QWORD *)(v1 + 48) = &v28;
      }
      if (v10)
      {
        (*(void (**)(uint64_t, size_t *, unsigned int *, char *))(v1 + 56))(v1, v25, v10, (char *)v6 + HIDWORD(v25[0]));
        v15 = v28;
      }
      if (v15)
        *(_QWORD *)(v1 + 48) = 0;
      free(v6);
      if (!v28)
        return;
    }
    HIDWORD(v26) = 0;
LABEL_24:
    v10 = 0;
    v11 = 0;
    LODWORD(v27) = 0;
    goto LABEL_25;
  }
  v17 = DNSServiceProcessResult_num_logs;
  if (DNSServiceProcessResult_num_logs <= 9)
  {
    syslog(4, "dnssd_clientstub DNSServiceProcessResult called with DNSServiceRef with no ProcessReply function");
    v17 = DNSServiceProcessResult_num_logs;
  }
  if (v17 > 999)
    sleep(1u);
  else
    DNSServiceProcessResult_num_logs = v17 + 1;
}

uint64_t __DNSServiceSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

@end
