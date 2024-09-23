@implementation PPPBExperimentalGroup

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasAbGroupIdentifier
{
  return self->_abGroupIdentifier != 0;
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
  v8.super_class = (Class)PPPBExperimentalGroup;
  -[PPPBExperimentalGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBExperimentalGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *experimentId;
  NSString *abGroupIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v3, "setObject:forKey:", experimentId, CFSTR("experimentId"));
  abGroupIdentifier = self->_abGroupIdentifier;
  if (abGroupIdentifier)
    objc_msgSend(v4, "setObject:forKey:", abGroupIdentifier, CFSTR("abGroupIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBExperimentalGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_abGroupIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    v4 = v5;
  }
  if (self->_abGroupIdentifier)
  {
    objc_msgSend(v5, "setAbGroupIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_abGroupIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *experimentId;
  NSString *abGroupIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((experimentId = self->_experimentId, !((unint64_t)experimentId | v4[2]))
     || -[NSString isEqual:](experimentId, "isEqual:")))
  {
    abGroupIdentifier = self->_abGroupIdentifier;
    if ((unint64_t)abGroupIdentifier | v4[1])
      v7 = -[NSString isEqual:](abGroupIdentifier, "isEqual:");
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

  v3 = -[NSString hash](self->_experimentId, "hash");
  return -[NSString hash](self->_abGroupIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[PPPBExperimentalGroup setExperimentId:](self, "setExperimentId:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[PPPBExperimentalGroup setAbGroupIdentifier:](self, "setAbGroupIdentifier:");
    v4 = v5;
  }

}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSString)abGroupIdentifier
{
  return self->_abGroupIdentifier;
}

- (void)setAbGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_abGroupIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifier, 0);
}

@end
