uint64_t sub_1AEA5098C(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v13;
  _BYTE msg[36];
  __int128 v15;
  int v16;

  v16 = 0;
  v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x40400000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x38u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 1128)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 48)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v10 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v13 = DWORD1(v15);
                *a2 = v15;
                *a3 = v13;
                *a4 = DWORD2(v15);
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v11 = 1;
            else
              v11 = *(_DWORD *)&msg[32] == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

void notify_peek(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t has_internal_diagnostics;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v3 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v4 = *(_DWORD **)(v3 + 592);
    if (v4 && *v4 != *(_DWORD *)(v3 + 112))
    {
      v10 = sub_1AEA578B0(v3);
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
      if (v10)
      {
        if (v10 < 0xB)
          return;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
LABEL_25:
          sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, v18, (char)"notify_peek");
          return;
        }
LABEL_30:
        sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_peek");
        return;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
    }
  }
  v5 = sub_1AEA55CB8();
  if (!v5)
    return;
  v6 = v5;
  if ((*(_DWORD *)(v5 + 24) & 0x80000000) != 0)
  {
    if (a2)
    {
      os_unfair_lock_lock_with_options();
      v8 = os_set_64_ptr_find();
      if (v8)
      {
        v9 = *(_QWORD *)(v3 + 224);
        if (v9 != v8)
          *a2 = *(_DWORD *)(*(_QWORD *)(v8 - v9 + 48) + 60);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 344));
    }
    goto LABEL_28;
  }
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
  {
    qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
    return;
  }
  if ((*(_DWORD *)(v6 + 24) & 0xF) != 1)
    goto LABEL_28;
  v7 = *(_QWORD *)(v3 + 592);
  if (!v7)
  {
    sub_1AEA55798((char *)v6);
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      goto LABEL_25;
    goto LABEL_30;
  }
  *a2 = *(_DWORD *)(v7 + 4 * *(unsigned int *)(v6 + 28));
LABEL_28:
  sub_1AEA55798((char *)v6);
}

void notify_monitor_file(int a1, const char *a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t has_internal_diagnostics;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int v21;
  int v22;
  mach_msg_return_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  _BYTE msg[28];
  const char *v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;

  v6 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v6 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v7 = *(_DWORD **)(v6 + 592);
    if (v7 && *v7 != *(_DWORD *)(v6 + 112))
    {
      v10 = sub_1AEA578B0(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
      if (v10)
      {
        if (v10 < 0xB)
          return;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
          goto LABEL_37;
        goto LABEL_34;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
    }
  }
  if (!a2)
    return;
  v8 = sub_1AEA55CB8();
  if (!v8)
    return;
  v9 = v8;
  if ((*(_DWORD *)(v8 + 24) & 0x80000000) != 0)
    goto LABEL_12;
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
  {
    qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
    return;
  }
  if (*(_QWORD *)(v9 + 88))
  {
LABEL_12:
    sub_1AEA55798((char *)v9);
    return;
  }
  if (*(_DWORD *)(v6 + 384) || (v32 = sub_1AEA53FC8(v6)) == 0)
  {
    v19 = strdup(a2);
    if (v19)
    {
      v20 = v19;
      v21 = strlen(a2) + 1;
      if ((*(_BYTE *)(v9 + 27) & 4) != 0)
        a1 = *(_DWORD *)(*(_QWORD *)(v9 + 104) + 48);
      v22 = *(_DWORD *)(v6 + 384);
      v35 = a2;
      v36 = 16777472;
      v37 = v21;
      v38 = *MEMORY[0x1E0C87D40];
      v39 = a1;
      v40 = v21;
      v41 = a3;
      *(_QWORD *)msg = 2147483667;
      *(_DWORD *)&msg[8] = v22;
      *(_OWORD *)&msg[12] = xmmword_1AEA5AD60;
      if (MEMORY[0x1E0C88840])
        voucher_mach_msg_set((mach_msg_header_t *)msg);
      v23 = mach_msg((mach_msg_header_t *)msg, 1, 0x40u, 0, 0, 0, 0);
      *(_QWORD *)(v9 + 88) = v20;
      *(_DWORD *)(v9 + 96) = a3;
      sub_1AEA55798((char *)v9);
      if (v23)
      {
        v24 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v24)
          sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v25, v26, v27, v28, v29, v30, v31, (char)"notify_monitor_file");
        else
          sub_1AEA576FC(v24, "Libnotify: %s failed with code %d (%d) on line %d", v26, v27, v28, v29, v30, v31, (char)"notify_monitor_file");
      }
      return;
    }
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (!(_DWORD)has_internal_diagnostics)
      goto LABEL_37;
LABEL_34:
    sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, v18, (char)"notify_monitor_file");
    return;
  }
  v33 = v32;
  sub_1AEA55798((char *)v9);
  if (v33 >= 0xB)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      goto LABEL_34;
LABEL_37:
    sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_monitor_file");
  }
}

uint64_t sub_1AEA510F8(uint64_t a1)
{
  uint64_t result;

  result = bootstrap_look_up2();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1AEA51148()
{
  uint64_t result;

  result = sub_1AEA57EDC((uint64_t)"com.apple.notify.root_access", (uint64_t)&unk_1E5E0D228);
  byte_1ECCD93F0 = result;
  return result;
}

uint64_t notify_resume_pid(int a1)
{
  uint64_t v2;
  mach_port_t v3;
  uint64_t has_internal_diagnostics;
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
  mach_msg_header_t msg;
  uint64_t v17;
  int v18;

  v2 = sub_1AEA55D3C();
  v3 = *(_DWORD *)(v2 + 384);
  if (v3)
  {
LABEL_2:
    v17 = *MEMORY[0x1E0C87D40];
    v18 = a1;
    *(_QWORD *)&msg.msgh_bits = 19;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1007;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    if (MEMORY[0x1E0C88840])
      voucher_mach_msg_set(&msg);
    if (!mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0))
      return 0;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v12 = 1000000;
    if ((_DWORD)has_internal_diagnostics)
      goto LABEL_6;
LABEL_10:
    sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v6, v7, v8, v9, v10, v11, (char)"notify_resume_pid");
    return v12;
  }
  v13 = v2;
  v14 = sub_1AEA53FC8(v2);
  if (!(_DWORD)v14)
  {
    v3 = *(_DWORD *)(v13 + 384);
    goto LABEL_2;
  }
  v12 = v14;
  if (v14 < 0xB)
    return v12;
  v12 = 1000000;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!(_DWORD)has_internal_diagnostics)
    goto LABEL_10;
LABEL_6:
  sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v5, v6, v7, v8, v9, v10, v11, (char)"notify_resume_pid");
  return v12;
}

uint64_t notify_suspend_pid(int a1)
{
  uint64_t v2;
  mach_port_t v3;
  uint64_t has_internal_diagnostics;
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
  mach_msg_header_t msg;
  uint64_t v17;
  int v18;

  v2 = sub_1AEA55D3C();
  v3 = *(_DWORD *)(v2 + 384);
  if (v3)
  {
LABEL_2:
    v17 = *MEMORY[0x1E0C87D40];
    v18 = a1;
    *(_QWORD *)&msg.msgh_bits = 19;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1006;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    if (MEMORY[0x1E0C88840])
      voucher_mach_msg_set(&msg);
    if (!mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0))
      return 0;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v12 = 1000000;
    if ((_DWORD)has_internal_diagnostics)
      goto LABEL_6;
LABEL_10:
    sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v6, v7, v8, v9, v10, v11, (char)"notify_suspend_pid");
    return v12;
  }
  v13 = v2;
  v14 = sub_1AEA53FC8(v2);
  if (!(_DWORD)v14)
  {
    v3 = *(_DWORD *)(v13 + 384);
    goto LABEL_2;
  }
  v12 = v14;
  if (v14 < 0xB)
    return v12;
  v12 = 1000000;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!(_DWORD)has_internal_diagnostics)
    goto LABEL_10;
LABEL_6:
  sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v5, v6, v7, v8, v9, v10, v11, (char)"notify_suspend_pid");
  return v12;
}

uint64_t sub_1AEA513FC(uint64_t a1)
{
  __int128 v2;

  *(_QWORD *)(a1 + 96) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)(a1 + 64) = v2;
  *(_OWORD *)(a1 + 80) = v2;
  *(_OWORD *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v2;
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 488) = 1;
  *(_DWORD *)(a1 + 396) = -1;
  *(_DWORD *)(a1 + 108) = 0;
  os_set_str_ptr_init();
  *(_QWORD *)(a1 + 480) = 32;
  os_set_32_ptr_init();
  *(_QWORD *)(a1 + 448) = 20;
  return sub_1AEA5147C(a1 + 128);
}

uint64_t sub_1AEA5147C(uint64_t a1)
{
  *(_DWORD *)(a1 + 208) = 1;
  *(_QWORD *)(a1 + 216) = 0xFFFFFFFF00000000;
  os_set_str_ptr_init();
  *(_QWORD *)(a1 + 32) = 8;
  os_set_64_ptr_init();
  *(_QWORD *)(a1 + 64) = 16;
  os_set_64_ptr_init();
  *(_QWORD *)(a1 + 96) = 64;
  os_set_32_ptr_init();
  *(_QWORD *)(a1 + 128) = 8;
  os_set_32_ptr_init();
  *(_QWORD *)(a1 + 160) = 16;
  return os_map_64_init();
}

uint64_t notify_register_plain(const char *a1, _DWORD *a2)
{
  uint64_t v4;
  _DWORD *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
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
  uint64_t v19;
  uint64_t has_internal_diagnostics;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  int v31;
  mach_port_t v32;
  unsigned int v33;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  mach_msg_header_t msg[23];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C874D8];
  v4 = sub_1AEA55D3C();
  if ((sub_1AEA57F50(a1) & 1) == 0 && os_variant_has_internal_diagnostics())
    sub_1AEA56E70("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v45, v46, v47, v48, v49, v50, v51, (char)a1);
  v52 = 0;
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      v10 = sub_1AEA578B0(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if ((_DWORD)v10)
      {
        if (v10 < 0xB)
          return v10;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
LABEL_42:
          sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v21, v22, v23, v24, v25, v26, v27, (char)"notify_register_plain");
          return 1000000;
        }
LABEL_47:
        sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v22, v23, v24, v25, v26, v27, (char)"notify_register_plain");
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  if (!a1)
    return 1;
  if (!strncmp(a1, "self.", 5uLL))
    goto LABEL_11;
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
  {
LABEL_11:
    v6 = (unsigned int *)(v4 + 488);
    do
    {
      v7 = __ldxr(v6);
      v8 = v7 + 1;
    }
    while (__stxr(v7 + 1, v6));
    v9 = sub_1AEA57660(v4 + 128, a1, v8, &v52);
    if ((_DWORD)v9)
    {
      v10 = v9;
      if (v9 >= 0xB)
      {
        v10 = 1000000;
        v11 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v11)
          goto LABEL_21;
LABEL_46:
        sub_1AEA576FC(v11, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_register_plain");
        return v10;
      }
      return v10;
    }
    v19 = sub_1AEA54D8C(a1, v52, v8, v8, -1, 0x80000002, -1, -1, 0, 0);
    if (!(_DWORD)v19)
    {
      v10 = 0;
      *a2 = v8;
      return v10;
    }
    v10 = v19;
    if (v19 < 0xB)
      return v10;
    v10 = 1000000;
    v11 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v11)
      goto LABEL_46;
LABEL_21:
    sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, v18, (char)"notify_register_plain");
    return v10;
  }
  v28 = *(_DWORD *)(v4 + 384);
  if (!v28)
  {
    v42 = sub_1AEA53FC8(v4);
    if (!(_DWORD)v42)
    {
      v28 = *(_DWORD *)(v4 + 384);
      goto LABEL_27;
    }
    v10 = v42;
    if (v42 < 0xB)
      return v10;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      goto LABEL_42;
    goto LABEL_47;
  }
LABEL_27:
  v29 = (unsigned int *)(v4 + 488);
  do
  {
    v30 = __ldxr(v29);
    v31 = v30 + 1;
  }
  while (__stxr(v30 + 1, v29));
  memset(msg, 0, 512);
  *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C87D40];
  if (MEMORY[0x1E0C884E8])
    v32 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, a1, 512);
  else
    v32 = mig_strncpy((char *)&msg[1].msgh_voucher_port, a1, 512);
  msg[1].msgh_remote_port = 0;
  msg[1].msgh_local_port = v32;
  v33 = (v32 + 3) & 0xFFFFFFFC;
  *(mach_port_name_t *)((char *)&msg[1].msgh_voucher_port + v33) = v31;
  msg[0].msgh_bits = 19;
  *(_QWORD *)&msg[0].msgh_remote_port = v28;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x3F300000000;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(msg);
  if (mach_msg(msg, 1, v33 + 44, 0, 0, 0, 0))
  {
    v10 = 1000000;
    v34 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v34)
      sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v35, v36, v37, v38, v39, v40, v41, (char)"notify_register_plain");
    else
      sub_1AEA576FC(v34, "Libnotify: %s failed with code %d (%d) on line %d", v36, v37, v38, v39, v40, v41, (char)"notify_register_plain");
    return v10;
  }
  v43 = sub_1AEA54D8C(a1, -1, v31, v31, -1, 0x40000002u, -1, -1, 0, 0);
  if (!(_DWORD)v43)
  {
    v10 = 0;
    *a2 = v31;
    return v10;
  }
  v10 = v43;
  if (v43 >= 0xB)
  {
    v10 = 1000000;
    v11 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v11)
      goto LABEL_46;
    goto LABEL_21;
  }
  return v10;
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  uint64_t v8;
  _DWORD *v9;
  uint32_t v11;
  uint64_t has_internal_diagnostics;
  uint64_t v13;
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
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  unsigned int *v29;
  unsigned int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  mach_port_name_t v41;
  ipc_space_t *v42;
  const char *v43;
  unsigned int v44;
  const char *v45;
  NSObject *global_queue;
  uint32_t v47;
  uint32_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[5];
  mach_port_name_t v58;

  v8 = sub_1AEA55D3C();
  if ((sub_1AEA57F50(name) & 1) == 0 && os_variant_has_internal_diagnostics())
    sub_1AEA56E70("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v50, v51, v52, v53, v54, v55, v56, (char)name);
  if ((*(_DWORD *)(v8 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v9 = *(_DWORD **)(v8 + 592);
    if (v9 && *v9 != *(_DWORD *)(v8 + 112))
    {
      v11 = sub_1AEA578B0(v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
      if (v11)
      {
        if (v11 < 0xB)
          return v11;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
          sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port");
          return 1000000;
        }
        v43 = "notify_register_mach_port";
LABEL_44:
        sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v14, v15, v16, v17, v18, v19, (char)v43);
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
    }
  }
  if (!name)
    return 1;
  if (!notify_port)
    return 3;
  if (!strncmp(name, "self.", 5uLL))
    return sub_1AEA56B00(name, notify_port, flags, (unsigned int *)out_token, (os_unfair_lock_s *)v8);
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
    return sub_1AEA56B00(name, notify_port, flags, (unsigned int *)out_token, (os_unfair_lock_s *)v8);
  if ((flags & 0x80000000) == 0 && (*(_DWORD *)(v8 + 116) & 1) != 0)
  {
    if ((flags & 1) == 0 && mach_port_allocate(*MEMORY[0x1E0C883F0], 1u, notify_port))
    {
      v20 = os_variant_has_internal_diagnostics();
      v11 = 1000000;
      if ((_DWORD)v20)
      {
        v28 = "notify_register_mach_port_via_dispatch";
LABEL_61:
        sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v21, v22, v23, v24, v25, v26, v27, (char)v28);
        return v11;
      }
      v45 = "notify_register_mach_port_via_dispatch";
      goto LABEL_63;
    }
    v41 = *notify_port;
    if (*notify_port - 1 <= 0xFFFFFFFD)
    {
      v42 = (ipc_space_t *)MEMORY[0x1E0C883F0];
      if (!mach_port_insert_right(*MEMORY[0x1E0C883F0], *notify_port, *notify_port, 0x14u))
      {
        global_queue = dispatch_get_global_queue(2, 0);
        v57[0] = MEMORY[0x1E0C87450];
        v57[1] = 0x40000000;
        v57[2] = sub_1AEA562D4;
        v57[3] = &unk_1E5E0D420;
        v58 = v41;
        v57[4] = v8;
        v47 = sub_1AEA53E04((char *)name, (unsigned int *)out_token, global_queue, v57, *notify_port);
        v11 = v47;
        if ((flags & 1) != 0 || !v47)
        {
          if (!v47)
            sub_1AEA52090(v8, *notify_port, flags);
        }
        else
        {
          mach_port_destruct(*v42, v41, 0, 0);
        }
        return v11;
      }
      if ((flags & 1) == 0)
        mach_port_destruct(*v42, v41, 0, 0);
    }
    return 3;
  }
  if (!strncmp(name, "self.", 5uLL))
    __assert_rtn("notify_register_mach_port_no_dispatch", "notify_client.c", 3044, "strncmp(name, SELF_PREFIX, SELF_PREFIX_LEN)");
  if (byte_1EEE120B0)
  {
    qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
LABEL_79:
    __assert_rtn("notify_register_mach_port_no_dispatch", "notify_client.c", 3084, "*notify_port == MACH_PORT_NULL");
  }
  if ((flags & 1) != 0 && *notify_port + 1 < 2)
    return 3;
  if (!*(_DWORD *)(v8 + 384))
  {
    v44 = sub_1AEA53FC8(v8);
    if (v44)
    {
      v11 = v44;
      if (v44 < 0xB)
        return v11;
      v11 = 1000000;
      v33 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v33)
      {
LABEL_52:
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v34, v35, v36, v37, v38, v39, v40, (char)"notify_register_mach_port_no_dispatch");
        return v11;
      }
LABEL_66:
      sub_1AEA576FC(v33, "Libnotify: %s failed with code %d on line %d", v35, v36, v37, v38, v39, v40, (char)"notify_register_mach_port_no_dispatch");
      return v11;
    }
  }
  v29 = (unsigned int *)(v8 + 488);
  do
  {
    v30 = __ldxr(v29);
    v31 = v30 + 1;
  }
  while (__stxr(v30 + 1, v29));
  if ((flags & 1) != 0)
  {
    if (sub_1AEA59FAC(*(_DWORD *)(v8 + 384), name, v31, *notify_port))
    {
LABEL_59:
      v20 = os_variant_has_internal_diagnostics();
      v11 = 1000000;
      if ((_DWORD)v20)
      {
        v28 = "notify_register_mach_port_no_dispatch";
        goto LABEL_61;
      }
      v45 = "notify_register_mach_port_no_dispatch";
LABEL_63:
      sub_1AEA576FC(v20, "Libnotify: %s failed with code %d (%d) on line %d", v22, v23, v24, v25, v26, v27, (char)v45);
      return v11;
    }
    v11 = sub_1AEA54D8C(name, -1, v31, v31, -1, 3u, -1, -1, *notify_port, 0);
    if (v11)
      goto LABEL_69;
    goto LABEL_72;
  }
  LODWORD(v57[0]) = 0;
  *notify_port = 0;
  v32 = sub_1AEA5A0F4(*(_DWORD *)(v8 + 384), name, v31, v57, notify_port);
  if (!LODWORD(v57[0]))
  {
    if (v32)
    {
      mach_port_destruct(*MEMORY[0x1E0C883F0], *notify_port, 0, 0);
      goto LABEL_59;
    }
    v48 = sub_1AEA54D8C(name, -1, v31, v31, -1, 3u, -1, -1, *notify_port, 0);
    if (v48)
    {
      v11 = v48;
      mach_port_destruct(*MEMORY[0x1E0C883F0], *notify_port, 0, 0);
LABEL_69:
      if (v11 < 0xB)
        return v11;
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if ((_DWORD)has_internal_diagnostics)
      {
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v49, v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port_no_dispatch");
        return 1000000;
      }
      v43 = "notify_register_mach_port_no_dispatch";
      goto LABEL_44;
    }
LABEL_72:
    sub_1AEA52090(v8, *notify_port, flags);
    v11 = 0;
    if (out_token)
      *out_token = v31;
    return v11;
  }
  if (*notify_port)
    goto LABEL_79;
  v11 = v57[0];
  if (LODWORD(v57[0]) >= 0xB)
  {
    v11 = 1000000;
    v33 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v33)
      goto LABEL_52;
    goto LABEL_66;
  }
  return v11;
}

void sub_1AEA52090(uint64_t a1, int a2, int a3)
{
  char v3;
  os_unfair_lock_s *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;

  if (a2)
  {
    v3 = a3;
    if ((a3 & 0x40000000) == 0)
    {
      v6 = (os_unfair_lock_s *)(a1 + 104);
      os_unfair_lock_lock_with_options();
      v7 = *(_DWORD **)(a1 + 552);
      v8 = *(unsigned int *)(a1 + 544);
      if ((_DWORD)v8)
      {
        v9 = 0;
        v10 = *(int **)(a1 + 552);
        while (1)
        {
          v11 = *v10;
          v10 += 3;
          if (v11 == a2)
            break;
          if (v8 == ++v9)
            goto LABEL_7;
        }
        ++v7[3 * v9 + 1];
        goto LABEL_15;
      }
LABEL_7:
      *(_DWORD *)(a1 + 544) = v8 + 1;
      v12 = *(_DWORD *)(a1 + 548);
      if (v8 < v12
        || (v12 >= 4 ? (v13 = 2 * v12) : (v13 = 4),
            *(_DWORD *)(a1 + 548) = v13,
            v7 = reallocf(v7, 12 * v13),
            (*(_QWORD *)(a1 + 552) = v7) != 0))
      {
        v14 = (char *)&v7[3 * v8];
        *(_DWORD *)v14 = a2;
        *((_DWORD *)v14 + 1) = 1;
        v14[8] = (v3 & 1) == 0;
LABEL_15:
        os_unfair_lock_unlock(v6);
        return;
      }
      qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: Unable to allocate port array: possible notification registration leak";
      __break(1u);
    }
  }
}

