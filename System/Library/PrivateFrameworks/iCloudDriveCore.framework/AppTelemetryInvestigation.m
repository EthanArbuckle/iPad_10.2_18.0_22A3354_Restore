@implementation AppTelemetryInvestigation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryInvestigation;
  -[AppTelemetryInvestigation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryInvestigation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *zoneName;
  void *v6;
  NSString *errorDomain;
  void *v8;
  NSString *errorDescription;
  NSString *lastStep;
  NSString *itemID;
  NSString *reason;
  NSString *operationType;
  char has;
  void *v15;
  NSString *eventGroupUUID;
  NSString *migrationUUID;
  AppTelemetryQBSInvestigation *qbsInvestigation;
  void *v19;
  AppTelemetryQBSPerformance *qbsPerformance;
  void *v21;
  AppTelemetryFPFSMigrationInvestigation *fpfsMigrationInvestigation;
  void *v23;
  void *v24;
  AppTelemetryFPFSMigrationNonMigratedItemInvestigation *fpfsMigrationNonMigratedItemInvestigation;
  void *v26;
  AppTelemetryStuckStatus *stuckStatus;
  void *v28;
  void *v29;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName)
    objc_msgSend(v3, "setObject:forKey:", zoneName, CFSTR("zoneName"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sharedZone);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("sharedZone"));

  }
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v4, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_errorCode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("errorCode"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v4, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  lastStep = self->_lastStep;
  if (lastStep)
    objc_msgSend(v4, "setObject:forKey:", lastStep, CFSTR("lastStep"));
  itemID = self->_itemID;
  if (itemID)
    objc_msgSend(v4, "setObject:forKey:", itemID, CFSTR("itemID"));
  reason = self->_reason;
  if (reason)
    objc_msgSend(v4, "setObject:forKey:", reason, CFSTR("reason"));
  operationType = self->_operationType;
  if (operationType)
    objc_msgSend(v4, "setObject:forKey:", operationType, CFSTR("operationType"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_nonDiscretionary);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("nonDiscretionary"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasForegroundClients);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("hasForegroundClients"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPCSChained);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("isPCSChained"));

  }
LABEL_23:
  eventGroupUUID = self->_eventGroupUUID;
  if (eventGroupUUID)
    objc_msgSend(v4, "setObject:forKey:", eventGroupUUID, CFSTR("eventGroupUUID"));
  migrationUUID = self->_migrationUUID;
  if (migrationUUID)
    objc_msgSend(v4, "setObject:forKey:", migrationUUID, CFSTR("migrationUUID"));
  qbsInvestigation = self->_qbsInvestigation;
  if (qbsInvestigation)
  {
    -[AppTelemetryQBSInvestigation dictionaryRepresentation](qbsInvestigation, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("qbsInvestigation"));

  }
  qbsPerformance = self->_qbsPerformance;
  if (qbsPerformance)
  {
    -[AppTelemetryQBSPerformance dictionaryRepresentation](qbsPerformance, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("qbsPerformance"));

  }
  fpfsMigrationInvestigation = self->_fpfsMigrationInvestigation;
  if (fpfsMigrationInvestigation)
  {
    -[AppTelemetryFPFSMigrationInvestigation dictionaryRepresentation](fpfsMigrationInvestigation, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("fpfsMigrationInvestigation"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_eventTimestamp);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("eventTimestamp"));

  }
  fpfsMigrationNonMigratedItemInvestigation = self->_fpfsMigrationNonMigratedItemInvestigation;
  if (fpfsMigrationNonMigratedItemInvestigation)
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation dictionaryRepresentation](fpfsMigrationNonMigratedItemInvestigation, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("fpfsMigrationNonMigratedItemInvestigation"));

  }
  stuckStatus = self->_stuckStatus;
  if (stuckStatus)
  {
    -[AppTelemetryStuckStatus dictionaryRepresentation](stuckStatus, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("stuckStatus"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEnhancedDrivePrivacyEnabled);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("isEnhancedDrivePrivacyEnabled"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryInvestigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_zoneName)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_lastStep)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_itemID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_operationType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_22:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_23:
  if (self->_eventGroupUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_migrationUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_qbsInvestigation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_qbsPerformance)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_fpfsMigrationInvestigation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_fpfsMigrationNonMigratedItemInvestigation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_stuckStatus)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_zoneName)
  {
    objc_msgSend(v4, "setZoneName:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_BYTE *)v4 + 140) = self->_sharedZone;
    *((_BYTE *)v4 + 144) |= 0x40u;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v6, "setErrorDomain:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_errorCode;
    *((_BYTE *)v4 + 144) |= 1u;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v6, "setErrorDescription:");
    v4 = v6;
  }
  if (self->_lastStep)
  {
    objc_msgSend(v6, "setLastStep:");
    v4 = v6;
  }
  if (self->_itemID)
  {
    objc_msgSend(v6, "setItemID:");
    v4 = v6;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    v4 = v6;
  }
  if (self->_operationType)
  {
    objc_msgSend(v6, "setOperationType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 139) = self->_nonDiscretionary;
    *((_BYTE *)v4 + 144) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_21;
  }
  *((_BYTE *)v4 + 136) = self->_hasForegroundClients;
  *((_BYTE *)v4 + 144) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_22:
    *((_BYTE *)v4 + 138) = self->_isPCSChained;
    *((_BYTE *)v4 + 144) |= 0x10u;
  }
