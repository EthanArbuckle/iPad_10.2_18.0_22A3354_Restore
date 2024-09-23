@implementation WCM_CellularRc1CoexIssue

- (WCM_CellularRc1CoexIssue)init
{
  char *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCM_CellularRc1CoexIssue;
  v2 = -[WCM_CellularRc1CoexIssue init](&v6, "init");
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)*((_QWORD *)v2 + 11);
  *((_QWORD *)v2 + 11) = v3;

  *((_DWORD *)v2 + 5) = 0;
  *((_DWORD *)v2 + 12) = -1;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *((_OWORD *)v2 + 2) = xmmword_1001DB8F0;
  return (WCM_CellularRc1CoexIssue *)v2;
}

- (BOOL)setIssueFrequencyRangeByIssueBand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int bandInfoType;
  uint64_t v11;
  char *v12;
  BOOL v13;
  double *v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(off_100270BC0, "objectForKey:", v4));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(off_100270BC0, "objectForKey:", v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
      self->_bandInfoType = objc_msgSend(v7, "intValue");

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
      v9 = objc_msgSend(v8, "intValue");

      self->_cellBand = v9;
      bandInfoType = self->_bandInfoType;
      if ((bandInfoType & 0x40) != 0 && v9 <= 0x4F)
      {
        v11 = v9;
        v12 = (char *)&unk_1001DBDE8;
      }
      else if ((bandInfoType & 1) != 0 && v9 <= 0x58)
      {
        v11 = v9;
        v12 = (char *)&unk_1001DC7E8;
      }
      else
      {
        v13 = 0;
        if ((bandInfoType & 8) == 0 || v9 > 0x15)
          goto LABEL_14;
        v11 = v9;
        v12 = (char *)&unk_1001DD308;
      }
      v14 = (double *)&v12[32 * v11];
      self->_downlinkLowFreq_Hz = *v14 * 1000000.0;
      self->_downlinkHighFreq_Hz = v14[1] * 1000000.0;
      self->_uplinkLowFreq_Hz = v14[2] * 1000000.0;
      self->_uplinkHighFreq_Hz = v14[3] * 1000000.0;
      v13 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)uwbCoexIssueFreqRangeForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 uwbIssueFreqRange:(id *)a7
{
  int Rc1IssueChannel;
  double v11;
  double v12;
  uint64_t issueType;
  double v14;
  double v15;
  _BOOL4 v16;
  uint64_t v18;
  uint64_t v19;
  float64x2_t v20;
  double v21;
  double v22;

  v21 = 0.0;
  v22 = 0.0;
  v20 = 0uLL;
  Rc1IssueChannel = self->_Rc1IssueChannel;
  v11 = 500000000.0;
  v12 = 6239600000.0;
  if (Rc1IssueChannel > 31)
  {
    if (Rc1IssueChannel <= 127)
    {
      if (Rc1IssueChannel == 32)
      {
        v11 = 125000000.0;
        v12 = 6050000000.0;
        goto LABEL_18;
      }
      if (Rc1IssueChannel == 64)
      {
        v11 = 125000000.0;
        v12 = 6175000000.0;
        goto LABEL_18;
      }
    }
    else
    {
      switch(Rc1IssueChannel)
      {
        case 128:
          v11 = 125000000.0;
          v12 = 6300000000.0;
          goto LABEL_18;
        case 256:
          goto LABEL_18;
        case 512:
LABEL_8:
          v12 = 7737200000.0;
          goto LABEL_18;
      }
    }
LABEL_15:
    v12 = 0.0;
    v11 = 0.0;
    goto LABEL_18;
  }
  switch(Rc1IssueChannel)
  {
    case 1:
      break;
    case 2:
      goto LABEL_8;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_15;
    case 4:
      v11 = 125000000.0;
      v12 = 5725000000.0;
      break;
    case 8:
      goto LABEL_14;
    default:
      if (Rc1IssueChannel != 16)
        goto LABEL_15;
      v11 = 125000000.0;
LABEL_14:
      v12 = 5925000000.0;
      break;
  }
LABEL_18:
  issueType = self->_issueType;
  v14 = a6 - a5;
  v15 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      v16 = sub_10007B0D8(0, v20.f64, a5, a6 - a5, v12, v11);
      if (!v16)
        goto LABEL_33;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = RC1 Rx(%lf~%lf)"), *(_QWORD *)&a5, v14 + a5, *(_QWORD *)&v20.f64[0], v20.f64[0] + v20.f64[1]);
      v20 = vaddq_f64(v20, (float64x2_t)xmmword_1001DB900);
      goto LABEL_24;
    case 1:
    case 4:
    case 7:
      v16 = sub_10007B558(v20.f64, 0, &v21, v12, v11, a5, a6 - a5, a3, v15);
      if (!v16)
        goto LABEL_33;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x RC1 Tx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v20.f64[0], v20.f64[0] + v20.f64[1], *(_QWORD *)&a5, v14 + a5, *(_QWORD *)&v21, v21 + v22);
      break;
    case 3:
      v16 = sub_10007B308(v20.f64, 0, &v21, v12, v11, a5, a6 - a5, a3, v15);
      if (!v16)
        goto LABEL_33;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("RC1 Tx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v20.f64[0], v20.f64[0] + v20.f64[1], *(_QWORD *)&a5, v14 + a5, *(_QWORD *)&v21, v21 + v22);
      break;
    case 9:
      v16 = sub_10007B07C(0, v20.f64, a5, a6 - a5, v12, v11);
      if (!v16)
        goto LABEL_33;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = RC1 Rx(%lf~%lf)"), *(_QWORD *)&a5, v14 + a5, *(_QWORD *)&v20.f64[0], v20.f64[0] + v20.f64[1], v18, v19);
      break;
    case 12:
    case 13:
      v20 = 0uLL;
LABEL_24:
      LOBYTE(v16) = 1;
      if (!a7)
        return v16;
      goto LABEL_34;
    case 14:
      v16 = sub_10007B07C(v20.f64, 0, v12, v11, a3, v15);
      if (!v16)
        goto LABEL_33;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("(2 x RC1 Tx)(i.e. %lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v20.f64[0], v20.f64[0] + v20.f64[1], *(_QWORD *)&a3, v15 + a3, v18, v19);
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      LOBYTE(v16) = 0;
      if (!a7)
        return v16;
      goto LABEL_34;
  }
  LOBYTE(v16) = 1;
LABEL_33:
  if (a7)
LABEL_34:
    *a7 = ($F24F406B2B787EFB06265DBA3D28CBD5)v20;
  return v16;
}

- (void)uwbNbCoexIssueChannelForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 uwbNbIssueChannelBegin:(int *)a7 uwbNbIssueChannelEnd:(int *)a8
{
  int Rc1IssueChannel;
  int v12;
  double v13;
  uint64_t v14;
  const __CFString *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;

  Rc1IssueChannel = self->_Rc1IssueChannel;
  if (Rc1IssueChannel > 31)
  {
    switch(Rc1IssueChannel)
    {
      case 32:
        v12 = 100;
        v13 = 6050000000.0;
        goto LABEL_14;
      case 64:
        v12 = 150;
        v13 = 6175000000.0;
        goto LABEL_14;
      case 128:
        v12 = 200;
        v13 = 6300000000.0;
        goto LABEL_14;
    }
  }
  else
  {
    if (Rc1IssueChannel == 4)
    {
      v12 = 0;
      v13 = 5725000000.0;
      goto LABEL_14;
    }
    if (Rc1IssueChannel == 8 || Rc1IssueChannel == 16)
    {
      v12 = 50;
      v13 = 5925000000.0;
      goto LABEL_14;
    }
  }
  v12 = 0;
  v13 = 0.0;
LABEL_14:
  v19 = 0.0;
  v20 = 0.0;
  if (-[WCM_CellularRc1CoexIssue uwbCoexIssueFreqRangeForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:uwbIssueFreqRange:](self, "uwbCoexIssueFreqRangeForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:uwbIssueFreqRange:", &v19, a3, a4, a5, a6))
  {
    if (v19 == 0.0)
    {
      *a7 = -[WCM_CellularRc1CoexIssue nbChannelToAvoidStart](self, "nbChannelToAvoidStart", v19);
      v14 = -[WCM_CellularRc1CoexIssue nbChannelToAvoidEnd](self, "nbChannelToAvoidEnd");
    }
    else
    {
      v16 = v19 + v20 - v13 + -1.0;
      *a7 = v12 + (unint64_t)(v19 - v13) / 0x2625A0;
      v14 = v12 + ((unint64_t)v16 / 0x2625A0);
    }
    *a8 = v14;
    v17 = *a7;
    v18 = v14;
    v15 = CFSTR("RC1 NB channels with issue [%d - %d]");
  }
  else
  {
    *a7 = -1;
    *a8 = -1;
    v15 = CFSTR("RC1 NB channels with issue: NONE");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v15, v17, v18);
}

