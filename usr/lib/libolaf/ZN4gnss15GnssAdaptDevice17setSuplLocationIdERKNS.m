@implementation ZN4gnss15GnssAdaptDevice17setSuplLocationIdERKNS

_QWORD *___ZN4gnss15GnssAdaptDevice17setSuplLocationIdERKNS_9Emergency4Supl10LocationIdENSt3__18functionIFvNS_6ResultEEEE_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int16 v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 v12;
  _QWORD *result;
  uint64_t v14;
  unsigned __int16 v15;
  uint64_t v16;
  unsigned __int16 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  _DWORD *v42;
  uint64_t v43;
  _DWORD *v44;
  unsigned __int16 v45;
  uint64_t v46;
  unsigned __int16 v47;
  uint64_t v48;
  unsigned __int16 v49;
  uint64_t v50;
  unsigned __int16 v51;
  uint64_t v52;
  unsigned __int16 v53;
  uint64_t v54;
  unsigned __int16 v55;
  uint64_t v56;
  unsigned __int16 v57;
  int v58;
  uint64_t v59;
  unsigned __int16 v60;
  uint64_t v61;
  unsigned __int16 v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  unsigned __int16 v66;
  uint64_t v67;
  unsigned __int16 v68;
  uint64_t v69;
  unsigned __int16 v70;
  uint64_t v71;
  unsigned __int16 v72;
  uint64_t v73;
  unsigned __int16 v74;
  uint64_t v75;
  unsigned __int16 v76;
  uint64_t v77;
  unsigned __int16 v78;
  uint64_t v79;
  unsigned __int16 v80;
  uint64_t v81;
  unsigned __int16 v82;
  uint64_t v83;
  unsigned __int16 v84;
  uint64_t v85;
  unsigned __int16 v86;
  uint64_t v87;
  unsigned __int16 v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  unsigned __int16 v92;
  uint64_t v93;
  unsigned __int16 v94;
  uint64_t v95;
  unsigned __int16 v96;
  uint64_t v97;
  unsigned __int16 v98;
  uint64_t v99;
  unsigned __int16 v100;
  uint64_t v101;
  unsigned int v102;
  uint64_t v103;
  unsigned __int16 v104;
  uint64_t v105;
  unsigned __int16 v106;
  uint64_t v107;
  unsigned __int16 v108;
  unsigned int v109;
  uint64_t v110;
  unsigned __int16 v111;
  uint64_t v112;
  unsigned __int16 v113;
  uint64_t v114;
  unsigned __int16 v115;
  int v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  unsigned __int16 v120;
  uint64_t v121;
  unsigned __int16 v122;
  _QWORD *v123;
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  unsigned __int16 v128;
  uint64_t v129;
  unsigned __int16 v130;
  uint64_t v131;
  unsigned __int16 v132;
  uint64_t v133;
  _BYTE v134[24];
  _BYTE *v135;
  _BYTE v136[24];
  _BYTE *v137;
  _BYTE v138[24];
  _BYTE *v139;
  _BYTE v140[24];
  _BYTE *v141;
  _BYTE v142[24];
  _BYTE *v143;
  _BYTE v144[24];
  _BYTE *v145;
  _BYTE v146[24];
  _BYTE *v147;
  _BYTE v148[24];
  _BYTE *v149;
  char __str[4];
  uint64_t v151;
  _DWORD v152[3];
  unsigned int v153;
  __int16 v154;
  __int16 v155;
  unsigned __int8 v156;
  _DWORD v157[1543];
  _BYTE v158[24];
  _BYTE *v159;
  _BYTE v160[24];
  _BYTE *v161;
  char v162[1040];
  uint64_t v163;

  v0 = MEMORY[0x24BDAC7A8]();
  v163 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v2 = mach_continuous_time();
    v3 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "ADP", 68, "setSuplLocationId_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, __str, v3, 5, 1);
  }
  if (!*(_BYTE *)(v1 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v160, v0 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 7, (uint64_t)v160, (uint64_t)"setSuplLocationId_block_invoke");
    v9 = v161;
    if (v161 == v160)
    {
      v10 = 4;
      v9 = v160;
    }
    else
    {
      if (!v161)
      {
LABEL_15:
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v11 = mach_continuous_time();
          v12 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "setSuplLocationId_block_invoke", 1302);
          LbsOsaTrace_WriteLog(0x18u, __str, v12, 0, 1);
        }
        result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
        if ((_DWORD)result)
        {
          bzero(__str, 0x410uLL);
          v14 = mach_continuous_time();
          v15 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 68, "setSuplLocationId_block_invoke");
          return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v15, 5, 1);
        }
        return result;
      }
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
    goto LABEL_15;
  }
  v4 = v0 + 40;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v158, v0 + 40);
  __str[0] = 0;
  v151 = 0;
  memset_s(v152, 0x1840uLL, 0, 0x1840uLL);
  __str[0] = 0;
  HIDWORD(v151) = 2;
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
  {
    bzero(v162, 0x410uLL);
    v5 = mach_continuous_time();
    v6 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: LocId type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 68, "setSuplLocationId_block_invoke", *(_DWORD *)(v0 + 72));
    LbsOsaTrace_WriteLog(0x18u, v162, v6, 5, 1);
  }
  switch(*(_DWORD *)(v0 + 72))
  {
    case 0:
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v138, v0 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 4, (uint64_t)v138, (uint64_t)"setSuplLocationId_block_invoke");
      v7 = v139;
      if (v139 == v138)
      {
        v8 = 4;
        v7 = v138;
      }
      else
      {
        if (!v139)
          goto LABEL_96;
        v8 = 5;
      }
      (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_96:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v69 = mach_continuous_time();
        v70 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx CellType\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v69), "ADP", 69, "setSuplLocationId_block_invoke", 770);
        LbsOsaTrace_WriteLog(0x18u, v162, v70, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v71 = mach_continuous_time();
        v72 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v71), "ADP", 68, "setSuplLocationId_block_invoke");
        LbsOsaTrace_WriteLog(0x18u, v162, v72, 5, 1);
      }
      goto LABEL_191;
    case 1:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v27 = mach_continuous_time();
        v28 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 68, "Ga11_12FillGsmCellInfo");
        LbsOsaTrace_WriteLog(0x18u, v162, v28, 5, 1);
      }
      memset(v152, 255, sizeof(v152));
      v29 = *(_QWORD *)(v0 + 104);
      v30 = *(_QWORD *)(v0 + 112) - v29;
      if (v30)
      {
        v31 = v30 >> 4;
        if (v31 <= 1)
          v31 = 1;
        v32 = v29 + 4;
        while (!*(_BYTE *)(v32 - 4))
        {
          v32 += 16;
          if (!--v31)
            goto LABEL_115;
        }
        BYTE2(v153) = 0;
        LOWORD(v153) = -1;
        v152[0] = *(_DWORD *)(v32 - 2);
        *(_QWORD *)&v152[1] = *(_QWORD *)(v32 + 4);
      }
