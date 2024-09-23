@implementation _ICLLRadioSource

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLRadioSource;
  -[_ICLLRadioSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLRadioSource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *stationId;
  _ICLLRadioSeed *seed;
  void *v7;
  NSString *featureName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  stationId = self->_stationId;
  if (stationId)
    objc_msgSend(v3, "setObject:forKey:", stationId, CFSTR("stationId"));
  seed = self->_seed;
  if (seed)
  {
    -[_ICLLRadioSeed dictionaryRepresentation](seed, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("seed"));

  }
  featureName = self->_featureName;
  if (featureName)
    objc_msgSend(v4, "setObject:forKey:", featureName, CFSTR("featureName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLRadioSourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_stationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_seed)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
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
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stationId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[_ICLLRadioSeed copyWithZone:](self->_seed, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_featureName, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *stationId;
  _ICLLRadioSeed *seed;
  NSString *featureName;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((stationId = self->_stationId, !((unint64_t)stationId | v4[3]))
     || -[NSString isEqual:](stationId, "isEqual:"))
    && ((seed = self->_seed, !((unint64_t)seed | v4[2])) || -[_ICLLRadioSeed isEqual:](seed, "isEqual:")))
  {
    featureName = self->_featureName;
    if ((unint64_t)featureName | v4[1])
      v8 = -[NSString isEqual:](featureName, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_stationId, "hash");
  v4 = -[_ICLLRadioSeed hash](self->_seed, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_featureName, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationId, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
