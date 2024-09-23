@implementation WCM_BTControllerIOS

- (void)updateWiFiCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4 band:(int)a5 desiredBtDc:(int)a6
{
  unsigned int v9;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;

  v9 = a3;
  v11 = xpc_dictionary_create(0, 0, 0);
  v12 = xpc_uint64_create(v9);
  xpc_dictionary_set_value(v11, "kWCMBTWiFiState_Priority", v12);
  xpc_release(v12);
  v13 = xpc_uint64_create(a4);
  xpc_dictionary_set_value(v11, "kWCMWiFiState_Bitmap", v13);
  xpc_release(v13);
  v14 = xpc_uint64_create(a5);
  xpc_dictionary_set_value(v11, "kWCMWiFiState_Band", v14);
  xpc_release(v14);
  v15 = xpc_uint64_create(a6);
  xpc_dictionary_set_value(v11, "kWCMWiFiState_DesiredBtDc", v15);
  xpc_release(v15);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 107, v11);
  xpc_release(v11);
}

- (void)updatePreferredAFHMap:(id)a3
{
  BOOL v5;
  __objc2_class **p_superclass;
  xpc_object_t v7;
  unsigned int v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  char v12;
  const __CFBitVector *v13;
  __CFBitVector *Mutable;
  CFIndex v15;
  __CFBitVector *MutableCopy;
  CFIndex v17;
  CFBit v18;
  CFIndex j;
  CFBit BitAtIndex;
  CFIndex k;
  CFBit v22;
  CFIndex m;
  uint64_t n;
  __objc2_class **v25;
  unsigned int v26;
  __objc2_class **v27;
  uint64_t v28;
  char v29;
  NSData *v30;
  xpc_object_t v32;
  WCM_BTControllerIOS *v33;
  UInt8 v34[5];
  int v35;
  unsigned __int8 v36;
  UInt8 v37[10];
  uint64_t bytes;
  unsigned __int16 v39;
  CFRange v40;

  objc_msgSend(a3, "getBytes:length:", &bytes, 10);
  v5 = bytes == *(_QWORD *)((char *)&self->mRoleRequested + 3)
    && v39 == (unint64_t)*(unsigned __int16 *)&self->mCurrentAFHMap[4];
  p_superclass = WRM_SCService.superclass;
  if (v5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("AFH already set to %@"), a3);
  }
  else
  {
    -[WCM_BTControllerIOS printAFHMap:](self, "printAFHMap:", (char *)&self->mRoleRequested + 3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("AFH needs update to %@"), a3);
    -[WCM_BTControllerIOS printAFHMap:](self, "printAFHMap:", &bytes);
    *(_QWORD *)((char *)&self->mRoleRequested + 3) = bytes;
    *(_WORD *)&self->mCurrentAFHMap[4] = v39;
    v7 = xpc_data_create(&bytes, 0xAuLL);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1408, v7);
    xpc_release(v7);
  }
  v8 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("BLEAFHMapConversion"));
  if (a3 && v8)
  {
    v33 = self;
    for (i = 0; i != 10; ++i)
    {
      v10 = 0;
      v11 = 0;
      v12 = 7;
      do
      {
        if (((*((unsigned __int8 *)&bytes + i) >> v10) & 1) != 0)
          v11 |= 1 << v12;
        else
          v11 &= ~(1 << v12);
        ++v10;
        --v12;
      }
      while (v10 != 8);
      v37[i] = v11;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d"), i, v11);
    }
    v13 = CFBitVectorCreate(kCFAllocatorDefault, v37, 80);
    Mutable = CFBitVectorCreateMutable(kCFAllocatorDefault, 40);
    CFBitVectorSetCount(Mutable, 40);
    v15 = 1;
    CFBitVectorSetAllBits(Mutable, 1u);
    MutableCopy = CFBitVectorCreateMutableCopy(kCFAllocatorDefault, 40, Mutable);
    v17 = 3;
    do
    {
      v18 = CFBitVectorGetBitAtIndex(v13, v17 - 2)
         && CFBitVectorGetBitAtIndex(v13, v17 - 1)
         && CFBitVectorGetBitAtIndex(v13, v17) != 0;
      CFBitVectorSetBitAtIndex(Mutable, v15++, v18);
      v17 += 2;
    }
    while (v15 != 40);
    for (j = 0; j != 11; ++j)
    {
      BitAtIndex = CFBitVectorGetBitAtIndex(Mutable, j + 1);
      CFBitVectorSetBitAtIndex(MutableCopy, j, BitAtIndex);
    }
    for (k = 13; k != 39; ++k)
    {
      v22 = CFBitVectorGetBitAtIndex(Mutable, k);
      CFBitVectorSetBitAtIndex(MutableCopy, k - 2, v22);
    }
    for (m = 37; m != 40; ++m)
      CFBitVectorSetBitAtIndex(MutableCopy, m, 1u);
    v40.location = 0;
    v40.length = 40;
    CFBitVectorGetBits(MutableCopy, v40, v34);
    for (n = 0; n != 5; ++n)
    {
      v25 = p_superclass;
      v26 = v34[n];
      v27 = v25;
      objc_msgSend(v25 + 279, "logLevel:message:", 4, CFSTR("DLDebugBLE_ coexBTAFHMap[%ld] = %d"), n, v34[n]);
      v28 = 0;
      v29 = 7;
      do
      {
        if (((v26 >> v28) & 1) != 0)
          v11 |= 1 << v29;
        else
          v11 &= ~(1 << v29);
        ++v28;
        --v29;
      }
      while (v28 != 8);
      *((_BYTE *)&v35 + n) = v11;
      p_superclass = v27;
      objc_msgSend(v27 + 279, "logLevel:message:", 4, CFSTR("DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d"), n, v11);
    }
    v30 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v35, 5);
    if (v35 == *(_DWORD *)&v33->mCurrentAFHMap[6] && v36 == v33->mCurrentBLEAFHMap[0])
    {
      objc_msgSend(v27 + 279, "logLevel:message:", 4, CFSTR("DLDebug_ BLE AFH already set to %@"), v30);
    }
    else
    {
      -[WCM_BTControllerIOS printBLEAFHMap:](v33, "printBLEAFHMap:", &v33->mCurrentAFHMap[6]);
      objc_msgSend(v27 + 279, "logLevel:message:", 2, CFSTR("DLDebug_ BLE AFH newBLEMap_BitVector needs update to %@"), v30);
      -[WCM_BTControllerIOS printBLEAFHMap:](v33, "printBLEAFHMap:", &v35);
      *(_DWORD *)&v33->mCurrentAFHMap[6] = v35;
      v33->mCurrentBLEAFHMap[0] = v36;
      v32 = xpc_data_create(&v35, 5uLL);
      objc_msgSend(p_superclass + 279, "logLevel:message:", 2, CFSTR("DLDebug_ Sending XPC Message for coexBLEAFHMap"));
      -[WCM_Controller sendMessage:withArgs:](v33, "sendMessage:withArgs:", 1425, v32);
      xpc_release(v32);
    }
    CFRelease(v13);
    CFRelease(Mutable);
    CFRelease(MutableCopy);
  }
}

- (double)getBtTxPer
{
  double v3;
  unint64_t v4;

  v3 = (double)-[WCM_BTControllerIOS mMovingAvgReTxCount](self, "mMovingAvgReTxCount");
  v4 = -[WCM_BTControllerIOS mMovingAvgSuccessfulTxCount](self, "mMovingAvgSuccessfulTxCount");
  return v3 / ((double)(-[WCM_BTControllerIOS mMovingAvgReTxCount](self, "mMovingAvgReTxCount") + v4) + 0.000001);
}

- (unint64_t)mMovingAvgReTxCount
{
  return *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulRxCount + 4);
}

- (unint64_t)mMovingAvgSuccessfulTxCount
{
  return *(unint64_t *)((char *)&self->_mPrevActivePhy + 4);
}

- (double)mMovingAvgRSSI
{
  return *(double *)((char *)&self->_mBtPhyRate + 4);
}

- (unint64_t)getMovingAvgBTRssi
{
  double v2;

  -[WCM_BTControllerIOS mMovingAvgRSSI](self, "mMovingAvgRSSI");
  return (unint64_t)v2;
}

