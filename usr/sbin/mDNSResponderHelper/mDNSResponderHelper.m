uint64_t mdns_bpf_open(int a1, int *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  uint64_t v12;
  char __str[16];
  __int128 v14;

  v4 = 0;
  while (1)
  {
    *(_OWORD *)__str = 0u;
    v14 = 0u;
    snprintf(__str, 0x20uLL, "/dev/bpf%d", v4);
    v5 = open(__str, a1);
    if ((v5 & 0x80000000) == 0)
    {
      v6 = 0;
      if (!a2)
        return v5;
      goto LABEL_17;
    }
    if (!*__error())
    {
      v6 = -6700;
      goto LABEL_13;
    }
    v6 = *__error();
    if (v6 != 16)
      break;
    if (++v4 == 100)
    {
      v6 = 16;
      if (!a2)
        return v5;
      goto LABEL_17;
    }
  }
  if (!v6)
    goto LABEL_16;
LABEL_13:
  if (_mdns_bpf_log_s_once != -1)
    dispatch_once(&_mdns_bpf_log_s_once, &__block_literal_global);
  v7 = _mdns_bpf_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mdns_bpf_log_s_log, OS_LOG_TYPE_ERROR))
  {
LABEL_16:
    if (!a2)
      return v5;
    goto LABEL_17;
  }
  *(_DWORD *)buf = 136446466;
  v10 = __str;
  v11 = 2048;
  v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to open %{public}s: %{mdns:err}ld", buf, 0x16u);
  if (a2)
LABEL_17:
    *a2 = v6;
  return v5;
}

void ___mdns_bpf_log_block_invoke(id a1)
{
  _mdns_bpf_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "bpf");
}

void helper_exit()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "mDNSResponderHelper exiting", v1, 2u);
  }
  exit(0);
}

uint64_t PowerSleepSystem()
{
  io_connect_t v0;
  uint64_t v1;
  NSObject *v2;
  _DWORD v4[2];

  v0 = IOPMFindPowerManagement(0);
  v1 = IOPMSleepSystem(v0);
  if ((_DWORD)v1)
  {
    usleep(0x186A0u);
    v2 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "IOPMSleepSystem %d", (uint8_t *)v4, 8u);
    }
  }
  update_idle_timer();
  return v1;
}

