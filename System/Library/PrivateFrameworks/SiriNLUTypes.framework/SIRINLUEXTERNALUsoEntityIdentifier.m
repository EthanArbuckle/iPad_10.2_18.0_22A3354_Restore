@implementation SIRINLUEXTERNALUsoEntityIdentifier

- (unsigned)nodeIndex
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_nodeIndex;
  else
    return 0;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nodeIndex = a3;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNodeIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBackingAppBundleId
{
  return self->_backingAppBundleId != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasNamespaceA
{
  return self->_namespaceA != 0;
}

- (BOOL)hasProbability
{
  return self->_probability != 0;
}

- (int)sourceComponent
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_sourceComponent;
  else
    return 0;
}

- (void)setSourceComponent:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sourceComponent = a3;
}

- (void)setHasSourceComponent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSourceComponent
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)sourceComponentAsString:(int)a3
{
  if (a3 < 7)
    return off_1E7BB0030[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSourceComponent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_SIRI_VOCAB")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_VOC_FILE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_MENTION_RESOLVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_CONTEXTUAL_SPAN_MATCHER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_PARSER_CATI")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_PARSER_SSU")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)groupIndex
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_groupIndex;
  else
    return 0;
}

- (void)setGroupIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_groupIndex = a3;
}

- (void)setHasGroupIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroupIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (unsigned)interpretationGroup
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_interpretationGroup;
  else
    return 0;
}

- (void)setInterpretationGroup:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_interpretationGroup = a3;
}

- (void)setHasInterpretationGroup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterpretationGroup
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)SIRINLUEXTERNALUsoEntityIdentifier;
  -[SIRINLUEXTERNALUsoEntityIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUsoEntityIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *backingAppBundleId;
  NSString *value;
  SIRICOMMONStringValue *namespaceA;
  void *v8;
  SIRICOMMONDoubleValue *probability;
  void *v10;
  char has;
  void *v12;
  uint64_t sourceComponent;
  __CFString *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nodeIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("node_index"));

  }
  backingAppBundleId = self->_backingAppBundleId;
  if (backingAppBundleId)
    objc_msgSend(v3, "setObject:forKey:", backingAppBundleId, CFSTR("backing_app_bundle_id"));
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKey:", value, CFSTR("value"));
  namespaceA = self->_namespaceA;
  if (namespaceA)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](namespaceA, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("namespace_a"));

  }
  probability = self->_probability;
  if (probability)
  {
    -[SIRICOMMONDoubleValue dictionaryRepresentation](probability, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("probability"));

  }
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_groupIndex);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("group_index"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_14;
  }
  sourceComponent = self->_sourceComponent;
  if (sourceComponent >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sourceComponent);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E7BB0030[sourceComponent];
  }
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("source_component"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_20;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_interpretationGroup);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("interpretation_group"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEntityIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_backingAppBundleId)
    PBDataWriterWriteStringField();
  if (self->_value)
    PBDataWriterWriteStringField();
  if (self->_namespaceA)
    PBDataWriterWriteSubmessage();
  if (self->_probability)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
LABEL_17:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 2) != 0)
LABEL_14:
    PBDataWriterWriteUint32Field();
