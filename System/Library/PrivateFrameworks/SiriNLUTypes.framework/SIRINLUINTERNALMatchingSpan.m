@implementation SIRINLUINTERNALMatchingSpan

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUINTERNALMatchingSpan;
  -[SIRINLUINTERNALMatchingSpan dealloc](&v3, sel_dealloc);
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasInput
{
  return self->_input != 0;
}

- (void)setStartTokenIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startTokenIndex = a3;
}

- (void)setHasStartTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTokenIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endTokenIndex = a3;
}

- (void)setHasEndTokenIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndTokenIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

- (unint64_t)matcherNamesCount
{
  return self->_matcherNames.count;
}

- (int)matcherNames
{
  return self->_matcherNames.list;
}

- (void)clearMatcherNames
{
  PBRepeatedInt32Clear();
}

- (void)addMatcherNames:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)matcherNamesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_matcherNames;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_matcherNames = &self->_matcherNames;
  count = self->_matcherNames.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_matcherNames->list[a3];
}

- (void)setMatcherNames:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)matcherNamesAsString:(int)a3
{
  if (a3 < 9)
    return off_1E7BB0E88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMatcherNames:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DATADETECTOR_MATCHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLUM_MATCHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_VOCABULARY_MATCHER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOC_TRIE_MATCHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTEXT_MATCHER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OVERTON_KG_MATCHER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MRR_DETECTOR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MRR_MATCHER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REGEX_MATCHER")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasInternalSpanData
{
  return self->_internalSpanData != 0;
}

- (BOOL)hasSemanticValue
{
  return self->_semanticValue != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALMatchingSpan;
  -[SIRINLUINTERNALMatchingSpan description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALMatchingSpan dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *label;
  NSString *input;
  char has;
  void *v8;
  void *v9;
  SIRINLUEXTERNALUsoGraph *usoGraph;
  void *v11;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_matcherNames;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  SIRINLUINTERNALInternalSpanData *internalSpanData;
  void *v18;
  NSString *semanticValue;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  input = self->_input;
  if (input)
    objc_msgSend(v4, "setObject:forKey:", input, CFSTR("input"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_startTokenIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("start_token_index"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_endTokenIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("end_token_index"));

  }
  usoGraph = self->_usoGraph;
  if (usoGraph)
  {
    -[SIRINLUEXTERNALUsoGraph dictionaryRepresentation](usoGraph, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("uso_graph"));

  }
  p_matcherNames = &self->_matcherNames;
  if (self->_matcherNames.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_matcherNames.count)
    {
      v14 = 0;
      do
      {
        v15 = p_matcherNames->list[v14];
        if (v15 >= 9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_matcherNames->list[v14]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E7BB0E88[v15];
        }
        objc_msgSend(v13, "addObject:", v16);

        ++v14;
      }
      while (v14 < self->_matcherNames.count);
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("matcher_names"));

  }
  internalSpanData = self->_internalSpanData;
  if (internalSpanData)
  {
    -[SIRINLUINTERNALInternalSpanData dictionaryRepresentation](internalSpanData, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("internal_span_data"));

  }
  semanticValue = self->_semanticValue;
  if (semanticValue)
    objc_msgSend(v4, "setObject:forKey:", semanticValue, CFSTR("semantic_value"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMatchingSpanReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_input)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
  if (self->_usoGraph)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_matcherNames.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_matcherNames.count);
  }
  if (self->_internalSpanData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_semanticValue)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v10;
  }
  if (self->_input)
  {
    objc_msgSend(v10, "setInput:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_startTokenIndex;
    *((_BYTE *)v4 + 88) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_endTokenIndex;
    *((_BYTE *)v4 + 88) |= 1u;
  }
  if (self->_usoGraph)
    objc_msgSend(v10, "setUsoGraph:");
  if (-[SIRINLUINTERNALMatchingSpan matcherNamesCount](self, "matcherNamesCount"))
  {
    objc_msgSend(v10, "clearMatcherNames");
    v6 = -[SIRINLUINTERNALMatchingSpan matcherNamesCount](self, "matcherNamesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v10, "addMatcherNames:", -[SIRINLUINTERNALMatchingSpan matcherNamesAtIndex:](self, "matcherNamesAtIndex:", i));
    }
  }
  if (self->_internalSpanData)
    objc_msgSend(v10, "setInternalSpanData:");
  v9 = v10;
  if (self->_semanticValue)
  {
    objc_msgSend(v10, "setSemanticValue:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_input, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_startTokenIndex;
    *(_BYTE *)(v5 + 88) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_endTokenIndex;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v11 = -[SIRINLUEXTERNALUsoGraph copyWithZone:](self->_usoGraph, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v11;

  PBRepeatedInt32Copy();
  v13 = -[SIRINLUINTERNALInternalSpanData copyWithZone:](self->_internalSpanData, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSString copyWithZone:](self->_semanticValue, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v15;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *label;
  NSString *input;
  SIRINLUEXTERNALUsoGraph *usoGraph;
  SIRINLUINTERNALInternalSpanData *internalSpanData;
  NSString *semanticValue;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_23;
  }
  input = self->_input;
  if ((unint64_t)input | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](input, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_startTokenIndex != *((_DWORD *)v4 + 18))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
LABEL_23:
    v10 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_endTokenIndex != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_23;
  }
  usoGraph = self->_usoGraph;
  if ((unint64_t)usoGraph | *((_QWORD *)v4 + 10) && !-[SIRINLUEXTERNALUsoGraph isEqual:](usoGraph, "isEqual:"))
    goto LABEL_23;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_23;
  internalSpanData = self->_internalSpanData;
  if ((unint64_t)internalSpanData | *((_QWORD *)v4 + 6))
  {
    if (!-[SIRINLUINTERNALInternalSpanData isEqual:](internalSpanData, "isEqual:"))
      goto LABEL_23;
  }
  semanticValue = self->_semanticValue;
  if ((unint64_t)semanticValue | *((_QWORD *)v4 + 8))
    v10 = -[NSString isEqual:](semanticValue, "isEqual:");
  else
    v10 = 1;
LABEL_24:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_label, "hash");
  v4 = -[NSString hash](self->_input, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_startTokenIndex;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_endTokenIndex;
LABEL_6:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[SIRINLUEXTERNALUsoGraph hash](self->_usoGraph, "hash");
  v8 = PBRepeatedInt32Hash();
  v9 = v8 ^ -[SIRINLUINTERNALInternalSpanData hash](self->_internalSpanData, "hash");
  return v7 ^ v9 ^ -[NSString hash](self->_semanticValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  SIRINLUEXTERNALUsoGraph *usoGraph;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  SIRINLUINTERNALInternalSpanData *internalSpanData;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = a3;
  v14 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[SIRINLUINTERNALMatchingSpan setLabel:](self, "setLabel:");
    v4 = v14;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[SIRINLUINTERNALMatchingSpan setInput:](self, "setInput:");
    v4 = v14;
  }
  v5 = *((_BYTE *)v4 + 88);
  if ((v5 & 2) != 0)
  {
    self->_startTokenIndex = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 88);
  }
  if ((v5 & 1) != 0)
  {
    self->_endTokenIndex = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  usoGraph = self->_usoGraph;
  v7 = *((_QWORD *)v4 + 10);
  if (usoGraph)
  {
    if (!v7)
      goto LABEL_15;
    -[SIRINLUEXTERNALUsoGraph mergeFrom:](usoGraph, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[SIRINLUINTERNALMatchingSpan setUsoGraph:](self, "setUsoGraph:");
  }
  v4 = v14;
LABEL_15:
  v8 = objc_msgSend(v4, "matcherNamesCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[SIRINLUINTERNALMatchingSpan addMatcherNames:](self, "addMatcherNames:", objc_msgSend(v14, "matcherNamesAtIndex:", i));
  }
  internalSpanData = self->_internalSpanData;
  v12 = v14;
  v13 = v14[6];
  if (internalSpanData)
  {
    if (!v13)
      goto LABEL_24;
    -[SIRINLUINTERNALInternalSpanData mergeFrom:](internalSpanData, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_24;
    -[SIRINLUINTERNALMatchingSpan setInternalSpanData:](self, "setInternalSpanData:");
  }
  v12 = v14;
LABEL_24:
  if (v12[8])
  {
    -[SIRINLUINTERNALMatchingSpan setSemanticValue:](self, "setSemanticValue:");
    v12 = v14;
  }

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (unsigned)startTokenIndex
{
  return self->_startTokenIndex;
}

- (unsigned)endTokenIndex
{
  return self->_endTokenIndex;
}

- (SIRINLUEXTERNALUsoGraph)usoGraph
{
  return self->_usoGraph;
}

- (void)setUsoGraph:(id)a3
{
  objc_storeStrong((id *)&self->_usoGraph, a3);
}

- (SIRINLUINTERNALInternalSpanData)internalSpanData
{
  return self->_internalSpanData;
}

- (void)setInternalSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_internalSpanData, a3);
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (void)setSemanticValue:(id)a3
{
  objc_storeStrong((id *)&self->_semanticValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_internalSpanData, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
