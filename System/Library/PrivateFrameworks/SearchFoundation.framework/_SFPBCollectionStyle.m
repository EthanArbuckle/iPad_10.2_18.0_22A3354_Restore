@implementation _SFPBCollectionStyle

- (_SFPBCollectionStyle)initWithFacade:(id)a3
{
  id v4;
  _SFPBCollectionStyle *v5;
  _SFPBCollectionStyleRow *v6;
  _SFPBCollectionStyleGrid *v7;
  _SFPBCollectionStyleHorizontallyScrolling *v8;
  _SFPBCollectionStyle *v9;

  v4 = a3;
  v5 = -[_SFPBCollectionStyle init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasInitiallyVisibleCardSectionCount"))
      -[_SFPBCollectionStyle setInitiallyVisibleCardSectionCount:](v5, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v4, "initiallyVisibleCardSectionCount"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[_SFPBCollectionStyleRow initWithFacade:]([_SFPBCollectionStyleRow alloc], "initWithFacade:", v4);
      -[_SFPBCollectionStyle setCollectionStyleRow:](v5, "setCollectionStyleRow:", v6);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCollectionStyleGrid initWithFacade:]([_SFPBCollectionStyleGrid alloc], "initWithFacade:", v4);
      -[_SFPBCollectionStyle setCollectionStyleGrid:](v5, "setCollectionStyleGrid:", v7);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[_SFPBCollectionStyleHorizontallyScrolling initWithFacade:]([_SFPBCollectionStyleHorizontallyScrolling alloc], "initWithFacade:", v4);
      -[_SFPBCollectionStyle setCollectionStyleScrolling:](v5, "setCollectionStyleScrolling:", v8);

    }
    v9 = v5;
  }

  return v5;
}

- (void)setCollectionStyleRow:(id)a3
{
  _SFPBCollectionStyleRow *v4;
  _SFPBCollectionStyleGrid *collectionStyleGrid;
  _SFPBCollectionStyleHorizontallyScrolling *collectionStyleScrolling;
  _SFPBCollectionStyleRow *collectionStyleRow;

  v4 = (_SFPBCollectionStyleRow *)a3;
  collectionStyleGrid = self->_collectionStyleGrid;
  self->_collectionStyleGrid = 0;

  collectionStyleScrolling = self->_collectionStyleScrolling;
  self->_collectionStyleScrolling = 0;

  self->_whichValue = v4 != 0;
  collectionStyleRow = self->_collectionStyleRow;
  self->_collectionStyleRow = v4;

}

- (_SFPBCollectionStyleRow)collectionStyleRow
{
  if (self->_whichValue == 1)
    return self->_collectionStyleRow;
  else
    return (_SFPBCollectionStyleRow *)0;
}

- (void)setCollectionStyleGrid:(id)a3
{
  _SFPBCollectionStyleGrid *v4;
  _SFPBCollectionStyleRow *collectionStyleRow;
  _SFPBCollectionStyleHorizontallyScrolling *collectionStyleScrolling;
  _SFPBCollectionStyleGrid *collectionStyleGrid;

  v4 = (_SFPBCollectionStyleGrid *)a3;
  collectionStyleRow = self->_collectionStyleRow;
  self->_collectionStyleRow = 0;

  collectionStyleScrolling = self->_collectionStyleScrolling;
  self->_collectionStyleScrolling = 0;

  self->_whichValue = 2 * (v4 != 0);
  collectionStyleGrid = self->_collectionStyleGrid;
  self->_collectionStyleGrid = v4;

}

- (_SFPBCollectionStyleGrid)collectionStyleGrid
{
  if (self->_whichValue == 2)
    return self->_collectionStyleGrid;
  else
    return (_SFPBCollectionStyleGrid *)0;
}

- (void)setCollectionStyleScrolling:(id)a3
{
  _SFPBCollectionStyleHorizontallyScrolling *v4;
  _SFPBCollectionStyleRow *collectionStyleRow;
  _SFPBCollectionStyleGrid *collectionStyleGrid;
  unint64_t v7;
  _SFPBCollectionStyleHorizontallyScrolling *collectionStyleScrolling;

  v4 = (_SFPBCollectionStyleHorizontallyScrolling *)a3;
  collectionStyleRow = self->_collectionStyleRow;
  self->_collectionStyleRow = 0;

  collectionStyleGrid = self->_collectionStyleGrid;
  self->_collectionStyleGrid = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichValue = v7;
  collectionStyleScrolling = self->_collectionStyleScrolling;
  self->_collectionStyleScrolling = v4;

}

- (_SFPBCollectionStyleHorizontallyScrolling)collectionStyleScrolling
{
  if (self->_whichValue == 3)
    return self->_collectionStyleScrolling;
  else
    return (_SFPBCollectionStyleHorizontallyScrolling *)0;
}

