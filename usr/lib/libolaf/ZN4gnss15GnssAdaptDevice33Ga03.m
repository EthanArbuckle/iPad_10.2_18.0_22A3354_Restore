@implementation ZN4gnss15GnssAdaptDevice33Ga03

_QWORD *___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BYTE *v4;
  uint64_t v5;
  unsigned __int16 v6;
  int v7;
  unint64_t v8;
  double v9;
  BOOL v10;
  float v11;
  float v12;
  char v13;
  uint64_t v14;
  unsigned __int16 v15;
  _BYTE *v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  double v20;
  uint64_t v21;
  unsigned __int16 v22;
  double v23;
  uint64_t v24;
  unsigned __int16 v25;
  _BOOL4 v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned int v29;
  uint64_t v30;
  unsigned __int16 v31;
  unsigned int v32;
  uint64_t v33;
  unsigned __int16 v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int16 v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *result;
  uint64_t v44;
  _QWORD v45[4];
  _BYTE v46[24];
  _BYTE *v47;
  char v48;
  unint64_t v49;
  float v50;
  BOOL v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  _BYTE v61[24];
  _BYTE *v62;
  char v63;
  unint64_t v64;
  float v65;
  char v66;
  int v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  _QWORD block[4];
  _BYTE v73[24];
  _BYTE *v74;
  char v75;
  uint64_t v76;
  int v77;
  char v78;
  int v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  char __str[1040];
  _QWORD v85[3];
  _QWORD *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v85, v2 + 440);
  if (!v86)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v5 = mach_continuous_time();
      v6 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx TimeTransferDataCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v6, 0, 1);
    }
    goto LABEL_61;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    v3 = *(NSObject **)(v2 + 296);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2;
    block[3] = &__block_descriptor_tmp_83;
    v4 = v73;
    if (v86 == v85)
    {
      v74 = v73;
      (*(void (**)(_QWORD *, _BYTE *))(v85[0] + 24))(v85, v73);
    }
    else
    {
      v74 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v86 + 16))(v86);
    }
    v75 = 0;
    v76 = 0;
    v77 = -1082130432;
    v78 = 0;
    v79 = 0;
    v80 = -1;
    v81 = 0u;
    v82 = 0u;
    v83 = 0;
    dispatch_async(v3, block);
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v14 = mach_continuous_time();
      v15 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Status Unavailable\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v15, 0, 1);
    }
    v16 = v74;
    goto LABEL_56;
  }
  v7 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v8 = (unint64_t)(*(double *)(a1 + 48) * 1000000.0) + 604800000000000 * *(__int16 *)(a1 + 42);
    v9 = *(double *)(a1 + 56) * 1000000.0;
    v10 = v9 <= 3.40282347e38;
    v11 = v9;
    if (v10)
      v12 = v11;
    else
      v12 = 3.4028e38;
    v13 = 1;
  }
  else
  {
    v8 = 0;
    v13 = 0;
    v12 = -1.0;
  }
  v17 = 1000000 * *(unsigned int *)(a1 + 80);
  v18 = *(double *)(a1 + 72);
  if (v18 > 2147483650.0)
  {
    v19 = *(NSObject **)(v2 + 296);
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 1174405120;
    v60[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_85;
    v60[3] = &__block_descriptor_tmp_86_0;
    v4 = v61;
    if (v86 == v85)
    {
      v62 = v61;
      (*(void (**)(_QWORD *, _BYTE *))(v85[0] + 24))(v85, v61);
    }
    else
    {
      v62 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v86 + 16))(v86);
    }
    v63 = v13;
    v64 = v8;
    v65 = v12;
    v66 = 0;
    v67 = 0;
    v69 = 0u;
    v70 = 0u;
    v68 = v17;
    v71 = 0;
    dispatch_async(v19, v60);
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v27 = mach_continuous_time();
      v28 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx UTCorr,%.9f \n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770, v18);
      LbsOsaTrace_WriteLog(0x18u, __str, v28, 0, 1);
    }
    v16 = v62;
    goto LABEL_56;
  }
  if (v18 <= 0.0)
    v20 = -0.5;
  else
    v20 = 0.5;
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v21 = mach_continuous_time();
    v22 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: UTCCorr %.9f,LeapSec,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 68, "Ga03_02HandleTimeMarkDataCallback_block_invoke", v18, (int)(v18 + v20));
    LbsOsaTrace_WriteLog(0x18u, __str, v22, 5, 1);
  }
  v23 = v18 - (double)(unint64_t)v18;
  if (v23 > 0.0000005 && v23 < 0.9999995 && LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v24 = mach_continuous_time();
    v25 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx UtcCorr beyond 500ns from seconds boundary,%.9f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 87, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770, v18);
    LbsOsaTrace_WriteLog(0x18u, __str, v25, 2, 1);
  }
  if (*(_BYTE *)(a1 + 64))
    v26 = *(_BYTE *)(a1 + 40) != 0;
  else
    v26 = 0;
  v29 = *(unsigned __int8 *)(a1 + 84);
  if (v29 >= 6)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v30 = mach_continuous_time();
      v31 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Invalid TimeMark Qual\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 73, "Ga03_02HandleTimeMarkDataCallback_block_invoke");
      LbsOsaTrace_WriteLog(0x18u, __str, v31, 4, 1);
    }
    v29 = 0;
  }
  v32 = *(unsigned __int16 *)(a1 + 86);
  if ((v32 & 8) != 0 && LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v33 = mach_continuous_time();
    v34 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Constel E_GNM_GNSSID_MODGPS\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
    LbsOsaTrace_WriteLog(0x18u, __str, v34, 0, 1);
  }
  v35 = v32 & 0x11 | (8 * ((v32 >> 1) & 1)) | (v32 >> 4) & 6;
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v36 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v37 = 70;
    if (v26)
      v38 = 84;
    else
      v38 = 70;
    if (v7)
      v37 = 84;
    v39 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: WkValid,%c,TimeNs,%llu,TimeUncNs,%f,ClkNs,%llu,LeapSecValid,%c,LeapSec,%d,Qual,%u,ConstUsed,%u\n", v36, "ADP", 73, "Ga03_02HandleTimeMarkDataCallback_block_invoke", v37, v8, v12, v17, v38, (int)(v18 + v20), v29, v35);
    LbsOsaTrace_WriteLog(0x18u, __str, v39, 4, 1);
  }
  v40 = *(NSObject **)(v2 + 296);
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 1174405120;
  v45[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_93;
  v45[3] = &__block_descriptor_tmp_94_0;
  v4 = v46;
  v41 = (uint64_t)v86;
  if (v86)
  {
    if (v86 == v85)
    {
      v47 = v46;
      (*(void (**)(_QWORD *, _BYTE *))(v85[0] + 24))(v85, v46);
      goto LABEL_55;
    }
    v41 = (*(uint64_t (**)(_QWORD *))(*v86 + 16))(v86);
  }
  v47 = (_BYTE *)v41;
LABEL_55:
  v48 = v13;
  v49 = v8;
  v50 = v12;
  v51 = v26;
  v52 = (int)(v18 + v20);
  v54 = 0;
  v55 = 0;
  v53 = v17;
  v56 = v29;
  v57 = v35;
  v58 = 0;
  v59 = 0;
  dispatch_async(v40, v45);
  v16 = v47;
LABEL_56:
  if (v16 == v4)
  {
    v42 = 4;
  }
  else
  {
    if (!v16)
      goto LABEL_61;
    v42 = 5;
    v4 = v16;
  }
  (*(void (**)(_BYTE *))(*(_QWORD *)v4 + 8 * v42))(v4);
LABEL_61:
  result = v86;
  if (v86 == v85)
  {
    v44 = 4;
    result = v85;
  }
  else
  {
    if (!v86)
      return result;
    v44 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v44))();
}

@end
