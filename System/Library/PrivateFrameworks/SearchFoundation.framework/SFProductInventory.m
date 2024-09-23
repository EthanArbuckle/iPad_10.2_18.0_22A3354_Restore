@implementation SFProductInventory

- (SFProductInventory)initWithProtobuf:(id)a3
{
  id v4;
  SFProductInventory *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFProductInventory *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFProductInventory;
  v5 = -[SFProductInventory init](&v21, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "type"))
      -[SFProductInventory setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "storeId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "storeId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProductInventory setStoreId:](v5, "setStoreId:", v7);

    }
    if (objc_msgSend(v4, "availabilityStatus"))
      -[SFProductInventory setAvailabilityStatus:](v5, "setAvailabilityStatus:", objc_msgSend(v4, "availabilityStatus"));
    objc_msgSend(v4, "distance");
    if (v8 != 0.0)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "distance");
      objc_msgSend(v9, "numberWithFloat:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProductInventory setDistance:](v5, "setDistance:", v10);

    }
    if (objc_msgSend(v4, "distanceUnit"))
      -[SFProductInventory setDistanceUnit:](v5, "setDistanceUnit:", objc_msgSend(v4, "distanceUnit"));
    objc_msgSend(v4, "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v12, "secondsSince1970");
      objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProductInventory setTimestamp:](v5, "setTimestamp:", v14);

    }
    objc_msgSend(v4, "storeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "storeName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProductInventory setStoreName:](v5, "setStoreName:", v16);

    }
    objc_msgSend(v4, "storeAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "storeAddress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProductInventory setStoreAddress:](v5, "setStoreAddress:", v18);

    }
    v19 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAvailabilityStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_availabilityStatus = a3;
}

- (BOOL)hasAvailabilityStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDistanceUnit:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_distanceUnit = a3;
}