void SetLocalAddressCacheEntry(int a1, int a2, unsigned __int8 *a3, unsigned __int8 *a4, _DWORD *a5)
{
  uint64_t v10;
  _BOOL4 v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
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
  unsigned int v47;
  int v48;
  ssize_t v49;
  ssize_t v50;
  NSObject *v51;
  int v52;
  int v53;
  int *v54;
  char *v55;
  ssize_t v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int *v64;
  char *v65;
  const char *v66;
  uint8_t *v67;
  NSObject *v68;
  uint32_t v69;
  int v70;
  int v71;
  ssize_t v72;
  ssize_t v73;
  NSObject *v74;
  int v75;
  int v76;
  int v77;
  int *v78;
  char *v79;
  ssize_t v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int *v88;
  char *v89;
  NSObject *v90;
  int v91;
  int *v92;
  char *v93;
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
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  timeval v125;
  uint8_t buf[4];
  __int128 v127;
  _WORD v128[55];
  _BYTE v129[6];
  _BYTE v130[10];
  __int16 v131;
  int v132;
  uint8_t __buf[4];
  __int128 v134;
  int v135;
  _BYTE v136[12];
  _DWORD v137[12];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;

  v10 = log_handle;
  v11 = os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO);
  if (a2 == 4)
  {
    if (v11)
    {
      v12 = *a3;
      v13 = a3[1];
      v14 = a3[2];
      v15 = a3[3];
      v16 = *a4;
      v17 = a4[1];
      v18 = a4[2];
      v19 = a4[3];
      v20 = a4[4];
      v21 = a4[5];
      *(_DWORD *)buf = 67111936;
      LODWORD(v127) = a1;
      WORD2(v127) = 1024;
      *(_DWORD *)((char *)&v127 + 6) = 4;
      WORD5(v127) = 1024;
      HIDWORD(v127) = v12;
      v128[0] = 1024;
      *(_DWORD *)&v128[1] = v13;
      v128[3] = 1024;
      *(_DWORD *)&v128[4] = v14;
      v128[6] = 1024;
      *(_DWORD *)&v128[7] = v15;
      v128[9] = 1024;
      *(_DWORD *)&v128[10] = v16;
      v128[12] = 1024;
      *(_DWORD *)&v128[13] = v17;
      v128[15] = 1024;
      *(_DWORD *)&v128[16] = v18;
      v128[18] = 1024;
      *(_DWORD *)&v128[19] = v19;
      v128[21] = 1024;
      *(_DWORD *)&v128[22] = v20;
      v128[24] = 1024;
      *(_DWORD *)&v128[25] = v21;
      v22 = "SetLocalAddressCacheEntry %d IPv%d %d.%d.%d.%d %02X:%02X:%02X:%02X:%02X:%02X";
      v23 = v10;
      v24 = 74;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v22, buf, v24);
    }
  }
  else if (v11)
  {
    v25 = *a3;
    v26 = a3[1];
    v27 = a3[2];
    v28 = a3[3];
    v29 = a3[4];
    v30 = a3[5];
    v31 = a3[6];
    v32 = a3[7];
    v33 = a3[8];
    v34 = a3[9];
    v35 = a3[10];
    v36 = a3[11];
    v37 = a3[12];
    v38 = a3[13];
    v39 = a3[14];
    v40 = a3[15];
    v41 = *a4;
    v42 = a4[1];
    v43 = a4[2];
    v44 = a4[3];
    v45 = a4[4];
    v46 = a4[5];
    *(_DWORD *)buf = 67115008;
    LODWORD(v127) = a1;
    WORD2(v127) = 1024;
    *(_DWORD *)((char *)&v127 + 6) = a2;
    WORD5(v127) = 1024;
    HIDWORD(v127) = v25;
    v128[0] = 1024;
    *(_DWORD *)&v128[1] = v26;
    v128[3] = 1024;
    *(_DWORD *)&v128[4] = v27;
    v128[6] = 1024;
    *(_DWORD *)&v128[7] = v28;
    v128[9] = 1024;
    *(_DWORD *)&v128[10] = v29;
    v128[12] = 1024;
    *(_DWORD *)&v128[13] = v30;
    v128[15] = 1024;
    *(_DWORD *)&v128[16] = v31;
    v128[18] = 1024;
    *(_DWORD *)&v128[19] = v32;
    v128[21] = 1024;
    *(_DWORD *)&v128[22] = v33;
    v128[24] = 1024;
    *(_DWORD *)&v128[25] = v34;
    v128[27] = 1024;
    *(_DWORD *)&v128[28] = v35;
    v128[30] = 1024;
    *(_DWORD *)&v128[31] = v36;
    v128[33] = 1024;
    *(_DWORD *)&v128[34] = v37;
    v128[36] = 1024;
    *(_DWORD *)&v128[37] = v38;
    v128[39] = 1024;
    *(_DWORD *)&v128[40] = v39;
    v128[42] = 1024;
    *(_DWORD *)&v128[43] = v40;
    v128[45] = 1024;
    *(_DWORD *)&v128[46] = v41;
    v128[48] = 1024;
    *(_DWORD *)&v128[49] = v42;
    v128[51] = 1024;
    *(_DWORD *)&v128[52] = v43;
    v128[54] = 1024;
    *(_DWORD *)v129 = v44;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)v130 = v45;
    *(_WORD *)&v130[4] = 1024;
    *(_DWORD *)&v130[6] = v46;
    v22 = "SetLocalAddressCacheEntry %d IPv%d %02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X %02"
          "X:%02X:%02X:%02X:%02X:%02X";
    v23 = v10;
    v24 = 146;
    goto LABEL_6;
  }
  *a5 = -1;
  if ((SetLocalAddressCacheEntry_s & 0x80000000) == 0)
    goto LABEL_9;
  SetLocalAddressCacheEntry_s = socket(17, 3, 0);
  if ((SetLocalAddressCacheEntry_s & 0x80000000) == 0)
    goto LABEL_9;
  v90 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
  {
    v91 = *__error();
    v92 = __error();
    v93 = strerror(*v92);
    *(_DWORD *)buf = 67109378;
    LODWORD(v127) = v91;
    WORD2(v127) = 2080;
    *(_QWORD *)((char *)&v127 + 6) = v93;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "SetLocalAddressCacheEntry: socket(PF_ROUTE, SOCK_RAW, 0) failed %d (%s)", buf, 0x12u);
    if ((SetLocalAddressCacheEntry_s & 0x80000000) == 0)
    {
LABEL_9:
      v125.tv_sec = 0;
      *(_QWORD *)&v125.tv_usec = 0;
      gettimeofday(&v125, 0);
      if (a2 == 4)
      {
        v127 = 0uLL;
        memset(&v128[8], 0, 32);
        *(_OWORD *)&v128[46] = 0uLL;
        memset(&v128[24], 0, 48);
        *(_DWORD *)buf = 17105024;
        LOWORD(v127) = a1;
        *(_QWORD *)((char *)&v127 + 4) = 0x301000804;
        v47 = SetLocalAddressCacheEntry_seq++;
        *(_QWORD *)v128 = v47;
        *(_QWORD *)&v128[4] = 0x400000000;
        *(_DWORD *)&v128[14] = LODWORD(v125.tv_sec) + 30;
        v128[36] = 528;
        *(_DWORD *)&v128[38] = *(_DWORD *)a3;
        v128[44] = 4628;
        v128[45] = a1;
        LOBYTE(v128[46]) = 6;
        LOBYTE(v128[47]) = 6;
        v48 = *(_DWORD *)a4;
        v128[50] = *((_WORD *)a4 + 2);
        *(_DWORD *)&v128[48] = v48;
        v49 = write(SetLocalAddressCacheEntry_s, buf, 0x80uLL);
        if (v49 < 0)
        {
          v50 = v49;
          v51 = log_handle;
          if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
          {
            v52 = *a3;
            v53 = a3[1];
            v113 = a3[2];
            v116 = a3[3];
            v122 = *(_DWORD *)v128;
            v119 = *__error();
            v54 = __error();
            v55 = strerror(*v54);
            *(_DWORD *)__buf = 134220290;
            *(_QWORD *)&v134 = 128;
            WORD4(v134) = 1024;
            *(_DWORD *)((char *)&v134 + 10) = a1;
            HIWORD(v134) = 1024;
            v135 = v52;
            *(_WORD *)v136 = 1024;
            *(_DWORD *)&v136[2] = v53;
            *(_WORD *)&v136[6] = 1024;
            *(_DWORD *)&v136[8] = v113;
            LOWORD(v137[0]) = 1024;
            *(_DWORD *)((char *)v137 + 2) = v116;
            HIWORD(v137[1]) = 1024;
            v137[2] = v122;
            LOWORD(v137[3]) = 2048;
            *(_QWORD *)((char *)&v137[3] + 2) = v50;
            HIWORD(v137[5]) = 1024;
            v137[6] = v119;
            LOWORD(v137[7]) = 2080;
            *(_QWORD *)((char *)&v137[7] + 2) = v55;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "SetLocalAddressCacheEntry: write(%zu) interface %d address %d.%d.%d.%d seq %d result %zd errno %d (%s)", __buf, 0x4Au);
          }
        }
        v56 = read(SetLocalAddressCacheEntry_s, buf, 0x80uLL);
        if ((v56 & 0x8000000000000000) == 0 && !*(_DWORD *)&v128[2])
          goto LABEL_25;
        v57 = log_handle;
        if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        v58 = *a3;
        v59 = a3[1];
        v60 = a3[2];
        v61 = a3[3];
        v62 = *(_DWORD *)v128;
        v63 = *__error();
        v64 = __error();
        v65 = strerror(*v64);
        *(_DWORD *)__buf = 134220546;
        *(_QWORD *)&v134 = 128;
        WORD4(v134) = 1024;
        *(_DWORD *)((char *)&v134 + 10) = a1;
        HIWORD(v134) = 1024;
        v135 = v58;
        *(_WORD *)v136 = 1024;
        *(_DWORD *)&v136[2] = v59;
        *(_WORD *)&v136[6] = 1024;
        *(_DWORD *)&v136[8] = v60;
        LOWORD(v137[0]) = 1024;
        *(_DWORD *)((char *)v137 + 2) = v61;
        HIWORD(v137[1]) = 1024;
        v137[2] = v62;
        LOWORD(v137[3]) = 2048;
        *(_QWORD *)((char *)&v137[3] + 2) = v56;
        HIWORD(v137[5]) = 1024;
        v137[6] = v63;
        LOWORD(v137[7]) = 2080;
        *(_QWORD *)((char *)&v137[7] + 2) = v65;
        HIWORD(v137[9]) = 1024;
        v137[10] = *(_DWORD *)&v128[2];
        v66 = "SetLocalAddressCacheEntry: read (%zu) interface %d address %d.%d.%d.%d seq %d result %zd errno %d (%s) %d";
        v67 = __buf;
        v68 = v57;
        v69 = 80;
      }
      else
      {
        v134 = 0uLL;
        *(_DWORD *)v136 = 0;
        memset(v137, 0, sizeof(v137));
        v138 = 0uLL;
        v141 = 0;
        v140 = 0uLL;
        v139 = 0uLL;
        *(_DWORD *)__buf = 17105036;
        LOWORD(v134) = a1;
        *(_QWORD *)((char *)&v134 + 4) = 0x301000804;
        v70 = SetLocalAddressCacheEntry_seq++;
        *(_QWORD *)&v136[4] = 0x400000000;
        v135 = v70;
        v137[3] = LODWORD(v125.tv_sec) + 30;
        WORD4(v138) = 7708;
        v139 = *(_OWORD *)a3;
        LODWORD(v140) = a1;
        WORD2(v140) = 4628;
        WORD3(v140) = a1;
        BYTE8(v140) = 6;
        BYTE10(v140) = 6;
        v71 = *(_DWORD *)a4;
        LOWORD(v141) = *((_WORD *)a4 + 2);
        HIDWORD(v140) = v71;
        v72 = write(SetLocalAddressCacheEntry_s, __buf, 0x8CuLL);
        if (v72 < 0)
        {
          v73 = v72;
          v74 = log_handle;
          if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
          {
            v75 = *a3;
            v76 = a3[1];
            v77 = a3[2];
            v94 = a3[3];
            v95 = a3[4];
            v96 = a3[5];
            v97 = a3[6];
            v99 = a3[7];
            v101 = a3[8];
            v103 = a3[9];
            v105 = a3[10];
            v107 = a3[11];
            v109 = a3[12];
            v111 = a3[13];
            v114 = a3[14];
            v117 = a3[15];
            v123 = v135;
            v120 = *__error();
            v78 = __error();
            v79 = strerror(*v78);
            *(_DWORD *)buf = 134223362;
            *(_QWORD *)&v127 = 140;
            WORD4(v127) = 1024;
            *(_DWORD *)((char *)&v127 + 10) = a1;
            HIWORD(v127) = 1024;
            *(_DWORD *)v128 = v75;
            v128[2] = 1024;
            *(_DWORD *)&v128[3] = v76;
            v128[5] = 1024;
            *(_DWORD *)&v128[6] = v77;
            v128[8] = 1024;
            *(_DWORD *)&v128[9] = v94;
            v128[11] = 1024;
            *(_DWORD *)&v128[12] = v95;
            v128[14] = 1024;
            *(_DWORD *)&v128[15] = v96;
            v128[17] = 1024;
            *(_DWORD *)&v128[18] = v97;
            v128[20] = 1024;
            *(_DWORD *)&v128[21] = v99;
            v128[23] = 1024;
            *(_DWORD *)&v128[24] = v101;
            v128[26] = 1024;
            *(_DWORD *)&v128[27] = v103;
            v128[29] = 1024;
            *(_DWORD *)&v128[30] = v105;
            v128[32] = 1024;
            *(_DWORD *)&v128[33] = v107;
            v128[35] = 1024;
            *(_DWORD *)&v128[36] = v109;
            v128[38] = 1024;
            *(_DWORD *)&v128[39] = v111;
            v128[41] = 1024;
            *(_DWORD *)&v128[42] = v114;
            v128[44] = 1024;
            *(_DWORD *)&v128[45] = v117;
            v128[47] = 1024;
            *(_DWORD *)&v128[48] = v123;
            v128[50] = 2048;
            *(_QWORD *)&v128[51] = v73;
            *(_WORD *)v129 = 1024;
            *(_DWORD *)&v129[2] = v120;
            *(_WORD *)v130 = 2080;
            *(_QWORD *)&v130[2] = v79;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "SetLocalAddressCacheEntry: write(%zu) interface %d address %02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X seq %d result %zd errno %d (%s)", buf, 0x92u);
          }
        }
        v80 = read(SetLocalAddressCacheEntry_s, __buf, 0x8CuLL);
        if ((v80 & 0x8000000000000000) == 0 && !*(_DWORD *)v136)
          goto LABEL_25;
        v81 = log_handle;
        if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        v82 = *a3;
        v83 = a3[1];
        v84 = a3[2];
        v85 = a3[3];
        v86 = a3[4];
        v98 = a3[5];
        v100 = a3[6];
        v102 = a3[7];
        v104 = a3[8];
        v106 = a3[9];
        v108 = a3[10];
        v110 = a3[11];
        v112 = a3[12];
        v115 = a3[13];
        v118 = a3[14];
        v87 = a3[15];
        v124 = v135;
        v121 = *__error();
        v88 = __error();
        v89 = strerror(*v88);
        *(_DWORD *)buf = 134223618;
        *(_QWORD *)&v127 = 140;
        WORD4(v127) = 1024;
        *(_DWORD *)((char *)&v127 + 10) = a1;
        HIWORD(v127) = 1024;
        *(_DWORD *)v128 = v82;
        v128[2] = 1024;
        *(_DWORD *)&v128[3] = v83;
        v128[5] = 1024;
        *(_DWORD *)&v128[6] = v84;
        v128[8] = 1024;
        *(_DWORD *)&v128[9] = v85;
        v128[11] = 1024;
        *(_DWORD *)&v128[12] = v86;
        v128[14] = 1024;
        *(_DWORD *)&v128[15] = v98;
        v128[17] = 1024;
        *(_DWORD *)&v128[18] = v100;
        v128[20] = 1024;
        *(_DWORD *)&v128[21] = v102;
        v128[23] = 1024;
        *(_DWORD *)&v128[24] = v104;
        v128[26] = 1024;
        *(_DWORD *)&v128[27] = v106;
        v128[29] = 1024;
        *(_DWORD *)&v128[30] = v108;
        v128[32] = 1024;
        *(_DWORD *)&v128[33] = v110;
        v128[35] = 1024;
        *(_DWORD *)&v128[36] = v112;
        v128[38] = 1024;
        *(_DWORD *)&v128[39] = v115;
        v128[41] = 1024;
        *(_DWORD *)&v128[42] = v118;
        v128[44] = 1024;
        *(_DWORD *)&v128[45] = v87;
        v128[47] = 1024;
        *(_DWORD *)&v128[48] = v124;
        v128[50] = 2048;
        *(_QWORD *)&v128[51] = v80;
        *(_WORD *)v129 = 1024;
        *(_DWORD *)&v129[2] = v121;
        *(_WORD *)v130 = 2080;
        *(_QWORD *)&v130[2] = v89;
        v131 = 1024;
        v132 = *(_DWORD *)v136;
        v66 = "SetLocalAddressCacheEntry: read (%zu) interface %d address %02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%0"
              "2X%02X:%02X%02X:%02X%02X seq %d result %zd errno %d (%s) %d";
        v67 = buf;
        v68 = v81;
        v69 = 152;
      }
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, v66, v67, v69);
LABEL_25:
      *a5 = 0;
    }
  }
  update_idle_timer();
}