LABEL_23:
  if (self->_eventGroupUUID)
  {
    objc_msgSend(v6, "setEventGroupUUID:");
    v4 = v6;
  }
  if (self->_migrationUUID)
  {
    objc_msgSend(v6, "setMigrationUUID:");
    v4 = v6;
  }
  if (self->_qbsInvestigation)
  {
    objc_msgSend(v6, "setQbsInvestigation:");
    v4 = v6;
  }
  if (self->_qbsPerformance)
  {
    objc_msgSend(v6, "setQbsPerformance:");
    v4 = v6;
  }
  if (self->_fpfsMigrationInvestigation)
  {
    objc_msgSend(v6, "setFpfsMigrationInvestigation:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_eventTimestamp;
    *((_BYTE *)v4 + 144) |= 2u;
  }
  if (self->_fpfsMigrationNonMigratedItemInvestigation)
  {
    objc_msgSend(v6, "setFpfsMigrationNonMigratedItemInvestigation:");
    v4 = v6;
  }
  if (self->_stuckStatus)
  {
    objc_msgSend(v6, "setStuckStatus:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 137) = self->_isEnhancedDrivePrivacyEnabled;
    *((_BYTE *)v4 + 144) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char has;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v6;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 140) = self->_sharedZone;
    *(_BYTE *)(v5 + 144) |= 0x40u;
  }
  v8 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_errorCode;
    *(_BYTE *)(v5 + 144) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_lastStep, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_itemID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v16;

  v18 = -[NSString copyWithZone:](self->_operationType, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 139) = self->_nonDiscretionary;
    *(_BYTE *)(v5 + 144) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 136) = self->_hasForegroundClients;
  *(_BYTE *)(v5 + 144) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 138) = self->_isPCSChained;
    *(_BYTE *)(v5 + 144) |= 0x10u;
  }
