@implementation SIRINLUINTERNALITFMITFMParserResponse

- (void)setClassificationLabel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_classificationLabel = a3;
}

- (void)setHasClassificationLabel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClassificationLabel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setClassificationProbability:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_classificationProbability = a3;
}

- (void)setHasClassificationProbability:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClassificationProbability
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasParser
{
  return self->_parser != 0;
}

- (void)clearHypotheses
{
  -[NSMutableArray removeAllObjects](self->_hypotheses, "removeAllObjects");
}

- (void)addHypotheses:(id)a3
{
  id v4;
  NSMutableArray *hypotheses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  hypotheses = self->_hypotheses;
  v8 = v4;
  if (!hypotheses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_hypotheses;
    self->_hypotheses = v6;

    v4 = v8;
    hypotheses = self->_hypotheses;
  }
  -[NSMutableArray addObject:](hypotheses, "addObject:", v4);

}

- (unint64_t)hypothesesCount
{
  return -[NSMutableArray count](self->_hypotheses, "count");
}

- (id)hypothesesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_hypotheses, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALITFMITFMParserResponse;
  -[SIRINLUINTERNALITFMITFMParserResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALITFMITFMParserResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;
  SIRINLUEXTERNALParser *parser;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_classificationLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("classification_label"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_classificationProbability;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("classification_probability"));

  }
  parser = self->_parser;
  if (parser)
  {
    -[SIRINLUEXTERNALParser dictionaryRepresentation](parser, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("parser"));

  }
  if (-[NSMutableArray count](self->_hypotheses, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_hypotheses, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_hypotheses;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("hypotheses"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALITFMITFMParserResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteFloatField();
  if (self->_parser)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_hypotheses;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[32] = self->_classificationLabel;
    v4[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_classificationProbability);
    v4[36] |= 1u;
  }
  v10 = v4;
  if (self->_parser)
    objc_msgSend(v4, "setParser:");
  if (-[SIRINLUINTERNALITFMITFMParserResponse hypothesesCount](self, "hypothesesCount"))
  {
    objc_msgSend(v10, "clearHypotheses");
    v6 = -[SIRINLUINTERNALITFMITFMParserResponse hypothesesCount](self, "hypothesesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SIRINLUINTERNALITFMITFMParserResponse hypothesesAtIndex:](self, "hypothesesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addHypotheses:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_classificationLabel;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)(v5 + 8) = self->_classificationProbability;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v8 = -[SIRINLUEXTERNALParser copyWithZone:](self->_parser, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_hypotheses;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v6, "addHypotheses:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALParser *parser;
  NSMutableArray *hypotheses;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) != 0)
    {
      if (self->_classificationLabel)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_19;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
LABEL_19:
    v7 = 0;
    goto LABEL_20;
  }
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
    goto LABEL_19;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_classificationProbability != *((float *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_19;
  }
  parser = self->_parser;
  if ((unint64_t)parser | *((_QWORD *)v4 + 3) && !-[SIRINLUEXTERNALParser isEqual:](parser, "isEqual:"))
    goto LABEL_19;
  hypotheses = self->_hypotheses;
  if ((unint64_t)hypotheses | *((_QWORD *)v4 + 2))
    v7 = -[NSMutableArray isEqual:](hypotheses, "isEqual:");
  else
    v7 = 1;
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  float classificationProbability;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_classificationLabel;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  classificationProbability = self->_classificationProbability;
  v5 = -classificationProbability;
  if (classificationProbability >= 0.0)
    v5 = self->_classificationProbability;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_11:
  v9 = v8 ^ v3 ^ -[SIRINLUEXTERNALParser hash](self->_parser, "hash");
  return v9 ^ -[NSMutableArray hash](self->_hypotheses, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  SIRINLUEXTERNALParser *parser;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 36);
  if ((v6 & 2) != 0)
  {
    self->_classificationLabel = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((v6 & 1) != 0)
  {
    self->_classificationProbability = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  parser = self->_parser;
  v8 = *((_QWORD *)v5 + 3);
  if (parser)
  {
    if (v8)
      -[SIRINLUEXTERNALParser mergeFrom:](parser, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUINTERNALITFMITFMParserResponse setParser:](self, "setParser:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v5 + 2);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[SIRINLUINTERNALITFMITFMParserResponse addHypotheses:](self, "addHypotheses:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (BOOL)classificationLabel
{
  return self->_classificationLabel;
}

- (float)classificationProbability
{
  return self->_classificationProbability;
}

- (SIRINLUEXTERNALParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (NSMutableArray)hypotheses
{
  return self->_hypotheses;
}

- (void)setHypotheses:(id)a3
{
  objc_storeStrong((id *)&self->_hypotheses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_hypotheses, 0);
}

+ (Class)hypothesesType
{
  return (Class)objc_opt_class();
}

@end
