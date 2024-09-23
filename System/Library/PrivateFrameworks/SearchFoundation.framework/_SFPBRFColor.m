@implementation _SFPBRFColor

- (_SFPBRFColor)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFColor *v5;
  void *v6;
  _SFPBRFRGBValue *v7;
  void *v8;
  _SFPBRFRGBValue *v9;
  void *v10;
  _SFPBRFOptionalFloat *v11;
  void *v12;
  _SFPBRFOptionalFloat *v13;
  _SFPBRFColor *v14;

  v4 = a3;
  v5 = -[_SFPBRFColor init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasRgb_value"))
    {
      objc_msgSend(v4, "rgb_value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFRGBValue alloc];
        objc_msgSend(v4, "rgb_value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFRGBValue initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFColor setRgb_value:](v5, "setRgb_value:", v9);

      }
    }
    if (objc_msgSend(v4, "hasName"))
      -[_SFPBRFColor setName:](v5, "setName:", objc_msgSend(v4, "name"));
    objc_msgSend(v4, "alpha");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFOptionalFloat alloc];
      objc_msgSend(v4, "alpha");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFOptionalFloat initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFColor setAlpha:](v5, "setAlpha:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setRgb_value:(id)a3
{
  self->_name = 0;
  self->_whichValue = a3 != 0;
  objc_storeStrong((id *)&self->_rgb_value, a3);
}

- (_SFPBRFRGBValue)rgb_value
{
  if (self->_whichValue == 1)
    return self->_rgb_value;
  else
    return (_SFPBRFRGBValue *)0;
}

- (void)setName:(int)a3
{
  _SFPBRFRGBValue *rgb_value;

  rgb_value = self->_rgb_value;
  self->_rgb_value = 0;

  self->_whichValue = 2;
  self->_name = a3;
}

- (int)name
{
  if (self->_whichValue == 2)
    return self->_name;
  else
    return 0;
}

- (void)setAlpha:(id)a3
{
  objc_storeStrong((id *)&self->_alpha, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFColorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFColor rgb_value](self, "rgb_value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFColor name](self, "name"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFColor alpha](self, "alpha");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

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
  int name;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[_SFPBRFColor rgb_value](self, "rgb_value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rgb_value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_12;
  -[_SFPBRFColor rgb_value](self, "rgb_value");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFColor rgb_value](self, "rgb_value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rgb_value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_13;
  }
  else
  {

  }
  name = self->_name;
  if (name != objc_msgSend(v4, "name"))
    goto LABEL_13;
  -[_SFPBRFColor alpha](self, "alpha");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[_SFPBRFColor alpha](self, "alpha");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

LABEL_16:
    v18 = 1;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  -[_SFPBRFColor alpha](self, "alpha");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_16;
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_SFPBRFRGBValue hash](self->_rgb_value, "hash");
  v4 = 2654435761 * self->_name;
  return v4 ^ v3 ^ -[_SFPBRFOptionalFloat hash](self->_alpha, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alpha)
  {
    -[_SFPBRFColor alpha](self, "alpha");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alpha"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alpha"));

    }
  }
  if (self->_name)
  {
    v7 = -[_SFPBRFColor name](self, "name");
    if (v7 >= 0x12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = *(&off_1E4041D60 + v7);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

  }
  if (self->_rgb_value)
  {
    -[_SFPBRFColor rgb_value](self, "rgb_value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("rgbValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rgbValue"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFColor dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFColor)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFColor *v5;
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
    self = -[_SFPBRFColor initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFColor)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFColor *v5;
  void *v6;
  _SFPBRFRGBValue *v7;
  void *v8;
  void *v9;
  _SFPBRFOptionalFloat *v10;
  _SFPBRFColor *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBRFColor;
  v5 = -[_SFPBRFColor init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rgbValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFRGBValue initWithDictionary:]([_SFPBRFRGBValue alloc], "initWithDictionary:", v6);
      -[_SFPBRFColor setRgb_value:](v5, "setRgb_value:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFColor setName:](v5, "setName:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alpha"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[_SFPBRFOptionalFloat initWithDictionary:]([_SFPBRFOptionalFloat alloc], "initWithDictionary:", v9);
      -[_SFPBRFColor setAlpha:](v5, "setAlpha:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (_SFPBRFOptionalFloat)alpha
{
  return self->_alpha;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alpha, 0);
  objc_storeStrong((id *)&self->_rgb_value, 0);
}

@end
