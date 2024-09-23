@implementation PETRawMessage

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_rawBytes)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawBytes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setTypeId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_typeId = a3;
}

- (void)setRawBytes:(id)a3
{
  objc_storeStrong((id *)&self->_rawBytes, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setHasTypeId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTypeId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRawBytes
{
  return self->_rawBytes != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
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
  v8.super_class = (Class)PETRawMessage;
  -[PETRawMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETRawMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *rawBytes;
  NSString *name;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_typeId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type_id"));

  }
  rawBytes = self->_rawBytes;
  if (rawBytes)
    objc_msgSend(v3, "setObject:forKey:", rawBytes, CFSTR("raw_bytes"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PETRawMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_typeId;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_rawBytes)
  {
    objc_msgSend(v4, "setRawBytes:");
    v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_typeId;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_rawBytes, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *rawBytes;
  NSString *name;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_typeId != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  rawBytes = self->_rawBytes;
  if ((unint64_t)rawBytes | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](rawBytes, "isEqual:"))
    goto LABEL_11;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](name, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_typeId;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_rawBytes, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_name, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[7] & 1) != 0)
  {
    self->_typeId = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PETRawMessage setRawBytes:](self, "setRawBytes:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PETRawMessage setName:](self, "setName:");
    v4 = v5;
  }

}

- (unsigned)typeId
{
  return self->_typeId;
}

- (NSData)rawBytes
{
  return self->_rawBytes;
}

- (NSString)name
{
  return self->_name;
}

@end
