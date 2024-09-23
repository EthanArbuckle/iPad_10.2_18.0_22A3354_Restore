@implementation _SFPBScene

- (_SFPBScene)initWithFacade:(id)a3
{
  id v4;
  _SFPBScene *v5;
  _SFPBScene *v6;

  v4 = a3;
  v5 = -[_SFPBScene init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasSceneIdentifier"))
      -[_SFPBScene setSceneIdentifier:](v5, "setSceneIdentifier:", objc_msgSend(v4, "sceneIdentifier"));
    if (objc_msgSend(v4, "hasSceneType"))
      -[_SFPBScene setSceneType:](v5, "setSceneType:", objc_msgSend(v4, "sceneType"));
    v6 = v5;
  }

  return v5;
}

- (void)setSceneIdentifier:(unint64_t)a3
{
  self->_sceneIdentifier = a3;
}

- (void)setSceneType:(int)a3
{
  self->_sceneType = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSceneReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBScene sceneIdentifier](self, "sceneIdentifier"))
    PBDataWriterWriteUint64Field();
  if (-[_SFPBScene sceneType](self, "sceneType"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t sceneIdentifier;
  int sceneType;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (sceneIdentifier = self->_sceneIdentifier, sceneIdentifier == objc_msgSend(v4, "sceneIdentifier")))
  {
    sceneType = self->_sceneType;
    v7 = sceneType == objc_msgSend(v4, "sceneType");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_sceneType) ^ (2654435761u * self->_sceneIdentifier);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_sceneIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBScene sceneIdentifier](self, "sceneIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sceneIdentifier"));

  }
  if (self->_sceneType)
  {
    v5 = -[_SFPBScene sceneType](self, "sceneType");
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(&off_1E4042190 + v5);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sceneType"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBScene dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBScene)initWithJSON:(id)a3
{
  void *v4;
  _SFPBScene *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBScene initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBScene)initWithDictionary:(id)a3
{
  id v4;
  _SFPBScene *v5;
  void *v6;
  void *v7;
  _SFPBScene *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBScene;
  v5 = -[_SFPBScene init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBScene setSceneIdentifier:](v5, "setSceneIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBScene setSceneType:](v5, "setSceneType:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (int)sceneType
{
  return self->_sceneType;
}

@end
