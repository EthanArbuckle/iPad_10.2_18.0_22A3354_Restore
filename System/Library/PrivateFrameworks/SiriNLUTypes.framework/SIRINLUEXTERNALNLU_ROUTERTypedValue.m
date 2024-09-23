@implementation SIRINLUEXTERNALNLU_ROUTERTypedValue

- (BOOL)hasPrimitive
{
  return self->_primitive != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERTypedValue;
  -[SIRINLUEXTERNALNLU_ROUTERTypedValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERTypedValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *primitive;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  primitive = self->_primitive;
  if (primitive)
  {
    -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue dictionaryRepresentation](primitive, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("primitive"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERTypedValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_primitive)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *primitive;

  primitive = self->_primitive;
  if (primitive)
    objc_msgSend(a3, "setPrimitive:", primitive);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue copyWithZone:](self->_primitive, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *primitive;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    primitive = self->_primitive;
    if ((unint64_t)primitive | v4[1])
      v6 = -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue isEqual:](primitive, "isEqual:");
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
  return -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue hash](self->_primitive, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *primitive;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  primitive = self->_primitive;
  v6 = v4[1];
  if (primitive)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue mergeFrom:](primitive, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUEXTERNALNLU_ROUTERTypedValue setPrimitive:](self, "setPrimitive:");
    goto LABEL_6;
  }

}

- (SIRINLUEXTERNALNLU_ROUTERPrimitiveValue)primitive
{
  return self->_primitive;
}

- (void)setPrimitive:(id)a3
{
  objc_storeStrong((id *)&self->_primitive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitive, 0);
}

@end
