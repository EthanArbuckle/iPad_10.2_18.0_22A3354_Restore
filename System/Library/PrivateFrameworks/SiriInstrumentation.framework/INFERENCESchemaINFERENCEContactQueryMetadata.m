@implementation INFERENCESchemaINFERENCEContactQueryMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setHasName:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 1u;
  self->_hasName = a3;
}

- (BOOL)hasHasName
{
  return *(&self->_isEmergencyQuery + 1);
}

- (void)setHasHasName:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xFE | a3;
}

- (void)deleteHasName
{
  -[INFERENCESchemaINFERENCEContactQueryMetadata setHasName:](self, "setHasName:", 0);
  *(&self->_isEmergencyQuery + 1) &= ~1u;
}

- (void)setHasRelationship:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 2u;
  self->_hasRelationship = a3;
}

- (BOOL)hasHasRelationship
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 1) & 1;
}

- (void)setHasHasRelationship:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xFD | v3;
}

- (void)deleteHasRelationship
{
  -[INFERENCESchemaINFERENCEContactQueryMetadata setHasRelationship:](self, "setHasRelationship:", 0);
  *(&self->_isEmergencyQuery + 1) &= ~2u;
}

- (void)setHasHandleLabel:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 4u;
  self->_hasHandleLabel = a3;
}

- (BOOL)hasHasHandleLabel
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 2) & 1;
}

- (void)setHasHasHandleLabel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xFB | v3;
}

- (void)deleteHasHandleLabel
{
  -[INFERENCESchemaINFERENCEContactQueryMetadata setHasHandleLabel:](self, "setHasHandleLabel:", 0);
  *(&self->_isEmergencyQuery + 1) &= ~4u;
}

- (void)setHasHandleValue:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 8u;
  self->_hasHandleValue = a3;
}

- (BOOL)hasHasHandleValue
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 3) & 1;
}

- (void)setHasHasHandleValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xF7 | v3;
}

- (void)deleteHasHandleValue
{
  -[INFERENCESchemaINFERENCEContactQueryMetadata setHasHandleValue:](self, "setHasHandleValue:", 0);
  *(&self->_isEmergencyQuery + 1) &= ~8u;
}

- (void)setHasMeReference:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 0x10u;
  self->_hasMeReference = a3;
}

- (BOOL)hasHasMeReference
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 4) & 1;
}

- (void)setHasHasMeReference:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xEF | v3;
}

- (void)deleteHasMeReference
{
  -[INFERENCESchemaINFERENCEContactQueryMetadata setHasMeReference:](self, "setHasMeReference:", 0);
  *(&self->_isEmergencyQuery + 1) &= ~0x10u;
}

- (void)setHasContactId:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 0x20u;
  self->_hasContactId = a3;
}

- (BOOL)hasHasContactId
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 5) & 1;
}

- (void)setHasHasContactId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xDF | v3;
}

- (void)deleteHasContactId
{
  -[INFERENCESchemaINFERENCEContactQueryMetadata setHasContactId:](self, "setHasContactId:", 0);
  *(&self->_isEmergencyQuery + 1) &= ~0x20u;
}

- (void)setIsEmergencyQuery:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 0x40u;
  self->_isEmergencyQuery = a3;
}

- (BOOL)hasIsEmergencyQuery
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 6) & 1;
}

- (void)setHasIsEmergencyQuery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xBF | v3;
}

