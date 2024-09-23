@implementation WiFiUsageLQMKernelSampleInfraTXRX

+ (id)sampleWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  id v7;
  uint64_t var0;
  WiFiUsageLQMKernelSampleInfraTXRX *v9;

  v7 = a4;
  var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(CFSTR("%s - Unknown version: %u"), "+[WiFiUsageLQMKernelSampleInfraTXRX sampleWithStruct:WithReferenceDate:AsNsec:]", var0);
    v9 = 0;
  }
  else
  {
    v9 = -[WiFiUsageLQMKernelSampleInfraTXRX initWithStruct:WithReferenceDate:AsNsec:]([WiFiUsageLQMKernelSampleInfraTXRX alloc], "initWithStruct:WithReferenceDate:AsNsec:", a3, v7, a5);
  }

  return v9;
}

- (WiFiUsageLQMKernelSampleInfraTXRX)initWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t var19;
  uint64_t var20;
  uint64_t var23;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)WiFiUsageLQMKernelSampleInfraTXRX;
  v7 = a4;
  v8 = -[WiFiUsageLQMKernelSampleInfraTXRX init](&v30, sel_init);
  +[WiFiUsageLQMTransformations dateWithMachContinuousTime:WithRef:asNS:](WiFiUsageLQMTransformations, "dateWithMachContinuousTime:WithRef:asNS:", *(_QWORD *)(&a3->var0 + 1), v7, a5);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v9;

  v28 = 0u;
  v29 = 0u;
  +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:](WiFiUsageLQMTransformations, "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:", a3->var7, a3->var6, a3->var21, a3->var22, a3->var5);
  *((_QWORD *)v8 + 3) = v28;
  *((_QWORD *)v8 + 4) = *((_QWORD *)&v29 + 1);
  *((_QWORD *)v8 + 5) = v29;
  *((_QWORD *)v8 + 6) = *((_QWORD *)&v28 + 1);
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[WiFiUsageLQMTransformations rxDecodingErrorsPercentagesWithRxFrmTooLong:rxFrmTooShrt:rxBadFCS:rxResponseTimeout:rxNoDelim:rxAnyErr:rxFifo0Ovfl:rxFifo1Ovfl:](WiFiUsageLQMTransformations, "rxDecodingErrorsPercentagesWithRxFrmTooLong:rxFrmTooShrt:rxBadFCS:rxResponseTimeout:rxNoDelim:rxAnyErr:rxFifo0Ovfl:rxFifo1Ovfl:", HIDWORD(a3->var1), a3->var2, a3->var4, a3->var14, a3->var15, a3->var3, a3->var16, a3->var17);
  *((_QWORD *)v8 + 7) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", (_QWORD)v23, a3->var5, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  *((_QWORD *)v8 + 10) = v24;
  *((_QWORD *)v8 + 11) = *((_QWORD *)&v23 + 1);
  *((_QWORD *)v8 + 12) = v27;
  *((_QWORD *)v8 + 13) = *((_QWORD *)&v24 + 1);
  *((_OWORD *)v8 + 7) = v25;
  *((_OWORD *)v8 + 8) = v26;
  v21 = 0u;
  v22 = 0u;
  +[WiFiUsageLQMTransformations rxUcastPercentagesWithRxData:rxMgmt:rxCtrl:](WiFiUsageLQMTransformations, "rxUcastPercentagesWithRxData:rxMgmt:rxCtrl:", a3->var8, a3->var9, a3->var10);
  *((_QWORD *)v8 + 8) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", (_QWORD)v21, a3->var5, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  *((_QWORD *)v8 + 18) = *((_QWORD *)&v21 + 1);
  *(_OWORD *)(v8 + 152) = v22;
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  +[WiFiUsageLQMTransformations ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:](WiFiUsageLQMTransformations, "ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:", a3->var10, a3->var11, a3->var12, a3->var13, a3->var18);
  *((_QWORD *)v8 + 21) = *((_QWORD *)&v18 + 1);
  *((_QWORD *)v8 + 22) = v19;
  *((_QWORD *)v8 + 24) = v20;
  *((_QWORD *)v8 + 23) = *((_QWORD *)&v19 + 1);
  var19 = a3->var19;
  *((_QWORD *)v8 + 25) = var19;
  var20 = a3->var20;
  *((_QWORD *)v8 + 26) = var20;
  *((_QWORD *)v8 + 9) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", (var20 + var19), a3->var5, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  +[WiFiUsageLQMTransformations ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:](WiFiUsageLQMTransformations, "ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:", a3->var25 + a3->var24 + a3->var32 + a3->var26);
  *(_OWORD *)(v8 + 248) = v15;
  *((_QWORD *)v8 + 33) = v16;
  *((_QWORD *)v8 + 35) = v17;
  *((_QWORD *)v8 + 34) = *((_QWORD *)&v16 + 1);
  *((_QWORD *)v8 + 36) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var24, a3->var30, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  var23 = a3->var23;
  *((_QWORD *)v8 + 27) = var23;
  *((_QWORD *)v8 + 28) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var29, var23, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  *((_QWORD *)v8 + 29) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var27, *((_QWORD *)v8 + 27), +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  *((_QWORD *)v8 + 30) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var31, *((_QWORD *)v8 + 27), +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  return (WiFiUsageLQMKernelSampleInfraTXRX *)v8;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)decodingAttempts
{
  return self->_decodingAttempts;
}

