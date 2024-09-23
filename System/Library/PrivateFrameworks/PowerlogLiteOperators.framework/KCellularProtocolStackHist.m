@implementation KCellularProtocolStackHist

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasDurationMs
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setDurBin0:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_durBin0 = a3;
}

- (void)setHasDurBin0:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasDurBin0
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDurBin1:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_durBin1 = a3;
}

- (void)setHasDurBin1:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDurBin1
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDurBin2:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_durBin2 = a3;
}

- (void)setHasDurBin2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDurBin2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDurBin3:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_durBin3 = a3;
}

- (void)setHasDurBin3:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasDurBin3
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setDurBin4:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_durBin4 = a3;
}

- (void)setHasDurBin4:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasDurBin4
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setDurBin5:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_durBin5 = a3;
}

- (void)setHasDurBin5:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasDurBin5
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setDurBin6:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_durBin6 = a3;
}

- (void)setHasDurBin6:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasDurBin6
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setDurBin7:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_durBin7 = a3;
}

- (void)setHasDurBin7:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasDurBin7
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setDurBin8:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_durBin8 = a3;
}

- (void)setHasDurBin8:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasDurBin8
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setDurBin9:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_durBin9 = a3;
}

- (void)setHasDurBin9:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasDurBin9
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setDurBin10:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_durBin10 = a3;
}

- (void)setHasDurBin10:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDurBin10
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDurBin11:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_durBin11 = a3;
}

- (void)setHasDurBin11:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDurBin11
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDurBin12:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_durBin12 = a3;
}

- (void)setHasDurBin12:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDurBin12
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDurBin13:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_durBin13 = a3;
}

- (void)setHasDurBin13:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasDurBin13
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDurBin14:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_durBin14 = a3;
}

- (void)setHasDurBin14:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDurBin14
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setDurBin15:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_durBin15 = a3;
}

- (void)setHasDurBin15:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasDurBin15
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDurBin16:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_durBin16 = a3;
}

- (void)setHasDurBin16:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasDurBin16
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDurBin17:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_durBin17 = a3;
}

- (void)setHasDurBin17:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasDurBin17
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDurBin18:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_durBin18 = a3;
}

- (void)setHasDurBin18:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasDurBin18
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDurBin19:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_durBin19 = a3;
}

- (void)setHasDurBin19:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDurBin19
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDurBin20:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_durBin20 = a3;
}

- (void)setHasDurBin20:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDurBin20
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setDurBin21:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_durBin21 = a3;
}

- (void)setHasDurBin21:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasDurBin21
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDurBin22:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_durBin22 = a3;
}

- (void)setHasDurBin22:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasDurBin22
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setDurBin23:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_durBin23 = a3;
}

- (void)setHasDurBin23:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasDurBin23
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDurBin24:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_durBin24 = a3;
}

- (void)setHasDurBin24:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasDurBin24
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDurBin25:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_durBin25 = a3;
}

- (void)setHasDurBin25:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasDurBin25
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDurBin26:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_durBin26 = a3;
}

- (void)setHasDurBin26:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasDurBin26
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setDurBin27:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_durBin27 = a3;
}

- (void)setHasDurBin27:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasDurBin27
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setDurBin28:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_durBin28 = a3;
}

- (void)setHasDurBin28:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasDurBin28
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setDurBin29:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_durBin29 = a3;
}

- (void)setHasDurBin29:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasDurBin29
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setDurBin30:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_durBin30 = a3;
}

- (void)setHasDurBin30:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasDurBin30
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setDurBin31:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_durBin31 = a3;
}