void SendWakeupPacket(unsigned int a1, const char *a2, uint64_t a3, int a4)
{
  NSObject *v8;
  ether_addr *v9;
  ether_addr *v10;
  int v11;
  int v12;
  uint64_t i;
  int v14;
  _DWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  size_t v18;
  ssize_t v19;
  NSObject *v20;
  _BOOL4 v21;
  ssize_t v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  char *v35;
  int *v36;
  char *v37;
  int *v38;
  char *v39;
  uint8_t v40[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint8_t buf[48];
  _OWORD __buf[32];
  char v46[8];
  uint64_t v47;

  *(_QWORD *)v46 = 0;
  v47 = 0;
  memset(__buf, 0, sizeof(__buf));
  v8 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = a1;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SendWakeupPacket() ether_addr[%s] ip_addr[%s] if_id[%d] iteration[%d]", buf, 0x22u);
  }
  if (!if_indextoname(a1, v46))
  {
    v27 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a1;
    v28 = "SendWakeupPacket: invalid interface index %u";
    v29 = v27;
    v30 = 8;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
    return;
  }
  v9 = ether_aton(a2);
  if (!v9)
  {
    v31 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = a2;
    v28 = "SendWakeupPacket: invalid ethernet address %s";
    v29 = v31;
    v30 = 12;
    goto LABEL_25;
  }
  v10 = v9;
  v11 = mdns_bpf_open(2, 0);
  if (v11 < 0)
  {
    v32 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v28 = "SendWakeupPacket: cannot find a bpf device";
    v29 = v32;
    v30 = 2;
    goto LABEL_25;
  }
  v12 = v11;
  memset(buf, 0, 32);
  __strlcpy_chk(buf, v46, 16, 16);
  if (ioctl(v12, 0x8020426CuLL, buf) < 0)
  {
    v33 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    v34 = __error();
    v35 = strerror(*v34);
    *(_DWORD *)v40 = 136315138;
    v41 = v35;
    v24 = "SendWakeupPacket: BIOCSETIF failed %s";
    v25 = v33;
LABEL_33:
    v26 = 12;
    goto LABEL_34;
  }
  for (i = 0; i != 6; ++i)
    *((_BYTE *)__buf + i) = v10->octet[i];
  v14 = 0;
  *(_QWORD *)((char *)__buf + 10) = -3187146752;
  *(_DWORD *)((char *)__buf + 6) = 0;
  v15 = (_DWORD *)&__buf[1] + 1;
  WORD1(__buf[1]) = -1;
  do
  {
    v16 = 0;
    v17 = v15;
    do
    {
      *((_BYTE *)v15 + v16) = v10->octet[v16];
      ++v16;
    }
    while (v16 != 6);
    v15 = (_DWORD *)((char *)v15 + 6);
    ++v14;
  }
  while (v14 != 16);
  *((_WORD *)v17 + 5) = 0;
  *v15 = 0;
  v18 = (char *)v17 - (char *)__buf + 12;
  v19 = write(v12, __buf, v18);
  v20 = log_handle;
  v21 = os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT);
  if (v19 < 0)
  {
    if (!v21)
      goto LABEL_35;
    v36 = __error();
    v37 = strerror(*v36);
    *(_DWORD *)v40 = 136315138;
    v41 = v37;
    v24 = "SendWakeupPacket: write failed %s";
    goto LABEL_32;
  }
  if (v21)
  {
    *(_DWORD *)v40 = 136315394;
    v41 = (void *)a2;
    v42 = 2080;
    v43 = a3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SendWakeupPacket: sent unicast eth_addr %s, ip_addr %s", v40, 0x16u);
  }
  WORD2(__buf[0]) = -1;
  LODWORD(__buf[0]) = -1;
  v22 = write(v12, __buf, v18);
  v20 = log_handle;
  v23 = os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT);
  if (v22 < 0)
  {
    if (!v23)
      goto LABEL_35;
    v38 = __error();
    v39 = strerror(*v38);
    *(_DWORD *)v40 = 136315138;
    v41 = v39;
    v24 = "SendWakeupPacket: write failed %s";
LABEL_32:
    v25 = v20;
    goto LABEL_33;
  }
  if (v23)
  {
    *(_DWORD *)v40 = 136315394;
    v41 = (void *)a2;
    v42 = 2080;
    v43 = a3;
    v24 = "SendWakeupPacket: sent broadcast eth_addr %s, ip_addr %s";
    v25 = v20;
    v26 = 22;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, v40, v26);
  }
