@implementation _SFPBProduct

- (_SFPBProduct)initWithFacade:(id)a3
{
  id v4;
  _SFPBProduct *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBURL *v11;
  void *v12;
  _SFPBURL *v13;
  void *v14;
  void *v15;
  _SFPBProduct *v16;

  v4 = a3;
  v5 = -[_SFPBProduct init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBProduct setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "productIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "productIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBProduct setProductIdentifier:](v5, "setProductIdentifier:", v9);

    }
    objc_msgSend(v4, "availabilityURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBURL alloc];
      objc_msgSend(v4, "availabilityURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBURL initWithNSURL:](v11, "initWithNSURL:", v12);
      -[_SFPBProduct setAvailabilityURL:](v5, "setAvailabilityURL:", v13);

    }
    objc_msgSend(v4, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBProduct setDisplayName:](v5, "setDisplayName:", v15);

    }
    if (objc_msgSend(v4, "hasBuyable"))
      -[_SFPBProduct setBuyable:](v5, "setBuyable:", objc_msgSend(v4, "buyable"));
    v16 = v5;
  }

  return v5;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)setProductIdentifier:(id)a3
{
  NSString *v4;
  NSString *productIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  productIdentifier = self->_productIdentifier;
  self->_productIdentifier = v4;

}

- (void)setAvailabilityURL:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityURL, a3);
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->_displayName;
  self->_displayName = v4;

}

- (void)setBuyable:(BOOL)a3
{
  self->_buyable = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBProductReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBProduct identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBProduct productIdentifier](self, "productIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBProduct availabilityURL](self, "availabilityURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBProduct displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  if (-[_SFPBProduct buyable](self, "buyable"))
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  int buyable;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBProduct identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBProduct identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBProduct identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBProduct productIdentifier](self, "productIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBProduct productIdentifier](self, "productIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBProduct productIdentifier](self, "productIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBProduct availabilityURL](self, "availabilityURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availabilityURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBProduct availabilityURL](self, "availabilityURL");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBProduct availabilityURL](self, "availabilityURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availabilityURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBProduct displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBProduct displayName](self, "displayName");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      buyable = self->_buyable;
      v27 = buyable == objc_msgSend(v4, "buyable");
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBProduct displayName](self, "displayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (v26)
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
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_productIdentifier, "hash");
  v5 = -[_SFPBURL hash](self->_availabilityURL, "hash");
  v6 = -[NSString hash](self->_displayName, "hash");
  v7 = 2654435761;
  if (!self->_buyable)
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  if (self->_availabilityURL)
  {
    -[_SFPBProduct availabilityURL](self, "availabilityURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("availabilityURL"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("availabilityURL"));

    }
  }
  if (self->_buyable)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBProduct buyable](self, "buyable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("buyable"));

  }
  if (self->_displayName)
  {
    -[_SFPBProduct displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("displayName"));

  }
  if (self->_identifier)
  {
    -[_SFPBProduct identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));

  }
  if (self->_productIdentifier)
  {
    -[_SFPBProduct productIdentifier](self, "productIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("productIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBProduct dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBProduct)initWithJSON:(id)a3
{
  void *v4;
  _SFPBProduct *v5;
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
    self = -[_SFPBProduct initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBProduct)initWithDictionary:(id)a3
{
  id v4;
  _SFPBProduct *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBURL *v11;
  void *v12;
  void *v13;
  void *v14;
  _SFPBProduct *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SFPBProduct;
  v5 = -[_SFPBProduct init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBProduct setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBProduct setProductIdentifier:](v5, "setProductIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availabilityURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v10);
      -[_SFPBProduct setAvailabilityURL:](v5, "setAvailabilityURL:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBProduct setDisplayName:](v5, "setDisplayName:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBProduct setBuyable:](v5, "setBuyable:", objc_msgSend(v14, "BOOLValue"));
    v15 = v5;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (_SFPBURL)availabilityURL
{
  return self->_availabilityURL;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)buyable
{
  return self->_buyable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_availabilityURL, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
