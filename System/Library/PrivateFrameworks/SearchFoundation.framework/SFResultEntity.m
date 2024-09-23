@implementation SFResultEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFResultEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBResultEntity *v6;
  SFResultEntity *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBResultEntity initWithData:]([_SFPBResultEntity alloc], "initWithData:", v5);
  v7 = -[SFResultEntity initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBResultEntity *v6;

  v4 = a3;
  v6 = -[_SFPBResultEntity initWithFacade:]([_SFPBResultEntity alloc], "initWithFacade:", self);
  -[_SFPBResultEntity data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBResultEntity *v2;
  void *v3;

  v2 = -[_SFPBResultEntity initWithFacade:]([_SFPBResultEntity alloc], "initWithFacade:", self);
  -[_SFPBResultEntity dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBResultEntity *v2;
  void *v3;

  v2 = -[_SFPBResultEntity initWithFacade:]([_SFPBResultEntity alloc], "initWithFacade:", self);
  -[_SFPBResultEntity jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFResultEntity name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  -[SFResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMaps_encrypted_muid:", v8);

  -[SFResultEntity location_type_info](self, "location_type_info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLocation_type_info:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFResultEntity *v5;
  SFResultEntity *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = (SFResultEntity *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFResultEntity isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFResultEntity name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFResultEntity name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[SFResultEntity name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFResultEntity name](self, "name");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFResultEntity name](v6, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[SFResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFResultEntity maps_encrypted_muid](v6, "maps_encrypted_muid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[SFResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v25 = v12;
        -[SFResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFResultEntity maps_encrypted_muid](v6, "maps_encrypted_muid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      -[SFResultEntity location_type_info](self, "location_type_info");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFResultEntity location_type_info](v6, "location_type_info");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v17 == 0) == (v18 != 0))
      {

        v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30)
          goto LABEL_26;
      }
      else
      {
        v24 = v17;
        v26 = v18;
        -[SFResultEntity location_type_info](self, "location_type_info");
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          -[SFResultEntity location_type_info](self, "location_type_info");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFResultEntity location_type_info](v6, "location_type_info");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v22, "isEqual:");

        }
        else
        {

          v11 = 1;
        }
        v3 = v27;
        if (!v30)
          goto LABEL_26;
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    v11 = 0;
  }
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SFResultEntity name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFResultEntity location_type_info](self, "location_type_info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)maps_encrypted_muid
{
  return self->_maps_encrypted_muid;
}

- (void)setMaps_encrypted_muid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SFLocationTypeInfo)location_type_info
{
  return self->_location_type_info;
}

- (void)setLocation_type_info:(id)a3
{
  objc_storeStrong((id *)&self->_location_type_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location_type_info, 0);
  objc_storeStrong((id *)&self->_maps_encrypted_muid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (SFResultEntity)initWithProtobuf:(id)a3
{
  id v4;
  SFResultEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFLocationTypeInfo *v11;
  void *v12;
  SFLocationTypeInfo *v13;
  SFResultEntity *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFResultEntity;
  v5 = -[SFResultEntity init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFResultEntity setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "maps_encrypted_muid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "maps_encrypted_muid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFResultEntity setMaps_encrypted_muid:](v5, "setMaps_encrypted_muid:", v9);

    }
    objc_msgSend(v4, "location_type_info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFLocationTypeInfo alloc];
      objc_msgSend(v4, "location_type_info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFLocationTypeInfo initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFResultEntity setLocation_type_info:](v5, "setLocation_type_info:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end
