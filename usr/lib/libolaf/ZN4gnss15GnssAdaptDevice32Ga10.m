@implementation ZN4gnss15GnssAdaptDevice32Ga10

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke()
{
  return gnss::GnssAdaptDevice::Ga10_01SendMeasurementsReport();
}

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  __int128 v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned __int16 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  _QWORD block[4];
  _BYTE v14[24];
  _BYTE *v15;
  _BYTE v16[312];
  char __str[1040];
  _BYTE v18[24];
  _BYTE *v19;
  _QWORD v20[3];
  _QWORD *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v20, v1 + 760);
  v19 = 0;
  v2 = v21;
  if (v21)
  {
    *(_QWORD *)&__str[16] = -1;
    *(_WORD *)&__str[24] = 0;
    __str[26] = -1;
    *(_QWORD *)&__str[28] = -1;
    *(_QWORD *)&__str[35] = -1;
    *(_QWORD *)&__str[44] = 0xFFFFFFFF00000004;
    *(_WORD *)&__str[52] = -1;
    __str[54] = -1;
    *(_DWORD *)&__str[56] = -1;
    *(_WORD *)&__str[60] = 0;
    *(_QWORD *)&__str[64] = 0x7FFFFFFF000000FFLL;
    *(_DWORD *)&__str[72] = 0x7FFFFFFF;
    __str[76] = -1;
    *(_OWORD *)&__str[80] = xmmword_21E832950;
    *(_QWORD *)&__str[96] = 0xFFFFFFFF7FFFFFFFLL;
    *(_DWORD *)&__str[103] = -1;
    *(_QWORD *)&__str[108] = 0x8000000080000000;
    *(_WORD *)&__str[120] = -1;
    *(_DWORD *)&__str[116] = -1;
    *(_QWORD *)&v3 = 0x8000000080000000;
    *((_QWORD *)&v3 + 1) = 0x8000000080000000;
    *(_OWORD *)&__str[124] = v3;
    *(_WORD *)&__str[140] = -1;
    __str[144] = -1;
    memset_pattern16(&__str[148], &unk_21E832980, 0x78uLL);
    __str[268] = -1;
    *(_DWORD *)&__str[272] = 255;
    *(_QWORD *)&__str[292] = -1;
    *(_QWORD *)&__str[276] = -1;
    *(_QWORD *)&__str[283] = -1;
    *(_DWORD *)&__str[300] = 0;
    *(_QWORD *)&__str[304] = 0;
    *(_QWORD *)__str = 4294967294;
    *(_QWORD *)&__str[8] = 0xFFFFFFFF00000000;
    v4 = *(NSObject **)(v1 + 296);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    v5 = v14;
    block[2] = ___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_3;
    block[3] = &__block_descriptor_tmp_168;
    if (v2 == v20)
    {
      v15 = v14;
      (*(void (**)(_QWORD *, _BYTE *))(v20[0] + 24))(v20, v14);
    }
    else
    {
      v15 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v2 + 16))(v2);
    }
    memcpy(v16, __str, sizeof(v16));
    dispatch_async(v4, block);
    if (v15 == v14)
    {
      v8 = 4;
    }
    else
    {
      if (!v15)
        goto LABEL_12;
      v8 = 5;
      v5 = v15;
    }
    (*(void (**)(_QWORD *))(*v5 + 8 * v8))(v5);
  }
  else if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v6 = mach_continuous_time();
    v7 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx PosRep\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 69, "Ga10_00HandleGnsCpStatusResponse_block_invoke_2", 258);
    LbsOsaTrace_WriteLog(0x18u, __str, v7, 0, 1);
  }
