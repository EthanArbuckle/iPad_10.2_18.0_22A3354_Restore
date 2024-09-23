@implementation _SFPBCollectionStyleGrid

- (_SFPBCollectionStyleGrid)initWithFacade:(id)a3
{
  id v4;
  _SFPBCollectionStyleGrid *v5;
  _SFPBCollectionStyleGrid *v6;

  v4 = a3;
  v5 = -[_SFPBCollectionStyleGrid init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasNumberOfColumns"))
      -[_SFPBCollectionStyleGrid setNumberOfColumns:](v5, "setNumberOfColumns:", objc_msgSend(v4, "numberOfColumns"));
    if (objc_msgSend(v4, "hasGridStyle"))
      -[_SFPBCollectionStyleGrid setGridStyle:](v5, "setGridStyle:", objc_msgSend(v4, "gridStyle"));
    v6 = v5;
  }

  return v5;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (void)setGridStyle:(int)a3
{
  self->_gridStyle = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleGridReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBCollectionStyleGrid numberOfColumns](self, "numberOfColumns"))
    PBDataWriterWriteUint64Field();
  if (-[_SFPBCollectionStyleGrid gridStyle](self, "gridStyle"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t numberOfColumns;
  int gridStyle;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (numberOfColumns = self->_numberOfColumns, numberOfColumns == objc_msgSend(v4, "numberOfColumns")))
  {
    gridStyle = self->_gridStyle;
    v7 = gridStyle == objc_msgSend(v4, "gridStyle");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_gridStyle) ^ (2654435761u * self->_numberOfColumns);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_gridStyle)
  {
    v4 = -[_SFPBCollectionStyleGrid gridStyle](self, "gridStyle");
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 == 1)
      {
        v5 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("gridStyle"));

  }
  if (self->_numberOfColumns)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBCollectionStyleGrid numberOfColumns](self, "numberOfColumns"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("numberOfColumns"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCollectionStyleGrid dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCollectionStyleGrid)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCollectionStyleGrid *v5;
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
    self = -[_SFPBCollectionStyleGrid initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCollectionStyleGrid)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCollectionStyleGrid *v5;
  void *v6;
  void *v7;
  _SFPBCollectionStyleGrid *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBCollectionStyleGrid;
  v5 = -[_SFPBCollectionStyleGrid init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfColumns"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCollectionStyleGrid setNumberOfColumns:](v5, "setNumberOfColumns:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gridStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCollectionStyleGrid setGridStyle:](v5, "setGridStyle:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (int)gridStyle
{
  return self->_gridStyle;
}

@end
