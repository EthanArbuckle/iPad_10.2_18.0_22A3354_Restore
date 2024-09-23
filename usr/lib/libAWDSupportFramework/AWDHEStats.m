@implementation AWDHEStats

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  -[AWDHEStats setOmicntrs:](self, "setOmicntrs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDHEStats;
  -[AWDHEStats dealloc](&v3, sel_dealloc);
}

- (void)setHeRxtrigMyaid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_heRxtrigMyaid = a3;
}

- (void)setHasHeRxtrigMyaid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHeRxtrigMyaid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHeRxtrigBasic:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_heRxtrigBasic = a3;
}

- (void)setHasHeRxtrigBasic:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHeRxtrigBasic
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHeRxtrigMurts:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_heRxtrigMurts = a3;
}

- (void)setHasHeRxtrigMurts:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHeRxtrigMurts
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHeRxtrigBsrp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_heRxtrigBsrp = a3;
}

- (void)setHasHeRxtrigBsrp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHeRxtrigBsrp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHeRxtrigBfmCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_heRxtrigBfmCnt = a3;
}

- (void)setHasHeRxtrigBfmCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHeRxtrigBfmCnt
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHeRxtrigMubar:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_heRxtrigMubar = a3;
}

- (void)setHasHeRxtrigMubar:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHeRxtrigMubar
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHeRxhemuppduCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_heRxhemuppduCnt = a3;
}

- (void)setHasHeRxhemuppduCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHeRxhemuppduCnt
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHeTxtbppdu:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_heTxtbppdu = a3;
}

- (void)setHasHeTxtbppdu:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasHeTxtbppdu
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHeRxhesuppduCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_heRxhesuppduCnt = a3;
}

- (void)setHasHeRxhesuppduCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHeRxhesuppduCnt
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHeNullZeroAgg:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_heNullZeroAgg = a3;
}

- (void)setHasHeNullZeroAgg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHeNullZeroAgg
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHeMyAIDCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_heMyAIDCnt = a3;
}

- (void)setHasHeMyAIDCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHeMyAIDCnt
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (unint64_t)rxherusCount
{
  return self->_rxherus.count;
}

- (unsigned)rxherus
{
  return self->_rxherus.list;
}

- (void)clearRxherus
{
  PBRepeatedUInt32Clear();
}

- (void)addRxheru:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)rxheruAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rxherus;
  unint64_t count;

  p_rxherus = &self->_rxherus;
  count = self->_rxherus.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rxherus->list[a3];
}

- (void)setRxherus:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)txherusCount
{
  return self->_txherus.count;
}

- (unsigned)txherus
{
  return self->_txherus.list;
}

- (void)clearTxherus
{
  PBRepeatedUInt32Clear();
}

- (void)addTxheru:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)txheruAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_txherus;
  unint64_t count;

  p_txherus = &self->_txherus;
  count = self->_txherus.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txherus->list[a3];
}

- (void)setTxherus:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setHeTbppduNdlimCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_heTbppduNdlimCnt = a3;
}

- (void)setHasHeTbppduNdlimCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasHeTbppduNdlimCnt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHeTbppduDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_heTbppduDur = a3;
}

- (void)setHasHeTbppduDur:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasHeTbppduDur
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDlMumimoPad:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dlMumimoPad = a3;
}

- (void)setHasDlMumimoPad:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDlMumimoPad
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDlMumimoDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_dlMumimoDur = a3;
}

- (void)setHasDlMumimoDur:(BOOL)a3
{
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDlMumimoDur
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setUlAvgTxpwr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_ulAvgTxpwr = a3;
}

- (void)setHasUlAvgTxpwr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUlAvgTxpwr
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHeColormissCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_heColormissCnt = a3;
}

- (void)setHasHeColormissCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasHeColormissCnt
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHeTxhesuppduCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_heTxhesuppduCnt = a3;
}

- (void)setHasHeTxhesuppduCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($19421F699C059BF44CF1ADB029A264FD)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasHeTxhesuppduCnt
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasOmicntrs
{
  return self->_omicntrs != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDHEStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDHEStats description](&v3, sel_description), -[AWDHEStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $19421F699C059BF44CF1ADB029A264FD has;
  $19421F699C059BF44CF1ADB029A264FD v5;
  AWDOMICntrs *omicntrs;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxtrigMyaid), CFSTR("he_rxtrig_myaid"));
    has = self->_has;
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxtrigBasic), CFSTR("he_rxtrig_basic"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxtrigMurts), CFSTR("he_rxtrig_murts"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxtrigBsrp), CFSTR("he_rxtrig_bsrp"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxtrigBfmCnt), CFSTR("he_rxtrig_bfm_cnt"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxtrigMubar), CFSTR("he_rxtrig_mubar"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxhemuppduCnt), CFSTR("he_rxhemuppdu_cnt"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heTxtbppdu), CFSTR("he_txtbppdu"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxhesuppduCnt), CFSTR("he_rxhesuppdu_cnt"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heNullZeroAgg), CFSTR("he_null_zero_agg"));
  if ((*(_DWORD *)&self->_has & 8) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heMyAIDCnt), CFSTR("he_myAID_cnt"));
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("rxheru"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("txheru"));
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heTbppduNdlimCnt), CFSTR("he_tbppdu_ndlim_cnt"));
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x2000) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&v5 & 2) == 0)
        goto LABEL_16;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heTbppduDur), CFSTR("he_tbppdu_dur"));
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 2) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v5 & 1) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dlMumimoPad), CFSTR("dl_mumimo_pad"));
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 1) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dlMumimoDur), CFSTR("dl_mumimo_dur"));
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v5 & 4) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ulAvgTxpwr), CFSTR("ul_avg_txpwr"));
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 4) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v5 & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heColormissCnt), CFSTR("he_colormiss_cnt"));
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heTxhesuppduCnt), CFSTR("he_txhesuppdu_cnt"));
LABEL_21:
  omicntrs = self->_omicntrs;
  if (omicntrs)
    objc_msgSend(v3, "setObject:forKey:", -[AWDOMICntrs dictionaryRepresentation](omicntrs, "dictionaryRepresentation"), CFSTR("omicntrs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHEStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $19421F699C059BF44CF1ADB029A264FD has;
  unint64_t v5;
  unint64_t v6;
  $19421F699C059BF44CF1ADB029A264FD v7;

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 8) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field();
LABEL_13:
  if (self->_rxherus.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_rxherus.count);
  }
  if (self->_txherus.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_txherus.count);
  }
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x2000) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v7 & 2) == 0)
        goto LABEL_22;
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v7 & 1) == 0)
      goto LABEL_23;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 1) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_25;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_26:
    PBDataWriterWriteUint32Field();
LABEL_27:
  if (self->_omicntrs)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  $19421F699C059BF44CF1ADB029A264FD has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  $19421F699C059BF44CF1ADB029A264FD v12;

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_heRxtrigMyaid;
    *((_DWORD *)a3 + 35) |= 0x1000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 21) = self->_heRxtrigBasic;
  *((_DWORD *)a3 + 35) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 25) = self->_heRxtrigMurts;
  *((_DWORD *)a3 + 35) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 23) = self->_heRxtrigBsrp;
  *((_DWORD *)a3 + 35) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 22) = self->_heRxtrigBfmCnt;
  *((_DWORD *)a3 + 35) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 24) = self->_heRxtrigMubar;
  *((_DWORD *)a3 + 35) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 19) = self->_heRxhemuppduCnt;
  *((_DWORD *)a3 + 35) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 30) = self->_heTxtbppdu;
  *((_DWORD *)a3 + 35) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
LABEL_40:
    *((_DWORD *)a3 + 18) = self->_heNullZeroAgg;
    *((_DWORD *)a3 + 35) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_39:
  *((_DWORD *)a3 + 20) = self->_heRxhesuppduCnt;
  *((_DWORD *)a3 + 35) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
    goto LABEL_40;
LABEL_11:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)a3 + 17) = self->_heMyAIDCnt;
    *((_DWORD *)a3 + 35) |= 8u;
  }
