@implementation WCM_WiFiCellCoexIssueBandTable

- (WCM_WiFiCellCoexIssueBandTable)init
{
  WCM_WiFiCellCoexIssueBandTable *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiCellCoexIssueBandTable;
  result = -[WCM_WiFiCellCoexIssueBandTable init](&v3, "init");
  if (result)
  {
    result->_issueBand[0]._bandInfoType = 24;
    *(_OWORD *)&result->_issueBand[0]._downlinkLowFreq = xmmword_1001DDDD0;
    *(_OWORD *)&result->_issueBand[0]._uplinkLowFreq = xmmword_1001DDDE0;
    result->_issueBand[1]._bandInfoType = 63;
    *(_OWORD *)&result->_issueBand[1]._downlinkLowFreq = xmmword_1001DDDF0;
    *(_OWORD *)&result->_issueBand[1]._uplinkLowFreq = xmmword_1001DDE00;
    result->_issueBand[2]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[2]._downlinkLowFreq = xmmword_1001DDE10;
    *(_OWORD *)&result->_issueBand[2]._uplinkLowFreq = xmmword_1001DDE20;
    result->_issueBand[3]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[3]._downlinkLowFreq = xmmword_1001DDE30;
    *(_OWORD *)&result->_issueBand[3]._uplinkLowFreq = xmmword_1001DDE40;
    result->_issueBand[4]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[4]._downlinkLowFreq = xmmword_1001DDE50;
    *(_OWORD *)&result->_issueBand[4]._uplinkLowFreq = xmmword_1001DDE60;
    result->_issueBand[5]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[5]._downlinkLowFreq = xmmword_1001DDE70;
    *(_OWORD *)&result->_issueBand[5]._uplinkLowFreq = xmmword_1001DDE80;
    result->_issueBand[6]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[6]._downlinkLowFreq = xmmword_1001DDE90;
    *(_OWORD *)&result->_issueBand[6]._uplinkLowFreq = xmmword_1001DDEA0;
    result->_issueBand[7]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[7]._downlinkLowFreq = xmmword_1001DDEB0;
    *(_OWORD *)&result->_issueBand[7]._uplinkLowFreq = xmmword_1001DDEC0;
    result->_issueBand[8]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[8]._downlinkLowFreq = xmmword_1001DDED0;
    *(_OWORD *)&result->_issueBand[8]._uplinkLowFreq = xmmword_1001DDEE0;
    result->_issueBand[9]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[9]._downlinkLowFreq = xmmword_1001DDEF0;
    *(_OWORD *)&result->_issueBand[9]._uplinkLowFreq = xmmword_1001DDF00;
    result->_issueBand[10]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[10]._downlinkLowFreq = xmmword_1001DDF10;
    *(_OWORD *)&result->_issueBand[10]._uplinkLowFreq = xmmword_1001DDF10;
    result->_issueBand[11]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[11]._downlinkLowFreq = xmmword_1001DDF20;
    *(_OWORD *)&result->_issueBand[11]._uplinkLowFreq = xmmword_1001DDF20;
    result->_issueBand[12]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[12]._downlinkLowFreq = xmmword_1001DDF30;
    *(_OWORD *)&result->_issueBand[12]._uplinkLowFreq = xmmword_1001DDF30;
    result->_issueBand[13]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[13]._downlinkLowFreq = xmmword_1001DDF40;
    *(_OWORD *)&result->_issueBand[13]._uplinkLowFreq = xmmword_1001DDF40;
    result->_issueBand[14]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[14]._downlinkLowFreq = xmmword_1001DDF50;
    *(_OWORD *)&result->_issueBand[14]._uplinkLowFreq = xmmword_1001DDF60;
    result->_issueBand[15]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[15]._downlinkLowFreq = xmmword_1001DDF70;
    *(_OWORD *)&result->_issueBand[15]._uplinkLowFreq = xmmword_1001DDF70;
    result->_issueBand[16]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[16]._downlinkLowFreq = xmmword_1001DDF30;
    *(_OWORD *)&result->_issueBand[16]._uplinkLowFreq = xmmword_1001DDF30;
    result->_issueBand[17]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[17]._downlinkLowFreq = xmmword_1001DDF80;
    *(_OWORD *)&result->_issueBand[17]._uplinkLowFreq = xmmword_1001DDF90;
    result->_issueBand[21]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[21]._downlinkLowFreq = xmmword_1001DDFA0;
    *(_OWORD *)&result->_issueBand[21]._uplinkLowFreq = xmmword_1001DDFB0;
    result->_issueBand[18]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[18]._downlinkLowFreq = xmmword_1001DDFC0;
    *(_OWORD *)&result->_issueBand[18]._uplinkLowFreq = xmmword_1001DDFD0;
    result->_issueBand[19]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[19]._downlinkLowFreq = xmmword_1001DDFE0;
    *(_OWORD *)&result->_issueBand[19]._uplinkLowFreq = xmmword_1001DDFF0;
    result->_issueBand[20]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[20]._downlinkLowFreq = xmmword_1001DE000;
    *(_OWORD *)&result->_issueBand[20]._uplinkLowFreq = xmmword_1001DE010;
    result->_issueBand[22]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[22]._downlinkLowFreq = xmmword_1001DDF20;
    *(_OWORD *)&result->_issueBand[22]._uplinkLowFreq = xmmword_1001DDF20;
    result->_issueBand[23]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[23]._downlinkLowFreq = xmmword_1001DDE30;
    *(_OWORD *)&result->_issueBand[23]._uplinkLowFreq = xmmword_1001DDE40;
    result->_issueBand[24]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[24]._downlinkLowFreq = 0u;
    *(_OWORD *)&result->_issueBand[24]._uplinkLowFreq = 0u;
    result->_issueBand[25]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[25]._downlinkLowFreq = xmmword_1001DDE70;
    *(_OWORD *)&result->_issueBand[25]._uplinkLowFreq = xmmword_1001DDE80;
    result->_issueBand[26]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[26]._downlinkLowFreq = xmmword_1001DDED0;
    *(_OWORD *)&result->_issueBand[26]._uplinkLowFreq = xmmword_1001DDEE0;
    result->_issueBand[27]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[27]._downlinkLowFreq = xmmword_1001DDDF0;
    *(_OWORD *)&result->_issueBand[27]._uplinkLowFreq = xmmword_1001DDE00;
    result->_issueBand[28]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[28]._downlinkLowFreq = xmmword_1001DDF50;
    *(_OWORD *)&result->_issueBand[28]._uplinkLowFreq = xmmword_1001DDF60;
    result->_issueBand[29]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[29]._downlinkLowFreq = xmmword_1001DDF80;
    *(_OWORD *)&result->_issueBand[29]._uplinkLowFreq = xmmword_1001DDF90;
    result->_issueBand[30]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[30]._downlinkLowFreq = xmmword_1001DDFC0;
    *(_OWORD *)&result->_issueBand[30]._uplinkLowFreq = xmmword_1001DDFD0;
    result->_issueBand[31]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[31]._downlinkLowFreq = xmmword_1001DDFE0;
    *(_OWORD *)&result->_issueBand[31]._uplinkLowFreq = xmmword_1001DDFF0;
    result->_issueBand[32]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[32]._downlinkLowFreq = xmmword_1001DDF10;
    *(_OWORD *)&result->_issueBand[32]._uplinkLowFreq = xmmword_1001DDF10;
    result->_issueBand[33]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[33]._downlinkLowFreq = xmmword_1001DDF70;
    *(_OWORD *)&result->_issueBand[33]._uplinkLowFreq = xmmword_1001DDF70;
    result->_issueBand[34]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[34]._downlinkLowFreq = xmmword_1001DDED0;
    *(_OWORD *)&result->_issueBand[34]._uplinkLowFreq = xmmword_1001DDEE0;
    result->_issueBand[35]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[35]._downlinkLowFreq = xmmword_1001DDF30;
    *(_OWORD *)&result->_issueBand[35]._uplinkLowFreq = xmmword_1001DDF30;
    result->_issueBand[36]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[36]._downlinkLowFreq = xmmword_1001DE020;
    *(_OWORD *)&result->_issueBand[36]._uplinkLowFreq = xmmword_1001DE020;
    result->_issueBand[37]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[37]._downlinkLowFreq = xmmword_1001DDF40;
    *(_OWORD *)&result->_issueBand[37]._uplinkLowFreq = xmmword_1001DDF40;
    result->_issueBand[38]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[38]._downlinkLowFreq = xmmword_1001DDF30;
    *(_OWORD *)&result->_issueBand[38]._uplinkLowFreq = xmmword_1001DDF30;
    result->_issueBand[39]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[39]._downlinkLowFreq = xmmword_1001DE000;
    *(_OWORD *)&result->_issueBand[39]._uplinkLowFreq = xmmword_1001DE010;
    result->_issueBand[40]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[40]._downlinkLowFreq = xmmword_1001DDFA0;
    *(_OWORD *)&result->_issueBand[40]._uplinkLowFreq = xmmword_1001DDFB0;
    result->_issueBand[41]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[41]._downlinkLowFreq = xmmword_1001DDFC0;
    *(_OWORD *)&result->_issueBand[41]._uplinkLowFreq = xmmword_1001DDFD0;
    result->_issueBand[42]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[42]._downlinkLowFreq = xmmword_1001DE000;
    *(_OWORD *)&result->_issueBand[42]._uplinkLowFreq = xmmword_1001DE010;
    result->_issueBand[43]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[43]._downlinkLowFreq = xmmword_1001DDF50;
    *(_OWORD *)&result->_issueBand[43]._uplinkLowFreq = xmmword_1001DDF60;
    result->_issueBand[44]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[44]._downlinkLowFreq = xmmword_1001DDF70;
    *(_OWORD *)&result->_issueBand[44]._uplinkLowFreq = xmmword_1001DDF70;
    result->_issueBand[45]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[45]._downlinkLowFreq = xmmword_1001DDEF0;
    *(_OWORD *)&result->_issueBand[45]._uplinkLowFreq = xmmword_1001DDF00;
    result->_issueBand[46]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[46]._downlinkLowFreq = xmmword_1001DDF20;
    *(_OWORD *)&result->_issueBand[46]._uplinkLowFreq = xmmword_1001DDF20;
    result->_issueBand[47]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[47]._downlinkLowFreq = xmmword_1001DDF40;
    *(_OWORD *)&result->_issueBand[47]._uplinkLowFreq = xmmword_1001DDF40;
    result->_issueBand[48]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[48]._downlinkLowFreq = xmmword_1001DDF50;
    *(_OWORD *)&result->_issueBand[48]._uplinkLowFreq = xmmword_1001DDF60;
    result->_issueBand[49]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[49]._downlinkLowFreq = xmmword_1001DDF50;
    *(_OWORD *)&result->_issueBand[49]._uplinkLowFreq = xmmword_1001DDF60;
    result->_issueBand[50]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[50]._downlinkLowFreq = xmmword_1001DE020;
    *(_OWORD *)&result->_issueBand[50]._uplinkLowFreq = xmmword_1001DE020;
    result->_issueBand[51]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[51]._uplinkLowFreq = 0u;
    *(_OWORD *)&result->_issueBand[51]._downlinkLowFreq = 0u;
    result->_issueBand[52]._bandInfoType = 35;
    *(_OWORD *)&result->_issueBand[52]._downlinkLowFreq = xmmword_1001DE030;
    *(_OWORD *)&result->_issueBand[52]._uplinkLowFreq = xmmword_1001DE030;
    result->_issueBand[53]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[53]._downlinkLowFreq = xmmword_1001DE040;
    *(_OWORD *)&result->_issueBand[53]._uplinkLowFreq = xmmword_1001DE040;
    result->_issueBand[54]._bandInfoType = 64;
    *(_OWORD *)&result->_issueBand[54]._downlinkLowFreq = xmmword_1001DE030;
    *(_OWORD *)&result->_issueBand[54]._uplinkLowFreq = xmmword_1001DE030;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  WCM_WiFiCellCoexIssue **coexIssues;
  uint64_t i;
  objc_super v6;

  v3 = 0;
  coexIssues = self->_issueBand[0]._coexIssues;
  do
  {
    for (i = 0; i != 5; ++i)

    ++v3;
    coexIssues += 10;
  }
  while (v3 != 56);
  v6.receiver = self;
  v6.super_class = (Class)WCM_WiFiCellCoexIssueBandTable;
  -[WCM_WiFiCellCoexIssueBandTable dealloc](&v6, "dealloc");
}

- (id)coexIssuesFor:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char *v9;

  v3 = *(_QWORD *)&a3;
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  if (v3 >= 0x1C)
  {
    v7 = v3 - 100;
    if ((v3 - 100) >= 0x11)
    {
      v7 = v3 - 200;
      if ((v3 - 200) >= 0xB)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("band %d does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum. Thus can not configure internal table _issueBand (which is an array of WCM_WiFiCellCoexIssueBandTableEntry type)"), v3);
        return v5;
      }
      v6 = 3608;
    }
    else
    {
      v6 = 2248;
    }
    LODWORD(v3) = v7;
  }
  else
  {
    v6 = 8;
  }
  v8 = 0;
  v9 = (char *)&self->_issueBand[v3]._uplinkHighFreq + v6;
  do
  {
    if (*(_QWORD *)&v9[v8])
      objc_msgSend(v5, "addObject:");
    v8 += 8;
  }
  while (v8 != 40);
  return v5;
}

- (BOOL)configureBy:(id *)a3
{
  const $3841E53E32AF5D71027F40AB9267CA18 *v3;
  unsigned int var0;
  BOOL result;
  __objc2_class *v6;
  const __CFString *v7;
  uint64_t v8;
  $84C6A763E70B53E0CA11881018106DD4 *issueBand;
  $84C6A763E70B53E0CA11881018106DD4 *v10;
  $84C6A763E70B53E0CA11881018106DD4 *v11;
  __objc2_class **p_superclass;
  __objc2_class **v13;
  $84C6A763E70B53E0CA11881018106DD4 *v14;
  BOOL v15;
  unsigned int v16;
  uint64_t v17;
  WCM_WiFiCellCoexIssue *v18;
  unsigned int v19;
  int var1;
  WCM_WiFiCellCoexIssue *v22;
  uint64_t v23;
  const char *v24;
  char **v25;
  uint64_t v26;
  const char *v27;
  unsigned int v28;
  uint64_t v29;
  const char *v30;
  char **v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  unint64_t var23;
  uint64_t v36;
  $84C6A763E70B53E0CA11881018106DD4 *v37;
  $84C6A763E70B53E0CA11881018106DD4 *v38;
  $84C6A763E70B53E0CA11881018106DD4 *v39;

  if (!a3)
  {
    v6 = WCM_Logging;
    v7 = CFSTR("pConfigTable = NULL");
LABEL_61:
    -[__objc2_class logLevel:message:](v6, "logLevel:message:", 0, v7, v34, var23, v36);
    return 0;
  }
  v3 = a3;
  var0 = a3->var0;
  if (a3->var0 > 0xD2u)
    return 1;
  v8 = 0;
  issueBand = self->_issueBand;
  v10 = &self->_issueBand[45];
  v11 = &self->_issueBand[28];
  p_superclass = WRM_SCService.superclass;
  while (1)
  {
    if (v3->var1 >= 0xFu)
    {
      objc_msgSend(p_superclass + 279, "logLevel:message:", 0, CFSTR("pConfigTable[%d] has invalid _issueType(%d)"), v8, v3->var1, v36);
      return 0;
    }
    if (v3->var3 > 0xFu || v3->var4 > 0xFu || v3->var5 > 0xFu || v3->var6 >= 0x10u)
    {
      objc_msgSend(p_superclass + 279, "logLevel:message:", 0, CFSTR("pConfigTable[%d] has invalid antenna bitmaps"), v8, var23, v36);
      return 0;
    }
    if (v3->var7 > 0xFu
      || v3->var8 > 0xFu
      || v3->var9 > 0xFu
      || v3->var10 > 0xFu
      || v3->var11 > 0xFu
      || v3->var12 > 0xFu
      || v3->var13 > 0xFu
      || v3->var14 > 0xFu
      || v3->var15 > 0xFu
      || v3->var16 > 0xFu
      || v3->var17 > 0xFu
      || v3->var18 > 0xFu
      || v3->var19 > 0xFu
      || v3->var20 > 0xFu
      || v3->var21 > 0xFu
      || v3->var22 >= 0x10u)
    {
      objc_msgSend(p_superclass + 279, "logLevel:message:", 0, CFSTR("pConfigTable[%d] has invalid V2 antenna bitmaps"), v8, var23, v36);
      return 0;
    }
    if (v3->var23 >= 0x1F)
    {
      v6 = (__objc2_class *)(p_superclass + 279);
      v34 = v8;
      var23 = v3->var23;
      v7 = CFSTR("pConfigTable[%d] has invalid _cellTxPowerLimit(%llu)");
      goto LABEL_61;
    }
    v38 = v10;
    v39 = issueBand;
    v37 = v11;
    if (var0 > 0x1B)
    {
      if (var0 - 100 > 0x10)
      {
        v15 = var0 >= 0xC8;
        v16 = var0 - 200;
        v13 = p_superclass;
        if (v15)
        {
          v14 = &v10[v16];
        }
        else
        {
          objc_msgSend(p_superclass + 279, "logLevel:message:", 0, CFSTR("pConfigTable->_issueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum. Thus can not configure internal table _issueBand (which is an array of WCM_WiFiCellCoexIssueBandTableEntry type). pConfigTable->_issueBand is wrong with the Coex Table plist file at row pConfigTable[%d]"), v8);
          v14 = issueBand;
        }
      }
      else
      {
        v13 = p_superclass;
        v14 = &v11[var0 - 100];
      }
    }
    else
    {
      v13 = p_superclass;
      v14 = &issueBand[var0];
    }
    v17 = 0;
    while (1)
    {
      v18 = v14->_coexIssues[v17];
      if (!v18)
        break;
      v19 = -[WCM_WiFiCellCoexIssue issueType](v18, "issueType");
      var1 = v3->var1;
      if (v19 == var1 && (var1 & 0xFFFFFFFE) != 12)
      {
        objc_msgSend(v13 + 279, "logLevel:message:", 0, CFSTR("There is a higher priority WCM_WiFiCellCoexIssue with the same issue type as pConfigTable[%d]"), v8, var23, v36);
        return 0;
      }
      if (++v17 == 5)
      {
        objc_msgSend(v13 + 279, "logLevel:message:", 0, CFSTR("There is no slot left for pConfigTable[%d]"), v8, var23, v36);
        return 0;
      }
    }
    v22 = -[WCM_WiFiCellCoexIssue initWithCoexIssueConfig:]([WCM_WiFiCellCoexIssue alloc], "initWithCoexIssueConfig:", v3);
    if (!v22)
      break;
    v14->_coexIssues[v17] = v22;
    v23 = v3->var0;
    v24 = "<ISSUE_BAND_INVALID: beyond the range>";
    p_superclass = v13;
    if (v23 <= 0xD2)
    {
      if (v23 >= 0xC8)
      {
        v25 = &off_100203910[(v23 - 200)];
LABEL_52:
        v24 = *v25;
        goto LABEL_53;
      }
      if ((v23 - 100) <= 0x10)
      {
        v25 = &off_100203888[(v23 - 100)];
        goto LABEL_52;
      }
      v24 = "<ISSUE_BAND_INVALID: Negative number.>";
      if (v23 <= 0x1B)
      {
        v25 = &off_1002037A8[v23];
        goto LABEL_52;
      }
    }
LABEL_53:
    v26 = v3->var1;
    v27 = "<ISSUE_TYPE_INVALID>";
    if (v26 <= 0xE)
      v27 = off_100203990[v26];
    objc_msgSend(v13 + 279, "logLevel:message:", 3, CFSTR("\tconfigure %s with %s at %s"), v24, v27, off_100203968[v17]);
    v8 = (v8 + 1);
    v28 = v3[1].var0;
    ++v3;
    var0 = v28;
    result = 1;
    v10 = v38;
    issueBand = v39;
    v11 = v37;
    if (v28 > 0xD2)
      return result;
  }
  v29 = v3->var0;
  if (v29 > 0xD2)
  {
    v30 = "<ISSUE_BAND_INVALID: beyond the range>";
    goto LABEL_70;
  }
  if (v29 >= 0xC8)
  {
    v31 = &off_100203910[(v29 - 200)];
    goto LABEL_69;
  }
  if ((v29 - 100) <= 0x10)
  {
    v31 = &off_100203888[(v29 - 100)];
    goto LABEL_69;
  }
  if (v29 > 0x1B)
  {
    v30 = "<ISSUE_BAND_INVALID: Negative number.>";
  }
  else
  {
    v31 = &off_1002037A8[v29];
LABEL_69:
    v30 = *v31;
  }
LABEL_70:
  v32 = v3->var1;
  if (v32 <= 0xE)
    v33 = off_100203990[v32];
  else
    v33 = "<ISSUE_TYPE_INVALID>";
  objc_msgSend(v13 + 279, "logLevel:message:", 1, CFSTR("\tskip invliad configuration pConfigTable[%d]: %s - %s"), v8, v30, v33);
  return 0;
}

