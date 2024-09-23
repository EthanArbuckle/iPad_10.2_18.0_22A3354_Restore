@implementation ZN4gnss15GnssAdaptDevice28Ga07

char *___ZN4gnss15GnssAdaptDevice28Ga07_05HandleGnssHwStatusIndE11e_Gnm_ErrorjP17s_Gnm_ReadyStatus_block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  unsigned __int16 v5;
  uint64_t v6;
  unsigned __int16 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _BYTE *v17;
  void *HalExtensions;
  uint64_t v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  unsigned __int16 v31;
  int v32;
  uint64_t v33;
  unsigned __int16 v34;
  gnss::GnssAdaptDevice *v35;
  int v36;
  uint64_t v38;
  unsigned __int16 v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _OWORD v43[9];
  _BYTE v44[22];
  _BYTE v45[14];
  char v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[67];
  _WORD v51[11];
  uint64_t v52;
  char __str[1040];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 1, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v3 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
    v4 = 84;
    if (!*(_BYTE *)(a1 + 40))
      v4 = 70;
    v5 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Res,%u,HwStatus,%c,HWInitStatus,%hhu\n", (unint64_t)v3, "ADP", 65, "Ga07_05HandleGnssHwStatusInd_block_invoke", *(unsigned __int8 *)(a1 + 376), v4, *(unsigned __int8 *)(a1 + 41));
    LbsOsaTrace_WriteLog(0x18u, __str, v5, 1, 1);
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      mach_continuous_time();
      v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx\n");
      goto LABEL_24;
    }
