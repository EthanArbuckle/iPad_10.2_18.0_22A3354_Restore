@implementation WCM_AriCoexCommandHandlerV2

- (WCM_AriCoexCommandHandlerV2)init
{
  WCM_AriCoexCommandHandlerV2 *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCM_AriCoexCommandHandlerV2;
  v2 = -[WCM_AriCoexCommandHandler init](&v4, "init");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Init the WCM_AriCoexCommandHandlerV2"));
  return v2;
}

- (BOOL)cameraEnumCheck:(unint64_t)a3
{
  return a3 < 6;
}

- (void)setCameraState:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  uint64_t uint64;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  _BYTE v11[87];
  unsigned __int8 v12;
  __int16 v13;
  __int16 v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;

  v4 = *(_QWORD *)&a4;
  v25 = a4;
  v21 = 0;
  v23 = 1;
  v19 = 3;
  v17 = 2;
  v15 = 4;
  v10 = a3;
  uint64 = xpc_dictionary_get_uint64(v10, "kWCMCellularSetCameraState");
  v14 = 0;
  v13 = 0;
  v12 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set camera State: Raw Camera State = 0x%x"), v4, uint64);
  v7 = uint64 & 1;
  v8 = uint64 & 0x200;
  v24 = uint64 & 1;
  v22 = (uint64 & 8) >> 3;
  v20 = (uint64 & 0x40) >> 6;
  v18 = v8 >> 9;
  v9 = (unsigned __int16)(uint64 & 0x1000) >> 12;
  v16 = (unsigned __int16)(uint64 & 0x1000) >> 12;
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->super.mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateFaceID"), (char *)&v14 + 1, v25);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->super.mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateFrontCam"), &v14, v25);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->super.mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateRearTeleCam"), (char *)&v13 + 1, v25);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->super.mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateRearUltraWideCam"), &v13, v25);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->super.mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateRearWideCam"), &v12, v25);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->super.mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateFaceID"), v7, v25);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->super.mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateFrontCam"), (uint64 & 8) != 0, v25);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->super.mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateRearTeleCam"), (uint64 & 0x40) != 0, v25);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->super.mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateRearUltraWideCam"), v8 != 0, v25);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->super.mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateRearWideCam"), (uint64 & 0x1000) != 0, v25);
  if ((_DWORD)v7 != HIBYTE(v14))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Face Id camera State: from %d to %d "), v25, HIBYTE(v14), v7);
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v11);
    sub_100021F00();
  }
  if ((uint64 & 8) >> 3 != v14)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Front camera State: from %d to %d "), v25, v14, (uint64 & 8) >> 3);
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v11);
    sub_100021F00();
  }
  if ((uint64 & 0x40) >> 6 != HIBYTE(v13))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Rear Telephoto camera State: from %d to %d "), v25, HIBYTE(v13), (uint64 & 0x40) >> 6);
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v11);
    sub_100021F00();
  }
  if (v8 >> 9 != v13)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Rear ultra wide camera State: from %d to %d "), v25, v13, v8 >> 9);
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v11);
    sub_100021F00();
  }
  if ((_DWORD)v9 != v12)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Rear wide camera State: from %d to %d "), v25, v12, v9);
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v11);
    sub_100021F00();
  }

}