LABEL_35:
  close(v12);
}

void SendKeepalive(uint16x4_t *a1, uint16x4_t *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  NSObject *v11;
  NSObject *v12;
  unsigned __int32 v13;
  int v14;
  char *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int v19;
  unsigned __int16 *v20;
  unsigned int v21;
  unint64_t v22;
  unsigned __int16 *v23;
  unint64_t v24;
  uint64_t v25;
  uint16x4_t *v26;
  uint32x4_t v27;
  uint32x4_t v28;
  unint64_t v29;
  unint64_t v30;
  unsigned int v31;
  int v32;
  int v33;
  NSObject *v34;
  int *v35;
  char *v36;
  const char *v37;
  int *v38;
  char *v39;
  socklen_t v40;
  ssize_t v41;
  uint64_t v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  uint64_t v46;
  int *v47;
  char *v48;
  unint64_t v49;
  unsigned __int16 *v50;
  __int32 v51;
  unsigned int i;
  unsigned int v53;
  unsigned int v54;
  uint64_t *v55;
  uint64_t *v59;
  uint64_t v60;
  msghdr v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  _OWORD v66[3];
  uint8_t v67[4];
  _BYTE v68[10];
  _BYTE v69[14];
  _BYTE v70[6];
  __int16 v71;
  unsigned int v72;
  __int16 v73;
  unsigned int v74;
  __int16 v75;
  unsigned int v76;
  char v77[16];
  char v78[30];
  char v79[16];
  char v80[30];
  char v81;
  __int128 v82;
  char v83[29];
  char v84;
  __int128 v85;
  _BYTE v86[29];
  _OWORD v87[2];
  uint8_t buf[64];
  __int128 v89;
  _OWORD v90[2];
  __int128 v91;
  __int16 v92;
  int v93;
  __int16 v94;
  int v95;
  __int16 v96;
  int v97;
  __int16 v98;
  int v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  __int16 v104;
  int v105;
  __int16 v106;
  int v107;
  __int16 v108;
  int v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;

  v11 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)&buf[4] = a1->u8[0];
    *(_DWORD *)&buf[10] = a1->u8[1];
    *(_DWORD *)&buf[16] = a1->u8[2];
    *(_DWORD *)&buf[22] = a1->u8[3];
    *(_DWORD *)&buf[28] = a1->u8[4];
    *(_DWORD *)&buf[34] = a1->u8[5];
    *(_DWORD *)&buf[40] = a1->u8[6];
    *(_DWORD *)&buf[46] = a1->u8[7];
    *(_DWORD *)&buf[52] = a1[1].u8[0];
    *(_DWORD *)&buf[58] = a1[1].u8[1];
    LODWORD(v89) = a1[1].u8[2];
    *(_DWORD *)((char *)&v89 + 6) = a1[1].u8[3];
    HIDWORD(v89) = a1[1].u8[4];
    *(_DWORD *)((char *)v90 + 2) = a1[1].u8[5];
    DWORD2(v90[0]) = a1[1].u8[6];
    *(_DWORD *)((char *)v90 + 14) = a1[1].u8[7];
    DWORD1(v90[1]) = a2->u8[0];
    *(_DWORD *)((char *)&v90[1] + 10) = a2->u8[1];
    LODWORD(v91) = a2->u8[2];
    *(_DWORD *)((char *)&v91 + 6) = a2->u8[3];
    HIDWORD(v91) = a2->u8[4];
    v93 = a2->u8[5];
    v95 = a2->u8[6];
    v97 = a2->u8[7];
    v99 = a2[1].u8[0];
    v101 = a2[1].u8[1];
    v103 = a2[1].u8[2];
    v105 = a2[1].u8[3];
    v107 = a2[1].u8[4];
    v109 = a2[1].u8[5];
    v111 = a2[1].u8[6];
    *(_WORD *)&buf[8] = 1024;
    *(_WORD *)&buf[14] = 1024;
    *(_WORD *)&buf[20] = 1024;
    *(_WORD *)&buf[26] = 1024;
    *(_WORD *)&buf[32] = 1024;
    *(_WORD *)&buf[38] = 1024;
    *(_WORD *)&buf[44] = 1024;
    *(_WORD *)&buf[50] = 1024;
    *(_WORD *)&buf[56] = 1024;
    *(_WORD *)&buf[62] = 1024;
    WORD2(v89) = 1024;
    WORD5(v89) = 1024;
    LOWORD(v90[0]) = 1024;
    WORD3(v90[0]) = 1024;
    WORD6(v90[0]) = 1024;
    WORD1(v90[1]) = 1024;
    WORD4(v90[1]) = 1024;
    HIWORD(v90[1]) = 1024;
    WORD2(v91) = 1024;
    WORD5(v91) = 1024;
    v92 = 1024;
    v94 = 1024;
    v96 = 1024;
    v98 = 1024;
    v100 = 1024;
    v102 = 1024;
    v104 = 1024;
    v106 = 1024;
    v108 = 1024;
    v110 = 1024;
    v112 = 1024;
    v113 = a2[1].u8[7];
    *(_DWORD *)buf = 67117056;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SendKeepalive:  %02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X :space: %02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X:%02X%02X", buf, 0xC2u);
    v11 = log_handle;
  }
  memset(v66, 0, 40);
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v62 = 0;
  v91 = 0u;
  v89 = 0u;
  memset(v90, 0, sizeof(v90));
  memset(buf, 0, sizeof(buf));
  memset(v87, 0, sizeof(v87));
  memset(&v61, 0, sizeof(v61));
  v59 = 0;
  v60 = 0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v67 = 67110144;
    *(_DWORD *)v68 = a3;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = a4;
    *(_WORD *)v69 = 1024;
    *(_DWORD *)&v69[2] = a5;
    *(_WORD *)&v69[6] = 1024;
    *(_DWORD *)&v69[8] = a6;
    *(_WORD *)&v69[12] = 1024;
    *(_DWORD *)v70 = a7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SendKeepalive invoked: lport is[%d] rport is[%d] seq is[%d] ack is[%d] win is[%d]", v67, 0x20u);
  }
  memset(v86, 0, sizeof(v86));
  v85 = 0u;
  memset(v83, 0, sizeof(v83));
  v82 = 0u;
  v84 = 0;
  v81 = 0;
  inet_ntop(30, a1, &v84, 0x2Eu);
  inet_ntop(30, a2, &v81, 0x2Eu);
  v12 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v67 = 136315394;
    *(_QWORD *)v68 = &v84;
    *(_WORD *)&v68[8] = 2080;
    *(_QWORD *)v69 = &v81;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SendKeepalive invoked: sadd6 is %s, dadd6 is %s", v67, 0x16u);
  }
  v13 = a1->u32[1];
  if (v13 || a1[1].i32[0] || a1[1].i32[1])
  {
    v14 = 0;
    v63 = 0;
    v64 = 0;
    v15 = (char *)&v63;
    v16 = 30;
    v17 = 20;
    v55 = &v63;
    v65 = 0;
  }
  else
  {
    v49 = 0;
    v50 = (unsigned __int16 *)v66;
    v15 = (char *)&v66[1] + 4;
    memset((char *)&v66[1] + 4, 0, 20);
    LOWORD(v66[0]) = 69;
    *(_QWORD *)((char *)v66 + 2) = 0x63F000026880028;
    WORD5(v66[0]) = 0;
    v51 = a2->i32[0];
    HIDWORD(v66[0]) = a1->i32[0];
    LODWORD(v66[1]) = v51;
    for (i = 22; i > 3; i -= 2)
    {
      v53 = *v50++;
      v49 += v53;
    }
    WORD5(v66[0]) = ~(WORD1(v49) + v49 + (((v49 >> 16) + (unsigned __int16)v49) >> 16));
    v55 = (uint64_t *)v66;
    v16 = 2;
    v14 = 1;
    v17 = 40;
  }
  v18 = 0;
  *(_WORD *)v15 = a3;
  *((_WORD *)v15 + 1) = a4;
  *((_DWORD *)v15 + 1) = a5;
  *((_DWORD *)v15 + 2) = a6;
  v15[12] = v15[12] & 0xF | 0x50;
  v15[13] = 16;
  *((_WORD *)v15 + 7) = a7;
  *((_DWORD *)v15 + 4) = 0;
  v19 = 22;
  v20 = (unsigned __int16 *)v15;
  do
  {
    v21 = *v20++;
    v18 += v21;
    v19 -= 2;
  }
  while (v19 > 3);
  v22 = (v18 >> 16) + (unsigned __int16)v18 + (((v18 >> 16) + (unsigned __int16)v18) >> 16);
  if (v16 == 30)
  {
    v27 = vmovl_u16(*a2);
    v28 = vmovl_u16(a1[1]);
    v23 = (unsigned __int16 *)&a2[1] + 1;
    v24 = vaddvq_s64(vaddq_s64((int64x2_t)vaddl_u32(*(uint32x2_t *)v28.i8, *(uint32x2_t *)v27.i8), (int64x2_t)vaddl_high_u32(v28, v27)))+ a1->u16[0]+ a1->u16[1]+ (unint64_t)a2[1].u16[0]+ v22+ HIWORD(v13)+ (unsigned __int16)v13;
    v26 = (uint16x4_t *)((char *)a2 + 12);
    v25 = 7;
  }
  else
  {
    v23 = (unsigned __int16 *)a1 + 1;
    v24 = v22 + a1->u16[0];
    v25 = 1;
    v26 = a2;
  }
  v29 = v24 + *v23 + (unint64_t)v26->u16[0] + a2->u16[v25];
  v54 = a6;
  v30 = v29 + 6656;
  v31 = a7;
  if (v29 >> 9 >= 0x73)
  {
    do
      v30 = (v30 >> 16) + (unsigned __int16)v30;
    while (v30 >> 16);
  }
  *((_WORD *)v15 + 8) = ~(_WORD)v30;
  v32 = socket(v16, 3, 6);
  if ((v32 & 0x80000000) == 0)
  {
    v33 = v32;
    if (v14)
    {
      v62 = 1;
      if (setsockopt(v32, 0, 2, &v62, 4u))
      {
        close(v33);
        v34 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
        {
          v35 = __error();
          v36 = strerror(*v35);
          *(_DWORD *)v67 = 136315138;
          *(_QWORD *)v68 = v36;
          v37 = "SendKeepalive: setsockopt %s";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v37, v67, 0xCu);
          return;
        }
        return;
      }
      *(_QWORD *)&buf[8] = 0;
      *(_WORD *)buf = 528;
      *(_DWORD *)&buf[4] = a1->i32[0];
      *(_WORD *)&buf[2] = a4;
      v61.msg_control = 0;
      v61.msg_controllen = 0;
      v40 = 16;
    }
    else
    {
      *(_WORD *)buf = 7708;
      *(_OWORD *)&buf[8] = *(_OWORD *)a2->i8;
      *(_WORD *)&buf[2] = a4;
      *(_DWORD *)&buf[24] = 0;
      *(_DWORD *)&buf[4] = 0;
      v61.msg_control = v87;
      v61.msg_controllen = 32;
      *(_QWORD *)&v87[0] = 0x2900000020;
      *(_OWORD *)((char *)v87 + 12) = *(_OWORD *)a1->i8;
      v40 = 28;
      DWORD2(v87[0]) = 46;
      HIDWORD(v87[1]) = 0;
    }
    v60 = v17;
    v61.msg_name = buf;
    v61.msg_namelen = v40;
    v59 = v55;
    v61.msg_iov = (iovec *)&v59;
    v61.msg_iovlen = 1;
    v61.msg_flags = 0;
    while (1)
    {
      v41 = sendmsg(v33, &v61, 0);
      if (v41 != -1)
        break;
      if (*__error() != 4)
        goto LABEL_36;
    }
    if ((v41 & 0x8000000000000000) == 0 && v41 == v17)
    {
      *(_OWORD *)v79 = 0u;
      memset(v80, 0, sizeof(v80));
      *(_OWORD *)v77 = 0u;
      memset(v78, 0, sizeof(v78));
      inet_ntop(v16, a1, v79, 0x2Eu);
      inet_ntop(v16, a2, v77, 0x2Eu);
      v42 = log_handle;
      if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      *(_DWORD *)v67 = 136316674;
      *(_QWORD *)v68 = v79;
      *(_WORD *)&v68[8] = 1024;
      *(_DWORD *)v69 = __rev16(a3);
      *(_WORD *)&v69[4] = 2080;
      *(_QWORD *)&v69[6] = v77;
      *(_WORD *)v70 = 1024;
      *(_DWORD *)&v70[2] = __rev16(a4);
      v71 = 1024;
      v72 = bswap32(a5);
      v73 = 1024;
      v74 = bswap32(v54);
      v75 = 1024;
      v76 = __rev16(v31);
      v43 = "SendKeepalive: Success Source %s:%d, Dest %s:%d, %u, %u, %u";
      v44 = v42;
      v45 = 52;
      goto LABEL_38;
    }
