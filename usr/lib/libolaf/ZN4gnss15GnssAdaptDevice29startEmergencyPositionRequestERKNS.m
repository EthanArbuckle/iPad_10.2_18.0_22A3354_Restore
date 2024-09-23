@implementation ZN4gnss15GnssAdaptDevice29startEmergencyPositionRequestERKNS

_QWORD *___ZN4gnss15GnssAdaptDevice29startEmergencyPositionRequestERKNS_9Emergency6Cplane15PositionRequestERKNS2_7ContextENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 v9;
  uint64_t v10;
  unsigned __int16 v11;
  _QWORD *v12;
  uint64_t v13;
  gnss::GnssAdaptDevice *IsLoggingAllowed;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 v20;
  uint64_t v21;
  unsigned __int16 v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int16 v35;
  uint64_t v36;
  unsigned __int16 v37;
  int v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int16 v42;
  uint64_t v43;
  unsigned __int16 v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int16 v50;
  uint64_t v51;
  unsigned __int16 v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int16 v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int16 v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  unsigned __int16 v66;
  void *HalExtensions;
  uint64_t v68;
  unsigned __int16 v69;
  gnss::GnssAdaptDevice *v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  unsigned __int16 v74;
  int v75;
  uint64_t v76;
  unsigned __int16 v77;
  uint64_t v78;
  unsigned __int16 v79;
  uint64_t v80;
  unsigned __int16 v81;
  uint64_t v82;
  unsigned __int16 v83;
  gnss::GnssAdaptDevice *v84;
  uint64_t v85;
  unsigned __int16 v86;
  uint64_t v87;
  unsigned __int16 v88;
  uint64_t v89;
  unsigned __int16 v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  unsigned __int16 v94;
  uint64_t v95;
  unsigned __int16 v96;
  uint64_t v97;
  unsigned __int16 v98;
  uint64_t v99;
  unsigned __int16 v100;
  uint64_t v101;
  unsigned __int16 v102;
  uint64_t v103;
  unsigned __int16 v104;
  int v105;
  int v106;
  char v107;
  double v108;
  uint64_t v109;
  unsigned __int16 v110;
  int v111;
  char *v112;
  uint64_t **v113;
  uint64_t v114;
  unsigned int v115;
  uint64_t v116;
  unsigned __int16 v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  unsigned __int16 v136;
  int v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unsigned int v143;
  uint64_t v144;
  unsigned int v145;
  BOOL v146;
  uint64_t *v147;
  uint64_t v148;
  unsigned __int16 v149;
  int *v150;
  uint64_t v151;
  int v152;
  NSObject *v153;
  _QWORD *v154;
  uint64_t v155;
  uint64_t v156;
  unsigned __int16 v157;
  uint64_t v158;
  _QWORD *v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  _QWORD *result;
  uint64_t v164;
  _BYTE v165[24];
  _BYTE *v166;
  _OWORD v167[65];
  _QWORD block[4];
  _BYTE v169[24];
  _BYTE *v170;
  _BYTE v171[1400];
  char __str[1400];
  _BYTE v173[24];
  _BYTE *v174;
  _BYTE v175[24];
  _BYTE *v176;
  _BYTE v177[24];
  _BYTE *v178;
  _BYTE v179[24];
  _BYTE *v180;
  _BYTE v181[24];
  _BYTE *v182;
  _BYTE v183[24];
  _BYTE *v184;
  _BYTE v185[24];
  _BYTE *v186;
  _BYTE v187[24];
  _BYTE *v188;
  _BYTE v189[24];
  _BYTE *v190;
  _BYTE v191[24];
  _BYTE *v192;
  _BYTE v193[24];
  _BYTE *v194;
  _BYTE v195[24];
  _BYTE *v196;
  _BYTE v197[24];
  _BYTE *v198;
  _BYTE v199[24];
  _BYTE *v200;
  _BYTE v201[24];
  _BYTE *v202;
  _QWORD v203[3];
  _QWORD *v204;
  _BYTE v205[24];
  _BYTE *v206;
  uint64_t v207;

  v6 = MEMORY[0x24BDAC7A8](a1, a2, a3, a4, a5, a6);
  v207 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(v6 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v8 = mach_continuous_time();
    v9 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 68, "startEmergencyPositionRequest_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, __str, v9, 5, 1);
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v205, v7 + 760);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v203, v7 + 824);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v201, v7 + 856);
  if (*(_BYTE *)(v7 + 89) && LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v10 = mach_continuous_time();
    v11 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx PVTM req active\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 87, "startEmergencyPositionRequest_block_invoke", 2056);
    LbsOsaTrace_WriteLog(0x18u, __str, v11, 2, 1);
  }
  if (!v206 && *(_DWORD *)(v6 + 100) == 1)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v199, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 7, (uint64_t)v199, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v12 = v200;
    if (v200 == v199)
    {
      v13 = 4;
      v12 = v199;
    }
    else
    {
      if (!v200)
        goto LABEL_61;
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_61:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v36 = mach_continuous_time();
      v37 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx PosnReportCb\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v37, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
    {
LABEL_183:
      bzero(__str, 0x410uLL);
      v89 = mach_continuous_time();
      v90 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v89), "ADP", 68, "startEmergencyPositionRequest_block_invoke");
      LbsOsaTrace_WriteLog(0x18u, __str, v90, 5, 1);
      goto LABEL_293;
    }
    goto LABEL_293;
  }
  IsLoggingAllowed = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0);
  if ((_DWORD)IsLoggingAllowed)
  {
    bzero(__str, 0x410uLL);
    v15 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
    if (*(_BYTE *)(v6 + 91))
      v16 = 84;
    else
      v16 = 70;
    if (*(_BYTE *)(v6 + 90))
      v17 = 84;
    else
      v17 = 70;
    if (*(_BYTE *)(v6 + 89))
      v18 = 84;
    else
      v18 = 70;
    if (*(_BYTE *)(v6 + 88))
      v19 = 84;
    else
      v19 = 70;
    v20 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: include1xMsb,%c,optimizeGnssMeasWith1xMsb,%c,optimizeAfltMeasWith1xMsb,%c,useCdmaTimeForMeas,%c\n", (unint64_t)v15, "ADP", 73, "startEmergencyPositionRequest_block_invoke", v19, v18, v17, v16);
    IsLoggingAllowed = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v20, 4, 1);
  }
  if (!v204 && !*(_DWORD *)(v6 + 100) && !*(_BYTE *)(v6 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v197, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 7, (uint64_t)v197, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v45 = v198;
    if (v198 == v197)
    {
      v46 = 4;
      v45 = v197;
    }
    else
    {
      if (!v198)
        goto LABEL_108;
      v46 = 5;
    }
    (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_108:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v55 = mach_continuous_time();
      v56 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx MeasReportCb\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v55), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v56, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (!v202 && !*(_DWORD *)(v6 + 100) && *(_BYTE *)(v6 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v195, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 7, (uint64_t)v195, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v32 = v196;
    if (v196 == v195)
    {
      v33 = 4;
      v32 = v195;
    }
    else
    {
      if (!v196)
        goto LABEL_99;
      v33 = 5;
    }
    (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_99:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v51 = mach_continuous_time();
      v52 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx MeasRepwithEstimate\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v51), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v52, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (!*(_BYTE *)(v7 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v193, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 7, (uint64_t)v193, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v26 = v194;
    if (v194 == v193)
    {
      v27 = 4;
      v26 = v193;
    }
    else
    {
      if (!v194)
        goto LABEL_55;
      v27 = 5;
    }
    (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_55:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v34 = mach_continuous_time();
      v35 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v34), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 1302);
      LbsOsaTrace_WriteLog(0x18u, __str, v35, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (*(_WORD *)(v6 + 96))
  {
    IsLoggingAllowed = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0);
    if ((_DWORD)IsLoggingAllowed)
    {
      bzero(__str, 0x410uLL);
      v21 = mach_continuous_time();
      v22 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Periodic Sessions\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 87, "startEmergencyPositionRequest_block_invoke", 515);
      IsLoggingAllowed = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v22, 2, 1);
    }
  }
  v23 = *(_DWORD *)(v6 + 100);
  if (v23 == -1)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v191, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v191, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v28 = v192;
    if (v192 == v191)
    {
      v29 = 4;
      v28 = v191;
    }
    else
    {
      if (!v192)
        goto LABEL_75;
      v29 = 5;
    }
    (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_75:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v41 = mach_continuous_time();
      v42 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Methodtype\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v41), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 515);
      LbsOsaTrace_WriteLog(0x18u, __str, v42, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (*(unsigned __int16 *)(v6 + 104) - 1 >= 0x80)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v189, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v189, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v30 = v190;
    if (v190 == v189)
    {
      v31 = 4;
      v30 = v189;
    }
    else
    {
      if (!v190)
        goto LABEL_81;
      v31 = 5;
    }
    (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_81:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v43 = mach_continuous_time();
      v44 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx RespTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v43), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 514, *(unsigned __int16 *)(v6 + 104));
      LbsOsaTrace_WriteLog(0x18u, __str, v44, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if ((*(_WORD *)(v6 + 124) & 1) == 0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v187, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v187, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v24 = v188;
    if (v188 == v187)
    {
      v25 = 4;
      v24 = v187;
    }
    else
    {
      if (!v188)
        goto LABEL_93;
      v25 = 5;
    }
    (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_93:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v49 = mach_continuous_time();
      v50 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Id should be GPS only\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v49), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 515);
      LbsOsaTrace_WriteLog(0x18u, __str, v50, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  v38 = *(_DWORD *)(v6 + 132);
  if (v38 == -1)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v185, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v185, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v47 = v186;
    if (v186 == v185)
    {
      v48 = 4;
      v47 = v185;
    }
    else
    {
      if (!v186)
        goto LABEL_118;
      v48 = 5;
    }
    (*(void (**)(void))(*v47 + 8 * v48))();
LABEL_118:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v59 = mach_continuous_time();
      v60 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Pos Protocol\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v59), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 515);
      LbsOsaTrace_WriteLog(0x18u, __str, v60, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (*(char *)(v6 + 106) < 0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v183, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v183, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v53 = v184;
    if (v184 == v183)
    {
      v54 = 4;
      v53 = v183;
    }
    else
    {
      if (!v184)
        goto LABEL_132;
      v54 = 5;
    }
    (*(void (**)(void))(*v53 + 8 * v54))();
LABEL_132:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v65 = mach_continuous_time();
      v66 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx HAcc\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v65), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 514);
      LbsOsaTrace_WriteLog(0x18u, __str, v66, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (!*(_DWORD *)(v6 + 116))
    goto LABEL_112;
  if (*(char *)(v6 + 113) < 0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v181, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v181, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v63 = v182;
    if (v182 == v181)
    {
      v64 = 4;
      v63 = v181;
    }
    else
    {
      if (!v182)
        goto LABEL_161;
      v64 = 5;
    }
    (*(void (**)(void))(*v63 + 8 * v64))();
LABEL_161:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v78 = mach_continuous_time();
      v79 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx VAcc\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v78), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 514);
      LbsOsaTrace_WriteLog(0x18u, __str, v79, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (*(unsigned __int8 *)(v6 + 114) >= 0x65u)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v179, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v179, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v39 = v180;
    if (v180 == v179)
    {
      v40 = 4;
      v39 = v179;
    }
    else
    {
      if (!v180)
        goto LABEL_167;
      v40 = 5;
    }
    (*(void (**)(void))(*v39 + 8 * v40))();
LABEL_167:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v80 = mach_continuous_time();
      v81 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx VConf\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v80), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 514);
      LbsOsaTrace_WriteLog(0x18u, __str, v81, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
LABEL_112:
  if (*(unsigned __int8 *)(v6 + 112) >= 0x65u)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v177, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v177, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v57 = v178;
    if (v178 == v177)
    {
      v58 = 4;
      v57 = v177;
    }
    else
    {
      if (!v178)
        goto LABEL_155;
      v58 = 5;
    }
    (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_155:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v76 = mach_continuous_time();
      v77 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx HConf\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v76), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 514);
      LbsOsaTrace_WriteLog(0x18u, __str, v77, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (*(_BYTE *)(v6 + 126) && (*(_BYTE *)(v6 + 126) & 0xB7) == 0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v175, v6 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 4, (uint64_t)v175, (uint64_t)"startEmergencyPositionRequest_block_invoke");
    v61 = v176;
    if (v176 == v175)
    {
      v62 = 4;
      v61 = v175;
    }
    else
    {
      if (!v176)
        goto LABEL_180;
      v62 = 5;
    }
    (*(void (**)(void))(*v61 + 8 * v62))();
LABEL_180:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v87 = mach_continuous_time();
      v88 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx ShapeType Not Supported, %u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v87), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 515, *(unsigned __int8 *)(v6 + 126));
      LbsOsaTrace_WriteLog(0x18u, __str, v88, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      goto LABEL_183;
    goto LABEL_293;
  }
  if (v38 == 3)
  {
    HalExtensions = gnss::GnssAdaptDevice::getHalExtensions((gnss::GnssAdaptDevice *)v7);
    *(double *)(v7 + 112) = (*(double (**)(void *))(*(_QWORD *)HalExtensions + 104))(HalExtensions);
    IsLoggingAllowed = (gnss::GnssAdaptDevice *)gnss::GnssAdaptDevice::Ga10_07FTAssistanceRequest((gnss::GnssAdaptDevice *)v7);
    v23 = *(_DWORD *)(v6 + 100);
  }
  if (v23 || *(_DWORD *)(v6 + 132) == 3)
  {
    if (!gnss::GnssAdaptDevice::Ga10_11SetGuardTimeOut(IsLoggingAllowed)
      && LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v68 = mach_continuous_time();
      v69 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SetGuardTimeOut\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v68), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 257);
      LbsOsaTrace_WriteLog(0x18u, __str, v69, 0, 1);
    }
    v70 = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0);
    if ((_DWORD)v70)
    {
      bzero(__str, 0x410uLL);
      v71 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
      if (*(_BYTE *)(v6 + 72))
        v72 = 84;
      else
        v72 = 70;
      if (*(_BYTE *)(v6 + 73))
        v73 = 84;
      else
        v73 = 70;
      v74 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: EarlyReturn,%c,HeloEnabled,%c\n", (unint64_t)v71, "ADP", 73, "startEmergencyPositionRequest_block_invoke", v73, v72);
      v70 = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v74, 4, 1);
    }
    v75 = *(_DWORD *)(v6 + 132) != 3 && *(_BYTE *)(v6 + 73) != 0;
    if (!gnss::GnssAdaptDevice::Ga10_12SetEarlyReturn(v70, v75)
      && LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v82 = mach_continuous_time();
      v83 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SetEarlyReturn\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v82), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 257);
      LbsOsaTrace_WriteLog(0x18u, __str, v83, 0, 1);
    }
    *(_QWORD *)&v167[0] = 0xFFFFFFFF00000000;
    memset((char *)v167 + 12, 0, 27);
    *(_DWORD *)((char *)v167 + 6) = -1;
    switch(*(_DWORD *)(v6 + 100))
    {
      case 0xFFFFFFFF:
        v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0);
        if ((_DWORD)v84)
        {
          bzero(__str, 0x410uLL);
          v85 = mach_continuous_time();
          v86 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SessionType\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v85), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 262);
          v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v86, 0, 1);
        }
        break;
      case 0:
        LODWORD(v167[0]) = 1;
        if (*(_DWORD *)(v6 + 132) == 3)
          BYTE6(v167[2]) = *(_BYTE *)(v6 + 91);
        v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0);
        if ((_DWORD)v84)
        {
          bzero(__str, 0x410uLL);
          v95 = mach_continuous_time();
          v96 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: MSA e911 Session\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v95), "ADP", 73, "startEmergencyPositionRequest_block_invoke");
          v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v96, 4, 1);
        }
        break;
      case 1:
        LODWORD(v167[0]) = 2;
        v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0);
        if ((_DWORD)v84)
        {
          bzero(__str, 0x410uLL);
          v97 = mach_continuous_time();
          v98 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: MSB e911 Session\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v97), "ADP", 73, "startEmergencyPositionRequest_block_invoke");
          v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v98, 4, 1);
        }
        break;
      case 2:
        LODWORD(v167[0]) = 3;
        v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0);
        if ((_DWORD)v84)
        {
          bzero(__str, 0x410uLL);
          v99 = mach_continuous_time();
          v100 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Standalone e911 Session\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v99), "ADP", 73, "startEmergencyPositionRequest_block_invoke");
          v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v100, 4, 1);
        }
        break;
      default:
        v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0);
        if ((_DWORD)v84)
        {
          bzero(__str, 0x410uLL);
          v93 = mach_continuous_time();
          v94 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Method Type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v93), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 515, *(_DWORD *)(v6 + 100));
          v84 = (gnss::GnssAdaptDevice *)LbsOsaTrace_WriteLog(0x18u, __str, v94, 0, 1);
        }
        break;
    }
    if (*(_BYTE *)(v6 + 106))
      BYTE6(v167[0]) = *(_BYTE *)(v6 + 106);
    if (*(_BYTE *)(v6 + 112))
      BYTE7(v167[0]) = *(_BYTE *)(v6 + 112);
    if (*(_DWORD *)(v6 + 116))
    {
      if (*(_BYTE *)(v6 + 113))
        BYTE8(v167[0]) = *(_BYTE *)(v6 + 113);
      if (*(_BYTE *)(v6 + 114))
        BYTE9(v167[0]) = *(_BYTE *)(v6 + 114);
    }
    if (!gnss::GnssAdaptDevice::Ga10_30SetTargetE911VertAccM(v84, *(double *)(v6 + 80))
      && LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v101 = mach_continuous_time();
      v102 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SetTargetE911VertAccM\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v101), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 257);
      LbsOsaTrace_WriteLog(0x18u, __str, v102, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v103 = mach_continuous_time();
      v104 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: HAcc,%u,VAcc,%u,HConf,%u,VConf,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v103), "ADP", 73, "startEmergencyPositionRequest_block_invoke", BYTE6(v167[0]), BYTE8(v167[0]), BYTE7(v167[0]), BYTE9(v167[0]));
      LbsOsaTrace_WriteLog(0x18u, __str, v104, 4, 1);
    }
    if (*(_DWORD *)(v6 + 108) == 1)
    {
      v105 = *(unsigned __int8 *)(v6 + 127);
      if (*(_BYTE *)(v6 + 127))
      {
        if ((v105 & 0xF) == 0)
          goto LABEL_217;
        v106 = HIDWORD(v167[1]) | v105;
      }
      else
      {
        v106 = 8;
      }
      HIDWORD(v167[1]) = v106;
    }
