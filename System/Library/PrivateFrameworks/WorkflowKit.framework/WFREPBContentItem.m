@implementation WFREPBContentItem

- (id)encodingTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Protobuf");
  if (a3 == 2)
  {
    v3 = CFSTR("NSSecureCoding");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsEncodingType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Protobuf")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("NSSecureCoding")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)WFREPBContentItem;
  -[WFREPBContentItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBContentItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *item;
  int encodingType;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  item = self->_item;
  if (item)
    objc_msgSend(v3, "setObject:forKey:", item, CFSTR("item"));
  encodingType = self->_encodingType;
  if (encodingType == 1)
  {
    v7 = CFSTR("Protobuf");
  }
  else if (encodingType == 2)
  {
    v7 = CFSTR("NSSecureCoding");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_encodingType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("encodingType"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBContentItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_item)
    __assert_rtn("-[WFREPBContentItem writeTo:]", "WFREPBContentItem.m", 87, "nil != self->_item");
  v5 = v4;
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  NSData *item;
  _DWORD *v5;

  item = self->_item;
  v5 = a3;
  objc_msgSend(v5, "setItem:", item);
  v5[2] = self->_encodingType;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_item, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_encodingType;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *item;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((item = self->_item, !((unint64_t)item | *((_QWORD *)v4 + 2)))
     || -[NSData isEqual:](item, "isEqual:"))
    && self->_encodingType == *((_DWORD *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_encodingType) ^ -[NSData hash](self->_item, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[WFREPBContentItem setItem:](self, "setItem:");
    v4 = v5;
  }
  self->_encodingType = v4[2];

}

- (NSData)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (int)encodingType
{
  return self->_encodingType;
}

- (void)setEncodingType:(int)a3
{
  self->_encodingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