- (WCM_BTControllerIOS)init
{
  char *v2;
  WCM_BTControllerIOS *v3;
  __int128 v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WCM_BTControllerIOS;
  v2 = -[WCM_BTController init](&v7, "init");
  v3 = (WCM_BTControllerIOS *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 41) = 0;
    v2[168] = 0;
    *((_DWORD *)v2 + 43) = 4;
    *((_DWORD *)v2 + 44) = 4;
    *(_QWORD *)(v2 + 180) = 0;
    *(_QWORD *)(v2 + 188) = 0;
    *(_QWORD *)(v2 + 196) = 0;
    *(_QWORD *)(v2 + 204) = 0;
    v2[230] = 0;
    *(_QWORD *)(v2 + 212) = 0;
    *((_DWORD *)v2 + 55) = 3;
    *((_DWORD *)v2 + 56) = 255;
    v2[228] = 0;
    v2[229] = 0;
    v2[342] = 0;
    *(_QWORD *)(v2 + 231) = -1;
    *(_WORD *)(v2 + 239) = -1;
    *(_DWORD *)(v2 + 241) = -1;
    v2[245] = -1;
    *(_QWORD *)&v4 = -1;
    *((_QWORD *)&v4 + 1) = -1;
    *(_OWORD *)(v2 + 246) = v4;
    *(_OWORD *)(v2 + 262) = v4;
    *(_OWORD *)(v2 + 278) = v4;
    *(_OWORD *)(v2 + 294) = v4;
    *(_OWORD *)(v2 + 310) = v4;
    *(_OWORD *)(v2 + 326) = v4;
    *(_QWORD *)(v2 + 343) = -1;
    *(_WORD *)(v2 + 351) = -1;
    *(_QWORD *)(v2 + 353) = -1;
    *(_WORD *)(v2 + 361) = -1;
    *(_QWORD *)(v2 + 363) = -1;
    *(_WORD *)(v2 + 371) = -1;
    *(_QWORD *)(v2 + 373) = -1;
    *(_WORD *)(v2 + 381) = -1;
    *(_QWORD *)(v2 + 388) = 0;
    *(_QWORD *)(v2 + 396) = 0;
    *(_QWORD *)(v2 + 404) = 0;
    *(_QWORD *)(v2 + 412) = 0;
    *(_QWORD *)(v2 + 420) = -1;
    *(_QWORD *)(v2 + 428) = -1;
    objc_msgSend(v2, "setMClassicRssi:", 128);
    -[WCM_BTControllerIOS setMMovingAvgRSSI:](v3, "setMMovingAvgRSSI:", 128.0);
    -[WCM_BTControllerIOS setMLeRssi:](v3, "setMLeRssi:", 128);
    -[WCM_BTControllerIOS setMMovingAvgRSSI:](v3, "setMMovingAvgRSSI:", 128.0);
    -[WCM_BTControllerIOS setMLeSuccessfulTxCount:](v3, "setMLeSuccessfulTxCount:", 0);
    -[WCM_BTControllerIOS setMLeSuccessfulTxCount:](v3, "setMLeSuccessfulTxCount:", 0);
    -[WCM_BTControllerIOS setMLeReTxCount:](v3, "setMLeReTxCount:", 0);
    -[WCM_BTControllerIOS setMLeSuccessfulRxCount:](v3, "setMLeSuccessfulRxCount:", 0);
    -[WCM_BTControllerIOS setMLeRxErrorCount:](v3, "setMLeRxErrorCount:", 0);
    -[WCM_BTControllerIOS setMLeCoexDenialCount:](v3, "setMLeCoexDenialCount:", 0);
    -[WCM_BTControllerIOS setMClassicSuccessfulTxCount:](v3, "setMClassicSuccessfulTxCount:", 0);
    -[WCM_BTControllerIOS setMClassicReTxCount:](v3, "setMClassicReTxCount:", 0);
    -[WCM_BTControllerIOS setMClassicSuccessfulRxCount:](v3, "setMClassicSuccessfulRxCount:", 0);
    -[WCM_BTControllerIOS setMClassicRxErrorCount:](v3, "setMClassicRxErrorCount:", 0);
    -[WCM_BTControllerIOS setMClassicCoexDenialCount:](v3, "setMClassicCoexDenialCount:", 0);
    -[WCM_BTControllerIOS setMPrevActivePhy:](v3, "setMPrevActivePhy:", 0);
    -[WCM_BTControllerIOS setMActivePhy:](v3, "setMActivePhy:", 0);
    -[WCM_BTControllerIOS setMActivePhyValid:](v3, "setMActivePhyValid:", 0);
    -[WCM_BTControllerIOS setMNonMagnetUtilization:](v3, "setMNonMagnetUtilization:", 0.0);
    -[WCM_BTControllerIOS setMMetricsReportReason:](v3, "setMMetricsReportReason:", 0);
    -[WCM_BTControllerIOS setMFlushCount:](v3, "setMFlushCount:", 0);
    -[WCM_BTControllerIOS setMBtPhyRate:](v3, "setMBtPhyRate:", 0);
    -[WCM_BTControllerIOS setMMovingAvgReTxCount:](v3, "setMMovingAvgReTxCount:", 0);
    -[WCM_BTControllerIOS setMMovingAvgRxErrorCount:](v3, "setMMovingAvgRxErrorCount:", 0);
    -[WCM_BTControllerIOS setMMovingAvgSuccessfulRxCount:](v3, "setMMovingAvgSuccessfulRxCount:", 0);
    -[WCM_BTControllerIOS setMMovingAvgSuccessfulTxCount:](v3, "setMMovingAvgSuccessfulTxCount:", 0);
    -[WCM_BTControllerIOS setMNumberofSamples:](v3, "setMNumberofSamples:", 0);
    -[WCM_BTControllerIOS setMLQMLinkEvalCounter:](v3, "setMLQMLinkEvalCounter:", 0);
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    -[WCM_BTControllerIOS setQueue:](v3, "setQueue:", dispatch_queue_create("com.apple.WirelessRadioManager.BTController", v5));
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
  if (v3)
    xpc_release(v3);
  if (-[WCM_BTControllerIOS queue](self, "queue"))
    dispatch_release((dispatch_object_t)-[WCM_BTControllerIOS queue](self, "queue"));
  -[WCM_BTControllerIOS setQueue:](self, "setQueue:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WCM_BTControllerIOS;
  -[WCM_BTController dealloc](&v4, "dealloc");
}

- (void)handlePowerState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  __int128 v6;
  objc_super v7;

  v3 = a3;
  if (a3)
  {
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1400, 0);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1401, 0);
    objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "requestBTStatus");
  }
  else
  {
    HIDWORD(self->super._AoSDeviceID) = 0;
    LOBYTE(self->mKeepWake) = 0;
    *(_DWORD *)&self->mWCI2State = 4;
    self->mAntennaConfig = 4;
    *(_QWORD *)&self->mDefaultAntenna = 0;
    *(double *)((char *)&self->mMWSUlCenterFreq + 4) = 0.0;
    *(double *)((char *)&self->mMWSDlCenterFreq + 4) = 0.0;
    *(double *)((char *)&self->mMWSUlBandwidth + 4) = 0.0;
    BYTE2(self->mRoleRequested) = 0;
    v5 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
    if (v5)
    {
      xpc_release(v5);
      *(double *)((char *)&self->mMWSDlBandwidth + 4) = 0.0;
    }
    HIDWORD(self->mMWSFrameConfig) = 3;
    self->mRoleCurrent = 255;
    LOBYTE(self->mRoleRequested) = 0;
    BYTE1(self->mRoleRequested) = 0;
    self->mCurrentHFBTChannelMap[92] = 0;
    *(_QWORD *)((char *)&self->mRoleRequested + 3) = -1;
    *(_WORD *)&self->mCurrentAFHMap[4] = -1;
    *(_DWORD *)&self->mCurrentAFHMap[6] = -1;
    self->mCurrentBLEAFHMap[0] = -1;
    *(_QWORD *)&v6 = -1;
    *((_QWORD *)&v6 + 1) = -1;
    *(_OWORD *)&self->mCurrentBLEAFHMap[1] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[12] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[28] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[44] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[60] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[76] = v6;
    *(_QWORD *)&self->mCurrentHFBTChannelMap[93] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC0B0[4] = -1;
    *(_QWORD *)&self->mDiversityAFHMapForC0B0[6] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC0B1[4] = -1;
    *(_QWORD *)&self->mDiversityAFHMapForC0B1[6] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC1B0[4] = -1;
    *(_QWORD *)&self->mDiversityAFHMapForC1B0[6] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC1B1[4] = -1;
    *(_QWORD *)&self->mDiversityAFHMapForC1B1[11] = 0;
    *(unint64_t *)((char *)&self->mLeConnDutyCycle + 4) = 0;
    *(unint64_t *)((char *)&self->mLeConnReason + 4) = 0;
    *(unint64_t *)((char *)&self->mLeConnBand + 4) = 0;
    *(unint64_t *)((char *)&self->mLeConnDuration + 4) = -1;
    *(int64_t *)((char *)&self->mLeDiscoveryScanState + 4) = -1;
    -[WCM_BTControllerIOS resetBtMetrics](self, "resetBtMetrics");
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1300);
    objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "initBTStatus");
    objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "sendBTStatusToWiFi");
    objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "updateBSPState");
  }
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1000);
  v7.receiver = self;
  v7.super_class = (Class)WCM_BTControllerIOS;
  -[WCM_BTController handlePowerState:](&v7, "handlePowerState:", v3);
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BTControllerIOS handleDisconnection"));
  -[WCM_BTControllerIOS handlePowerState:](self, "handlePowerState:", 0);
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  switch(uint64)
  {
    case 0x1F4uLL:
      -[WCM_BTController handleConnectionConfig:](self, "handleConnectionConfig:", a3);
      break;
    case 0x1F5uLL:
      -[WCM_BTController handleAudioConfig:](self, "handleAudioConfig:", a3);
      break;
    case 0x1F6uLL:
      -[WCM_BTControllerIOS handleScanStart:](self, "handleScanStart:", a3);
      break;
    case 0x1F7uLL:
      -[WCM_BTControllerIOS handleScanStop:](self, "handleScanStop:", a3);
      break;
    case 0x1F8uLL:
      -[WCM_BTControllerIOS handleLinkQaulity:](self, "handleLinkQaulity:", a3);
      break;
    case 0x1F9uLL:
      -[WCM_BTControllerIOS handleLTELinkQuality:](self, "handleLTELinkQuality:", a3);
      break;
    case 0x1FAuLL:
      -[WCM_BTController handleLocalDeviceState:](self, "handleLocalDeviceState:", a3);
      break;
    case 0x1FBuLL:
      -[WCM_BTControllerIOS handelAFHMap:](self, "handelAFHMap:", a3);
      break;
    case 0x1FCuLL:
      -[WCM_BTControllerIOS handleRawRSSI:](self, "handleRawRSSI:", a3);
      break;
    case 0x1FDuLL:
    case 0x202uLL:
    case 0x204uLL:
      goto LABEL_6;
    case 0x1FEuLL:
      -[WCM_BTControllerIOS handleAntennaPreferenceBResponse:](self, "handleAntennaPreferenceBResponse:", a3);
      break;
    case 0x1FFuLL:
      -[WCM_BTControllerIOS handleAntennaSwitchNotification:](self, "handleAntennaSwitchNotification:", a3);
      break;
    case 0x200uLL:
      -[WCM_BTControllerIOS handleBTMetricsRpt:](self, "handleBTMetricsRpt:", a3);
      break;
    case 0x201uLL:
      -[WCM_BTControllerIOS handleBTPhyRpt:](self, "handleBTPhyRpt:", a3);
      break;
    case 0x203uLL:
      -[WCM_BTControllerIOS handleBSPEvent:](self, "handleBSPEvent:", a3);
      break;
    case 0x205uLL:
      -[WCM_BTControllerIOS handleHFBTChannelMap:](self, "handleHFBTChannelMap:", a3);
      break;
    case 0x206uLL:
      -[WCM_BTControllerIOS handleLeDiscoveryScanStateChange:](self, "handleLeDiscoveryScanStateChange:", a3);
      break;
    default:
      if (uint64 == 108)
      {
        -[WCM_BTControllerIOS handleLeConn:](self, "handleLeConn:", a3);
      }
      else if (uint64 == 1406)
      {
        -[WCM_BTControllerIOS handleBTBandwidthLoad:](self, "handleBTBandwidthLoad:", a3);
      }
      else
      {
LABEL_6:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("BT controller dropping message-id %lld"), uint64);
      }
      break;
  }
}

