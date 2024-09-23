@implementation SIRINLUINTERNALLVCOverrideValue

- (BOOL)hasLvcValue
{
  return self->_lvcValue != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALLVCOverrideValue;
  -[SIRINLUINTERNALLVCOverrideValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALLVCOverrideValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALMultilingualVariant *lvcValue;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  lvcValue = self->_lvcValue;
  if (lvcValue)
  {
    -[SIRINLUEXTERNALMultilingualVariant dictionaryRepresentation](lvcValue, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("lvc_value"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALLVCOverrideValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_lvcValue)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUEXTERNALMultilingualVariant *lvcValue;

  lvcValue = self->_lvcValue;
  if (lvcValue)
    objc_msgSend(a3, "setLvcValue:", lvcValue);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALMultilingualVariant copyWithZone:](self->_lvcValue, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALMultilingualVariant *lvcValue;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    lvcValue = self->_lvcValue;
    if ((unint64_t)lvcValue | v4[1])
      v6 = -[SIRINLUEXTERNALMultilingualVariant isEqual:](lvcValue, "isEqual:");
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
  return -[SIRINLUEXTERNALMultilingualVariant hash](self->_lvcValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALMultilingualVariant *lvcValue;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  lvcValue = self->_lvcValue;
  v6 = v4[1];
  if (lvcValue)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUEXTERNALMultilingualVariant mergeFrom:](lvcValue, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUINTERNALLVCOverrideValue setLvcValue:](self, "setLvcValue:");
    goto LABEL_6;
  }

}

- (SIRINLUEXTERNALMultilingualVariant)lvcValue
{
  return self->_lvcValue;
}

- (void)setLvcValue:(id)a3
{
  objc_storeStrong((id *)&self->_lvcValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lvcValue, 0);
}

@end