uint32_t notify_cancel(int token)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint32_t v6;
  int v7;
  unsigned int v9;
  uint64_t has_internal_diagnostics;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v1 + 116) & 2) == 0)
  {
LABEL_5:
    os_unfair_lock_lock_with_options();
    v3 = os_set_32_ptr_find();
    if (v3 && (v4 = *(_QWORD *)(v1 + 448), v5 = v3 - v4, v3 != v4))
    {
      v7 = *(_DWORD *)(v5 + 24);
      if ((v7 & 0x1000000) == 0)
      {
        *(_DWORD *)(v5 + 24) = v7 | 0x1000000;
        sub_1AEA557E4(v1, (char *)v5);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
      return 0;
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
      return 2;
    }
  }
  os_unfair_lock_lock_with_options();
  v2 = *(_DWORD **)(v1 + 592);
  if (!v2 || *v2 == *(_DWORD *)(v1 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    goto LABEL_5;
  }
  v9 = sub_1AEA578B0(v1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
  if (!v9)
    goto LABEL_5;
  v6 = v9;
  if (v9 >= 0xB)
  {
    v6 = 1000000;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v11, v12, v13, v14, v15, v16, v17, (char)"notify_cancel");
    else
      sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, (char)"notify_cancel");
  }
  return v6;
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  uint64_t v4;
  _DWORD *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t has_internal_diagnostics;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  int v32;
  mach_msg_size_t v33;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v35;
  int v36;
  BOOL v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
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
  uint64_t v58;
  uint64_t v59;
  _BYTE msg[64];
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
  __int128 v87;
  __int128 v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C874D8];
  v4 = sub_1AEA55D3C();
  if ((sub_1AEA57F50(name) & 1) == 0 && os_variant_has_internal_diagnostics())
    sub_1AEA56E70("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v44, v45, v46, v47, v48, v49, v50, (char)name);
  v59 = 0;
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      v10 = sub_1AEA578B0(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v10)
      {
        if (v10 < 0xB)
          return v10;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
          goto LABEL_28;
        goto LABEL_24;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  if ((*(_DWORD *)(v4 + 116) & 4) == 0)
  {
    if (!name)
      return 1;
    if (!out_token)
      return 10;
    *out_token = -1;
    if (!strncmp(name, "self.", 5uLL))
      goto LABEL_13;
    if (qword_1ECCD9400 != -1)
      dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
    if (byte_1EEE120B0)
    {
LABEL_13:
      v6 = (unsigned int *)(v4 + 488);
      do
      {
        v7 = __ldxr(v6);
        v8 = v7 + 1;
      }
      while (__stxr(v7 + 1, v6));
      v9 = sub_1AEA57660(v4 + 128, name, v8, &v59);
      if (v9)
      {
        v10 = v9;
        if (v9 >= 0xB)
        {
          v10 = 1000000;
          v11 = os_variant_has_internal_diagnostics();
          if ((_DWORD)v11)
          {
LABEL_18:
            v19 = "Libnotify: %s failed with code %d on line %d";
LABEL_68:
            sub_1AEA56E70(v19, v12, v13, v14, v15, v16, v17, v18, (char)"notify_register_check");
            return v10;
          }
          goto LABEL_35;
        }
        return v10;
      }
      v28 = sub_1AEA54D8C(name, v59, v8, v8, -1, 0x80000002, -1, -1, 0, 0);
      v10 = v28;
      if (v28)
      {
        if (v28 < 0xB)
          return v10;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
          goto LABEL_28;
        goto LABEL_24;
      }
      goto LABEL_77;
    }
    v29 = *(_DWORD *)(v4 + 384);
    if (!v29)
    {
      v38 = sub_1AEA53FC8(v4);
      if (v38)
      {
        v10 = v38;
        if (v38 < 0xB)
          return v10;
        v10 = 1000000;
        v11 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v11)
          goto LABEL_18;
        goto LABEL_35;
      }
      v29 = *(_DWORD *)(v4 + 384);
    }
    v30 = (unsigned int *)(v4 + 488);
    do
    {
      v31 = __ldxr(v30);
      v8 = v31 + 1;
    }
    while (__stxr(v31 + 1, v30));
    v87 = 0u;
    v88 = 0u;
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
    memset(msg, 0, sizeof(msg));
    *(_QWORD *)&msg[24] = *MEMORY[0x1E0C87D40];
    if (MEMORY[0x1E0C884E8])
      v32 = mig_strncpy_zerofill(&msg[40], name, 512);
    else
      v32 = mig_strncpy(&msg[40], name, 512);
    *(_DWORD *)&msg[32] = 0;
    *(_DWORD *)&msg[36] = v32;
    v33 = ((v32 + 3) & 0xFFFFFFFC) + 44;
    *(_DWORD *)&msg[((v32 + 3) & 0xFFFFFFFC) + 40] = v8;
    special_reply_port = mig_get_special_reply_port();
    *(_QWORD *)&msg[8] = __PAIR64__(special_reply_port, v29);
    *(_DWORD *)msg = 5395;
    *(_QWORD *)&msg[16] = 0x3F400000000;
    if (MEMORY[0x1E0C88840])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      special_reply_port = *(_DWORD *)&msg[12];
    }
    v35 = mach_msg((mach_msg_header_t *)msg, 3162115, v33, 0x40u, special_reply_port, 0, 0);
    v36 = v35;
    if ((v35 - 268435458) <= 0xE && ((1 << (v35 - 2)) & 0x4003) != 0)
    {
LABEL_66:
      v10 = 1000000;
      v39 = os_variant_has_internal_diagnostics();
      if (!(_DWORD)v39)
      {
        sub_1AEA576FC(v39, "Libnotify: %s failed with code %d (%d) on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_register_check");
        return v10;
      }
      v19 = "Libnotify: %s failed with code %d (%d) on line %d";
      goto LABEL_68;
    }
    if (v35)
    {
      mig_dealloc_special_reply_port();
LABEL_65:
      if (v36)
        goto LABEL_66;
      v40 = 0;
      v41 = 0;
      goto LABEL_71;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v36 = -308;
    }
    else if (*(_DWORD *)&msg[20] == 1112)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 56)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v36 = *(_DWORD *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              v10 = *(_DWORD *)&msg[52];
              if (*(_DWORD *)&msg[52])
              {
                if (*(_DWORD *)&msg[52] < 0xBu)
                  return v10;
                v51 = os_variant_has_internal_diagnostics();
                if ((_DWORD)v51)
                  sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v52, v53, v54, v55, v56, v57, v58, (char)"notify_register_check");
                else
                  sub_1AEA576FC(v51, "Libnotify: %s failed with code %d on line %d", v53, v54, v55, v56, v57, v58, (char)"notify_register_check");
                return 1000000;
              }
              v41 = *(_DWORD *)&msg[36];
              v40 = *(_QWORD *)&msg[44];
              if (*(_DWORD *)&msg[36] == -1)
              {
                v42 = sub_1AEA54D8C(name, *(uint64_t *)&msg[44], v8, v8, -1, 0x40000002u, -1, -1, 0, 0);
                goto LABEL_73;
              }
              v36 = *(_DWORD *)&msg[40];
LABEL_71:
              os_unfair_lock_lock_with_options();
              if (!*(_QWORD *)(v4 + 592))
              {
                if (!sub_1AEA52A1C(v41))
                {
                  v10 = 1000000;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
                  return v10;
                }
                if (!*(_QWORD *)(v4 + 592))
                {
                  v10 = 1000000;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
                  v11 = os_variant_has_internal_diagnostics();
                  if ((_DWORD)v11)
                    goto LABEL_18;
LABEL_35:
                  sub_1AEA576FC(v11, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_register_check");
                  return v10;
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
              v42 = sub_1AEA54D8C(name, v40, v8, v8, v36, 0x40000001u, -1, -1, 0, 0);
LABEL_73:
              v10 = v42;
              if (v42)
              {
                if (v42 < 0xB)
                  return v10;
                has_internal_diagnostics = os_variant_has_internal_diagnostics();
                if (!(_DWORD)has_internal_diagnostics)
                {
LABEL_28:
                  sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v22, v23, v24, v25, v26, v27, (char)"notify_register_check");
                  return 1000000;
                }
LABEL_24:
                sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v21, v22, v23, v24, v25, v26, v27, (char)"notify_register_check");
                return 1000000;
              }
LABEL_77:
              *out_token = v8;
              return v10;
            }
            goto LABEL_64;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v37 = 1;
          else
            v37 = *(_DWORD *)&msg[32] == 0;
          if (v37)
            v36 = -300;
          else
            v36 = *(_DWORD *)&msg[32];
          goto LABEL_64;
        }
      }
      v36 = -300;
    }
    else
    {
      v36 = -301;
    }
LABEL_64:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_65;
  }
  return notify_register_plain(name, out_token);
}

BOOL sub_1AEA52A1C(unsigned int a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  _BOOL8 v5;
  int has_internal_diagnostics;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_1AEA55D3C();
  v3 = shm_open("apple.shm.notification_center", 0, 0);
  if (v3 == -1)
  {
    if (*__error() != 1)
    {
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      v7 = __error();
      if (has_internal_diagnostics)
        sub_1AEA56E70("Libnotify: %s failed on line %d with errno %d", v8, v9, v10, v11, v12, v13, v14, (char)"shm_attach");
      else
        sub_1AEA576FC((uint64_t)v7, "Libnotify: %s failed on line %d with errno %d", v9, v10, v11, v12, v13, v14, (char)"shm_attach");
    }
    return 0;
  }
  else
  {
    v4 = mmap(0, a1, 1, 1, v3, 0);
    v5 = v4 != (void *)-1;
    if (v4 == (void *)-1)
    {
      v15 = os_variant_has_internal_diagnostics();
      v16 = __error();
      if (v15)
        sub_1AEA56E70("Libnotify: %s failed on line %d with errno %d", v17, v18, v19, v20, v21, v22, v23, (char)"shm_attach");
      else
        sub_1AEA576FC((uint64_t)v16, "Libnotify: %s failed on line %d with errno %d", v18, v19, v20, v21, v22, v23, (char)"shm_attach");
    }
    else
    {
      *(_QWORD *)(v2 + 592) = v4;
    }
    close_NOCANCEL();
  }
  return v5;
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  unint64_t v9;
  int v10;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v12;
  int v13;
  uint32_t v14;
  unsigned int v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  mach_port_name_t v27;
  mach_msg_return_t v28;
  BOOL v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint32_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int msg;
  _BYTE msg_4[60];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C874D8];
  v4 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      v16 = sub_1AEA578B0(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v16)
      {
        v14 = v16;
        if (v16 >= 0xB)
        {
          v14 = 1000000;
          has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if ((_DWORD)has_internal_diagnostics)
            sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, v24, (char)"notify_get_state");
          else
            sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, (char)"notify_get_state");
        }
        return v14;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  v6 = sub_1AEA55CB8();
  if (!v6)
    return 2;
  v7 = v6;
  if (!*(_QWORD *)(v6 + 104))
  {
    sub_1AEA55798((char *)v6);
    return 2;
  }
  if ((*(_DWORD *)(v6 + 24) & 0x80000000) == 0)
  {
    if (qword_1ECCD9400 != -1)
      dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
    if (byte_1EEE120B0)
    {
      qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
      __break(1u);
    }
    if (!*(_DWORD *)(v4 + 384))
    {
      v30 = sub_1AEA53FC8(v4);
      if (v30)
      {
        v14 = v30;
        sub_1AEA55798((char *)v7);
        if (v14 >= 0xB)
        {
          v31 = os_variant_has_internal_diagnostics();
          if ((_DWORD)v31)
            sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v32, v33, v34, v35, v36, v37, v38, (char)"notify_get_state");
          else
            sub_1AEA576FC(v31, "Libnotify: %s failed with code %d on line %d", v33, v34, v35, v36, v37, v38, (char)"notify_get_state");
          return 1000000;
        }
        return v14;
      }
    }
    v8 = *(os_unfair_lock_s **)(v7 + 104);
    if ((*(_BYTE *)(v7 + 27) & 4) != 0)
      token = v8[12]._os_unfair_lock_opaque;
    os_unfair_lock_lock_with_options();
    v9 = *(_QWORD *)&v8->_os_unfair_lock_opaque;
    os_unfair_lock_unlock(v8 + 10);
    v10 = *(_DWORD *)(v4 + 384);
    if (v9 >= 0xFFFFFFFFFFFFFFFELL)
    {
      memset(&msg_4[16], 0, 44);
      *(_OWORD *)msg_4 = 0uLL;
      *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C87D40];
      *(_DWORD *)&msg_4[28] = token;
      special_reply_port = mig_get_special_reply_port();
      *(_DWORD *)&msg_4[4] = v10;
      *(_DWORD *)&msg_4[8] = special_reply_port;
      msg = 5395;
      *(_QWORD *)&msg_4[12] = 0x3FA00000000;
      if (MEMORY[0x1E0C88840])
      {
        voucher_mach_msg_set((mach_msg_header_t *)&msg);
        special_reply_port = *(_DWORD *)&msg_4[8];
      }
      v12 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
      v13 = v12;
      if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
      {
        sub_1AEA55798((char *)v7);
LABEL_81:
        v14 = 1000000;
        v41 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v41)
          sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v42, v43, v44, v45, v46, v47, v48, (char)"notify_get_state");
        else
          sub_1AEA576FC(v41, "Libnotify: %s failed with code %d (%d) on line %d", v43, v44, v45, v46, v47, v48, (char)"notify_get_state");
        return v14;
      }
      if (v12)
      {
        mig_dealloc_special_reply_port();
LABEL_89:
        v40 = 0;
        goto LABEL_90;
      }
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v13 = -308;
      }
      else if (*(_DWORD *)&msg_4[16] == 1118)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 56)
          {
            if (!*(_DWORD *)&msg_4[4])
            {
              v13 = *(_DWORD *)&msg_4[28];
              if (!*(_DWORD *)&msg_4[28])
              {
                *state64 = *(_QWORD *)&msg_4[32];
                v9 = *(_QWORD *)&msg_4[40];
                v40 = *(_DWORD *)&msg_4[48];
LABEL_90:
                if (!(v13 | v40))
                {
                  sub_1AEA53194(v8, v9);
                  sub_1AEA55798((char *)v7);
                  return 0;
                }
LABEL_80:
                sub_1AEA55798((char *)v7);
                if (!v13 && v40 < 0xB)
                  return v40;
                goto LABEL_81;
              }
              goto LABEL_88;
            }
          }
          else if (*(_DWORD *)msg_4 == 36)
          {
            if (*(_DWORD *)&msg_4[4])
              v39 = 1;
            else
              v39 = *(_DWORD *)&msg_4[28] == 0;
            if (v39)
              v13 = -300;
            else
              v13 = *(_DWORD *)&msg_4[28];
            goto LABEL_88;
          }
        }
        v13 = -300;
      }
      else
      {
        v13 = -301;
      }
LABEL_88:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      goto LABEL_89;
    }
    memset(&msg_4[16], 0, 36);
    *(_OWORD *)msg_4 = 0uLL;
    *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C87D40];
    *(_QWORD *)&msg_4[28] = v9;
    v27 = mig_get_special_reply_port();
    *(_DWORD *)&msg_4[4] = v10;
    *(_DWORD *)&msg_4[8] = v27;
    msg = 5395;
    *(_QWORD *)&msg_4[12] = 0x3F900000000;
    if (MEMORY[0x1E0C88840])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      v27 = *(_DWORD *)&msg_4[8];
    }
    v28 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x38u, v27, 0, 0);
    v13 = v28;
    if ((v28 - 268435458) > 0xE || ((1 << (v28 - 2)) & 0x4003) == 0)
    {
      if (!v28)
      {
        if (*(_DWORD *)&msg_4[16] == 71)
        {
          v13 = -308;
        }
        else if (*(_DWORD *)&msg_4[16] == 1117)
        {
          if ((msg & 0x80000000) == 0)
          {
            if (*(_DWORD *)msg_4 == 48)
            {
              if (!*(_DWORD *)&msg_4[4])
              {
                v13 = *(_DWORD *)&msg_4[28];
                if (!*(_DWORD *)&msg_4[28])
                {
                  *state64 = *(_QWORD *)&msg_4[32];
                  v40 = *(_DWORD *)&msg_4[40];
                  goto LABEL_80;
                }
                goto LABEL_78;
              }
            }
            else if (*(_DWORD *)msg_4 == 36)
            {
              if (*(_DWORD *)&msg_4[4])
                v29 = 1;
              else
                v29 = *(_DWORD *)&msg_4[28] == 0;
              if (v29)
                v13 = -300;
              else
                v13 = *(_DWORD *)&msg_4[28];
              goto LABEL_78;
            }
          }
          v13 = -300;
        }
        else
        {
          v13 = -301;
        }
LABEL_78:
        mach_msg_destroy((mach_msg_header_t *)&msg);
        goto LABEL_79;
      }
      mig_dealloc_special_reply_port();
    }
LABEL_79:
    v40 = 0;
    goto LABEL_80;
  }
  if (state64)
  {
    *state64 = 0;
    os_unfair_lock_lock_with_options();
    v25 = os_set_64_ptr_find();
    if (v25 && (v26 = *(_QWORD *)(v4 + 192), v26 != v25))
    {
      v14 = 0;
      *state64 = *(_QWORD *)(v25 - v26 + 24);
    }
    else
    {
      v14 = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 344));
  }
  else
  {
    v14 = 10;
  }
  sub_1AEA55798((char *)v7);
  return v14;
}

void sub_1AEA53194(os_unfair_lock_s *a1, uint64_t a2)
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = a1 + 10;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_assert_owner(v4);
    *(_QWORD *)&a1->_os_unfair_lock_opaque = a2;
    os_unfair_lock_unlock(v4);
  }
}

uint32_t notify_check(int token, int *check)
{
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t has_internal_diagnostics;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  BOOL v31;
  _BYTE msg[36];
  __int128 v34;

  v4 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      v12 = sub_1AEA578B0(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v12)
      {
        v11 = v12;
        if (v12 >= 0xB)
        {
          v11 = 1000000;
          has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if ((_DWORD)has_internal_diagnostics)
          {
LABEL_65:
            sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v14, v15, v16, v17, v18, v19, v20, (char)"notify_check");
            goto LABEL_68;
          }
LABEL_67:
          sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v15, v16, v17, v18, v19, v20, (char)"notify_check");
          goto LABEL_68;
        }
        goto LABEL_68;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  if (check)
  {
    v6 = sub_1AEA55CB8();
    if (v6)
    {
      v7 = v6;
      if ((*(_DWORD *)(v6 + 24) & 0x80000000) != 0)
      {
        os_unfair_lock_lock_with_options();
        v21 = os_set_64_ptr_find();
        if (v21 && (v22 = *(_QWORD *)(v4 + 224), v22 != v21))
        {
          v28 = v21 - v22;
          v29 = *(_DWORD *)(*(_QWORD *)(v28 + 48) + 60);
          if (v29 == *(_DWORD *)(v28 + 72))
          {
            v30 = 0;
          }
          else
          {
            *(_DWORD *)(v28 + 72) = v29;
            v30 = 1;
          }
          v10 = 0;
          *check = v30;
        }
        else
        {
          v10 = 2;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 344));
LABEL_63:
        sub_1AEA55798((char *)v7);
        if (v10 < 0xB)
        {
          v11 = v10;
          goto LABEL_68;
        }
        v11 = 1000000;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
          goto LABEL_65;
        goto LABEL_67;
      }
      if (qword_1ECCD9400 != -1)
        dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
      if (byte_1EEE120B0)
      {
        qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return v6;
      }
      v8 = *(_DWORD *)(v7 + 24);
      if ((v8 & 0xF) == 1)
      {
        if (*(_QWORD *)(v4 + 592))
        {
          *check = 0;
          os_unfair_lock_lock_with_options();
          v9 = *(_QWORD *)(v4 + 592);
          if (*(_DWORD *)(v7 + 32) != *(_DWORD *)(v9 + 4 * *(unsigned int *)(v7 + 28)))
          {
            *check = 1;
            *(_DWORD *)(v7 + 32) = *(_DWORD *)(v9 + 4 * *(unsigned int *)(v7 + 28));
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 108));
          v10 = 0;
        }
        else
        {
          v10 = 32;
        }
        goto LABEL_63;
      }
      if (!*(_DWORD *)(v4 + 384))
      {
        v10 = sub_1AEA53FC8(v4);
        if (v10)
          goto LABEL_63;
        v8 = *(_DWORD *)(v7 + 24);
      }
      v23 = token;
      if ((v8 & 0x4000000) != 0)
        v23 = *(_DWORD *)(*(_QWORD *)(v7 + 104) + 48);
      v24 = *(_DWORD *)(v4 + 384);
      *(_OWORD *)&msg[20] = 0u;
      v34 = 0u;
      *(_OWORD *)&msg[4] = 0u;
      *(_QWORD *)&msg[24] = *MEMORY[0x1E0C87D40];
      *(_DWORD *)&msg[32] = v23;
      special_reply_port = mig_get_special_reply_port();
      *(_DWORD *)&msg[8] = v24;
      *(_DWORD *)&msg[12] = special_reply_port;
      *(_DWORD *)msg = 5395;
      *(_QWORD *)&msg[16] = 0x3EA00000000;
      if (MEMORY[0x1E0C88840])
      {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
        special_reply_port = *(_DWORD *)&msg[12];
      }
      v26 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
      v27 = v26;
      if ((v26 - 268435458) <= 0xE && ((1 << (v26 - 2)) & 0x4003) != 0)
      {
        v10 = 33;
        goto LABEL_63;
      }
      if (v26)
      {
        mig_dealloc_special_reply_port();
        goto LABEL_60;
      }
      if (*(_DWORD *)&msg[20] == 71)
      {
        v27 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 1102)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v27 = *(_DWORD *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v10 = DWORD1(v34);
                *check = v34;
                goto LABEL_63;
              }
              goto LABEL_59;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v31 = 1;
            else
              v31 = *(_DWORD *)&msg[32] == 0;
            if (v31)
              v27 = -300;
            else
              v27 = *(_DWORD *)&msg[32];
            goto LABEL_59;
          }
        }
        v27 = -300;
      }
      else
      {
        v27 = -301;
      }
