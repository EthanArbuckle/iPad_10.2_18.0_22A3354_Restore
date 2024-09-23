@implementation _SFPBBeginMapsRoutingCommand

- (_SFPBBeginMapsRoutingCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBBeginMapsRoutingCommand *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBBeginMapsRoutingCommand *v14;

  v4 = a3;
  v5 = -[_SFPBBeginMapsRoutingCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBLatLng initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBBeginMapsRoutingCommand setLocation:](v5, "setLocation:", v9);

    }
    objc_msgSend(v4, "mapsData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "mapsData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBBeginMapsRoutingCommand setMapsData:](v5, "setMapsData:", v11);

    }
    if (objc_msgSend(v4, "hasShouldSearchDirectionsAlongCurrentRoute"))
      -[_SFPBBeginMapsRoutingCommand setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"));
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBBeginMapsRoutingCommand setName:](v5, "setName:", v13);

    }
    if (objc_msgSend(v4, "hasDirectionsMode"))
      -[_SFPBBeginMapsRoutingCommand setDirectionsMode:](v5, "setDirectionsMode:", objc_msgSend(v4, "directionsMode"));
    v14 = v5;
  }

  return v5;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setMapsData:(id)a3
{
  NSData *v4;
  NSData *mapsData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  mapsData = self->_mapsData;
  self->_mapsData = v4;

}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setDirectionsMode:(int)a3
{
  self->_directionsMode = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBBeginMapsRoutingCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBBeginMapsRoutingCommand location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBBeginMapsRoutingCommand mapsData](self, "mapsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteDataField();

  if (-[_SFPBBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"))
  {
    PBDataWriterWriteBOOLField();
  }
  -[_SFPBBeginMapsRoutingCommand name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  v7 = -[_SFPBBeginMapsRoutingCommand directionsMode](self, "directionsMode");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
  }

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
  int shouldSearchDirectionsAlongCurrentRoute;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  int directionsMode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[_SFPBBeginMapsRoutingCommand location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBBeginMapsRoutingCommand location](self, "location");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBBeginMapsRoutingCommand location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBBeginMapsRoutingCommand mapsData](self, "mapsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBBeginMapsRoutingCommand mapsData](self, "mapsData");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBBeginMapsRoutingCommand mapsData](self, "mapsData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_18;
  }
  else
  {

  }
  shouldSearchDirectionsAlongCurrentRoute = self->_shouldSearchDirectionsAlongCurrentRoute;
  if (shouldSearchDirectionsAlongCurrentRoute != objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"))goto LABEL_18;
  -[_SFPBBeginMapsRoutingCommand name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_SFPBBeginMapsRoutingCommand name](self, "name");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_21:
    directionsMode = self->_directionsMode;
    v23 = directionsMode == objc_msgSend(v4, "directionsMode");
    goto LABEL_19;
  }
  v19 = (void *)v18;
  -[_SFPBBeginMapsRoutingCommand name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (v22)
    goto LABEL_21;
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[_SFPBLatLng hash](self->_location, "hash");
  v4 = -[NSData hash](self->_mapsData, "hash");
  if (self->_shouldSearchDirectionsAlongCurrentRoute)
    v5 = 2654435761;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_name, "hash") ^ (2654435761 * self->_directionsMode);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
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
  if (self->_directionsMode)
  {
    v4 = -[_SFPBBeginMapsRoutingCommand directionsMode](self, "directionsMode");
    if (v4 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E40421B0 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("directionsMode"));

  }
  if (self->_location)
  {
    -[_SFPBBeginMapsRoutingCommand location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("location"));

    }
  }
  if (self->_mapsData)
  {
    -[_SFPBBeginMapsRoutingCommand mapsData](self, "mapsData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("mapsData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mapsData"));

    }
  }
  if (self->_name)
  {
    -[_SFPBBeginMapsRoutingCommand name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("name"));

  }
  if (self->_shouldSearchDirectionsAlongCurrentRoute)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("shouldSearchDirectionsAlongCurrentRoute"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBBeginMapsRoutingCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBBeginMapsRoutingCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBBeginMapsRoutingCommand *v5;
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
    self = -[_SFPBBeginMapsRoutingCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBBeginMapsRoutingCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBBeginMapsRoutingCommand *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBBeginMapsRoutingCommand *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBBeginMapsRoutingCommand;
  v5 = -[_SFPBBeginMapsRoutingCommand init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v6);
      -[_SFPBBeginMapsRoutingCommand setLocation:](v5, "setLocation:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      -[_SFPBBeginMapsRoutingCommand setMapsData:](v5, "setMapsData:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldSearchDirectionsAlongCurrentRoute"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBBeginMapsRoutingCommand setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[_SFPBBeginMapsRoutingCommand setName:](v5, "setName:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directionsMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBBeginMapsRoutingCommand setDirectionsMode:](v5, "setDirectionsMode:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (NSString)name
{
  return self->_name;
}

- (int)directionsMode
{
  return self->_directionsMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
