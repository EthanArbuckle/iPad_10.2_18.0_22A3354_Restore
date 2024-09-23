@implementation RRSchemaProvisionalRRGroupIdentifier

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (void)setSeq:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_seq = a3;
}

- (BOOL)hasSeq
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSeq:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRGroupIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RRSchemaProvisionalRRGroupIdentifier groupId](self, "groupId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int seq;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[RRSchemaProvisionalRRGroupIdentifier groupId](self, "groupId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[RRSchemaProvisionalRRGroupIdentifier groupId](self, "groupId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RRSchemaProvisionalRRGroupIdentifier groupId](self, "groupId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((v4[20] & 1) != (*(_BYTE *)&self->_has & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    seq = self->_seq;
    if (seq != objc_msgSend(v4, "seq"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_groupId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_seq;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_groupId)
  {
    -[RRSchemaProvisionalRRGroupIdentifier groupId](self, "groupId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("groupId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[RRSchemaProvisionalRRGroupIdentifier seq](self, "seq"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("seq"));

  }
  -[RRSchemaProvisionalRRGroupIdentifier willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaProvisionalRRGroupIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (RRSchemaProvisionalRRGroupIdentifier)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaProvisionalRRGroupIdentifier *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[RRSchemaProvisionalRRGroupIdentifier initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaProvisionalRRGroupIdentifier)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaProvisionalRRGroupIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  RRSchemaProvisionalRRGroupIdentifier *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RRSchemaProvisionalRRGroupIdentifier;
  v5 = -[RRSchemaProvisionalRRGroupIdentifier init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[RRSchemaProvisionalRRGroupIdentifier setGroupId:](v5, "setGroupId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seq"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RRSchemaProvisionalRRGroupIdentifier setSeq:](v5, "setSeq:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)seq
{
  return self->_seq;
}

- (void)setHasGroupId:(BOOL)a3
{
  self->_hasGroupId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
}

@end
