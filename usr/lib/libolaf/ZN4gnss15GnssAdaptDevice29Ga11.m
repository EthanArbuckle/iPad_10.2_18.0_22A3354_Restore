@implementation ZN4gnss15GnssAdaptDevice29Ga11

_QWORD *___ZN4gnss15GnssAdaptDevice29Ga11_18HandleSuplAsyncEventCBE13e_gnsSUPL_MsgP17u_gnsSUPL_MsgData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned __int16 v5;
  uint64_t v6;
  unsigned __int16 v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned __int16 v11;
  uint64_t v12;
  _QWORD *result;
  uint64_t v14;
  _QWORD block[4];
  _BYTE v16[24];
  _BYTE *v17;
  int v18;
  _QWORD v19[3];
  _QWORD *v20;
  char __str[1040];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 44) == 1)
  {
    if (*(_DWORD *)(v2 + 1016) == *(_DWORD *)(a1 + 40))
    {
      v3 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48));
      goto LABEL_9;
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v6 = mach_continuous_time();
      v7 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SessionId mismatch GL,%u,GNS,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 69, "Ga11_18HandleSuplAsyncEventCB_block_invoke", 770, *(_DWORD *)(v2 + 1016), *(_DWORD *)(a1 + 40));
      LbsOsaTrace_WriteLog(0x18u, __str, v7, 0, 1);
    }
  }
  else if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v4 = mach_continuous_time();
    v5 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Api,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 69, "Ga11_18HandleSuplAsyncEventCB_block_invoke", 770, *(_DWORD *)(a1 + 44));
    LbsOsaTrace_WriteLog(0x18u, __str, v5, 0, 1);
  }
  v3 = 8;
LABEL_9:
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v19, v2 + 568);
  if (v20)
  {
    v8 = *(NSObject **)(v2 + 296);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice29Ga11_18HandleSuplAsyncEventCBE13e_gnsSUPL_MsgP17u_gnsSUPL_MsgData_block_invoke_2;
    block[3] = &__block_descriptor_tmp_143;
    v9 = v16;
    if (v20 == v19)
    {
      v17 = v16;
      (*(void (**)(_QWORD *, _BYTE *))(v19[0] + 24))(v19, v16);
    }
    else
    {
      v17 = (_BYTE *)(*(uint64_t (**)(void))(*v20 + 16))();
    }
    v18 = v3;
    dispatch_async(v8, block);
    if (v17 == v16)
    {
      v12 = 4;
    }
    else
    {
      if (!v17)
        goto LABEL_20;
      v12 = 5;
      v9 = v17;
    }
    (*(void (**)(_QWORD *))(*v9 + 8 * v12))(v9);
  }
  else if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v10 = mach_continuous_time();
    v11 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SuplAbortRspCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 69, "Ga11_18HandleSuplAsyncEventCB_block_invoke", 258);
    LbsOsaTrace_WriteLog(0x18u, __str, v11, 0, 1);
  }
LABEL_20:
  result = v20;
  if (v20 == v19)
  {
    v14 = 4;
    result = v19;
  }
  else
  {
    if (!v20)
      return result;
    v14 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v14))();
}

