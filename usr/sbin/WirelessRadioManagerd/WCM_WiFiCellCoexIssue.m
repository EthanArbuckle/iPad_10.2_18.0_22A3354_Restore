@implementation WCM_WiFiCellCoexIssue

- (WCM_WiFiCellCoexIssue)initWithCoexIssueConfig:(id *)a3
{
  WCM_WiFiCellCoexIssue *v4;
  WCM_WiFiCellCoexIssue *v5;
  int var1;
  NSMutableArray *v7;
  NSMutableArray *wifiChannelsToAvoidForCellOOB;
  uint64_t v9;
  NSArray *wifiChannelsToAvoidForOCL;
  const __CFString *v11;
  NSMutableArray *v12;
  uint64_t var53;
  NSArray *v14;
  NSMutableArray *v15;
  uint64_t var34;
  uint64_t var35;
  uint64_t var36;
  uint64_t var37;
  uint64_t var38;
  uint64_t var39;
  uint64_t v22;
  uint64_t var41;
  const $3841E53E32AF5D71027F40AB9267CA18 *v25;
  uint64_t var0;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)WCM_WiFiCellCoexIssue;
  v4 = -[WCM_WiFiCellCoexIssue init](&v28, "init");
  v5 = v4;
  if (!v4)
    return v5;
  var1 = a3->var1;
  v4->_issueType = var1;
  v4->_enableWifiChannelAvoidance = a3->var2;
  v4->_wifiUlAntennaBitmapOnCellLAT = a3->var3;
  v4->_wifiUlAntennaBitmapOnCellUAT = a3->var4;
  v4->_wifiDlAntennaBitmapOnCellLAT = a3->var5;
  v4->_wifiDlAntennaBitmapOnCellUAT = a3->var6;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap000 = a3->var7;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap001 = a3->var8;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap010 = a3->var9;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap011 = a3->var10;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap100 = a3->var11;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap101 = a3->var12;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap110 = a3->var13;
  v4->_wifiUlAntennaBitmapOnCellAntBitmap111 = a3->var14;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap000 = a3->var15;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap001 = a3->var16;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap010 = a3->var17;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap011 = a3->var18;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap100 = a3->var19;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap101 = a3->var20;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap110 = a3->var21;
  v4->_wifiDlAntennaBitmapOnCellAntBitmap111 = a3->var22;
  v4->_cellTxPowerLimit = a3->var23;
  v4->_cellFrequencyLimitForOOB = a3->var24;
  v4->_cellBandwidthLimitForOOB = a3->var25;
  v4->_btDiversityBlocklistTypeForC0B0 = a3->var30;
  v4->_btDiversityBlocklistTypeForC0B1 = a3->var31;
  v4->_btDiversityBlocklistTypeForC1B0 = a3->var32;
  v4->_btDiversityBlocklistTypeForC1B1 = a3->var33;
  v4->_watchAntType = a3->var42;
  v4->_wifiBtAgcCoexModeEnable = a3->var43;
  v4->_ulcaPriority = a3->var44;
  v4->_ulcaPriorityCCWiFi = a3->var45;
  v4->_ulcaPriorityCCBT = a3->var46;
  v4->_btAgcCoexModeEnable = a3->var47;
  v4->_cellAntBlkEnableIdx = a3->var48;
  v4->_isWifiEnhBand = a3->var51;
  v4->_HFBTAntBlkBandUnii1Enabled = a3->var54;
  v4->_HFBTAntBlkBandUnii3Enabled = a3->var55;
  v4->_HFBTAntBlkBandUnii5aEnabled = a3->var56;
  v4->_HFBTAntBlkBandUnii5bEnabled = a3->var57;
  v4->_HFBTAntBlkBandUnii5cEnabled = a3->var58;
  v4->_HFBTAntBlkBandUnii5dEnabled = a3->var59;
  if ((var1 & 0xFFFFFFFE) != 0xC)
    return v5;
  v7 = sub_10007D19C(a3->var51, a3->var26, a3->var27);
  if (v7)
  {
    v5->_wifiChannelsToAvoidForCellOOB = (NSArray *)-[NSMutableArray copy](v7, "copy");
  }
  else if (a3->var26 || a3->var27)
  {
    v25 = a3;
    v11 = CFSTR("pIssueConfig(%p) has invalid WiFi channel to avoid on OOB");
LABEL_46:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v11, v25, var0, v27);
    goto LABEL_47;
  }
  wifiChannelsToAvoidForCellOOB = sub_10007D19C(a3->var51, a3->var49, a3->var50);
  if (!wifiChannelsToAvoidForCellOOB)
  {
    v9 = a3->var50;
    if (!(a3->var49 | v9))
    {
      wifiChannelsToAvoidForOCL = v5->_wifiChannelsToAvoidForOCL;
      goto LABEL_13;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("initWithCoexIssueConfig pIssueConfig(%p) has invalid WiFi OCL channel [%d, %d] to avoid on OOB. Going back to use wifiChannelsToAvoidForCellOOB"), a3, a3->var49, v9);
    wifiChannelsToAvoidForCellOOB = (NSMutableArray *)v5->_wifiChannelsToAvoidForCellOOB;
  }
  wifiChannelsToAvoidForOCL = (NSArray *)-[NSMutableArray copy](wifiChannelsToAvoidForCellOOB, "copy");
  v5->_wifiChannelsToAvoidForOCL = wifiChannelsToAvoidForOCL;
LABEL_13:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("initWithCoexIssueConfig: _wifiChannelsToAvoidForOCL: %@"), wifiChannelsToAvoidForOCL);
  v12 = sub_10007D19C(a3->var51, a3->var52, a3->var53);
  if (!v12)
  {
    var53 = a3->var53;
    if (a3->var52 | var53)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("pIssueConfig(%p) has invalid WiFi PHS channel [%d, %d] to avoid on OOB. Going back to use wifiChannelsToAvoidForCellOOB"), a3, a3->var52, var53);
LABEL_47:

      return 0;
    }
    v12 = (NSMutableArray *)v5->_wifiChannelsToAvoidForCellOOB;
  }
  v14 = (NSArray *)-[NSMutableArray copy](v12, "copy");
  v5->_wifiChannelsToAvoidForPHS = v14;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("initWithCoexIssueConfig: _wifiChannelsToAvoidForPHS: %@"), v14);
  v15 = sub_10007D19C(a3->var51, a3->var28, a3->var29);
  if (v15)
  {
    v5->_wifiChannelsToDoAntennaSelectionForCellOOB = (NSArray *)-[NSMutableArray copy](v15, "copy");
    goto LABEL_18;
  }
  if (a3->var28 || a3->var29)
  {
    v25 = a3;
    var0 = a3->var0;
    v11 = CFSTR("pIssueConfig(%p) and pIssueConfig->_issueBand(%d) has invalid WiFi channel to do antenna selection on OOB");
    goto LABEL_46;
  }
LABEL_18:
  if (v5->_btDiversityBlocklistTypeForC0B0 != 3)
    goto LABEL_23;
  var34 = a3->var34;
  if (var34 > 0x4E
    || (var35 = a3->var35, var35 > 0x4E)
    || var34 > var35)
  {
    v25 = a3;
    v11 = CFSTR("pIssueConfig(%p) has invalid BT channel to avoid for C0B0");
    goto LABEL_46;
  }
  v5->_btChannelsToAvoidForC0B0 = (NSArray *)sub_10007C6B8(var34, var35);
LABEL_23:
  if (v5->_btDiversityBlocklistTypeForC0B1 != 3)
    goto LABEL_28;
  var36 = a3->var36;
  if (var36 > 0x4E
    || (var37 = a3->var37, var37 > 0x4E)
    || var36 > var37)
  {
    v25 = a3;
    v11 = CFSTR("pIssueConfig(%p) has invalid BT channel to avoid for C0B1");
    goto LABEL_46;
  }
  v5->_btChannelsToAvoidForC0B1 = (NSArray *)sub_10007C6B8(var36, var37);
LABEL_28:
  if (v5->_btDiversityBlocklistTypeForC1B0 != 3)
    goto LABEL_33;
  var38 = a3->var38;
  if (var38 > 0x4E
    || (var39 = a3->var39, var39 > 0x4E)
    || var38 > var39)
  {
    v25 = a3;
    v11 = CFSTR("pIssueConfig(%p) has invalid BT channel to avoid for C1B0");
    goto LABEL_46;
  }
  v5->_btChannelsToAvoidForC1B0 = (NSArray *)sub_10007C6B8(var38, var39);
LABEL_33:
  if (v5->_btDiversityBlocklistTypeForC1B1 == 3)
  {
    v22 = a3->var40;
    if (v22 <= 0x4E)
    {
      var41 = a3->var41;
      if (var41 <= 0x4E && v22 <= var41)
      {
        v5->_btChannelsToAvoidForC1B1 = (NSArray *)sub_10007C6B8(v22, var41);
        return v5;
      }
    }
    v25 = a3;
    v11 = CFSTR("pIssueConfig(%p) has invalid BT channel to avoid for C1B1");
    goto LABEL_46;
  }
  return v5;
}

- (void)dealloc
{
  NSArray *wifiChannelsToAvoidForOCL;
  NSArray *wifiChannelsToAvoidForPHS;
  objc_super v5;

  wifiChannelsToAvoidForOCL = self->_wifiChannelsToAvoidForOCL;
  if (wifiChannelsToAvoidForOCL)

  wifiChannelsToAvoidForPHS = self->_wifiChannelsToAvoidForPHS;
  if (wifiChannelsToAvoidForPHS)

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING")))self->_wifiChannelsToApplyCellAntBlocking;
  v5.receiver = self;
  v5.super_class = (Class)WCM_WiFiCellCoexIssue;
  -[WCM_WiFiCellCoexIssue dealloc](&v5, "dealloc");
}

- (int)btDiversityBlocklistTypeFor:(int)a3
{
  int result;

  switch(a3)
  {
    case 0:
      result = -[WCM_WiFiCellCoexIssue btDiversityBlocklistTypeForC0B0](self, "btDiversityBlocklistTypeForC0B0");
      break;
    case 1:
      result = -[WCM_WiFiCellCoexIssue btDiversityBlocklistTypeForC0B1](self, "btDiversityBlocklistTypeForC0B1");
      break;
    case 2:
      result = -[WCM_WiFiCellCoexIssue btDiversityBlocklistTypeForC1B0](self, "btDiversityBlocklistTypeForC1B0");
      break;
    case 3:
      result = -[WCM_WiFiCellCoexIssue btDiversityBlocklistTypeForC1B1](self, "btDiversityBlocklistTypeForC1B1");
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Invalid antennaCombinationCxBx(%d)"), *(_QWORD *)&a3);
      result = 0;
      break;
  }
  return result;
}

- (id)btChannelsToAvoidFor:(int)a3
{
  id result;

  switch(a3)
  {
    case 0:
      result = -[WCM_WiFiCellCoexIssue btChannelsToAvoidForC0B0](self, "btChannelsToAvoidForC0B0");
      break;
    case 1:
      result = -[WCM_WiFiCellCoexIssue btChannelsToAvoidForC0B1](self, "btChannelsToAvoidForC0B1");
      break;
    case 2:
      result = -[WCM_WiFiCellCoexIssue btChannelsToAvoidForC1B0](self, "btChannelsToAvoidForC1B0");
      break;
    case 3:
      result = -[WCM_WiFiCellCoexIssue btChannelsToAvoidForC1B1](self, "btChannelsToAvoidForC1B1");
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Invalid antennaCombinationCxBx(%d)"), *(_QWORD *)&a3);
      result = 0;
      break;
  }
  return result;
}

- (BOOL)needWiFiAntennaConstraintOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 gpsRadioActive:(BOOL)a8
{
  int8x8_t v10;
  uint64_t v11;
  BOOL v12;
  _BOOL4 v13;
  uint64_t v14;
  double v18;
  double v19;
  uint64_t issueType;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL result;
  double v31;
  double v32;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSArray *wifiChannelsToDoAntennaSelectionForCellOOB;
  double v40;
  double v41;

  v10 = vorr_s8(*(int8x8_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, (int8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, *(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, 8uLL));
  if (self->_wifiUlAntennaBitmapOnCellUAT | self->_wifiUlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellUAT)
  {
    v12 = 0;
  }
  else
  {
    v11 = *(_QWORD *)&v10 | HIDWORD(*(_QWORD *)&v10) | ((*(_QWORD *)&v10 | HIDWORD(*(_QWORD *)&v10)) >> 16);
    v12 = (v11 | BYTE1(v11)) == 0;
  }
  if (v12)
    return 0;
  v13 = a8;
  v14 = *(_QWORD *)&a7;
  v18 = sub_10007BF44(*(uint64_t *)&a7);
  issueType = self->_issueType;
  v21 = v18;
  v22 = v19;
  v23 = a6 - a5;
  v24 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      v25 = (v23 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v21)
        v26 = a5 * 3.0;
      else
        v26 = v21;
      v27 = a5 * 3.0 + v25;
      goto LABEL_28;
    case 1:
    case 7:
      v21 = a5;
      goto LABEL_17;
    case 2:
      if (!v13)
        return 0;
      v28 = 1573.374;
      v24 = 4.092;
      v29 = a5;
      return sub_10007AE04(0, v18, v19, v29, v23, v28, v24);
    case 3:
      v29 = a5;
      v28 = a3;
      return sub_10007AE04(0, v18, v19, v29, v23, v28, v24);
    case 4:
      v18 = a5;
      v19 = a6 - a5;
      v23 = v22;
LABEL_17:
      v31 = a3;
      return sub_10007AEAC(0, v18, v19, v21, v23, v31, v24);
    case 5:
      if (!v13)
        return 0;
      v31 = 1573.374;
      v24 = 4.092;
      v18 = a5;
      v19 = a6 - a5;
      v23 = v22;
      return sub_10007AEAC(0, v18, v19, v21, v23, v31, v24);
    case 6:
      if (!v13)
        return 0;
      v31 = 1573.374;
      v24 = 4.092;
      v21 = a5;
      return sub_10007AEAC(0, v18, v19, v21, v23, v31, v24);
    case 8:
      return sub_10007AF8C(0, a5, a6 - a5, v18, v19, a3, v24);
    case 9:
      v32 = v23 + a5 + v23 + a5 - (a5 + a5);
      if (a5 + a5 >= v18)
        v26 = a5 + a5;
      else
        v26 = v18;
      v27 = a5 + a5 + v32;
LABEL_28:
      if (v27 >= v21 + v22)
        v27 = v21 + v22;
      return v26 < v27;
    case 10:
      v34 = v18 * 0.5;
      v35 = (v18 + v22) * 0.5;
      goto LABEL_33;
    case 11:
      v34 = v18 / 3.0;
      v35 = (v18 + v22) / 3.0;
LABEL_33:
      v36 = v35 - v34;
      if (v34 >= a3)
        v37 = v34;
      else
        v37 = a3;
      v38 = v34 + v36;
      goto LABEL_49;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5)
        return 0;
      goto LABEL_40;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6)
        return 0;
LABEL_40:
      result = 0;
      if (!(_DWORD)v14 || v23 <= self->_cellBandwidthLimitForOOB)
        return result;
      wifiChannelsToDoAntennaSelectionForCellOOB = self->_wifiChannelsToDoAntennaSelectionForCellOOB;
      if (!wifiChannelsToDoAntennaSelectionForCellOOB)
        return 0;
      result = -[NSArray containsObject:](wifiChannelsToDoAntennaSelectionForCellOOB, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
      break;
    case 14:
      v40 = v18 + v18;
      v41 = v21 + v19 + v21 + v19 - (v21 + v21);
      if (v21 + v21 >= a3)
        v37 = v21 + v21;
      else
        v37 = a3;
      v38 = v40 + v41;
LABEL_49:
      if (v38 >= v24 + a3)
        v38 = v24 + a3;
      return v37 < v38;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      return 0;
  }
  return result;
}

- (BOOL)needWiFiAntennaConstraintWiFiEnhOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 wifiCenterFreq:(unsigned int)a8 wifiBandwidth:(unsigned int)a9 gpsRadioActive:(BOOL)a10
{
  _BOOL4 v10;
  uint64_t v13;
  int8x8_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t issueType;
  double v23;
  double v24;
  double v25;
  unsigned int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL result;
  double v38;
  double v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  NSArray *wifiChannelsToDoAntennaSelectionForCellOOB;
  double v47;
  double v48;

  v10 = a10;
  v13 = *(_QWORD *)&a7;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFiEnh_: AntSel Constraint Check: cellular downlink(%lf ~ %lf), cellular uplink(%lf ~ %lf), wifiChannel(%d), wifiBandwidth(%d), wifiCenterFreq(%d), gpsRadioActive(%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a9, *(_QWORD *)&a8, a10);
  v19 = vorr_s8(*(int8x8_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, (int8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, *(int8x16_t *)&self->_wifiUlAntennaBitmapOnCellAntBitmap000, 8uLL));
  if (self->_wifiUlAntennaBitmapOnCellUAT | self->_wifiUlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellLAT | self->_wifiDlAntennaBitmapOnCellUAT)
  {
    v21 = 0;
  }
  else
  {
    v20 = *(_QWORD *)&v19 | HIDWORD(*(_QWORD *)&v19) | ((*(_QWORD *)&v19 | HIDWORD(*(_QWORD *)&v19)) >> 16);
    v21 = (v20 | BYTE1(v20)) == 0;
  }
  if (v21)
    return 0;
  issueType = self->_issueType;
  v23 = a6 - a5;
  v24 = a4 - a3;
  v25 = (double)(a8 - (a9 >> 1));
  v26 = a8 + (a9 >> 1);
  v27 = (double)v26 - v25;
  switch((int)issueType)
  {
    case 0:
      v30 = (v23 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v25)
        v31 = a5 * 3.0;
      else
        v31 = (double)(a8 - (a9 >> 1));
      v32 = a5 * 3.0 + v30;
      goto LABEL_28;
    case 1:
    case 7:
      v28 = (double)(a8 - (a9 >> 1));
      v29 = (double)v26 - v25;
      v25 = a5;
      goto LABEL_17;
    case 2:
      if (!v10)
        return 0;
      v33 = 1573.374;
      v24 = 4.092;
      v34 = (double)(a8 - (a9 >> 1));
      v35 = (double)v26 - v25;
      v36 = a5;
      return sub_10007AE04(0, v34, v35, v36, v23, v33, v24);
    case 3:
      v34 = (double)(a8 - (a9 >> 1));
      v35 = (double)v26 - v25;
      v36 = a5;
      v33 = a3;
      return sub_10007AE04(0, v34, v35, v36, v23, v33, v24);
    case 4:
      v28 = a5;
      v29 = a6 - a5;
      v23 = (double)v26 - v25;
LABEL_17:
      v38 = a3;
      return sub_10007AEAC(0, v28, v29, v25, v23, v38, v24);
    case 5:
      if (!v10)
        return 0;
      v38 = 1573.374;
      v24 = 4.092;
      v28 = a5;
      v29 = a6 - a5;
      v23 = (double)v26 - v25;
      return sub_10007AEAC(0, v28, v29, v25, v23, v38, v24);
    case 6:
      if (!v10)
        return 0;
      v38 = 1573.374;
      v24 = 4.092;
      v28 = (double)(a8 - (a9 >> 1));
      v29 = (double)v26 - v25;
      v25 = a5;
      return sub_10007AEAC(0, v28, v29, v25, v23, v38, v24);
    case 8:
      return sub_10007AF8C(0, a5, a6 - a5, v25, (double)v26 - v25, a3, v24);
    case 9:
      v39 = v23 + a5 + v23 + a5 - (a5 + a5);
      if (a5 + a5 >= v25)
        v31 = a5 + a5;
      else
        v31 = (double)(a8 - (a9 >> 1));
      v32 = a5 + a5 + v39;
LABEL_28:
      if (v32 >= v27 + v25)
        v32 = v27 + v25;
      return v31 < v32;
    case 10:
      v41 = v25 * 0.5;
      v42 = (v27 + v25) * 0.5;
      goto LABEL_33;
    case 11:
      v41 = v25 / 3.0;
      v42 = (v27 + v25) / 3.0;
LABEL_33:
      v43 = v42 - v41;
      if (v41 >= a3)
        v44 = v41;
      else
        v44 = a3;
      v45 = v41 + v43;
      goto LABEL_49;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5)
        return 0;
      goto LABEL_40;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6)
        return 0;
LABEL_40:
      result = 0;
      if (!(_DWORD)v13 || v23 <= self->_cellBandwidthLimitForOOB)
        return result;
      wifiChannelsToDoAntennaSelectionForCellOOB = self->_wifiChannelsToDoAntennaSelectionForCellOOB;
      if (!wifiChannelsToDoAntennaSelectionForCellOOB)
        return 0;
      result = -[NSArray containsObject:](wifiChannelsToDoAntennaSelectionForCellOOB, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
      break;
    case 14:
      v47 = v25 + v25;
      v48 = v27 + v25 + v27 + v25 - (v25 + v25);
      if (v25 + v25 >= a3)
        v44 = v25 + v25;
      else
        v44 = a3;
      v45 = v47 + v48;
LABEL_49:
      if (v45 >= v24 + a3)
        v45 = v24 + a3;
      return v44 < v45;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiEnh_: Antenna Selection Constraint: WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      return 0;
  }
  return result;
}

- (BOOL)needCellTxPowerConstraintOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 gpsRadioActive:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v9;
  double v15;
  double v16;
  uint64_t issueType;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL result;
  double v28;
  double v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSArray *wifiChannelsToAvoidForCellOOB;
  double v37;
  double v38;

  if (!self->_cellTxPowerLimit)
    return 0;
  v8 = a8;
  v9 = *(_QWORD *)&a7;
  v15 = sub_10007BF44(*(uint64_t *)&a7);
  issueType = self->_issueType;
  v18 = v15;
  v19 = v16;
  v20 = a6 - a5;
  v21 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      v22 = (v20 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v18)
        v23 = a5 * 3.0;
      else
        v23 = v18;
      v24 = a5 * 3.0 + v22;
      goto LABEL_25;
    case 1:
    case 7:
      v18 = a5;
      goto LABEL_14;
    case 2:
      if (!v8)
        return 0;
      v25 = 1573.374;
      v21 = 4.092;
      v26 = a5;
      return sub_10007AE04(0, v15, v16, v26, v20, v25, v21);
    case 3:
      v26 = a5;
      v25 = a3;
      return sub_10007AE04(0, v15, v16, v26, v20, v25, v21);
    case 4:
      v15 = a5;
      v16 = a6 - a5;
      v20 = v19;
LABEL_14:
      v28 = a3;
      return sub_10007AEAC(0, v15, v16, v18, v20, v28, v21);
    case 5:
      if (!v8)
        return 0;
      v28 = 1573.374;
      v21 = 4.092;
      v15 = a5;
      v16 = a6 - a5;
      v20 = v19;
      return sub_10007AEAC(0, v15, v16, v18, v20, v28, v21);
    case 6:
      if (!v8)
        return 0;
      v28 = 1573.374;
      v21 = 4.092;
      v18 = a5;
      return sub_10007AEAC(0, v15, v16, v18, v20, v28, v21);
    case 8:
      return sub_10007AF8C(0, a5, a6 - a5, v15, v16, a3, v21);
    case 9:
      v29 = v20 + a5 + v20 + a5 - (a5 + a5);
      if (a5 + a5 >= v15)
        v23 = a5 + a5;
      else
        v23 = v15;
      v24 = a5 + a5 + v29;
LABEL_25:
      if (v24 >= v18 + v19)
        v24 = v18 + v19;
      return v23 < v24;
    case 10:
      v31 = v15 * 0.5;
      v32 = (v15 + v19) * 0.5;
      goto LABEL_30;
    case 11:
      v31 = v15 / 3.0;
      v32 = (v15 + v19) / 3.0;
LABEL_30:
      v33 = v32 - v31;
      if (v31 >= a3)
        v34 = v31;
      else
        v34 = a3;
      v35 = v31 + v33;
      goto LABEL_46;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5)
        return 0;
      goto LABEL_37;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6)
        return 0;
LABEL_37:
      result = 0;
      if (!(_DWORD)v9 || v20 <= self->_cellBandwidthLimitForOOB)
        return result;
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      if (!wifiChannelsToAvoidForCellOOB)
        return 0;
      result = -[NSArray containsObject:](wifiChannelsToAvoidForCellOOB, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      break;
    case 14:
      v37 = v15 + v15;
      v38 = v18 + v16 + v18 + v16 - (v18 + v18);
      if (v18 + v18 >= a3)
        v34 = v18 + v18;
      else
        v34 = a3;
      v35 = v37 + v38;
LABEL_46:
      if (v35 >= v21 + a3)
        v35 = v21 + a3;
      return v34 < v35;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      return 0;
  }
  return result;
}

