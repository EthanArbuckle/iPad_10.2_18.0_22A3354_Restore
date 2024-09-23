@implementation AWDMMCSTcpInfo

- (void)setTcpiState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_tcpiState = a3;
}

- (void)setHasTcpiState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpiState
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setTcpiOptions:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_tcpiOptions = a3;
}

- (void)setHasTcpiOptions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasTcpiOptions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTcpiSndWscale:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_tcpiSndWscale = a3;
}

- (void)setHasTcpiSndWscale:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSndWscale
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTcpiRcvWscale:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_tcpiRcvWscale = a3;
}

- (void)setHasTcpiRcvWscale:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasTcpiRcvWscale
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTcpiFlags:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_tcpiFlags = a3;
}

- (void)setHasTcpiFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasTcpiFlags
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTcpiRto:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_tcpiRto = a3;
}

- (void)setHasTcpiRto:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasTcpiRto
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setTcpiSndMss:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_tcpiSndMss = a3;
}

- (void)setHasTcpiSndMss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSndMss
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setTcpiRcvMss:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_tcpiRcvMss = a3;
}

- (void)setHasTcpiRcvMss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasTcpiRcvMss
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setTcpiRttcur:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_tcpiRttcur = a3;
}

- (void)setHasTcpiRttcur:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasTcpiRttcur
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTcpiSrtt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_tcpiSrtt = a3;
}

- (void)setHasTcpiSrtt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSrtt
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setTcpiRttvar:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_tcpiRttvar = a3;
}

- (void)setHasTcpiRttvar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasTcpiRttvar
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setTcpiRttbest:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_tcpiRttbest = a3;
}

- (void)setHasTcpiRttbest:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasTcpiRttbest
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTcpiSndSsthresh:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_tcpiSndSsthresh = a3;
}

- (void)setHasTcpiSndSsthresh:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSndSsthresh
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setTcpiSndCwnd:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_tcpiSndCwnd = a3;
}

- (void)setHasTcpiSndCwnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSndCwnd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setTcpiRcvSpace:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_tcpiRcvSpace = a3;
}

- (void)setHasTcpiRcvSpace:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasTcpiRcvSpace
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setTcpiSndWnd:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_tcpiSndWnd = a3;
}

- (void)setHasTcpiSndWnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSndWnd
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setTcpiSndNxt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_tcpiSndNxt = a3;
}

- (void)setHasTcpiSndNxt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSndNxt
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTcpiRcvNxt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_tcpiRcvNxt = a3;
}

- (void)setHasTcpiRcvNxt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTcpiRcvNxt
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTcpiLastOutif:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_tcpiLastOutif = a3;
}

- (void)setHasTcpiLastOutif:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasTcpiLastOutif
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTcpiSndSbbytes:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_tcpiSndSbbytes = a3;
}

- (void)setHasTcpiSndSbbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasTcpiSndSbbytes
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setTcpiTxpackets:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_tcpiTxpackets = a3;
}

- (void)setHasTcpiTxpackets:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasTcpiTxpackets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTcpiTxbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_tcpiTxbytes = a3;
}

- (void)setHasTcpiTxbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasTcpiTxbytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTcpiTxretransmitbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_tcpiTxretransmitbytes = a3;
}

- (void)setHasTcpiTxretransmitbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasTcpiTxretransmitbytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTcpiTxunacked:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_tcpiTxunacked = a3;
}

- (void)setHasTcpiTxunacked:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasTcpiTxunacked
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTcpiRxpackets:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_tcpiRxpackets = a3;
}

- (void)setHasTcpiRxpackets:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTcpiRxpackets
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTcpiRxbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_tcpiRxbytes = a3;
}

- (void)setHasTcpiRxbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasTcpiRxbytes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTcpiRxduplicatebytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_tcpiRxduplicatebytes = a3;
}

- (void)setHasTcpiRxduplicatebytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasTcpiRxduplicatebytes
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTcpiRxoutoforderbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_tcpiRxoutoforderbytes = a3;
}

- (void)setHasTcpiRxoutoforderbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasTcpiRxoutoforderbytes
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTcpiSndBw:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_tcpiSndBw = a3;
}

- (void)setHasTcpiSndBw:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasTcpiSndBw
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTcpiSynrexmits:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_tcpiSynrexmits = a3;
}

- (void)setHasTcpiSynrexmits:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpiSynrexmits
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setTcpiUnused1:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_tcpiUnused1 = a3;
}

- (void)setHasTcpiUnused1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpiUnused1
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTcpiUnused2:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_tcpiUnused2 = a3;
}

- (void)setHasTcpiUnused2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTcpiUnused2
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setTcpiCellRxpackets:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_tcpiCellRxpackets = a3;
}