LABEL_13:
  if (-[AWDHEStats rxherusCount](self, "rxherusCount"))
  {
    objc_msgSend(a3, "clearRxherus");
    v6 = -[AWDHEStats rxherusCount](self, "rxherusCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addRxheru:", -[AWDHEStats rxheruAtIndex:](self, "rxheruAtIndex:", i));
    }
  }
  if (-[AWDHEStats txherusCount](self, "txherusCount"))
  {
    objc_msgSend(a3, "clearTxherus");
    v9 = -[AWDHEStats txherusCount](self, "txherusCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addTxheru:", -[AWDHEStats txheruAtIndex:](self, "txheruAtIndex:", j));
    }
  }
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    *((_DWORD *)a3 + 28) = self->_heTbppduNdlimCnt;
    *((_DWORD *)a3 + 35) |= 0x4000u;
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x2000) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&v12 & 2) == 0)
        goto LABEL_24;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)a3 + 27) = self->_heTbppduDur;
  *((_DWORD *)a3 + 35) |= 0x2000u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v12 & 1) == 0)
      goto LABEL_25;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 15) = self->_dlMumimoPad;
  *((_DWORD *)a3 + 35) |= 2u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v12 & 0x20000) == 0)
      goto LABEL_26;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 14) = self->_dlMumimoDur;
  *((_DWORD *)a3 + 35) |= 1u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x20000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v12 & 4) == 0)
      goto LABEL_27;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 34) = self->_ulAvgTxpwr;
  *((_DWORD *)a3 + 35) |= 0x20000u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 4) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v12 & 0x8000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_47:
  *((_DWORD *)a3 + 16) = self->_heColormissCnt;
  *((_DWORD *)a3 + 35) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_28:
    *((_DWORD *)a3 + 29) = self->_heTxhesuppduCnt;
    *((_DWORD *)a3 + 35) |= 0x8000u;
  }
LABEL_29:
  if (self->_omicntrs)
    objc_msgSend(a3, "setOmicntrs:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  $19421F699C059BF44CF1ADB029A264FD has;
  $19421F699C059BF44CF1ADB029A264FD v8;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_heRxtrigMyaid;
    *((_DWORD *)v5 + 35) |= 0x1000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 21) = self->_heRxtrigBasic;
  *((_DWORD *)v5 + 35) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 25) = self->_heRxtrigMurts;
  *((_DWORD *)v5 + 35) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 23) = self->_heRxtrigBsrp;
  *((_DWORD *)v5 + 35) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 22) = self->_heRxtrigBfmCnt;
  *((_DWORD *)v5 + 35) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 24) = self->_heRxtrigMubar;
  *((_DWORD *)v5 + 35) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 19) = self->_heRxhemuppduCnt;
  *((_DWORD *)v5 + 35) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 30) = self->_heTxtbppdu;
  *((_DWORD *)v5 + 35) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v5 + 20) = self->_heRxhesuppduCnt;
  *((_DWORD *)v5 + 35) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_31:
  *((_DWORD *)v5 + 18) = self->_heNullZeroAgg;
  *((_DWORD *)v5 + 35) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)v5 + 17) = self->_heMyAIDCnt;
    *((_DWORD *)v5 + 35) |= 8u;
  }
LABEL_13:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) != 0)
  {
    *((_DWORD *)v6 + 28) = self->_heTbppduNdlimCnt;
    *((_DWORD *)v6 + 35) |= 0x4000u;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x2000) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&v8 & 2) == 0)
        goto LABEL_16;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 27) = self->_heTbppduDur;
  *((_DWORD *)v6 + 35) |= 0x2000u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 2) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v8 & 1) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v6 + 15) = self->_dlMumimoPad;
  *((_DWORD *)v6 + 35) |= 2u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 1) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v8 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 14) = self->_dlMumimoDur;
  *((_DWORD *)v6 + 35) |= 1u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_19;
LABEL_38:
    *((_DWORD *)v6 + 16) = self->_heColormissCnt;
    *((_DWORD *)v6 + 35) |= 4u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_37:
  *((_DWORD *)v6 + 34) = self->_ulAvgTxpwr;
  *((_DWORD *)v6 + 35) |= 0x20000u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) != 0)
    goto LABEL_38;