LABEL_115:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
      {
        bzero(v162, 0x410uLL);
        v81 = mach_continuous_time();
        v82 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: GSM Serving,%u,%u,%u,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v81), "ADP", 68, "Ga11_12FillGsmCellInfo", LOWORD(v152[0]), HIWORD(v152[0]), v152[1], v152[2]);
        LbsOsaTrace_WriteLog(0x18u, v162, v82, 5, 1);
      }
      if (LOWORD(v152[0]) <= 0x3E7u && HIWORD(v152[0]) <= 0x3E7u && !HIWORD(v152[1]) && v152[2] < 0x10000u)
      {
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
        {
          bzero(v162, 0x410uLL);
          v83 = mach_continuous_time();
          v84 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v83), "ADP", 68, "Ga11_12FillGsmCellInfo");
          LbsOsaTrace_WriteLog(0x18u, v162, v84, 5, 1);
        }
        v58 = 1;
        goto LABEL_159;
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v85 = mach_continuous_time();
        v86 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx GSM Serving Cell Info\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v85), "ADP", 69, "Ga11_12FillGsmCellInfo", 772);
        LbsOsaTrace_WriteLog(0x18u, v162, v86, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v87 = mach_continuous_time();
        v88 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v87), "ADP", 68, "Ga11_12FillGsmCellInfo");
        LbsOsaTrace_WriteLog(0x18u, v162, v88, 5, 1);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v148, v0 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 4, (uint64_t)v148, (uint64_t)"setSuplLocationId_block_invoke");
      v89 = v149;
      if (v149 == v148)
      {
        v90 = 4;
        v89 = v148;
      }
      else
      {
        if (!v149)
          goto LABEL_133;
        v90 = 5;
      }
      (*(void (**)(void))(*v89 + 8 * v90))();