LABEL_12:
  v9 = v19;
  if (v19 == v18)
  {
    v10 = 4;
    v9 = v18;
  }
  else
  {
    if (!v19)
      goto LABEL_17;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_17:
  result = v21;
  if (v21 == v20)
  {
    v12 = 4;
    result = v20;
  }
  else
  {
    if (!v21)
      return result;
    v12 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v12))();
}

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_170(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  _QWORD *result;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  _QWORD block[4];
  _BYTE v15[24];
  _BYTE *v16;
  _BYTE v17[1896];
  _QWORD __src[237];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 64))
  {
    v1 = *(_QWORD *)(a1 + 32);
    LODWORD(__src[0]) = 0;
    BYTE4(__src[0]) = 0;
    __src[1] = -1;
    LODWORD(__src[2]) = -1;
    WORD2(__src[2]) = 0;
    *(_DWORD *)((char *)&__src[2] + 6) = -1;
    BYTE2(__src[3]) = -1;
    *(_QWORD *)((char *)&__src[3] + 3) = 0;
    *(_QWORD *)((char *)&__src[4] + 1) = 0;
    BYTE1(__src[5]) = -1;
    *(_QWORD *)((char *)&__src[5] + 2) = 0;
    v2 = &__src[13];
    __src[6] = 0;
    v3 = 112;
    LOBYTE(__src[7]) = -1;
    v4 = 262;
    BYTE4(__src[7]) = 0;
    do
    {
      *(_DWORD *)v2 = 5;
      *((_WORD *)v2 + 2) = 0;
      v5 = v3;
      *((_BYTE *)v2 + 6) = -1;
      do
      {
        v6 = (char *)__src + v5;
        *v6 = -1;
        *((_DWORD *)v6 + 1) = -1;
        v5 += 8;
      }
      while (v6 + 8 != (char *)(v2 + 16));
      *((_DWORD *)v2 + 32) = -1;
      *((_WORD *)v2 + 66) = -1;
      *(_DWORD *)((char *)v2 + 134) = -256;
      *(uint64_t *)((char *)v2 + 138) = 0;
      v2[18] = 0;
      *((_DWORD *)v2 + 38) = -1;
      v7 = v4;
      *((_BYTE *)v2 + 156) = -1;
      do
      {
        v8 = (char *)__src + v7;
        *v8 = -1;
        *((_WORD *)v8 + 1) = -1;
        v7 += 4;
      }
      while (v8 + 4 != (char *)v2 + 218);
      *(_DWORD *)((char *)v2 + 218) = -1;
      v2 += 28;
      v3 += 224;
      v4 += 224;
    }
    while (v2 != &v19);
    __src[1] = 0xFFFFFFFF00000000;
    LODWORD(__src[0]) = -2;
    v9 = *(NSObject **)(v1 + 296);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_2_172;
    block[3] = &__block_descriptor_tmp_173;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v15, a1 + 40);
    memcpy(v17, __src, sizeof(v17));
    dispatch_async(v9, block);
    result = v16;
    if (v16 == v15)
    {
      v11 = 4;
      result = v15;
    }
    else
    {
      if (!v16)
        return result;
      v11 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v11))();
  }
  else
  {
    result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0);
    if ((_DWORD)result)
    {
      bzero(__src, 0x410uLL);
      v12 = mach_continuous_time();
      v13 = snprintf((char *)__src, 0x40FuLL, "%10u %s%c %s: #%04hx AidRep\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 69, "Ga10_00HandleGnsCpStatusResponse_block_invoke", 258);
      return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, (char *)__src, v13, 0, 1);
    }
  }
  return result;
}

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_177()
{
  return gnss::GnssAdaptDevice::Ga10_01SendMeasurementsReport();
}

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_2_179(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 v4;
  int *v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  uint64_t v16;
  unsigned __int16 v17;
  int *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  unsigned __int16 v24;
  int v25;
  uint64_t v26;
  unsigned __int16 v27;
  int v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t v31;
  unsigned __int16 v32;
  uint64_t v33;
  unsigned __int16 v34;
  int v35;
  uint64_t v36;
  unsigned __int16 v37;
  int v38;
  int v39;
  uint64_t v40;
  unsigned __int16 v41;
  uint64_t v42;
  unsigned __int16 v43;
  uint64_t v44;
  unsigned __int16 v45;
  int v46;
  int v47;
  uint64_t v48;
  unsigned __int16 v49;
  uint64_t v50;
  unsigned __int16 v51;
  int v52;
  int v53;
  uint64_t v54;
  unsigned __int16 v55;
  uint64_t v56;
  unsigned __int16 v57;
  int v58;
  int v59;
  uint64_t v60;
  unsigned __int16 v61;
  uint64_t v62;
  unsigned __int16 v63;
  int v64;
  int v65;
  __int16 v66;
  uint64_t v67;
  unsigned __int16 v68;
  uint64_t v69;
  unsigned __int16 v70;
  int v71;
  int v72;
  __int16 v73;
  uint64_t v74;
  unsigned __int16 v75;
  uint64_t v76;
  unsigned __int16 v77;
  uint64_t v78;
  unsigned __int16 v79;
  uint64_t v80;
  unsigned __int16 v81;
  uint64_t v82;
  unsigned __int16 v83;
  uint64_t v84;
  unsigned __int16 v85;
  uint64_t v86;
  unsigned __int16 v87;
  uint64_t v88;
  unsigned __int16 v89;
  uint64_t v90;
  unsigned __int16 v91;
  uint64_t v92;
  unsigned __int16 v93;
  uint64_t v94;
  unsigned __int16 v95;
  uint64_t v96;
  unsigned __int16 v97;
  char v98;
  uint64_t v99;
  unsigned __int16 v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  _BOOL4 v107;
  int *v108;
  uint64_t v109;
  int v110;
  double v111;
  uint64_t v112;
  unsigned __int16 v113;
  uint64_t v114;
  unsigned __int16 v115;
  uint64_t v116;
  unsigned __int16 v117;
  NSObject *v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  int v135;
  int v136;
  int v137;
  uint64_t v138;
  unsigned __int16 v139;
  uint64_t v140;
  _QWORD *result;
  uint64_t v142;
  int *v143;
  uint64_t v144;
  int v145;
  _QWORD block[4];
  _BYTE v147[24];
  _BYTE *v148;
  _BYTE v149[312];
  _BYTE __src[312];
  _QWORD v151[3];
  _QWORD *v152;
  char __str[1040];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v3 = mach_continuous_time();
    v4 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "Ga10_02SendPositionReport");
    LbsOsaTrace_WriteLog(0x18u, __str, v4, 5, 1);
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v151, v2 + 760);
  if (!v152)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v14 = mach_continuous_time();
      v15 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx PosRep\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 69, "Ga10_02SendPositionReport", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v15, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v16 = mach_continuous_time();
      v17 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "Ga10_02SendPositionReport");
      LbsOsaTrace_WriteLog(0x18u, __str, v17, 5, 1);
    }
    goto LABEL_188;
  }
  v5 = (int *)(a1 + 40);
  *(_QWORD *)__src = 0;
  *(_QWORD *)&__src[16] = -1;
  *(_WORD *)&__src[24] = 0;
  __src[26] = -1;
  *(_QWORD *)&__src[28] = -1;
  *(_QWORD *)&__src[35] = -1;
  *(_QWORD *)&__src[44] = 0xFFFFFFFF00000004;
  *(_WORD *)&__src[52] = -1;
  __src[54] = -1;
  v6 = -1;
  *(_DWORD *)&__src[56] = -1;
  *(_WORD *)&__src[60] = 0;
  *(_QWORD *)&__src[64] = 0x7FFFFFFF000000FFLL;
  *(_DWORD *)&__src[72] = 0x7FFFFFFF;
  __src[76] = -1;
  *(_OWORD *)&__src[80] = xmmword_21E832950;
  *(_QWORD *)&__src[96] = 0xFFFFFFFF7FFFFFFFLL;
  *(_DWORD *)&__src[103] = -1;
  *(_QWORD *)&__src[108] = 0x8000000080000000;
  *(_DWORD *)&__src[116] = -1;
  *(_WORD *)&__src[120] = -1;
  *(_QWORD *)&v7 = 0x8000000080000000;
  *((_QWORD *)&v7 + 1) = 0x8000000080000000;
  *(_OWORD *)&__src[124] = v7;
  *(_WORD *)&__src[140] = -1;
  __src[144] = -1;
  memset_pattern16(&__src[148], &unk_21E832980, 0x78uLL);
  __src[268] = -1;
  *(_DWORD *)&__src[272] = 255;
  *(_QWORD *)&__src[292] = -1;
  *(_QWORD *)&__src[276] = -1;
  *(_QWORD *)&__src[283] = -1;
  *(_DWORD *)&__src[300] = 0;
  *(_QWORD *)&__src[304] = 0;
  *(_QWORD *)&__src[8] = 0xFFFFFFFF00000000;
  v8 = *(_QWORD *)(v2 + 128);
  v9 = *(_QWORD *)(v2 + 136) - v8;
  if (v9)
  {
    v10 = *v5;
    v11 = v9 / 196;
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    if (*(_DWORD *)(v8 + 52) == v10)
    {
      v13 = 0;
LABEL_10:
      if (v13 < v11)
      {
        v6 = *(_DWORD *)(v8 + 196 * v13 + 44);
        goto LABEL_21;
      }
    }
    else
    {
      v13 = 0;
      v18 = (int *)(v8 + 248);
      v19 = v12 - 1;
      while (v19 != v13)
      {
        v20 = *v18;
        v18 += 49;
        ++v13;
        if (v20 == v10)
        {
          if (v13 < v11)
            goto LABEL_10;
          break;
        }
      }
    }
    v6 = -1;
  }
