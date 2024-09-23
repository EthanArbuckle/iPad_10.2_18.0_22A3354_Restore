@implementation DODMLASRSchemaDODMLASRAlignmentInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasReferenceName
{
  return self->_referenceName != 0;
}

- (void)deleteReferenceName
{
  -[DODMLASRSchemaDODMLASRAlignmentInfo setReferenceName:](self, "setReferenceName:", 0);
}

- (void)setNumDeletions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numDeletions = a3;
}

- (BOOL)hasNumDeletions
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumDeletions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumDeletions
{
  -[DODMLASRSchemaDODMLASRAlignmentInfo setNumDeletions:](self, "setNumDeletions:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumInsertions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numInsertions = a3;
}

- (BOOL)hasNumInsertions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumInsertions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumInsertions
{
  -[DODMLASRSchemaDODMLASRAlignmentInfo setNumInsertions:](self, "setNumInsertions:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumSubstitutions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numSubstitutions = a3;
}

- (BOOL)hasNumSubstitutions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumSubstitutions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumSubstitutions
{
  -[DODMLASRSchemaDODMLASRAlignmentInfo setNumSubstitutions:](self, "setNumSubstitutions:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setEditDistance:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_editDistance = a3;
}

- (BOOL)hasEditDistance
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasEditDistance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteEditDistance
{
  -[DODMLASRSchemaDODMLASRAlignmentInfo setEditDistance:](self, "setEditDistance:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setReferenceSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_referenceSize = a3;
}

- (BOOL)hasReferenceSize
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasReferenceSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteReferenceSize
{
  -[DODMLASRSchemaDODMLASRAlignmentInfo setReferenceSize:](self, "setReferenceSize:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRAlignmentInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[DODMLASRSchemaDODMLASRAlignmentInfo referenceName](self, "referenceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteUint32Field();
      v6 = v7;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    v6 = v7;
  }
LABEL_10:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $20352F484E6D8F53263CFAD7FB29F6DD has;
  unsigned int v14;
  unsigned int numDeletions;
  int v16;
  unsigned int numInsertions;
  int v18;
  unsigned int numSubstitutions;
  int v20;
  unsigned int editDistance;
  int v22;
  unsigned int referenceSize;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[DODMLASRSchemaDODMLASRAlignmentInfo referenceName](self, "referenceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_28;
  }
  -[DODMLASRSchemaDODMLASRAlignmentInfo referenceName](self, "referenceName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DODMLASRSchemaDODMLASRAlignmentInfo referenceName](self, "referenceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referenceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_28:
    v24 = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numDeletions = self->_numDeletions;
    if (numDeletions != objc_msgSend(v4, "numDeletions"))
      goto LABEL_28;
    has = self->_has;
    v14 = v4[36];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_28;
  if (v16)
  {
    numInsertions = self->_numInsertions;
    if (numInsertions != objc_msgSend(v4, "numInsertions"))
      goto LABEL_28;
    has = self->_has;
    v14 = v4[36];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_28;
  if (v18)
  {
    numSubstitutions = self->_numSubstitutions;
    if (numSubstitutions != objc_msgSend(v4, "numSubstitutions"))
      goto LABEL_28;
    has = self->_has;
    v14 = v4[36];
  }
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_28;
  if (v20)
  {
    editDistance = self->_editDistance;
    if (editDistance == objc_msgSend(v4, "editDistance"))
    {
      has = self->_has;
      v14 = v4[36];
      goto LABEL_24;
    }
    goto LABEL_28;
  }
LABEL_24:
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_28;
  if (v22)
  {
    referenceSize = self->_referenceSize;
    if (referenceSize != objc_msgSend(v4, "referenceSize"))
      goto LABEL_28;
  }
  v24 = 1;
LABEL_29:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_referenceName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_numDeletions;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_numInsertions;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_numSubstitutions;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_editDistance;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761 * self->_referenceSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo editDistance](self, "editDistance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("editDistance"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo numDeletions](self, "numDeletions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numDeletions"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo numInsertions](self, "numInsertions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numInsertions"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo numSubstitutions](self, "numSubstitutions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numSubstitutions"));

  }
LABEL_6:
  if (self->_referenceName)
  {
    -[DODMLASRSchemaDODMLASRAlignmentInfo referenceName](self, "referenceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("referenceName"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo referenceSize](self, "referenceSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("referenceSize"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRAlignmentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRAlignmentInfo)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRAlignmentInfo *v5;
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
    self = -[DODMLASRSchemaDODMLASRAlignmentInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRAlignmentInfo)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRAlignmentInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DODMLASRSchemaDODMLASRAlignmentInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASRAlignmentInfo;
  v5 = -[DODMLASRSchemaDODMLASRAlignmentInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DODMLASRSchemaDODMLASRAlignmentInfo setReferenceName:](v5, "setReferenceName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDeletions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRAlignmentInfo setNumDeletions:](v5, "setNumDeletions:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numInsertions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRAlignmentInfo setNumInsertions:](v5, "setNumInsertions:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSubstitutions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRAlignmentInfo setNumSubstitutions:](v5, "setNumSubstitutions:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("editDistance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRAlignmentInfo setEditDistance:](v5, "setEditDistance:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceSize"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRAlignmentInfo setReferenceSize:](v5, "setReferenceSize:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v5;

  }
  return v5;
}

- (NSString)referenceName
{
  return self->_referenceName;
}

- (void)setReferenceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)numDeletions
{
  return self->_numDeletions;
}

- (unsigned)numInsertions
{
  return self->_numInsertions;
}

- (unsigned)numSubstitutions
{
  return self->_numSubstitutions;
}

- (unsigned)editDistance
{
  return self->_editDistance;
}

- (unsigned)referenceSize
{
  return self->_referenceSize;
}

- (void)setHasReferenceName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceName, 0);
}

@end
