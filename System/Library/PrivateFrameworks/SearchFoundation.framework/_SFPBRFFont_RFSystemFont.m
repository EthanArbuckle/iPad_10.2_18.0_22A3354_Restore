@implementation _SFPBRFFont_RFSystemFont

- (_SFPBRFFont_RFSystemFont)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFFont_RFSystemFont *v5;
  void *v6;
  void *v7;
  _SFPBRFFont_RFSystemFont *v8;

  v4 = a3;
  v5 = -[_SFPBRFFont_RFSystemFont init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "size");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "size");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_SFPBRFFont_RFSystemFont setSize:](v5, "setSize:");

    }
    if (objc_msgSend(v4, "hasWeight"))
      -[_SFPBRFFont_RFSystemFont setWeight:](v5, "setWeight:", objc_msgSend(v4, "weight"));
    v8 = v5;
  }

  return v5;
}

- (void)setSize:(float)a3
{
  self->_size = a3;
}

- (void)setWeight:(int)a3
{
  self->_weight = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBRFFont_RFSystemFontReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  id v5;

  v5 = a3;
  -[_SFPBRFFont_RFSystemFont size](self, "size");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBRFFont_RFSystemFont weight](self, "weight"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float size;
  float v6;
  BOOL v7;
  int weight;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (size = self->_size, objc_msgSend(v4, "size"), size == v6))
  {
    weight = self->_weight;
    v7 = weight == objc_msgSend(v4, "weight");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  float size;
  BOOL v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  size = self->_size;
  v4 = size < 0.0;
  if (size == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v5 = size;
    v6 = -v5;
    if (!v4)
      v6 = v5;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v9 += (unint64_t)v8;
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  return (2654435761 * self->_weight) ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_size != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFFont_RFSystemFont size](self, "size");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("size"));

  }
  if (self->_weight)
  {
    v6 = -[_SFPBRFFont_RFSystemFont weight](self, "weight");
    if (v6 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E4041E50 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("weight"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFFont_RFSystemFont dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFFont_RFSystemFont)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFFont_RFSystemFont *v5;
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
    self = -[_SFPBRFFont_RFSystemFont initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFFont_RFSystemFont)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFFont_RFSystemFont *v5;
  void *v6;
  void *v7;
  _SFPBRFFont_RFSystemFont *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFFont_RFSystemFont;
  v5 = -[_SFPBRFFont_RFSystemFont init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[_SFPBRFFont_RFSystemFont setSize:](v5, "setSize:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weight"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFFont_RFSystemFont setWeight:](v5, "setWeight:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (float)size
{
  return self->_size;
}

- (int)weight
{
  return self->_weight;
}

@end
