@implementation RFSchemaRFGradingDialogLineTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RFSchemaRFGradingDialogLineTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[RFSchemaRFGradingDialogLineTier1 deleteSpokenDialog](self, "deleteSpokenDialog");
    -[RFSchemaRFGradingDialogLineTier1 deleteDisplayedDialog](self, "deleteDisplayedDialog");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[RFSchemaRFGradingDialogLineTier1 deleteSpokenDialog](self, "deleteSpokenDialog");
    -[RFSchemaRFGradingDialogLineTier1 deleteDisplayedDialog](self, "deleteDisplayedDialog");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[RFSchemaRFGradingDialogLineTier1 deleteSpokenDialog](self, "deleteSpokenDialog");
    -[RFSchemaRFGradingDialogLineTier1 deleteDisplayedDialog](self, "deleteDisplayedDialog");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[RFSchemaRFGradingDialogLineTier1 deleteSpokenDialog](self, "deleteSpokenDialog");
    -[RFSchemaRFGradingDialogLineTier1 deleteDisplayedDialog](self, "deleteDisplayedDialog");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[RFSchemaRFGradingDialogLineTier1 deleteSpokenDialog](self, "deleteSpokenDialog");
    -[RFSchemaRFGradingDialogLineTier1 deleteDisplayedDialog](self, "deleteDisplayedDialog");
  }

  return v5;
}

- (BOOL)hasDialogId
{
  return self->_dialogId != 0;
}

- (void)deleteDialogId
{
  -[RFSchemaRFGradingDialogLineTier1 setDialogId:](self, "setDialogId:", 0);
}

- (void)setIsApprovedForGrading:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isApprovedForGrading = a3;
}

- (BOOL)hasIsApprovedForGrading
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsApprovedForGrading:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsApprovedForGrading
{
  -[RFSchemaRFGradingDialogLineTier1 setIsApprovedForGrading:](self, "setIsApprovedForGrading:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSpokenDialog
{
  return self->_spokenDialog != 0;
}

- (void)deleteSpokenDialog
{
  -[RFSchemaRFGradingDialogLineTier1 setSpokenDialog:](self, "setSpokenDialog:", 0);
}

- (BOOL)hasDisplayedDialog
{
  return self->_displayedDialog != 0;
}

- (void)deleteDisplayedDialog
{
  -[RFSchemaRFGradingDialogLineTier1 setDisplayedDialog:](self, "setDisplayedDialog:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFGradingDialogLineTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RFSchemaRFGradingDialogLineTier1 dialogId](self, "dialogId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[RFSchemaRFGradingDialogLineTier1 spokenDialog](self, "spokenDialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[RFSchemaRFGradingDialogLineTier1 displayedDialog](self, "displayedDialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int isApprovedForGrading;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[RFSchemaRFGradingDialogLineTier1 dialogId](self, "dialogId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[RFSchemaRFGradingDialogLineTier1 dialogId](self, "dialogId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RFSchemaRFGradingDialogLineTier1 dialogId](self, "dialogId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isApprovedForGrading = self->_isApprovedForGrading;
    if (isApprovedForGrading != objc_msgSend(v4, "isApprovedForGrading"))
      goto LABEL_20;
  }
  -[RFSchemaRFGradingDialogLineTier1 spokenDialog](self, "spokenDialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spokenDialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[RFSchemaRFGradingDialogLineTier1 spokenDialog](self, "spokenDialog");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RFSchemaRFGradingDialogLineTier1 spokenDialog](self, "spokenDialog");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spokenDialog");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[RFSchemaRFGradingDialogLineTier1 displayedDialog](self, "displayedDialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedDialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[RFSchemaRFGradingDialogLineTier1 displayedDialog](self, "displayedDialog");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[RFSchemaRFGradingDialogLineTier1 displayedDialog](self, "displayedDialog");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedDialog");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_dialogId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isApprovedForGrading;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_spokenDialog, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_displayedDialog, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dialogId)
  {
    -[RFSchemaRFGradingDialogLineTier1 dialogId](self, "dialogId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dialogId"));

  }
  if (self->_displayedDialog)
  {
    -[RFSchemaRFGradingDialogLineTier1 displayedDialog](self, "displayedDialog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("displayedDialog"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RFSchemaRFGradingDialogLineTier1 isApprovedForGrading](self, "isApprovedForGrading"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isApprovedForGrading"));

  }
  if (self->_spokenDialog)
  {
    -[RFSchemaRFGradingDialogLineTier1 spokenDialog](self, "spokenDialog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("spokenDialog"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RFSchemaRFGradingDialogLineTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RFSchemaRFGradingDialogLineTier1)initWithJSON:(id)a3
{
  void *v4;
  RFSchemaRFGradingDialogLineTier1 *v5;
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
    self = -[RFSchemaRFGradingDialogLineTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RFSchemaRFGradingDialogLineTier1)initWithDictionary:(id)a3
{
  id v4;
  RFSchemaRFGradingDialogLineTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RFSchemaRFGradingDialogLineTier1 *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RFSchemaRFGradingDialogLineTier1;
  v5 = -[RFSchemaRFGradingDialogLineTier1 init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[RFSchemaRFGradingDialogLineTier1 setDialogId:](v5, "setDialogId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isApprovedForGrading"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RFSchemaRFGradingDialogLineTier1 setIsApprovedForGrading:](v5, "setIsApprovedForGrading:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spokenDialog"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[RFSchemaRFGradingDialogLineTier1 setSpokenDialog:](v5, "setSpokenDialog:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayedDialog"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[RFSchemaRFGradingDialogLineTier1 setDisplayedDialog:](v5, "setDisplayedDialog:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setDialogId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isApprovedForGrading
{
  return self->_isApprovedForGrading;
}

- (NSString)spokenDialog
{
  return self->_spokenDialog;
}

- (void)setSpokenDialog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayedDialog
{
  return self->_displayedDialog;
}

- (void)setDisplayedDialog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasDialogId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSpokenDialog:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasDisplayedDialog:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedDialog, 0);
  objc_storeStrong((id *)&self->_spokenDialog, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
}

@end
