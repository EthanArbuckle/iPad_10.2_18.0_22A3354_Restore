@implementation _SFPBRFFont

- (_SFPBRFFont)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFFont *v5;
  void *v6;
  _SFPBRFFont_RFSystemFont *v7;
  void *v8;
  _SFPBRFFont_RFSystemFont *v9;
  _SFPBRFFont *v10;

  v4 = a3;
  v5 = -[_SFPBRFFont init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasName"))
      -[_SFPBRFFont setName:](v5, "setName:", objc_msgSend(v4, "name"));
    if (objc_msgSend(v4, "hasSystem"))
    {
      objc_msgSend(v4, "system");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFFont_RFSystemFont alloc];
        objc_msgSend(v4, "system");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFFont_RFSystemFont initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFFont setSystem:](v5, "setSystem:", v9);

      }
    }
    if (objc_msgSend(v4, "hasApplySmallCaps"))
      -[_SFPBRFFont setApplySmallCaps:](v5, "setApplySmallCaps:", objc_msgSend(v4, "applySmallCaps"));
    v10 = v5;
  }

  return v5;
}

- (void)setName:(int)a3
{
  _SFPBRFFont_RFSystemFont *system;

  system = self->_system;
  self->_system = 0;

  self->_whichValue = 1;
  self->_name = a3;
}

- (int)name
{
  if (self->_whichValue == 1)
    return self->_name;
  else
    return 0;
}

- (void)setSystem:(id)a3
{
  self->_name = 0;
  self->_whichValue = 2 * (a3 != 0);
  objc_storeStrong((id *)&self->_system, a3);
}

- (_SFPBRFFont_RFSystemFont)system
{
  if (self->_whichValue == 2)
    return self->_system;
  else
    return (_SFPBRFFont_RFSystemFont *)0;
}

- (void)setApplySmallCaps:(BOOL)a3
{
  self->_applySmallCaps = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFontReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_SFPBRFFont name](self, "name"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFFont system](self, "system");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFFont applySmallCaps](self, "applySmallCaps"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int name;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  int applySmallCaps;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    name = self->_name;
    if (name == objc_msgSend(v4, "name"))
    {
      -[_SFPBRFFont system](self, "system");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "system");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_SFPBRFFont system](self, "system");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          applySmallCaps = self->_applySmallCaps;
          v14 = applySmallCaps == objc_msgSend(v4, "applySmallCaps");
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_SFPBRFFont system](self, "system");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "system");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = 2654435761 * self->_name;
  v4 = -[_SFPBRFFont_RFSystemFont hash](self->_system, "hash");
  if (self->_applySmallCaps)
    v5 = 2654435761;
  else
    v5 = 0;
  return v4 ^ v5 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applySmallCaps)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFFont applySmallCaps](self, "applySmallCaps"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("applySmallCaps"));

  }
  if (self->_name)
  {
    v5 = -[_SFPBRFFont name](self, "name");
    if (v5 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(&off_1E4041DF0 + v5);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  }
  if (self->_system)
  {
    -[_SFPBRFFont system](self, "system");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("system"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("system"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFFont dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFFont)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFFont *v5;
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
    self = -[_SFPBRFFont initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFFont)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFFont *v5;
  void *v6;
  void *v7;
  _SFPBRFFont_RFSystemFont *v8;
  void *v9;
  _SFPBRFFont *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFFont;
  v5 = -[_SFPBRFFont init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFFont setName:](v5, "setName:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("system"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[_SFPBRFFont_RFSystemFont initWithDictionary:]([_SFPBRFFont_RFSystemFont alloc], "initWithDictionary:", v7);
      -[_SFPBRFFont setSystem:](v5, "setSystem:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applySmallCaps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFFont setApplySmallCaps:](v5, "setApplySmallCaps:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
}

@end