- (void)setHasDurBin31:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasDurBin31
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($9B240677AAE68066214AA360F0D01CA1)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)KCellularProtocolStackHist;
  -[KCellularProtocolStackHist description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularProtocolStackHist dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $9B240677AAE68066214AA360F0D01CA1 has;
  void *v5;
  id v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_QWORD *)&has & 0x200000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durationMs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("duration_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("dur_bin_0"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("dur_bin_1"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("dur_bin_2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dur_bin_3"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dur_bin_4"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("dur_bin_5"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("dur_bin_6"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("dur_bin_7"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("dur_bin_8"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("dur_bin_9"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("dur_bin_10"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("dur_bin_11"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("dur_bin_12"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("dur_bin_13"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("dur_bin_14"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("dur_bin_15"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("dur_bin_16"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("dur_bin_17"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("dur_bin_18"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("dur_bin_19"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("dur_bin_20"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("dur_bin_21"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("dur_bin_22"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin23);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("dur_bin_23"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("dur_bin_24"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin25);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("dur_bin_25"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("dur_bin_26"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin27);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("dur_bin_27"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin28);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("dur_bin_28"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin29);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("dur_bin_29"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin30);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("dur_bin_30"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_36;
LABEL_73:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("subs_id"));

    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durBin31);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("dur_bin_31"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
    goto LABEL_73;
LABEL_36:
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  }
LABEL_38:
  v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularProtocolStackHistReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $9B240677AAE68066214AA360F0D01CA1 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x200000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_36;
LABEL_73:
    PBDataWriterWriteUint32Field();
    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
    goto LABEL_73;
LABEL_36:
  if ((*(_QWORD *)&has & 0x800000000) != 0)
LABEL_37:
    PBDataWriterWriteUint32Field();
LABEL_38:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $9B240677AAE68066214AA360F0D01CA1 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *(_QWORD *)((char *)v4 + 156) |= 1uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x200000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 36) = self->_durationMs;
  *(_QWORD *)((char *)v4 + 156) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 4) = self->_durBin0;
  *(_QWORD *)((char *)v4 + 156) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 5) = self->_durBin1;
  *(_QWORD *)((char *)v4 + 156) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 16) = self->_durBin2;
  *(_QWORD *)((char *)v4 + 156) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 27) = self->_durBin3;
  *(_QWORD *)((char *)v4 + 156) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 30) = self->_durBin4;
  *(_QWORD *)((char *)v4 + 156) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 31) = self->_durBin5;
  *(_QWORD *)((char *)v4 + 156) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 32) = self->_durBin6;
  *(_QWORD *)((char *)v4 + 156) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 33) = self->_durBin7;
  *(_QWORD *)((char *)v4 + 156) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 34) = self->_durBin8;
  *(_QWORD *)((char *)v4 + 156) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 35) = self->_durBin9;
  *(_QWORD *)((char *)v4 + 156) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 6) = self->_durBin10;
  *(_QWORD *)((char *)v4 + 156) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 7) = self->_durBin11;
  *(_QWORD *)((char *)v4 + 156) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 8) = self->_durBin12;
  *(_QWORD *)((char *)v4 + 156) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 9) = self->_durBin13;
  *(_QWORD *)((char *)v4 + 156) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 10) = self->_durBin14;
  *(_QWORD *)((char *)v4 + 156) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 11) = self->_durBin15;
  *(_QWORD *)((char *)v4 + 156) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 12) = self->_durBin16;
  *(_QWORD *)((char *)v4 + 156) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 13) = self->_durBin17;
  *(_QWORD *)((char *)v4 + 156) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 14) = self->_durBin18;
  *(_QWORD *)((char *)v4 + 156) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 15) = self->_durBin19;
  *(_QWORD *)((char *)v4 + 156) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 17) = self->_durBin20;
  *(_QWORD *)((char *)v4 + 156) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 18) = self->_durBin21;
  *(_QWORD *)((char *)v4 + 156) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 19) = self->_durBin22;
  *(_QWORD *)((char *)v4 + 156) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 20) = self->_durBin23;
  *(_QWORD *)((char *)v4 + 156) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 21) = self->_durBin24;
  *(_QWORD *)((char *)v4 + 156) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 22) = self->_durBin25;
  *(_QWORD *)((char *)v4 + 156) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 23) = self->_durBin26;
  *(_QWORD *)((char *)v4 + 156) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 24) = self->_durBin27;
  *(_QWORD *)((char *)v4 + 156) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 25) = self->_durBin28;
  *(_QWORD *)((char *)v4 + 156) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v4 + 26) = self->_durBin29;
  *(_QWORD *)((char *)v4 + 156) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v4 + 28) = self->_durBin30;
  *(_QWORD *)((char *)v4 + 156) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_36;