- (void)deleteIsEmergencyQuery
{
  -[INFERENCESchemaINFERENCEContactQueryMetadata setIsEmergencyQuery:](self, "setIsEmergencyQuery:", 0);
  *(&self->_isEmergencyQuery + 1) &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactQueryMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = *(&self->_isEmergencyQuery + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isEmergencyQuery + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isEmergencyQuery + 1) & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v4 & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int hasName;
  int v8;
  int hasRelationship;
  int v10;
  int hasHandleLabel;
  int v12;
  int hasHandleValue;
  int v14;
  int hasMeReference;
  int v16;
  int hasContactId;
  int v18;
  int isEmergencyQuery;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
  v6 = v4[15];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_30;
  if ((v5 & 1) != 0)
  {
    hasName = self->_hasName;
    if (hasName != objc_msgSend(v4, "hasName"))
      goto LABEL_30;
    v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    v6 = v4[15];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_30;
  if (v8)
  {
    hasRelationship = self->_hasRelationship;
    if (hasRelationship != objc_msgSend(v4, "hasRelationship"))
      goto LABEL_30;
    v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    v6 = v4[15];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_30;
  if (v10)
  {
    hasHandleLabel = self->_hasHandleLabel;
    if (hasHandleLabel != objc_msgSend(v4, "hasHandleLabel"))
      goto LABEL_30;
    v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    v6 = v4[15];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_30;
  if (v12)
  {
    hasHandleValue = self->_hasHandleValue;
    if (hasHandleValue != objc_msgSend(v4, "hasHandleValue"))
      goto LABEL_30;
    v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    v6 = v4[15];
  }
  v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_30;
  if (v14)
  {
    hasMeReference = self->_hasMeReference;
    if (hasMeReference != objc_msgSend(v4, "hasMeReference"))
      goto LABEL_30;
    v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    v6 = v4[15];
  }
  v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_30;
  if (v16)
  {
    hasContactId = self->_hasContactId;
    if (hasContactId == objc_msgSend(v4, "hasContactId"))
    {
      v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
      v6 = v4[15];
      goto LABEL_26;
    }
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  v18 = (v5 >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_30;
  if (v18)
  {
    isEmergencyQuery = self->_isEmergencyQuery;
    if (isEmergencyQuery != objc_msgSend(v4, "isEmergencyQuery"))
      goto LABEL_30;
  }
  v20 = 1;
LABEL_31:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (*(&self->_isEmergencyQuery + 1))
  {
    v2 = 2654435761 * self->_hasName;
    if ((*(&self->_isEmergencyQuery + 1) & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_hasRelationship;
      if ((*(&self->_isEmergencyQuery + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(&self->_isEmergencyQuery + 1) & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_hasHandleLabel;
    if ((*(&self->_isEmergencyQuery + 1) & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_hasHandleValue;
    if ((*(&self->_isEmergencyQuery + 1) & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_hasMeReference;
    if ((*(&self->_isEmergencyQuery + 1) & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(&self->_isEmergencyQuery + 1) & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_hasContactId;
  if ((*(&self->_isEmergencyQuery + 1) & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_isEmergencyQuery;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasContactId](self, "hasContactId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hasContactId"));

    v4 = *(&self->_isEmergencyQuery + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isEmergencyQuery + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasHandleLabel](self, "hasHandleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hasHandleLabel"));

  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasHandleValue](self, "hasHandleValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasHandleValue"));

  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasMeReference](self, "hasMeReference"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasMeReference"));

  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasRelationship](self, "hasRelationship"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasRelationship"));

    if ((*(&self->_isEmergencyQuery + 1) & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasName](self, "hasName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasName"));

  v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v4 & 0x40) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata isEmergencyQuery](self, "isEmergencyQuery"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isEmergencyQuery"));

  }
LABEL_9:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContactQueryMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEContactQueryMetadata)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContactQueryMetadata *v5;
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
    self = -[INFERENCESchemaINFERENCEContactQueryMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContactQueryMetadata)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContactQueryMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INFERENCESchemaINFERENCEContactQueryMetadata *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEContactQueryMetadata;
  v5 = -[INFERENCESchemaINFERENCEContactQueryMetadata init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasName:](v5, "setHasName:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasRelationship"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasRelationship:](v5, "setHasRelationship:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasHandleLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasHandleLabel:](v5, "setHasHandleLabel:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasHandleValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasHandleValue:](v5, "setHasHandleValue:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasMeReference"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasMeReference:](v5, "setHasMeReference:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasContactId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasContactId:](v5, "setHasContactId:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmergencyQuery"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactQueryMetadata setIsEmergencyQuery:](v5, "setIsEmergencyQuery:", objc_msgSend(v12, "BOOLValue"));
    v13 = v5;

  }
  return v5;
}

- (BOOL)hasName
{
  return self->_hasName;
}

- (BOOL)hasRelationship
{
  return self->_hasRelationship;
}

- (BOOL)hasHandleLabel
{
  return self->_hasHandleLabel;
}

- (BOOL)hasHandleValue
{
  return self->_hasHandleValue;
}

- (BOOL)hasMeReference
{
  return self->_hasMeReference;
}

- (BOOL)hasContactId
{
  return self->_hasContactId;
}

- (BOOL)isEmergencyQuery
{
  return self->_isEmergencyQuery;
}

@end
