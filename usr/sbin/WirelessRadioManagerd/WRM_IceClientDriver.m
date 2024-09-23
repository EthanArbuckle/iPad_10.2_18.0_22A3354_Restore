@implementation WRM_IceClientDriver

- (WRM_IceClientDriver)init
{
  WRM_IceClientDriver *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_object *fObj;
  ice::Client ***p_mIceClient;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t *ptr;
  WRM_IceClientDriver *v12;
  ice::Client **v13;
  WRM_IceClientDriver *v14;
  _QWORD v16[4];
  WRM_IceClientDriver *v17;
  _QWORD v18[4];
  WRM_IceClientDriver *v19;
  __int128 v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)WRM_IceClientDriver;
  v2 = -[WRM_IceClientDriver init](&v21, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.WRM_IceClientDriver", v4);
    fObj = v2->mQueue.fObj.fObj;
    v2->mQueue.fObj.fObj = (OS_dispatch_object *)v5;

    sub_100059F1C((id *)&v2->mQueue.fObj.fObj, (OS_dispatch_object *)"com.apple.WirelessRadioManagerd", &v20);
    p_mIceClient = (ice::Client ***)&v2->mIceClient;
    sub_100020AA4((uint64_t)&v2->mIceClient, &v20);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    ptr = (uint64_t *)v2->mIceClient.__ptr_;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100058E08;
    v18[3] = &unk_100201838;
    v12 = v2;
    v19 = v12;
    sub_1000CA8A0(ptr, 0, (uint64_t)v18);
    v13 = *p_mIceClient;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100058E10;
    v16[3] = &unk_100201838;
    v14 = v12;
    v17 = v14;
    sub_1000CA8A0((uint64_t *)v13, 1, (uint64_t)v16);
    v14->mSlotOneCellID = 0;
    v14->mSlotTwoCellID = 0;
    v14->mClientStarted = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE Client to be started"));
    sub_1000CA890(*p_mIceClient);

  }
  return v2;
}

- (void)clientStarted
{
  uint64_t *ptr;
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE Client started"));
  ptr = (uint64_t *)self->mIceClient.__ptr_;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058FA0;
  v10[3] = &unk_100201860;
  v10[4] = self;
  sub_1000CA970(ptr, 494960640, (uint64_t)v10);
  v4 = (uint64_t *)self->mIceClient.__ptr_;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100058FB0;
  v9[3] = &unk_100201860;
  v9[4] = self;
  sub_1000CA970(v4, 629276672, (uint64_t)v9);
  v5 = (uint64_t *)self->mIceClient.__ptr_;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058FC0;
  v8[3] = &unk_100201860;
  v8[4] = self;
  sub_1000CA970(v5, 227573760, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"));
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "isSisSupportedOnICE"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE Client startBandwidthEstimation"));
      -[WRM_IceClientDriver startBandwidthEstimation:](self, "startBandwidthEstimation:", 1);
      -[WRM_IceClientDriver startBandwidthEstimation:](self, "startBandwidthEstimation:", 2);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE Client NOT startBandwidthEstimation"));
    }
  }

  -[WRM_IceClientDriver setHandlerLocationDbInfo](self, "setHandlerLocationDbInfo");
  self->mClientStarted = 1;
}

- (void)clientStopped
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE Client stopped"));
  self->mClientStarted = 0;
}

- (void)startBandwidthEstimation:(int64_t)a3
{
  _BOOL4 v4;
  _BYTE v5[80];

  AriSdk::ARI_IBICallPsStartBandwidthEstimationReq_SDK::ARI_IBICallPsStartBandwidthEstimationReq_SDK((AriSdk::ARI_IBICallPsStartBandwidthEstimationReq_SDK *)v5);
  v4 = sub_100078038(a3);
  sub_100021F00();
}

- (void)stopBandwidthEstimation:(int64_t)a3
{
  _BOOL4 v4;
  _BYTE v5[72];

  AriSdk::ARI_IBICallPsStopBandwidthEstimationReq_SDK::ARI_IBICallPsStopBandwidthEstimationReq_SDK((AriSdk::ARI_IBICallPsStopBandwidthEstimationReq_SDK *)v5);
  v4 = sub_100078038(a3);
  sub_100021F00();
}

- (void)IBINetRegistrationInfoIndCbHandle:(char *)a3 size:(unsigned int)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBINetRegistrationInfoIndCb received"));
}