- (id)generateDynamicPolicyForCoexIssueForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 rc1NbIssueChannelBegin:(unsigned int)a7 rc1NbIssueChannelEnd:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  WCM_Rc1NbDynamicPolicy *v15;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v15 = objc_alloc_init(WCM_Rc1NbDynamicPolicy);
  -[WCM_Rc1NbDynamicPolicy setCellBand:](v15, "setCellBand:", -[WCM_CellularRc1CoexIssue cellBand](self, "cellBand"));
  -[WCM_Rc1NbDynamicPolicy setBandInfoType:](v15, "setBandInfoType:", -[WCM_CellularRc1CoexIssue bandInfoType](self, "bandInfoType"));
  -[WCM_Rc1NbDynamicPolicy setDownlinkLowFreq_Hz:](v15, "setDownlinkLowFreq_Hz:", (unint64_t)a3);
  -[WCM_Rc1NbDynamicPolicy setDownlinkHighFreq_Hz:](v15, "setDownlinkHighFreq_Hz:", (unint64_t)a4);
  -[WCM_Rc1NbDynamicPolicy setUplinkLowFreq_Hz:](v15, "setUplinkLowFreq_Hz:", (unint64_t)a5);
  -[WCM_Rc1NbDynamicPolicy setUplinkHighFreq_Hz:](v15, "setUplinkHighFreq_Hz:", (unint64_t)a6);
  -[WCM_Rc1NbDynamicPolicy setRc1IssueChannel:](v15, "setRc1IssueChannel:", -[WCM_CellularRc1CoexIssue Rc1IssueChannel](self, "Rc1IssueChannel"));
  -[WCM_Rc1NbDynamicPolicy setRc1AntBitmap:](v15, "setRc1AntBitmap:", -[WCM_CellularRc1CoexIssue Rc1AntBitmap](self, "Rc1AntBitmap"));
  -[WCM_Rc1NbDynamicPolicy setRc1PriorityBitmap:](v15, "setRc1PriorityBitmap:", -[WCM_CellularRc1CoexIssue Rc1PriorityBitmap](self, "Rc1PriorityBitmap"));
  -[WCM_Rc1NbDynamicPolicy setCellTxPowerCap_16th_dBm:](v15, "setCellTxPowerCap_16th_dBm:", -[WCM_CellularRc1CoexIssue cellTxPowerCap_16th_dBm](self, "cellTxPowerCap_16th_dBm"));
  -[WCM_Rc1NbDynamicPolicy setCellAgressorAntBitmap:](v15, "setCellAgressorAntBitmap:", -[WCM_CellularRc1CoexIssue cellAgressorAntBitmap](self, "cellAgressorAntBitmap"));
  -[WCM_Rc1NbDynamicPolicy setMitigationType:](v15, "setMitigationType:", -[WCM_CellularRc1CoexIssue mitigationType](self, "mitigationType"));
  -[WCM_Rc1NbDynamicPolicy setNbChannelToAvoidStart:](v15, "setNbChannelToAvoidStart:", v9);
  -[WCM_Rc1NbDynamicPolicy setNbChannelToAvoidEnd:](v15, "setNbChannelToAvoidEnd:", v8);
  return v15;
}

- (id)uwbNbDynamicCoexPolicyForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6
{
  void *v12;
  int v14;
  int v15;

  v14 = -1;
  v15 = -1;
  -[WCM_CellularRc1CoexIssue uwbNbCoexIssueChannelForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:uwbNbIssueChannelBegin:uwbNbIssueChannelEnd:](self, "uwbNbCoexIssueChannelForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:uwbNbIssueChannelBegin:uwbNbIssueChannelEnd:", &v15, &v14);
  if (v15 == -1 || v14 == -1)
    v12 = 0;
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1CoexIssue generateDynamicPolicyForCoexIssueForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:rc1NbIssueChannelBegin:rc1NbIssueChannelEnd:](self, "generateDynamicPolicyForCoexIssueForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:rc1NbIssueChannelBegin:rc1NbIssueChannelEnd:", a3, a4, a5, a6));
  return v12;
}