LABEL_73:
    *((_DWORD *)v4 + 37) = self->_subsId;
    *(_QWORD *)((char *)v4 + 156) |= 0x400000000uLL;
    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_72:
  *((_DWORD *)v4 + 29) = self->_durBin31;
  *(_QWORD *)((char *)v4 + 156) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
    goto LABEL_73;
LABEL_36:
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_37:
    *((_DWORD *)v4 + 38) = self->_version;
    *(_QWORD *)((char *)v4 + 156) |= 0x800000000uLL;
  }
LABEL_38:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  $9B240677AAE68066214AA360F0D01CA1 has;
  id v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v4 + 8) = self->_timestamp;
    *(_QWORD *)(v4 + 156) |= 1uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x200000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 144) = self->_durationMs;
  *(_QWORD *)(v4 + 156) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v4 + 16) = self->_durBin0;
  *(_QWORD *)(v4 + 156) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v4 + 20) = self->_durBin1;
  *(_QWORD *)(v4 + 156) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v4 + 64) = self->_durBin2;
  *(_QWORD *)(v4 + 156) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v4 + 108) = self->_durBin3;
  *(_QWORD *)(v4 + 156) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v4 + 120) = self->_durBin4;
  *(_QWORD *)(v4 + 156) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v4 + 124) = self->_durBin5;
  *(_QWORD *)(v4 + 156) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v4 + 128) = self->_durBin6;
  *(_QWORD *)(v4 + 156) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v4 + 132) = self->_durBin7;
  *(_QWORD *)(v4 + 156) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v4 + 136) = self->_durBin8;
  *(_QWORD *)(v4 + 156) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v4 + 140) = self->_durBin9;
  *(_QWORD *)(v4 + 156) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v4 + 24) = self->_durBin10;
  *(_QWORD *)(v4 + 156) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v4 + 28) = self->_durBin11;
  *(_QWORD *)(v4 + 156) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v4 + 32) = self->_durBin12;
  *(_QWORD *)(v4 + 156) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v4 + 36) = self->_durBin13;
  *(_QWORD *)(v4 + 156) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v4 + 40) = self->_durBin14;
  *(_QWORD *)(v4 + 156) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v4 + 44) = self->_durBin15;
  *(_QWORD *)(v4 + 156) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v4 + 48) = self->_durBin16;
  *(_QWORD *)(v4 + 156) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v4 + 52) = self->_durBin17;
  *(_QWORD *)(v4 + 156) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v4 + 56) = self->_durBin18;
  *(_QWORD *)(v4 + 156) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v4 + 60) = self->_durBin19;
  *(_QWORD *)(v4 + 156) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v4 + 68) = self->_durBin20;
  *(_QWORD *)(v4 + 156) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v4 + 72) = self->_durBin21;
  *(_QWORD *)(v4 + 156) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v4 + 76) = self->_durBin22;
  *(_QWORD *)(v4 + 156) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v4 + 80) = self->_durBin23;
  *(_QWORD *)(v4 + 156) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v4 + 84) = self->_durBin24;
  *(_QWORD *)(v4 + 156) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v4 + 88) = self->_durBin25;
  *(_QWORD *)(v4 + 156) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v4 + 92) = self->_durBin26;
  *(_QWORD *)(v4 + 156) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v4 + 96) = self->_durBin27;
  *(_QWORD *)(v4 + 156) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v4 + 100) = self->_durBin28;
  *(_QWORD *)(v4 + 156) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v4 + 104) = self->_durBin29;
  *(_QWORD *)(v4 + 156) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v4 + 112) = self->_durBin30;
  *(_QWORD *)(v4 + 156) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_36;
LABEL_73:
    *(_DWORD *)(v4 + 148) = self->_subsId;
    *(_QWORD *)(v4 + 156) |= 0x400000000uLL;
    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_72:
  *(_DWORD *)(v4 + 116) = self->_durBin31;
  *(_QWORD *)(v4 + 156) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
    goto LABEL_73;