LABEL_59:
      mach_msg_destroy((mach_msg_header_t *)msg);
LABEL_60:
      if (v27)
        v10 = 33;
      else
        v10 = 0;
      goto LABEL_63;
    }
    v11 = 2;
  }
  else
  {
    v11 = 10;
  }
LABEL_68:
  LODWORD(v6) = v11;
  return v6;
}

uint32_t notify_post(const char *name)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint32_t v7;
  unsigned int v9;
  uint64_t has_internal_diagnostics;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  mach_port_name_t v35;
  mach_port_t v36;
  unsigned int v37;
  mach_msg_size_t v38;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v40;
  uint64_t v41;
  unsigned int v42;
  mach_msg_header_t msg[23];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C874D8];
  v2 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v2 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v3 = *(_DWORD **)(v2 + 592);
    if (v3 && *v3 != *(_DWORD *)(v2 + 112))
    {
      v9 = sub_1AEA578B0(v2);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
      if (v9)
      {
        v7 = v9;
        if (v9 < 0xB)
          return v7;
        v7 = 1000000;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
        {
LABEL_36:
          sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, (char)"notify_post");
          return v7;
        }
LABEL_22:
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v11, v12, v13, v14, v15, v16, v17, (char)"notify_post");
        return v7;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    }
  }
  if (!name)
    return 1;
  if (!strncmp(name, "self.", 5uLL))
    goto LABEL_10;
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
  {
LABEL_10:
    os_unfair_lock_lock_with_options();
    v4 = os_set_str_ptr_find();
    if (v4)
    {
      v5 = v4 - *(_QWORD *)(v2 + 160);
      if (v5)
      {
        if (*(_QWORD *)(v5 + 8))
        {
          ++*(_DWORD *)(v5 + 60);
          v6 = *(_QWORD **)v5;
          if (*(_QWORD *)v5)
          {
            do
            {
              sub_1AEA56EE8(v2 + 128, (uint64_t)v6);
              v6 = (_QWORD *)*v6;
            }
            while (v6);
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 344));
    return 0;
  }
  if (!*(_DWORD *)(v2 + 384))
  {
    v31 = sub_1AEA53FC8(v2);
    if (v31)
    {
      v7 = v31;
      if (v31 < 0xB)
        return v7;
      v7 = 1000000;
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (!(_DWORD)has_internal_diagnostics)
        goto LABEL_36;
      goto LABEL_22;
    }
  }
  v18 = sub_1AEA55D3C();
  v19 = (os_unfair_lock_s *)(v18 + 104);
  os_unfair_lock_lock_with_options();
  v20 = (os_unfair_lock_s *)sub_1AEA55070(v18, name, -1, 0);
  os_unfair_lock_unlock(v19);
  if (!v20)
  {
    v32 = *(_DWORD *)(v2 + 384);
    if ((*(_DWORD *)(v2 + 116) & 4) != 0)
    {
      if (qword_1ECCD93F8 != -1)
        dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
      v33 = sub_1AEA55504(v32, name, byte_1ECCD93F0);
    }
    else
    {
      if (qword_1ECCD93F8 != -1)
        dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
      v33 = sub_1AEA55248(v32, name, byte_1ECCD93F0);
    }
    if (!v33)
      return 0;
    v23 = os_variant_has_internal_diagnostics();
    v7 = 1000000;
    if (!(_DWORD)v23)
      goto LABEL_77;
    goto LABEL_76;
  }
  os_unfair_lock_lock_with_options();
  if ((*(_DWORD *)(v2 + 116) & 4) != 0)
  {
    v42 = *(_DWORD *)(v2 + 384);
    if (qword_1ECCD93F8 != -1)
      dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
    if (sub_1AEA55504(v42, name, byte_1ECCD93F0))
    {
      sub_1AEA551B4(v20);
      v23 = os_variant_has_internal_diagnostics();
      v7 = 1000000;
      if ((_DWORD)v23)
        goto LABEL_76;
      goto LABEL_77;
    }
    goto LABEL_68;
  }
  v21 = *(_QWORD *)&v20->_os_unfair_lock_opaque;
  if (*(_QWORD *)&v20->_os_unfair_lock_opaque == -2)
  {
    v34 = *(_DWORD *)(v2 + 384);
    if (qword_1ECCD93F8 != -1)
      dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
    v35 = byte_1ECCD93F0;
    memset(msg, 0, 512);
    *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C87D40];
    if (MEMORY[0x1E0C884E8])
      v36 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, name, 512);
    else
      v36 = mig_strncpy((char *)&msg[1].msgh_voucher_port, name, 512);
    msg[1].msgh_remote_port = 0;
    msg[1].msgh_local_port = v36;
    v38 = ((v36 + 3) & 0xFFFFFFFC) + 44;
    *(mach_port_name_t *)((char *)&msg[1].msgh_voucher_port + ((v36 + 3) & 0xFFFFFFFC)) = v35;
    special_reply_port = mig_get_special_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(special_reply_port, v34);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x3F000000000;
    if (MEMORY[0x1E0C88840])
    {
      voucher_mach_msg_set(msg);
      special_reply_port = msg[0].msgh_local_port;
    }
    v40 = mach_msg(msg, 3162115, v38, 0x38u, special_reply_port, 0, 0);
    if ((v40 - 268435458) > 0xE || ((1 << (v40 - 2)) & 0x4003) == 0)
    {
      if (v40)
      {
        mig_dealloc_special_reply_port();
      }
      else if (msg[0].msgh_id != 1108
             || (msg[0].msgh_bits & 0x80000000) != 0
             || *(_QWORD *)&msg[0].msgh_size != 48
             || msg[1].msgh_remote_port)
      {
        mach_msg_destroy(msg);
      }
      else
      {
        if (!msg[1].msgh_id)
        {
          v41 = *(_QWORD *)&msg[1].msgh_local_port;
          os_unfair_lock_assert_owner(v20 + 10);
          goto LABEL_67;
        }
        if (msg[1].msgh_id == 60)
        {
          os_unfair_lock_assert_owner(v20 + 10);
          v41 = -1;
LABEL_67:
          *(_QWORD *)&v20->_os_unfair_lock_opaque = v41;
          goto LABEL_68;
        }
      }
    }
    v7 = 1000000;
    sub_1AEA551B4(v20);
    v23 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v23)
      goto LABEL_77;
LABEL_76:
    sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v24, v25, v26, v27, v28, v29, v30, (char)"notify_post");
    return v7;
  }
  if (v21 == -1)
  {
    v22 = *(_DWORD *)(v2 + 384);
    if (qword_1ECCD93F8 != -1)
      dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
    if (sub_1AEA55248(v22, name, byte_1ECCD93F0))
    {
      sub_1AEA551B4(v20);
      v23 = os_variant_has_internal_diagnostics();
      v7 = 1000000;
      if ((_DWORD)v23)
        goto LABEL_76;
LABEL_77:
      sub_1AEA576FC(v23, "Libnotify: %s failed with code %d (%d) on line %d", v25, v26, v27, v28, v29, v30, (char)"notify_post");
      return v7;
    }
    os_unfair_lock_assert_owner(v20 + 10);
    v41 = -2;
    goto LABEL_67;
  }
  v37 = *(_DWORD *)(v2 + 384);
  if (qword_1ECCD93F8 != -1)
    dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
  *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C87D40];
  *(_QWORD *)&msg[1].msgh_remote_port = v21;
  msg[1].msgh_voucher_port = byte_1ECCD93F0;
  *(_QWORD *)&msg[0].msgh_bits = 19;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x3F100000000;
  *(_QWORD *)&msg[0].msgh_remote_port = v37;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(msg);
  if (mach_msg(msg, 2097153, 0x2Cu, 0, 0, 0, 0))
  {
    sub_1AEA551B4(v20);
    v23 = os_variant_has_internal_diagnostics();
    v7 = 1000000;
    if ((_DWORD)v23)
      goto LABEL_76;
    goto LABEL_77;
  }
LABEL_68:
  sub_1AEA551B4(v20);
  return 0;
}

uint64_t sub_1AEA53E04(char *a1, unsigned int *a2, NSObject *a3, const void *a4, int a5)
{
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t has_internal_diagnostics;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v10 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v10 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v11 = *(_DWORD **)(v10 + 592);
    if (v11 && *v11 != *(_DWORD *)(v10 + 112))
    {
      v15 = sub_1AEA578B0(v10);
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 104));
      if ((_DWORD)v15)
      {
        v12 = v15;
        if (v15 < 0xB)
          return v12;
        v12 = 1000000;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
          goto LABEL_15;
        goto LABEL_16;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 104));
    }
  }
  v12 = 10;
  if (a3)
  {
    if (a4)
    {
      notify_set_options(3);
      v12 = sub_1AEA54714(a1, a2, v10, a5);
      if (!(_DWORD)v12)
      {
        v13 = sub_1AEA55CB8();
        if (v13)
        {
          v14 = v13;
          *(_QWORD *)(v13 + 48) = a3;
          dispatch_retain(a3);
          *(_QWORD *)(v14 + 56) = _Block_copy(a4);
          sub_1AEA55798((char *)v14);
          return 0;
        }
        v12 = 1000000;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
LABEL_15:
          sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v17, v18, v19, v20, v21, v22, v23, (char)"_notify_register_dispatch_with_extra_mp");
          return v12;
        }
LABEL_16:
        sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, (char)"_notify_register_dispatch_with_extra_mp");
      }
    }
  }
  return v12;
}

uint64_t sub_1AEA53FC8(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (os_unfair_lock_s *)(a1 + 104);
  os_unfair_lock_lock_with_options();
  sub_1AEA54010(a1, 0);
  v4 = v3;
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_1AEA54010(uint64_t a1, int a2)
{
  char *v4;
  const char *v5;
  _BYTE *v6;
  char *v7;
  char *v8;
  char *v9;
  _QWORD *v10;
  unsigned int *v11;
  unsigned int v12;
  int v13;
  kern_return_t v14;
  int v15;
  uintptr_t v16;
  NSObject *global_queue;
  NSObject *v18;
  int v19;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t *v25;
  unsigned int v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  _QWORD block[6];
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char *__lasts;
  uint64_t v39;
  uint64_t v40;
  _BYTE name[36];
  __int128 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C874D8];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2000000000;
  v36 = 0;
  v32 = 0;
  if ((*(_DWORD *)(a1 + 116) & 0x8000000) != 0)
    goto LABEL_45;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  if (os_variant_has_internal_diagnostics() && (v4 = getenv("DarwinNotificationLogging")) != 0)
  {
    v5 = v4;
    if (!strcmp(v4, "1"))
    {
      *(_QWORD *)name = 0;
      *(_QWORD *)&name[8] = 0;
      v39 = 0;
      v40 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        *(_QWORD *)name = 0;
        *(_QWORD *)&name[8] = 0;
      }
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        __lasts = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        v39 = 0;
        v40 = 0;
      }
      _os_log_simple();
      v6 = &unk_1EEE12050;
    }
    else
    {
      v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x10800400F6048E3uLL);
      *v6 = 0;
      os_set_str_ptr_init();
      v7 = strdup(v5);
      __lasts = 0;
      v8 = strtok_r(v7, ",", &__lasts);
      if (v8)
      {
        v9 = v8;
        do
        {
          v10 = malloc_type_calloc(1uLL, 8uLL, 0x50040EE9192B6uLL);
          *v10 = strdup(v9);
          os_set_str_ptr_insert();
          *(_QWORD *)name = 0;
          *(_QWORD *)&name[8] = 0;
          v39 = 0;
          v40 = 0;
          if ((_dyld_get_image_uuid() & 1) == 0)
          {
            *(_QWORD *)name = 0;
            *(_QWORD *)&name[8] = 0;
          }
          if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          {
            v37 = 0;
            _dyld_get_shared_cache_range();
          }
          else
          {
            v39 = 0;
            v40 = 0;
          }
          _os_log_simple();
          v9 = strtok_r(0, ",", &__lasts);
        }
        while (v9);
      }
      free(v7);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = (unsigned int *)(a1 + 116);
  *(_QWORD *)(a1 + 584) = v6;
  if (_dispatch_is_multithreaded())
  {
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 | 3, v11));
  }
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0 && (*v11 & 1) != 0)
  {
    if ((*(_DWORD *)(a1 + 392) + 1) <= 1)
    {
      *(_DWORD *)name = 0;
      v14 = mach_port_allocate(*MEMORY[0x1E0C883F0], 1u, (mach_port_name_t *)name);
      *((_DWORD *)v34 + 6) = v14;
      if (!v14)
        sub_1AEA577B8(a1, *(unsigned int *)name);
    }
    goto LABEL_45;
  }
  *((_DWORD *)v34 + 6) = 0;
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = sub_1AEA510F8;
  block[3] = &unk_1E5E0D290;
  block[4] = &v33;
  block[5] = a1;
  if (*(_QWORD *)(a1 + 376) != -1)
    dispatch_once((dispatch_once_t *)(a1 + 376), block);
  if (*((_DWORD *)v34 + 6) || (v13 = *(_DWORD *)(a1 + 384), (v13 + 1) < 2))
  {
LABEL_45:
    _Block_object_dispose(&v33, 8);
    return;
  }
  v15 = *(_DWORD *)(a1 + 112);
  if (a2 != 1 && v15)
  {
LABEL_36:
    if (!*(_QWORD *)(a1 + 408) && (*v11 & 2) != 0)
    {
      v16 = *(int *)(a1 + 112);
      if ((_DWORD)v16)
      {
        global_queue = dispatch_get_global_queue(2, 0);
        v18 = dispatch_source_create(MEMORY[0x1E0C86F10], v16, 0x80000000uLL, global_queue);
        *(_QWORD *)(a1 + 408) = v18;
        dispatch_source_set_event_handler_f(v18, (dispatch_function_t)sub_1AEA57874);
        dispatch_resume(*(dispatch_object_t *)(a1 + 408));
      }
    }
    if ((*v11 & 1) != 0 && (*(_DWORD *)(a1 + 392) + 1) <= 1)
    {
      *(_DWORD *)name = 0;
      v19 = sub_1AEA55380(*(_DWORD *)(a1 + 384), &v32, name);
      *((_DWORD *)v34 + 6) = v19;
      if (!v19 && !v32)
        sub_1AEA577B8(a1, *(unsigned int *)name);
    }
    goto LABEL_45;
  }
  LODWORD(v39) = 0;
  LODWORD(__lasts) = 0;
  *(_DWORD *)(a1 + 112) = 0;
  v43 = 0;
  v42 = 0u;
  memset(&name[4], 0, 32);
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&name[8] = v13;
  *(_DWORD *)&name[12] = special_reply_port;
  *(_DWORD *)name = 5395;
  *(_QWORD *)&name[16] = 0x3FF00000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)name);
    special_reply_port = *(_DWORD *)&name[12];
  }
  v21 = mach_msg((mach_msg_header_t *)name, 3227651, 0x18u, 0x38u, special_reply_port, 0, 0);
  v22 = v21;
  if ((v21 - 268435458) <= 0xE && ((1 << (v21 - 2)) & 0x4003) != 0)
  {
    *((_DWORD *)v34 + 6) = v21;
LABEL_74:
    v24 = sub_1AEA5098C(*(_DWORD *)(a1 + 384), &v39, &__lasts, &v32);
    v25 = v34;
    *((_DWORD *)v34 + 6) = v24;
    if (!v24)
    {
      do
        v26 = __ldxr(v11);
      while (__stxr(v26 | 7, v11));
      v24 = *((_DWORD *)v25 + 6);
    }
    if (v24 || v32)
      goto LABEL_45;
    goto LABEL_79;
  }
  if (v21)
  {
    mig_dealloc_special_reply_port();
    goto LABEL_73;
  }
  if (*(_DWORD *)&name[20] == 71)
  {
    v22 = -308;
LABEL_72:
    mach_msg_destroy((mach_msg_header_t *)name);
LABEL_73:
    *((_DWORD *)v34 + 6) = v22;
    if (!v22)
      goto LABEL_79;
    goto LABEL_74;
  }
  if (*(_DWORD *)&name[20] != 1123)
  {
    v22 = -301;
    goto LABEL_72;
  }
  if ((*(_DWORD *)name & 0x80000000) != 0)
    goto LABEL_71;
  if (*(_DWORD *)&name[4] != 48)
  {
    if (*(_DWORD *)&name[4] == 36)
    {
      if (*(_DWORD *)&name[8])
        v23 = 1;
      else
        v23 = *(_DWORD *)&name[32] == 0;
      if (v23)
        v22 = -300;
      else
        v22 = *(_DWORD *)&name[32];
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  if (*(_DWORD *)&name[8])
  {
LABEL_71:
    v22 = -300;
    goto LABEL_72;
  }
  v22 = *(_DWORD *)&name[32];
  if (*(_DWORD *)&name[32])
    goto LABEL_72;
  LODWORD(__lasts) = DWORD1(v42);
  LODWORD(v39) = v42;
  v30 = DWORD2(v42);
  v32 = DWORD2(v42);
  *((_DWORD *)v34 + 6) = 0;
  if (v30)
    goto LABEL_45;
LABEL_79:
  if (v39 > 2)
  {
    v27 = (int)__lasts;
    *(_DWORD *)(a1 + 112) = (_DWORD)__lasts;
    if (a2 == 1 && v27 == v15)
      goto LABEL_45;
    v28 = *(NSObject **)(a1 + 408);
    if (v28)
    {
      dispatch_source_cancel(v28);
      dispatch_release(*(dispatch_object_t *)(a1 + 408));
      *(_QWORD *)(a1 + 408) = 0;
    }
    if ((*(_DWORD *)(a1 + 392) + 1) >= 2)
    {
      v29 = *(NSObject **)(a1 + 400);
      if (v29)
      {
        dispatch_source_cancel(v29);
        dispatch_release(*(dispatch_object_t *)(a1 + 400));
        *(_QWORD *)(a1 + 400) = 0;
      }
      *(_DWORD *)(a1 + 392) = 0;
    }
    goto LABEL_36;
  }
  qword_1EEE12078 = (uint64_t)"BUG IN LIBNOTIFY: Unsupported protocol version";
  qword_1EEE120A8 = v39;
  __break(1u);
}

uint64_t sub_1AEA54714(char *__s1, unsigned int *a2, uint64_t a3, int a4)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  mach_port_name_t v25;
  unsigned int v26;
  mach_port_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  unsigned int *v42;
  unsigned int v43;
  char v44;
  uint64_t v45;
  unsigned int *v46;
  unsigned int v47;
  int v48;
  int v49;
  uint64_t has_internal_diagnostics;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  mach_msg_header_t msg[23];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C874D8];
  if (!a3)
    __assert_rtn("notify_register_coalesced_registration", "notify_client.c", 3148, "globals");
  if (!__s1)
    __assert_rtn("notify_register_coalesced_registration", "notify_client.c", 3149, "name");
  if (!strncmp(__s1, "self.", 5uLL))
    return sub_1AEA56B00(__s1, (mach_port_name_t *)(a3 + 392), 1073741825, a2, (os_unfair_lock_s *)a3);
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
    return sub_1AEA56B00(__s1, (mach_port_name_t *)(a3 + 392), 1073741825, a2, (os_unfair_lock_s *)a3);
  if (*(_DWORD *)(a3 + 384) && (*(_DWORD *)(a3 + 392) + 1) > 1 || (v9 = sub_1AEA53FC8(a3), !(_DWORD)v9))
  {
    os_unfair_lock_lock_with_options();
    v19 = os_set_str_ptr_find();
    if (v19)
    {
      v20 = *(_QWORD *)(a3 + 480);
      if (v20 != v19)
      {
        if (*(_QWORD *)(v19 - v20 + 24))
        {
          v21 = os_set_str_ptr_find();
          if (v21)
            v22 = v21 - *(_QWORD *)(a3 + 480);
          else
            v22 = 0;
          v42 = (unsigned int *)(*(_QWORD *)(v22 + 24) + 16);
          do
            v43 = __ldxr(v42);
          while (__stxr(v43 + 1, v42));
          v44 = 0;
LABEL_56:
          os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
          v46 = (unsigned int *)(a3 + 488);
          do
          {
            v47 = __ldxr(v46);
            v48 = v47 + 1;
          }
          while (__stxr(v47 + 1, v46));
          if ((a4 - 1) >= 0xFFFFFFFE)
            v49 = 0;
          else
            v49 = a4;
          v10 = sub_1AEA54D8C(__s1, -1, v48, v48, -1, 0x44000007u, v49, -1, *(_DWORD *)(a3 + 384), v44);
          if ((v44 & 1) == 0)
            sub_1AEA55798(*(char **)(v22 + 24));
          if ((_DWORD)v10)
          {
            if (v10 >= 0xB)
            {
              has_internal_diagnostics = os_variant_has_internal_diagnostics();
              if ((_DWORD)has_internal_diagnostics)
                sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v51, v52, v53, v54, v55, v56, v57, (char)"notify_register_coalesced_registration");
              else
                sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v52, v53, v54, v55, v56, v57, (char)"notify_register_coalesced_registration");
              return 1000000;
            }
          }
          else
          {
            v10 = 0;
            if (a2)
              *a2 = v48;
          }
          return v10;
        }
      }
    }
    v23 = (unsigned int *)(a3 + 488);
    do
    {
      v24 = __ldxr(v23);
      v25 = v24 + 1;
    }
    while (__stxr(v24 + 1, v23));
    v26 = *(_DWORD *)(a3 + 384);
    memset(msg, 0, 512);
    *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C87D40];
    if (MEMORY[0x1E0C884E8])
      v27 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, __s1, 512);
    else
      v27 = mig_strncpy((char *)&msg[1].msgh_voucher_port, __s1, 512);
    msg[1].msgh_remote_port = 0;
    msg[1].msgh_local_port = v27;
    v28 = (v27 + 3) & 0xFFFFFFFC;
    *(mach_port_name_t *)((char *)&msg[1].msgh_voucher_port + v28) = v25;
    msg[0].msgh_bits = 19;
    *(_QWORD *)&msg[0].msgh_remote_port = v26;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x40200000000;
    if (MEMORY[0x1E0C88840])
      voucher_mach_msg_set(msg);
    if (mach_msg(msg, 1, v28 + 44, 0, 0, 0, 0))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
      v29 = os_variant_has_internal_diagnostics();
      v10 = 1000000;
      if ((_DWORD)v29)
        sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v30, v31, v32, v33, v34, v35, v36, (char)"notify_register_coalesced_registration");
      else
        sub_1AEA576FC(v29, "Libnotify: %s failed with code %d (%d) on line %d", v31, v32, v33, v34, v35, v36, (char)"notify_register_coalesced_registration");
      return v10;
    }
    v37 = *(_DWORD *)(a3 + 392);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a3 + 104));
    v38 = os_set_32_ptr_find();
    if (!v38 || *(_QWORD *)(a3 + 448) == v38)
    {
      v39 = (char *)malloc_type_calloc(1uLL, 0x70uLL, 0x10B00400AF92624uLL);
      if (v39)
      {
        v40 = v39;
        v41 = sub_1AEA55070(a3, __s1, -1, 1);
        if (v41)
        {
          *((_DWORD *)v40 + 4) = 1;
          *((_DWORD *)v40 + 5) = v25;
          *((_DWORD *)v40 + 16) = v25;
          *(_OWORD *)(v40 + 24) = xmmword_1AEA5AD50;
          *((_DWORD *)v40 + 10) = -1;
          *((_DWORD *)v40 + 11) = v37;
          *((_QWORD *)v40 + 13) = v41;
          v41[3] = v40;
          *((_DWORD *)v41 + 12) = v25;
          os_set_32_ptr_insert();
          if (sub_1AEA57E5C())
          {
            *(_OWORD *)&msg[0].msgh_bits = 0uLL;
            if ((_dyld_get_image_uuid() & 1) == 0)
              *(_OWORD *)&msg[0].msgh_bits = 0uLL;
            if ((_dyld_get_shared_cache_uuid() & 1) != 0)
              _dyld_get_shared_cache_range();
            _os_log_simple();
          }
          v45 = os_set_str_ptr_find();
          if (v45)
            v22 = v45 - *(_QWORD *)(a3 + 480);
          else
            v22 = 0;
          v44 = 1;
          goto LABEL_56;
        }
        free(v40);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
    v11 = os_variant_has_internal_diagnostics();
    v10 = 1000000;
    if ((_DWORD)v11)
    {
LABEL_48:
      sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, v18, (char)"notify_register_coalesced_registration");
      return v10;
    }
LABEL_49:
    sub_1AEA576FC(v11, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_register_coalesced_registration");
    return v10;
  }
  v10 = v9;
  if ((v9 - 10) <= 0xFFFFFFFD)
  {
    v11 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v11)
      goto LABEL_48;
    goto LABEL_49;
  }
  return v10;
}

