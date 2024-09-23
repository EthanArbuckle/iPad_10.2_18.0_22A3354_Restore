@implementation SCSchemaSCClientEvent

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

  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scId");
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
  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
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
  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
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

  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scId");
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
    LODWORD(v9) = 31;
  }
  else
  {
LABEL_5:
    -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
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
      -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
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
  v19.super_class = (Class)SCSchemaSCClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SCSchemaSCClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[SCSchemaSCClientEvent undoChecked](self, "undoChecked");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SCSchemaSCClientEvent deleteUndoChecked](self, "deleteUndoChecked");
  -[SCSchemaSCClientEvent correctionChecked](self, "correctionChecked");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SCSchemaSCClientEvent deleteCorrectionChecked](self, "deleteCorrectionChecked");
  -[SCSchemaSCClientEvent undoSet](self, "undoSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SCSchemaSCClientEvent deleteUndoSet](self, "deleteUndoSet");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SCSchemaSCClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AD68[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 2)
    return 0;
  else
    return off_1E562AD80[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SCSchemaSCClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 2)
    return CFSTR("com.apple.aiml.siri.sc.SCClientEvent");
  else
    return off_1E562FBE8[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SCSchemaSCClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setUndoChecked:(id)a3
{
  SCSchemaSCUndoChecked *v4;
  SCSchemaSCCorrectionChecked *correctionChecked;
  SCSchemaSCUndoSet *undoSet;
  SCSchemaSCUndoChecked *undoChecked;

  v4 = (SCSchemaSCUndoChecked *)a3;
  correctionChecked = self->_correctionChecked;
  self->_correctionChecked = 0;

  undoSet = self->_undoSet;
  self->_undoSet = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  undoChecked = self->_undoChecked;
  self->_undoChecked = v4;

}

- (SCSchemaSCUndoChecked)undoChecked
{
  if (self->_whichEvent_Type == 2)
    return self->_undoChecked;
  else
    return (SCSchemaSCUndoChecked *)0;
}

- (void)deleteUndoChecked
{
  SCSchemaSCUndoChecked *undoChecked;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    undoChecked = self->_undoChecked;
    self->_undoChecked = 0;

  }
}

- (void)setCorrectionChecked:(id)a3
{
  SCSchemaSCCorrectionChecked *v4;
  SCSchemaSCUndoChecked *undoChecked;
  SCSchemaSCUndoSet *undoSet;
  unint64_t v7;
  SCSchemaSCCorrectionChecked *correctionChecked;

  v4 = (SCSchemaSCCorrectionChecked *)a3;
  undoChecked = self->_undoChecked;
  self->_undoChecked = 0;

  undoSet = self->_undoSet;
  self->_undoSet = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  correctionChecked = self->_correctionChecked;
  self->_correctionChecked = v4;

}

- (SCSchemaSCCorrectionChecked)correctionChecked
{
  if (self->_whichEvent_Type == 3)
    return self->_correctionChecked;
  else
    return (SCSchemaSCCorrectionChecked *)0;
}

- (void)deleteCorrectionChecked
{
  SCSchemaSCCorrectionChecked *correctionChecked;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    correctionChecked = self->_correctionChecked;
    self->_correctionChecked = 0;

  }
}

- (void)setUndoSet:(id)a3
{
  SCSchemaSCUndoSet *v4;
  SCSchemaSCUndoChecked *undoChecked;
  SCSchemaSCCorrectionChecked *correctionChecked;
  SCSchemaSCUndoSet *undoSet;

  v4 = (SCSchemaSCUndoSet *)a3;
  undoChecked = self->_undoChecked;
  self->_undoChecked = 0;

  correctionChecked = self->_correctionChecked;
  self->_correctionChecked = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  undoSet = self->_undoSet;
  self->_undoSet = v4;

}

- (SCSchemaSCUndoSet)undoSet
{
  if (self->_whichEvent_Type == 4)
    return self->_undoSet;
  else
    return (SCSchemaSCUndoSet *)0;
}

