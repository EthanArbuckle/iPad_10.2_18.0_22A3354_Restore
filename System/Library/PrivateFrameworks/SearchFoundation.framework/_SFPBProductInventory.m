@implementation _SFPBProductInventory

- (_SFPBProductInventory)initWithFacade:(id)a3
{
  id v4;
  _SFPBProductInventory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBDate *v11;
  void *v12;
  _SFPBDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _SFPBProductInventory *v18;

  v4 = a3;
  v5 = -[_SFPBProductInventory init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasType"))
      -[_SFPBProductInventory setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "storeId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "storeId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBProductInventory setStoreId:](v5, "setStoreId:", v7);

    }
    if (objc_msgSend(v4, "hasAvailabilityStatus"))
      -[_SFPBProductInventory setAvailabilityStatus:](v5, "setAvailabilityStatus:", objc_msgSend(v4, "availabilityStatus"));
    objc_msgSend(v4, "distance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "distance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      -[_SFPBProductInventory setDistance:](v5, "setDistance:");

    }
    if (objc_msgSend(v4, "hasDistanceUnit"))
      -[_SFPBProductInventory setDistanceUnit:](v5, "setDistanceUnit:", objc_msgSend(v4, "distanceUnit"));
    objc_msgSend(v4, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBDate alloc];
      objc_msgSend(v4, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBDate initWithNSDate:](v11, "initWithNSDate:", v12);
      -[_SFPBProductInventory setTimestamp:](v5, "setTimestamp:", v13);

    }
    objc_msgSend(v4, "storeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "storeName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBProductInventory setStoreName:](v5, "setStoreName:", v15);

    }
    objc_msgSend(v4, "storeAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "storeAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBProductInventory setStoreAddress:](v5, "setStoreAddress:", v17);

    }
    v18 = v5;
  }

  return v5;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setStoreId:(id)a3
{
  NSString *v4;
  NSString *storeId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  storeId = self->_storeId;
  self->_storeId = v4;

}