LABEL_217:
    v107 = *(_BYTE *)(v6 + 126);
    if ((v107 & 1) != 0)
    {
      LODWORD(v167[2]) |= 1u;
      if ((v107 & 2) == 0)
      {
LABEL_219:
        if ((v107 & 4) == 0)
          goto LABEL_220;
        goto LABEL_235;
      }
    }
    else if ((*(_BYTE *)(v6 + 126) & 2) == 0)
    {
      goto LABEL_219;
    }
    LODWORD(v167[2]) |= 2u;
    if ((v107 & 4) == 0)
    {
LABEL_220:
      if ((v107 & 0x10) == 0)
        goto LABEL_221;
      goto LABEL_236;
    }
LABEL_235:
    LODWORD(v167[2]) |= 4u;
    if ((v107 & 0x10) == 0)
    {
LABEL_221:
      if ((v107 & 0x20) == 0)
        goto LABEL_223;
      goto LABEL_222;
    }
LABEL_236:
    LODWORD(v167[2]) |= 8u;
    if ((v107 & 0x20) == 0)
    {
LABEL_223:
      HIDWORD(v167[0]) = 1000 * *(unsigned __int16 *)(v6 + 104);
      BYTE5(v167[2]) = *(_DWORD *)(v6 + 120) == 0;
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v108 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
        v109 = 84;
        if (!*(_BYTE *)(v6 + 72))
          v109 = 70;
        v110 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ShapeType,%u,Vel,%u,RespTimeMs,%u,Allowed,%u,VerReq,%u,posProtocol,%d,SessId,%u,HeloEnabled,%c\n", (unint64_t)v108, "ADP", 73, "startEmergencyPositionRequest_block_invoke", LODWORD(v167[2]), HIDWORD(v167[1]), HIDWORD(v167[0]), BYTE5(v167[2]), *(_DWORD *)(v6 + 116), *(_DWORD *)(v6 + 132), *(_DWORD *)(v6 + 136), v109);
        LbsOsaTrace_WriteLog(0x18u, __str, v110, 4, 1);
      }
      WORD2(v167[0]) = 1;
      if (*(_DWORD *)(v6 + 100) == 1)
        v111 = 3;
      else
        v111 = 1;
      *(_QWORD *)((char *)&v167[1] + 4) = 0;
      LODWORD(v167[1]) = v111;
      BYTE4(v167[2]) = 1;
      *(_DWORD *)__str = *(_DWORD *)(v6 + 136);
      v112 = &__str[8];
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)&__str[8], v6 + 40);
      v113 = (uint64_t **)(v7 + 208);
      std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,std::function<void ()(gnss::Result)>>>((uint64_t **)(v7 + 208), (unsigned int *)__str, __str);
      if (*(char **)&__str[32] == &__str[8])
      {
        v114 = 4;
      }
      else
      {
        if (!*(_QWORD *)&__str[32])
          goto LABEL_240;
        v114 = 5;
        v112 = *(char **)&__str[32];
      }
      (*(void (**)(char *))(*(_QWORD *)v112 + 8 * v114))(v112);
