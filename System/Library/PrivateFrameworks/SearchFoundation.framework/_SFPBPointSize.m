@implementation _SFPBPointSize

- (_SFPBPointSize)initWithCGSize:(CGSize)a3
{
  double height;
  double width;
  _SFPBPointSize *v5;
  _SFPBGraphicalFloat *v6;
  _SFPBGraphicalFloat *v7;
  _SFPBPointSize *v8;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBPointSize;
  v5 = -[_SFPBPointSize init](&v10, sel_init);
  if (v5)
  {
    v6 = -[_SFPBGraphicalFloat initWithCGFloat:]([_SFPBGraphicalFloat alloc], "initWithCGFloat:", width);
    -[_SFPBPointSize setWidth:](v5, "setWidth:", v6);

    v7 = -[_SFPBGraphicalFloat initWithCGFloat:]([_SFPBGraphicalFloat alloc], "initWithCGFloat:", height);
    -[_SFPBPointSize setHeight:](v5, "setHeight:", v7);

    v8 = v5;
  }

  return v5;
}

- (void)setWidth:(id)a3
{
  objc_storeStrong((id *)&self->_width, a3);
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPointSizeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBPointSize width](self, "width");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBPointSize height](self, "height");
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBPointSize width](self, "width");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "width");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBPointSize width](self, "width");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPointSize width](self, "width");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "width");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBPointSize height](self, "height");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "height");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBPointSize height](self, "height");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBPointSize height](self, "height");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "height");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_SFPBGraphicalFloat hash](self->_width, "hash");
  return -[_SFPBGraphicalFloat hash](self->_height, "hash") ^ v3;
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
  if (self->_height)
  {
    -[_SFPBPointSize height](self, "height");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("height"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("height"));

    }
  }
  if (self->_width)
  {
    -[_SFPBPointSize width](self, "width");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("width"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("width"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPointSize dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPointSize)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPointSize *v5;
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
    self = -[_SFPBPointSize initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPointSize)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPointSize *v5;
  void *v6;
  _SFPBGraphicalFloat *v7;
  void *v8;
  _SFPBGraphicalFloat *v9;
  _SFPBPointSize *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBPointSize;
  v5 = -[_SFPBPointSize init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v6);
      -[_SFPBPointSize setWidth:](v5, "setWidth:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v8);
      -[_SFPBPointSize setHeight:](v5, "setHeight:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (_SFPBGraphicalFloat)width
{
  return self->_width;
}

- (_SFPBGraphicalFloat)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
}

@end