LABEL_19:
  if ((*(_WORD *)&v8 & 0x8000) != 0)
  {
LABEL_20:
    *((_DWORD *)v6 + 29) = self->_heTxhesuppduCnt;
    *((_DWORD *)v6 + 35) |= 0x8000u;
  }
LABEL_21:

  v6[16] = -[AWDOMICntrs copyWithZone:](self->_omicntrs, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  $19421F699C059BF44CF1ADB029A264FD has;
  int v7;
  $19421F699C059BF44CF1ADB029A264FD v8;
  int v9;
  AWDOMICntrs *omicntrs;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 35);
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_heRxtrigMyaid != *((_DWORD *)a3 + 26))
        goto LABEL_96;
    }
    else if ((v7 & 0x1000) != 0)
    {
LABEL_96:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_heRxtrigBasic != *((_DWORD *)a3 + 21))
        goto LABEL_96;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_heRxtrigMurts != *((_DWORD *)a3 + 25))
        goto LABEL_96;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_heRxtrigBsrp != *((_DWORD *)a3 + 23))
        goto LABEL_96;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_heRxtrigBfmCnt != *((_DWORD *)a3 + 22))
        goto LABEL_96;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_heRxtrigMubar != *((_DWORD *)a3 + 24))
        goto LABEL_96;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_heRxhemuppduCnt != *((_DWORD *)a3 + 19))
        goto LABEL_96;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_heTxtbppdu != *((_DWORD *)a3 + 30))
        goto LABEL_96;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_heRxhesuppduCnt != *((_DWORD *)a3 + 20))
        goto LABEL_96;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_heNullZeroAgg != *((_DWORD *)a3 + 18))
        goto LABEL_96;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_heMyAIDCnt != *((_DWORD *)a3 + 17))
        goto LABEL_96;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_96;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        v8 = self->_has;
        v9 = *((_DWORD *)a3 + 35);
        if ((*(_WORD *)&v8 & 0x4000) != 0)
        {
          if ((v9 & 0x4000) == 0 || self->_heTbppduNdlimCnt != *((_DWORD *)a3 + 28))
            goto LABEL_96;
        }
        else if ((v9 & 0x4000) != 0)
        {
          goto LABEL_96;
        }
        if ((*(_WORD *)&v8 & 0x2000) != 0)
        {
          if ((v9 & 0x2000) == 0 || self->_heTbppduDur != *((_DWORD *)a3 + 27))
            goto LABEL_96;
        }
        else if ((v9 & 0x2000) != 0)
        {
          goto LABEL_96;
        }
        if ((*(_BYTE *)&v8 & 2) != 0)
        {
          if ((v9 & 2) == 0 || self->_dlMumimoPad != *((_DWORD *)a3 + 15))
            goto LABEL_96;
        }
        else if ((v9 & 2) != 0)
        {
          goto LABEL_96;
        }
        if ((*(_BYTE *)&v8 & 1) != 0)
        {
          if ((v9 & 1) == 0 || self->_dlMumimoDur != *((_DWORD *)a3 + 14))
            goto LABEL_96;
        }
        else if ((v9 & 1) != 0)
        {
          goto LABEL_96;
        }
        if ((*(_DWORD *)&v8 & 0x20000) != 0)
        {
          if ((v9 & 0x20000) == 0 || self->_ulAvgTxpwr != *((_DWORD *)a3 + 34))
            goto LABEL_96;
        }
        else if ((v9 & 0x20000) != 0)
        {
          goto LABEL_96;
        }
        if ((*(_BYTE *)&v8 & 4) != 0)
        {
          if ((v9 & 4) == 0 || self->_heColormissCnt != *((_DWORD *)a3 + 16))
            goto LABEL_96;
        }
        else if ((v9 & 4) != 0)
        {
          goto LABEL_96;
        }
        if ((*(_WORD *)&v8 & 0x8000) != 0)
        {
          if ((v9 & 0x8000) == 0 || self->_heTxhesuppduCnt != *((_DWORD *)a3 + 29))
            goto LABEL_96;
        }
        else if ((v9 & 0x8000) != 0)
        {
          goto LABEL_96;
        }
        omicntrs = self->_omicntrs;
        if ((unint64_t)omicntrs | *((_QWORD *)a3 + 16))
          LOBYTE(IsEqual) = -[AWDOMICntrs isEqual:](omicntrs, "isEqual:");
        else
          LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $19421F699C059BF44CF1ADB029A264FD has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $19421F699C059BF44CF1ADB029A264FD v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v25 = 2654435761 * self->_heRxtrigMyaid;
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_heRxtrigBasic;
      if ((*(_WORD *)&has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v25 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_3;
  }
  v24 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    v23 = 2654435761 * self->_heRxtrigMurts;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v23 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_5:
    v22 = 2654435761 * self->_heRxtrigBsrp;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v22 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_6:
    v21 = 2654435761 * self->_heRxtrigBfmCnt;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_heRxtrigMubar;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_heRxhemuppduCnt;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_heTxtbppdu;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v6 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_heRxhesuppduCnt;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_11;
LABEL_22:
    v8 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_21:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_22;
LABEL_11:
  v8 = 2654435761 * self->_heNullZeroAgg;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_12:
    v9 = 2654435761 * self->_heMyAIDCnt;
    goto LABEL_24;
  }
