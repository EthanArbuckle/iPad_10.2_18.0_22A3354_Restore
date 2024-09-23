@implementation VCPBWorkflow

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setIconColor:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_iconColor = a3;
}

- (void)setHasIconColor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIconColor
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIconGlyph:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_iconGlyph = a3;
}

- (void)setHasIconGlyph:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIconGlyph
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearWorkflowTypes
{
  -[NSMutableArray removeAllObjects](self->_workflowTypes, "removeAllObjects");
}

- (void)addWorkflowTypes:(id)a3
{
  id v4;
  NSMutableArray *workflowTypes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  workflowTypes = self->_workflowTypes;
  v8 = v4;
  if (!workflowTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_workflowTypes;
    self->_workflowTypes = v6;

    v4 = v8;
    workflowTypes = self->_workflowTypes;
  }
  -[NSMutableArray addObject:](workflowTypes, "addObject:", v4);

}

- (unint64_t)workflowTypesCount
{
  return -[NSMutableArray count](self->_workflowTypes, "count");
}

- (id)workflowTypesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_workflowTypes, "objectAtIndex:", a3);
}

- (void)clearInputClasses
{
  -[NSMutableArray removeAllObjects](self->_inputClasses, "removeAllObjects");
}

- (void)addInputClasses:(id)a3
{
  id v4;
  NSMutableArray *inputClasses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  inputClasses = self->_inputClasses;
  v8 = v4;
  if (!inputClasses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_inputClasses;
    self->_inputClasses = v6;

    v4 = v8;
    inputClasses = self->_inputClasses;
  }
  -[NSMutableArray addObject:](inputClasses, "addObject:", v4);

}

- (unint64_t)inputClassesCount
{
  return -[NSMutableArray count](self->_inputClasses, "count");
}

- (id)inputClassesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_inputClasses, "objectAtIndex:", a3);
}

- (BOOL)hasActionsData
{
  return self->_actionsData != 0;
}

- (BOOL)hasImportQuestionsData
{
  return self->_importQuestionsData != 0;
}

- (void)setIntegerMinimumClientVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_integerMinimumClientVersion = a3;
}

- (void)setHasIntegerMinimumClientVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntegerMinimumClientVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIntegerLastMigratedClientVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_integerLastMigratedClientVersion = a3;
}

- (void)setHasIntegerLastMigratedClientVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerLastMigratedClientVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMinimumClientVersion
{
  return self->_minimumClientVersion != 0;
}

- (BOOL)hasLastMigratedClientVersion
{
  return self->_lastMigratedClientVersion != 0;
}

- (BOOL)hasAccessResourcePerWorkflowStateData
{
  return self->_accessResourcePerWorkflowStateData != 0;
}

- (int)remoteQuarantineStatus
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_remoteQuarantineStatus;
  else
    return 1;
}

- (void)setRemoteQuarantineStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_remoteQuarantineStatus = a3;
}

- (void)setHasRemoteQuarantineStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRemoteQuarantineStatus
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)remoteQuarantineStatusAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7AA6690[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRemoteQuarantineStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotQuarantined")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Quarantined")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("QuarantinedAllowedByUser")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
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
  v8.super_class = (Class)VCPBWorkflow;
  -[VCPBWorkflow description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPBWorkflow dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  char has;
  void *v7;
  NSMutableArray *workflowTypes;
  NSMutableArray *inputClasses;
  NSData *actionsData;
  NSData *importQuestionsData;
  char v12;
  void *v13;
  void *v14;
  NSString *minimumClientVersion;
  NSString *lastMigratedClientVersion;
  NSData *accessResourcePerWorkflowStateData;
  unsigned int v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *subtitle;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_iconColor);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("iconColor"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_iconGlyph);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("iconGlyph"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("creationDate"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("modificationDate"));

  }
