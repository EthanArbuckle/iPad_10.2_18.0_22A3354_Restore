@implementation SIRINLUEXTERNALMatchInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUEXTERNALMatchInfo;
  -[SIRINLUEXTERNALMatchInfo dealloc](&v3, sel_dealloc);
}

- (void)setMatchSignalBitset:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_matchSignalBitset = a3;
}

- (void)setHasMatchSignalBitset:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMatchSignalBitset
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMatchScore
{
  return self->_matchScore != 0;
}

- (BOOL)hasMaxTokenCount
{
  return self->_maxTokenCount != 0;
}

- (BOOL)hasMatchedTokenCount
{
  return self->_matchedTokenCount != 0;
}

- (BOOL)hasMaxStopWordCount
{
  return self->_maxStopWordCount != 0;
}

- (BOOL)hasMatchedStopWordCount
{
  return self->_matchedStopWordCount != 0;
}

- (BOOL)hasEditDistance
{
  return self->_editDistance != 0;
}

- (BOOL)hasMaxAliasCount
{
  return self->_maxAliasCount != 0;
}

- (BOOL)hasMatchedAliasCount
{
  return self->_matchedAliasCount != 0;
}

- (unint64_t)matchedAliasTypesCount
{
  return self->_matchedAliasTypes.count;
}

- (int)matchedAliasTypes
{
  return self->_matchedAliasTypes.list;
}

- (void)clearMatchedAliasTypes
{
  PBRepeatedInt32Clear();
}

- (void)addMatchedAliasTypes:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)matchedAliasTypesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_matchedAliasTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_matchedAliasTypes = &self->_matchedAliasTypes;
  count = self->_matchedAliasTypes.count;
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
  return p_matchedAliasTypes->list[a3];
}

