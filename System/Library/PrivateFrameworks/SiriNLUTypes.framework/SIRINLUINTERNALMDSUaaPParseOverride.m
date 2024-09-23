@implementation SIRINLUINTERNALMDSUaaPParseOverride

- (BOOL)hasParseOverride
{
  return self->_parseOverride != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALMDSUaaPParseOverride;
  -[SIRINLUINTERNALMDSUaaPParseOverride description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALMDSUaaPParseOverride dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALParseOverride *parseOverride;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  parseOverride = self->_parseOverride;
  if (parseOverride)
  {
    -[SIRINLUINTERNALParseOverride dictionaryRepresentation](parseOverride, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("parse_override"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMDSUaaPParseOverrideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_parseOverride)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUINTERNALParseOverride *parseOverride;

  parseOverride = self->_parseOverride;
  if (parseOverride)
    objc_msgSend(a3, "setParseOverride:", parseOverride);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALParseOverride copyWithZone:](self->_parseOverride, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALParseOverride *parseOverride;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    parseOverride = self->_parseOverride;
    if ((unint64_t)parseOverride | v4[1])
      v6 = -[SIRINLUINTERNALParseOverride isEqual:](parseOverride, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[SIRINLUINTERNALParseOverride hash](self->_parseOverride, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALParseOverride *parseOverride;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  parseOverride = self->_parseOverride;
  v6 = v4[1];
  if (parseOverride)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUINTERNALParseOverride mergeFrom:](parseOverride, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUINTERNALMDSUaaPParseOverride setParseOverride:](self, "setParseOverride:");
    goto LABEL_6;
  }

}

- (SIRINLUINTERNALParseOverride)parseOverride
{
  return self->_parseOverride;
}

- (void)setParseOverride:(id)a3
{
  objc_storeStrong((id *)&self->_parseOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseOverride, 0);
}

@end
