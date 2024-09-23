@implementation _SFPBRFTextEncapsulation

- (_SFPBRFTextEncapsulation)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTextEncapsulation *v5;
  _SFPBRFTextEncapsulation *v6;

  v4 = a3;
  v5 = -[_SFPBRFTextEncapsulation init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasStyle"))
      -[_SFPBRFTextEncapsulation setStyle:](v5, "setStyle:", objc_msgSend(v4, "style"));
    v6 = v5;
  }

  return v5;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTextEncapsulationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBRFTextEncapsulation style](self, "style"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int style;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    style = self->_style;
    v6 = style == objc_msgSend(v4, "style");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761 * self->_style;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_style)
  {
    v4 = -[_SFPBRFTextEncapsulation style](self, "style");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042178 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("style"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTextEncapsulation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTextEncapsulation)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTextEncapsulation *v5;
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
    self = -[_SFPBRFTextEncapsulation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTextEncapsulation)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTextEncapsulation *v5;
  void *v6;
  _SFPBRFTextEncapsulation *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFTextEncapsulation;
  v5 = -[_SFPBRFTextEncapsulation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("style"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTextEncapsulation setStyle:](v5, "setStyle:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)style
{
  return self->_style;
}

@end