uint64_t sub_1AEA54D8C(const char *a1, uint64_t a2, int a3, int a4, int a5, unsigned int a6, int a7, int a8, int a9, char a10)
{
  uint64_t v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  os_unfair_lock *v20;
  os_unfair_lock_s *v21;
  _DWORD *v22;
  char *v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  _QWORD *v28;
  uint64_t has_internal_diagnostics;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v38;
  char v39;
  os_unfair_lock *lock;

  v17 = sub_1AEA55D3C();
  v18 = (os_unfair_lock_s *)(v17 + 104);
  os_unfair_lock_lock_with_options();
  v19 = os_set_32_ptr_find();
  if (v19 && *(_QWORD *)(v17 + 448) != v19)
    goto LABEL_20;
  v20 = (os_unfair_lock *)sub_1AEA55070(v17, a1, a2, 1);
  if (!v20)
    goto LABEL_20;
  v21 = v20;
  v39 = (char)a1;
  lock = v20 + 10;
  os_unfair_lock_lock_with_options();
  v22 = malloc_type_calloc(1uLL, 0x70uLL, 0x10B00400AF92624uLL);
  if (!v22)
  {
    sub_1AEA551B4(v21);
LABEL_20:
    os_unfair_lock_unlock(v18);
    return 14;
  }
  v22[4] = 1;
  v38 = v22;
  v22[5] = a3;
  v23 = (char *)(v22 + 5);
  os_set_32_ptr_insert();
  v24 = a6 & 0xBFFFFFFF;
  if ((a6 & 0x4000000) == 0)
    v24 = a6;
  *((_DWORD *)v23 + 1) = v24;
  *((_DWORD *)v23 + 2) = a5;
  *((_DWORD *)v23 + 3) = 0;
  *((_DWORD *)v23 + 4) = a8;
  *((_DWORD *)v23 + 5) = a7;
  *((_DWORD *)v23 + 6) = a9;
  *((_DWORD *)v23 + 11) = a4;
  *(_QWORD *)(v23 + 84) = v21;
  if ((v24 & 0x4000000) != 0 && (*(_DWORD *)(v17 + 116) & 1) != 0 && (v24 & 0xF) - 3 <= 4)
  {
    os_unfair_lock_assert_owner(lock);
    if ((a10 & 1) == 0)
    {
      v25 = *(_QWORD *)&v21[6]._os_unfair_lock_opaque;
      if (v25)
      {
        v26 = (unsigned int *)(v25 + 16);
        do
          v27 = __ldxr(v26);
        while (__stxr(v27 + 1, v26));
      }
    }
    *v38 = 0;
    v28 = *(_QWORD **)&v21[4]._os_unfair_lock_opaque;
    v38[1] = v28;
    *v28 = v38;
    *(_QWORD *)&v21[4]._os_unfair_lock_opaque = v38;
  }
  if (!LOBYTE(v21[13]._os_unfair_lock_opaque) && v21[11]._os_unfair_lock_opaque == 500)
  {
    LOBYTE(v21[13]._os_unfair_lock_opaque) = 1;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      sub_1AEA56E70("notify name \"%s\" has been registered %d times - this may be a leak", v30, v31, v32, v33, v34, v35, v36, v39);
    else
      sub_1AEA576FC(has_internal_diagnostics, "notify name \"%s\" has been registered %d times - this may be a leak", v31, v32, v33, v34, v35, v36, v39);
  }
  if (sub_1AEA57E5C())
  {
    _dyld_get_image_uuid();
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      _dyld_get_shared_cache_range();
    _os_log_simple();
  }
  os_unfair_lock_unlock(lock);
  os_unfair_lock_unlock(v18);
  return 0;
}

_QWORD *sub_1AEA55070(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  char v12;
  unsigned int *v13;
  unsigned int v14;
  char *v15;
  const char *v16;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  v8 = os_set_str_ptr_find();
  if (v8 && (v9 = *(_QWORD *)(a1 + 480), v9 != v8))
  {
    v10 = (_QWORD *)(v8 - v9);
    v13 = (unsigned int *)(v8 - v9 + 44);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  else
  {
    if (!a4)
      return 0;
    v10 = malloc_type_calloc(1uLL, 0x38uLL, 0x10B0040952A5435uLL);
    if (v10)
    {
      v11 = strlen(a2) + 1;
      if ((_dyld_is_memory_immutable() & 1) != 0)
      {
        v12 = 0;
LABEL_12:
        v10[4] = a2;
        *((_BYTE *)v10 + 53) = v12;
        *((_DWORD *)v10 + 11) = 1;
        v10[1] = 0;
        *v10 = a3;
        v10[2] = v10 + 1;
        *((_DWORD *)v10 + 12) = -1;
        *((_DWORD *)v10 + 10) = 0;
        *((_BYTE *)v10 + 52) = 0;
        os_set_str_ptr_insert();
        return v10;
      }
      v15 = (char *)malloc_type_malloc(v11, 0xDA311156uLL);
      if (v15)
      {
        v16 = v15;
        memcpy(v15, a2, v11);
        v12 = 1;
        a2 = v16;
        goto LABEL_12;
      }
      free(v10);
      return 0;
    }
  }
  return v10;
}

void sub_1AEA551B4(os_unfair_lock_s *a1)
{
  const os_unfair_lock *v2;
  unsigned int *p_os_unfair_lock_opaque;
  unsigned int v4;
  signed int v5;

  os_unfair_lock_unlock(a1 + 10);
  v2 = (const os_unfair_lock *)sub_1AEA55D3C();
  os_unfair_lock_lock_with_options();
  p_os_unfair_lock_opaque = &a1[11]._os_unfair_lock_opaque;
  do
  {
    v4 = __ldxr(p_os_unfair_lock_opaque);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, p_os_unfair_lock_opaque));
  if (v5 < 0)
    __assert_rtn("atomic_refcount_release", "notify_client.c", 293, "result >= 0");
  if (!v5)
  {
    __dmb(9u);
    sub_1AEA563D4(v2, (uint64_t)a1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&v2[26]);
}

uint64_t sub_1AEA55248(unsigned int a1, const char *a2, int a3)
{
  int v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  _OWORD v10[33];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  memset(v10, 0, 480);
  v8 = 0u;
  v9 = 0u;
  *((_QWORD *)&v9 + 1) = *MEMORY[0x1E0C87D40];
  if (MEMORY[0x1E0C884E8])
    v5 = mig_strncpy_zerofill((char *)v10 + 8, a2, 512);
  else
    v5 = mig_strncpy((char *)v10 + 8, a2, 512);
  LODWORD(v10[0]) = 0;
  DWORD1(v10[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v10 + v6 + 8) = a3;
  LODWORD(v8) = 19;
  *((_QWORD *)&v8 + 1) = a1;
  *(_QWORD *)&v9 = 0x3F200000000;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  return mach_msg((mach_msg_header_t *)&v8, 2097153, v6 + 44, 0, 0, 0, 0);
}

uint64_t sub_1AEA55380(int a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BYTE msg[36];
  __int128 v12;
  uint64_t v13;

  v13 = 0;
  v12 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x40100000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x3Cu, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 1125)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_23;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 52 && !*(_DWORD *)&msg[8] && WORD1(v12) << 16 == 0x100000)
        {
          v8 = 0;
          v9 = *(_DWORD *)&msg[28];
          *a2 = HIDWORD(v12);
          *a3 = v9;
          return v8;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t sub_1AEA55504(unsigned int a1, const char *a2, int a3)
{
  int v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  _OWORD v10[33];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  memset(v10, 0, 480);
  v8 = 0u;
  v9 = 0u;
  *((_QWORD *)&v9 + 1) = *MEMORY[0x1E0C87D40];
  if (MEMORY[0x1E0C884E8])
    v5 = mig_strncpy_zerofill((char *)v10 + 8, a2, 512);
  else
    v5 = mig_strncpy((char *)v10 + 8, a2, 512);
  LODWORD(v10[0]) = 0;
  DWORD1(v10[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v10 + v6 + 8) = a3;
  LODWORD(v8) = 19;
  *((_QWORD *)&v8 + 1) = a1;
  *(_QWORD *)&v9 = 0x40500000000;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  return mach_msg((mach_msg_header_t *)&v8, 1, v6 + 44, 0, 0, 0, 0);
}

void sub_1AEA55638(uint64_t a1)
{
  void *v2;

  if (notify_is_valid_token(*(_DWORD *)(a1 + 56)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  if (v2)
    free(v2);
}

void sub_1AEA556B8(uint64_t a1)
{
  mach_port_name_t v1;
  int v2;
  int v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  char *i;
  _BYTE v9[32];

  v1 = *(_DWORD *)(a1 + 392);
  if (v1)
  {
    v2 = 4;
    do
    {
      v3 = v2;
      memset(v9, 0, sizeof(v9));
      if (mach_msg((mach_msg_header_t *)v9, 258, 0, 0x20u, v1, 0, 0))
        break;
      v4 = sub_1AEA55CB8();
      if (v4)
      {
        v5 = (char *)v4;
        v6 = *(_QWORD *)(v4 + 104);
        if (v6)
        {
          v7 = (os_unfair_lock_s *)(v6 + 40);
          os_unfair_lock_lock_with_options();
          if ((v5[27] & 8) != 0)
          {
            for (i = *(char **)(v6 + 8); i; i = *(char **)i)
            {
              if (i != v5)
                sub_1AEA55E9C((uint64_t)i);
            }
          }
          else
          {
            sub_1AEA55E9C((uint64_t)v5);
          }
          os_unfair_lock_unlock(v7);
        }
        sub_1AEA55798(v5);
      }
      v2 = v3 - 1;
    }
    while (v3);
  }
}

void sub_1AEA55798(char *a1)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)sub_1AEA55D3C();
  os_unfair_lock_lock_with_options();
  sub_1AEA557E4((uint64_t)v2, a1);
  os_unfair_lock_unlock(v2 + 26);
}

void sub_1AEA557E4(uint64_t a1, char *a2)
{
  const os_unfair_lock *v4;
  unsigned int *v5;
  unsigned int v6;
  signed int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  int v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  _DWORD *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  mach_port_name_t v30;
  void *v31;
  NSObject *v32;
  unsigned int *v33;
  unsigned int v34;
  signed int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = (const os_unfair_lock *)(a1 + 104);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  if (!a2)
    return;
  v5 = (unsigned int *)(a2 + 16);
  do
  {
    v6 = __ldxr(v5);
    v7 = v6 - 1;
  }
  while (__stlxr(v7, v5));
  if (v7 < 0)
    goto LABEL_62;
  if (v7)
    return;
  __dmb(9u);
  os_unfair_lock_assert_owner(v4);
  if ((char *)os_set_32_ptr_delete() != a2 + 20)
    __assert_rtn("_nc_table_delete_n", "table.c", 76, "os_set_delete(&t->set, key) == expected");
  v8 = *((_DWORD *)a2 + 5);
  v9 = *((_DWORD *)a2 + 6);
  os_unfair_lock_assert_owner(v4);
  v10 = *((_QWORD *)a2 + 13);
  if (sub_1AEA57E5C())
  {
    _dyld_get_image_uuid();
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      _dyld_get_shared_cache_range();
    _os_log_simple();
  }
  v11 = *((_DWORD *)a2 + 6);
  if ((v11 & 0x4000000) != 0)
  {
    os_unfair_lock_assert_owner(v4);
    os_unfair_lock_lock_with_options();
    v12 = *(_QWORD *)a2;
    v13 = (_QWORD *)*((_QWORD *)a2 + 1);
    if (*(_QWORD *)a2)
    {
      *(_QWORD *)(v12 + 8) = v13;
      v13 = (_QWORD *)*((_QWORD *)a2 + 1);
    }
    else
    {
      *(_QWORD *)(v10 + 16) = v13;
    }
    *v13 = v12;
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 40));
    sub_1AEA557E4(a1, *(_QWORD *)(v10 + 24));
  }
  else if ((v11 & 0x8000000) != 0)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(v10 + 48) = -1;
    *(_QWORD *)(v10 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 40));
    sub_1AEA5625C(*(_DWORD *)(a1 + 384), *((_DWORD *)a2 + 5));
  }
  v14 = *((_DWORD *)a2 + 9);
  os_unfair_lock_assert_owner(v4);
  if (v14 < 0)
    goto LABEL_39;
  v15 = *(unsigned int *)(a1 + 512);
  if (!(_DWORD)v15)
    goto LABEL_39;
  v16 = 0;
  do
  {
    if (*(_DWORD *)(*(_QWORD *)(a1 + 520) + 4 * v16) == v14)
      v17 = v16;
    else
      v17 = 0xFFFFFFFFLL;
    ++v16;
  }
  while (v16 < v15 && (_DWORD)v17 == -1);
  if ((_DWORD)v17 == -1)
    goto LABEL_39;
  v18 = *(_QWORD *)(a1 + 536);
  v19 = *(_DWORD *)(v18 + 4 * v17);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v21 < 0 == v20)
  {
    *(_DWORD *)(v18 + 4 * v17) = v21;
    if (v21)
      goto LABEL_39;
  }
  close_NOCANCEL();
  close_NOCANCEL();
  LODWORD(v22) = *(_DWORD *)(a1 + 512);
  if ((_DWORD)v22 == 1)
  {
    v23 = *(void **)(a1 + 520);
LABEL_38:
    free(v23);
    *(_QWORD *)(a1 + 520) = 0;
    free(*(void **)(a1 + 528));
    *(_QWORD *)(a1 + 528) = 0;
    free(*(void **)(a1 + 536));
    *(_QWORD *)(a1 + 536) = 0;
    *(_DWORD *)(a1 + 512) = 0;
    goto LABEL_39;
  }
  v24 = (v17 + 1);
  v25 = *(_DWORD **)(a1 + 520);
  if (v24 < v22)
  {
    v26 = v16 - 1;
    v27 = *(_QWORD *)(a1 + 528);
    v28 = *(_QWORD *)(a1 + 536);
    do
    {
      v25[v26] = v25[v24];
      *(_DWORD *)(v27 + 4 * v26) = *(_DWORD *)(v27 + 4 * v24);
      *(_DWORD *)(v28 + 4 * v26++) = *(_DWORD *)(v28 + 4 * v24++);
      v22 = *(unsigned int *)(a1 + 512);
    }
    while (v24 < v22);
  }
  *(_DWORD *)(a1 + 512) = v22 - 1;
  *(_QWORD *)(a1 + 520) = reallocf(v25, 4 * (v22 - 1));
  *(_QWORD *)(a1 + 528) = reallocf(*(void **)(a1 + 528), 4 * *(unsigned int *)(a1 + 512));
  v29 = reallocf(*(void **)(a1 + 536), 4 * *(unsigned int *)(a1 + 512));
  *(_QWORD *)(a1 + 536) = v29;
  v23 = *(void **)(a1 + 520);
  if (!v23 || !v29 || !*(_QWORD *)(a1 + 528))
    goto LABEL_38;
LABEL_39:
  sub_1AEA560E0(a1, *((_DWORD *)a2 + 11), *((_DWORD *)a2 + 6));
  if ((*((_DWORD *)a2 + 6) & 0xF) == 7)
  {
    v30 = *((_DWORD *)a2 + 10);
    if (v30)
      sub_1AEA560E0(a1, v30, *((_DWORD *)a2 + 6) | 0x20000000);
  }
  free(*((void **)a2 + 11));
  v31 = (void *)*((_QWORD *)a2 + 7);
  if (v31)
    dispatch_async_f(*((dispatch_queue_t *)a2 + 6), v31, (dispatch_function_t)MEMORY[0x1E0C87440]);
  *((_QWORD *)a2 + 7) = 0;
  v32 = *((_QWORD *)a2 + 6);
  if (v32)
    dispatch_release(v32);
  free(a2);
  os_unfair_lock_assert_owner(v4);
  if (!v10)
    goto LABEL_51;
  v33 = (unsigned int *)(v10 + 44);
  do
  {
    v34 = __ldxr(v33);
    v35 = v34 - 1;
  }
  while (__stlxr(v35, v33));
  if (v35 < 0)
LABEL_62:
    __assert_rtn("atomic_refcount_release", "notify_client.c", 293, "result >= 0");
  if (!v35)
  {
    __dmb(9u);
    sub_1AEA563D4((const os_unfair_lock *)a1, v10);
    if ((v9 & 0x80000000) == 0)
      goto LABEL_52;
LABEL_61:
    sub_1AEA573B4(a1 + 128);
    return;
  }
LABEL_51:
  if (v9 < 0)
    goto LABEL_61;
LABEL_52:
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
  {
    qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
  }
  if ((v9 & 0xC000000) == 0)
  {
    v36 = sub_1AEA5625C(*(_DWORD *)(a1 + 384), v8);
    if ((_DWORD)v36 != -308)
    {
      if ((_DWORD)v36)
      {
        if ((_DWORD)v36 != 268435459)
          sub_1AEA576FC(v36, "<- %s [%d] _notify_server_cancel_2 failed: 0x%08x\n", v37, v38, v39, v40, v41, v42, (char)"registration_node_delete_locked");
      }
    }
  }
}