- (int)getBTState
{
  int result;

  result = -[WCM_BTController powerState](self, "powerState");
  if (result)
  {
    if (-[NSMutableArray count](-[WCM_BTController btConnections](self, "btConnections"), "count"))
      return 2;
    else
      return 1;
  }
  return result;
}

- (int)getBTRole
{
  id v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = -[NSMutableArray count](-[WCM_BTController btConnections](self, "btConnections"), "count");
  if (v3)
  {
    if (v3 == (id)1)
    {
      LODWORD(v4) = objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[WCM_BTController btConnections](self, "btConnections"), "objectAtIndexedSubscript:", 0), "getRole") != 0;
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = -[WCM_BTController btConnections](self, "btConnections", 0);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
      {
        v6 = v4;
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v5);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "getRole"))
            {
              LODWORD(v4) = 2;
              return (int)v4;
            }
          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          LODWORD(v4) = 0;
          if (v6)
            continue;
          break;
        }
      }
    }
  }
  else
  {
    LODWORD(v4) = 3;
  }
  return (int)v4;
}

- (void)updateWCI2Mode:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;

  if (LOBYTE(self->mKeepWake) != a3)
  {
    v3 = a3;
    LOBYTE(self->mKeepWake) = a3;
    v5 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
    if (v3)
    {
      v6 = v5;
      v7 = (uint64_t)objc_msgSend(v5, "wcmBTWCI2ModeSendMsgBitmap");
      v8 = (uint64_t)objc_msgSend(v6, "wcmBTWCI2ModeRecvMsgBitmap");
    }
    else
    {
      v8 = 128;
      v7 = 2;
    }
    v9 = xpc_dictionary_create(0, 0, 0);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ConfigureWCI2 mode : RX=%lld, TX=%lld"), v8, v7);
    if (v9)
    {
      xpc_dictionary_set_uint64(v9, "kWCMBTSetWCI2Mode_ReceiveMessage", v8);
      xpc_dictionary_set_uint64(v9, "kWCMBTSetWCI2Mode_SendMessage", v7);
      -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1413, v9);
      xpc_release(v9);
    }
  }
}

- (void)updateMWSSignalingConfig
{
  id v3;
  xpc_object_t v4;
  uint64_t i;
  xpc_object_t values[15];
  char *keys[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const char *v14;

  v12 = *(_OWORD *)off_100203CC0;
  v13 = *(_OWORD *)off_100203CD0;
  *(_OWORD *)keys = *(_OWORD *)off_100203C70;
  v8 = *(_OWORD *)off_100203C80;
  v9 = *(_OWORD *)off_100203C90;
  v14 = "kWCMBTSetMWSSignaling_MWSPriorityAssertOffsetRequest";
  v10 = *(_OWORD *)off_100203CA0;
  v11 = *(_OWORD *)off_100203CB0;
  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  values[0] = xpc_int64_create((int64_t)objc_msgSend(v3, "wcmWCI2MWSRxAssertOffset"));
  values[1] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSRxAssertJitter"));
  values[2] = xpc_int64_create((int64_t)objc_msgSend(v3, "wcmWCI2MWSRxDeAssertOffset"));
  values[3] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSRxDeAssertJitter"));
  values[4] = xpc_int64_create((int64_t)objc_msgSend(v3, "wcmWCI2MWSTxAssertOffset"));
  values[5] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSTxAssertJitter"));
  values[6] = xpc_int64_create((int64_t)objc_msgSend(v3, "wcmWCI2MWSTxDeAssertOffset"));
  values[7] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSTxDeAssertJitter"));
  values[8] = xpc_int64_create((int64_t)objc_msgSend(v3, "wcmWCI2MWSPatternAssertOffset"));
  values[9] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSPatternAssertJitter"));
  values[10] = xpc_int64_create((int64_t)objc_msgSend(v3, "wcmWCI2MWSInactivityAssertOffset"));
  values[11] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSInactivityAssertJitter"));
  values[12] = xpc_int64_create((int64_t)objc_msgSend(v3, "wcmWCI2MWSScanFrequencyAssertOffset"));
  values[13] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSScanFrequencyAssertJitter"));
  values[14] = xpc_uint64_create((uint64_t)objc_msgSend(v3, "wcmWCI2MWSPriorityAssertOffsetRequest"));
  v4 = xpc_dictionary_create((const char *const *)keys, values, 0xFuLL);
  for (i = 0; i != 15; ++i)
    xpc_release(values[i]);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1412, v4);
  xpc_release(v4);
}

- (void)updateAwakeMode:(BOOL)a3
{
  int AoSDeviceID_high;
  int v5;

  AoSDeviceID_high = HIDWORD(self->super._AoSDeviceID);
  if (a3)
  {
    if (AoSDeviceID_high > 0)
      return;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Keeping BT awake"));
    v5 = open("/dev/btwake", 0);
  }
  else
  {
    if (AoSDeviceID_high < 1)
      return;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Letting BT go to sleep."));
    close(HIDWORD(self->super._AoSDeviceID));
    v5 = 0;
  }
  HIDWORD(self->super._AoSDeviceID) = v5;
}

- (void)updateMWSChannelParameters:(id)a3
{
  BOOL *v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    v5 = (BOOL *)&self->mRoleRequested + 1;
    v6 = BYTE1(self->mRoleRequested);
    v7 = 1;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("ZeroFreqDebug: CellController is Null in updateMWSChannelParameters."));
    *(double *)((char *)&self->mMWSUlBandwidth + 4) = 0.0;
    *(double *)((char *)&self->mMWSDlCenterFreq + 4) = 0.0;
    *(double *)((char *)&self->mMWSUlCenterFreq + 4) = 0.0;
    *(_QWORD *)&self->mDefaultAntenna = 0;
    v5 = (BOOL *)&self->mRoleRequested + 1;
    if (!BYTE1(self->mRoleRequested))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("MWS already disabled"));
      return;
    }
    v7 = 0;
    v6 = 1;
  }
  if (v7 == v6
    && (objc_msgSend(a3, "cachedULCenterFreq"), v8 == *(double *)&self->mDefaultAntenna)
    && (objc_msgSend(a3, "cachedULBandwidth"), v9 == *(double *)((char *)&self->mMWSDlCenterFreq + 4))
    && (objc_msgSend(a3, "dlCenterFreq"), v10 == *(double *)((char *)&self->mMWSUlCenterFreq + 4))
    && (objc_msgSend(a3, "dlBandwidth"), v11 == *(double *)((char *)&self->mMWSUlBandwidth + 4))
    && BYTE2(self->mRoleRequested) == objc_msgSend(a3, "tddBand"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Same MWS Enabled - NOT updating. cellular.tddBand=%d, mWSTDDBand=%d"), objc_msgSend(a3, "tddBand"), BYTE2(self->mRoleRequested));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("MWS needs Enabling - Something Changed. cellular.tddBand=%d, mWSTDDBand=%d"), objc_msgSend(a3, "tddBand"), BYTE2(self->mRoleRequested));
    objc_msgSend(a3, "cachedULCenterFreq");
    *(_QWORD *)&self->mDefaultAntenna = v12;
    objc_msgSend(a3, "cachedULBandwidth");
    *(_QWORD *)((char *)&self->mMWSDlCenterFreq + 4) = v13;
    objc_msgSend(a3, "dlCenterFreq");
    *(_QWORD *)((char *)&self->mMWSUlCenterFreq + 4) = v14;
    objc_msgSend(a3, "dlBandwidth");
    *(_QWORD *)((char *)&self->mMWSUlBandwidth + 4) = v15;
    BYTE2(self->mRoleRequested) = objc_msgSend(a3, "tddBand");
    *v5 = a3 != 0;
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1410, -[WCM_BTControllerIOS createChannelParameters:](self, "createChannelParameters:", a3));
  }
}

- (void)updateMWSFrameConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = -[WCM_BTControllerIOS createBTHCIExternalFrameConfigParams:](self, "createBTHCIExternalFrameConfigParams:");
    v5 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
    if (v5)
    {
      if (xpc_equal(v5, v4))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Same FrameConfig - NOT Updtaing"));
        return;
      }
      v6 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
      if (v6)
        xpc_release(v6);
    }
    *(_QWORD *)((char *)&self->mMWSDlBandwidth + 4) = xpc_copy(v4);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Updating FrameConfig"));
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1411, *(_QWORD *)((char *)&self->mMWSDlBandwidth + 4));
  }
}

- (void)updateBLEActiveScanPwrLmtAssertionInterval:(unint64_t)a3
{
  xpc_object_t v5;

  v5 = xpc_uint64_create(a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ Configuring BLE Active Scan Power Limiting (Type6 MSG) Assertion Interval as %llu"), a3);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1427, v5);
  xpc_release(v5);
}

- (void)updateHPCellularSessionStatus:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;

  v3 = a3;
  v5 = xpc_BOOL_create(a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular_ Configuring HPCellular Session Status to BT as %d"), v3);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1430, v5);
  xpc_release(v5);
}

- (void)updatePreferredHFBTChannelMap:(id)a3
{
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  xpc_object_t v10;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFAFHDebug_ channel map update to %@"), a3);
  v5 = objc_msgSend(a3, "bytes");
  if (!memcmp(v5, &self->mCurrentBLEAFHMap[1], 0x60uLL))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HFAFHDebug_ Channel map already set to the same"));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFAFHDebug_ Channel map needs update"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFAFHDebug_ New channel map"));
    -[WCM_BTControllerIOS printHFBTChannelMap:](self, "printHFBTChannelMap:", v5);
    v6 = v5[1];
    *(_OWORD *)&self->mCurrentBLEAFHMap[1] = *v5;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[12] = v6;
    v7 = v5[2];
    v8 = v5[3];
    v9 = v5[5];
    *(_OWORD *)&self->mCurrentHFBTChannelMap[60] = v5[4];
    *(_OWORD *)&self->mCurrentHFBTChannelMap[76] = v9;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[28] = v7;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[44] = v8;
    v10 = xpc_data_create(v5, 0x60uLL);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1432, v10);
    xpc_release(v10);
  }
}