LABEL_8:
  workflowTypes = self->_workflowTypes;
  if (workflowTypes)
    objc_msgSend(v4, "setObject:forKey:", workflowTypes, CFSTR("workflowTypes"));
  inputClasses = self->_inputClasses;
  if (inputClasses)
    objc_msgSend(v4, "setObject:forKey:", inputClasses, CFSTR("inputClasses"));
  actionsData = self->_actionsData;
  if (actionsData)
    objc_msgSend(v4, "setObject:forKey:", actionsData, CFSTR("actionsData"));
  importQuestionsData = self->_importQuestionsData;
  if (importQuestionsData)
    objc_msgSend(v4, "setObject:forKey:", importQuestionsData, CFSTR("importQuestionsData"));
  v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_integerMinimumClientVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("integerMinimumClientVersion"));

    v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_integerLastMigratedClientVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("integerLastMigratedClientVersion"));

  }
  minimumClientVersion = self->_minimumClientVersion;
  if (minimumClientVersion)
    objc_msgSend(v4, "setObject:forKey:", minimumClientVersion, CFSTR("minimumClientVersion"));
  lastMigratedClientVersion = self->_lastMigratedClientVersion;
  if (lastMigratedClientVersion)
    objc_msgSend(v4, "setObject:forKey:", lastMigratedClientVersion, CFSTR("lastMigratedClientVersion"));
  accessResourcePerWorkflowStateData = self->_accessResourcePerWorkflowStateData;
  if (accessResourcePerWorkflowStateData)
    objc_msgSend(v4, "setObject:forKey:", accessResourcePerWorkflowStateData, CFSTR("accessResourcePerWorkflowStateData"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v18 = self->_remoteQuarantineStatus - 1;
    if (v18 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_remoteQuarantineStatus);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E7AA6690[v18];
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("remoteQuarantineStatus"));

  }
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VCPBWorkflowReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteFixed32Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFixed32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_workflowTypes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_inputClasses;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  if (self->_actionsData)
    PBDataWriterWriteDataField();
  if (self->_importQuestionsData)
    PBDataWriterWriteDataField();
  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_minimumClientVersion)
    PBDataWriterWriteStringField();
  if (self->_lastMigratedClientVersion)
    PBDataWriterWriteStringField();
  if (self->_accessResourcePerWorkflowStateData)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_subtitle)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  _QWORD *v14;
  char v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v16;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_iconColor;
    *((_BYTE *)v4 + 128) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_37:
      *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
      *((_BYTE *)v4 + 128) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 15) = self->_iconGlyph;
  *((_BYTE *)v4 + 128) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_37;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v4 + 128) |= 8u;
  }
LABEL_8:
  if (-[VCPBWorkflow workflowTypesCount](self, "workflowTypesCount"))
  {
    objc_msgSend(v16, "clearWorkflowTypes");
    v6 = -[VCPBWorkflow workflowTypesCount](self, "workflowTypesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[VCPBWorkflow workflowTypesAtIndex:](self, "workflowTypesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addWorkflowTypes:", v9);

      }
    }
  }
  if (-[VCPBWorkflow inputClassesCount](self, "inputClassesCount"))
  {
    objc_msgSend(v16, "clearInputClasses");
    v10 = -[VCPBWorkflow inputClassesCount](self, "inputClassesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[VCPBWorkflow inputClassesAtIndex:](self, "inputClassesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addInputClasses:", v13);

      }
    }
  }
  if (self->_actionsData)
    objc_msgSend(v16, "setActionsData:");
  v14 = v16;
  if (self->_importQuestionsData)
  {
    objc_msgSend(v16, "setImportQuestionsData:");
    v14 = v16;
  }
  v15 = (char)self->_has;
  if ((v15 & 4) != 0)
  {
    v14[3] = self->_integerMinimumClientVersion;
    *((_BYTE *)v14 + 128) |= 4u;
    v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    v14[2] = self->_integerLastMigratedClientVersion;
    *((_BYTE *)v14 + 128) |= 2u;
  }
  if (self->_minimumClientVersion)
  {
    objc_msgSend(v16, "setMinimumClientVersion:");
    v14 = v16;
  }
  if (self->_lastMigratedClientVersion)
  {
    objc_msgSend(v16, "setLastMigratedClientVersion:");
    v14 = v16;
  }
  if (self->_accessResourcePerWorkflowStateData)
  {
    objc_msgSend(v16, "setAccessResourcePerWorkflowStateData:");
    v14 = v16;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v14 + 26) = self->_remoteQuarantineStatus;
    *((_BYTE *)v14 + 128) |= 0x40u;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v16, "setSubtitle:");
    v14 = v16;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v6;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_iconColor;
    *(_BYTE *)(v5 + 128) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_iconGlyph;
  *(_BYTE *)(v5 + 128) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_29:
  *(double *)(v5 + 8) = self->_creationDate;
  *(_BYTE *)(v5 + 128) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(double *)(v5 + 32) = self->_modificationDate;
    *(_BYTE *)(v5 + 128) |= 8u;
  }