uint64_t sub_1AEA55CB8()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;

  v0 = sub_1AEA55D3C();
  v1 = (os_unfair_lock_s *)(v0 + 104);
  os_unfair_lock_lock_with_options();
  v2 = os_set_32_ptr_find();
  if (v2 && (v3 = *(_QWORD *)(v0 + 448), v3 != v2))
  {
    v4 = v2 - v3;
    v5 = (unsigned int *)(v2 - v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(v1);
  return v4;
}

uint64_t sub_1AEA55D3C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t has_internal_diagnostics;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C874D8];
  if (*MEMORY[0x1E0C87FA0] == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 8);
  else
    v0 = _os_alloc_once();
  if ((++qword_1ECCD9410 & 3) != 0)
    return v0;
  v1 = 0;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *(_QWORD *)(v0 + 8 * v1);
    if (v4 == 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_6;
    v3 |= 1 << v1;
    if (v2)
    {
      if (v2 > 2)
        goto LABEL_6;
    }
    else
    {
      memset(v15, 0, 24);
    }
    v15[v2++] = v4;
LABEL_6:
    ++v1;
  }
  while (v1 != 13);
  if (v3)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      sub_1AEA56E70("BUG IN LIBNOTIFY CLIENT: internal data structure corrupted [0x%04llx, 0x%llx, 0x%llx, 0x%llx]]", v6, v7, v8, v9, v10, v11, v12, v3);
    else
      sub_1AEA576FC(has_internal_diagnostics, "BUG IN LIBNOTIFY CLIENT: internal data structure corrupted [0x%04llx, 0x%llx, 0x%llx, 0x%llx]]", v7, v8, v9, v10, v11, v12, v3);
    *(_QWORD *)(v0 + 96) = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)(v0 + 64) = v13;
    *(_OWORD *)(v0 + 80) = v13;
    *(_OWORD *)(v0 + 32) = v13;
    *(_OWORD *)(v0 + 48) = v13;
    *(_OWORD *)v0 = v13;
    *(_OWORD *)(v0 + 16) = v13;
  }
  return v0;
}

void sub_1AEA55E9C(uint64_t a1)
{
  const void *v2;
  int v3;
  int v4;
  void *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[7];
  int v9;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(const void **)(a1 + 56);
    if (v2)
    {
      v3 = *(_DWORD *)(a1 + 24);
      if ((v3 & 0x800000) != 0)
      {
        *(_DWORD *)(a1 + 24) = v3 | 0x400000;
      }
      else
      {
        v4 = *(_DWORD *)(a1 + 20);
        v5 = _Block_copy(v2);
        v6 = *(NSObject **)(a1 + 48);
        dispatch_retain(v6);
        v8[0] = MEMORY[0x1E0C87450];
        v8[1] = 0x40000000;
        v8[2] = sub_1AEA55638;
        v8[3] = &unk_1E5E0D4A8;
        v9 = v4;
        v8[4] = v5;
        v8[5] = 0;
        v8[6] = v6;
        v7 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v8);
        dispatch_async(v6, v7);
        _Block_release(v7);
      }
    }
  }
}

BOOL notify_is_valid_token(int val)
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v1 = sub_1AEA55D3C();
  v2 = (os_unfair_lock_s *)(v1 + 104);
  os_unfair_lock_lock_with_options();
  v3 = os_set_32_ptr_find();
  v5 = v3 && (v4 = *(_QWORD *)(v1 + 448), v4 != v3) && (*(_BYTE *)(v3 - v4 + 27) & 8) == 0;
  os_unfair_lock_unlock(v2);
  return v5;
}

void notify_set_options(int a1)
{
  uint64_t v2;
  _DWORD *v3;
  unsigned int *v4;
  unsigned int v5;
  os_unfair_lock_s *v6;
  unsigned int v7;

  v2 = sub_1AEA55D3C();
  v3 = (_DWORD *)v2;
  if ((*(_DWORD *)(v2 + 116) & 0x8000000) != 0)
  {
    if ((a1 & 0x4000000) == 0)
    {
      *(_DWORD *)(v2 + 120) |= a1;
      return;
    }
    v6 = (os_unfair_lock_s *)(v2 + 104);
    os_unfair_lock_lock_with_options();
    v3[29] = v3[30];
    v3[96] = v3[97];
    goto LABEL_11;
  }
  v4 = (unsigned int *)(v2 + 116);
  if ((a1 & 0x8000000) != 0)
  {
    v6 = (os_unfair_lock_s *)(v2 + 104);
    os_unfair_lock_lock_with_options();
    do
      v7 = __ldxr(v4);
    while (__stxr(0x8000000u, v4));
    v3[30] = v7;
    v3[97] = v3[96];
    v3[96] = 0;
LABEL_11:
    os_unfair_lock_unlock(v6);
    return;
  }
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 | a1, v4));
  sub_1AEA53FC8(v2);
}

void sub_1AEA560E0(uint64_t a1, mach_port_name_t a2, int a3)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  _DWORD *i;
  char *v11;
  _DWORD *v12;
  int v13;
  int v14;
  unsigned int v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v6 = *(_DWORD **)(a1 + 552);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  if (a2)
  {
    if (*(_DWORD *)(a1 + 392) != a2)
    {
      v7 = *(unsigned int *)(a1 + 544);
      if ((_DWORD)v7)
      {
        v8 = 0;
        v9 = (unsigned int *)(a1 + 544);
        for (i = v6; *i != a2; i += 3)
        {
          if (v7 == ++v8)
            return;
        }
        v11 = (char *)&v6[3 * v8];
        v14 = *((_DWORD *)v11 + 1);
        v12 = v11 + 4;
        v13 = v14;
        if (v14 < 2)
        {
          if (LOBYTE(v6[3 * v8 + 2]))
          {
            mach_port_destruct(*MEMORY[0x1E0C883F0], a2, (4 * a3) >> 31, 0);
          }
          else if ((a3 & 0x20000000) != 0)
          {
            mach_port_deallocate(*MEMORY[0x1E0C883F0], a2);
          }
          v15 = *v9 - 1;
          *v9 = v15;
          if (v15 != (_DWORD)v8)
          {
            v16 = (char *)&v6[3 * v15];
            v17 = *(_QWORD *)v16;
            i[2] = *((_DWORD *)v16 + 2);
            *(_QWORD *)i = v17;
            LODWORD(v8) = *v9;
          }
          if ((_DWORD)v8)
          {
            v18 = *(unsigned int *)(a1 + 548);
            if (v18 >= 5 && v8 <= v18 >> 2)
            {
              v19 = malloc_type_realloc(v6, 6 * v18, 0xCB719FFuLL);
              if (v19)
              {
                *(_QWORD *)(a1 + 552) = v19;
                *(_DWORD *)(a1 + 548) >>= 1;
              }
            }
          }
          else
          {
            free(v6);
            *(_QWORD *)v9 = 0;
            *(_QWORD *)(a1 + 552) = 0;
          }
        }
        else
        {
          *v12 = v13 - 1;
        }
      }
    }
  }
}

uint64_t sub_1AEA5625C(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C87D40];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 1016;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

void sub_1AEA562D4(uint64_t a1, mach_msg_id_t a2)
{
  mach_port_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  mach_port_t v8;
  mach_msg_id_t v9;
  _QWORD v10[5];
  mach_msg_header_t msg;

  v3 = *(_DWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  msg.msgh_remote_port = v3;
  *(_QWORD *)&msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_id = a2;
  if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460)
  {
    v5 = MEMORY[0x1E0C87450];
    v10[0] = MEMORY[0x1E0C87450];
    v10[1] = 0x40000000;
    v10[2] = sub_1AEA588E0;
    v10[3] = &unk_1E5E0D440;
    v10[4] = v4;
    if (*(_QWORD *)(v4 + 496) != -1)
      dispatch_once((dispatch_once_t *)(v4 + 496), v10);
    v6 = *(NSObject **)(v4 + 504);
    if (v6)
    {
      block[0] = v5;
      block[1] = 0x40000000;
      block[2] = sub_1AEA58914;
      block[3] = &unk_1E5E0D460;
      v8 = v3;
      v9 = a2;
      dispatch_async(v6, block);
    }
  }
}

void sub_1AEA563D4(const os_unfair_lock *a1, uint64_t a2)
{
  os_unfair_lock_assert_owner(a1 + 26);
  sub_1AEA56424((uint64_t)&a1[114], *(_QWORD *)(a2 + 32), a2 + 32);
  if (*(_BYTE *)(a2 + 53))
    free(*(void **)(a2 + 32));
  free((void *)a2);
}

uint64_t sub_1AEA56424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = os_set_str_ptr_delete();
  if (result != a3)
    __assert_rtn("_nc_table_delete", "table.c", 72, "os_set_delete(&t->set, key) == expected");
  return result;
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((sub_1AEA57F50(name) & 1) == 0 && os_variant_has_internal_diagnostics())
    sub_1AEA56E70("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v9, v10, v11, v12, v13, v14, v15, (char)name);
  return sub_1AEA53E04((char *)name, (unsigned int *)out_token, queue, handler, 0);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  os_unfair_lock_s *v2;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v12;
  int v13;
  BOOL v14;
  uint64_t has_internal_diagnostics;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  mach_port_t v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
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
  unint64_t v50;
  int v51;
  _BYTE msg[52];
  int v53;

  v51 = 0;
  v50 = 0;
  v5 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v5 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v6 = *(_DWORD **)(v5 + 592);
    if (v6 && *v6 != *(_DWORD *)(v5 + 112))
    {
      v2 = (os_unfair_lock_s *)sub_1AEA578B0(v5);
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 104));
      if ((_DWORD)v2)
      {
        if (v2 >= 0xB)
        {
          has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if ((_DWORD)has_internal_diagnostics)
            sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v17, v18, v19, v20, v21, v22, v23, (char)"notify_set_state");
          else
            sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, (char)"notify_set_state");
          LODWORD(v2) = 1000000;
        }
        return v2;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 104));
    }
  }
  v7 = sub_1AEA55CB8();
  if (!v7)
  {
LABEL_35:
    LODWORD(v2) = 2;
    return v2;
  }
  v8 = v7;
  if (!*(_QWORD *)(v7 + 104))
  {
    sub_1AEA55798((char *)v7);
    goto LABEL_35;
  }
  if ((*(_DWORD *)(v7 + 24) & 0x80000000) == 0)
  {
    v9 = qword_1ECCD9400 == -1;
    if (qword_1ECCD9400 != -1)
      dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
    if (byte_1EEE120B0)
    {
      qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
      __break(1u);
    }
    else
    {
      if (!*(_DWORD *)(v5 + 384))
      {
        v31 = sub_1AEA53FC8(v5);
        if (v31)
        {
          v32 = v31;
          sub_1AEA55798((char *)v8);
          LODWORD(v2) = v32;
          if (v32 >= 0xB)
          {
            LODWORD(v2) = 1000000;
            v33 = os_variant_has_internal_diagnostics();
            if ((_DWORD)v33)
              sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v34, v35, v36, v37, v38, v39, v40, (char)"notify_set_state");
            else
              sub_1AEA576FC(v33, "Libnotify: %s failed with code %d on line %d", v35, v36, v37, v38, v39, v40, (char)"notify_set_state");
          }
          return v2;
        }
      }
      v51 = 0;
      v2 = *(os_unfair_lock_s **)(v8 + 104);
      if ((*(_BYTE *)(v8 + 27) & 4) != 0)
        token = v2[12]._os_unfair_lock_opaque;
      os_unfair_lock_lock_with_options();
      v50 = *(_QWORD *)&v2->_os_unfair_lock_opaque;
      os_unfair_lock_unlock(v2 + 10);
      if (v50 < 0xFFFFFFFFFFFFFFFELL)
      {
        v51 = 0;
        v28 = *(_DWORD *)(v5 + 384);
        if ((*(_DWORD *)(v5 + 116) & 4) != 0)
        {
          if (qword_1ECCD93F8 != -1)
            dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
          v29 = sub_1AEA5A5B4(v28, v50, state64, byte_1ECCD93F0);
        }
        else
        {
          if (qword_1ECCD93F8 != -1)
            dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
          *(_QWORD *)&msg[24] = *MEMORY[0x1E0C87D40];
          *(_QWORD *)&msg[32] = v50;
          *(_QWORD *)&msg[40] = state64;
          *(_DWORD *)&msg[48] = byte_1ECCD93F0;
          *(_QWORD *)msg = 19;
          *(_DWORD *)&msg[16] = 0;
          *(_DWORD *)&msg[20] = 1019;
          *(_DWORD *)&msg[8] = v28;
          *(_DWORD *)&msg[12] = 0;
          if (MEMORY[0x1E0C88840])
            voucher_mach_msg_set((mach_msg_header_t *)msg);
          v29 = mach_msg((mach_msg_header_t *)msg, 1, 0x34u, 0, 0, 0, 0);
        }
        v13 = v29;
        v30 = 0;
LABEL_71:
        if (v13 | v30)
        {
          sub_1AEA55798((char *)v8);
          if (v13)
          {
            v42 = os_variant_has_internal_diagnostics();
            LODWORD(v2) = 1000000;
            if ((_DWORD)v42)
              sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v43, v44, v45, v46, v47, v48, v49, (char)"notify_set_state");
            else
              sub_1AEA576FC(v42, "Libnotify: %s failed with code %d (%d) on line %d", v44, v45, v46, v47, v48, v49, (char)"notify_set_state");
            return v2;
          }
        }
        else
        {
          v41 = mach_absolute_time();
          *(_QWORD *)(v8 + 72) = state64;
          *(_QWORD *)(v8 + 80) = v41;
          sub_1AEA55798((char *)v8);
        }
        LODWORD(v2) = 0;
        return v2;
      }
      v10 = *(_DWORD *)(v5 + 116);
      LODWORD(v5) = *(_DWORD *)(v5 + 384);
      v9 = qword_1ECCD93F8 == -1;
      if ((v10 & 4) == 0)
      {
        if (qword_1ECCD93F8 != -1)
          dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
        memset(&msg[20], 0, 32);
        *(_OWORD *)&msg[4] = 0u;
        *(_QWORD *)&msg[24] = *MEMORY[0x1E0C87D40];
        *(_DWORD *)&msg[32] = token;
        *(_QWORD *)&msg[36] = state64;
        v53 = 0;
        *(_DWORD *)&msg[44] = byte_1ECCD93F0;
        special_reply_port = mig_get_special_reply_port();
        *(_DWORD *)&msg[8] = v5;
        *(_DWORD *)&msg[12] = special_reply_port;
        *(_DWORD *)msg = 5395;
        *(_QWORD *)&msg[16] = 0x3FC00000000;
        if (MEMORY[0x1E0C88840])
        {
          voucher_mach_msg_set((mach_msg_header_t *)msg);
          special_reply_port = *(_DWORD *)&msg[12];
        }
        v12 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x30u, 0x38u, special_reply_port, 0, 0);
        v13 = v12;
        if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
          goto LABEL_68;
        if (v12)
        {
          mig_dealloc_special_reply_port();
LABEL_68:
          v30 = 0;
          goto LABEL_69;
        }
        if (*(_DWORD *)&msg[20] == 71)
        {
          v13 = -308;
        }
        else if (*(_DWORD *)&msg[20] == 1120)
        {
          if ((*(_DWORD *)msg & 0x80000000) == 0)
          {
            if (*(_DWORD *)&msg[4] == 48)
            {
              if (!*(_DWORD *)&msg[8])
              {
                v13 = *(_DWORD *)&msg[32];
                if (!*(_DWORD *)&msg[32])
                {
                  v50 = *(_QWORD *)&msg[36];
                  v30 = *(_DWORD *)&msg[44];
LABEL_69:
                  if (!(v13 | v30))
                  {
                    sub_1AEA53194(v2, v50);
                    v30 = 0;
                    v13 = 0;
                  }
                  goto LABEL_71;
                }
                goto LABEL_67;
              }
            }
            else if (*(_DWORD *)&msg[4] == 36)
            {
              if (*(_DWORD *)&msg[8])
                v14 = 1;
              else
                v14 = *(_DWORD *)&msg[32] == 0;
              if (v14)
                v13 = -300;
              else
                v13 = *(_DWORD *)&msg[32];
              goto LABEL_67;
            }
          }
          v13 = -300;
        }
        else
        {
          v13 = -301;
        }
LABEL_67:
        mach_msg_destroy((mach_msg_header_t *)msg);
        goto LABEL_68;
      }
    }
    if (!v9)
      dispatch_once(&qword_1ECCD93F8, &unk_1E5E0D208);
    v13 = sub_1AEA5A630(v5, token, state64, &v50, &v51, byte_1ECCD93F0);
    v30 = v51;
    goto LABEL_69;
  }
  v24 = (os_unfair_lock_s *)(v5 + 344);
  os_unfair_lock_lock_with_options();
  v25 = os_set_64_ptr_find();
  if (v25 && (v26 = *(_QWORD *)(v5 + 192), v27 = (_QWORD *)(v25 - v26), v25 != v26))
  {
    if (v27[1])
    {
      v27[3] = state64;
      LODWORD(v2) = 0;
      v27[4] = mach_absolute_time();
    }
    else
    {
      LODWORD(v2) = 7;
    }
  }
  else
  {
    LODWORD(v2) = 1;
  }
  os_unfair_lock_unlock(v24);
  sub_1AEA55798((char *)v8);
  return v2;
}

uint64_t sub_1AEA56B00(const char *a1, mach_port_name_t *name, int a3, unsigned int *a4, os_unfair_lock_s *a5)
{
  ipc_space_t *v10;
  uint64_t v11;
  uint64_t has_internal_diagnostics;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_name_t v20;
  unsigned int *p_os_unfair_lock_opaque;
  unsigned int v22;
  unsigned int v23;
  mach_port_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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

  if (!a5)
    __assert_rtn("notify_register_mach_port_self", "notify_client.c", 2941, "globals");
  if ((a3 & 1) != 0)
  {
    v20 = *name;
    if (v20 + 1 < 2 || mach_port_insert_right(*MEMORY[0x1E0C883F0], v20, *name, 0x14u))
      return 3;
  }
  else
  {
    v10 = (ipc_space_t *)MEMORY[0x1E0C883F0];
    if (mach_port_allocate(*MEMORY[0x1E0C883F0], 1u, name))
    {
      v11 = 1000000;
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if ((_DWORD)has_internal_diagnostics)
        sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v13, v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port_self");
      else
        sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d (%d) on line %d", v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port_self");
      return v11;
    }
    if (mach_port_insert_right(*v10, *name, *name, 0x14u))
    {
      mach_port_destruct(*v10, *name, 0, 0);
      return 3;
    }
  }
  p_os_unfair_lock_opaque = &a5[122]._os_unfair_lock_opaque;
  do
  {
    v22 = __ldxr(p_os_unfair_lock_opaque);
    v23 = v22 + 1;
  }
  while (__stxr(v22 + 1, p_os_unfair_lock_opaque));
  v24 = *name;
  if (*name - 1 >= 0xFFFFFFFE)
  {
    v11 = 3;
    if ((a3 & 1) != 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  v47 = 0;
  os_unfair_lock_lock_with_options();
  v25 = sub_1AEA574A4((uint64_t)&a5[32], a1, v23, &v47);
  if ((_DWORD)v25)
  {
    v11 = v25;
    os_unfair_lock_unlock(a5 + 86);
    if ((a3 & 1) != 0)
    {
LABEL_21:
      if (v11 >= 0xB)
      {
        v26 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v26)
          sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v27, v28, v29, v30, v31, v32, v33, (char)"notify_register_mach_port_self");
        else
          sub_1AEA576FC(v26, "Libnotify: %s failed with code %d on line %d", v28, v29, v30, v31, v32, v33, (char)"notify_register_mach_port_self");
        return 1000000;
      }
      return v11;
    }
LABEL_20:
    mach_port_destruct(*MEMORY[0x1E0C883F0], *name, 0, 0);
    goto LABEL_21;
  }
  v35 = v47;
  *(_BYTE *)(v47 + 79) = *(_BYTE *)(v47 + 79) & 0xF0 | 3;
  *(_DWORD *)(v35 + 56) = v24;
  v36 = *(_QWORD *)(*(_QWORD *)(v35 + 48) + 16);
  os_unfair_lock_unlock(a5 + 86);
  v37 = sub_1AEA54D8C(a1, v36, v23, v23, -1, 0x80000003, -1, -1, *name, 0);
  if ((_DWORD)v37)
  {
    v38 = v37;
    if ((a3 & 1) == 0)
      mach_port_destruct(*MEMORY[0x1E0C883F0], *name, 0, 0);
    sub_1AEA573B4((uint64_t)&a5[32]);
    v11 = v38;
    if (v38 >= 0xB)
    {
      v11 = 1000000;
      v39 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v39)
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v40, v41, v42, v43, v44, v45, v46, (char)"notify_register_mach_port_self");
      else
        sub_1AEA576FC(v39, "Libnotify: %s failed with code %d on line %d", v41, v42, v43, v44, v45, v46, (char)"notify_register_mach_port_self");
    }
  }
  else
  {
    *a4 = v23;
    sub_1AEA52090((uint64_t)a5, *name, a3);
    return 0;
  }
  return v11;
}

void sub_1AEA56E70(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;

  v10 = 0;
  if (getpid() != 1)
  {
    vasprintf(&v10, a1, &a9);
    if (v10)
    {
      os_fault_with_payload();
      free(v10);
    }
  }
}

void sub_1AEA56EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  mach_port_t v10;
  pid_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[8];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C874D8];
  if ((*(_BYTE *)(a2 + 79) & 0x20) != 0)
  {
    v8 = *(_BYTE *)(a2 + 79) | 0x40;
    goto LABEL_31;
  }
  v4 = os_set_32_ptr_find();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 160);
    v6 = *(_BYTE *)(a2 + 79);
    if (v5 != v4)
    {
      v7 = v4 - v5;
      if ((*(_BYTE *)(v7 + 20) & 1) != 0)
      {
        ++*(_BYTE *)(a2 + 78);
        v8 = v6 | 0x60;
        goto LABEL_31;
      }
      v9 = 0;
      goto LABEL_8;
    }
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v6 = *(_BYTE *)(a2 + 79);
  }
  v9 = 1;
