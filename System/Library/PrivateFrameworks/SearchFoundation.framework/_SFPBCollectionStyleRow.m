@implementation _SFPBCollectionStyleRow

- (_SFPBCollectionStyleRow)initWithFacade:(id)a3
{
  id v4;
  _SFPBCollectionStyleRow *v5;
  _SFPBCollectionStyleRow *v6;

  v4 = a3;
  v5 = -[_SFPBCollectionStyleRow init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasDrawPlattersIfNecessary"))
      -[_SFPBCollectionStyleRow setDrawPlattersIfNecessary:](v5, "setDrawPlattersIfNecessary:", objc_msgSend(v4, "drawPlattersIfNecessary"));
    if (objc_msgSend(v4, "hasIsInsetGrouped"))
      -[_SFPBCollectionStyleRow setIsInsetGrouped:](v5, "setIsInsetGrouped:", objc_msgSend(v4, "isInsetGrouped"));
    v6 = v5;
  }

  return v5;
}

- (void)setDrawPlattersIfNecessary:(BOOL)a3
{
  self->_drawPlattersIfNecessary = a3;
}

- (void)setIsInsetGrouped:(BOOL)a3
{
  self->_isInsetGrouped = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleRowReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBCollectionStyleRow drawPlattersIfNecessary](self, "drawPlattersIfNecessary"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCollectionStyleRow isInsetGrouped](self, "isInsetGrouped"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int drawPlattersIfNecessary;
  int isInsetGrouped;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (drawPlattersIfNecessary = self->_drawPlattersIfNecessary,
        drawPlattersIfNecessary == objc_msgSend(v4, "drawPlattersIfNecessary")))
  {
    isInsetGrouped = self->_isInsetGrouped;
    v7 = isInsetGrouped == objc_msgSend(v4, "isInsetGrouped");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = 2654435761;
  if (self->_drawPlattersIfNecessary)
    v3 = 2654435761;
  else
    v3 = 0;
  if (!self->_isInsetGrouped)
    v2 = 0;
  return v2 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_drawPlattersIfNecessary)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCollectionStyleRow drawPlattersIfNecessary](self, "drawPlattersIfNecessary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("drawPlattersIfNecessary"));

  }
  if (self->_isInsetGrouped)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCollectionStyleRow isInsetGrouped](self, "isInsetGrouped"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isInsetGrouped"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCollectionStyleRow dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCollectionStyleRow)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCollectionStyleRow *v5;
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
    self = -[_SFPBCollectionStyleRow initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCollectionStyleRow)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCollectionStyleRow *v5;
  void *v6;
  void *v7;
  _SFPBCollectionStyleRow *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBCollectionStyleRow;
  v5 = -[_SFPBCollectionStyleRow init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("drawPlattersIfNecessary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCollectionStyleRow setDrawPlattersIfNecessary:](v5, "setDrawPlattersIfNecessary:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInsetGrouped"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCollectionStyleRow setIsInsetGrouped:](v5, "setIsInsetGrouped:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (BOOL)drawPlattersIfNecessary
{
  return self->_drawPlattersIfNecessary;
}

- (BOOL)isInsetGrouped
{
  return self->_isInsetGrouped;
}

@end