LABEL_21:
  *(_DWORD *)&__src[12] = v6;
  if (*(_DWORD *)(a1 + 60) == 1)
    gnss::GnssAdaptDevice::Ga10_17InvokePVTMCbForE911(v2, (int *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 44))
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v29 = mach_continuous_time();
      v30 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 68, "Ga10_02SendPositionReport");
      LbsOsaTrace_WriteLog(0x18u, __str, v30, 5, 1);
    }
    goto LABEL_188;
  }
  *(_BYTE *)(v2 + 1024) = 0;
  *(_DWORD *)&__src[16] = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(a1 + 60) == 1)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v21 = mach_continuous_time();
      v22 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Pos Avlbl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 73, "Ga10_02SendPositionReport");
      LbsOsaTrace_WriteLog(0x18u, __str, v22, 4, 1);
    }
    *(_DWORD *)&__src[20] = *(_DWORD *)(a1 + 124);
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v23 = mach_continuous_time();
      v24 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: GPS ToW,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 73, "Ga10_02SendPositionReport", *(_DWORD *)&__src[20]);
      LbsOsaTrace_WriteLog(0x18u, __str, v24, 4, 1);
    }
    if (*(unsigned __int8 *)(a1 + 128) != 255)
      __src[26] = *(_BYTE *)(a1 + 128);
    if (*(_DWORD *)&__src[12] == 2 && *(_DWORD *)(a1 + 144) == 1)
    {
      v25 = *(_DWORD *)(a1 + 132);
      *(_DWORD *)&__src[32] = 1;
      *(_DWORD *)&__src[36] = v25;
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v26 = mach_continuous_time();
        v27 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: GPS ToD,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "ADP", 73, "Ga10_02SendPositionReport", *(_DWORD *)&__src[36]);
        LbsOsaTrace_WriteLog(0x18u, __str, v27, 4, 1);
      }
      if (*(unsigned __int16 *)(a1 + 136) != 0xFFFF)
        *(_WORD *)&__src[40] = *(_WORD *)(a1 + 136);
      if (*(unsigned __int8 *)(a1 + 138) != 255)
        __src[42] = *(_BYTE *)(a1 + 138);
    }
    v28 = *(_DWORD *)(a1 + 64);
    if (v28 == 2)
    {
      *(_DWORD *)&__src[28] = 1;
    }
    else if (v28 == 1)
    {
      *(_DWORD *)&__src[28] = 0;
    }
    else
    {
      *(_DWORD *)&__src[28] = -1;
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v33 = mach_continuous_time();
        v34 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Fix Type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "ADP", 87, "Ga10_02SendPositionReport", 515, *(_DWORD *)(a1 + 64));
        LbsOsaTrace_WriteLog(0x18u, __str, v34, 2, 1);
      }
    }
    v35 = *(_DWORD *)(a1 + 68);
    switch(v35)
    {
      case 0:
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v36 = mach_continuous_time();
          v37 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType Not avlbl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v37, 4, 1);
        }
        break;
      case 1:
        v47 = *(_DWORD *)(a1 + 72);
        v46 = *(_DWORD *)(a1 + 76);
        *(_DWORD *)&__src[64] = 0;
        *(_DWORD *)&__src[124] = v46;
        if (v47 == 2)
          *(_DWORD *)&__src[124] = v46 | 0x800000;
        *(_DWORD *)&__src[128] = *(_DWORD *)(a1 + 80);
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v48 = mach_continuous_time();
          v49 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType Ellipsoid Pt\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v48), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v49, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v50 = mach_continuous_time();
          v51 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Lat,%d,Long,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v50), "ADP", 68, "Ga10_02SendPositionReport", *(_DWORD *)&__src[124], *(_DWORD *)&__src[128]);
          LbsOsaTrace_WriteLog(0x18u, __str, v51, 5, 1);
        }
        break;
      case 2:
        v53 = *(_DWORD *)(a1 + 72);
        v52 = *(_DWORD *)(a1 + 76);
        *(_DWORD *)&__src[64] = 1;
        *(_DWORD *)&__src[68] = v52;
        if (v53 == 2)
          *(_DWORD *)&__src[68] = v52 | 0x800000;
        *(_DWORD *)&__src[72] = *(_DWORD *)(a1 + 80);
        __src[76] = *(_BYTE *)(a1 + 86);
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v54 = mach_continuous_time();
          v55 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType Ellipsoid Pt Uncert Circle\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v54), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v55, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v56 = mach_continuous_time();
          v57 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Lat,%d,Long,%d,UncRad,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v56), "ADP", 68, "Ga10_02SendPositionReport", *(_DWORD *)&__src[68], *(_DWORD *)&__src[72], __src[76]);
          LbsOsaTrace_WriteLog(0x18u, __str, v57, 5, 1);
        }
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_61;
      case 4:
        v59 = *(_DWORD *)(a1 + 72);
        v58 = *(_DWORD *)(a1 + 76);
        *(_DWORD *)&__src[64] = 3;
        *(_DWORD *)&__src[80] = v58;
        if (v59 == 2)
          *(_DWORD *)&__src[80] = v58 | 0x800000;
        *(_DWORD *)&__src[84] = *(_DWORD *)(a1 + 80);
        *(_WORD *)&__src[88] = *(_WORD *)(a1 + 86);
        __src[90] = *(unsigned __int8 *)(a1 + 88) >> (*(_DWORD *)&__src[12] == 1);
        __src[91] = *(_BYTE *)(a1 + 97);
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v60 = mach_continuous_time();
          v61 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType Ellipsoid Pt Unc Elipse\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v60), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v61, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v62 = mach_continuous_time();
          v63 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Lat,%d,Long,%d,SemiMajAxis,%u,SemiMinAxis,%u,OrientAngle,%u,Conf,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v62), "ADP", 68, "Ga10_02SendPositionReport", *(_DWORD *)&__src[80], *(_DWORD *)&__src[84], __src[88], __src[89], __src[90], __src[91]);
          LbsOsaTrace_WriteLog(0x18u, __str, v63, 5, 1);
        }
        break;
      case 8:
        v65 = *(_DWORD *)(a1 + 72);
        v64 = *(_DWORD *)(a1 + 76);
        *(_DWORD *)&__src[64] = 8;
        *(_DWORD *)&__src[132] = v64;
        if (v65 == 2)
          *(_DWORD *)&__src[132] = v64 | 0x800000;
        *(_DWORD *)&__src[136] = *(_DWORD *)(a1 + 80);
        v66 = *(_WORD *)(a1 + 84);
        *(_WORD *)&__src[140] = v66;
        if (*(_DWORD *)(a1 + 92) == 2)
          *(_WORD *)&__src[140] = v66 | 0x8000;
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v67 = mach_continuous_time();
          v68 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType Ellipsoid Pt Alt\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v67), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v68, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v69 = mach_continuous_time();
          v70 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Lat,%d,Long,%d,Alt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v69), "ADP", 68, "Ga10_02SendPositionReport", *(_DWORD *)&__src[132], *(_DWORD *)&__src[136], *(unsigned __int16 *)&__src[140]);
          LbsOsaTrace_WriteLog(0x18u, __str, v70, 5, 1);
        }
        break;
      default:
        if (v35 == 16)
        {
          v72 = *(_DWORD *)(a1 + 72);
          v71 = *(_DWORD *)(a1 + 76);
          *(_DWORD *)&__src[64] = 9;
          *(_DWORD *)&__src[92] = v71;
          if (v72 == 2)
            *(_DWORD *)&__src[92] = v71 | 0x800000;
          *(_DWORD *)&__src[96] = *(_DWORD *)(a1 + 80);
          *(_WORD *)&__src[102] = *(_WORD *)(a1 + 86);
          __src[104] = *(unsigned __int8 *)(a1 + 88) >> (*(_DWORD *)&__src[12] == 1);
          __src[106] = *(_BYTE *)(a1 + 97);
          v73 = *(_WORD *)(a1 + 84);
          *(_WORD *)&__src[100] = v73;
          if (*(_DWORD *)(a1 + 92) == 2)
            *(_WORD *)&__src[100] = v73 | 0x8000;
          __src[105] = *(_BYTE *)(a1 + 96);
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v74 = mach_continuous_time();
            v75 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType Ellipsoid pt Alt & Unc Eclipse\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v74), "ADP", 73, "Ga10_02SendPositionReport");
            LbsOsaTrace_WriteLog(0x18u, __str, v75, 4, 1);
          }
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
          {
            bzero(__str, 0x410uLL);
            v76 = mach_continuous_time();
            v77 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Lat,%d,Long,%d,SemiMajAxis,%u,SemiMinAxis,%u,OrientAngle,%u,Conf,%u,Alt,%u,UncAlt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v76), "ADP", 68, "Ga10_02SendPositionReport", *(_DWORD *)&__src[92], *(_DWORD *)&__src[96], __src[102], __src[103], __src[104], __src[106], *(unsigned __int16 *)&__src[100], __src[105]);
            LbsOsaTrace_WriteLog(0x18u, __str, v77, 5, 1);
          }
        }
        else if (v35 == 32)
        {
          v39 = *(_DWORD *)(a1 + 72);
          v38 = *(_DWORD *)(a1 + 76);
          *(_DWORD *)&__src[64] = 10;
          *(_DWORD *)&__src[108] = v38;
          if (v39 == 2)
            *(_DWORD *)&__src[108] = v38 | 0x800000;
          *(_DWORD *)&__src[112] = *(_DWORD *)(a1 + 80);
          *(_WORD *)&__src[116] = *(_DWORD *)(a1 + 100);
          __src[120] = *(_BYTE *)(a1 + 98);
          __src[119] = *(_BYTE *)(a1 + 99);
          __src[118] = *(_BYTE *)(a1 + 86);
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v40 = mach_continuous_time();
            v41 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType Ellipsoid Arc\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v40), "ADP", 73, "Ga10_02SendPositionReport");
            LbsOsaTrace_WriteLog(0x18u, __str, v41, 4, 1);
          }
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
          {
            bzero(__str, 0x410uLL);
            v42 = mach_continuous_time();
            v43 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Lat,%d,Long,%d,InnerRad,%u,IncludedAngle,%u,offsetAngle,%u,UncRad,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "ADP", 68, "Ga10_02SendPositionReport", *(_DWORD *)&__src[108], *(_DWORD *)&__src[112], *(unsigned __int16 *)&__src[116], __src[120], __src[119], __src[118]);
            LbsOsaTrace_WriteLog(0x18u, __str, v43, 5, 1);
          }
        }
        else
        {
LABEL_61:
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v44 = mach_continuous_time();
            v45 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Shape type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v44), "ADP", 69, "Ga10_02SendPositionReport", 515, *(_DWORD *)(a1 + 68));
            LbsOsaTrace_WriteLog(0x18u, __str, v45, 0, 1);
          }
        }
        break;
    }
    switch(*(_DWORD *)(a1 + 108))
    {
      case 0:
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v78 = mach_continuous_time();
          v79 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: VelInfo not avlbl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v78), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v79, 4, 1);
        }
        break;
      case 1:
        *(_DWORD *)&__src[276] = *(_DWORD *)(a1 + 112);
        *(_DWORD *)&__src[272] = 0;
        *(_DWORD *)&__src[4] |= 4u;
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v80 = mach_continuous_time();
          v81 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Vel Estimate is Hor\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v80), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v81, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v82 = mach_continuous_time();
          v83 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Bearing,%u,HSpeed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v82), "ADP", 68, "Ga10_02SendPositionReport", *(unsigned __int16 *)&__src[276], *(unsigned __int16 *)&__src[278]);
          LbsOsaTrace_WriteLog(0x18u, __str, v83, 5, 1);
        }
        break;
      case 2:
        *(_DWORD *)&__src[272] = 1;
        *(_DWORD *)&__src[280] = *(_DWORD *)(a1 + 112);
        if (*(unsigned __int16 *)(a1 + 118) <= 0xFFu)
          __src[284] = *(_WORD *)(a1 + 118);
        if (*(unsigned __int8 *)(a1 + 116) != 255)
          __src[285] = *(_BYTE *)(a1 + 116);
        *(_DWORD *)&__src[4] |= 4u;
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v84 = mach_continuous_time();
          v85 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Vel Estimate is Hor with Ver\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v84), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v85, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v86 = mach_continuous_time();
          v87 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Bearing,%u,HSpeed,%u,VSpeed,%u,VSpeedDir,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v86), "ADP", 68, "Ga10_02SendPositionReport", *(unsigned __int16 *)&__src[280], *(unsigned __int16 *)&__src[282], __src[284], __src[285]);
          LbsOsaTrace_WriteLog(0x18u, __str, v87, 5, 1);
        }
        break;
      case 4:
        *(_DWORD *)&__src[272] = 2;
        *(_DWORD *)&__src[286] = *(_DWORD *)(a1 + 112);
        if (*(unsigned __int16 *)(a1 + 120) <= 0xFFu)
          __src[290] = *(_WORD *)(a1 + 120);
        *(_DWORD *)&__src[4] |= 4u;
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v90 = mach_continuous_time();
          v91 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Vel Estimate is Hor with Unc\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v90), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v91, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v92 = mach_continuous_time();
          v93 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Bearing,%u,HSpeed,%u,UncSpeed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v92), "ADP", 68, "Ga10_02SendPositionReport", *(unsigned __int16 *)&__src[286], *(unsigned __int16 *)&__src[288], __src[290]);
          LbsOsaTrace_WriteLog(0x18u, __str, v93, 5, 1);
        }
        break;
      case 8:
        *(_DWORD *)&__src[272] = 3;
        *(_DWORD *)&__src[292] = *(_DWORD *)(a1 + 112);
        if (*(unsigned __int16 *)(a1 + 118) <= 0xFFu)
          __src[296] = *(_WORD *)(a1 + 118);
        if (*(unsigned __int8 *)(a1 + 116) != 255)
          __src[297] = *(_BYTE *)(a1 + 116);
        if (*(unsigned __int16 *)(a1 + 120) <= 0xFFu)
          __src[298] = *(_WORD *)(a1 + 120);
        if (*(unsigned __int16 *)(a1 + 122) <= 0xFFu)
          __src[299] = *(_WORD *)(a1 + 122);
        *(_DWORD *)&__src[4] |= 4u;
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v94 = mach_continuous_time();
          v95 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Vel Estimate is Hor with Ver and Uncert\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v94), "ADP", 73, "Ga10_02SendPositionReport");
          LbsOsaTrace_WriteLog(0x18u, __str, v95, 4, 1);
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v96 = mach_continuous_time();
          v97 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Bearing,%u,HSpeed,%u,VSpeed,%u,VSpeedDir,%u,HUncSpeed,%u,VUncSpeed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v96), "ADP", 68, "Ga10_02SendPositionReport", *(unsigned __int16 *)&__src[292], *(unsigned __int16 *)&__src[294], __src[296], __src[297], __src[298], __src[299]);
          LbsOsaTrace_WriteLog(0x18u, __str, v97, 5, 1);
        }
        break;
      default:
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v88 = mach_continuous_time();
          v89 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Velocity type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v88), "ADP", 69, "Ga10_02SendPositionReport", 515, *(_DWORD *)(a1 + 108));
          LbsOsaTrace_WriteLog(0x18u, __str, v89, 0, 1);
        }
        break;
    }
    v98 = *(_BYTE *)(a1 + 45);
    if ((v98 & 1) != 0)
    {
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v99 = mach_continuous_time();
        v100 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: GPS Fix\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v99), "ADP", 73, "Ga10_02SendPositionReport");
        LbsOsaTrace_WriteLog(0x18u, __str, v100, 4, 1);
      }
      *(_DWORD *)&__src[300] |= 1u;
      *(_DWORD *)&__src[4] |= 1u;
      v98 = *(_BYTE *)(a1 + 45);
    }
    if ((v98 & 0x80) == 0)
      goto LABEL_159;
    v101 = *(_QWORD *)(v2 + 128);
    v102 = *(_QWORD *)(v2 + 136) - v101;
    if (v102)
    {
      v103 = *v5;
      v104 = v102 / 196;
      if (v104 <= 1)
        v105 = 1;
      else
        v105 = v104;
      if (*(_DWORD *)(v101 + 52) == v103)
      {
        v106 = 0;
LABEL_143:
        if (v106 < v104)
        {
          v107 = *(unsigned __int8 *)(v101 + 196 * v106 + 48) != 0;
LABEL_150:
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v111 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
            if (v107)
              v112 = 84;
            else
              v112 = 70;
            v113 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: HELO enabled,%c\n", (unint64_t)v111, "ADP", 73, "Ga10_02SendPositionReport", v112);
            LbsOsaTrace_WriteLog(0x18u, __str, v113, 4, 1);
          }
          if (v107)
          {
            *(_DWORD *)&__src[300] |= 2u;
            if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
            {
              bzero(__str, 0x410uLL);
              v114 = mach_continuous_time();
              v115 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: HELO Fix\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v114), "ADP", 73, "Ga10_02SendPositionReport");
              LbsOsaTrace_WriteLog(0x18u, __str, v115, 4, 1);
            }
          }
          *(_DWORD *)&__src[4] |= 0x10u;
