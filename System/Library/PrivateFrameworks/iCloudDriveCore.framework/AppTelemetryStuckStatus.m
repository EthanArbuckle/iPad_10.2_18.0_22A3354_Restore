@implementation AppTelemetryStuckStatus

- (void)setItemPendingReconciliationIsLocked:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_itemPendingReconciliationIsLocked = a3;
}

- (void)setHasItemPendingReconciliationIsLocked:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasItemPendingReconciliationIsLocked
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setItemPendingReconciliationIsLockedInDB:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_itemPendingReconciliationIsLockedInDB = a3;
}

- (void)setHasItemPendingReconciliationIsLockedInDB:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasItemPendingReconciliationIsLockedInDB
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setItemPendingReconciliationJobCode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_itemPendingReconciliationJobCode = a3;
}

- (void)setHasItemPendingReconciliationJobCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasItemPendingReconciliationJobCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setItemPendingReconciliationJobSchedulingState:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_itemPendingReconciliationJobSchedulingState = a3;
}

- (void)setHasItemPendingReconciliationJobSchedulingState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasItemPendingReconciliationJobSchedulingState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setItemPendingReconciliationJobBlockingCode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_itemPendingReconciliationJobBlockingCode = a3;
}

- (void)setHasItemPendingReconciliationJobBlockingCode:(BOOL)a3
{
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasItemPendingReconciliationJobBlockingCode
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setItemPendingScanningDiskEnumerationStatus:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_itemPendingScanningDiskEnumerationStatus = a3;
}

- (void)setHasItemPendingScanningDiskEnumerationStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasItemPendingScanningDiskEnumerationStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_itemPendingScanningDiskHasMultiplePagesEnumeration = a3;
}

- (void)setHasItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasItemPendingScanningDiskHasMultiplePagesEnumeration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingReconciliation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDown
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingRejection:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingRejection = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingRejection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingRejection
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setItemPendingScanningProviderEnumerationStatus:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_itemPendingScanningProviderEnumerationStatus = a3;
}

- (void)setHasItemPendingScanningProviderEnumerationStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderEnumerationStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_itemPendingScanningProviderHasMultiplePagesEnumeration = a3;
}

- (void)setHasItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderHasMultiplePagesEnumeration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setItemPendingScanningProviderNumberOfChildren:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_itemPendingScanningProviderNumberOfChildren = a3;
}

- (void)setHasItemPendingScanningProviderNumberOfChildren:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderNumberOfChildren
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setItemPendingScanningProviderNumberOfChildrenPendingCreation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_itemPendingScanningProviderNumberOfChildrenPendingCreation = a3;
}

- (void)setHasItemPendingScanningProviderNumberOfChildrenPendingCreation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderNumberOfChildrenPendingCreation
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setItemPendingScanningProviderNumberOfChildrenFailingCreation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_itemPendingScanningProviderNumberOfChildrenFailingCreation = a3;
}

- (void)setHasItemPendingScanningProviderNumberOfChildrenFailingCreation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasItemPendingScanningProviderNumberOfChildrenFailingCreation
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setItemPendingScanningProviderRemovalOfDatalessBitStatus:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_itemPendingScanningProviderRemovalOfDatalessBitStatus = a3;
}