- (void)setHasTcpiCellRxpackets:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasTcpiCellRxpackets
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTcpiCellRxbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_tcpiCellRxbytes = a3;
}

- (void)setHasTcpiCellRxbytes:(BOOL)a3
{
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTcpiCellRxbytes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTcpiCellTxpackets:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_tcpiCellTxpackets = a3;
}

- (void)setHasTcpiCellTxpackets:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTcpiCellTxpackets
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTcpiCellTxbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_tcpiCellTxbytes = a3;
}

- (void)setHasTcpiCellTxbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasTcpiCellTxbytes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTcpiWifiRxpackets:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_tcpiWifiRxpackets = a3;
}

- (void)setHasTcpiWifiRxpackets:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasTcpiWifiRxpackets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTcpiWifiRxbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_tcpiWifiRxbytes = a3;
}

- (void)setHasTcpiWifiRxbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasTcpiWifiRxbytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTcpiWifiTxpackets:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_tcpiWifiTxpackets = a3;
}

- (void)setHasTcpiWifiTxpackets:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasTcpiWifiTxpackets
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTcpiWifiTxbytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_tcpiWifiTxbytes = a3;
}

- (void)setHasTcpiWifiTxbytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C6CA8241D079C7FA6349ADB25A6B61D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasTcpiWifiTxbytes
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSTcpInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMMCSTcpInfo description](&v3, sel_description), -[AWDMMCSTcpInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $5C6CA8241D079C7FA6349ADB25A6B61D has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiState), CFSTR("tcpi_state"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x400000000) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiOptions), CFSTR("tcpi_options"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSndWscale), CFSTR("tcpi_snd_wscale"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRcvWscale), CFSTR("tcpi_rcv_wscale"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiFlags), CFSTR("tcpi_flags"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRto), CFSTR("tcpi_rto"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSndMss), CFSTR("tcpi_snd_mss"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRcvMss), CFSTR("tcpi_rcv_mss"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRttcur), CFSTR("tcpi_rttcur"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSrtt), CFSTR("tcpi_srtt"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRttvar), CFSTR("tcpi_rttvar"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_14;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRttbest), CFSTR("tcpi_rttbest"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_15;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSndSsthresh), CFSTR("tcpi_snd_ssthresh"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSndCwnd), CFSTR("tcpi_snd_cwnd"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_17;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRcvSpace), CFSTR("tcpi_rcv_space"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSndWnd), CFSTR("tcpi_snd_wnd"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSndNxt), CFSTR("tcpi_snd_nxt"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiRcvNxt), CFSTR("tcpi_rcv_nxt"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_tcpiLastOutif), CFSTR("tcpi_last_outif"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiSndSbbytes), CFSTR("tcpi_snd_sbbytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiTxpackets), CFSTR("tcpi_txpackets"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiTxbytes), CFSTR("tcpi_txbytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiTxretransmitbytes), CFSTR("tcpi_txretransmitbytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiTxunacked), CFSTR("tcpi_txunacked"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiRxpackets), CFSTR("tcpi_rxpackets"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiRxbytes), CFSTR("tcpi_rxbytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiRxduplicatebytes), CFSTR("tcpi_rxduplicatebytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiRxoutoforderbytes), CFSTR("tcpi_rxoutoforderbytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiSndBw), CFSTR("tcpi_snd_bw"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_tcpiSynrexmits), CFSTR("tcpi_synrexmits"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_tcpiUnused1), CFSTR("tcpi_unused1"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpiUnused2), CFSTR("tcpi_unused2"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiCellRxpackets), CFSTR("tcpi_cell_rxpackets"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiCellRxbytes), CFSTR("tcpi_cell_rxbytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiCellTxpackets), CFSTR("tcpi_cell_txpackets"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiCellTxbytes), CFSTR("tcpi_cell_txbytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiWifiRxpackets), CFSTR("tcpi_wifi_rxpackets"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_40;
LABEL_81:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiWifiTxpackets), CFSTR("tcpi_wifi_txpackets"));
    if ((*(_QWORD *)&self->_has & 0x8000) == 0)
      return v3;
    goto LABEL_41;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiWifiRxbytes), CFSTR("tcpi_wifi_rxbytes"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
    goto LABEL_81;
LABEL_40:
  if ((*(_WORD *)&has & 0x8000) != 0)
LABEL_41:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpiWifiTxbytes), CFSTR("tcpi_wifi_txbytes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSTcpInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $5C6CA8241D079C7FA6349ADB25A6B61D has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x400000000) == 0)
        goto LABEL_4;
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_40;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x8000) == 0)
      return;
LABEL_81:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  if ((*(_QWORD *)&self->_has & 0x8000) != 0)
    goto LABEL_81;
}