LABEL_159:
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v116 = mach_continuous_time();
            v117 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: GnssMask,%u,RspType,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v116), "ADP", 73, "Ga10_02SendPositionReport", *(unsigned __int8 *)(a1 + 45), *(_DWORD *)&__src[4]);
            LbsOsaTrace_WriteLog(0x18u, __str, v117, 4, 1);
          }
          goto LABEL_161;
        }
      }
      else
      {
        v106 = 0;
        v108 = (int *)(v101 + 248);
        v109 = v105 - 1;
        while (v109 != v106)
        {
          v110 = *v108;
          v108 += 49;
          ++v106;
          if (v110 == v103)
          {
            if (v106 < v104)
              goto LABEL_143;
            break;
          }
        }
      }
    }
    v107 = 0;
    goto LABEL_150;
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v31 = mach_continuous_time();
    v32 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Not enough Satellites,Err status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 69, "Ga10_02SendPositionReport", 769, *(unsigned __int8 *)(a1 + 60));
    LbsOsaTrace_WriteLog(0x18u, __str, v32, 0, 1);
  }
  *(_DWORD *)__src = -4;
  *(_DWORD *)&__src[4] |= 8u;
LABEL_161:
  *(_QWORD *)&__src[304] = gnss::GnssAdaptDevice::Ga06_18GetGnssSpoofingFlag((gnss::GnssAdaptDevice *)v2, *(_DWORD *)(a1 + 48));
  v118 = *(NSObject **)(v2 + 296);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice25Ga10_02SendPositionReportEPK15s_gnsCP_PosnRes_block_invoke_156;
  block[3] = &__block_descriptor_tmp_159;
  v119 = v147;
  v120 = (uint64_t)v152;
  if (v152)
  {
    if (v152 == v151)
    {
      v148 = v147;
      (*(void (**)(_QWORD *, _BYTE *))(v151[0] + 24))(v151, v147);
      goto LABEL_166;
    }
    v120 = (*(uint64_t (**)(void))(*v152 + 16))();
  }
  v148 = (_BYTE *)v120;