- (void)deleteUndoSet
{
  SCSchemaSCUndoSet *undoSet;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    undoSet = self->_undoSet;
    self->_undoSet = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SCSchemaSCClientEventReadFrom(self, (uint64_t)a3);
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
  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SCSchemaSCClientEvent undoChecked](self, "undoChecked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SCSchemaSCClientEvent undoChecked](self, "undoChecked");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SCSchemaSCClientEvent correctionChecked](self, "correctionChecked");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SCSchemaSCClientEvent correctionChecked](self, "correctionChecked");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SCSchemaSCClientEvent undoSet](self, "undoSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SCSchemaSCClientEvent undoSet](self, "undoSet");
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
  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
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
  -[SCSchemaSCClientEvent undoChecked](self, "undoChecked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoChecked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SCSchemaSCClientEvent undoChecked](self, "undoChecked");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SCSchemaSCClientEvent undoChecked](self, "undoChecked");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoChecked");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[SCSchemaSCClientEvent correctionChecked](self, "correctionChecked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctionChecked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SCSchemaSCClientEvent correctionChecked](self, "correctionChecked");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SCSchemaSCClientEvent correctionChecked](self, "correctionChecked");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctionChecked");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[SCSchemaSCClientEvent undoSet](self, "undoSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SCSchemaSCClientEvent undoSet](self, "undoSet");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[SCSchemaSCClientEvent undoSet](self, "undoSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoSet");
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

  v3 = -[SCSchemaSCClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[SCSchemaSCUndoChecked hash](self->_undoChecked, "hash") ^ v3;
  v5 = -[SCSchemaSCCorrectionChecked hash](self->_correctionChecked, "hash");
  return v4 ^ v5 ^ -[SCSchemaSCUndoSet hash](self->_undoSet, "hash");
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
  if (self->_correctionChecked)
  {
    -[SCSchemaSCClientEvent correctionChecked](self, "correctionChecked");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("correctionChecked"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("correctionChecked"));

    }
  }
  if (self->_eventMetadata)
  {
    -[SCSchemaSCClientEvent eventMetadata](self, "eventMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventMetadata"));

    }
  }
  if (self->_undoChecked)
  {
    -[SCSchemaSCClientEvent undoChecked](self, "undoChecked");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("undoChecked"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("undoChecked"));

    }
  }
  if (self->_undoSet)
  {
    -[SCSchemaSCClientEvent undoSet](self, "undoSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("undoSet"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("undoSet"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SCSchemaSCClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SCSchemaSCClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SCSchemaSCClientEvent *v5;
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
    self = -[SCSchemaSCClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SCSchemaSCClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SCSchemaSCClientEvent *v5;
  void *v6;
  SCSchemaSCClientEventMetadata *v7;
  void *v8;
  SCSchemaSCUndoChecked *v9;
  void *v10;
  SCSchemaSCCorrectionChecked *v11;
  void *v12;
  SCSchemaSCUndoSet *v13;
  SCSchemaSCClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SCSchemaSCClientEvent;
  v5 = -[SCSchemaSCClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SCSchemaSCClientEventMetadata initWithDictionary:]([SCSchemaSCClientEventMetadata alloc], "initWithDictionary:", v6);
      -[SCSchemaSCClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("undoChecked"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SCSchemaSCUndoChecked initWithDictionary:]([SCSchemaSCUndoChecked alloc], "initWithDictionary:", v8);
      -[SCSchemaSCClientEvent setUndoChecked:](v5, "setUndoChecked:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctionChecked"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SCSchemaSCCorrectionChecked initWithDictionary:]([SCSchemaSCCorrectionChecked alloc], "initWithDictionary:", v10);
      -[SCSchemaSCClientEvent setCorrectionChecked:](v5, "setCorrectionChecked:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("undoSet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SCSchemaSCUndoSet initWithDictionary:]([SCSchemaSCUndoSet alloc], "initWithDictionary:", v12);
      -[SCSchemaSCClientEvent setUndoSet:](v5, "setUndoSet:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SCSchemaSCClientEventMetadata)eventMetadata
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

- (BOOL)hasUndoChecked
{
  return self->_hasUndoChecked;
}

- (void)setHasUndoChecked:(BOOL)a3
{
  self->_hasUndoChecked = a3;
}

- (BOOL)hasCorrectionChecked
{
  return self->_hasCorrectionChecked;
}

- (void)setHasCorrectionChecked:(BOOL)a3
{
  self->_hasCorrectionChecked = a3;
}

- (BOOL)hasUndoSet
{
  return self->_hasUndoSet;
}

- (void)setHasUndoSet:(BOOL)a3
{
  self->_hasUndoSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSet, 0);
  objc_storeStrong((id *)&self->_correctionChecked, 0);
  objc_storeStrong((id *)&self->_undoChecked, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 61;
}

@end