- (BOOL)hasDistanceUnit
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFProductInventory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBProductInventory *v6;
  SFProductInventory *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBProductInventory initWithData:]([_SFPBProductInventory alloc], "initWithData:", v5);
  v7 = -[SFProductInventory initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBProductInventory *v6;

  v4 = a3;
  v6 = -[_SFPBProductInventory initWithFacade:]([_SFPBProductInventory alloc], "initWithFacade:", self);
  -[_SFPBProductInventory data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBProductInventory *v2;
  void *v3;

  v2 = -[_SFPBProductInventory initWithFacade:]([_SFPBProductInventory alloc], "initWithFacade:", self);
  -[_SFPBProductInventory dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBProductInventory *v2;
  void *v3;

  v2 = -[_SFPBProductInventory initWithFacade:]([_SFPBProductInventory alloc], "initWithFacade:", self);
  -[_SFPBProductInventory jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFProductInventory type](self, "type"));
  -[SFProductInventory storeId](self, "storeId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setStoreId:", v6);

  objc_msgSend(v4, "setAvailabilityStatus:", -[SFProductInventory availabilityStatus](self, "availabilityStatus"));
  -[SFProductInventory distance](self, "distance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDistance:", v8);

  objc_msgSend(v4, "setDistanceUnit:", -[SFProductInventory distanceUnit](self, "distanceUnit"));
  -[SFProductInventory timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setTimestamp:", v10);

  -[SFProductInventory storeName](self, "storeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setStoreName:", v12);

  -[SFProductInventory storeAddress](self, "storeAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setStoreAddress:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFProductInventory *v6;
  SFProductInventory *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v6 = (SFProductInventory *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFProductInventory isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      v8 = -[SFProductInventory type](self, "type");
      if (v8 != -[SFProductInventory type](v7, "type"))
      {
        v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
      -[SFProductInventory storeId](self, "storeId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProductInventory storeId](v7, "storeId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v9 == 0) == (v10 != 0))
      {
        v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      -[SFProductInventory storeId](self, "storeId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[SFProductInventory storeId](self, "storeId");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFProductInventory storeId](v7, "storeId");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v12 = 0;
          goto LABEL_31;
        }
      }
      v13 = -[SFProductInventory availabilityStatus](self, "availabilityStatus");
      if (v13 == -[SFProductInventory availabilityStatus](v7, "availabilityStatus"))
      {
        -[SFProductInventory distance](self, "distance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFProductInventory distance](v7, "distance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v14 == 0) != (v15 != 0))
        {
          v49 = v15;
          -[SFProductInventory distance](self, "distance");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            -[SFProductInventory distance](self, "distance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFProductInventory distance](v7, "distance");
            v48 = v16;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v16, "isEqual:"))
            {
              v12 = 0;
              v17 = v14;
              v18 = v50;
              goto LABEL_23;
            }
          }
          v19 = -[SFProductInventory distanceUnit](self, "distanceUnit");
          if (v19 != -[SFProductInventory distanceUnit](v7, "distanceUnit"))
          {
            v12 = 0;
            v17 = v14;
            v18 = v50;
            if (!v50)
              goto LABEL_24;
            goto LABEL_23;
          }
          v46 = v3;
          -[SFProductInventory timestamp](self, "timestamp");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFProductInventory timestamp](v7, "timestamp");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v20 == 0) != (v21 != 0))
          {
            v44 = v20;
            v45 = v21;
            -[SFProductInventory timestamp](self, "timestamp");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v14;
            if (v22)
            {
              -[SFProductInventory timestamp](self, "timestamp");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFProductInventory timestamp](v7, "timestamp");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v23;
              if (!objc_msgSend(v23, "isEqual:", v40))
              {
                v12 = 0;
                v18 = v50;
LABEL_52:

LABEL_53:
                v3 = v46;
                v17 = v43;
                if (!v18)
                {
LABEL_24:

                  if (!v11)
                    goto LABEL_32;
                  goto LABEL_31;
                }
LABEL_23:

                goto LABEL_24;
              }
              v42 = v22;
            }
            else
            {
              v42 = 0;
            }
            -[SFProductInventory storeName](self, "storeName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFProductInventory storeName](v7, "storeName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v25 == 0) == (v26 != 0))
            {

              v12 = 0;
              goto LABEL_51;
            }
            v39 = v26;
            v37 = v25;
            -[SFProductInventory storeName](self, "storeName");
            v38 = objc_claimAutoreleasedReturnValue();
            if (!v38
              || (-[SFProductInventory storeName](self, "storeName"),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFProductInventory storeName](v7, "storeName"),
                  v35 = (void *)objc_claimAutoreleasedReturnValue(),
                  v36 = v27,
                  objc_msgSend(v27, "isEqual:")))
            {
              -[SFProductInventory storeAddress](self, "storeAddress");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFProductInventory storeAddress](v7, "storeAddress");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v29 == 0) == (v30 != 0))
              {

                v12 = 0;
              }
              else
              {
                v34 = v30;
                -[SFProductInventory storeAddress](self, "storeAddress");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33)
                {
                  -[SFProductInventory storeAddress](self, "storeAddress");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFProductInventory storeAddress](v7, "storeAddress");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v12 = objc_msgSend(v32, "isEqual:", v31);

                }
                else
                {

                  v12 = 1;
                }
              }
              v25 = v37;
              v28 = (void *)v38;
              if (!v38)
                goto LABEL_50;
            }
            else
            {
              v12 = 0;
              v28 = (void *)v38;
            }

LABEL_50:
LABEL_51:
            v18 = v50;
            v22 = v42;
            if (!v42)
              goto LABEL_53;
            goto LABEL_52;
          }

          if (v50)
          {

          }
          v15 = v49;
          v3 = v46;
        }

      }
      v12 = 0;
      if (!v11)
      {
LABEL_32:

        goto LABEL_33;
      }
LABEL_31:

      goto LABEL_32;
    }
    v12 = 0;
  }
LABEL_35:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  v3 = -[SFProductInventory type](self, "type");
  -[SFProductInventory storeId](self, "storeId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  v6 = -[SFProductInventory availabilityStatus](self, "availabilityStatus");
  -[SFProductInventory distance](self, "distance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v6 ^ objc_msgSend(v7, "hash");
  v9 = -[SFProductInventory distanceUnit](self, "distanceUnit");
  -[SFProductInventory timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[SFProductInventory storeName](self, "storeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v11 ^ objc_msgSend(v12, "hash");
  -[SFProductInventory storeAddress](self, "storeAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (int)type
{
  return self->_type;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (void)setStoreId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)availabilityStatus
{
  return self->_availabilityStatus;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)distanceUnit
{
  return self->_distanceUnit;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)storeName
{
  return self->_storeName;
}

- (void)setStoreName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)storeAddress
{
  return self->_storeAddress;
}

- (void)setStoreAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAddress, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
}

@end