- (id)findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(int)a8 gpsRadioActive:(BOOL)a9 wifiAntennaConstraint:(BOOL *)a10 cellTxPowerConstraint:(BOOL *)a11
{
  _BOOL8 v13;
  uint64_t v14;
  unsigned int v21;
  unsigned int v22;
  id v23;
  void *v24;
  char *v25;
  unsigned int *v26;
  $84C6A763E70B53E0CA11881018106DD4 *issueBand;
  $84C6A763E70B53E0CA11881018106DD4 *v28;
  unint64_t v29;
  uint64_t v30;
  $84C6A763E70B53E0CA11881018106DD4 *v31;
  $84C6A763E70B53E0CA11881018106DD4 *v32;
  double uplinkHighFreq;
  const char *v34;
  const __CFString *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  char **v42;
  const char **v43;
  uint64_t v44;
  WCM_WiFiCellCoexIssue *v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  const char *v51;
  unsigned int v52;
  const char *v53;
  const char *v54;
  unsigned int v55;
  unsigned int *v56;
  BOOL *v57;
  BOOL *v58;
  char *v59;

  v13 = a9;
  v14 = *(_QWORD *)&a8;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Try to find WiFi antenna or Cell Tx power constraints for bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) wifiChannel(%d) gpsRadioActive(%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9);
  if ((v14 - 1) >= 0xD)
  {
    if ((int)v14 >= 174)
    {
      v36 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
      v37 = 999;
      v38 = 999;
      v39 = 0;
      v40 = 0;
      goto LABEL_45;
    }
    v57 = a10;
    v58 = a11;
    v22 = 116;
    v21 = 100;
  }
  else
  {
    v57 = a10;
    v58 = a11;
    v21 = 0;
    v22 = 27;
  }
  v23 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
  v24 = v23;
  if (v23)
    objc_msgSend(v23, "initLTECoexMetrics");
  v25 = (char *)objc_msgSend(v24, "getLTECoexMetrics");
  v26 = (unsigned int *)(v25 + 8);
  v59 = v25;
  if (v25)
  {
    *(int32x2_t *)v26 = vdup_n_s32(0x3E7u);
    *((_WORD *)v25 + 8) = 0;
  }
  if (v21 > v22)
  {
LABEL_27:
    v35 = CFSTR("No matching issue band found");
LABEL_41:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v35);
    v49 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntSelStatsAWDStats"));
    v45 = 0;
    if (!v59 || !v49)
      return v45;
    if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration")))return 0;
    v36 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
    v37 = *v26;
    v38 = v26[1];
    v39 = *((unsigned __int8 *)v26 + 8);
    v40 = *((unsigned __int8 *)v26 + 9);
LABEL_45:
    objc_msgSend(v36, "wRMCACoexSubmit_AntSelPolicyStates:IssueType:IsCoexBand:HasAntConstraint:", v37, v38, v39, v40);
    return 0;
  }
  v56 = (unsigned int *)(v25 + 8);
  issueBand = self->_issueBand;
  v28 = &self->_issueBand[28];
  v29 = v21;
  v30 = v22 + 1;
  v31 = &issueBand[v21];
  while (1)
  {
    v32 = v31;
    if (v29 >= 0x1C)
    {
      if (v29 < 0x64)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("thisIssueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum."));
        v32 = issueBand;
      }
      else
      {
        v32 = &v28[(v29 - 100)];
      }
    }
    if ((v32->_bandInfoType & a3) != 0
      && v32->_downlinkLowFreq <= a4
      && v32->_downlinkHighFreq >= a5
      && v32->_uplinkLowFreq <= a6)
    {
      uplinkHighFreq = v32->_uplinkHighFreq;
      if (v59 && uplinkHighFreq >= a7)
      {
        v26 = v56;
        *v56 = v29;
        *((_BYTE *)v56 + 8) = 1;
        LODWORD(v30) = v29;
        goto LABEL_25;
      }
      if (uplinkHighFreq >= a7)
        break;
    }
    ++v29;
    ++v31;
    if (v30 == v29)
    {
      v32 = 0;
      goto LABEL_24;
    }
  }
  LODWORD(v30) = v29;
LABEL_24:
  v26 = v56;
  if (!v32)
    goto LABEL_27;
LABEL_25:
  if (v30 > 0xD2)
  {
    v34 = "<ISSUE_BAND_INVALID: beyond the range>";
    goto LABEL_35;
  }
  v41 = v30 - 200;
  if (v30 >= 0xC8)
  {
    v42 = off_100203910;
LABEL_33:
    v43 = (const char **)&v42[v41];
LABEL_34:
    v34 = *v43;
    goto LABEL_35;
  }
  v41 = v30 - 100;
  if ((v30 - 100) <= 0x10)
  {
    v42 = off_100203888;
    goto LABEL_33;
  }
  if (v30 <= 0x1B)
  {
    v43 = (const char **)&off_1002037A8[v30];
    goto LABEL_34;
  }
  v34 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_35:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), v34);
  v44 = 0;
  while (1)
  {
    v45 = v32->_coexIssues[v44];
    if (!v45)
    {
LABEL_40:
      v35 = CFSTR("No constraint required");
      goto LABEL_41;
    }
    v46 = -[WCM_WiFiCellCoexIssue needWiFiAntennaConstraintOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:](v32->_coexIssues[v44], "needWiFiAntennaConstraintOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:", v14, v13, a4, a5, a6, a7);
    v47 = -[WCM_WiFiCellCoexIssue needCellTxPowerConstraintOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:](v45, "needCellTxPowerConstraintOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:", v14, v13, a4, a5, a6, a7);
    v48 = v47;
    if ((v46 & 1) != 0 || v47)
      break;
    if (++v44 == 5)
      goto LABEL_40;
  }
  if (v46)
    v51 = "WiFi antenna ";
  else
    v51 = "";
  v52 = -[WCM_WiFiCellCoexIssue issueType](v45, "issueType");
  if (v52 <= 0xE)
    v53 = off_100203990[v52];
  else
    v53 = "<ISSUE_TYPE_INVALID>";
  v54 = "Cell Tx power ";
  if (!v48)
    v54 = "";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("%s requires %s%sconstraint"), v53, v51, v54);
  *v57 = v46;
  *v58 = v48;
  if (v59)
  {
    v26[1] = -[WCM_WiFiCellCoexIssue issueType](v45, "issueType");
    *((_BYTE *)v26 + 9) = v46;
  }
  v55 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntSelStatsAWDStats"));
  if (v59
    && v55
    && objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration")))
  {
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wRMCACoexSubmit_AntSelPolicyStates:IssueType:IsCoexBand:HasAntConstraint:", *v26, v26[1], *((unsigned __int8 *)v26 + 8), *((unsigned __int8 *)v26 + 9));
  }
  return v45;
}

- (id)findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(int)a8 wifiCenterFreq:(unsigned int)a9 wifiBandwidth:(unsigned int)a10 gpsRadioActive:(BOOL)a11 wifiAntennaConstraint:(BOOL *)a12 cellTxPowerConstraint:(BOOL *)a13
{
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v24;
  unsigned int v25;
  id v26;
  void *v27;
  char *v28;
  unsigned int *v29;
  $84C6A763E70B53E0CA11881018106DD4 *v30;
  unint64_t v31;
  uint64_t v32;
  $84C6A763E70B53E0CA11881018106DD4 *v33;
  $84C6A763E70B53E0CA11881018106DD4 *v34;
  double uplinkHighFreq;
  const char *v36;
  const __CFString *v37;
  int v38;
  char **v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char **v45;
  uint64_t v46;
  WCM_WiFiCellCoexIssue **coexIssues;
  WCM_WiFiCellCoexIssue *v48;
  unsigned int v49;
  unsigned int v50;
  _BOOL4 v51;
  unsigned int v52;
  const char *v54;
  unsigned int v55;
  const char *v56;
  const char *v57;
  unsigned int v58;
  unsigned int *v59;
  BOOL *v60;
  _BOOL4 v61;
  $84C6A763E70B53E0CA11881018106DD4 *v62;
  $84C6A763E70B53E0CA11881018106DD4 *issueBand;
  char *v64;

  v14 = a11;
  v15 = *(_QWORD *)&a10;
  v16 = *(_QWORD *)&a9;
  v17 = *(_QWORD *)&a8;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFiEnh_: Try to find WiFi antenna or Cell Tx power constraints for bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf), wifiChannel(%d), wifiBandwidth(%d), wifiCenterFreq(%d), gpsRadioActive(%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a10, *(_QWORD *)&a9, a11);
  if ((v16 - 2400) >= 0x65)
  {
    if ((v16 - 5170) >= 0x29A)
    {
      if ((v16 - 5925) >= 0x4B1)
      {
        v40 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
        v41 = 999;
        v42 = 999;
        v43 = 0;
        v44 = 0;
        goto LABEL_49;
      }
      v61 = v14;
      v60 = a12;
      v25 = 210;
      v24 = 200;
    }
    else
    {
      v61 = v14;
      v60 = a12;
      v25 = 116;
      v24 = 100;
    }
  }
  else
  {
    v61 = v14;
    v60 = a12;
    v24 = 0;
    v25 = 27;
  }
  v26 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
  v27 = v26;
  if (v26)
    objc_msgSend(v26, "initLTECoexMetrics");
  v28 = (char *)objc_msgSend(v27, "getLTECoexMetrics");
  v29 = (unsigned int *)(v28 + 8);
  v64 = v28;
  if (v28)
  {
    *(int32x2_t *)v29 = vdup_n_s32(0x3E7u);
    *((_WORD *)v28 + 8) = 0;
  }
  if (v24 > v25)
  {
LABEL_31:
    v37 = CFSTR("No matching issue band found");
LABEL_45:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v37);
    v52 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntSelStatsAWDStats"));
    v48 = 0;
    if (!v64 || !v52)
      return v48;
    if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration")))return 0;
    v40 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
    v41 = *v29;
    v42 = v29[1];
    v43 = *((unsigned __int8 *)v29 + 8);
    v44 = *((unsigned __int8 *)v29 + 9);
LABEL_49:
    objc_msgSend(v40, "wRMCACoexSubmit_AntSelPolicyStates:IssueType:IsCoexBand:HasAntConstraint:", v41, v42, v43, v44);
    return 0;
  }
  v59 = (unsigned int *)(v28 + 8);
  v62 = &self->_issueBand[45];
  issueBand = self->_issueBand;
  v30 = &self->_issueBand[28];
  v31 = v24;
  v32 = v25 + 1;
  v33 = &issueBand[v24];
  while (1)
  {
    v34 = v33;
    if (v31 >= 0x1C)
    {
      if ((v31 - 100) > 0x10)
      {
        if (v31 < 0xC8)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiEnh_: thisIssueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum."));
          v34 = issueBand;
        }
        else
        {
          v34 = &v62[(v31 - 200)];
        }
      }
      else
      {
        v34 = &v30[(v31 - 100)];
      }
    }
    if ((v34->_bandInfoType & a3) != 0
      && v34->_downlinkLowFreq <= a4
      && v34->_downlinkHighFreq >= a5
      && v34->_uplinkLowFreq <= a6)
    {
      uplinkHighFreq = v34->_uplinkHighFreq;
      if (v64 && uplinkHighFreq >= a7)
      {
        v29 = v59;
        *v59 = v31;
        *((_BYTE *)v59 + 8) = 1;
        LODWORD(v32) = v31;
        goto LABEL_29;
      }
      if (uplinkHighFreq >= a7)
        break;
    }
    ++v31;
    ++v33;
    if (v32 == v31)
    {
      v34 = 0;
      goto LABEL_28;
    }
  }
  LODWORD(v32) = v31;
LABEL_28:
  v29 = v59;
  if (!v34)
    goto LABEL_31;
LABEL_29:
  if (v32 > 0xD2)
  {
    v36 = "<ISSUE_BAND_INVALID: beyond the range>";
    goto LABEL_39;
  }
  v38 = v32 - 200;
  if (v32 >= 0xC8)
  {
    v39 = off_100203910;
LABEL_37:
    v45 = (const char **)&v39[v38];
LABEL_38:
    v36 = *v45;
    goto LABEL_39;
  }
  v38 = v32 - 100;
  if ((v32 - 100) <= 0x10)
  {
    v39 = off_100203888;
    goto LABEL_37;
  }
  if (v32 <= 0x1B)
  {
    v45 = (const char **)&off_1002037A8[v32];
    goto LABEL_38;
  }
  v36 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_39:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), v36);
  v46 = 0;
  coexIssues = v34->_coexIssues;
  while (1)
  {
    v48 = coexIssues[v46];
    if (!v48)
    {
LABEL_44:
      v37 = CFSTR("No constraint required");
      goto LABEL_45;
    }
    v49 = -[WCM_WiFiCellCoexIssue needWiFiAntennaConstraintWiFiEnhOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:](coexIssues[v46], "needWiFiAntennaConstraintWiFiEnhOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:", v17, v16, v15, v61, a4, a5, a6, a7);
    v50 = -[WCM_WiFiCellCoexIssue needCellTxPowerConstraintWiFiEnhOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:](v48, "needCellTxPowerConstraintWiFiEnhOnCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:", v17, v16, v15, v61, a4, a5, a6, a7);
    v51 = v50;
    if ((v49 & 1) != 0 || v50)
      break;
    if (++v46 == 5)
      goto LABEL_44;
  }
  if (v49)
    v54 = "WiFi antenna ";
  else
    v54 = "";
  v55 = -[WCM_WiFiCellCoexIssue issueType](v48, "issueType");
  if (v55 <= 0xE)
    v56 = off_100203990[v55];
  else
    v56 = "<ISSUE_TYPE_INVALID>";
  v57 = "Cell Tx power ";
  if (!v51)
    v57 = "";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: %s requires %s%sconstraint"), v56, v54, v57);
  *v60 = v49;
  *a13 = v51;
  if (v64)
  {
    v29[1] = -[WCM_WiFiCellCoexIssue issueType](v48, "issueType");
    *((_BYTE *)v29 + 9) = v49;
  }
  v58 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntSelStatsAWDStats"));
  if (v64
    && v58
    && objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration")))
  {
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wRMCACoexSubmit_AntSelPolicyStates:IssueType:IsCoexBand:HasAntConstraint:", *v29, v29[1], *((unsigned __int8 *)v29 + 8), *((unsigned __int8 *)v29 + 9));
  }
  return v48;
}

- (id)wifiPHSChannelsToBlocklistForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v13;
  WCM_WiFiCellCoexIssue **i;
  id v15;
  uint64_t j;
  WCM_WiFiCellCoexIssue *v18;
  id v19;
  unsigned int v20;
  const char *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unsigned int v31;
  _BYTE v32[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Try to get WiFi channels to avoid on cell bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = 0;
  for (i = self->_issueBand[0]._coexIssues;
        (*(_DWORD *)(i - 5) & a3) == 0
     || *((double *)i - 4) > a4
     || *((double *)i - 3) < a5
     || *((double *)i - 2) > a6
     || *((double *)i - 1) < a7;
        i += 10)
  {
    if (++v13 == 28)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("No matching issue band found"));
      return &off_100241D00;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), off_1002037A8[v13]);
  v15 = +[NSMutableArray array](NSMutableArray, "array");
  for (j = 0; j != 5; ++j)
  {
    v18 = i[j];
    if (!v18)
      break;
    v31 = 0;
    v19 = -[WCM_WiFiCellCoexIssue wifiPHSChannelsToBlocklistForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:wifiEssentialChannel:](v18, "wifiPHSChannelsToBlocklistForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:wifiEssentialChannel:", 0, &v31, a4, a5, a6, a7);
    v20 = -[WCM_WiFiCellCoexIssue issueType](v18, "issueType");
    v21 = "<ISSUE_TYPE_INVALID>";
    if (v20 <= 0xE)
      v21 = off_100203990[v20];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi PHS channels to avoid for %s is %@"), v21, v19);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v19);
          v26 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)k);
          if ((objc_msgSend(v15, "containsObject:", v26) & 1) == 0)
            objc_msgSend(v15, "addObject:", v26);
        }
        v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v23);
    }
    if (sub_10007C264(v15) && v31)
    {
      objc_msgSend(v15, "removeObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("removed channel %d, combined channels became %@"), v31, v15);
    }
  }
  objc_msgSend(v15, "sortUsingComparator:", &stru_100203620);
  if (!objc_msgSend(v15, "count"))
    objc_msgSend(v15, "addObject:", &off_100230708);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFi PHS channels to blocklist %@"), v15);
  return v15;
}

- (id)wifiPHSChannelsToBlocklistV2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  id v13;
  double v14;
  unint64_t v15;
  double *p_downlinkHighFreq;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  int v21;
  char **v22;
  const char *v23;
  uint64_t i;
  double v25;
  id v26;
  unsigned int v27;
  const char *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  uint64_t v33;
  const char *v34;
  unsigned int v35;
  char **v36;
  const char **v37;
  uint64_t v38;
  WCM_WiFiCellCoexIssue *v39;
  id v40;
  unsigned int v41;
  const char *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *k;
  uint64_t v47;
  unsigned int v49;
  double *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  unsigned int v59;
  _BYTE v60[128];
  _BYTE v61[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("PDHLSV2: Try to get WiFi channels to avoid on cell bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = +[NSMutableArray array](NSMutableArray, "array");
  v15 = 0;
  p_downlinkHighFreq = &self->_issueBand[0]._downlinkHighFreq;
  v17 = 1;
  while (1)
  {
    if ((*(_DWORD *)(p_downlinkHighFreq - 2) & a3) != 0)
    {
      v14 = *(p_downlinkHighFreq - 1);
      if (v14 <= a4)
      {
        v14 = *p_downlinkHighFreq;
        if (*p_downlinkHighFreq >= a5)
        {
          v14 = p_downlinkHighFreq[1];
          if (v14 <= a6)
          {
            v14 = p_downlinkHighFreq[2];
            if (v14 >= a7)
              break;
          }
        }
      }
    }
    v17 = v15 < 0x1B;
    p_downlinkHighFreq += 10;
    if (++v15 == 28)
    {
      v50 = 0;
      goto LABEL_9;
    }
  }
  v50 = p_downlinkHighFreq - 2;
LABEL_9:
  v18 = (unint64_t)&self->_issueBand[28];
  v19 = -17;
  while (1)
  {
    if ((*(_DWORD *)v18 & a3) != 0)
    {
      v14 = *(double *)(v18 + 8);
      if (v14 <= a4)
      {
        v14 = *(double *)(v18 + 16);
        if (v14 >= a5)
        {
          v14 = *(double *)(v18 + 24);
          if (v14 <= a6)
          {
            v14 = *(double *)(v18 + 32);
            if (v14 >= a7)
              break;
          }
        }
      }
    }
    v18 += 80;
    if (__CFADD__(v19++, 1))
    {
      v18 = 0;
      v21 = 117;
      goto LABEL_18;
    }
  }
  v21 = v19 + 117;
LABEL_18:
  v49 = v21;
  if (v50)
  {
    if ((v15 - 100) > 0x10)
    {
      if (!v17)
      {
        v23 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_25:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("PDHLSV2: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band. Need to apply rules for %s"), v14, v23);
        for (i = 0; i != 5; ++i)
        {
          v25 = v50[i + 5];
          if (v25 == 0.0)
            break;
          v59 = 0;
          v26 = objc_msgSend(*(id *)&v25, "wifiPHSChannelsToBlocklistForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:wifiEssentialChannel:", 0, &v59, a4, a5, a6, a7);
          v27 = objc_msgSend(*(id *)&v25, "issueType");
          v28 = "<ISSUE_TYPE_INVALID>";
          if (v27 <= 0xE)
            v28 = off_100203990[v27];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("PDHLSV2: WiFi 2.4GHz PDHLS channels to avoid for %s is %@"), v28, v26);
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v30; j = (char *)j + 1)
              {
                if (*(_QWORD *)v56 != v31)
                  objc_enumerationMutation(v26);
                v33 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
                if ((objc_msgSend(v13, "containsObject:", v33) & 1) == 0)
                  objc_msgSend(v13, "addObject:", v33);
              }
              v30 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
            }
            while (v30);
          }
          if (sub_10007C264(v13) && v59)
          {
            objc_msgSend(v13, "removeObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("PDHLSV2: WiFi 2.4GHz PDHLS removed channel %d, combined channels became %@"), v59, v13);
          }
        }
        goto LABEL_42;
      }
      v22 = &off_1002037A8[v15];
    }
    else
    {
      v22 = &off_100203888[(v15 - 100)];
    }
    v23 = *v22;
    goto LABEL_25;
  }
LABEL_42:
  if (v18)
  {
    if (v49 > 0xD2)
    {
      v34 = "<ISSUE_BAND_INVALID: beyond the range>";
      goto LABEL_51;
    }
    v35 = v49 - 200;
    if (v49 < 0xC8)
    {
      v35 = v49 - 100;
      if (v49 - 100 > 0x10)
      {
        if (v49 > 0x1B)
        {
          v34 = "<ISSUE_BAND_INVALID: Negative number.>";
LABEL_51:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("PDHLSV2: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band. Need to apply rules for %s"), v14, v34);
          v38 = 0;
          while (1)
          {
            v39 = *(WCM_WiFiCellCoexIssue **)(v18 + 8 * v38 + 40);
            if (!v39)
              goto LABEL_70;
            v59 = 0;
            v40 = -[WCM_WiFiCellCoexIssue wifiChannelsToAvoidForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:wifiEssentialChannel:](v39, "wifiChannelsToAvoidForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:wifiEssentialChannel:", 1, &v59, a4, a5, a6, a7);
            v41 = -[WCM_WiFiCellCoexIssue issueType](v39, "issueType");
            v42 = "<ISSUE_TYPE_INVALID>";
            if (v41 <= 0xE)
              v42 = off_100203990[v41];
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("PDHLSV2: WiFi (FV)GHz PDHLS channels to avoid for %s is %@"), v42, v40);
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v52;
              do
              {
                for (k = 0; k != v44; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v52 != v45)
                    objc_enumerationMutation(v40);
                  v47 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k);
                  if (objc_msgSend(&off_100241D18, "containsObject:", v47)
                    && (objc_msgSend(v13, "containsObject:", v47) & 1) == 0)
                  {
                    objc_msgSend(v13, "addObject:", v47);
                  }
                }
                v44 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
              }
              while (v44);
            }
            if (sub_10007C264(v13) && v59)
            {
              objc_msgSend(v13, "removeObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("PDHLSV2: WiFi (FV)GHz PDHLS removed channel %d, combined channels became %@"), v59, v13);
            }
            if (++v38 == 5)
              goto LABEL_69;
          }
        }
        v37 = (const char **)&off_1002037A8[v49];
LABEL_50:
        v34 = *v37;
        goto LABEL_51;
      }
      v36 = off_100203888;
    }
    else
    {
      v36 = off_100203910;
    }
    v37 = (const char **)&v36[v35];
    goto LABEL_50;
  }
LABEL_69:
  if ((unint64_t)v50 | v18)
  {
LABEL_70:
    objc_msgSend(v13, "sortUsingComparator:", &stru_100203640);
    goto LABEL_73;
  }
  if (!objc_msgSend(v13, "count", v14))
    objc_msgSend(v13, "addObject:", &off_100230708);
LABEL_73:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("PDHLSV2: Overall WiFi PDHLS channels to blocklist %@"), v13);
  return v13;
}

- (BOOL)isWifiRangingProtectionEnabledForOOBCoexIssueBand:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v7;
  BOOL result;
  id *coexIssues;
  uint64_t v10;
  id v11;

  v7 = 0;
  while ((self->_issueBand[v7]._bandInfoType & a3) == 0
       || self->_issueBand[v7]._downlinkLowFreq > a4
       || self->_issueBand[v7]._downlinkHighFreq < a5
       || self->_issueBand[v7]._uplinkLowFreq > a6
       || self->_issueBand[v7]._uplinkHighFreq < a7)
  {
    if (++v7 == 28)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("No matching issue band found"), a4, a5, a6, a7);
      return 0;
    }
  }
  coexIssues = (id *)self->_issueBand[v7]._coexIssues;
  v10 = 5;
  while (1)
  {
    v11 = *coexIssues;
    if (!*coexIssues)
      break;
    if ((objc_msgSend(*coexIssues, "issueType") & 0xFFFFFFFE) == 0xC
      && objc_msgSend(v11, "enableWifiChannelAvoidance")
      && (objc_msgSend(v11, "issueType") == 12 || objc_msgSend(v11, "issueType") == 13))
    {
      return 1;
    }
    result = 0;
    ++coexIssues;
    if (!--v10)
      return result;
  }
  return 0;
}

- (id)wifiChannelsToEnableWCI2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v13;
  WCM_WiFiCellCoexIssue **i;
  id v15;
  uint64_t j;
  WCM_WiFiCellCoexIssue *v18;
  id v19;
  unsigned int v20;
  const char *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Try to get WiFi channels to enable WCI2 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = 0;
  for (i = self->_issueBand[0]._coexIssues;
        (*(_DWORD *)(i - 5) & a3) == 0
     || *((double *)i - 4) > a4
     || *((double *)i - 3) < a5
     || *((double *)i - 2) > a6
     || *((double *)i - 1) < a7;
        i += 10)
  {
    if (++v13 == 28)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("No matching issue band found"));
      return &off_100241D30;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), off_1002037A8[v13]);
  v15 = +[NSMutableArray array](NSMutableArray, "array");
  for (j = 0; j != 5; ++j)
  {
    v18 = i[j];
    if (!v18)
      break;
    v19 = -[WCM_WiFiCellCoexIssue wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:](i[j], "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7);
    if (objc_msgSend(v19, "count"))
    {
      v20 = -[WCM_WiFiCellCoexIssue issueType](v18, "issueType");
      v21 = "<ISSUE_TYPE_INVALID>";
      if (v20 <= 0xE)
        v21 = off_100203990[v20];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi channels for %s %@"), v21, v19);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v28;
        do
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(_QWORD *)v28 != v24)
              objc_enumerationMutation(v19);
            v26 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)k);
            if ((objc_msgSend(v15, "containsObject:", v26) & 1) == 0)
              objc_msgSend(v15, "addObject:", v26);
          }
          v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v23);
      }
    }
  }
  objc_msgSend(v15, "sortUsingComparator:", &stru_100203660);
  if (!objc_msgSend(v15, "count"))
    objc_msgSend(v15, "addObject:", &off_100230708);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi channels to enable WCI2 %@"), v15);
  return v15;
}

- (id)findWiFiVictimCoexIssueByCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11;
  uint64_t v13;
  uint64_t bandInfoType;
  double downlinkLowFreq;
  double downlinkHighFreq;
  double uplinkLowFreq;
  char *v18;
  char *v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  char *v27;
  uint64_t v29;
  char *v30;
  id v31;
  unsigned int v32;
  const char *v33;
  uint64_t v34;
  char *v35;
  unsigned int v36;
  const char *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  unsigned int v41;
  const char *v42;
  unsigned int v43;
  const __CFString *v44;
  id v45;
  unsigned int v46;
  id *v48;
  uint64_t v49;
  unsigned int v50;
  const char *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;

  v11 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WCI2_V2: Try to get coex issue (row in policy table) in terms of WiFi victim  bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = 0;
  while (1)
  {
    bandInfoType = self->_issueBand[v13]._bandInfoType;
    if ((bandInfoType & v11) != 0)
    {
      downlinkLowFreq = self->_issueBand[v13]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        downlinkHighFreq = self->_issueBand[v13]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          uplinkLowFreq = self->_issueBand[v13]._uplinkLowFreq;
          if (uplinkLowFreq <= a6)
          {
            v18 = (char *)self + v13 * 80;
            if (self->_issueBand[v13]._uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v13 == 28)
    {
      v19 = 0;
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf), "), bandInfoType, v11, *(_QWORD *)&downlinkLowFreq, *(_QWORD *)&a4, *(_QWORD *)&downlinkHighFreq, *(_QWORD *)&a5, *(_QWORD *)&uplinkLowFreq, *(_QWORD *)&a6, *(_QWORD *)&self->_issueBand[v13]._uplinkHighFreq, *(_QWORD *)&a7);
  v19 = v18 + 8;
LABEL_9:
  v20 = 0;
  v21 = 0;
  v22 = 100;
  while (1)
  {
    v23 = self->_issueBand[v20 + 28]._bandInfoType;
    if ((v23 & v11) != 0)
    {
      v24 = self->_issueBand[v20 + 28]._downlinkLowFreq;
      if (v24 <= a4)
      {
        v25 = self->_issueBand[v20 + 28]._downlinkHighFreq;
        if (v25 >= a5)
        {
          v26 = self->_issueBand[v20 + 28]._uplinkLowFreq;
          if (v26 <= a6)
          {
            v27 = (char *)self + v20 * 80;
            if (self->_issueBand[v20 + 28]._uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    v21 = v22++ > 0x73;
    if (++v20 == 17)
    {
      if (v19)
      {
LABEL_20:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issueBand (in terms of cellular frequency match) found only for 2.4GHz WiFi Band."));
        v29 = 0;
        v30 = v19 + 40;
        while (1)
        {
          v31 = *(id *)&v30[v29];
          if (!v31)
            break;
          if (objc_msgSend(objc_msgSend(*(id *)&v30[v29], "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7), "count"))
          {
            v32 = objc_msgSend(v31, "issueType");
            if (v32 <= 0xE)
              v33 = off_100203990[v32];
            else
              v33 = "<ISSUE_TYPE_INVALID>";
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band."), v33);
            break;
          }
          v29 += 8;
          if (v29 == 40)
          {
            v31 = 0;
            break;
          }
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d)."), objc_msgSend(v31, "issueType"), objc_msgSend(v31, "ulcaPriorityCCWiFi"));
        goto LABEL_42;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: No matching issue band (in terms of cellular frequency match) found."), v52, v54, v56, v58);
      return 0;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), v23, v11, *(_QWORD *)&v24, *(_QWORD *)&a4, *(_QWORD *)&v25, *(_QWORD *)&a5, *(_QWORD *)&v26, *(_QWORD *)&a6, *(_QWORD *)&self->_issueBand[v20 + 28]._uplinkHighFreq, *(_QWORD *)&a7);
  if (v19)
  {
    if (v21)
      goto LABEL_20;
    v34 = 0;
    v35 = v27 + 2288;
    while (1)
    {
      v31 = *(id *)&v35[v34];
      if (!v31)
        break;
      if (objc_msgSend(objc_msgSend(*(id *)&v35[v34], "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 1, a6, a7), "count"))
      {
        v36 = objc_msgSend(v31, "issueType");
        if (v36 <= 0xE)
          v37 = off_100203990[v36];
        else
          v37 = "<ISSUE_TYPE_INVALID>";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band."), v37);
        break;
      }
      v34 += 8;
      if (v34 == 40)
      {
        v31 = 0;
        break;
      }
    }
    v38 = 0;
    v39 = v19 + 40;
    while (1)
    {
      v40 = *(void **)&v39[v38];
      if (!v40)
        break;
      if (objc_msgSend(objc_msgSend(*(id *)&v39[v38], "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7), "count"))
      {
        v41 = objc_msgSend(v40, "issueType");
        if (v41 <= 0xE)
          v42 = off_100203990[v41];
        else
          v42 = "<ISSUE_TYPE_INVALID>";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band."), v42);
        break;
      }
      v38 += 8;
      if (v38 == 40)
      {
        v40 = 0;
        break;
      }
    }
    if (objc_msgSend(v40, "ulcaPriorityCCWiFi") >= 0x63
      && objc_msgSend(v31, "ulcaPriorityCCWiFi") > 0x62)
    {
      v44 = CFSTR("WCI2_V2:  CC_WiFi Priority = PRIORITY_WIFINOCONCERN(99) for both (2.4GHz and 5GHz) WiFi Bands. WiFi is not victim with current Cell Freq.");
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: WiFi Victim issue found on one of the two (2.4GHz and 5GHz) WiFi Bands. Picking the issue with higher CC_WiFi Priority."));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d)."), objc_msgSend(v40, "issueType"), objc_msgSend(v40, "ulcaPriorityCCWiFi"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d)."), objc_msgSend(v31, "issueType"), objc_msgSend(v31, "ulcaPriorityCCWiFi"));
      if (!objc_msgSend(v40, "ulcaPriorityCCWiFi")
        && !objc_msgSend(v31, "ulcaPriorityCCWiFi"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: Both coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi and coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi should be 0 here, which means neither 2.4GHz nor 5GHz WiFi is Victim. In this case, we should return nil. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d)."), objc_msgSend(v40, "issueType"), objc_msgSend(v40, "ulcaPriorityCCWiFi"), objc_msgSend(v31, "issueType"), objc_msgSend(v31, "ulcaPriorityCCWiFi"));
        return 0;
      }
      if (!objc_msgSend(v40, "ulcaPriorityCCWiFi")
        && objc_msgSend(v31, "ulcaPriorityCCWiFi"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi should be 0 here, and we should return coexIssueCCWiFi_5GHz_Temp. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d)."), objc_msgSend(v40, "issueType"), objc_msgSend(v40, "ulcaPriorityCCWiFi"), objc_msgSend(v31, "issueType"), objc_msgSend(v31, "ulcaPriorityCCWiFi"));
        return v31;
      }
      if (!objc_msgSend(v40, "ulcaPriorityCCWiFi")
        || objc_msgSend(v31, "ulcaPriorityCCWiFi"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: None of coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi and coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi should be 0 here, which means both 2.4GHz nor 5GHz WiFi are Victim. In this case, we should return the one with higher ulcaPriorityCCWiFi. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d)."), objc_msgSend(v40, "issueType"), objc_msgSend(v40, "ulcaPriorityCCWiFi"), objc_msgSend(v31, "issueType"), objc_msgSend(v31, "ulcaPriorityCCWiFi"));
        v43 = objc_msgSend(v40, "ulcaPriorityCCWiFi");
        if (v43 < objc_msgSend(v31, "ulcaPriorityCCWiFi"))
          return v40;
        return v31;
      }
      v45 = objc_msgSend(v40, "issueType");
      v46 = objc_msgSend(v40, "ulcaPriorityCCWiFi");
      v57 = objc_msgSend(v31, "issueType");
      v59 = objc_msgSend(v31, "ulcaPriorityCCWiFi");
      v53 = v45;
      v55 = v46;
      v44 = CFSTR("WCI2_V2: CC2UnitTest: coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi should be 0 here, and we should return coexIssueCCWiFi_Temp. Fact check: coexIssueCCWiFi_Temp.issueType = %d, coexIssueCCWiFi_Temp.ulcaPriorityCCWiFi=(%d). coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d).");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v44, v53, v55, v57, v59);
    return v40;
  }
  v48 = (id *)(v27 + 2288);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issueBand (in terms of cellular frequency match) found only for 5GHz WiFi Band."));
  v49 = 5;
  while (1)
  {
    v31 = *v48;
    if (!*v48)
      break;
    if (objc_msgSend(objc_msgSend(*v48, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 1, a6, a7), "count"))
    {
      v50 = objc_msgSend(v31, "issueType");
      if (v50 <= 0xE)
        v51 = off_100203990[v50];
      else
        v51 = "<ISSUE_TYPE_INVALID>";
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issueType (%s) found only for 5GHz WiFi Band."), v51);
      break;
    }
    ++v48;
    if (!--v49)
    {
      v31 = 0;
      break;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: CC2UnitTest: coexIssueCCWiFi_5GHz_Temp.issueType = %d, coexIssueCCWiFi_5GHz_Temp.ulcaPriorityCCWiFi=(%d)."), objc_msgSend(v31, "issueType"), objc_msgSend(v31, "ulcaPriorityCCWiFi"));
LABEL_42:
  if (!objc_msgSend(v31, "ulcaPriorityCCWiFi"))
    return 0;
  return v31;
}

- (BOOL)coexBandCheckBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v13;
  $84C6A763E70B53E0CA11881018106DD4 *v14;
  double *p_uplinkHighFreq;
  BOOL v16;
  unint64_t i;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("NewCoexBandCheck-- Checking if the following cell freq match a row in policy table: bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = 0;
  while ((self->_issueBand[v13]._bandInfoType & a3) == 0
       || self->_issueBand[v13]._downlinkLowFreq > a4
       || self->_issueBand[v13]._downlinkHighFreq < a5
       || self->_issueBand[v13]._uplinkLowFreq > a6
       || self->_issueBand[v13]._uplinkHighFreq < a7)
  {
    if (++v13 == 28)
    {
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = &self->_issueBand[v13];
LABEL_9:
  p_uplinkHighFreq = &self->_issueBand[28]._uplinkHighFreq;
  v16 = 1;
  for (i = 100; i != 117; ++i)
  {
    if ((*(_DWORD *)(p_uplinkHighFreq - 4) & a3) != 0
      && *(p_uplinkHighFreq - 3) <= a4
      && *(p_uplinkHighFreq - 2) >= a5
      && *(p_uplinkHighFreq - 1) <= a6
      && *p_uplinkHighFreq >= a7)
    {
      break;
    }
    v16 = i < 0x74;
    p_uplinkHighFreq += 10;
  }
  return v14 != 0 || v16;
}

- (id)wifiChannelsToEnableWCI2V2ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatch:(BOOL *)a8
{
  uint64_t v13;
  id v15;
  uint64_t v16;
  uint64_t bandInfoType;
  double downlinkLowFreq;
  double downlinkHighFreq;
  double uplinkLowFreq;
  char *v21;
  double uplinkHighFreq;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  char *v29;
  double v30;
  unint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  unsigned int v35;
  const char *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  uint64_t v41;
  uint64_t k;
  void *v43;
  id v44;
  unsigned int v45;
  const char *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *m;
  uint64_t v51;
  char v52;
  _BYTE *v53;
  BOOL *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];

  v13 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WCI2_V2: Try to get WiFi channels to enable WCI2 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v15 = +[NSMutableArray array](NSMutableArray, "array");
  v16 = 0;
  while (1)
  {
    bandInfoType = self->_issueBand[v16]._bandInfoType;
    if ((bandInfoType & v13) != 0)
    {
      downlinkLowFreq = self->_issueBand[v16]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        downlinkHighFreq = self->_issueBand[v16]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          uplinkLowFreq = self->_issueBand[v16]._uplinkLowFreq;
          if (uplinkLowFreq <= a6)
          {
            v21 = (char *)self + v16 * 80;
            uplinkHighFreq = self->_issueBand[v16]._uplinkHighFreq;
            if (uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v16 == 28)
    {
      v23 = 0;
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_: pIssueBandMatched: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), bandInfoType, v13, *(_QWORD *)&downlinkLowFreq, *(_QWORD *)&a4, *(_QWORD *)&downlinkHighFreq, *(_QWORD *)&a5, *(_QWORD *)&uplinkLowFreq, *(_QWORD *)&a6, *(_QWORD *)&uplinkHighFreq, *(_QWORD *)&a7);
  v23 = (unint64_t)(v21 + 8);
LABEL_9:
  v24 = 0;
  v55 = a8;
  while (1)
  {
    v25 = self->_issueBand[v24 + 28]._bandInfoType;
    if ((v25 & v13) != 0)
    {
      v26 = self->_issueBand[v24 + 28]._downlinkLowFreq;
      if (v26 <= a4)
      {
        v27 = self->_issueBand[v24 + 28]._downlinkHighFreq;
        if (v27 >= a5)
        {
          v28 = self->_issueBand[v24 + 28]._uplinkLowFreq;
          if (v28 <= a6)
          {
            v29 = (char *)self + v24 * 80;
            v30 = self->_issueBand[v24 + 28]._uplinkHighFreq;
            if (v30 >= a7)
              break;
          }
        }
      }
    }
    if (++v24 == 17)
    {
      v31 = 0;
      if (!v23)
        goto LABEL_32;
      goto LABEL_17;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_: pIssueBandMatched_5GHz: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), v25, v13, *(_QWORD *)&v26, *(_QWORD *)&a4, *(_QWORD *)&v27, *(_QWORD *)&a5, *(_QWORD *)&v28, *(_QWORD *)&a6, *(_QWORD *)&v30, *(_QWORD *)&a7);
  v31 = (unint64_t)(v29 + 2248);
  if (!v23)
    goto LABEL_32;
LABEL_17:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."));
  for (i = 0; i != 5; ++i)
  {
    v33 = *(void **)(v23 + 8 * i + 40);
    if (v33)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_: coexIssue.issueType is %d and the priority p = %d"), objc_msgSend(v33, "issueType"), i);
      v34 = objc_msgSend(v33, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7);
      if (objc_msgSend(v34, "count"))
      {
        v35 = objc_msgSend(v33, "issueType");
        v36 = "<ISSUE_TYPE_INVALID>";
        if (v35 <= 0xE)
          v36 = off_100203990[v35];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCI2_V2: WiFi channels for %s %@"), v36, v34);
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v38; j = (char *)j + 1)
            {
              if (*(_QWORD *)v61 != v39)
                objc_enumerationMutation(v34);
              v41 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v15, "containsObject:", v41) & 1) == 0)
                objc_msgSend(v15, "addObject:", v41);
            }
            v38 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
          }
          while (v38);
        }
      }
    }
  }
LABEL_32:
  if (v31)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."));
    for (k = 0; k != 5; ++k)
    {
      v43 = *(void **)(v31 + 8 * k + 40);
      if (v43)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_: coexIssue_5GHz.issueType is %d and the priority p = %d"), objc_msgSend(v43, "issueType"), k);
        v44 = objc_msgSend(v43, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 1, a6, a7);
        if (objc_msgSend(v44, "count"))
        {
          v45 = objc_msgSend(v43, "issueType");
          v46 = "<ISSUE_TYPE_INVALID>";
          if (v45 <= 0xE)
            v46 = off_100203990[v45];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCI2_V2: WiFi channels for %s %@"), v46, v44);
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v47 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v57;
            do
            {
              for (m = 0; m != v48; m = (char *)m + 1)
              {
                if (*(_QWORD *)v57 != v49)
                  objc_enumerationMutation(v44);
                v51 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)m);
                if (objc_msgSend(&off_100241D48, "containsObject:", v51)
                  && (objc_msgSend(v15, "containsObject:", v51) & 1) == 0)
                {
                  objc_msgSend(v15, "addObject:", v51);
                }
              }
              v48 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
            }
            while (v48);
          }
        }
      }
    }
  }
  if (v23 | v31)
  {
    objc_msgSend(v15, "sortUsingComparator:", &stru_100203680);
    v52 = 1;
    v53 = v55;
  }
  else
  {
    v53 = v55;
    if (!objc_msgSend(v15, "count"))
      objc_msgSend(v15, "addObject:", &off_100230708);
    v52 = 0;
  }
  *v53 = v52;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi channels to enable WCI2_V2 %@"), v15);
  return v15;
}

- (id)wifiChannelsToEnableWCI2WiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatch:(BOOL *)a8
{
  uint64_t v13;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t bandInfoType;
  double downlinkLowFreq;
  double downlinkHighFreq;
  double uplinkLowFreq;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  char *v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  id v38;
  unsigned int v39;
  const char *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  void *v48;
  id v49;
  unsigned int v50;
  const char *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *m;
  uint64_t v56;
  uint64_t n;
  char *v58;
  void *v59;
  id v60;
  unsigned int v61;
  const char *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *ii;
  uint64_t v67;
  char v68;
  _BYTE *v69;
  BOOL *v71;
  char *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];

  v13 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WCI2_WiFiEnh: Try to get WiFi channels to enable WCI2 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v15 = +[NSMutableArray array](NSMutableArray, "array");
  v16 = +[NSMutableArray array](NSMutableArray, "array");
  v17 = 0;
  while (1)
  {
    bandInfoType = self->_issueBand[v17]._bandInfoType;
    if ((bandInfoType & v13) != 0)
    {
      downlinkLowFreq = self->_issueBand[v17]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        downlinkHighFreq = self->_issueBand[v17]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          uplinkLowFreq = self->_issueBand[v17]._uplinkLowFreq;
          if (uplinkLowFreq <= a6)
          {
            v22 = (char *)self + v17 * 80;
            if (self->_issueBand[v17]._uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v17 == 28)
    {
      *((_QWORD *)&v73 + 1) = 0;
      goto LABEL_9;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 2G Part: pIssueBandMatched: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), bandInfoType, v13, *(_QWORD *)&downlinkLowFreq, *(_QWORD *)&a4, *(_QWORD *)&downlinkHighFreq, *(_QWORD *)&a5, *(_QWORD *)&uplinkLowFreq, *(_QWORD *)&a6, *(_QWORD *)&self->_issueBand[v17]._uplinkHighFreq, *(_QWORD *)&a7);
  *((_QWORD *)&v73 + 1) = v22 + 8;
LABEL_9:
  v23 = 0;
  while (1)
  {
    v24 = self->_issueBand[v23 + 28]._bandInfoType;
    if ((v24 & v13) != 0)
    {
      v25 = self->_issueBand[v23 + 28]._downlinkLowFreq;
      if (v25 <= a4)
      {
        v26 = self->_issueBand[v23 + 28]._downlinkHighFreq;
        if (v26 >= a5)
        {
          v27 = self->_issueBand[v23 + 28]._uplinkLowFreq;
          if (v27 <= a6)
          {
            v28 = (char *)self + v23 * 80;
            if (self->_issueBand[v23 + 28]._uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v23 == 17)
    {
      *(_QWORD *)&v73 = 0;
      goto LABEL_17;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 5G Part: pIssueBandMatched_5GHz: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), v24, v13, *(_QWORD *)&v25, *(_QWORD *)&a4, *(_QWORD *)&v26, *(_QWORD *)&a5, *(_QWORD *)&v27, *(_QWORD *)&a6, *(_QWORD *)&self->_issueBand[v23 + 28]._uplinkHighFreq, *(_QWORD *)&a7);
  *(_QWORD *)&v73 = v28 + 2248;
LABEL_17:
  v29 = 0;
  v71 = a8;
  while (1)
  {
    v30 = self->_issueBand[v29 + 45]._bandInfoType;
    if ((v30 & v13) != 0)
    {
      v31 = self->_issueBand[v29 + 45]._downlinkLowFreq;
      if (v31 <= a4)
      {
        v32 = self->_issueBand[v29 + 45]._downlinkHighFreq;
        if (v32 >= a5)
        {
          v33 = self->_issueBand[v29 + 45]._uplinkLowFreq;
          if (v33 <= a6)
          {
            v34 = (char *)self + v29 * 80;
            if (self->_issueBand[v29 + 45]._uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v29 == 11)
    {
      v72 = 0;
      goto LABEL_25;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G Enh Part: pIssueBandMatched_Enh: pIssueBand_Enh->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_Enh->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_Enh->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_Enh->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_Enh->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), v30, v13, *(_QWORD *)&v31, *(_QWORD *)&a4, *(_QWORD *)&v32, *(_QWORD *)&a5, *(_QWORD *)&v33, *(_QWORD *)&a6, *(_QWORD *)&self->_issueBand[v29 + 45]._uplinkHighFreq, *(_QWORD *)&a7);
  v72 = v34 + 3608;
LABEL_25:
  if (*((_QWORD *)&v73 + 1))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 2G Part: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."));
    for (i = 0; i != 5; ++i)
    {
      v36 = *((_QWORD *)&v73 + 1) + 8 * i;
      v37 = *(void **)(v36 + 40);
      if (v37)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 2G Part: coexIssue.issueType is %d and the priority p = %d"), objc_msgSend(*(id *)(v36 + 40), "issueType"), i);
        v38 = objc_msgSend(v37, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7);
        if (objc_msgSend(v38, "count"))
        {
          v39 = objc_msgSend(v37, "issueType");
          v40 = "<ISSUE_TYPE_INVALID>";
          if (v39 <= 0xE)
            v40 = off_100203990[v39];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 2G Part: WiFi channels for %s %@"), v40, v38);
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v83;
            do
            {
              for (j = 0; j != v42; j = (char *)j + 1)
              {
                if (*(_QWORD *)v83 != v43)
                  objc_enumerationMutation(v38);
                v45 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)j);
                if ((objc_msgSend(v15, "containsObject:", v45) & 1) == 0)
                  objc_msgSend(v15, "addObject:", v45);
              }
              v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
            }
            while (v42);
          }
        }
      }
    }
  }
  if ((_QWORD)v73)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 5G Part: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."));
    for (k = 0; k != 5; ++k)
    {
      v47 = v73 + 8 * k;
      v48 = *(void **)(v47 + 40);
      if (v48)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 5G Part: coexIssue_5GHz.issueType is %d and the priority p = %d"), objc_msgSend(*(id *)(v47 + 40), "issueType"), k);
        v49 = objc_msgSend(v48, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 1, a6, a7);
        if (objc_msgSend(v49, "count"))
        {
          v50 = objc_msgSend(v48, "issueType");
          v51 = "<ISSUE_TYPE_INVALID>";
          if (v50 <= 0xE)
            v51 = off_100203990[v50];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh2G5G 5G Part: WiFi channels for %s %@"), v51, v49);
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v52 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v79;
            do
            {
              for (m = 0; m != v53; m = (char *)m + 1)
              {
                if (*(_QWORD *)v79 != v54)
                  objc_enumerationMutation(v49);
                v56 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)m);
                if (objc_msgSend(&off_100241D60, "containsObject:", v56)
                  && (objc_msgSend(v15, "containsObject:", v56) & 1) == 0)
                {
                  objc_msgSend(v15, "addObject:", v56);
                }
              }
              v53 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
            }
            while (v53);
          }
        }
      }
    }
  }
  if (v72)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh Enh Part: Matching issue band (in terms of cellular frequency match) found on Enh WiFi Band."));
    for (n = 0; n != 5; ++n)
    {
      v58 = &v72[8 * n];
      v59 = (void *)*((_QWORD *)v58 + 5);
      if (v59)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh Enh Part: coexIssue_Enh.issueType is %d and the priority p = %d"), objc_msgSend(*((id *)v58 + 5), "issueType"), n);
        v60 = objc_msgSend(v59, "wiFiEnhChannelsAffectedByCellUlLowFreq:cellUlHighFreq:", a6, a7);
        if (objc_msgSend(v60, "count"))
        {
          v61 = objc_msgSend(v59, "issueType");
          v62 = "<ISSUE_TYPE_INVALID>";
          if (v61 <= 0xE)
            v62 = off_100203990[v61];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh Enh Part: WiFi channels for %s %@"), v62, v60);
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v63 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
          if (v63)
          {
            v64 = v63;
            v65 = *(_QWORD *)v75;
            do
            {
              for (ii = 0; ii != v64; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v75 != v65)
                  objc_enumerationMutation(v60);
                v67 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)ii);
                if (objc_msgSend(&off_100241D78, "containsObject:", v67)
                  && (objc_msgSend(v16, "containsObject:", v67) & 1) == 0)
                {
                  objc_msgSend(v16, "addObject:", v67);
                }
              }
              v64 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
            }
            while (v64);
          }
        }
      }
    }
  }
  if (v73 == 0)
  {
    v69 = v71;
    if (!objc_msgSend(v15, "count"))
      objc_msgSend(v15, "addObject:", &off_100230708);
    v68 = 0;
  }
  else
  {
    objc_msgSend(v15, "sortUsingComparator:", &stru_1002036A0);
    v68 = 1;
    v69 = v71;
  }
  *v69 = v68;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi channels to enable WCI2_WiFiEnh2G5G is %@, combinedChannelsEnh is %@"), v15, v16);
  v86[0] = CFSTR("wifiChannels2Gand5G");
  v86[1] = CFSTR("wifiChannelsEnh");
  v87[0] = v15;
  v87[1] = v16;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
}

- (void)getCellDynamicAntBlockingIndex:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(unsigned int)a8 pissueBandMatchAntIdx:(unsigned __int16 *)a9 cellAntBlkEnableIdx1:(char *)a10 cellAntBlkEnableIdx2:(char *)a11
{
  uint64_t v13;
  uint64_t v18;
  $84C6A763E70B53E0CA11881018106DD4 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $84C6A763E70B53E0CA11881018106DD4 *v24;
  char *v25;
  void *v26;
  id v27;
  uint64_t v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  $84C6A763E70B53E0CA11881018106DD4 *v38;
  char *v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v13 = *(_QWORD *)&a8;
  v18 = *(_QWORD *)&a3;
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", *(_QWORD *)&a3, *(_QWORD *)&a8, a9), "activeCoexFeatures"), "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING")) & 1) != 0)
  {
    v39 = a10;
    v40 = a11;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ getCellDynamicAntBlockingIndex bandinfoType(0x%x) dlLowFreq = %lf, dlHighFreq = %lf, ulLowFreq = %lf, ulHighFreq = %lf, wifiChannel = %d"), v18, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, v13);
    v20 = &self->_issueBand[28];
    v21 = 100;
    while (1)
    {
      v22 = v21 - 100;
      if ((v20[v21 - 100]._bandInfoType & v18) != 0
        && v20[v22]._downlinkLowFreq <= a4
        && v20[v22]._downlinkHighFreq >= a5
        && v20[v22]._uplinkLowFreq <= a6
        && v20[v22]._uplinkHighFreq >= a7)
      {
        break;
      }
      if (++v21 == 117)
        return;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ getCellDynamicAntBlockingIndex issueBand5GHz found"));
    v23 = 0;
    v24 = &v20[v22];
    do
    {
      v25 = (char *)v24 + 8 * v23;
      v26 = (void *)*((_QWORD *)v25 + 5);
      if (v26 && objc_msgSend(*((id *)v25 + 5), "issueType"))
      {
        v27 = objc_msgSend(v26, "issueType");
        objc_msgSend(v26, "cellFrequencyLimitForOOB");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ getCellDynamicAntBlockingIndex: coexIssue_5GHz.issueType is %d and the priority p = %d, cell cutoff frequency = %lf, wifi channels count = %lu, blockIndex (%d, %d)"), v27, v23, v28, objc_msgSend(objc_msgSend(v26, "wifiChannelsToApplyCellAntBlocking"), "count"), objc_msgSend(v26, "cellAntBlkEnableIdx"), objc_msgSend(v26, "cellAntBlkEnableIdx2"));
        if (objc_msgSend(v26, "issueType") == 13)
        {
          objc_msgSend(v26, "cellFrequencyLimitForOOB");
          if (v29 < a7)
          {
            objc_msgSend(v26, "cellBandwidthLimitForOOB");
            if (a7 - a6 > v30)
            {
              v43 = 0u;
              v44 = 0u;
              v41 = 0u;
              v42 = 0u;
              v31 = objc_msgSend(v26, "wifiChannelsToApplyCellAntBlocking");
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
              if (v32)
              {
                v33 = v32;
                v34 = *(_QWORD *)v42;
                v38 = v24;
                while (2)
                {
                  for (i = 0; i != v33; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v42 != v34)
                      objc_enumerationMutation(v31);
                    v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
                    if (objc_msgSend(v36, "intValue") == (_DWORD)v13)
                    {
                      objc_msgSend(v26, "cellFrequencyLimitForOOB");
                      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ matched cutoff frequency %lf and channel %d "), v37, objc_msgSend(v36, "intValue"));
                      *v39 = objc_msgSend(v26, "cellAntBlkEnableIdx");
                      *v40 = objc_msgSend(v26, "cellAntBlkEnableIdx2");
                      return;
                    }
                  }
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
                  v24 = v38;
                  if (v33)
                    continue;
                  break;
                }
              }
            }
          }
        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("getCellDynamicAntBlockingIndex has invalid _issueType(%d)"), self, objc_msgSend(v26, "issueType"));
        }
      }
      ++v23;
    }
    while (v23 != 5);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. getCellDynamicAntBlockingIndex"));
  }
}

- (id)wifiChannelsToEnableLTEMBType7ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatchAntIdx:(unsigned __int16 *)a8
{
  id v14;
  uint64_t v15;
  $84C6A763E70B53E0CA11881018106DD4 *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  char *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  unsigned int v25;
  const char *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  char *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  const __CFString *v39;
  unsigned int v40;
  const char *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *k;
  uint64_t v46;
  $84C6A763E70B53E0CA11881018106DD4 *v48;
  $84C6A763E70B53E0CA11881018106DD4 *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  int v59;
  _BYTE v60[128];
  _BYTE v61[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("2.4GHzWiFi_Type7(extended from LTEMB only): Try to get WiFi channels to enable WCI2 Type7 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v15 = 0;
  while ((self->_issueBand[v15]._bandInfoType & a3) == 0
       || self->_issueBand[v15]._downlinkLowFreq > a4
       || self->_issueBand[v15]._downlinkHighFreq < a5
       || self->_issueBand[v15]._uplinkLowFreq > a6
       || self->_issueBand[v15]._uplinkHighFreq < a7)
  {
    if (++v15 == 28)
    {
      v16 = 0;
      goto LABEL_9;
    }
  }
  v16 = &self->_issueBand[v15];
LABEL_9:
  v17 = 0;
  while ((self->_issueBand[v17 + 28]._bandInfoType & a3) == 0
       || self->_issueBand[v17 + 28]._downlinkLowFreq > a4
       || self->_issueBand[v17 + 28]._downlinkHighFreq < a5
       || self->_issueBand[v17 + 28]._uplinkLowFreq > a6
       || self->_issueBand[v17 + 28]._uplinkHighFreq < a7)
  {
    if (++v17 == 17)
    {
      v18 = 0;
      goto LABEL_17;
    }
  }
  v18 = (unint64_t)&self->_issueBand[v17 + 28];
LABEL_17:
  v49 = v16;
  if (v16)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2.4GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."));
    for (i = 0; i != 5; ++i)
    {
      v20 = (char *)v16 + 8 * i;
      v21 = (void *)*((_QWORD *)v20 + 5);
      if (v21)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2.4GHzWiFi_Type7(extended from LTEMB only): coexIssue.issueType is %d and the priority p = %d"), objc_msgSend(*((id *)v20 + 5), "issueType"), i);
        v22 = objc_msgSend(v21, "cellAntBlkEnableIdx");
        if ((_DWORD)v22)
        {
          v23 = v22;
          v59 = 0;
          v24 = objc_msgSend(v21, "wifiChannelsToAvoidForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:wifiEssentialChannel:", 0, &v59, a4, a5, a6, a7);
          if (objc_msgSend(v24, "count"))
          {
            v25 = objc_msgSend(v21, "issueType");
            v26 = "<ISSUE_TYPE_INVALID>";
            if (v25 <= 0xE)
              v26 = off_100203990[v25];
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("2.4GHzWiFi_Type7(extended from LTEMB only): WiFi channels for %s %@"), v26, v24);
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v56;
              do
              {
                for (j = 0; j != v28; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v56 != v29)
                    objc_enumerationMutation(v24);
                  v31 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
                  if ((objc_msgSend(v14, "containsObject:", v31) & 1) == 0)
                    objc_msgSend(v14, "addObject:", v31);
                }
                v28 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
              }
              while (v28);
            }
            *a8 = (unsigned __int16)v23;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2.4GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band. *pissueBandMatchAntIdx=cellAntBlkEnableIdx(%d)"), v23);
            v16 = v49;
          }
        }
      }
    }
  }
  if (v18)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2.4GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."));
    v32 = 0;
    v33 = CFSTR("5GHzWiFi_Type7(extended from LTEMB only): coexIssue_5GHz.issueType is %d and the priority p = %d");
    v48 = ($84C6A763E70B53E0CA11881018106DD4 *)v18;
    do
    {
      v34 = (char *)(v18 + 8 * v32);
      v35 = (void *)*((_QWORD *)v34 + 5);
      if (v35)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v33, objc_msgSend(*((id *)v34 + 5), "issueType"), v32);
        v36 = objc_msgSend(v35, "cellAntBlkEnableIdx");
        if ((_DWORD)v36)
        {
          v37 = v36;
          v59 = 0;
          v38 = objc_msgSend(v35, "wifiChannelsToAvoidForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:wifiEssentialChannel:", 1, &v59, a4, a5, a6, a7);
          if (objc_msgSend(v38, "count"))
          {
            v39 = v33;
            v40 = objc_msgSend(v35, "issueType");
            v41 = "<ISSUE_TYPE_INVALID>";
            if (v40 <= 0xE)
              v41 = off_100203990[v40];
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("5GHzWiFi_Type7(extended from LTEMB only): WiFi channels for %s %@"), v41, v38);
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v52;
              do
              {
                for (k = 0; k != v43; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v52 != v44)
                    objc_enumerationMutation(v38);
                  v46 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k);
                  if (objc_msgSend(&off_100241D90, "containsObject:", v46)
                    && (objc_msgSend(v14, "containsObject:", v46) & 1) == 0)
                  {
                    objc_msgSend(v14, "addObject:", v46);
                  }
                }
                v43 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
              }
              while (v43);
            }
            *a8 = (unsigned __int16)v37;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("5GHzWiFi_Type7(extended from LTEMB only): Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band. *pissueBandMatchAntIdx=cellAntBlkEnableIdx_5GHz(%d)"), v37);
            v33 = v39;
            v18 = (unint64_t)v48;
          }
        }
      }
      ++v32;
    }
    while (v32 != 5);
  }
  if ((unint64_t)v49 | v18)
  {
    objc_msgSend(v14, "sortUsingComparator:", &stru_1002036C0);
  }
  else if (!objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "addObject:", &off_100230708);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("5GHzWiFi_Type7(extended from LTEMB only): WiFi channels to enable Type7 MSG after combining 2.4GHz and 5GHz channel lists%@"), v14);
  return v14;
}

