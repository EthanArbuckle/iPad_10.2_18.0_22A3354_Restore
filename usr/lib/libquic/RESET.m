@implementation RESET

uint64_t __quic_frame_acknowledged_RESET_STREAM_block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  int v12;
  unsigned int v13;
  __int128 v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  uint64_t v24;
  int v25;
  void *posix_error;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (_BYTE *)(a2 + 250);
  if (*(_BYTE *)(a2 + 250) == 2
    && (qlog_debug_enabled
     || (qlog_nwlog_enabled & 1) != 0
     || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112))
  {
    v5 = _os_log_pack_size();
    v30 = &v28;
    v6 = (char *)&v28 - ((MEMORY[0x24BDAC7A8](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = _os_log_pack_fill();
    v8 = *(_QWORD *)(a1 + 32);
    v29 = v8 + 976;
    v9 = *(_QWORD *)(v8 + 1112);
    if (quic_cid_describe_state % 3 == 2)
      v10 = &quic_cid_describe_cid_buf2;
    else
      v10 = &quic_cid_describe_cid_buf3;
    if (quic_cid_describe_state % 3)
      v11 = v10;
    else
      v11 = &quic_cid_describe_cid_buf1;
    v12 = ++quic_cid_describe_state;
    v13 = *(unsigned __int8 *)(v9 + 38);
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
      v16 = (unsigned __int8 *)(v9 + 39);
      do
      {
        v17 = *v16++;
        snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
        --v15;
      }
      while (v15);
      v12 = quic_cid_describe_state;
      v14 = 0uLL;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112);
    if (v12 % 3 == 2)
      v19 = &quic_cid_describe_cid_buf2;
    else
      v19 = &quic_cid_describe_cid_buf3;
    if (v12 % 3)
      v20 = v19;
    else
      v20 = &quic_cid_describe_cid_buf1;
    quic_cid_describe_state = v12 + 1;
    if (*(unsigned __int8 *)(v18 + 17) >= 0x14u)
      v21 = 20;
    else
      v21 = *(unsigned __int8 *)(v18 + 17);
    *v20 = v14;
    v20[1] = v14;
    *(_OWORD *)((char *)v20 + 25) = v14;
    if ((_DWORD)v21)
    {
      v22 = (unsigned __int8 *)(v18 + 18);
      do
      {
        v23 = *v22++;
        snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
        --v21;
      }
      while (v21);
    }
    v24 = *(_QWORD *)a2;
    v25 = (*(_DWORD *)(a2 + 352) >> 15) & 1;
    *(_DWORD *)v7 = 136447490;
    *(_QWORD *)(v7 + 4) = "quic_frame_acknowledged_RESET_STREAM_block_invoke";
    *(_WORD *)(v7 + 12) = 2082;
    *(_QWORD *)(v7 + 14) = v29;
    *(_WORD *)(v7 + 22) = 2082;
    *(_QWORD *)(v7 + 24) = v11;
    *(_WORD *)(v7 + 32) = 2082;
    *(_QWORD *)(v7 + 34) = v20;
    *(_WORD *)(v7 + 42) = 2048;
    *(_QWORD *)(v7 + 44) = v24;
    *(_WORD *)(v7 + 52) = 1024;
    *(_DWORD *)(v7 + 54) = v25;
    qlog_internal(0, (uint64_t)v6, 590);
  }
  quic_fsm_send_stream_change(v4, 6u);
  posix_error = (void *)nw_error_create_posix_error();
  quic_stream_close(*(_QWORD *)(a1 + 32), a2);
  if (posix_error)
    nw_release(posix_error);
  return 1;
}

BOOL __quic_frame_process_RESET_STREAM_block_invoke(uint64_t a1, uint64_t a2)
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
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  char v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t updated;
  uint64_t v50;
  void *posix_error;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _OWORD *v57;
  _OWORD *v58;
  int v59;
  unsigned int v60;
  __int128 v61;
  uint64_t v62;
  unsigned __int8 *v63;
  int v64;
  uint64_t v65;
  _OWORD *v66;
  _OWORD *v67;
  uint64_t v68;
  unsigned __int8 *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  quic_stream_set_application_error(a2);
  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112))
  {
    v4 = _os_log_pack_size();
    v78 = &v76;
    v5 = (char *)&v76 - ((MEMORY[0x24BDAC7A8](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = _os_log_pack_fill();
    v7 = *(_QWORD *)(a1 + 40);
    v77 = v7 + 976;
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
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
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
    v24 = *(unsigned __int8 *)(a2 + 251);
    v25 = *(_QWORD *)(a1 + 40);
    v26 = *(_QWORD *)(v25 + 928);
    v27 = *(_QWORD *)(v25 + 936);
    v28 = *(_QWORD *)(a2 + 160);
    v29 = *(_QWORD *)(a2 + 168);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    *(_DWORD *)v6 = 136448770;
    *(_QWORD *)(v6 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
    *(_WORD *)(v6 + 12) = 2082;
    *(_QWORD *)(v6 + 14) = v77;
    *(_WORD *)(v6 + 22) = 2082;
    *(_QWORD *)(v6 + 24) = v10;
    *(_WORD *)(v6 + 32) = 2082;
    *(_QWORD *)(v6 + 34) = v19;
    *(_WORD *)(v6 + 42) = 2048;
    *(_QWORD *)(v6 + 44) = v23;
    *(_WORD *)(v6 + 52) = 1024;
    *(_DWORD *)(v6 + 54) = v24;
    *(_WORD *)(v6 + 58) = 2048;
    *(_QWORD *)(v6 + 60) = v26;
    *(_WORD *)(v6 + 68) = 2048;
    *(_QWORD *)(v6 + 70) = v27;
    *(_WORD *)(v6 + 78) = 2048;
    *(_QWORD *)(v6 + 80) = v28;
    *(_WORD *)(v6 + 88) = 2048;
    *(_QWORD *)(v6 + 90) = v29;
    *(_WORD *)(v6 + 98) = 2048;
    *(_QWORD *)(v6 + 100) = v30;
    qlog_internal(1, (uint64_t)v5, 493);
  }
  *(_DWORD *)(a2 + 352) |= 0x10000u;
  v31 = *(_QWORD *)(a2 + 160);
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v33 = v32 - v31;
  if (v32 > v31)
  {
    v34 = *(_QWORD *)(a1 + 40);
    v35 = *(_QWORD *)(v34 + 928);
    v36 = qlog_debug_enabled;
    v37 = qlog_nwlog_enabled;
    *(_QWORD *)(v34 + 928) = v35 + v33;
    if (__CFADD__(v35, v33))
    {
      if (v36)
        v37 = 1;
      if ((v37 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        v38 = _os_log_pack_size();
        v39 = (char *)&v76 - ((MEMORY[0x24BDAC7A8](v38, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v40 = _os_log_pack_fill();
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 928);
        *(_DWORD *)v40 = 136447234;
        *(_QWORD *)(v40 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
        *(_WORD *)(v40 + 12) = 2082;
        *(_QWORD *)(v40 + 14) = "conn->inorder_offset";
        *(_WORD *)(v40 + 22) = 2048;
        *(_QWORD *)(v40 + 24) = v41 - v33;
        *(_WORD *)(v40 + 32) = 2048;
        *(_QWORD *)(v40 + 34) = v33;
        *(_WORD *)(v40 + 42) = 2048;
        *(_QWORD *)(v40 + 44) = v41;
        qlog_internal(17, (uint64_t)v39, 509);
        v36 = qlog_debug_enabled;
        v37 = qlog_nwlog_enabled;
      }
      else
      {
        v37 = 0;
        v36 = 0;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 928) = -1;
    }
    if (v36 || (v37 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      v42 = _os_log_pack_size();
      v43 = (char *)&v76 - ((MEMORY[0x24BDAC7A8](v42, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v44 = _os_log_pack_fill();
      v45 = *(_QWORD *)a2;
      v46 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 928);
      *(_DWORD *)v44 = 136446722;
      *(_QWORD *)(v44 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
      *(_WORD *)(v44 + 12) = 2048;
      *(_QWORD *)(v44 + 14) = v45;
      *(_WORD *)(v44 + 22) = 2048;
      *(_QWORD *)(v44 + 24) = v46;
      qlog_internal(2, (uint64_t)v43, 519);
    }
  }
  v47 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v47)
    v48 = v47 - 1;
  else
    v48 = 0;
  updated = quic_stream_update_last_offset(*(_QWORD **)(a1 + 40), a2, v48, v47, 1);
  v50 = updated;
  if (updated == -1)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112))
    {
      v52 = _os_log_pack_size();
      v78 = &v76;
      v53 = (char *)&v76 - ((MEMORY[0x24BDAC7A8](v52, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v54 = _os_log_pack_fill();
      v55 = *(_QWORD *)(a1 + 40);
      v77 = v55 + 976;
      v56 = *(_QWORD *)(v55 + 1112);
      if (quic_cid_describe_state % 3 == 2)
        v57 = &quic_cid_describe_cid_buf2;
      else
        v57 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3)
        v58 = v57;
      else
        v58 = &quic_cid_describe_cid_buf1;
      v59 = ++quic_cid_describe_state;
      v60 = *(unsigned __int8 *)(v56 + 38);
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
        v63 = (unsigned __int8 *)(v56 + 39);
        do
        {
          v64 = *v63++;
          snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v64);
          --v62;
        }
        while (v62);
        v59 = quic_cid_describe_state;
        v61 = 0uLL;
      }
      v65 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
      if (v59 % 3 == 2)
        v66 = &quic_cid_describe_cid_buf2;
      else
        v66 = &quic_cid_describe_cid_buf3;
      if (v59 % 3)
        v67 = v66;
      else
        v67 = &quic_cid_describe_cid_buf1;
      quic_cid_describe_state = v59 + 1;
      if (*(unsigned __int8 *)(v65 + 17) >= 0x14u)
        v68 = 20;
      else
        v68 = *(unsigned __int8 *)(v65 + 17);
      *v67 = v61;
      v67[1] = v61;
      *(_OWORD *)((char *)v67 + 25) = v61;
      if ((_DWORD)v68)
      {
        v69 = (unsigned __int8 *)(v65 + 18);
        do
        {
          v70 = *v69++;
          snprintf((char *)v67, 0x29uLL, "%s%02x", (const char *)v67, v70);
          --v68;
        }
        while (v68);
      }
      v71 = *(_QWORD *)a2;
      v72 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)v54 = 136447490;
      *(_QWORD *)(v54 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
      *(_WORD *)(v54 + 12) = 2082;
      *(_QWORD *)(v54 + 14) = v77;
      *(_WORD *)(v54 + 22) = 2082;
      *(_QWORD *)(v54 + 24) = v58;
      *(_WORD *)(v54 + 32) = 2082;
      *(_QWORD *)(v54 + 34) = v67;
      *(_WORD *)(v54 + 42) = 2048;
      *(_QWORD *)(v54 + 44) = v71;
      *(_WORD *)(v54 + 52) = 2048;
      *(_QWORD *)(v54 + 54) = v72;
      qlog_internal(16, (uint64_t)v53, 535);
    }
  }
  else
  {
    if (updated)
      quic_stream_update_fc_credit(*(_QWORD *)(a1 + 40), a2, updated, 1);
    if (*(unsigned __int8 *)(a2 + 251) - 1 <= 1)
    {
      if ((*(_BYTE *)(a2 + 352) & 0x10) != 0)
        posix_error = 0;
      else
        posix_error = (void *)nw_error_create_posix_error();
      quic_fsm_recv_stream_change((_BYTE *)(a2 + 251), 4u);
      v73 = *(_QWORD *)a2;
      if ((*(_QWORD *)a2 & 2) != 0)
      {
        if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1380) & 1) != 0)
        {
          if ((v73 & 1) == 0)
            goto LABEL_94;
        }
        else if ((v73 & 1) != 0)
        {
          goto LABEL_94;
        }
      }
      if ((*(_BYTE *)(a2 + 353) & 0x20) == 0)
      {
        v74 = *(unsigned __int8 *)(a2 + 250);
        if (v74 != 5 && v74 != 3)
        {
LABEL_95:
          if (posix_error)
            nw_release(posix_error);
          return v50 != -1;
        }
      }
LABEL_94:
      quic_stream_close(*(_QWORD *)(a1 + 40), a2);
      goto LABEL_95;
    }
  }
  return v50 != -1;
}

@end