- (BOOL)setCamAntBlockingPowerLimitingParam:(t_s_UtaIdcCamAntBlockPwrLmtPolicyConfigBundleV3 *)a3 XpcMessage:(id)a4 SubId:(unsigned int)a5
{
  id v6;
  char v7;
  uint64_t uint64;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  t_s_UtaIdcCamAntBlockPwrLmtPolicyConfig *v14;
  xpc_object_t value;
  void *v16;
  size_t count;
  size_t v18;
  uint64_t v19;
  unsigned int *p_var1;
  xpc_object_t v21;
  void *v22;
  uint64_t v23;
  int64_t int64;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v31;
  BOOL v32;
  const __CFString *v33;
  uint64_t v35;
  unint64_t v36;
  xpc_object_t xarray;
  char v38;
  uint64_t v39;
  xpc_object_t xdict;
  _BOOL4 v41;

  v39 = *(_QWORD *)&a5;
  v6 = a4;
  v7 = 0;
  xdict = v6;
  if (a3 && v6)
  {
    uint64 = xpc_dictionary_get_uint64(v6, "kWCMCellularSetAntBlocking_CameraId");
    v9 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetAntBlocking_DenyProtectVoice");
    v10 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_MitigationTimer");
    v11 = uint64 - 2;
    v12 = 0;
    v13 = 0;
    switch(v11)
    {
      case 0uLL:
        break;
      case 1uLL:
        v12 = 0;
        v13 = 1;
        break;
      case 2uLL:
        v12 = 0;
        v13 = 2;
        break;
      case 3uLL:
        v12 = 0;
        v13 = 3;
        break;
      case 6uLL:
        v12 = 0;
        v13 = 4;
        break;
      default:
        v12 = 1;
        v13 = 5;
        break;
    }
    if ((v12 | !-[WCM_AriCoexCommandHandlerV2 cameraEnumCheck:](self, "cameraEnumCheck:", v13)) == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, invalid camera ID = %llu"), v39, v13);
      v7 = 0;
    }
    else
    {
      v14 = &a3->var0[v13];
      v14->var1 = v9;
      v14->var2 = v10;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, camera ID = %llu"), v39, v13);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu"), v39, v9, v10);
      value = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
      v16 = (void *)objc_claimAutoreleasedReturnValue(value);
      if (v16)
      {
        xarray = v16;
        count = xpc_array_get_count(v16);
        if (count)
        {
          v38 = 0;
          v18 = 0;
          v19 = count - 1;
          if (count - 1 >= 0xF)
            v19 = 15;
          v35 = v19;
          v36 = count;
          p_var1 = &a3->var0[v13].var0[0].var1.var2.var1;
          v16 = xarray;
          while (1)
          {
            v21 = xpc_array_get_value(v16, v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            v41 = xpc_dictionary_get_BOOL(v22, "kWCMCellularSetAntBlocking_Policy_Enable");
            v23 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
            int64 = xpc_dictionary_get_int64(v22, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
            v25 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_MitigationType");
            v26 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
            v27 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
            v28 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
            v29 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %lld, mitigationType = %llu"), v39, v18, v41, v23, int64, v25);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz"), v39, v18, v26, v27, v28, v29);
            if (!-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", v27))
            {
              v33 = CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, invalid coexTech=%llu, API UtaIdcSetCamAntBlockPwrLmtConfigReq failed");
              goto LABEL_31;
            }
            if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v25))
              break;
            p_var1[2] = v25;
            p_var1[3] = int64;
            *(p_var1 - 4) = v41;
            *(p_var1 - 3) = v26;
            *(p_var1 - 2) = v27;
            *(p_var1 - 1) = v28;
            *p_var1 = v29;
            p_var1[1] = v23;
            p_var1 += 8;

            v31 = v18 + 1 >= v36 || v18 > 0xE;
            v38 = v31;
            v32 = v18++ == v35;
            v16 = xarray;
            if (v32)
              goto LABEL_33;
          }
          v33 = CFSTR("Coex ARI driver(SubId %u): SSet Camera Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetCamAntBlockPwrLmtConfigReq failed");
          v27 = v25;
LABEL_31:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v33, v39, v27);

        }
        else
        {
          v38 = 1;
        }
        v16 = xarray;
      }
      else
      {
        v38 = 1;
      }
LABEL_33:

      v7 = v38;
    }
  }

  return v7 & 1;
}

