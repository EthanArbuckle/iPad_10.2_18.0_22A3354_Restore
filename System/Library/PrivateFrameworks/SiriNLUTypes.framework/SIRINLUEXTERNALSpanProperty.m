@implementation SIRINLUEXTERNALSpanProperty

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValueString
{
  return self->_valueString != 0;
}

- (BOOL)hasValueInt
{
  return self->_valueInt != 0;
}

- (BOOL)hasValueFloat
{
  return self->_valueFloat != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALSpanProperty;
  -[SIRINLUEXTERNALSpanProperty description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSpanProperty dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  SIRICOMMONStringValue *valueString;
  void *v7;
  SIRICOMMONInt32Value *valueInt;
  void *v9;
  SIRICOMMONFloatValue *valueFloat;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  valueString = self->_valueString;
  if (valueString)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](valueString, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("value_string"));

  }
  valueInt = self->_valueInt;
  if (valueInt)
  {
    -[SIRICOMMONInt32Value dictionaryRepresentation](valueInt, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("value_int"));

  }
  valueFloat = self->_valueFloat;
  if (valueFloat)
  {
    -[SIRICOMMONFloatValue dictionaryRepresentation](valueFloat, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("value_float"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSpanPropertyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_valueString)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_valueInt)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_valueFloat)
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
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_valueString)
  {
    objc_msgSend(v5, "setValueString:");
    v4 = v5;
  }
  if (self->_valueInt)
  {
    objc_msgSend(v5, "setValueInt:");
    v4 = v5;
  }
  if (self->_valueFloat)
  {
    objc_msgSend(v5, "setValueFloat:");
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
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SIRICOMMONStringValue copyWithZone:](self->_valueString, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[SIRICOMMONInt32Value copyWithZone:](self->_valueInt, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[SIRICOMMONFloatValue copyWithZone:](self->_valueFloat, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  SIRICOMMONStringValue *valueString;
  SIRICOMMONInt32Value *valueInt;
  SIRICOMMONFloatValue *valueFloat;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:"))
    && ((valueString = self->_valueString, !((unint64_t)valueString | v4[4]))
     || -[SIRICOMMONStringValue isEqual:](valueString, "isEqual:"))
    && ((valueInt = self->_valueInt, !((unint64_t)valueInt | v4[3]))
     || -[SIRICOMMONInt32Value isEqual:](valueInt, "isEqual:")))
  {
    valueFloat = self->_valueFloat;
    if ((unint64_t)valueFloat | v4[2])
      v9 = -[SIRICOMMONFloatValue isEqual:](valueFloat, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[SIRICOMMONStringValue hash](self->_valueString, "hash") ^ v3;
  v5 = -[SIRICOMMONInt32Value hash](self->_valueInt, "hash");
  return v4 ^ v5 ^ -[SIRICOMMONFloatValue hash](self->_valueFloat, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRICOMMONStringValue *valueString;
  uint64_t v6;
  SIRICOMMONInt32Value *valueInt;
  uint64_t v8;
  SIRICOMMONFloatValue *valueFloat;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  v11 = v4;
  if (v4[1])
  {
    -[SIRINLUEXTERNALSpanProperty setKey:](self, "setKey:");
    v4 = v11;
  }
  valueString = self->_valueString;
  v6 = v4[4];
  if (valueString)
  {
    if (!v6)
      goto LABEL_9;
    -[SIRICOMMONStringValue mergeFrom:](valueString, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[SIRINLUEXTERNALSpanProperty setValueString:](self, "setValueString:");
  }
  v4 = v11;
LABEL_9:
  valueInt = self->_valueInt;
  v8 = v4[3];
  if (valueInt)
  {
    if (!v8)
      goto LABEL_15;
    -[SIRICOMMONInt32Value mergeFrom:](valueInt, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[SIRINLUEXTERNALSpanProperty setValueInt:](self, "setValueInt:");
  }
  v4 = v11;
LABEL_15:
  valueFloat = self->_valueFloat;
  v10 = v4[2];
  if (valueFloat)
  {
    if (v10)
    {
      -[SIRICOMMONFloatValue mergeFrom:](valueFloat, "mergeFrom:");
LABEL_20:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALSpanProperty setValueFloat:](self, "setValueFloat:");
    goto LABEL_20;
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (SIRICOMMONStringValue)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
  objc_storeStrong((id *)&self->_valueString, a3);
}

- (SIRICOMMONInt32Value)valueInt
{
  return self->_valueInt;
}

- (void)setValueInt:(id)a3
{
  objc_storeStrong((id *)&self->_valueInt, a3);
}

- (SIRICOMMONFloatValue)valueFloat
{
  return self->_valueFloat;
}

- (void)setValueFloat:(id)a3
{
  objc_storeStrong((id *)&self->_valueFloat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_valueInt, 0);
  objc_storeStrong((id *)&self->_valueFloat, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