- (void)IBINetRadioSignalIndCbHandle:(char *)a3 size:(unsigned int)a4
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  const char *v12;
  const char *v13;
  _BYTE v14[64];
  int *v15;
  int *v16;
  uint64_t v17;

  AriSdk::ARI_IBINetRadioSignalIndCb_SDK::ARI_IBINetRadioSignalIndCb_SDK((AriSdk::ARI_IBINetRadioSignalIndCb_SDK *)v14, (const unsigned __int8 *)a3, a4);
  if ((ice::isARIResponseValid((ice *)v14, (const AriSdk::MsgBase *)0x25820000, v4) & 1) != 0)
  {
    v5 = AriSdk::ARI_IBINetRadioSignalIndCb_SDK::unpack((AriSdk::ARI_IBINetRadioSignalIndCb_SDK *)v14);
    if ((_DWORD)v5)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Failed to unpack IBINetRadioSignalIndCb: %s (%u)"), asString(v5), v5);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"));
      v7 = sub_100051A58(*v15);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBINetRadioSignalIndCbHandle nInstance = %s"), sub_100078044(v7));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBINetRadioSignalIndCbHandle scell_rat = %s"), sub_100078068(*v16));
      v8 = sub_100051A58(*v15);
      v9 = *v16;
      v10 = sub_100078380((uint64_t)v14);
      v11 = sub_1000783C8((uint64_t)v14);
      if (v10 >= 0x100u)
      {
        v12 = sub_100078410(v9);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBINetRadioSignalIndCbHandle %s = %fdBm"), v12, sub_100078434(v10, v9));
      }
      if (v11 >= 0x100u)
      {
        v13 = sub_100078478(v9);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBINetRadioSignalIndCbHandle %s = %fdB"), v13, sub_10007849C(v11, v9));
      }
      if (v9 == 2)
      {
        if (v10 >= 0x100u && v11 >= 0x100u)
        {
          objc_msgSend(v6, "setServingCellRSCP:forSim:", v8, sub_100078434(v10, 2));
          objc_msgSend(v6, "setServingCellECIO:forSim:", v8, sub_10007849C(v11, 2));
        }
      }
      else if (v9 == 8)
      {
        if (v10 >= 0x100u && v11 >= 0x100u)
        {
          objc_msgSend(v6, "setNrRSRP:forSim:", v8, sub_100078434(v10, 8));
          objc_msgSend(v6, "setNrRSRQ:forSim:", v8, sub_10007849C(v11, 8));
          objc_msgSend(v6, "evaluateCbrsInDualSimMode:", 0);
        }
        if (v17)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBINetRadioSignalIndCbHandle NR cell_id = %llu, narfcn=%u, pci=%u, cell_grp_id=%u, sinr=%f"), *(_QWORD *)(v17 + 60), *(unsigned int *)(v17 + 52), *(unsigned __int16 *)(v17 + 56), *(unsigned __int8 *)(v17 + 58), sub_100078320(*(unsigned __int8 *)(v17 + 68)));
          objc_msgSend(v6, "setNrSNR:forSim:", v8, sub_100078320(*(unsigned __int8 *)(v17 + 68)));
        }
      }
      else if (v9 == 3 && v10 >= 0x100u && v11 >= 0x100u)
      {
        objc_msgSend(v6, "setServingCellRSRP:forSim:", v8, sub_100078434(v10, 3));
        objc_msgSend(v6, "setServingCellRSRQ:forSim:", v8, sub_10007849C(v11, 3));
        objc_msgSend(v6, "evaluateCbrsInDualSimMode:", 0);
      }

    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE ERROR: Invalid IBINetRadioSignalIndCbHandle received"));
  }
  AriSdk::ARI_IBINetRadioSignalIndCb_SDK::~ARI_IBINetRadioSignalIndCb_SDK((AriSdk::ARI_IBINetRadioSignalIndCb_SDK *)v14);
}