- (void)setDecodingAttempts:(unint64_t)a3
{
  self->_decodingAttempts = a3;
}

- (unint64_t)rxStartOverDecodingAttemptsPercentage
{
  return self->_rxStartOverDecodingAttemptsPercentage;
}

- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxStartOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage
{
  return self->_rxBadPlcpOverDecodingAttemptsPercentage;
}

- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxBadPlcpOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage
{
  return self->_rxCrsGlitchOverDecodingAttemptsPercentage;
}

- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxCrsGlitchOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxDecodingErrorsOverRxStart
{
  return self->_rxDecodingErrorsOverRxStart;
}

- (void)setRxDecodingErrorsOverRxStart:(unint64_t)a3
{
  self->_rxDecodingErrorsOverRxStart = a3;
}

- (unint64_t)rxUcastOverRxStart
{
  return self->_rxUcastOverRxStart;
}

- (void)setRxUcastOverRxStart:(unint64_t)a3
{
  self->_rxUcastOverRxStart = a3;
}

- (unint64_t)rxBeaconOverRxStart
{
  return self->_rxBeaconOverRxStart;
}

- (void)setRxBeaconOverRxStart:(unint64_t)a3
{
  self->_rxBeaconOverRxStart = a3;
}

- (unint64_t)rxFrmTooLongOverDecodingErrors
{
  return self->_rxFrmTooLongOverDecodingErrors;
}

- (void)setRxFrmTooLongOverDecodingErrors:(unint64_t)a3
{
  self->_rxFrmTooLongOverDecodingErrors = a3;
}

- (unint64_t)rxFrmTooShrtOverDecodingErrors
{
  return self->_rxFrmTooShrtOverDecodingErrors;
}

- (void)setRxFrmTooShrtOverDecodingErrors:(unint64_t)a3
{
  self->_rxFrmTooShrtOverDecodingErrors = a3;
}

- (unint64_t)rxAnyErrOverDecodingErrors
{
  return self->_rxAnyErrOverDecodingErrors;
}

- (void)setRxAnyErrOverDecodingErrors:(unint64_t)a3
{
  self->_rxAnyErrOverDecodingErrors = a3;
}

- (unint64_t)rxBadFCSOverDecodingErrors
{
  return self->_rxBadFCSOverDecodingErrors;
}

- (void)setRxBadFCSOverDecodingErrors:(unint64_t)a3
{
  self->_rxBadFCSOverDecodingErrors = a3;
}

- (unint64_t)rxResponseTimeoutOverDecodingErrors
{
  return self->_rxResponseTimeoutOverDecodingErrors;
}

- (void)setRxResponseTimeoutOverDecodingErrors:(unint64_t)a3
{
  self->_rxResponseTimeoutOverDecodingErrors = a3;
}

- (unint64_t)rxNoDelimOverDecodingErrors
{
  return self->_rxNoDelimOverDecodingErrors;
}

- (void)setRxNoDelimOverDecodingErrors:(unint64_t)a3
{
  self->_rxNoDelimOverDecodingErrors = a3;
}

- (unint64_t)rxFifo0OvflOverDecodingErrors
{
  return self->_rxFifo0OvflOverDecodingErrors;
}

