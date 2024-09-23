@implementation _SFPBRFMapMarkerImage

- (_SFPBRFMapMarkerImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFMapMarkerImage *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBRFMapMarkerImage *v14;

  v4 = a3;
  v5 = -[_SFPBRFMapMarkerImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "coordinate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "coordinate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBLatLng initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFMapMarkerImage setCoordinate:](v5, "setCoordinate:", v9);

    }
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFMapMarkerImage setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "systemImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "systemImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFMapMarkerImage setSystemImage:](v5, "setSystemImage:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setSystemImage:(id)a3
{
  NSString *v4;
  NSString *systemImage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  systemImage = self->_systemImage;
  self->_systemImage = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapMarkerImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBRFMapMarkerImage coordinate](self, "coordinate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFMapMarkerImage title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBRFMapMarkerImage systemImage](self, "systemImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBRFMapMarkerImage coordinate](self, "coordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBRFMapMarkerImage coordinate](self, "coordinate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFMapMarkerImage coordinate](self, "coordinate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBRFMapMarkerImage title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBRFMapMarkerImage title](self, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFMapMarkerImage title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBRFMapMarkerImage systemImage](self, "systemImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFMapMarkerImage systemImage](self, "systemImage");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBRFMapMarkerImage systemImage](self, "systemImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[_SFPBLatLng hash](self->_coordinate, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_systemImage, "hash");
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
  if (self->_coordinate)
  {
    -[_SFPBRFMapMarkerImage coordinate](self, "coordinate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coordinate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("coordinate"));

    }
  }
  if (self->_systemImage)
  {
    -[_SFPBRFMapMarkerImage systemImage](self, "systemImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("systemImage"));

  }
  if (self->_title)
  {
    -[_SFPBRFMapMarkerImage title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFMapMarkerImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFMapMarkerImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFMapMarkerImage *v5;
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
    self = -[_SFPBRFMapMarkerImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFMapMarkerImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFMapMarkerImage *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBRFMapMarkerImage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBRFMapMarkerImage;
  v5 = -[_SFPBRFMapMarkerImage init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coordinate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v6);
      -[_SFPBRFMapMarkerImage setCoordinate:](v5, "setCoordinate:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBRFMapMarkerImage setTitle:](v5, "setTitle:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBRFMapMarkerImage setSystemImage:](v5, "setSystemImage:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (_SFPBLatLng)coordinate
{
  return self->_coordinate;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImage
{
  return self->_systemImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end