- (void)setInitiallyVisibleCardSectionCount:(unsigned int)a3
{
  self->_initiallyVisibleCardSectionCount = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBCollectionStyle collectionStyleRow](self, "collectionStyleRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBCollectionStyle collectionStyleGrid](self, "collectionStyleGrid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBCollectionStyle collectionStyleScrolling](self, "collectionStyleScrolling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  v7 = -[_SFPBCollectionStyle initiallyVisibleCardSectionCount](self, "initiallyVisibleCardSectionCount");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteUint32Field();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  unsigned int initiallyVisibleCardSectionCount;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBCollectionStyle collectionStyleRow](self, "collectionStyleRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionStyleRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBCollectionStyle collectionStyleRow](self, "collectionStyleRow");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCollectionStyle collectionStyleRow](self, "collectionStyleRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionStyleRow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBCollectionStyle collectionStyleGrid](self, "collectionStyleGrid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionStyleGrid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBCollectionStyle collectionStyleGrid](self, "collectionStyleGrid");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCollectionStyle collectionStyleGrid](self, "collectionStyleGrid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionStyleGrid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBCollectionStyle collectionStyleScrolling](self, "collectionStyleScrolling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionStyleScrolling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBCollectionStyle collectionStyleScrolling](self, "collectionStyleScrolling");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      initiallyVisibleCardSectionCount = self->_initiallyVisibleCardSectionCount;
      v22 = initiallyVisibleCardSectionCount == objc_msgSend(v4, "initiallyVisibleCardSectionCount");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBCollectionStyle collectionStyleScrolling](self, "collectionStyleScrolling");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionStyleScrolling");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_SFPBCollectionStyleRow hash](self->_collectionStyleRow, "hash");
  v4 = -[_SFPBCollectionStyleGrid hash](self->_collectionStyleGrid, "hash");
  return v4 ^ v3 ^ -[_SFPBCollectionStyleHorizontallyScrolling hash](self->_collectionStyleScrolling, "hash") ^ (2654435761 * self->_initiallyVisibleCardSectionCount);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_collectionStyleGrid)
  {
    -[_SFPBCollectionStyle collectionStyleGrid](self, "collectionStyleGrid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("collectionStyleGrid"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("collectionStyleGrid"));

    }
  }
  if (self->_collectionStyleRow)
  {
    -[_SFPBCollectionStyle collectionStyleRow](self, "collectionStyleRow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("collectionStyleRow"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("collectionStyleRow"));

    }
  }
  if (self->_collectionStyleScrolling)
  {
    -[_SFPBCollectionStyle collectionStyleScrolling](self, "collectionStyleScrolling");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("collectionStyleScrolling"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("collectionStyleScrolling"));

    }
  }
  if (self->_initiallyVisibleCardSectionCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBCollectionStyle initiallyVisibleCardSectionCount](self, "initiallyVisibleCardSectionCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("initiallyVisibleCardSectionCount"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCollectionStyle dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCollectionStyle)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCollectionStyle *v5;
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
    self = -[_SFPBCollectionStyle initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCollectionStyle)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCollectionStyle *v5;
  void *v6;
  _SFPBCollectionStyleRow *v7;
  void *v8;
  _SFPBCollectionStyleGrid *v9;
  void *v10;
  _SFPBCollectionStyleHorizontallyScrolling *v11;
  void *v12;
  _SFPBCollectionStyle *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBCollectionStyle;
  v5 = -[_SFPBCollectionStyle init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionStyleRow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCollectionStyleRow initWithDictionary:]([_SFPBCollectionStyleRow alloc], "initWithDictionary:", v6);
      -[_SFPBCollectionStyle setCollectionStyleRow:](v5, "setCollectionStyleRow:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionStyleGrid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBCollectionStyleGrid initWithDictionary:]([_SFPBCollectionStyleGrid alloc], "initWithDictionary:", v8);
      -[_SFPBCollectionStyle setCollectionStyleGrid:](v5, "setCollectionStyleGrid:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionStyleScrolling"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBCollectionStyleHorizontallyScrolling initWithDictionary:]([_SFPBCollectionStyleHorizontallyScrolling alloc], "initWithDictionary:", v10);
      -[_SFPBCollectionStyle setCollectionStyleScrolling:](v5, "setCollectionStyleScrolling:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initiallyVisibleCardSectionCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCollectionStyle setInitiallyVisibleCardSectionCount:](v5, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v5;

  }
  return v5;
}

- (unsigned)initiallyVisibleCardSectionCount
{
  return self->_initiallyVisibleCardSectionCount;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionStyleScrolling, 0);
  objc_storeStrong((id *)&self->_collectionStyleGrid, 0);
  objc_storeStrong((id *)&self->_collectionStyleRow, 0);
}

@end
