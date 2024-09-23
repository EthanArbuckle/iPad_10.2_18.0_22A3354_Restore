@implementation RFMapMarkerIdentifier

- (RFMapMarkerIdentifier)initWithProtobuf:(id)a3
{
  id v4;
  RFMapMarkerIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RFMapMarkerIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFMapMarkerIdentifier;
  v5 = -[RFMapMarkerIdentifier init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "muid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "muid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerIdentifier setMuid:](v5, "setMuid:", v7);

    }
    objc_msgSend(v4, "resultProviderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "resultProviderID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerIdentifier setResultProviderID:](v5, "setResultProviderID:", v9);

    }
    if (objc_msgSend(v4, "isForCameraPositionOnly"))
      -[RFMapMarkerIdentifier setIsForCameraPositionOnly:](v5, "setIsForCameraPositionOnly:", objc_msgSend(v4, "isForCameraPositionOnly"));
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsForCameraPositionOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isForCameraPositionOnly = a3;
}

- (BOOL)hasIsForCameraPositionOnly
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFMapMarkerIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapMarkerIdentifier *v6;
  RFMapMarkerIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFMapMarkerIdentifier initWithData:]([_SFPBRFMapMarkerIdentifier alloc], "initWithData:", v5);
  v7 = -[RFMapMarkerIdentifier initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapMarkerIdentifier *v6;

  v4 = a3;
  v6 = -[_SFPBRFMapMarkerIdentifier initWithFacade:]([_SFPBRFMapMarkerIdentifier alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarkerIdentifier data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMapMarkerIdentifier *v2;
  void *v3;

  v2 = -[_SFPBRFMapMarkerIdentifier initWithFacade:]([_SFPBRFMapMarkerIdentifier alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarkerIdentifier dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMapMarkerIdentifier *v2;
  void *v3;

  v2 = -[_SFPBRFMapMarkerIdentifier initWithFacade:]([_SFPBRFMapMarkerIdentifier alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarkerIdentifier jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFMapMarkerIdentifier muid](self, "muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMuid:", v6);

  -[RFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setResultProviderID:", v8);

  objc_msgSend(v4, "setIsForCameraPositionOnly:", -[RFMapMarkerIdentifier isForCameraPositionOnly](self, "isForCameraPositionOnly"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFMapMarkerIdentifier *v5;
  RFMapMarkerIdentifier *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = (RFMapMarkerIdentifier *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFMapMarkerIdentifier isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFMapMarkerIdentifier muid](self, "muid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerIdentifier muid](v6, "muid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[RFMapMarkerIdentifier muid](self, "muid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFMapMarkerIdentifier muid](self, "muid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapMarkerIdentifier muid](v6, "muid");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          LOBYTE(v11) = 0;
          goto LABEL_22;
        }
        v22 = v10;
      }
      -[RFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerIdentifier resultProviderID](v6, "resultProviderID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        LOBYTE(v11) = 0;
        goto LABEL_21;
      }
      -[RFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v19 = v3;
        -[RFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapMarkerIdentifier resultProviderID](v6, "resultProviderID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          LOBYTE(v11) = 0;
          v3 = v19;
LABEL_19:

LABEL_20:
LABEL_21:
          v10 = v22;
          if (!v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v3 = v19;
      }
      v17 = -[RFMapMarkerIdentifier isForCameraPositionOnly](self, "isForCameraPositionOnly");
      v11 = v17 ^ -[RFMapMarkerIdentifier isForCameraPositionOnly](v6, "isForCameraPositionOnly") ^ 1;
      if (!v15)
        goto LABEL_20;
      goto LABEL_19;
    }
    LOBYTE(v11) = 0;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[RFMapMarkerIdentifier muid](self, "muid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[RFMapMarkerIdentifier isForCameraPositionOnly](self, "isForCameraPositionOnly");

  return v7;
}

- (NSString)muid
{
  return self->_muid;
}

- (void)setMuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)resultProviderID
{
  return self->_resultProviderID;
}

- (void)setResultProviderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isForCameraPositionOnly
{
  return self->_isForCameraPositionOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultProviderID, 0);
  objc_storeStrong((id *)&self->_muid, 0);
}

@end
