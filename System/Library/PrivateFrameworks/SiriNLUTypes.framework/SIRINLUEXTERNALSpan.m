@implementation SIRINLUEXTERNALSpan

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUEXTERNALSpan;
  -[SIRINLUEXTERNALSpan dealloc](&v3, sel_dealloc);
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
  *(_BYTE *)&self->_has |= 4u;
  self->_startTokenIndex = a3;
}

- (void)setHasStartTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartTokenIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endTokenIndex = a3;
}

- (void)setHasEndTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndTokenIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
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
  if (a3 < 5)
    return off_1E7BB0068[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMatcherNames:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_VOCABULARY_MATCHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MRR_DETECTOR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MRR_MATCHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONTEXT_MATCHER")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)SIRINLUEXTERNALSpan;
  -[SIRINLUEXTERNALSpan description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSpan dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v12;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_matcherNames;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  __CFString *v17;

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
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_startTokenIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("start_token_index"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("score"));

  }
  p_matcherNames = &self->_matcherNames;
  if (self->_matcherNames.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (p_matcherNames->count)
    {
      v15 = 0;
      do
      {
        v16 = p_matcherNames->list[v15];
        if (v16 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_matcherNames->list[v15]);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = off_1E7BB0068[v16];
        }
        objc_msgSend(v14, "addObject:", v17);

        ++v15;
      }
      while (v15 < p_matcherNames->count);
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("matcher_names"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSpanReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_matcherNames;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_input)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
  if (self->_usoGraph)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
  p_matcherNames = &self->_matcherNames;
  if (p_matcherNames->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < p_matcherNames->count);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v9;
  }
  if (self->_input)
  {
    objc_msgSend(v9, "setInput:");
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_startTokenIndex;
    *((_BYTE *)v4 + 80) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_endTokenIndex;
    *((_BYTE *)v4 + 80) |= 2u;
  }
  if (self->_usoGraph)
  {
    objc_msgSend(v9, "setUsoGraph:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  if (-[SIRINLUEXTERNALSpan matcherNamesCount](self, "matcherNamesCount"))
  {
    objc_msgSend(v9, "clearMatcherNames");
    v6 = -[SIRINLUEXTERNALSpan matcherNamesCount](self, "matcherNamesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addMatcherNames:", -[SIRINLUEXTERNALSpan matcherNamesAtIndex:](self, "matcherNamesAtIndex:", i));
    }
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_input, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_startTokenIndex;
    *(_BYTE *)(v5 + 80) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_endTokenIndex;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v11 = -[SIRINLUEXTERNALUsoGraph copyWithZone:](self->_usoGraph, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_score;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *label;
  NSString *input;
  char has;
  char v8;
  SIRINLUEXTERNALUsoGraph *usoGraph;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_25;
  }
  input = self->_input;
  if ((unint64_t)input | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](input, "isEqual:"))
      goto LABEL_25;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 80);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_startTokenIndex != *((_DWORD *)v4 + 16))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_endTokenIndex != *((_DWORD *)v4 + 10))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_25;
  }
  usoGraph = self->_usoGraph;
  if ((unint64_t)usoGraph | *((_QWORD *)v4 + 9))
  {
    if (!-[SIRINLUEXTERNALUsoGraph isEqual:](usoGraph, "isEqual:"))
    {
LABEL_25:
      IsEqual = 0;
      goto LABEL_26;
    }
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 80);
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_score != *((double *)v4 + 4))
      goto LABEL_25;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_25;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_26:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double score;
  double v10;
  long double v11;
  double v12;

  v3 = -[NSString hash](self->_label, "hash");
  v4 = -[NSString hash](self->_input, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_startTokenIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_endTokenIndex;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[SIRINLUEXTERNALUsoGraph hash](self->_usoGraph, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    v10 = -score;
    if (score >= 0.0)
      v10 = self->_score;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedInt32Hash();
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
  id v11;

  v4 = a3;
  v11 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[SIRINLUEXTERNALSpan setLabel:](self, "setLabel:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SIRINLUEXTERNALSpan setInput:](self, "setInput:");
    v4 = v11;
  }
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 4) != 0)
  {
    self->_startTokenIndex = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 80);
  }
  if ((v5 & 2) != 0)
  {
    self->_endTokenIndex = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  usoGraph = self->_usoGraph;
  v7 = *((_QWORD *)v4 + 9);
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
    -[SIRINLUEXTERNALSpan setUsoGraph:](self, "setUsoGraph:");
  }
  v4 = v11;
LABEL_15:
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_score = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = objc_msgSend(v4, "matcherNamesCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[SIRINLUEXTERNALSpan addMatcherNames:](self, "addMatcherNames:", objc_msgSend(v11, "matcherNamesAtIndex:", i));
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

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