LABEL_133:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v91 = mach_continuous_time();
        v92 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx CellInfo\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v91), "ADP", 69, "setSuplLocationId_block_invoke", 770);
        LbsOsaTrace_WriteLog(0x18u, v162, v92, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v93 = mach_continuous_time();
        v94 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v93), "ADP", 68, "setSuplLocationId_block_invoke");
        LbsOsaTrace_WriteLog(0x18u, v162, v94, 5, 1);
      }
      goto LABEL_191;
    case 2:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v16 = mach_continuous_time();
        v17 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "Ga11_13FillWCDMACellInfo");
        LbsOsaTrace_WriteLog(0x18u, v162, v17, 5, 1);
      }
      memset(v152, 255, sizeof(v152));
      v18 = *(_QWORD *)(v0 + 128);
      v19 = *(_QWORD *)(v0 + 136) - v18;
      if (v19)
      {
        v20 = v19 >> 5;
        if (v20 <= 1)
          v20 = 1;
        v21 = 16;
        while (1)
        {
          v22 = (unsigned __int16 *)(v18 + v21);
          if (*(_BYTE *)(v18 + v21 - 16))
            break;
          v21 += 32;
          if (!--v20)
            goto LABEL_150;
        }
        v152[0] = *(_DWORD *)(v22 - 7);
        *(_QWORD *)&v152[1] = *((_QWORD *)v22 - 1);
        v154 = -1;
        if (*v22 > 0x1FFu)
        {
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
          {
            bzero(v162, 0x410uLL);
            v99 = mach_continuous_time();
            v100 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Invalid PSC,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v99), "ADP", 68, "Ga11_13FillWCDMACellInfo", *(unsigned __int16 *)(*(_QWORD *)(v0 + 128) + v21));
            LbsOsaTrace_WriteLog(0x18u, v162, v100, 5, 1);
          }
        }
        else
        {
          v154 = *v22;
        }
        v153 = -1;
        v101 = *(_QWORD *)(v0 + 128) + v21;
        if (*(_DWORD *)(v101 + 8) != 1 || (v102 = *(_DWORD *)(v101 + 12), v102 >> 14))
        {
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
          {
            bzero(v162, 0x410uLL);
            v103 = mach_continuous_time();
            v104 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Invalid,%u DlArfcn\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v103), "ADP", 68, "Ga11_13FillWCDMACellInfo", *(_DWORD *)(*(_QWORD *)(v0 + 128) + v21 + 12));
            LbsOsaTrace_WriteLog(0x18u, v162, v104, 5, 1);
          }
        }
        else
        {
          LOWORD(v153) = v102;
        }
      }
LABEL_150:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
      {
        bzero(v162, 0x410uLL);
        v105 = mach_continuous_time();
        v106 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: WCDMA Serving,%u,%u,%u,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v105), "ADP", 68, "Ga11_13FillWCDMACellInfo", LOWORD(v152[0]), HIWORD(v152[0]), v152[1], v152[2]);
        LbsOsaTrace_WriteLog(0x18u, v162, v106, 5, 1);
      }
      if (LOWORD(v152[0]) <= 0x3E7u && HIWORD(v152[0]) <= 0x3E7u && !HIWORD(v152[1]) && !(v152[2] >> 28))
      {
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
        {
          bzero(v162, 0x410uLL);
          v107 = mach_continuous_time();
          v108 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v107), "ADP", 68, "Ga11_13FillWCDMACellInfo");
          LbsOsaTrace_WriteLog(0x18u, v162, v108, 5, 1);
        }
        v58 = 2;
        goto LABEL_159;
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v119 = mach_continuous_time();
        v120 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx WCDMA Serving Cell Info\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v119), "ADP", 69, "Ga11_13FillWCDMACellInfo", 772);
        LbsOsaTrace_WriteLog(0x18u, v162, v120, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v121 = mach_continuous_time();
        v122 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v121), "ADP", 68, "Ga11_13FillWCDMACellInfo");
        LbsOsaTrace_WriteLog(0x18u, v162, v122, 5, 1);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v146, v0 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 4, (uint64_t)v146, (uint64_t)"setSuplLocationId_block_invoke");
      v123 = v147;
      if (v147 == v146)
      {
        v124 = 4;
        v123 = v146;
      }
      else
      {
        if (!v147)
          goto LABEL_187;
        v124 = 5;
      }
      (*(void (**)(void))(*v123 + 8 * v124))();
