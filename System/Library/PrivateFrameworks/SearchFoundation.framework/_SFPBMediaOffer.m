@implementation _SFPBMediaOffer

- (_SFPBMediaOffer)initWithFacade:(id)a3
{
  id v4;
  _SFPBMediaOffer *v5;
  void *v6;
  _SFPBActionItem *v7;
  void *v8;
  _SFPBActionItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _SFPBImage *v15;
  void *v16;
  _SFPBImage *v17;
  _SFPBMediaOffer *v18;

  v4 = a3;
  v5 = -[_SFPBMediaOffer init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "actionItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBActionItem alloc];
      objc_msgSend(v4, "actionItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBActionItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBMediaOffer setActionItem:](v5, "setActionItem:", v9);

    }
    objc_msgSend(v4, "sublabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "sublabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaOffer setSublabel:](v5, "setSublabel:", v11);

    }
    objc_msgSend(v4, "offerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "offerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaOffer setOfferIdentifier:](v5, "setOfferIdentifier:", v13);

    }
    if (objc_msgSend(v4, "hasIsEnabled"))
      -[_SFPBMediaOffer setIsEnabled:](v5, "setIsEnabled:", objc_msgSend(v4, "isEnabled"));
    objc_msgSend(v4, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBImage initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBMediaOffer setImage:](v5, "setImage:", v17);

    }
    v18 = v5;
  }

  return v5;
}

- (void)setActionItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionItem, a3);
}

- (void)setSublabel:(id)a3
{
  NSString *v4;
  NSString *sublabel;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sublabel = self->_sublabel;
  self->_sublabel = v4;

}

- (void)setOfferIdentifier:(id)a3
{
  NSString *v4;
  NSString *offerIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  offerIdentifier = self->_offerIdentifier;
  self->_offerIdentifier = v4;

}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaOfferReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBMediaOffer actionItem](self, "actionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaOffer sublabel](self, "sublabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBMediaOffer offerIdentifier](self, "offerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  if (-[_SFPBMediaOffer isEnabled](self, "isEnabled"))
    PBDataWriterWriteBOOLField();
  -[_SFPBMediaOffer image](self, "image");
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
  int isEnabled;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[_SFPBMediaOffer actionItem](self, "actionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBMediaOffer actionItem](self, "actionItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBMediaOffer actionItem](self, "actionItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_23;
  }
  else
  {

  }
  -[_SFPBMediaOffer sublabel](self, "sublabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBMediaOffer sublabel](self, "sublabel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBMediaOffer sublabel](self, "sublabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sublabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_23;
  }
  else
  {

  }
  -[_SFPBMediaOffer offerIdentifier](self, "offerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBMediaOffer offerIdentifier](self, "offerIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBMediaOffer offerIdentifier](self, "offerIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offerIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_23;
  }
  else
  {

  }
  isEnabled = self->_isEnabled;
  if (isEnabled != objc_msgSend(v4, "isEnabled"))
    goto LABEL_23;
  -[_SFPBMediaOffer image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  -[_SFPBMediaOffer image](self, "image");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {

LABEL_26:
    v28 = 1;
    goto LABEL_24;
  }
  v24 = (void *)v23;
  -[_SFPBMediaOffer image](self, "image");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  if ((v27 & 1) != 0)
    goto LABEL_26;
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[_SFPBActionItem hash](self->_actionItem, "hash");
  v4 = -[NSString hash](self->_sublabel, "hash");
  v5 = -[NSString hash](self->_offerIdentifier, "hash");
  if (self->_isEnabled)
    v6 = 2654435761;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[_SFPBImage hash](self->_image, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionItem)
  {
    -[_SFPBMediaOffer actionItem](self, "actionItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionItem"));

    }
  }
  if (self->_image)
  {
    -[_SFPBMediaOffer image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("image"));

    }
  }
  if (self->_isEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMediaOffer isEnabled](self, "isEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isEnabled"));

  }
  if (self->_offerIdentifier)
  {
    -[_SFPBMediaOffer offerIdentifier](self, "offerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("offerIdentifier"));

  }
  if (self->_sublabel)
  {
    -[_SFPBMediaOffer sublabel](self, "sublabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("sublabel"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMediaOffer dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMediaOffer)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMediaOffer *v5;
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
    self = -[_SFPBMediaOffer initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMediaOffer)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMediaOffer *v5;
  void *v6;
  _SFPBActionItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBImage *v14;
  _SFPBMediaOffer *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SFPBMediaOffer;
  v5 = -[_SFPBMediaOffer init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBActionItem initWithDictionary:]([_SFPBActionItem alloc], "initWithDictionary:", v6);
      -[_SFPBMediaOffer setActionItem:](v5, "setActionItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sublabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBMediaOffer setSublabel:](v5, "setSublabel:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBMediaOffer setOfferIdentifier:](v5, "setOfferIdentifier:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaOffer setIsEnabled:](v5, "setIsEnabled:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v13);
      -[_SFPBMediaOffer setImage:](v5, "setImage:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (_SFPBActionItem)actionItem
{
  return self->_actionItem;
}

- (NSString)sublabel
{
  return self->_sublabel;
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_sublabel, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

@end