- (BOOL)needCellTxPowerConstraintWiFiEnhOnCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(int)a7 wifiCenterFreq:(unsigned int)a8 wifiBandwidth:(unsigned int)a9 gpsRadioActive:(BOOL)a10
{
  _BOOL4 v10;
  uint64_t v13;
  uint64_t issueType;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL result;
  double v35;
  double v36;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  NSArray *wifiChannelsToAvoidForCellOOB;
  double v44;
  double v45;

  v10 = a10;
  v13 = *(_QWORD *)&a7;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFiEnh_: Cellular Tx Power Limiting Constraint Check: cellular downlink(%lf ~ %lf), cellular uplink(%lf ~ %lf), wifiChannel(%d), wifiBandwidth(%d), wifiCenterFreq(%d), gpsRadioActive(%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a9, *(_QWORD *)&a8, a10);
  if (!self->_cellTxPowerLimit)
    return 0;
  issueType = self->_issueType;
  v20 = a6 - a5;
  v21 = a4 - a3;
  v22 = (double)(a8 - (a9 >> 1));
  v23 = a8 + (a9 >> 1);
  v24 = (double)v23 - v22;
  switch((int)issueType)
  {
    case 0:
      v27 = (v20 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v22)
        v28 = a5 * 3.0;
      else
        v28 = (double)(a8 - (a9 >> 1));
      v29 = a5 * 3.0 + v27;
      goto LABEL_25;
    case 1:
    case 7:
      v25 = (double)(a8 - (a9 >> 1));
      v26 = (double)v23 - v22;
      v22 = a5;
      goto LABEL_14;
    case 2:
      if (!v10)
        return 0;
      v30 = 1573.374;
      v21 = 4.092;
      v31 = (double)(a8 - (a9 >> 1));
      v32 = (double)v23 - v22;
      v33 = a5;
      return sub_10007AE04(0, v31, v32, v33, v20, v30, v21);
    case 3:
      v31 = (double)(a8 - (a9 >> 1));
      v32 = (double)v23 - v22;
      v33 = a5;
      v30 = a3;
      return sub_10007AE04(0, v31, v32, v33, v20, v30, v21);
    case 4:
      v25 = a5;
      v26 = a6 - a5;
      v20 = (double)v23 - v22;
LABEL_14:
      v35 = a3;
      return sub_10007AEAC(0, v25, v26, v22, v20, v35, v21);
    case 5:
      if (!v10)
        return 0;
      v35 = 1573.374;
      v21 = 4.092;
      v25 = a5;
      v26 = a6 - a5;
      v20 = (double)v23 - v22;
      return sub_10007AEAC(0, v25, v26, v22, v20, v35, v21);
    case 6:
      if (!v10)
        return 0;
      v35 = 1573.374;
      v21 = 4.092;
      v25 = (double)(a8 - (a9 >> 1));
      v26 = (double)v23 - v22;
      v22 = a5;
      return sub_10007AEAC(0, v25, v26, v22, v20, v35, v21);
    case 8:
      return sub_10007AF8C(0, a5, a6 - a5, v22, (double)v23 - v22, a3, v21);
    case 9:
      v36 = v20 + a5 + v20 + a5 - (a5 + a5);
      if (a5 + a5 >= v22)
        v28 = a5 + a5;
      else
        v28 = (double)(a8 - (a9 >> 1));
      v29 = a5 + a5 + v36;
LABEL_25:
      if (v29 >= v24 + v22)
        v29 = v24 + v22;
      return v28 < v29;
    case 10:
      v38 = v22 * 0.5;
      v39 = (v24 + v22) * 0.5;
      goto LABEL_30;
    case 11:
      v38 = v22 / 3.0;
      v39 = (v24 + v22) / 3.0;
LABEL_30:
      v40 = v39 - v38;
      if (v38 >= a3)
        v41 = v38;
      else
        v41 = a3;
      v42 = v38 + v40;
      goto LABEL_46;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5)
        return 0;
      goto LABEL_37;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6)
        return 0;
LABEL_37:
      result = 0;
      if (!(_DWORD)v13 || v20 <= self->_cellBandwidthLimitForOOB)
        return result;
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      if (!wifiChannelsToAvoidForCellOOB)
        return 0;
      result = -[NSArray containsObject:](wifiChannelsToAvoidForCellOOB, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
      break;
    case 14:
      v44 = v22 + v22;
      v45 = v24 + v22 + v24 + v22 - (v22 + v22);
      if (v22 + v22 >= a3)
        v41 = v22 + v22;
      else
        v41 = a3;
      v42 = v44 + v45;
LABEL_46:
      if (v42 >= v21 + a3)
        v42 = v21 + a3;
      return v41 < v42;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiEnh_: Power Limiting Constraint: WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      return 0;
  }
  return result;
}

- (id)wifiChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 wifi5G:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v11;
  uint64_t issueType;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 enableWifiChannelAvoidance;
  uint64_t v18;
  const char *v20;
  double v21;
  double v22;
  uint64_t v23;

  v5 = a5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_ wifiChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d"), -[WCM_WiFiCellCoexIssue issueType](self, "issueType"));
  if (-[WCM_WiFiCellCoexIssue issueType](self, "issueType")
    && -[WCM_WiFiCellCoexIssue issueType](self, "issueType") != 9
    && (-[WCM_WiFiCellCoexIssue issueType](self, "issueType") & 0xFFFFFFFE) != 0xC)
  {
    v18 = 0;
    enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_25;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    enableWifiChannelAvoidance = 0;
    v18 = 1;
LABEL_25:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array."), v18, enableWifiChannelAvoidance);
    return &__NSArray0__struct;
  }
  v9 = a4 - a3;
  v10 = 80.0;
  if (v5)
    v10 = 675.0;
  v11 = 2402.0;
  if (v5)
    v11 = 5160.0;
  issueType = self->_issueType;
  if ((int)issueType <= 11)
  {
    if (!(_DWORD)issueType)
    {
      v13 = a3 * 3.0;
      v14 = (v9 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= v11)
        v21 = a3 * 3.0;
      else
        v21 = v11;
      v22 = v11 + v10;
      if (v13 + v14 < v22)
        v22 = v13 + v14;
      if (v21 < v22)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 * 3.0, v13 + v14);
        return sub_10007BFFC(0, v13, v14);
      }
      return &__NSArray0__struct;
    }
    if ((_DWORD)issueType == 9)
    {
      v13 = a3 + a3;
      v14 = v9 + a3 + v9 + a3 - (a3 + a3);
      if (a3 + a3 >= v11)
        v15 = a3 + a3;
      else
        v15 = v11;
      v16 = v11 + v10;
      if (v13 + v14 < v16)
        v16 = v13 + v14;
      if (v15 < v16)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 + a3, v13 + v14);
        return sub_10007BFFC(0, v13, v14);
      }
      return &__NSArray0__struct;
    }
LABEL_27:
    if (issueType <= 0xE)
      v20 = off_100203990[issueType];
    else
      v20 = "<ISSUE_TYPE_INVALID>";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s is not considered for WiFi channels to enable WCI2"), v20, v23);
    return &__NSArray0__struct;
  }
  if ((_DWORD)issueType == 12)
  {
    if (self->_cellFrequencyLimitForOOB <= a3)
      return &__NSArray0__struct;
  }
  else
  {
    if ((_DWORD)issueType != 13)
      goto LABEL_27;
    if (self->_cellFrequencyLimitForOOB >= a4)
      return &__NSArray0__struct;
  }
  if (v9 <= self->_cellBandwidthLimitForOOB)
    return &__NSArray0__struct;
  return self->_wifiChannelsToAvoidForCellOOB;
}

- (id)wiFiEnhChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  double v7;
  uint64_t issueType;
  double v9;
  double v10;
  double v11;
  _BOOL8 enableWifiChannelAvoidance;
  uint64_t v13;
  const char *v15;
  double v16;
  uint64_t v17;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_ wiFiEnhChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d"), -[WCM_WiFiCellCoexIssue issueType](self, "issueType"));
  if (-[WCM_WiFiCellCoexIssue issueType](self, "issueType")
    && -[WCM_WiFiCellCoexIssue issueType](self, "issueType") != 9
    && (-[WCM_WiFiCellCoexIssue issueType](self, "issueType") & 0xFFFFFFFE) != 0xC)
  {
    v13 = 0;
    enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_19;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    enableWifiChannelAvoidance = 0;
    v13 = 1;
LABEL_19:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array."), v13, enableWifiChannelAvoidance);
    return &__NSArray0__struct;
  }
  v7 = a4 - a3;
  issueType = self->_issueType;
  if ((int)issueType <= 11)
  {
    if (!(_DWORD)issueType)
    {
      v9 = a3 * 3.0;
      v10 = (v7 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= 5945.0)
        v16 = a3 * 3.0;
      else
        v16 = 5945.0;
      if (v16 < fmin(v9 + v10, 7125.0))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_: 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 * 3.0, v9 + v10);
        return sub_10007C1AC(v9, v10);
      }
      return &__NSArray0__struct;
    }
    if ((_DWORD)issueType == 9)
    {
      v9 = a3 + a3;
      v10 = v7 + a3 + v7 + a3 - (a3 + a3);
      if (a3 + a3 >= 5945.0)
        v11 = a3 + a3;
      else
        v11 = 5945.0;
      if (v11 < fmin(v9 + v10, 7125.0))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_: 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 + a3, v9 + v10);
        return sub_10007C1AC(v9, v10);
      }
      return &__NSArray0__struct;
    }
LABEL_21:
    if (issueType <= 0xE)
      v15 = off_100203990[issueType];
    else
      v15 = "<ISSUE_TYPE_INVALID>";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiEnhBitmap_: %s is not considered for WiFi channels to enable WCI2"), v15, v17);
    return &__NSArray0__struct;
  }
  if ((_DWORD)issueType == 12)
  {
    if (self->_cellFrequencyLimitForOOB <= a3)
      return &__NSArray0__struct;
  }
  else
  {
    if ((_DWORD)issueType != 13)
      goto LABEL_21;
    if (self->_cellFrequencyLimitForOOB >= a4)
      return &__NSArray0__struct;
  }
  if (v7 <= self->_cellBandwidthLimitForOOB)
    return &__NSArray0__struct;
  return self->_wifiChannelsToAvoidForCellOOB;
}

- (id)wifiOclChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 isWifi5G:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v11;
  uint64_t issueType;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 enableWifiChannelAvoidance;
  uint64_t v18;
  const char *v20;
  double v21;
  double v22;
  uint64_t v23;

  v5 = a5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_ wifiOclChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d"), -[WCM_WiFiCellCoexIssue issueType](self, "issueType"));
  if (-[WCM_WiFiCellCoexIssue issueType](self, "issueType")
    && -[WCM_WiFiCellCoexIssue issueType](self, "issueType") != 9
    && (-[WCM_WiFiCellCoexIssue issueType](self, "issueType") & 0xFFFFFFFE) != 0xC)
  {
    v18 = 0;
    enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_25;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    enableWifiChannelAvoidance = 0;
    v18 = 1;
LABEL_25:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array."), v18, enableWifiChannelAvoidance);
    return &__NSArray0__struct;
  }
  v9 = a4 - a3;
  v10 = 80.0;
  if (v5)
    v10 = 675.0;
  v11 = 2402.0;
  if (v5)
    v11 = 5160.0;
  issueType = self->_issueType;
  if ((int)issueType <= 11)
  {
    if (!(_DWORD)issueType)
    {
      v13 = a3 * 3.0;
      v14 = (v9 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= v11)
        v21 = a3 * 3.0;
      else
        v21 = v11;
      v22 = v11 + v10;
      if (v13 + v14 < v22)
        v22 = v13 + v14;
      if (v21 < v22)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 * 3.0, v13 + v14);
        return sub_10007BFFC(0, v13, v14);
      }
      return &__NSArray0__struct;
    }
    if ((_DWORD)issueType == 9)
    {
      v13 = a3 + a3;
      v14 = v9 + a3 + v9 + a3 - (a3 + a3);
      if (a3 + a3 >= v11)
        v15 = a3 + a3;
      else
        v15 = v11;
      v16 = v11 + v10;
      if (v13 + v14 < v16)
        v16 = v13 + v14;
      if (v15 < v16)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 + a3, v13 + v14);
        return sub_10007BFFC(0, v13, v14);
      }
      return &__NSArray0__struct;
    }
LABEL_27:
    if (issueType <= 0xE)
      v20 = off_100203990[issueType];
    else
      v20 = "<ISSUE_TYPE_INVALID>";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s is not considered for WiFi channels to enable WCI2"), v20, v23);
    return &__NSArray0__struct;
  }
  if ((_DWORD)issueType == 12)
  {
    if (self->_cellFrequencyLimitForOOB <= a3)
      return &__NSArray0__struct;
  }
  else
  {
    if ((_DWORD)issueType != 13)
      goto LABEL_27;
    if (self->_cellFrequencyLimitForOOB >= a4)
      return &__NSArray0__struct;
  }
  if (v9 <= self->_cellBandwidthLimitForOOB)
    return &__NSArray0__struct;
  return self->_wifiChannelsToAvoidForOCL;
}