- (void)setCamAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _DWORD *v11;
  xpc_object_t value;
  void *v13;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  xpc_object_t v20;
  void *v21;
  int v22;
  _BYTE v23[80];
  _QWORD v24[325];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  v9 = v24;
  do
  {
    v10 = 0;
    v24[65 * v8 + 64] = &_mh_execute_header;
    do
    {
      v11 = &v9[v10];
      *v11 = 0;
      v11[6] = 3;
      v11[2] = 127;
      v10 += 4;
    }
    while (v10 != 64);
    ++v8;
    v9 += 65;
  }
  while (v8 != 5);
  value = xpc_dictionary_get_value(v6, "kWCMCellularSetAntBlocking_FrontCameraPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(value);
  v14 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_FaceIdCameraPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearTeleCameraPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearWideCameraPolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearUltraWideCameraPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if ((v13 || v15 || v17 || v19)
    && (!v13
     || -[WCM_AriCoexCommandHandlerV2 setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v13, v4))&& (!v15|| -[WCM_AriCoexCommandHandlerV2 setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v15, v4))&& (!v17|| -[WCM_AriCoexCommandHandlerV2 setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v17, v4))
    && (!v21
     || -[WCM_AriCoexCommandHandlerV2 setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v21, v4))&& (!v19|| -[WCM_AriCoexCommandHandlerV2 setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v19, v4)))
  {
    AriSdk::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV3_SDK::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV3_SDK((AriSdk::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV3_SDK *)v23);
    v22 = v4;
    sub_100021F00();
  }

}

- (void)printGnssImdConfig:(t_s_UtaIdcCellImdGnssMitigationPolicyConfig *)a3
{
  uint64_t i;
  t_s_UtaIdcCellImdGnssMitigationPolicy *v5;
  uint64_t v6;
  char v7;
  char v8;
  unsigned int *v9;
  uint64_t v10;
  char v11;
  char v12;
  unsigned int *v13;

  if (a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, protect_low_priority_background_gnss=%d, deny_voice_call_protection=%d"), a3->var1, a3->var2);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, mitigation_timer_ms=%u, lqm_threshold=%d"), a3->var3, a3->var4);
    for (i = 0; i != 32; ++i)
    {
      if (a3->var0[i].var0 == 1)
      {
        v5 = &a3->var0[i];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: imd_type=%u, gnss_L5_preferred_tuner_allowed=%d, parallel_mitigation_allowed=%d"), i, v5->var3, v5->var5, v5->var6);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: gnss_victim_center_freq_khz=%u, gnss_victim_bandwidth_khz=%u"), i, v5->var4.var0, v5->var4.var1);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1: tech_bitmap=%u, center_freq_khz=%u, bandwidth_khz=%u"), i, v5->var1.var0.var0, v5->var1.var0.var1.var0, v5->var1.var0.var1.var1);
        v6 = 0;
        v7 = 1;
        do
        {
          v8 = v7;
          if (a3->var0[i].var1.var1[v6].var0 == 1)
          {
            v9 = (unsigned int *)((char *)&a3->var0[i] + 16 * v6);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1_policy[%d]: cellular_aggressor_antenna_bitmap=%u"), i, v6, v9[5]);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1_policy[%d]: cellular_tx_power_cap=%d, mitigation_type=%u"), i, v6, v9[6], v9[7]);
          }
          v7 = 0;
          v6 = 1;
        }
        while ((v8 & 1) != 0);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2: tech_bitmap=%u, center_freq_khz=%u, bandwidth_khz=%u"), i, a3->var0[i].var2.var0.var0, a3->var0[i].var2.var0.var1.var0, a3->var0[i].var2.var0.var1.var1);
        v10 = 0;
        v11 = 1;
        do
        {
          v12 = v11;
          if (a3->var0[i].var2.var1[v10].var0 == 1)
          {
            v13 = (unsigned int *)((char *)&a3->var0[i] + 16 * v10);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2_policy[%d]: cellular_aggressor_antenna_bitmap=%u"), i, v10, v13[16]);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2_policy[%d]: cellular_tx_power_cap=%d, mitigation_type=%u"), i, v10, v13[17], v13[18]);
          }
          v11 = 0;
          v10 = 1;
        }
        while ((v12 & 1) != 0);
      }
    }
  }
}

