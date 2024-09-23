@implementation _SFPBCopyItem

- (_SFPBCopyItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBCopyItem *v5;
  _SFPBTextCopyItem *v6;
  _SFPBCoreSpotlightCopyItem *v7;
  _SFPBImageCopyItem *v8;
  _SFPBContactCopyItem *v9;
  _SFPBCopyItem *v10;

  v4 = a3;
  v5 = -[_SFPBCopyItem init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[_SFPBTextCopyItem initWithFacade:]([_SFPBTextCopyItem alloc], "initWithFacade:", v4);
      -[_SFPBCopyItem setTextCopyItem:](v5, "setTextCopyItem:", v6);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCoreSpotlightCopyItem initWithFacade:]([_SFPBCoreSpotlightCopyItem alloc], "initWithFacade:", v4);
      -[_SFPBCopyItem setSpotlightCopyItem:](v5, "setSpotlightCopyItem:", v7);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[_SFPBImageCopyItem initWithFacade:]([_SFPBImageCopyItem alloc], "initWithFacade:", v4);
      -[_SFPBCopyItem setImageCopyItem:](v5, "setImageCopyItem:", v8);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBContactCopyItem initWithFacade:]([_SFPBContactCopyItem alloc], "initWithFacade:", v4);
      -[_SFPBCopyItem setContactCopyItem:](v5, "setContactCopyItem:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setTextCopyItem:(id)a3
{
  _SFPBTextCopyItem *v4;
  _SFPBCoreSpotlightCopyItem *spotlightCopyItem;
  _SFPBImageCopyItem *imageCopyItem;
  _SFPBContactCopyItem *contactCopyItem;
  _SFPBTextCopyItem *textCopyItem;

  v4 = (_SFPBTextCopyItem *)a3;
  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = 0;

  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = 0;

  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = 0;

  self->_whichValue = v4 != 0;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = v4;

}

- (_SFPBTextCopyItem)textCopyItem
{
  if (self->_whichValue == 1)
    return self->_textCopyItem;
  else
    return (_SFPBTextCopyItem *)0;
}

- (void)setSpotlightCopyItem:(id)a3
{
  _SFPBCoreSpotlightCopyItem *v4;
  _SFPBTextCopyItem *textCopyItem;
  _SFPBImageCopyItem *imageCopyItem;
  _SFPBContactCopyItem *contactCopyItem;
  _SFPBCoreSpotlightCopyItem *spotlightCopyItem;

  v4 = (_SFPBCoreSpotlightCopyItem *)a3;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = 0;

  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = 0;

  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = 0;

  self->_whichValue = 2 * (v4 != 0);
  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = v4;

}

- (_SFPBCoreSpotlightCopyItem)spotlightCopyItem
{
  if (self->_whichValue == 2)
    return self->_spotlightCopyItem;
  else
    return (_SFPBCoreSpotlightCopyItem *)0;
}

- (void)setImageCopyItem:(id)a3
{
  _SFPBImageCopyItem *v4;
  _SFPBTextCopyItem *textCopyItem;
  _SFPBCoreSpotlightCopyItem *spotlightCopyItem;
  _SFPBContactCopyItem *contactCopyItem;
  unint64_t v8;
  _SFPBImageCopyItem *imageCopyItem;

  v4 = (_SFPBImageCopyItem *)a3;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = 0;

  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = 0;

  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichValue = v8;
  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = v4;

}

- (_SFPBImageCopyItem)imageCopyItem
{
  if (self->_whichValue == 3)
    return self->_imageCopyItem;
  else
    return (_SFPBImageCopyItem *)0;
}

- (void)setContactCopyItem:(id)a3
{
  _SFPBContactCopyItem *v4;
  _SFPBTextCopyItem *textCopyItem;
  _SFPBCoreSpotlightCopyItem *spotlightCopyItem;
  _SFPBImageCopyItem *imageCopyItem;
  _SFPBContactCopyItem *contactCopyItem;

  v4 = (_SFPBContactCopyItem *)a3;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = 0;

  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = 0;

  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = 0;

  self->_whichValue = 4 * (v4 != 0);
  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = v4;

}

- (_SFPBContactCopyItem)contactCopyItem
{
  if (self->_whichValue == 4)
    return self->_contactCopyItem;
  else
    return (_SFPBContactCopyItem *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCopyItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBCopyItem textCopyItem](self, "textCopyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBCopyItem spotlightCopyItem](self, "spotlightCopyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBCopyItem imageCopyItem](self, "imageCopyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBCopyItem contactCopyItem](self, "contactCopyItem");
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
  -[_SFPBCopyItem textCopyItem](self, "textCopyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textCopyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCopyItem textCopyItem](self, "textCopyItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCopyItem textCopyItem](self, "textCopyItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textCopyItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCopyItem spotlightCopyItem](self, "spotlightCopyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spotlightCopyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCopyItem spotlightCopyItem](self, "spotlightCopyItem");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCopyItem spotlightCopyItem](self, "spotlightCopyItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spotlightCopyItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCopyItem imageCopyItem](self, "imageCopyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageCopyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCopyItem imageCopyItem](self, "imageCopyItem");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBCopyItem imageCopyItem](self, "imageCopyItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageCopyItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCopyItem contactCopyItem](self, "contactCopyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactCopyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBCopyItem contactCopyItem](self, "contactCopyItem");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBCopyItem contactCopyItem](self, "contactCopyItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactCopyItem");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[_SFPBTextCopyItem hash](self->_textCopyItem, "hash");
  v4 = -[_SFPBCoreSpotlightCopyItem hash](self->_spotlightCopyItem, "hash") ^ v3;
  v5 = -[_SFPBImageCopyItem hash](self->_imageCopyItem, "hash");
  return v4 ^ v5 ^ -[_SFPBContactCopyItem hash](self->_contactCopyItem, "hash");
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
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactCopyItem)
  {
    -[_SFPBCopyItem contactCopyItem](self, "contactCopyItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactCopyItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contactCopyItem"));

    }
  }
  if (self->_imageCopyItem)
  {
    -[_SFPBCopyItem imageCopyItem](self, "imageCopyItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("imageCopyItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("imageCopyItem"));

    }
  }
  if (self->_spotlightCopyItem)
  {
    -[_SFPBCopyItem spotlightCopyItem](self, "spotlightCopyItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("spotlightCopyItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("spotlightCopyItem"));

    }
  }
  if (self->_textCopyItem)
  {
    -[_SFPBCopyItem textCopyItem](self, "textCopyItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("textCopyItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("textCopyItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCopyItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCopyItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCopyItem *v5;
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
    self = -[_SFPBCopyItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCopyItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCopyItem *v5;
  void *v6;
  _SFPBTextCopyItem *v7;
  void *v8;
  _SFPBCoreSpotlightCopyItem *v9;
  void *v10;
  _SFPBImageCopyItem *v11;
  void *v12;
  _SFPBContactCopyItem *v13;
  _SFPBCopyItem *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBCopyItem;
  v5 = -[_SFPBCopyItem init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textCopyItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBTextCopyItem initWithDictionary:]([_SFPBTextCopyItem alloc], "initWithDictionary:", v6);
      -[_SFPBCopyItem setTextCopyItem:](v5, "setTextCopyItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spotlightCopyItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBCoreSpotlightCopyItem initWithDictionary:]([_SFPBCoreSpotlightCopyItem alloc], "initWithDictionary:", v8);
      -[_SFPBCopyItem setSpotlightCopyItem:](v5, "setSpotlightCopyItem:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageCopyItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBImageCopyItem initWithDictionary:]([_SFPBImageCopyItem alloc], "initWithDictionary:", v10);
      -[_SFPBCopyItem setImageCopyItem:](v5, "setImageCopyItem:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactCopyItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBContactCopyItem initWithDictionary:]([_SFPBContactCopyItem alloc], "initWithDictionary:", v12);
      -[_SFPBCopyItem setContactCopyItem:](v5, "setContactCopyItem:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCopyItem, 0);
  objc_storeStrong((id *)&self->_imageCopyItem, 0);
  objc_storeStrong((id *)&self->_spotlightCopyItem, 0);
  objc_storeStrong((id *)&self->_textCopyItem, 0);
}

@end