LABEL_23:
  v9 = 0;
LABEL_24:
  v10 = PBRepeatedUInt32Hash();
  v11 = PBRepeatedUInt32Hash();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    v13 = 2654435761 * self->_heTbppduNdlimCnt;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
    {
LABEL_26:
      v14 = 2654435761 * self->_heTbppduDur;
      if ((*(_BYTE *)&v12 & 2) != 0)
        goto LABEL_27;
      goto LABEL_34;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
      goto LABEL_26;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
LABEL_27:
    v15 = 2654435761 * self->_dlMumimoPad;
    if ((*(_BYTE *)&v12 & 1) != 0)
      goto LABEL_28;
    goto LABEL_35;
  }
LABEL_34:
  v15 = 0;
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
LABEL_28:
    v16 = 2654435761 * self->_dlMumimoDur;
    if ((*(_DWORD *)&v12 & 0x20000) != 0)
      goto LABEL_29;
    goto LABEL_36;
  }
LABEL_35:
  v16 = 0;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
LABEL_29:
    v17 = 2654435761 * self->_ulAvgTxpwr;
    if ((*(_BYTE *)&v12 & 4) != 0)
      goto LABEL_30;
LABEL_37:
    v18 = 0;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
      goto LABEL_31;
LABEL_38:
    v19 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AWDOMICntrs hash](self->_omicntrs, "hash");
  }
LABEL_36:
  v17 = 0;
  if ((*(_BYTE *)&v12 & 4) == 0)
    goto LABEL_37;
LABEL_30:
  v18 = 2654435761 * self->_heColormissCnt;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
    goto LABEL_38;