LABEL_36:
    v46 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    v47 = __error();
    v48 = strerror(*v47);
    *(_DWORD *)v67 = 136315138;
    *(_QWORD *)v68 = v48;
    v43 = "SendKeepalive: sendmsg failed %s";
    v44 = v46;
    v45 = 12;
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v43, v67, v45);
LABEL_39:
    close(v33);
    return;
  }
  v34 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
  {
    v38 = __error();
    v39 = strerror(*v38);
    *(_DWORD *)v67 = 136315138;
    *(_QWORD *)v68 = v39;
    v37 = "SendKeepalive: socket %s";
    goto LABEL_25;
  }
}

void update_idle_timer()
{
  NSObject *v0;
  __CFRunLoopTimer *v1;
  CFAbsoluteTime Current;
  uint8_t v3[16];

  v0 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "entry", v3, 2u);
  }
  v1 = (__CFRunLoopTimer *)gTimer;
  if (!gTimer)
    __assert_rtn("update_idle_timer", "helper-main.c", 129, "gTimer");
  Current = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerSetNextFireDate(v1, Current + (double)(unint64_t)actualidle);
}

int main(int argc, const char **argv, const char **envp)
{
  int v5;
  uint64_t v6;
  os_log_t v7;
  NSObject *v8;
  CFAbsoluteTime Current;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  xpc_connection_t mach_service;
  _xpc_connection_s *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  char *__endptr;
  uint8_t buf[4];
  char *v29;

  _set_user_dir_suffix("com.apple.mDNSResponderHelper", argv, envp);
  __endptr = 0;
  while (1)
  {
    do
      v5 = getopt(argc, (char *const *)argv, "dt:");
    while (v5 == 100);
    if (v5 != 116)
      break;
    v6 = strtol(optarg, &__endptr, 0);
    if (!*optarg || *__endptr || v6 < 0)
    {
      fprintf(__stderrp, "Invalid idle timeout: %s\n", optarg);
      goto LABEL_31;
    }
    maxidle = v6;
  }
  if (v5 != -1)
  {
    fwrite("Usage: mDNSResponderHelper [-d] [-t maxidle]\n", 0x2DuLL, 1uLL, __stderrp);
    goto LABEL_31;
  }
  v7 = os_log_create("com.apple.mDNSResponderHelper", "INFO");
  log_handle = (uint64_t)v7;
  if (v7)
  {
    v8 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could NOT create log handle in mDNSResponderHelper", buf, 2u);
    v8 = log_handle;
  }
  else
  {
    v8 = 0;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "mDNSResponderHelper Starting to run", buf, 2u);
  }
  if (maxidle)
    actualidle = maxidle;
  signal(15, (void (__cdecl *)(int))handle_sigterm);
  Current = CFAbsoluteTimeGetCurrent();
  gTimer = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, Current + (double)(unint64_t)actualidle, (double)(unint64_t)actualidle, 0, 0, (CFRunLoopTimerCallBack)diediedie, 0);
  v10 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "mDNSResponderHelper initialize_timer() started", buf, 2u);
  }
  v11 = pthread_create(&idletimer_thread, 0, (void *(__cdecl *)(void *))idletimer, 0);
  if (v11)
  {
    v18 = v11;
    v19 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v20 = strerror(v18);
    *(_DWORD *)buf = 136315138;
    v29 = v20;
    v15 = "Could not start idletimer thread: %s";
    v16 = v19;
    v17 = 12;
  }
  else
  {
    v12 = gRunLoop;
    v13 = 100000;
    do
    {
      if (!v12)
      {
        usleep(0x64u);
        v12 = gRunLoop;
      }
      --v13;
    }
    while (v13);
    if (v12)
    {
      mach_service = xpc_connection_create_mach_service("com.apple.mDNSResponder_Helper", 0, 1uLL);
      if (mach_service && (v22 = mach_service, xpc_get_type(mach_service) == (xpc_type_t)&_xpc_type_connection))
      {
        v23 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "init_helper_service: XPC Listener for mDNSResponderHelperService Listening", buf, 2u);
        }
        xpc_queue = (uint64_t)dispatch_queue_create("com.apple.mDNSHelper.service_queue", 0);
        xpc_connection_set_event_handler(v22, &__block_literal_global_23);
        xpc_connection_resume(v22);
      }
      else
      {
        v24 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "init_helper_service: Error Creating XPC Listener for mDNSResponderHelperService !!", buf, 2u);
        }
      }
      v25 = log_handle;
      if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "mDNSResponderHelper is now running", buf, 2u);
      }
      dispatch_main();
    }
    v14 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