- (id)wiFiEnhOclChannelsAffectedByCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  double v7;
  uint64_t issueType;
  double v9;
  double v10;
  double v11;
  _BOOL8 enableWifiChannelAvoidance;
  uint64_t v13;
  const char *v15;
  double v16;
  uint64_t v17;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_ wiFiEnhChannelsAffectedByCellUlLowFreq gets called and self.issueType is %d"), -[WCM_WiFiCellCoexIssue issueType](self, "issueType"));
  if (-[WCM_WiFiCellCoexIssue issueType](self, "issueType")
    && -[WCM_WiFiCellCoexIssue issueType](self, "issueType") != 9
    && (-[WCM_WiFiCellCoexIssue issueType](self, "issueType") & 0xFFFFFFFE) != 0xC)
  {
    v13 = 0;
    enableWifiChannelAvoidance = self->_enableWifiChannelAvoidance;
    goto LABEL_19;
  }
  if (!self->_enableWifiChannelAvoidance)
  {
    enableWifiChannelAvoidance = 0;
    v13 = 1;
LABEL_19:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_ isWiFiVictimIssue is %d, _enableWifiChannelAvoidance is %d, Thus return empty array."), v13, enableWifiChannelAvoidance);
    return &__NSArray0__struct;
  }
  v7 = a4 - a3;
  issueType = self->_issueType;
  if ((int)issueType <= 11)
  {
    if (!(_DWORD)issueType)
    {
      v9 = a3 * 3.0;
      v10 = (v7 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= 5945.0)
        v16 = a3 * 3.0;
      else
        v16 = 5945.0;
      if (v16 < fmin(v9 + v10, 7125.0))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_: 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 * 3.0, v9 + v10);
        return sub_10007C1AC(v9, v10);
      }
      return &__NSArray0__struct;
    }
    if ((_DWORD)issueType == 9)
    {
      v9 = a3 + a3;
      v10 = v7 + a3 + v7 + a3 - (a3 + a3);
      if (a3 + a3 >= 5945.0)
        v11 = a3 + a3;
      else
        v11 = 5945.0;
      if (v11 < fmin(v9 + v10, 7125.0))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnhBitmap_: 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 + a3, v9 + v10);
        return sub_10007C1AC(v9, v10);
      }
      return &__NSArray0__struct;
    }
LABEL_21:
    if (issueType <= 0xE)
      v15 = off_100203990[issueType];
    else
      v15 = "<ISSUE_TYPE_INVALID>";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiEnhBitmap_: %s is not considered for WiFi channels to enable WCI2"), v15, v17);
    return &__NSArray0__struct;
  }
  if ((_DWORD)issueType == 12)
  {
    if (self->_cellFrequencyLimitForOOB <= a3)
      return &__NSArray0__struct;
  }
  else
  {
    if ((_DWORD)issueType != 13)
      goto LABEL_21;
    if (self->_cellFrequencyLimitForOOB >= a4)
      return &__NSArray0__struct;
  }
  if (v7 <= self->_cellBandwidthLimitForOOB)
    return &__NSArray0__struct;
  return self->_wifiChannelsToAvoidForOCL;
}

- (id)wifi5GHzChannelsAffectedByNR79UlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  if ((-[WCM_WiFiCellCoexIssue issueType](self, "issueType") & 0xFFFFFFFE) == 0xC
    && self->_enableWifiChannelAvoidance
    && self->_issueType == 13
    && self->_cellFrequencyLimitForOOB < a4
    && a4 - a3 > self->_cellBandwidthLimitForOOB)
  {
    return self->_wifiChannelsToAvoidForCellOOB;
  }
  else
  {
    return &__NSArray0__struct;
  }
}

- (id)wifiChannelsIMD3ByCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7
{
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  uint64_t i;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  int j;
  double v27;
  double v28;

  v12 = a6 - a5;
  v13 = a4 - a3;
  if (a7)
    v14 = 5160.0;
  else
    v14 = 2402.0;
  if (a7)
    v15 = 675.0;
  else
    v15 = 80.0;
  v16 = +[NSMutableArray array](NSMutableArray, "array");
  if (sub_10007AEAC(0, a5, v12, v14, v15, a3, v13))
  {
    v17 = -(a4 - a5 * 2.0);
    v18 = -(a3 - a6 * 2.0) - v17 - (a4 - a5 * 2.0);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: 2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v17, *(_QWORD *)&v18, *(_QWORD *)&a3, *(_QWORD *)&a4);
    if (a7)
    {
      for (i = 0; i != 138; i += 3)
      {
        v20 = word_1001DD968[i + 1];
        v21 = (double)word_1001DD968[i + 2];
        v22 = (double)v20 + v21 * -0.5;
        if (v22 >= v17)
          v23 = (double)v20 + v21 * -0.5;
        else
          v23 = -(a4 - a5 * 2.0);
        v24 = v22 + v21;
        if (v24 >= v18)
          v24 = -(a3 - a6 * 2.0) - v17 - (a4 - a5 * 2.0);
        if (v23 < v24)
          objc_msgSend(v16, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", word_1001DD968[i]));
      }
    }
    else
    {
      v25 = 1;
      for (j = 2402; j != 2467; j += 5)
      {
        if (v17 <= (double)j)
          v27 = (double)j;
        else
          v27 = -(a4 - a5 * 2.0);
        v28 = (double)j + 20.0;
        if (v28 >= v18)
          v28 = -(a3 - a6 * 2.0) - v17 - (a4 - a5 * 2.0);
        if (v27 < v28)
          objc_msgSend(v16, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25));
        v25 = (v25 + 1);
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: No IMD3 issue detected after calculation. Returning empty channel array."));
    return &__NSArray0__struct;
  }
  return v16;
}

- (id)getAllBtChannelsInBandForBtHighFreq:(double)a3 btLowFreq:(double)a4
{
  unsigned int v4;
  NSMutableArray *v5;
  uint64_t v6;

  if (a3 > 5250.0 || a4 < 5150.0)
  {
    if (a3 > 5850.0 || a4 < 5725.0)
    {
      if ((a3 > 6050.0 || a4 < 5925.0) && (a3 > 6175.0 || a4 < 6051.0) && (a3 > 6300.0 || a4 < 6176.0))
      {
        if (a3 > 6425.0 || (a3 = 6301.0, a4 < 6301.0))
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Unknown BT band range"), a3, a4);
          objc_exception_throw(NSInternalInconsistencyException);
        }
      }
      v4 = 125;
    }
    else
    {
      v4 = 126;
    }
  }
  else
  {
    v4 = 101;
  }
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v4);
  v6 = 0;
  do
  {
    -[NSMutableArray addObject:](v5, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v6 = (v6 + 1);
  }
  while (v4 != (_DWORD)v6);
  return v5;
}

- (id)HFBTChannelsToAvoidForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 cellDlLowFreq:(double)a5 cellDlHighFreq:(double)a6 btBandLowFreq:(double)a7 btBandHighFreq:(double)a8 gpsRadioActive:(BOOL)a9
{
  uint64_t issueType;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id result;
  uint64_t v41;
  uint64_t v42;

  issueType = self->_issueType;
  v17 = a4 - a3;
  v18 = a6 - a5;
  v19 = a7 + -0.5;
  v20 = a8 + 0.5 - (a7 + -0.5);
  switch((int)issueType)
  {
    case 0:
      v21 = a3 * 3.0;
      v22 = (v17 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= v19)
        v23 = a3 * 3.0;
      else
        v23 = a7 + -0.5;
      v24 = v19 + v20;
      if (v21 + v22 < v24)
        v24 = v21 + v22;
      if (v23 >= v24)
        goto LABEL_71;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = BTRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 * 3.0, v21 + v22, v41, v42);
      goto LABEL_56;
    case 1:
      if (!sub_10007AEAC(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, a5, v18))
        goto LABEL_71;
      v26 = (a3 + a5) * 0.5;
      v27 = (a4 + a6) * 0.5 - v26;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v26, v26 + v27, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
      goto LABEL_59;
    case 2:
      if (!a9 || !sub_10007AE04(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, 1573.374, 4.092))
        goto LABEL_71;
      v21 = a3 + 1573.374;
      v22 = a4 + 1577.466 - (a3 + 1573.374);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), a3 + 1573.374, a3 + 1573.374 + v22, *(_QWORD *)&a3, *(_QWORD *)&a4, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_56;
    case 3:
      if (!sub_10007AE04(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, a5, v18))
        goto LABEL_71;
      v26 = a3 + a5;
      v27 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), a3 + a5, a3 + a5 + v27, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
      goto LABEL_59;
    case 4:
      if (!sub_10007AEAC(0, a3, v17, v19, v20, a5, v18))
        goto LABEL_71;
      v26 = -(a6 - a3 * 2.0);
      v27 = -(a5 - a4 * 2.0) - v26;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&v26, v27 - (a6 - a3 * 2.0), *(_QWORD *)&a5, *(_QWORD *)&a6);
      goto LABEL_59;
    case 5:
      if (!a9 || !sub_10007AEAC(0, a3, v17, v19, v20, 1573.374, 4.092))
        goto LABEL_71;
      v21 = a3 * 2.0 + -1577.466;
      v22 = a4 * 2.0 + -1573.374 - v21;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&v21, v21 + v22, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_56;
    case 6:
      if (!a9 || !sub_10007AEAC(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, 1573.374, 4.092))
        goto LABEL_71;
      v21 = a3 * 2.0 + 1573.374;
      v22 = a4 * 2.0 + 1577.466 - v21;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&v21, v21 + v22, *(_QWORD *)&a3, *(_QWORD *)&a4, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_56;
    case 7:
      if (!sub_10007AEAC(0, a7 + -0.5, a8 + 0.5 - (a7 + -0.5), a3, v17, a5, v18))
        goto LABEL_71;
      v26 = a5 + a3 * 2.0;
      v27 = a6 + a4 * 2.0 - v26;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v26, v26 + v27, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
      goto LABEL_59;
    case 8:
      if (!sub_10007AF8C(0, a3, v17, v19, v20, a5, v18))
        goto LABEL_71;
      v26 = -(a6 - a3 * 4.0);
      v27 = -(a5 - a4 * 4.0) - v26;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("4 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&v26, v27 - (a6 - a3 * 4.0), *(_QWORD *)&a5, *(_QWORD *)&a6);
LABEL_59:
      v36 = v26;
      v37 = v27;
      goto LABEL_68;
    case 9:
      v21 = a3 + a3;
      v22 = v17 + a3 + v17 + a3 - (a3 + a3);
      if (a3 + a3 >= v19)
        v28 = a3 + a3;
      else
        v28 = a7 + -0.5;
      v29 = v19 + v20;
      if (v21 + v22 < v29)
        v29 = v21 + v22;
      if (v28 >= v29)
        goto LABEL_71;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = BTRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 + a3, v21 + v22, v41, v42);
LABEL_56:
      v36 = v21;
      v37 = v22;
      goto LABEL_68;
    case 10:
      v30 = v19 * 0.5;
      v31 = (v19 + v20) * 0.5 - v19 * 0.5;
      if (v19 * 0.5 >= a5)
        v38 = v19 * 0.5;
      else
        v38 = a5;
      v39 = v18 + a5;
      if (v30 + v31 < v18 + a5)
        v39 = v30 + v31;
      if (v38 >= v39)
        goto LABEL_71;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) / 2 = CellRx(%lf~%lf)"), *(_QWORD *)&v30, v30 + v31, *(_QWORD *)&a5, *(_QWORD *)&a6);
      goto LABEL_67;
    case 11:
      v30 = v19 / 3.0;
      v31 = (v19 + v20) / 3.0 - v19 / 3.0;
      if (v19 / 3.0 >= a5)
        v32 = v19 / 3.0;
      else
        v32 = a5;
      v33 = v18 + a5;
      if (v30 + v31 < v18 + a5)
        v33 = v30 + v31;
      if (v32 >= v33)
        goto LABEL_71;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) / 3 = CellRx(%lf~%lf)"), *(_QWORD *)&v30, v30 + v31, *(_QWORD *)&a5, *(_QWORD *)&a6);
      goto LABEL_67;
    case 12:
      if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a9), "activeCoexFeatures"), "containsObject:", CFSTR("HFBTOOBMASKING"))|| self->_cellFrequencyLimitForOOB <= a3)
      {
        goto LABEL_71;
      }
      goto LABEL_44;
    case 13:
      if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a9), "activeCoexFeatures"), "containsObject:", CFSTR("HFBTOOBMASKING"))|| self->_cellFrequencyLimitForOOB >= a4)
      {
        goto LABEL_71;
      }