LABEL_31:
  v19 = 2654435761 * self->_heTxhesuppduCnt;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AWDOMICntrs hash](self->_omicntrs, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  int v12;
  AWDOMICntrs *omicntrs;
  uint64_t v14;

  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x1000) != 0)
  {
    self->_heRxtrigMyaid = *((_DWORD *)a3 + 26);
    *(_DWORD *)&self->_has |= 0x1000u;
    v5 = *((_DWORD *)a3 + 35);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_heRxtrigBasic = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  self->_heRxtrigMurts = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  self->_heRxtrigBsrp = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  self->_heRxtrigBfmCnt = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  self->_heRxtrigMubar = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  self->_heRxhemuppduCnt = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x10000) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  self->_heTxtbppdu = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  self->_heRxhesuppduCnt = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 35);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_39:
  self->_heNullZeroAgg = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)a3 + 35) & 8) != 0)
  {
LABEL_12:
    self->_heMyAIDCnt = *((_DWORD *)a3 + 17);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_13:
  v6 = objc_msgSend(a3, "rxherusCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDHEStats addRxheru:](self, "addRxheru:", objc_msgSend(a3, "rxheruAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "txherusCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDHEStats addTxheru:](self, "addTxheru:", objc_msgSend(a3, "txheruAtIndex:", j));
  }
  v12 = *((_DWORD *)a3 + 35);
  if ((v12 & 0x4000) != 0)
  {
    self->_heTbppduNdlimCnt = *((_DWORD *)a3 + 28);
    *(_DWORD *)&self->_has |= 0x4000u;
    v12 = *((_DWORD *)a3 + 35);
    if ((v12 & 0x2000) == 0)
    {
LABEL_21:
      if ((v12 & 2) == 0)
        goto LABEL_22;
      goto LABEL_43;
    }
  }
  else if ((v12 & 0x2000) == 0)
  {
    goto LABEL_21;
  }
  self->_heTbppduDur = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x2000u;
  v12 = *((_DWORD *)a3 + 35);
  if ((v12 & 2) == 0)
  {
LABEL_22:
    if ((v12 & 1) == 0)
      goto LABEL_23;
    goto LABEL_44;
  }
LABEL_43:
  self->_dlMumimoPad = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 2u;
  v12 = *((_DWORD *)a3 + 35);
  if ((v12 & 1) == 0)
  {
LABEL_23:
    if ((v12 & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_45;
  }
LABEL_44:
  self->_dlMumimoDur = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 1u;
  v12 = *((_DWORD *)a3 + 35);
  if ((v12 & 0x20000) == 0)
  {
LABEL_24:
    if ((v12 & 4) == 0)
      goto LABEL_25;
    goto LABEL_46;
  }
LABEL_45:
  self->_ulAvgTxpwr = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x20000u;
  v12 = *((_DWORD *)a3 + 35);
  if ((v12 & 4) == 0)
  {
LABEL_25:
    if ((v12 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_46:
  self->_heColormissCnt = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)a3 + 35) & 0x8000) != 0)
  {
LABEL_26:
    self->_heTxhesuppduCnt = *((_DWORD *)a3 + 29);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_27:
  omicntrs = self->_omicntrs;
  v14 = *((_QWORD *)a3 + 16);
  if (omicntrs)
  {
    if (v14)
      -[AWDOMICntrs mergeFrom:](omicntrs, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDHEStats setOmicntrs:](self, "setOmicntrs:");
  }
}

- (unsigned)heRxtrigMyaid
{
  return self->_heRxtrigMyaid;
}

- (unsigned)heRxtrigBasic
{
  return self->_heRxtrigBasic;
}

- (unsigned)heRxtrigMurts
{
  return self->_heRxtrigMurts;
}

- (unsigned)heRxtrigBsrp
{
  return self->_heRxtrigBsrp;
}

- (unsigned)heRxtrigBfmCnt
{
  return self->_heRxtrigBfmCnt;
}

- (unsigned)heRxtrigMubar
{
  return self->_heRxtrigMubar;
}

- (unsigned)heRxhemuppduCnt
{
  return self->_heRxhemuppduCnt;
}

- (unsigned)heTxtbppdu
{
  return self->_heTxtbppdu;
}

- (unsigned)heRxhesuppduCnt
{
  return self->_heRxhesuppduCnt;
}

- (unsigned)heNullZeroAgg
{
  return self->_heNullZeroAgg;
}

- (unsigned)heMyAIDCnt
{
  return self->_heMyAIDCnt;
}

- (unsigned)heTbppduNdlimCnt
{
  return self->_heTbppduNdlimCnt;
}

- (unsigned)heTbppduDur
{
  return self->_heTbppduDur;
}

- (unsigned)dlMumimoPad
{
  return self->_dlMumimoPad;
}

- (unsigned)dlMumimoDur
{
  return self->_dlMumimoDur;
}

- (int)ulAvgTxpwr
{
  return self->_ulAvgTxpwr;
}

- (unsigned)heColormissCnt
{
  return self->_heColormissCnt;
}

- (unsigned)heTxhesuppduCnt
{
  return self->_heTxhesuppduCnt;
}

- (AWDOMICntrs)omicntrs
{
  return self->_omicntrs;
}

- (void)setOmicntrs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