LABEL_9:
  v21 = -[NSString copyWithZone:](self->_eventGroupUUID, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v21;

  v23 = -[NSString copyWithZone:](self->_migrationUUID, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v23;

  v25 = -[AppTelemetryQBSInvestigation copyWithZone:](self->_qbsInvestigation, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;

  v27 = -[AppTelemetryQBSPerformance copyWithZone:](self->_qbsPerformance, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v27;

  v29 = -[AppTelemetryFPFSMigrationInvestigation copyWithZone:](self->_fpfsMigrationInvestigation, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v29;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_eventTimestamp;
    *(_BYTE *)(v5 + 144) |= 2u;
  }
  v31 = -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation copyWithZone:](self->_fpfsMigrationNonMigratedItemInvestigation, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v31;

  v33 = -[AppTelemetryStuckStatus copyWithZone:](self->_stuckStatus, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v33;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 137) = self->_isEnhancedDrivePrivacyEnabled;
    *(_BYTE *)(v5 + 144) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *zoneName;
  char has;
  NSString *errorDomain;
  NSString *errorDescription;
  NSString *lastStep;
  NSString *itemID;
  NSString *reason;
  NSString *operationType;
  NSString *eventGroupUUID;
  NSString *migrationUUID;
  AppTelemetryQBSInvestigation *qbsInvestigation;
  AppTelemetryQBSPerformance *qbsPerformance;
  AppTelemetryFPFSMigrationInvestigation *fpfsMigrationInvestigation;
  AppTelemetryFPFSMigrationNonMigratedItemInvestigation *fpfsMigrationNonMigratedItemInvestigation;
  AppTelemetryStuckStatus *stuckStatus;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_76;
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((_QWORD *)v4 + 16))
  {
    if (!-[NSData isEqual:](zoneName, "isEqual:"))
      goto LABEL_76;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 0x40) == 0)
      goto LABEL_76;
    if (self->_sharedZone)
    {
      if (!*((_BYTE *)v4 + 140))
        goto LABEL_76;
    }
    else if (*((_BYTE *)v4 + 140))
    {
      goto LABEL_76;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 0x40) != 0)
  {
    goto LABEL_76;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:"))
      goto LABEL_76;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 1))
      goto LABEL_76;
  }
  else if ((*((_BYTE *)v4 + 144) & 1) != 0)
  {
    goto LABEL_76;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](errorDescription, "isEqual:"))
  {
    goto LABEL_76;
  }
  lastStep = self->_lastStep;
  if ((unint64_t)lastStep | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](lastStep, "isEqual:"))
      goto LABEL_76;
  }
  itemID = self->_itemID;
  if ((unint64_t)itemID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](itemID, "isEqual:"))
      goto LABEL_76;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](reason, "isEqual:"))
      goto LABEL_76;
  }
  operationType = self->_operationType;
  if ((unint64_t)operationType | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](operationType, "isEqual:"))
      goto LABEL_76;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 0x20) == 0)
      goto LABEL_76;
    if (self->_nonDiscretionary)
    {
      if (!*((_BYTE *)v4 + 139))
        goto LABEL_76;
    }
    else if (*((_BYTE *)v4 + 139))
    {
      goto LABEL_76;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 0x20) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 4) == 0)
      goto LABEL_76;
    if (self->_hasForegroundClients)
    {
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_76;
    }
    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_76;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 4) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 0x10) == 0)
      goto LABEL_76;
    if (self->_isPCSChained)
    {
      if (!*((_BYTE *)v4 + 138))
        goto LABEL_76;
    }
    else if (*((_BYTE *)v4 + 138))
    {
      goto LABEL_76;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 0x10) != 0)
  {
    goto LABEL_76;
  }
  eventGroupUUID = self->_eventGroupUUID;
  if ((unint64_t)eventGroupUUID | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](eventGroupUUID, "isEqual:"))
  {
    goto LABEL_76;
  }
  migrationUUID = self->_migrationUUID;
  if ((unint64_t)migrationUUID | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](migrationUUID, "isEqual:"))
      goto LABEL_76;
  }
  qbsInvestigation = self->_qbsInvestigation;
  if ((unint64_t)qbsInvestigation | *((_QWORD *)v4 + 12))
  {
    if (!-[AppTelemetryQBSInvestigation isEqual:](qbsInvestigation, "isEqual:"))
      goto LABEL_76;
  }
  qbsPerformance = self->_qbsPerformance;
  if ((unint64_t)qbsPerformance | *((_QWORD *)v4 + 13))
  {
    if (!-[AppTelemetryQBSPerformance isEqual:](qbsPerformance, "isEqual:"))
      goto LABEL_76;
  }
  fpfsMigrationInvestigation = self->_fpfsMigrationInvestigation;
  if ((unint64_t)fpfsMigrationInvestigation | *((_QWORD *)v4 + 6))
  {
    if (!-[AppTelemetryFPFSMigrationInvestigation isEqual:](fpfsMigrationInvestigation, "isEqual:"))
      goto LABEL_76;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 2) == 0 || self->_eventTimestamp != *((_QWORD *)v4 + 2))
      goto LABEL_76;
  }
  else if ((*((_BYTE *)v4 + 144) & 2) != 0)
  {
    goto LABEL_76;
  }
  fpfsMigrationNonMigratedItemInvestigation = self->_fpfsMigrationNonMigratedItemInvestigation;
  if ((unint64_t)fpfsMigrationNonMigratedItemInvestigation | *((_QWORD *)v4 + 7)
    && !-[AppTelemetryFPFSMigrationNonMigratedItemInvestigation isEqual:](fpfsMigrationNonMigratedItemInvestigation, "isEqual:"))
  {
    goto LABEL_76;
  }
  stuckStatus = self->_stuckStatus;
  if ((unint64_t)stuckStatus | *((_QWORD *)v4 + 15))
  {
    if (!-[AppTelemetryStuckStatus isEqual:](stuckStatus, "isEqual:"))
      goto LABEL_76;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 8) != 0)
    {
      if (self->_isEnhancedDrivePrivacyEnabled)
      {
        if (!*((_BYTE *)v4 + 137))
          goto LABEL_76;
      }
      else if (*((_BYTE *)v4 + 137))
      {
        goto LABEL_76;
      }
      v20 = 1;
      goto LABEL_77;
    }