_BYTE *___ZN4gnss15GnssAdaptDevice29Ga11_18HandleSuplAsyncEventCBE13e_gnsSUPL_MsgP17u_gnsSUPL_MsgData_block_invoke_2_151(_BYTE *result)
{
  _QWORD *v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  signed int v11;
  int v12;
  uint64_t v18;
  unsigned __int16 v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  unsigned __int16 v24;
  char *v25;
  char *v26;
  char v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  int v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  int v46;
  unint64_t v47;
  char *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  int *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  unsigned __int16 v67;
  uint64_t v68;
  unsigned __int16 v69;
  int v70;
  double v71;
  double v72;
  signed int v73;
  double v74;
  double v75;
  double v76;
  signed int v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  unsigned __int16 v83;
  uint64_t v84;
  unsigned __int16 v85;
  uint64_t v86;
  unsigned __int16 v87;
  NSObject *v88;
  _QWORD *v89;
  uint64_t v90;
  unsigned __int16 v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  int v134;
  int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  int64x2_t v149;
  __int128 v150;
  __int128 v151;
  int64x2_t v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _BYTE v156[24];
  _BYTE *v157;
  _BYTE __str[32];
  _BYTE v159[24];
  _BYTE *v160;
  __int128 v161;
  __int128 v162;
  int64x2_t v163;
  __int128 v164;
  __int128 v165;
  int64x2_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint64_t v170;

  v170 = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD *)*((_QWORD *)result + 4);
  v2 = *((_DWORD *)result + 10);
  v4 = *((_DWORD *)result + 18);
  v3 = *((_DWORD *)result + 19);
  v5 = *((_DWORD *)result + 20);
  v6 = *((_DWORD *)result + 21);
  v7 = result[88];
  v8 = *((_OWORD *)result + 11);
  v143 = *((_OWORD *)result + 10);
  v144 = v8;
  v145 = *((_OWORD *)result + 12);
  v146 = *((_QWORD *)result + 26);
  v9 = *((_OWORD *)result + 7);
  v139 = *((_OWORD *)result + 6);
  v140 = v9;
  v10 = *((_OWORD *)result + 9);
  v141 = *((_OWORD *)result + 8);
  v142 = v10;
  v11 = *((_DWORD *)result + 60);
  v135 = *((__int16 *)result + 122);
  v136 = result[246];
  v137 = result[256];
  v138 = *((_DWORD *)result + 59);
  v12 = result[257];
  v132 = *((_DWORD *)result + 67);
  v133 = *((unsigned __int16 *)result + 136);
  v134 = *((_DWORD *)result + 63);
  v130 = *((_DWORD *)result + 58);
  v131 = *((unsigned __int16 *)result + 140);
  if (v4 == 30)
  {
    if (DWORD1(v140) == 1)
      result = gnss::GnssAdaptDevice::Ga10_17InvokePVTMCbForE911((uint64_t)v1, (int *)&v139);
    if (!BYTE4(v139))
      return result;
  }
  v148 = xmmword_21E7F9A90;
  v149 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  __asm { FMOV            V0.2D, #-1.0 }
  v150 = _Q0;
  *(_QWORD *)&v151 = 0xBFF0000000000000;
  WORD4(v151) = 0;
  BYTE10(v151) = 0;
  HIDWORD(v151) = 0;
  v152 = v149;
  v153 = xmmword_21E7F9AA0;
  *(_QWORD *)&v154 = 0xBFF0000000000000;
  WORD4(v154) = -1;
  LODWORD(v155) = -1;
  WORD2(v155) = -1;
  *((_QWORD *)&v155 + 1) = 0xBFF0000000000000;
  v147 = v2;
  gnss::GnssAdaptDevice::Ga11_10ConvertGNSPosMethodToE911PosMethod(v5, (int *)&v147 + 1);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v18 = mach_continuous_time();
    v19 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: SUPL Event,%u,SessionStatus,%u,SuplEndCause,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 73, "Ga11_20SendStatusReport", v3, v4, v6);
    LbsOsaTrace_WriteLog(0x18u, __str, v19, 4, 1);
  }
  switch(v3)
  {
    case 0:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      goto LABEL_8;
    case 1:
      DWORD2(v147) = 1;
      v26 = (char *)v1[19];
      v25 = (char *)v1[20];
      if (v25 != v26)
      {
        v27 = *v26;
        memset(&__str[2], 0, 27);
        *(_QWORD *)&v156[1] = -1;
        *(_DWORD *)&v156[8] = -1;
        v28 = v25 - (v26 + 1);
        if (v25 != v26 + 1)
        {
          v29 = v27;
          memmove(v26, v26 + 1, v25 - (v26 + 1));
          v27 = v29;
        }
        v1[20] = &v26[v28];
        v31 = v1[16];
        v30 = v1[17];
        v32 = 0x7D6343EB1A1F58D1 * ((uint64_t)(v30 - v31) >> 2);
        if (v32 <= 3)
        {
          v33 = v27 & 1;
          v34 = v147;
          v35 = v1[18];
          if (v30 >= v35)
          {
            v94 = 0x7D6343EB1A1F58D1 * ((uint64_t)(v35 - v31) >> 2);
            if (2 * v94 <= v32 + 1)
              v95 = v32 + 1;
            else
              v95 = 2 * v94;
            if (v94 >= 0xA72F05397829CBLL)
              v96 = 0x14E5E0A72F05397;
            else
              v96 = v95;
            v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gnss::AgnssSummaryReport>>((uint64_t)(v1 + 18), v96);
            v98 = &v97[196 * v32];
            v100 = &v97[196 * v99];
            *(_QWORD *)v98 = 0xFFFFFFFF00000000;
            *((_WORD *)v98 + 4) = -1;
            *(_OWORD *)(v98 + 10) = *(_OWORD *)__str;
            *(_OWORD *)(v98 + 23) = *(_OWORD *)&__str[13];
            *((_QWORD *)v98 + 5) = 0xFFFFFFFF00000000;
            v98[48] = v33;
            *((_DWORD *)v98 + 13) = -1;
            *((_DWORD *)v98 + 14) = v34;
            v98[60] = 0;
            *((_DWORD *)v98 + 16) = -1;
            *((_WORD *)v98 + 34) = 0;
            *(_OWORD *)(v98 + 72) = xmmword_21E7F9A80;
            *(_QWORD *)(v98 + 102) = 0;
            *((_QWORD *)v98 + 11) = 0;
            *((_QWORD *)v98 + 12) = 0;
            *((_WORD *)v98 + 55) = -1;
            v98[112] = 0;
            *((_DWORD *)v98 + 29) = 0;
            *((_QWORD *)v98 + 15) = -1;
            *((_QWORD *)v98 + 16) = 0;
            *((_DWORD *)v98 + 34) = -1;
            v98[140] = -1;
            *(_QWORD *)(v98 + 141) = *(_QWORD *)v156;
            *(_DWORD *)(v98 + 149) = *(_DWORD *)&v156[8];
            *(_QWORD *)(v98 + 156) = -1;
            *(_QWORD *)(v98 + 164) = 0x7FFFFFFFLL;
            v98[172] = 0;
            *((_WORD *)v98 + 87) = -1;
            *((_QWORD *)v98 + 22) = 0xFFFFFFFF7FFFFFFFLL;
            *((_WORD *)v98 + 96) = 0;
            *((_QWORD *)v98 + 23) = 0;
            v36 = v98 + 196;
            v102 = (char *)v1[16];
            v101 = (char *)v1[17];
            if (v101 != v102)
            {
              do
              {
                *(_OWORD *)(v98 - 196) = *(_OWORD *)(v101 - 196);
                v103 = *(_OWORD *)(v101 - 180);
                v104 = *(_OWORD *)(v101 - 164);
                v105 = *(_OWORD *)(v101 - 148);
                *(_OWORD *)(v98 - 132) = *(_OWORD *)(v101 - 132);
                *(_OWORD *)(v98 - 148) = v105;
                *(_OWORD *)(v98 - 164) = v104;
                *(_OWORD *)(v98 - 180) = v103;
                v106 = *(_OWORD *)(v101 - 116);
                v107 = *(_OWORD *)(v101 - 100);
                v108 = *(_OWORD *)(v101 - 84);
                *(_OWORD *)(v98 - 68) = *(_OWORD *)(v101 - 68);
                *(_OWORD *)(v98 - 84) = v108;
                *(_OWORD *)(v98 - 100) = v107;
                *(_OWORD *)(v98 - 116) = v106;
                v109 = *(_OWORD *)(v101 - 52);
                v110 = *(_OWORD *)(v101 - 36);
                v111 = *(_OWORD *)(v101 - 20);
                *((_WORD *)v98 - 2) = *((_WORD *)v101 - 2);
                *(_OWORD *)(v98 - 20) = v111;
                *(_OWORD *)(v98 - 36) = v110;
                *(_OWORD *)(v98 - 52) = v109;
                v98 -= 196;
                v101 -= 196;
              }
              while (v101 != v102);
              v101 = (char *)v1[16];
            }
            v1[16] = v98;
            v1[17] = v36;
            v1[18] = v100;
            if (v101)
              operator delete(v101);
          }
          else
          {
            *(_QWORD *)v30 = 0xFFFFFFFF00000000;
            *(_WORD *)(v30 + 8) = -1;
            *(_OWORD *)(v30 + 10) = *(_OWORD *)__str;
            *(_OWORD *)(v30 + 23) = *(_OWORD *)&__str[13];
            *(_QWORD *)(v30 + 40) = 0xFFFFFFFF00000000;
            *(_BYTE *)(v30 + 48) = v33;
            *(_DWORD *)(v30 + 52) = -1;
            *(_DWORD *)(v30 + 56) = v34;
            *(_BYTE *)(v30 + 60) = 0;
            *(_DWORD *)(v30 + 64) = -1;
            *(_WORD *)(v30 + 68) = 0;
            *(_OWORD *)(v30 + 72) = xmmword_21E7F9A80;
            *(_QWORD *)(v30 + 102) = 0;
            *(_QWORD *)(v30 + 88) = 0;
            *(_QWORD *)(v30 + 96) = 0;
            *(_WORD *)(v30 + 110) = -1;
            *(_BYTE *)(v30 + 112) = 0;
            *(_DWORD *)(v30 + 116) = 0;
            *(_QWORD *)(v30 + 120) = -1;
            *(_QWORD *)(v30 + 128) = 0;
            *(_DWORD *)(v30 + 136) = -1;
            *(_BYTE *)(v30 + 140) = -1;
            *(_QWORD *)(v30 + 141) = *(_QWORD *)v156;
            *(_DWORD *)(v30 + 149) = *(_DWORD *)&v156[8];
            *(_QWORD *)(v30 + 156) = -1;
            *(_QWORD *)(v30 + 164) = 0x7FFFFFFFLL;
            *(_BYTE *)(v30 + 172) = 0;
            *(_WORD *)(v30 + 174) = -1;
            *(_QWORD *)(v30 + 176) = 0xFFFFFFFF7FFFFFFFLL;
            *(_WORD *)(v30 + 192) = 0;
            v36 = (char *)(v30 + 196);
            *(_QWORD *)(v30 + 184) = 0;
          }
          v1[17] = v36;
        }
      }
      goto LABEL_8;
    case 2:
      v38 = (char *)v1[19];
      v37 = (char *)v1[20];
      if (v37 != v38)
      {
        v39 = *v38;
        memset(&__str[2], 0, 27);
        *(_QWORD *)&v156[1] = -1;
        *(_DWORD *)&v156[8] = -1;
        v40 = v37 - (v38 + 1);
        if (v37 != v38 + 1)
        {
          v41 = v39;
          memmove(v38, v38 + 1, v37 - (v38 + 1));
          v39 = v41;
        }
        v1[20] = &v38[v40];
        v43 = v1[16];
        v42 = v1[17];
        v44 = 0x7D6343EB1A1F58D1 * ((uint64_t)(v42 - v43) >> 2);
        if (v44 <= 3)
        {
          v45 = v39 & 1;
          v46 = v147;
          v47 = v1[18];
          if (v42 >= v47)
          {
            v112 = 0x7D6343EB1A1F58D1 * ((uint64_t)(v47 - v43) >> 2);
            if (2 * v112 <= v44 + 1)
              v113 = v44 + 1;
            else
              v113 = 2 * v112;
            if (v112 >= 0xA72F05397829CBLL)
              v114 = 0x14E5E0A72F05397;
            else
              v114 = v113;
            v115 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gnss::AgnssSummaryReport>>((uint64_t)(v1 + 18), v114);
            v116 = &v115[196 * v44];
            v118 = &v115[196 * v117];
            *(_QWORD *)v116 = 0xFFFFFFFF00000000;
            *((_WORD *)v116 + 4) = -1;
            *(_OWORD *)(v116 + 10) = *(_OWORD *)__str;
            *(_OWORD *)(v116 + 23) = *(_OWORD *)&__str[13];
            *((_QWORD *)v116 + 5) = 0xFFFFFFFF00000000;
            v116[48] = v45;
            *((_DWORD *)v116 + 13) = -1;
            *((_DWORD *)v116 + 14) = v46;
            v116[60] = 0;
            *((_DWORD *)v116 + 16) = -1;
            *((_WORD *)v116 + 34) = 0;
            *(_OWORD *)(v116 + 72) = xmmword_21E7F9A80;
            *(_QWORD *)(v116 + 102) = 0;
            *((_QWORD *)v116 + 11) = 0;
            *((_QWORD *)v116 + 12) = 0;
            *((_WORD *)v116 + 55) = -1;
            v116[112] = 0;
            *((_DWORD *)v116 + 29) = 0;
            *((_QWORD *)v116 + 15) = -1;
            *((_QWORD *)v116 + 16) = 0;
            *((_DWORD *)v116 + 34) = -1;
            v116[140] = -1;
            *(_QWORD *)(v116 + 141) = *(_QWORD *)v156;
            *(_DWORD *)(v116 + 149) = *(_DWORD *)&v156[8];
            *(_QWORD *)(v116 + 156) = -1;
            *(_QWORD *)(v116 + 164) = 0x7FFFFFFFLL;
            v116[172] = 0;
            *((_WORD *)v116 + 87) = -1;
            *((_QWORD *)v116 + 22) = 0xFFFFFFFF7FFFFFFFLL;
            *((_WORD *)v116 + 96) = 0;
            *((_QWORD *)v116 + 23) = 0;
            v48 = v116 + 196;
            v120 = (char *)v1[16];
            v119 = (char *)v1[17];
            if (v119 != v120)
            {
              do
              {
                *(_OWORD *)(v116 - 196) = *(_OWORD *)(v119 - 196);
                v121 = *(_OWORD *)(v119 - 180);
                v122 = *(_OWORD *)(v119 - 164);
                v123 = *(_OWORD *)(v119 - 148);
                *(_OWORD *)(v116 - 132) = *(_OWORD *)(v119 - 132);
                *(_OWORD *)(v116 - 148) = v123;
                *(_OWORD *)(v116 - 164) = v122;
                *(_OWORD *)(v116 - 180) = v121;
                v124 = *(_OWORD *)(v119 - 116);
                v125 = *(_OWORD *)(v119 - 100);
                v126 = *(_OWORD *)(v119 - 84);
                *(_OWORD *)(v116 - 68) = *(_OWORD *)(v119 - 68);
                *(_OWORD *)(v116 - 84) = v126;
                *(_OWORD *)(v116 - 100) = v125;
                *(_OWORD *)(v116 - 116) = v124;
                v127 = *(_OWORD *)(v119 - 52);
                v128 = *(_OWORD *)(v119 - 36);
                v129 = *(_OWORD *)(v119 - 20);
                *((_WORD *)v116 - 2) = *((_WORD *)v119 - 2);
                *(_OWORD *)(v116 - 20) = v129;
                *(_OWORD *)(v116 - 36) = v128;
                *(_OWORD *)(v116 - 52) = v127;
                v116 -= 196;
                v119 -= 196;
              }
              while (v119 != v120);
              v119 = (char *)v1[16];
            }
            v1[16] = v116;
            v1[17] = v48;
            v1[18] = v118;
            if (v119)
              operator delete(v119);
          }
          else
          {
            *(_QWORD *)v42 = 0xFFFFFFFF00000000;
            *(_WORD *)(v42 + 8) = -1;
            *(_OWORD *)(v42 + 10) = *(_OWORD *)__str;
            *(_OWORD *)(v42 + 23) = *(_OWORD *)&__str[13];
            *(_QWORD *)(v42 + 40) = 0xFFFFFFFF00000000;
            *(_BYTE *)(v42 + 48) = v45;
            *(_DWORD *)(v42 + 52) = -1;
            *(_DWORD *)(v42 + 56) = v46;
            *(_BYTE *)(v42 + 60) = 0;
            *(_DWORD *)(v42 + 64) = -1;
            *(_WORD *)(v42 + 68) = 0;
            *(_OWORD *)(v42 + 72) = xmmword_21E7F9A80;
            *(_QWORD *)(v42 + 102) = 0;
            *(_QWORD *)(v42 + 88) = 0;
            *(_QWORD *)(v42 + 96) = 0;
            *(_WORD *)(v42 + 110) = -1;
            *(_BYTE *)(v42 + 112) = 0;
            *(_DWORD *)(v42 + 116) = 0;
            *(_QWORD *)(v42 + 120) = -1;
            *(_QWORD *)(v42 + 128) = 0;
            *(_DWORD *)(v42 + 136) = -1;
            *(_BYTE *)(v42 + 140) = -1;
            *(_QWORD *)(v42 + 141) = *(_QWORD *)v156;
            *(_DWORD *)(v42 + 149) = *(_DWORD *)&v156[8];
            *(_QWORD *)(v42 + 156) = -1;
            *(_QWORD *)(v42 + 164) = 0x7FFFFFFFLL;
            *(_BYTE *)(v42 + 172) = 0;
            *(_WORD *)(v42 + 174) = -1;
            *(_QWORD *)(v42 + 176) = 0xFFFFFFFF7FFFFFFFLL;
            *(_WORD *)(v42 + 192) = 0;
            v48 = (char *)(v42 + 196);
            *(_QWORD *)(v42 + 184) = 0;
          }
          v1[17] = v48;
        }
      }
      gnss::GnssAdaptDevice::Ga10_05SendSessionSummaryReport((uint64_t)v1, v147, 1, 3);
      goto LABEL_8;
    case 3:
      v49 = 13;
      goto LABEL_28;
    case 6:
      v49 = 30;
      goto LABEL_28;
    case 7:
      v49 = 29;
LABEL_28:
      DWORD2(v147) = v49;
LABEL_29:
      v20 = DWORD2(v147);
      goto LABEL_30;
    default:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v23 = mach_continuous_time();
        v24 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SUPL Event,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 69, "Ga11_20SendStatusReport", 515, v3);
        LbsOsaTrace_WriteLog(0x18u, __str, v24, 0, 1);
      }