LABEL_31:
      exit(1);
    *(_WORD *)buf = 0;
    v15 = "gRunLoop not set after waiting";
    v16 = v14;
    v17 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
  goto LABEL_31;
}

void handle_sigterm(int a1)
{
  if (a1 == 15)
    helper_exit();
  __assert_rtn("handle_sigterm", "helper-main.c", 66, "sig == SIGTERM");
}

void diediedie(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v4 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
  {
    v6 = 134218496;
    v7 = a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = actualidle;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "entry %p %p %lu", (uint8_t *)&v6, 0x20u);
  }
  if (gTimer == a1)
  {
    v5 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = actualidle;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "mDNSResponderHelper exiting after [%lu] seconds", (uint8_t *)&v6, 0xCu);
    }
    helper_exit();
  }
  __assert_rtn("diediedie", "helper-main.c", 103, "gTimer == timer");
}

void idletimer(uint64_t a1)
{
  NSObject *v2;
  __CFRunLoop *Main;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint8_t buf[16];

  v2 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = a1;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "entry context=%p", (uint8_t *)&v5, 0xCu);
  }
  Main = CFRunLoopGetMain();
  gRunLoop = (uint64_t)Main;
  v4 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "entry", buf, 2u);
    Main = (__CFRunLoop *)gRunLoop;
    if (gRunLoop)
    {
LABEL_5:
      if (gTimer)
      {
        CFRunLoopAddTimer(Main, (CFRunLoopTimerRef)gTimer, kCFRunLoopDefaultMode);
        while (1)
        {
          CFRunLoopRun();
          sleep(1u);
        }
      }
      __assert_rtn("unpause_idle_timer", "helper-main.c", 122, "gTimer");
    }
  }
  else if (Main)
  {
    goto LABEL_5;
  }
  __assert_rtn("unpause_idle_timer", "helper-main.c", 121, "gRunLoop");
}

