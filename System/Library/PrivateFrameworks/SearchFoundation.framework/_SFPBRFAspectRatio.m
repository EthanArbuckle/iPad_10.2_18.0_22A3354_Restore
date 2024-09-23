@implementation _SFPBRFAspectRatio

- (_SFPBRFAspectRatio)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFAspectRatio *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBRFAspectRatio *v10;

  v4 = a3;
  v5 = -[_SFPBRFAspectRatio init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "width");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "width");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_SFPBRFAspectRatio setWidth:](v5, "setWidth:");

    }
    objc_msgSend(v4, "height");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "height");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      -[_SFPBRFAspectRatio setHeight:](v5, "setHeight:");

    }
    v10 = v5;
  }

  return v5;
}

- (void)setWidth:(float)a3
{
  self->_width = a3;
}

- (void)setHeight:(float)a3
{
  self->_height = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBRFAspectRatioReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  id v6;

  v6 = a3;
  -[_SFPBRFAspectRatio width](self, "width");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBRFAspectRatio height](self, "height");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float width;
  float v6;
  BOOL v7;
  float height;
  float v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (width = self->_width, objc_msgSend(v4, "width"), width == v6))
  {
    height = self->_height;
    objc_msgSend(v4, "height");
    v7 = height == v9;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  float width;
  BOOL v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float height;
  BOOL v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;

  width = self->_width;
  v4 = width < 0.0;
  if (width == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v5 = width;
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
  height = self->_height;
  v11 = height < 0.0;
  if (height == 0.0)
  {
    v16 = 0;
  }
  else
  {
    v12 = height;
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
  return v16 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_height != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFAspectRatio height](self, "height");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("height"));

  }
  if (self->_width != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFAspectRatio width](self, "width");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("width"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFAspectRatio dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFAspectRatio)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFAspectRatio *v5;
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
    self = -[_SFPBRFAspectRatio initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFAspectRatio)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFAspectRatio *v5;
  void *v6;
  void *v7;
  _SFPBRFAspectRatio *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFAspectRatio;
  v5 = -[_SFPBRFAspectRatio init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[_SFPBRFAspectRatio setWidth:](v5, "setWidth:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[_SFPBRFAspectRatio setHeight:](v5, "setHeight:");
    }
    v8 = v5;

  }
  return v5;
}

- (float)width
{
  return self->_width;
}

- (float)height
{
  return self->_height;
}

@end
