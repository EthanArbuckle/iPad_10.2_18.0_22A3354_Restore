@implementation _SFPBButton

- (_SFPBButton)initWithFacade:(id)a3
{
  id v4;
  _SFPBButton *v5;
  void *v6;
  _SFPBImage *v7;
  void *v8;
  _SFPBImage *v9;
  void *v10;
  _SFPBImage *v11;
  void *v12;
  _SFPBImage *v13;
  _SFPBButton *v14;

  v4 = a3;
  v5 = -[_SFPBButton init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBImage initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBButton setImage:](v5, "setImage:", v9);

    }
    objc_msgSend(v4, "selectedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBImage alloc];
      objc_msgSend(v4, "selectedImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBImage initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBButton setSelectedImage:](v5, "setSelectedImage:", v13);

    }
    if (objc_msgSend(v4, "hasIsSelected"))
      -[_SFPBButton setIsSelected:](v5, "setIsSelected:", objc_msgSend(v4, "isSelected"));
    v14 = v5;
  }

  return v5;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedImage, a3);
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBButtonReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBButton image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBButton selectedImage](self, "selectedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBButton isSelected](self, "isSelected"))
    PBDataWriterWriteBOOLField();

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
  BOOL v17;
  int isSelected;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBButton image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBButton image](self, "image");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBButton image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBButton selectedImage](self, "selectedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBButton selectedImage](self, "selectedImage");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      isSelected = self->_isSelected;
      v17 = isSelected == objc_msgSend(v4, "isSelected");
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBButton selectedImage](self, "selectedImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
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
  unint64_t v4;
  uint64_t v5;

  v3 = -[_SFPBImage hash](self->_image, "hash");
  v4 = -[_SFPBImage hash](self->_selectedImage, "hash");
  v5 = 2654435761;
  if (!self->_isSelected)
    v5 = 0;
  return v4 ^ v3 ^ v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_image)
  {
    -[_SFPBButton image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("image"));

    }
  }
  if (self->_isSelected)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBButton isSelected](self, "isSelected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSelected"));

  }
  if (self->_selectedImage)
  {
    -[_SFPBButton selectedImage](self, "selectedImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("selectedImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("selectedImage"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBButton dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBButton)initWithJSON:(id)a3
{
  void *v4;
  _SFPBButton *v5;
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
    self = -[_SFPBButton initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBButton)initWithDictionary:(id)a3
{
  id v4;
  _SFPBButton *v5;
  void *v6;
  _SFPBImage *v7;
  void *v8;
  _SFPBImage *v9;
  void *v10;
  _SFPBButton *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBButton;
  v5 = -[_SFPBButton init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v6);
      -[_SFPBButton setImage:](v5, "setImage:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v8);
      -[_SFPBButton setSelectedImage:](v5, "setSelectedImage:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSelected"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBButton setIsSelected:](v5, "setIsSelected:", objc_msgSend(v10, "BOOLValue"));
    v11 = v5;

  }
  return v5;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (_SFPBImage)selectedImage
{
  return self->_selectedImage;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
