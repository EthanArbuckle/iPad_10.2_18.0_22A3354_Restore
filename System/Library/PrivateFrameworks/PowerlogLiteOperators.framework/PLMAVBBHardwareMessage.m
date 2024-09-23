@implementation PLMAVBBHardwareMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logAgent, 0);
  objc_storeStrong((id *)&self->_bbMonotonic, 0);
  objc_storeStrong((id *)&self->_bbtimestamp, 0);
  objc_storeStrong((id *)&self->_triggerCnt, 0);
  objc_storeStrong((id *)&self->_metricDataArr, 0);
  objc_storeStrong((id *)&self->_metricIdArr, 0);
  objc_storeStrong((id *)&self->_pbc, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_triggerId, 0);
  objc_storeStrong((id *)&self->_metricData, 0);
  objc_storeStrong((id *)&self->_metricId, 0);
}

- (void)protocolHistForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  if (objc_msgSend(v13, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v13, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, CFSTR("bbtimestamp"));
  }
  if (objc_msgSend(v13, "hasDurationMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "durationMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, CFSTR("duration"));
  }
  if (objc_msgSend(v13, "hasSubsId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "subsId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("subs_id"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, CFSTR("subs_id"));
  }
  if (objc_msgSend(v13, "binsCount"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dur_bin_%d"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "binAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasBinId") && objc_msgSend(v11, "hasDuration"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "duration"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v10);

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, v10);
      }

      ++v9;
    }
    while (objc_msgSend(v13, "binsCount") > v9);
  }

}

- (void)addToListMetric:(id)a3 payload:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableArray *metricDataArr;
  void *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D7FFA0];
  v8 = a4;
  if (objc_msgSend(v7, "debugEnabled"))
  {
    v9 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __50__PLMAVBBHardwareMessage_addToListMetric_payload___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v9;
    if (qword_1ED886088 != -1)
      dispatch_once(&qword_1ED886088, &block);
    if (byte_1ED886072)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMAVBBHardwareMessage addToListMetric:payload:]", block, v19, v20, v21, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBHardwareMessage addToListMetric:payload:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 168);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableArray addObject:](self->_metricIdArr, "addObject:", v6);
  metricDataArr = self->_metricDataArr;
  +[PLMAVBBMetricUtility convertToStringData:](PLMAVBBMetricUtility, "convertToStringData:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](metricDataArr, "addObject:", v17);
}

