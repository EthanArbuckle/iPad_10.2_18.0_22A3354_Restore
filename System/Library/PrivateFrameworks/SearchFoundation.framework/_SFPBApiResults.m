@implementation _SFPBApiResults

- (_SFPBApiResults)initWithFacade:(id)a3
{
  id v4;
  _SFPBApiResults *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBFlight *v13;
  _SFPBApiResults *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBApiResults init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasStatus"))
      -[_SFPBApiResults setStatus:](v5, "setStatus:", objc_msgSend(v4, "status"));
    if (objc_msgSend(v4, "hasResultType"))
      -[_SFPBApiResults setResultType:](v5, "setResultType:", objc_msgSend(v4, "resultType"));
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
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
          v13 = -[_SFPBFlight initWithFacade:]([_SFPBFlight alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[_SFPBApiResults setFlights:](v5, "setFlights:", v7);
    v14 = v5;

  }
  return v5;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void)setResultType:(int)a3
{
  self->_resultType = a3;
}

- (void)setFlights:(id)a3
{
  NSArray *v4;
  NSArray *flights;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  flights = self->_flights;
  self->_flights = v4;

}

- (void)clearFlights
{
  -[NSArray removeAllObjects](self->_flights, "removeAllObjects");
}

- (void)addFlights:(id)a3
{
  id v4;
  NSArray *flights;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  flights = self->_flights;
  v8 = v4;
  if (!flights)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_flights;
    self->_flights = v6;

    v4 = v8;
    flights = self->_flights;
  }
  -[NSArray addObject:](flights, "addObject:", v4);

}

- (unint64_t)flightsCount
{
  return -[NSArray count](self->_flights, "count");
}

- (id)flightsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_flights, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBApiResultsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_SFPBApiResults status](self, "status"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBApiResults resultType](self, "resultType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBApiResults flights](self, "flights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int status;
  int resultType;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    status = self->_status;
    if (status == objc_msgSend(v4, "status"))
    {
      resultType = self->_resultType;
      if (resultType == objc_msgSend(v4, "resultType"))
      {
        -[_SFPBApiResults flights](self, "flights");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "flights");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_SFPBApiResults flights](self, "flights");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_12:
            v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          -[_SFPBApiResults flights](self, "flights");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "flights");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = (2654435761 * self->_resultType) ^ (2654435761 * self->_status);
  return v2 ^ -[NSArray hash](self->_flights, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_flights, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_flights;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("flights"));
  }
  if (self->_resultType)
  {
    v12 = -[_SFPBApiResults resultType](self, "resultType");
    if ((_DWORD)v12)
    {
      if ((_DWORD)v12 == 1)
      {
        v13 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("resultType"));

  }
  if (self->_status)
  {
    v14 = -[_SFPBApiResults status](self, "status");
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E4042178 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("status"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBApiResults dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBApiResults)initWithJSON:(id)a3
{
  void *v4;
  _SFPBApiResults *v5;
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
    self = -[_SFPBApiResults initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBApiResults)initWithDictionary:(id)a3
{
  id v4;
  _SFPBApiResults *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _SFPBFlight *v15;
  _SFPBApiResults *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SFPBApiResults;
  v5 = -[_SFPBApiResults init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBApiResults setStatus:](v5, "setStatus:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBApiResults setResultType:](v5, "setResultType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flights"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v7;
      v19 = v6;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[_SFPBFlight initWithDictionary:]([_SFPBFlight alloc], "initWithDictionary:", v14);
              -[_SFPBApiResults addFlights:](v5, "addFlights:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;

  }
  return v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flights, 0);
}

@end