LABEL_240:
      v115 = GNS_CpLocReq(*(_DWORD *)(v6 + 136), (uint64_t)v167, 1);
      if (v115 == 1)
      {
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v116 = mach_continuous_time();
          v117 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: CpLocReq success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v116), "ADP", 73, "startEmergencyPositionRequest_block_invoke");
          LbsOsaTrace_WriteLog(0x18u, __str, v117, 4, 1);
        }
        __str[60] = 0;
        *(_DWORD *)&__str[64] = -1;
        *(_WORD *)&__str[68] = 0;
        *(_OWORD *)&__str[72] = xmmword_21E7F9A80;
        memset(&__str[88], 0, 22);
        *(_WORD *)&__str[110] = -1;
        __str[112] = 0;
        *(_DWORD *)&__str[116] = 0;
        *(_QWORD *)&__str[120] = -1;
        *(_QWORD *)&__str[128] = 0;
        *(_DWORD *)&__str[136] = -1;
        __str[140] = -1;
        *(_QWORD *)&__str[156] = -1;
        *(_QWORD *)&__str[142] = -1;
        *(_DWORD *)&__str[149] = -1;
        *(_QWORD *)&__str[164] = 0x7FFFFFFFLL;
        __str[172] = 0;
        *(_WORD *)&__str[174] = -1;
        *(_QWORD *)&__str[176] = 0xFFFFFFFF7FFFFFFFLL;
        *(_QWORD *)&__str[184] = 0;
        *(_OWORD *)__str = v167[0];
        *(_OWORD *)&__str[16] = v167[1];
        *(_QWORD *)&__str[31] = *(_QWORD *)((char *)&v167[1] + 15);
        v118 = *(_DWORD *)(v6 + 136);
        v119 = *(_DWORD *)(v6 + 132);
        *(_DWORD *)&__str[40] = *(_DWORD *)(v6 + 140);
        *(_DWORD *)&__str[44] = v119;
        __str[48] = *(_BYTE *)(v6 + 72);
        *(_DWORD *)&__str[56] = -1;
        *(_DWORD *)&__str[52] = v118;
        *(_WORD *)&__str[192] = *(_WORD *)(v6 + 89);
        v120 = *(_QWORD *)(v7 + 128);
        *(_BYTE *)(v7 + 120) = *(_BYTE *)(v6 + 88);
        v121 = *(_QWORD *)(v7 + 136) - v120;
        v122 = v121 / 196;
        if (*(_QWORD *)(v7 + 136) != v120)
        {
          if (v122 <= 1)
            v123 = 1;
          else
            v123 = v121 / 196;
          if (*(_DWORD *)(v120 + 52) == v118)
          {
            v124 = 0;
LABEL_249:
            if (v124 < v122)
            {
              v125 = v120 + 196 * v124;
              __str[60] = *(_BYTE *)(v125 + 60);
              *(_OWORD *)v125 = *(_OWORD *)__str;
              v126 = *(_OWORD *)&__str[80];
              v127 = *(_OWORD *)&__str[96];
              v128 = *(_OWORD *)&__str[128];
              *(_OWORD *)(v125 + 112) = *(_OWORD *)&__str[112];
              *(_OWORD *)(v125 + 128) = v128;
              *(_OWORD *)(v125 + 80) = v126;
              *(_OWORD *)(v125 + 96) = v127;
              v129 = *(_OWORD *)&__str[144];
              v130 = *(_OWORD *)&__str[160];
              v131 = *(_OWORD *)&__str[176];
              *(_WORD *)(v125 + 192) = *(_WORD *)&__str[192];
              *(_OWORD *)(v125 + 160) = v130;
              *(_OWORD *)(v125 + 176) = v131;
              *(_OWORD *)(v125 + 144) = v129;
              v132 = *(_OWORD *)&__str[16];
              v133 = *(_OWORD *)&__str[32];
              v134 = *(_OWORD *)&__str[64];
              *(_OWORD *)(v125 + 48) = *(_OWORD *)&__str[48];
              *(_OWORD *)(v125 + 64) = v134;
              *(_OWORD *)(v125 + 16) = v132;
              *(_OWORD *)(v125 + 32) = v133;
            }
            goto LABEL_278;
          }
          v124 = 0;
          v150 = (int *)(v120 + 248);
          v151 = v123 - 1;
          while (v151 != v124)
          {
            v152 = *v150;
            v150 += 49;
            ++v124;
            if (v152 == v118)
            {
              if (v124 < v122)
                goto LABEL_249;
              break;
            }
          }
        }
        if (v122 <= 3)
          std::vector<gnss::AgnssSummaryReport>::push_back[abi:ne180100]((void **)(v7 + 128), (uint64_t)__str);
