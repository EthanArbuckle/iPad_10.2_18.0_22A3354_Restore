@implementation RFSchemaRFInteractionPerformed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasActionName
{
  return self->_actionName != 0;
}

- (void)deleteActionName
{
  -[RFSchemaRFInteractionPerformed setActionName:](self, "setActionName:", 0);
}

- (void)setUserInteraction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userInteraction = a3;
}

- (BOOL)hasUserInteraction
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUserInteraction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUserInteraction
{
  -[RFSchemaRFInteractionPerformed setUserInteraction:](self, "setUserInteraction:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setVisualComponent:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_visualComponent = a3;
}

- (BOOL)hasVisualComponent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVisualComponent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteVisualComponent
{
  -[RFSchemaRFInteractionPerformed setVisualComponent:](self, "setVisualComponent:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasComponentName
{
  return self->_componentName != 0;
}

- (void)deleteComponentName
{
  -[RFSchemaRFInteractionPerformed setComponentName:](self, "setComponentName:", 0);
}

- (void)setCommandType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_commandType = a3;
}

- (BOOL)hasCommandType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCommandType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCommandType
{
  -[RFSchemaRFInteractionPerformed setCommandType:](self, "setCommandType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasComponentIndex
{
  return self->_componentIndex != 0;
}

- (void)deleteComponentIndex
{
  -[RFSchemaRFInteractionPerformed setComponentIndex:](self, "setComponentIndex:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFInteractionPerformedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RFSchemaRFInteractionPerformed actionName](self, "actionName");
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
  -[RFSchemaRFInteractionPerformed componentName](self, "componentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[RFSchemaRFInteractionPerformed componentIndex](self, "componentIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
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
  $4CD892FBF83EF65D204AED565E604B1A has;
  unsigned int v13;
  int userInteraction;
  int v15;
  int visualComponent;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int commandType;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[RFSchemaRFInteractionPerformed actionName](self, "actionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[RFSchemaRFInteractionPerformed actionName](self, "actionName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RFSchemaRFInteractionPerformed actionName](self, "actionName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    userInteraction = self->_userInteraction;
    if (userInteraction != objc_msgSend(v4, "userInteraction"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[48];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_27;
  if (v15)
  {
    visualComponent = self->_visualComponent;
    if (visualComponent != objc_msgSend(v4, "visualComponent"))
      goto LABEL_27;
  }
  -[RFSchemaRFInteractionPerformed componentName](self, "componentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[RFSchemaRFInteractionPerformed componentName](self, "componentName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[RFSchemaRFInteractionPerformed componentName](self, "componentName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  v22 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v22 != ((v4[48] >> 2) & 1))
    goto LABEL_27;
  if (v22)
  {
    commandType = self->_commandType;
    if (commandType != objc_msgSend(v4, "commandType"))
      goto LABEL_27;
  }
  -[RFSchemaRFInteractionPerformed componentIndex](self, "componentIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[RFSchemaRFInteractionPerformed componentIndex](self, "componentIndex");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

LABEL_30:
    v29 = 1;
    goto LABEL_28;
  }
  v25 = (void *)v24;
  -[RFSchemaRFInteractionPerformed componentIndex](self, "componentIndex");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentIndex");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) != 0)
    goto LABEL_30;
LABEL_27:
  v29 = 0;
LABEL_28:

  return v29;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_actionName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_userInteraction;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_visualComponent;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_componentName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_commandType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_componentIndex, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char has;
  unsigned int v13;
  const __CFString *v14;
  unsigned int v15;
  const __CFString *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionName)
  {
    -[RFSchemaRFInteractionPerformed actionName](self, "actionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionName"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = -[RFSchemaRFInteractionPerformed commandType](self, "commandType") - 1;
    if (v6 > 8)
      v7 = CFSTR("RFCOMMANDTYPE_UNKNOWN");
    else
      v7 = off_1E5633380[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("commandType"));
  }
  if (self->_componentIndex)
  {
    -[RFSchemaRFInteractionPerformed componentIndex](self, "componentIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("componentIndex"));

  }
  if (self->_componentName)
  {
    -[RFSchemaRFInteractionPerformed componentName](self, "componentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("componentName"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v13 = -[RFSchemaRFInteractionPerformed userInteraction](self, "userInteraction") - 2;
    if (v13 > 5)
      v14 = CFSTR("RFINTERACTION_UNKNOWN");
    else
      v14 = off_1E56333C8[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userInteraction"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v15 = -[RFSchemaRFInteractionPerformed visualComponent](self, "visualComponent") - 1;
    if (v15 > 0x43)
      v16 = CFSTR("RFCOMPONENT_UNKNOWN");
    else
      v16 = off_1E56333F8[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("visualComponent"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RFSchemaRFInteractionPerformed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RFSchemaRFInteractionPerformed)initWithJSON:(id)a3
{
  void *v4;
  RFSchemaRFInteractionPerformed *v5;
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
    self = -[RFSchemaRFInteractionPerformed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RFSchemaRFInteractionPerformed)initWithDictionary:(id)a3
{
  id v4;
  RFSchemaRFInteractionPerformed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RFSchemaRFInteractionPerformed *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RFSchemaRFInteractionPerformed;
  v5 = -[RFSchemaRFInteractionPerformed init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[RFSchemaRFInteractionPerformed setActionName:](v5, "setActionName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInteraction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RFSchemaRFInteractionPerformed setUserInteraction:](v5, "setUserInteraction:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visualComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RFSchemaRFInteractionPerformed setVisualComponent:](v5, "setVisualComponent:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[RFSchemaRFInteractionPerformed setComponentName:](v5, "setComponentName:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RFSchemaRFInteractionPerformed setCommandType:](v5, "setCommandType:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[RFSchemaRFInteractionPerformed setComponentIndex:](v5, "setComponentIndex:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)userInteraction
{
  return self->_userInteraction;
}

- (int)visualComponent
{
  return self->_visualComponent;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)commandType
{
  return self->_commandType;
}

- (NSString)componentIndex
{
  return self->_componentIndex;
}

- (void)setComponentIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasActionName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasComponentName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasComponentIndex:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIndex, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

@end
