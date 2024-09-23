@implementation PBBProtoHandshake

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoHandshake;
  -[PBBProtoHandshake description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoHandshake dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_position);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("position"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("state"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoHandshakeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_position;
  *((_DWORD *)a3 + 4) = self->_version;
  *((_DWORD *)a3 + 3) = self->_state;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_position;
  *((_DWORD *)result + 4) = self->_version;
  *((_DWORD *)result + 3) = self->_state;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_position == v4[2]
    && self->_version == v4[4]
    && self->_state == v4[3];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_version) ^ (2654435761 * self->_position) ^ (2654435761 * self->_state);
}

- (void)mergeFrom:(id)a3
{
  self->_position = *((_DWORD *)a3 + 2);
  self->_version = *((_DWORD *)a3 + 4);
  self->_state = *((_DWORD *)a3 + 3);
}

- (unsigned)position
{
  return self->_position;
}

- (void)setPosition:(unsigned int)a3
{
  self->_position = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

@end