- (void)updatePreferredAFHMapRCU2:(int)a3
{
  __objc2_class **p_superclass;
  char *v6;
  xpc_object_t v7;
  uint64_t i;
  uint64_t v9;
  int v10;
  char v11;
  const __CFBitVector *v12;
  __CFBitVector *Mutable;
  CFIndex v14;
  __CFBitVector *MutableCopy;
  CFIndex v16;
  CFBit v17;
  CFIndex j;
  CFBit BitAtIndex;
  CFIndex k;
  CFBit v21;
  CFIndex m;
  uint64_t n;
  __objc2_class **v24;
  unsigned int v25;
  __objc2_class **v26;
  uint64_t v27;
  char v28;
  xpc_object_t v29;
  WCM_BTControllerIOS *v30;
  UInt8 v31[5];
  UInt8 v32[5];
  UInt8 v33[10];
  uint64_t bytes;
  __int16 v35;
  CFRange v36;

  p_superclass = WRM_SCService.superclass;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updatePreferredAFHMapRCU2...Entry channel no %d"), *(_QWORD *)&a3);
  v35 = -1;
  bytes = -1;
  if ((a3 - 1) <= 0x19)
  {
    v6 = (char *)&unk_1001DE072 + 10 * a3 - 110;
    bytes = *(_QWORD *)v6;
    v35 = *((_WORD *)v6 + 4);
  }
  -[WCM_BTControllerIOS printAFHMap:](self, "printAFHMap:", (char *)&self->mRoleRequested + 3);
  -[WCM_BTControllerIOS printAFHMap:](self, "printAFHMap:", &bytes);
  *(_QWORD *)((char *)&self->mRoleRequested + 3) = bytes;
  *(_WORD *)&self->mCurrentAFHMap[4] = v35;
  v7 = xpc_data_create(&bytes, 0xAuLL);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1408, v7);
  xpc_release(v7);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("BLEAFHMapConversion")))
  {
    v30 = self;
    for (i = 0; i != 10; ++i)
    {
      v9 = 0;
      v10 = 0;
      v11 = 7;
      do
      {
        if (((*((unsigned __int8 *)&bytes + i) >> v9) & 1) != 0)
          v10 |= 1 << v11;
        else
          v10 &= ~(1 << v11);
        ++v9;
        --v11;
      }
      while (v9 != 8);
      v33[i] = v10;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d"), i, v10);
    }
    v12 = CFBitVectorCreate(kCFAllocatorDefault, v33, 80);
    Mutable = CFBitVectorCreateMutable(kCFAllocatorDefault, 40);
    CFBitVectorSetCount(Mutable, 40);
    v14 = 1;
    CFBitVectorSetAllBits(Mutable, 1u);
    MutableCopy = CFBitVectorCreateMutableCopy(kCFAllocatorDefault, 40, Mutable);
    v16 = 3;
    do
    {
      v17 = CFBitVectorGetBitAtIndex(v12, v16 - 2)
         && CFBitVectorGetBitAtIndex(v12, v16 - 1)
         && CFBitVectorGetBitAtIndex(v12, v16) != 0;
      CFBitVectorSetBitAtIndex(Mutable, v14++, v17);
      v16 += 2;
    }
    while (v14 != 40);
    for (j = 0; j != 11; ++j)
    {
      BitAtIndex = CFBitVectorGetBitAtIndex(Mutable, j + 1);
      CFBitVectorSetBitAtIndex(MutableCopy, j, BitAtIndex);
    }
    for (k = 13; k != 39; ++k)
    {
      v21 = CFBitVectorGetBitAtIndex(Mutable, k);
      CFBitVectorSetBitAtIndex(MutableCopy, k - 2, v21);
    }
    for (m = 37; m != 40; ++m)
      CFBitVectorSetBitAtIndex(MutableCopy, m, 1u);
    v36.location = 0;
    v36.length = 40;
    CFBitVectorGetBits(MutableCopy, v36, v31);
    for (n = 0; n != 5; ++n)
    {
      v24 = p_superclass;
      v25 = v31[n];
      v26 = v24;
      objc_msgSend(v24 + 279, "logLevel:message:", 4, CFSTR("DLDebugBLE_ coexBTAFHMap[%ld] = %d"), n, v31[n]);
      v27 = 0;
      v28 = 7;
      do
      {
        if (((v25 >> v27) & 1) != 0)
          v10 |= 1 << v28;
        else
          v10 &= ~(1 << v28);
        ++v27;
        --v28;
      }
      while (v27 != 8);
      v32[n] = v10;
      p_superclass = v26;
      objc_msgSend(v26 + 279, "logLevel:message:", 4, CFSTR("DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d"), n, v10);
    }
    objc_msgSend(v26 + 279, "logLevel:message:", 2, CFSTR("DLDebug_ BLE AFH newBLEMap_BitVector needs update to %@"), +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v32, 5));
    -[WCM_BTControllerIOS printBLEAFHMap:](v30, "printBLEAFHMap:", v32);
    v29 = xpc_data_create(v32, 5uLL);
    objc_msgSend(p_superclass + 279, "logLevel:message:", 2, CFSTR("DLDebug_ Sending XPC Message for coexBLEAFHMap"));
    -[WCM_Controller sendMessage:withArgs:](v30, "sendMessage:withArgs:", 1425, v29);
    xpc_release(v29);
    CFRelease(v12);
    CFRelease(Mutable);
    CFRelease(MutableCopy);
  }
}

- (void)updateDiversityAFHMapForC0B0:(id)a3 C0B1:(id)a4 C1B0:(id)a5 C1B1:(id)a6
{
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  uint64_t v20;
  unsigned __int16 v21;
  uint64_t v22;
  unsigned __int16 v23;
  uint64_t v24;
  unsigned __int16 v25;
  uint64_t bytes;
  unsigned __int16 v27;

  objc_msgSend(a3, "getBytes:length:", &bytes, 10);
  objc_msgSend(a4, "getBytes:length:", &v24, 10);
  objc_msgSend(a5, "getBytes:length:", &v22, 10);
  objc_msgSend(a6, "getBytes:length:", &v20, 10);
  v11 = bytes == *(_QWORD *)&self->mCurrentHFBTChannelMap[93]
     && v27 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC0B0[4];
  if (v11
    && (v24 == *(_QWORD *)&self->mDiversityAFHMapForC0B0[6]
      ? (v12 = v25 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC0B1[4])
      : (v12 = 0),
        v12
     && (v22 == *(_QWORD *)&self->mDiversityAFHMapForC0B1[6]
       ? (v13 = v23 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC1B0[4])
       : (v13 = 0),
         v13
      && (v20 == *(_QWORD *)&self->mDiversityAFHMapForC1B0[6]
        ? (v14 = v21 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC1B1[4])
        : (v14 = 0),
          v14))))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Diversity AFH already set to c0b0:%@ c0b1:%@ c1b0:%@ c1b1:%@"), a3, a4, a5, a6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Diversity AFH need to set to c0b0:%@ c0b1:%@ c1b0:%@ c1b1:%@"), a3, a4, a5, a6);
    *(_QWORD *)&self->mCurrentHFBTChannelMap[93] = bytes;
    *(_WORD *)&self->mDiversityAFHMapForC0B0[4] = v27;
    *(_QWORD *)&self->mDiversityAFHMapForC0B0[6] = v24;
    *(_WORD *)&self->mDiversityAFHMapForC0B1[4] = v25;
    *(_QWORD *)&self->mDiversityAFHMapForC0B1[6] = v22;
    *(_WORD *)&self->mDiversityAFHMapForC1B0[4] = v23;
    *(_QWORD *)&self->mDiversityAFHMapForC1B0[6] = v20;
    *(_WORD *)&self->mDiversityAFHMapForC1B1[4] = v21;
    v15 = xpc_dictionary_create(0, 0, 0);
    v16 = xpc_data_create(&bytes, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C0B0", v16);
    xpc_release(v16);
    v17 = xpc_data_create(&v24, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C0B1", v17);
    xpc_release(v17);
    v18 = xpc_data_create(&v22, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C1B0", v18);
    xpc_release(v18);
    v19 = xpc_data_create(&v20, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C1B1", v19);
    xpc_release(v19);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1423, v15);
    xpc_release(v15);
  }
}

- (void)updatePreferredRole:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t mRoleCurrent;
  BOOL v7;
  xpc_object_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v5 = -[WCM_BTControllerIOS getBTRole](self, "getBTRole");
  HIDWORD(self->mMWSFrameConfig) = v5;
  mRoleCurrent = self->mRoleCurrent;
  if (v5 > 1
    || (_DWORD)v5 == (_DWORD)v3
    || (v7 = (_DWORD)mRoleCurrent == (_DWORD)v3, mRoleCurrent = v3, v7))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Not request for BT role switch current(%d) prefered(%d) requested(%d)"), v5, v3, mRoleCurrent);
  }
  else if (-[NSMutableArray count](-[WCM_BTController btConnections](self, "btConnections"), "count"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Request for BT role switch(%d -> %d)"), HIDWORD(self->mMWSFrameConfig), v3);
    v8 = xpc_uint64_create(v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1407, v8);
    self->mRoleCurrent = v3;
    xpc_release(v8);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Not request for BT role switch (%d -> %d) becasue there is no connection"), HIDWORD(self->mMWSFrameConfig), v3, v9);
  }
}

- (void)updatePencilCoexAntennaSelectionPolicy:(BOOL)a3 param1:(int)a4 param2:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  xpc_object_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  if (-[WCM_BTController powerState](self, "powerState"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ Setting BT Antenna Policy for pencil coex BT blocking bitmap: %d Thread blocking bitmap: %d"), v6, v5);
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaAction", 0xAuLL);
    if (v7)
      v10 = 5;
    else
      v10 = 0;
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaConfiguration", v10);
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaParam1", (int)v6);
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaParam2", (int)v5);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1421, v9);
    xpc_release(v9);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("YYDebug_ BT OFF not setting antenna selection policy for pencil coex"));
  }
}

- (void)updateDefaultBTAntenna:(int)a3
{
  uint64_t v3;
  xpc_object_t v5;

  v3 = *(_QWORD *)&a3;
  if (-[WCM_BTController powerState](self, "powerState"))
  {
    if (self->mAntennaConfig != (_DWORD)v3)
    {
      if (v3 < 2)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Setting Default BT Antenna :%d"), v3);
        self->mAntennaConfig = v3;
        v5 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v5, "kWCMBTAntennaAction", 2uLL);
        xpc_dictionary_set_uint64(v5, "kWCMBTAntennaConfiguration", v3);
        -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1421, v5);
        xpc_release(v5);
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Trying to set default BT antenna to invalid antennaConfig(%d)"), v3);
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("BT OFF not setting default antenna antennaConfig(%d)"), v3);
  }
}

