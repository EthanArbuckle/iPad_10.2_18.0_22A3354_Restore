@implementation SIRINLUEXTERNALAsrAlternative

- (BOOL)hasAlternative
{
  return self->_alternative != 0;
}

- (BOOL)hasProbability
{
  return self->_probability != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALAsrAlternative;
  -[SIRINLUEXTERNALAsrAlternative description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALAsrAlternative dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *alternative;
  SIRICOMMONFloatValue *probability;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  alternative = self->_alternative;
  if (alternative)
    objc_msgSend(v3, "setObject:forKey:", alternative, CFSTR("alternative"));
  probability = self->_probability;
  if (probability)
  {
    -[SIRICOMMONFloatValue dictionaryRepresentation](probability, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("probability"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALAsrAlternativeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_alternative)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_probability)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_alternative)
  {
    objc_msgSend(v4, "setAlternative:");
    v4 = v5;
  }
  if (self->_probability)
  {
    objc_msgSend(v5, "setProbability:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_alternative, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SIRICOMMONFloatValue copyWithZone:](self->_probability, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *alternative;
  SIRICOMMONFloatValue *probability;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((alternative = self->_alternative, !((unint64_t)alternative | v4[1]))
     || -[NSString isEqual:](alternative, "isEqual:")))
  {
    probability = self->_probability;
    if ((unint64_t)probability | v4[2])
      v7 = -[SIRICOMMONFloatValue isEqual:](probability, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_alternative, "hash");
  return -[SIRICOMMONFloatValue hash](self->_probability, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRICOMMONFloatValue *probability;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[SIRINLUEXTERNALAsrAlternative setAlternative:](self, "setAlternative:");
    v4 = v7;
  }
  probability = self->_probability;
  v6 = v4[2];
  if (probability)
  {
    if (v6)
    {
      -[SIRICOMMONFloatValue mergeFrom:](probability, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALAsrAlternative setProbability:](self, "setProbability:");
    goto LABEL_8;
  }

}

- (NSString)alternative
{
  return self->_alternative;
}

- (void)setAlternative:(id)a3
{
  objc_storeStrong((id *)&self->_alternative, a3);
}

- (SIRICOMMONFloatValue)probability
{
  return self->_probability;
}

- (void)setProbability:(id)a3
{
  objc_storeStrong((id *)&self->_probability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_alternative, 0);
}

@end