- (void)copyTo:(id)a3
{
  $5C6CA8241D079C7FA6349ADB25A6B61D has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    *((_DWORD *)a3 + 55) = self->_tcpiState;
    *(_QWORD *)((char *)a3 + 236) |= 0x1000000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x400000000) == 0)
        goto LABEL_4;
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 38) = self->_tcpiOptions;
  *(_QWORD *)((char *)a3 + 236) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 53) = self->_tcpiSndWscale;
  *(_QWORD *)((char *)a3 + 236) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 42) = self->_tcpiRcvWscale;
  *(_QWORD *)((char *)a3 + 236) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 36) = self->_tcpiFlags;
  *(_QWORD *)((char *)a3 + 236) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 43) = self->_tcpiRto;
  *(_QWORD *)((char *)a3 + 236) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 48) = self->_tcpiSndMss;
  *(_QWORD *)((char *)a3 + 236) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 39) = self->_tcpiRcvMss;
  *(_QWORD *)((char *)a3 + 236) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 45) = self->_tcpiRttcur;
  *(_QWORD *)((char *)a3 + 236) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 54) = self->_tcpiSrtt;
  *(_QWORD *)((char *)a3 + 236) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 46) = self->_tcpiRttvar;
  *(_QWORD *)((char *)a3 + 236) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 44) = self->_tcpiRttbest;
  *(_QWORD *)((char *)a3 + 236) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 51) = self->_tcpiSndSsthresh;
  *(_QWORD *)((char *)a3 + 236) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 47) = self->_tcpiSndCwnd;
  *(_QWORD *)((char *)a3 + 236) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 41) = self->_tcpiRcvSpace;
  *(_QWORD *)((char *)a3 + 236) |= 0x400000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 52) = self->_tcpiSndWnd;
  *(_QWORD *)((char *)a3 + 236) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 49) = self->_tcpiSndNxt;
  *(_QWORD *)((char *)a3 + 236) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 40) = self->_tcpiRcvNxt;
  *(_QWORD *)((char *)a3 + 236) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 37) = self->_tcpiLastOutif;
  *(_QWORD *)((char *)a3 + 236) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 50) = self->_tcpiSndSbbytes;
  *(_QWORD *)((char *)a3 + 236) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 11) = self->_tcpiTxpackets;
  *(_QWORD *)((char *)a3 + 236) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 10) = self->_tcpiTxbytes;
  *(_QWORD *)((char *)a3 + 236) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)a3 + 12) = self->_tcpiTxretransmitbytes;
  *(_QWORD *)((char *)a3 + 236) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)a3 + 13) = self->_tcpiTxunacked;
  *(_QWORD *)((char *)a3 + 236) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)a3 + 8) = self->_tcpiRxpackets;
  *(_QWORD *)((char *)a3 + 236) |= 0x80uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)a3 + 5) = self->_tcpiRxbytes;
  *(_QWORD *)((char *)a3 + 236) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)a3 + 6) = self->_tcpiRxduplicatebytes;
  *(_QWORD *)((char *)a3 + 236) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)a3 + 7) = self->_tcpiRxoutoforderbytes;
  *(_QWORD *)((char *)a3 + 236) |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)a3 + 9) = self->_tcpiSndBw;
  *(_QWORD *)((char *)a3 + 236) |= 0x100uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)a3 + 56) = self->_tcpiSynrexmits;
  *(_QWORD *)((char *)a3 + 236) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)a3 + 57) = self->_tcpiUnused1;
  *(_QWORD *)((char *)a3 + 236) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 58) = self->_tcpiUnused2;
  *(_QWORD *)((char *)a3 + 236) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)a3 + 2) = self->_tcpiCellRxpackets;
  *(_QWORD *)((char *)a3 + 236) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)a3 + 1) = self->_tcpiCellRxbytes;
  *(_QWORD *)((char *)a3 + 236) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)a3 + 4) = self->_tcpiCellTxpackets;
  *(_QWORD *)((char *)a3 + 236) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)a3 + 3) = self->_tcpiCellTxbytes;
  *(_QWORD *)((char *)a3 + 236) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)a3 + 15) = self->_tcpiWifiRxpackets;
  *(_QWORD *)((char *)a3 + 236) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_40;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)a3 + 14) = self->_tcpiWifiRxbytes;
  *(_QWORD *)((char *)a3 + 236) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x8000) == 0)
      return;
LABEL_81:
    *((_QWORD *)a3 + 16) = self->_tcpiWifiTxbytes;
    *(_QWORD *)((char *)a3 + 236) |= 0x8000uLL;
    return;
  }