- (id)wifiChannelsToEnableType7WiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 pissueBandMatchAntIdx:(unsigned __int16 *)a8
{
  id v15;
  void *v16;
  $84C6A763E70B53E0CA11881018106DD4 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  $84C6A763E70B53E0CA11881018106DD4 *v22;
  char *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  unsigned int v28;
  const char *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  uint64_t v34;
  unsigned __int16 *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFiType7_WiFiEnh: Try to get WiFiEnh channels to enable Type7 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v15 = +[NSMutableArray array](NSMutableArray, "array");
  v16 = v15;
  v17 = &self->_issueBand[45];
  v18 = 200;
  while (1)
  {
    v19 = v18 - 200;
    if ((v17[v18 - 200]._bandInfoType & a3) != 0
      && v17[v19]._downlinkLowFreq <= a4
      && v17[v19]._downlinkHighFreq >= a5
      && v17[v19]._uplinkLowFreq <= a6
      && v17[v19]._uplinkHighFreq >= a7)
    {
      break;
    }
    if (++v18 == 211)
    {
      if (!objc_msgSend(v15, "count"))
        objc_msgSend(v16, "addObject:", &off_100230708);
      goto LABEL_10;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiType7_WiFiEnh: Matching issue band (in terms of cellular frequency match) found on (Enh)GHz WiFi Band."));
  v21 = 0;
  v22 = &v17[v19];
  v35 = a8;
  do
  {
    v23 = (char *)v22 + 8 * v21;
    v24 = (void *)*((_QWORD *)v23 + 5);
    if (v24)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiType7_WiFiEnh: coexIssue_Enh.issueType is %d and the priority p = %d"), objc_msgSend(*((id *)v23 + 5), "issueType"), v21);
      v25 = objc_msgSend(v24, "cellAntBlkEnableIdx");
      if ((_DWORD)v25)
      {
        v26 = v25;
        v27 = objc_msgSend(v24, "wifiChannelsToAvoidWiFiEnhForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", a4, a5, a6, a7);
        if (objc_msgSend(v27, "count"))
        {
          v28 = objc_msgSend(v24, "issueType");
          v29 = "<ISSUE_TYPE_INVALID>";
          if (v28 <= 0xE)
            v29 = off_100203990[v28];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiType7_WiFiEnh: WiFi channels for %s %@"), v29, v27);
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(_QWORD *)v37 != v32)
                  objc_enumerationMutation(v27);
                v34 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(&off_100241DA8, "containsObject:", v34)
                  && (objc_msgSend(v16, "containsObject:", v34) & 1) == 0)
                {
                  objc_msgSend(v16, "addObject:", v34);
                }
              }
              v31 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            }
            while (v31);
          }
          *v35 = (unsigned __int16)v26;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiType7_WiFiEnh: Matching issue band (in terms of cellular frequency match) found on (Enh)GHz WiFi Band. *pissueBandMatchWiFiEnhType7AntIdx=cellAntBlkEnableIdx_Enh(%d)"), v26);
        }
      }
    }
    ++v21;
  }
  while (v21 != 5);
  objc_msgSend(v16, "sortUsingComparator:", &stru_1002036E0);
LABEL_10:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiType7_WiFiEnh: WiFi channels to enable Type7 MSG on Enh Band is %@"), v16);
  return v16;
}

