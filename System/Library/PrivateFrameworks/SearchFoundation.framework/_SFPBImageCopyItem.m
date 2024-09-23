@implementation _SFPBImageCopyItem

- (_SFPBImageCopyItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBImageCopyItem *v5;
  void *v6;
  _SFPBImage *v7;
  void *v8;
  _SFPBImage *v9;
  _SFPBImageCopyItem *v10;

  v4 = a3;
  v5 = -[_SFPBImageCopyItem init](self, "init");
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
      -[_SFPBImageCopyItem setImage:](v5, "setImage:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBImageCopyItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBImageCopyItem image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBImageCopyItem image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBImageCopyItem image](self, "image");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBImageCopyItem image](self, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[_SFPBImage hash](self->_image, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_image)
  {
    -[_SFPBImageCopyItem image](self, "image");
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
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBImageCopyItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBImageCopyItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBImageCopyItem *v5;
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
    self = -[_SFPBImageCopyItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBImageCopyItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBImageCopyItem *v5;
  void *v6;
  _SFPBImage *v7;
  _SFPBImageCopyItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBImageCopyItem;
  v5 = -[_SFPBImageCopyItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v6);
      -[_SFPBImageCopyItem setImage:](v5, "setImage:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
