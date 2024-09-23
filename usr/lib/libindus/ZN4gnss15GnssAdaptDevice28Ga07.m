@implementation ZN4gnss15GnssAdaptDevice28Ga07

char *___ZN4gnss15GnssAdaptDevice28Ga07_05HandleGnssHwStatusIndE11e_Gnm_ErrorjP17s_Gnm_ReadyStatus_block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  void *HalExtensions;
  __int16 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  gnss::GnssAdaptDevice *v14;
  int v15;
  uint64_t v17;
  unint64_t v18;
  _OWORD v19[4];
  __int16 v20;
  char __str[966];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v3 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
    v4 = 84;
    if (!*(_BYTE *)(a1 + 40))
      v4 = 70;
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Res,%u,HwStatus,%c,HWInitStatus,%hhu\n", (unint64_t)v3, "ADP", 73, "Ga07_05HandleGnssHwStatusInd_block_invoke", *(unsigned __int8 *)(a1 + 176), v4, *(unsigned __int8 *)(a1 + 41));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
      goto LABEL_14;
    }
LABEL_15:
    v14 = (gnss::GnssAdaptDevice *)v2;
    v15 = 0;
    return gnss::GnssAdaptDevice::Ga07_04DeviceInitRespHndlr(v14, v15);
  }
  v5 = *(_OWORD *)(a1 + 126);
  v6 = *(_OWORD *)(a1 + 158);
  v19[2] = *(_OWORD *)(a1 + 142);
  v19[3] = v6;
  v20 = *(_WORD *)(a1 + 174);
  v19[0] = *(_OWORD *)(a1 + 110);
  v19[1] = v5;
  gnss::GnssAdaptDevice::Ga00_10GnssSetHwVersionInfo(v2, (uint64_t)v19);
  HalExtensions = gnss::GnssAdaptDevice::getHalExtensions((gnss::GnssAdaptDevice *)v2);
  v8 = (*(uint64_t (**)(void *))(*(_QWORD *)HalExtensions + 16))(HalExtensions);
  if ((HSW_SetSWBuildGPSWKNum(v8) & 1) == 0)
    goto LABEL_15;
  v9 = gnss::GnssAdaptDevice::getHalExtensions((gnss::GnssAdaptDevice *)v2);
  v10 = (*(double (**)(void *))(*(_QWORD *)v9 + 88))(v9);
  if ((HSW_SetCrossCorrelationCfg(v10, v11, v12, v13) & 1) == 0)
    goto LABEL_15;
  if (*(_BYTE *)(v2 + 90))
  {
    if (Gnm_ClearGNSSCache(0x10000))
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v18 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ClearCache on reset,%u\n", v18);
LABEL_14:
        gnssOsa_PrintLog(__str, 1, 1, 0);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (gnssOsa_SemWaitTimeOut(*(NSObject **)(v2 + 360), 0x1F4u))
    {
      if (!g_LbsOsaTrace_Config)
        goto LABEL_15;
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ClearCache\n");
      goto LABEL_14;
    }
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v17 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Device Init success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 73, "Ga07_05HandleGnssHwStatusInd_block_invoke");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v14 = (gnss::GnssAdaptDevice *)v2;
  v15 = 1;
  return gnss::GnssAdaptDevice::Ga07_04DeviceInitRespHndlr(v14, v15);
}

@end