LABEL_76:
    v20 = 0;
    goto LABEL_77;
  }
  v20 = (*((_BYTE *)v4 + 144) & 8) == 0;
LABEL_77:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;

  v25 = -[NSData hash](self->_zoneName, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v24 = 2654435761 * self->_sharedZone;
  else
    v24 = 0;
  v23 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v22 = 2654435761 * self->_errorCode;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_errorDescription, "hash");
  v20 = -[NSString hash](self->_lastStep, "hash");
  v19 = -[NSString hash](self->_itemID, "hash");
  v18 = -[NSString hash](self->_reason, "hash");
  v17 = -[NSString hash](self->_operationType, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_12:
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  v16 = 2654435761 * self->_nonDiscretionary;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_9:
  v15 = 2654435761 * self->_hasForegroundClients;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v3 = -[NSString hash](self->_eventGroupUUID, "hash", 2654435761 * self->_isPCSChained);
    goto LABEL_14;
  }
LABEL_13:
  v3 = -[NSString hash](self->_eventGroupUUID, "hash", 0);
LABEL_14:
  v4 = v3;
  v5 = -[NSString hash](self->_migrationUUID, "hash");
  v6 = -[AppTelemetryQBSInvestigation hash](self->_qbsInvestigation, "hash");
  v7 = -[AppTelemetryQBSPerformance hash](self->_qbsPerformance, "hash");
  v8 = -[AppTelemetryFPFSMigrationInvestigation hash](self->_fpfsMigrationInvestigation, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761u * self->_eventTimestamp;
  else
    v9 = 0;
  v10 = -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation hash](self->_fpfsMigrationNonMigratedItemInvestigation, "hash");
  v11 = -[AppTelemetryStuckStatus hash](self->_stuckStatus, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v12 = 2654435761 * self->_isEnhancedDrivePrivacyEnabled;
  else
    v12 = 0;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  AppTelemetryQBSInvestigation *qbsInvestigation;
  uint64_t v7;
  AppTelemetryQBSPerformance *qbsPerformance;
  uint64_t v9;
  AppTelemetryFPFSMigrationInvestigation *fpfsMigrationInvestigation;
  uint64_t v11;
  AppTelemetryFPFSMigrationNonMigratedItemInvestigation *fpfsMigrationNonMigratedItemInvestigation;
  uint64_t v13;
  AppTelemetryStuckStatus *stuckStatus;
  uint64_t v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (*((_QWORD *)v4 + 16))
  {
    -[AppTelemetryInvestigation setZoneName:](self, "setZoneName:");
    v4 = v16;
  }
  if ((*((_BYTE *)v4 + 144) & 0x40) != 0)
  {
    self->_sharedZone = *((_BYTE *)v4 + 140);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[AppTelemetryInvestigation setErrorDomain:](self, "setErrorDomain:");
    v4 = v16;
  }
  if ((*((_BYTE *)v4 + 144) & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[AppTelemetryInvestigation setErrorDescription:](self, "setErrorDescription:");
    v4 = v16;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[AppTelemetryInvestigation setLastStep:](self, "setLastStep:");
    v4 = v16;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[AppTelemetryInvestigation setItemID:](self, "setItemID:");
    v4 = v16;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[AppTelemetryInvestigation setReason:](self, "setReason:");
    v4 = v16;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[AppTelemetryInvestigation setOperationType:](self, "setOperationType:");
    v4 = v16;
  }
  v5 = *((_BYTE *)v4 + 144);
  if ((v5 & 0x20) != 0)
  {
    self->_nonDiscretionary = *((_BYTE *)v4 + 139);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 144);
    if ((v5 & 4) == 0)
    {
LABEL_21:
      if ((v5 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 4) == 0)
  {
    goto LABEL_21;
  }
  self->_hasForegroundClients = *((_BYTE *)v4 + 136);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 144) & 0x10) != 0)
  {
LABEL_22:
    self->_isPCSChained = *((_BYTE *)v4 + 138);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_23:
  if (*((_QWORD *)v4 + 5))
  {
    -[AppTelemetryInvestigation setEventGroupUUID:](self, "setEventGroupUUID:");
    v4 = v16;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[AppTelemetryInvestigation setMigrationUUID:](self, "setMigrationUUID:");
    v4 = v16;
  }
  qbsInvestigation = self->_qbsInvestigation;
  v7 = *((_QWORD *)v4 + 12);
  if (qbsInvestigation)
  {
    if (!v7)
      goto LABEL_36;
    -[AppTelemetryQBSInvestigation mergeFrom:](qbsInvestigation, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_36;
    -[AppTelemetryInvestigation setQbsInvestigation:](self, "setQbsInvestigation:");
  }
  v4 = v16;
LABEL_36:
  qbsPerformance = self->_qbsPerformance;
  v9 = *((_QWORD *)v4 + 13);
  if (qbsPerformance)
  {
    if (!v9)
      goto LABEL_42;
    -[AppTelemetryQBSPerformance mergeFrom:](qbsPerformance, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_42;
    -[AppTelemetryInvestigation setQbsPerformance:](self, "setQbsPerformance:");
  }
  v4 = v16;
LABEL_42:
  fpfsMigrationInvestigation = self->_fpfsMigrationInvestigation;
  v11 = *((_QWORD *)v4 + 6);
  if (fpfsMigrationInvestigation)
  {
    if (!v11)
      goto LABEL_48;
    -[AppTelemetryFPFSMigrationInvestigation mergeFrom:](fpfsMigrationInvestigation, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_48;
    -[AppTelemetryInvestigation setFpfsMigrationInvestigation:](self, "setFpfsMigrationInvestigation:");
  }
  v4 = v16;
LABEL_48:
  if ((*((_BYTE *)v4 + 144) & 2) != 0)
  {
    self->_eventTimestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  fpfsMigrationNonMigratedItemInvestigation = self->_fpfsMigrationNonMigratedItemInvestigation;
  v13 = *((_QWORD *)v4 + 7);
  if (fpfsMigrationNonMigratedItemInvestigation)
  {
    if (!v13)
      goto LABEL_56;
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation mergeFrom:](fpfsMigrationNonMigratedItemInvestigation, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_56;
    -[AppTelemetryInvestigation setFpfsMigrationNonMigratedItemInvestigation:](self, "setFpfsMigrationNonMigratedItemInvestigation:");
  }
  v4 = v16;
LABEL_56:
  stuckStatus = self->_stuckStatus;
  v15 = *((_QWORD *)v4 + 15);
  if (stuckStatus)
  {
    if (!v15)
      goto LABEL_62;
    -[AppTelemetryStuckStatus mergeFrom:](stuckStatus, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_62;
    -[AppTelemetryInvestigation setStuckStatus:](self, "setStuckStatus:");
  }
  v4 = v16;
LABEL_62:
  if ((*((_BYTE *)v4 + 144) & 8) != 0)
  {
    self->_isEnhancedDrivePrivacyEnabled = *((_BYTE *)v4 + 137);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_stuckStatus, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_qbsPerformance, 0);
  objc_storeStrong((id *)&self->_qbsInvestigation, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_migrationUUID, 0);
  objc_storeStrong((id *)&self->_lastStep, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_fpfsMigrationNonMigratedItemInvestigation, 0);
  objc_storeStrong((id *)&self->_fpfsMigrationInvestigation, 0);
  objc_storeStrong((id *)&self->_eventGroupUUID, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (NSData)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneName, a3);
}

- (BOOL)sharedZone
{
  return self->_sharedZone;
}

- (void)setSharedZone:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_sharedZone = a3;
}

- (void)setHasSharedZone:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSharedZone
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (BOOL)hasLastStep
{
  return self->_lastStep != 0;
}

- (NSString)lastStep
{
  return self->_lastStep;
}

- (void)setLastStep:(id)a3
{
  objc_storeStrong((id *)&self->_lastStep, a3);
}

- (BOOL)hasItemID
{
  return self->_itemID != 0;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (BOOL)hasOperationType
{
  return self->_operationType != 0;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (BOOL)nonDiscretionary
{
  return self->_nonDiscretionary;
}

- (void)setNonDiscretionary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_nonDiscretionary = a3;
}

- (void)setHasNonDiscretionary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNonDiscretionary
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasForegroundClients
{
  return self->_hasForegroundClients;
}

- (void)setHasForegroundClients:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasForegroundClients = a3;
}

- (void)setHasHasForegroundClients:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasForegroundClients
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)isPCSChained
{
  return self->_isPCSChained;
}

- (void)setIsPCSChained:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isPCSChained = a3;
}

- (void)setHasIsPCSChained:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsPCSChained
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasEventGroupUUID
{
  return self->_eventGroupUUID != 0;
}

- (NSString)eventGroupUUID
{
  return self->_eventGroupUUID;
}

- (void)setEventGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_eventGroupUUID, a3);
}