LABEL_8:
  switch(v6 & 0xF)
  {
    case 3:
      v10 = *(_DWORD *)(a2 + 56);
      goto LABEL_36;
    case 4:
      if ((*(_DWORD *)(a2 + 56) & 0x80000000) != 0)
        goto LABEL_30;
      LODWORD(v24[0]) = bswap32(*(_DWORD *)(a2 + 64));
      if (write_NOCANCEL() != 4)
      {
        close_NOCANCEL();
        *(_DWORD *)(a2 + 56) = -1;
        return;
      }
LABEL_29:
      v6 = *(_BYTE *)(a2 + 79);
LABEL_30:
      v8 = v6 & 0x3F;
      break;
    case 5:
      v11 = *(_DWORD *)(a2 + 68);
      if (!v11)
        v11 = getpid();
      if (!kill(v11, *(_DWORD *)(a2 + 56)))
        goto LABEL_29;
      return;
    case 6:
      v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v12, "Notification", *(const char **)(*(_QWORD *)(a2 + 48) + 8));
      v13 = os_set_64_ptr_find();
      if (v13)
      {
        v14 = *(_QWORD *)(a1 + 64);
        if (v14 != v13)
          xpc_dictionary_set_uint64(v12, "_State", *(_QWORD *)(v13 - v14 + 24));
      }
      v15 = xpc_event_publisher_fire_noboost();
      xpc_release(v12);
      if (!v15)
        goto LABEL_29;
      if (v15 == 55 && !*(_BYTE *)(a2 + 80))
      {
        *(_BYTE *)(a2 + 80) = 1;
        memset(v24, 0, sizeof(v24));
        if (xpc_get_service_identifier_for_token())
        {
          if (os_variant_has_internal_diagnostics())
            sub_1AEA56E70("BUG IN CLIENT OF NOTIFYD: %s has not dequeued the last %d messages", v16, v17, v18, v19, v20, v21, v22, (char)v24);
        }
      }
      return;
    case 7:
      if ((v9 & 1) == 0)
      {
        v23 = *(_QWORD *)(v7 + 24);
        if (v23)
        {
          v10 = *(_DWORD *)(v23 + 8);
LABEL_36:
          sub_1AEA57170(a1, a2, v10);
        }
      }
      return;
    default:
      goto LABEL_30;
  }
LABEL_31:
  *(_BYTE *)(a2 + 79) = v8;
}

uint64_t sub_1AEA57170(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  mach_msg_option_t v10;
  mach_msg_id_t v11;
  uint64_t result;
  char v13;
  mach_msg_header_t msg;

  v6 = os_set_32_ptr_find();
  if (v6 && (v7 = *(_QWORD *)(a1 + 128), v7 != v6))
  {
    v8 = v6 - v7;
    if ((*(_BYTE *)(v6 - v7 + 12) & 1) != 0)
    {
      result = 0;
      ++*(_BYTE *)(a2 + 78);
      v13 = *(_BYTE *)(a2 + 79) | 0x60;
      goto LABEL_16;
    }
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  if ((*(_DWORD *)(a1 + 208) & 2) != 0)
    v10 = 145;
  else
    v10 = 17;
  *(_QWORD *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_remote_port = a3;
  msg.msgh_local_port = 0;
  v11 = *(_DWORD *)(a2 + 64);
  msg.msgh_voucher_port = 0;
  msg.msgh_id = v11;
  result = mach_msg(&msg, v10, 0x18u, 0, 0, 0, 0);
  if (!(_DWORD)result)
  {
    v13 = *(_BYTE *)(a2 + 79) & 0x3F;
LABEL_16:
    *(_BYTE *)(a2 + 79) = v13;
    return result;
  }
  if ((_DWORD)result != 268435460)
    return 46;
  mach_msg_destroy(&msg);
  if ((*(_BYTE *)(a1 + 208) & 2) == 0)
    return 45;
  ++*(_BYTE *)(a2 + 78);
  *(_BYTE *)(a2 + 79) |= 0xE0u;
  result = 0;
  if ((v9 & 1) == 0)
    *(_DWORD *)(v8 + 12) |= 1u;
  return result;
}

void sub_1AEA572B8(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;

  if (a2)
  {
    v4 = *(_DWORD *)(a2 + 56);
    if (!v4 || (v5 = v4 - 1, (*(_DWORD *)(a2 + 56) = v5) == 0))
    {
      v6 = *(unsigned int *)(a1 + 212);
      if ((_DWORD)v6)
      {
        v7 = 0;
        v8 = *(_QWORD **)(a1 + 192);
        while (1)
        {
          v9 = v7 + 1;
          if (v8[v7] == a2)
            break;
          ++v7;
          if (v6 == v9)
            goto LABEL_16;
        }
        if ((int)v7 + 1 < v6)
        {
          do
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8 * (v9 - 1)) = *(_QWORD *)(*(_QWORD *)(a1 + 192)
                                                                                          + 8 * v9);
            ++v9;
          }
          while ((_DWORD)v6 != (_DWORD)v9);
          v8 = *(_QWORD **)(a1 + 192);
        }
        v10 = v6 - 1;
        *(_DWORD *)(a1 + 212) = v10;
        if (v10)
        {
          v11 = reallocf(v8, 8 * v10);
        }
        else
        {
          free(v8);
          v11 = 0;
        }
        *(_QWORD *)(a1 + 192) = v11;
      }
LABEL_16:
      sub_1AEA56424(a1 + 8, *(_QWORD *)(a2 + 8), a2 + 8);
      *(_QWORD *)(a2 + 8) = 0;
      sub_1AEA59E04(a1 + 40, *(_QWORD *)(a2 + 16), a2 + 16);
      free((void *)a2);
      ++*(_DWORD *)(a1 + 228);
    }
  }
}

void sub_1AEA573B4(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v2 = (os_unfair_lock_s *)(a1 + 216);
  os_unfair_lock_lock_with_options();
  v3 = os_set_64_ptr_find();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 96);
    v5 = (uint64_t *)(v3 - v4);
    if (v3 != v4)
    {
      v6 = v5[6];
      v7 = *v5;
      if (*v5)
        *(_QWORD *)(v7 + 8) = v5[1];
      *(_QWORD *)v5[1] = v7;
      sub_1AEA59E04(a1 + 72, v5[8], (uint64_t)(v5 + 8));
      v8 = *((_BYTE *)v5 + 79) & 0xF;
      if (v8 == 3)
      {
        mach_port_deallocate(*MEMORY[0x1E0C883F0], *((_DWORD *)v5 + 14));
      }
      else if (v8 == 4 && (v5[7] & 0x80000000) == 0)
      {
        close_NOCANCEL();
      }
      free(v5);
      ++*(_DWORD *)(a1 + 236);
      sub_1AEA572B8(a1, v6);
    }
  }
  os_unfair_lock_unlock(v2);
}

uint64_t sub_1AEA574A4(uint64_t a1, const char *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;

  if (!a4)
    return 0;
  if (!a2)
    return 7;
  *a4 = 0;
  v8 = os_set_str_ptr_find();
  if (!v8 || (v9 = *(_QWORD *)(a1 + 32), v10 = v8 - v9, v8 == v9))
  {
    v11 = strlen(a2);
    v12 = (char *)malloc_type_calloc(1uLL, v11 + 73, 0x1817CFD2uLL);
    if (!v12)
      return 47;
    v10 = (uint64_t)v12;
    ++*(_DWORD *)(a1 + 224);
    v13 = v12 + 72;
    *(_QWORD *)(v10 + 8) = v13;
    memcpy(v13, a2, v11 + 1);
    v14 = *(_QWORD *)a1 + 1;
    *(_QWORD *)(v10 + 16) = *(_QWORD *)a1;
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(v10 + 48) = -4294966477;
    *(_DWORD *)(v10 + 60) = 1;
    *(_QWORD *)v10 = 0;
    os_set_str_ptr_insert();
    os_set_64_ptr_insert();
  }
  ++*(_DWORD *)(v10 + 56);
  v15 = os_set_64_ptr_find();
  if ((!v15 || *(_QWORD *)(a1 + 96) == v15) && (v16 = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040BED8B209uLL)) != 0)
  {
    v17 = v16;
    ++*(_DWORD *)(a1 + 232);
    v16[8] = a3;
    v16[6] = v10;
    v18 = *(_QWORD *)v10;
    *v16 = *(_QWORD *)v10;
    if (v18)
      *(_QWORD *)(v18 + 8) = v16;
    *(_QWORD *)v10 = v16;
    v16[1] = v10;
    os_set_64_ptr_insert();
    result = 0;
    *a4 = v17;
  }
  else
  {
    sub_1AEA572B8(a1, v10);
    return 48;
  }
  return result;
}

uint64_t sub_1AEA57660(uint64_t a1, const char *a2, unsigned int a3, _QWORD *a4)
{
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v12 = 0;
  v8 = (os_unfair_lock_s *)(a1 + 216);
  os_unfair_lock_lock_with_options();
  v9 = sub_1AEA574A4(a1, a2, a3, &v12);
  if (!(_DWORD)v9)
  {
    v10 = v12;
    *(_BYTE *)(v12 + 79) = *(_BYTE *)(v12 + 79) & 0xF0 | 2;
    *a4 = *(_QWORD *)(*(_QWORD *)(v10 + 48) + 16);
  }
  os_unfair_lock_unlock(v8);
  return v9;
}

void sub_1AEA576FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v9;
  char *v10[2];

  v10[0] = 0;
  v10[1] = &a9;
  vasprintf(v10, a2, &a9);
  if (v10[0])
  {
    _simple_asl_log();
    v9 = v10[0];
  }
  else
  {
    v9 = 0;
  }
  free(v9);
}

double _notify_fork_child()
{
  uint64_t v0;
  double result;

  v0 = sub_1AEA55D3C();
  sub_1AEA513FC(v0);
  if (*(_DWORD *)(v0 + 384) || _dispatch_is_fork_of_multithreaded_parent())
    *(_DWORD *)(v0 + 116) = 0x8000000;
  sub_1AEA5147C(v0 + 128);
  *(_DWORD *)(v0 + 384) = 0;
  *(_DWORD *)(v0 + 112) = 0;
  *(_DWORD *)(v0 + 512) = 0;
  *(_QWORD *)(v0 + 592) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 520) = 0u;
  *(_OWORD *)(v0 + 536) = 0u;
  *(_QWORD *)(v0 + 552) = 0;
  return result;
}

void sub_1AEA577B8(uint64_t a1, unsigned int a2)
{
  uintptr_t v4;
  NSObject *global_queue;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[4];
  unsigned int v9;

  *(_DWORD *)(a1 + 392) = a2;
  v4 = a2;
  global_queue = dispatch_get_global_queue(2, 0);
  v6 = dispatch_source_create(MEMORY[0x1E0C86F00], v4, 0, global_queue);
  *(_QWORD *)(a1 + 400) = v6;
  dispatch_set_context(v6, (void *)a1);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 400), (dispatch_function_t)sub_1AEA556B8);
  v7 = *(NSObject **)(a1 + 400);
  handler[0] = MEMORY[0x1E0C87450];
  handler[1] = 0x40000000;
  handler[2] = sub_1AEA57E3C;
  handler[3] = &unk_1E5E0D2B0;
  v9 = a2;
  dispatch_source_set_cancel_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 400));
}

void sub_1AEA57874()
{
  os_unfair_lock_s *v0;

  v0 = (os_unfair_lock_s *)sub_1AEA55D3C();
  os_unfair_lock_lock_with_options();
  sub_1AEA578B0(v0);
  os_unfair_lock_unlock(v0 + 26);
}

uint64_t sub_1AEA578B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if ((*(_DWORD *)(a1 + 116) & 2) == 0)
    return 0;
  sub_1AEA54010(a1, 1);
  if ((_DWORD)v1 == 57)
    return 0;
  v2 = v1;
  if (!(_DWORD)v1)
    os_set_32_ptr_foreach();
  return v2;
}

uint64_t sub_1AEA57944(uint64_t a1, uint64_t a2)
{
  const char *v3;
  uid_t v4;
  uid_t v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  mach_port_name_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  _BYTE *v18;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v20;
  int v21;
  BOOL v22;
  int v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  int has_internal_diagnostics;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  int v48;
  unsigned int v49;
  _BYTE msg[32];
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  _OWORD v56[35];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C874D8];
  v48 = -1;
  v47 = -1;
  v3 = *(const char **)(*(_QWORD *)(a2 + 104) + 32);
  v45 = sub_1AEA55D3C();
  if (*(_DWORD *)(a2 + 24) >> 30 != 1)
    return 1;
  v49 = 0;
  v4 = geteuid();
  if (v4)
  {
    v5 = v4;
    if (!strncmp(v3, "user.uid.", 9uLL))
    {
      snprintf(msg, 0x3FuLL, "%s%d", "user.uid.", v5);
      v34 = strlen(msg);
      if (strncmp(v3, msg, v34) || v3[v34] && v3[v34] != 46)
      {
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        v36 = geteuid();
        if (has_internal_diagnostics)
          sub_1AEA56E70("BUG IN LIBNOTIFY CLIENT: registration held for restricted name %s with process uid %d", v37, v38, v39, v40, v41, v42, v43, (char)v3);
        else
          sub_1AEA576FC(v36, "BUG IN LIBNOTIFY CLIENT: registration held for restricted name %s with process uid %d", v38, v39, v40, v41, v42, v43, (char)v3);
      }
    }
  }
  v6 = *(const char **)(a2 + 88);
  if (v6)
    v7 = strlen(v6) + 1;
  else
    v7 = 0;
  v8 = *(_DWORD *)(a2 + 24) & 0xF;
  v9 = -51;
  v44 = v3;
  while (1)
  {
    v10 = *(_DWORD *)(v45 + 384);
    v11 = *(_DWORD *)(a2 + 20);
    if ((*(_DWORD *)(v45 + 116) & 4) != 0)
    {
      v24 = v8 == 5 ? *(_DWORD *)(a2 + 40) : 0;
      v21 = sub_1AEA5A330(v10, v3, v11, v8, v24, *(_DWORD *)(a2 + 28), *(_QWORD *)(a2 + 72), *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), v7, *(_DWORD *)(a2 + 96), &v48, &v47, (int *)&v49);
    }
    else
    {
      if (v8 == 5)
        v12 = *(_DWORD *)(a2 + 40);
      else
        v12 = 0;
      v13 = *(_DWORD *)(a2 + 28);
      v46 = *(_OWORD *)(a2 + 72);
      v14 = *(_QWORD *)(a2 + 88);
      v15 = *(_DWORD *)(a2 + 96);
      memset(v56, 0, 448);
      v51 = 0x14000000000000;
      v55 = 0;
      memset(msg, 0, sizeof(msg));
      *(_DWORD *)&msg[24] = 2;
      v52 = v14;
      v53 = 16777472;
      v54 = v7;
      v55 = *MEMORY[0x1E0C87D40];
      if (MEMORY[0x1E0C884E8])
        v16 = mig_strncpy_zerofill((char *)v56 + 8, v3, 512);
      else
        v16 = mig_strncpy((char *)v56 + 8, v3, 512);
      LODWORD(v56[0]) = 0;
      DWORD1(v56[0]) = v16;
      v17 = (v16 + 3) & 0xFFFFFFFC;
      v18 = &msg[v17 - 512];
      *((_DWORD *)v18 + 146) = v11;
      *((_DWORD *)v18 + 147) = v8;
      *((_DWORD *)v18 + 148) = v12;
      *((_DWORD *)v18 + 149) = v13;
      *(_OWORD *)(v18 + 600) = v46;
      *((_DWORD *)v18 + 154) = v7;
      *((_DWORD *)v18 + 155) = v15;
      special_reply_port = mig_get_special_reply_port();
      *(_QWORD *)&msg[8] = __PAIR64__(special_reply_port, v10);
      *(_DWORD *)msg = -2147478253;
      *(_QWORD *)&msg[16] = 0x3FE00000000;
      if (MEMORY[0x1E0C88840])
      {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
        special_reply_port = *(_DWORD *)&msg[12];
      }
      v20 = mach_msg((mach_msg_header_t *)msg, 3227651, v17 + 112, 0x3Cu, special_reply_port, 0, 0);
      v21 = v20;
      if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
      {
        v3 = v44;
        goto LABEL_38;
      }
      v3 = v44;
      if (v20)
      {
        mig_dealloc_special_reply_port();
        goto LABEL_38;
      }
      if (*(_DWORD *)&msg[20] == 71)
      {
        v21 = -308;
        goto LABEL_37;
      }
      if (*(_DWORD *)&msg[20] != 1122)
      {
        v21 = -301;
        goto LABEL_37;
      }
      if ((*(_DWORD *)msg & 0x80000000) != 0)
        goto LABEL_36;
      if (*(_DWORD *)&msg[4] != 52)
      {
        if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v22 = 1;
          else
            v22 = (_DWORD)v51 == 0;
          if (v22)
            v21 = -300;
          else
            v21 = v51;
        }
        else
        {
LABEL_36:
          v21 = -300;
        }
LABEL_37:
        mach_msg_destroy((mach_msg_header_t *)msg);
        goto LABEL_38;
      }
      if (*(_DWORD *)&msg[8])
        goto LABEL_36;
      v21 = v51;
      if ((_DWORD)v51)
        goto LABEL_37;
      v47 = v52;
      v48 = HIDWORD(v51);
      v49 = v53;
    }
LABEL_38:
    if (!v21)
      break;
    usleep_NOCANCEL();
    if (__CFADD__(v9++, 1))
      __assert_rtn("_notify_lib_regenerate_registration", "notify_client.c", 1494, "kstatus == KERN_SUCCESS");
  }
  if (v49 > 0x39 || ((1 << v49) & 0x208000000000001) == 0)
  {
    v26 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v26)
      sub_1AEA56E70("Libnotify: _notify_server_regnerate failed for name %s with status %d (flags: %x, token %d)", v27, v28, v29, v30, v31, v32, v33, (char)v3);
    else
      sub_1AEA576FC(v26, "Libnotify: _notify_server_regnerate failed for name %s with status %d (flags: %x, token %d)", v28, v29, v30, v31, v32, v33, (char)v3);
  }
  *(_DWORD *)(a2 + 28) = v48;
  **(_QWORD **)(a2 + 104) = v47;
  return 1;
}

uint64_t sub_1AEA57E3C(uint64_t a1)
{
  return mach_port_destruct(*MEMORY[0x1E0C883F0], *(_DWORD *)(a1 + 32), 0, 0);
}

BOOL sub_1AEA57E5C()
{
  _BYTE *v0;

  v0 = *(_BYTE **)(sub_1AEA55D3C() + 584);
  if (!v0)
    return 0;
  if (*v0)
    return 1;
  return os_set_str_ptr_find() != 0;
}

uint64_t sub_1AEA57EB0()
{
  uint64_t result;

  result = sub_1AEA57EDC((uint64_t)"com.apple.developer.web-browser-engine.restrict.notifyd", (uint64_t)&unk_1E5E0D350);
  byte_1EEE120B0 = result;
  return result;
}

uint64_t sub_1AEA57EDC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v4;
  uint64_t v5;

  result = xpc_copy_entitlement_for_token();
  if (result)
  {
    v4 = (void *)result;
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, result);
    xpc_release(v4);
    return v5;
  }
  return result;
}

BOOL sub_1AEA57F28(uint64_t a1, uint64_t a2)
{
  return a2 == MEMORY[0x1E0C88F90];
}

BOOL sub_1AEA57F3C(uint64_t a1, uint64_t a2)
{
  return a2 == MEMORY[0x1E0C88F90];
}

