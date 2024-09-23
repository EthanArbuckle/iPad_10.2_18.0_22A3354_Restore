@implementation ODDSiriSchemaODDDictationDimensions

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
  v9.super_class = (Class)ODDSiriSchemaODDDictationDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDDictationDimensions dictationLocale](self, "dictationLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDDictationDimensions deleteDictationLocale](self, "deleteDictationLocale");
  return v5;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[ODDSiriSchemaODDDictationDimensions setSystemBuild:](self, "setSystemBuild:", 0);
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
  -[ODDSiriSchemaODDDictationDimensions setDataSharingOptInStatus:](self, "setDataSharingOptInStatus:", 0);
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
  -[ODDSiriSchemaODDDictationDimensions setViewInterface:](self, "setViewInterface:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
  -[ODDSiriSchemaODDDictationDimensions setAudioInterfaceVendorId:](self, "setAudioInterfaceVendorId:", 0);
}

- (BOOL)hasAudioInterfaceProductId
{
  return self->_audioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceProductId
{
  -[ODDSiriSchemaODDDictationDimensions setAudioInterfaceProductId:](self, "setAudioInterfaceProductId:", 0);
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
  -[ODDSiriSchemaODDDictationDimensions setAsrLocation:](self, "setAsrLocation:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasDictationLocale
{
  return self->_dictationLocale != 0;
}

- (void)deleteDictationLocale
{
  -[ODDSiriSchemaODDDictationDimensions setDictationLocale:](self, "setDictationLocale:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[ODDSiriSchemaODDDictationDimensions systemBuild](self, "systemBuild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDDictationDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDDictationDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDDictationDimensions dictationLocale](self, "dictationLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[ODDSiriSchemaODDDictationDimensions dictationLocale](self, "dictationLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
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
  $95A3D8DBD031F8DA9D649EFC8CBA09F8 has;
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
  int v27;
  int asrLocation;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[ODDSiriSchemaODDDictationDimensions systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[ODDSiriSchemaODDDictationDimensions systemBuild](self, "systemBuild");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDDictationDimensions systemBuild](self, "systemBuild");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_32;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != objc_msgSend(v4, "dataSharingOptInStatus"))
      goto LABEL_32;
    has = self->_has;
    v13 = v4[56];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_32;
  if (v15)
  {
    viewInterface = self->_viewInterface;
    if (viewInterface != objc_msgSend(v4, "viewInterface"))
      goto LABEL_32;
  }
  -[ODDSiriSchemaODDDictationDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceVendorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[ODDSiriSchemaODDDictationDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDDictationDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceVendorId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[ODDSiriSchemaODDDictationDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceProductId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[ODDSiriSchemaODDDictationDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDDictationDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceProductId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  v27 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v27 != ((v4[56] >> 2) & 1))
    goto LABEL_32;
  if (v27)
  {
    asrLocation = self->_asrLocation;
    if (asrLocation != objc_msgSend(v4, "asrLocation"))
      goto LABEL_32;
  }
  -[ODDSiriSchemaODDDictationDimensions dictationLocale](self, "dictationLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[ODDSiriSchemaODDDictationDimensions dictationLocale](self, "dictationLocale");
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29)
  {

LABEL_35:
    v34 = 1;
    goto LABEL_33;
  }
  v30 = (void *)v29;
  -[ODDSiriSchemaODDDictationDimensions dictationLocale](self, "dictationLocale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationLocale");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqual:", v32);

  if ((v33 & 1) != 0)
    goto LABEL_35;
LABEL_32:
  v34 = 0;
LABEL_33:

  return v34;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_systemBuild, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_dataSharingOptInStatus;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_viewInterface;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_audioInterfaceVendorId, "hash");
  v7 = -[NSString hash](self->_audioInterfaceProductId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_asrLocation;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[SISchemaISOLocale hash](self->_dictationLocale, "hash");
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
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = -[ODDSiriSchemaODDDictationDimensions asrLocation](self, "asrLocation");
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
    -[ODDSiriSchemaODDDictationDimensions audioInterfaceProductId](self, "audioInterfaceProductId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioInterfaceProductId"));

  }
  if (self->_audioInterfaceVendorId)
  {
    -[ODDSiriSchemaODDDictationDimensions audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioInterfaceVendorId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = -[ODDSiriSchemaODDDictationDimensions dataSharingOptInStatus](self, "dataSharingOptInStatus") - 1;
    if (v11 > 2)
      v12 = CFSTR("UNKNOWN");
    else
      v12 = off_1E563BA28[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("dataSharingOptInStatus"));
  }
  if (self->_dictationLocale)
  {
    -[ODDSiriSchemaODDDictationDimensions dictationLocale](self, "dictationLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("dictationLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("dictationLocale"));

    }
  }
  if (self->_systemBuild)
  {
    -[ODDSiriSchemaODDDictationDimensions systemBuild](self, "systemBuild");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("systemBuild"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v18 = -[ODDSiriSchemaODDDictationDimensions viewInterface](self, "viewInterface") - 1;
    if (v18 > 7)
      v19 = CFSTR("ASSISTANTVIEWMODE_UNKNOWN");
    else
      v19 = off_1E563BA40[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("viewInterface"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDDictationDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDDictationDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDDictationDimensions *v5;
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
    self = -[ODDSiriSchemaODDDictationDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDDictationDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDDictationDimensions *v5;
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
  SISchemaISOLocale *v16;
  ODDSiriSchemaODDDictationDimensions *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ODDSiriSchemaODDDictationDimensions;
  v5 = -[ODDSiriSchemaODDDictationDimensions init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ODDSiriSchemaODDDictationDimensions setSystemBuild:](v5, "setSystemBuild:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSharingOptInStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDictationDimensions setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDictationDimensions setViewInterface:](v5, "setViewInterface:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceVendorId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ODDSiriSchemaODDDictationDimensions setAudioInterfaceVendorId:](v5, "setAudioInterfaceVendorId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceProductId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ODDSiriSchemaODDDictationDimensions setAudioInterfaceProductId:](v5, "setAudioInterfaceProductId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDictationDimensions setAsrLocation:](v5, "setAsrLocation:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationLocale"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v15);
      -[ODDSiriSchemaODDDictationDimensions setDictationLocale:](v5, "setDictationLocale:", v16);

    }
    v17 = v5;

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

- (SISchemaISOLocale)dictationLocale
{
  return self->_dictationLocale;
}

- (void)setDictationLocale:(id)a3
{
  objc_storeStrong((id *)&self->_dictationLocale, a3);
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

- (void)setHasDictationLocale:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationLocale, 0);
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

@end