- (BOOL)hasMigrationUUID
{
  return self->_migrationUUID != 0;
}

- (NSString)migrationUUID
{
  return self->_migrationUUID;
}

- (void)setMigrationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_migrationUUID, a3);
}

- (BOOL)hasQbsInvestigation
{
  return self->_qbsInvestigation != 0;
}

- (AppTelemetryQBSInvestigation)qbsInvestigation
{
  return self->_qbsInvestigation;
}

- (void)setQbsInvestigation:(id)a3
{
  objc_storeStrong((id *)&self->_qbsInvestigation, a3);
}

- (BOOL)hasQbsPerformance
{
  return self->_qbsPerformance != 0;
}

- (AppTelemetryQBSPerformance)qbsPerformance
{
  return self->_qbsPerformance;
}

- (void)setQbsPerformance:(id)a3
{
  objc_storeStrong((id *)&self->_qbsPerformance, a3);
}

- (BOOL)hasFpfsMigrationInvestigation
{
  return self->_fpfsMigrationInvestigation != 0;
}

- (AppTelemetryFPFSMigrationInvestigation)fpfsMigrationInvestigation
{
  return self->_fpfsMigrationInvestigation;
}

- (void)setFpfsMigrationInvestigation:(id)a3
{
  objc_storeStrong((id *)&self->_fpfsMigrationInvestigation, a3);
}

