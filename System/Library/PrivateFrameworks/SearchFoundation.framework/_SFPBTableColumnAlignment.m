@implementation _SFPBTableColumnAlignment

- (_SFPBTableColumnAlignment)initWithFacade:(id)a3
{
  id v4;
  _SFPBTableColumnAlignment *v5;
  _SFPBTableColumnAlignment *v6;

  v4 = a3;
  v5 = -[_SFPBTableColumnAlignment init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasColumnAlignment"))
      -[_SFPBTableColumnAlignment setColumnAlignment:](v5, "setColumnAlignment:", objc_msgSend(v4, "columnAlignment"));
    if (objc_msgSend(v4, "hasDataAlignment"))
      -[_SFPBTableColumnAlignment setDataAlignment:](v5, "setDataAlignment:", objc_msgSend(v4, "dataAlignment"));
    if (objc_msgSend(v4, "hasIsEqualWidth"))
      -[_SFPBTableColumnAlignment setIsEqualWidth:](v5, "setIsEqualWidth:", objc_msgSend(v4, "isEqualWidth"));
    v6 = v5;
  }

  return v5;
}

- (void)setColumnAlignment:(int)a3
{
  self->_columnAlignment = a3;
}

- (void)setDataAlignment:(int)a3
{
  self->_dataAlignment = a3;
}

- (void)setIsEqualWidth:(BOOL)a3
{
  self->_isEqualWidth = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTableColumnAlignmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBTableColumnAlignment columnAlignment](self, "columnAlignment"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBTableColumnAlignment dataAlignment](self, "dataAlignment"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBTableColumnAlignment isEqualWidth](self, "isEqualWidth"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int columnAlignment;
  int dataAlignment;
  int isEqualWidth;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (columnAlignment = self->_columnAlignment, columnAlignment == objc_msgSend(v4, "columnAlignment"))
    && (dataAlignment = self->_dataAlignment, dataAlignment == objc_msgSend(v4, "dataAlignment")))
  {
    isEqualWidth = self->_isEqualWidth;
    v8 = isEqualWidth == objc_msgSend(v4, "isEqualWidth");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761;
  if (!self->_isEqualWidth)
    v2 = 0;
  return (2654435761 * self->_dataAlignment) ^ (2654435761 * self->_columnAlignment) ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_columnAlignment)
  {
    v4 = -[_SFPBTableColumnAlignment columnAlignment](self, "columnAlignment");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042178 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("columnAlignment"));

  }
  if (self->_dataAlignment)
  {
    v6 = -[_SFPBTableColumnAlignment dataAlignment](self, "dataAlignment");
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E4042178 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dataAlignment"));

  }
  if (self->_isEqualWidth)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableColumnAlignment isEqualWidth](self, "isEqualWidth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isEqualWidth"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTableColumnAlignment dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBTableColumnAlignment)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTableColumnAlignment *v5;
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
    self = -[_SFPBTableColumnAlignment initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTableColumnAlignment)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTableColumnAlignment *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBTableColumnAlignment *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBTableColumnAlignment;
  v5 = -[_SFPBTableColumnAlignment init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("columnAlignment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableColumnAlignment setColumnAlignment:](v5, "setColumnAlignment:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataAlignment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableColumnAlignment setDataAlignment:](v5, "setDataAlignment:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEqualWidth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableColumnAlignment setIsEqualWidth:](v5, "setIsEqualWidth:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (int)columnAlignment
{
  return self->_columnAlignment;
}

- (int)dataAlignment
{
  return self->_dataAlignment;
}

- (BOOL)isEqualWidth
{
  return self->_isEqualWidth;
}

@end