- (id)wifi5GHzChannelsToEnableType7MSGForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  id v13;
  $84C6A763E70B53E0CA11881018106DD4 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  $84C6A763E70B53E0CA11881018106DD4 *v19;
  char *v20;
  void *v21;
  id v22;
  unsigned int v23;
  const char *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("DLDebug_: (WiFi_Type7) Try to get WiFi channels to enable WiFi_Type7 on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = +[NSMutableArray array](NSMutableArray, "array");
  v14 = &self->_issueBand[28];
  v15 = 100;
  while (1)
  {
    v16 = v15 - 100;
    if ((v14[v15 - 100]._bandInfoType & a3) != 0
      && v14[v16]._downlinkLowFreq <= a4
      && v14[v16]._downlinkHighFreq >= a5
      && v14[v16]._uplinkLowFreq <= a6
      && v14[v16]._uplinkHighFreq >= a7)
    {
      break;
    }
    if (++v15 == 117)
      goto LABEL_8;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: (WiFi_Type7) Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."));
  v18 = 0;
  v19 = &v14[v16];
  do
  {
    v20 = (char *)v19 + 8 * v18;
    v21 = (void *)*((_QWORD *)v20 + 5);
    if (v21)
    {
      v22 = objc_msgSend(*((id *)v20 + 5), "wifi5GHzChannelsAffectedByNR79UlLowFreq:cellUlHighFreq:", a6, a7);
      if (objc_msgSend(v22, "count"))
      {
        v23 = objc_msgSend(v21, "issueType");
        v24 = "<ISSUE_TYPE_INVALID>";
        if (v23 <= 0xE)
          v24 = off_100203990[v23];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("DLDebug_: (WiFi_Type7) WiFi channels for %s %@"), v24, v22);
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v27)
                objc_enumerationMutation(v22);
              v29 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(&off_100241DC0, "containsObject:", v29)
                && (objc_msgSend(v13, "containsObject:", v29) & 1) == 0)
              {
                objc_msgSend(v13, "addObject:", v29);
              }
            }
            v26 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v26);
        }
      }
    }
    ++v18;
  }
  while (v18 != 5);
  objc_msgSend(v13, "sortUsingComparator:", &stru_100203700);
LABEL_8:
  if (!objc_msgSend(v13, "count"))
    objc_msgSend(v13, "addObject:", &off_100230708);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("DLDebug_: WiFi channels to enable Type7 MSG %@"), v13);
  return v13;
}

- (id)wifi2GHzLTEB7IMD3EnableType7ForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  id v13;
  uint64_t v14;
  id *coexIssues;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("TYPE7_2GWIFI_SUPPORT_: Band7 Cell info: bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = +[NSMutableArray array](NSMutableArray, "array");
  v14 = 0;
  while ((self->_issueBand[v14]._bandInfoType & a3) == 0
       || self->_issueBand[v14]._downlinkLowFreq > a4
       || self->_issueBand[v14]._downlinkHighFreq < a5
       || self->_issueBand[v14]._uplinkLowFreq > a6
       || self->_issueBand[v14]._uplinkHighFreq < a7)
  {
    if (++v14 == 28)
      goto LABEL_8;
  }
  if (v14 == 8)
  {
    coexIssues = (id *)self->_issueBand[8]._coexIssues;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: issueBand confirmed to be B7."));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: LTE Band7 Freq match confirmed."));
    v17 = 0;
    v18 = 5;
    do
    {
      if (objc_msgSend(*coexIssues, "issueType") == 4)
      {
        v17 = *coexIssues;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: IssueType is also matched as %d"), objc_msgSend(*coexIssues, "issueType"));
      }
      ++coexIssues;
      --v18;
    }
    while (v18);
    v19 = objc_msgSend(v17, "wifiChannelsIMD3ByCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a4, a5, a6, a7);
    if (objc_msgSend(v19, "count"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: 2.4GHz WiFi channels with Type7 MSG enabled are: %@"), v19);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(&off_100241DD8, "containsObject:", v24)
              && (objc_msgSend(v13, "containsObject:", v24) & 1) == 0)
            {
              objc_msgSend(v13, "addObject:", v24);
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v21);
      }
    }
    objc_msgSend(v13, "sortUsingComparator:", &stru_100203720);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: WARNING: issueBand matched, but is NOT B7."));
  }
LABEL_8:
  if (!objc_msgSend(v13, "count"))
    objc_msgSend(v13, "addObject:", &off_100230708);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("TYPE7_2GWIFI_SUPPORT_: WiFi channels to enable Type %@"), v13);
  return v13;
}

- (BOOL)isNR79FoundForCellUlLowFreq:(double)a3 cellUlHighFreq:(double)a4
{
  return a4 < 5000.01 && a3 > 4399.99;
}

- (BOOL)isLTEB7FoundForCellDlLowFreq:(double)a3 cellDlHighFreq:(double)a4 cellUlLowFreq:(double)a5 cellUlHighFreq:(double)a6
{
  BOOL v6;

  v6 = a3 >= 2620.0;
  if (a4 > 2690.0)
    v6 = 0;
  if (a5 <= 2500.0)
    v6 = 0;
  return a6 < 2570.0 && v6;
}

- (id)wifiChannelsToDisableOCLForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  id v13;
  uint64_t v14;
  WCM_WiFiCellCoexIssue **coexIssues;
  uint64_t v16;
  Block_descriptor_3 *v17;
  WCM_WiFiCellCoexIssue **v18;
  const char **p_signature;
  uint64_t i;
  WCM_WiFiCellCoexIssue *v22;
  id v23;
  void *v24;
  unsigned int v25;
  const char *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  const char *v32;
  uint64_t k;
  WCM_WiFiCellCoexIssue *v34;
  id v35;
  void *v36;
  unsigned int v37;
  const char *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *m;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Try to get WiFi channels to disable OCL on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = +[NSMutableArray array](NSMutableArray, "array");
  v14 = 0;
  coexIssues = self->_issueBand[0]._coexIssues;
  while ((*(_DWORD *)(coexIssues - 5) & a3) == 0
       || *((double *)coexIssues - 4) > a4
       || *((double *)coexIssues - 3) < a5
       || *((double *)coexIssues - 2) > a6
       || *((double *)coexIssues - 1) < a7)
  {
    ++v14;
    coexIssues += 10;
    if (v14 == 28)
      goto LABEL_8;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), off_1002037A8[v14]);
  for (i = 0; i != 5; ++i)
  {
    v22 = coexIssues[i];
    if (!v22)
      break;
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("OclPlistInput")))v23 = -[WCM_WiFiCellCoexIssue wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:](v22, "wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:", 0, a6, a7);
    else
      v23 = -[WCM_WiFiCellCoexIssue wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:](v22, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 0, a6, a7);
    v24 = v23;
    if (objc_msgSend(v23, "count"))
    {
      v25 = -[WCM_WiFiCellCoexIssue issueType](v22, "issueType");
      v26 = "<ISSUE_TYPE_INVALID>";
      if (v25 <= 0xE)
        v26 = off_100203990[v25];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi channels for %s %@"), v26, v24);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(_QWORD *)v49 != v29)
              objc_enumerationMutation(v24);
            v31 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v13, "containsObject:", v31) & 1) == 0)
              objc_msgSend(v13, "addObject:", v31);
          }
          v28 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v28);
      }
    }
  }
LABEL_8:
  v16 = 0;
  v17 = &stru_100203AC8;
  v18 = self->_issueBand[28]._coexIssues;
  p_signature = (const char **)off_100203888;
  while ((*(_DWORD *)(v18 - 5) & a3) == 0
       || *((double *)v18 - 4) > a4
       || *((double *)v18 - 3) < a5
       || *((double *)v18 - 2) > a6
       || *((double *)v18 - 1) < a7)
  {
    v17 = (Block_descriptor_3 *)((char *)v17 + 8);
    ++v16;
    ++p_signature;
    v18 += 10;
    if (v16 == 17)
      goto LABEL_15;
  }
  if (v16 >= 0x11 && (p_signature = &v17->signature, (v16 + 100) > 0x1B))
    v32 = "<ISSUE_BAND_INVALID: Negative number.>";
  else
    v32 = *p_signature;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), v32);
  for (k = 0; k != 5; ++k)
  {
    v34 = v18[k];
    if (!v34)
      break;
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("OclPlistInput")))v35 = -[WCM_WiFiCellCoexIssue wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:](v34, "wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:", 1, a6, a7);
    else
      v35 = -[WCM_WiFiCellCoexIssue wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:](v34, "wifiChannelsAffectedByCellUlLowFreq:cellUlHighFreq:wifi5G:", 1, a6, a7);
    v36 = v35;
    if (objc_msgSend(v35, "count"))
    {
      v37 = -[WCM_WiFiCellCoexIssue issueType](v34, "issueType");
      v38 = "<ISSUE_TYPE_INVALID>";
      if (v37 <= 0xE)
        v38 = off_100203990[v37];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi channels for %s %@"), v38, v36);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v45;
        do
        {
          for (m = 0; m != v40; m = (char *)m + 1)
          {
            if (*(_QWORD *)v45 != v41)
              objc_enumerationMutation(v36);
            v43 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)m);
            if ((objc_msgSend(v13, "containsObject:", v43) & 1) == 0)
              objc_msgSend(v13, "addObject:", v43);
          }
          v40 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v40);
      }
    }
  }
LABEL_15:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFi channels to disble OCL %@"), v13);
  return v13;
}

- (id)wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t bandInfoType;
  double downlinkLowFreq;
  double downlinkHighFreq;
  double uplinkLowFreq;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  char *v34;
  double uplinkHighFreq;
  uint64_t i;
  void *v37;
  id v38;
  unsigned int v39;
  const char *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  uint64_t v45;
  uint64_t k;
  void *v47;
  id v48;
  unsigned int v49;
  const char *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *m;
  uint64_t v55;
  uint64_t n;
  void *v57;
  id v58;
  unsigned int v59;
  const char *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *ii;
  uint64_t v65;
  char *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];

  v11 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("DisableOCL_WiFiEnh: Try to get WiFi channels to disable OCL on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("OclPlistInput")) & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("OCL_PLIST_INPUT is not enabled"));
    objc_exception_throw(NSInternalInconsistencyException);
  }
  v13 = +[NSMutableArray array](NSMutableArray, "array");
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v15 = 0;
  while (1)
  {
    bandInfoType = self->_issueBand[v15]._bandInfoType;
    if ((bandInfoType & v11) != 0)
    {
      downlinkLowFreq = self->_issueBand[v15]._downlinkLowFreq;
      if (downlinkLowFreq <= a4)
      {
        downlinkHighFreq = self->_issueBand[v15]._downlinkHighFreq;
        if (downlinkHighFreq >= a5)
        {
          uplinkLowFreq = self->_issueBand[v15]._uplinkLowFreq;
          if (uplinkLowFreq <= a6)
          {
            v20 = (char *)self + v15 * 80;
            if (self->_issueBand[v15]._uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v15 == 28)
    {
      v21 = 0;
      goto LABEL_10;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 2G Part: pIssueBandMatched: pIssueBand->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), bandInfoType, v11, *(_QWORD *)&downlinkLowFreq, *(_QWORD *)&a4, *(_QWORD *)&downlinkHighFreq, *(_QWORD *)&a5, *(_QWORD *)&uplinkLowFreq, *(_QWORD *)&a6, *(_QWORD *)&self->_issueBand[v15]._uplinkHighFreq, *(_QWORD *)&a7);
  v21 = v20 + 8;
LABEL_10:
  v22 = 0;
  while (1)
  {
    v23 = self->_issueBand[v22 + 28]._bandInfoType;
    if ((v23 & v11) != 0)
    {
      v24 = self->_issueBand[v22 + 28]._downlinkLowFreq;
      if (v24 <= a4)
      {
        v25 = self->_issueBand[v22 + 28]._downlinkHighFreq;
        if (v25 >= a5)
        {
          v26 = self->_issueBand[v22 + 28]._uplinkLowFreq;
          if (v26 <= a6)
          {
            v27 = (char *)self + v22 * 80;
            if (self->_issueBand[v22 + 28]._uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v22 == 17)
    {
      v28 = 0;
      goto LABEL_18;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 5G Part: pIssueBandMatched_5GHz: pIssueBand_5GHz->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_5GHz->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_5GHz->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_5GHz->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_5GHz->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), v23, v11, *(_QWORD *)&v24, *(_QWORD *)&a4, *(_QWORD *)&v25, *(_QWORD *)&a5, *(_QWORD *)&v26, *(_QWORD *)&a6, *(_QWORD *)&self->_issueBand[v22 + 28]._uplinkHighFreq, *(_QWORD *)&a7);
  v28 = v27 + 2248;
LABEL_18:
  v29 = 0;
  while (1)
  {
    v30 = self->_issueBand[v29 + 45]._bandInfoType;
    if ((v30 & v11) != 0)
    {
      v31 = self->_issueBand[v29 + 45]._downlinkLowFreq;
      if (v31 <= a4)
      {
        v32 = self->_issueBand[v29 + 45]._downlinkHighFreq;
        if (v32 >= a5)
        {
          v33 = self->_issueBand[v29 + 45]._uplinkLowFreq;
          if (v33 <= a6)
          {
            v34 = (char *)self + v29 * 80;
            uplinkHighFreq = self->_issueBand[v29 + 45]._uplinkHighFreq;
            if (uplinkHighFreq >= a7)
              break;
          }
        }
      }
    }
    if (++v29 == 11)
    {
      v67 = 0;
      goto LABEL_26;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh Enh Part: pIssueBandMatched_Enh: pIssueBand_Enh->_bandInfoType(%d) & bandInfoType(%d) && pIssueBand_Enh->_downlinkLowFreq(%lf) <= cellDlLowFreq(%lf) && pIssueBand_Enh->_downlinkHighFreq(%lf) >= cellDlHighFreq(%lf) && pIssueBand_Enh->_uplinkLowFreq(%lf) <= cellUlLowFreq(%lf) && pIssueBand_Enh->_uplinkHighFreq(%lf) >= cellUlHighFreq(%lf)"), v30, v11, *(_QWORD *)&v31, *(_QWORD *)&a4, *(_QWORD *)&v32, *(_QWORD *)&a5, *(_QWORD *)&v33, *(_QWORD *)&a6, *(_QWORD *)&uplinkHighFreq, *(_QWORD *)&a7);
  v67 = v34 + 3608;
LABEL_26:
  if (v21)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 2G Part: Matching issue band (in terms of cellular frequency match) found on 2.4GHz WiFi Band."));
    for (i = 0; i != 5; ++i)
    {
      v37 = *(void **)&v21[8 * i + 40];
      if (v37)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 2G Part: coexIssue.issueType is %d and the priority p = %d"), objc_msgSend(v37, "issueType"), i);
        v38 = objc_msgSend(v37, "wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:", 0, a6, a7);
        if (objc_msgSend(v38, "count"))
        {
          v39 = objc_msgSend(v37, "issueType");
          v40 = "<ISSUE_TYPE_INVALID>";
          if (v39 <= 0xE)
            v40 = off_100203990[v39];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 2G Part: WiFi channels for %s %@"), v40, v38);
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v77;
            do
            {
              for (j = 0; j != v42; j = (char *)j + 1)
              {
                if (*(_QWORD *)v77 != v43)
                  objc_enumerationMutation(v38);
                v45 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)j);
                if ((objc_msgSend(v13, "containsObject:", v45) & 1) == 0)
                  objc_msgSend(v13, "addObject:", v45);
              }
              v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
            }
            while (v42);
          }
        }
      }
    }
  }
  if (v28)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 5G Part: Matching issue band (in terms of cellular frequency match) found on (FV)GHz WiFi Band."));
    for (k = 0; k != 5; ++k)
    {
      v47 = *(void **)&v28[8 * k + 40];
      if (v47)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 5G Part: coexIssue_5GHz.issueType is %d and the priority p = %d"), objc_msgSend(v47, "issueType"), k);
        v48 = objc_msgSend(v47, "wifiOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:isWifi5G:", 1, a6, a7);
        if (objc_msgSend(v48, "count"))
        {
          v49 = objc_msgSend(v47, "issueType");
          v50 = "<ISSUE_TYPE_INVALID>";
          if (v49 <= 0xE)
            v50 = off_100203990[v49];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh 5G Part: WiFi channels for %s %@"), v50, v48);
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v51 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v73;
            do
            {
              for (m = 0; m != v52; m = (char *)m + 1)
              {
                if (*(_QWORD *)v73 != v53)
                  objc_enumerationMutation(v48);
                v55 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)m);
                if (objc_msgSend(&off_100241DF0, "containsObject:", v55)
                  && (objc_msgSend(v13, "containsObject:", v55) & 1) == 0)
                {
                  objc_msgSend(v13, "addObject:", v55);
                }
              }
              v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
            }
            while (v52);
          }
        }
      }
    }
  }
  if (v67)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh Enh Part: Matching issue band (in terms of cellular frequency match) found on Enh WiFi Band."));
    for (n = 0; n != 5; ++n)
    {
      v57 = *(void **)&v67[8 * n + 40];
      if (v57)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh Enh Part: coexIssue_Enh.issueType is %d and the priority p = %d"), objc_msgSend(v57, "issueType"), n);
        v58 = objc_msgSend(v57, "wiFiEnhOclChannelsAffectedByCellUlLowFreq:cellUlHighFreq:", a6, a7);
        if (objc_msgSend(v58, "count"))
        {
          v59 = objc_msgSend(v57, "issueType");
          v60 = "<ISSUE_TYPE_INVALID>";
          if (v59 <= 0xE)
            v60 = off_100203990[v59];
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh Enh Part: WiFi channels for %s %@"), v60, v58);
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
          if (v61)
          {
            v62 = v61;
            v63 = *(_QWORD *)v69;
            do
            {
              for (ii = 0; ii != v62; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v69 != v63)
                  objc_enumerationMutation(v58);
                v65 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)ii);
                if (objc_msgSend(&off_100241E08, "containsObject:", v65)
                  && (objc_msgSend(v14, "containsObject:", v65) & 1) == 0)
                {
                  objc_msgSend(v14, "addObject:", v65);
                }
              }
              v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
            }
            while (v62);
          }
        }
      }
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("DisableOCL_WiFiEnh: WiFi channels to disable OCL combinedChannels is %@, combinedChannelsEnh is %@"), v13, v14);
  v80[0] = CFSTR("wifiChannels2Gand5G");
  v80[1] = CFSTR("wifiChannelsEnh");
  v81[0] = v13;
  v81[1] = v14;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
}