LABEL_8:
      v20 = DWORD2(v147);
      if (!DWORD2(v147))
      {
        v21 = 22;
        v20 = 21;
        switch(v4)
        {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 17:
          case 24:
          case 38:
            goto LABEL_84;
          case 5:
          case 8:
            v22 = 3;
            goto LABEL_83;
          case 6:
            v22 = 2;
            goto LABEL_83;
          case 7:
            v22 = 5;
            goto LABEL_83;
          case 9:
            v22 = 4;
            goto LABEL_83;
          case 10:
            v22 = 6;
            goto LABEL_83;
          case 11:
            v22 = 7;
            goto LABEL_83;
          case 12:
            v22 = 8;
            goto LABEL_83;
          case 13:
            v22 = 9;
            goto LABEL_83;
          case 14:
            v22 = 12;
            goto LABEL_83;
          case 15:
            v22 = 11;
            goto LABEL_83;
          case 16:
            v22 = 10;
            goto LABEL_83;
          case 18:
          case 25:
            v22 = 26;
            goto LABEL_83;
          case 19:
          case 26:
            v22 = 20;
            goto LABEL_83;
          case 20:
          case 27:
            v20 = 27;
            goto LABEL_62;
          case 21:
          case 28:
LABEL_62:
            DWORD2(v147) = v20;
            goto LABEL_32;
          case 22:
            v21 = 28;
            goto LABEL_76;
          case 23:
LABEL_76:
            DWORD2(v147) = v21;
            v20 = v21;
            goto LABEL_46;
          case 29:
            v22 = 17;
            goto LABEL_83;
          case 30:
            v22 = 18;
            goto LABEL_83;
          case 31:
            v22 = 19;
            goto LABEL_83;
          case 32:
            v22 = 23;
            goto LABEL_83;
          case 33:
            v22 = 24;
            goto LABEL_83;
          case 34:
            v22 = 25;
LABEL_83:
            DWORD2(v147) = v22;
            break;
          case 35:
            DWORD2(v147) = 14;
            BYTE9(v151) = 1;
            break;
          case 36:
            DWORD2(v147) = 15;
            BYTE10(v151) = 1;
            break;
          case 37:
            DWORD2(v147) = 16;
            BYTE8(v151) = 1;
            break;
          default:
            if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
            {
              bzero(__str, 0x410uLL);
              v66 = mach_continuous_time();
              v67 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx PPDU Sess Code,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v66), "ADP", 69, "Ga11_20SendStatusReport", 515, v4);
              LbsOsaTrace_WriteLog(0x18u, __str, v67, 0, 1);
            }
            goto LABEL_29;
        }
        goto LABEL_84;
      }
