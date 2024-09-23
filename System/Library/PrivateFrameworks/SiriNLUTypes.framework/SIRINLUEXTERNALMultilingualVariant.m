@implementation SIRINLUEXTERNALMultilingualVariant

- (BOOL)hasLanguageVariantName
{
  return self->_languageVariantName != 0;
}

- (void)setLanguageVariantScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_languageVariantScore = a3;
}

- (void)setHasLanguageVariantScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLanguageVariantScore
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
  v8.super_class = (Class)SIRINLUEXTERNALMultilingualVariant;
  -[SIRINLUEXTERNALMultilingualVariant description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALMultilingualVariant dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *languageVariantName;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  languageVariantName = self->_languageVariantName;
  if (languageVariantName)
    objc_msgSend(v3, "setObject:forKey:", languageVariantName, CFSTR("language_variant_name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_languageVariantScore);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("language_variant_score"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALMultilingualVariantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_languageVariantName)
  {
    PBDataWriterWriteStringField();
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
  if (self->_languageVariantName)
  {
    v5 = v4;
    objc_msgSend(v4, "setLanguageVariantName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_languageVariantScore;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_languageVariantName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_languageVariantScore;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *languageVariantName;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  languageVariantName = self->_languageVariantName;
  if ((unint64_t)languageVariantName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](languageVariantName, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_languageVariantScore == *((double *)v4 + 1))
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
  NSUInteger v3;
  unint64_t v4;
  double languageVariantScore;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_languageVariantName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    languageVariantScore = self->_languageVariantScore;
    v6 = -languageVariantScore;
    if (languageVariantScore >= 0.0)
      v6 = self->_languageVariantScore;
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
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[SIRINLUEXTERNALMultilingualVariant setLanguageVariantName:](self, "setLanguageVariantName:");
    v4 = v5;
  }
  if (((_BYTE)v4[3] & 1) != 0)
  {
    self->_languageVariantScore = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)languageVariantName
{
  return self->_languageVariantName;
}

- (void)setLanguageVariantName:(id)a3
{
  objc_storeStrong((id *)&self->_languageVariantName, a3);
}

- (double)languageVariantScore
{
  return self->_languageVariantScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageVariantName, 0);
}

@end