LABEL_25:
    v35 = (gnss::GnssAdaptDevice *)v2;
    v36 = 0;
    return gnss::GnssAdaptDevice::Ga07_04DeviceInitRespHndlr(v35, v36);
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 1, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v6 = mach_continuous_time();
    v7 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Patch dnld completed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 65, "Ga07_05HandleGnssHwStatusInd_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, __str, v7, 1, 1);
  }
  *(_QWORD *)&v44[14] = *(_QWORD *)(a1 + 368);
  v8 = *(_OWORD *)(a1 + 226);
  v43[0] = *(_OWORD *)(a1 + 210);
  v43[1] = v8;
  v9 = *(_OWORD *)(a1 + 242);
  v10 = *(_OWORD *)(a1 + 322);
  v11 = *(_OWORD *)(a1 + 354);
  v43[8] = *(_OWORD *)(a1 + 338);
  *(_OWORD *)v44 = v11;
  v12 = *(_OWORD *)(a1 + 258);
  v13 = *(_OWORD *)(a1 + 274);
  v43[2] = v9;
  v43[3] = v12;
  v14 = *(_OWORD *)(a1 + 290);
  v15 = *(_OWORD *)(a1 + 306);
  v43[4] = v13;
  v43[5] = v14;
  v43[6] = v15;
  v43[7] = v10;
  gnss::GnssAdaptDevice::Ga00_10GnssSetHwVersionInfo((gnss::GnssAdaptDevice *)v2, (const char *)v43);
  v46 = 2;
  v50[0] = 0;
  *(_QWORD *)((char *)v50 + 5) = 0;
  v47 = 0;
  v49[0] = 0;
  v48 = 0;
  *(_QWORD *)((char *)v49 + 7) = 0;
  v16 = 62;
  memset(v45, 0, sizeof(v45));
  do
  {
    v17 = &v45[v16];
    *(_DWORD *)(v17 + 255) = 0;
    *((_OWORD *)v17 + 14) = 0uLL;
    *((_OWORD *)v17 + 15) = 0uLL;
    *((_OWORD *)v17 + 12) = 0uLL;
    *((_OWORD *)v17 + 13) = 0uLL;
    *((_OWORD *)v17 + 10) = 0uLL;
    *((_OWORD *)v17 + 11) = 0uLL;
    *((_OWORD *)v17 + 8) = 0uLL;
    *((_OWORD *)v17 + 9) = 0uLL;
    *((_OWORD *)v17 + 6) = 0uLL;
    *((_OWORD *)v17 + 7) = 0uLL;
    *((_OWORD *)v17 + 4) = 0uLL;
    *((_OWORD *)v17 + 5) = 0uLL;
    *((_OWORD *)v17 + 2) = 0uLL;
    *((_OWORD *)v17 + 3) = 0uLL;
    v16 += 262;
    *(_OWORD *)v17 = 0uLL;
    *((_OWORD *)v17 + 1) = 0uLL;
    *((_WORD *)v17 + 130) = -1;
  }
  while (v17 + 262 != (_BYTE *)v51);
  *(_DWORD *)v51 = 0;
  v52 = 0;
  memset(&v51[3], 0, 15);
  *(_DWORD *)&v45[8] = 2048;
  HalExtensions = gnss::GnssAdaptDevice::getHalExtensions((gnss::GnssAdaptDevice *)v2);
  v51[9] = (*(uint64_t (**)(void *))(*(_QWORD *)HalExtensions + 16))(HalExtensions);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v19 = mach_continuous_time();
    v20 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: GpsWeekFromBuild,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 73, "Ga07_21SetUserConfig", v51[9]);
    LbsOsaTrace_WriteLog(0x18u, __str, v20, 4, 1);
  }
  if (Gnm_SetUserConfig((uint64_t)v45))
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v40 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SetUserConfig Failed,%u\n", v40);
LABEL_24:
      LbsOsaTrace_WriteLog(0x18u, __str, v21, 0, 1);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  v22 = gnss::GnssAdaptDevice::getHalExtensions((gnss::GnssAdaptDevice *)v2);
  v23 = (*(double (**)(void *))(*(_QWORD *)v22 + 96))(v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  bzero(v45, 0x20EuLL);
  *(_DWORD *)v45 = 4096;
  *(double *)&v50[60] = v23;
  *(double *)&v50[61] = v25;
  *(double *)&v50[62] = v27;
  *(double *)&v50[63] = v29;
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v30 = mach_continuous_time();
    v31 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: MarginBeidouB1,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 73, "Ga07_22SetPltfrmConfig", v29);
    LbsOsaTrace_WriteLog(0x18u, __str, v31, 4, 1);
  }
  v32 = Gnm_SetPlatformConfig((int *)v45);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v33 = mach_continuous_time();
    v34 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: SignalThreshold,%f,MarginGpsL1,%f,MarginGalileoE1,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "ADP", 73, "Ga07_22SetPltfrmConfig", v23, v25, v27);
    LbsOsaTrace_WriteLog(0x18u, __str, v34, 4, 1);
  }
  if (v32)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v41 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SetPltfmCfg XCOR Failed,%u\n", v41);
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if ((gnss::GnssAdaptDevice::Ga01_06SetDefaultSideBandConfig((gnss::GnssAdaptDevice *)v2) & 1) == 0)
    goto LABEL_25;
  if (*(_BYTE *)(v2 + 90))
  {
    if (Gnm_ClearGNSSCache(0x10000))
    {
      if (!LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        goto LABEL_25;
      bzero(__str, 0x410uLL);
      v42 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx ClearCache on reset,%u\n", v42);
      goto LABEL_24;
    }
    if (gnssOsa_SemWaitTimeOut(*(NSObject **)(v2 + 1032), 0x1F4u))
    {
      if (!LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        goto LABEL_25;
      bzero(__str, 0x410uLL);
      mach_continuous_time();
      v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx ClearCache\n");
      goto LABEL_24;
    }
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v38 = mach_continuous_time();
    v39 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Device Init success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v38), "ADP", 73, "Ga07_05HandleGnssHwStatusInd_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, __str, v39, 4, 1);
  }
  v35 = (gnss::GnssAdaptDevice *)v2;
  v36 = 1;
  return gnss::GnssAdaptDevice::Ga07_04DeviceInitRespHndlr(v35, v36);
}

@end
