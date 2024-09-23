@implementation QUICLog

- (QUICLog)init
{
  QUICLog *v2;
  QUICLog *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *top_level_object;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)QUICLog;
  v2 = -[QUICLog init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->events_list.stqh_first = 0;
    v2->events_list.stqh_last = &v2->events_list.stqh_first;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    top_level_object = v3->top_level_object;
    v3->top_level_object = v4;

    -[NSMutableDictionary setValue:forKey:](v3->top_level_object, "setValue:forKey:", CFSTR("draft-01"), CFSTR("qlog_version"));
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    v6 = _os_log_pack_size();
    v7 = (char *)&v10 - ((MEMORY[0x24BDAC7A8](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "-[QUICLog init]";
    qlog_internal(2, (uint64_t)v7, 164);
  }
  return v3;
}

- (void)dealloc
{
  quiclog_event *i;
  $EA27435415C2D6854D1CF82EA9BC106F *p_events_list;
  NSMutableDictionary *top_level_object;
  quiclog_event *var19;
  objc_super v7;

  p_events_list = &self->events_list;
  for (i = self->events_list.stqh_first; i; i = self->events_list.stqh_first)
  {
    var19 = (quiclog_event *)i->var3.var0.var19;
    p_events_list->stqh_first = var19;
    if (!var19)
      self->events_list.stqh_last = &p_events_list->stqh_first;
    -[QUICLog deallocEvent:](self, "deallocEvent:");
  }
  top_level_object = self->top_level_object;
  self->top_level_object = 0;

  v7.receiver = self;
  v7.super_class = (Class)QUICLog;
  -[QUICLog dealloc](&v7, sel_dealloc);
}

- (void)disableTimestamps:(BOOL)a3
{
  self->disable_timestamps = a3;
}

- (quiclog_event)createEvent:(int)a3
{
  quiclog_event *v3;
  quiclog_event *v6;

  v6 = (quiclog_event *)malloc_type_calloc(1uLL, 0x110uLL, 0xEAFB8F1AuLL);
  if (!v6)
  {
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0x110uLL);
    goto LABEL_7;
  }
  v3 = v6;
  if (!self->disable_timestamps)
  {
    self = (QUICLog *)mach_continuous_time();
    if (timebase_info_once == -1)
    {
LABEL_4:
      v3->var2 = timebase_info_info * (unint64_t)self / dword_253D0A9BC / 0x3E8;
      goto LABEL_5;
    }
LABEL_7:
    dispatch_once(&timebase_info_once, &__block_literal_global_397);
    goto LABEL_4;
  }
LABEL_5:
  v3->var0 = a3;
  return v3;
}

- (void)deallocEvent:(quiclog_event *)a3
{
  packet_header *var2;

  if (a3->var0 <= 6u && ((1 << a3->var0) & 0x46) != 0)
  {
    quic_frame_list_flush((uint64_t)&a3->var3.var0.var2);
    var2 = a3->var3.var1.var2;
    if (var2)
      free(var2);
  }
  free(a3);
}

- (void)parametersSet:(unsigned __int8)a3 resumption_allowed:(char)a4 early_data_enabled:(char)a5 tls_cipher:(const char *)a6 original_dcid:(unsigned __int8 *)(a7 initial_scid:retry_scid:disable_active_migration:max_idle_timeout:max_udp_payload_size:ack_delay_exponent:max_ack_delay:active_cid_limit:initial_max_data:initial_msd_bidi_remote:initial_msd_bidi_local:initial_msd_uni:initial_ms_bidi:initial_ms_uni:preferred_address:
{
  quiclog_event *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  $CF3CFCADD49FFABBD8EB2B3F6C1884D1 v64;
  $CF3CFCADD49FFABBD8EB2B3F6C1884D1 v65;
  $CF3CFCADD49FFABBD8EB2B3F6C1884D1 v66;
  QUICLog *v67;
  SEL v68;
  quic_packet *v69;

  v29 = -[QUICLog createEvent:](self, "createEvent:", 0);
  v29->var3.var0.var12 = a3;
  v29->var3.var0.var9 = a4;
  v29->var3.var0.var10 = a5;
  if (a6)
  {
    v30 = *(unsigned __int8 *)a6;
    v29->var3.var0.var5[0] = v30;
    if (v30)
    {
      v31 = *((unsigned __int8 *)a6 + 1);
      v29->var3.var0.var5[1] = v31;
      if (v31)
      {
        v32 = *((unsigned __int8 *)a6 + 2);
        v29->var3.var0.var5[2] = v32;
        if (v32)
        {
          v33 = *((unsigned __int8 *)a6 + 3);
          v29->var3.var0.var5[3] = v33;
          if (v33)
          {
            v34 = *((unsigned __int8 *)a6 + 4);
            v29->var3.var0.var5[4] = v34;
            if (v34)
            {
              v35 = *((unsigned __int8 *)a6 + 5);
              v29->var3.var0.var5[5] = v35;
              if (v35)
              {
                v36 = *((unsigned __int8 *)a6 + 6);
                v29->var3.var0.var5[6] = v36;
                if (v36)
                {
                  v37 = *((unsigned __int8 *)a6 + 7);
                  v29->var3.var0.var5[7] = v37;
                  if (v37)
                  {
                    v38 = *((unsigned __int8 *)a6 + 8);
                    v29->var3.var0.var5[8] = v38;
                    if (v38)
                    {
                      v39 = *((unsigned __int8 *)a6 + 9);
                      v29->var3.var0.var5[9] = v39;
                      if (v39)
                      {
                        v40 = *((unsigned __int8 *)a6 + 10);
                        v29->var3.var0.var5[10] = v40;
                        if (v40)
                        {
                          v41 = *((unsigned __int8 *)a6 + 11);
                          v29->var3.var0.var5[11] = v41;
                          if (v41)
                          {
                            v42 = *((unsigned __int8 *)a6 + 12);
                            v29->var3.var0.var5[12] = v42;
                            if (v42)
                            {
                              v43 = *((unsigned __int8 *)a6 + 13);
                              v29->var3.var0.var5[13] = v43;
                              if (v43)
                              {
                                v44 = *((unsigned __int8 *)a6 + 14);
                                v29->var3.var0.var5[14] = v44;
                                if (v44)
                                {
                                  v45 = *((unsigned __int8 *)a6 + 15);
                                  v29->var3.var0.var5[15] = v45;
                                  if (v45)
                                  {
                                    v46 = *((unsigned __int8 *)a6 + 16);
                                    v29->var3.var0.var5[16] = v46;
                                    if (v46)
                                    {
                                      v47 = *((unsigned __int8 *)a6 + 17);
                                      v29->var3.var0.var5[17] = v47;
                                      if (v47)
                                      {
                                        v48 = *((unsigned __int8 *)a6 + 18);
                                        v29->var3.var0.var5[18] = v48;
                                        if (v48)
                                        {
                                          v49 = *((unsigned __int8 *)a6 + 19);
                                          v29->var3.var0.var5[19] = v49;
                                          if (v49)
                                          {
                                            v50 = *((unsigned __int8 *)a6 + 20);
                                            v29->var3.var0.var5[20] = v50;
                                            if (v50)
                                            {
                                              v51 = *((unsigned __int8 *)a6 + 21);
                                              v29->var3.var0.var5[21] = v51;
                                              if (v51)
                                              {
                                                v52 = *((unsigned __int8 *)a6 + 22);
                                                v29->var3.var0.var5[22] = v52;
                                                if (v52)
                                                {
                                                  v53 = *((unsigned __int8 *)a6 + 23);
                                                  v29->var3.var0.var5[23] = v53;
                                                  if (v53)
                                                  {
                                                    v54 = *((unsigned __int8 *)a6 + 24);
                                                    v29->var3.var0.var5[24] = v54;
                                                    if (v54)
                                                    {
                                                      v55 = *((unsigned __int8 *)a6 + 25);
                                                      v29->var3.var0.var5[25] = v55;
                                                      if (v55)
                                                      {
                                                        v56 = *((unsigned __int8 *)a6 + 26);
                                                        v29->var3.var0.var5[26] = v56;
                                                        if (v56)
                                                        {
                                                          v57 = *((unsigned __int8 *)a6 + 27);
                                                          v29->var3.var0.var5[27] = v57;
                                                          if (v57)
                                                          {
                                                            v58 = *((unsigned __int8 *)a6 + 28);
                                                            v29->var3.var0.var5[28] = v58;
                                                            if (v58)
                                                            {
                                                              v59 = *((unsigned __int8 *)a6 + 29);
                                                              v29->var3.var0.var5[29] = v59;
                                                              if (v59)
                                                              {
                                                                v60 = *((unsigned __int8 *)a6 + 30);
                                                                v29->var3.var0.var5[30] = v60;
                                                                if (v60)
                                                                  v29->var3.var0.var5[31] = 0;
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (a7)
    {
      v29->var3.var0.var8[0] = (*a7)[0];
      v61 = *(_DWORD *)&(*a7)[17];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 115) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&(*a7)[1];
      *(_DWORD *)((char *)&v29->var3.var5 + 131) = v61;
    }
    if (a8)
    {
      v29->var3.var0.var6[0] = (*a8)[0];
      v62 = *(_DWORD *)&(*a8)[17];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 73) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&(*a8)[1];
      *(_DWORD *)((char *)&v29->var3.var5 + 89) = v62;
    }
    if (a9)
    {
      v29->var3.var0.var7[0] = (*a9)[0];
      v63 = *(_DWORD *)&(*a9)[17];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 94) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&(*a9)[1];
      *(_DWORD *)((char *)&v29->var3.var5 + 110) = v63;
    }
    v29->var3.var0.var11 = a10;
    v29->var3.var0.var0 = a11;
    v29->var3.var0.var1 = a12;
    v29->var3.var0.var2 = a13;
    v29->var3.var0.var4 = a15;
    *((_QWORD *)&v29->var3.var5 + 25) = a16;
    v29->var3.var0.var14 = a18;
    v29->var3.var0.var15 = a17;
    v29->var3.var0.var16 = a19;
    v29->var3.var0.var17 = a20;
    v29->var3.var0.var18 = a21;
    if (a22)
    {
      v64 = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&a22->var0.s_addr;
      v65 = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&a22->var2 + 8);
      v66 = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&a22->var4[6];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 184) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&a22->var4[19];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 171) = v66;
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 155) = v65;
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 139) = v64;
    }
    v29->var3.var0.var19 = 0;
    *self->events_list.stqh_last = v29;
    self->events_list.stqh_last = (quiclog_event **)&v29->var3.var0.var19;
  }
  else
  {
    qlog_abort_internal("%s strict_strlcpy called with NULL src", "_strict_strlcpy");
    -[QUICLog packetSent:](v67, v68, v69);
  }
}

- (void)packetSent:(quic_packet *)a3
{
  quiclog_event *v5;
  _QWORD *v6;
  _BYTE *var1;
  unint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  _BYTE *v54;
  _BYTE *v55;
  int v56;
  unsigned __int8 *v57;
  unsigned __int8 *v58;
  unsigned int v59;
  uint64_t v60;
  unsigned __int8 *v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  _BYTE *v103;
  quic_frame *i;
  char *v105;
  char *v106;
  quic_frame **v107;
  uint64_t j;

  v5 = -[QUICLog createEvent:](self, "createEvent:", 1);
  v5->var3.var1.var0 = +[QUICLog packetType:](QUICLog, "packetType:", a3);
  v6 = malloc_type_calloc(1uLL, 0x78uLL, 0xEAFB8F1AuLL);
  if (!v6)
    goto LABEL_118;
  v5->var3.var0.var1 = (unint64_t)v6;
  *v6 = a3->var20;
  *(_QWORD *)(v5->var3.var0.var1 + 8) = a3->var14;
  *(_QWORD *)(v5->var3.var0.var1 + 16) = a3->var13;
  *(_BYTE *)(v5->var3.var0.var1 + 32) = a3->var6[0];
  *(_BYTE *)(v5->var3.var0.var1 + 33) = a3->var5[0];
  var1 = (_BYTE *)v5->var3.var0.var1;
  v8 = 0x253D0A000uLL;
  if (quic_cid_describe_state % 3 == 2)
    v9 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  else
    v9 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3)
    v10 = v9;
  else
    v10 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  ++quic_cid_describe_state;
  if (a3->var6[0] >= 0x14u)
    v11 = 20;
  else
    v11 = a3->var6[0];
  *(_OWORD *)(v10 + 25) = 0u;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  if ((_DWORD)v11)
  {
    v12 = &a3->var6[1];
    do
    {
      v13 = *v12++;
      snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v13);
      --v11;
    }
    while (v11);
    v14 = *v10;
    var1[34] = v14;
    v8 = 0x253D0A000;
    if (!v14)
      goto LABEL_57;
    v15 = v10[1];
    var1[35] = v15;
    if (!v15)
      goto LABEL_57;
    v16 = v10[2];
    var1[36] = v16;
    if (!v16)
      goto LABEL_57;
    v17 = v10[3];
    var1[37] = v17;
    if (!v17)
      goto LABEL_57;
    v18 = v10[4];
    var1[38] = v18;
    if (!v18)
      goto LABEL_57;
    v19 = v10[5];
    var1[39] = v19;
    if (!v19)
      goto LABEL_57;
    v20 = v10[6];
    var1[40] = v20;
    if (!v20)
      goto LABEL_57;
    v21 = v10[7];
    var1[41] = v21;
    if (!v21)
      goto LABEL_57;
    v22 = v10[8];
    var1[42] = v22;
    if (!v22)
      goto LABEL_57;
    v23 = v10[9];
    var1[43] = v23;
    if (!v23)
      goto LABEL_57;
    v24 = v10[10];
    var1[44] = v24;
    if (!v24)
      goto LABEL_57;
    v25 = v10[11];
    var1[45] = v25;
    if (!v25)
      goto LABEL_57;
    v26 = v10[12];
    var1[46] = v26;
    if (!v26)
      goto LABEL_57;
    v27 = v10[13];
    var1[47] = v27;
    if (!v27)
      goto LABEL_57;
    v28 = v10[14];
    var1[48] = v28;
    if (!v28)
      goto LABEL_57;
    v29 = v10[15];
    var1[49] = v29;
    if (!v29)
      goto LABEL_57;
    v30 = v10[16];
    var1[50] = v30;
    if (!v30)
      goto LABEL_57;
    v31 = v10[17];
    var1[51] = v31;
    if (!v31)
      goto LABEL_57;
    v32 = v10[18];
    var1[52] = v32;
    if (!v32)
      goto LABEL_57;
    v33 = v10[19];
    var1[53] = v33;
    if (!v33)
      goto LABEL_57;
    v34 = v10[20];
    var1[54] = v34;
    if (!v34)
      goto LABEL_57;
    v35 = v10[21];
    var1[55] = v35;
    if (!v35)
      goto LABEL_57;
    v36 = v10[22];
    var1[56] = v36;
    if (!v36)
      goto LABEL_57;
    v37 = v10[23];
    var1[57] = v37;
    if (!v37)
      goto LABEL_57;
    v38 = v10[24];
    var1[58] = v38;
    if (!v38)
      goto LABEL_57;
    v39 = v10[25];
    var1[59] = v39;
    if (!v39)
      goto LABEL_57;
    v40 = v10[26];
    var1[60] = v40;
    if (!v40)
      goto LABEL_57;
    v41 = v10[27];
    var1[61] = v41;
    if (!v41)
      goto LABEL_57;
    v42 = v10[28];
    var1[62] = v42;
    if (!v42)
      goto LABEL_57;
    v43 = v10[29];
    var1[63] = v43;
    if (!v43)
      goto LABEL_57;
    v44 = v10[30];
    var1[64] = v44;
    if (!v44)
      goto LABEL_57;
    v45 = v10[31];
    var1[65] = v45;
    if (!v45)
      goto LABEL_57;
    v46 = v10[32];
    var1[66] = v46;
    if (!v46)
      goto LABEL_57;
    v47 = v10[33];
    var1[67] = v47;
    if (!v47)
      goto LABEL_57;
    v48 = v10[34];
    var1[68] = v48;
    if (!v48)
      goto LABEL_57;
    v49 = v10[35];
    var1[69] = v49;
    if (!v49)
      goto LABEL_57;
    v50 = v10[36];
    var1[70] = v50;
    if (!v50)
      goto LABEL_57;
    v51 = v10[37];
    var1[71] = v51;
    if (!v51)
      goto LABEL_57;
    v52 = v10[38];
    var1[72] = v52;
    if (!v52)
      goto LABEL_57;
    v53 = v10[39];
    var1[73] = v53;
    if (!v53)
      goto LABEL_57;
    v54 = var1 + 74;
  }
  else
  {
    v54 = var1 + 34;
  }
  *v54 = 0;
LABEL_57:
  v55 = (_BYTE *)v5->var3.var0.var1;
  v56 = *(_DWORD *)(v8 + 3012);
  if (v56 % 3 == 2)
    v57 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  else
    v57 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  if (v56 % 3)
    v58 = v57;
  else
    v58 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  *(_DWORD *)(v8 + 3012) = v56 + 1;
  v59 = a3->var5[0];
  *(_OWORD *)(v58 + 25) = 0u;
  if (v59 >= 0x14)
    v60 = 20;
  else
    v60 = v59;
  *(_OWORD *)v58 = 0uLL;
  *((_OWORD *)v58 + 1) = 0uLL;
  if (!(_DWORD)v60)
  {
    v103 = v55 + 75;
    goto LABEL_111;
  }
  v61 = &a3->var5[1];
  do
  {
    v62 = *v61++;
    snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v62);
    --v60;
  }
  while (v60);
  v63 = *v58;
  v55[75] = v63;
  if (v63)
  {
    v64 = v58[1];
    v55[76] = v64;
    if (v64)
    {
      v65 = v58[2];
      v55[77] = v65;
      if (v65)
      {
        v66 = v58[3];
        v55[78] = v66;
        if (v66)
        {
          v67 = v58[4];
          v55[79] = v67;
          if (v67)
          {
            v68 = v58[5];
            v55[80] = v68;
            if (v68)
            {
              v69 = v58[6];
              v55[81] = v69;
              if (v69)
              {
                v70 = v58[7];
                v55[82] = v70;
                if (v70)
                {
                  v71 = v58[8];
                  v55[83] = v71;
                  if (v71)
                  {
                    v72 = v58[9];
                    v55[84] = v72;
                    if (v72)
                    {
                      v73 = v58[10];
                      v55[85] = v73;
                      if (v73)
                      {
                        v74 = v58[11];
                        v55[86] = v74;
                        if (v74)
                        {
                          v75 = v58[12];
                          v55[87] = v75;
                          if (v75)
                          {
                            v76 = v58[13];
                            v55[88] = v76;
                            if (v76)
                            {
                              v77 = v58[14];
                              v55[89] = v77;
                              if (v77)
                              {
                                v78 = v58[15];
                                v55[90] = v78;
                                if (v78)
                                {
                                  v79 = v58[16];
                                  v55[91] = v79;
                                  if (v79)
                                  {
                                    v80 = v58[17];
                                    v55[92] = v80;
                                    if (v80)
                                    {
                                      v81 = v58[18];
                                      v55[93] = v81;
                                      if (v81)
                                      {
                                        v82 = v58[19];
                                        v55[94] = v82;
                                        if (v82)
                                        {
                                          v83 = v58[20];
                                          v55[95] = v83;
                                          if (v83)
                                          {
                                            v84 = v58[21];
                                            v55[96] = v84;
                                            if (v84)
                                            {
                                              v85 = v58[22];
                                              v55[97] = v85;
                                              if (v85)
                                              {
                                                v86 = v58[23];
                                                v55[98] = v86;
                                                if (v86)
                                                {
                                                  v87 = v58[24];
                                                  v55[99] = v87;
                                                  if (v87)
                                                  {
                                                    v88 = v58[25];
                                                    v55[100] = v88;
                                                    if (v88)
                                                    {
                                                      v89 = v58[26];
                                                      v55[101] = v89;
                                                      if (v89)
                                                      {
                                                        v90 = v58[27];
                                                        v55[102] = v90;
                                                        if (v90)
                                                        {
                                                          v91 = v58[28];
                                                          v55[103] = v91;
                                                          if (v91)
                                                          {
                                                            v92 = v58[29];
                                                            v55[104] = v92;
                                                            if (v92)
                                                            {
                                                              v93 = v58[30];
                                                              v55[105] = v93;
                                                              if (v93)
                                                              {
                                                                v94 = v58[31];
                                                                v55[106] = v94;
                                                                if (v94)
                                                                {
                                                                  v95 = v58[32];
                                                                  v55[107] = v95;
                                                                  if (v95)
                                                                  {
                                                                    v96 = v58[33];
                                                                    v55[108] = v96;
                                                                    if (v96)
                                                                    {
                                                                      v97 = v58[34];
                                                                      v55[109] = v97;
                                                                      if (v97)
                                                                      {
                                                                        v98 = v58[35];
                                                                        v55[110] = v98;
                                                                        if (v98)
                                                                        {
                                                                          v99 = v58[36];
                                                                          v55[111] = v99;
                                                                          if (v99)
                                                                          {
                                                                            v100 = v58[37];
                                                                            v55[112] = v100;
                                                                            if (v100)
                                                                            {
                                                                              v101 = v58[38];
                                                                              v55[113] = v101;
                                                                              if (v101)
                                                                              {
                                                                                v102 = v58[39];
                                                                                v55[114] = v102;
                                                                                if (v102)
                                                                                {
                                                                                  v103 = v55 + 115;
LABEL_111:
                                                                                  *v103 = 0;
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v5->var3.var0.var2 = 0;
  v5->var3.var0.var3 = (unint64_t)&v5->var3.var0.var2;
  for (i = a3->var25.var0; i; i = (quic_frame *)*((_QWORD *)i + 12))
  {
    v105 = (char *)malloc_type_calloc(1uLL, 0x80uLL, 0xEAFB8F1AuLL);
    if (!v105)
    {
      for (j = 128; ; j = 120)
      {
        qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, j);
LABEL_118:
        ;
      }
    }
    v106 = v105;
    quic_frame_copy_metadata(v105, (const void **)i);
    *((_QWORD *)v106 + 12) = 0;
    v107 = v5->var3.var1.var3.var1;
    *((_QWORD *)v106 + 13) = v107;
    *v107 = (quic_frame *)v106;
    v5->var3.var0.var3 = (unint64_t)(v106 + 96);
  }
  v5->var3.var1.var4 = -1;
  v5->var3.var1.var6.var0 = 5;
  v5->var3.var0.var19 = 0;
  *self->events_list.stqh_last = v5;
  self->events_list.stqh_last = (quiclog_event **)&v5->var3.var0.var19;
}

- (void)packetReceived:(quic_packet *)a3 isCoalesced:(BOOL)a4
{
  quiclog_event *v7;
  _QWORD *v8;
  _BYTE *var1;
  unint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  _BYTE *v56;
  _BYTE *v57;
  int v58;
  unsigned __int8 *v59;
  unsigned __int8 *v60;
  unsigned int v61;
  uint64_t v62;
  unsigned __int8 *v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  _BYTE *v105;
  quic_frame *i;
  char *v107;
  char *v108;
  quic_frame **v109;
  uint64_t j;

  v7 = -[QUICLog createEvent:](self, "createEvent:", 2);
  v7->var3.var1.var0 = +[QUICLog packetType:](QUICLog, "packetType:", a3);
  v8 = malloc_type_calloc(1uLL, 0x78uLL, 0xEAFB8F1AuLL);
  if (!v8)
    goto LABEL_118;
  v7->var3.var0.var1 = (unint64_t)v8;
  *v8 = a3->var20;
  *(_QWORD *)(v7->var3.var0.var1 + 8) = a3->var14;
  *(_QWORD *)(v7->var3.var0.var1 + 16) = a3->var13;
  *(_BYTE *)(v7->var3.var0.var1 + 32) = a3->var6[0];
  *(_BYTE *)(v7->var3.var0.var1 + 33) = a3->var5[0];
  var1 = (_BYTE *)v7->var3.var0.var1;
  v10 = 0x253D0A000uLL;
  if (quic_cid_describe_state % 3 == 2)
    v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  else
    v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3)
    v12 = v11;
  else
    v12 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  ++quic_cid_describe_state;
  if (a3->var6[0] >= 0x14u)
    v13 = 20;
  else
    v13 = a3->var6[0];
  *(_OWORD *)(v12 + 25) = 0u;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  if ((_DWORD)v13)
  {
    v14 = &a3->var6[1];
    do
    {
      v15 = *v14++;
      snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v15);
      --v13;
    }
    while (v13);
    v16 = *v12;
    var1[34] = v16;
    v10 = 0x253D0A000;
    if (!v16)
      goto LABEL_57;
    v17 = v12[1];
    var1[35] = v17;
    if (!v17)
      goto LABEL_57;
    v18 = v12[2];
    var1[36] = v18;
    if (!v18)
      goto LABEL_57;
    v19 = v12[3];
    var1[37] = v19;
    if (!v19)
      goto LABEL_57;
    v20 = v12[4];
    var1[38] = v20;
    if (!v20)
      goto LABEL_57;
    v21 = v12[5];
    var1[39] = v21;
    if (!v21)
      goto LABEL_57;
    v22 = v12[6];
    var1[40] = v22;
    if (!v22)
      goto LABEL_57;
    v23 = v12[7];
    var1[41] = v23;
    if (!v23)
      goto LABEL_57;
    v24 = v12[8];
    var1[42] = v24;
    if (!v24)
      goto LABEL_57;
    v25 = v12[9];
    var1[43] = v25;
    if (!v25)
      goto LABEL_57;
    v26 = v12[10];
    var1[44] = v26;
    if (!v26)
      goto LABEL_57;
    v27 = v12[11];
    var1[45] = v27;
    if (!v27)
      goto LABEL_57;
    v28 = v12[12];
    var1[46] = v28;
    if (!v28)
      goto LABEL_57;
    v29 = v12[13];
    var1[47] = v29;
    if (!v29)
      goto LABEL_57;
    v30 = v12[14];
    var1[48] = v30;
    if (!v30)
      goto LABEL_57;
    v31 = v12[15];
    var1[49] = v31;
    if (!v31)
      goto LABEL_57;
    v32 = v12[16];
    var1[50] = v32;
    if (!v32)
      goto LABEL_57;
    v33 = v12[17];
    var1[51] = v33;
    if (!v33)
      goto LABEL_57;
    v34 = v12[18];
    var1[52] = v34;
    if (!v34)
      goto LABEL_57;
    v35 = v12[19];
    var1[53] = v35;
    if (!v35)
      goto LABEL_57;
    v36 = v12[20];
    var1[54] = v36;
    if (!v36)
      goto LABEL_57;
    v37 = v12[21];
    var1[55] = v37;
    if (!v37)
      goto LABEL_57;
    v38 = v12[22];
    var1[56] = v38;
    if (!v38)
      goto LABEL_57;
    v39 = v12[23];
    var1[57] = v39;
    if (!v39)
      goto LABEL_57;
    v40 = v12[24];
    var1[58] = v40;
    if (!v40)
      goto LABEL_57;
    v41 = v12[25];
    var1[59] = v41;
    if (!v41)
      goto LABEL_57;
    v42 = v12[26];
    var1[60] = v42;
    if (!v42)
      goto LABEL_57;
    v43 = v12[27];
    var1[61] = v43;
    if (!v43)
      goto LABEL_57;
    v44 = v12[28];
    var1[62] = v44;
    if (!v44)
      goto LABEL_57;
    v45 = v12[29];
    var1[63] = v45;
    if (!v45)
      goto LABEL_57;
    v46 = v12[30];
    var1[64] = v46;
    if (!v46)
      goto LABEL_57;
    v47 = v12[31];
    var1[65] = v47;
    if (!v47)
      goto LABEL_57;
    v48 = v12[32];
    var1[66] = v48;
    if (!v48)
      goto LABEL_57;
    v49 = v12[33];
    var1[67] = v49;
    if (!v49)
      goto LABEL_57;
    v50 = v12[34];
    var1[68] = v50;
    if (!v50)
      goto LABEL_57;
    v51 = v12[35];
    var1[69] = v51;
    if (!v51)
      goto LABEL_57;
    v52 = v12[36];
    var1[70] = v52;
    if (!v52)
      goto LABEL_57;
    v53 = v12[37];
    var1[71] = v53;
    if (!v53)
      goto LABEL_57;
    v54 = v12[38];
    var1[72] = v54;
    if (!v54)
      goto LABEL_57;
    v55 = v12[39];
    var1[73] = v55;
    if (!v55)
      goto LABEL_57;
    v56 = var1 + 74;
  }
  else
  {
    v56 = var1 + 34;
  }
  *v56 = 0;
LABEL_57:
  v57 = (_BYTE *)v7->var3.var0.var1;
  v58 = *(_DWORD *)(v10 + 3012);
  if (v58 % 3 == 2)
    v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  else
    v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  if (v58 % 3)
    v60 = v59;
  else
    v60 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  *(_DWORD *)(v10 + 3012) = v58 + 1;
  v61 = a3->var5[0];
  *(_OWORD *)(v60 + 25) = 0u;
  if (v61 >= 0x14)
    v62 = 20;
  else
    v62 = v61;
  *(_OWORD *)v60 = 0uLL;
  *((_OWORD *)v60 + 1) = 0uLL;
  if (!(_DWORD)v62)
  {
    v105 = v57 + 75;
    goto LABEL_111;
  }
  v63 = &a3->var5[1];
  do
  {
    v64 = *v63++;
    snprintf((char *)v60, 0x29uLL, "%s%02x", (const char *)v60, v64);
    --v62;
  }
  while (v62);
  v65 = *v60;
  v57[75] = v65;
  if (v65)
  {
    v66 = v60[1];
    v57[76] = v66;
    if (v66)
    {
      v67 = v60[2];
      v57[77] = v67;
      if (v67)
      {
        v68 = v60[3];
        v57[78] = v68;
        if (v68)
        {
          v69 = v60[4];
          v57[79] = v69;
          if (v69)
          {
            v70 = v60[5];
            v57[80] = v70;
            if (v70)
            {
              v71 = v60[6];
              v57[81] = v71;
              if (v71)
              {
                v72 = v60[7];
                v57[82] = v72;
                if (v72)
                {
                  v73 = v60[8];
                  v57[83] = v73;
                  if (v73)
                  {
                    v74 = v60[9];
                    v57[84] = v74;
                    if (v74)
                    {
                      v75 = v60[10];
                      v57[85] = v75;
                      if (v75)
                      {
                        v76 = v60[11];
                        v57[86] = v76;
                        if (v76)
                        {
                          v77 = v60[12];
                          v57[87] = v77;
                          if (v77)
                          {
                            v78 = v60[13];
                            v57[88] = v78;
                            if (v78)
                            {
                              v79 = v60[14];
                              v57[89] = v79;
                              if (v79)
                              {
                                v80 = v60[15];
                                v57[90] = v80;
                                if (v80)
                                {
                                  v81 = v60[16];
                                  v57[91] = v81;
                                  if (v81)
                                  {
                                    v82 = v60[17];
                                    v57[92] = v82;
                                    if (v82)
                                    {
                                      v83 = v60[18];
                                      v57[93] = v83;
                                      if (v83)
                                      {
                                        v84 = v60[19];
                                        v57[94] = v84;
                                        if (v84)
                                        {
                                          v85 = v60[20];
                                          v57[95] = v85;
                                          if (v85)
                                          {
                                            v86 = v60[21];
                                            v57[96] = v86;
                                            if (v86)
                                            {
                                              v87 = v60[22];
                                              v57[97] = v87;
                                              if (v87)
                                              {
                                                v88 = v60[23];
                                                v57[98] = v88;
                                                if (v88)
                                                {
                                                  v89 = v60[24];
                                                  v57[99] = v89;
                                                  if (v89)
                                                  {
                                                    v90 = v60[25];
                                                    v57[100] = v90;
                                                    if (v90)
                                                    {
                                                      v91 = v60[26];
                                                      v57[101] = v91;
                                                      if (v91)
                                                      {
                                                        v92 = v60[27];
                                                        v57[102] = v92;
                                                        if (v92)
                                                        {
                                                          v93 = v60[28];
                                                          v57[103] = v93;
                                                          if (v93)
                                                          {
                                                            v94 = v60[29];
                                                            v57[104] = v94;
                                                            if (v94)
                                                            {
                                                              v95 = v60[30];
                                                              v57[105] = v95;
                                                              if (v95)
                                                              {
                                                                v96 = v60[31];
                                                                v57[106] = v96;
                                                                if (v96)
                                                                {
                                                                  v97 = v60[32];
                                                                  v57[107] = v97;
                                                                  if (v97)
                                                                  {
                                                                    v98 = v60[33];
                                                                    v57[108] = v98;
                                                                    if (v98)
                                                                    {
                                                                      v99 = v60[34];
                                                                      v57[109] = v99;
                                                                      if (v99)
                                                                      {
                                                                        v100 = v60[35];
                                                                        v57[110] = v100;
                                                                        if (v100)
                                                                        {
                                                                          v101 = v60[36];
                                                                          v57[111] = v101;
                                                                          if (v101)
                                                                          {
                                                                            v102 = v60[37];
                                                                            v57[112] = v102;
                                                                            if (v102)
                                                                            {
                                                                              v103 = v60[38];
                                                                              v57[113] = v103;
                                                                              if (v103)
                                                                              {
                                                                                v104 = v60[39];
                                                                                v57[114] = v104;
                                                                                if (v104)
                                                                                {
                                                                                  v105 = v57 + 115;
LABEL_111:
                                                                                  *v105 = 0;
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v7->var3.var0.var2 = 0;
  v7->var3.var0.var3 = (unint64_t)&v7->var3.var0.var2;
  for (i = a3->var25.var0; i; i = (quic_frame *)*((_QWORD *)i + 12))
  {
    v107 = (char *)malloc_type_calloc(1uLL, 0x80uLL, 0xEAFB8F1AuLL);
    if (!v107)
    {
      for (j = 128; ; j = 120)
      {
        qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, j);
LABEL_118:
        ;
      }
    }
    v108 = v107;
    quic_frame_copy_metadata(v107, (const void **)i);
    *((_QWORD *)v108 + 12) = 0;
    v109 = v7->var3.var1.var3.var1;
    *((_QWORD *)v108 + 13) = v109;
    *v109 = (quic_frame *)v108;
    v7->var3.var0.var3 = (unint64_t)(v108 + 96);
  }
  v7->var3.var1.var4 = a4;
  v7->var3.var1.var6.var0 = 5;
  v7->var3.var0.var19 = 0;
  *self->events_list.stqh_last = v7;
  self->events_list.stqh_last = (quiclog_event **)&v7->var3.var0.var19;
}

- (void)packetLost:(quic_packet *)a3 trigger:(unsigned __int8)a4
{
  quiclog_event *v7;
  _QWORD *v8;
  _BYTE *var1;
  unint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  _BYTE *v56;
  _BYTE *v57;
  int v58;
  unsigned __int8 *v59;
  unsigned __int8 *v60;
  unsigned int v61;
  uint64_t v62;
  unsigned __int8 *v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  _BYTE *v105;
  quic_frame *i;
  char *v107;
  char *v108;
  quic_frame **v109;
  uint64_t j;

  v7 = -[QUICLog createEvent:](self, "createEvent:", 6);
  v7->var3.var1.var0 = +[QUICLog packetType:](QUICLog, "packetType:", a3);
  v8 = malloc_type_calloc(1uLL, 0x78uLL, 0xEAFB8F1AuLL);
  if (!v8)
    goto LABEL_118;
  v7->var3.var0.var1 = (unint64_t)v8;
  *v8 = a3->var20;
  *(_QWORD *)(v7->var3.var0.var1 + 8) = a3->var14;
  *(_QWORD *)(v7->var3.var0.var1 + 16) = a3->var13;
  *(_BYTE *)(v7->var3.var0.var1 + 32) = a3->var6[0];
  *(_BYTE *)(v7->var3.var0.var1 + 33) = a3->var5[0];
  var1 = (_BYTE *)v7->var3.var0.var1;
  v10 = 0x253D0A000uLL;
  if (quic_cid_describe_state % 3 == 2)
    v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  else
    v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3)
    v12 = v11;
  else
    v12 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  ++quic_cid_describe_state;
  if (a3->var6[0] >= 0x14u)
    v13 = 20;
  else
    v13 = a3->var6[0];
  *(_OWORD *)(v12 + 25) = 0u;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  if ((_DWORD)v13)
  {
    v14 = &a3->var6[1];
    do
    {
      v15 = *v14++;
      snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v15);
      --v13;
    }
    while (v13);
    v16 = *v12;
    var1[34] = v16;
    v10 = 0x253D0A000;
    if (!v16)
      goto LABEL_57;
    v17 = v12[1];
    var1[35] = v17;
    if (!v17)
      goto LABEL_57;
    v18 = v12[2];
    var1[36] = v18;
    if (!v18)
      goto LABEL_57;
    v19 = v12[3];
    var1[37] = v19;
    if (!v19)
      goto LABEL_57;
    v20 = v12[4];
    var1[38] = v20;
    if (!v20)
      goto LABEL_57;
    v21 = v12[5];
    var1[39] = v21;
    if (!v21)
      goto LABEL_57;
    v22 = v12[6];
    var1[40] = v22;
    if (!v22)
      goto LABEL_57;
    v23 = v12[7];
    var1[41] = v23;
    if (!v23)
      goto LABEL_57;
    v24 = v12[8];
    var1[42] = v24;
    if (!v24)
      goto LABEL_57;
    v25 = v12[9];
    var1[43] = v25;
    if (!v25)
      goto LABEL_57;
    v26 = v12[10];
    var1[44] = v26;
    if (!v26)
      goto LABEL_57;
    v27 = v12[11];
    var1[45] = v27;
    if (!v27)
      goto LABEL_57;
    v28 = v12[12];
    var1[46] = v28;
    if (!v28)
      goto LABEL_57;
    v29 = v12[13];
    var1[47] = v29;
    if (!v29)
      goto LABEL_57;
    v30 = v12[14];
    var1[48] = v30;
    if (!v30)
      goto LABEL_57;
    v31 = v12[15];
    var1[49] = v31;
    if (!v31)
      goto LABEL_57;
    v32 = v12[16];
    var1[50] = v32;
    if (!v32)
      goto LABEL_57;
    v33 = v12[17];
    var1[51] = v33;
    if (!v33)
      goto LABEL_57;
    v34 = v12[18];
    var1[52] = v34;
    if (!v34)
      goto LABEL_57;
    v35 = v12[19];
    var1[53] = v35;
    if (!v35)
      goto LABEL_57;
    v36 = v12[20];
    var1[54] = v36;
    if (!v36)
      goto LABEL_57;
    v37 = v12[21];
    var1[55] = v37;
    if (!v37)
      goto LABEL_57;
    v38 = v12[22];
    var1[56] = v38;
    if (!v38)
      goto LABEL_57;
    v39 = v12[23];
    var1[57] = v39;
    if (!v39)
      goto LABEL_57;
    v40 = v12[24];
    var1[58] = v40;
    if (!v40)
      goto LABEL_57;
    v41 = v12[25];
    var1[59] = v41;
    if (!v41)
      goto LABEL_57;
    v42 = v12[26];
    var1[60] = v42;
    if (!v42)
      goto LABEL_57;
    v43 = v12[27];
    var1[61] = v43;
    if (!v43)
      goto LABEL_57;
    v44 = v12[28];
    var1[62] = v44;
    if (!v44)
      goto LABEL_57;
    v45 = v12[29];
    var1[63] = v45;
    if (!v45)
      goto LABEL_57;
    v46 = v12[30];
    var1[64] = v46;
    if (!v46)
      goto LABEL_57;
    v47 = v12[31];
    var1[65] = v47;
    if (!v47)
      goto LABEL_57;
    v48 = v12[32];
    var1[66] = v48;
    if (!v48)
      goto LABEL_57;
    v49 = v12[33];
    var1[67] = v49;
    if (!v49)
      goto LABEL_57;
    v50 = v12[34];
    var1[68] = v50;
    if (!v50)
      goto LABEL_57;
    v51 = v12[35];
    var1[69] = v51;
    if (!v51)
      goto LABEL_57;
    v52 = v12[36];
    var1[70] = v52;
    if (!v52)
      goto LABEL_57;
    v53 = v12[37];
    var1[71] = v53;
    if (!v53)
      goto LABEL_57;
    v54 = v12[38];
    var1[72] = v54;
    if (!v54)
      goto LABEL_57;
    v55 = v12[39];
    var1[73] = v55;
    if (!v55)
      goto LABEL_57;
    v56 = var1 + 74;
  }
  else
  {
    v56 = var1 + 34;
  }
  *v56 = 0;
LABEL_57:
  v57 = (_BYTE *)v7->var3.var0.var1;
  v58 = *(_DWORD *)(v10 + 3012);
  if (v58 % 3 == 2)
    v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  else
    v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  if (v58 % 3)
    v60 = v59;
  else
    v60 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  *(_DWORD *)(v10 + 3012) = v58 + 1;
  v61 = a3->var5[0];
  *(_OWORD *)(v60 + 25) = 0u;
  if (v61 >= 0x14)
    v62 = 20;
  else
    v62 = v61;
  *(_OWORD *)v60 = 0uLL;
  *((_OWORD *)v60 + 1) = 0uLL;
  if (!(_DWORD)v62)
  {
    v105 = v57 + 75;
    goto LABEL_111;
  }
  v63 = &a3->var5[1];
  do
  {
    v64 = *v63++;
    snprintf((char *)v60, 0x29uLL, "%s%02x", (const char *)v60, v64);
    --v62;
  }
  while (v62);
  v65 = *v60;
  v57[75] = v65;
  if (v65)
  {
    v66 = v60[1];
    v57[76] = v66;
    if (v66)
    {
      v67 = v60[2];
      v57[77] = v67;
      if (v67)
      {
        v68 = v60[3];
        v57[78] = v68;
        if (v68)
        {
          v69 = v60[4];
          v57[79] = v69;
          if (v69)
          {
            v70 = v60[5];
            v57[80] = v70;
            if (v70)
            {
              v71 = v60[6];
              v57[81] = v71;
              if (v71)
              {
                v72 = v60[7];
                v57[82] = v72;
                if (v72)
                {
                  v73 = v60[8];
                  v57[83] = v73;
                  if (v73)
                  {
                    v74 = v60[9];
                    v57[84] = v74;
                    if (v74)
                    {
                      v75 = v60[10];
                      v57[85] = v75;
                      if (v75)
                      {
                        v76 = v60[11];
                        v57[86] = v76;
                        if (v76)
                        {
                          v77 = v60[12];
                          v57[87] = v77;
                          if (v77)
                          {
                            v78 = v60[13];
                            v57[88] = v78;
                            if (v78)
                            {
                              v79 = v60[14];
                              v57[89] = v79;
                              if (v79)
                              {
                                v80 = v60[15];
                                v57[90] = v80;
                                if (v80)
                                {
                                  v81 = v60[16];
                                  v57[91] = v81;
                                  if (v81)
                                  {
                                    v82 = v60[17];
                                    v57[92] = v82;
                                    if (v82)
                                    {
                                      v83 = v60[18];
                                      v57[93] = v83;
                                      if (v83)
                                      {
                                        v84 = v60[19];
                                        v57[94] = v84;
                                        if (v84)
                                        {
                                          v85 = v60[20];
                                          v57[95] = v85;
                                          if (v85)
                                          {
                                            v86 = v60[21];
                                            v57[96] = v86;
                                            if (v86)
                                            {
                                              v87 = v60[22];
                                              v57[97] = v87;
                                              if (v87)
                                              {
                                                v88 = v60[23];
                                                v57[98] = v88;
                                                if (v88)
                                                {
                                                  v89 = v60[24];
                                                  v57[99] = v89;
                                                  if (v89)
                                                  {
                                                    v90 = v60[25];
                                                    v57[100] = v90;
                                                    if (v90)
                                                    {
                                                      v91 = v60[26];
                                                      v57[101] = v91;
                                                      if (v91)
                                                      {
                                                        v92 = v60[27];
                                                        v57[102] = v92;
                                                        if (v92)
                                                        {
                                                          v93 = v60[28];
                                                          v57[103] = v93;
                                                          if (v93)
                                                          {
                                                            v94 = v60[29];
                                                            v57[104] = v94;
                                                            if (v94)
                                                            {
                                                              v95 = v60[30];
                                                              v57[105] = v95;
                                                              if (v95)
                                                              {
                                                                v96 = v60[31];
                                                                v57[106] = v96;
                                                                if (v96)
                                                                {
                                                                  v97 = v60[32];
                                                                  v57[107] = v97;
                                                                  if (v97)
                                                                  {
                                                                    v98 = v60[33];
                                                                    v57[108] = v98;
                                                                    if (v98)
                                                                    {
                                                                      v99 = v60[34];
                                                                      v57[109] = v99;
                                                                      if (v99)
                                                                      {
                                                                        v100 = v60[35];
                                                                        v57[110] = v100;
                                                                        if (v100)
                                                                        {
                                                                          v101 = v60[36];
                                                                          v57[111] = v101;
                                                                          if (v101)
                                                                          {
                                                                            v102 = v60[37];
                                                                            v57[112] = v102;
                                                                            if (v102)
                                                                            {
                                                                              v103 = v60[38];
                                                                              v57[113] = v103;
                                                                              if (v103)
                                                                              {
                                                                                v104 = v60[39];
                                                                                v57[114] = v104;
                                                                                if (v104)
                                                                                {
                                                                                  v105 = v57 + 115;
LABEL_111:
                                                                                  *v105 = 0;
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v7->var3.var0.var2 = 0;
  v7->var3.var0.var3 = (unint64_t)&v7->var3.var0.var2;
  for (i = a3->var25.var0; i; i = (quic_frame *)*((_QWORD *)i + 12))
  {
    v107 = (char *)malloc_type_calloc(1uLL, 0x80uLL, 0xEAFB8F1AuLL);
    if (!v107)
    {
      for (j = 128; ; j = 120)
      {
        qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, j);
LABEL_118:
        ;
      }
    }
    v108 = v107;
    quic_frame_copy_metadata(v107, (const void **)i);
    *((_QWORD *)v108 + 12) = 0;
    v109 = v7->var3.var1.var3.var1;
    *((_QWORD *)v108 + 13) = v109;
    *v109 = (quic_frame *)v108;
    v7->var3.var0.var3 = (unint64_t)(v108 + 96);
  }
  v7->var3.var1.var4 = -1;
  v7->var3.var1.var6.var1 = a4;
  v7->var3.var0.var19 = 0;
  *self->events_list.stqh_last = v7;
  self->events_list.stqh_last = (quiclog_event **)&v7->var3.var0.var19;
}

- (void)metricsUpdated:(unint64_t)a3 smoothed_rtt:(unint64_t)a4 latest_rtt:(unint64_t)a5 rtt_variance:(unint64_t)a6 pto_count:(unint64_t)a7 congestion_window:(unint64_t)a8 bytes_in_flight:(unint64_t)a9 ssthresh:(unint64_t)a10 packets_in_flight:(unint64_t)a11 in_recovery:(char)a12
{
  quiclog_event *v19;

  v19 = -[QUICLog createEvent:](self, "createEvent:", 4);
  v19->var3.var0.var0 = a3;
  v19->var3.var0.var1 = a4;
  v19->var3.var0.var2 = a5;
  v19->var3.var0.var3 = a6;
  v19->var3.var0.var4 = a7;
  v19->var3.var3.var5 = a8;
  *((_OWORD *)&v19->var3.var5 + 3) = *(_OWORD *)&a9;
  v19->var3.var3.var8 = a11;
  v19->var3.var0.var6[0] = a12;
  v19->var3.var0.var19 = 0;
  *self->events_list.stqh_last = v19;
  self->events_list.stqh_last = (quiclog_event **)&v19->var3.var0.var19;
}

- (void)streamStateUpdated:(unint64_t)a3 stream_type:(unsigned __int8)a4 old_state:(unsigned __int8)a5 new_state:(unsigned __int8)a6 stream_side:(unsigned __int8)a7
{
  quiclog_event *v13;

  v13 = -[QUICLog createEvent:](self, "createEvent:", 3);
  v13->var3.var0.var0 = a3;
  v13->var3.var2.var1 = a4;
  v13->var3.var2.var2 = a5;
  v13->var3.var2.var3 = a6;
  v13->var3.var2.var5 = a7;
  v13->var3.var0.var19 = 0;
  *self->events_list.stqh_last = v13;
  self->events_list.stqh_last = (quiclog_event **)&v13->var3.var0.var19;
}

- (void)logCongestionStateUpdated:(unsigned __int8)a3 new_state:(unsigned __int8)a4 trigger:(unsigned __int8)a5
{
  quiclog_event *v9;

  v9 = -[QUICLog createEvent:](self, "createEvent:", 5);
  v9->var3.var4.var0 = a3;
  v9->var3.var4.var1 = a4;
  v9->var3.var4.var2 = a5;
  v9->var3.var0.var19 = 0;
  *self->events_list.stqh_last = v9;
  self->events_list.stqh_last = (quiclog_event **)&v9->var3.var0.var19;
}

- (void)logStreamTypeSet:(unint64_t)a3 owner:(unsigned __int8)a4 old_state:(unsigned __int8)a5 new_state:(unsigned __int8)a6
{
  quiclog_event *v11;

  v11 = -[QUICLog createEvent:](self, "createEvent:", 7);
  v11->var3.var0.var0 = a3;
  v11->var3.var2.var1 = a4;
  v11->var3.var2.var2 = a5;
  v11->var3.var2.var3 = a6;
  v11->var3.var0.var19 = 0;
  *self->events_list.stqh_last = v11;
  self->events_list.stqh_last = (quiclog_event **)&v11->var3.var0.var19;
}

- (id)dumpData:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  $EA27435415C2D6854D1CF82EA9BC106F *p_events_list;
  quiclog_event *stqh_first;
  void *v11;
  uint64_t v12;
  void *v13;
  quiclog_event *var19;
  id v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "setValue:forKey:", CFSTR("network"), CFSTR("type"));
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("flow"));
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("vantage_point"));
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "addObject:", CFSTR("time"));
  objc_msgSend(v7, "addObject:", CFSTR("CATEGORY"));
  objc_msgSend(v7, "addObject:", CFSTR("EVENT_TYPE"));
  objc_msgSend(v7, "addObject:", CFSTR("DATA"));
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("event_fields"));
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  p_events_list = &self->events_list;
  stqh_first = self->events_list.stqh_first;
  if (stqh_first)
  {
    v11 = 0;
    do
    {
      switch(stqh_first->var0)
      {
        case 0:
          -[QUICLog processParametersSet:](self, "processParametersSet:", stqh_first);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 1:
        case 2:
          -[QUICLog processPacketSentAndPacketRecieved:](self, "processPacketSentAndPacketRecieved:", stqh_first);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 3:
          -[QUICLog processStreamStateUpdated:](self, "processStreamStateUpdated:", stqh_first);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 4:
          -[QUICLog processMetricsUpdated:](self, "processMetricsUpdated:", stqh_first);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 5:
          -[QUICLog processCongestionStateUpdated:](self, "processCongestionStateUpdated:", stqh_first);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 6:
          -[QUICLog processPacketLost:](self, "processPacketLost:", stqh_first);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 7:
          -[QUICLog processStreamTypeSet:](self, "processStreamTypeSet:", stqh_first);
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v13 = (void *)v12;

          v11 = v13;
          break;
        default:
          break;
      }
      objc_msgSend(v8, "addObject:", v11, v19);
      var19 = (quiclog_event *)p_events_list->stqh_first->var3.var0.var19;
      p_events_list->stqh_first = var19;
      if (!var19)
        self->events_list.stqh_last = &p_events_list->stqh_first;
      -[QUICLog deallocEvent:](self, "deallocEvent:", stqh_first);
      stqh_first = self->events_list.stqh_first;
    }
    while (stqh_first);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("events"), v19);
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v15, "setValue:forKey:", CFSTR("us"), CFSTR("time_units"));
  objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("configuration"));
  objc_msgSend(v20, "addObject:", v6);
  -[NSMutableDictionary setValue:forKey:](self->top_level_object, "setValue:forKey:", v20, CFSTR("traces"));
  -[QUICLog dictToJsonString:](self, "dictToJsonString:", self->top_level_object);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dataUsingEncoding:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)processParametersSet:(quiclog_event *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  void *v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  void *v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  char *var10;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a3->var3.var0.var12 != 2)
  {
    +[QUICLog ownerString:](QUICLog, "ownerString:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("owner"));

  }
  -[QUICLog addOptionalSuperBoolToObject:key:value:](self, "addOptionalSuperBoolToObject:key:value:", v6, CFSTR("resumption_allowed"), a3->var3.var0.var9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalSuperBoolToObject:key:value:](self, "addOptionalSuperBoolToObject:key:value:", v8, CFSTR("early_data_enabled"), a3->var3.var0.var10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalCharPointerToObject:key:value:](self, "addOptionalCharPointerToObject:key:value:", v9, CFSTR("tls_cipher"), (char *)&a3->var3.var5 + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = &quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3 == 2)
    v11 = &quic_cid_describe_cid_buf2;
  if (quic_cid_describe_state % 3)
    v12 = v11;
  else
    v12 = &quic_cid_describe_cid_buf1;
  ++quic_cid_describe_state;
  if (a3->var3.var0.var8[0] >= 0x14u)
    v13 = 20;
  else
    v13 = a3->var3.var0.var8[0];
  *v12 = 0u;
  v12[1] = 0u;
  *(_OWORD *)((char *)v12 + 25) = 0u;
  if ((_DWORD)v13)
  {
    v14 = &a3->var3.var0.var8[1];
    do
    {
      v15 = *v14++;
      snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v15);
      --v13;
    }
    while (v13);
  }
  -[QUICLog addOptionalCharPointerToObject:key:value:](self, "addOptionalCharPointerToObject:key:value:", v10, CFSTR("original_destination_connection_id"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = &quic_cid_describe_cid_buf2;
  if (quic_cid_describe_state % 3 != 2)
    v17 = &quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3)
    v18 = v17;
  else
    v18 = &quic_cid_describe_cid_buf1;
  ++quic_cid_describe_state;
  if (a3->var3.var0.var7[0] >= 0x14u)
    v19 = 20;
  else
    v19 = a3->var3.var0.var7[0];
  *v18 = 0u;
  v18[1] = 0u;
  *(_OWORD *)((char *)v18 + 25) = 0u;
  if ((_DWORD)v19)
  {
    v20 = &a3->var3.var0.var7[1];
    do
    {
      v21 = *v20++;
      snprintf((char *)v18, 0x29uLL, "%s%02x", (const char *)v18, v21);
      --v19;
    }
    while (v19);
  }
  -[QUICLog addOptionalCharPointerToObject:key:value:](self, "addOptionalCharPointerToObject:key:value:", v16, CFSTR("retry_source_connection_id"), v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = &quic_cid_describe_cid_buf2;
  if (quic_cid_describe_state % 3 != 2)
    v23 = &quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3)
    v24 = v23;
  else
    v24 = &quic_cid_describe_cid_buf1;
  ++quic_cid_describe_state;
  if (a3->var3.var0.var6[0] >= 0x14u)
    v25 = 20;
  else
    v25 = a3->var3.var0.var6[0];
  *v24 = 0u;
  v24[1] = 0u;
  *(_OWORD *)((char *)v24 + 25) = 0u;
  if ((_DWORD)v25)
  {
    var10 = a3->var3.var3.var10;
    do
    {
      v27 = *var10++;
      snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v27);
      --v25;
    }
    while (v25);
  }
  -[QUICLog addOptionalCharPointerToObject:key:value:](self, "addOptionalCharPointerToObject:key:value:", v22, CFSTR("initial_source_connection_id"), v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalSuperBoolToObject:key:value:](self, "addOptionalSuperBoolToObject:key:value:", v28, CFSTR("disable_active_migration"), a3->var3.var0.var11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v29, CFSTR("max_idle_timeout"), a3->var3.var0.var0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v30, CFSTR("max_udp_payload_size"), a3->var3.var0.var1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v31, CFSTR("ack_delay_exponent"), a3->var3.var0.var3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v32, CFSTR("max_ack_delay"), a3->var3.var0.var2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v33, CFSTR("active_connection_id_limit"), a3->var3.var0.var4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v34, CFSTR("initial_max_data"), *((_QWORD *)&a3->var3.var5 + 25));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v35, CFSTR("initial_max_stream_data_bidi_local"), a3->var3.var0.var14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v36, CFSTR("initial_max_stream_data_bidi_remote"), a3->var3.var0.var15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v37, CFSTR("initial_max_stream_data_uni"), a3->var3.var0.var16);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v38, CFSTR("initial_max_streams_bidi"), a3->var3.var0.var17);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v39, CFSTR("initial_max_streams_uni"), a3->var3.var0.var18);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "addObject:", v40);
  return v42;
}

- (id)processPacketSentAndPacketRecieved:(quiclog_event *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[QUICLog packetTypeString:](QUICLog, "packetTypeString:", a3->var3.var1.var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("packet_type"));

  if (a3->var3.var0.var1)
  {
    -[QUICLog addPacketHeader:header:](self, "addPacketHeader:header:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  else if (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v17 - ((MEMORY[0x24BDAC7A8](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136446210;
    *(_QWORD *)(v16 + 4) = "-[QUICLog processPacketSentAndPacketRecieved:]";
    qlog_internal(17, (uint64_t)v15, 687);
  }
  if (a3->var3.var0.var2)
  {
    -[QUICLog addFrameList:frame_list:](self, "addFrameList:frame_list:", v7, &a3->var3.var5 + 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  -[QUICLog addOptionalSuperBoolToObject:key:value:](self, "addOptionalSuperBoolToObject:key:value:", v7, CFSTR("is_coalesced"), a3->var3.var1.var4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->var3.var1.var6.var0 != 5)
  {
    +[QUICLog packetSentRecievedTriggerString:](QUICLog, "packetSentRecievedTriggerString:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("trigger"));

  }
  objc_msgSend(v6, "addObject:", v11);

  return v6;
}

- (id)processStreamStateUpdated:(quiclog_event *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[QUICLog addMandatoryUint64ToObject:key:value:function_name:](self, "addMandatoryUint64ToObject:key:value:function_name:", v7, CFSTR("stream_id"), a3->var3.var0.var0, "-[QUICLog processStreamStateUpdated:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[QUICLog streamTypeString:](QUICLog, "streamTypeString:", a3->var3.var2.var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("stream_type"));
  if (a3->var3.var2.var2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("old"));

  }
  if (a3->var3.var2.var3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("new"));

  }
  if (a3->var3.var2.var5 != 2)
  {
    +[QUICLog streamSideString:](QUICLog, "streamSideString:");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("stream_side"));
    v9 = (void *)v12;
  }
  objc_msgSend(v6, "addObject:", v8);

  return v6;
}

- (id)processMetricsUpdated:(quiclog_event *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v7, CFSTR("min_rtt"), a3->var3.var0.var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v8, CFSTR("smoothed_rtt"), a3->var3.var0.var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v9, CFSTR("latest_rtt"), a3->var3.var0.var2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v10, CFSTR("rtt_variance"), a3->var3.var0.var3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v11, CFSTR("pto_count"), a3->var3.var0.var4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v12, CFSTR("congestion_window"), a3->var3.var3.var5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v13, CFSTR("bytes_in_flight"), a3->var3.var3.var6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->var3.var3.var7 != 0xFFFFFFFF)
  {
    -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v14, CFSTR("ssthresh"));
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  -[QUICLog addOptionalUint64ToObject:key:value:](self, "addOptionalUint64ToObject:key:value:", v14, CFSTR("packets_in_flight"), a3->var3.var3.var8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalSuperBoolToObject:key:value:](self, "addOptionalSuperBoolToObject:key:value:", v16, CFSTR("in_recovery"), a3->var3.var3.var9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v17);
  return v6;
}

- (id)processCongestionStateUpdated:(quiclog_event *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a3->var3.var4.var0 != 5)
  {
    +[QUICLog congestionStateString:](QUICLog, "congestionStateString:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("old"));

  }
  if (a3->var3.var4.var1 != 5)
  {
    +[QUICLog congestionStateString:](QUICLog, "congestionStateString:", a3->var3.var4.var0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("new"));

  }
  if (a3->var3.var4.var2 != 2)
  {
    +[QUICLog congestionTriggerString:](QUICLog, "congestionTriggerString:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("trigger"));

  }
  objc_msgSend(v6, "addObject:", v7);

  return v6;
}

- (id)processPacketLost:(quiclog_event *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t *p_var2;
  uint64_t v11;
  uint64_t var1;
  void *v13;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[QUICLog packetTypeString:](QUICLog, "packetTypeString:", a3->var3.var1.var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("packet_type"));

  if (a3->var3.var0.var1)
  {
    -[QUICLog addPacketHeader:header:](self, "addPacketHeader:header:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
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
    *(_QWORD *)(v17 + 4) = "-[QUICLog processPacketLost:]";
    qlog_internal(17, (uint64_t)v16, 838);
  }
  p_var2 = &a3->var3.var0.var2;
  if (a3->var3.var0.var2)
  {
    -[QUICLog addFrameList:frame_list:](self, "addFrameList:frame_list:", v7, p_var2);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  var1 = a3->var3.var1.var6.var1;
  if ((_DWORD)var1 != 3)
  {
    +[QUICLog packetLostTriggerString:](QUICLog, "packetLostTriggerString:", var1, p_var2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v13, CFSTR("trigger"));

  }
  objc_msgSend(v6, "addObject:", v7);

  return v6;
}

- (id)processStreamTypeSet:(quiclog_event *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[QUICLog addMandatoryUint64ToObject:key:value:function_name:](self, "addMandatoryUint64ToObject:key:value:function_name:", v7, CFSTR("stream_id"), a3->var3.var0.var0, "-[QUICLog processStreamTypeSet:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->var3.var2.var1 != 2)
  {
    +[QUICLog ownerString:](QUICLog, "ownerString:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("owner"));

  }
  +[QUICLog streamTypeString:](QUICLog, "streamTypeString:", a3->var3.var2.var2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("old"));
  +[QUICLog streamTypeString:](QUICLog, "streamTypeString:", a3->var3.var2.var3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("new"));
  objc_msgSend(v6, "addObject:", v8);

  return v6;
}

- (id)addEventValues:(id)a3 event:(quiclog_event *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4->var2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);
  +[QUICLog categoryString:](QUICLog, "categoryString:", a4->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  +[QUICLog eventTypeString:](QUICLog, "eventTypeString:", a4->var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  return v5;
}

- (id)addPacketHeader:(id)a3 header:(packet_header *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a4->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("packet_number"));
  if (a4->var1 != -1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("packet_size"));

  }
  if (a4->var2 != -1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("length"));

  }
  if (a4->var3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), a4->var3);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("version"));
    v7 = (void *)v10;
  }
  if (a4->var4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a4->var4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("scil"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), a4->var6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("scid"));
  }
  if (a4->var5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a4->var5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("dcil"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), a4->var7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("dcid"));
  }
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("header"));

  return v5;
}

- (id)addFrameList:(id)a3 frame_list:(quic_frame_list *)a4
{
  unint64_t v5;
  id v6;
  const __CFString *v7;
  unint64_t v8;
  id v9;
  void *v10;
  quic_frame *var0;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _OWORD *v64;
  _OWORD *v65;
  unsigned int v66;
  uint64_t v67;
  unsigned __int8 *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  quic_frame **v85;
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;

  v87 = a3;
  v5 = 0x24BDBC000uLL;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a4->var0)
  {
    v7 = 0;
    v8 = 0x24BDD1000;
    do
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v10 = v9;
      var0 = a4->var0;
      v12 = *(_QWORD *)a4->var0;
      if (v12 > 12237311)
      {
        if ((unint64_t)(v12 - 12237312) < 2)
        {
          if (*((_QWORD *)var0 + 3) != -1)
          {
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v31, CFSTR("ack_mp_space_id"));

          }
          if (*((_QWORD *)var0 + 5) != -1)
          {
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 5));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v32, CFSTR("ack_delay"));

          }
          if (*(_QWORD *)var0 == 12237313)
          {
            if (*((_QWORD *)var0 + 6) == -1
              || (objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 6)),
                  v33 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v10, "setValue:forKey:", v33, CFSTR("ect0")),
                  v33,
                  *(_QWORD *)var0 == 12237313))
            {
              if (*((_QWORD *)var0 + 7) == -1
                || (objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 7)),
                    v34 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v10, "setValue:forKey:", v34, CFSTR("ect1")),
                    v34,
                    *(_QWORD *)var0 == 12237313))
              {
                if (*((_QWORD *)var0 + 8) != -1)
                {
                  objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 8));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "setValue:forKey:", v35, CFSTR("ce"));

                }
              }
            }
          }
          v36 = objc_alloc_init(*(Class *)(v5 + 3768));
          if (!*((_QWORD *)var0 + 9))
          {
            v37 = objc_alloc_init(*(Class *)(v5 + 3768));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 4));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v38);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 4));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v39);

            v8 = 0x24BDD1000;
            objc_msgSend(v36, "addObject:", v37);

          }
          v88[0] = MEMORY[0x24BDAC760];
          v88[1] = 3221225472;
          v88[2] = __35__QUICLog_addFrameList_frame_list___block_invoke_2;
          v88[3] = &unk_24C2E1048;
          v89 = v36;
          v40 = v36;
          quic_ack_process_blocks((uint64_t *)var0, (uint64_t)v88);
          objc_msgSend(v10, "setValue:forKey:", v40, CFSTR("acked_ranges"));

          v7 = CFSTR("ack_mp");
        }
        else if (v12 == 12237317)
        {
          objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v77, CFSTR("id_type"));
          if (*((_QWORD *)var0 + 2) != 2)
          {
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
            v78 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v78, CFSTR("id"));
            v77 = (void *)v78;
          }
          objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 4));
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setValue:forKey:", v79, CFSTR("raw_error_code"));
          objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%s"), *((_QWORD *)var0 + 6));
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setValue:forKey:", v80, CFSTR("reason"));
          v7 = CFSTR("path_abandon");
        }
        else if (v12 == 12237318)
        {
          objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v22, CFSTR("id_type"));
          if (*((_QWORD *)var0 + 2) != 2)
          {
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
            v23 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v23, CFSTR("id"));
            v22 = (void *)v23;
          }
          objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 4));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setValue:forKey:", v24, CFSTR("sequence_number"));
          objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 5));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setValue:forKey:", v25, CFSTR("status"));
          v7 = CFSTR("path_status");
        }
      }
      else
      {
        switch(v12)
        {
          case 0:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%hd"), *((__int16 *)var0 + 9));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v41, CFSTR("payload_length"));

            v7 = CFSTR("padding");
            break;
          case 1:
            v7 = CFSTR("ping");
            break;
          case 2:
          case 3:
            if (*((_QWORD *)var0 + 5) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 5));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v13, CFSTR("ack_delay"));

              v12 = *(_QWORD *)var0;
            }
            if (v12 == 3)
            {
              if (*((_QWORD *)var0 + 6) == -1
                || (objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 6)),
                    v14 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v10, "setValue:forKey:", v14, CFSTR("ect0")),
                    v14,
                    *(_QWORD *)var0 == 3))
              {
                if (*((_QWORD *)var0 + 7) == -1
                  || (objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 7)),
                      v15 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v10, "setValue:forKey:", v15, CFSTR("ect1")),
                      v15,
                      *(_QWORD *)var0 == 3))
                {
                  if (*((_QWORD *)var0 + 8) != -1)
                  {
                    objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 8));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "setValue:forKey:", v16, CFSTR("ce"));

                  }
                }
              }
            }
            v17 = objc_alloc_init(*(Class *)(v5 + 3768));
            if (!*((_QWORD *)var0 + 9))
            {
              v18 = objc_alloc_init(*(Class *)(v5 + 3768));
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 4));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v19);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 4));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v20);

              v8 = 0x24BDD1000;
              objc_msgSend(v17, "addObject:", v18);

            }
            v90[0] = MEMORY[0x24BDAC760];
            v90[1] = 3221225472;
            v90[2] = __35__QUICLog_addFrameList_frame_list___block_invoke;
            v90[3] = &unk_24C2E1048;
            v91 = v17;
            v21 = v17;
            quic_ack_process_blocks((uint64_t *)var0, (uint64_t)v90);
            objc_msgSend(v10, "setValue:forKey:", v21, CFSTR("acked_ranges"));

            v7 = CFSTR("ack");
            break;
          case 4:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v42, CFSTR("stream_id"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 4));
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v43, CFSTR("final_size"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 3));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v44, CFSTR("error_code"));

            v7 = CFSTR("reset_stream");
            break;
          case 5:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v45, CFSTR("stream_id"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 3));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v46, CFSTR("error_code"));

            v7 = CFSTR("stop_sending");
            break;
          case 6:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v47, CFSTR("offset"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 4));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v48, CFSTR("length"));

            v7 = CFSTR("crypto");
            break;
          case 7:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 3));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v49, CFSTR("length"));

            v7 = CFSTR("new_token");
            break;
          case 16:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v50, CFSTR("maximum"));

            v7 = CFSTR("max_data");
            break;
          case 17:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v51, CFSTR("stream_id"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v52, CFSTR("maximum"));
            v7 = CFSTR("max_stream_data");
            break;
          case 18:
            v53 = CFSTR("bidirectional");
            goto LABEL_57;
          case 19:
            v53 = CFSTR("unidirectional");
LABEL_57:
            objc_msgSend(v9, "setValue:forKey:", v53, CFSTR("stream_type"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v54, CFSTR("maximum"));

            v7 = CFSTR("max_streams");
            break;
          case 20:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v55, CFSTR("limit"));

            v7 = CFSTR("data_blocked");
            break;
          case 21:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v56, CFSTR("stream_id"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v57, CFSTR("limit"));
            v7 = CFSTR("stream_data_blocked");
            break;
          case 22:
            v58 = CFSTR("bidirectional");
            goto LABEL_62;
          case 23:
            v58 = CFSTR("unidirectional");
LABEL_62:
            objc_msgSend(v9, "setValue:forKey:", v58, CFSTR("stream_type"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v59, CFSTR("limit"));

            v7 = CFSTR("streams_blocked");
            break;
          case 24:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v60, CFSTR("sequence_number"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v61, CFSTR("retire_prior_to"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *((unsigned __int16 *)var0 + 4));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v62, CFSTR("length"));
            v63 = *(void **)(v8 + 1992);
            v64 = &quic_cid_describe_cid_buf3;
            if (quic_cid_describe_state % 3 == 2)
              v64 = &quic_cid_describe_cid_buf2;
            if (quic_cid_describe_state % 3)
              v65 = v64;
            else
              v65 = &quic_cid_describe_cid_buf1;
            ++quic_cid_describe_state;
            v66 = *((unsigned __int8 *)var0 + 32);
            *(_OWORD *)((char *)v65 + 25) = 0u;
            if (v66 >= 0x14)
              v67 = 20;
            else
              v67 = v66;
            *v65 = 0uLL;
            v65[1] = 0uLL;
            if ((_DWORD)v67)
            {
              v68 = (unsigned __int8 *)var0 + 33;
              do
              {
                v69 = *v68++;
                snprintf((char *)v65, 0x29uLL, "%s%02x", (const char *)v65, v69);
                --v67;
              }
              while (v67);
            }
            objc_msgSend(v63, "stringWithFormat:", CFSTR("%s"), v65);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v70, CFSTR("connection_id"));
            v7 = CFSTR("new_connection_id");
            v5 = 0x24BDBC000;
            v8 = 0x24BDD1000;
            break;
          case 25:
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v71, CFSTR("sequence_number"));

            v7 = CFSTR("retire_connection_id");
            break;
          case 26:
            if (*((_QWORD *)var0 + 2) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("0x%llx"), *((_QWORD *)var0 + 2));
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v72, CFSTR("data"));

            }
            v7 = CFSTR("path_challenge");
            break;
          case 27:
            if (*((_QWORD *)var0 + 2) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("0x%llx"), *((_QWORD *)var0 + 2));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v73, CFSTR("data"));

            }
            v7 = CFSTR("path_response");
            break;
          case 28:
          case 29:
            objc_msgSend(v9, "setValue:forKey:", CFSTR("transport"), CFSTR("error_space"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v26, CFSTR("raw_error_code"));
            objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%s"), *((_QWORD *)var0 + 5));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setValue:forKey:", v27, CFSTR("reason"));
            if (*((_QWORD *)var0 + 3) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
              v28 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "setValue:forKey:", v28, CFSTR("reason"));
              v27 = (void *)v28;
            }

            v7 = CFSTR("connection_close");
            break;
          case 30:
            v7 = CFSTR("handshake_done");
            break;
          case 48:
          case 49:
            if (*((_QWORD *)var0 + 5) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 5));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v29, CFSTR("length"));

            }
            if (*((_QWORD *)var0 + 3) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v30, CFSTR("flow_id"));

            }
            v7 = CFSTR("datagram");
            break;
          case 172:
            v7 = CFSTR("immediate_ack");
            break;
          case 175:
            if (*((_QWORD *)var0 + 2) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 2));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v74, CFSTR("sequence"));

            }
            if (*((_QWORD *)var0 + 3) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 3));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v75, CFSTR("threshold"));

            }
            if (*((_QWORD *)var0 + 4) != -1)
            {
              objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 4));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v76, CFSTR("request_max_ack_delay"));

            }
            if ((*((_BYTE *)var0 + 40) & 1) != 0)
              objc_msgSend(v10, "setValue:forKey:", CFSTR("true"), CFSTR("ignore_order"));
            v7 = CFSTR("ack_frequency");
            break;
          default:
            break;
        }
      }
      if ((unint64_t)(*(_QWORD *)var0 - 8) <= 6)
      {
        objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%llu"), *((_QWORD *)var0 + 4));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v81, CFSTR("offset"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 5));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v82, CFSTR("length"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)var0 + 3));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v83, CFSTR("stream_id"));
        if ((*((_BYTE *)var0 + 16) & 1) != 0)
          objc_msgSend(v10, "setValue:forKey:", CFSTR("true"), CFSTR("fin"));

        v7 = CFSTR("stream");
        v8 = 0x24BDD1000uLL;
      }
      objc_msgSend(v10, "setValue:forKey:", v7, CFSTR("frame_type"));
      objc_msgSend(v6, "addObject:", v10);
      v84 = *((_QWORD *)var0 + 12);
      v85 = (quic_frame **)*((_QWORD *)var0 + 13);
      if (v84)
      {
        *(_QWORD *)(v84 + 104) = v85;
        v85 = (quic_frame **)*((_QWORD *)var0 + 13);
      }
      else
      {
        a4->var1 = v85;
      }
      *v85 = (quic_frame *)v84;

    }
    while (a4->var0);
  }
  objc_msgSend(v87, "setValue:forKey:", v6, CFSTR("frames"));

  return v87;
}

- (id)addOptionalCharPointerToObject:(id)a3 key:(id)a4 value:(const char *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  if (a5)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = a4;
    objc_msgSend(v8, "stringWithCString:encoding:", a5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v10, v9);

  }
  return v7;
}

- (id)addMandatoryCharPointerToObject:(id)a3 key:(id)a4 value:(const char *)a5 function_name:(const char *)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = a3;
  if (a5)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = a4;
    objc_msgSend(v9, "stringWithCString:encoding:", a5, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v11, v10);

  }
  return v8;
}

- (id)addOptionalSuperBoolToObject:(id)a3 key:(id)a4 value:(char)a5
{
  int v5;
  id v7;
  id v8;
  const __CFString *v9;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v5 != -1)
  {
    if (v5 == 1)
      v9 = CFSTR("true");
    else
      v9 = CFSTR("false");
    objc_msgSend(v7, "setValue:forKey:", v9, v8);
  }

  return v7;
}

- (id)addMandatorySuperBoolToObject:(id)a3 key:(id)a4 value:(char)a5 function_name:(const char *)a6
{
  int v6;
  id v8;
  id v9;
  const __CFString *v10;

  v6 = a5;
  v8 = a3;
  v9 = a4;
  if (v6 != -1)
  {
    if (v6 == 1)
      v10 = CFSTR("true");
    else
      v10 = CFSTR("false");
    objc_msgSend(v8, "setValue:forKey:", v10, v9);
  }

  return v8;
}

- (id)addOptionalUint64ToObject:(id)a3 key:(id)a4 value:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  if (a5 != -1)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = a4;
    objc_msgSend(v8, "numberWithUnsignedLongLong:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v10, v9);

  }
  return v7;
}

- (id)addMandatoryUint64ToObject:(id)a3 key:(id)a4 value:(unint64_t)a5 function_name:(const char *)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = a3;
  if (a5 != -1)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    v10 = a4;
    objc_msgSend(v9, "numberWithUnsignedLongLong:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v11, v10);

  }
  return v8;
}

- (id)dictToJsonString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 1);
  }
  else
  {
    NSLog(CFSTR("error parsing JSON: %@"), v4);
    v6 = 0;
  }

  return v6;
}

- (id)jsonStringToDict:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = v5;
  if (v4)
    v7 = v4;
  else
    NSLog(CFSTR("error parsing JSON: %@"), v5);

  return v4;
}

- (void)setEntryInTopLevelObject:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setValue:forKey:](self->top_level_object, "setValue:forKey:", a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->top_level_object, 0);
}

uint64_t __35__QUICLog_addFrameList_frame_list___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  return 1;
}

uint64_t __35__QUICLog_addFrameList_frame_list___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  return 1;
}

+ (int)packetType:(quic_packet *)a3
{
  if ((*((_BYTE *)a3 + 233) & 1) != 0)
    return 6;
  if (a3->var7 - 1 > 4)
    return 0;
  return dword_20A2A26F4[(a3->var7 - 1)];
}

+ (id)categoryString:(int)a3
{
  if ((a3 - 4) > 3)
    return CFSTR("TRANSPORT");
  else
    return off_24C2E1068[a3 - 4];
}

+ (id)eventTypeString:(int)a3
{
  if ((a3 - 1) > 6)
    return CFSTR("PARAMETERS_SET");
  else
    return off_24C2E1088[a3 - 1];
}

+ (id)ownerString:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("local");
  if (a3 == 1)
    v3 = CFSTR("remote");
  if (a3 == 2)
    return CFSTR("unknown");
  else
    return (id)v3;
}

+ (id)packetTypeString:(int)a3
{
  if (a3 > 6)
    return CFSTR("initial");
  else
    return off_24C2E10C0[a3];
}

+ (id)streamTypeString:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("unidirectional");
  if (!a3)
    v3 = CFSTR("bidirectional");
  if (a3 == 2)
    return CFSTR("datagram");
  else
    return (id)v3;
}

+ (id)streamSideString:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("sending");
  if (a3 == 1)
    v3 = CFSTR("recieving");
  if (a3 == 2)
    return CFSTR("unknown");
  else
    return (id)v3;
}

+ (id)congestionTriggerString:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("persistent_congestion");
  if (a3 == 1)
    v3 = CFSTR("ecn");
  if (a3 == 2)
    return CFSTR("unknown");
  else
    return (id)v3;
}

+ (id)congestionStateString:(unsigned __int8)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("slow_start");
  else
    return off_24C2E10F8[(a3 - 1)];
}

+ (id)packetLostTriggerString:(unsigned __int8)a3
{
  if ((a3 - 1) > 2)
    return CFSTR("reordering_threshold");
  else
    return off_24C2E1120[(a3 - 1)];
}

+ (id)packetSentRecievedTriggerString:(int)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("reordering_threshold");
  else
    return off_24C2E1138[a3 - 1];
}

+ (id)flowTypeString:(unsigned __int8)a3
{
  if (a3)
    return CFSTR("server");
  else
    return CFSTR("client");
}

@end
