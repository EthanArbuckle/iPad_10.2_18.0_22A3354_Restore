@implementation HVPBDeprecatedContentStateEntry

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HVPBDeprecatedContentStateEntry;
  -[HVPBDeprecatedContentStateEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HVPBDeprecatedContentStateEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueId;
  HVPBContentState *state;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId)
    objc_msgSend(v3, "setObject:forKey:", uniqueId, CFSTR("uniqueId"));
  state = self->_state;
  if (state)
  {
    -[HVPBContentState dictionaryRepresentation](state, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("state"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HVPBDeprecatedContentStateEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_state)
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
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    v4 = v5;
  }
  if (self->_state)
  {
    objc_msgSend(v5, "setState:");
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
  v6 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HVPBContentState copyWithZone:](self->_state, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uniqueId;
  HVPBContentState *state;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uniqueId = self->_uniqueId, !((unint64_t)uniqueId | v4[2]))
     || -[NSString isEqual:](uniqueId, "isEqual:")))
  {
    state = self->_state;
    if ((unint64_t)state | v4[1])
      v7 = -[HVPBContentState isEqual:](state, "isEqual:");
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

  v3 = -[NSString hash](self->_uniqueId, "hash");
  return -[HVPBContentState hash](self->_state, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HVPBContentState *state;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HVPBDeprecatedContentStateEntry setUniqueId:](self, "setUniqueId:");
    v4 = v7;
  }
  state = self->_state;
  v6 = v4[1];
  if (state)
  {
    if (v6)
    {
      -[HVPBContentState mergeFrom:](state, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HVPBDeprecatedContentStateEntry setState:](self, "setState:");
    goto LABEL_8;
  }

}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (HVPBContentState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
