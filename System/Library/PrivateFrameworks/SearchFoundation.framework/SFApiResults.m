@implementation SFApiResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_resultType = a3;
}

- (BOOL)hasResultType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFApiResults)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBApiResults *v6;
  SFApiResults *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBApiResults initWithData:]([_SFPBApiResults alloc], "initWithData:", v5);
  v7 = -[SFApiResults initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBApiResults *v6;

  v4 = a3;
  v6 = -[_SFPBApiResults initWithFacade:]([_SFPBApiResults alloc], "initWithFacade:", self);
  -[_SFPBApiResults data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBApiResults *v2;
  void *v3;

  v2 = -[_SFPBApiResults initWithFacade:]([_SFPBApiResults alloc], "initWithFacade:", self);
  -[_SFPBApiResults dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBApiResults *v2;
  void *v3;

  v2 = -[_SFPBApiResults initWithFacade:]([_SFPBApiResults alloc], "initWithFacade:", self);
  -[_SFPBApiResults jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[SFApiResults status](self, "status"));
  objc_msgSend(v4, "setResultType:", -[SFApiResults resultType](self, "resultType"));
  -[SFApiResults flights](self, "flights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setFlights:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFApiResults *v4;
  SFApiResults *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (SFApiResults *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else if (-[SFApiResults isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFApiResults status](self, "status");
    if (v6 == -[SFApiResults status](v5, "status")
      && (v7 = -[SFApiResults resultType](self, "resultType"), v7 == -[SFApiResults resultType](v5, "resultType")))
    {
      -[SFApiResults flights](self, "flights");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFApiResults flights](v5, "flights");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v13 = 0;
      }
      else
      {
        -[SFApiResults flights](self, "flights");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SFApiResults flights](self, "flights");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFApiResults flights](v5, "flights");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

        }
        else
        {
          v13 = 1;
        }

      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[SFApiResults status](self, "status");
  v4 = -[SFApiResults resultType](self, "resultType") ^ v3;
  -[SFApiResults flights](self, "flights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (int)status
{
  return self->_status;
}

- (int)resultType
{
  return self->_resultType;
}

- (NSArray)flights
{
  return self->_flights;
}

- (void)setFlights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flights, 0);
}

- (SFApiResults)initWithProtobuf:(id)a3
{
  id v4;
  SFApiResults *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFFlight *v13;
  SFApiResults *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFApiResults;
  v5 = -[SFApiResults init](&v20, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "status"))
      -[SFApiResults setStatus:](v5, "setStatus:", objc_msgSend(v4, "status"));
    if (objc_msgSend(v4, "resultType"))
      -[SFApiResults setResultType:](v5, "setResultType:", objc_msgSend(v4, "resultType"));
    objc_msgSend(v4, "flights");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "flights", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFFlight initWithProtobuf:]([SFFlight alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[SFApiResults setFlights:](v5, "setFlights:", v7);
    v14 = v5;

  }
  return v5;
}

@end