- (void)updateAntennaRSSIOffset
{
  xpc_object_t v3;

  if (-[WCM_BTController powerState](self, "powerState"))
  {
    if (!LOBYTE(self->mRoleRequested))
    {
      LOBYTE(self->mRoleRequested) = 1;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Setting BT Antenna Offsets: %@, %@"), &off_1002489A0, &off_100230738);
      v3 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v3, "kWCMBTAntennaAction", 5uLL);
      xpc_dictionary_set_uint64(v3, "kWCMBTAntennaParam1", (int)objc_msgSend(&off_1002489A0, "intValue"));
      xpc_dictionary_set_uint64(v3, "kWCMBTAntennaParam2", (int)objc_msgSend(&off_100230738, "intValue"));
      -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1421, v3);
      xpc_release(v3);
    }
  }
}

- (void)updateHFBtTxIndication:(BOOL)a3
{
  xpc_object_t v5;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Setting 5G BT config to %d"), a3);
  v5 = xpc_BOOL_create(a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCMBTSetMWSTxInd5GEnable: %@"), v5);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1433, v5);
  xpc_release(v5);
}

- (void)updateHFBtAntennaRequestWithDuration:(unint64_t)a3 unii1Enabled:(BOOL)a4 unii3Enabled:(BOOL)a5 unii5aEnabled:(BOOL)a6 unii5bEnabled:(BOOL)a7 unii5cEnabled:(BOOL)a8 unii5dEnabled:(BOOL)a9
{
  xpc_object_t v16;
  xpc_object_t v17;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFBTAntBlkDebug_ Setting antenna request configs: [duration = %llu, unii1Enable = %d, unii3Enabled = %d, unii5aEnabled = %d, unii5bEnabled = %d, unii5cEnabled = %d, unii5dEnabled = %d]"), a3, a4, a5, a6, a7, a8, a9);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFBTAntBlkDebug_ Setting config: enable condition ID"));
  v16 = xpc_BOOL_create(0);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1435, v16);
  xpc_release(v16);
  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v17, "kWCMAntennaRequestInterval", a3);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii1Enabled", a4);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii3Enabled", a5);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5aEnabled", a6);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5bEnabled", a7);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5cEnabled", a8);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5dEnabled", a9);
  xpc_dictionary_set_BOOL(v17, "kWCMBTSetConditionIdEnable", 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFBTAntBlkDebug_ Setting config: full antenna request config %@"), v17);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1434, v17);
  xpc_release(v17);
}

- (void)updateHFBtAntennaRequestWithDuration:(unint64_t)a3 unii1Enabled:(BOOL)a4 unii3Enabled:(BOOL)a5 unii5aEnabled:(BOOL)a6 unii5bEnabled:(BOOL)a7 unii5cEnabled:(BOOL)a8 unii5dEnabled:(BOOL)a9 unii1ConditionId:(unint64_t)a10 unii3ConditionId:(unint64_t)a11 unii5aConditionId:(unint64_t)a12 unii5bConditionId:(unint64_t)a13 unii5cConditionId:(unint64_t)a14 unii5dConditionId:(unint64_t)a15
{
  xpc_object_t v22;
  xpc_object_t v23;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFBTAntBlkDebug_ Setting antenna request configs: [duration = %llu, unii1Enable = %d, unii3Enabled = %d, unii5aEnabled = %d, unii5bEnabled = %d, unii5cEnabled = %d, unii5dEnabled = %d, unii1conditionId = %llu, unii3conditionId = %llu, unii5aconditionId = %llu, unii5bconditionId = %llu, unii5cconditionId = %llu, unii5dconditionId = %llu]"), a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFBTAntBlkDebug_ enable condition ID"));
  v22 = xpc_BOOL_create(1);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1435, v22);
  xpc_release(v22);
  v23 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v23, "kWCMAntennaRequestInterval", a3);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii1Enabled", a4);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii3Enabled", a5);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5aEnabled", a6);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5bEnabled", a7);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5cEnabled", a8);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5dEnabled", a9);
  xpc_dictionary_set_BOOL(v23, "kWCMBTSetConditionIdEnable", 1);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii1", a10);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii3", a11);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5a", a12);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5b", a13);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5c", a14);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5d", a15);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HFBTAntBlkDebug_ Setting config: full antenna request config %@"), v23);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1434, v23);
  xpc_release(v23);
}

- (void)updateMWSScanFrequencyTable:(id)a3
{
  xpc_object_t v5;
  xpc_object_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "kWCMBTNumScanFrequencies", (uint64_t)objc_msgSend(a3, "count"));
  v6 = xpc_array_create(0, 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = xpc_uint64_create((uint64_t)objc_msgSend(objc_msgSend(v11, "objectAtIndex:", 0), "integerValue"));
        v13 = xpc_uint64_create((uint64_t)objc_msgSend(objc_msgSend(v11, "objectAtIndex:", 1), "integerValue"));
        v14 = xpc_array_create(0, 0);
        xpc_array_append_value(v14, v12);
        xpc_array_append_value(v14, v13);
        xpc_array_append_value(v6, v14);
        xpc_release(v12);
        xpc_release(v13);
        xpc_release(v14);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  xpc_dictionary_set_value(v5, "kWCMBTScanFrequencies", v6);
  xpc_release(v6);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Setting BT MWS Scan Freq Table"));
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1422, v5);
  xpc_release(v5);
}

- (void)updateCoexRxGainMode:(id)a3
{
  int v5;
  xpc_object_t v6;

  v5 = self->mCurrentHFBTChannelMap[92];
  if (v5 == objc_msgSend(a3, "BOOLValue"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BT Agc Rx Coex Gain Mode already set to %d"), self->mCurrentHFBTChannelMap[92]);
  }
  else
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kWCMBTCoexRxGainModeEnable", (int)objc_msgSend(a3, "intValue"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Setting BT Agc Rx Coex Gain Mode %d"), objc_msgSend(a3, "intValue"));
    self->mCurrentHFBTChannelMap[92] = objc_msgSend(a3, "BOOLValue");
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1424, v6);
    xpc_release(v6);
  }
}

- (void)updateCarplayBTScanParams:(BOOL)a3 reason:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  xpc_object_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sending messgae to BT about CarPlay status updateCarplayBTScanParams state : %d, %d"), v5, v4);
  if (v7)
  {
    if (v4 >= 4)
      v8 = 4;
    else
      v8 = v4;
    xpc_dictionary_set_uint64(v7, "kWCMBTCoexScanIntervalState", v5);
    xpc_dictionary_set_uint64(v7, "kWCMBTCoexScanIntervalReason", v8);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1426, v7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent messgae to BT about CarPlay status (state): %d, (reason): %d"), v5, v4);
    xpc_release(v7);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send messgae to BT about CarPlay status XPC failed (state): %d, (reason): %d"), v5, v4);
  }
}

- (void)updateBTRCU2TimingArray:(id)a3
{
  xpc_object_t v5;
  void *v6;

  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_BOOL(v5, "kWCMBTRC2GrantEnable", (BOOL)objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "BOOLValue"));
    xpc_dictionary_set_uint64(v6, "kWCMBTRC2TimingT3", objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 1), "unsignedIntValue"));
    xpc_dictionary_set_uint64(v6, "kWCMBTRC2TimingT4", objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 2), "unsignedIntValue"));
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1428, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT: RC2 grant En:%d T3:%d T4:%d"), objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "BOOLValue"), objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 1), "unsignedIntValue"), objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 2), "unsignedIntValue"));
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT RC2 grant request message XPC failed (state)"));
  }
}

- (void)updateWiFiCriticalEnabled:(BOOL)a3
{
  xpc_object_t v5;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v5, "kWCMAirplayCritical", a3);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 106, v5);
  xpc_release(v5);
}

- (void)bspUpdateWiFiStatus:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  void *v9;
  xpc_object_t v10;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    v7 = xpc_uint64_create(1uLL);
    xpc_dictionary_set_value(v6, "BSP_CommandType", v7);
    xpc_release(v7);
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = v8;
      v10 = xpc_uint64_create(v3);
      xpc_dictionary_set_value(v9, "BSP_PowerState", v10);
      xpc_release(v10);
      xpc_dictionary_set_value(v6, "BSP_CommandParams", v9);
      xpc_release(v9);
    }
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1431, v6);
    xpc_release(v6);
  }
}

- (void)bspSetFrequencyBandToUse:(int)a3 allowedBands:(int)a4
{
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v12;
  xpc_object_t v13;

  v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    v8 = v7;
    v9 = xpc_uint64_create(2uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      v11 = v10;
      v12 = xpc_uint64_create(a3);
      xpc_dictionary_set_value(v11, "BSP_FrequencyBand", v12);
      xpc_release(v12);
      v13 = xpc_uint64_create(a4);
      xpc_dictionary_set_value(v11, "BSP_AllowedBands", v13);
      xpc_release(v13);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1431, v8);
    xpc_release(v8);
  }
}

- (void)bspNotifyChannelQuality:(int)a3 quality:(unint64_t)a4
{
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v12;
  xpc_object_t v13;

  v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    v8 = v7;
    v9 = xpc_uint64_create(3uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      v11 = v10;
      v12 = xpc_uint64_create(a3);
      xpc_dictionary_set_value(v11, "BSP_FrequencyBand", v12);
      xpc_release(v12);
      v13 = xpc_uint64_create(a4);
      xpc_dictionary_set_value(v11, "BSP_ChannelQuality", v13);
      xpc_release(v13);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1431, v8);
    xpc_release(v8);
  }
}

- (void)bspStatusRequest
{
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;
  xpc_object_t v8;

  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = xpc_uint64_create(5uLL);
    xpc_dictionary_set_value(v4, "BSP_CommandType", v5);
    xpc_release(v5);
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      v7 = v6;
      v8 = xpc_uint64_create(0);
      xpc_dictionary_set_value(v7, "dummy", v8);
      xpc_release(v8);
      xpc_dictionary_set_value(v4, "BSP_CommandParams", v7);
      xpc_release(v7);
    }
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1431, v4);
    xpc_release(v4);
  }
}

- (void)bspBandSwitchReject:(int)a3 targetBand:(int)a4
{
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v12;
  xpc_object_t v13;

  v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    v8 = v7;
    v9 = xpc_uint64_create(6uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      v11 = v10;
      v12 = xpc_uint64_create(a3);
      xpc_dictionary_set_value(v11, "BSP_ReasonCode", v12);
      xpc_release(v12);
      v13 = xpc_uint64_create(a4);
      xpc_dictionary_set_value(v11, "BSP_TargetBand", v13);
      xpc_release(v13);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1431, v8);
    xpc_release(v8);
  }
}