uint64_t sub_1AEA57F50(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  const char *v5;
  size_t v6;
  _QWORD block[5];

  v2 = sub_1AEA55D3C();
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = sub_1AEA58038;
  block[3] = &unk_1E5E0D3B0;
  block[4] = v2;
  if (qword_1ECCD9408 == -1)
  {
    if (!a1)
      return 1;
  }
  else
  {
    dispatch_once(&qword_1ECCD9408, block);
    if (!a1)
      return 1;
  }
  if (!*(_BYTE *)(v2 + 576))
    return 1;
  v3 = *(_QWORD *)(v2 + 568);
  if (v3)
  {
    v4 = (_QWORD *)(*(_QWORD *)(v2 + 560) + 8);
    do
    {
      v5 = (const char *)*(v4 - 1);
      v6 = *v4 - 1;
      if (v5[v6] == 42)
      {
        if (!strncmp(a1, v5, v6))
          return 1;
      }
      else if (!strcmp(a1, v5))
      {
        return 1;
      }
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return 0;
}

void sub_1AEA58038(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[6];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2000000000;
  v6 = 0;
  v2[0] = MEMORY[0x1E0C87450];
  v2[1] = 0x40000000;
  v2[2] = sub_1AEA580F8;
  v2[3] = &unk_1E5E0D400;
  v2[4] = &v7;
  v2[5] = &v3;
  *(_BYTE *)(v1 + 576) = sub_1AEA57EDC((uint64_t)"com.apple.private.darwin-notification.introspect", (uint64_t)v2);
  *(_QWORD *)(v1 + 568) = v4[3];
  *(_QWORD *)(v1 + 560) = v8[3];
  _Block_object_dispose(&v3, 8);
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_1AEA580F8(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD applier[5];

  result = MEMORY[0x1AF455288](a2);
  if (result != MEMORY[0x1E0C88FC0])
  {
    qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a non-empty *array* of strings";
    __break(1u);
    goto LABEL_7;
  }
  result = xpc_array_get_count(a2);
  if (!result)
  {
LABEL_7:
    qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a *non-empty* array of strings";
    __break(1u);
    return result;
  }
  v5 = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = malloc_type_calloc(result, 0x10uLL, 0x1050040717B85FCuLL);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __assert_rtn("_notification_introspection_init_block_invoke", "notify_client.c", 1888, "exempt_notifications != NULL");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = sub_1AEA58230;
  applier[3] = &unk_1E5E0D3D8;
  applier[4] = *(_QWORD *)(a1 + 32);
  return xpc_array_apply(a2, applier);
}

uint64_t sub_1AEA58230(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  const char *string_ptr;
  size_t length;

  result = MEMORY[0x1AF455288](a3);
  if (result == MEMORY[0x1E0C89020])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    length = xpc_string_get_length(a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16 * a2) = strdup(string_ptr);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16 * a2 + 8) = length;
    return 1;
  }
  else
  {
    qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a non-empty array of *strings*";
    __break(1u);
  }
  return result;
}

uint32_t notify_register_signal(const char *name, int sig, int *out_token)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  os_unfair_lock_s *v11;
  unsigned int v12;
  unsigned int v13;
  uint32_t v14;
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
  unsigned int v25;
  uint64_t has_internal_diagnostics;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int *v35;
  unsigned int v36;
  int v37;
  mach_port_t v38;
  NSObject *global_queue;
  unsigned int v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD handler[4];
  int v62;
  mach_msg_header_t msg[23];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C874D8];
  v6 = sub_1AEA55D3C();
  if ((sub_1AEA57F50(name) & 1) == 0 && os_variant_has_internal_diagnostics())
    sub_1AEA56E70("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v54, v55, v56, v57, v58, v59, v60, (char)name);
  if ((*(_DWORD *)(v6 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v7 = *(_DWORD **)(v6 + 592);
    if (v7 && *v7 != *(_DWORD *)(v6 + 112))
    {
      v14 = sub_1AEA578B0(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
      if (v14)
      {
        if (v14 < 0xB)
          return v14;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
          goto LABEL_51;
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v27, v28, v29, v30, v31, v32, v33, (char)"notify_register_signal");
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
    }
  }
  if (!name)
    return 1;
  if (!strncmp(name, "self.", 5uLL))
    goto LABEL_11;
  if (qword_1ECCD9400 != -1)
    dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
  if (byte_1EEE120B0)
  {
LABEL_11:
    v8 = (unsigned int *)(v6 + 488);
    do
    {
      v9 = __ldxr(v8);
      v10 = v9 + 1;
    }
    while (__stxr(v9 + 1, v8));
    *(_QWORD *)&msg[0].msgh_bits = 0;
    v11 = (os_unfair_lock_s *)(v6 + 344);
    os_unfair_lock_lock_with_options();
    v12 = sub_1AEA574A4(v6 + 128, name, v10, msg);
    if (v12)
    {
      v13 = v12;
      os_unfair_lock_unlock(v11);
      v14 = v13;
      if (v13 >= 0xB)
      {
        v14 = 1000000;
        v15 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v15)
          goto LABEL_35;
        goto LABEL_53;
      }
    }
    else
    {
      v23 = *(_QWORD *)&msg[0].msgh_bits;
      *(_BYTE *)(*(_QWORD *)&msg[0].msgh_bits + 79) = *(_BYTE *)(*(_QWORD *)&msg[0].msgh_bits + 79) & 0xF0 | 5;
      *(_DWORD *)(v23 + 68) = 0;
      *(_DWORD *)(v23 + 56) = sig;
      v24 = *(_QWORD *)(*(_QWORD *)(v23 + 48) + 16);
      os_unfair_lock_unlock(v11);
      v25 = sub_1AEA54D8C(name, v24, v10, v10, -1, 0x80000005, sig, -1, 0, 0);
      if (!v25)
      {
        v14 = 0;
        *out_token = v10;
        return v14;
      }
      v14 = v25;
      if (v25 >= 0xB)
      {
        v14 = 1000000;
        v15 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v15)
          goto LABEL_35;
        goto LABEL_53;
      }
    }
    return v14;
  }
  if ((*(_DWORD *)(v6 + 116) & 1) != 0)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    handler[0] = MEMORY[0x1E0C87450];
    handler[1] = 0x40000000;
    handler[2] = sub_1AEA588BC;
    handler[3] = &unk_1E5E0D268;
    v62 = sig;
    v14 = notify_register_dispatch(name, out_token, global_queue, handler);
    if (v14 >= 0xB)
    {
      v14 = 1000000;
      v15 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v15)
      {
LABEL_35:
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v16, v17, v18, v19, v20, v21, v22, (char)"notify_register_signal");
        return v14;
      }
LABEL_53:
      sub_1AEA576FC(v15, "Libnotify: %s failed with code %d on line %d", v17, v18, v19, v20, v21, v22, (char)"notify_register_signal");
    }
  }
  else
  {
    v34 = *(_DWORD *)(v6 + 384);
    if (!v34)
    {
      v50 = sub_1AEA53FC8(v6);
      if (v50)
      {
        v14 = v50;
        if (v50 < 0xB)
          return v14;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
          goto LABEL_51;
LABEL_47:
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v51, v28, v29, v30, v31, v32, v33, (char)"notify_register_signal");
        return 1000000;
      }
      v34 = *(_DWORD *)(v6 + 384);
    }
    v35 = (unsigned int *)(v6 + 488);
    do
    {
      v36 = __ldxr(v35);
      v37 = v36 + 1;
    }
    while (__stxr(v36 + 1, v35));
    memset(msg, 0, 512);
    *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C87D40];
    if (MEMORY[0x1E0C884E8])
      v38 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, name, 512);
    else
      v38 = mig_strncpy((char *)&msg[1].msgh_voucher_port, name, 512);
    msg[1].msgh_remote_port = 0;
    msg[1].msgh_local_port = v38;
    v40 = (v38 + 3) & 0xFFFFFFFC;
    v41 = (char *)msg + v40;
    *((_DWORD *)v41 + 10) = v37;
    *((_DWORD *)v41 + 11) = sig;
    msg[0].msgh_bits = 19;
    *(_QWORD *)&msg[0].msgh_remote_port = v34;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x3F500000000;
    if (MEMORY[0x1E0C88840])
      voucher_mach_msg_set(msg);
    if (mach_msg(msg, 1, v40 + 48, 0, 0, 0, 0))
    {
      v14 = 1000000;
      v42 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v42)
        sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v43, v44, v45, v46, v47, v48, v49, (char)"notify_register_signal");
      else
        sub_1AEA576FC(v42, "Libnotify: %s failed with code %d (%d) on line %d", v44, v45, v46, v47, v48, v49, (char)"notify_register_signal");
      return v14;
    }
    v52 = sub_1AEA54D8C(name, -1, v37, v37, -1, 0x40000005u, sig, -1, 0, 0);
    v14 = v52;
    if (!v52)
    {
      *out_token = v37;
      return v14;
    }
    if (v52 >= 0xB)
    {
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (!(_DWORD)has_internal_diagnostics)
      {
LABEL_51:
        sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v28, v29, v30, v31, v32, v33, (char)"notify_register_signal");
        return 1000000;
      }
      goto LABEL_47;
    }
  }
  return v14;
}

uint64_t sub_1AEA588BC(uint64_t a1)
{
  pid_t v2;

  v2 = getpid();
  return kill(v2, *(_DWORD *)(a1 + 32));
}

dispatch_queue_t sub_1AEA588E0(uint64_t a1)
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.notify.background.local.notification", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504) = result;
  return result;
}

uint64_t sub_1AEA58914(uint64_t a1)
{
  mach_msg_id_t v1;
  mach_msg_header_t msg;

  v1 = *(_DWORD *)(a1 + 36);
  msg.msgh_remote_port = *(_DWORD *)(a1 + 32);
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = v1;
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint32_t notify_register_file_descriptor(const char *name, int *notify_fd, int flags, int *out_token)
{
  char v5;
  uint64_t v8;
  _DWORD *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t has_internal_diagnostics;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  os_unfair_lock_s *v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint32_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63[2];
  uint64_t v64;

  v5 = flags;
  v64 = *MEMORY[0x1E0C874D8];
  v8 = sub_1AEA55D3C();
  if ((sub_1AEA57F50(name) & 1) == 0 && os_variant_has_internal_diagnostics())
    sub_1AEA56E70("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v55, v56, v57, v58, v59, v60, v61, (char)name);
  if ((*(_DWORD *)(v8 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v9 = *(_DWORD **)(v8 + 592);
    if (v9 && *v9 != *(_DWORD *)(v8 + 112))
    {
      v10 = sub_1AEA578B0(v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
      if (v10)
      {
        if (v10 < 0xB)
          return v10;
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
        {
LABEL_66:
          sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v17, v18, v19, v20, v21, v22, (char)"notify_register_file_descriptor");
          return 1000000;
        }
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v16, v17, v18, v19, v20, v21, v22, (char)"notify_register_file_descriptor");
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
    }
  }
  if (!name)
    return 1;
  if (!notify_fd)
    return 4;
  if ((v5 & 1) != 0)
  {
    v11 = *(unsigned int *)(v8 + 512);
    if ((_DWORD)v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)(v8 + 520);
      while (*(_DWORD *)(v13 + 4 * v12) != *notify_fd)
      {
        if (v11 == ++v12)
          return 4;
      }
      v31 = 4 * v12;
      v63[0] = *(_DWORD *)(v13 + v31);
      v63[1] = *(_DWORD *)(*(_QWORD *)(v8 + 528) + v31);
      goto LABEL_25;
    }
    return 4;
  }
  if (pipe(v63) < 0)
  {
    v23 = os_variant_has_internal_diagnostics();
    v10 = 1000000;
    if (!(_DWORD)v23)
      goto LABEL_60;
    goto LABEL_40;
  }
  *notify_fd = v63[0];
LABEL_25:
  if (strncmp(name, "self.", 5uLL))
  {
    if (qword_1ECCD9400 != -1)
      dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
    if (!byte_1EEE120B0)
    {
      if ((*(_DWORD *)(v8 + 116) & 1) != 0)
      {
        v10 = sub_1AEA590AC((char *)name, (unsigned int *)out_token, v63[0], v63[1]);
        if (v10)
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }
          if (v10 < 0xB)
            return v10;
          has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if (!(_DWORD)has_internal_diagnostics)
            goto LABEL_66;
LABEL_58:
          sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v53, v17, v18, v19, v20, v21, v22, (char)"notify_register_file_descriptor");
          return 1000000;
        }
      }
      else
      {
        if (!*(_DWORD *)(v8 + 384))
        {
          v54 = sub_1AEA53FC8(v8);
          if (v54)
          {
            v10 = v54;
            if ((v5 & 1) == 0)
            {
              close_NOCANCEL();
              close_NOCANCEL();
            }
            if (v10 < 0xB)
              return v10;
            has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if (!(_DWORD)has_internal_diagnostics)
              goto LABEL_66;
            goto LABEL_58;
          }
        }
        if ((fileport_makeport() & 0x80000000) != 0)
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }
          v23 = os_variant_has_internal_diagnostics();
          v10 = 1000000;
          if ((_DWORD)v23)
            goto LABEL_40;
          goto LABEL_60;
        }
        v42 = (unsigned int *)(v8 + 488);
        do
        {
          v43 = __ldxr(v42);
          v44 = v43 + 1;
        }
        while (__stxr(v43 + 1, v42));
        if (sub_1AEA59E64(*(_DWORD *)(v8 + 384), name, v44, 0))
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }
          v45 = os_variant_has_internal_diagnostics();
          v10 = 1000000;
          if ((_DWORD)v45)
            sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v46, v47, v48, v49, v50, v51, v52, (char)"notify_register_file_descriptor");
          else
            sub_1AEA576FC(v45, "Libnotify: %s failed with code %d (%d) on line %d", v47, v48, v49, v50, v51, v52, (char)"notify_register_file_descriptor");
          return v10;
        }
        v10 = sub_1AEA54D8C(name, -1, v44, -1, -1, 4u, -1, *notify_fd, 0, 0);
        if (v10)
          return v10;
        *out_token = v44;
      }
      sub_1AEA58F70(v63[0], v63[1]);
      return v10;
    }
  }
  v32 = (unsigned int *)(v8 + 488);
  do
  {
    v33 = __ldxr(v32);
    v34 = v33 + 1;
  }
  while (__stxr(v33 + 1, v32));
  v35 = v63[1];
  v62 = 0;
  v36 = (os_unfair_lock_s *)(v8 + 344);
  os_unfair_lock_lock_with_options();
  v37 = sub_1AEA574A4(v8 + 128, name, v34, &v62);
  if (!v37)
  {
    v39 = v62;
    *(_BYTE *)(v62 + 79) = *(_BYTE *)(v62 + 79) & 0xF0 | 4;
    *(_DWORD *)(v39 + 56) = v35;
    v40 = *(_QWORD *)(*(_QWORD *)(v39 + 48) + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 344));
    v41 = sub_1AEA54D8C(name, v40, v34, v34, -1, 0x80000004, -1, *notify_fd, 0, 0);
    if (!v41)
    {
      *out_token = v34;
      sub_1AEA58F70(v63[0], v63[1]);
      return 0;
    }
    v10 = v41;
    if (v41 < 0xB)
      return v10;
    v10 = 1000000;
    v23 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v23)
      goto LABEL_60;
LABEL_40:
    sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v24, v25, v26, v27, v28, v29, v30, (char)"notify_register_file_descriptor");
    return v10;
  }
  v38 = v37;
  os_unfair_lock_unlock(v36);
  if ((v5 & 1) == 0)
  {
    close_NOCANCEL();
    close_NOCANCEL();
  }
  v10 = v38;
  if (v38 >= 0xB)
  {
    v10 = 1000000;
    v23 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v23)
      goto LABEL_40;
LABEL_60:
    sub_1AEA576FC(v23, "Libnotify: %s failed with code %d on line %d", v25, v26, v27, v28, v29, v30, (char)"notify_register_file_descriptor");
  }
  return v10;
}

void sub_1AEA58F70(int a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  unsigned int v10;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_1AEA55D3C();
  if (((a2 | a1) & 0x80000000) == 0)
  {
    v5 = v4;
    v6 = (os_unfair_lock_s *)(v4 + 104);
    os_unfair_lock_lock_with_options();
    v7 = *(unsigned int *)(v5 + 512);
    v8 = *(_DWORD **)(v5 + 520);
    if (!(_DWORD)v7)
      goto LABEL_15;
    v9 = 0;
    do
    {
      if (v8[v9] == a1)
        v10 = v9;
      else
        v10 = -1;
      ++v9;
    }
    while (v10 == -1 && v9 < v7);
    if (v10 == -1)
    {
LABEL_15:
      *(_DWORD *)(v5 + 512) = v7 + 1;
      *(_QWORD *)(v5 + 520) = reallocf(v8, 4 * (v7 + 1));
      *(_QWORD *)(v5 + 528) = reallocf(*(void **)(v5 + 528), 4 * *(unsigned int *)(v5 + 512));
      v12 = reallocf(*(void **)(v5 + 536), 4 * *(unsigned int *)(v5 + 512));
      *(_QWORD *)(v5 + 536) = v12;
      v13 = *(_QWORD *)(v5 + 520);
      if (v13 && v12 && (v14 = *(_QWORD *)(v5 + 528)) != 0)
      {
        *(_DWORD *)(v13 + 4 * v7) = a1;
        *(_DWORD *)(v14 + 4 * v7) = a2;
        v12[v7] = 1;
      }
      else
      {
        free(*(void **)(v5 + 520));
        *(_QWORD *)(v5 + 520) = 0;
        free(*(void **)(v5 + 528));
        *(_QWORD *)(v5 + 528) = 0;
        free(*(void **)(v5 + 536));
        *(_QWORD *)(v5 + 536) = 0;
        *(_DWORD *)(v5 + 512) = 0;
      }
    }
    else
    {
      ++*(_DWORD *)(*(_QWORD *)(v5 + 536) + 4 * v10);
    }
    os_unfair_lock_unlock(v6);
  }
}

uint64_t sub_1AEA590AC(char *a1, unsigned int *a2, int a3, int a4)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  NSObject *global_queue;
  unsigned int v13;
  _QWORD aBlock[4];
  int v15;
  unsigned int v16;

  v8 = sub_1AEA55D3C();
  if (!*(_DWORD *)(v8 + 392))
    return 19;
  result = sub_1AEA54714(a1, a2, v8, 0);
  if (!(_DWORD)result)
  {
    v10 = sub_1AEA55CB8();
    if (v10)
    {
      v11 = v10;
      *(_DWORD *)(v10 + 20) = *a2;
      *(_DWORD *)(v10 + 36) = a3;
      global_queue = dispatch_get_global_queue(2, 0);
      *(_QWORD *)(v11 + 48) = global_queue;
      dispatch_retain(global_queue);
      v13 = bswap32(*(_DWORD *)(v11 + 20));
      aBlock[0] = MEMORY[0x1E0C87450];
      aBlock[1] = 0x40000000;
      aBlock[2] = sub_1AEA59198;
      aBlock[3] = &unk_1E5E0D480;
      v15 = a4;
      v16 = v13;
      *(_QWORD *)(v11 + 56) = _Block_copy(aBlock);
      sub_1AEA55798((char *)v11);
      return 0;
    }
    else
    {
      return 18;
    }
  }
  return result;
}

uint64_t sub_1AEA59198()
{
  return write_NOCANCEL();
}

uint64_t notify_get_event(uint64_t a1, _DWORD *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t has_internal_diagnostics;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;

  if ((byte_1EEE120B8 & 1) == 0)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      sub_1AEA56E70("Libnotify client using deprecated function notify_get_event; this function does nothing",
        v7,
        v8,
        v9,
        v10,
        v11,
        v12,
        v13,
        v15);
    else
      sub_1AEA576FC(has_internal_diagnostics, "Libnotify client using deprecated function notify_get_event; this function does nothing",
        v8,
        v9,
        v10,
        v11,
        v12,
        v13,
        v15);
    byte_1EEE120B8 = 1;
  }
  if (a2)
    *a2 = 0;
  if (a4)
    *a4 = 0;
  return 0;
}

uint32_t notify_suspend(int token)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v9;
  int v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  os_unfair_lock_s *v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int msg;
  _BYTE msg_4[44];

  v2 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v2 + 116) & 2) == 0)
    goto LABEL_5;
  os_unfair_lock_lock_with_options();
  v3 = *(_DWORD **)(v2 + 592);
  if (!v3 || *v3 == *(_DWORD *)(v2 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    goto LABEL_5;
  }
  v11 = sub_1AEA578B0(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
  if (!v11)
  {
LABEL_5:
    v4 = sub_1AEA55CB8();
    if (!v4)
      return 2;
    v5 = v4;
    if ((*(_DWORD *)(v4 + 24) & 0x80000000) != 0)
    {
      os_unfair_lock_lock_with_options();
      v12 = os_set_64_ptr_find();
      if (v12)
      {
        v13 = *(_QWORD *)(v2 + 224);
        if (v13 != v12)
        {
          v14 = v12 - v13;
          *(_BYTE *)(v14 + 79) |= 0x20u;
          v15 = *(unsigned __int8 *)(v14 + 78);
          if (v15 != 255)
            *(_BYTE *)(v14 + 78) = v15 + 1;
        }
      }
      v16 = (os_unfair_lock_s *)(v2 + 344);
    }
    else
    {
      if (qword_1ECCD9400 != -1)
        dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
      if (byte_1EEE120B0)
      {
        qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return token;
      }
      if (!*(_DWORD *)(v2 + 384))
      {
        v26 = sub_1AEA53FC8(v2);
        if (v26)
        {
          v11 = v26;
          sub_1AEA55798((char *)v5);
          if (v11 >= 0xB)
          {
            has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if ((_DWORD)has_internal_diagnostics)
            {
LABEL_34:
              sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, v24, (char)"notify_suspend");
              return 1000000;
            }
LABEL_47:
            sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, (char)"notify_suspend");
            return 1000000;
          }
          return v11;
        }
      }
      os_unfair_lock_lock_with_options();
      v6 = *(_DWORD *)(v5 + 24);
      if ((v6 & 0x4000000) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v5 + 104) + 40));
        v7 = *(_DWORD *)(v2 + 384);
        memset(&msg_4[16], 0, 28);
        *(_OWORD *)msg_4 = 0u;
        *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C87D40];
        *(_DWORD *)&msg_4[28] = token;
        special_reply_port = mig_get_special_reply_port();
        *(_DWORD *)&msg_4[4] = v7;
        *(_DWORD *)&msg_4[8] = special_reply_port;
        msg = 5395;
        *(_QWORD *)&msg_4[12] = 0x3EC00000000;
        if (MEMORY[0x1E0C88840])
        {
          voucher_mach_msg_set((mach_msg_header_t *)&msg);
          special_reply_port = *(_DWORD *)&msg_4[8];
        }
        v9 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
        v10 = v9;
        if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
        {
          sub_1AEA55798((char *)v5);
          goto LABEL_56;
        }
        if (v9)
        {
          mig_dealloc_special_reply_port();
          goto LABEL_55;
        }
        if (*(_DWORD *)&msg_4[16] == 71)
        {
          v10 = -308;
        }
        else
        {
          if (*(_DWORD *)&msg_4[16] == 1104)
          {
            if (msg < 0)
              goto LABEL_53;
            if (*(_DWORD *)msg_4 != 40)
            {
              if (*(_DWORD *)msg_4 == 36)
              {
                if (*(_DWORD *)&msg_4[4])
                  v27 = 1;
                else
                  v27 = *(_DWORD *)&msg_4[28] == 0;
                if (v27)
                  v10 = -300;
                else
                  v10 = *(_DWORD *)&msg_4[28];
                goto LABEL_54;
              }
              goto LABEL_53;
            }
            if (*(_DWORD *)&msg_4[4])
            {
LABEL_53:
              v10 = -300;
              goto LABEL_54;
            }
            v10 = *(_DWORD *)&msg_4[28];
            if (*(_DWORD *)&msg_4[28])
              goto LABEL_54;
            token = *(_DWORD *)&msg_4[32];
            sub_1AEA55798((char *)v5);
            if (token >= 0xB)
            {
LABEL_56:
              v11 = 1000000;
              v28 = os_variant_has_internal_diagnostics();
              if ((_DWORD)v28)
                sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v29, v30, v31, v32, v33, v34, v35, (char)"notify_suspend");
              else
                sub_1AEA576FC(v28, "Libnotify: %s failed with code %d (%d) on line %d", v30, v31, v32, v33, v34, v35, (char)"notify_suspend");
              return v11;
            }
            return token;
          }
          v10 = -301;
        }
