@implementation HomeKitSchemaHKAccessoryOperationReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HomeKitSchemaHKAccessoryOperationReported;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HomeKitSchemaHKAccessoryOperationReported sharedMetricsId](self, "sharedMetricsId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[HomeKitSchemaHKAccessoryOperationReported deleteSharedMetricsId](self, "deleteSharedMetricsId");
  return v5;
}

- (BOOL)hasSharedMetricsId
{
  return self->_sharedMetricsId != 0;
}

- (void)deleteSharedMetricsId
{
  -[HomeKitSchemaHKAccessoryOperationReported setSharedMetricsId:](self, "setSharedMetricsId:", 0);
}

- (BOOL)hasAccessoryCategory
{
  return self->_accessoryCategory != 0;
}

- (void)deleteAccessoryCategory
{
  -[HomeKitSchemaHKAccessoryOperationReported setAccessoryCategory:](self, "setAccessoryCategory:", 0);
}

- (void)setCommunicationProtocol:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_communicationProtocol = a3;
}

- (BOOL)hasCommunicationProtocol
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasCommunicationProtocol:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteCommunicationProtocol
{
  -[HomeKitSchemaHKAccessoryOperationReported setCommunicationProtocol:](self, "setCommunicationProtocol:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_transportType = a3;
}

- (BOOL)hasTransportType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasTransportType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteTransportType
{
  -[HomeKitSchemaHKAccessoryOperationReported setTransportType:](self, "setTransportType:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setOperationType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_operationType = a3;
}

- (BOOL)hasOperationType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasOperationType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteOperationType
{
  -[HomeKitSchemaHKAccessoryOperationReported setOperationType:](self, "setOperationType:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setWasCached:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_wasCached = a3;
}

- (BOOL)hasWasCached
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasWasCached:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteWasCached
{
  -[HomeKitSchemaHKAccessoryOperationReported setWasCached:](self, "setWasCached:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setWasLocal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_wasLocal = a3;
}

- (BOOL)hasWasLocal
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasWasLocal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteWasLocal
{
  -[HomeKitSchemaHKAccessoryOperationReported setWasLocal:](self, "setWasLocal:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setWasRemoteAccessAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_wasRemoteAccessAllowed = a3;
}

- (BOOL)hasWasRemoteAccessAllowed
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasWasRemoteAccessAllowed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteWasRemoteAccessAllowed
{
  -[HomeKitSchemaHKAccessoryOperationReported setWasRemoteAccessAllowed:](self, "setWasRemoteAccessAllowed:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setWasResidentFirstEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_wasResidentFirstEnabled = a3;
}

- (BOOL)hasWasResidentFirstEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasWasResidentFirstEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteWasResidentFirstEnabled
{
  -[HomeKitSchemaHKAccessoryOperationReported setWasResidentFirstEnabled:](self, "setWasResidentFirstEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setWasRapportSlow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_wasRapportSlow = a3;
}

- (BOOL)hasWasRapportSlow
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasWasRapportSlow:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteWasRapportSlow
{
  -[HomeKitSchemaHKAccessoryOperationReported setWasRapportSlow:](self, "setWasRapportSlow:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setResidentFirstDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_residentFirstDuration = a3;
}

- (BOOL)hasResidentFirstDuration
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasResidentFirstDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteResidentFirstDuration
{
  -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstDuration:](self, "setResidentFirstDuration:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)hasResidentFirstErrorDomain
{
  return self->_residentFirstErrorDomain != 0;
}

- (void)deleteResidentFirstErrorDomain
{
  -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstErrorDomain:](self, "setResidentFirstErrorDomain:", 0);
}

- (void)setResidentFirstErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_residentFirstErrorCode = a3;
}

- (BOOL)hasResidentFirstErrorCode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasResidentFirstErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteResidentFirstErrorCode
{
  -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstErrorCode:](self, "setResidentFirstErrorCode:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setTotalDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_totalDuration = a3;
}

- (BOOL)hasTotalDuration
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteTotalDuration
{
  -[HomeKitSchemaHKAccessoryOperationReported setTotalDuration:](self, "setTotalDuration:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (BOOL)hasFinalErrorDomain
{
  return self->_finalErrorDomain != 0;
}

- (void)deleteFinalErrorDomain
{
  -[HomeKitSchemaHKAccessoryOperationReported setFinalErrorDomain:](self, "setFinalErrorDomain:", 0);
}

- (void)setFinalErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_finalErrorCode = a3;
}

- (BOOL)hasFinalErrorCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasFinalErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteFinalErrorCode
{
  -[HomeKitSchemaHKAccessoryOperationReported setFinalErrorCode:](self, "setFinalErrorCode:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setConsecutiveFailureCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_consecutiveFailureCount = a3;
}

- (BOOL)hasConsecutiveFailureCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasConsecutiveFailureCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteConsecutiveFailureCount
{
  -[HomeKitSchemaHKAccessoryOperationReported setConsecutiveFailureCount:](self, "setConsecutiveFailureCount:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (BOOL)readFrom:(id)a3
{
  return HomeKitSchemaHKAccessoryOperationReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __int16 has;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  id v13;

  v13 = a3;
  -[HomeKitSchemaHKAccessoryOperationReported sharedMetricsId](self, "sharedMetricsId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HomeKitSchemaHKAccessoryOperationReported sharedMetricsId](self, "sharedMetricsId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HomeKitSchemaHKAccessoryOperationReported accessoryCategory](self, "accessoryCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_14:
    PBDataWriterWriteUint32Field();
LABEL_15:
  -[HomeKitSchemaHKAccessoryOperationReported residentFirstErrorDomain](self, "residentFirstErrorDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    v9 = (__int16)self->_has;
  }
  if ((v9 & 0x400) != 0)
    PBDataWriterWriteUint32Field();
  -[HomeKitSchemaHKAccessoryOperationReported finalErrorDomain](self, "finalErrorDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = (__int16)self->_has;
  v12 = v13;
  if ((v11 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    v12 = v13;
    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v12 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  $FB7EF78150722EACBFCB12EF103CB204 has;
  unsigned int v18;
  int communicationProtocol;
  int v20;
  int transportType;
  int v22;
  int operationType;
  int v24;
  int wasCached;
  int v26;
  int wasLocal;
  int v28;
  int wasRemoteAccessAllowed;
  int v30;
  int wasResidentFirstEnabled;
  int v32;
  int wasRapportSlow;
  int v34;
  unsigned int residentFirstDuration;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  $FB7EF78150722EACBFCB12EF103CB204 v41;
  int v42;
  unsigned int v43;
  unsigned int residentFirstErrorCode;
  int v45;
  unsigned int totalDuration;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  BOOL v52;
  $FB7EF78150722EACBFCB12EF103CB204 v54;
  int v55;
  unsigned int v56;
  unsigned int finalErrorCode;
  int v58;
  unsigned int consecutiveFailureCount;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_64;
  -[HomeKitSchemaHKAccessoryOperationReported sharedMetricsId](self, "sharedMetricsId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedMetricsId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[HomeKitSchemaHKAccessoryOperationReported sharedMetricsId](self, "sharedMetricsId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HomeKitSchemaHKAccessoryOperationReported sharedMetricsId](self, "sharedMetricsId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedMetricsId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_64;
  }
  else
  {

  }
  -[HomeKitSchemaHKAccessoryOperationReported accessoryCategory](self, "accessoryCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[HomeKitSchemaHKAccessoryOperationReported accessoryCategory](self, "accessoryCategory");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[HomeKitSchemaHKAccessoryOperationReported accessoryCategory](self, "accessoryCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_64;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_64;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    communicationProtocol = self->_communicationProtocol;
    if (communicationProtocol != objc_msgSend(v4, "communicationProtocol"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_64;
  if (v20)
  {
    transportType = self->_transportType;
    if (transportType != objc_msgSend(v4, "transportType"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v18 >> 2) & 1))
    goto LABEL_64;
  if (v22)
  {
    operationType = self->_operationType;
    if (operationType != objc_msgSend(v4, "operationType"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v18 >> 3) & 1))
    goto LABEL_64;
  if (v24)
  {
    wasCached = self->_wasCached;
    if (wasCached != objc_msgSend(v4, "wasCached"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v26 = (*(unsigned int *)&has >> 4) & 1;
  if (v26 != ((v18 >> 4) & 1))
    goto LABEL_64;
  if (v26)
  {
    wasLocal = self->_wasLocal;
    if (wasLocal != objc_msgSend(v4, "wasLocal"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v28 = (*(unsigned int *)&has >> 5) & 1;
  if (v28 != ((v18 >> 5) & 1))
    goto LABEL_64;
  if (v28)
  {
    wasRemoteAccessAllowed = self->_wasRemoteAccessAllowed;
    if (wasRemoteAccessAllowed != objc_msgSend(v4, "wasRemoteAccessAllowed"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v30 = (*(unsigned int *)&has >> 6) & 1;
  if (v30 != ((v18 >> 6) & 1))
    goto LABEL_64;
  if (v30)
  {
    wasResidentFirstEnabled = self->_wasResidentFirstEnabled;
    if (wasResidentFirstEnabled != objc_msgSend(v4, "wasResidentFirstEnabled"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v32 = (*(unsigned int *)&has >> 7) & 1;
  if (v32 != ((v18 >> 7) & 1))
    goto LABEL_64;
  if (v32)
  {
    wasRapportSlow = self->_wasRapportSlow;
    if (wasRapportSlow != objc_msgSend(v4, "wasRapportSlow"))
      goto LABEL_64;
    has = self->_has;
    v18 = v4[40];
  }
  v34 = (*(unsigned int *)&has >> 8) & 1;
  if (v34 != ((v18 >> 8) & 1))
    goto LABEL_64;
  if (v34)
  {
    residentFirstDuration = self->_residentFirstDuration;
    if (residentFirstDuration != objc_msgSend(v4, "residentFirstDuration"))
      goto LABEL_64;
  }
  -[HomeKitSchemaHKAccessoryOperationReported residentFirstErrorDomain](self, "residentFirstErrorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentFirstErrorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[HomeKitSchemaHKAccessoryOperationReported residentFirstErrorDomain](self, "residentFirstErrorDomain");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[HomeKitSchemaHKAccessoryOperationReported residentFirstErrorDomain](self, "residentFirstErrorDomain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "residentFirstErrorDomain");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_64;
  }
  else
  {

  }
  v41 = self->_has;
  v42 = (*(unsigned int *)&v41 >> 9) & 1;
  v43 = v4[40];
  if (v42 != ((v43 >> 9) & 1))
    goto LABEL_64;
  if (v42)
  {
    residentFirstErrorCode = self->_residentFirstErrorCode;
    if (residentFirstErrorCode != objc_msgSend(v4, "residentFirstErrorCode"))
      goto LABEL_64;
    v41 = self->_has;
    v43 = v4[40];
  }
  v45 = (*(unsigned int *)&v41 >> 10) & 1;
  if (v45 != ((v43 >> 10) & 1))
    goto LABEL_64;
  if (v45)
  {
    totalDuration = self->_totalDuration;
    if (totalDuration != objc_msgSend(v4, "totalDuration"))
      goto LABEL_64;
  }
  -[HomeKitSchemaHKAccessoryOperationReported finalErrorDomain](self, "finalErrorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalErrorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_63:

    goto LABEL_64;
  }
  -[HomeKitSchemaHKAccessoryOperationReported finalErrorDomain](self, "finalErrorDomain");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[HomeKitSchemaHKAccessoryOperationReported finalErrorDomain](self, "finalErrorDomain");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalErrorDomain");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_64;
  }
  else
  {

  }
  v54 = self->_has;
  v55 = (*(unsigned int *)&v54 >> 11) & 1;
  v56 = v4[40];
  if (v55 == ((v56 >> 11) & 1))
  {
    if (v55)
    {
      finalErrorCode = self->_finalErrorCode;
      if (finalErrorCode != objc_msgSend(v4, "finalErrorCode"))
        goto LABEL_64;
      v54 = self->_has;
      v56 = v4[40];
    }
    v58 = (*(unsigned int *)&v54 >> 12) & 1;
    if (v58 == ((v56 >> 12) & 1))
    {
      if (!v58
        || (consecutiveFailureCount = self->_consecutiveFailureCount,
            consecutiveFailureCount == objc_msgSend(v4, "consecutiveFailureCount")))
      {
        v52 = 1;
        goto LABEL_65;
      }
    }
  }
LABEL_64:
  v52 = 0;
LABEL_65:

  return v52;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  unint64_t v21;

  v21 = -[SISchemaUUID hash](self->_sharedMetricsId, "hash");
  v20 = -[NSString hash](self->_accessoryCategory, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v19 = 2654435761 * self->_communicationProtocol;
    if ((has & 2) != 0)
    {
LABEL_3:
      v18 = 2654435761 * self->_transportType;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v19 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v17 = 2654435761 * self->_operationType;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v17 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v16 = 2654435761 * self->_wasCached;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v16 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v15 = 2654435761 * self->_wasLocal;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_wasRemoteAccessAllowed;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_wasResidentFirstEnabled;
    if ((has & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v6 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v5 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_18;
LABEL_9:
  v6 = 2654435761 * self->_wasRapportSlow;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_residentFirstDuration;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
LABEL_20:
  v8 = -[NSString hash](self->_residentFirstErrorDomain, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v9 = 2654435761 * self->_residentFirstErrorCode;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_22;
  }
  else
  {
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_22:
      v10 = 2654435761 * self->_totalDuration;
      goto LABEL_25;
    }
  }
  v10 = 0;
LABEL_25:
  v11 = -[NSString hash](self->_finalErrorDomain, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v12 = 2654435761 * self->_finalErrorCode;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_27;
LABEL_29:
    v13 = 0;
    return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_29;
LABEL_27:
  v13 = 2654435761 * self->_consecutiveFailureCount;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  __int16 has;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  __int16 v25;
  void *v26;
  void *v28;
  unsigned int v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accessoryCategory)
  {
    -[HomeKitSchemaHKAccessoryOperationReported accessoryCategory](self, "accessoryCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessoryCategory"));

  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = -[HomeKitSchemaHKAccessoryOperationReported communicationProtocol](self, "communicationProtocol");
    v8 = CFSTR("HKACCESSORYCOMMUNICATIONPROTOCOL_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("HKACCESSORYCOMMUNICATIONPROTOCOL_HAP");
    if (v7 == 2)
      v9 = CFSTR("HKACCESSORYCOMMUNICATIONPROTOCOL_MATTER");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("communicationProtocol"));
    has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported consecutiveFailureCount](self, "consecutiveFailureCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("consecutiveFailureCount"));

    has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported finalErrorCode](self, "finalErrorCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("finalErrorCode"));

  }
  if (self->_finalErrorDomain)
  {
    -[HomeKitSchemaHKAccessoryOperationReported finalErrorDomain](self, "finalErrorDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("finalErrorDomain"));

  }
  v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    v20 = -[HomeKitSchemaHKAccessoryOperationReported operationType](self, "operationType");
    v21 = CFSTR("HKACCESSORYOPERATIONTYPE_UNKNOWN");
    if (v20 == 1)
      v21 = CFSTR("HKACCESSORYOPERATIONTYPE_READ");
    if (v20 == 2)
      v22 = CFSTR("HKACCESSORYOPERATIONTYPE_WRITE");
    else
      v22 = v21;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("operationType"));
    v14 = (__int16)self->_has;
    if ((v14 & 0x100) == 0)
    {
LABEL_18:
      if ((v14 & 0x200) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported residentFirstDuration](self, "residentFirstDuration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("residentFirstDuration"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported residentFirstErrorCode](self, "residentFirstErrorCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("residentFirstErrorCode"));

  }
LABEL_20:
  if (self->_residentFirstErrorDomain)
  {
    -[HomeKitSchemaHKAccessoryOperationReported residentFirstErrorDomain](self, "residentFirstErrorDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("residentFirstErrorDomain"));

  }
  if (self->_sharedMetricsId)
  {
    -[HomeKitSchemaHKAccessoryOperationReported sharedMetricsId](self, "sharedMetricsId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("sharedMetricsId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("sharedMetricsId"));

    }
  }
  v25 = (__int16)self->_has;
  if ((v25 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported totalDuration](self, "totalDuration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("totalDuration"));

    v25 = (__int16)self->_has;
    if ((v25 & 2) == 0)
    {
LABEL_37:
      if ((v25 & 8) == 0)
        goto LABEL_38;
      goto LABEL_49;
    }
  }
  else if ((v25 & 2) == 0)
  {
    goto LABEL_37;
  }
  v29 = -[HomeKitSchemaHKAccessoryOperationReported transportType](self, "transportType") - 1;
  if (v29 > 3)
    v30 = CFSTR("HKTRANSPORTTYPE_UNKNOWN");
  else
    v30 = off_1E563A4A8[v29];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("transportType"));
  v25 = (__int16)self->_has;
  if ((v25 & 8) == 0)
  {
LABEL_38:
    if ((v25 & 0x10) == 0)
      goto LABEL_39;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasCached](self, "wasCached"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("wasCached"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x10) == 0)
  {
LABEL_39:
    if ((v25 & 0x80) == 0)
      goto LABEL_40;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasLocal](self, "wasLocal"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("wasLocal"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x80) == 0)
  {
LABEL_40:
    if ((v25 & 0x20) == 0)
      goto LABEL_41;
LABEL_52:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasRemoteAccessAllowed](self, "wasRemoteAccessAllowed"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("wasRemoteAccessAllowed"));

    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasRapportSlow](self, "wasRapportSlow"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("wasRapportSlow"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x20) != 0)
    goto LABEL_52;
LABEL_41:
  if ((v25 & 0x40) != 0)
  {
LABEL_42:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasResidentFirstEnabled](self, "wasResidentFirstEnabled"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("wasResidentFirstEnabled"));

  }
LABEL_43:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HomeKitSchemaHKAccessoryOperationReported dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (HomeKitSchemaHKAccessoryOperationReported)initWithJSON:(id)a3
{
  void *v4;
  HomeKitSchemaHKAccessoryOperationReported *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[HomeKitSchemaHKAccessoryOperationReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HomeKitSchemaHKAccessoryOperationReported)initWithDictionary:(id)a3
{
  id v4;
  HomeKitSchemaHKAccessoryOperationReported *v5;
  uint64_t v6;
  SISchemaUUID *v7;
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
  HomeKitSchemaHKAccessoryOperationReported *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HomeKitSchemaHKAccessoryOperationReported;
  v5 = -[HomeKitSchemaHKAccessoryOperationReported init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharedMetricsId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[HomeKitSchemaHKAccessoryOperationReported setSharedMetricsId:](v5, "setSharedMetricsId:", v7);

    }
    v36 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[HomeKitSchemaHKAccessoryOperationReported setAccessoryCategory:](v5, "setAccessoryCategory:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("communicationProtocol"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setCommunicationProtocol:](v5, "setCommunicationProtocol:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transportType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setTransportType:](v5, "setTransportType:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("operationType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setOperationType:](v5, "setOperationType:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasCached"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setWasCached:](v5, "setWasCached:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasLocal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setWasLocal:](v5, "setWasLocal:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasRemoteAccessAllowed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setWasRemoteAccessAllowed:](v5, "setWasRemoteAccessAllowed:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasResidentFirstEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setWasResidentFirstEnabled:](v5, "setWasResidentFirstEnabled:", objc_msgSend(v16, "BOOLValue"));
    v34 = v11;
    v35 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasRapportSlow"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setWasRapportSlow:](v5, "setWasRapportSlow:", objc_msgSend(v17, "BOOLValue"));
    v33 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("residentFirstDuration"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstDuration:](v5, "setResidentFirstDuration:", objc_msgSend(v18, "unsignedIntValue"));
    v32 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("residentFirstErrorDomain"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)objc_msgSend(v19, "copy");
      -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstErrorDomain:](v5, "setResidentFirstErrorDomain:", v20);

    }
    v31 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("residentFirstErrorCode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstErrorCode:](v5, "setResidentFirstErrorCode:", objc_msgSend(v21, "unsignedIntValue"));
    v30 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDuration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setTotalDuration:](v5, "setTotalDuration:", objc_msgSend(v22, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalErrorDomain"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(v23, "copy");
      -[HomeKitSchemaHKAccessoryOperationReported setFinalErrorDomain:](v5, "setFinalErrorDomain:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalErrorCode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setFinalErrorCode:](v5, "setFinalErrorCode:", objc_msgSend(v25, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("consecutiveFailureCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HomeKitSchemaHKAccessoryOperationReported setConsecutiveFailureCount:](v5, "setConsecutiveFailureCount:", objc_msgSend(v26, "unsignedIntValue"));
    v27 = v5;

  }
  return v5;
}

- (SISchemaUUID)sharedMetricsId
{
  return self->_sharedMetricsId;
}

- (void)setSharedMetricsId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedMetricsId, a3);
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)communicationProtocol
{
  return self->_communicationProtocol;
}

- (int)transportType
{
  return self->_transportType;
}

- (int)operationType
{
  return self->_operationType;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (BOOL)wasLocal
{
  return self->_wasLocal;
}

- (BOOL)wasRemoteAccessAllowed
{
  return self->_wasRemoteAccessAllowed;
}

- (BOOL)wasResidentFirstEnabled
{
  return self->_wasResidentFirstEnabled;
}

- (BOOL)wasRapportSlow
{
  return self->_wasRapportSlow;
}

- (unsigned)residentFirstDuration
{
  return self->_residentFirstDuration;
}

- (NSString)residentFirstErrorDomain
{
  return self->_residentFirstErrorDomain;
}

- (void)setResidentFirstErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)residentFirstErrorCode
{
  return self->_residentFirstErrorCode;
}

- (unsigned)totalDuration
{
  return self->_totalDuration;
}

- (NSString)finalErrorDomain
{
  return self->_finalErrorDomain;
}

- (void)setFinalErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)finalErrorCode
{
  return self->_finalErrorCode;
}

- (unsigned)consecutiveFailureCount
{
  return self->_consecutiveFailureCount;
}

- (void)setHasSharedMetricsId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAccessoryCategory:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasResidentFirstErrorDomain:(BOOL)a3
{
  self->_hasSharedMetricsId = a3;
}

- (void)setHasFinalErrorDomain:(BOOL)a3
{
  self->_hasAccessoryCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalErrorDomain, 0);
  objc_storeStrong((id *)&self->_residentFirstErrorDomain, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_sharedMetricsId, 0);
}

@end