LABEL_6:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = self->_workflowTypes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addWorkflowTypes:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = self->_inputClasses;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend((id)v5, "addInputClasses:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v17);
  }

  v21 = -[NSData copyWithZone:](self->_actionsData, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v21;

  v23 = -[NSData copyWithZone:](self->_importQuestionsData, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v23;

  v25 = (char)self->_has;
  if ((v25 & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_integerMinimumClientVersion;
    *(_BYTE *)(v5 + 128) |= 4u;
    v25 = (char)self->_has;
  }
  if ((v25 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_integerLastMigratedClientVersion;
    *(_BYTE *)(v5 + 128) |= 2u;
  }
  v26 = -[NSString copyWithZone:](self->_minimumClientVersion, "copyWithZone:", a3, (_QWORD)v35);
  v27 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v26;

  v28 = -[NSString copyWithZone:](self->_lastMigratedClientVersion, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v28;

  v30 = -[NSData copyWithZone:](self->_accessResourcePerWorkflowStateData, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v30;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_remoteQuarantineStatus;
    *(_BYTE *)(v5 + 128) |= 0x40u;
  }
  v32 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v32;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSMutableArray *workflowTypes;
  NSMutableArray *inputClasses;
  NSData *actionsData;
  NSData *importQuestionsData;
  NSString *minimumClientVersion;
  NSString *lastMigratedClientVersion;
  NSData *accessResourcePerWorkflowStateData;
  NSString *subtitle;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 0x10) == 0 || self->_iconColor != *((_DWORD *)v4 + 14))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 128) & 0x10) != 0)
  {
LABEL_55:
    v14 = 0;
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 0x20) == 0 || self->_iconGlyph != *((_DWORD *)v4 + 15))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 128) & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 128) & 1) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 8) == 0 || self->_modificationDate != *((double *)v4 + 4))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 128) & 8) != 0)
  {
    goto LABEL_55;
  }
  workflowTypes = self->_workflowTypes;
  if ((unint64_t)workflowTypes | *((_QWORD *)v4 + 15)
    && !-[NSMutableArray isEqual:](workflowTypes, "isEqual:"))
  {
    goto LABEL_55;
  }
  inputClasses = self->_inputClasses;
  if ((unint64_t)inputClasses | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](inputClasses, "isEqual:"))
      goto LABEL_55;
  }
  actionsData = self->_actionsData;
  if ((unint64_t)actionsData | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](actionsData, "isEqual:"))
      goto LABEL_55;
  }
  importQuestionsData = self->_importQuestionsData;
  if ((unint64_t)importQuestionsData | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](importQuestionsData, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 4) == 0 || self->_integerMinimumClientVersion != *((_QWORD *)v4 + 3))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 128) & 4) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 2) == 0 || self->_integerLastMigratedClientVersion != *((_QWORD *)v4 + 2))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 128) & 2) != 0)
  {
    goto LABEL_55;
  }
  minimumClientVersion = self->_minimumClientVersion;
  if ((unint64_t)minimumClientVersion | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](minimumClientVersion, "isEqual:"))
  {
    goto LABEL_55;
  }
  lastMigratedClientVersion = self->_lastMigratedClientVersion;
  if ((unint64_t)lastMigratedClientVersion | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](lastMigratedClientVersion, "isEqual:"))
      goto LABEL_55;
  }
  accessResourcePerWorkflowStateData = self->_accessResourcePerWorkflowStateData;
  if ((unint64_t)accessResourcePerWorkflowStateData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](accessResourcePerWorkflowStateData, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 0x40) == 0 || self->_remoteQuarantineStatus != *((_DWORD *)v4 + 26))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 128) & 0x40) != 0)
  {
    goto LABEL_55;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 14))
    v14 = -[NSString isEqual:](subtitle, "isEqual:");
  else
    v14 = 1;
LABEL_56:

  return v14;
}

- (unint64_t)hash
{
  char has;
  double creationDate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double modificationDate;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;

  v28 = -[NSString hash](self->_name, "hash");
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    v27 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
LABEL_9:
    v26 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v27 = 2654435761 * self->_iconColor;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_9;
LABEL_3:
  v26 = 2654435761 * self->_iconGlyph;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  creationDate = self->_creationDate;
  v5 = -creationDate;
  if (creationDate >= 0.0)
    v5 = self->_creationDate;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  v25 = v8;
  if ((has & 8) != 0)
  {
    modificationDate = self->_modificationDate;
    v11 = -modificationDate;
    if (modificationDate >= 0.0)
      v11 = self->_modificationDate;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v24 = -[NSMutableArray hash](self->_workflowTypes, "hash");
  v23 = -[NSMutableArray hash](self->_inputClasses, "hash");
  v14 = -[NSData hash](self->_actionsData, "hash");
  v15 = -[NSData hash](self->_importQuestionsData, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v16 = 2654435761u * self->_integerMinimumClientVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_23;
  }
  else
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_23:
      v17 = 2654435761u * self->_integerLastMigratedClientVersion;
      goto LABEL_26;
    }
  }
  v17 = 0;