LABEL_166:
  memcpy(v149, __src, sizeof(v149));
  dispatch_async(v118, block);
  v121 = *(_QWORD *)(v2 + 128);
  v122 = *(_QWORD *)(v2 + 136) - v121;
  if (v122)
  {
    v123 = v122 / 196;
    if (v123 <= 1)
      v124 = 1;
    else
      v124 = v123;
    if (*(_DWORD *)(v121 + 52) == *(_DWORD *)&__src[16])
    {
      v125 = 0;
LABEL_172:
      if (v125 < v123)
      {
        v126 = *(_DWORD *)(v121 + 196 * v125 + 40);
        v127 = mach_continuous_time();
        v128 = *(_QWORD *)(v2 + 128) + 196 * v125;
        *(_DWORD *)(v128 + 184) = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v127) - v126;
        v129 = *(_OWORD *)v5;
        v130 = *(_OWORD *)(a1 + 56);
        v131 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(v128 + 96) = *(_OWORD *)(a1 + 72);
        *(_OWORD *)(v128 + 112) = v131;
        *(_OWORD *)(v128 + 64) = v129;
        *(_OWORD *)(v128 + 80) = v130;
        v132 = *(_OWORD *)(a1 + 104);
        v133 = *(_OWORD *)(a1 + 120);
        v134 = *(_OWORD *)(a1 + 136);
        *(_QWORD *)(v128 + 176) = *(_QWORD *)(a1 + 152);
        *(_OWORD *)(v128 + 144) = v133;
        *(_OWORD *)(v128 + 160) = v134;
        *(_OWORD *)(v128 + 128) = v132;
      }
      v135 = *(_DWORD *)(a1 + 60);
      if (v135 == 9)
        v136 = 3;
      else
        v136 = 19;
      if (v135 == 1)
        v137 = 2;
      else
        v137 = v136;
      gnss::GnssAdaptDevice::Ga10_05SendSessionSummaryReport(v2, *(_DWORD *)(a1 + 40), 0, v137);
    }
    else
    {
      v125 = 0;
      v143 = (int *)(v121 + 248);
      v144 = v124 - 1;
      while (v144 != v125)
      {
        v145 = *v143;
        v143 += 49;
        ++v125;
        if (v145 == *(_DWORD *)&__src[16])
        {
          if (v125 < v123)
            goto LABEL_172;
          break;
        }
      }
    }
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v138 = mach_continuous_time();
    v139 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v138), "ADP", 68, "Ga10_02SendPositionReport");
    LbsOsaTrace_WriteLog(0x18u, __str, v139, 5, 1);
  }
  if (v148 == v147)
  {
    v140 = 4;
  }
  else
  {
    if (!v148)
      goto LABEL_188;
    v140 = 5;
    v119 = v148;
  }
  (*(void (**)(_QWORD *))(*v119 + 8 * v140))(v119);