LABEL_30:
      if (v20 == 21 || v20 == 27)
      {
LABEL_32:
        v50 = v1[16];
        v51 = v1[17] - v50;
        if (v51)
        {
          v52 = v51 / 196;
          if (v52 <= 1)
            v53 = 1;
          else
            v53 = v52;
          if (*(_DWORD *)(v50 + 56) == (_DWORD)v147)
          {
            v54 = 0;
LABEL_38:
            if (v54 < v52)
            {
              *(_BYTE *)(v50 + 196 * v54 + 60) = 1;
              v20 = DWORD2(v147);
            }
          }
          else
          {
            v54 = 0;
            v55 = (int *)(v50 + 252);
            v56 = v53 - 1;
            while (v56 != v54)
            {
              v57 = *v55;
              v55 += 49;
              ++v54;
              if (v57 == (_DWORD)v147)
              {
                if (v54 < v52)
                  goto LABEL_38;
                break;
              }
            }
          }
        }
      }
      if (v20 != 22 && v20 != 28)
        goto LABEL_84;
LABEL_46:
      v58 = v1[16];
      v59 = v1[17] - v58;
      if (!v59)
        goto LABEL_84;
      v60 = v59 / 196;
      if (v60 <= 1)
        v61 = 1;
      else
        v61 = v60;
      if (*(_DWORD *)(v58 + 56) == (_DWORD)v147)
      {
        v62 = 0;
LABEL_52:
        if (v62 < v60)
          *(_DWORD *)(v58 + 196 * v62 + 188) = v20;
        goto LABEL_84;
      }
      v62 = 0;
      v63 = (int *)(v58 + 252);
      v64 = v61 - 1;
      do
      {
        if (v64 == v62)
          goto LABEL_84;
        v65 = *v63;
        v63 += 49;
        ++v62;
      }
      while (v65 != (_DWORD)v147);
      if (v62 < v60)
        goto LABEL_52;