- (void)handleGnssImdAntBlockPowerLimitConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _BYTE *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BYTE *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  int *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  _DWORD *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  unint64_t v102;
  _DWORD *v103;
  int *v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE v108[84];
  int v109;
  _BYTE v110[28];
  int v111;
  _DWORD v112[881];
  unsigned int v113;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = 0;
    v109 = 0;
    v113 = 0;
    do
    {
      v6 = &v110[v5];
      *(_DWORD *)v6 = 0;
      *((_QWORD *)v6 + 13) = 0;
      *((_DWORD *)v6 + 4) = 0;
      *((_DWORD *)v6 + 15) = 0;
      *(_QWORD *)(v6 + 28) = 3;
      *((_DWORD *)v6 + 11) = 3;
      *((_QWORD *)v6 + 9) = 3;
      v5 += 112;
      *((_QWORD *)v6 + 11) = 3;
    }
    while (v5 != 3584);
    v112[878] = objc_msgSend(v3, "mProtectGnssLowPriority", COERCE_DOUBLE(3));
    v112[879] = objc_msgSend(v4, "mDenyVoiceProtect");
    v112[880] = objc_msgSend(v4, "mMitigationTimer_ms");
    if (-[WCM_AriCoexCommandHandler LQMEnumCheck:](self, "LQMEnumCheck:", objc_msgSend(v4, "mLqmThreshold")))
    {
      v113 = objc_msgSend(v4, "mLqmThreshold");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
      v8 = (unint64_t)objc_msgSend(v7, "count");

      if (v8 < 0x21)
      {
        if (!v8)
        {
LABEL_29:
          -[WCM_AriCoexCommandHandlerV2 printGnssImdConfig:](self, "printGnssImdConfig:", v110);
          AriSdk::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK((AriSdk::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK *)v108);
          sub_100021F00();
        }
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, too many policies (%llu)"), v8);
        v8 = 32;
      }
      v9 = 0;
      v104 = &v111;
      v102 = v8;
      v103 = v112;
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));
        v12 = -[WCM_AriCoexCommandHandler ImdTypeEnumCheck:](self, "ImdTypeEnumCheck:", objc_msgSend(v11, "mImdType"));

        if ((v12 & 1) == 0)
          break;
        *(_DWORD *)&v110[112 * v9] = 1;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 5] = objc_msgSend(v14, "mImdType");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 8] = objc_msgSend(v16, "mGnssL5TunerAllowed");

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 9] = objc_msgSend(v18, "mParallelMitigationAllowed");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 6] = objc_msgSend(v20, "mGnssVictimFreq_KHz");

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 7] = objc_msgSend(v22, "mGnssVictimBw_KHz");

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v9));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mCellAggressor1"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mBandPolicy"));
        v27 = objc_msgSend(v26, "count");

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v9));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mCellAggressor2"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mBandPolicy"));
        v32 = objc_msgSend(v31, "count");

        v33 = 2;
        if ((unint64_t)v27 >= 2)
          v34 = 2;
        else
          v34 = (uint64_t)v27;
        if ((unint64_t)v32 < 2)
          v33 = (uint64_t)v32;
        v105 = v33;
        v106 = v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v9));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mCellAggressor1"));
        v38 = &v110[112 * v9];
        *((_WORD *)v38 + 2) = (unsigned __int16)objc_msgSend(v37, "mCellularCoexTech");
        v38 += 4;

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v9));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mCellAggressor1"));
        *((_DWORD *)v38 + 1) = objc_msgSend(v41, "mCellularFrequencyKHz");

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v9));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "mCellAggressor1"));
        *((_DWORD *)v38 + 2) = objc_msgSend(v44, "mCellularBandwidthKHz");

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", v9));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mCellAggressor2"));
        v48 = &v110[112 * v9];
        *((_WORD *)v48 + 24) = (unsigned __int16)objc_msgSend(v47, "mCellularCoexTech");
        v48 += 48;

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", v9));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "mCellAggressor2"));
        *((_DWORD *)v48 + 1) = objc_msgSend(v51, "mCellularFrequencyKHz");

        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectAtIndexedSubscript:", v9));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "mCellAggressor2"));
        *((_DWORD *)v48 + 2) = objc_msgSend(v54, "mCellularBandwidthKHz");

        if (v106)
        {
          v55 = 0;
          v56 = v104;
          do
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v9));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mCellAggressor1"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "mBandPolicy"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectAtIndexedSubscript:", v55));
            v62 = objc_msgSend(v61, "mMitigationType");

            if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v62))goto LABEL_27;
            *(v56 - 3) = 1;
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndexedSubscript:", v9));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "mCellAggressor1"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "mBandPolicy"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectAtIndexedSubscript:", v55));
            *(v56 - 2) = objc_msgSend(v67, "mCellularAntBitmap");

            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectAtIndexedSubscript:", v9));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "mCellAggressor1"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "mBandPolicy"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v55));
            *(v56 - 1) = objc_msgSend(v72, "mCellularTxPowerCap");

            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectAtIndexedSubscript:", v9));
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "mCellAggressor1"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "mBandPolicy"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectAtIndexedSubscript:", v55));
            *v56 = objc_msgSend(v77, "mMitigationType");
            v56 += 4;

          }
          while (v106 != ++v55);
        }
        if (v105)
        {
          v78 = 0;
          v79 = v103;
          while (1)
          {
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectAtIndexedSubscript:", v9));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "mCellAggressor2"));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "mBandPolicy"));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectAtIndexedSubscript:", v78));
            v62 = objc_msgSend(v84, "mMitigationType");

            if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v62))break;
            *(v79 - 3) = 1;
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectAtIndexedSubscript:", v9));
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "mCellAggressor2"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "mBandPolicy"));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectAtIndexedSubscript:", v78));
            *(v79 - 2) = objc_msgSend(v89, "mCellularAntBitmap");

            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndexedSubscript:", v9));
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "mCellAggressor2"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "mBandPolicy"));
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", v78));
            *(v79 - 1) = objc_msgSend(v94, "mCellularTxPowerCap");

            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectAtIndexedSubscript:", v9));
            v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "mCellAggressor2"));
            v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "mBandPolicy"));
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectAtIndexedSubscript:", v78));
            *v79 = objc_msgSend(v99, "mMitigationType");
            v79 += 4;

            if (v105 == ++v78)
              goto LABEL_25;
          }