- (int)bandInfoType
{
  return self->_bandInfoType;
}

- (void)setBandInfoType:(int)a3
{
  self->_bandInfoType = a3;
}

- (unsigned)cellBand
{
  return self->_cellBand;
}

- (void)setCellBand:(unsigned int)a3
{
  self->_cellBand = a3;
}

- (double)downlinkLowFreq_Hz
{
  return self->_downlinkLowFreq_Hz;
}

- (void)setDownlinkLowFreq_Hz:(double)a3
{
  self->_downlinkLowFreq_Hz = a3;
}

- (double)downlinkHighFreq_Hz
{
  return self->_downlinkHighFreq_Hz;
}

- (void)setDownlinkHighFreq_Hz:(double)a3
{
  self->_downlinkHighFreq_Hz = a3;
}

- (double)uplinkLowFreq_Hz
{
  return self->_uplinkLowFreq_Hz;
}

- (void)setUplinkLowFreq_Hz:(double)a3
{
  self->_uplinkLowFreq_Hz = a3;
}

- (double)uplinkHighFreq_Hz
{
  return self->_uplinkHighFreq_Hz;
}

- (void)setUplinkHighFreq_Hz:(double)a3
{
  self->_uplinkHighFreq_Hz = a3;
}

- (int)issueType
{
  return self->_issueType;
}

- (void)setIssueType:(int)a3
{
  self->_issueType = a3;
}

- (int)Rc1IssueChannel
{
  return self->_Rc1IssueChannel;
}

- (void)setRc1IssueChannel:(int)a3
{
  self->_Rc1IssueChannel = a3;
}

- (unsigned)Rc1AntBitmap
{
  return self->_Rc1AntBitmap;
}

- (void)setRc1AntBitmap:(unsigned int)a3
{
  self->_Rc1AntBitmap = a3;
}

- (unsigned)Rc1PriorityBitmap
{
  return self->_Rc1PriorityBitmap;
}

- (void)setRc1PriorityBitmap:(unsigned int)a3
{
  self->_Rc1PriorityBitmap = a3;
}

- (unsigned)cellAgressorAntBitmap
{
  return self->_cellAgressorAntBitmap;
}

- (void)setCellAgressorAntBitmap:(unsigned int)a3
{
  self->_cellAgressorAntBitmap = a3;
}

- (int)cellTxPowerCap_16th_dBm
{
  return self->_cellTxPowerCap_16th_dBm;
}

- (void)setCellTxPowerCap_16th_dBm:(int)a3
{
  self->_cellTxPowerCap_16th_dBm = a3;
}

- (int)mitigationType
{
  return self->_mitigationType;
}

- (void)setMitigationType:(int)a3
{
  self->_mitigationType = a3;
}

- (NSMutableDictionary)cellTxPowerLimit
{
  return self->_cellTxPowerLimit;
}

- (void)setCellTxPowerLimit:(id)a3
{
  objc_storeStrong((id *)&self->_cellTxPowerLimit, a3);
}

- (NSMutableArray)CellAntBlockingList
{
  return self->_CellAntBlockingList;
}

- (void)setCellAntBlockingList:(id)a3
{
  objc_storeStrong((id *)&self->_CellAntBlockingList, a3);
}

- (int)nbChannelToAvoidStart
{
  return self->_nbChannelToAvoidStart;
}

- (void)setNbChannelToAvoidStart:(int)a3
{
  self->_nbChannelToAvoidStart = a3;
}

- (int)nbChannelToAvoidEnd
{
  return self->_nbChannelToAvoidEnd;
}

- (void)setNbChannelToAvoidEnd:(int)a3
{
  self->_nbChannelToAvoidEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CellAntBlockingList, 0);
  objc_storeStrong((id *)&self->_cellTxPowerLimit, 0);
}

@end
