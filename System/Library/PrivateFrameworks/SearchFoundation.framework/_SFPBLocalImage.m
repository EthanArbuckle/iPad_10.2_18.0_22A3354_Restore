@implementation _SFPBLocalImage

- (_SFPBLocalImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBLocalImage *v5;
  _SFPBLocalImage *v6;

  v4 = a3;
  v5 = -[_SFPBLocalImage init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasLocalImageType"))
      -[_SFPBLocalImage setLocalImageType:](v5, "setLocalImageType:", objc_msgSend(v4, "localImageType"));
    v6 = v5;
  }

  return v5;
}

- (void)setLocalImageType:(int)a3
{
  self->_localImageType = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLocalImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBLocalImage localImageType](self, "localImageType"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int localImageType;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    localImageType = self->_localImageType;
    v6 = localImageType == objc_msgSend(v4, "localImageType");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761 * self->_localImageType;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_localImageType)
  {
    v4 = -[_SFPBLocalImage localImageType](self, "localImageType");
    if (v4 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042078 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("localImageType"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBLocalImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBLocalImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBLocalImage *v5;
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
    self = -[_SFPBLocalImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBLocalImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBLocalImage *v5;
  void *v6;
  _SFPBLocalImage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBLocalImage;
  v5 = -[_SFPBLocalImage init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localImageType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBLocalImage setLocalImageType:](v5, "setLocalImageType:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)localImageType
{
  return self->_localImageType;
}

@end
