@implementation USOSchemaUSOEntityIdentifier

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nodeIndex = a3;
}

- (BOOL)hasNodeIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNodeIndex
{
  -[USOSchemaUSOEntityIdentifier setNodeIndex:](self, "setNodeIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasIdentifierNamespace
{
  return self->_identifierNamespace != 0;
}

- (void)deleteIdentifierNamespace
{
  -[USOSchemaUSOEntityIdentifier setIdentifierNamespace:](self, "setIdentifierNamespace:", 0);
}

- (void)setProbability:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_probability = a3;
}

- (BOOL)hasProbability
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasProbability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteProbability
{
  -[USOSchemaUSOEntityIdentifier setProbability:](self, "setProbability:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSourceNluComponent:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sourceNluComponent = a3;
}

- (BOOL)hasSourceNluComponent
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSourceNluComponent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSourceNluComponent
{
  -[USOSchemaUSOEntityIdentifier setSourceNluComponent:](self, "setSourceNluComponent:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setBackingAppBundleType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_backingAppBundleType = a3;
}

- (BOOL)hasBackingAppBundleType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasBackingAppBundleType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteBackingAppBundleType
{
  -[USOSchemaUSOEntityIdentifier setBackingAppBundleType:](self, "setBackingAppBundleType:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setGroupIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_groupIndex = a3;
}

- (BOOL)hasGroupIndex
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasGroupIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteGroupIndex
{
  -[USOSchemaUSOEntityIdentifier setGroupIndex:](self, "setGroupIndex:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setInterpretationGroup:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_interpretationGroup = a3;
}

- (BOOL)hasInterpretationGroup
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasInterpretationGroup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteInterpretationGroup
{
  -[USOSchemaUSOEntityIdentifier setInterpretationGroup:](self, "setInterpretationGroup:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntityIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[USOSchemaUSOEntityIdentifier identifierNamespace](self, "identifierNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
LABEL_15:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 0x20) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int nodeIndex;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $E49C7143624BDCD2738345100E1F9314 has;
  int v15;
  unsigned int v16;
  double probability;
  double v18;
  int v19;
  int sourceNluComponent;
  int v21;
  int backingAppBundleType;
  int v23;
  unsigned int groupIndex;
  int v25;
  unsigned int interpretationGroup;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    nodeIndex = self->_nodeIndex;
    if (nodeIndex != objc_msgSend(v4, "nodeIndex"))
      goto LABEL_31;
  }
  -[USOSchemaUSOEntityIdentifier identifierNamespace](self, "identifierNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifierNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_31;
  }
  -[USOSchemaUSOEntityIdentifier identifierNamespace](self, "identifierNamespace");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[USOSchemaUSOEntityIdentifier identifierNamespace](self, "identifierNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifierNamespace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_31;
  }
  else
  {

  }
  has = self->_has;
  v15 = (*(unsigned int *)&has >> 1) & 1;
  v16 = v4[48];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_31:
    v27 = 0;
    goto LABEL_32;
  }
  if (v15)
  {
    probability = self->_probability;
    objc_msgSend(v4, "probability");
    if (probability != v18)
      goto LABEL_31;
    has = self->_has;
    v16 = v4[48];
  }
  v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1))
    goto LABEL_31;
  if (v19)
  {
    sourceNluComponent = self->_sourceNluComponent;
    if (sourceNluComponent != objc_msgSend(v4, "sourceNluComponent"))
      goto LABEL_31;
    has = self->_has;
    v16 = v4[48];
  }
  v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v16 >> 3) & 1))
    goto LABEL_31;
  if (v21)
  {
    backingAppBundleType = self->_backingAppBundleType;
    if (backingAppBundleType != objc_msgSend(v4, "backingAppBundleType"))
      goto LABEL_31;
    has = self->_has;
    v16 = v4[48];
  }
  v23 = (*(unsigned int *)&has >> 4) & 1;
  if (v23 != ((v16 >> 4) & 1))
    goto LABEL_31;
  if (v23)
  {
    groupIndex = self->_groupIndex;
    if (groupIndex == objc_msgSend(v4, "groupIndex"))
    {
      has = self->_has;
      v16 = v4[48];
      goto LABEL_27;
    }
    goto LABEL_31;
  }
LABEL_27:
  v25 = (*(unsigned int *)&has >> 5) & 1;
  if (v25 != ((v16 >> 5) & 1))
    goto LABEL_31;
  if (v25)
  {
    interpretationGroup = self->_interpretationGroup;
    if (interpretationGroup != objc_msgSend(v4, "interpretationGroup"))
      goto LABEL_31;
  }
  v27 = 1;
