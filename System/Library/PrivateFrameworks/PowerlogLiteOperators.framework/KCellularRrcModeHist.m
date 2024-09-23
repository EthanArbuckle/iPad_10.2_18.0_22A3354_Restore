@implementation KCellularRrcModeHist

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDurationMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIdleDurBin0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_idleDurBin0 = a3;
}

- (void)setHasIdleDurBin0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIdleDurBin0
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIdleDurBin1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_idleDurBin1 = a3;
}

- (void)setHasIdleDurBin1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIdleDurBin1
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIdleDurBin2:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_idleDurBin2 = a3;
}

- (void)setHasIdleDurBin2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIdleDurBin2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIdleDurBin3:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_idleDurBin3 = a3;
}

- (void)setHasIdleDurBin3:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIdleDurBin3
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIdleDurBin4:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_idleDurBin4 = a3;
}

- (void)setHasIdleDurBin4:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIdleDurBin4
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIdleDurBin5:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_idleDurBin5 = a3;
}

- (void)setHasIdleDurBin5:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIdleDurBin5
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIdleDurBin6:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_idleDurBin6 = a3;
}

- (void)setHasIdleDurBin6:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIdleDurBin6
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setIdleDurBin7:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_idleDurBin7 = a3;
}

- (void)setHasIdleDurBin7:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIdleDurBin7
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIdleDurBin8:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_idleDurBin8 = a3;
}

- (void)setHasIdleDurBin8:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIdleDurBin8
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIdleDurBin9:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_idleDurBin9 = a3;
}

- (void)setHasIdleDurBin9:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIdleDurBin9
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIdleDurBin10:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_idleDurBin10 = a3;
}

- (void)setHasIdleDurBin10:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIdleDurBin10
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIdleDurBin11:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_idleDurBin11 = a3;
}

- (void)setHasIdleDurBin11:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIdleDurBin11
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIdleDurBin12:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_idleDurBin12 = a3;
}

- (void)setHasIdleDurBin12:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIdleDurBin12
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setConnDurBin0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_connDurBin0 = a3;
}

- (void)setHasConnDurBin0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConnDurBin0
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConnDurBin1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_connDurBin1 = a3;
}

- (void)setHasConnDurBin1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConnDurBin1
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setConnDurBin2:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_connDurBin2 = a3;
}

- (void)setHasConnDurBin2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasConnDurBin2
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setConnDurBin3:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_connDurBin3 = a3;
}

- (void)setHasConnDurBin3:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasConnDurBin3
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setConnDurBin4:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_connDurBin4 = a3;
}

- (void)setHasConnDurBin4:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasConnDurBin4
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setConnDurBin5:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_connDurBin5 = a3;
}

- (void)setHasConnDurBin5:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasConnDurBin5
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setConnDurBin6:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_connDurBin6 = a3;
}

- (void)setHasConnDurBin6:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasConnDurBin6
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setConnDurBin7:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_connDurBin7 = a3;
}

- (void)setHasConnDurBin7:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasConnDurBin7
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setConnDurBin8:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_connDurBin8 = a3;
}

- (void)setHasConnDurBin8:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasConnDurBin8
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setConnDurBin9:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_connDurBin9 = a3;
}

- (void)setHasConnDurBin9:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasConnDurBin9
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setConnDurBin10:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_connDurBin10 = a3;
}

- (void)setHasConnDurBin10:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasConnDurBin10
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setConnDurBin11:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_connDurBin11 = a3;
}

- (void)setHasConnDurBin11:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasConnDurBin11
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setConnDurBin12:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_connDurBin12 = a3;
}