LABEL_188:
  result = v152;
  if (v152 == v151)
  {
    v142 = 4;
    result = v151;
  }
  else
  {
    if (!v152)
      return result;
    v142 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v142))();
}

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 v4;
  int v5;
  uint64_t v6;
  unsigned __int16 v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  unsigned __int16 v17;
  uint64_t v18;
  unsigned int v19;
  BOOL v20;
  uint64_t *v21;
  NSObject *v22;
  _QWORD *v23;
  uint64_t v24;
  unsigned __int16 v25;
  int v26;
  uint64_t v27;
  _QWORD *result;
  uint64_t v29;
  _QWORD block[4];
  _BYTE v31[24];
  _BYTE *v32;
  int v33;
  _QWORD v34[3];
  _QWORD *v35;
  char __str[1040];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v3 = mach_continuous_time();
    v4 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Api,%u,status,%u,id,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 73, "Ga10_00HandleGnsCpStatusResponse_block_invoke_4", *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 40));
    LbsOsaTrace_WriteLog(0x18u, __str, v4, 4, 1);
  }
  if (*(_DWORD *)(a1 + 44) > 1u)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v6 = mach_continuous_time();
      v7 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx GNS CP API\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 69, "Ga10_00HandleGnsCpStatusResponse_block_invoke_4", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v7, 0, 1);
    }
    v5 = 7;
  }
  else
  {
    v5 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v2, *(_DWORD *)(a1 + 48));
  }
  v35 = 0;
  v8 = v2 + 216;
  v9 = *(_QWORD *)(v2 + 216);
  if (!v9)
    goto LABEL_58;
  v10 = *(_DWORD *)(a1 + 40);
  v11 = v2 + 216;
  v12 = *(_QWORD *)(v2 + 216);
  do
  {
    v13 = *(_DWORD *)(v12 + 32);
    v14 = v13 >= v10;
    if (v13 >= v10)
      v15 = (uint64_t *)v12;
    else
      v15 = (uint64_t *)(v12 + 8);
    if (v14)
      v11 = v12;
    v12 = *v15;
  }
  while (*v15);
  if (v11 != v8 && v10 >= *(_DWORD *)(v11 + 32))
  {
    v18 = v2 + 216;
    do
    {
      v19 = *(_DWORD *)(v9 + 32);
      v20 = v19 >= v10;
      if (v19 >= v10)
        v21 = (uint64_t *)v9;
      else
        v21 = (uint64_t *)(v9 + 8);
      if (v20)
        v18 = v9;
      v9 = *v21;
    }
    while (*v21);
    if (v18 == v8 || v10 < *(_DWORD *)(v18 + 32))
      v18 = v2 + 216;
    std::function<void ()(gnss::Result)>::operator=(v34, v18 + 40);
    std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::erase((uint64_t **)(v2 + 208), (uint64_t *)v11);
  }
  else
  {
LABEL_58:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v16 = mach_continuous_time();
      v17 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx sessionID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 69, "Ga10_00HandleGnsCpStatusResponse_block_invoke_4", 770, *(_DWORD *)(a1 + 40));
      LbsOsaTrace_WriteLog(0x18u, __str, v17, 0, 1);
    }
  }
  if (!v35)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v24 = mach_continuous_time();
      v25 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx LutHdl Resp\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 69, "Ga10_00HandleGnsCpStatusResponse_block_invoke", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v25, 0, 1);
    }
    goto LABEL_51;
  }
  v22 = *(NSObject **)(v2 + 296);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice32Ga10_00HandleGnsCpStatusResponseE15e_gnsCP_MsgTypeP15u_gnsCP_MsgData_block_invoke_5;
  block[3] = &__block_descriptor_tmp_186;
  v23 = v31;
  if (v35 == v34)
  {
    v32 = v31;
    (*(void (**)(_QWORD *, _BYTE *))(v34[0] + 24))(v34, v31);
  }
  else
  {
    v32 = (_BYTE *)(*(uint64_t (**)(void))(*v35 + 16))();
  }
  v33 = v5;
  dispatch_async(v22, block);
  v26 = *(_DWORD *)(a1 + 44);
  if (v26)
  {
    if (v26 != 1 || v5 != 1)
      goto LABEL_46;
  }
  else if (v5 != 2 && v5 != 8)
  {
    goto LABEL_46;
  }
  gnss::GnssAdaptDevice::Ga10_05SendSessionSummaryReport(v2, *(_DWORD *)(a1 + 40), 0, 3);
