@implementation _SFPBRFRGBValue

- (_SFPBRFRGBValue)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFRGBValue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBRFRGBValue *v12;

  v4 = a3;
  v5 = -[_SFPBRFRGBValue init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "red");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "red");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_SFPBRFRGBValue setRed:](v5, "setRed:");

    }
    objc_msgSend(v4, "green");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "green");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      -[_SFPBRFRGBValue setGreen:](v5, "setGreen:");

    }
    objc_msgSend(v4, "blue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "blue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      -[_SFPBRFRGBValue setBlue:](v5, "setBlue:");

    }
    v12 = v5;
  }

  return v5;
}

- (void)setRed:(float)a3
{
  self->_red = a3;
}

- (void)setGreen:(float)a3
{
  self->_green = a3;
}

- (void)setBlue:(float)a3
{
  self->_blue = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBRFRGBValueReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  void *v6;
  float v7;
  id v8;

  v8 = a3;
  -[_SFPBRFRGBValue red](self, "red");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBRFRGBValue green](self, "green");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBRFRGBValue blue](self, "blue");
  v6 = v8;
  if (v7 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float red;
  float v6;
  float green;
  float v8;
  BOOL v9;
  float blue;
  float v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (red = self->_red, objc_msgSend(v4, "red"), red == v6)
    && (green = self->_green, objc_msgSend(v4, "green"), green == v8))
  {
    blue = self->_blue;
    objc_msgSend(v4, "blue");
    v9 = blue == v12;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  float red;
  BOOL v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float green;
  BOOL v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float blue;
  BOOL v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;

  red = self->_red;
  v4 = red < 0.0;
  if (red == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v5 = red;
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
  green = self->_green;
  v11 = green < 0.0;
  if (green == 0.0)
  {
    v16 = 0;
  }
  else
  {
    v12 = green;
    v13 = -v12;
    if (!v11)
      v13 = v12;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v16 += (unint64_t)v15;
    }
    else
    {
      v16 -= (unint64_t)fabs(v15);
    }
  }
  blue = self->_blue;
  v18 = blue < 0.0;
  if (blue == 0.0)
  {
    v23 = 0;
  }
  else
  {
    v19 = blue;
    v20 = -v19;
    if (!v18)
      v20 = v19;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v23 += (unint64_t)v22;
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  return v16 ^ v9 ^ v23;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_blue != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFRGBValue blue](self, "blue");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("blue"));

  }
  if (self->_green != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFRGBValue green](self, "green");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("green"));

  }
  if (self->_red != 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFRGBValue red](self, "red");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("red"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFRGBValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFRGBValue)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFRGBValue *v5;
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
    self = -[_SFPBRFRGBValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFRGBValue)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFRGBValue *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBRFRGBValue *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBRFRGBValue;
  v5 = -[_SFPBRFRGBValue init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("red"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[_SFPBRFRGBValue setRed:](v5, "setRed:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("green"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[_SFPBRFRGBValue setGreen:](v5, "setGreen:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[_SFPBRFRGBValue setBlue:](v5, "setBlue:");
    }
    v9 = v5;

  }
  return v5;
}

- (float)red
{
  return self->_red;
}

- (float)green
{
  return self->_green;
}

- (float)blue
{
  return self->_blue;
}

@end
