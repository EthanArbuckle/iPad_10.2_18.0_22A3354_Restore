@implementation STOP

uint64_t __quic_frame_process_STOP_SENDING_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  int v11;
  unsigned int v12;
  __int128 v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *posix_error;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112))
  {
    v4 = _os_log_pack_size();
    v5 = (char *)v27 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    v7 = *(_QWORD *)(a1 + 32);
    v27[0] = v7 + 976;
    v8 = *(_QWORD *)(v7 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v9 = &quic_cid_describe_cid_buf2;
    else
      v9 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v10 = v9;
    else
      v10 = &quic_cid_describe_cid_buf1;
    v11 = ++quic_cid_describe_state;
    v12 = *(unsigned __int8 *)(v8 + 38);
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
      v15 = (unsigned __int8 *)(v8 + 39);
      do
      {
        v16 = *v15++;
        snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v16);
        --v14;
      }
      while (v14);
      v11 = quic_cid_describe_state;
      v13 = 0uLL;
    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112);
    if (v11 % 3 == 2)
      v18 = &quic_cid_describe_cid_buf2;
    else
      v18 = &quic_cid_describe_cid_buf3;
    if (v11 % 3)
      v19 = v18;
    else
      v19 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v11 + 1;
    if (*(unsigned __int8 *)(v17 + 17) >= 0x14u)
      v20 = 20;
    else
      v20 = *(unsigned __int8 *)(v17 + 17);
    *v19 = v13;
    v19[1] = v13;
    *(_OWORD *)((char *)v19 + 25) = v13;
    if ((_DWORD)v20)
    {
      v21 = (unsigned __int8 *)(v17 + 18);
      do
      {
        v22 = *v21++;
        snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
        --v20;
      }
      while (v20);
    }
    v23 = *(_QWORD *)a2;
    *(_DWORD *)v6 = 136447234;
    *(_QWORD *)(v6 + 4) = "quic_frame_process_STOP_SENDING_block_invoke";
    *(_WORD *)(v6 + 12) = 2082;
    *(_QWORD *)(v6 + 14) = v27[0];
    *(_WORD *)(v6 + 22) = 2082;
    *(_QWORD *)(v6 + 24) = v10;
    *(_WORD *)(v6 + 32) = 2082;
    *(_QWORD *)(v6 + 34) = v19;
    *(_WORD *)(v6 + 42) = 2048;
    *(_QWORD *)(v6 + 44) = v23;
    qlog_internal(1, (uint64_t)v5, 1964);
  }
  *(_DWORD *)(a2 + 352) |= 0x2000u;
  quic_fc_update_send_limit(**(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 40), (uint64_t *)a2);
  v24 = *(_QWORD *)a2;
  if ((*(_QWORD *)a2 & 2) == 0)
    goto LABEL_36;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1380) & 1) != 0)
  {
    if ((v24 & 1) != 0)
      goto LABEL_37;
LABEL_36:
    if ((*(_BYTE *)(a2 + 251) & 0xFE) != 4)
      return 1;
    goto LABEL_37;
  }
  if ((v24 & 1) != 0)
    goto LABEL_36;
LABEL_37:
  posix_error = (void *)nw_error_create_posix_error();
  quic_stream_close(*(_QWORD *)(a1 + 32), a2);
  if (posix_error)
    nw_release(posix_error);
  return 1;
}

@end