- (void)setHasConnDurBin12:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasConnDurBin12
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
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
  v8.super_class = (Class)KCellularRrcModeHist;
  -[KCellularRrcModeHist description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularRrcModeHist dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $822B6F46BB0A52EB0243F2BF462E3966 has;
  void *v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durationMs);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("duration_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("idle_dur_bin_0"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("idle_dur_bin_1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("idle_dur_bin_2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("idle_dur_bin_3"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("idle_dur_bin_4"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("idle_dur_bin_5"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("idle_dur_bin_6"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("idle_dur_bin_7"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("idle_dur_bin_8"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("idle_dur_bin_9"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("idle_dur_bin_10"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("idle_dur_bin_11"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleDurBin12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("idle_dur_bin_12"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("conn_dur_bin_0"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("conn_dur_bin_1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("conn_dur_bin_2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("conn_dur_bin_3"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("conn_dur_bin_4"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("conn_dur_bin_5"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("conn_dur_bin_6"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("conn_dur_bin_7"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("conn_dur_bin_8"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("conn_dur_bin_9"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("conn_dur_bin_10"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
LABEL_59:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("conn_dur_bin_12"));

    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      return v3;
    goto LABEL_30;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_connDurBin11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("conn_dur_bin_11"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_59;
LABEL_29:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularRrcModeHistReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $822B6F46BB0A52EB0243F2BF462E3966 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
LABEL_59:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_59;
LABEL_29:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
LABEL_30:
    PBDataWriterWriteUint32Field();
LABEL_31:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $822B6F46BB0A52EB0243F2BF462E3966 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 32) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 17) = self->_durationMs;
  *((_DWORD *)v4 + 32) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 18) = self->_idleDurBin0;
  *((_DWORD *)v4 + 32) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 19) = self->_idleDurBin1;
  *((_DWORD *)v4 + 32) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 23) = self->_idleDurBin2;
  *((_DWORD *)v4 + 32) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 24) = self->_idleDurBin3;
  *((_DWORD *)v4 + 32) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 25) = self->_idleDurBin4;
  *((_DWORD *)v4 + 32) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 26) = self->_idleDurBin5;
  *((_DWORD *)v4 + 32) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 27) = self->_idleDurBin6;
  *((_DWORD *)v4 + 32) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 28) = self->_idleDurBin7;
  *((_DWORD *)v4 + 32) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 29) = self->_idleDurBin8;
  *((_DWORD *)v4 + 32) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 30) = self->_idleDurBin9;
  *((_DWORD *)v4 + 32) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 20) = self->_idleDurBin10;
  *((_DWORD *)v4 + 32) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 21) = self->_idleDurBin11;
  *((_DWORD *)v4 + 32) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 22) = self->_idleDurBin12;
  *((_DWORD *)v4 + 32) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 4) = self->_connDurBin0;
  *((_DWORD *)v4 + 32) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 5) = self->_connDurBin1;
  *((_DWORD *)v4 + 32) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 9) = self->_connDurBin2;
  *((_DWORD *)v4 + 32) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 10) = self->_connDurBin3;
  *((_DWORD *)v4 + 32) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 11) = self->_connDurBin4;
  *((_DWORD *)v4 + 32) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 12) = self->_connDurBin5;
  *((_DWORD *)v4 + 32) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 13) = self->_connDurBin6;
  *((_DWORD *)v4 + 32) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 14) = self->_connDurBin7;
  *((_DWORD *)v4 + 32) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 15) = self->_connDurBin8;
  *((_DWORD *)v4 + 32) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 16) = self->_connDurBin9;
  *((_DWORD *)v4 + 32) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 6) = self->_connDurBin10;
  *((_DWORD *)v4 + 32) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
LABEL_59:
    *((_DWORD *)v4 + 8) = self->_connDurBin12;
    *((_DWORD *)v4 + 32) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_58:
  *((_DWORD *)v4 + 7) = self->_connDurBin11;
  *((_DWORD *)v4 + 32) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_59;
LABEL_29:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_30:
    *((_DWORD *)v4 + 31) = self->_subsId;
    *((_DWORD *)v4 + 32) |= 0x10000000u;
  }
LABEL_31:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $822B6F46BB0A52EB0243F2BF462E3966 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 32) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 17) = self->_durationMs;
  *((_DWORD *)result + 32) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 18) = self->_idleDurBin0;
  *((_DWORD *)result + 32) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 19) = self->_idleDurBin1;
  *((_DWORD *)result + 32) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 23) = self->_idleDurBin2;
  *((_DWORD *)result + 32) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 24) = self->_idleDurBin3;
  *((_DWORD *)result + 32) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 25) = self->_idleDurBin4;
  *((_DWORD *)result + 32) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 26) = self->_idleDurBin5;
  *((_DWORD *)result + 32) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 27) = self->_idleDurBin6;
  *((_DWORD *)result + 32) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 28) = self->_idleDurBin7;
  *((_DWORD *)result + 32) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 29) = self->_idleDurBin8;
  *((_DWORD *)result + 32) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 30) = self->_idleDurBin9;
  *((_DWORD *)result + 32) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 20) = self->_idleDurBin10;
  *((_DWORD *)result + 32) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 21) = self->_idleDurBin11;
  *((_DWORD *)result + 32) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 22) = self->_idleDurBin12;
  *((_DWORD *)result + 32) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 4) = self->_connDurBin0;
  *((_DWORD *)result + 32) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 5) = self->_connDurBin1;
  *((_DWORD *)result + 32) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 9) = self->_connDurBin2;
  *((_DWORD *)result + 32) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 10) = self->_connDurBin3;
  *((_DWORD *)result + 32) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 11) = self->_connDurBin4;
  *((_DWORD *)result + 32) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 12) = self->_connDurBin5;
  *((_DWORD *)result + 32) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 13) = self->_connDurBin6;
  *((_DWORD *)result + 32) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 14) = self->_connDurBin7;
  *((_DWORD *)result + 32) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 15) = self->_connDurBin8;
  *((_DWORD *)result + 32) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)result + 16) = self->_connDurBin9;
  *((_DWORD *)result + 32) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)result + 6) = self->_connDurBin10;
  *((_DWORD *)result + 32) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)result + 7) = self->_connDurBin11;
  *((_DWORD *)result + 32) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      return result;
    goto LABEL_30;
  }