- (id)decodePayload:(id)a3 forMetricId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AWDMETRICSCellularPowerLog *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("metricId"));
  v9 = -[AWDMETRICSCellularPowerLog initWithData:]([AWDMETRICSCellularPowerLog alloc], "initWithData:", v6);
  v10 = objc_msgSend(v7, "integerValue");
  switch(v10)
  {
    case 816650:
      -[AWDMETRICSCellularPowerLog cellularPowerLogL1SleepStatesAtIndex:](v9, "cellularPowerLogL1SleepStatesAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816651:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTEConfiguredCASCCStatesAtIndex:](v9, "cellularPowerLogLTEConfiguredCASCCStatesAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816652:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTEActivatedCASCCStatesAtIndex:](v9, "cellularPowerLogLTEActivatedCASCCStatesAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816653:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTERxTxActivityStatesAtIndex:](v9, "cellularPowerLogLTERxTxActivityStatesAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816654:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTECarrierComponentInfoAtIndex:](v9, "cellularPowerLogLTECarrierComponentInfoAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMAVBBHardwareMessage lteComponentCarrierForClass:forEntry:](self, "lteComponentCarrierForClass:forEntry:", v20, v8);
      goto LABEL_64;
    case 816655:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTEAggregatedDLTBSAtIndex:](v9, "cellularPowerLogLTEAggregatedDLTBSAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816656:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTERSRPAtIndex:](v9, "cellularPowerLogLTERSRPAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816657:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTESINRAtIndex:](v9, "cellularPowerLogLTESINRAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816658:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTETxPowerAtIndex:](v9, "cellularPowerLogLTETxPowerAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816659:
      -[AWDMETRICSCellularPowerLog cellularPowerLogLTERxDiversityAtIndex:](v9, "cellularPowerLogLTERxDiversityAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816660:
    case 816662:
    case 816663:
    case 816672:
    case 816684:
    case 816685:
    case 816686:
    case 816687:
    case 816688:
    case 816689:
    case 816690:
    case 816691:
    case 816692:
    case 816693:
    case 816694:
    case 816695:
    case 816696:
    case 816697:
    case 816698:
    case 816699:
    case 816701:
    case 816708:
    case 816711:
    case 816714:
    case 816716:
    case 816723:
      goto LABEL_6;
    case 816661:
      -[AWDMETRICSCellularPowerLog cellularPowerLogPowerEstimatorAtIndex:](v9, "cellularPowerLogPowerEstimatorAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816664:
      -[AWDMETRICSCellularPowerLog cellularPowerLogProtocolStateAtIndex:](v9, "cellularPowerLogProtocolStateAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816665:
      -[AWDMETRICSCellularPowerLog cellularPowerLogPLMNSearchAtIndex:](v9, "cellularPowerLogPLMNSearchAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816666:
      -[AWDMETRICSCellularPowerLog cellularPowerLogGSMTxPowerAtIndex:](v9, "cellularPowerLogGSMTxPowerAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816667:
      -[AWDMETRICSCellularPowerLog cellularPowerLogGSMRxRSSIAtIndex:](v9, "cellularPowerLogGSMRxRSSIAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816668:
      -[AWDMETRICSCellularPowerLog cellularPowerLogGSMRABModeAtIndex:](v9, "cellularPowerLogGSMRABModeAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816669:
      -[AWDMETRICSCellularPowerLog cellularPowerLogGSMRxDiversityAtIndex:](v9, "cellularPowerLogGSMRxDiversityAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816670:
      -[AWDMETRICSCellularPowerLog cellularPowerLogWCDMATxPowerAtIndex:](v9, "cellularPowerLogWCDMATxPowerAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816671:
      -[AWDMETRICSCellularPowerLog cellularPowerLogWCDMARxRSSIAtIndex:](v9, "cellularPowerLogWCDMARxRSSIAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816673:
      -[AWDMETRICSCellularPowerLog cellularPowerLogWCDMARxDiversityAtIndex:](v9, "cellularPowerLogWCDMARxDiversityAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816674:
      -[AWDMETRICSCellularPowerLog cellularPowerLogWCDMARABModeAtIndex:](v9, "cellularPowerLogWCDMARABModeAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816675:
      -[AWDMETRICSCellularPowerLog cellularPowerLogWCDMARABTypeAtIndex:](v9, "cellularPowerLogWCDMARABTypeAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816676:
      -[AWDMETRICSCellularPowerLog cellularPowerLogEVDOTxPowerAtIndex:](v9, "cellularPowerLogEVDOTxPowerAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816677:
      -[AWDMETRICSCellularPowerLog cellularPowerLogEVDORxRSSIAtIndex:](v9, "cellularPowerLogEVDORxRSSIAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816678:
      -[AWDMETRICSCellularPowerLog cellularPowerLogHybridRABModeAtIndex:](v9, "cellularPowerLogHybridRABModeAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816679:
      -[AWDMETRICSCellularPowerLog cellularPowerLogEVDORxDiversityAtIndex:](v9, "cellularPowerLogEVDORxDiversityAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816680:
      -[AWDMETRICSCellularPowerLog cellularPowerLogCDMA1XTxPowerAtIndex:](v9, "cellularPowerLogCDMA1XTxPowerAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816681:
      -[AWDMETRICSCellularPowerLog cellularPowerLogCDMA1XRxRSSIAtIndex:](v9, "cellularPowerLogCDMA1XRxRSSIAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816682:
      -[AWDMETRICSCellularPowerLog cellularPowerLogCDMA1XRABModeAtIndex:](v9, "cellularPowerLogCDMA1XRABModeAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816683:
      -[AWDMETRICSCellularPowerLog cellularPowerLogCDMA1XRxDiversityAtIndex:](v9, "cellularPowerLogCDMA1XRxDiversityAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816700:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6BWPAtIndex:](v9, "cellularPowerLogNRsub6BWPAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816702:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6CASCCConfiguredAtIndex:](v9, "cellularPowerLogNRsub6CASCCConfiguredAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816703:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6CASCCActivatedAtIndex:](v9, "cellularPowerLogNRsub6CASCCActivatedAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816704:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6RxTxAtIndex:](v9, "cellularPowerLogNRsub6RxTxAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816705:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6CarrierComponentInfoAtIndex:](v9, "cellularPowerLogNRsub6CarrierComponentInfoAtIndex:", 0);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 816706:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6DLTBSAtIndex:](v9, "cellularPowerLogNRsub6DLTBSAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816707:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6RSRPAtIndex:](v9, "cellularPowerLogNRsub6RSRPAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816709:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6TxPowerAtIndex:](v9, "cellularPowerLogNRsub6TxPowerAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816710:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRsub6RxDiversityAtIndex:](v9, "cellularPowerLogNRsub6RxDiversityAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816712:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRmmWaveBWPAtIndex:](v9, "cellularPowerLogNRmmWaveBWPAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816713:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRmmWaveAntennaPanelAtIndex:](v9, "cellularPowerLogNRmmWaveAntennaPanelAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816715:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRmmWaveBeamIDAtIndex:](v9, "cellularPowerLogNRmmWaveBeamIDAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816717:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRmmWaveCASCCConfiguredAtIndex:](v9, "cellularPowerLogNRmmWaveCASCCConfiguredAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816718:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRmmWaveCASCCActivatedAtIndex:](v9, "cellularPowerLogNRmmWaveCASCCActivatedAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816719:
    case 816724:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRMmWaveTxPowerAtIndex:](v9, "cellularPowerLogNRMmWaveTxPowerAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816720:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRmmWaveCarrierComponentInfoAtIndex:](v9, "cellularPowerLogNRmmWaveCarrierComponentInfoAtIndex:", 0);
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_59:
      v20 = (void *)v21;
      -[PLMAVBBHardwareMessage nrComponentCarrierForClass:forEntry:](self, "nrComponentCarrierForClass:forEntry:", v21, v8);
      goto LABEL_64;
    case 816721:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRmmWaveDLTBSAtIndex:](v9, "cellularPowerLogNRmmWaveDLTBSAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816722:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRMmWaveRSRPAtIndex:](v9, "cellularPowerLogNRMmWaveRSRPAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 816725:
      -[AWDMETRICSCellularPowerLog cellularPowerLogNRMmWaveULCAStateAtIndex:](v9, "cellularPowerLogNRMmWaveULCAStateAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_63:
      v20 = (void *)v11;
      -[PLMAVBBHardwareMessage protocolHistForClass:forEntry:](self, "protocolHistForClass:forEntry:", v11, v8);
LABEL_64:

      goto LABEL_65;
    default:
      if (v10 == 786435)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          __assert_rtn("-[PLMAVBBHardwareMessage decodePayload:forMetricId:]", "PLMAVBBHardwareMessage.m", 190, "0");
LABEL_65:
        v19 = v8;
      }
      else
      {
LABEL_6:
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v12 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __52__PLMAVBBHardwareMessage_decodePayload_forMetricId___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v12;
          if (qword_1ED886090 != -1)
            dispatch_once(&qword_1ED886090, block);
          if (byte_1ED886073)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: unexpected metric Id"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "lastPathComponent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBHardwareMessage decodePayload:forMetricId:]");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 503);

            PLLogCommon();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v13;
              _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v19 = 0;
      }

      return v19;
  }
}

- (void)logBBMavPeriodicMetrics
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __49__PLMAVBBHardwareMessage_logBBMavPeriodicMetrics__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v3;
    if (qword_1ED886080 != -1)
      dispatch_once(&qword_1ED886080, &block);
    if (byte_1ED886071)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMAVBBHardwareMessage logBBMavPeriodicMetrics]", block, v14, v15, v16, v17);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBHardwareMessage logBBMavPeriodicMetrics]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 147);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBMavPeriodicMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setEntryDate:", self->_bbMonotonic);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_triggerId, CFSTR("triggerId"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_bbtimestamp, CFSTR("bbtimestamp"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_triggerCnt, CFSTR("triggerCnt"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_metricIdArr, CFSTR("mid"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_metricDataArr, CFSTR("data"));
    -[PLAgent logEntry:](self->_logAgent, "logEntry:", v12);
  }

}

- (id)initEntryWithBBTS:(id)a3 triggerId:(id)a4 seqnum:(id)a5 payload:(id)a6 logAgent:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PLMAVBBHardwareMessage *v17;
  void *v18;
  uint64_t v19;
  NSDate *bbMonotonic;
  uint64_t v21;
  NSString *metricData;
  uint64_t v23;
  NSMutableArray *metricIdArr;
  uint64_t v25;
  NSMutableArray *metricDataArr;
  id v28;
  objc_super v29;

  v13 = a3;
  v28 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PLMAVBBHardwareMessage;
  v17 = -[PLMAVBBHardwareMessage init](&v29, sel_init);
  if (v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)(objc_msgSend(v13, "integerValue") / 1000));
    objc_msgSend(v18, "convertFromBasebandToMonotonic");
    v19 = objc_claimAutoreleasedReturnValue();
    bbMonotonic = v17->_bbMonotonic;
    v17->_bbMonotonic = (NSDate *)v19;

    objc_storeStrong((id *)&v17->_triggerId, a4);
    objc_storeStrong((id *)&v17->_bbtimestamp, a3);
    objc_storeStrong((id *)&v17->_triggerCnt, a5);
    +[PLMAVBBMetricUtility convertToStringData:](PLMAVBBMetricUtility, "convertToStringData:", v15);
    v21 = objc_claimAutoreleasedReturnValue();
    metricData = v17->_metricData;
    v17->_metricData = (NSString *)v21;

    v23 = objc_opt_new();
    metricIdArr = v17->_metricIdArr;
    v17->_metricIdArr = (NSMutableArray *)v23;

    v25 = objc_opt_new();
    metricDataArr = v17->_metricDataArr;
    v17->_metricDataArr = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v17->_logAgent, a7);
  }

  return v17;
}

- (void)logBBMavAperiodicMetrics
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __50__PLMAVBBHardwareMessage_logBBMavAperiodicMetrics__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v3;
    if (qword_1ED886078 != -1)
      dispatch_once(&qword_1ED886078, &block);
    if (_MergedGlobals_75)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMAVBBHardwareMessage logBBMavAperiodicMetrics]", block, v14, v15, v16, v17);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBHardwareMessage logBBMavAperiodicMetrics]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 128);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBMavEventMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setEntryDate:", self->_bbMonotonic);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_bbtimestamp, CFSTR("bbtimestamp"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_triggerCnt, CFSTR("triggerCnt"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_triggerId, CFSTR("metricId"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_metricData, CFSTR("metricData"));
    -[PLAgent logEntry:](self->_logAgent, "logEntry:", v12);
  }

}

- (void)lteComponentCarrierForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = a4;
  if (objc_msgSend(v20, "carrierInfosCount"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v20, "carrierInfoAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasBand"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_rf_band_%d"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "band"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

      }
      if (objc_msgSend(v7, "hasBandwidth"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_bandwidth_%d"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "bandwidth"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

      }
      if (objc_msgSend(v7, "hasEarfcn"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_earfcn_%d"), v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "earfcn"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

      }
      if (objc_msgSend(v7, "hasType"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_type_%d"), v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "type"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);

      }
      if (objc_msgSend(v7, "hasDuplex"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_duplex_%d"), v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "duplex"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v16);

      }
      ++v6;
    }
    while (objc_msgSend(v20, "carrierInfosCount") > v6);
  }
  if ((objc_msgSend(v20, "hasTimestamp") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("bbtimestamp"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, CFSTR("bbtimestamp"));
  }
  if (objc_msgSend(v20, "hasSubsId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "subsId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("subs_id"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, CFSTR("subs_id"));
  }

}

- (PLMAVBBHardwareMessage)init
{
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    __assert_rtn("-[PLMAVBBHardwareMessage init]", "PLMAVBBHardwareMessage.m", 56, "0");

  return 0;
}

+ (id)entryEventBackwardDefinitionBBMavPeriodicMetrics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80308];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E8652770;
  v26[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("triggerId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v23[1] = CFSTR("triggerCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  v23[2] = CFSTR("bbtimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  v23[3] = CFSTR("mid");
  v7 = *MEMORY[0x1E0D80348];
  v20[0] = *MEMORY[0x1E0D80358];
  v6 = v20[0];
  v20[1] = v7;
  v22[0] = &unk_1E862EAB8;
  v22[1] = &unk_1E862EAD0;
  v21 = *MEMORY[0x1E0D80350];
  v8 = v21;
  v22[2] = &unk_1E862EAE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v9;
  v23[4] = CFSTR("data");
  v18[0] = v6;
  v18[1] = v7;
  v19[0] = &unk_1E862EAB8;
  v19[1] = &unk_1E862EAD0;
  v18[2] = v8;
  v19[2] = &unk_1E862EB00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionBBMavEventMetrics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80308];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8652770;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("triggerCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("bbtimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("metricId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("metricData");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __50__PLMAVBBHardwareMessage_logBBMavAperiodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_75 = result;
  return result;
}

uint64_t __49__PLMAVBBHardwareMessage_logBBMavPeriodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886071 = result;
  return result;
}

uint64_t __50__PLMAVBBHardwareMessage_addToListMetric_payload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886072 = result;
  return result;
}

uint64_t __52__PLMAVBBHardwareMessage_decodePayload_forMetricId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886073 = result;
  return result;
}

- (void)nrComponentCarrierForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = a4;
  if (objc_msgSend(v20, "carrierInfosCount"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v20, "carrierInfoAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasBand"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_rf_band_%d"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "band"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

      }
      if (objc_msgSend(v7, "hasBandwidth"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_bandwidth_%d"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "bandwidth"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

      }
      if (objc_msgSend(v7, "hasEarfcn"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_earfcn_%d"), v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "earfcn"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

      }
      if (objc_msgSend(v7, "hasType"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_type_%d"), v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "type"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);

      }
      if (objc_msgSend(v7, "hasDuplex"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_duplex_%d"), v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "duplex"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v16);

      }
      ++v6;
    }
    while (objc_msgSend(v20, "carrierInfosCount") > v6);
  }
  if ((objc_msgSend(v20, "hasTimestamp") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("bbtimestamp"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, CFSTR("bbtimestamp"));
  }
  if (objc_msgSend(v20, "hasSubsId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "subsId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("subs_id"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E862EB18, CFSTR("subs_id"));
  }

}

- (NSNumber)metricId
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetricId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)metricData
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)triggerId
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTriggerId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PBCodable)pbc
{
  return (PBCodable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPbc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)metricIdArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetricIdArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)metricDataArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetricDataArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)triggerCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTriggerCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)bbtimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBbtimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)bbMonotonic
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbMonotonic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLAgent)logAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLogAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

@end