LABEL_187:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v129 = mach_continuous_time();
        v130 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx WCDMA CellInfo\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v129), "ADP", 69, "setSuplLocationId_block_invoke", 770);
        LbsOsaTrace_WriteLog(0x18u, v162, v130, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v131 = mach_continuous_time();
        v132 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v131), "ADP", 68, "setSuplLocationId_block_invoke");
        LbsOsaTrace_WriteLog(0x18u, v162, v132, 5, 1);
      }
      goto LABEL_191;
    case 3:
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v142, v0 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 4, (uint64_t)v142, (uint64_t)"setSuplLocationId_block_invoke");
      v33 = v143;
      if (v143 == v142)
      {
        v34 = 4;
        v33 = v142;
      }
      else
      {
        if (!v143)
          goto LABEL_108;
        v34 = 5;
      }
      (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_108:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v77 = mach_continuous_time();
        v78 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx CDMA CellInfo\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v77), "ADP", 69, "setSuplLocationId_block_invoke", 770);
        LbsOsaTrace_WriteLog(0x18u, v162, v78, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v79 = mach_continuous_time();
        v80 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v79), "ADP", 68, "setSuplLocationId_block_invoke");
        LbsOsaTrace_WriteLog(0x18u, v162, v80, 5, 1);
      }
      goto LABEL_191;
    case 4:
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v140, v0 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 4, (uint64_t)v140, (uint64_t)"setSuplLocationId_block_invoke");
      v23 = v141;
      if (v141 == v140)
      {
        v24 = 4;
        v23 = v140;
      }
      else
      {
        if (!v141)
          goto LABEL_90;
        v24 = 5;
      }
      (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_90:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v65 = mach_continuous_time();
        v66 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx HRPD CellInfo\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v65), "ADP", 69, "setSuplLocationId_block_invoke", 770);
        LbsOsaTrace_WriteLog(0x18u, v162, v66, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v67 = mach_continuous_time();
        v68 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v67), "ADP", 68, "setSuplLocationId_block_invoke");
        LbsOsaTrace_WriteLog(0x18u, v162, v68, 5, 1);
      }
      goto LABEL_191;
    case 5:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v35 = mach_continuous_time();
        v36 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v35), "ADP", 68, "Ga11_14FillLTECellInfo");
        LbsOsaTrace_WriteLog(0x18u, v162, v36, 5, 1);
      }
      v153 = -1;
      *(_QWORD *)((char *)v152 + 2) = -1;
      v37 = *(_QWORD *)(v0 + 80);
      if (*(_QWORD *)(v0 + 88) != v37)
      {
        v38 = 0;
        v39 = 24;
        do
        {
          v40 = v37 + v39;
          if (*(_BYTE *)(v37 + v39 - 24))
          {
            v152[0] = *(_DWORD *)(v40 - 22);
            v152[1] = *(_DWORD *)(v40 - 12);
            LOWORD(v152[2]) = *(_WORD *)(v40 - 8);
            v153 = *(_DWORD *)(v40 - 16);
            LOBYTE(v154) = -1;
            if (*(unsigned __int8 *)(v40 - 6) > 0x61u)
            {
              if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
              {
                bzero(v162, 0x410uLL);
                v46 = mach_continuous_time();
                v47 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Invalid Rsrp,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v46), "ADP", 68, "Ga11_14FillLTECellInfo", *(unsigned __int8 *)(*(_QWORD *)(v0 + 80) + v39 - 6));
                LbsOsaTrace_WriteLog(0x18u, v162, v47, 5, 1);
              }
            }
            else
            {
              LOBYTE(v154) = *(_BYTE *)(v40 - 6);
            }
            HIBYTE(v154) = -1;
            if (*(unsigned __int8 *)(*(_QWORD *)(v0 + 80) + v39 - 5) > 0x22u)
            {
              if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
              {
                bzero(v162, 0x410uLL);
                v48 = mach_continuous_time();
                v49 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Invalid Rsrq,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v48), "ADP", 68, "Ga11_14FillLTECellInfo", *(unsigned __int8 *)(*(_QWORD *)(v0 + 80) + v39 - 5));
                LbsOsaTrace_WriteLog(0x18u, v162, v49, 5, 1);
              }
            }
            else
            {
              HIBYTE(v154) = *(_BYTE *)(*(_QWORD *)(v0 + 80) + v39 - 5);
            }
            v155 = -1;
            if (*(int *)(*(_QWORD *)(v0 + 80) + v39 - 4) > 1282)
            {
              if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
              {
                bzero(v162, 0x410uLL);
                v50 = mach_continuous_time();
                v51 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Invalid TA,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v50), "ADP", 68, "Ga11_14FillLTECellInfo", *(_DWORD *)(*(_QWORD *)(v0 + 80) + v39 - 4));
                LbsOsaTrace_WriteLog(0x18u, v162, v51, 5, 1);
              }
            }
            else
            {
              v155 = *(_DWORD *)(*(_QWORD *)(v0 + 80) + v39 - 4);
            }
          }
          else if (v156 <= 7uLL)
          {
            v41 = (_DWORD *)(v37 + v39);
            v42 = &v152[5 * v156];
            v42[7] = *(_DWORD *)((char *)v41 - 22);
            *((_QWORD *)v42 + 4) = *(_QWORD *)(v41 - 3);
            v42[10] = *(v41 - 4);
            v42[11] = *v41;
            if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1))
            {
              bzero(v162, 0x410uLL);
              v43 = mach_continuous_time();
              v44 = (_DWORD *)(*(_QWORD *)(v0 + 80) + v39);
              v45 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: LTE neighbor,%zd,MCC %u,MNC %u,CI %u,PCI %u,RSRP %u,RSRQ %u,TAC %u,DLFREQ %u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v43), "ADP", 68, "Ga11_14FillLTECellInfo", v38, *((unsigned __int16 *)v44 - 11), *((unsigned __int16 *)v44 - 10), *(v44 - 3), *((unsigned __int16 *)v44 - 4), *((unsigned __int8 *)v44 - 6), *((unsigned __int8 *)v44 - 5), *(v44 - 4), *v44);
              LbsOsaTrace_WriteLog(0x18u, v162, v45, 5, 1);
            }
            if (LOWORD(v157[5 * v156]) <= 0x1F7u)
              ++v156;
          }
          ++v38;
          v37 = *(_QWORD *)(v0 + 80);
          v39 += 28;
        }
        while (v38 < 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(v0 + 88) - v37) >> 2));
      }
      v4 = v0 + 40;
      if ((LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 1) & 1) != 0)
      {
        bzero(v162, 0x410uLL);
        v52 = mach_continuous_time();
        v53 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: LTE Serving,%u,%u,%u,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v52), "ADP", 68, "Ga11_14FillLTECellInfo", HIWORD(v152[0]), v152[1], LOWORD(v152[2]), v153);
        LbsOsaTrace_WriteLog(0x18u, v162, v53, 5, 1);
      }
      if (LOWORD(v152[0]) >= 0x3E8u && LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v54 = mach_continuous_time();
        v55 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx LTE MCC, %u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v54), "ADP", 87, "Ga11_14FillLTECellInfo", 770, LOWORD(v152[0]));
        LbsOsaTrace_WriteLog(0x18u, v162, v55, 2, 1);
      }
      if (HIWORD(v152[0]) <= 0x3E7u && !(v152[1] >> 28) && LOWORD(v152[2]) <= 0x1F7u && v153 < 0x10000)
      {
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
        {
          bzero(v162, 0x410uLL);
          v56 = mach_continuous_time();
          v57 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v56), "ADP", 68, "Ga11_14FillLTECellInfo");
          LbsOsaTrace_WriteLog(0x18u, v162, v57, 5, 1);
        }
        v58 = 4;