LABEL_15:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[8] = self->_nodeIndex;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  v6 = v4;
  if (self->_backingAppBundleId)
  {
    objc_msgSend(v4, "setBackingAppBundleId:");
    v4 = v6;
  }
  if (self->_value)
  {
    objc_msgSend(v6, "setValue:");
    v4 = v6;
  }
  if (self->_namespaceA)
  {
    objc_msgSend(v6, "setNamespaceA:");
    v4 = v6;
  }
  if (self->_probability)
  {
    objc_msgSend(v6, "setProbability:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
LABEL_17:
    v4[4] = self->_groupIndex;
    *((_BYTE *)v4 + 64) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v4[12] = self->_sourceComponent;
  *((_BYTE *)v4 + 64) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    v4[5] = self->_interpretationGroup;
    *((_BYTE *)v4 + 64) |= 2u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_nodeIndex;
    *(_BYTE *)(v5 + 64) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_backingAppBundleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  v9 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v9;

  v11 = -[SIRICOMMONStringValue copyWithZone:](self->_namespaceA, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  v13 = -[SIRICOMMONDoubleValue copyWithZone:](self->_probability, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 16) = self->_groupIndex;
    *(_BYTE *)(v6 + 64) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 48) = self->_sourceComponent;
  *(_BYTE *)(v6 + 64) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 20) = self->_interpretationGroup;
    *(_BYTE *)(v6 + 64) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *backingAppBundleId;
  NSString *value;
  SIRICOMMONStringValue *namespaceA;
  SIRICOMMONDoubleValue *probability;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_nodeIndex != *((_DWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
LABEL_29:
    v9 = 0;
    goto LABEL_30;
  }
  backingAppBundleId = self->_backingAppBundleId;
  if ((unint64_t)backingAppBundleId | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](backingAppBundleId, "isEqual:"))
  {
    goto LABEL_29;
  }
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](value, "isEqual:"))
      goto LABEL_29;
  }
  namespaceA = self->_namespaceA;
  if ((unint64_t)namespaceA | *((_QWORD *)v4 + 3))
  {
    if (!-[SIRICOMMONStringValue isEqual:](namespaceA, "isEqual:"))
      goto LABEL_29;
  }
  probability = self->_probability;
  if ((unint64_t)probability | *((_QWORD *)v4 + 5))
  {
    if (!-[SIRICOMMONDoubleValue isEqual:](probability, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_sourceComponent != *((_DWORD *)v4 + 12))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_groupIndex != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_29;
  }
  v9 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_interpretationGroup != *((_DWORD *)v4 + 5))
      goto LABEL_29;
    v9 = 1;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_nodeIndex;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_backingAppBundleId, "hash");
  v5 = -[NSString hash](self->_value, "hash");
  v6 = -[SIRICOMMONStringValue hash](self->_namespaceA, "hash");
  v7 = -[SIRICOMMONDoubleValue hash](self->_probability, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_9:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v8 = 2654435761 * self->_sourceComponent;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v9 = 2654435761 * self->_groupIndex;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_7:
  v10 = 2654435761 * self->_interpretationGroup;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  SIRICOMMONStringValue *namespaceA;
  uint64_t v7;
  SIRICOMMONDoubleValue *probability;
  uint64_t v9;
  char v10;
  _DWORD *v11;

  v4 = a3;
  v5 = v4;
  if ((v4[16] & 4) != 0)
  {
    self->_nodeIndex = v4[8];
    *(_BYTE *)&self->_has |= 4u;
  }
  v11 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[SIRINLUEXTERNALUsoEntityIdentifier setBackingAppBundleId:](self, "setBackingAppBundleId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 7))
  {
    -[SIRINLUEXTERNALUsoEntityIdentifier setValue:](self, "setValue:");
    v5 = v11;
  }
  namespaceA = self->_namespaceA;
  v7 = *((_QWORD *)v5 + 3);
  if (namespaceA)
  {
    if (!v7)
      goto LABEL_13;
    -[SIRICOMMONStringValue mergeFrom:](namespaceA, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[SIRINLUEXTERNALUsoEntityIdentifier setNamespaceA:](self, "setNamespaceA:");
  }
  v5 = v11;
LABEL_13:
  probability = self->_probability;
  v9 = *((_QWORD *)v5 + 5);
  if (probability)
  {
    if (!v9)
      goto LABEL_19;
    -[SIRICOMMONDoubleValue mergeFrom:](probability, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[SIRINLUEXTERNALUsoEntityIdentifier setProbability:](self, "setProbability:");
  }
  v5 = v11;
LABEL_19:
  v10 = *((_BYTE *)v5 + 64);
  if ((v10 & 8) == 0)
  {
    if ((*((_BYTE *)v5 + 64) & 1) == 0)
      goto LABEL_21;
LABEL_25:
    self->_groupIndex = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v5 + 64) & 2) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  self->_sourceComponent = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v10 = *((_BYTE *)v5 + 64);
  if ((v10 & 1) != 0)
    goto LABEL_25;
LABEL_21:
  if ((v10 & 2) != 0)
  {
LABEL_22:
    self->_interpretationGroup = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_23:

}

- (NSString)backingAppBundleId
{
  return self->_backingAppBundleId;
}

- (void)setBackingAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_backingAppBundleId, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (SIRICOMMONStringValue)namespaceA
{
  return self->_namespaceA;
}

- (void)setNamespaceA:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceA, a3);
}

- (SIRICOMMONDoubleValue)probability
{
  return self->_probability;
}

- (void)setProbability:(id)a3
{
  objc_storeStrong((id *)&self->_probability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_namespaceA, 0);
  objc_storeStrong((id *)&self->_backingAppBundleId, 0);
}

@end