LABEL_36:
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_37:
    *(_DWORD *)(v4 + 152) = self->_version;
    *(_QWORD *)(v4 + 156) |= 0x800000000uLL;
  }
LABEL_38:
  v6 = (id)v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  $9B240677AAE68066214AA360F0D01CA1 has;
  uint64_t v6;
  BOOL v7;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_182;
  has = self->_has;
  v6 = *(_QWORD *)(v4 + 156);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_182;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_182:
    v7 = 0;
    goto LABEL_183;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0 || self->_durationMs != *((_DWORD *)v4 + 36))
      goto LABEL_182;
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_durBin0 != *((_DWORD *)v4 + 4))
      goto LABEL_182;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_durBin1 != *((_DWORD *)v4 + 5))
      goto LABEL_182;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_durBin2 != *((_DWORD *)v4 + 16))
      goto LABEL_182;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_durBin3 != *((_DWORD *)v4 + 27))
      goto LABEL_182;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_durBin4 != *((_DWORD *)v4 + 30))
      goto LABEL_182;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_durBin5 != *((_DWORD *)v4 + 31))
      goto LABEL_182;
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_durBin6 != *((_DWORD *)v4 + 32))
      goto LABEL_182;
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_durBin7 != *((_DWORD *)v4 + 33))
      goto LABEL_182;
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_durBin8 != *((_DWORD *)v4 + 34))
      goto LABEL_182;
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_durBin9 != *((_DWORD *)v4 + 35))
      goto LABEL_182;
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durBin10 != *((_DWORD *)v4 + 6))
      goto LABEL_182;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_durBin11 != *((_DWORD *)v4 + 7))
      goto LABEL_182;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_durBin12 != *((_DWORD *)v4 + 8))
      goto LABEL_182;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_durBin13 != *((_DWORD *)v4 + 9))
      goto LABEL_182;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_durBin14 != *((_DWORD *)v4 + 10))
      goto LABEL_182;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_durBin15 != *((_DWORD *)v4 + 11))
      goto LABEL_182;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_durBin16 != *((_DWORD *)v4 + 12))
      goto LABEL_182;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_durBin17 != *((_DWORD *)v4 + 13))
      goto LABEL_182;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_durBin18 != *((_DWORD *)v4 + 14))
      goto LABEL_182;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_durBin19 != *((_DWORD *)v4 + 15))
      goto LABEL_182;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_durBin20 != *((_DWORD *)v4 + 17))
      goto LABEL_182;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_durBin21 != *((_DWORD *)v4 + 18))
      goto LABEL_182;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_durBin22 != *((_DWORD *)v4 + 19))
      goto LABEL_182;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_durBin23 != *((_DWORD *)v4 + 20))
      goto LABEL_182;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_durBin24 != *((_DWORD *)v4 + 21))
      goto LABEL_182;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_durBin25 != *((_DWORD *)v4 + 22))
      goto LABEL_182;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_durBin26 != *((_DWORD *)v4 + 23))
      goto LABEL_182;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_durBin27 != *((_DWORD *)v4 + 24))
      goto LABEL_182;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_durBin28 != *((_DWORD *)v4 + 25))
      goto LABEL_182;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_durBin29 != *((_DWORD *)v4 + 26))
      goto LABEL_182;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_durBin30 != *((_DWORD *)v4 + 28))
      goto LABEL_182;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_durBin31 != *((_DWORD *)v4 + 29))
      goto LABEL_182;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_subsId != *((_DWORD *)v4 + 37))
      goto LABEL_182;
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_182;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_version != *((_DWORD *)v4 + 38))
      goto LABEL_182;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x800000000) == 0;
  }
LABEL_183:

  return v7;
}

