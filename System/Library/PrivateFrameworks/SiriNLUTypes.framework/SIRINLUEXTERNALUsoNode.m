@implementation SIRINLUEXTERNALUsoNode

- (unsigned)usoElementId
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_usoElementId;
  else
    return 0;
}

- (void)setUsoElementId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_usoElementId = a3;
}

- (void)setHasUsoElementId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUsoElementId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStringPayload
{
  return self->_stringPayload != 0;
}

- (BOOL)hasIntegerPayload
{
  return self->_integerPayload != 0;
}

- (BOOL)hasUsoVerbElementId
{
  return self->_usoVerbElementId != 0;
}

- (BOOL)hasEntityLabel
{
  return self->_entityLabel != 0;
}

- (BOOL)hasVerbLabel
{
  return self->_verbLabel != 0;
}

- (void)clearNormalizedStringPayloads
{
  -[NSMutableArray removeAllObjects](self->_normalizedStringPayloads, "removeAllObjects");
}

- (void)addNormalizedStringPayloads:(id)a3
{
  id v4;
  NSMutableArray *normalizedStringPayloads;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  normalizedStringPayloads = self->_normalizedStringPayloads;
  v8 = v4;
  if (!normalizedStringPayloads)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_normalizedStringPayloads;
    self->_normalizedStringPayloads = v6;

    v4 = v8;
    normalizedStringPayloads = self->_normalizedStringPayloads;
  }
  -[NSMutableArray addObject:](normalizedStringPayloads, "addObject:", v4);

}

- (unint64_t)normalizedStringPayloadsCount
{
  return -[NSMutableArray count](self->_normalizedStringPayloads, "count");
}