LABEL_44:
      if (v17 <= self->_cellBandwidthLimitForOOB)
LABEL_71:
        result = &__NSArray0__struct;
      else
        result = -[WCM_WiFiCellCoexIssue getAllBtChannelsInBandForBtHighFreq:btLowFreq:](self, "getAllBtChannelsInBandForBtHighFreq:btLowFreq:", a8, a7);
      break;
    case 14:
      v30 = v19 + v19;
      v31 = v19 + v20 + v19 + v20 - (v19 + v19);
      if (v19 + v19 >= a5)
        v34 = v19 + v19;
      else
        v34 = a5;
      v35 = v18 + a5;
      if (v30 + v31 < v18 + a5)
        v35 = v30 + v31;
      if (v34 >= v35)
        goto LABEL_71;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("(2 x BTTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v30, v30 + v31, *(_QWORD *)&a5, *(_QWORD *)&a6);
LABEL_67:
      v36 = v30;
      v37 = v31;
LABEL_68:
      result = sub_10007C448(v36, v37, a7, a8);
      break;
    default:
      if (issueType <= 0xE)
        v25 = off_100203990[issueType];
      else
        v25 = "<ISSUE_TYPE_INVALID>";
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s is not applicable for BT channel blocklisting"), v25);
      goto LABEL_71;
  }
  return result;
}

- (id)HFBTAntBlkBandsForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  id v7;
  int issueType;

  v7 = objc_msgSend(&off_1002487E8, "mutableCopy");
  issueType = self->_issueType;
  if (issueType == 13)
  {
    if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("HFBTOOBMASKING")) & 1) != 0|| self->_cellFrequencyLimitForOOB >= a4)
    {
      return v7;
    }
  }
  else if (issueType != 12
         || (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("HFBTOOBMASKING")) & 1) != 0|| self->_cellFrequencyLimitForOOB <= a3)
  {
    return v7;
  }
  if (a4 - a3 > self->_cellBandwidthLimitForOOB && self->_wifiChannelsToAvoidForCellOOB)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii1Enabled, a4 - a3), CFSTR("AntBlkBandUnii1Enabled"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii3Enabled), CFSTR("AntBlkBandUnii3Enabled"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5aEnabled), CFSTR("AntBlkBandUnii5aEnabled"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5bEnabled), CFSTR("AntBlkBandUnii5bEnabled"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5cEnabled), CFSTR("AntBlkBandUnii5cEnabled"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_HFBTAntBlkBandUnii5dEnabled), CFSTR("AntBlkBandUnii5dEnabled"));
  }
  return v7;
}

- (id)btChannelsToAvoidForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4 gpsRadioActive:(BOOL)a5
{
  double v7;
  uint64_t issueType;
  double v9;
  double v10;
  const char *v12;
  double v13;
  NSArray *wifiChannelsToAvoidForCellOOB;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a4 - a3;
  issueType = self->_issueType;
  if ((int)issueType <= 11)
  {
    if (!(_DWORD)issueType)
    {
      v9 = a3 * 3.0;
      v10 = (v7 + a3) * 3.0 - a3 * 3.0;
      if (a3 * 3.0 >= 2401.5)
        v13 = a3 * 3.0;
      else
        v13 = 2401.5;
      if (v13 < fmin(v9 + v10, 2480.5))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = BTRx(%lf~%lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, a3 * 3.0, v9 + v10, v19, v20);
        return sub_10007C38C(v9, v10);
      }
      return &__NSArray0__struct;
    }
    if ((_DWORD)issueType == 2)
    {
      if (a5 && sub_10007AE04(0, 2401.5, 79.0, a3, v7, 1573.374, 4.092))
      {
        v9 = a3 + 1573.374;
        v10 = a4 + 1577.466 - (a3 + 1573.374);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), a3 + 1573.374, a3 + 1573.374 + v10, *(_QWORD *)&a3, *(_QWORD *)&a4, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
        return sub_10007C38C(v9, v10);
      }
      return &__NSArray0__struct;
    }
    goto LABEL_11;
  }
  if ((_DWORD)issueType == 12)
  {
    if (self->_cellFrequencyLimitForOOB <= a3)
      return &__NSArray0__struct;
    goto LABEL_20;
  }
  if ((_DWORD)issueType != 13)
  {
LABEL_11:
    if (issueType <= 0xE)
      v12 = off_100203990[issueType];
    else
      v12 = "<ISSUE_TYPE_INVALID>";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s is not applicable for BT channel blocklisting"), v12);
    return &__NSArray0__struct;
  }
  if (self->_cellFrequencyLimitForOOB < a4)
  {
LABEL_20:
    if (v7 > self->_cellBandwidthLimitForOOB)
    {
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      if (wifiChannelsToAvoidForCellOOB)
      {
        v16 = (char *)-[NSArray count](wifiChannelsToAvoidForCellOOB, "count", a5) - 1;
        v17 = objc_msgSend(-[NSArray objectAtIndex:](self->_wifiChannelsToAvoidForCellOOB, "objectAtIndex:", 0), "intValue");
        v18 = objc_msgSend(-[NSArray objectAtIndex:](self->_wifiChannelsToAvoidForCellOOB, "objectAtIndex:", v16), "intValue");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BT channels corresponding to WiFi channels %d ~ %d"), v17, v18);
        return sub_10007C544((uint64_t)v17, (uint64_t)v18);
      }
    }
  }
  return &__NSArray0__struct;
}

- (id)btDiversityChannelsToAvoidForCellBTAntennaCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8
{
  uint64_t issueType;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v29;
  uint64_t v30;

  issueType = self->_issueType;
  v13 = a7 - a6;
  v14 = a5 - a4;
  switch((int)issueType)
  {
    case 0:
      v15 = a6 * 3.0;
      v16 = (v13 + a6) * 3.0 - a6 * 3.0;
      if (a6 * 3.0 >= 2401.5)
        v17 = a6 * 3.0;
      else
        v17 = 2401.5;
      if (v17 >= fmin(v15 + v16, 2480.5))
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = BTRx(%lf~%lf)"), *(_QWORD *)&a6, *(_QWORD *)&a7, a6 * 3.0, v15 + v16, v29, v30);
      goto LABEL_39;
    case 1:
      if (!sub_10007AEAC(0, 2401.5, 79.0, a6, v13, a4, v14))
        return &__NSArray0__struct;
      v18 = (a4 + a6) * 0.5;
      v19 = (a5 + a7) * 0.5 - v18;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v18, v18 + v19, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a4, *(_QWORD *)&a5);
      goto LABEL_42;
    case 2:
      if (!a8 || !sub_10007AE04(0, 2401.5, 79.0, a6, v13, 1573.374, 4.092))
        return &__NSArray0__struct;
      v15 = a6 + 1573.374;
      v16 = a7 + 1577.466 - (a6 + 1573.374);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), a6 + 1573.374, a6 + 1573.374 + v16, *(_QWORD *)&a6, *(_QWORD *)&a7, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_39;
    case 3:
      if (!sub_10007AE04(0, 2401.5, 79.0, a6, v13, a4, v14))
        return &__NSArray0__struct;
      v18 = a4 + a6;
      v19 = a5 + a7 - (a4 + a6);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), a4 + a6, a4 + a6 + v19, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a4, *(_QWORD *)&a5);
      goto LABEL_42;
    case 4:
      if (!sub_10007AEAC(0, a6, v13, 2401.5, 79.0, a4, v14))
        return &__NSArray0__struct;
      v18 = -(a5 - a6 * 2.0);
      v19 = -(a4 - a7 * 2.0) - v18;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&v18, v19 - (a5 - a6 * 2.0), *(_QWORD *)&a4, *(_QWORD *)&a5);
      goto LABEL_42;
    case 5:
      if (!a8 || !sub_10007AEAC(0, a6, v13, 2401.5, 79.0, 1573.374, 4.092))
        return &__NSArray0__struct;
      v15 = a6 * 2.0 + -1577.466;
      v16 = a7 * 2.0 + -1573.374 - v15;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&v15, v15 + v16, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_39;
    case 6:
      if (!a8 || !sub_10007AEAC(0, 2401.5, 79.0, a6, v13, 1573.374, 4.092))
        return &__NSArray0__struct;
      v15 = a6 * 2.0 + 1573.374;
      v16 = a7 * 2.0 + 1577.466 - v15;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&v15, v15 + v16, *(_QWORD *)&a6, *(_QWORD *)&a7, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_39;
    case 7:
      if (!sub_10007AEAC(0, 2401.5, 79.0, a6, v13, a4, v14))
        return &__NSArray0__struct;
      v18 = a4 + a6 * 2.0;
      v19 = a5 + a7 * 2.0 - v18;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v18, v18 + v19, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a4, *(_QWORD *)&a5);
      goto LABEL_42;
    case 8:
      if (!sub_10007AF8C(0, a6, v13, 2401.5, 79.0, a4, v14))
        return &__NSArray0__struct;
      v18 = -(a5 - a6 * 4.0);
      v19 = -(a4 - a7 * 4.0) - v18;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("4 x CellTx(%lf~%lf) - BTTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&v18, v19 - (a5 - a6 * 4.0), *(_QWORD *)&a4, *(_QWORD *)&a5);
LABEL_42:
      v25 = v18;
      v24 = v19;
      return sub_10007C38C(v25, v24);
    case 9:
      v15 = a6 + a6;
      v16 = v13 + a6 + v13 + a6 - (a6 + a6);
      if (a6 + a6 >= 2401.5)
        v20 = a6 + a6;
      else
        v20 = 2401.5;
      if (v20 >= fmin(v15 + v16, 2480.5))
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = BTRx(%lf~%lf)"), *(_QWORD *)&a6, *(_QWORD *)&a7, a6 + a6, v15 + v16, v29, v30);
LABEL_39:
      v25 = v15;
      v24 = v16;
      return sub_10007C38C(v25, v24);
    case 10:
      v21 = 0x4092C30000000000;
      v26 = fmax(a4, 1200.75);
      v27 = v14 + a4;
      if (v14 + a4 > 1240.25)
        v27 = 1240.25;
      if (v26 >= v27)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) / 2 = CellRx(%lf~%lf)"), 0x4092C30000000000, 0x4093610000000000, *(_QWORD *)&a4, *(_QWORD *)&a5);
      v24 = 39.5;
      goto LABEL_47;
    case 11:
      v21 = 0x4089040000000000;
      v22 = fmax(a4, 800.5);
      v23 = v14 + a4;
      if (v14 + a4 > 826.833333)
        v23 = 826.833333;
      if (v22 >= v23)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BTTx(%lf~%lf) / 3 = CellRx(%lf~%lf)"), 0x4089040000000000, 0x4089D6AAAAAAAAABLL, *(_QWORD *)&a4, *(_QWORD *)&a5);
      v24 = 26.3333333;
LABEL_47:
      v25 = *(double *)&v21;
      return sub_10007C38C(v25, v24);
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a6)
        return &__NSArray0__struct;
      goto LABEL_33;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a7)
        return &__NSArray0__struct;
LABEL_33:
      if (v13 <= self->_cellBandwidthLimitForOOB)
        return &__NSArray0__struct;
      else
        return -[WCM_WiFiCellCoexIssue btChannelsToAvoidFor:](self, "btChannelsToAvoidFor:", *(_QWORD *)&a3, a8);
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      return &__NSArray0__struct;
  }
}

- (id)wifiChannelsToAvoidForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7 wifiEssentialChannel:(int *)a8
{
  double v11;
  double v12;
  uint64_t issueType;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSArray *wifiChannelsToAvoidForCellOOB;
  id v36;
  id v37;
  uint64_t v38;
  int v39;
  void *i;
  unsigned int v41;
  BOOL v42;
  NSArray *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  unsigned int v48;
  BOOL v49;
  id result;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  if (a7)
    v11 = 5160.0;
  else
    v11 = 2402.0;
  if (a7)
    v12 = 675.0;
  else
    v12 = 80.0;
  if (!self->_enableWifiChannelAvoidance)
    return &__NSArray0__struct;
  issueType = self->_issueType;
  v17 = a6 - a5;
  v18 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      v19 = a5 * 3.0;
      v20 = (v17 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v11)
        v21 = a5 * 3.0;
      else
        v21 = v11;
      v22 = v11 + v12;
      if (v19 + v20 < v22)
        v22 = v19 + v20;
      if (v21 >= v22)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, a5 * 3.0, v19 + v20, v53, v54);
      goto LABEL_41;
    case 1:
      if (!sub_10007AEAC(0, v11, v12, a5, v17, a3, v18))
        return &__NSArray0__struct;
      v23 = (a3 + a5) * 0.5;
      v24 = (a4 + a6) * 0.5 - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v23, v23 + v24, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_33;
    case 2:
      if (!sub_10007AE04(0, v11, v12, a5, v17, 1573.374, 4.092))
        return &__NSArray0__struct;
      v19 = a5 + 1573.374;
      v20 = a6 + 1577.466 - (a5 + 1573.374);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), a5 + 1573.374, a5 + 1573.374 + v20, *(_QWORD *)&a5, *(_QWORD *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_41;
    case 3:
      if (!sub_10007AE04(0, v11, v12, a5, v17, a3, v18))
        return &__NSArray0__struct;
      v23 = a3 + a5;
      v24 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), a3 + a5, a3 + a5 + v24, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_33;
    case 4:
      if (!sub_10007AEAC(0, a5, v17, v11, v12, a3, v18))
        return &__NSArray0__struct;
      v23 = -(a4 - a5 * 2.0);
      v24 = -(a3 - a6 * 2.0) - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v23, v24 - (a4 - a5 * 2.0), *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_33;
    case 5:
      if (!sub_10007AEAC(0, a5, v17, v11, v12, 1573.374, 4.092))
        return &__NSArray0__struct;
      v19 = a5 * 2.0 + -1577.466;
      v20 = a6 * 2.0 + -1573.374 - v19;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v19, v19 + v20, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_41;
    case 6:
      if (!sub_10007AEAC(0, v11, v12, a5, v17, 1573.374, 4.092))
        return &__NSArray0__struct;
      v19 = a5 * 2.0 + 1573.374;
      v20 = a6 * 2.0 + 1577.466 - v19;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&v19, v19 + v20, *(_QWORD *)&a5, *(_QWORD *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_41;
    case 7:
      if (!sub_10007AEAC(0, v11, v12, a5, v17, a3, v18))
        return &__NSArray0__struct;
      v23 = a3 + a5 * 2.0;
      v24 = a4 + a6 * 2.0 - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v23, v23 + v24, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_33;
    case 8:
      if (!sub_10007AF8C(0, a5, v17, v11, v12, a3, v18))
        return &__NSArray0__struct;
      v23 = -(a4 - a5 * 4.0);
      v24 = -(a3 - a6 * 4.0) - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v23, v24 - (a4 - a5 * 4.0), *(_QWORD *)&a3, *(_QWORD *)&a4);
LABEL_33:
      v25 = v23;
      v26 = v24;
      goto LABEL_101;
    case 9:
      v19 = a5 + a5;
      v20 = v17 + a5 + v17 + a5 - (a5 + a5);
      if (a5 + a5 >= v11)
        v27 = a5 + a5;
      else
        v27 = v11;
      v28 = v11 + v12;
      if (v19 + v20 < v28)
        v28 = v19 + v20;
      if (v27 >= v28)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, a5 + a5, v19 + v20, v53, v54);
LABEL_41:
      v25 = v19;
      v26 = v20;
      goto LABEL_101;
    case 10:
      v29 = v11 * 0.5;
      v30 = (v11 + v12) * 0.5 - v11 * 0.5;
      if (v11 * 0.5 >= a3)
        v31 = v11 * 0.5;
      else
        v31 = a3;
      v32 = v18 + a3;
      if (v29 + v30 < v18 + a3)
        v32 = v29 + v30;
      if (v31 >= v32)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)"), *(_QWORD *)&v29, v29 + v30, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_100;
    case 11:
      v29 = v11 / 3.0;
      v30 = (v11 + v12) / 3.0 - v11 / 3.0;
      if (v11 / 3.0 >= a3)
        v33 = v11 / 3.0;
      else
        v33 = a3;
      v34 = v18 + a3;
      if (v29 + v30 < v18 + a3)
        v34 = v29 + v30;
      if (v33 >= v34)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)"), *(_QWORD *)&v29, v29 + v30, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_100;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5 || v17 <= self->_cellBandwidthLimitForOOB)
        return &__NSArray0__struct;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](wifiChannelsToAvoidForCellOOB, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (!v36)
        goto LABEL_92;
      v37 = v36;
      v38 = *(_QWORD *)v60;
      v39 = 13;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v38)
            objc_enumerationMutation(wifiChannelsToAvoidForCellOOB);
          v41 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), "intValue");
          v42 = v41 > 0xB || ((1 << v41) & 0x842) == 0;
          if (!v42 && (int)v41 < v39)
            v39 = v41;
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](wifiChannelsToAvoidForCellOOB, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v37);
      if (!a8 || v39 == 13)
        goto LABEL_92;
      goto LABEL_91;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6 || v17 <= self->_cellBandwidthLimitForOOB)
        return &__NSArray0__struct;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v43 = self->_wifiChannelsToAvoidForCellOOB;
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v44)
      {
        v45 = v44;
        v39 = 0;
        v46 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v45; j = (char *)j + 1)
          {
            if (*(_QWORD *)v56 != v46)
              objc_enumerationMutation(v43);
            v48 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), "intValue");
            v49 = v48 > 0xB || ((1 << v48) & 0x842) == 0;
            if (!v49 && (int)v48 > v39)
              v39 = v48;
          }
          v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v45);
        if (a8 && v39)
LABEL_91:
          *a8 = v39;
      }
LABEL_92:
      result = self->_wifiChannelsToAvoidForCellOOB;
      break;
    case 14:
      v29 = v11 + v11;
      v30 = v11 + v12 + v11 + v12 - (v11 + v11);
      if (v11 + v11 >= a3)
        v51 = v11 + v11;
      else
        v51 = a3;
      v52 = v18 + a3;
      if (v29 + v30 < v18 + a3)
        v52 = v29 + v30;
      if (v51 >= v52)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v29, v29 + v30, *(_QWORD *)&a3, *(_QWORD *)&a4);
LABEL_100:
      v25 = v29;
      v26 = v30;
LABEL_101:
      result = sub_10007BFFC(a8, v25, v26);
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      return &__NSArray0__struct;
  }
  return result;
}

- (id)wifiPHSChannelsToBlocklistForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifi5G:(BOOL)a7 wifiEssentialChannel:(int *)a8
{
  double v12;
  double v13;
  uint64_t issueType;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSArray *wifiChannelsToAvoidForCellOOB;
  id v36;
  id v37;
  uint64_t v38;
  int v39;
  void *i;
  unsigned int v41;
  BOOL v42;
  NSArray *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  unsigned int v48;
  BOOL v49;
  id result;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  if (a7)
    v12 = 5160.0;
  else
    v12 = 2402.0;
  if (a7)
    v13 = 675.0;
  else
    v13 = 80.0;
  issueType = self->_issueType;
  v17 = a6 - a5;
  v18 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      v19 = a5 * 3.0;
      v20 = (v17 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= v12)
        v21 = a5 * 3.0;
      else
        v21 = v12;
      v22 = v12 + v13;
      if (v19 + v20 < v22)
        v22 = v19 + v20;
      if (v21 >= v22)
        goto LABEL_101;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, a5 * 3.0, v19 + v20, v53, v54);
      goto LABEL_40;
    case 1:
      if (!sub_10007AEAC(0, v12, v13, a5, v17, a3, v18))
        goto LABEL_101;
      v23 = (a3 + a5) * 0.5;
      v24 = (a4 + a6) * 0.5 - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v23, v23 + v24, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_32;
    case 2:
      if (!sub_10007AE04(0, v12, v13, a5, v17, 1573.374, 4.092))
        goto LABEL_101;
      v19 = a5 + 1573.374;
      v20 = a6 + 1577.466 - (a5 + 1573.374);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), a5 + 1573.374, a5 + 1573.374 + v20, *(_QWORD *)&a5, *(_QWORD *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_40;
    case 3:
      if (!sub_10007AE04(0, v12, v13, a5, v17, a3, v18))
        goto LABEL_101;
      v23 = a3 + a5;
      v24 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), a3 + a5, a3 + a5 + v24, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_32;
    case 4:
      if (!sub_10007AEAC(0, a5, v17, v12, v13, a3, v18))
        goto LABEL_101;
      v23 = -(a4 - a5 * 2.0);
      v24 = -(a3 - a6 * 2.0) - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v23, v24 - (a4 - a5 * 2.0), *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_32;
    case 5:
      if (!sub_10007AEAC(0, a5, v17, v12, v13, 1573.374, 4.092))
        goto LABEL_101;
      v19 = a5 * 2.0 + -1577.466;
      v20 = a6 * 2.0 + -1573.374 - v19;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v19, v19 + v20, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_40;
    case 6:
      if (!sub_10007AEAC(0, v12, v13, a5, v17, 1573.374, 4.092))
        goto LABEL_101;
      v19 = a5 * 2.0 + 1573.374;
      v20 = a6 * 2.0 + 1577.466 - v19;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&v19, v19 + v20, *(_QWORD *)&a5, *(_QWORD *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_40;
    case 7:
      if (!sub_10007AEAC(0, v12, v13, a5, v17, a3, v18))
        goto LABEL_101;
      v23 = a3 + a5 * 2.0;
      v24 = a4 + a6 * 2.0 - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v23, v23 + v24, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_32;
    case 8:
      if (!sub_10007AF8C(0, a5, v17, v12, v13, a3, v18))
        goto LABEL_101;
      v23 = -(a4 - a5 * 4.0);
      v24 = -(a3 - a6 * 4.0) - v23;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v23, v24 - (a4 - a5 * 4.0), *(_QWORD *)&a3, *(_QWORD *)&a4);
LABEL_32:
      v25 = v23;
      v26 = v24;
      goto LABEL_100;
    case 9:
      v19 = a5 + a5;
      v20 = v17 + a5 + v17 + a5 - (a5 + a5);
      if (a5 + a5 >= v12)
        v27 = a5 + a5;
      else
        v27 = v12;
      v28 = v12 + v13;
      if (v19 + v20 < v28)
        v28 = v19 + v20;
      if (v27 >= v28)
        goto LABEL_101;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, a5 + a5, v19 + v20, v53, v54);
LABEL_40:
      v25 = v19;
      v26 = v20;
      goto LABEL_100;
    case 10:
      v29 = v12 * 0.5;
      v30 = (v12 + v13) * 0.5 - v12 * 0.5;
      if (v12 * 0.5 >= a3)
        v31 = v12 * 0.5;
      else
        v31 = a3;
      v32 = v18 + a3;
      if (v29 + v30 < v18 + a3)
        v32 = v29 + v30;
      if (v31 >= v32)
        goto LABEL_101;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)"), *(_QWORD *)&v29, v29 + v30, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_99;
    case 11:
      v29 = v12 / 3.0;
      v30 = (v12 + v13) / 3.0 - v12 / 3.0;
      if (v12 / 3.0 >= a3)
        v33 = v12 / 3.0;
      else
        v33 = a3;
      v34 = v18 + a3;
      if (v29 + v30 < v18 + a3)
        v34 = v29 + v30;
      if (v33 >= v34)
        goto LABEL_101;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)"), *(_QWORD *)&v29, v29 + v30, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_99;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5 || v17 <= self->_cellBandwidthLimitForOOB)
        goto LABEL_101;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      wifiChannelsToAvoidForCellOOB = self->_wifiChannelsToAvoidForCellOOB;
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](wifiChannelsToAvoidForCellOOB, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (!v36)
        goto LABEL_91;
      v37 = v36;
      v38 = *(_QWORD *)v60;
      v39 = 13;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v38)
            objc_enumerationMutation(wifiChannelsToAvoidForCellOOB);
          v41 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), "intValue");
          v42 = v41 > 0xB || ((1 << v41) & 0x842) == 0;
          if (!v42 && (int)v41 < v39)
            v39 = v41;
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](wifiChannelsToAvoidForCellOOB, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v37);
      if (!a8 || v39 == 13)
        goto LABEL_91;
      goto LABEL_90;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6 || v17 <= self->_cellBandwidthLimitForOOB)
        goto LABEL_101;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v43 = self->_wifiChannelsToAvoidForCellOOB;
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v44)
      {
        v45 = v44;
        v39 = 0;
        v46 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v45; j = (char *)j + 1)
          {
            if (*(_QWORD *)v56 != v46)
              objc_enumerationMutation(v43);
            v48 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), "intValue");
            v49 = v48 > 0xB || ((1 << v48) & 0x842) == 0;
            if (!v49 && (int)v48 > v39)
              v39 = v48;
          }
          v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v45);
        if (a8 && v39)