LABEL_27:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver: Set GNSS IMD Antenna Blk Policy, invalid mitigationType=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed"), v62);
          goto LABEL_31;
        }
LABEL_25:
        ++v9;
        v103 += 28;
        v104 += 28;
        if (v9 == v102)
          goto LABEL_29;
      }
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectAtIndexedSubscript:", v9));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, invalid imdType=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed"), objc_msgSend(v101, "mImdType"));

    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, invalid lqmThreshold=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed"), objc_msgSend(v4, "mLqmThreshold"));
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver ERROR: Invalid AntBlockPowerLimitPolicyClientGnssImd received\n"));
  }
LABEL_31:

}

- (void)handleRc1DynamicPolicy:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  _DWORD *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  WCM_AriCoexCommandHandlerV2 *i;
  id v26;
  id v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  _BYTE v30[87];
  unsigned __int8 v31;
  _QWORD v32[89];
  int v33;
  int v34;
  int v35;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  v23 = v4;
  v35 = v4;
  if (v6)
  {
    v22 = v6;
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      v33 = 20;
      do
      {
        v9 = (_DWORD *)((char *)&v32[1] + v8 + 4);
        *v9 = 0;
        v9[9] = 3;
        v9[5] = 127;
        v8 += 44;
      }
      while (v8 != 704);
      v32[0] = 0;
      v31 = 0;
      if (-[WCM_AriCoexCache get:value_uint64:subId:](self->super.mCache, "get:value_uint64:subId:", CFSTR("UWB_LQM_Threshold"), v32, v4))
      {
        v33 = v32[0];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy, LQM_Threshold = %u"), v4, v32[0]);
      }
      if (-[WCM_AriCoexCache get:value_BOOL:subId:](self->super.mCache, "get:value_BOOL:subId:", CFSTR("UWB_PC1_Deny_Voice_Protection"), &v31, v4))
      {
        v34 = v31;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy, Deny_Voice_Protection = %d"), v4, v31);
      }
      v10 = 0;
      for (i = self; ; self = i)
      {
        v11 = v10;
        if ((unint64_t)objc_msgSend(v7, "count") <= v10)
        {
          AriSdk::ARI_UtaIdcSetUwbRtActivityMitigationConfigReqV2_SDK::ARI_UtaIdcSetUwbRtActivityMitigationConfigReqV2_SDK((AriSdk::ARI_UtaIdcSetUwbRtActivityMitigationConfigReqV2_SDK *)v30);
          sub_100021F00();
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v10));
        *((_DWORD *)&v32[1] + 11 * v10 + 1) = 1;
        v13 = objc_msgSend(v12, "Rc1PriorityBitmap");
        *((_DWORD *)&v32[2] + 11 * v11) = (_DWORD)v13;
        v29 = (unsigned __int16)objc_msgSend(v12, "nbChannelToAvoidStart");
        *((_WORD *)&v32[2] + 22 * v11 + 2) = v29;
        v28 = (unsigned __int16)objc_msgSend(v12, "nbChannelToAvoidEnd");
        *((_WORD *)&v32[2] + 22 * v11 + 3) = v28;
        v27 = objc_msgSend(v12, "Rc1AntBitmap");
        *((_DWORD *)&v32[3] + 11 * v11) = (_DWORD)v27;
        v26 = objc_msgSend(v12, "cellBand");
        *((_DWORD *)&v32[3] + 11 * v11 + 1) = (_DWORD)v26;
        if (!-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", objc_msgSend(v12, "bandInfoType")))
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy, invalid coexTech=%u, API UtaIdcSetUwbRtActivityMitigationConfigReq failed"), v23, objc_msgSend(v12, "bandInfoType"));
          goto LABEL_17;
        }
        v24 = objc_msgSend(v12, "bandInfoType");
        *((_DWORD *)&v32[4] + 11 * v11) = (_DWORD)v24;
        v14 = objc_msgSend(v12, "uplinkHighFreq_Hz");
        v15 = objc_msgSend(v12, "uplinkLowFreq_Hz");
        v16 = (v14 - v15) / 0x3E8uLL;
        v17 = (v14 - v15) / 0x7D0 + ((unint64_t)objc_msgSend(v12, "uplinkLowFreq_Hz") / 0x3E8);
        v18 = (char *)&v32[1] + 44 * v11 + 4;
        *((_DWORD *)v18 + 6) = v17;
        *((_DWORD *)v18 + 7) = v16;
        v19 = objc_msgSend(v12, "cellAgressorAntBitmap");
        *((_DWORD *)&v32[5] + 11 * v11 + 1) = (_DWORD)v19;
        if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](i, "mitigationTypeEnumCheck:", objc_msgSend(v12, "mitigationType")))break;
        v20 = objc_msgSend(v12, "mitigationType");
        *((_DWORD *)&v32[6] + 11 * v11) = (_DWORD)v20;
        v21 = objc_msgSend(v12, "cellTxPowerCap_16th_dBm");
        *((_DWORD *)&v32[6] + 11 * v11 + 1) = (_DWORD)v21;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy[%u], priority_bitmap = 0x%X, "), v23, v11, v13);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy[%u], nb_channel_start = %u, nb_channel_end = %u"), v23, v11, v29, v28);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy[%u], uwb_antenna_bitmap = %u, cellular_band = %u"), v23, v11, v27, v26);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy[%u], coex_tech = %u, cellular_aggressor_antenna_bitmap = 0x%X"), v23, v11, v24, v19);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy[%u], center_freq_khz = %u, bandwidth_khz = %u"), v23, v11, v17, v16);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy[%u], mitigation_type = %u, cellular_tx_power_cap(1/16dBm) = %d"), v23, v11, v20, v21);

        v10 = v11 + 1;
        v7 = v22;
      }
      v7 = v22;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set UWB RT Policy, invalid mitigationType=%u, API UtaIdcSetUwbRtActivityMitigationConfigReq failed"), v23, objc_msgSend(v12, "mitigationType"));
LABEL_17:

    }
  }

}

@end