- (void)setMatchedAliasTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)matchedAliasTypesAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E7BB2058[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMatchedAliasTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_UNDEFINED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_HOME_AUTOMATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_SYNONYM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_TRANSLITERATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_EXPANDED_EMOJI")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_CONTACT_RELATIONSHIP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_CONTACT_HYPOCORISM")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_CONTACT_HANDLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_PREFIX_MATCHING")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_DIACRITIC_REMOVAL")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_PHONETIC_MATCHER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALIAS_TYPE_LEMMATIZATION")))
  {
    v4 = 11;
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
  v8.super_class = (Class)SIRINLUEXTERNALMatchInfo;
  -[SIRINLUEXTERNALMatchInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALMatchInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  SIRICOMMONFloatValue *matchScore;
  void *v6;
  SIRICOMMONUInt32Value *maxTokenCount;
  void *v8;
  SIRICOMMONUInt32Value *matchedTokenCount;
  void *v10;
  SIRICOMMONUInt32Value *maxStopWordCount;
  void *v12;
  SIRICOMMONUInt32Value *matchedStopWordCount;
  void *v14;
  SIRICOMMONUInt32Value *editDistance;
  void *v16;
  SIRICOMMONUInt32Value *maxAliasCount;
  void *v18;
  SIRICOMMONUInt32Value *matchedAliasCount;
  void *v20;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_matchedAliasTypes;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  __CFString *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_matchSignalBitset);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("match_signal_bitset"));

  }
  matchScore = self->_matchScore;
  if (matchScore)
  {
    -[SIRICOMMONFloatValue dictionaryRepresentation](matchScore, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("match_score"));

  }
  maxTokenCount = self->_maxTokenCount;
  if (maxTokenCount)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](maxTokenCount, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("max_token_count"));

  }
  matchedTokenCount = self->_matchedTokenCount;
  if (matchedTokenCount)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](matchedTokenCount, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("matched_token_count"));

  }
  maxStopWordCount = self->_maxStopWordCount;
  if (maxStopWordCount)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](maxStopWordCount, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("max_stop_word_count"));

  }
  matchedStopWordCount = self->_matchedStopWordCount;
  if (matchedStopWordCount)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](matchedStopWordCount, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("matched_stop_word_count"));

  }
  editDistance = self->_editDistance;
  if (editDistance)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](editDistance, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("edit_distance"));

  }
  maxAliasCount = self->_maxAliasCount;
  if (maxAliasCount)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](maxAliasCount, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("max_alias_count"));

  }
  matchedAliasCount = self->_matchedAliasCount;
  if (matchedAliasCount)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](matchedAliasCount, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("matched_alias_count"));

  }
  p_matchedAliasTypes = &self->_matchedAliasTypes;
  if (self->_matchedAliasTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (p_matchedAliasTypes->count)
    {
      v23 = 0;
      do
      {
        v24 = p_matchedAliasTypes->list[v23];
        if (v24 >= 0xC)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_matchedAliasTypes->list[v23]);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = off_1E7BB2058[v24];
        }
        objc_msgSend(v22, "addObject:", v25);

        ++v23;
      }
      while (v23 < p_matchedAliasTypes->count);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("matched_alias_types"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALMatchInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_matchedAliasTypes;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFixed32Field();
    v4 = v7;
  }
  if (self->_matchScore)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_maxTokenCount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_matchedTokenCount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_maxStopWordCount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_matchedStopWordCount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_editDistance)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_maxAliasCount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_matchedAliasCount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  p_matchedAliasTypes = &self->_matchedAliasTypes;
  if (p_matchedAliasTypes->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < p_matchedAliasTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_matchSignalBitset;
    *((_BYTE *)v4 + 104) |= 1u;
  }
  v8 = v4;
  if (self->_matchScore)
    objc_msgSend(v4, "setMatchScore:");
  if (self->_maxTokenCount)
    objc_msgSend(v8, "setMaxTokenCount:");
  if (self->_matchedTokenCount)
    objc_msgSend(v8, "setMatchedTokenCount:");
  if (self->_maxStopWordCount)
    objc_msgSend(v8, "setMaxStopWordCount:");
  if (self->_matchedStopWordCount)
    objc_msgSend(v8, "setMatchedStopWordCount:");
  if (self->_editDistance)
    objc_msgSend(v8, "setEditDistance:");
  if (self->_maxAliasCount)
    objc_msgSend(v8, "setMaxAliasCount:");
  if (self->_matchedAliasCount)
    objc_msgSend(v8, "setMatchedAliasCount:");
  if (-[SIRINLUEXTERNALMatchInfo matchedAliasTypesCount](self, "matchedAliasTypesCount"))
  {
    objc_msgSend(v8, "clearMatchedAliasTypes");
    v5 = -[SIRINLUEXTERNALMatchInfo matchedAliasTypesCount](self, "matchedAliasTypesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addMatchedAliasTypes:", -[SIRINLUEXTERNALMatchInfo matchedAliasTypesAtIndex:](self, "matchedAliasTypesAtIndex:", i));
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
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_matchSignalBitset;
    *(_BYTE *)(v5 + 104) |= 1u;
  }
  v7 = -[SIRICOMMONFloatValue copyWithZone:](self->_matchScore, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[SIRICOMMONUInt32Value copyWithZone:](self->_maxTokenCount, "copyWithZone:", a3);
  v10 = (void *)v6[12];
  v6[12] = v9;

  v11 = -[SIRICOMMONUInt32Value copyWithZone:](self->_matchedTokenCount, "copyWithZone:", a3);
  v12 = (void *)v6[9];
  v6[9] = v11;

  v13 = -[SIRICOMMONUInt32Value copyWithZone:](self->_maxStopWordCount, "copyWithZone:", a3);
  v14 = (void *)v6[11];
  v6[11] = v13;

  v15 = -[SIRICOMMONUInt32Value copyWithZone:](self->_matchedStopWordCount, "copyWithZone:", a3);
  v16 = (void *)v6[8];
  v6[8] = v15;

  v17 = -[SIRICOMMONUInt32Value copyWithZone:](self->_editDistance, "copyWithZone:", a3);
  v18 = (void *)v6[4];
  v6[4] = v17;

  v19 = -[SIRICOMMONUInt32Value copyWithZone:](self->_maxAliasCount, "copyWithZone:", a3);
  v20 = (void *)v6[10];
  v6[10] = v19;

  v21 = -[SIRICOMMONUInt32Value copyWithZone:](self->_matchedAliasCount, "copyWithZone:", a3);
  v22 = (void *)v6[7];
  v6[7] = v21;

  PBRepeatedInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRICOMMONFloatValue *matchScore;
  SIRICOMMONUInt32Value *maxTokenCount;
  SIRICOMMONUInt32Value *matchedTokenCount;
  SIRICOMMONUInt32Value *maxStopWordCount;
  SIRICOMMONUInt32Value *matchedStopWordCount;
  SIRICOMMONUInt32Value *editDistance;
  SIRICOMMONUInt32Value *maxAliasCount;
  SIRICOMMONUInt32Value *matchedAliasCount;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_matchSignalBitset != *((_DWORD *)v4 + 12))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