LABEL_80:
  *((_QWORD *)a3 + 17) = self->_tcpiWifiTxpackets;
  *(_QWORD *)((char *)a3 + 236) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000) != 0)
    goto LABEL_81;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $5C6CA8241D079C7FA6349ADB25A6B61D has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    *((_DWORD *)result + 55) = self->_tcpiState;
    *(_QWORD *)((char *)result + 236) |= 0x1000000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x400000000) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 38) = self->_tcpiOptions;
  *(_QWORD *)((char *)result + 236) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 53) = self->_tcpiSndWscale;
  *(_QWORD *)((char *)result + 236) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 42) = self->_tcpiRcvWscale;
  *(_QWORD *)((char *)result + 236) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 36) = self->_tcpiFlags;
  *(_QWORD *)((char *)result + 236) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 43) = self->_tcpiRto;
  *(_QWORD *)((char *)result + 236) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 48) = self->_tcpiSndMss;
  *(_QWORD *)((char *)result + 236) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 39) = self->_tcpiRcvMss;
  *(_QWORD *)((char *)result + 236) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 45) = self->_tcpiRttcur;
  *(_QWORD *)((char *)result + 236) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 54) = self->_tcpiSrtt;
  *(_QWORD *)((char *)result + 236) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 46) = self->_tcpiRttvar;
  *(_QWORD *)((char *)result + 236) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_14;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 44) = self->_tcpiRttbest;
  *(_QWORD *)((char *)result + 236) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_15;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 51) = self->_tcpiSndSsthresh;
  *(_QWORD *)((char *)result + 236) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)result + 47) = self->_tcpiSndCwnd;
  *(_QWORD *)((char *)result + 236) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_17;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)result + 41) = self->_tcpiRcvSpace;
  *(_QWORD *)((char *)result + 236) |= 0x400000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)result + 52) = self->_tcpiSndWnd;
  *(_QWORD *)((char *)result + 236) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)result + 49) = self->_tcpiSndNxt;
  *(_QWORD *)((char *)result + 236) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)result + 40) = self->_tcpiRcvNxt;
  *(_QWORD *)((char *)result + 236) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)result + 37) = self->_tcpiLastOutif;
  *(_QWORD *)((char *)result + 236) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)result + 50) = self->_tcpiSndSbbytes;
  *(_QWORD *)((char *)result + 236) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)result + 11) = self->_tcpiTxpackets;
  *(_QWORD *)((char *)result + 236) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)result + 10) = self->_tcpiTxbytes;
  *(_QWORD *)((char *)result + 236) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)result + 12) = self->_tcpiTxretransmitbytes;
  *(_QWORD *)((char *)result + 236) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)result + 13) = self->_tcpiTxunacked;
  *(_QWORD *)((char *)result + 236) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)result + 8) = self->_tcpiRxpackets;
  *(_QWORD *)((char *)result + 236) |= 0x80uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)result + 5) = self->_tcpiRxbytes;
  *(_QWORD *)((char *)result + 236) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)result + 6) = self->_tcpiRxduplicatebytes;
  *(_QWORD *)((char *)result + 236) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)result + 7) = self->_tcpiRxoutoforderbytes;
  *(_QWORD *)((char *)result + 236) |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)result + 9) = self->_tcpiSndBw;
  *(_QWORD *)((char *)result + 236) |= 0x100uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)result + 56) = self->_tcpiSynrexmits;
  *(_QWORD *)((char *)result + 236) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)result + 57) = self->_tcpiUnused1;
  *(_QWORD *)((char *)result + 236) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)result + 58) = self->_tcpiUnused2;
  *(_QWORD *)((char *)result + 236) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)result + 2) = self->_tcpiCellRxpackets;
  *(_QWORD *)((char *)result + 236) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)result + 1) = self->_tcpiCellRxbytes;
  *(_QWORD *)((char *)result + 236) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)result + 4) = self->_tcpiCellTxpackets;
  *(_QWORD *)((char *)result + 236) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)result + 3) = self->_tcpiCellTxbytes;
  *(_QWORD *)((char *)result + 236) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)result + 15) = self->_tcpiWifiRxpackets;
  *(_QWORD *)((char *)result + 236) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)result + 14) = self->_tcpiWifiRxbytes;
  *(_QWORD *)((char *)result + 236) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x8000) == 0)
      return result;
    goto LABEL_41;
  }
LABEL_81:
  *((_QWORD *)result + 17) = self->_tcpiWifiTxpackets;
  *(_QWORD *)((char *)result + 236) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000) == 0)
    return result;