- (void)IBICallPsBandwidthEstimationIndHandle:(char *)a3 size:(unsigned int)a4
{
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  unint64_t v16;
  unint64_t *p_mSlotOneCellID;
  unint64_t mSlotOneCellID;
  unint64_t mSlotTwoCellID;
  unsigned int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  void *v54;
  void *v55;
  _BYTE v56[64];
  int *v57;
  uint64_t v58;
  unsigned int *v59;
  unsigned __int8 *v60;
  unsigned int *v61;
  unsigned __int8 *v62;
  unsigned int *v63;

  AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK::ARI_IBICallPsBandwidthEstimationInd_SDK((AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK *)v56, (const unsigned __int8 *)a3, a4);
  if ((ice::isARIResponseValid((ice *)v56, (const AriSdk::MsgBase *)0xD908000, v5) & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE ERROR: Invalid IBICallPsBandwidthEstimationInd received"));
    goto LABEL_51;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd received"));
  v6 = AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK::unpack((AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK *)v56);
  if ((_DWORD)v6)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Failed to unpack IBICallPsBandwidthEstimationInd: %s (%u)"), asString(v6), v6);
    goto LABEL_51;
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"));
  v54 = v7;
  v8 = sub_100051A58(*v57);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd nInstance = %s"), sub_100078044(v8));
  if (!v58)
  {
    v53 = 0;
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  v10 = *(_DWORD *)v58;
  v9 = *(unsigned int *)(v58 + 4);
  v51 = *(_DWORD *)(v58 + 8);
  v11 = *(unsigned int *)(v58 + 16);
  v49 = *(unsigned int *)(v58 + 12);
  v13 = *(unsigned int *)(v58 + 20);
  v12 = *(unsigned int *)(v58 + 24);
  v14 = *(_QWORD *)(v58 + 28);
  v15 = sub_100078068(*(_DWORD *)v58);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd serv_cell_info_t2.primary_nb_rat=%s, primary_gNb_freq_range=%d, secondary_nb_rat=%s, secondary_gNb_freq_range =%d, mcc=%u, mnc=%u, tac=%u, cell_id=%lu"), v15, v9, sub_100078068(v51), v49, v11, v13, v12, v14);
  if (sub_100051A58(*v57) == 1)
  {
    mSlotOneCellID = self->mSlotOneCellID;
    p_mSlotOneCellID = &self->mSlotOneCellID;
    v16 = mSlotOneCellID;
  }
  else
  {
    if (sub_100051A58(*v57) != 2)
    {
LABEL_12:
      v20 = 0;
      v7 = v54;
      goto LABEL_14;
    }
    mSlotTwoCellID = self->mSlotTwoCellID;
    p_mSlotOneCellID = &self->mSlotTwoCellID;
    v16 = mSlotTwoCellID;
  }
  if (v16 == v14)
    goto LABEL_12;
  *p_mSlotOneCellID = v14;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u.%u.%u.%llu"), v11, v13, v12, v14));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u.%u"), v11, v13));
  v7 = v54;
  v23 = sub_100051A58(*v57);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s GCI: %@, Prefix: %@"), sub_100078044(v23), v21, v22);
  objc_msgSend(v54, "updateGlobalCellID:gci:cellprefix:", *v57, v21, objc_msgSend(v22, "length"));

  v20 = 1;
LABEL_14:
  if (v10 == 8)
  {
    v24 = 1;
    v25 = 3;
    goto LABEL_16;
  }
  v24 = 0;
  if (v10 == 3)
  {
    v25 = 0;
    v53 = 0;
    if (v51 == 8)
    {
      v26 = v49;
      if ((_DWORD)v49 == 1)
      {
        v24 = 1;
        v25 = v49;
        goto LABEL_17;
      }
      if ((_DWORD)v49 == 2)
      {
        v24 = 1;
        v25 = 2;
      }
      else
      {
        v24 = 0;
        v25 = 0;
      }
LABEL_16:
      v26 = 1;
LABEL_17:
      v53 = v26;
    }
  }
  else
  {
    v25 = 0;
    v53 = 0;
  }
  v27 = sub_100051A58(*v57);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s Cell Changed %d, nrCellType: %d"), sub_100078044(v27), v20, v25);
  if ((v20 | v24) != 1)
    goto LABEL_20;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Callling updateCurrentRatInfo"));
  objc_msgSend(v7, "updateCurrentRatInfo:currentNRCell:", sub_100051A58(*v57), v25);
  objc_msgSend(v55, "evaluateWiFiVersusCell");
LABEL_21:
  if (v59)
  {
    v28 = *v59;
    v29 = v59[1];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd configured_max_bw_t3.uplink_throughput=%u, downlink_throughput=%u"), v28, v29);
    objc_msgSend(v7, "updateConfiguredMaxBW:dlbw:ulbw:", sub_100051A58(*v57), v29, v28);
  }
  if (v60)
  {
    v30 = *(unsigned int *)v60;
    v31 = v60[4];
    v32 = v60[5];
    v33 = v60[6];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd downlink_bw_estimation_t4.allowed_rate=%ukbps, confidence_level=%u, split_lte_percent=%u, split_5g_percent=%u"), v30, v31, v32, v33);
    objc_msgSend(v7, "updateDownlinkEstimatedBW:bw:conf:lte:nr:", sub_100051A58(*v57), v30, v31, v32, v33);
    objc_msgSend(v55, "forceActiveModeEval:", 1);
    objc_msgSend(v55, "evaluateWiFiVersusCell");
    objc_msgSend(v55, "forceActiveModeEval:", 0);
  }
  if (v61)
  {
    v34 = *v61;
    v35 = *((unsigned __int8 *)v61 + 4);
    v36 = *((unsigned __int8 *)v61 + 5);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd uplink_bw_estimation_t5.allowed_rate=%ukbps, confidence_level=%u, queue_size=%u"), v34, v35, v36);
    objc_msgSend(v7, "updateUplinkEstimatedBW:bw:conf:queue:", sub_100051A58(*v57), v34, v35, v36);
    objc_msgSend(v55, "forceActiveModeEval:", 1);
    objc_msgSend(v55, "evaluateWiFiVersusCell");
    objc_msgSend(v55, "forceActiveModeEval:", 0);
  }
  if (v62)
  {
    v37 = v62[1];
    v38 = *((unsigned int *)v62 + 4);
    v39 = *((_DWORD *)v62 + 6);
    v48 = v62[13];
    v50 = v62[12];
    v52 = *((unsigned int *)v62 + 2);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd connected_state_summary_t6.max_ue_rank=%u, max_network_mimo_layer=%u, max_scheduled_mimo_layer=%u, max_dl_modulation=%u, max_ul_modulation=%u, total_dl_mimo_layers=%u, total_num_cc=%u, aggregated_dl_bw=%umHz, aggregated_ul_bw=%umHz, nr5g_neighbor_cell=%u, rsrp=%ddBm, log_sinr_10xDb=%u"), *v62, v37, v62[2], *((unsigned int *)v62 + 1), v52, v50, v48, v38, *((unsigned int *)v62 + 5), v39, *((unsigned int *)v62 + 7), v62[32]);
    v40 = objc_msgSend(v7, "getWRMCellOutrankWifiBWThreshold");
    switch(v39)
    {
      case 2u:
        v42 = 0;
        v43 = 3;
        v44 = 1;
        v41 = 1;
        break;
      case 3u:
        v41 = 0;
        v42 = 0;
        v44 = 1;
        v43 = 1;
        break;
      case 4u:
        v41 = 0;
        v42 = 0;
        v43 = 2;
        v44 = 1;
        break;
      default:
        v44 = 0;
        v41 = 0;
        v43 = 0;
        v42 = 1;
        break;
    }
    v45 = sub_100051A58(*v57);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s Cell Changed %d, nrCellType: %d"), sub_100078044(v45), v20, v43);
    if ((v20 | v44) == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Calling updateConnectedStateSummary"));
      objc_msgSend(v54, "updateConnectedStateSummary:neighberNRCell:highrateIndicator:", sub_100051A58(*v57), v43, v38 >= v40);
      objc_msgSend(v55, "evaluateWiFiVersusCell");
    }
    if ((v20 | v41 | v42) == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Calling updateHighRateLikely"));
      objc_msgSend(v54, "updateHighRateLikely:highrateIndicator:", sub_100051A58(*v57), v38 >= v40);
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"));
    v47 = v46;
    v7 = v54;
    if (v53)
    {
      objc_msgSend(v46, "updateNRQSHMetrics:::", v38, v37, v52);
    }
    else
    {
      objc_msgSend(v46, "updateQSHMetrics::::", v48, v38, v50, v37);
      objc_msgSend(v54, "updateLTEBandwidth:LTEBW:", sub_100051A58(*v57), v38);
    }

  }
  if (v63)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("ICE IBICallPsBandwidthEstimationInd rlgs_info_t7.congested = %d"), *v63);
    objc_msgSend(v55, "evaluateWiFiVersusCell");
  }