LABEL_54:
        mach_msg_destroy((mach_msg_header_t *)&msg);
LABEL_55:
        sub_1AEA55798((char *)v5);
        if (v10)
          goto LABEL_56;
        return 0;
      }
      *(_DWORD *)(v5 + 24) = v6 | 0x800000;
      v16 = (os_unfair_lock_s *)(*(_QWORD *)(v5 + 104) + 40);
    }
    os_unfair_lock_unlock(v16);
    sub_1AEA55798((char *)v5);
    return 0;
  }
  if (v11 >= 0xB)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      goto LABEL_34;
    goto LABEL_47;
  }
  return v11;
}

uint32_t notify_resume(int token)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v9;
  int v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int msg;
  _BYTE msg_4[44];

  v2 = sub_1AEA55D3C();
  if ((*(_DWORD *)(v2 + 116) & 2) == 0)
    goto LABEL_5;
  os_unfair_lock_lock_with_options();
  v3 = *(_DWORD **)(v2 + 592);
  if (!v3 || *v3 == *(_DWORD *)(v2 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    goto LABEL_5;
  }
  v11 = sub_1AEA578B0(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
  if (!v11)
  {
LABEL_5:
    v4 = sub_1AEA55CB8();
    if (!v4)
      return 2;
    v5 = v4;
    if ((*(_DWORD *)(v4 + 24) & 0x80000000) != 0)
    {
      os_unfair_lock_lock_with_options();
      v12 = os_set_64_ptr_find();
      if (v12)
      {
        v13 = *(_QWORD *)(v2 + 224);
        v14 = v12 - v13;
        if (v12 != v13)
        {
          if (!*(_BYTE *)(v14 + 78) || (v15 = *(_BYTE *)(v14 + 78) - 1, (*(_BYTE *)(v14 + 78) = v15) == 0))
          {
            v16 = *(_BYTE *)(v14 + 79);
            *(_BYTE *)(v14 + 79) = v16 & 0x5F;
            if ((v16 & 0x40) != 0)
              sub_1AEA56EE8(v2 + 128, v14);
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 344));
    }
    else
    {
      if (qword_1ECCD9400 != -1)
        dispatch_once(&qword_1ECCD9400, &unk_1E5E0D310);
      if (byte_1EEE120B0)
      {
        qword_1EEE12078 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return token;
      }
      if (!*(_DWORD *)(v2 + 384))
      {
        v26 = sub_1AEA53FC8(v2);
        if (v26)
        {
          v11 = v26;
          sub_1AEA55798((char *)v5);
          if (v11 >= 0xB)
          {
            has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if ((_DWORD)has_internal_diagnostics)
            {
LABEL_37:
              sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, v24, (char)"notify_resume");
              return 1000000;
            }
LABEL_50:
            sub_1AEA576FC(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, (char)"notify_resume");
            return 1000000;
          }
          return v11;
        }
      }
      os_unfair_lock_lock_with_options();
      v6 = *(_DWORD *)(v5 + 24);
      if ((v6 & 0x4000000) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v5 + 104) + 40));
        v7 = *(_DWORD *)(v2 + 384);
        memset(&msg_4[16], 0, 28);
        *(_OWORD *)msg_4 = 0u;
        *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C87D40];
        *(_DWORD *)&msg_4[28] = token;
        special_reply_port = mig_get_special_reply_port();
        *(_DWORD *)&msg_4[4] = v7;
        *(_DWORD *)&msg_4[8] = special_reply_port;
        msg = 5395;
        *(_QWORD *)&msg_4[12] = 0x3ED00000000;
        if (MEMORY[0x1E0C88840])
        {
          voucher_mach_msg_set((mach_msg_header_t *)&msg);
          special_reply_port = *(_DWORD *)&msg_4[8];
        }
        v9 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
        v10 = v9;
        if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
        {
          sub_1AEA55798((char *)v5);
          goto LABEL_59;
        }
        if (v9)
        {
          mig_dealloc_special_reply_port();
          goto LABEL_58;
        }
        if (*(_DWORD *)&msg_4[16] == 71)
        {
          v10 = -308;
        }
        else
        {
          if (*(_DWORD *)&msg_4[16] == 1105)
          {
            if (msg < 0)
              goto LABEL_56;
            if (*(_DWORD *)msg_4 != 40)
            {
              if (*(_DWORD *)msg_4 == 36)
              {
                if (*(_DWORD *)&msg_4[4])
                  v27 = 1;
                else
                  v27 = *(_DWORD *)&msg_4[28] == 0;
                if (v27)
                  v10 = -300;
                else
                  v10 = *(_DWORD *)&msg_4[28];
                goto LABEL_57;
              }
              goto LABEL_56;
            }
            if (*(_DWORD *)&msg_4[4])
            {
LABEL_56:
              v10 = -300;
              goto LABEL_57;
            }
            v10 = *(_DWORD *)&msg_4[28];
            if (*(_DWORD *)&msg_4[28])
              goto LABEL_57;
            token = *(_DWORD *)&msg_4[32];
            sub_1AEA55798((char *)v5);
            if (token >= 0xB)
            {
LABEL_59:
              v11 = 1000000;
              v28 = os_variant_has_internal_diagnostics();
              if ((_DWORD)v28)
                sub_1AEA56E70("Libnotify: %s failed with code %d (%d) on line %d", v29, v30, v31, v32, v33, v34, v35, (char)"notify_resume");
              else
                sub_1AEA576FC(v28, "Libnotify: %s failed with code %d (%d) on line %d", v30, v31, v32, v33, v34, v35, (char)"notify_resume");
              return v11;
            }
            return token;
          }
          v10 = -301;
        }
LABEL_57:
        mach_msg_destroy((mach_msg_header_t *)&msg);
LABEL_58:
        sub_1AEA55798((char *)v5);
        if (v10)
          goto LABEL_59;
        return 0;
      }
      *(_DWORD *)(v5 + 24) = v6 & 0xFF3FFFFF;
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v5 + 104) + 40));
      if ((v6 & 0x400000) != 0)
        sub_1AEA55E9C(v5);
    }
    sub_1AEA55798((char *)v5);
    return 0;
  }
  if (v11 >= 0xB)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      goto LABEL_37;
    goto LABEL_50;
  }
  return v11;
}

uint64_t notify_simple_post(char *name)
{
  uint64_t has_internal_diagnostics;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  if ((byte_1EEE120B9 & 1) == 0)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics)
      sub_1AEA56E70("Libnotify client using deprecated function notify_simple_post, use notify_post instead", v3, v4, v5, v6, v7, v8, v9, v11);
    else
      sub_1AEA576FC(has_internal_diagnostics, "Libnotify client using deprecated function notify_simple_post, use notify_post instead", v4, v5, v6, v7, v8, v9, v11);
    byte_1EEE120B9 = 1;
  }
  return notify_post(name);
}

uint64_t notify_dump_status()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v4;
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
  int has_internal_diagnostics;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE msg[36];
  uint64_t v42;

  v0 = sub_1AEA55D3C();
  v1 = v0;
  if (*(_DWORD *)(v0 + 384) || (v6 = sub_1AEA53FC8(v0), !(_DWORD)v6))
  {
    if ((creat_NOCANCEL() & 0x80000000) != 0)
    {
      v5 = 1000000;
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      v16 = __error();
      if (has_internal_diagnostics)
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d (errno: %d)", v17, v18, v19, v20, v21, v22, v23, (char)"notify_dump_status");
      else
        sub_1AEA576FC((uint64_t)v16, "Libnotify: %s failed with code %d on line %d (errno: %d)", v18, v19, v20, v21, v22, v23, (char)"notify_dump_status");
    }
    else if ((fileport_makeport() & 0x80000000) != 0)
    {
      close_NOCANCEL();
      v24 = os_variant_has_internal_diagnostics();
      v5 = 1000000;
      if ((_DWORD)v24)
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d (fileport_status: %d)", v25, v26, v27, v28, v29, v30, v31, (char)"notify_dump_status");
      else
        sub_1AEA576FC(v24, "Libnotify: %s failed with code %d on line %d (fileport_status: %d)", v26, v27, v28, v29, v30, v31, (char)"notify_dump_status");
    }
    else
    {
      v2 = *(_DWORD *)(v1 + 384);
      *(_OWORD *)&msg[20] = 0u;
      *(_DWORD *)&msg[4] = 0;
      *(_DWORD *)&msg[24] = 1;
      *(_DWORD *)&msg[28] = 0;
      v42 = 1114112;
      special_reply_port = mig_get_special_reply_port();
      *(_DWORD *)&msg[8] = v2;
      *(_DWORD *)&msg[12] = special_reply_port;
      *(_DWORD *)msg = -2147478253;
      *(_QWORD *)&msg[16] = 0x40000000000;
      if (MEMORY[0x1E0C88840])
      {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
        special_reply_port = *(_DWORD *)&msg[12];
      }
      v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
      if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
      {
        if (v4)
        {
          mig_dealloc_special_reply_port();
        }
        else
        {
          if (*(_DWORD *)&msg[20] == 1124
            && (*(_DWORD *)msg & 0x80000000) == 0
            && *(_DWORD *)&msg[4] == 36
            && !*(_DWORD *)&msg[8]
            && !*(_DWORD *)&msg[32])
          {
            close_NOCANCEL();
            return 0;
          }
          mach_msg_destroy((mach_msg_header_t *)msg);
        }
      }
      close_NOCANCEL();
      v32 = os_variant_has_internal_diagnostics();
      v5 = 1000000;
      if ((_DWORD)v32)
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d (kstatus: %d)", v33, v34, v35, v36, v37, v38, v39, (char)"notify_dump_status");
      else
        sub_1AEA576FC(v32, "Libnotify: %s failed with code %d on line %d (kstatus: %d)", v34, v35, v36, v37, v38, v39, (char)"notify_dump_status");
    }
  }
  else
  {
    v5 = v6;
    if (v6 >= 0xB)
    {
      v5 = 1000000;
      v7 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v7)
        sub_1AEA56E70("Libnotify: %s failed with code %d on line %d", v8, v9, v10, v11, v12, v13, v14, (char)"notify_dump_status");
      else
        sub_1AEA576FC(v7, "Libnotify: %s failed with code %d on line %d", v9, v10, v11, v12, v13, v14, (char)"notify_dump_status");
    }
  }
  return v5;
}

uint64_t sub_1AEA59E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = os_set_64_ptr_delete();
  if (result != a3)
    __assert_rtn("_nc_table_delete_64", "table.c", 80, "os_set_delete(&t->set, key) == expected");
  return result;
}

uint64_t sub_1AEA59E4C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

uint64_t sub_1AEA59E64(unsigned int a1, const char *a2, int a3, int a4)
{
  int v6;
  uint64_t v7;
  mach_msg_header_t v9;
  int v10;
  int v11;
  __int128 v12;
  _OWORD v13[33];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  memset(v13, 0, 464);
  memset(&v9, 0, sizeof(v9));
  v10 = 1;
  v11 = a4;
  DWORD1(v12) = 1114112;
  *((_QWORD *)&v12 + 1) = *MEMORY[0x1E0C87D40];
  if (MEMORY[0x1E0C884E8])
    v6 = mig_strncpy_zerofill((char *)v13 + 8, a2, 512);
  else
    v6 = mig_strncpy((char *)v13 + 8, a2, 512);
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v6;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v13 + v7 + 8) = a3;
  v9.msgh_bits = -2147483629;
  *(_QWORD *)&v9.msgh_remote_port = a1;
  *(_QWORD *)&v9.msgh_voucher_port = 0x3F600000000;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(&v9);
  return mach_msg(&v9, 1, v7 + 60, 0, 0, 0, 0);
}

uint64_t sub_1AEA59FAC(unsigned int a1, const char *a2, int a3, int a4)
{
  int v6;
  uint64_t v7;
  mach_msg_header_t v9;
  int v10;
  int v11;
  __int128 v12;
  _OWORD v13[33];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  memset(v13, 0, 464);
  memset(&v9, 0, sizeof(v9));
  v10 = 1;
  v11 = a4;
  DWORD1(v12) = 1310720;
  *((_QWORD *)&v12 + 1) = *MEMORY[0x1E0C87D40];
  if (MEMORY[0x1E0C884E8])
    v6 = mig_strncpy_zerofill((char *)v13 + 8, a2, 512);
  else
    v6 = mig_strncpy((char *)v13 + 8, a2, 512);
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v6;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v13 + v7 + 8) = a3;
  v9.msgh_bits = -2147483629;
  *(_QWORD *)&v9.msgh_remote_port = a1;
  *(_QWORD *)&v9.msgh_voucher_port = 0x3F700000000;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(&v9);
  return mach_msg(&v9, 1, v7 + 60, 0, 0, 0, 0);
}

uint64_t sub_1AEA5A0F4(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4, _DWORD *a5)
{
  int v9;
  uint64_t v10;
  mach_msg_size_t v11;
  mach_port_name_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_port_name_t rcv_name[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C874D8];
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v18 = 0u;
  *((_QWORD *)&v18 + 1) = *MEMORY[0x1E0C87D40];
  if (MEMORY[0x1E0C884E8])
    v9 = mig_strncpy_zerofill((char *)&v19 + 8, a2, 512);
  else
    v9 = mig_strncpy((char *)&v19 + 8, a2, 512);
  LODWORD(v19) = 0;
  DWORD1(v19) = v9;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v10 + 44;
  *(_DWORD *)((char *)&v19 + v10 + 8) = a3;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v18 = 0x40300000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v13 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v11, 0x3Cu, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (DWORD1(v18) == 71)
      {
        v14 = 4294966988;
      }
      else if (DWORD1(v18) == 1127)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            v14 = 4294966996;
            if ((_DWORD)v19)
            {
              if (rcv_name[2])
                v14 = 4294966996;
              else
                v14 = v19;
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_26;
        }
        v14 = 4294966996;
        if (DWORD2(v18) == 1 && rcv_name[1] == 52 && !rcv_name[2] && WORD3(v19) << 16 == 0x100000)
        {
          v14 = 0;
          v15 = HIDWORD(v18);
          *a4 = v20;
          *a5 = v15;
          return v14;
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t sub_1AEA5A330(mach_port_name_t a1, const char *a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, _DWORD *a12, _QWORD *a13, int *a14)
{
  int v21;
  uint64_t v22;
  mach_msg_size_t v23;
  char *v24;
  mach_port_name_t special_reply_port;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  mach_port_name_t rcv_name[4];
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  _OWORD v37[35];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C874D8];
  memset(v37, 0, 448);
  v32 = 0x14000000000000;
  v36 = 0;
  *(_OWORD *)rcv_name = 0u;
  v31 = 0u;
  DWORD2(v31) = 2;
  v33 = a9;
  v34 = 16777472;
  v35 = a10;
  v36 = *MEMORY[0x1E0C87D40];
  if (MEMORY[0x1E0C884E8])
    v21 = mig_strncpy_zerofill((char *)v37 + 8, a2, 512);
  else
    v21 = mig_strncpy((char *)v37 + 8, a2, 512);
  LODWORD(v37[0]) = 0;
  DWORD1(v37[0]) = v21;
  v22 = (v21 + 3) & 0xFFFFFFFC;
  v23 = v22 + 112;
  v24 = (char *)rcv_name + v22;
  *((_DWORD *)v24 + 18) = a3;
  *((_DWORD *)v24 + 19) = a4;
  *((_DWORD *)v24 + 20) = a5;
  *((_DWORD *)v24 + 21) = a6;
  *((_QWORD *)v24 + 11) = a7;
  *((_QWORD *)v24 + 12) = a8;
  *((_DWORD *)v24 + 26) = a10;
  *((_DWORD *)v24 + 27) = a11;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = -2147478253;
  *(_QWORD *)&v31 = 0x40600000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v26 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v23, 0x3Cu, special_reply_port, 0, 0);
  v27 = v26;
  if ((v26 - 268435458) > 0xE || ((1 << (v26 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v26)
    {
      if (DWORD1(v31) == 71)
      {
        v27 = 4294966988;
      }
      else if (DWORD1(v31) == 1130)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 52)
          {
            if (!rcv_name[2])
            {
              v27 = v32;
              if (!(_DWORD)v32)
              {
                *a12 = HIDWORD(v32);
                *a13 = v33;
                *a14 = v34;
                return v27;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v28 = 1;
            else
              v28 = (_DWORD)v32 == 0;
            if (v28)
              v27 = 4294966996;
            else
              v27 = v32;
            goto LABEL_25;
          }
        }
        v27 = 4294966996;
      }
      else
      {
        v27 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v27;
    }
    mig_dealloc_special_reply_port();
  }
  return v27;
}

uint64_t sub_1AEA5A5B4(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  mach_msg_header_t msg;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v6 = *MEMORY[0x1E0C87D40];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 1031;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
}

uint64_t sub_1AEA5A630(int a1, int a2, uint64_t a3, _QWORD *a4, _DWORD *a5, int a6)
{
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _BYTE msg[36];
  __int128 v15;
  int v16;

  *(_OWORD *)&msg[20] = 0u;
  v15 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C87D40];
  *(_DWORD *)&msg[32] = a2;
  *(_QWORD *)&v15 = a3;
  v16 = 0;
  DWORD2(v15) = a6;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x40800000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v10 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x30u, 0x38u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 1132)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 48)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v11 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a4 = v15;
                *a5 = DWORD2(v15);
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v12 = 1;
            else
              v12 = *(_DWORD *)&msg[32] == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = *(unsigned int *)&msg[32];
            goto LABEL_22;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C87428](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C87440](aBlock);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C87488](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1E0C86EE0]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1E0C86EF0]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1E0C872D8]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1E0C872E8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1E0C872F0]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1E0C87308]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1E0C88A80]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x1E0C88A88]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1E0C88B40]();
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C89038]();
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1E0C88020]();
}

uint64_t creat_NOCANCEL()
{
  return MEMORY[0x1E0C87688]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F98](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C86FA8](queue, context, work);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C86FB8](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C87028](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87128](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C87148](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C87150](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C87158](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C87178](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C871A0](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C871A8](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C871B8](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C871D0](source, handler);
}

uint64_t fileport_makeport()
{
  return MEMORY[0x1E0C880C0]();
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C88258](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C88338](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C88348](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C88358](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1E0C88370](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C883A0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88988](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1E0C884B8]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1E0C884D0]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C884E0](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C884E8](dest, src, *(_QWORD *)&len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C88500](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1E0C88558]();
}

uint64_t os_map_64_init()
{
  return MEMORY[0x1E0C87B78]();
}

uint64_t os_set_32_ptr_delete()
{
  return MEMORY[0x1E0C87BC8]();
}

uint64_t os_set_32_ptr_find()
{
  return MEMORY[0x1E0C87BD0]();
}

uint64_t os_set_32_ptr_foreach()
{
  return MEMORY[0x1E0C87BD8]();
}

uint64_t os_set_32_ptr_init()
{
  return MEMORY[0x1E0C87BE0]();
}

uint64_t os_set_32_ptr_insert()
{
  return MEMORY[0x1E0C87BE8]();
}

uint64_t os_set_64_ptr_delete()
{
  return MEMORY[0x1E0C87BF0]();
}

uint64_t os_set_64_ptr_find()
{
  return MEMORY[0x1E0C87BF8]();
}

uint64_t os_set_64_ptr_init()
{
  return MEMORY[0x1E0C87C00]();
}

uint64_t os_set_64_ptr_insert()
{
  return MEMORY[0x1E0C87C08]();
}

uint64_t os_set_str_ptr_delete()
{
  return MEMORY[0x1E0C87C10]();
}

uint64_t os_set_str_ptr_find()
{
  return MEMORY[0x1E0C87C18]();
}

uint64_t os_set_str_ptr_init()
{
  return MEMORY[0x1E0C87C20]();
}

uint64_t os_set_str_ptr_insert()
{
  return MEMORY[0x1E0C87C28]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C88BC8](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C88BE0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C87C60]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C88570](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C889B0](__ptr, __size);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C88700](a1, *(_QWORD *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C87A40](__str, __sep, __lasts);
}

uint64_t usleep_NOCANCEL()
{
  return MEMORY[0x1E0C87AD8]();
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B20](a1, a2, a3);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C88840](msg);
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x1E0C888E8]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C89060](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C89070](xarray);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C89150]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C89230](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C89238](xdict, key, value);
}

uint64_t xpc_event_publisher_fire_noboost()
{
  return MEMORY[0x1E0C89258]();
}

uint64_t xpc_get_service_identifier_for_token()
{
  return MEMORY[0x1E0C89268]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C892C0](object);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1E0C892E0](xstring);
}