- (unint64_t)eventTimestamp
{
  return self->_eventTimestamp;
}

- (void)setEventTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventTimestamp = a3;
}

- (void)setHasEventTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasFpfsMigrationNonMigratedItemInvestigation
{
  return self->_fpfsMigrationNonMigratedItemInvestigation != 0;
}

- (AppTelemetryFPFSMigrationNonMigratedItemInvestigation)fpfsMigrationNonMigratedItemInvestigation
{
  return self->_fpfsMigrationNonMigratedItemInvestigation;
}

- (void)setFpfsMigrationNonMigratedItemInvestigation:(id)a3
{
  objc_storeStrong((id *)&self->_fpfsMigrationNonMigratedItemInvestigation, a3);
}

- (BOOL)hasStuckStatus
{
  return self->_stuckStatus != 0;
}

- (AppTelemetryStuckStatus)stuckStatus
{
  return self->_stuckStatus;
}

- (void)setStuckStatus:(id)a3
{
  objc_storeStrong((id *)&self->_stuckStatus, a3);
}

- (BOOL)isEnhancedDrivePrivacyEnabled
{
  return self->_isEnhancedDrivePrivacyEnabled;
}

- (void)setIsEnhancedDrivePrivacyEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isEnhancedDrivePrivacyEnabled = a3;
}

- (void)setHasIsEnhancedDrivePrivacyEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsEnhancedDrivePrivacyEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

@end
