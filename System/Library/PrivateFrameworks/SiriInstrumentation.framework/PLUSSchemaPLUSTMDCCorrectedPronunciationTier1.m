@implementation PLUSSchemaPLUSTMDCCorrectedPronunciationTier1

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
  v7.super_class = (Class)PLUSSchemaPLUSTMDCCorrectedPronunciationTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteFirstNamePhonemes](self, "deleteFirstNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteLastNamePhonemes](self, "deleteLastNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteNicknamePhonemes](self, "deleteNicknamePhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteFirstNamePhonemes](self, "deleteFirstNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteLastNamePhonemes](self, "deleteLastNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteNicknamePhonemes](self, "deleteNicknamePhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteFirstNamePhonemes](self, "deleteFirstNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteLastNamePhonemes](self, "deleteLastNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteNicknamePhonemes](self, "deleteNicknamePhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteFirstNamePhonemes](self, "deleteFirstNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteLastNamePhonemes](self, "deleteLastNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteNicknamePhonemes](self, "deleteNicknamePhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteFirstNamePhonemes](self, "deleteFirstNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteLastNamePhonemes](self, "deleteLastNamePhonemes");
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 deleteNicknamePhonemes](self, "deleteNicknamePhonemes");
  }

  return v5;
}

- (BOOL)hasFirstNamePhonemes
{
  return self->_firstNamePhonemes != 0;
}

- (void)deleteFirstNamePhonemes
{
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 setFirstNamePhonemes:](self, "setFirstNamePhonemes:", 0);
}

- (BOOL)hasLastNamePhonemes
{
  return self->_lastNamePhonemes != 0;
}

- (void)deleteLastNamePhonemes
{
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 setLastNamePhonemes:](self, "setLastNamePhonemes:", 0);
}

- (BOOL)hasNicknamePhonemes
{
  return self->_nicknamePhonemes != 0;
}

- (void)deleteNicknamePhonemes
{
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 setNicknamePhonemes:](self, "setNicknamePhonemes:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSTMDCCorrectedPronunciationTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 firstNamePhonemes](self, "firstNamePhonemes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 lastNamePhonemes](self, "lastNamePhonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 nicknamePhonemes](self, "nicknamePhonemes");
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
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 firstNamePhonemes](self, "firstNamePhonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstNamePhonemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 firstNamePhonemes](self, "firstNamePhonemes");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 firstNamePhonemes](self, "firstNamePhonemes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstNamePhonemes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 lastNamePhonemes](self, "lastNamePhonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastNamePhonemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 lastNamePhonemes](self, "lastNamePhonemes");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 lastNamePhonemes](self, "lastNamePhonemes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastNamePhonemes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 nicknamePhonemes](self, "nicknamePhonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nicknamePhonemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 nicknamePhonemes](self, "nicknamePhonemes");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 nicknamePhonemes](self, "nicknamePhonemes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nicknamePhonemes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_firstNamePhonemes, "hash");
  v4 = -[NSString hash](self->_lastNamePhonemes, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_nicknamePhonemes, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_firstNamePhonemes)
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 firstNamePhonemes](self, "firstNamePhonemes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("firstNamePhonemes"));

  }
  if (self->_lastNamePhonemes)
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 lastNamePhonemes](self, "lastNamePhonemes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("lastNamePhonemes"));

  }
  if (self->_nicknamePhonemes)
  {
    -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 nicknamePhonemes](self, "nicknamePhonemes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("nicknamePhonemes"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *v5;
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
    self = -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSTMDCCorrectedPronunciationTier1;
  v5 = -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstNamePhonemes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 setFirstNamePhonemes:](v5, "setFirstNamePhonemes:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastNamePhonemes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 setLastNamePhonemes:](v5, "setLastNamePhonemes:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nicknamePhonemes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 setNicknamePhonemes:](v5, "setNicknamePhonemes:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)firstNamePhonemes
{
  return self->_firstNamePhonemes;
}

- (void)setFirstNamePhonemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)lastNamePhonemes
{
  return self->_lastNamePhonemes;
}

- (void)setLastNamePhonemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)nicknamePhonemes
{
  return self->_nicknamePhonemes;
}

- (void)setNicknamePhonemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasFirstNamePhonemes:(BOOL)a3
{
  self->_hasFirstNamePhonemes = a3;
}

- (void)setHasLastNamePhonemes:(BOOL)a3
{
  self->_hasLastNamePhonemes = a3;
}

- (void)setHasNicknamePhonemes:(BOOL)a3
{
  self->_hasNicknamePhonemes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknamePhonemes, 0);
  objc_storeStrong((id *)&self->_lastNamePhonemes, 0);
  objc_storeStrong((id *)&self->_firstNamePhonemes, 0);
}

@end
