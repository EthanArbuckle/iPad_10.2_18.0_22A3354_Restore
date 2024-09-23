@implementation CRYPTO

uint64_t __quic_frame_process_CRYPTO_block_invoke(uint64_t a1, int64x2_t **a2)
{
  int v4;
  unint64_t **v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  int v16;
  unsigned int v17;
  __int128 v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  _OWORD *v37;
  int v38;
  unsigned int v39;
  __int128 v40;
  uint64_t v41;
  unsigned __int8 *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  _OWORD *v47;
  uint64_t v48;
  unsigned __int8 *v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(unsigned __int8 *)(a1 + 72);
  switch(v4)
  {
    case 3:
      v5 = (unint64_t **)(a2 + 35);
      goto LABEL_7;
    case 2:
      v5 = (unint64_t **)(a2 + 34);
LABEL_7:
      v6 = *(_QWORD *)(a1 + 40);
      if ((*(_BYTE *)(v6 + 1381) & 0x10) != 0)
      {
        if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
        {
          v30 = 1;
          if (!os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
            return v30;
        }
        if (*(_QWORD *)(v6 + 1112))
        {
          v31 = _os_log_pack_size();
          v62[0] = v62;
          v32 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v33 = _os_log_pack_fill();
          v34 = *(_QWORD *)(a1 + 40);
          v35 = *(_QWORD *)(v34 + 1112);
          if (quic_cid_describe_state % 3 == 2)
            v36 = &quic_cid_describe_cid_buf2;
          else
            v36 = &quic_cid_describe_cid_buf3;
          if (quic_cid_describe_state % 3)
            v37 = v36;
          else
            v37 = &quic_cid_describe_cid_buf1;
          v38 = ++quic_cid_describe_state;
          v39 = *(unsigned __int8 *)(v35 + 38);
          v40 = 0uLL;
          *(_OWORD *)((char *)v37 + 25) = 0u;
          if (v39 >= 0x14)
            v41 = 20;
          else
            v41 = v39;
          *v37 = 0uLL;
          v37[1] = 0uLL;
          if ((_DWORD)v41)
          {
            v42 = (unsigned __int8 *)(v35 + 39);
            do
            {
              v43 = *v42++;
              snprintf((char *)v37, 0x29uLL, "%s%02x", (const char *)v37, v43);
              --v41;
            }
            while (v41);
            v38 = quic_cid_describe_state;
            v40 = 0uLL;
          }
          v44 = v34 + 976;
          v45 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
          if (v38 % 3 == 2)
            v46 = &quic_cid_describe_cid_buf2;
          else
            v46 = &quic_cid_describe_cid_buf3;
          if (v38 % 3)
            v47 = v46;
          else
            v47 = &quic_cid_describe_cid_buf1;
          quic_cid_describe_state = v38 + 1;
          if (*(unsigned __int8 *)(v45 + 17) >= 0x14u)
            v48 = 20;
          else
            v48 = *(unsigned __int8 *)(v45 + 17);
          *v47 = v40;
          v47[1] = v40;
          *(_OWORD *)((char *)v47 + 25) = v40;
          if ((_DWORD)v48)
          {
            v49 = (unsigned __int8 *)(v45 + 18);
            do
            {
              v50 = *v49++;
              snprintf((char *)v47, 0x29uLL, "%s%02x", (const char *)v47, v50);
              --v48;
            }
            while (v48);
          }
          if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 16) - 1 > 2)
            v51 = "???";
          else
            v51 = off_24C2E18B0[(*(_BYTE *)(*(_QWORD *)(a1 + 48) + 16) - 1)];
          *(_DWORD *)v33 = 136447234;
          *(_QWORD *)(v33 + 4) = "quic_frame_process_CRYPTO_block_invoke";
          *(_WORD *)(v33 + 12) = 2082;
          *(_QWORD *)(v33 + 14) = v44;
          *(_WORD *)(v33 + 22) = 2082;
          *(_QWORD *)(v33 + 24) = v37;
          *(_WORD *)(v33 + 32) = 2082;
          *(_QWORD *)(v33 + 34) = v47;
          *(_WORD *)(v33 + 42) = 2082;
          *(_QWORD *)(v33 + 44) = v51;
          v30 = 1;
          qlog_internal(1, (uint64_t)v32, 2946);
          return v30;
        }
      }
      else
      {
        v7 = *v5;
        if (v4 == 2)
          v8 = 0x2000;
        else
          v8 = 4096;
        if (quic_reassq_size((uint64_t)v7) <= v8)
        {
          if (quic_reassq_append(v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), *(_BYTE **)(*(_QWORD *)(a1 + 48) + 40), 0))
          {
            v52 = *(_QWORD *)(a1 + 40);
            v53 = *(_QWORD *)(v52 + 40);
            if (!v53)
            {
              *(_QWORD *)(v52 + 40) = *(_QWORD *)(a1 + 64);
              v52 = *(_QWORD *)(a1 + 40);
              v53 = *(_QWORD *)(v52 + 40);
            }
            quic_crypto_process_reassq(v53, v52 + 48, (uint64_t)a2, a2[33]);
            quic_crypto_process_reassq(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(a1 + 40) + 112, (uint64_t)a2, a2[34]);
            quic_crypto_process_reassq(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(a1 + 40) + 240, (uint64_t)a2, a2[35]);
          }
        }
        else
        {
          if ((qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
            && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112))
          {
            v9 = _os_log_pack_size();
            v62[0] = v62;
            v10 = (char *)v62 - ((MEMORY[0x24BDAC7A8](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            v11 = _os_log_pack_fill();
            v12 = *(_QWORD *)(a1 + 40);
            v13 = *(_QWORD *)(v12 + 1112);
            if (quic_cid_describe_state % 3 == 2)
              v14 = &quic_cid_describe_cid_buf2;
            else
              v14 = &quic_cid_describe_cid_buf3;
            if (quic_cid_describe_state % 3)
              v15 = v14;
            else
              v15 = &quic_cid_describe_cid_buf1;
            v16 = ++quic_cid_describe_state;
            v17 = *(unsigned __int8 *)(v13 + 38);
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
              v20 = (unsigned __int8 *)(v13 + 39);
              do
              {
                v21 = *v20++;
                snprintf((char *)v15, 0x29uLL, "%s%02x", (const char *)v15, v21);
                --v19;
              }
              while (v19);
              v16 = quic_cid_describe_state;
              v18 = 0uLL;
            }
            v22 = v12 + 976;
            v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
            if (v16 % 3 == 2)
              v24 = &quic_cid_describe_cid_buf2;
            else
              v24 = &quic_cid_describe_cid_buf3;
            if (v16 % 3)
              v25 = v24;
            else
              v25 = &quic_cid_describe_cid_buf1;
            quic_cid_describe_state = v16 + 1;
            if (*(unsigned __int8 *)(v23 + 17) >= 0x14u)
              v26 = 20;
            else
              v26 = *(unsigned __int8 *)(v23 + 17);
            *v25 = v18;
            v25[1] = v18;
            *(_OWORD *)((char *)v25 + 25) = v18;
            if ((_DWORD)v26)
            {
              v27 = (unsigned __int8 *)(v23 + 18);
              do
              {
                v28 = *v27++;
                snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
                --v26;
              }
              while (v26);
            }
            if (*(unsigned __int8 *)(a1 + 72) - 1 > 2)
              v29 = "???";
            else
              v29 = off_24C2E18B0[(*(_BYTE *)(a1 + 72) - 1)];
            *(_DWORD *)v11 = 136447490;
            *(_QWORD *)(v11 + 4) = "quic_frame_process_CRYPTO_block_invoke";
            *(_WORD *)(v11 + 12) = 2082;
            *(_QWORD *)(v11 + 14) = v22;
            *(_WORD *)(v11 + 22) = 2082;
            *(_QWORD *)(v11 + 24) = v15;
            *(_WORD *)(v11 + 32) = 2082;
            *(_QWORD *)(v11 + 34) = v25;
            *(_WORD *)(v11 + 42) = 2048;
            *(_QWORD *)(v11 + 44) = v8;
            *(_WORD *)(v11 + 52) = 2082;
            *(_QWORD *)(v11 + 54) = v29;
            qlog_internal(16, (uint64_t)v10, 2960);
          }
          v54 = *(_QWORD **)(a1 + 40);
          if (*(_BYTE *)(a1 + 72) == 2)
          {
            v30 = 0;
            v54[134] = 13;
            v54[135] = "exceeded crypto buffer";
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
            return v30;
          }
          *(_QWORD *)((char *)v54 + 1380) |= 0x1000uLL;
        }
      }
      return 1;
    case 1:
      v5 = (unint64_t **)(a2 + 33);
      goto LABEL_7;
  }
  v56 = *(_QWORD *)(a1 + 40);
  v57 = (const char *)(v56 + 976);
  v58 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(v56 + 1112) + 38));
  v59 = quic_cid_describe((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112) + 17));
  qlog_abort_internal("%s %s [%s-%s] space %d not implemented", "quic_frame_process_CRYPTO_block_invoke", v57, v58, v59, *(unsigned __int8 *)(a1 + 72));
  return __quic_stream_process_block_invoke(v60, v61);
}

@end