- (void)setAvailabilityStatus:(int)a3
{
  self->_availabilityStatus = a3;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (void)setDistanceUnit:(int)a3
{
  self->_distanceUnit = a3;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void)setStoreName:(id)a3
{
  NSString *v4;
  NSString *storeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  storeName = self->_storeName;
  self->_storeName = v4;

}

- (void)setStoreAddress:(id)a3
{
  NSString *v4;
  NSString *storeAddress;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  storeAddress = self->_storeAddress;
  self->_storeAddress = v4;

}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBProductInventoryReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_SFPBProductInventory type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBProductInventory storeId](self, "storeId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBProductInventory availabilityStatus](self, "availabilityStatus"))
    PBDataWriterWriteInt32Field();
  -[_SFPBProductInventory distance](self, "distance");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBProductInventory distanceUnit](self, "distanceUnit"))
    PBDataWriterWriteInt32Field();
  -[_SFPBProductInventory timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBProductInventory storeName](self, "storeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBProductInventory storeAddress](self, "storeAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int availabilityStatus;
  float distance;
  float v15;
  int distanceUnit;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_26;
  -[_SFPBProductInventory storeId](self, "storeId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_25;
  -[_SFPBProductInventory storeId](self, "storeId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBProductInventory storeId](self, "storeId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_26;
  }
  else
  {

  }
  availabilityStatus = self->_availabilityStatus;
  if (availabilityStatus != objc_msgSend(v4, "availabilityStatus"))
    goto LABEL_26;
  distance = self->_distance;
  objc_msgSend(v4, "distance");
  if (distance != v15)
    goto LABEL_26;
  distanceUnit = self->_distanceUnit;
  if (distanceUnit != objc_msgSend(v4, "distanceUnit"))
    goto LABEL_26;
  -[_SFPBProductInventory timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_25;
  -[_SFPBProductInventory timestamp](self, "timestamp");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBProductInventory timestamp](self, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_26;
  }
  else
  {

  }
  -[_SFPBProductInventory storeName](self, "storeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_25;
  -[_SFPBProductInventory storeName](self, "storeName");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBProductInventory storeName](self, "storeName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_26;
  }
  else
  {

  }
  -[_SFPBProductInventory storeAddress](self, "storeAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_SFPBProductInventory storeAddress](self, "storeAddress");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_29:
      v32 = 1;
      goto LABEL_27;
    }
    v28 = (void *)v27;
    -[_SFPBProductInventory storeAddress](self, "storeAddress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeAddress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v32 = 0;
LABEL_27:

  return v32;
}

- (unint64_t)hash
{
  uint64_t type;
  NSUInteger v4;
  uint64_t availabilityStatus;
  float distance;
  BOOL v7;
  double v8;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;

  type = self->_type;
  v4 = -[NSString hash](self->_storeId, "hash");
  availabilityStatus = self->_availabilityStatus;
  distance = self->_distance;
  v7 = distance < 0.0;
  if (distance == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v8 = distance;
    v9 = -v8;
    if (!v7)
      v9 = v8;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v12 += (unint64_t)v11;
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  v13 = 2654435761 * self->_distanceUnit;
  v14 = v4 ^ (2654435761 * type) ^ (2654435761 * availabilityStatus) ^ v12;
  v15 = v13 ^ -[_SFPBDate hash](self->_timestamp, "hash");
  v16 = v14 ^ v15 ^ -[NSString hash](self->_storeName, "hash");
  return v16 ^ -[NSString hash](self->_storeAddress, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_availabilityStatus)
  {
    v4 = -[_SFPBProductInventory availabilityStatus](self, "availabilityStatus");
    if (v4 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042190 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("availabilityStatus"));

  }
  if (self->_distance != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBProductInventory distance](self, "distance");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("distance"));

  }
  if (self->_distanceUnit)
  {
    v8 = -[_SFPBProductInventory distanceUnit](self, "distanceUnit");
    if ((_DWORD)v8)
    {
      if ((_DWORD)v8 == 1)
      {
        v9 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("distanceUnit"));

  }
  if (self->_storeAddress)
  {
    -[_SFPBProductInventory storeAddress](self, "storeAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("storeAddress"));

  }
  if (self->_storeId)
  {
    -[_SFPBProductInventory storeId](self, "storeId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("storeId"));

  }
  if (self->_storeName)
  {
    -[_SFPBProductInventory storeName](self, "storeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("storeName"));

  }
  if (self->_timestamp)
  {
    -[_SFPBProductInventory timestamp](self, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("timestamp"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("timestamp"));

    }
  }
  if (self->_type)
  {
    v19 = -[_SFPBProductInventory type](self, "type");
    if ((_DWORD)v19)
    {
      if ((_DWORD)v19 == 1)
      {
        v20 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v20 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBProductInventory dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBProductInventory)initWithJSON:(id)a3
{
  void *v4;
  _SFPBProductInventory *v5;
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
    self = -[_SFPBProductInventory initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBProductInventory)initWithDictionary:(id)a3
{
  id v4;
  _SFPBProductInventory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _SFPBProductInventory *v18;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBProductInventory;
  v5 = -[_SFPBProductInventory init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBProductInventory setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    v20 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[_SFPBProductInventory setStoreId:](v5, "setStoreId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availabilityStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBProductInventory setAvailabilityStatus:](v5, "setAvailabilityStatus:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[_SFPBProductInventory setDistance:](v5, "setDistance:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distanceUnit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBProductInventory setDistanceUnit:](v5, "setDistanceUnit:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v12);
      -[_SFPBProductInventory setTimestamp:](v5, "setTimestamp:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBProductInventory setStoreName:](v5, "setStoreName:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeAddress"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBProductInventory setStoreAddress:](v5, "setStoreAddress:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (int)availabilityStatus
{
  return self->_availabilityStatus;
}

- (float)distance
{
  return self->_distance;
}

- (int)distanceUnit
{
  return self->_distanceUnit;
}

- (_SFPBDate)timestamp
{
  return self->_timestamp;
}

- (NSString)storeName
{
  return self->_storeName;
}

- (NSString)storeAddress
{
  return self->_storeAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAddress, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
}

@end
