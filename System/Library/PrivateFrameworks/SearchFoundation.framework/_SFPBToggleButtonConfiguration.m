@implementation _SFPBToggleButtonConfiguration

- (_SFPBToggleButtonConfiguration)initWithFacade:(id)a3
{
  id v4;
  _SFPBToggleButtonConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBImage *v11;
  void *v12;
  _SFPBImage *v13;
  void *v14;
  _SFPBImage *v15;
  void *v16;
  _SFPBImage *v17;
  _SFPBToggleButtonConfiguration *v18;

  v4 = a3;
  v5 = -[_SFPBToggleButtonConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "untoggledTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "untoggledTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBToggleButtonConfiguration setUntoggledTitle:](v5, "setUntoggledTitle:", v7);

    }
    objc_msgSend(v4, "toggledTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "toggledTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBToggleButtonConfiguration setToggledTitle:](v5, "setToggledTitle:", v9);

    }
    objc_msgSend(v4, "untoggledImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBImage alloc];
      objc_msgSend(v4, "untoggledImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBImage initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBToggleButtonConfiguration setUntoggledImage:](v5, "setUntoggledImage:", v13);

    }
    objc_msgSend(v4, "toggledImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBImage alloc];
      objc_msgSend(v4, "toggledImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBImage initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBToggleButtonConfiguration setToggledImage:](v5, "setToggledImage:", v17);

    }
    v18 = v5;
  }

  return v5;
}

- (void)setUntoggledTitle:(id)a3
{
  NSString *v4;
  NSString *untoggledTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  untoggledTitle = self->_untoggledTitle;
  self->_untoggledTitle = v4;

}

- (void)setToggledTitle:(id)a3
{
  NSString *v4;
  NSString *toggledTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  toggledTitle = self->_toggledTitle;
  self->_toggledTitle = v4;

}

- (void)setUntoggledImage:(id)a3
{
  objc_storeStrong((id *)&self->_untoggledImage, a3);
}

- (void)setToggledImage:(id)a3
{
  objc_storeStrong((id *)&self->_toggledImage, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBToggleButtonConfigurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBToggleButtonConfiguration toggledTitle](self, "toggledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBToggleButtonConfiguration untoggledImage](self, "untoggledImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBToggleButtonConfiguration toggledImage](self, "toggledImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "untoggledTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "untoggledTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBToggleButtonConfiguration toggledTitle](self, "toggledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggledTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBToggleButtonConfiguration toggledTitle](self, "toggledTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBToggleButtonConfiguration toggledTitle](self, "toggledTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggledTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBToggleButtonConfiguration untoggledImage](self, "untoggledImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "untoggledImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBToggleButtonConfiguration untoggledImage](self, "untoggledImage");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBToggleButtonConfiguration untoggledImage](self, "untoggledImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "untoggledImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBToggleButtonConfiguration toggledImage](self, "toggledImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggledImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBToggleButtonConfiguration toggledImage](self, "toggledImage");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBToggleButtonConfiguration toggledImage](self, "toggledImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggledImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_untoggledTitle, "hash");
  v4 = -[NSString hash](self->_toggledTitle, "hash") ^ v3;
  v5 = -[_SFPBImage hash](self->_untoggledImage, "hash");
  return v4 ^ v5 ^ -[_SFPBImage hash](self->_toggledImage, "hash");
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
  if (self->_toggledImage)
  {
    -[_SFPBToggleButtonConfiguration toggledImage](self, "toggledImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("toggledImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("toggledImage"));

    }
  }
  if (self->_toggledTitle)
  {
    -[_SFPBToggleButtonConfiguration toggledTitle](self, "toggledTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("toggledTitle"));

  }
  if (self->_untoggledImage)
  {
    -[_SFPBToggleButtonConfiguration untoggledImage](self, "untoggledImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("untoggledImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("untoggledImage"));

    }
  }
  if (self->_untoggledTitle)
  {
    -[_SFPBToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("untoggledTitle"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBToggleButtonConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBToggleButtonConfiguration)initWithJSON:(id)a3
{
  void *v4;
  _SFPBToggleButtonConfiguration *v5;
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
    self = -[_SFPBToggleButtonConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBToggleButtonConfiguration)initWithDictionary:(id)a3
{
  id v4;
  _SFPBToggleButtonConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBImage *v11;
  void *v12;
  _SFPBImage *v13;
  _SFPBToggleButtonConfiguration *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBToggleButtonConfiguration;
  v5 = -[_SFPBToggleButtonConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("untoggledTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBToggleButtonConfiguration setUntoggledTitle:](v5, "setUntoggledTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toggledTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBToggleButtonConfiguration setToggledTitle:](v5, "setToggledTitle:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("untoggledImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v10);
      -[_SFPBToggleButtonConfiguration setUntoggledImage:](v5, "setUntoggledImage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toggledImage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v12);
      -[_SFPBToggleButtonConfiguration setToggledImage:](v5, "setToggledImage:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)untoggledTitle
{
  return self->_untoggledTitle;
}

- (NSString)toggledTitle
{
  return self->_toggledTitle;
}

- (_SFPBImage)untoggledImage
{
  return self->_untoggledImage;
}

- (_SFPBImage)toggledImage
{
  return self->_toggledImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggledImage, 0);
  objc_storeStrong((id *)&self->_untoggledImage, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_untoggledTitle, 0);
}

@end