- (id)GetHFBTBandBlockedChannelMapWithCellUlHighFreq:(double)a3 cellUlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellDlLowFreq:(double)a6 gpsRadioActive:(BOOL)a7 coexIssues:(id)a8 btBandLowFreq:(double)a9 btBandHighFreq:(double)a10 btNumChannel:(int)a11
{
  uint64_t v11;
  _BOOL8 v15;
  NSArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v11 = *(_QWORD *)&a11;
  v15 = a7;
  v20 = +[NSArray array](NSArray, "array");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(a8);
        v20 = -[NSArray arrayByAddingObjectsFromArray:](v20, "arrayByAddingObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v24), "HFBTChannelsToAvoidForCellUlLowFreq:cellUlHighFreq:cellDlLowFreq:cellDlHighFreq:btBandLowFreq:btBandHighFreq:gpsRadioActive:", v15, a4, a3, a6, a5, a9, a10));
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v22);
  }
  return sub_10007C8F0(-[NSArray sortedArrayUsingComparator:](-[NSSet allObjects](+[NSSet setWithArray:](NSSet, "setWithArray:", v20), "allObjects"), "sortedArrayUsingComparator:", &stru_100203760), v11);
}

- ($9D80CDBBBAEFFE99BAD0CF9EB92C1CE3)findIssueBandForBandInfoType:(int)a3 cellDlHighFreq:(double)a4 cellDlLowFreq:(double)a5 cellUlHighFreq:(double)a6 cellUlLowFreq:(double)a7 wifiBand:(int)a8
{
  uint64_t v8;
  $9D80CDBBBAEFFE99BAD0CF9EB92C1CE3 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  Block_descriptor_3 *v13;
  unsigned int v14;
  const char **p_signature;
  const char *v17;
  char **v18;
  const char *v19;

  if (a8)
  {
    if (a8 == 1)
    {
      v12 = 0;
      v13 = &stru_100203AC8;
      v14 = 100;
      p_signature = (const char **)off_100203888;
      while ((self->_issueBand[v12 + 28]._bandInfoType & a3) == 0
           || self->_issueBand[v12 + 28]._downlinkLowFreq > a5
           || self->_issueBand[v12 + 28]._downlinkHighFreq < a4
           || self->_issueBand[v12 + 28]._uplinkLowFreq > a7
           || self->_issueBand[v12 + 28]._uplinkHighFreq < a6)
      {
        v13 = (Block_descriptor_3 *)((char *)v13 + 8);
        ++v14;
        ++p_signature;
        if (++v12 == 17)
          return 0;
      }
      v9 = ($9D80CDBBBAEFFE99BAD0CF9EB92C1CE3 *)&self->_issueBand[v12 + 28];
      if (v14 - 100 >= 0x11 && (p_signature = &v13->signature, v14 > 0x1B))
        v17 = "<ISSUE_BAND_INVALID: Negative number.>";
      else
        v17 = *p_signature;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ found match for 5G band %s"), v17);
    }
    else
    {
      if (a8 == 2)
      {
        v8 = 0;
        v9 = ($9D80CDBBBAEFFE99BAD0CF9EB92C1CE3 *)&self->_issueBand[45];
        v10 = 200;
        while ((v9->var0 & a3) == 0 || v9->var1 > a5 || v9->var2 < a4 || v9->var3 > a7 || v9->var4 < a6)
        {
          ++v8;
          ++v10;
          ++v9;
          if (v8 == 11)
            return 0;
        }
        if (v10 < 0xC8)
        {
          if (v10 - 100 > 0x10)
          {
            if (v10 > 0x1B)
            {
              v19 = "<ISSUE_BAND_INVALID: Negative number.>";
              goto LABEL_42;
            }
            v18 = &off_1002037A8[v8 + 200];
          }
          else
          {
            v18 = &off_100203888[v8 + 100];
          }
        }
        else
        {
          v18 = &off_100203910[v8];
        }
        v19 = *v18;
LABEL_42:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ found match for 6G band %s"), v19);
        return v9;
      }
      return 0;
    }
  }
  else
  {
    v11 = 0;
    while ((self->_issueBand[v11]._bandInfoType & a3) == 0
         || self->_issueBand[v11]._downlinkLowFreq > a5
         || self->_issueBand[v11]._downlinkHighFreq < a4
         || self->_issueBand[v11]._uplinkLowFreq > a7
         || self->_issueBand[v11]._uplinkHighFreq < a6)
    {
      if (++v11 == 28)
        return 0;
    }
    return ($9D80CDBBBAEFFE99BAD0CF9EB92C1CE3 *)&self->_issueBand[v11];
  }
  return v9;
}

- (id)getHFBTAFHCoexIssuesFromIssueBand:(id *)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  id *var5;
  id v7;

  v4 = objc_opt_new(NSMutableArray);
  if (a3)
  {
    v5 = 0;
    var5 = a3->var5;
    while (1)
    {
      v7 = var5[v5];
      if (!v7)
        return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4);
      if (objc_msgSend(var5[v5], "issueType") != 12 && objc_msgSend(v7, "issueType") != 13)
        break;
      if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("HFBTOOBMASKING")) & 1) != 0)goto LABEL_7;
LABEL_10:
      if (++v5 == 5)
        return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4);
    }
    if (objc_msgSend(v7, "btDiversityBlocklistTypeForC0B1") != 3
      || objc_msgSend(v7, "btChannelsToAvoidForC0B1"))
    {
      goto LABEL_10;
    }
LABEL_7:
    -[NSMutableArray addObject:](v4, "addObject:", v7);
    goto LABEL_10;
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4);
}

- (id)getWifiDesensedCoexIssueFromIssueBand:(id *)a3
{
  uint64_t v3;
  id *var5;
  id v5;

  if (!a3)
    return 0;
  v3 = 0;
  var5 = a3->var5;
  while (1)
  {
    v5 = var5[v3];
    if (!v5 || objc_msgSend(var5[v3], "enableWifiChannelAvoidance"))
      break;
    if (++v3 == 5)
      return 0;
  }
  return v5;
}

- (id)HFBTAntBlockingBandsFromWiFiConfigForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];

  v11 = *(_QWORD *)&a3;
  v13 = objc_msgSend(&off_100248810, "mutableCopy");
  v14 = -[WCM_WiFiCellCoexIssueBandTable getWifiDesensedCoexIssueFromIssueBand:](self, "getWifiDesensedCoexIssueFromIssueBand:", -[WCM_WiFiCellCoexIssueBandTable findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:](self, "findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:", v11, 1, a5, a4, a7, a6));
  if (v14)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100087E78;
    v18[3] = &unk_100203788;
    v18[4] = v13;
    objc_msgSend(objc_msgSend(v14, "HFBTAntBlkBandsForCellUlLowFreq:cellUlHighFreq:", a6, a7), "enumerateKeysAndObjectsUsingBlock:", v18);
  }
  v15 = -[WCM_WiFiCellCoexIssueBandTable getWifiDesensedCoexIssueFromIssueBand:](self, "getWifiDesensedCoexIssueFromIssueBand:", -[WCM_WiFiCellCoexIssueBandTable findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:](self, "findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:", v11, 2, a5, a4, a7, a6));
  if (v15)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100087ED4;
    v17[3] = &unk_100203788;
    v17[4] = v13;
    objc_msgSend(objc_msgSend(v15, "HFBTAntBlkBandsForCellUlLowFreq:cellUlHighFreq:", a6, a7), "enumerateKeysAndObjectsUsingBlock:", v17);
  }
  return v13;
}

- (id)HFBTPreferredChannelMapForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v13;
  id v15;
  id v16;
  NSMutableData *v17;
  id v18;
  NSMutableData *v19;

  v8 = a8;
  v13 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ Try to get preferred channel map on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) "), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v15 = +[NSMutableData data](NSMutableData, "data");
  v16 = -[WCM_WiFiCellCoexIssueBandTable getHFBTAFHCoexIssuesFromIssueBand:](self, "getHFBTAFHCoexIssuesFromIssueBand:", -[WCM_WiFiCellCoexIssueBandTable findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:](self, "findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:", v13, 1, a5, a4, a7, a6));
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v15, "appendData:", -[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v16, 101, a7, a6, a5, a4, 5150.0, 5250.0));
    v17 = -[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v16, 126, a7, a6, a5, a4, 5725.0, 5850.0);
  }
  else
  {
    objc_msgSend(v15, "appendData:", sub_10007C8F0(+[NSMutableArray array](NSMutableArray, "array"), 101));
    v17 = sub_10007C8F0(+[NSMutableArray array](NSMutableArray, "array"), 126);
  }
  objc_msgSend(v15, "appendData:", v17);
  v18 = -[WCM_WiFiCellCoexIssueBandTable getHFBTAFHCoexIssuesFromIssueBand:](self, "getHFBTAFHCoexIssuesFromIssueBand:", -[WCM_WiFiCellCoexIssueBandTable findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:](self, "findIssueBandForBandInfoType:cellDlHighFreq:cellDlLowFreq:cellUlHighFreq:cellUlLowFreq:wifiBand:", v13, 2, a5, a4, a7, a6));
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v15, "appendData:", -[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v18, 125, a7, a6, a5, a4, 5925.0, 6050.0));
    objc_msgSend(v15, "appendData:", -[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v18, 125, a7, a6, a5, a4, 6051.0, 6175.0));
    objc_msgSend(v15, "appendData:", -[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v18, 125, a7, a6, a5, a4, 6176.0, 6300.0));
    v19 = -[WCM_WiFiCellCoexIssueBandTable GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:](self, "GetHFBTBandBlockedChannelMapWithCellUlHighFreq:cellUlLowFreq:cellDlHighFreq:cellDlLowFreq:gpsRadioActive:coexIssues:btBandLowFreq:btBandHighFreq:btNumChannel:", v8, v18, 125, a7, a6, a5, a4, 6301.0, 6425.0);
  }
  else
  {
    objc_msgSend(v15, "appendData:", sub_10007C8F0(+[NSMutableArray array](NSMutableArray, "array"), 125));
    objc_msgSend(v15, "appendData:", sub_10007C8F0(+[NSMutableArray array](NSMutableArray, "array"), 125));
    objc_msgSend(v15, "appendData:", sub_10007C8F0(+[NSMutableArray array](NSMutableArray, "array"), 125));
    v19 = sub_10007C8F0(+[NSMutableArray array](NSMutableArray, "array"), 125);
  }
  objc_msgSend(v15, "appendData:", v19);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ preferred channel map %@"), v15);
  if (objc_msgSend(v15, "length") != (id)96)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("HFAFHDebug_ Wrong map length"));
    objc_exception_throw(NSInternalInconsistencyException);
  }
  return v15;
}

- (id)btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8 maxChannelsToAvoidForCellOOB:(int)a9
{
  uint64_t v9;
  _BOOL8 v10;
  id v17;
  uint64_t v18;
  $84C6A763E70B53E0CA11881018106DD4 *issueBand;
  NSMutableData *v20;
  unint64_t v22;
  unint64_t v23;
  WCM_WiFiCellCoexIssue *v24;
  id v25;
  char *v26;
  unsigned int v27;
  id v29;
  id v30;
  unsigned int v31;
  const char *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  $84C6A763E70B53E0CA11881018106DD4 *v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v9 = *(_QWORD *)&a9;
  v10 = a8;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Try to get BT preferred channel map on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) gpsRadioActive(%d) maxChannelsToAvoidForCellOOB(%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, *(_QWORD *)&a9);
  v17 = +[NSMutableArray array](NSMutableArray, "array");
  v18 = 0;
  issueBand = self->_issueBand;
  while ((issueBand[v18]._bandInfoType & a3) == 0
       || issueBand[v18]._downlinkLowFreq > a4
       || issueBand[v18]._downlinkHighFreq < a5
       || issueBand[v18]._uplinkLowFreq > a6
       || issueBand[v18]._uplinkHighFreq < a7)
  {
    if (++v18 == 28)
      goto LABEL_8;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), off_1002037A8[v18]);
  v22 = 0;
  v38 = &issueBand[v18];
  v23 = (int)v9;
  do
  {
    v24 = v38->_coexIssues[v22];
    if (!v24)
      break;
    v39 = v22;
    if (-[WCM_WiFiCellCoexIssue enableWifiChannelAvoidance](v24, "enableWifiChannelAvoidance")
      || -[WCM_WiFiCellCoexIssue wifiUlAntennaBitmapOnCellLAT](v24, "wifiUlAntennaBitmapOnCellLAT")
      || -[WCM_WiFiCellCoexIssue wifiUlAntennaBitmapOnCellUAT](v24, "wifiUlAntennaBitmapOnCellUAT"))
    {
      v25 = -[WCM_WiFiCellCoexIssue btChannelsToAvoidForCellUlLowFreq:cellUlHighFreq:gpsRadioActive:](v24, "btChannelsToAvoidForCellUlLowFreq:cellUlHighFreq:gpsRadioActive:", v10, a6, a7);
      v26 = (char *)objc_msgSend(v25, "count");
      v27 = -[WCM_WiFiCellCoexIssue issueType](v24, "issueType");
      if ((_DWORD)v9)
      {
        if ((v27 & 0xFFFFFFFE) == 0xC && (unint64_t)v26 > v23)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("limit OOB affected channels from %lu to %d channels"), v26, v9);
          v25 = objc_msgSend(v25, "subarrayWithRange:", 0, v23);
          v26 = (char *)v23;
        }
      }
      if (v26)
      {
        v29 = objc_msgSend(objc_msgSend(v25, "objectAtIndex:", 0), "intValue");
        v30 = objc_msgSend(objc_msgSend(v25, "objectAtIndex:", v26 - 1), "intValue");
        v31 = -[WCM_WiFiCellCoexIssue issueType](v24, "issueType");
        v32 = "<ISSUE_TYPE_INVALID>";
        if (v31 <= 0xE)
          v32 = off_100203990[v31];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT channels to avoid for %s: %d ~ %d (%lu channels)"), v32, v29, v30, v26);
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        v23 = (int)v9;
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v41;
          while (2)
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(_QWORD *)v41 != v35)
                objc_enumerationMutation(v25);
              v37 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v17, "containsObject:", v37) & 1) == 0)
              {
                if ((int)(objc_msgSend(v17, "count") - 80) >= -21)
                {
                  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("stop combining at channel %d with %lu total blocklist channels"), objc_msgSend(v37, "intValue"), objc_msgSend(v17, "count"));
                  goto LABEL_8;
                }
                objc_msgSend(v17, "addObject:", v37);
              }
            }
            v34 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            if (v34)
              continue;
            break;
          }
        }
      }
    }
    v22 = v39 + 1;
  }
  while (v39 < 4);
LABEL_8:
  v20 = sub_10007C79C(v17);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT preferred channel map %@"), v20);
  return v20;
}