- (void)setHasItemPendingScanningProviderRemovalOfDatalessBitStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderRemovalOfDatalessBitStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryStuckStatus;
  -[AppTelemetryStuckStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $4E96D8002A0A5BC04655A948646AB44B has;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_itemPendingReconciliationIsLocked);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("itemPendingReconciliationIsLocked"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_itemPendingReconciliationIsLockedInDB);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("itemPendingReconciliationIsLockedInDB"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingReconciliationJobCode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("itemPendingReconciliationJobCode"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingReconciliationJobSchedulingState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("itemPendingReconciliationJobSchedulingState"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingReconciliationJobBlockingCode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("itemPendingReconciliationJobBlockingCode"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskEnumerationStatus);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("itemPendingScanningDiskEnumerationStatus"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_itemPendingScanningDiskHasMultiplePagesEnumeration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("itemPendingScanningDiskHasMultiplePagesEnumeration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingReconciliation"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncUp"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncDown"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningDiskNumberOfChildrenPendingRejection);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingRejection"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningProviderEnumerationStatus);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("itemPendingScanningProviderEnumerationStatus"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_itemPendingScanningProviderHasMultiplePagesEnumeration);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("itemPendingScanningProviderHasMultiplePagesEnumeration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningProviderNumberOfChildren);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("itemPendingScanningProviderNumberOfChildren"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_22;
LABEL_45:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningProviderNumberOfChildrenFailingCreation);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("itemPendingScanningProviderNumberOfChildrenFailingCreation"));

    if ((*(_DWORD *)&self->_has & 0x20000) == 0)
      return v3;
    goto LABEL_23;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningProviderNumberOfChildrenPendingCreation);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("itemPendingScanningProviderNumberOfChildrenPendingCreation"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
    goto LABEL_45;
LABEL_22:
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemPendingScanningProviderRemovalOfDatalessBitStatus);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("itemPendingScanningProviderRemovalOfDatalessBitStatus"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryStuckStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $4E96D8002A0A5BC04655A948646AB44B has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_22;
LABEL_45:
    PBDataWriterWriteInt64Field();
    if ((*(_DWORD *)&self->_has & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_44:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
    goto LABEL_45;
LABEL_22:
  if ((*(_DWORD *)&has & 0x20000) != 0)
LABEL_23:
    PBDataWriterWriteInt64Field();
LABEL_24:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  $4E96D8002A0A5BC04655A948646AB44B has;

  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v4[152] = self->_itemPendingReconciliationIsLocked;
    *((_DWORD *)v4 + 39) |= 0x40000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  v4[153] = self->_itemPendingReconciliationIsLockedInDB;
  *((_DWORD *)v4 + 39) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v4 + 2) = self->_itemPendingReconciliationJobCode;
  *((_DWORD *)v4 + 39) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v4 + 3) = self->_itemPendingReconciliationJobSchedulingState;
  *((_DWORD *)v4 + 39) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)v4 + 1) = self->_itemPendingReconciliationJobBlockingCode;
  *((_DWORD *)v4 + 39) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v4 + 4) = self->_itemPendingScanningDiskEnumerationStatus;
  *((_DWORD *)v4 + 39) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  v4[154] = self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
  *((_DWORD *)v4 + 39) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 6) = self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
  *((_DWORD *)v4 + 39) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)v4 + 5) = self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
  *((_DWORD *)v4 + 39) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)v4 + 12) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
  *((_DWORD *)v4 + 39) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)v4 + 9) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
  *((_DWORD *)v4 + 39) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)v4 + 13) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)v4 + 11) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
  *((_DWORD *)v4 + 39) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)v4 + 10) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
  *((_DWORD *)v4 + 39) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)v4 + 8) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
  *((_DWORD *)v4 + 39) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)v4 + 7) = self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
  *((_DWORD *)v4 + 39) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)v4 + 14) = self->_itemPendingScanningProviderEnumerationStatus;
  *((_DWORD *)v4 + 39) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  v4[155] = self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
  *((_DWORD *)v4 + 39) |= 0x200000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)v4 + 15) = self->_itemPendingScanningProviderNumberOfChildren;
  *((_DWORD *)v4 + 39) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_22;
LABEL_45:
    *((_QWORD *)v4 + 16) = self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
    *((_DWORD *)v4 + 39) |= 0x8000u;
    if ((*(_DWORD *)&self->_has & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_44:
  *((_QWORD *)v4 + 17) = self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
  *((_DWORD *)v4 + 39) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
    goto LABEL_45;
LABEL_22:
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_23:
    *((_QWORD *)v4 + 18) = self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
    *((_DWORD *)v4 + 39) |= 0x20000u;
  }
LABEL_24:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $4E96D8002A0A5BC04655A948646AB44B has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((_BYTE *)result + 152) = self->_itemPendingReconciliationIsLocked;
    *((_DWORD *)result + 39) |= 0x40000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 153) = self->_itemPendingReconciliationIsLockedInDB;
  *((_DWORD *)result + 39) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 2) = self->_itemPendingReconciliationJobCode;
  *((_DWORD *)result + 39) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 3) = self->_itemPendingReconciliationJobSchedulingState;
  *((_DWORD *)result + 39) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 1) = self->_itemPendingReconciliationJobBlockingCode;
  *((_DWORD *)result + 39) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 4) = self->_itemPendingScanningDiskEnumerationStatus;
  *((_DWORD *)result + 39) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  *((_BYTE *)result + 154) = self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
  *((_DWORD *)result + 39) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)result + 6) = self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
  *((_DWORD *)result + 39) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)result + 5) = self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
  *((_DWORD *)result + 39) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 12) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
  *((_DWORD *)result + 39) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 9) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
  *((_DWORD *)result + 39) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 13) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
  *((_DWORD *)result + 39) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 11) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
  *((_DWORD *)result + 39) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 10) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
  *((_DWORD *)result + 39) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 8) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
  *((_DWORD *)result + 39) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 7) = self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
  *((_DWORD *)result + 39) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 14) = self->_itemPendingScanningProviderEnumerationStatus;
  *((_DWORD *)result + 39) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_BYTE *)result + 155) = self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
  *((_DWORD *)result + 39) |= 0x200000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)result + 15) = self->_itemPendingScanningProviderNumberOfChildren;
  *((_DWORD *)result + 39) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)result + 17) = self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
  *((_DWORD *)result + 39) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      return result;
    goto LABEL_23;
  }