LABEL_51:
  AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK::~ARI_IBICallPsBandwidthEstimationInd_SDK((AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK *)v56);
}

- (void).cxx_destruct
{
  IBICallPsWrmSdmLocationDBCellPerRatInfo *begin;
  IBICallPsWrmSdmLocationDBCellPerRatInfo *v4;
  IBICallPsWrmSdmLocationDBCellPerRatInfo *v5;
  IBICallPsWrmSdmLocationDBCellPerRatInfo *v6;
  OS_dispatch_object *fObj;

  begin = self->mLocationDbInfo.sadcCellInfoList.__begin_;
  if (begin)
  {
    self->mLocationDbInfo.sadcCellInfoList.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->mLocationDbInfo.saCellInfoList.__begin_;
  if (v4)
  {
    self->mLocationDbInfo.saCellInfoList.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->mLocationDbInfo.lteNsaCellInfoList.__begin_;
  if (v5)
  {
    self->mLocationDbInfo.lteNsaCellInfoList.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->mLocationDbInfo.lteCellInfoList.__begin_;
  if (v6)
  {
    self->mLocationDbInfo.lteCellInfoList.__end_ = v6;
    operator delete(v6);
  }
  fObj = self->mQueue.fObj.fObj;
  self->mQueue.fObj.fObj = 0;

  sub_10002C2C4((uint64_t)&self->mIceClient);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