LABEL_41:
  *((_QWORD *)result + 16) = self->_tcpiWifiTxbytes;
  *(_QWORD *)((char *)result + 236) |= 0x8000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $5C6CA8241D079C7FA6349ADB25A6B61D has;
  uint64_t v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *(_QWORD *)((char *)a3 + 236);
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_tcpiState != *((_DWORD *)a3 + 55))
        goto LABEL_201;
    }
    else if ((v7 & 0x1000000000) != 0)
    {
LABEL_201:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_tcpiOptions != *((_DWORD *)a3 + 38))
        goto LABEL_201;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_QWORD *)&has & 0x400000000) != 0)
    {
      if ((v7 & 0x400000000) == 0 || self->_tcpiSndWscale != *((_DWORD *)a3 + 53))
        goto LABEL_201;
    }
    else if ((v7 & 0x400000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_tcpiRcvWscale != *((_DWORD *)a3 + 42))
        goto LABEL_201;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_tcpiFlags != *((_DWORD *)a3 + 36))
        goto LABEL_201;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_tcpiRto != *((_DWORD *)a3 + 43))
        goto LABEL_201;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_tcpiSndMss != *((_DWORD *)a3 + 48))
        goto LABEL_201;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_tcpiRcvMss != *((_DWORD *)a3 + 39))
        goto LABEL_201;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_tcpiRttcur != *((_DWORD *)a3 + 45))
        goto LABEL_201;
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_QWORD *)&has & 0x800000000) != 0)
    {
      if ((v7 & 0x800000000) == 0 || self->_tcpiSrtt != *((_DWORD *)a3 + 54))
        goto LABEL_201;
    }
    else if ((v7 & 0x800000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_tcpiRttvar != *((_DWORD *)a3 + 46))
        goto LABEL_201;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_tcpiRttbest != *((_DWORD *)a3 + 44))
        goto LABEL_201;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_QWORD *)&has & 0x100000000) != 0)
    {
      if ((v7 & 0x100000000) == 0 || self->_tcpiSndSsthresh != *((_DWORD *)a3 + 51))
        goto LABEL_201;
    }
    else if ((v7 & 0x100000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_tcpiSndCwnd != *((_DWORD *)a3 + 47))
        goto LABEL_201;
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_tcpiRcvSpace != *((_DWORD *)a3 + 41))
        goto LABEL_201;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_QWORD *)&has & 0x200000000) != 0)
    {
      if ((v7 & 0x200000000) == 0 || self->_tcpiSndWnd != *((_DWORD *)a3 + 52))
        goto LABEL_201;
    }
    else if ((v7 & 0x200000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_tcpiSndNxt != *((_DWORD *)a3 + 49))
        goto LABEL_201;
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_tcpiRcvNxt != *((_DWORD *)a3 + 40))
        goto LABEL_201;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_tcpiLastOutif != *((_DWORD *)a3 + 37))
        goto LABEL_201;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_tcpiSndSbbytes != *((_DWORD *)a3 + 50))
        goto LABEL_201;
    }
    else if ((v7 & 0x80000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_tcpiTxpackets != *((_QWORD *)a3 + 11))
        goto LABEL_201;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_tcpiTxbytes != *((_QWORD *)a3 + 10))
        goto LABEL_201;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_tcpiTxretransmitbytes != *((_QWORD *)a3 + 12))
        goto LABEL_201;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_tcpiTxunacked != *((_QWORD *)a3 + 13))
        goto LABEL_201;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_tcpiRxpackets != *((_QWORD *)a3 + 8))
        goto LABEL_201;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_tcpiRxbytes != *((_QWORD *)a3 + 5))
        goto LABEL_201;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_tcpiRxduplicatebytes != *((_QWORD *)a3 + 6))
        goto LABEL_201;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_tcpiRxoutoforderbytes != *((_QWORD *)a3 + 7))
        goto LABEL_201;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_tcpiSndBw != *((_QWORD *)a3 + 9))
        goto LABEL_201;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
    {
      if ((v7 & 0x2000000000) == 0 || self->_tcpiSynrexmits != *((_DWORD *)a3 + 56))
        goto LABEL_201;
    }
    else if ((v7 & 0x2000000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
    {
      if ((v7 & 0x4000000000) == 0 || self->_tcpiUnused1 != *((_DWORD *)a3 + 57))
        goto LABEL_201;
    }
    else if ((v7 & 0x4000000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
    {
      if ((v7 & 0x8000000000) == 0 || self->_tcpiUnused2 != *((_DWORD *)a3 + 58))
        goto LABEL_201;
    }
    else if ((v7 & 0x8000000000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_tcpiCellRxpackets != *((_QWORD *)a3 + 2))
        goto LABEL_201;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_tcpiCellRxbytes != *((_QWORD *)a3 + 1))
        goto LABEL_201;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_tcpiCellTxpackets != *((_QWORD *)a3 + 4))
        goto LABEL_201;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_tcpiCellTxbytes != *((_QWORD *)a3 + 3))
        goto LABEL_201;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_tcpiWifiRxpackets != *((_QWORD *)a3 + 15))
        goto LABEL_201;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_tcpiWifiRxbytes != *((_QWORD *)a3 + 14))
        goto LABEL_201;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_201;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_tcpiWifiTxpackets != *((_QWORD *)a3 + 17))
        goto LABEL_201;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_201;
    }
    LOBYTE(v5) = (*(_QWORD *)((_BYTE *)a3 + 236) & 0x8000) == 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_tcpiWifiTxbytes != *((_QWORD *)a3 + 16))
        goto LABEL_201;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $5C6CA8241D079C7FA6349ADB25A6B61D has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    v43 = 2654435761 * self->_tcpiState;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