LABEL_159:
        LODWORD(v151) = v58;
        std::function<void ()(gnss::Result)>::operator=((_QWORD *)(v1 + 504), v4);
        v109 = GNS_CellInfo(__str, 0);
        if (v109 == 1)
        {
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
          {
            bzero(v162, 0x410uLL);
            v110 = mach_continuous_time();
            v111 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: CellInfo success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v110), "ADP", 73, "setSuplLocationId_block_invoke");
            LbsOsaTrace_WriteLog(0x18u, v162, v111, 4, 1);
          }
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
          {
            bzero(v162, 0x410uLL);
            v112 = mach_continuous_time();
            v113 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v112), "ADP", 68, "setSuplLocationId_block_invoke");
            LbsOsaTrace_WriteLog(0x18u, v162, v113, 5, 1);
          }
          goto LABEL_191;
        }
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        {
          bzero(v162, 0x410uLL);
          v114 = mach_continuous_time();
          v115 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx CellInfo,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v114), "ADP", 69, "setSuplLocationId_block_invoke", 770, v109);
          LbsOsaTrace_WriteLog(0x18u, v162, v115, 0, 1);
        }
        v116 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v1, v109);
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v134, v4);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, v116, (uint64_t)v134, (uint64_t)"setSuplLocationId_block_invoke");
        v117 = v135;
        if (v135 == v134)
        {
          v118 = 4;
          v117 = v134;
        }
        else
        {
          if (!v135)
            goto LABEL_178;
          v118 = 5;
        }
        (*(void (**)(void))(*v117 + 8 * v118))();