LABEL_59:
  *((_DWORD *)result + 8) = self->_connDurBin12;
  *((_DWORD *)result + 32) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
    return result;
LABEL_30:
  *((_DWORD *)result + 31) = self->_subsId;
  *((_DWORD *)result + 32) |= 0x10000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $822B6F46BB0A52EB0243F2BF462E3966 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_147;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 32);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_147;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_147:
    v7 = 0;
    goto LABEL_148;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_durationMs != *((_DWORD *)v4 + 17))
      goto LABEL_147;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_idleDurBin0 != *((_DWORD *)v4 + 18))
      goto LABEL_147;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_idleDurBin1 != *((_DWORD *)v4 + 19))
      goto LABEL_147;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_idleDurBin2 != *((_DWORD *)v4 + 23))
      goto LABEL_147;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_idleDurBin3 != *((_DWORD *)v4 + 24))
      goto LABEL_147;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_idleDurBin4 != *((_DWORD *)v4 + 25))
      goto LABEL_147;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_idleDurBin5 != *((_DWORD *)v4 + 26))
      goto LABEL_147;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_idleDurBin6 != *((_DWORD *)v4 + 27))
      goto LABEL_147;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_idleDurBin7 != *((_DWORD *)v4 + 28))
      goto LABEL_147;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_idleDurBin8 != *((_DWORD *)v4 + 29))
      goto LABEL_147;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_idleDurBin9 != *((_DWORD *)v4 + 30))
      goto LABEL_147;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_idleDurBin10 != *((_DWORD *)v4 + 20))
      goto LABEL_147;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_idleDurBin11 != *((_DWORD *)v4 + 21))
      goto LABEL_147;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_idleDurBin12 != *((_DWORD *)v4 + 22))
      goto LABEL_147;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_connDurBin0 != *((_DWORD *)v4 + 4))
      goto LABEL_147;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_connDurBin1 != *((_DWORD *)v4 + 5))
      goto LABEL_147;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_connDurBin2 != *((_DWORD *)v4 + 9))
      goto LABEL_147;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_connDurBin3 != *((_DWORD *)v4 + 10))
      goto LABEL_147;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_connDurBin4 != *((_DWORD *)v4 + 11))
      goto LABEL_147;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_connDurBin5 != *((_DWORD *)v4 + 12))
      goto LABEL_147;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_connDurBin6 != *((_DWORD *)v4 + 13))
      goto LABEL_147;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_connDurBin7 != *((_DWORD *)v4 + 14))
      goto LABEL_147;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_connDurBin8 != *((_DWORD *)v4 + 15))
      goto LABEL_147;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_connDurBin9 != *((_DWORD *)v4 + 16))
      goto LABEL_147;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_connDurBin10 != *((_DWORD *)v4 + 6))
      goto LABEL_147;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_connDurBin11 != *((_DWORD *)v4 + 7))
      goto LABEL_147;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_connDurBin12 != *((_DWORD *)v4 + 8))
      goto LABEL_147;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_subsId != *((_DWORD *)v4 + 31))
      goto LABEL_147;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x10000000) == 0;
  }
LABEL_148:

  return v7;
}

- (unint64_t)hash
{
  $822B6F46BB0A52EB0243F2BF462E3966 has;
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
  uint64_t v29;
  uint64_t v31;
  unint64_t v32;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v32 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      v31 = 2654435761 * self->_durationMs;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_3;
  }
  v31 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v3 = 2654435761 * self->_idleDurBin0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  v3 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_idleDurBin1;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_idleDurBin2;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_idleDurBin3;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_idleDurBin4;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_idleDurBin5;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_10:
    v9 = 2654435761 * self->_idleDurBin6;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_11:
    v10 = 2654435761 * self->_idleDurBin7;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_12:
    v11 = 2654435761 * self->_idleDurBin8;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_13:
    v12 = 2654435761 * self->_idleDurBin9;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_14:
    v13 = 2654435761 * self->_idleDurBin10;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_15:
    v14 = 2654435761 * self->_idleDurBin11;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_16:
    v15 = 2654435761 * self->_idleDurBin12;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  v15 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_17:
    v16 = 2654435761 * self->_connDurBin0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  v16 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_18:
    v17 = 2654435761 * self->_connDurBin1;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  v17 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_19:
    v18 = 2654435761 * self->_connDurBin2;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  v18 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_20:
    v19 = 2654435761 * self->_connDurBin3;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  v19 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_21:
    v20 = 2654435761 * self->_connDurBin4;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  v20 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_22:
    v21 = 2654435761 * self->_connDurBin5;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_23:
    v22 = 2654435761 * self->_connDurBin6;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  v22 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_24:
    v23 = 2654435761 * self->_connDurBin7;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  v23 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_25:
    v24 = 2654435761 * self->_connDurBin8;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_26:
    v25 = 2654435761 * self->_connDurBin9;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  v25 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_27:
    v26 = 2654435761 * self->_connDurBin10;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  v26 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_28:
    v27 = 2654435761 * self->_connDurBin11;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_29;
