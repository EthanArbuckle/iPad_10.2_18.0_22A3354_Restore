@implementation ODDSiriSchemaODDAssistantDimensions

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
  v9.super_class = (Class)ODDSiriSchemaODDAssistantDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantDimensions siriInputLocale](self, "siriInputLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDAssistantDimensions deleteSiriInputLocale](self, "deleteSiriInputLocale");
  return v5;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[ODDSiriSchemaODDAssistantDimensions setSystemBuild:](self, "setSystemBuild:", 0);
}

- (void)setDataSharingOptInStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataSharingOptInStatus = a3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDataSharingOptInStatus
{
  -[ODDSiriSchemaODDAssistantDimensions setDataSharingOptInStatus:](self, "setDataSharingOptInStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setViewInterface:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_viewInterface = a3;
}

- (BOOL)hasViewInterface
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasViewInterface:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteViewInterface
{
  -[ODDSiriSchemaODDAssistantDimensions setViewInterface:](self, "setViewInterface:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
  -[ODDSiriSchemaODDAssistantDimensions setAudioInterfaceVendorId:](self, "setAudioInterfaceVendorId:", 0);
}

- (BOOL)hasAudioInterfaceProductId
{
  return self->_audioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceProductId
{
  -[ODDSiriSchemaODDAssistantDimensions setAudioInterfaceProductId:](self, "setAudioInterfaceProductId:", 0);
}

- (void)setAsrLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_asrLocation = a3;
}

- (BOOL)hasAsrLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAsrLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAsrLocation
{
  -[ODDSiriSchemaODDAssistantDimensions setAsrLocation:](self, "setAsrLocation:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNlLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_nlLocation = a3;
}

- (BOOL)hasNlLocation
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNlLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNlLocation
{
  -[ODDSiriSchemaODDAssistantDimensions setNlLocation:](self, "setNlLocation:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteSiriInputLocale
{
  -[ODDSiriSchemaODDAssistantDimensions setSiriInputLocale:](self, "setSiriInputLocale:", 0);
}

- (BOOL)hasSubDomain
{
  return self->_subDomain != 0;
}

- (void)deleteSubDomain
{
  -[ODDSiriSchemaODDAssistantDimensions setSubDomain:](self, "setSubDomain:", 0);
}

- (void)setResponseCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_responseCategory = a3;
}

- (BOOL)hasResponseCategory
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteResponseCategory
{
  -[ODDSiriSchemaODDAssistantDimensions setResponseCategory:](self, "setResponseCategory:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsIntelligenceEngineRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isIntelligenceEngineRequest = a3;
}

- (BOOL)hasIsIntelligenceEngineRequest
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsIntelligenceEngineRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsIntelligenceEngineRequest
{
  -[ODDSiriSchemaODDAssistantDimensions setIsIntelligenceEngineRequest:](self, "setIsIntelligenceEngineRequest:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)clearRouting
{
  -[NSArray removeAllObjects](self->_routings, "removeAllObjects");
}

- (void)addRouting:(int)a3
{
  uint64_t v3;
  NSArray *routings;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  routings = self->_routings;
  if (!routings)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_routings;
    self->_routings = v6;

    routings = self->_routings;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](routings, "addObject:", v8);

}

- (unint64_t)routingCount
{
  return -[NSArray count](self->_routings, "count");
}

- (int)routingAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_routings, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ODDSiriSchemaODDAssistantDimensions systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDAssistantDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDAssistantDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  v9 = (char)self->_has;
  if ((v9 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = (char)self->_has;
  }
  if ((v9 & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDAssistantDimensions siriInputLocale](self, "siriInputLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ODDSiriSchemaODDAssistantDimensions siriInputLocale](self, "siriInputLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantDimensions subDomain](self, "subDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_routings;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "intValue", (_QWORD)v19);
        PBDataWriterWriteInt32Field();
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $916BA46340704DE0E90E58582A7E19C6 has;
  unsigned int v13;
  int dataSharingOptInStatus;
  int v15;
  int viewInterface;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  $916BA46340704DE0E90E58582A7E19C6 v27;
  int v28;
  unsigned int v29;
  int asrLocation;
  int v31;
  int nlLocation;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  $916BA46340704DE0E90E58582A7E19C6 v43;
  int v44;
  unsigned int v45;
  int responseCategory;
  int v47;
  int isIntelligenceEngineRequest;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  BOOL v54;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  -[ODDSiriSchemaODDAssistantDimensions systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[ODDSiriSchemaODDAssistantDimensions systemBuild](self, "systemBuild");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssistantDimensions systemBuild](self, "systemBuild");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_53;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[80];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_53;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != objc_msgSend(v4, "dataSharingOptInStatus"))
      goto LABEL_53;
    has = self->_has;
    v13 = v4[80];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_53;
  if (v15)
  {
    viewInterface = self->_viewInterface;
    if (viewInterface != objc_msgSend(v4, "viewInterface"))
      goto LABEL_53;
  }
  -[ODDSiriSchemaODDAssistantDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceVendorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[ODDSiriSchemaODDAssistantDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDAssistantDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceVendorId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_53;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceProductId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[ODDSiriSchemaODDAssistantDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDAssistantDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceProductId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_53;
  }
  else
  {

  }
  v27 = self->_has;
  v28 = (*(unsigned int *)&v27 >> 2) & 1;
  v29 = v4[80];
  if (v28 != ((v29 >> 2) & 1))
    goto LABEL_53;
  if (v28)
  {
    asrLocation = self->_asrLocation;
    if (asrLocation != objc_msgSend(v4, "asrLocation"))
      goto LABEL_53;
    v27 = self->_has;
    v29 = v4[80];
  }
  v31 = (*(unsigned int *)&v27 >> 3) & 1;
  if (v31 != ((v29 >> 3) & 1))
    goto LABEL_53;
  if (v31)
  {
    nlLocation = self->_nlLocation;
    if (nlLocation != objc_msgSend(v4, "nlLocation"))
      goto LABEL_53;
  }
  -[ODDSiriSchemaODDAssistantDimensions siriInputLocale](self, "siriInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInputLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[ODDSiriSchemaODDAssistantDimensions siriInputLocale](self, "siriInputLocale");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[ODDSiriSchemaODDAssistantDimensions siriInputLocale](self, "siriInputLocale");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriInputLocale");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_53;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantDimensions subDomain](self, "subDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[ODDSiriSchemaODDAssistantDimensions subDomain](self, "subDomain");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[ODDSiriSchemaODDAssistantDimensions subDomain](self, "subDomain");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subDomain");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_53;
  }
  else
  {

  }
  v43 = self->_has;
  v44 = (*(unsigned int *)&v43 >> 4) & 1;
  v45 = v4[80];
  if (v44 != ((v45 >> 4) & 1))
    goto LABEL_53;
  if (v44)
  {
    responseCategory = self->_responseCategory;
    if (responseCategory != objc_msgSend(v4, "responseCategory"))
      goto LABEL_53;
    v43 = self->_has;
    v45 = v4[80];
  }
  v47 = (*(unsigned int *)&v43 >> 5) & 1;
  if (v47 != ((v45 >> 5) & 1))
    goto LABEL_53;
  if (v47)
  {
    isIntelligenceEngineRequest = self->_isIntelligenceEngineRequest;
    if (isIntelligenceEngineRequest != objc_msgSend(v4, "isIntelligenceEngineRequest"))
      goto LABEL_53;
  }
  -[ODDSiriSchemaODDAssistantDimensions routings](self, "routings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_52:

    goto LABEL_53;
  }
  -[ODDSiriSchemaODDAssistantDimensions routings](self, "routings");
  v49 = objc_claimAutoreleasedReturnValue();
  if (!v49)
  {

LABEL_56:
    v54 = 1;
    goto LABEL_54;
  }
  v50 = (void *)v49;
  -[ODDSiriSchemaODDAssistantDimensions routings](self, "routings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v51, "isEqual:", v52);

  if ((v53 & 1) != 0)
    goto LABEL_56;
LABEL_53:
  v54 = 0;
LABEL_54:

  return v54;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v14;

  v14 = -[NSString hash](self->_systemBuild, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_dataSharingOptInStatus;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_viewInterface;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_audioInterfaceVendorId, "hash");
  v6 = -[NSString hash](self->_audioInterfaceProductId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v7 = 2654435761 * self->_asrLocation;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v8 = 2654435761 * self->_nlLocation;
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_11:
  v9 = -[SISchemaISOLocale hash](self->_siriInputLocale, "hash");
  v10 = -[NSString hash](self->_subDomain, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v11 = 2654435761 * self->_responseCategory;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_13;
LABEL_15:
    v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSArray hash](self->_routings, "hash");
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_13:
  v12 = 2654435761 * self->_isIntelligenceEngineRequest;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSArray hash](self->_routings, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char has;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  const __CFString *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = -[ODDSiriSchemaODDAssistantDimensions asrLocation](self, "asrLocation");
    v5 = CFSTR("ORCHSIRIASRMODE_UNKNOWN");
    if (v4 == 1)
      v5 = CFSTR("ORCHSIRIASRMODE_SERVER");
    if (v4 == 2)
      v6 = CFSTR("ORCHSIRIASRMODE_DEVICE");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asrLocation"));
  }
  if (self->_audioInterfaceProductId)
  {
    -[ODDSiriSchemaODDAssistantDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioInterfaceProductId"));

  }
  if (self->_audioInterfaceVendorId)
  {
    -[ODDSiriSchemaODDAssistantDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioInterfaceVendorId"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v12 = -[ODDSiriSchemaODDAssistantDimensions dataSharingOptInStatus](self, "dataSharingOptInStatus") - 1;
    if (v12 > 2)
      v13 = CFSTR("UNKNOWN");
    else
      v13 = off_1E563B968[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("dataSharingOptInStatus"));
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_14:
      if ((has & 8) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAssistantDimensions isIntelligenceEngineRequest](self, "isIntelligenceEngineRequest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isIntelligenceEngineRequest"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_32;
    goto LABEL_28;
  }
LABEL_22:
  v15 = -[ODDSiriSchemaODDAssistantDimensions nlLocation](self, "nlLocation");
  v16 = CFSTR("ORCHSIRINLMODE_UNKNOWN");
  if (v15 == 1)
    v16 = CFSTR("ORCHSIRINLMODE_NLV3_SERVER");
  if (v15 == 2)
    v17 = CFSTR("ORCHSIRINLMODE_NLX_DEVICE");
  else
    v17 = v16;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("nlLocation"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_28:
    v18 = -[ODDSiriSchemaODDAssistantDimensions responseCategory](self, "responseCategory") - 1;
    if (v18 > 0xC)
      v19 = CFSTR("RESPONSECATEGORY_UNKNOWN");
    else
      v19 = off_1E563B980[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("responseCategory"));
  }
LABEL_32:
  if (-[NSArray count](self->_routings, "count"))
  {
    -[ODDSiriSchemaODDAssistantDimensions routings](self, "routings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("routing"));

  }
  if (self->_siriInputLocale)
  {
    -[ODDSiriSchemaODDAssistantDimensions siriInputLocale](self, "siriInputLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("siriInputLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("siriInputLocale"));

    }
  }
  if (self->_subDomain)
  {
    -[ODDSiriSchemaODDAssistantDimensions subDomain](self, "subDomain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("subDomain"));

  }
  if (self->_systemBuild)
  {
    -[ODDSiriSchemaODDAssistantDimensions systemBuild](self, "systemBuild");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("systemBuild"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v29 = -[ODDSiriSchemaODDAssistantDimensions viewInterface](self, "viewInterface") - 1;
    if (v29 > 7)
      v30 = CFSTR("ASSISTANTVIEWMODE_UNKNOWN");
    else
      v30 = off_1E563B9E8[v29];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("viewInterface"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssistantDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantDimensions *v5;
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
    self = -[ODDSiriSchemaODDAssistantDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantDimensions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  SISchemaISOLocale *v18;
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
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  ODDSiriSchemaODDAssistantDimensions *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)ODDSiriSchemaODDAssistantDimensions;
  v5 = -[ODDSiriSchemaODDAssistantDimensions init](&v54, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ODDSiriSchemaODDAssistantDimensions setSystemBuild:](v5, "setSystemBuild:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSharingOptInStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantDimensions setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantDimensions setViewInterface:](v5, "setViewInterface:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceVendorId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ODDSiriSchemaODDAssistantDimensions setAudioInterfaceVendorId:](v5, "setAudioInterfaceVendorId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceProductId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ODDSiriSchemaODDAssistantDimensions setAudioInterfaceProductId:](v5, "setAudioInterfaceProductId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantDimensions setAsrLocation:](v5, "setAsrLocation:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlLocation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantDimensions setNlLocation:](v5, "setNlLocation:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = (void *)v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v14;
      v18 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v48);
      -[ODDSiriSchemaODDAssistantDimensions setSiriInputLocale:](v5, "setSiriInputLocale:", v18);

      v14 = v17;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subDomain"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v4;
      v20 = v14;
      v21 = v12;
      v22 = v10;
      v23 = v9;
      v24 = v8;
      v25 = v6;
      v26 = v19;
      v27 = (void *)objc_msgSend(v19, "copy");
      -[ODDSiriSchemaODDAssistantDimensions setSubDomain:](v5, "setSubDomain:", v27);

      v19 = v26;
      v6 = v25;
      v8 = v24;
      v9 = v23;
      v10 = v22;
      v12 = v21;
      v14 = v20;
      v4 = v46;
    }
    v47 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseCategory"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantDimensions setResponseCategory:](v5, "setResponseCategory:", objc_msgSend(v28, "intValue"));
    v44 = v28;
    v45 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIntelligenceEngineRequest"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantDimensions setIsIntelligenceEngineRequest:](v5, "setIsIntelligenceEngineRequest:", objc_msgSend(v29, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routing"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = v19;
      v40 = v14;
      v41 = v9;
      v42 = v8;
      v43 = v6;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v51 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ODDSiriSchemaODDAssistantDimensions addRouting:](v5, "addRouting:", objc_msgSend(v36, "intValue"));
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v33);
      }

      v8 = v42;
      v6 = v43;
      v14 = v40;
      v9 = v41;
      v19 = v39;
    }
    v37 = v5;

  }
  return v5;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (int)viewInterface
{
  return self->_viewInterface;
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)audioInterfaceProductId
{
  return self->_audioInterfaceProductId;
}

- (void)setAudioInterfaceProductId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)asrLocation
{
  return self->_asrLocation;
}

- (int)nlLocation
{
  return self->_nlLocation;
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (void)setSiriInputLocale:(id)a3
{
  objc_storeStrong((id *)&self->_siriInputLocale, a3);
}

- (NSString)subDomain
{
  return self->_subDomain;
}

- (void)setSubDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)responseCategory
{
  return self->_responseCategory;
}

- (BOOL)isIntelligenceEngineRequest
{
  return self->_isIntelligenceEngineRequest;
}

- (NSArray)routings
{
  return self->_routings;
}

- (void)setRoutings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAudioInterfaceProductId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasSubDomain:(BOOL)a3
{
  self->_hasAudioInterfaceVendorId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routings, 0);
  objc_storeStrong((id *)&self->_subDomain, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

@end