LABEL_24:
    IsEqual = 0;
    goto LABEL_25;
  }
  matchScore = self->_matchScore;
  if ((unint64_t)matchScore | *((_QWORD *)v4 + 5) && !-[SIRICOMMONFloatValue isEqual:](matchScore, "isEqual:"))
    goto LABEL_24;
  maxTokenCount = self->_maxTokenCount;
  if ((unint64_t)maxTokenCount | *((_QWORD *)v4 + 12))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](maxTokenCount, "isEqual:"))
      goto LABEL_24;
  }
  matchedTokenCount = self->_matchedTokenCount;
  if ((unint64_t)matchedTokenCount | *((_QWORD *)v4 + 9))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](matchedTokenCount, "isEqual:"))
      goto LABEL_24;
  }
  maxStopWordCount = self->_maxStopWordCount;
  if ((unint64_t)maxStopWordCount | *((_QWORD *)v4 + 11))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](maxStopWordCount, "isEqual:"))
      goto LABEL_24;
  }
  matchedStopWordCount = self->_matchedStopWordCount;
  if ((unint64_t)matchedStopWordCount | *((_QWORD *)v4 + 8))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](matchedStopWordCount, "isEqual:"))
      goto LABEL_24;
  }
  editDistance = self->_editDistance;
  if ((unint64_t)editDistance | *((_QWORD *)v4 + 4))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](editDistance, "isEqual:"))
      goto LABEL_24;
  }
  maxAliasCount = self->_maxAliasCount;
  if ((unint64_t)maxAliasCount | *((_QWORD *)v4 + 10))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](maxAliasCount, "isEqual:"))
      goto LABEL_24;
  }
  matchedAliasCount = self->_matchedAliasCount;
  if ((unint64_t)matchedAliasCount | *((_QWORD *)v4 + 7))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](matchedAliasCount, "isEqual:"))
      goto LABEL_24;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_25:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_matchSignalBitset;
  else
    v3 = 0;
  v4 = -[SIRICOMMONFloatValue hash](self->_matchScore, "hash") ^ v3;
  v5 = -[SIRICOMMONUInt32Value hash](self->_maxTokenCount, "hash");
  v6 = v4 ^ v5 ^ -[SIRICOMMONUInt32Value hash](self->_matchedTokenCount, "hash");
  v7 = -[SIRICOMMONUInt32Value hash](self->_maxStopWordCount, "hash");
  v8 = v7 ^ -[SIRICOMMONUInt32Value hash](self->_matchedStopWordCount, "hash");
  v9 = v6 ^ v8 ^ -[SIRICOMMONUInt32Value hash](self->_editDistance, "hash");
  v10 = -[SIRICOMMONUInt32Value hash](self->_maxAliasCount, "hash");
  v11 = v10 ^ -[SIRICOMMONUInt32Value hash](self->_matchedAliasCount, "hash");
  return v9 ^ v11 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  SIRICOMMONFloatValue *matchScore;
  uint64_t v7;
  SIRICOMMONUInt32Value *maxTokenCount;
  uint64_t v9;
  SIRICOMMONUInt32Value *matchedTokenCount;
  uint64_t v11;
  SIRICOMMONUInt32Value *maxStopWordCount;
  uint64_t v13;
  SIRICOMMONUInt32Value *matchedStopWordCount;
  uint64_t v15;
  SIRICOMMONUInt32Value *editDistance;
  uint64_t v17;
  SIRICOMMONUInt32Value *maxAliasCount;
  uint64_t v19;
  SIRICOMMONUInt32Value *matchedAliasCount;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  _QWORD *v25;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    self->_matchSignalBitset = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  matchScore = self->_matchScore;
  v7 = v5[5];
  v25 = v5;
  if (matchScore)
  {
    if (!v7)
      goto LABEL_9;
    -[SIRICOMMONFloatValue mergeFrom:](matchScore, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[SIRINLUEXTERNALMatchInfo setMatchScore:](self, "setMatchScore:");
  }
  v5 = v25;
LABEL_9:
  maxTokenCount = self->_maxTokenCount;
  v9 = v5[12];
  if (maxTokenCount)
  {
    if (!v9)
      goto LABEL_15;
    -[SIRICOMMONUInt32Value mergeFrom:](maxTokenCount, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[SIRINLUEXTERNALMatchInfo setMaxTokenCount:](self, "setMaxTokenCount:");
  }
  v5 = v25;
LABEL_15:
  matchedTokenCount = self->_matchedTokenCount;
  v11 = v5[9];
  if (matchedTokenCount)
  {
    if (!v11)
      goto LABEL_21;
    -[SIRICOMMONUInt32Value mergeFrom:](matchedTokenCount, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[SIRINLUEXTERNALMatchInfo setMatchedTokenCount:](self, "setMatchedTokenCount:");
  }
  v5 = v25;
LABEL_21:
  maxStopWordCount = self->_maxStopWordCount;
  v13 = v5[11];
  if (maxStopWordCount)
  {
    if (!v13)
      goto LABEL_27;
    -[SIRICOMMONUInt32Value mergeFrom:](maxStopWordCount, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[SIRINLUEXTERNALMatchInfo setMaxStopWordCount:](self, "setMaxStopWordCount:");
  }
  v5 = v25;
LABEL_27:
  matchedStopWordCount = self->_matchedStopWordCount;
  v15 = v5[8];
  if (matchedStopWordCount)
  {
    if (!v15)
      goto LABEL_33;
    -[SIRICOMMONUInt32Value mergeFrom:](matchedStopWordCount, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[SIRINLUEXTERNALMatchInfo setMatchedStopWordCount:](self, "setMatchedStopWordCount:");
  }
  v5 = v25;
LABEL_33:
  editDistance = self->_editDistance;
  v17 = v5[4];
  if (editDistance)
  {
    if (!v17)
      goto LABEL_39;
    -[SIRICOMMONUInt32Value mergeFrom:](editDistance, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_39;
    -[SIRINLUEXTERNALMatchInfo setEditDistance:](self, "setEditDistance:");
  }
  v5 = v25;
LABEL_39:
  maxAliasCount = self->_maxAliasCount;
  v19 = v5[10];
  if (maxAliasCount)
  {
    if (!v19)
      goto LABEL_45;
    -[SIRICOMMONUInt32Value mergeFrom:](maxAliasCount, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_45;
    -[SIRINLUEXTERNALMatchInfo setMaxAliasCount:](self, "setMaxAliasCount:");
  }
  v5 = v25;
LABEL_45:
  matchedAliasCount = self->_matchedAliasCount;
  v21 = v5[7];
  if (matchedAliasCount)
  {
    if (!v21)
      goto LABEL_51;
    -[SIRICOMMONUInt32Value mergeFrom:](matchedAliasCount, "mergeFrom:");
  }
  else
  {
    if (!v21)
      goto LABEL_51;
    -[SIRINLUEXTERNALMatchInfo setMatchedAliasCount:](self, "setMatchedAliasCount:");
  }
  v5 = v25;
LABEL_51:
  v22 = objc_msgSend(v5, "matchedAliasTypesCount");
  if (v22)
  {
    v23 = v22;
    for (i = 0; i != v23; ++i)
      -[SIRINLUEXTERNALMatchInfo addMatchedAliasTypes:](self, "addMatchedAliasTypes:", objc_msgSend(v25, "matchedAliasTypesAtIndex:", i));
  }

}

- (unsigned)matchSignalBitset
{
  return self->_matchSignalBitset;
}

- (SIRICOMMONFloatValue)matchScore
{
  return self->_matchScore;
}

- (void)setMatchScore:(id)a3
{
  objc_storeStrong((id *)&self->_matchScore, a3);
}

- (SIRICOMMONUInt32Value)maxTokenCount
{
  return self->_maxTokenCount;
}

- (void)setMaxTokenCount:(id)a3
{
  objc_storeStrong((id *)&self->_maxTokenCount, a3);
}

- (SIRICOMMONUInt32Value)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (void)setMatchedTokenCount:(id)a3
{
  objc_storeStrong((id *)&self->_matchedTokenCount, a3);
}

- (SIRICOMMONUInt32Value)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (void)setMaxStopWordCount:(id)a3
{
  objc_storeStrong((id *)&self->_maxStopWordCount, a3);
}

- (SIRICOMMONUInt32Value)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (void)setMatchedStopWordCount:(id)a3
{
  objc_storeStrong((id *)&self->_matchedStopWordCount, a3);
}

- (SIRICOMMONUInt32Value)editDistance
{
  return self->_editDistance;
}

- (void)setEditDistance:(id)a3
{
  objc_storeStrong((id *)&self->_editDistance, a3);
}

- (SIRICOMMONUInt32Value)maxAliasCount
{
  return self->_maxAliasCount;
}

- (void)setMaxAliasCount:(id)a3
{
  objc_storeStrong((id *)&self->_maxAliasCount, a3);
}

- (SIRICOMMONUInt32Value)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (void)setMatchedAliasCount:(id)a3
{
  objc_storeStrong((id *)&self->_matchedAliasCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTokenCount, 0);
  objc_storeStrong((id *)&self->_maxStopWordCount, 0);
  objc_storeStrong((id *)&self->_maxAliasCount, 0);
  objc_storeStrong((id *)&self->_matchedTokenCount, 0);
  objc_storeStrong((id *)&self->_matchedStopWordCount, 0);
  objc_storeStrong((id *)&self->_matchedAliasCount, 0);
  objc_storeStrong((id *)&self->_matchScore, 0);
  objc_storeStrong((id *)&self->_editDistance, 0);
}

@end