- (void)setRxFifo0OvflOverDecodingErrors:(unint64_t)a3
{
  self->_rxFifo0OvflOverDecodingErrors = a3;
}

- (unint64_t)rxFifo1OvflOverDecodingErrors
{
  return self->_rxFifo1OvflOverDecodingErrors;
}

- (void)setRxFifo1OvflOverDecodingErrors:(unint64_t)a3
{
  self->_rxFifo1OvflOverDecodingErrors = a3;
}

- (unint64_t)rxUcastDataPercentage
{
  return self->_rxUcastDataPercentage;
}

- (void)setRxUcastDataPercentage:(unint64_t)a3
{
  self->_rxUcastDataPercentage = a3;
}

- (unint64_t)rxUcastMgmtPercentage
{
  return self->_rxUcastMgmtPercentage;
}

- (void)setRxUcastMgmtPercentage:(unint64_t)a3
{
  self->_rxUcastMgmtPercentage = a3;
}

- (unint64_t)rxUcastCtrlPercentage
{
  return self->_rxUcastCtrlPercentage;
}

- (void)setRxUcastCtrlPercentage:(unint64_t)a3
{
  self->_rxUcastCtrlPercentage = a3;
}

- (unint64_t)rxUcastRTSOverRxCtrlFrmsPercentage
{
  return self->_rxUcastRTSOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastRTSOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastRTSOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxUcastCTSOverRxCtrlFrmsPercentage
{
  return self->_rxUcastCTSOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastCTSOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastCTSOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxBACKOverRxCtrlFrmsPercentage
{
  return self->_rxBACKOverRxCtrlFrmsPercentage;
}

- (void)setRxBACKOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxBACKOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxUcastACKOverRxCtrlFrmsPercentage
{
  return self->_rxUcastACKOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastACKOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastACKOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxBeaconMbss
{
  return self->_rxBeaconMbss;
}

- (void)setRxBeaconMbss:(unint64_t)a3
{
  self->_rxBeaconMbss = a3;
}

- (unint64_t)rxBeaconObss
{
  return self->_rxBeaconObss;
}

- (void)setRxBeaconObss:(unint64_t)a3
{
  self->_rxBeaconObss = a3;
}

- (unint64_t)txAllFrm
{
  return self->_txAllFrm;
}

- (void)setTxAllFrm:(unint64_t)a3
{
  self->_txAllFrm = a3;
}

- (unint64_t)txPhyErrorOverTxAllFrmPercentage
{
  return self->_txPhyErrorOverTxAllFrmPercentage;
}

- (void)setTxPhyErrorOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txPhyErrorOverTxAllFrmPercentage = a3;
}

- (unint64_t)txAMPDUOverTxAllFrmPercentage
{
  return self->_txAMPDUOverTxAllFrmPercentage;
}

- (void)setTxAMPDUOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txAMPDUOverTxAllFrmPercentage = a3;
}

- (unint64_t)txUcastOverTxAllFrmPercentage
{
  return self->_txUcastOverTxAllFrmPercentage;
}

- (void)setTxUcastOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txUcastOverTxAllFrmPercentage = a3;
}

- (unint64_t)txCtrlFrms
{
  return self->_txCtrlFrms;
}

- (void)setTxCtrlFrms:(unint64_t)a3
{
  self->_txCtrlFrms = a3;
}

- (unint64_t)txRTSOverTxCtrlFrmsPercentage
{
  return self->_txRTSOverTxCtrlFrmsPercentage;
}

- (void)setTxRTSOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txRTSOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txCTSOverTxCtrlFrmsPercentage
{
  return self->_txCTSOverTxCtrlFrmsPercentage;
}

- (void)setTxCTSOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txCTSOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txBACKOverTxCtrlFrmsPercentage
{
  return self->_txBACKOverTxCtrlFrmsPercentage;
}

- (void)setTxBACKOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txBACKOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txACKOverTxCtrlFrmsPercentage
{
  return self->_txACKOverTxCtrlFrmsPercentage;
}

- (void)setTxACKOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txACKOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txRTSFailOvertxRTS
{
  return self->_txRTSFailOvertxRTS;
}

- (void)setTxRTSFailOvertxRTS:(unint64_t)a3
{
  self->_txRTSFailOvertxRTS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