- (unint64_t)hash
{
  $9B240677AAE68066214AA360F0D01CA1 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v39 = 2654435761u * self->_timestamp;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
    {
LABEL_3:
      v38 = 2654435761 * self->_durationMs;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else
  {
    v39 = 0;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_3;
  }
  v38 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_4:
    v37 = 2654435761 * self->_durBin0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  v37 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v36 = 2654435761 * self->_durBin1;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  v36 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    v35 = 2654435761 * self->_durBin2;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_7:
    v34 = 2654435761 * self->_durBin3;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_8:
    v33 = 2654435761 * self->_durBin4;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_9:
    v32 = 2654435761 * self->_durBin5;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_10:
    v31 = 2654435761 * self->_durBin6;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_11:
    v30 = 2654435761 * self->_durBin7;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_12:
    v3 = 2654435761 * self->_durBin8;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  v3 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_13:
    v4 = 2654435761 * self->_durBin9;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  v4 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_14:
    v5 = 2654435761 * self->_durBin10;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_15:
    v6 = 2654435761 * self->_durBin11;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  v6 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_16:
    v7 = 2654435761 * self->_durBin12;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_17:
    v8 = 2654435761 * self->_durBin13;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_18:
    v9 = 2654435761 * self->_durBin14;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  v9 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_19:
    v10 = 2654435761 * self->_durBin15;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  v10 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_20:
    v11 = 2654435761 * self->_durBin16;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  v11 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_21:
    v12 = 2654435761 * self->_durBin17;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  v12 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_22:
    v13 = 2654435761 * self->_durBin18;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  v13 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_23:
    v14 = 2654435761 * self->_durBin19;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  v14 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_24:
    v15 = 2654435761 * self->_durBin20;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  v15 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_25:
    v16 = 2654435761 * self->_durBin21;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_26:
    v17 = 2654435761 * self->_durBin22;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_27:
    v18 = 2654435761 * self->_durBin23;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_28:
    v19 = 2654435761 * self->_durBin24;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_29:
    v20 = 2654435761 * self->_durBin25;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_30:
    v21 = 2654435761 * self->_durBin26;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_31:
    v22 = 2654435761 * self->_durBin27;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_32:
    v23 = 2654435761 * self->_durBin28;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_33:
    v24 = 2654435761 * self->_durBin29;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_34:
    v25 = 2654435761 * self->_durBin30;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_35;
    goto LABEL_71;
  }
LABEL_70:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_35:
    v26 = 2654435761 * self->_durBin31;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_36;
LABEL_72:
    v27 = 0;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_37;
LABEL_73:
    v28 = 0;
    return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_71:
  v26 = 0;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
    goto LABEL_72;
LABEL_36:
  v27 = 2654435761 * self->_subsId;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
    goto LABEL_73;
LABEL_37:
  v28 = 2654435761 * self->_version;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a3;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v5 = *(_QWORD *)(v4 + 156);
    if ((v5 & 0x200000000) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((v5 & 0x200000000) == 0)
  {
    goto LABEL_3;
  }
  self->_durationMs = *((_DWORD *)v4 + 36);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  self->_durBin0 = *((_DWORD *)v4 + 4);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  self->_durBin1 = *((_DWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  self->_durBin2 = *((_DWORD *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  self->_durBin3 = *((_DWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  self->_durBin4 = *((_DWORD *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  self->_durBin5 = *((_DWORD *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  self->_durBin6 = *((_DWORD *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  self->_durBin7 = *((_DWORD *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  self->_durBin8 = *((_DWORD *)v4 + 34);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  self->_durBin9 = *((_DWORD *)v4 + 35);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 8) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  self->_durBin10 = *((_DWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x10) == 0)
  {
LABEL_15:
    if ((v5 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  self->_durBin11 = *((_DWORD *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x20) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  self->_durBin12 = *((_DWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    if ((v5 & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  self->_durBin13 = *((_DWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x80) == 0)
  {
LABEL_18:
    if ((v5 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  self->_durBin14 = *((_DWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x100) == 0)
  {
LABEL_19:
    if ((v5 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  self->_durBin15 = *((_DWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x200) == 0)
  {
LABEL_20:
    if ((v5 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  self->_durBin16 = *((_DWORD *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x400) == 0)
  {
LABEL_21:
    if ((v5 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  self->_durBin17 = *((_DWORD *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x800) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  self->_durBin18 = *((_DWORD *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  self->_durBin19 = *((_DWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  self->_durBin20 = *((_DWORD *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x8000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  self->_durBin21 = *((_DWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x10000) == 0)
  {
LABEL_26:
    if ((v5 & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  self->_durBin22 = *((_DWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x20000) == 0)
  {
LABEL_27:
    if ((v5 & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  self->_durBin23 = *((_DWORD *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x40000) == 0)
  {
LABEL_28:
    if ((v5 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  self->_durBin24 = *((_DWORD *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x80000) == 0)
  {
LABEL_29:
    if ((v5 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  self->_durBin25 = *((_DWORD *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x100000) == 0)
  {
LABEL_30:
    if ((v5 & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  self->_durBin26 = *((_DWORD *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x200000) == 0)
  {
LABEL_31:
    if ((v5 & 0x400000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  self->_durBin27 = *((_DWORD *)v4 + 24);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x400000) == 0)
  {
LABEL_32:
    if ((v5 & 0x800000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  self->_durBin28 = *((_DWORD *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x800000) == 0)
  {
LABEL_33:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  self->_durBin29 = *((_DWORD *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  self->_durBin30 = *((_DWORD *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_36;
LABEL_73:
    self->_subsId = *((_DWORD *)v4 + 37);
    *(_QWORD *)&self->_has |= 0x400000000uLL;
    if ((*(_QWORD *)(v4 + 156) & 0x800000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_72:
  self->_durBin31 = *((_DWORD *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x400000000) != 0)
    goto LABEL_73;
LABEL_36:
  if ((v5 & 0x800000000) != 0)
  {
LABEL_37:
    self->_version = *((_DWORD *)v4 + 38);
    *(_QWORD *)&self->_has |= 0x800000000uLL;
  }
LABEL_38:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)durBin0
{
  return self->_durBin0;
}

- (unsigned)durBin1
{
  return self->_durBin1;
}

- (unsigned)durBin2
{
  return self->_durBin2;
}

- (unsigned)durBin3
{
  return self->_durBin3;
}

- (unsigned)durBin4
{
  return self->_durBin4;
}

- (unsigned)durBin5
{
  return self->_durBin5;
}

- (unsigned)durBin6
{
  return self->_durBin6;
}

- (unsigned)durBin7
{
  return self->_durBin7;
}

- (unsigned)durBin8
{
  return self->_durBin8;
}

- (unsigned)durBin9
{
  return self->_durBin9;
}

- (unsigned)durBin10
{
  return self->_durBin10;
}

- (unsigned)durBin11
{
  return self->_durBin11;
}

- (unsigned)durBin12
{
  return self->_durBin12;
}

- (unsigned)durBin13
{
  return self->_durBin13;
}

- (unsigned)durBin14
{
  return self->_durBin14;
}

- (unsigned)durBin15
{
  return self->_durBin15;
}

- (unsigned)durBin16
{
  return self->_durBin16;
}

- (unsigned)durBin17
{
  return self->_durBin17;
}

- (unsigned)durBin18
{
  return self->_durBin18;
}

- (unsigned)durBin19
{
  return self->_durBin19;
}

- (unsigned)durBin20
{
  return self->_durBin20;
}

- (unsigned)durBin21
{
  return self->_durBin21;
}

- (unsigned)durBin22
{
  return self->_durBin22;
}

- (unsigned)durBin23
{
  return self->_durBin23;
}

- (unsigned)durBin24
{
  return self->_durBin24;
}

- (unsigned)durBin25
{
  return self->_durBin25;
}

- (unsigned)durBin26
{
  return self->_durBin26;
}

- (unsigned)durBin27
{
  return self->_durBin27;
}

- (unsigned)durBin28
{
  return self->_durBin28;
}

- (unsigned)durBin29
{
  return self->_durBin29;
}

- (unsigned)durBin30
{
  return self->_durBin30;
}

- (unsigned)durBin31
{
  return self->_durBin31;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)version
{
  return self->_version;
}

@end