LABEL_90:
          *a8 = v39;
      }
LABEL_91:
      result = self->_wifiChannelsToAvoidForPHS;
      break;
    case 14:
      v29 = v12 + v12;
      v30 = v12 + v13 + v12 + v13 - (v12 + v12);
      if (v12 + v12 >= a3)
        v51 = v12 + v12;
      else
        v51 = a3;
      v52 = v18 + a3;
      if (v29 + v30 < v18 + a3)
        v52 = v29 + v30;
      if (v51 >= v52)
        goto LABEL_101;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v29, v29 + v30, *(_QWORD *)&a3, *(_QWORD *)&a4);
LABEL_99:
      v25 = v29;
      v26 = v30;
LABEL_100:
      result = sub_10007BFFC(a8, v25, v26);
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
LABEL_101:
      result = &__NSArray0__struct;
      break;
  }
  return result;
}

- (id)wifiChannelsToAvoidWiFiEnhForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6
{
  uint64_t issueType;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id result;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;

  if (!self->_enableWifiChannelAvoidance)
    return &__NSArray0__struct;
  issueType = self->_issueType;
  v11 = a6 - a5;
  v12 = a4 - a3;
  switch((int)issueType)
  {
    case 0:
      v13 = a5 * 3.0;
      v14 = (v11 + a5) * 3.0 - a5 * 3.0;
      if (a5 * 3.0 >= 5945.0)
        v15 = a5 * 3.0;
      else
        v15 = 5945.0;
      if (v15 >= fmin(v13 + v14, 7125.0))
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, a5 * 3.0, v13 + v14, v29, v30);
      goto LABEL_31;
    case 1:
      if (!sub_10007AEAC(0, 5945.0, 1180.0, a5, v11, a3, v12))
        return &__NSArray0__struct;
      v16 = (a3 + a5) * 0.5;
      v17 = (a4 + a6) * 0.5 - v16;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v16, v16 + v17, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_25;
    case 2:
      if (!sub_10007AE04(0, 5945.0, 1180.0, a5, v11, 1573.374, 4.092))
        return &__NSArray0__struct;
      v13 = a5 + 1573.374;
      v14 = a6 + 1577.466 - (a5 + 1573.374);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), a5 + 1573.374, a5 + 1573.374 + v14, *(_QWORD *)&a5, *(_QWORD *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_31;
    case 3:
      if (!sub_10007AE04(0, 5945.0, 1180.0, a5, v11, a3, v12))
        return &__NSArray0__struct;
      v16 = a3 + a5;
      v17 = a4 + a6 - (a3 + a5);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), a3 + a5, a3 + a5 + v17, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_25;
    case 4:
      if (!sub_10007AEAC(0, a5, v11, 5945.0, 1180.0, a3, v12))
        return &__NSArray0__struct;
      v16 = -(a4 - a5 * 2.0);
      v17 = -(a3 - a6 * 2.0) - v16;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v16, v17 - (a4 - a5 * 2.0), *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_25;
    case 5:
      if (!sub_10007AEAC(0, a5, v11, 5945.0, 1180.0, 1573.374, 4.092))
        return &__NSArray0__struct;
      v13 = a5 * 2.0 + -1577.466;
      v14 = a6 * 2.0 + -1573.374 - v13;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v13, v13 + v14, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_31;
    case 6:
      if (!sub_10007AEAC(0, 5945.0, 1180.0, a5, v11, 1573.374, 4.092))
        return &__NSArray0__struct;
      v13 = a5 * 2.0 + 1573.374;
      v14 = a6 * 2.0 + 1577.466 - v13;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&v13, v13 + v14, *(_QWORD *)&a5, *(_QWORD *)&a6, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      goto LABEL_31;
    case 7:
      if (!sub_10007AEAC(0, 5945.0, 1180.0, a5, v11, a3, v12))
        return &__NSArray0__struct;
      v16 = a3 + a5 * 2.0;
      v17 = a4 + a6 * 2.0 - v16;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - 2 x CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v16, v16 + v17, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a3, *(_QWORD *)&a4);
      goto LABEL_25;
    case 8:
      if (!sub_10007AF8C(0, a5, v11, 5945.0, 1180.0, a3, v12))
        return &__NSArray0__struct;
      v16 = -(a4 - a5 * 4.0);
      v17 = -(a3 - a6 * 4.0) - v16;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v16, v17 - (a4 - a5 * 4.0), *(_QWORD *)&a3, *(_QWORD *)&a4);
LABEL_25:
      v18 = v16;
      v19 = v17;
      return sub_10007C1AC(v18, v19);
    case 9:
      v13 = a5 + a5;
      v14 = v11 + a5 + v11 + a5 - (a5 + a5);
      if (a5 + a5 >= 5945.0)
        v20 = a5 + a5;
      else
        v20 = 5945.0;
      if (v20 >= fmin(v13 + v14, 7125.0))
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, a5 + a5, v13 + v14, v29, v30);
LABEL_31:
      v18 = v13;
      v19 = v14;
      return sub_10007C1AC(v18, v19);
    case 10:
      v21 = 0x40A7390000000000;
      v22 = fmax(a3, 2972.5);
      v23 = v12 + a3;
      if (v12 + a3 > 3562.5)
        v23 = 3562.5;
      if (v22 >= v23)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)"), 0x40A7390000000000, 0x40ABD50000000000, *(_QWORD *)&a3, *(_QWORD *)&a4);
      v19 = 590.0;
      goto LABEL_49;
    case 11:
      v21 = 0x409EF6AAAAAAAAABLL;
      v24 = fmax(a3, 1981.66667);
      v25 = v12 + a3;
      if (v12 + a3 > 2375.0)
        v25 = 2375.0;
      if (v24 >= v25)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)"), 0x409EF6AAAAAAAAABLL, 0x40A28E0000000000, *(_QWORD *)&a3, *(_QWORD *)&a4);
      v19 = 393.333333;
      goto LABEL_49;
    case 12:
      if (self->_cellFrequencyLimitForOOB <= a5)
        return &__NSArray0__struct;
      goto LABEL_43;
    case 13:
      if (self->_cellFrequencyLimitForOOB >= a6)
        return &__NSArray0__struct;
LABEL_43:
      if (v11 <= self->_cellBandwidthLimitForOOB)
        return &__NSArray0__struct;
      result = self->_wifiChannelsToAvoidForCellOOB;
      break;
    case 14:
      v21 = 0x40C7390000000000;
      v27 = fmax(a3, 11890.0);
      v28 = v12 + a3;
      if (v12 + a3 > 14250.0)
        v28 = 14250.0;
      if (v27 >= v28)
        return &__NSArray0__struct;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)"), 0x40C7390000000000, 0x40CBD50000000000, *(_QWORD *)&a3, *(_QWORD *)&a4);
      v19 = 2360.0;
LABEL_49:
      v18 = *(double *)&v21;
      return sub_10007C1AC(v18, v19);
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiType7_WiFiEnh: WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType);
      return &__NSArray0__struct;
  }
  return result;
}

- (BOOL)wifiBtAgcCoexModeEnabledInPolicy:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 agccoexmode:(int *)a7
{
  double v7;
  uint64_t issueType;
  double v9;
  double v10;

  v7 = a6 - a5;
  issueType = self->_issueType;
  switch((_DWORD)issueType)
  {
    case 0xD:
      if (self->_cellFrequencyLimitForOOB >= a6)
        return 0;
LABEL_11:
      if (v7 > self->_cellBandwidthLimitForOOB)
        goto LABEL_12;
      return 0;
    case 0xC:
      if (self->_cellFrequencyLimitForOOB <= a5)
        return 0;
      goto LABEL_11;
    case 0:
      v9 = (v7 + a5) * 3.0 - a5 * 3.0;
      v10 = 2402.0;
      if (a5 * 3.0 >= 2402.0)
        v10 = a5 * 3.0;
      if (v10 >= fmin(a5 * 3.0 + v9, 2482.0))
        return 0;
LABEL_12:
      *a7 = self->_wifiBtAgcCoexModeEnable;
      return 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d) in AgcCoexMode"), v7, a4, self, issueType);
  return 0;
}

- (BOOL)wifiBtAgcCoexModeEnabledInPolicyV2:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiChannel:(unsigned int)a7 channelCenterFreqMHz:(unsigned int)a8 channelBandwidthMHz:(unsigned int)a9 coexModeWifiLevel:(int64_t *)a10 coexModeBTLevel:(int64_t *)a11
{
  double v18;
  uint64_t issueType;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL8 v29;
  double v30;
  double v31;
  const char *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _BOOL8 v40;
  double v41;
  double v42;
  BOOL result;

  if (-[WCM_WiFiCellCoexIssue issueType](self, "issueType", *(_QWORD *)&a7, a3, a4)
    && -[WCM_WiFiCellCoexIssue issueType](self, "issueType") != 9
    && (-[WCM_WiFiCellCoexIssue issueType](self, "issueType") & 0xFFFFFFFE) != 0xC
    || !self->_enableWifiChannelAvoidance)
  {
    return 0;
  }
  v18 = a6 - a5;
  issueType = self->_issueType;
  if ((int)issueType > 11)
  {
    if ((_DWORD)issueType == 12)
    {
      if (self->_cellFrequencyLimitForOOB > a5 && v18 > self->_cellBandwidthLimitForOOB)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: ISSUE_TYPE_OOB_ISM_RIGHT matched for both WiFi/BT with CellTxLow(%lf~%lf) and WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, 0, 0);
        goto LABEL_60;
      }
    }
    else
    {
      if ((_DWORD)issueType != 13)
        goto LABEL_34;
      if (self->_cellFrequencyLimitForOOB < a6 && v18 > self->_cellBandwidthLimitForOOB)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: ISSUE_TYPE_OOB_ISM_LEFT matched for both WiFi/BT with CellTxLow(%lf~%lf) and WifiRx(%lf~%lf)"), *(_QWORD *)&a5, *(_QWORD *)&a6, 0, 0);
LABEL_60:
        *a10 = self->_wifiBtAgcCoexModeEnable;
        goto LABEL_61;
      }
    }
    return 0;
  }
  v20 = (double)(a8 - (a9 >> 1));
  v21 = (double)(a8 + (a9 >> 1)) - v20;
  if ((_DWORD)issueType)
  {
    if ((_DWORD)issueType == 9)
    {
      v22 = a5 + a5;
      v23 = v18 + a5 + v18 + a5 - (a5 + a5);
      if (a5 + a5 >= v20)
        v24 = a5 + a5;
      else
        v24 = (double)(a8 - (a9 >> 1));
      v25 = v21 + v20;
      if (v22 + v23 < v25)
        v25 = v22 + v23;
      v26 = 2402.0;
      if (v22 >= 2402.0)
        v26 = a5 + a5;
      v27 = fmin(v22 + v23, 2482.0);
      if (v26 >= v27 && v24 >= v25)
        return 0;
      v29 = v26 < v27;
      if (v26 >= v27)
        v30 = 0.0;
      else
        v30 = a5 + a5;
      if (v26 >= v27)
        v31 = 0.0;
      else
        v31 = v23;
      if (v24 >= v25)
      {
        v23 = 0.0;
        v22 = 0.0;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: ISSUE_TYPE_2CELL_2FO_WIFI_VICTIM matched flag is %d, for WiFi with 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), v24 < v25, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v22, v22 + v23);
      *a10 = self->_wifiBtAgcCoexModeEnable;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: ISSUE_TYPE_2CELL_2FO_WIFI_VICTIM matched flag is %d, for BT with 2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), v29, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v30, v31 + v30);
      goto LABEL_61;
    }
LABEL_34:
    if (issueType <= 0xE)
      v32 = off_100203990[issueType];
    else
      v32 = "<ISSUE_TYPE_INVALID>";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%s is not considered for WiFi/BT Coex Mode, putting all zeros (assuming policy table entries are correct)"), v18, v32);
    result = 0;
    *a10 = self->_wifiBtAgcCoexModeEnable;
    goto LABEL_65;
  }
  v33 = a5 * 3.0;
  v34 = (v18 + a5) * 3.0 - a5 * 3.0;
  if (a5 * 3.0 >= v20)
    v35 = a5 * 3.0;
  else
    v35 = (double)(a8 - (a9 >> 1));
  v36 = v21 + v20;
  if (v33 + v34 < v36)
    v36 = v33 + v34;
  v37 = 2402.0;
  if (v33 >= 2402.0)
    v37 = a5 * 3.0;
  v38 = fmin(v33 + v34, 2482.0);
  if (v37 >= v38 && v35 >= v36)
    return 0;
  v40 = v37 < v38;
  if (v37 >= v38)
    v41 = 0.0;
  else
    v41 = a5 * 3.0;
  if (v37 >= v38)
    v42 = 0.0;
  else
    v42 = v34;
  if (v35 >= v36)
  {
    v34 = 0.0;
    v33 = 0.0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: ISSUE_TYPE_3CELL_3FO_WIFI_VICTIM matched flag = %d, for WiFi with 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), v35 < v36, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v33, v33 + v34);
  *a10 = self->_wifiBtAgcCoexModeEnable;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: ISSUE_TYPE_3CELL_3FO_WIFI_VICTIM matched flag = %d, for BT with 3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), v40, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v41, v42 + v41);
