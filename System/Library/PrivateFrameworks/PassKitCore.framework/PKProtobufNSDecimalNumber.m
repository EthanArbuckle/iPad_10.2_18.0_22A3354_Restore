@implementation PKProtobufNSDecimalNumber

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufNSDecimalNumber;
  -[PKProtobufNSDecimalNumber description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufNSDecimalNumber dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  NSData *mantissa;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_exponent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("exponent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("length"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_isNegative);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isNegative"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_isCompact);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isCompact"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_reserved);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("reserved"));

  mantissa = self->_mantissa;
  if (mantissa)
    objc_msgSend(v3, "setObject:forKey:", mantissa, CFSTR("mantissa"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufNSDecimalNumberReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteSint32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 9) = self->_version;
  *((_DWORD *)a3 + 2) = self->_exponent;
  *((_DWORD *)a3 + 5) = self->_length;
  *((_DWORD *)a3 + 4) = self->_isNegative;
  *((_DWORD *)a3 + 3) = self->_isCompact;
  *((_DWORD *)a3 + 8) = self->_reserved;
  objc_msgSend(a3, "setMantissa:", self->_mantissa);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 36) = self->_version;
  *(_DWORD *)(v5 + 8) = self->_exponent;
  *(_DWORD *)(v5 + 20) = self->_length;
  *(_DWORD *)(v5 + 16) = self->_isNegative;
  *(_DWORD *)(v5 + 12) = self->_isCompact;
  *(_DWORD *)(v5 + 32) = self->_reserved;
  v6 = -[NSData copyWithZone:](self->_mantissa, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *mantissa;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_version == *((_DWORD *)v4 + 9)
    && self->_exponent == *((_DWORD *)v4 + 2)
    && self->_length == *((_DWORD *)v4 + 5)
    && self->_isNegative == *((_DWORD *)v4 + 4)
    && self->_isCompact == *((_DWORD *)v4 + 3)
    && self->_reserved == *((_DWORD *)v4 + 8))
  {
    mantissa = self->_mantissa;
    if ((unint64_t)mantissa | v4[3])
      v6 = -[NSData isEqual:](mantissa, "isEqual:");
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
  uint64_t v2;
  uint64_t v3;

  v2 = (2654435761 * self->_exponent) ^ (2654435761 * self->_version) ^ (2654435761 * self->_length) ^ (2654435761 * self->_isNegative);
  v3 = (2654435761 * self->_isCompact) ^ (2654435761 * self->_reserved);
  return v2 ^ v3 ^ -[NSData hash](self->_mantissa, "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_version = *((_DWORD *)a3 + 9);
  self->_exponent = *((_DWORD *)a3 + 2);
  self->_length = *((_DWORD *)a3 + 5);
  self->_isNegative = *((_DWORD *)a3 + 4);
  self->_isCompact = *((_DWORD *)a3 + 3);
  self->_reserved = *((_DWORD *)a3 + 8);
  if (*((_QWORD *)a3 + 3))
    -[PKProtobufNSDecimalNumber setMantissa:](self, "setMantissa:");
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (int)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int)a3
{
  self->_exponent = a3;
}

- (int)length
{
  return self->_length;
}

- (void)setLength:(int)a3
{
  self->_length = a3;
}

- (int)isNegative
{
  return self->_isNegative;
}

- (void)setIsNegative:(int)a3
{
  self->_isNegative = a3;
}

- (int)isCompact
{
  return self->_isCompact;
}

- (void)setIsCompact:(int)a3
{
  self->_isCompact = a3;
}

- (int)reserved
{
  return self->_reserved;
}

- (void)setReserved:(int)a3
{
  self->_reserved = a3;
}

- (NSData)mantissa
{
  return self->_mantissa;
}

- (void)setMantissa:(id)a3
{
  objc_storeStrong((id *)&self->_mantissa, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mantissa, 0);
}

@end
