@implementation STREAM

uint64_t __quic_frame_write_STREAM_block_invoke(uint64_t a1, uint64_t a2)
{
  return quic_frame_write_data_frame(*(char ***)(a1 + 40), *(_WORD **)(a1 + 48), a2, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_QWORD *)(a1 + 56));
}

uint64_t __quic_frame_free_STREAM_block_invoke(uint64_t a1)
{
  nw_frame_array_remove();
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 4) == 0)
    nw_frame_finalize();
  return 1;
}

uint64_t __quic_frame_acknowledged_STREAM_block_invoke(uint64_t a1, uint64_t *a2)
{
  _BYTE *v2;
  char v3;
  BOOL v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = (char *)a2 + 250;
  if (*((unsigned __int8 *)a2 + 250) <= 3u)
  {
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
        v7 = _os_log_pack_size();
        v8 = (char *)v11 - ((MEMORY[0x24BDAC7A8](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v9 = _os_log_pack_fill();
        v10 = *a2;
        *(_DWORD *)v9 = 136446466;
        *(_QWORD *)(v9 + 4) = "quic_frame_acknowledged_STREAM_block_invoke";
        *(_WORD *)(v9 + 12) = 2048;
        *(_QWORD *)(v9 + 14) = v10;
        qlog_internal(2, (uint64_t)v8, 2759);
      }
    }
    quic_fsm_send_stream_change(v2, 5u);
  }
  return 1;
}

uint64_t __quic_frame_process_STREAM_DATA_BLOCKED_block_invoke(uint64_t a1, uint64_t *a2)
{
  quic_fc_process_stream_data_blocked(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  return 1;
}

@end