LABEL_278:
        *(_BYTE *)(v7 + 1024) = 1;
        goto LABEL_293;
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v135 = mach_continuous_time();
        v136 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx CpLocReq,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v135), "ADP", 69, "startEmergencyPositionRequest_block_invoke", 257, v115);
        LbsOsaTrace_WriteLog(0x18u, __str, v136, 0, 1);
      }
      v137 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v7, v115);
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v165, v6 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, v137, (uint64_t)v165, (uint64_t)"startEmergencyPositionRequest_block_invoke");
      v138 = v166;
      if (v166 == v165)
      {
        v139 = 4;
        v138 = v165;
      }
      else
      {
        if (!v166)
        {
LABEL_258:
          v142 = *(_QWORD *)(v7 + 216);
          v141 = v7 + 216;
          v140 = v142;
          if (v142)
          {
            v143 = *(_DWORD *)(v6 + 136);
            v144 = v141;
            do
            {
              v145 = *(_DWORD *)(v140 + 32);
              v146 = v145 >= v143;
              if (v145 >= v143)
                v147 = (uint64_t *)v140;
              else
                v147 = (uint64_t *)(v140 + 8);
              if (v146)
                v144 = v140;
              v140 = *v147;
            }
            while (*v147);
            if (v144 != v141 && v143 >= *(_DWORD *)(v144 + 32))
              std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::erase(v113, (uint64_t *)v144);
          }
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v148 = mach_continuous_time();
            v149 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v148), "ADP", 68, "startEmergencyPositionRequest_block_invoke");
            LbsOsaTrace_WriteLog(0x18u, __str, v149, 5, 1);
          }
          goto LABEL_293;
        }
        v139 = 5;
      }
      (*(void (**)(void))(*v138 + 8 * v139))();
      goto LABEL_258;
    }