LABEL_58:
    v28 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_30;
LABEL_59:
    v29 = 0;
    return v31 ^ v32 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_57:
  v27 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_58;
LABEL_29:
  v28 = 2654435761 * self->_connDurBin12;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
    goto LABEL_59;
LABEL_30:
  v29 = 2654435761 * self->_subsId;
  return v31 ^ v32 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 32);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_durationMs = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  self->_idleDurBin0 = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x10000) == 0)
  {
LABEL_5:
    if ((v5 & 0x100000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  self->_idleDurBin1 = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x100000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  self->_idleDurBin2 = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x200000) == 0)
  {
LABEL_7:
    if ((v5 & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  self->_idleDurBin3 = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x400000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  self->_idleDurBin4 = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  self->_idleDurBin5 = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  self->_idleDurBin6 = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  self->_idleDurBin7 = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  self->_idleDurBin8 = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  self->_idleDurBin9 = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x20000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  self->_idleDurBin10 = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  self->_idleDurBin11 = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x80000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  self->_idleDurBin12 = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  self->_connDurBin0 = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_18:
    if ((v5 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  self->_connDurBin1 = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_19:
    if ((v5 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  self->_connDurBin2 = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_20:
    if ((v5 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  self->_connDurBin3 = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_21:
    if ((v5 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  self->_connDurBin4 = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_22:
    if ((v5 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  self->_connDurBin5 = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_23:
    if ((v5 & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  self->_connDurBin6 = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_24:
    if ((v5 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  self->_connDurBin7 = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  self->_connDurBin8 = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  self->_connDurBin9 = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_27:
    if ((v5 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  self->_connDurBin10 = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_28:
    if ((v5 & 0x20) == 0)
      goto LABEL_29;
LABEL_59:
    self->_connDurBin12 = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x20u;
    if ((*((_DWORD *)v4 + 32) & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_58:
  self->_connDurBin11 = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x20) != 0)
    goto LABEL_59;
LABEL_29:
  if ((v5 & 0x10000000) != 0)
  {
LABEL_30:
    self->_subsId = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_has |= 0x10000000u;
  }
LABEL_31:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)idleDurBin0
{
  return self->_idleDurBin0;
}

- (unsigned)idleDurBin1
{
  return self->_idleDurBin1;
}

- (unsigned)idleDurBin2
{
  return self->_idleDurBin2;
}

- (unsigned)idleDurBin3
{
  return self->_idleDurBin3;
}

- (unsigned)idleDurBin4
{
  return self->_idleDurBin4;
}

- (unsigned)idleDurBin5
{
  return self->_idleDurBin5;
}

- (unsigned)idleDurBin6
{
  return self->_idleDurBin6;
}

- (unsigned)idleDurBin7
{
  return self->_idleDurBin7;
}

- (unsigned)idleDurBin8
{
  return self->_idleDurBin8;
}

- (unsigned)idleDurBin9
{
  return self->_idleDurBin9;
}

- (unsigned)idleDurBin10
{
  return self->_idleDurBin10;
}

- (unsigned)idleDurBin11
{
  return self->_idleDurBin11;
}

- (unsigned)idleDurBin12
{
  return self->_idleDurBin12;
}

- (unsigned)connDurBin0
{
  return self->_connDurBin0;
}

- (unsigned)connDurBin1
{
  return self->_connDurBin1;
}

- (unsigned)connDurBin2
{
  return self->_connDurBin2;
}

- (unsigned)connDurBin3
{
  return self->_connDurBin3;
}

- (unsigned)connDurBin4
{
  return self->_connDurBin4;
}

- (unsigned)connDurBin5
{
  return self->_connDurBin5;
}

- (unsigned)connDurBin6
{
  return self->_connDurBin6;
}

- (unsigned)connDurBin7
{
  return self->_connDurBin7;
}

- (unsigned)connDurBin8
{
  return self->_connDurBin8;
}

- (unsigned)connDurBin9
{
  return self->_connDurBin9;
}

- (unsigned)connDurBin10
{
  return self->_connDurBin10;
}

- (unsigned)connDurBin11
{
  return self->_connDurBin11;
}

- (unsigned)connDurBin12
{
  return self->_connDurBin12;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
