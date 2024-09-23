@implementation ZN4gnss15GnssAdaptDevice33Ga03

_QWORD *___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  NSObject *v4;
  _BYTE *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  BOOL v12;
  float v13;
  float v14;
  char v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  double v21;
  int v22;
  _DWORD *v23;
  unsigned int v24;
  uint64_t v25;
  double v26;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  char v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL4 v44;
  int v45;
  _QWORD v46[4];
  _BYTE v47[24];
  _BYTE *v48;
  char v49;
  unint64_t v50;
  float v51;
  BOOL v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[4];
  _BYTE v62[24];
  _BYTE *v63;
  char v64;
  unint64_t v65;
  float v66;
  char v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD block[4];
  _BYTE v76[24];
  _BYTE *v77;
  char v78;
  uint64_t v79;
  int v80;
  char v81;
  int v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  char __str[966];
  _QWORD v88[3];
  _QWORD *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v88, v2 + 296);
  result = v89;
  if (!v89)
  {
    if (!g_LbsOsaTrace_Config)
      return result;
    bzero(__str, 0x3C6uLL);
    v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeTransferDataCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    goto LABEL_64;
  }
  if (*(_BYTE *)(a1 + 104))
  {
    v4 = *(NSObject **)(v2 + 160);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2;
    block[3] = &__block_descriptor_tmp_83;
    v5 = v76;
    if (v89 == v88)
    {
      v77 = v76;
      (*(void (**)(_QWORD *, _BYTE *))(v88[0] + 24))(v88, v76);
    }
    else
    {
      v77 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v89 + 16))(v89);
    }
    v78 = 0;
    v79 = 0;
    v80 = -1082130432;
    v81 = 0;
    v82 = 0;
    v84 = 0u;
    v85 = 0u;
    v83 = -1;
    v86 = 0;
    dispatch_async(v4, block);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v16 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Status Unavailable\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    v17 = v77;
    goto LABEL_59;
  }
  v7 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v8 = (unint64_t)(*(double *)(a1 + 48) * 1000000.0) + 604800000000000 * *(__int16 *)(a1 + 42);
    v10 = *(_QWORD *)(a1 + 88);
    v9 = *(_QWORD *)(a1 + 96);
    v11 = *(double *)(a1 + 56) * 1000000.0;
    v12 = v11 <= 3.40282347e38;
    v13 = v11;
    if (v12)
      v14 = v13;
    else
      v14 = 3.4028e38;
    v15 = 1;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v15 = 0;
    v14 = -1.0;
  }
  v18 = 1000000 * *(unsigned int *)(a1 + 80);
  v19 = *(double *)(a1 + 72);
  if (v19 > 2147483650.0)
  {
    v20 = *(NSObject **)(v2 + 160);
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 1174405120;
    v61[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_85;
    v61[3] = &__block_descriptor_tmp_86;
    v5 = v62;
    if (v89 == v88)
    {
      v63 = v62;
      (*(void (**)(_QWORD *, _BYTE *))(v88[0] + 24))(v88, v62);
    }
    else
    {
      v63 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v89 + 16))(v89);
    }
    v64 = v15;
    v65 = v8;
    v66 = v14;
    v67 = 0;
    v68 = 0;
    v69 = v18;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = v10;
    v74 = v9;
    dispatch_async(v20, v61);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v29 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx UTCorr,%.9f \n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770, v19);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    v17 = v63;
    goto LABEL_59;
  }
  v21 = -0.5;
  if (v19 > 0.0)
    v21 = 0.5;
  v22 = (int)(v19 + v21);
  v23 = &unk_2579E5000;
  v24 = g_LbsOsaTrace_Config;
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v25 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: UTCCorr %.9f,LeapSec,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 68, "Ga03_02HandleTimeMarkDataCallback_block_invoke", v19, v22);
    gnssOsa_PrintLog(__str, 5, 1, 0);
    v23 = &unk_2579E5000;
    v24 = g_LbsOsaTrace_Config;
  }
  v26 = v19 - (double)(unint64_t)v19;
  if (v26 > 0.0000005 && v26 < 0.9999995 && v24 >= 2)
  {
    bzero(__str, 0x3C6uLL);
    v28 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx UtcCorr beyond 500ns from seconds boundary,%.9f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v28), "ADP", 87, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770, v19);
    gnssOsa_PrintLog(__str, 2, 1, 0);
    v23 = &unk_2579E5000;
  }
  v45 = v22;
  if (*(_BYTE *)(a1 + 64))
    v44 = *(_BYTE *)(a1 + 40) != 0;
  else
    v44 = 0;
  v30 = *(unsigned __int8 *)(a1 + 84);
  if (v30 >= 6)
  {
    if (g_LbsOsaTrace_Config < 4)
    {
      v31 = v15;
      v30 = 0;
    }
    else
    {
      bzero(__str, 0x3C6uLL);
      v32 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid TimeMark Qual\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v32), "ADP", 73, "Ga03_02HandleTimeMarkDataCallback_block_invoke");
      gnssOsa_PrintLog(__str, 4, 1, 0);
      v31 = v15;
      v30 = 0;
      v23 = (_DWORD *)&unk_2579E5000;
    }
  }
  else
  {
    v31 = v15;
  }
  v33 = *(unsigned __int16 *)(a1 + 86);
  v34 = v33 & 0x11 | (8 * ((v33 >> 1) & 1)) | (v33 >> 4) & 6 | (v33 >> 2) & 0x20;
  v35 = v23[588];
  if ((v33 & 8) != 0)
  {
    if (!v35)
      goto LABEL_53;
    bzero(__str, 0x3C6uLL);
    v36 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Constel E_GNM_GNSSID_MODGPS\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    v35 = g_LbsOsaTrace_Config;
  }
  if (v35 >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v37 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v38 = 70;
    if (v44)
      v39 = 84;
    else
      v39 = 70;
    if (v7)
      v38 = 84;
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: WkValid,%c,TimeNs,%llu,TimeUncNs,%f,ClkNs,%llu,LeapSecValid,%c,LeapSec,%d,Qual,%u,ConstUsed,%u,BCTNs,%llu,BCTUncNs,%llu\n", v37, "ADP", 73, "Ga03_02HandleTimeMarkDataCallback_block_invoke", v38, v8, v14, v18, v39, v45, v30, v34, v10, v9);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
LABEL_53:
  v40 = *(NSObject **)(v2 + 160);
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 1174405120;
  v46[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_93;
  v46[3] = &__block_descriptor_tmp_94;
  v5 = v47;
  v41 = (uint64_t)v89;
  if (v89)
  {
    if (v89 == v88)
    {
      v48 = v47;
      (*(void (**)(_QWORD *, _BYTE *))(v88[0] + 24))(v88, v47);
      goto LABEL_58;
    }
    v41 = (*(uint64_t (**)(_QWORD *))(*v89 + 16))(v89);
  }
  v48 = (_BYTE *)v41;
LABEL_58:
  v49 = v31;
  v50 = v8;
  v51 = v14;
  v52 = v44;
  v53 = v45;
  v55 = 0;
  v56 = 0;
  v54 = v18;
  v57 = v30;
  v58 = v34;
  v59 = v10;
  v60 = v9;
  dispatch_async(v40, v46);
  v17 = v48;
LABEL_59:
  if (v17 == v5)
  {
    v42 = 4;
  }
  else
  {
    if (!v17)
      goto LABEL_64;
    v42 = 5;
    v5 = v17;
  }
  (*(void (**)(_BYTE *))(*(_QWORD *)v5 + 8 * v42))(v5);
LABEL_64:
  result = v89;
  if (v89 == v88)
  {
    v43 = 4;
    result = v88;
  }
  else
  {
    if (!v89)
      return result;
    v43 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v43))();
}

@end