LABEL_178:
        v125 = *(_QWORD **)(v1 + 528);
        *(_QWORD *)(v1 + 528) = 0;
        if (v125 == (_QWORD *)(v1 + 504))
        {
          v126 = 4;
          v125 = (_QWORD *)(v1 + 504);
        }
        else
        {
          if (!v125)
            goto LABEL_183;
          v126 = 5;
        }
        (*(void (**)(void))(*v125 + 8 * v126))();
LABEL_183:
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
        {
          bzero(v162, 0x410uLL);
          v127 = mach_continuous_time();
          v128 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v127), "ADP", 68, "setSuplLocationId_block_invoke");
          LbsOsaTrace_WriteLog(0x18u, v162, v128, 5, 1);
        }
        goto LABEL_191;
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v59 = mach_continuous_time();
        v60 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx LTE Serving Cell Info\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v59), "ADP", 69, "Ga11_14FillLTECellInfo", 772);
        LbsOsaTrace_WriteLog(0x18u, v162, v60, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v61 = mach_continuous_time();
        v62 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v61), "ADP", 68, "Ga11_14FillLTECellInfo");
        LbsOsaTrace_WriteLog(0x18u, v162, v62, 5, 1);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v144, v0 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 4, (uint64_t)v144, (uint64_t)"setSuplLocationId_block_invoke");
      v63 = v145;
      if (v145 == v144)
      {
        v64 = 4;
        v63 = v144;
      }
      else
      {
        if (!v145)
          goto LABEL_139;
        v64 = 5;
      }
      (*(void (**)(void))(*v63 + 8 * v64))();
LABEL_139:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v95 = mach_continuous_time();
        v96 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx LTE CellInfo\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v95), "ADP", 69, "setSuplLocationId_block_invoke", 770);
        LbsOsaTrace_WriteLog(0x18u, v162, v96, 0, 1);
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(v162, 0x410uLL);
        v97 = mach_continuous_time();
        v98 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v97), "ADP", 68, "setSuplLocationId_block_invoke");
        LbsOsaTrace_WriteLog(0x18u, v162, v98, 5, 1);
      }
LABEL_191:
      result = v159;
      if (v159 == v158)
      {
        v133 = 4;
        result = v158;
      }
      else
      {
        if (!v159)
          return result;
        v133 = 5;
      }
      return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v133))();
    default:
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v136, v0 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 4, (uint64_t)v136, (uint64_t)"setSuplLocationId_block_invoke");
      v25 = v137;
      if (v137 == v136)
      {
        v26 = 4;
        v25 = v136;
      }
      else
      {
        if (!v137)
        {
LABEL_102:
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
          {
            bzero(v162, 0x410uLL);
            v73 = mach_continuous_time();
            v74 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: #%04hx cellType is not specified in Emergency::Supl::CellType\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v73), "ADP", 69, "setSuplLocationId_block_invoke", 770);
            LbsOsaTrace_WriteLog(0x18u, v162, v74, 0, 1);
          }
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
          {
            bzero(v162, 0x410uLL);
            v75 = mach_continuous_time();
            v76 = snprintf(v162, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v75), "ADP", 68, "setSuplLocationId_block_invoke");
            LbsOsaTrace_WriteLog(0x18u, v162, v76, 5, 1);
          }
          goto LABEL_191;
        }
        v26 = 5;
      }
      (*(void (**)(void))(*v25 + 8 * v26))();
      goto LABEL_102;
  }
}

@end