LABEL_46:
  if (v32 == v31)
  {
    v27 = 4;
  }
  else
  {
    if (!v32)
      goto LABEL_51;
    v27 = 5;
    v23 = v32;
  }
  (*(void (**)(_QWORD *))(*v23 + 8 * v27))(v23);
LABEL_51:
  result = v35;
  if (v35 == v34)
  {
    v29 = 4;
    result = v34;
  }
  else
  {
    if (!v35)
      return result;
    v29 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v29))();
}

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_06HandleCPEcallAsyncEventCBE14e_gnsEcall_Api11e_gnsStatus_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned __int16 v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *result;
  uint64_t v28;
  _QWORD v29[4];
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  int v34;
  char __str[1040];
  _QWORD block[4];
  _BYTE v37[24];
  _BYTE *v38;
  _BYTE v39[24];
  _BYTE *v40;
  _QWORD v41[3];
  _QWORD *v42;
  _QWORD v43[3];
  _QWORD *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v41, (uint64_t)(v2 + 75));
  v3 = v43;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v43, (uint64_t)(v2 + 79));
  v4 = MEMORY[0x24BDAC760];
  if (!v42)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v7 = mach_continuous_time();
      v8 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx StartRespOnAccepted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "Ga10_06HandleCPEcallAsyncEventCB_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v8, 0, 1);
    }
    goto LABEL_27;
  }
  v5 = v2[37];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice32Ga10_06HandleCPEcallAsyncEventCBE14e_gnsEcall_Api11e_gnsStatus_block_invoke_2;
  block[3] = &__block_descriptor_tmp_191;
  v6 = v37;
  if (v42 == v41)
  {
    v38 = v37;
    (*(void (**)(_QWORD *, _BYTE *))(v41[0] + 24))(v41, v37);
  }
  else
  {
    v38 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v42 + 16))(v42);
  }
  v9 = v39;
  v10 = (uint64_t)v44;
  if (!v44)
    goto LABEL_10;
  if (v44 != v43)
  {
    v10 = (*(uint64_t (**)(_QWORD *))(*v44 + 16))(v44);
LABEL_10:
    v40 = (_BYTE *)v10;
    goto LABEL_12;
  }
  v40 = v39;
  (*(void (**)(_QWORD *, _BYTE *))(v43[0] + 24))(v43, v39);
LABEL_12:
  dispatch_async(v5, block);
  v11 = (_QWORD *)v2[78];
  v2[78] = 0;
  if (v11 == v2 + 75)
  {
    v12 = 4;
    v11 = v2 + 75;
  }
  else
  {
    if (!v11)
      goto LABEL_17;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_17:
  if (v40 == v39)
  {
    v13 = 4;
    goto LABEL_21;
  }
  if (v40)
  {
    v13 = 5;
    v9 = v40;
LABEL_21:
    (*(void (**)(_QWORD *))(*v9 + 8 * v13))(v9);
  }
  if (v38 == v37)
  {
    v14 = 4;
  }
  else
  {
    if (!v38)
      goto LABEL_27;
    v14 = 5;
    v6 = v38;
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v14))(v6);
LABEL_27:
  if (!v44)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v18 = mach_continuous_time();
      v19 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx StartRespOnCompleted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 69, "Ga10_06HandleCPEcallAsyncEventCB_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v19, 0, 1);
    }
    goto LABEL_55;
  }
  v15 = v2[37];
  v29[0] = v4;
  v29[1] = 1174405120;
  v29[2] = ___ZN4gnss15GnssAdaptDevice32Ga10_06HandleCPEcallAsyncEventCBE14e_gnsEcall_Api11e_gnsStatus_block_invoke_2_193;
  v29[3] = &__block_descriptor_tmp_194;
  v16 = v30;
  v17 = (uint64_t)v42;
  if (!v42)
    goto LABEL_31;
  if (v42 != v41)
  {
    v17 = (*(uint64_t (**)(_QWORD *))(*v42 + 16))(v42);
LABEL_31:
    v31 = (_BYTE *)v17;
    goto LABEL_35;
  }
  v31 = v30;
  (*(void (**)(_QWORD *, _BYTE *))(v41[0] + 24))(v41, v30);
LABEL_35:
  v20 = v32;
  v21 = (uint64_t)v44;
  if (!v44)
  {
LABEL_38:
    v33 = (_BYTE *)v21;
    goto LABEL_40;
  }
  if (v44 != v43)
  {
    v21 = (*(uint64_t (**)(_QWORD *))(*v44 + 16))(v44);
    goto LABEL_38;
  }
  v33 = v32;
  (*(void (**)(_QWORD *, _BYTE *))(v43[0] + 24))(v43, v32);