- (id)normalizedStringPayloadsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_normalizedStringPayloads, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUEXTERNALUsoNode;
  -[SIRINLUEXTERNALUsoNode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUsoNode dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  SIRICOMMONStringValue *stringPayload;
  void *v6;
  SIRICOMMONInt64Value *integerPayload;
  void *v8;
  SIRICOMMONUInt32Value *usoVerbElementId;
  void *v10;
  NSString *entityLabel;
  NSString *verbLabel;
  NSMutableArray *normalizedStringPayloads;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_usoElementId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("uso_element_id"));

  }
  stringPayload = self->_stringPayload;
  if (stringPayload)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](stringPayload, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("string_payload"));

  }
  integerPayload = self->_integerPayload;
  if (integerPayload)
  {
    -[SIRICOMMONInt64Value dictionaryRepresentation](integerPayload, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("integer_payload"));

  }
  usoVerbElementId = self->_usoVerbElementId;
  if (usoVerbElementId)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](usoVerbElementId, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("uso_verb_element_id"));

  }
  entityLabel = self->_entityLabel;
  if (entityLabel)
    objc_msgSend(v3, "setObject:forKey:", entityLabel, CFSTR("entity_label"));
  verbLabel = self->_verbLabel;
  if (verbLabel)
    objc_msgSend(v3, "setObject:forKey:", verbLabel, CFSTR("verb_label"));
  normalizedStringPayloads = self->_normalizedStringPayloads;
  if (normalizedStringPayloads)
    objc_msgSend(v3, "setObject:forKey:", normalizedStringPayloads, CFSTR("normalized_string_payloads"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoNodeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_stringPayload)
    PBDataWriterWriteSubmessage();
  if (self->_integerPayload)
    PBDataWriterWriteSubmessage();
  if (self->_usoVerbElementId)
    PBDataWriterWriteSubmessage();
  if (self->_entityLabel)
    PBDataWriterWriteStringField();
  if (self->_verbLabel)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_normalizedStringPayloads;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_usoElementId;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v9 = v4;
  if (self->_stringPayload)
    objc_msgSend(v4, "setStringPayload:");
  if (self->_integerPayload)
    objc_msgSend(v9, "setIntegerPayload:");
  if (self->_usoVerbElementId)
    objc_msgSend(v9, "setUsoVerbElementId:");
  if (self->_entityLabel)
    objc_msgSend(v9, "setEntityLabel:");
  if (self->_verbLabel)
    objc_msgSend(v9, "setVerbLabel:");
  if (-[SIRINLUEXTERNALUsoNode normalizedStringPayloadsCount](self, "normalizedStringPayloadsCount"))
  {
    objc_msgSend(v9, "clearNormalizedStringPayloads");
    v5 = -[SIRINLUEXTERNALUsoNode normalizedStringPayloadsCount](self, "normalizedStringPayloadsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUEXTERNALUsoNode normalizedStringPayloadsAtIndex:](self, "normalizedStringPayloadsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addNormalizedStringPayloads:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_usoElementId;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v7 = -[SIRICOMMONStringValue copyWithZone:](self->_stringPayload, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[SIRICOMMONInt64Value copyWithZone:](self->_integerPayload, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[SIRICOMMONUInt32Value copyWithZone:](self->_usoVerbElementId, "copyWithZone:", a3);
  v12 = (void *)v6[6];
  v6[6] = v11;

  v13 = -[NSString copyWithZone:](self->_entityLabel, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  v15 = -[NSString copyWithZone:](self->_verbLabel, "copyWithZone:", a3);
  v16 = (void *)v6[7];
  v6[7] = v15;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_normalizedStringPayloads;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v6, "addNormalizedStringPayloads:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRICOMMONStringValue *stringPayload;
  SIRICOMMONInt64Value *integerPayload;
  SIRICOMMONUInt32Value *usoVerbElementId;
  NSString *entityLabel;
  NSString *verbLabel;
  NSMutableArray *normalizedStringPayloads;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_usoElementId != *((_DWORD *)v4 + 10))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  stringPayload = self->_stringPayload;
  if ((unint64_t)stringPayload | *((_QWORD *)v4 + 4)
    && !-[SIRICOMMONStringValue isEqual:](stringPayload, "isEqual:"))
  {
    goto LABEL_19;
  }
  integerPayload = self->_integerPayload;
  if ((unint64_t)integerPayload | *((_QWORD *)v4 + 2))
  {
    if (!-[SIRICOMMONInt64Value isEqual:](integerPayload, "isEqual:"))
      goto LABEL_19;
  }
  usoVerbElementId = self->_usoVerbElementId;
  if ((unint64_t)usoVerbElementId | *((_QWORD *)v4 + 6))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](usoVerbElementId, "isEqual:"))
      goto LABEL_19;
  }
  entityLabel = self->_entityLabel;
  if ((unint64_t)entityLabel | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](entityLabel, "isEqual:"))
      goto LABEL_19;
  }
  verbLabel = self->_verbLabel;
  if ((unint64_t)verbLabel | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](verbLabel, "isEqual:"))
      goto LABEL_19;
  }
  normalizedStringPayloads = self->_normalizedStringPayloads;
  if ((unint64_t)normalizedStringPayloads | *((_QWORD *)v4 + 3))
    v11 = -[NSMutableArray isEqual:](normalizedStringPayloads, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_usoElementId;
  else
    v3 = 0;
  v4 = -[SIRICOMMONStringValue hash](self->_stringPayload, "hash") ^ v3;
  v5 = -[SIRICOMMONInt64Value hash](self->_integerPayload, "hash");
  v6 = v4 ^ v5 ^ -[SIRICOMMONUInt32Value hash](self->_usoVerbElementId, "hash");
  v7 = -[NSString hash](self->_entityLabel, "hash");
  v8 = v7 ^ -[NSString hash](self->_verbLabel, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_normalizedStringPayloads, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  SIRICOMMONStringValue *stringPayload;
  uint64_t v7;
  SIRICOMMONInt64Value *integerPayload;
  uint64_t v9;
  SIRICOMMONUInt32Value *usoVerbElementId;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[16] & 1) != 0)
  {
    self->_usoElementId = v4[10];
    *(_BYTE *)&self->_has |= 1u;
  }
  stringPayload = self->_stringPayload;
  v7 = *((_QWORD *)v5 + 4);
  if (stringPayload)
  {
    if (v7)
      -[SIRICOMMONStringValue mergeFrom:](stringPayload, "mergeFrom:");
  }
  else if (v7)
  {
    -[SIRINLUEXTERNALUsoNode setStringPayload:](self, "setStringPayload:");
  }
  integerPayload = self->_integerPayload;
  v9 = *((_QWORD *)v5 + 2);
  if (integerPayload)
  {
    if (v9)
      -[SIRICOMMONInt64Value mergeFrom:](integerPayload, "mergeFrom:");
  }
  else if (v9)
  {
    -[SIRINLUEXTERNALUsoNode setIntegerPayload:](self, "setIntegerPayload:");
  }
  usoVerbElementId = self->_usoVerbElementId;
  v11 = *((_QWORD *)v5 + 6);
  if (usoVerbElementId)
  {
    if (v11)
      -[SIRICOMMONUInt32Value mergeFrom:](usoVerbElementId, "mergeFrom:");
  }
  else if (v11)
  {
    -[SIRINLUEXTERNALUsoNode setUsoVerbElementId:](self, "setUsoVerbElementId:");
  }
  if (*((_QWORD *)v5 + 1))
    -[SIRINLUEXTERNALUsoNode setEntityLabel:](self, "setEntityLabel:");
  if (*((_QWORD *)v5 + 7))
    -[SIRINLUEXTERNALUsoNode setVerbLabel:](self, "setVerbLabel:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v5 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALUsoNode addNormalizedStringPayloads:](self, "addNormalizedStringPayloads:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (SIRICOMMONStringValue)stringPayload
{
  return self->_stringPayload;
}

- (void)setStringPayload:(id)a3
{
  objc_storeStrong((id *)&self->_stringPayload, a3);
}

- (SIRICOMMONInt64Value)integerPayload
{
  return self->_integerPayload;
}

- (void)setIntegerPayload:(id)a3
{
  objc_storeStrong((id *)&self->_integerPayload, a3);
}

- (SIRICOMMONUInt32Value)usoVerbElementId
{
  return self->_usoVerbElementId;
}

- (void)setUsoVerbElementId:(id)a3
{
  objc_storeStrong((id *)&self->_usoVerbElementId, a3);
}

- (NSString)entityLabel
{
  return self->_entityLabel;
}

- (void)setEntityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_entityLabel, a3);
}

- (NSString)verbLabel
{
  return self->_verbLabel;
}

- (void)setVerbLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verbLabel, a3);
}

- (NSMutableArray)normalizedStringPayloads
{
  return self->_normalizedStringPayloads;
}

- (void)setNormalizedStringPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedStringPayloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verbLabel, 0);
  objc_storeStrong((id *)&self->_usoVerbElementId, 0);
  objc_storeStrong((id *)&self->_stringPayload, 0);
  objc_storeStrong((id *)&self->_normalizedStringPayloads, 0);
  objc_storeStrong((id *)&self->_integerPayload, 0);
  objc_storeStrong((id *)&self->_entityLabel, 0);
}

+ (Class)normalizedStringPayloadsType
{
  return (Class)objc_opt_class();
}

@end
