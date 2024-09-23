@implementation MWTSchemaMWTClientEvent

- (id)getComponentId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mwtId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        goto LABEL_11;
    }
  }
  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v4 = v10;
LABEL_11:
        v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "value");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
      goto LABEL_11;
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mwtId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    LODWORD(v9) = 25;
  }
  else
  {
LABEL_5:
    -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_9;
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    v13 = (void *)v12;
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subRequestId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v4, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (v18)
            LODWORD(v9) = 43;
          else
            LODWORD(v9) = 0;
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

+ (int)joinability
{
  return 2;
}

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MWTSchemaMWTClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MWTSchemaMWTClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[MWTSchemaMWTClientEvent mwtCheckpointReported](self, "mwtCheckpointReported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MWTSchemaMWTClientEvent deleteMwtCheckpointReported](self, "deleteMwtCheckpointReported");
  -[MWTSchemaMWTClientEvent mwtMusicMetadataReported](self, "mwtMusicMetadataReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MWTSchemaMWTClientEvent deleteMwtMusicMetadataReported](self, "deleteMwtMusicMetadataReported");
  -[MWTSchemaMWTClientEvent mwtVMCpuStatsReported](self, "mwtVMCpuStatsReported");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[MWTSchemaMWTClientEvent deleteMwtVMCpuStatsReported](self, "deleteMwtVMCpuStatsReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[MWTSchemaMWTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629F38[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 0;
  else
    return off_1E5629F50[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[MWTSchemaMWTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 2)
    return CFSTR("com.apple.aiml.siri.mwt.MWTClientEvent");
  else
    return off_1E5630CA8[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[MWTSchemaMWTClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setMwtCheckpointReported:(id)a3
{
  MWTSchemaMWTCheckpointReported *v4;
  MWTSchemaMWTMusicMetadataReported *mwtMusicMetadataReported;
  MWTSchemaMWTVMCPUStatsReported *mwtVMCpuStatsReported;
  unint64_t v7;
  MWTSchemaMWTCheckpointReported *mwtCheckpointReported;

  v4 = (MWTSchemaMWTCheckpointReported *)a3;
  mwtMusicMetadataReported = self->_mwtMusicMetadataReported;
  self->_mwtMusicMetadataReported = 0;

  mwtVMCpuStatsReported = self->_mwtVMCpuStatsReported;
  self->_mwtVMCpuStatsReported = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  mwtCheckpointReported = self->_mwtCheckpointReported;
  self->_mwtCheckpointReported = v4;

}

- (MWTSchemaMWTCheckpointReported)mwtCheckpointReported
{
  if (self->_whichEvent_Type == 101)
    return self->_mwtCheckpointReported;
  else
    return (MWTSchemaMWTCheckpointReported *)0;
}

- (void)deleteMwtCheckpointReported
{
  MWTSchemaMWTCheckpointReported *mwtCheckpointReported;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    mwtCheckpointReported = self->_mwtCheckpointReported;
    self->_mwtCheckpointReported = 0;

  }
}

- (void)setMwtMusicMetadataReported:(id)a3
{
  MWTSchemaMWTMusicMetadataReported *v4;
  MWTSchemaMWTCheckpointReported *mwtCheckpointReported;
  MWTSchemaMWTVMCPUStatsReported *mwtVMCpuStatsReported;
  unint64_t v7;
  MWTSchemaMWTMusicMetadataReported *mwtMusicMetadataReported;

  v4 = (MWTSchemaMWTMusicMetadataReported *)a3;
  mwtCheckpointReported = self->_mwtCheckpointReported;
  self->_mwtCheckpointReported = 0;

  mwtVMCpuStatsReported = self->_mwtVMCpuStatsReported;
  self->_mwtVMCpuStatsReported = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  mwtMusicMetadataReported = self->_mwtMusicMetadataReported;
  self->_mwtMusicMetadataReported = v4;

}

- (MWTSchemaMWTMusicMetadataReported)mwtMusicMetadataReported
{
  if (self->_whichEvent_Type == 102)
    return self->_mwtMusicMetadataReported;
  else
    return (MWTSchemaMWTMusicMetadataReported *)0;
}

- (void)deleteMwtMusicMetadataReported
{
  MWTSchemaMWTMusicMetadataReported *mwtMusicMetadataReported;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    mwtMusicMetadataReported = self->_mwtMusicMetadataReported;
    self->_mwtMusicMetadataReported = 0;

  }
}

- (void)setMwtVMCpuStatsReported:(id)a3
{
  MWTSchemaMWTVMCPUStatsReported *v4;
  MWTSchemaMWTCheckpointReported *mwtCheckpointReported;
  MWTSchemaMWTMusicMetadataReported *mwtMusicMetadataReported;
  unint64_t v7;
  MWTSchemaMWTVMCPUStatsReported *mwtVMCpuStatsReported;

  v4 = (MWTSchemaMWTVMCPUStatsReported *)a3;
  mwtCheckpointReported = self->_mwtCheckpointReported;
  self->_mwtCheckpointReported = 0;

  mwtMusicMetadataReported = self->_mwtMusicMetadataReported;
  self->_mwtMusicMetadataReported = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  mwtVMCpuStatsReported = self->_mwtVMCpuStatsReported;
  self->_mwtVMCpuStatsReported = v4;

}

- (MWTSchemaMWTVMCPUStatsReported)mwtVMCpuStatsReported
{
  if (self->_whichEvent_Type == 103)
    return self->_mwtVMCpuStatsReported;
  else
    return (MWTSchemaMWTVMCPUStatsReported *)0;
}

- (void)deleteMwtVMCpuStatsReported
{
  MWTSchemaMWTVMCPUStatsReported *mwtVMCpuStatsReported;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    mwtVMCpuStatsReported = self->_mwtVMCpuStatsReported;
    self->_mwtVMCpuStatsReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return MWTSchemaMWTClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MWTSchemaMWTClientEvent mwtCheckpointReported](self, "mwtCheckpointReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MWTSchemaMWTClientEvent mwtCheckpointReported](self, "mwtCheckpointReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MWTSchemaMWTClientEvent mwtMusicMetadataReported](self, "mwtMusicMetadataReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MWTSchemaMWTClientEvent mwtMusicMetadataReported](self, "mwtMusicMetadataReported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MWTSchemaMWTClientEvent mwtVMCpuStatsReported](self, "mwtVMCpuStatsReported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MWTSchemaMWTClientEvent mwtVMCpuStatsReported](self, "mwtVMCpuStatsReported");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_23;
  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[MWTSchemaMWTClientEvent mwtCheckpointReported](self, "mwtCheckpointReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mwtCheckpointReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[MWTSchemaMWTClientEvent mwtCheckpointReported](self, "mwtCheckpointReported");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[MWTSchemaMWTClientEvent mwtCheckpointReported](self, "mwtCheckpointReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mwtCheckpointReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[MWTSchemaMWTClientEvent mwtMusicMetadataReported](self, "mwtMusicMetadataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mwtMusicMetadataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[MWTSchemaMWTClientEvent mwtMusicMetadataReported](self, "mwtMusicMetadataReported");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[MWTSchemaMWTClientEvent mwtMusicMetadataReported](self, "mwtMusicMetadataReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mwtMusicMetadataReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[MWTSchemaMWTClientEvent mwtVMCpuStatsReported](self, "mwtVMCpuStatsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mwtVMCpuStatsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[MWTSchemaMWTClientEvent mwtVMCpuStatsReported](self, "mwtVMCpuStatsReported");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[MWTSchemaMWTClientEvent mwtVMCpuStatsReported](self, "mwtVMCpuStatsReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mwtVMCpuStatsReported");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[MWTSchemaMWTEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[MWTSchemaMWTCheckpointReported hash](self->_mwtCheckpointReported, "hash") ^ v3;
  v5 = -[MWTSchemaMWTMusicMetadataReported hash](self->_mwtMusicMetadataReported, "hash");
  return v4 ^ v5 ^ -[MWTSchemaMWTVMCPUStatsReported hash](self->_mwtVMCpuStatsReported, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[MWTSchemaMWTClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_mwtCheckpointReported)
  {
    -[MWTSchemaMWTClientEvent mwtCheckpointReported](self, "mwtCheckpointReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mwtCheckpointReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mwtCheckpointReported"));

    }
  }
  if (self->_mwtMusicMetadataReported)
  {
    -[MWTSchemaMWTClientEvent mwtMusicMetadataReported](self, "mwtMusicMetadataReported");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mwtMusicMetadataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("mwtMusicMetadataReported"));

    }
  }
  if (self->_mwtVMCpuStatsReported)
  {
    -[MWTSchemaMWTClientEvent mwtVMCpuStatsReported](self, "mwtVMCpuStatsReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("mwtVMCpuStatsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mwtVMCpuStatsReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MWTSchemaMWTClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MWTSchemaMWTClientEvent)initWithJSON:(id)a3
{
  void *v4;
  MWTSchemaMWTClientEvent *v5;
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
    self = -[MWTSchemaMWTClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MWTSchemaMWTClientEvent)initWithDictionary:(id)a3
{
  id v4;
  MWTSchemaMWTClientEvent *v5;
  void *v6;
  MWTSchemaMWTEventMetadata *v7;
  void *v8;
  MWTSchemaMWTCheckpointReported *v9;
  void *v10;
  MWTSchemaMWTMusicMetadataReported *v11;
  void *v12;
  MWTSchemaMWTVMCPUStatsReported *v13;
  MWTSchemaMWTClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MWTSchemaMWTClientEvent;
  v5 = -[MWTSchemaMWTClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[MWTSchemaMWTEventMetadata initWithDictionary:]([MWTSchemaMWTEventMetadata alloc], "initWithDictionary:", v6);
      -[MWTSchemaMWTClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mwtCheckpointReported"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[MWTSchemaMWTCheckpointReported initWithDictionary:]([MWTSchemaMWTCheckpointReported alloc], "initWithDictionary:", v8);
      -[MWTSchemaMWTClientEvent setMwtCheckpointReported:](v5, "setMwtCheckpointReported:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mwtMusicMetadataReported"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[MWTSchemaMWTMusicMetadataReported initWithDictionary:]([MWTSchemaMWTMusicMetadataReported alloc], "initWithDictionary:", v10);
      -[MWTSchemaMWTClientEvent setMwtMusicMetadataReported:](v5, "setMwtMusicMetadataReported:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mwtVMCpuStatsReported"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[MWTSchemaMWTVMCPUStatsReported initWithDictionary:]([MWTSchemaMWTVMCPUStatsReported alloc], "initWithDictionary:", v12);
      -[MWTSchemaMWTClientEvent setMwtVMCpuStatsReported:](v5, "setMwtVMCpuStatsReported:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (MWTSchemaMWTEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasMwtCheckpointReported
{
  return self->_hasMwtCheckpointReported;
}

- (void)setHasMwtCheckpointReported:(BOOL)a3
{
  self->_hasMwtCheckpointReported = a3;
}

- (BOOL)hasMwtMusicMetadataReported
{
  return self->_hasMwtMusicMetadataReported;
}

- (void)setHasMwtMusicMetadataReported:(BOOL)a3
{
  self->_hasMwtMusicMetadataReported = a3;
}

- (BOOL)hasMwtVMCpuStatsReported
{
  return self->_hasMwtVMCpuStatsReported;
}

- (void)setHasMwtVMCpuStatsReported:(BOOL)a3
{
  self->_hasMwtVMCpuStatsReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mwtVMCpuStatsReported, 0);
  objc_storeStrong((id *)&self->_mwtMusicMetadataReported, 0);
  objc_storeStrong((id *)&self->_mwtCheckpointReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 45;
}

@end
