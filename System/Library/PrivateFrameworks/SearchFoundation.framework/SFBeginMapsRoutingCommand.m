@implementation SFBeginMapsRoutingCommand

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDirectionsMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_directionsMode = a3;
}

- (BOOL)hasDirectionsMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFBeginMapsRoutingCommand)initWithCoder:(id)a3
{
  id v4;
  SFBeginMapsRoutingCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = -[SFBeginMapsRoutingCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand location](v8, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBeginMapsRoutingCommand setLocation:](v5, "setLocation:", v9);

    -[SFCommand mapsData](v8, "mapsData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBeginMapsRoutingCommand setMapsData:](v5, "setMapsData:", v10);

    -[SFBeginMapsRoutingCommand setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFCommand shouldSearchDirectionsAlongCurrentRoute](v8, "shouldSearchDirectionsAlongCurrentRoute"));
    -[SFCommand name](v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBeginMapsRoutingCommand setName:](v5, "setName:", v11);

    -[SFBeginMapsRoutingCommand setDirectionsMode:](v5, "setDirectionsMode:", -[SFCommand directionsMode](v8, "directionsMode"));
    -[SFCommand commandDetail](v8, "commandDetail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v12);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v13);

    -[SFCommand backendData](v8, "backendData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v14);

    -[SFCommand commandReference](v8, "commandReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFBeginMapsRoutingCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBBeginMapsRoutingCommand *v2;
  void *v3;

  v2 = -[_SFPBBeginMapsRoutingCommand initWithFacade:]([_SFPBBeginMapsRoutingCommand alloc], "initWithFacade:", self);
  -[_SFPBBeginMapsRoutingCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBBeginMapsRoutingCommand *v2;
  void *v3;

  v2 = -[_SFPBBeginMapsRoutingCommand initWithFacade:]([_SFPBBeginMapsRoutingCommand alloc], "initWithFacade:", self);
  -[_SFPBBeginMapsRoutingCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFBeginMapsRoutingCommand;
  v4 = -[SFCommand copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFBeginMapsRoutingCommand location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLocation:", v6);

  -[SFBeginMapsRoutingCommand mapsData](self, "mapsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMapsData:", v8);

  objc_msgSend(v4, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
  -[SFBeginMapsRoutingCommand name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setName:", v10);

  objc_msgSend(v4, "setDirectionsMode:", -[SFBeginMapsRoutingCommand directionsMode](self, "directionsMode"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFBeginMapsRoutingCommand *v4;
  SFBeginMapsRoutingCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  objc_super v32;

  v4 = (SFBeginMapsRoutingCommand *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFBeginMapsRoutingCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)SFBeginMapsRoutingCommand;
      if (-[SFCommand isEqual:](&v32, sel_isEqual_, v4))
      {
        v5 = v4;
        -[SFBeginMapsRoutingCommand location](self, "location");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFBeginMapsRoutingCommand location](v5, "location");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[SFBeginMapsRoutingCommand location](self, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[SFBeginMapsRoutingCommand location](self, "location");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFBeginMapsRoutingCommand location](v5, "location");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            v11 = 0;
            goto LABEL_29;
          }
          v30 = v10;
          v31 = v9;
        }
        -[SFBeginMapsRoutingCommand mapsData](self, "mapsData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFBeginMapsRoutingCommand mapsData](v5, "mapsData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          v9 = v31;
          goto LABEL_28;
        }
        -[SFBeginMapsRoutingCommand mapsData](self, "mapsData");
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          -[SFBeginMapsRoutingCommand mapsData](self, "mapsData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFBeginMapsRoutingCommand mapsData](v5, "mapsData");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            v11 = 0;
            v9 = v31;
            v16 = (void *)v29;
            goto LABEL_26;
          }
        }
        v17 = -[SFBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute");
        if (v17 == -[SFBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](v5, "shouldSearchDirectionsAlongCurrentRoute"))
        {
          -[SFBeginMapsRoutingCommand name](self, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFBeginMapsRoutingCommand name](v5, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v18 == 0) != (v19 != 0))
          {
            v25 = v19;
            -[SFBeginMapsRoutingCommand name](self, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              -[SFBeginMapsRoutingCommand name](self, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFBeginMapsRoutingCommand name](v5, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v20;
              if (!objc_msgSend(v20, "isEqual:"))
              {
                v11 = 0;
LABEL_34:
                v9 = v31;

LABEL_25:
                v16 = (void *)v29;
                if (!v29)
                {
LABEL_27:

LABEL_28:
                  v10 = v30;
                  if (!v8)
                  {
LABEL_30:

                    goto LABEL_31;
                  }
LABEL_29:

                  goto LABEL_30;
                }
LABEL_26:

                goto LABEL_27;
              }
            }
            v22 = -[SFBeginMapsRoutingCommand directionsMode](self, "directionsMode");
            v11 = v22 == -[SFBeginMapsRoutingCommand directionsMode](v5, "directionsMode");
            if (v26)
              goto LABEL_34;

LABEL_24:
            v9 = v31;
            goto LABEL_25;
          }

        }
        v11 = 0;
        goto LABEL_24;
      }
    }
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFBeginMapsRoutingCommand;
  v3 = -[SFCommand hash](&v13, sel_hash);
  -[SFBeginMapsRoutingCommand location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFBeginMapsRoutingCommand mapsData](self, "mapsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute");
  -[SFBeginMapsRoutingCommand name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[SFBeginMapsRoutingCommand directionsMode](self, "directionsMode") ^ v3;

  return v11;
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setMapsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFBeginMapsRoutingCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFBeginMapsRoutingCommand *v5;
  void *v6;
  SFLatLng *v7;
  void *v8;
  SFLatLng *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFBeginMapsRoutingCommand *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFBeginMapsRoutingCommand;
  v5 = -[SFBeginMapsRoutingCommand init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFLatLng alloc];
      objc_msgSend(v4, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFLatLng initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFBeginMapsRoutingCommand setLocation:](v5, "setLocation:", v9);

    }
    objc_msgSend(v4, "mapsData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "mapsData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBeginMapsRoutingCommand setMapsData:](v5, "setMapsData:", v11);

    }
    if (objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"))
      -[SFBeginMapsRoutingCommand setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"));
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBeginMapsRoutingCommand setName:](v5, "setName:", v13);

    }
    if (objc_msgSend(v4, "directionsMode"))
      -[SFBeginMapsRoutingCommand setDirectionsMode:](v5, "setDirectionsMode:", objc_msgSend(v4, "directionsMode"));
    v14 = v5;
  }

  return v5;
}

@end
