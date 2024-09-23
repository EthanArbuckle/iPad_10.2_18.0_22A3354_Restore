@implementation MAX

uint64_t __quic_frame_acknowledged_MAX_STREAM_DATA_block_invoke(uint64_t a1, uint64_t a2)
{
  char v2;
  BOOL v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled)
    v3 = 0;
  else
    v3 = qlog_nwlog_enabled == 0;
  if (!v3)
  {
    if (qlog_debug_enabled)
      v2 = 1;
    if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v6 = _os_log_pack_size();
      v7 = (char *)v10 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v8 = _os_log_pack_fill();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)v8 = 136446722;
      *(_QWORD *)(v8 + 4) = "quic_frame_acknowledged_MAX_STREAM_DATA_block_invoke";
      *(_WORD *)(v8 + 12) = 2048;
      *(_QWORD *)(v8 + 14) = v9;
      *(_WORD *)(v8 + 22) = 2048;
      *(_QWORD *)(v8 + 24) = v9;
      qlog_internal(2, (uint64_t)v7, 1080);
    }
  }
  return 1;
}

uint64_t __quic_frame_process_MAX_STREAM_DATA_block_invoke(uint64_t a1, uint64_t *a2)
{
  quic_process_max_stream_data(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  return 1;
}

@end