LABEL_222:
    LODWORD(v167[2]) |= 0x10u;
    goto LABEL_223;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v173, v6 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v7, 5, (uint64_t)v173, (uint64_t)"startEmergencyPositionRequest_block_invoke");
  v91 = v174;
  if (v174 == v173)
  {
    v92 = 4;
    v91 = v173;
  }
  else
  {
    if (!v174)
      goto LABEL_281;
    v92 = 5;
  }
  (*(void (**)(void))(*v91 + 8 * v92))();
LABEL_281:
  gnss::Emergency::Cplane::MeasurementReport::MeasurementReport((uint64_t)__str);
  *(_QWORD *)&__str[12] = *(_QWORD *)(v6 + 132);
  *(_DWORD *)__str = -9;
  __str[4] |= 4u;
  *(_DWORD *)&__str[8] = 0;
  *(_DWORD *)&__str[1392] = 0;
  v153 = *(NSObject **)(v7 + 296);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice29startEmergencyPositionRequestERKNS_9Emergency6Cplane15PositionRequestERKNS2_7ContextENSt3__18functionIFvNS_6ResultEEEE_block_invoke_2;
  block[3] = &__block_descriptor_tmp_33_1;
  v154 = v169;
  v155 = (uint64_t)v204;
  if (v204)
  {
    if (v204 == v203)
    {
      v170 = v169;
      (*(void (**)(_QWORD *, _BYTE *))(v203[0] + 24))(v203, v169);
      goto LABEL_286;
    }
    v155 = (*(uint64_t (**)(_QWORD *))(*v204 + 16))(v204);
  }
  v170 = (_BYTE *)v155;