LABEL_45:
  *((_QWORD *)result + 16) = self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
  *((_DWORD *)result + 39) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
    return result;
LABEL_23:
  *((_QWORD *)result + 18) = self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
  *((_DWORD *)result + 39) |= 0x20000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $4E96D8002A0A5BC04655A948646AB44B has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_124;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 39);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0)
      goto LABEL_124;
    if (self->_itemPendingReconciliationIsLocked)
    {
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_124;
    }
    else if (*((_BYTE *)v4 + 152))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0)
      goto LABEL_124;
    if (self->_itemPendingReconciliationIsLockedInDB)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_124;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_itemPendingReconciliationJobCode != *((_QWORD *)v4 + 2))
      goto LABEL_124;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_itemPendingReconciliationJobSchedulingState != *((_QWORD *)v4 + 3))
      goto LABEL_124;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_itemPendingReconciliationJobBlockingCode != *((_QWORD *)v4 + 1))
      goto LABEL_124;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_itemPendingScanningDiskEnumerationStatus != *((_QWORD *)v4 + 4))
      goto LABEL_124;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0)
      goto LABEL_124;
    if (self->_itemPendingScanningDiskHasMultiplePagesEnumeration)
    {
      if (!*((_BYTE *)v4 + 154))
        goto LABEL_124;
    }
    else if (*((_BYTE *)v4 + 154))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation != *((_QWORD *)v4 + 6))
      goto LABEL_124;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation != *((_QWORD *)v4 + 5))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion != *((_QWORD *)v4 + 12))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion != *((_QWORD *)v4 + 9))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent != *((_QWORD *)v4 + 13))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp != *((_QWORD *)v4 + 11))
      goto LABEL_124;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent != *((_QWORD *)v4 + 10))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown != *((_QWORD *)v4 + 8))
      goto LABEL_124;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingRejection != *((_QWORD *)v4 + 7))
      goto LABEL_124;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_itemPendingScanningProviderEnumerationStatus != *((_QWORD *)v4 + 14))
      goto LABEL_124;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) != 0)
    {
      if (self->_itemPendingScanningProviderHasMultiplePagesEnumeration)
      {
        if (!*((_BYTE *)v4 + 155))
          goto LABEL_124;
        goto LABEL_104;
      }
      if (!*((_BYTE *)v4 + 155))
        goto LABEL_104;
    }
LABEL_124:
    v7 = 0;
    goto LABEL_125;
  }
  if ((v6 & 0x200000) != 0)
    goto LABEL_124;
LABEL_104:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_itemPendingScanningProviderNumberOfChildren != *((_QWORD *)v4 + 15))
      goto LABEL_124;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0
      || self->_itemPendingScanningProviderNumberOfChildrenPendingCreation != *((_QWORD *)v4 + 17))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_itemPendingScanningProviderNumberOfChildrenFailingCreation != *((_QWORD *)v4 + 16))
      goto LABEL_124;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_itemPendingScanningProviderRemovalOfDatalessBitStatus != *((_QWORD *)v4 + 18))
      goto LABEL_124;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x20000) == 0;
  }
LABEL_125:

  return v7;
}