- (id)btPreferredChannelMapForCellBandInfoType:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 gpsRadioActive:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  uint64_t v16;
  $84C6A763E70B53E0CA11881018106DD4 *issueBand;
  NSMutableData *v18;
  unint64_t v20;
  char *v21;
  void *v22;
  unsigned int v23;
  id v24;
  char *v25;
  char *v26;
  id v27;
  id v28;
  unsigned int v29;
  const char *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  $84C6A763E70B53E0CA11881018106DD4 *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v8 = a8;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Try to get BT preferred channel map on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) gpsRadioActive(%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8);
  v15 = +[NSMutableArray array](NSMutableArray, "array");
  v16 = 0;
  issueBand = self->_issueBand;
  while ((issueBand[v16]._bandInfoType & a3) == 0
       || issueBand[v16]._downlinkLowFreq > a4
       || issueBand[v16]._downlinkHighFreq < a5
       || issueBand[v16]._uplinkLowFreq > a6
       || issueBand[v16]._uplinkHighFreq < a7)
  {
    if (++v16 == 28)
      goto LABEL_8;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("need to apply rules for %s"), off_1002037A8[v16]);
  v20 = 0;
  v37 = &issueBand[v16];
  do
  {
    v21 = (char *)v37 + 8 * v20;
    v22 = (void *)*((_QWORD *)v21 + 5);
    if (!v22)
      break;
    v23 = objc_msgSend(*((id *)v21 + 5), "btDiversityBlocklistTypeFor:", 1);
    if ((v23 & 0xFFFFFFFD) == 1)
    {
      v24 = &__NSArray0__struct;
      if (v23 != 1)
        v24 = objc_msgSend(v22, "btDiversityChannelsToAvoidForCellBTAntennaCombination:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 1, v8, a4, a5, a6, a7);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%@ featuere is enabled but platform configuration is not valid for this feature"), CFSTR("BTUseC0B1AntennaConfig"));
      v24 = &__NSArray0__struct;
    }
    v25 = (char *)objc_msgSend(v24, "count");
    if (v25)
    {
      v26 = v25;
      v27 = objc_msgSend(objc_msgSend(v24, "objectAtIndex:", 0), "intValue");
      v28 = objc_msgSend(objc_msgSend(v24, "objectAtIndex:", v26 - 1), "intValue");
      v29 = objc_msgSend(v22, "issueType");
      v30 = "<ISSUE_TYPE_INVALID>";
      if (v29 <= 0xE)
        v30 = off_100203990[v29];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT channels to avoid for %s: %d ~ %d (%lu channels)"), v30, v27, v28, v26);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v31 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v33)
              objc_enumerationMutation(v24);
            v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v15, "containsObject:", v35) & 1) == 0)
            {
              if ((int)(objc_msgSend(v15, "count") - 80) >= -21)
              {
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("stop combining at channel %d with %lu total blocklist channels"), objc_msgSend(v35, "intValue"), objc_msgSend(v15, "count"));
                goto LABEL_8;
              }
              objc_msgSend(v15, "addObject:", v35);
            }
          }
          v32 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v32)
            continue;
          break;
        }
      }
    }
  }
  while (v20++ < 4);
LABEL_8:
  v18 = sub_10007C79C(v15);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT preferred channel map %@"), v18);
  return v18;
}

- (id)btDiversityChannelMapForCellBTAntennaCombination:(int)a3 cellBandInfoType:(int)a4 cellDlLowFreq:(double)a5 cellDlHighFreq:(double)a6 cellUlLowFreq:(double)a7 cellUlHighFreq:(double)a8 gpsRadioActive:(BOOL)a9
{
  _BOOL8 v9;
  uint64_t v15;
  const char *v17;
  id v18;
  uint64_t v19;
  $84C6A763E70B53E0CA11881018106DD4 *issueBand;
  NSMutableData *v21;
  unint64_t v23;
  char *v24;
  void *v25;
  unsigned int v26;
  id v27;
  char *v28;
  char *v29;
  id v30;
  id v31;
  unsigned int v32;
  const char *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  unsigned int v40;
  const char *v41;
  NSMutableArray *v42;
  $84C6A763E70B53E0CA11881018106DD4 *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v9 = a9;
  v15 = *(_QWORD *)&a3;
  if (a3 <= 3)
    v17 = off_100203A08[a3];
  else
    v17 = "<ANTENNA_COMBINATION_INVALID>";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Try to get BT diversity channel map for %s on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) gpsRadioActive(%d)"), v17, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9);
  v18 = +[NSMutableArray array](NSMutableArray, "array");
  v19 = 0;
  issueBand = self->_issueBand;
  while ((issueBand[v19]._bandInfoType & a4) == 0
       || issueBand[v19]._downlinkLowFreq > a5
       || issueBand[v19]._downlinkHighFreq < a6
       || issueBand[v19]._uplinkLowFreq > a7
       || issueBand[v19]._uplinkHighFreq < a8)
  {
    if (++v19 == 28)
      goto LABEL_11;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("need to apply rules for %s"), off_1002037A8[v19]);
  v23 = 0;
  v43 = &issueBand[v19];
  do
  {
    v24 = (char *)v43 + 8 * v23;
    v25 = (void *)*((_QWORD *)v24 + 5);
    if (!v25)
      break;
    v26 = objc_msgSend(*((id *)v24 + 5), "btDiversityBlocklistTypeFor:", v15);
    if (v26 - 4 > 0xFFFFFFFC)
    {
      v27 = &__NSArray0__struct;
      if (v26 != 1)
      {
        if (v26 == 2)
        {
          v40 = objc_msgSend(v25, "issueType");
          if (v40 <= 0xE)
            v41 = off_100203990[v40];
          else
            v41 = "<ISSUE_TYPE_INVALID>";
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Just avoid all BT channels for %s on antennaCombinationCxBx(%d)"), v41, v15);
          v42 = sub_100088E38(0, 0x4Eu);
          return sub_10007C79C(v42);
        }
        v27 = objc_msgSend(v25, "btDiversityChannelsToAvoidForCellBTAntennaCombination:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", v15, v9, a5, a6, a7, a8);
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%@ featuere is enabled but platform configuration is not valid for this feature"), CFSTR("BTDiversityAFHMap"));
      v27 = &__NSArray0__struct;
    }
    v28 = (char *)objc_msgSend(v27, "count");
    if (v28)
    {
      v29 = v28;
      v30 = objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 0), "intValue");
      v31 = objc_msgSend(objc_msgSend(v27, "objectAtIndex:", v29 - 1), "intValue");
      v32 = objc_msgSend(v25, "issueType");
      v33 = "<ISSUE_TYPE_INVALID>";
      if (v32 <= 0xE)
        v33 = off_100203990[v32];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT channels to avoid for %s: %d ~ %d (%lu channels)"), v33, v30, v31, v29);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v34 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v36)
              objc_enumerationMutation(v27);
            v38 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v18, "containsObject:", v38) & 1) == 0)
            {
              if ((int)sub_10007CC24(v18, 1) <= 20)
              {
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("stop combining at channel %d with %lu total blocklist channels"), objc_msgSend(v38, "intValue"), objc_msgSend(v18, "count"));
                goto LABEL_11;
              }
              objc_msgSend(v18, "addObject:", v38);
            }
          }
          v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v35)
            continue;
          break;
        }
      }
    }
  }
  while (v23++ < 4);
LABEL_11:
  v21 = sub_10007C79C(v18);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT diversity channel map %@"), v21);
  return v21;
}

- (BOOL)wifiBtAgcCoexModeEnableCheckBandCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 coexModeWifiLevel:(int64_t *)a8
{
  uint64_t v15;
  char **v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL result;
  void *v21;
  void **v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  void *v27;
  int v28;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Check if band is eligible for AgcCoexMode on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) "), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v15 = 0;
  v28 = 0;
  v16 = off_1002037A8;
  while (1)
  {
    if ((self->_issueBand[v15]._bandInfoType & a3) != 0
      && self->_issueBand[v15]._downlinkLowFreq <= a4
      && self->_issueBand[v15]._downlinkHighFreq >= a5
      && self->_issueBand[v15]._uplinkLowFreq <= a6)
    {
      v17 = (char *)self + v15 * 80;
      if (self->_issueBand[v15]._uplinkHighFreq >= a7)
        break;
    }
    ++v15;
    ++v16;
    if (v15 == 28)
      goto LABEL_8;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("AgcCoexMode need to apply rules for %s"), *v16);
  v21 = (void *)*((_QWORD *)v17 + 6);
  if (!v21)
  {
LABEL_8:
    v18 = 0;
    v19 = 0;
    goto LABEL_9;
  }
  LODWORD(v19) = 0;
  v22 = (void **)(v17 + 56);
  v23 = 4;
  do
  {
    v24 = objc_msgSend(v21, "wifiBtAgcCoexModeEnabledInPolicy:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:agccoexmode:", &v28, a4, a5, a6, a7);
    v18 = v28;
    if (v24)
      v25 = v28;
    else
      v25 = 0;
    v19 = (v25 + v19);
    if (v28 > 0 || v23 == 0)
      break;
    v27 = *v22++;
    v21 = v27;
    --v23;
  }
  while (v27);
LABEL_9:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("AgcCoexMode for this band 0 - No NonZero - Yes %d, level %d"), v19, v18);
  result = (int)v19 > 0;
  *a8 = v28;
  return result;
}

- (BOOL)wifiBtAgcCoexModeEnableCheckBandCombinationV2:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 wifiChannel:(unsigned int)a8 channelCenterFreqMHz:(unsigned int)a9 channelBandwidthMHz:(unsigned int)a10 coexModeWifiLevel:(int64_t *)a11 coexModeBTLevel:(int64_t *)a12
{
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  $84C6A763E70B53E0CA11881018106DD4 *v30;
  $84C6A763E70B53E0CA11881018106DD4 *issueBand;
  _BOOL8 v32;
  _BOOL4 v33;
  const char *v35;
  char **v36;
  uint64_t v37;
  char v38;
  char v39;
  char **v40;
  BOOL v41;
  const char *v42;
  const char *v43;
  WCM_WiFiCellCoexIssue *v44;
  unsigned int v45;
  const char *v46;
  const char *v47;
  int64_t v48;
  int64_t v49;
  char v50;
  char **v51;
  WCM_WiFiCellCoexIssue **coexIssues;
  BOOL v55;
  uint64_t v56;
  unsigned int v57;
  int64_t v59;
  int64_t v60;

  v59 = 0;
  v60 = 0;
  v56 = *(_QWORD *)&a8;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("DLDebug_ Check if band is eligible for AgcCoexMode on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) wifiChannel(%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
  v19 = a9 - 2400;
  v20 = a9 - 5170;
  v21 = 100;
  v57 = a9;
  v22 = 200;
  if (a9 - 5925 >= 0x4B1)
    v22 = 0;
  v23 = 27;
  if (a9 - 5925 < 0x4B1)
    v23 = 210;
  v24 = v20 >= 0x29A;
  if (v20 >= 0x29A)
    v25 = v23;
  else
    v25 = 116;
  if (v24)
    v21 = v22;
  v26 = v19 >= 0x65;
  if (v19 >= 0x65)
    v27 = v25;
  else
    v27 = 27;
  if (v26)
    v28 = v21;
  else
    v28 = 0;
  v29 = v27 + 1;
  v30 = &self->_issueBand[v28];
  do
  {
    issueBand = v30;
    if (v28 >= 0x1C)
    {
      if ((v28 - 100) > 0x10)
      {
        if (v28 < 0xC8)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("thisIssueBand does not match any of the predefined ranges defined in WCM_WiFiCellCoexIssueBand enum."));
          issueBand = self->_issueBand;
        }
        else
        {
          issueBand = &self->_issueBand[(v28 - 200) + 45];
        }
      }
      else
      {
        issueBand = &self->_issueBand[(v28 - 100) + 28];
      }
    }
    if ((issueBand->_bandInfoType & a3) != 0
      && issueBand->_downlinkLowFreq <= a4
      && issueBand->_downlinkHighFreq >= a5
      && issueBand->_uplinkLowFreq <= a6
      && issueBand->_uplinkHighFreq >= a7)
    {
      v35 = "<ISSUE_BAND_INVALID: beyond the range>";
      if (v28 <= 0xD2)
      {
        if (v28 < 0xC8)
        {
          if ((v28 - 100) > 0x10)
          {
            if (v28 > 0x1B)
            {
              v35 = "<ISSUE_BAND_INVALID: Negative number.>";
              goto LABEL_40;
            }
            v36 = &off_1002037A8[v28];
          }
          else
          {
            v36 = &off_100203888[(v28 - 100)];
          }
        }
        else
        {
          v36 = &off_100203910[(v28 - 200)];
        }
        v35 = *v36;
      }
LABEL_40:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("AgcCoexMode need to apply rules for %s"), v35);
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v32 = 0;
      v40 = &off_1002037A8[v28];
      v41 = (v28 - 100) > 0x10 && (v28 - 200) > 0xFFFFFF53;
      if ((v28 - 100) <= 0x10)
        v40 = &off_100203888[(v28 - 100)];
      if (v28 > 0xC7)
        v40 = &off_100203910[(v28 - 200)];
      v50 = 0;
      v51 = v40;
      if (v28 > 0xD2)
        v41 = 1;
      v55 = v41;
      if (v28 <= 0xD2)
        v42 = "<ISSUE_BAND_INVALID: Negative number.>";
      else
        v42 = "<ISSUE_BAND_INVALID: beyond the range>";
      coexIssues = issueBand->_coexIssues;
      while (1)
      {
        v43 = v42;
        if (!v55)
          v43 = *v51;
        v44 = coexIssues[v37];
        v45 = -[WCM_WiFiCellCoexIssue issueType](v44, "issueType");
        v46 = "<ISSUE_TYPE_INVALID>";
        if (v45 <= 0xE)
          v46 = off_100203990[v45];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ For coexIssueBand (%s), coexIssueType (%s), coexIssuePrioirty (%s)"), v43, v46, off_100203968[v37]);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ For the coexIssue above, the policy table has following entries: wifiBtAgcCoexModeEnable = (%d), btAgcCoexModeEnable = (%d)"), -[WCM_WiFiCellCoexIssue wifiBtAgcCoexModeEnable](v44, "wifiBtAgcCoexModeEnable"), -[WCM_WiFiCellCoexIssue btAgcCoexModeEnable](v44, "btAgcCoexModeEnable"));
        if (!v44)
        {
LABEL_73:
          v33 = v50 & 1;
          goto LABEL_31;
        }
        v32 = -[WCM_WiFiCellCoexIssue wifiBtAgcCoexModeEnabledInPolicyV2:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:channelCenterFreqMHz:channelBandwidthMHz:coexModeWifiLevel:coexModeBTLevel:](v44, "wifiBtAgcCoexModeEnabledInPolicyV2:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:channelCenterFreqMHz:channelBandwidthMHz:coexModeWifiLevel:coexModeBTLevel:", v56, v57, a10, &v60, &v59, a4, a5, a6, a7);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ Upon returning from wifiBtAgcCoexModeEnabledInPolicyV2, coexModeWifiLevel = %ld and coexModeBTLevel = %ld, Flag coexModeBandMatch = %d"), v60, v59, v32);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ nonzeroCoexModeWiFiMatchedBefore = %d, nonzeroCoexModeBTMatchedBefore = %d"), v39 & 1, v38 & 1);
        if (v32)
        {
          v47 = v42;
          if (!v55)
            v47 = *v51;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ coexModeBandMatch = %s for Band %d, Priority %d"), v47, v32, v37);
          if ((v39 & 1) != 0)
          {
            v39 = 1;
            if ((v38 & 1) == 0)
              goto LABEL_68;
          }
          else
          {
            v48 = v60;
            *a11 = v60;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ Assign coexModeWifiLevel_temp value (%ld) to *coexModeWifiLevel (%ld)"), v48, v48);
            if (v60 < 1)
            {
              v39 = 0;
              if ((v38 & 1) == 0)
              {
LABEL_68:
                v49 = v59;
                *a12 = v59;
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ Assign coexModeBTLevel_temp value (%ld) to *coexModeBTLevel (%ld)"), v49, v49);
                if (v59 < 1)
                {
                  v38 = 0;
                }
                else
                {
                  v38 = 1;
                  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ nonzeroCoexModeBTMatchedBefore switched from FALSE to %d"), 1);
                }
                v50 = 1;
                goto LABEL_72;
              }
            }
            else
            {
              v39 = 1;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ nonzeroCoexModeWiFiMatchedBefore switched from FALSE to %d"), 1);
              if ((v38 & 1) == 0)
                goto LABEL_68;
            }
          }
          v50 = 1;
          v38 = 1;
        }
LABEL_72:
        if (++v37 == 5)
          goto LABEL_73;
      }
    }
    ++v28;
    ++v30;
  }
  while (v29 != v28);
  v32 = 0;
  v33 = 0;
LABEL_31:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ wifiBtAgcCoexModeEnableCheckBandCombinationV2 is returning with coexModeBandMatch = %d and coexModeBandMatch_Flag = %d"), v32, v33);
  return v33;
}

- (int)watchAntennaPreferenceEnableCheckBandCombination:(int)a3 cellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v13;
  WCM_WiFiCellCoexIssue **coexIssues;
  uint64_t v15;
  uint64_t v17;
  unsigned int v18;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Check if band is eligible for WatchAntennaPreference on bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf) "), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v13 = 0;
  v18 = 0;
  coexIssues = self->_issueBand[0]._coexIssues;
  while ((*(_DWORD *)(coexIssues - 5) & a3) == 0
       || *((double *)coexIssues - 4) > a4
       || *((double *)coexIssues - 3) < a5
       || *((double *)coexIssues - 2) > a6
       || *((double *)coexIssues - 1) < a7)
  {
    coexIssues += 10;
    if (++v13 == 28)
      goto LABEL_8;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WatchAntennaPref need to apply rules for %s"), off_1002037A8[v13]);
  v17 = 5;
  while (*coexIssues)
  {
    if (-[WCM_WiFiCellCoexIssue watchAntennaPrefEnabledInPolicy:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:watchAntPref:](*coexIssues, "watchAntennaPrefEnabledInPolicy:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:watchAntPref:", &v18, a4, a5, a6, a7))
    {
      v15 = v18;
      goto LABEL_9;
    }
    v15 = 0;
    ++coexIssues;
    if (!--v17)
      goto LABEL_9;
  }
LABEL_8:
  v15 = 0;
LABEL_9:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WatchAntennaPreference for this band Yes or No %d"), v15);
  if ((int)v15 <= 0)
    return 0;
  else
    return v18;
}

@end