- (void)bspRegulatoryInfoRequest:(id)a3 timeStamp:(int64_t)a4
{
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;

  v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    v8 = v7;
    v9 = xpc_uint64_create(7uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      v11 = v10;
      xpc_dictionary_set_string(v10, "BSP_CountryCode", (const char *)objc_msgSend(a3, "UTF8String"));
      xpc_dictionary_set_int64(v11, "BSP_CountryCodeTimeStamp", a4);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1431, v8);
    xpc_release(v8);
  }
}

- (unint64_t)getLeConnDutyCycle
{
  return *(_QWORD *)&self->mDiversityAFHMapForC1B1[11];
}

- (unint64_t)getLeConnReason
{
  return *(unint64_t *)((char *)&self->mLeConnDutyCycle + 4);
}

- (unint64_t)getLeConnBand
{
  return *(unint64_t *)((char *)&self->mLeConnReason + 4);
}

- (unint64_t)getLeConnDuration
{
  return *(unint64_t *)((char *)&self->mLeConnBand + 4);
}

- (int64_t)getLeDiscoveryScanState
{
  return *(unint64_t *)((char *)&self->mLeConnDuration + 4);
}

- (int64_t)getLeDiscoveryScanUseCase
{
  return *(int64_t *)((char *)&self->mLeDiscoveryScanState + 4);
}

- (void)handleLeConn:(id)a3
{
  xpc_object_t value;
  void *v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received LeConn msg: %@"), a3);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v6 = value;
    *(_QWORD *)&self->mDiversityAFHMapForC1B1[11] = xpc_dictionary_get_uint64(value, "kWCMBTLeConnect_DC");
    *(unint64_t *)((char *)&self->mLeConnDutyCycle + 4) = xpc_dictionary_get_uint64(v6, "kWCMBTLeConnect_OverrideReason");
    *(unint64_t *)((char *)&self->mLeConnReason + 4) = xpc_dictionary_get_uint64(v6, "kWCMBTLeConnect_Band");
    *(unint64_t *)((char *)&self->mLeConnBand + 4) = xpc_dictionary_get_uint64(v6, "kWCMBTLeConnect_Duration");
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 108);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error Getting Args"));
  }
}

- (void)handleLeDiscoveryScanStateChange:(id)a3
{
  xpc_object_t value;
  void *v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received LeScanStateChange msg"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v6 = value;
    *(unint64_t *)((char *)&self->mLeConnDuration + 4) = xpc_dictionary_get_int64(value, "kWCMBTLeDiscoveryScan_State");
    *(int64_t *)((char *)&self->mLeDiscoveryScanState + 4) = xpc_dictionary_get_int64(v6, "kWCMBTLeDiscoveryScan_UseCase");
    if (qword_100270CB8 != *(unint64_t *)((char *)&self->mLeConnDuration + 4))
    {
      objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 518);
      qword_100270CB8 = *(unint64_t *)((char *)&self->mLeConnDuration + 4);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error Getting Args"));
  }
}

- (void)handleBTBandwidthLoad:(id)a3
{
  xpc_object_t value;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  objc_msgSend(objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "rcu2Controller"), "threadClient"), "setWirelessLoad:", xpc_dictionary_get_uint64(value, "kWCMBTWirelessLoadValue"));
}

- (void)handleScanStart:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("handleScanStart does nothing currently"));
}

- (void)handleScanStop:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("handleScanStop does nothing currently"));
}

- (void)handleLinkQaulity:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("handleLinkQaulity does nothing currently"));
}

- (void)handleLTELinkQuality:(id)a3
{
  xpc_object_t value;
  uint64_t uint64;
  xpc_object_t v5;
  const __CFString *v6;
  uint64_t v7;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64 = xpc_dictionary_get_uint64(value, "kWCMBTLTELinkQuality_Type");
  v5 = xpc_dictionary_get_value(value, "kWCMBTLTELinkQuality_ChannelMap");
  if (v5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Link Quality Type = %d, Channel Map Count = %zu"), uint64, xpc_array_get_count(v5));
    switch((int)uint64)
    {
      case 1:
        v6 = CFSTR(" Average RSSI - LTE TX ACTIVE");
        goto LABEL_16;
      case 2:
        v6 = CFSTR(" Average RSSI - LTE TX NOT-ACTIVE");
        goto LABEL_16;
      case 3:
        v6 = CFSTR(" Rx Error Count - LTE Tx ACTIVE");
        goto LABEL_16;
      case 4:
        v6 = CFSTR(" Rx Total Count - LTE Tx ACTIVE");
        goto LABEL_16;
      case 5:
        v6 = CFSTR(" Rx Error Count - LTE Tx NOT-ACTIVE");
        goto LABEL_16;
      case 6:
        v6 = CFSTR(" Rx Total Count - LTE Tx NOT-ACTIVE");
        goto LABEL_16;
      case 7:
        v6 = CFSTR("Tx Rexmit Count - LTE Tx ACTIVE");
        goto LABEL_16;
      case 8:
        v6 = CFSTR("Tx Total Count - LTE Tx ACTIVE");
        goto LABEL_16;
      case 9:
        v6 = CFSTR("Tx Rexmit Count - LTE Tx NOT-ACTIVE");
        goto LABEL_16;
      case 10:
        v6 = CFSTR("Tx Total Count - LTE Tx NOT-ACTIVE");
        goto LABEL_16;
      case 11:
        v6 = CFSTR(" Background RSSI - LTE TX NOT-ACTIVE");
LABEL_16:
        v7 = 3;
        goto LABEL_17;
      default:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR(" Invalid Link Quality Type Message %d"), uint64);
        return;
    }
  }
  v6 = CFSTR("Error getting Channel Map array");
  v7 = 0;
LABEL_17:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v7, v6);
}

- (void)resetBtMetrics
{
  -[WCM_BTControllerIOS setMClassicRssi:](self, "setMClassicRssi:", 128);
  -[WCM_BTControllerIOS setMLeRssi:](self, "setMLeRssi:", 128);
  -[WCM_BTControllerIOS setMMovingAvgRSSI:](self, "setMMovingAvgRSSI:", 128.0);
  -[WCM_BTControllerIOS setMLeSuccessfulTxCount:](self, "setMLeSuccessfulTxCount:", 0);
  -[WCM_BTControllerIOS setMLeSuccessfulTxCount:](self, "setMLeSuccessfulTxCount:", 0);
  -[WCM_BTControllerIOS setMLeReTxCount:](self, "setMLeReTxCount:", 0);
  -[WCM_BTControllerIOS setMLeSuccessfulRxCount:](self, "setMLeSuccessfulRxCount:", 0);
  -[WCM_BTControllerIOS setMLeRxErrorCount:](self, "setMLeRxErrorCount:", 0);
  -[WCM_BTControllerIOS setMLeCoexDenialCount:](self, "setMLeCoexDenialCount:", 0);
  -[WCM_BTControllerIOS setMClassicSuccessfulTxCount:](self, "setMClassicSuccessfulTxCount:", 0);
  -[WCM_BTControllerIOS setMClassicReTxCount:](self, "setMClassicReTxCount:", 0);
  -[WCM_BTControllerIOS setMClassicSuccessfulRxCount:](self, "setMClassicSuccessfulRxCount:", 0);
  -[WCM_BTControllerIOS setMClassicRxErrorCount:](self, "setMClassicRxErrorCount:", 0);
  -[WCM_BTControllerIOS setMClassicCoexDenialCount:](self, "setMClassicCoexDenialCount:", 0);
  -[WCM_BTControllerIOS setMPrevActivePhy:](self, "setMPrevActivePhy:", 0);
  -[WCM_BTControllerIOS setMActivePhy:](self, "setMActivePhy:", 0);
  -[WCM_BTControllerIOS setMActivePhyValid:](self, "setMActivePhyValid:", 0);
  -[WCM_BTControllerIOS setMNonMagnetUtilization:](self, "setMNonMagnetUtilization:", 0.0);
  -[WCM_BTControllerIOS setMMetricsReportReason:](self, "setMMetricsReportReason:", 0);
  -[WCM_BTControllerIOS setMFlushCount:](self, "setMFlushCount:", 0);
  -[WCM_BTControllerIOS setMBtPhyRate:](self, "setMBtPhyRate:", 0);
  -[WCM_BTControllerIOS setMMovingAvgReTxCount:](self, "setMMovingAvgReTxCount:", 0);
  -[WCM_BTControllerIOS setMMovingAvgRxErrorCount:](self, "setMMovingAvgRxErrorCount:", 0);
  -[WCM_BTControllerIOS setMMovingAvgSuccessfulRxCount:](self, "setMMovingAvgSuccessfulRxCount:", 0);
  -[WCM_BTControllerIOS setMMovingAvgSuccessfulTxCount:](self, "setMMovingAvgSuccessfulTxCount:", 0);
  -[WCM_BTControllerIOS setMNumberofSamples:](self, "setMNumberofSamples:", 0);
}

- (void)handleBTMetricsRpt:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100090BDC;
  v3[3] = &unk_100201B18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)-[WCM_BTControllerIOS queue](self, "queue"), v3);
}

- (void)handleBTPhyRpt:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009142C;
  v3[3] = &unk_100201B18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)-[WCM_BTControllerIOS queue](self, "queue"), v3);
}

- (void)handelAFHMap:(id)a3
{
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  const __CFString *v9;
  const __CFString *v10;
  _BYTE buffer[6];
  _BYTE v12[10];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Received AFH Map Message %@"), a3);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    v9 = CFSTR("Error Getting Args");
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v9);
    return;
  }
  v6 = value;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received AFH Mode %llu"), xpc_dictionary_get_uint64(value, "kWCMBTAFHMode"));
  v7 = xpc_dictionary_get_value(v6, "kWCMBTAFHBDA");
  if (!v7)
  {
    v9 = CFSTR("Invalid BDA Obj");
    goto LABEL_9;
  }
  if (xpc_data_get_bytes(v7, buffer, 0, 6uLL))
  {
    v8 = xpc_dictionary_get_value(v6, "kWCMBTAFHChannelMap");
    if (v8)
    {
      if (xpc_data_get_bytes(v8, v12, 0, 0xAuLL))
      {
        -[WCM_BTControllerIOS printAFHMap:](self, "printAFHMap:", v12);
        return;
      }
      v10 = CFSTR("Error Getting afhMap");
    }
    else
    {
      v10 = CFSTR("Invalid Map Obj");
    }
  }
  else
  {
    v10 = CFSTR("Error Getting BDA");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v10);
}