- (unint64_t)hash
{
  $4E96D8002A0A5BC04655A948646AB44B has;
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

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v3 = 2654435761 * self->_itemPendingReconciliationIsLocked;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_itemPendingReconciliationIsLockedInDB;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_itemPendingReconciliationJobCode;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v5 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_itemPendingReconciliationJobSchedulingState;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v6 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_itemPendingReconciliationJobBlockingCode;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v7 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_itemPendingScanningDiskEnumerationStatus;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v10 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v11 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v12 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v13 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v15 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v17 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  v18 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_itemPendingScanningProviderEnumerationStatus;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  v20 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_itemPendingScanningProviderNumberOfChildren;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_21:
    v22 = 2654435761 * self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_22;
LABEL_44:
    v23 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_23;
LABEL_45:
    v24 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_43:
  v22 = 0;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_44;
LABEL_22:
  v23 = 2654435761 * self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_45;
LABEL_23:
  v24 = 2654435761 * self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x40000) != 0)
  {
    self->_itemPendingReconciliationIsLocked = *((_BYTE *)v4 + 152);
    *(_DWORD *)&self->_has |= 0x40000u;
    v5 = *((_DWORD *)v4 + 39);
    if ((v5 & 0x80000) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((v5 & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  self->_itemPendingReconciliationIsLockedInDB = *((_BYTE *)v4 + 153);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  self->_itemPendingReconciliationJobCode = *((_QWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  self->_itemPendingReconciliationJobSchedulingState = *((_QWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  self->_itemPendingReconciliationJobBlockingCode = *((_QWORD *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  self->_itemPendingScanningDiskEnumerationStatus = *((_QWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x100000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  self->_itemPendingScanningDiskHasMultiplePagesEnumeration = *((_BYTE *)v4 + 154);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = *((_QWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = *((_QWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = *((_QWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = *((_QWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = *((_QWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = *((_QWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x200) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = *((_QWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x80) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = *((_QWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    if ((v5 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  self->_itemPendingScanningDiskNumberOfChildrenPendingRejection = *((_QWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x2000) == 0)
  {
LABEL_18:
    if ((v5 & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  self->_itemPendingScanningProviderEnumerationStatus = *((_QWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x200000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  self->_itemPendingScanningProviderHasMultiplePagesEnumeration = *((_BYTE *)v4 + 155);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x4000) == 0)
  {
LABEL_20:
    if ((v5 & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  self->_itemPendingScanningProviderNumberOfChildren = *((_QWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x10000) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000) == 0)
      goto LABEL_22;
LABEL_45:
    self->_itemPendingScanningProviderNumberOfChildrenFailingCreation = *((_QWORD *)v4 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
    if ((*((_DWORD *)v4 + 39) & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_44:
  self->_itemPendingScanningProviderNumberOfChildrenPendingCreation = *((_QWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x8000) != 0)
    goto LABEL_45;
LABEL_22:
  if ((v5 & 0x20000) != 0)
  {
LABEL_23:
    self->_itemPendingScanningProviderRemovalOfDatalessBitStatus = *((_QWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_24:

}

- (BOOL)itemPendingReconciliationIsLocked
{
  return self->_itemPendingReconciliationIsLocked;
}

- (BOOL)itemPendingReconciliationIsLockedInDB
{
  return self->_itemPendingReconciliationIsLockedInDB;
}

- (int64_t)itemPendingReconciliationJobCode
{
  return self->_itemPendingReconciliationJobCode;
}

- (int64_t)itemPendingReconciliationJobSchedulingState
{
  return self->_itemPendingReconciliationJobSchedulingState;
}

- (int64_t)itemPendingReconciliationJobBlockingCode
{
  return self->_itemPendingReconciliationJobBlockingCode;
}

- (int64_t)itemPendingScanningDiskEnumerationStatus
{
  return self->_itemPendingScanningDiskEnumerationStatus;
}

- (BOOL)itemPendingScanningDiskHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUp
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDown
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingRejection
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
}

- (int64_t)itemPendingScanningProviderEnumerationStatus
{
  return self->_itemPendingScanningProviderEnumerationStatus;
}

- (BOOL)itemPendingScanningProviderHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
}

- (int64_t)itemPendingScanningProviderNumberOfChildren
{
  return self->_itemPendingScanningProviderNumberOfChildren;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenPendingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenFailingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
}

- (int64_t)itemPendingScanningProviderRemovalOfDatalessBitStatus
{
  return self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
}

@end