LABEL_32:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double probability;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_nodeIndex;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_identifierNamespace, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    probability = self->_probability;
    v8 = -probability;
    if (probability >= 0.0)
      v8 = self->_probability;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
  {
    v11 = 2654435761 * self->_sourceNluComponent;
    if ((has & 8) != 0)
    {
LABEL_14:
      v12 = 2654435761 * self->_backingAppBundleType;
      if ((has & 0x10) != 0)
        goto LABEL_15;
LABEL_19:
      v13 = 0;
      if ((has & 0x20) != 0)
        goto LABEL_16;
LABEL_20:
      v14 = 0;
      return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14;
    }
  }
  else
  {
    v11 = 0;
    if ((has & 8) != 0)
      goto LABEL_14;
  }
  v12 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_19;
LABEL_15:
  v13 = 2654435761 * self->_groupIndex;
  if ((has & 0x20) == 0)
    goto LABEL_20;
LABEL_16:
  v14 = 2654435761 * self->_interpretationGroup;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = -[USOSchemaUSOEntityIdentifier backingAppBundleType](self, "backingAppBundleType") - 1;
    if (v5 > 3)
      v6 = CFSTR("USOBACKINGAPPBUNDLETYPE_UNKNOWN");
    else
      v6 = off_1E5638858[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("backingAppBundleType"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifier groupIndex](self, "groupIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("groupIndex"));

  }
  if (self->_identifierNamespace)
  {
    -[USOSchemaUSOEntityIdentifier identifierNamespace](self, "identifierNamespace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("identifierNamespace"));

  }
  v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifier interpretationGroup](self, "interpretationGroup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("interpretationGroup"));

    v10 = (char)self->_has;
    if ((v10 & 1) == 0)
    {
LABEL_12:
      if ((v10 & 2) == 0)
        goto LABEL_13;
LABEL_17:
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[USOSchemaUSOEntityIdentifier probability](self, "probability");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("probability"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_22;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifier nodeIndex](self, "nodeIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("nodeIndex"));

  v10 = (char)self->_has;
  if ((v10 & 2) != 0)
    goto LABEL_17;
LABEL_13:
  if ((v10 & 4) == 0)
    goto LABEL_22;
LABEL_18:
  v15 = -[USOSchemaUSOEntityIdentifier sourceNluComponent](self, "sourceNluComponent") - 1;
  if (v15 > 6)
    v16 = CFSTR("USOENTITYIDENTIFIERNLUCOMPONENT_UNKNOWN");
  else
    v16 = off_1E5638878[v15];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("sourceNluComponent"));
LABEL_22:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOEntityIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOEntityIdentifier)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOEntityIdentifier *v5;
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
    self = -[USOSchemaUSOEntityIdentifier initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOEntityIdentifier)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOEntityIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  USOSchemaUSOEntityIdentifier *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)USOSchemaUSOEntityIdentifier;
  v5 = -[USOSchemaUSOEntityIdentifier init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nodeIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntityIdentifier setNodeIndex:](v5, "setNodeIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifierNamespace"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[USOSchemaUSOEntityIdentifier setIdentifierNamespace:](v5, "setIdentifierNamespace:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("probability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[USOSchemaUSOEntityIdentifier setProbability:](v5, "setProbability:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceNluComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntityIdentifier setSourceNluComponent:](v5, "setSourceNluComponent:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backingAppBundleType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntityIdentifier setBackingAppBundleType:](v5, "setBackingAppBundleType:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntityIdentifier setGroupIndex:](v5, "setGroupIndex:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interpretationGroup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntityIdentifier setInterpretationGroup:](v5, "setInterpretationGroup:", objc_msgSend(v13, "unsignedIntValue"));
    v14 = v5;

  }
  return v5;
}

- (unsigned)nodeIndex
{
  return self->_nodeIndex;
}

- (NSString)identifierNamespace
{
  return self->_identifierNamespace;
}

- (void)setIdentifierNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)probability
{
  return self->_probability;
}

- (int)sourceNluComponent
{
  return self->_sourceNluComponent;
}

- (int)backingAppBundleType
{
  return self->_backingAppBundleType;
}

- (unsigned)groupIndex
{
  return self->_groupIndex;
}

- (unsigned)interpretationGroup
{
  return self->_interpretationGroup;
}

- (void)setHasIdentifierNamespace:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierNamespace, 0);
}

@end