- (void)handleHFBTChannelMap:(id)a3
{
  _BYTE *data;
  uint64_t i;
  size_t length;
  _BYTE v8[96];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ Received Channel Map Message %@"), a3);
  length = 0;
  data = xpc_dictionary_get_data(a3, "kMessageArgs", &length);
  if (data && length > 0x5F)
  {
    for (i = 0; i != 96; ++i)
      v8[i] = data[i];
    -[WCM_BTControllerIOS printHFBTChannelMap:](self, "printHFBTChannelMap:", v8);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("HFAFHDebug_ Error Getting Channel Map"));
  }
}

- (void)handleRawRSSI:(id)a3
{
  xpc_object_t value;
  void *v5;
  xpc_object_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE buffer[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Received RAW RSSI Message %@"), a3);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    v7 = CFSTR("Error Getting Args");
LABEL_7:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v7);
    return;
  }
  v5 = value;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received RSSI -%llu\n"), 128 - (xpc_dictionary_get_uint64(value, "kWCMBTRAWRSSI") & 0x7F));
  v6 = xpc_dictionary_get_value(v5, "kWCMBTRSSIBDA");
  if (!v6)
  {
    v7 = CFSTR("Invalid BDA Obj");
    goto LABEL_7;
  }
  if (xpc_data_get_bytes(v6, buffer, 0, 6uLL))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RSSI BDA = %2x:%2x:%2x:%2x:%2x:%2x\n"), buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5]);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error Getting BDA"), v8, v9, v10, v11, v12, v13);
}

- (void)handleAntennaPreferenceBResponse:(id)a3
{
  xpc_object_t value;
  void *v5;
  uint64_t uint64;
  uint64_t v7;
  uint64_t v8;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ Received BT Antenna PreferenceB Response"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    uint64 = xpc_dictionary_get_uint64(value, "kWCMBTAntennaAction");
    v7 = xpc_dictionary_get_uint64(v5, "kWCMBTStatus");
    v8 = xpc_dictionary_get_uint64(v5, "kWCMBTCurrentAntenna");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ antennaAction(%u) status(%llu) currentAnt(%llu) previousAnt(%llu)"), uint64, v7, v8, xpc_dictionary_get_uint64(v5, "kWCMBTPreviousAntenna"));
  }
}

- (void)handleAntennaSwitchNotification:(id)a3
{
  xpc_object_t value;
  void *v5;
  uint64_t uint64;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Received BT Antenna Switch Notification"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    uint64 = xpc_dictionary_get_uint64(value, "kWCMBTCurrentAntenna");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("connectionHandle(%llu) currentAntenna(%llu)"), xpc_dictionary_get_uint64(v5, "kWCMBTConnectionHandle"), uint64);
  }
}

- (void)handleBSPEvent:(id)a3
{
  xpc_object_t value;
  void *v5;
  uint64_t uint64;
  xpc_object_t v7;
  _BOOL8 v8;
  uint64_t v9;
  xpc_object_t v10;
  NSString *v11;
  xpc_object_t v12;
  uint64_t v13;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received BSPEvent msg: %@"), a3);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    uint64 = xpc_dictionary_get_uint64(value, "BSP_EventType");
    switch((_DWORD)uint64)
    {
      case 3:
        v10 = xpc_dictionary_get_value(v5, "BSP_EventParams");
        v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v10, "BSP_CountryCode"));
        objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "handleBTRegulatoryInfoEvent:allowedBands:", v11, xpc_dictionary_get_uint64(v10, "BSP_AllowedBands"));
        break;
      case 2:
        v12 = xpc_dictionary_get_value(v5, "BSP_EventParams");
        v13 = xpc_dictionary_get_uint64(v12, "BSP_CurrentBand");
        objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "handleBTBandSwitchRequestEvent:targetBand:", v13, xpc_dictionary_get_uint64(v12, "BSP_TargetBand"));
        break;
      case 1:
        v7 = xpc_dictionary_get_value(v5, "BSP_EventParams");
        v8 = xpc_dictionary_get_BOOL(v7, "BSP_PowerState");
        v9 = xpc_dictionary_get_uint64(v7, "BSP_FrequencyBand");
        objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "handleBTStatusUpdateEvent:frequencyBand:ullaMode:", v8, v9, xpc_dictionary_get_uint64(v7, "BSP_ULLAMode"));
        break;
      default:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("%s Unknown eventType %d"), "-[WCM_BTControllerIOS handleBSPEvent:]", uint64);
        break;
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error Getting Args"));
  }
}

- (void)printAFHMap:(char *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;

  v4 = 0;
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)v8 = 0u;
  v9 = 0u;
  do
  {
    v5 = 0;
    v6 = v8;
    do
    {
      if (((a3[v4] >> v5) & 1) != 0)
        v7 = 88;
      else
        v7 = 46;
      sprintf(v6, "  %c  ", v7);
      ++v5;
      v6 += 5;
    }
    while (v5 != 8);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("AFH Map [%2d - %2d]: %s"), (8 * v4), (8 * (_DWORD)v4) | 7u, v8);
    ++v4;
  }
  while (v4 != 10);
}

- (void)printHFBTChannelMap:(char *)a3
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;

  v4 = 0;
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)v8 = 0u;
  v9 = 0u;
  do
  {
    v5 = v8;
    v6 = 8;
    do
    {
      if (((a3[v4] >> --v6) & 1) != 0)
        v7 = 88;
      else
        v7 = 46;
      sprintf(v5, "  %c  ", v7);
      v5 += 5;
    }
    while (v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HFAFHDebug_ Map [%2d - %2d]: %s"), (8 * v4), (8 * (_DWORD)v4) | 7u, v8);
    ++v4;
  }
  while (v4 != 96);
}

- (void)printBLEAFHMap:(char *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ Printing BLE AFH Map"));
  v4 = 0;
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)v8 = 0u;
  v9 = 0u;
  do
  {
    v5 = 0;
    v6 = v8;
    do
    {
      if (((a3[v4] >> v5) & 1) != 0)
        v7 = 89;
      else
        v7 = 110;
      sprintf(v6, "  %c  ", v7);
      ++v5;
      v6 += 5;
    }
    while (v5 != 8);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BLE AFH Map [%2d - %2d]: %s"), (8 * v4), (8 * (_DWORD)v4) | 7u, v8);
    ++v4;
  }
  while (v4 != 5);
}

- (id)createBTHCIExternalFrameConfigParams:(id)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  id v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  xpc_object_t v30;
  xpc_object_t v31;
  unsigned int v32;
  signed int v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t v38;
  size_t count;
  xpc_object_t v40;
  id v41;
  uint64_t v43;
  uint64_t v44;
  xpc_object_t xdict;
  float *v46;
  float *v47;
  char *v48;

  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = xpc_array_create(0, 0);
  v6 = xpc_array_create(0, 0);
  v7 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  v8 = xpc_uint64_create(0x2710uLL);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtFrameDuration", v8);
  xpc_release(v8);
  v9 = xpc_int64_create((int64_t)objc_msgSend(v7, "wcmWCI2FrameSyncAssertOffset"));
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtFrameSyncAssertOffset", v9);
  xpc_release(v9);
  v10 = xpc_uint64_create((uint64_t)objc_msgSend(v7, "wcmWCI2FrameSyncAssertJitter"));
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtFrameSyncAssertJitter", v10);
  xpc_release(v10);
  if (objc_msgSend(a3, "tddBand")
    && (objc_msgSend(v7, "wcmBTSupportTDDFrameConfig") & 1) != 0)
  {
    v11 = (unint64_t)objc_msgSend(a3, "tddULDLConfig");
    v12 = (unint64_t)objc_msgSend(a3, "subframeFormat");
    v13 = objc_msgSend(a3, "dlCPConfig");
    v14 = objc_msgSend(a3, "ulCPConfig");
    if (v11 > 6 || v12 > 9)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ExtFrameConfig : Invalid Config ULDL = %llu, sff = %llu"), v11, v12);
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v17 = 120;
      if (!v14)
        v17 = 80;
      xdict = v4;
      v46 = (float *)((char *)&unk_1001DE158 + 4 * v12 + v17);
      v47 = (float *)((char *)&unk_1001DE158 + 40 * (v13 != 0) + 4 * v12);
      v48 = (char *)&byte_1001DE112[10 * v11 + 1];
      do
      {
        v18 = byte_1001DE112[10 * v11 + v15];
        v19 = xpc_uint64_create(v18 != 68);
        xpc_array_append_value(v5, v19);
        xpc_release(v19);
        v20 = 0;
        if (v15 <= 9)
          v21 = 9;
        else
          v21 = v15;
        v22 = -v16;
        do
        {
          v23 = v22;
          if (v21 - v15 == v20)
            goto LABEL_23;
          v24 = v48[v15 + v20++];
          v22 -= 1000;
        }
        while (v24 == v18);
        if (v24 != 83)
        {
          LODWORD(v21) = v15 - 1 + v20;
LABEL_23:
          v35 = xpc_uint64_create(1000 - v23);
          xpc_array_append_value(v6, v35);
          xpc_release(v35);
          v16 = 0;
          goto LABEL_24;
        }
        v25 = v6;
        v26 = llroundf(*v47);
        v27 = v11;
        v28 = llroundf(*v46);
        LODWORD(v21) = v15 + v20;
        if (v18 == 68)
          v29 = v26;
        else
          v29 = v28;
        if (v18 == 68)
          v16 = v28;
        else
          v16 = v26;
        v30 = xpc_uint64_create((int)(v29 - v22));
        xpc_array_append_value(v25, v30);
        xpc_release(v30);
        v31 = xpc_uint64_create(3uLL);
        xpc_array_append_value(v5, v31);
        v32 = v26 + v28;
        v11 = v27;
        xpc_release(v31);
        v33 = 1000 - v32;
        v6 = v25;
        v34 = xpc_uint64_create(v33);
        xpc_array_append_value(v25, v34);
        xpc_release(v34);
LABEL_24:
        v15 = v21 + 1;
      }
      while ((int)v21 < 9);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Creating MWS_ExtFrameConfig: TDD with %zu Types"), xpc_array_get_count(v5));
      v4 = xdict;
    }
  }
  else
  {
    v36 = xpc_uint64_create(1uLL);
    xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtNumPeriods", v36);
    xpc_release(v36);
    v37 = xpc_uint64_create(2uLL);
    xpc_array_append_value(v5, v37);
    xpc_release(v37);
    v38 = xpc_uint64_create(0x2710uLL);
    xpc_array_append_value(v6, v38);
    xpc_release(v38);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Creating MWS_ExtFrameConfig: FDD"), v43, v44);
  }
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtPeriodDuration", v6);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtPeriodType", v5);
  count = xpc_array_get_count(v5);
  v40 = xpc_uint64_create(count);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtNumPeriods", v40);
  xpc_release(v40);
  xpc_release(v6);
  xpc_release(v5);
  v41 = v4;
  return v4;
}