LABEL_3:
      v42 = 2654435761 * self->_tcpiOptions;
      if ((*(_QWORD *)&has & 0x400000000) != 0)
        goto LABEL_4;
      goto LABEL_44;
    }
  }
  else
  {
    v43 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_3;
  }
  v42 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_4:
    v41 = 2654435761 * self->_tcpiSndWscale;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_44:
  v41 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_5:
    v40 = 2654435761 * self->_tcpiRcvWscale;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_6;
    goto LABEL_46;
  }
LABEL_45:
  v40 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_6:
    v39 = 2654435761 * self->_tcpiFlags;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  v39 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_7:
    v38 = 2654435761 * self->_tcpiRto;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  v38 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_8:
    v37 = 2654435761 * self->_tcpiSndMss;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  v37 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_9:
    v36 = 2654435761 * self->_tcpiRcvMss;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_10:
    v35 = 2654435761 * self->_tcpiRttcur;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  v35 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_11:
    v34 = 2654435761 * self->_tcpiSrtt;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_12:
    v33 = 2654435761 * self->_tcpiRttvar;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_13:
    v32 = 2654435761 * self->_tcpiRttbest;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  v32 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_14:
    v31 = 2654435761 * self->_tcpiSndSsthresh;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_15:
    v30 = 2654435761 * self->_tcpiSndCwnd;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_16:
    v3 = 2654435761 * self->_tcpiRcvSpace;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  v3 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_17:
    v4 = 2654435761 * self->_tcpiSndWnd;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_18:
    v5 = 2654435761 * self->_tcpiSndNxt;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_19:
    v6 = 2654435761 * self->_tcpiRcvNxt;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    v7 = 2654435761 * self->_tcpiLastOutif;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_21:
    v8 = 2654435761 * self->_tcpiSndSbbytes;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_22:
    v9 = 2654435761u * self->_tcpiTxpackets;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  v9 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_23:
    v10 = 2654435761u * self->_tcpiTxbytes;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  v10 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_24:
    v11 = 2654435761u * self->_tcpiTxretransmitbytes;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_25:
    v12 = 2654435761u * self->_tcpiTxunacked;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  v12 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_26:
    v13 = 2654435761u * self->_tcpiRxpackets;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  v13 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_27:
    v14 = 2654435761u * self->_tcpiRxbytes;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  v14 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_28:
    v15 = 2654435761u * self->_tcpiRxduplicatebytes;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  v15 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_29:
    v16 = 2654435761u * self->_tcpiRxoutoforderbytes;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  v16 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_30:
    v17 = 2654435761u * self->_tcpiSndBw;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  v17 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_31:
    v18 = 2654435761 * self->_tcpiSynrexmits;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  v18 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_32:
    v19 = 2654435761 * self->_tcpiUnused1;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  v19 = 0;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_33:
    v20 = 2654435761 * self->_tcpiUnused2;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  v20 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_34:
    v21 = 2654435761u * self->_tcpiCellRxpackets;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  v21 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_35:
    v22 = 2654435761u * self->_tcpiCellRxbytes;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  v22 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_36:
    v23 = 2654435761u * self->_tcpiCellTxpackets;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  v23 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_37:
    v24 = 2654435761u * self->_tcpiCellTxbytes;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  v24 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_38:
    v25 = 2654435761u * self->_tcpiWifiRxpackets;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_39;
    goto LABEL_79;
  }
LABEL_78:
  v25 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_39:
    v26 = 2654435761u * self->_tcpiWifiRxbytes;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_40;
LABEL_80:
    v27 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_41;
LABEL_81:
    v28 = 0;
    return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_79:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_80;
LABEL_40:
  v27 = 2654435761u * self->_tcpiWifiTxpackets;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_81;
