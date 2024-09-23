@implementation PEGASUSSchemaPEGASUSSortedScore

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasSortedScoreFinal
{
  return self->_sortedScoreFinal != 0;
}

- (void)deleteSortedScoreFinal
{
  -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreFinal:](self, "setSortedScoreFinal:", 0);
}

- (BOOL)hasSortedScorelinearCombiner
{
  return self->_sortedScorelinearCombiner != 0;
}

- (void)deleteSortedScorelinearCombiner
{
  -[PEGASUSSchemaPEGASUSSortedScore setSortedScorelinearCombiner:](self, "setSortedScorelinearCombiner:", 0);
}

- (BOOL)hasSortedScoreModelFinal
{
  return self->_sortedScoreModelFinal != 0;
}

- (void)deleteSortedScoreModelFinal
{
  -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreModelFinal:](self, "setSortedScoreModelFinal:", 0);
}

- (BOOL)hasSortedScoreStage2
{
  return self->_sortedScoreStage2 != 0;
}

- (void)deleteSortedScoreStage2
{
  -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreStage2:](self, "setSortedScoreStage2:", 0);
}

- (BOOL)hasSortedScoreBoosted
{
  return self->_sortedScoreBoosted != 0;
}

- (void)deleteSortedScoreBoosted
{
  -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreBoosted:](self, "setSortedScoreBoosted:", 0);
}

- (BOOL)hasSortedScoreKnockOut
{
  return self->_sortedScoreKnockOut != 0;
}

- (void)deleteSortedScoreKnockOut
{
  -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreKnockOut:](self, "setSortedScoreKnockOut:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSSortedScoreReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreFinal](self, "sortedScoreFinal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSSortedScore sortedScorelinearCombiner](self, "sortedScorelinearCombiner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreModelFinal](self, "sortedScoreModelFinal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreStage2](self, "sortedScoreStage2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreBoosted](self, "sortedScoreBoosted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreKnockOut](self, "sortedScoreKnockOut");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreFinal](self, "sortedScoreFinal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedScoreFinal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreFinal](self, "sortedScoreFinal");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreFinal](self, "sortedScoreFinal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedScoreFinal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSortedScore sortedScorelinearCombiner](self, "sortedScorelinearCombiner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedScorelinearCombiner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSSortedScore sortedScorelinearCombiner](self, "sortedScorelinearCombiner");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSSortedScore sortedScorelinearCombiner](self, "sortedScorelinearCombiner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedScorelinearCombiner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreModelFinal](self, "sortedScoreModelFinal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedScoreModelFinal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreModelFinal](self, "sortedScoreModelFinal");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreModelFinal](self, "sortedScoreModelFinal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedScoreModelFinal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreStage2](self, "sortedScoreStage2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedScoreStage2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreStage2](self, "sortedScoreStage2");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreStage2](self, "sortedScoreStage2");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedScoreStage2");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreBoosted](self, "sortedScoreBoosted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedScoreBoosted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreBoosted](self, "sortedScoreBoosted");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreBoosted](self, "sortedScoreBoosted");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedScoreBoosted");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSortedScore sortedScoreKnockOut](self, "sortedScoreKnockOut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedScoreKnockOut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreKnockOut](self, "sortedScoreKnockOut");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreKnockOut](self, "sortedScoreKnockOut");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedScoreKnockOut");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_sortedScoreFinal, "hash");
  v4 = -[NSString hash](self->_sortedScorelinearCombiner, "hash") ^ v3;
  v5 = -[NSString hash](self->_sortedScoreModelFinal, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_sortedScoreStage2, "hash");
  v7 = -[NSString hash](self->_sortedScoreBoosted, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_sortedScoreKnockOut, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_sortedScoreBoosted)
  {
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreBoosted](self, "sortedScoreBoosted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sortedScoreBoosted"));

  }
  if (self->_sortedScoreFinal)
  {
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreFinal](self, "sortedScoreFinal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sortedScoreFinal"));

  }
  if (self->_sortedScoreKnockOut)
  {
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreKnockOut](self, "sortedScoreKnockOut");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sortedScoreKnockOut"));

  }
  if (self->_sortedScoreModelFinal)
  {
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreModelFinal](self, "sortedScoreModelFinal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sortedScoreModelFinal"));

  }
  if (self->_sortedScoreStage2)
  {
    -[PEGASUSSchemaPEGASUSSortedScore sortedScoreStage2](self, "sortedScoreStage2");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("sortedScoreStage2"));

  }
  if (self->_sortedScorelinearCombiner)
  {
    -[PEGASUSSchemaPEGASUSSortedScore sortedScorelinearCombiner](self, "sortedScorelinearCombiner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("sortedScorelinearCombiner"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSSortedScore dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSSortedScore)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSSortedScore *v5;
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
    self = -[PEGASUSSchemaPEGASUSSortedScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSSortedScore)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSSortedScore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PEGASUSSchemaPEGASUSSortedScore *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PEGASUSSchemaPEGASUSSortedScore;
  v5 = -[PEGASUSSchemaPEGASUSSortedScore init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedScoreFinal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreFinal:](v5, "setSortedScoreFinal:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedScorelinearCombiner"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSSortedScore setSortedScorelinearCombiner:](v5, "setSortedScorelinearCombiner:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedScoreModelFinal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreModelFinal:](v5, "setSortedScoreModelFinal:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedScoreStage2"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreStage2:](v5, "setSortedScoreStage2:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedScoreBoosted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreBoosted:](v5, "setSortedScoreBoosted:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedScoreKnockOut"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[PEGASUSSchemaPEGASUSSortedScore setSortedScoreKnockOut:](v5, "setSortedScoreKnockOut:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (NSString)sortedScoreFinal
{
  return self->_sortedScoreFinal;
}

- (void)setSortedScoreFinal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sortedScorelinearCombiner
{
  return self->_sortedScorelinearCombiner;
}

- (void)setSortedScorelinearCombiner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sortedScoreModelFinal
{
  return self->_sortedScoreModelFinal;
}

- (void)setSortedScoreModelFinal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sortedScoreStage2
{
  return self->_sortedScoreStage2;
}

- (void)setSortedScoreStage2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sortedScoreBoosted
{
  return self->_sortedScoreBoosted;
}

- (void)setSortedScoreBoosted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sortedScoreKnockOut
{
  return self->_sortedScoreKnockOut;
}

- (void)setSortedScoreKnockOut:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasSortedScoreFinal:(BOOL)a3
{
  self->_hasSortedScoreFinal = a3;
}

- (void)setHasSortedScorelinearCombiner:(BOOL)a3
{
  self->_hasSortedScorelinearCombiner = a3;
}

- (void)setHasSortedScoreModelFinal:(BOOL)a3
{
  self->_hasSortedScoreModelFinal = a3;
}

- (void)setHasSortedScoreStage2:(BOOL)a3
{
  self->_hasSortedScoreStage2 = a3;
}

- (void)setHasSortedScoreBoosted:(BOOL)a3
{
  self->_hasSortedScoreBoosted = a3;
}

- (void)setHasSortedScoreKnockOut:(BOOL)a3
{
  self->_hasSortedScoreKnockOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedScoreKnockOut, 0);
  objc_storeStrong((id *)&self->_sortedScoreBoosted, 0);
  objc_storeStrong((id *)&self->_sortedScoreStage2, 0);
  objc_storeStrong((id *)&self->_sortedScoreModelFinal, 0);
  objc_storeStrong((id *)&self->_sortedScorelinearCombiner, 0);
  objc_storeStrong((id *)&self->_sortedScoreFinal, 0);
}

@end