LABEL_40:
  v34 = *(_DWORD *)(a1 + 40);
  dispatch_async(v15, v29);
  v22 = (_QWORD *)v2[82];
  v2[82] = 0;
  if (v22 == v2 + 79)
  {
    v23 = 4;
    v22 = v2 + 79;
  }
  else
  {
    if (!v22)
      goto LABEL_45;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_45:
  if (v33 == v32)
  {
    v24 = 4;
    goto LABEL_49;
  }
  if (v33)
  {
    v24 = 5;
    v20 = v33;
LABEL_49:
    (*(void (**)(_QWORD *))(*v20 + 8 * v24))(v20);
  }
  if (v31 == v30)
  {
    v25 = 4;
  }
  else
  {
    if (!v31)
      goto LABEL_55;
    v25 = 5;
    v16 = v31;
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v25))(v16);
LABEL_55:
  if (v44 == v43)
  {
    v26 = 4;
  }
  else
  {
    if (!v44)
      goto LABEL_60;
    v26 = 5;
    v3 = v44;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v26))(v3);
LABEL_60:
  result = v42;
  if (v42 == v41)
  {
    v28 = 4;
    result = v41;
  }
  else
  {
    if (!v42)
      return result;
    v28 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v28))();
}

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga10_06HandleCPEcallAsyncEventCBE14e_gnsEcall_Api11e_gnsStatus_block_invoke_2_197(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned __int16 v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *result;
  uint64_t v28;
  _QWORD v29[4];
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  int v34;
  char __str[1040];
  _QWORD block[4];
  _BYTE v37[24];
  _BYTE *v38;
  _BYTE v39[24];
  _BYTE *v40;
  _QWORD v41[3];
  _QWORD *v42;
  _QWORD v43[3];
  _QWORD *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v41, (uint64_t)(v2 + 83));
  v3 = v43;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v43, (uint64_t)(v2 + 87));
  v4 = MEMORY[0x24BDAC760];
  if (!v42)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v7 = mach_continuous_time();
      v8 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx StopRespOnAccepted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "Ga10_06HandleCPEcallAsyncEventCB_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v8, 0, 1);
    }
    goto LABEL_27;
  }
  v5 = v2[37];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice32Ga10_06HandleCPEcallAsyncEventCBE14e_gnsEcall_Api11e_gnsStatus_block_invoke_3;
  block[3] = &__block_descriptor_tmp_198;
  v6 = v37;
  if (v42 == v41)
  {
    v38 = v37;
    (*(void (**)(_QWORD *, _BYTE *))(v41[0] + 24))(v41, v37);
  }
  else
  {
    v38 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v42 + 16))(v42);
  }
  v9 = v39;
  v10 = (uint64_t)v44;
  if (!v44)
    goto LABEL_10;
  if (v44 != v43)
  {
    v10 = (*(uint64_t (**)(_QWORD *))(*v44 + 16))(v44);
LABEL_10:
    v40 = (_BYTE *)v10;
    goto LABEL_12;
  }
  v40 = v39;
  (*(void (**)(_QWORD *, _BYTE *))(v43[0] + 24))(v43, v39);
LABEL_12:
  dispatch_async(v5, block);
  v11 = (_QWORD *)v2[86];
  v2[86] = 0;
  if (v11 == v2 + 83)
  {
    v12 = 4;
    v11 = v2 + 83;
  }
  else
  {
    if (!v11)
      goto LABEL_17;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_17:
  if (v40 == v39)
  {
    v13 = 4;
    goto LABEL_21;
  }
  if (v40)
  {
    v13 = 5;
    v9 = v40;
LABEL_21:
    (*(void (**)(_QWORD *))(*v9 + 8 * v13))(v9);
  }
  if (v38 == v37)
  {
    v14 = 4;
  }
  else
  {
    if (!v38)
      goto LABEL_27;
    v14 = 5;
    v6 = v38;
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v14))(v6);
LABEL_27:
  if (!v44)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v18 = mach_continuous_time();
      v19 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx StopRespOnCompleted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 69, "Ga10_06HandleCPEcallAsyncEventCB_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v19, 0, 1);
    }
    goto LABEL_55;
  }
  v15 = v2[37];
  v29[0] = v4;
  v29[1] = 1174405120;
  v29[2] = ___ZN4gnss15GnssAdaptDevice32Ga10_06HandleCPEcallAsyncEventCBE14e_gnsEcall_Api11e_gnsStatus_block_invoke_2_200;
  v29[3] = &__block_descriptor_tmp_201;
  v16 = v30;
  v17 = (uint64_t)v42;
  if (!v42)
    goto LABEL_31;
  if (v42 != v41)
  {
    v17 = (*(uint64_t (**)(_QWORD *))(*v42 + 16))(v42);
LABEL_31:
    v31 = (_BYTE *)v17;
    goto LABEL_35;
  }
  v31 = v30;
  (*(void (**)(_QWORD *, _BYTE *))(v41[0] + 24))(v41, v30);
LABEL_35:
  v20 = v32;
  v21 = (uint64_t)v44;
  if (!v44)
  {
LABEL_38:
    v33 = (_BYTE *)v21;
    goto LABEL_40;
  }
  if (v44 != v43)
  {
    v21 = (*(uint64_t (**)(_QWORD *))(*v44 + 16))(v44);
    goto LABEL_38;
  }
  v33 = v32;
  (*(void (**)(_QWORD *, _BYTE *))(v43[0] + 24))(v43, v32);
LABEL_40:
  v34 = *(_DWORD *)(a1 + 40);
  dispatch_async(v15, v29);
  v22 = (_QWORD *)v2[90];
  v2[90] = 0;
  if (v22 == v2 + 87)
  {
    v23 = 4;
    v22 = v2 + 87;
  }
  else
  {
    if (!v22)
      goto LABEL_45;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_45:
  if (v33 == v32)
  {
    v24 = 4;
    goto LABEL_49;
  }
  if (v33)
  {
    v24 = 5;
    v20 = v33;
LABEL_49:
    (*(void (**)(_QWORD *))(*v20 + 8 * v24))(v20);
  }
  if (v31 == v30)
  {
    v25 = 4;
  }
  else
  {
    if (!v31)
      goto LABEL_55;
    v25 = 5;
    v16 = v31;
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v25))(v16);
LABEL_55:
  if (v44 == v43)
  {
    v26 = 4;
  }
  else
  {
    if (!v44)
      goto LABEL_60;
    v26 = 5;
    v3 = v44;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v26))(v3);
LABEL_60:
  result = v42;
  if (v42 == v41)
  {
    v28 = 4;
    result = v41;
  }
  else
  {
    if (!v42)
      return result;
    v28 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v28))();
}

@end