void __init_helper_service_block_invoke(id a1, void *a2)
{
  xpc_type_t type;
  xpc_type_t v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  pid_t pid;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  void (*v17)(uint64_t, xpc_object_t);
  void *v18;
  void *v19;
  pid_t v20;
  uint8_t buf[4];
  pid_t v22;

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v10 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 134217984;
      *(_QWORD *)((char *)&v16 + 4) = a2;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "init_helper_service: new mDNSResponderHelper Client %p", (uint8_t *)&v16, 0xCu);
    }
    pid = xpc_connection_get_pid((xpc_connection_t)a2);
    v12 = (void *)xpc_connection_copy_entitlement_value(a2, "com.apple.mDNSResponder_Helper");
    if (v12)
    {
      v13 = v12;
      if (xpc_get_type(v12) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v13))
      {
        xpc_release(v13);
        xpc_retain(a2);
        xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)xpc_queue);
        *(_QWORD *)&v16 = _NSConcreteStackBlock;
        *((_QWORD *)&v16 + 1) = 0x40000000;
        v17 = __accept_client_block_invoke;
        v18 = &__block_descriptor_tmp_13;
        v19 = a2;
        v20 = pid;
        xpc_connection_set_event_handler((xpc_connection_t)a2, &v16);
        xpc_connection_resume((xpc_connection_t)a2);
        return;
      }
      xpc_release(v13);
    }
    else
    {
      v14 = log_handle;
      if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "client entitlement is NULL", buf, 2u);
      }
    }
    v15 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "entitlement check failed -> client is missing entitlement!", buf, 2u);
      v15 = log_handle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v22 = pid;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "accept_client: Helper Client PID[%d] is missing Entitlement. Cancelling connection", buf, 8u);
    }
    xpc_connection_cancel((xpc_connection_t)a2);
  }
  else
  {
    v4 = type;
    v5 = log_handle;
    v6 = os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT);
    if (v4 == (xpc_type_t)&_xpc_type_error)
    {
      if (!v6)
        return;
      LODWORD(v16) = 136315138;
      *(_QWORD *)((char *)&v16 + 4) = xpc_dictionary_get_string(a2, _xpc_error_key_description);
      v7 = "init_helper_service: XPCError: %s";
      v8 = v5;
      v9 = 12;
    }
    else
    {
      if (!v6)
        return;
      LOWORD(v16) = 0;
      v7 = "init_helper_service: Unknown EventMsg type";
      v8 = v5;
      v9 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, v9);
  }
}

void __accept_client_block_invoke(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *string;
  const char *v12;
  xpc_object_t v13;
  int v14;
  xpc_object_t reply;
  void *v16;
  xpc_object_t v17;
  int64_t v18;
  int v19;
  int v20;
  xpc_object_t v21;
  void *v22;
  int64_t v23;
  _xpc_connection_s *remote_connection;
  xpc_object_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  unsigned int uint64;
  const char *v33;
  const char *v34;
  int v35;
  NSObject *v36;
  int v37;
  int v38;
  unsigned __int8 *data;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  NSObject *v43;
  unsigned __int16 v44;
  unsigned __int16 v45;
  unsigned int v46;
  unsigned int v47;
  unsigned __int16 v48;
  uint16x4_t *v49;
  uint16x4_t *v50;
  uint16x4_t *v51;
  unsigned __int16 v52;
  unsigned __int16 v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  unsigned int v57;
  size_t v58;
  size_t length;
  int value;
  int value_4;
  _BYTE v62[24];
  _DWORD v63[3];

  type = xpc_get_type(object);
  v5 = log_handle;
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_DWORD *)(a1 + 40);
      value_4 = 134218240;
      *(_QWORD *)v62 = v6;
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "accept_client:conn:[%p] client[%d](mDNSResponder) teared down the connection (OR Crashed)", (uint8_t *)&value_4, 0x12u);
    }
    v8 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_DWORD *)(a1 + 40);
    value_4 = 134218240;
    *(_QWORD *)v62 = v9;
    *(_WORD *)&v62[8] = 1024;
    *(_DWORD *)&v62[10] = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "accept_client:conn:[%p] client[%d](mDNSResponder) requesting service", (uint8_t *)&value_4, 0x12u);
  }
  string = xpc_dictionary_get_string(object, "command");
  if (!string)
    goto LABEL_27;
  v12 = string;
  if (!strcmp(string, "bpf_open"))
  {
    reply = xpc_dictionary_create_reply(object);
    if (!reply)
      goto LABEL_27;
    v16 = reply;
    value_4 = 0;
    v17 = _mdns_xpc_dictionary_get_object(object, "open_flags", (const _xpc_type_s *)&_xpc_type_int64);
    if (v17 && (v18 = xpc_int64_get_value(v17), v18 == (int)v18))
    {
      v19 = mdns_bpf_open(v18 & 3, &value_4);
      if ((v19 & 0x80000000) == 0)
      {
        v20 = v19;
        xpc_dictionary_set_fd(v16, "bpf_fd", v19);
        close(v20);
      }
    }
    else
    {
      value_4 = -6711;
    }
    v23 = value_4;
    v22 = v16;
LABEL_24:
    xpc_dictionary_set_int64(v22, "error", v23);
    xpc_dictionary_send_reply(v16);
    v8 = v16;
LABEL_5:
    xpc_release(v8);
    return;
  }
  if (!strcmp(v12, "display_note"))
  {
    v21 = xpc_dictionary_create_reply(object);
    if (!v21)
      goto LABEL_27;
    v16 = v21;
    xpc_dictionary_get_string(object, "note_title");
    xpc_dictionary_get_string(object, "note_message");
    v22 = v16;
    v23 = 0;
    goto LABEL_24;
  }
  if (!strcmp(v12, "set_ipv4_forwarding"))
  {
    v13 = object;
    v14 = 0;
LABEL_26:
    if (_mhs_handle_set_ip_forwarding_request(v13, v14))
      return;
    goto LABEL_27;
  }
  if (!strcmp(v12, "set_ipv6_forwarding"))
  {
    v13 = object;
    v14 = 1;
    goto LABEL_26;
  }