LABEL_26:
  v18 = -[NSString hash](self->_minimumClientVersion, "hash");
  v19 = -[NSString hash](self->_lastMigratedClientVersion, "hash");
  v20 = -[NSData hash](self->_accessResourcePerWorkflowStateData, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v21 = 2654435761 * self->_remoteQuarantineStatus;
  else
    v21 = 0;
  return v27 ^ v28 ^ v26 ^ v25 ^ v9 ^ v24 ^ v23 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[NSString hash](self->_subtitle, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 12))
    -[VCPBWorkflow setName:](self, "setName:");
  v5 = *((_BYTE *)v4 + 128);
  if ((v5 & 0x10) != 0)
  {
    self->_iconColor = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 128);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)v4 + 128) & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_iconGlyph = *((_DWORD *)v4 + 15);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 128);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_43:
  self->_creationDate = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 128) & 8) != 0)
  {
LABEL_7:
    self->_modificationDate = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *((id *)v4 + 15);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[VCPBWorkflow addWorkflowTypes:](self, "addWorkflowTypes:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v4 + 9);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[VCPBWorkflow addInputClasses:](self, "addInputClasses:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v4 + 6))
    -[VCPBWorkflow setActionsData:](self, "setActionsData:");
  if (*((_QWORD *)v4 + 8))
    -[VCPBWorkflow setImportQuestionsData:](self, "setImportQuestionsData:");
  v16 = *((_BYTE *)v4 + 128);
  if ((v16 & 4) != 0)
  {
    self->_integerMinimumClientVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v16 = *((_BYTE *)v4 + 128);
  }
  if ((v16 & 2) != 0)
  {
    self->_integerLastMigratedClientVersion = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 11))
    -[VCPBWorkflow setMinimumClientVersion:](self, "setMinimumClientVersion:");
  if (*((_QWORD *)v4 + 10))
    -[VCPBWorkflow setLastMigratedClientVersion:](self, "setLastMigratedClientVersion:");
  if (*((_QWORD *)v4 + 5))
    -[VCPBWorkflow setAccessResourcePerWorkflowStateData:](self, "setAccessResourcePerWorkflowStateData:");
  if ((*((_BYTE *)v4 + 128) & 0x40) != 0)
  {
    self->_remoteQuarantineStatus = *((_DWORD *)v4 + 26);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 14))
    -[VCPBWorkflow setSubtitle:](self, "setSubtitle:");

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)iconColor
{
  return self->_iconColor;
}

- (unsigned)iconGlyph
{
  return self->_iconGlyph;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (NSMutableArray)workflowTypes
{
  return self->_workflowTypes;
}

- (void)setWorkflowTypes:(id)a3
{
  objc_storeStrong((id *)&self->_workflowTypes, a3);
}

- (NSMutableArray)inputClasses
{
  return self->_inputClasses;
}

- (void)setInputClasses:(id)a3
{
  objc_storeStrong((id *)&self->_inputClasses, a3);
}

- (NSData)actionsData
{
  return self->_actionsData;
}

- (void)setActionsData:(id)a3
{
  objc_storeStrong((id *)&self->_actionsData, a3);
}

- (NSData)importQuestionsData
{
  return self->_importQuestionsData;
}

- (void)setImportQuestionsData:(id)a3
{
  objc_storeStrong((id *)&self->_importQuestionsData, a3);
}

- (unint64_t)integerMinimumClientVersion
{
  return self->_integerMinimumClientVersion;
}

- (unint64_t)integerLastMigratedClientVersion
{
  return self->_integerLastMigratedClientVersion;
}

- (NSString)minimumClientVersion
{
  return self->_minimumClientVersion;
}

- (void)setMinimumClientVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minimumClientVersion, a3);
}

- (NSString)lastMigratedClientVersion
{
  return self->_lastMigratedClientVersion;
}

- (void)setLastMigratedClientVersion:(id)a3
{
  objc_storeStrong((id *)&self->_lastMigratedClientVersion, a3);
}

- (NSData)accessResourcePerWorkflowStateData
{
  return self->_accessResourcePerWorkflowStateData;
}

- (void)setAccessResourcePerWorkflowStateData:(id)a3
{
  objc_storeStrong((id *)&self->_accessResourcePerWorkflowStateData, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowTypes, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_lastMigratedClientVersion, 0);
  objc_storeStrong((id *)&self->_inputClasses, 0);
  objc_storeStrong((id *)&self->_importQuestionsData, 0);
  objc_storeStrong((id *)&self->_actionsData, 0);
  objc_storeStrong((id *)&self->_accessResourcePerWorkflowStateData, 0);
}

+ (Class)workflowTypesType
{
  return (Class)objc_opt_class();
}

+ (Class)inputClassesType
{
  return (Class)objc_opt_class();
}

@end
