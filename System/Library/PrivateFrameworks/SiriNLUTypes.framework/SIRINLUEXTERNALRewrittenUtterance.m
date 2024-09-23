@implementation SIRINLUEXTERNALRewrittenUtterance

- (BOOL)hasRewrittenUtterance
{
  return self->_rewrittenUtterance != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRewrittenUtterance;
  -[SIRINLUEXTERNALRewrittenUtterance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALRewrittenUtterance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRICOMMONStringValue *rewrittenUtterance;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  rewrittenUtterance = self->_rewrittenUtterance;
  if (rewrittenUtterance)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](rewrittenUtterance, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rewritten_utterance"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("score"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRewrittenUtteranceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_rewrittenUtterance)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_rewrittenUtterance)
  {
    v5 = v4;
    objc_msgSend(v4, "setRewrittenUtterance:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRICOMMONStringValue copyWithZone:](self->_rewrittenUtterance, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRICOMMONStringValue *rewrittenUtterance;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  rewrittenUtterance = self->_rewrittenUtterance;
  if ((unint64_t)rewrittenUtterance | *((_QWORD *)v4 + 2))
  {
    if (!-[SIRICOMMONStringValue isEqual:](rewrittenUtterance, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_score == *((double *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;

  v3 = -[SIRICOMMONStringValue hash](self->_rewrittenUtterance, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    v6 = -score;
    if (score >= 0.0)
      v6 = self->_score;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRICOMMONStringValue *rewrittenUtterance;
  uint64_t v6;
  id v7;

  v4 = a3;
  rewrittenUtterance = self->_rewrittenUtterance;
  v6 = *((_QWORD *)v4 + 2);
  if (rewrittenUtterance)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[SIRICOMMONStringValue mergeFrom:](rewrittenUtterance, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[SIRINLUEXTERNALRewrittenUtterance setRewrittenUtterance:](self, "setRewrittenUtterance:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_score = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (SIRICOMMONStringValue)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)setRewrittenUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, a3);
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
}

@end