LABEL_84:
      switch(v6)
      {
        case 0:
          HIDWORD(v147) = 0;
          break;
        case 1:
          v70 = 1;
          goto LABEL_110;
        case 2:
          v70 = 2;
          goto LABEL_110;
        case 3:
          v70 = 3;
          goto LABEL_110;
        case 4:
          v70 = 4;
          goto LABEL_110;
        case 5:
          v70 = 5;
          goto LABEL_110;
        case 6:
          v70 = 6;
          goto LABEL_110;
        case 7:
          v70 = 7;
          goto LABEL_110;
        case 8:
          v70 = 8;
          goto LABEL_110;
        case 9:
          v70 = 9;
          goto LABEL_110;
        case 10:
          v70 = 10;
          goto LABEL_110;
        case 11:
          v70 = 11;
          goto LABEL_110;
        case 12:
          v70 = 12;
          goto LABEL_110;
        case 13:
          v70 = 13;
          goto LABEL_110;
        case 14:
          v70 = 14;
          goto LABEL_110;
        case 15:
          v70 = 15;
          goto LABEL_110;
        case 16:
          v70 = 16;
          goto LABEL_110;
        case 17:
          v70 = 17;
          goto LABEL_110;
        case 18:
          v70 = 18;
          goto LABEL_110;
        case 19:
          v70 = 19;
          goto LABEL_110;
        case 20:
          v70 = 20;
          goto LABEL_110;
        case 21:
          v70 = 21;
          goto LABEL_110;
        case 22:
          v70 = 22;
LABEL_110:
          HIDWORD(v147) = v70;
          break;
        default:
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v68 = mach_continuous_time();
            v69 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SUPL End Cause,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v68), "ADP", 69, "Ga11_20SendStatusReport", 515, v6);
            LbsOsaTrace_WriteLog(0x18u, __str, v69, 0, 1);
          }
          break;
      }
      if (v7 == 255)
        v71 = -1.0;
      else
        v71 = (pow(1.1, (double)v7) + -1.0) * 10.0;
      *(double *)&v148 = v71;
      if (DWORD1(v140) == 1)
      {
        if (DWORD1(v141) >> 23)
        {
          v72 = 1.79769313e308;
        }
        else
        {
          v72 = -((double)DWORD1(v141) * 90.0 * 0.00000011920929);
          if ((_DWORD)v141 != 2)
            v72 = (double)DWORD1(v141) * 90.0 * 0.00000011920929;
        }
        *((double *)&v148 + 1) = v72;
        v73 = DWORD2(v141);
        if ((DWORD2(v141) + 0x800000) >> 24)
        {
          v74 = 1.79769313e308;
        }
        else
        {
          if ((DWORD2(v141) & 0x800000) != 0)
            v73 = DWORD2(v141) | 0xFF000000;
          v74 = (double)v73 * 360.0 * 0.0000000596046448;
        }
        v75 = (double)WORD6(v141);
        if (DWORD1(v142) == 2)
          v75 = -v75;
        if (SWORD6(v141) < 0)
          v75 = 1.79769313e308;
        *(double *)v149.i64 = v74;
        *(double *)&v149.i64[1] = v75;
        if (BYTE14(v141) != 255)
          *(double *)&v150 = (double)BYTE14(v141);
        if (HIBYTE(v141) != 255)
          *((double *)&v150 + 1) = (double)HIBYTE(v141);
        if (BYTE8(v142) != 255)
          *(double *)&v151 = (double)BYTE8(v142);
      }
      if (BYTE10(v151))
      {
        if (v138 >> 23)
        {
          v76 = 1.79769313e308;
        }
        else
        {
          v76 = -((double)v138 * 90.0 * 0.00000011920929);
          if (v130 != 2)
            v76 = (double)v138 * 90.0 * 0.00000011920929;
        }
        *(double *)v152.i64 = v76;
        if ((v11 + 0x800000) >> 24)
        {
          v78 = 1.79769313e308;
        }
        else
        {
          v77 = v11 | 0xFF000000;
          if ((v11 & 0x800000) == 0)
            v77 = v11;
          v78 = (double)v77 * 360.0 * 0.0000000596046448;
        }
        v79 = (double)(unsigned __int16)v135;
        if (v134 == 2)
          v79 = -v79;
        if (v135 < 0)
          v79 = 1.79769313e308;
        *(double *)&v152.i64[1] = v78;
        *(double *)&v153 = v79;
        v80 = -1.0;
        v81 = -1.0;
        if (v136 != 255)
          v81 = (pow(1.1, (double)v136) + -1.0) * 10.0;
        *(double *)&v154 = v81;
        if (v137 != 255)
          v80 = (pow(1.025, (double)v137) + -1.0) * 45.0;
        *((double *)&v153 + 1) = v80;
        if (v12 != 255)
        {
          BYTE8(v154) = v12;
          BYTE9(v154) = v12;
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
        {
          bzero(__str, 0x410uLL);
          v82 = mach_continuous_time();
          v83 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: RefLocLat,%.7lf,Long,%.7lf,Alt,%.2lf,HorUnc,%f,VerUnc,%f,conf,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v82), "ADP", 68, "Ga11_20SendStatusReport", *(double *)v152.i64, *(double *)&v152.i64[1], *(double *)&v153, *(double *)&v154, *((double *)&v153 + 1), BYTE8(v154));
          LbsOsaTrace_WriteLog(0x18u, __str, v83, 5, 1);
        }
      }
      if (BYTE9(v151))
      {
        if (v131 <= 0x3FF)
          WORD2(v155) = v131;
        if (v132 <= 0x240C83FF)
          LODWORD(v155) = v132 / 0x3E8;
        if (v132 != -1 && WORD2(v155) != 0xFFFF && v133 != 0xFFFF)
          *((double *)&v155 + 1) = (double)((8389 * (v133 >> 3)) >> 20);
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v84 = mach_continuous_time();
          v85 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Week,%u,TowSec,%u,TowUnc,%.3lf\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v84), "ADP", 73, "Ga11_20SendStatusReport", WORD2(v155), (_DWORD)v155, *((double *)&v155 + 1));
          LbsOsaTrace_WriteLog(0x18u, __str, v85, 4, 1);
        }
      }
      if (!*(_QWORD *)((char *)&v147 + 4)
        && !HIDWORD(v147)
        && fabs(*(double *)&v148 + 1.0) < 2.22044605e-16
        && fabs(*((double *)&v148 + 1) + -1.79769313e308) < 2.22044605e-16
        && fabs(*(double *)v149.i64 + -1.79769313e308) < 2.22044605e-16
        && fabs(*(double *)&v149.i64[1] + -1.79769313e308) < 2.22044605e-16
        && fabs(*(double *)&v150 + 1.0) < 2.22044605e-16
        && fabs(*((double *)&v150 + 1) + 1.0) < 2.22044605e-16
        && fabs(*(double *)&v151 + 1.0) < 2.22044605e-16)
      {
        result = (_BYTE *)LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0);
        if ((_DWORD)result)
        {
          bzero(__str, 0x410uLL);
          v86 = mach_continuous_time();
          v87 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Status report\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v86), "ADP", 87, "Ga11_20SendStatusReport", 770);
          return (_BYTE *)LbsOsaTrace_WriteLog(0x18u, __str, v87, 2, 1);
        }
        return result;
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v156, (uint64_t)(v1 + 123));
      if (!v157)
      {
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v90 = mach_continuous_time();
          v91 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SuplStatusReportCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v90), "ADP", 69, "Ga11_20SendStatusReport", 258);
          LbsOsaTrace_WriteLog(0x18u, __str, v91, 0, 1);
        }
        goto LABEL_191;
      }
      v88 = v1[37];
      *(_QWORD *)__str = MEMORY[0x24BDAC760];
      *(_QWORD *)&__str[8] = 1174405120;
      *(_QWORD *)&__str[16] = ___ZN4gnss15GnssAdaptDevice23Ga11_20SendStatusReportERK19s_gnsSUPL_StatusRep_block_invoke;
      *(_QWORD *)&__str[24] = &__block_descriptor_tmp_165;
      v89 = v159;
      if (v157 == v156)
      {
        v160 = v159;
        (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)v156 + 24))(v156, v159);
      }
      else
      {
        v160 = (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)v157 + 16))();
      }
      v167 = v153;
      v168 = v154;
      v169 = v155;
      v163 = v149;
      v164 = v150;
      v165 = v151;
      v166 = v152;
      v161 = v147;
      v162 = v148;
      dispatch_async(v88, __str);
      if (v160 == v159)
      {
        v92 = 4;
        goto LABEL_190;
      }
      if (v160)
      {
        v92 = 5;
        v89 = v160;
LABEL_190:
        (*(void (**)(_QWORD *))(*v89 + 8 * v92))(v89);
      }
LABEL_191:
      result = v157;
      if (v157 == v156)
      {
        v93 = 4;
        result = v156;
      }
      else
      {
        if (!v157)
          return result;
        v93 = 5;
      }
      return (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v93))();
  }
}

@end
