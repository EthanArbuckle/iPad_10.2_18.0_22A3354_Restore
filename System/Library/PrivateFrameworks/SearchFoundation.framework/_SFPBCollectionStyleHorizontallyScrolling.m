@implementation _SFPBCollectionStyleHorizontallyScrolling

- (_SFPBCollectionStyleHorizontallyScrolling)initWithFacade:(id)a3
{
  id v4;
  _SFPBCollectionStyleHorizontallyScrolling *v5;
  _SFPBCollectionStyleHorizontallyScrolling *v6;

  v4 = a3;
  v5 = -[_SFPBCollectionStyleHorizontallyScrolling init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasNumberOfRows"))
      -[_SFPBCollectionStyleHorizontallyScrolling setNumberOfRows:](v5, "setNumberOfRows:", objc_msgSend(v4, "numberOfRows"));
    v6 = v5;
  }

  return v5;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleHorizontallyScrollingReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBCollectionStyleHorizontallyScrolling numberOfRows](self, "numberOfRows"))
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t numberOfRows;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    numberOfRows = self->_numberOfRows;
    v6 = numberOfRows == objc_msgSend(v4, "numberOfRows");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761u * self->_numberOfRows;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numberOfRows)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBCollectionStyleHorizontallyScrolling numberOfRows](self, "numberOfRows"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfRows"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCollectionStyleHorizontallyScrolling dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCollectionStyleHorizontallyScrolling)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCollectionStyleHorizontallyScrolling *v5;
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
    self = -[_SFPBCollectionStyleHorizontallyScrolling initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCollectionStyleHorizontallyScrolling)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCollectionStyleHorizontallyScrolling *v5;
  void *v6;
  _SFPBCollectionStyleHorizontallyScrolling *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBCollectionStyleHorizontallyScrolling;
  v5 = -[_SFPBCollectionStyleHorizontallyScrolling init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfRows"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCollectionStyleHorizontallyScrolling setNumberOfRows:](v5, "setNumberOfRows:", objc_msgSend(v6, "unsignedLongLongValue"));
    v7 = v5;

  }
  return v5;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

@end