LABEL_61:
  result = 1;
LABEL_65:
  *a11 = self->_btAgcCoexModeEnable;
  return result;
}

- (BOOL)watchAntennaPrefEnabledInPolicy:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 watchAntPref:(int *)a7
{
  int issueType;

  issueType = self->_issueType;
  if (issueType == 13)
  {
    if (self->_cellFrequencyLimitForOOB >= a6)
      return 0;
  }
  else
  {
    if (issueType != 12)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d) in watchAntPreference %d"), a3, a4, a5, a6, self, self->_issueType, self->_watchAntType);
      return 0;
    }
    if (self->_cellFrequencyLimitForOOB <= a5)
      return 0;
  }
  if (a6 - a5 > self->_cellBandwidthLimitForOOB)
  {
    *a7 = self->_watchAntType;
    return 1;
  }
  return 0;
}

- (void)cellFreqRangeWithIssueForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6 wifiLowFreq:(double)a7 wifiHighFreq:(double)a8 cellTxIssueRange:(id *)a9 cellRxIssueRange:(id *)a10
{
  uint64_t issueType;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double cellFrequencyLimitForOOB;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  $F24F406B2B787EFB06265DBA3D28CBD5 v37;
  $F24F406B2B787EFB06265DBA3D28CBD5 v38;

  v38 = ($F24F406B2B787EFB06265DBA3D28CBD5)0;
  v37 = ($F24F406B2B787EFB06265DBA3D28CBD5)0;
  issueType = self->_issueType;
  v16 = a3;
  v17 = a6 - a5;
  v18 = a4 - a3;
  v19 = a8 - a7;
  switch((int)issueType)
  {
    case 0:
      v20 = a5 * 3.0;
      v21 = (v17 + a5) * 3.0 - a5 * 3.0;
      if (v20 >= a7)
        v22 = v20;
      else
        v22 = a7;
      v23 = v20 + v21;
      if (v23 >= v19 + a7)
        v23 = v19 + a7;
      if (v22 < v23)
      {
        v38.var0 = v22 / 3.0;
        v38.var1 = (v23 - v22) / 3.0;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("3 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), v22 / 3.0, v22 / 3.0 + v38.var1, *(_QWORD *)&a7, *(_QWORD *)&a8, v35, v36);
      }
      break;
    case 1:
    case 4:
    case 7:
      if (sub_10007B558(0, &v38.var0, &v37.var0, a7, a8 - a7, a5, v17, a3, v18))
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&v38.var0, v38.var0 + v38.var1, *(_QWORD *)&v37.var0, v37.var0 + v37.var1);
      break;
    case 2:
      if (sub_10007B558(0, &v38.var0, 0, a7, v19, a5, v17, 1573.374, 4.092))
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&v38.var0, v38.var0 + v38.var1, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      break;
    case 3:
      if (sub_10007B308(0, &v38.var0, &v37.var0, a7, a8 - a7, a5, v17, a3, v18))
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) - CellTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&v38.var0, v38.var0 + v38.var1, *(_QWORD *)&v37.var0, v37.var0 + v37.var1);
      break;
    case 5:
    case 6:
      if (sub_10007B558(&v38.var0, 0, 0, a5, v17, a7, v19, 1573.374, 4.092))
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = GpsRx(%lf~%lf)"), *(_QWORD *)&v38.var0, v38.var0 + v38.var1, *(_QWORD *)&a7, *(_QWORD *)&a8, 0x4098957EF9DB22D1, 0x4098A5DD2F1A9FBFLL);
      break;
    case 8:
      if (sub_10007B82C(&v38.var0, 0, &v37.var0, a5, v17, a7, a8 - a7, a3, v18))
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("4 x CellTx(%lf~%lf) - WifiTx(%lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&v38.var0, v38.var0 + v38.var1, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&v37.var0, v37.var0 + v37.var1);
      break;
    case 9:
      v24 = a5 + a5;
      v25 = v17 + a5 + v17 + a5 - (a5 + a5);
      if (v24 >= a7)
        v26 = v24;
      else
        v26 = a7;
      v27 = v24 + v25;
      if (v27 >= v19 + a7)
        v27 = v19 + a7;
      if (v26 < v27)
      {
        v38.var0 = v26 * 0.5;
        v38.var1 = (v27 - v26) * 0.5;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2 x CellTx(%lf~%lf) = WifiRx(%lf~%lf)"), v26 * 0.5, v26 * 0.5 + v38.var1, *(_QWORD *)&a7, *(_QWORD *)&a8, v35, v36);
      }
      break;
    case 10:
      if (a7 * 0.5 >= a3)
        a3 = a7 * 0.5;
      v31 = a7 * 0.5 + (v19 + a7) * 0.5 - a7 * 0.5;
      if (v31 >= v18 + v16)
        v31 = v18 + v16;
      if (a3 < v31)
      {
        v37.var0 = a3;
        v37.var1 = v31 - a3;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 2 = CellRx(%lf~%lf)"), *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a3, a3 + v31 - a3, v35, v36);
      }
      break;
    case 11:
      if (a7 / 3.0 >= a3)
        a3 = a7 / 3.0;
      v28 = a7 / 3.0 + (v19 + a7) / 3.0 - a7 / 3.0;
      if (v28 >= v18 + v16)
        v28 = v18 + v16;
      if (a3 < v28)
      {
        v37.var0 = a3;
        v37.var1 = v28 - a3;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WifiTx(%lf~%lf) / 3 = CellRx(%lf~%lf)"), *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a3, a3 + v28 - a3, v35, v36);
      }
      break;
    case 12:
      cellFrequencyLimitForOOB = self->_cellFrequencyLimitForOOB;
      if (cellFrequencyLimitForOOB > a5 && v17 > self->_cellBandwidthLimitForOOB)
      {
        v38.var0 = a5;
        v38.var1 = cellFrequencyLimitForOOB - a5;
      }
      break;
    case 13:
      v32 = self->_cellFrequencyLimitForOOB;
      if (v32 < a6 && v17 > self->_cellBandwidthLimitForOOB)
      {
        v38.var0 = self->_cellFrequencyLimitForOOB;
        v38.var1 = a6 - v32;
      }
      break;
    case 14:
      if (a7 + a7 >= a3)
        a3 = a7 + a7;
      v30 = a7 + a7 + v19 + a7 + v19 + a7 - (a7 + a7);
      if (v30 >= v18 + v16)
        v30 = v18 + v16;
      if (a3 < v30)
      {
        v37.var0 = a3;
        v37.var1 = v30 - a3;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("(2 x WiFiTx)(i.e. %lf~%lf) = CellRx(%lf~%lf)"), *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a3, a3 + v30 - a3, v35, v36);
      }
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiCellCoexIssue(%p) has invalid _issueType(%d)"), self, issueType, v33, v34, v35, v36);
      break;
  }
  if (a9)
    *a9 = v38;
  if (a10)
    *a10 = v37;
}

- (int)issueType
{
  return self->_issueType;
}

- (BOOL)enableWifiChannelAvoidance
{
  return self->_enableWifiChannelAvoidance;
}

- (unsigned)wifiUlAntennaBitmapOnCellLAT
{
  return self->_wifiUlAntennaBitmapOnCellLAT;
}

- (unsigned)wifiUlAntennaBitmapOnCellUAT
{
  return self->_wifiUlAntennaBitmapOnCellUAT;
}

- (unsigned)wifiDlAntennaBitmapOnCellLAT
{
  return self->_wifiDlAntennaBitmapOnCellLAT;
}

- (unsigned)wifiDlAntennaBitmapOnCellUAT
{
  return self->_wifiDlAntennaBitmapOnCellUAT;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap000
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap000;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap001
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap001;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap010
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap010;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap011
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap011;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap100
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap100;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap101
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap101;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap110
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap110;
}

- (unsigned)wifiUlAntennaBitmapOnCellAntBitmap111
{
  return self->_wifiUlAntennaBitmapOnCellAntBitmap111;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap000
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap000;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap001
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap001;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap010
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap010;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap011
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap011;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap100
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap100;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap101
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap101;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap110
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap110;
}

- (unsigned)wifiDlAntennaBitmapOnCellAntBitmap111
{
  return self->_wifiDlAntennaBitmapOnCellAntBitmap111;
}

- (unint64_t)cellTxPowerLimit
{
  return self->_cellTxPowerLimit;
}

- (double)cellFrequencyLimitForOOB
{
  return self->_cellFrequencyLimitForOOB;
}

- (double)cellBandwidthLimitForOOB
{
  return self->_cellBandwidthLimitForOOB;
}

- (NSArray)wifiChannelsToAvoidForCellOOB
{
  return self->_wifiChannelsToAvoidForCellOOB;
}

- (NSArray)wifiChannelsToAvoidForOCL
{
  return self->_wifiChannelsToAvoidForOCL;
}

- (NSArray)wifiChannelsToAvoidForPHS
{
  return self->_wifiChannelsToAvoidForPHS;
}

- (NSArray)wifiChannelsToDoAntennaSelectionForCellOOB
{
  return self->_wifiChannelsToDoAntennaSelectionForCellOOB;
}

- (int)btDiversityBlocklistTypeForC0B0
{
  return self->_btDiversityBlocklistTypeForC0B0;
}

- (int)btDiversityBlocklistTypeForC0B1
{
  return self->_btDiversityBlocklistTypeForC0B1;
}

- (int)btDiversityBlocklistTypeForC1B0
{
  return self->_btDiversityBlocklistTypeForC1B0;
}

- (int)btDiversityBlocklistTypeForC1B1
{
  return self->_btDiversityBlocklistTypeForC1B1;
}

- (NSArray)btChannelsToAvoidForC0B0
{
  return self->_btChannelsToAvoidForC0B0;
}

- (NSArray)btChannelsToAvoidForC0B1
{
  return self->_btChannelsToAvoidForC0B1;
}

- (NSArray)btChannelsToAvoidForC1B0
{
  return self->_btChannelsToAvoidForC1B0;
}

- (NSArray)btChannelsToAvoidForC1B1
{
  return self->_btChannelsToAvoidForC1B1;
}

- (int)watchAntType
{
  return self->_watchAntType;
}

- (unsigned)wifiBtAgcCoexModeEnable
{
  return self->_wifiBtAgcCoexModeEnable;
}

- (unsigned)ulcaPriority
{
  return self->_ulcaPriority;
}

- (unsigned)ulcaPriorityCCWiFi
{
  return self->_ulcaPriorityCCWiFi;
}

- (unsigned)ulcaPriorityCCBT
{
  return self->_ulcaPriorityCCBT;
}

- (unsigned)btAgcCoexModeEnable
{
  return self->_btAgcCoexModeEnable;
}

- (unsigned)cellAntBlkEnableIdx
{
  return self->_cellAntBlkEnableIdx;
}

- (BOOL)isWifiEnhBand
{
  return self->_isWifiEnhBand;
}

- (BOOL)HFBTAntBlkBandUnii1Enabled
{
  return self->_HFBTAntBlkBandUnii1Enabled;
}

- (BOOL)HFBTAntBlkBandUnii3Enabled
{
  return self->_HFBTAntBlkBandUnii3Enabled;
}

- (BOOL)HFBTAntBlkBandUnii5aEnabled
{
  return self->_HFBTAntBlkBandUnii5aEnabled;
}

- (BOOL)HFBTAntBlkBandUnii5bEnabled
{
  return self->_HFBTAntBlkBandUnii5bEnabled;
}

- (BOOL)HFBTAntBlkBandUnii5cEnabled
{
  return self->_HFBTAntBlkBandUnii5cEnabled;
}

- (BOOL)HFBTAntBlkBandUnii5dEnabled
{
  return self->_HFBTAntBlkBandUnii5dEnabled;
}

- (NSArray)wifiChannelsToApplyCellAntBlocking
{
  return self->_wifiChannelsToApplyCellAntBlocking;
}

- (unsigned)cellAntBlkEnableIdx2
{
  return self->_cellAntBlkEnableIdx2;
}

@end