LABEL_27:
  value = 0;
  remote_connection = xpc_dictionary_get_remote_connection(object);
  v25 = xpc_dictionary_create_reply(object);
  if (xpc_dictionary_get_uint64(object, "HelperMode"))
  {
    v26 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
    {
      LOWORD(value_4) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Getting mDNSResponder request mode", (uint8_t *)&value_4, 2u);
    }
    switch(xpc_dictionary_get_uint64(object, "HelperMode"))
    {
      case 2u:
        v27 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
        {
          LOWORD(value_4) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "mDNSResponderHelper does not notify users of name changes on this OS", (uint8_t *)&value_4, 2u);
        }
        goto LABEL_35;
      case 5u:
        v31 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
        {
          LOWORD(value_4) = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Calling new PowerSleepSystem()", (uint8_t *)&value_4, 2u);
        }
        value = PowerSleepSystem();
        break;
      case 6u:
        uint64 = xpc_dictionary_get_uint64(object, "interface_index");
        v33 = xpc_dictionary_get_string(object, "ethernet_address");
        v34 = xpc_dictionary_get_string(object, "ip_address");
        v35 = xpc_dictionary_get_uint64(object, "swp_iteration");
        v36 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
        {
          value_4 = 136315906;
          *(_QWORD *)v62 = v33;
          *(_WORD *)&v62[8] = 2080;
          *(_QWORD *)&v62[10] = v34;
          *(_WORD *)&v62[18] = 1024;
          *(_DWORD *)&v62[20] = uint64;
          LOWORD(v63[0]) = 1024;
          *(_DWORD *)((char *)v63 + 2) = v35;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Calling new SendWakeupPacket() ether_addr[%s] ip_addr[%s] if_id[%d] iteration[%d]", (uint8_t *)&value_4, 0x22u);
        }
        SendWakeupPacket(uint64, v33, (uint64_t)v34, v35);
        break;
      case 7u:
        v58 = 0;
        length = 0;
        v37 = xpc_dictionary_get_uint64(object, "slace_ifindex");
        v38 = xpc_dictionary_get_uint64(object, "slace_family");
        data = (unsigned __int8 *)xpc_dictionary_get_data(object, "slace_ip", &length);
        if (length != 16)
          goto LABEL_57;
        v40 = data;
        v41 = (unsigned __int8 *)xpc_dictionary_get_data(object, "slace_eth", &v58);
        if (v58 != 6)
          goto LABEL_57;
        v42 = v41;
        v43 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
        {
          value_4 = 67109376;
          *(_DWORD *)v62 = v37;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = v38;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Calling new SetLocalAddressCacheEntry() if_index[%d] family[%d] ", (uint8_t *)&value_4, 0xEu);
        }
        SetLocalAddressCacheEntry(v37, v38, v40, v42, &value);
        break;
      case 8u:
        v58 = 0;
        length = 0;
        v44 = xpc_dictionary_get_uint64(object, "send_keepalive_lport");
        v45 = xpc_dictionary_get_uint64(object, "send_keepalive_rport");
        v46 = xpc_dictionary_get_uint64(object, "send_keepalive_seq");
        v47 = xpc_dictionary_get_uint64(object, "send_keepalive_ack");
        v48 = xpc_dictionary_get_uint64(object, "send_keepalive_win");
        v49 = (uint16x4_t *)xpc_dictionary_get_data(object, "send_keepalive_sadd", &length);
        v50 = (uint16x4_t *)xpc_dictionary_get_data(object, "send_keepalive_dadd", &v58);
        if (length != 16 || v58 != 16)
        {
LABEL_57:
          v29 = -20;
          goto LABEL_36;
        }
        v51 = v50;
        v57 = v46;
        v52 = v45;
        v53 = v44;
        v54 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
        {
          value_4 = 67110144;
          *(_DWORD *)v62 = v53;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = v52;
          *(_WORD *)&v62[10] = 1024;
          *(_DWORD *)&v62[12] = v57;
          *(_WORD *)&v62[16] = 1024;
          *(_DWORD *)&v62[18] = v47;
          *(_WORD *)&v62[22] = 1024;
          v63[0] = v48;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "helper-main: handle_request: send_keepalive: lport is[%d] rport is[%d] seq is[%d] ack is[%d] win is[%d]", (uint8_t *)&value_4, 0x20u);
        }
        SendKeepalive(v49, v51, v53, v52, v57, v47, v48);
        break;
      case 0xAu:
        v55 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
        {
          LOWORD(value_4) = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Calling new KeyChainGetSecrets()", (uint8_t *)&value_4, 2u);
        }
        value = 5;
        if (v25)
        {
          xpc_dictionary_set_uint64(v25, "keychain_num_secrets", 0);
          xpc_dictionary_set_data(v25, "keychain_secrets", 0, 0);
        }
        v56 = log_handle;
        if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_INFO))
        {
          value_4 = 67109632;
          *(_DWORD *)v62 = 0;
          *(_WORD *)&v62[4] = 2048;
          *(_QWORD *)&v62[6] = 0;
          *(_WORD *)&v62[14] = 1024;
          *(_DWORD *)&v62[16] = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "helper-main: handle_request: keychain_getsecrets: num_secrets is %u, secrets is %lu, secrets_Cnt is %u", (uint8_t *)&value_4, 0x18u);
        }
        break;
      default:
        goto LABEL_33;
    }
  }
  else
  {
LABEL_33:
    v28 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(value_4) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "handle_request: Unrecognized mode!", (uint8_t *)&value_4, 2u);
    }
LABEL_35:
    v29 = -4;
LABEL_36:
    value = v29;
  }
  if (v25)
  {
    xpc_dictionary_set_uint64(v25, "HelperReplyStatusToClient", 0);
    xpc_dictionary_set_int64(v25, "HelperErrorCodefromCall", value);
    xpc_connection_send_message(remote_connection, v25);
    v8 = v25;
    goto LABEL_5;
  }
  v30 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(value_4) = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "handle_requests: Response Dictionary could not be created!", (uint8_t *)&value_4, 2u);
  }
}

BOOL _mhs_handle_set_ip_forwarding_request(void *a1, int a2)
{
  xpc_object_t reply;
  xpc_object_t object;
  _BOOL4 v6;
  const char *v7;
  int64_t v8;
  _BOOL4 v10;

  reply = xpc_dictionary_create_reply(a1);
  if (reply)
  {
    object = _mdns_xpc_dictionary_get_object(a1, "enable", (const _xpc_type_s *)&_xpc_type_BOOL);
    if (object)
    {
      v6 = object == &_xpc_BOOL_true;
      if (a2)
        v7 = "net.inet6.ip6.forwarding";
      else
        v7 = "net.inet.ip.forwarding";
      v10 = v6;
      if (sysctlbyname(v7, 0, 0, &v10, 4uLL))
      {
        if (*__error())
          v8 = *__error();
        else
          v8 = -6700;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = -6711;
    }
    xpc_dictionary_set_int64(reply, "error", v8);
    xpc_dictionary_send_reply(reply);
    xpc_release(reply);
  }
  return reply != 0;
}

xpc_object_t _mdns_xpc_dictionary_get_object(void *a1, const char *a2, const _xpc_type_s *a3)
{
  xpc_object_t value;
  xpc_object_t v5;

  value = xpc_dictionary_get_value(a1, a2);
  v5 = value;
  if (value && xpc_get_type(value) != a3)
    return 0;
  return v5;
}