LABEL_41:
  v28 = 2654435761u * self->_tcpiWifiTxbytes;
  return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x1000000000) != 0)
  {
    self->_tcpiState = *((_DWORD *)a3 + 55);
    *(_QWORD *)&self->_has |= 0x1000000000uLL;
    v3 = *(_QWORD *)((char *)a3 + 236);
    if ((v3 & 0x80000) == 0)
    {
LABEL_3:
      if ((v3 & 0x400000000) == 0)
        goto LABEL_4;
      goto LABEL_44;
    }
  }
  else if ((v3 & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  self->_tcpiOptions = *((_DWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_4:
    if ((v3 & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_44:
  self->_tcpiSndWscale = *((_DWORD *)a3 + 53);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x800000) == 0)
  {
LABEL_5:
    if ((v3 & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_46;
  }
LABEL_45:
  self->_tcpiRcvWscale = *((_DWORD *)a3 + 42);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x20000) == 0)
  {
LABEL_6:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  self->_tcpiFlags = *((_DWORD *)a3 + 36);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  self->_tcpiRto = *((_DWORD *)a3 + 43);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  self->_tcpiSndMss = *((_DWORD *)a3 + 48);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x100000) == 0)
  {
LABEL_9:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  self->_tcpiRcvMss = *((_DWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_10:
    if ((v3 & 0x800000000) == 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  self->_tcpiRttcur = *((_DWORD *)a3 + 45);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_11:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  self->_tcpiSrtt = *((_DWORD *)a3 + 54);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  self->_tcpiRttvar = *((_DWORD *)a3 + 46);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_13:
    if ((v3 & 0x100000000) == 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  self->_tcpiRttbest = *((_DWORD *)a3 + 44);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_14:
    if ((v3 & 0x10000000) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  self->_tcpiSndSsthresh = *((_DWORD *)a3 + 51);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_15:
    if ((v3 & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  self->_tcpiSndCwnd = *((_DWORD *)a3 + 47);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x400000) == 0)
  {
LABEL_16:
    if ((v3 & 0x200000000) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  self->_tcpiRcvSpace = *((_DWORD *)a3 + 41);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_17:
    if ((v3 & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  self->_tcpiSndWnd = *((_DWORD *)a3 + 52);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_18:
    if ((v3 & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  self->_tcpiSndNxt = *((_DWORD *)a3 + 49);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x200000) == 0)
  {
LABEL_19:
    if ((v3 & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  self->_tcpiRcvNxt = *((_DWORD *)a3 + 40);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x40000) == 0)
  {
LABEL_20:
    if ((v3 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  self->_tcpiLastOutif = *((_DWORD *)a3 + 37);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_21:
    if ((v3 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  self->_tcpiSndSbbytes = *((_DWORD *)a3 + 50);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x400) == 0)
  {
LABEL_22:
    if ((v3 & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  self->_tcpiTxpackets = *((_QWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x200) == 0)
  {
LABEL_23:
    if ((v3 & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  self->_tcpiTxbytes = *((_QWORD *)a3 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x800) == 0)
  {
LABEL_24:
    if ((v3 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  self->_tcpiTxretransmitbytes = *((_QWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x1000) == 0)
  {
LABEL_25:
    if ((v3 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  self->_tcpiTxunacked = *((_QWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x80) == 0)
  {
LABEL_26:
    if ((v3 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  self->_tcpiRxpackets = *((_QWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x10) == 0)
  {
LABEL_27:
    if ((v3 & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  self->_tcpiRxbytes = *((_QWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x20) == 0)
  {
LABEL_28:
    if ((v3 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  self->_tcpiRxduplicatebytes = *((_QWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x40) == 0)
  {
LABEL_29:
    if ((v3 & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  self->_tcpiRxoutoforderbytes = *((_QWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x100) == 0)
  {
LABEL_30:
    if ((v3 & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  self->_tcpiSndBw = *((_QWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x4000000000) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  self->_tcpiSynrexmits = *((_DWORD *)a3 + 56);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x8000000000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  self->_tcpiUnused1 = *((_DWORD *)a3 + 57);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x8000000000) == 0)
  {
LABEL_33:
    if ((v3 & 2) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  self->_tcpiUnused2 = *((_DWORD *)a3 + 58);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 2) == 0)
  {
LABEL_34:
    if ((v3 & 1) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  self->_tcpiCellRxpackets = *((_QWORD *)a3 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 1) == 0)
  {
LABEL_35:
    if ((v3 & 8) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  self->_tcpiCellRxbytes = *((_QWORD *)a3 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 8) == 0)
  {
LABEL_36:
    if ((v3 & 4) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  self->_tcpiCellTxpackets = *((_QWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 4) == 0)
  {
LABEL_37:
    if ((v3 & 0x4000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  self->_tcpiCellTxbytes = *((_QWORD *)a3 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x4000) == 0)
  {
LABEL_38:
    if ((v3 & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_79;
  }
LABEL_78:
  self->_tcpiWifiRxpackets = *((_QWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x2000) == 0)
  {
LABEL_39:
    if ((v3 & 0x10000) == 0)
      goto LABEL_40;
    goto LABEL_80;
  }
LABEL_79:
  self->_tcpiWifiRxbytes = *((_QWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v3 = *(_QWORD *)((char *)a3 + 236);
  if ((v3 & 0x10000) == 0)
  {
LABEL_40:
    if ((v3 & 0x8000) == 0)
      return;
LABEL_81:
    self->_tcpiWifiTxbytes = *((_QWORD *)a3 + 16);
    *(_QWORD *)&self->_has |= 0x8000uLL;
    return;
  }
LABEL_80:
  self->_tcpiWifiTxpackets = *((_QWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  if ((*(_QWORD *)((_BYTE *)a3 + 236) & 0x8000) != 0)
    goto LABEL_81;
}

- (unsigned)tcpiState
{
  return self->_tcpiState;
}

- (unsigned)tcpiOptions
{
  return self->_tcpiOptions;
}

- (unsigned)tcpiSndWscale
{
  return self->_tcpiSndWscale;
}

- (unsigned)tcpiRcvWscale
{
  return self->_tcpiRcvWscale;
}

- (unsigned)tcpiFlags
{
  return self->_tcpiFlags;
}

- (unsigned)tcpiRto
{
  return self->_tcpiRto;
}

- (unsigned)tcpiSndMss
{
  return self->_tcpiSndMss;
}

- (unsigned)tcpiRcvMss
{
  return self->_tcpiRcvMss;
}

- (unsigned)tcpiRttcur
{
  return self->_tcpiRttcur;
}

- (unsigned)tcpiSrtt
{
  return self->_tcpiSrtt;
}

- (unsigned)tcpiRttvar
{
  return self->_tcpiRttvar;
}

- (unsigned)tcpiRttbest
{
  return self->_tcpiRttbest;
}

- (unsigned)tcpiSndSsthresh
{
  return self->_tcpiSndSsthresh;
}

- (unsigned)tcpiSndCwnd
{
  return self->_tcpiSndCwnd;
}

- (unsigned)tcpiRcvSpace
{
  return self->_tcpiRcvSpace;
}

- (unsigned)tcpiSndWnd
{
  return self->_tcpiSndWnd;
}

- (unsigned)tcpiSndNxt
{
  return self->_tcpiSndNxt;
}

- (unsigned)tcpiRcvNxt
{
  return self->_tcpiRcvNxt;
}

- (int)tcpiLastOutif
{
  return self->_tcpiLastOutif;
}

- (unsigned)tcpiSndSbbytes
{
  return self->_tcpiSndSbbytes;
}

- (unint64_t)tcpiTxpackets
{
  return self->_tcpiTxpackets;
}

- (unint64_t)tcpiTxbytes
{
  return self->_tcpiTxbytes;
}

- (unint64_t)tcpiTxretransmitbytes
{
  return self->_tcpiTxretransmitbytes;
}

- (unint64_t)tcpiTxunacked
{
  return self->_tcpiTxunacked;
}

- (unint64_t)tcpiRxpackets
{
  return self->_tcpiRxpackets;
}

- (unint64_t)tcpiRxbytes
{
  return self->_tcpiRxbytes;
}

- (unint64_t)tcpiRxduplicatebytes
{
  return self->_tcpiRxduplicatebytes;
}

- (unint64_t)tcpiRxoutoforderbytes
{
  return self->_tcpiRxoutoforderbytes;
}

- (unint64_t)tcpiSndBw
{
  return self->_tcpiSndBw;
}

- (int)tcpiSynrexmits
{
  return self->_tcpiSynrexmits;
}

- (int)tcpiUnused1
{
  return self->_tcpiUnused1;
}

- (unsigned)tcpiUnused2
{
  return self->_tcpiUnused2;
}

- (unint64_t)tcpiCellRxpackets
{
  return self->_tcpiCellRxpackets;
}

- (unint64_t)tcpiCellRxbytes
{
  return self->_tcpiCellRxbytes;
}

- (unint64_t)tcpiCellTxpackets
{
  return self->_tcpiCellTxpackets;
}

- (unint64_t)tcpiCellTxbytes
{
  return self->_tcpiCellTxbytes;
}

- (unint64_t)tcpiWifiRxpackets
{
  return self->_tcpiWifiRxpackets;
}

- (unint64_t)tcpiWifiRxbytes
{
  return self->_tcpiWifiRxbytes;
}

- (unint64_t)tcpiWifiTxpackets
{
  return self->_tcpiWifiTxpackets;
}

- (unint64_t)tcpiWifiTxbytes
{
  return self->_tcpiWifiTxbytes;
}

@end