- (id)createChannelParameters:(id)a3
{
  const __CFString *v4;
  xpc_object_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  xpc_object_t v11;
  uint64_t i;
  id v13;
  xpc_object_t values[2];
  __int128 v16;
  __int128 v17;
  char *keys[2];
  __int128 v19;
  __int128 v20;

  *(_OWORD *)keys = *(_OWORD *)off_100203CE8;
  v19 = *(_OWORD *)off_100203CF8;
  v20 = *(_OWORD *)off_100203D08;
  v16 = 0u;
  v17 = 0u;
  *(_OWORD *)values = 0u;
  if (a3)
  {
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ClkAlgnTDDFix")))
    {
      if (objc_msgSend(a3, "btClkAlgnFlag"))
      {
        values[0] = xpc_uint64_create(1uLL);
        v4 = CFSTR("clkAlgnTDDFreqCheck: channelParamValue[0] is set to 1, because cellular.btClkAlgnFlag is %d");
      }
      else
      {
        values[0] = xpc_uint64_create(0);
        v4 = CFSTR("clkAlgnTDDFreqCheck: channelParamValue[0] is set to 0, because cellular.btClkAlgnFlag is %d");
      }
    }
    else
    {
      values[0] = xpc_uint64_create(1uLL);
      v4 = CFSTR("clkAlgnTDDFreqCheck: channelParamValue[0] is set to 1 with cellular.btClkAlgnFlag being %d. This is to take care of legacy devices that is not covered by the feature flag Clk_Algn_TDD_Fix");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v4, objc_msgSend(a3, "btClkAlgnFlag"));
    objc_msgSend(a3, "dlCenterFreq");
    values[1] = xpc_uint64_create((unint64_t)v7);
    objc_msgSend(a3, "cachedULCenterFreq");
    *(_QWORD *)&v16 = xpc_uint64_create((unint64_t)v8);
    objc_msgSend(a3, "dlBandwidth");
    *((_QWORD *)&v16 + 1) = xpc_uint64_create((unint64_t)v9);
    objc_msgSend(a3, "cachedULBandwidth");
    *(_QWORD *)&v17 = xpc_uint64_create((unint64_t)v10);
    v6 = objc_msgSend(a3, "tddBand") ^ 1;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("ZeroFreqDebug: CellController is Null in createChannelParameters."));
    values[0] = xpc_uint64_create(0);
    values[1] = xpc_uint64_create(0);
    *(_QWORD *)&v16 = xpc_uint64_create(0);
    *((_QWORD *)&v16 + 1) = xpc_uint64_create(0);
    v5 = xpc_uint64_create(0);
    v6 = 0;
    *(_QWORD *)&v17 = v5;
  }
  *((_QWORD *)&v17 + 1) = xpc_uint64_create(v6);
  v11 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Creating MWS_ChannelParameter: %llu"), xpc_uint64_get_value(values[0]));
  for (i = 0; i != 6; ++i)
    xpc_release(values[i]);
  v13 = v11;
  return v11;
}

- (double)getBtRxPer
{
  double v3;
  unint64_t v4;

  v3 = (double)-[WCM_BTControllerIOS mMovingAvgRxErrorCount](self, "mMovingAvgRxErrorCount");
  v4 = -[WCM_BTControllerIOS mMovingAvgSuccessfulRxCount](self, "mMovingAvgSuccessfulRxCount");
  return v3 / ((double)(-[WCM_BTControllerIOS mMovingAvgRxErrorCount](self, "mMovingAvgRxErrorCount") + v4) + 0.000001);
}

- (BOOL)isBTMetricsValid
{
  id v3;
  unint64_t v4;

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  v4 = -[WCM_BTControllerIOS mNumberofSamples](self, "mNumberofSamples");
  return v4 >= (unint64_t)objc_msgSend(v3, "dataBtMovingAvgAlphaDenum");
}

- (unint64_t)mClassicRssi
{
  return *(_QWORD *)(&self->_mActivePhyValid + 4);
}

- (void)setMClassicRssi:(unint64_t)a3
{
  *(_QWORD *)(&self->_mActivePhyValid + 4) = a3;
}

- (unint64_t)mLeRssi
{
  return *(unint64_t *)((char *)&self->_mClassicRssi + 4);
}

- (void)setMLeRssi:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicRssi + 4) = a3;
}

- (unint64_t)mLeSuccessfulTxCount
{
  return *(unint64_t *)((char *)&self->_mLeRssi + 4);
}

- (void)setMLeSuccessfulTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeRssi + 4) = a3;
}

- (unint64_t)mLeReTxCount
{
  return *(unint64_t *)((char *)&self->_mLeSuccessfulTxCount + 4);
}

- (void)setMLeReTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeSuccessfulTxCount + 4) = a3;
}

- (unint64_t)mLeSuccessfulRxCount
{
  return *(unint64_t *)((char *)&self->_mLeReTxCount + 4);
}

- (void)setMLeSuccessfulRxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeReTxCount + 4) = a3;
}

- (unint64_t)mLeRxErrorCount
{
  return *(unint64_t *)((char *)&self->_mLeSuccessfulRxCount + 4);
}

- (void)setMLeRxErrorCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeSuccessfulRxCount + 4) = a3;
}

- (unint64_t)mLeCoexDenialCount
{
  return *(unint64_t *)((char *)&self->_mLeRxErrorCount + 4);
}

- (void)setMLeCoexDenialCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeRxErrorCount + 4) = a3;
}

- (unint64_t)mClassicSuccessfulTxCount
{
  return *(unint64_t *)((char *)&self->_mLeCoexDenialCount + 4);
}

- (void)setMClassicSuccessfulTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeCoexDenialCount + 4) = a3;
}

- (unint64_t)mClassicReTxCount
{
  return *(unint64_t *)((char *)&self->_mClassicSuccessfulTxCount + 4);
}

- (void)setMClassicReTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicSuccessfulTxCount + 4) = a3;
}

- (unint64_t)mClassicSuccessfulRxCount
{
  return *(unint64_t *)((char *)&self->_mClassicReTxCount + 4);
}

- (void)setMClassicSuccessfulRxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicReTxCount + 4) = a3;
}

- (unint64_t)mClassicRxErrorCount
{
  return *(unint64_t *)((char *)&self->_mClassicSuccessfulRxCount + 4);
}

- (void)setMClassicRxErrorCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicSuccessfulRxCount + 4) = a3;
}

- (unint64_t)mClassicCoexDenialCount
{
  return *(unint64_t *)((char *)&self->_mClassicRxErrorCount + 4);
}

- (void)setMClassicCoexDenialCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicRxErrorCount + 4) = a3;
}

- (unint64_t)mActivePhy
{
  return *(unint64_t *)((char *)&self->_mClassicCoexDenialCount + 4);
}

- (void)setMActivePhy:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicCoexDenialCount + 4) = a3;
}

- (BOOL)mActivePhyValid
{
  return BYTE4(self->mLeDiscoveryScanUseCase);
}

- (void)setMActivePhyValid:(BOOL)a3
{
  BYTE4(self->mLeDiscoveryScanUseCase) = a3;
}

- (double)mNonMagnetUtilization
{
  return *(double *)((char *)&self->_mActivePhy + 4);
}

- (void)setMNonMagnetUtilization:(double)a3
{
  *(double *)((char *)&self->_mActivePhy + 4) = a3;
}

- (unint64_t)mMetricsReportReason
{
  return *(_QWORD *)((char *)&self->_mNonMagnetUtilization + 4);
}

- (void)setMMetricsReportReason:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->_mNonMagnetUtilization + 4) = a3;
}

- (unint64_t)mFlushCount
{
  return *(unint64_t *)((char *)&self->_mMetricsReportReason + 4);
}

- (void)setMFlushCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMetricsReportReason + 4) = a3;
}

- (unint64_t)mBtPhyRate
{
  return *(unint64_t *)((char *)&self->_mFlushCount + 4);
}

- (void)setMBtPhyRate:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mFlushCount + 4) = a3;
}

- (void)setMMovingAvgRSSI:(double)a3
{
  *(double *)((char *)&self->_mBtPhyRate + 4) = a3;
}

- (unint64_t)mPrevActivePhy
{
  return *(_QWORD *)((char *)&self->_mMovingAvgRSSI + 4);
}

- (void)setMPrevActivePhy:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->_mMovingAvgRSSI + 4) = a3;
}

- (void)setMMovingAvgSuccessfulTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mPrevActivePhy + 4) = a3;
}

- (unint64_t)mMovingAvgSuccessfulRxCount
{
  return *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulTxCount + 4);
}

- (void)setMMovingAvgSuccessfulRxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulTxCount + 4) = a3;
}

- (void)setMMovingAvgReTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulRxCount + 4) = a3;
}

- (unint64_t)mMovingAvgRxErrorCount
{
  return *(unint64_t *)((char *)&self->_mMovingAvgReTxCount + 4);
}

- (void)setMMovingAvgRxErrorCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgReTxCount + 4) = a3;
}

- (unint64_t)mNumberofSamples
{
  return *(unint64_t *)((char *)&self->_mMovingAvgRxErrorCount + 4);
}

- (void)setMNumberofSamples:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgRxErrorCount + 4) = a3;
}

- (unint64_t)mLQMLinkEvalCounter
{
  return *(unint64_t *)((char *)&self->_mNumberofSamples + 4);
}

- (void)setMLQMLinkEvalCounter:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mNumberofSamples + 4) = a3;
}

- (OS_dispatch_queue)queue
{
  return *(OS_dispatch_queue **)((char *)&self->_mLQMLinkEvalCounter + 4);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 644);
}

@end