LABEL_286:
  memcpy(v171, __str, sizeof(v171));
  dispatch_async(v153, block);
  gnss::GnssAdaptDevice::Ga10_05SendSessionSummaryReport(v7, *(_DWORD *)(v6 + 136), 0, 22);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(v167, 0x410uLL);
    v156 = mach_continuous_time();
    v157 = snprintf((char *)v167, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v156), "ADP", 68, "startEmergencyPositionRequest_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, (char *)v167, v157, 5, 1);
  }
  if (v170 == v169)
  {
    v158 = 4;
  }
  else
  {
    if (!v170)
      goto LABEL_293;
    v158 = 5;
    v154 = v170;
  }
  (*(void (**)(_QWORD *))(*v154 + 8 * v158))(v154);
LABEL_293:
  v159 = v202;
  if (v202 == v201)
  {
    v160 = 4;
    v159 = v201;
  }
  else
  {
    if (!v202)
      goto LABEL_298;
    v160 = 5;
  }
  (*(void (**)(void))(*v159 + 8 * v160))();
LABEL_298:
  v161 = v204;
  if (v204 == v203)
  {
    v162 = 4;
    v161 = v203;
  }
  else
  {
    if (!v204)
      goto LABEL_303;
    v162 = 5;
  }
  (*(void (**)(void))(*v161 + 8 * v162))();
LABEL_303:
  result = v206;
  if (v206 == v205)
  {
    v164 = 4;
    result = v205;
  }
  else
  {
    if (!v206)
      return result;
    v164 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v164))();
}

@end
