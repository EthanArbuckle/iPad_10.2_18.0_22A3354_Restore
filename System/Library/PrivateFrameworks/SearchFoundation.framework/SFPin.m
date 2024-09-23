@implementation SFPin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPinBehavior:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pinBehavior = a3;
}

- (BOOL)hasPinBehavior
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFPin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPin *v6;
  SFPin *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPin initWithData:]([_SFPBPin alloc], "initWithData:", v5);
  v7 = -[SFPin initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPin *v6;

  v4 = a3;
  v6 = -[_SFPBPin initWithFacade:]([_SFPBPin alloc], "initWithFacade:", self);
  -[_SFPBPin data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPin *v2;
  void *v3;

  v2 = -[_SFPBPin initWithFacade:]([_SFPBPin alloc], "initWithFacade:", self);
  -[_SFPBPin dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPin *v2;
  void *v3;

  v2 = -[_SFPBPin initWithFacade:]([_SFPBPin alloc], "initWithFacade:", self);
  -[_SFPBPin jsonData](v2, "jsonData");
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
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFPin location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLocation:", v6);

  -[SFPin pinColor](self, "pinColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPinColor:", v8);

  -[SFPin label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLabel:", v10);

  -[SFPin resultID](self, "resultID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setResultID:", v12);

  -[SFPin mapsData](self, "mapsData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setMapsData:", v14);

  objc_msgSend(v4, "setPinBehavior:", -[SFPin pinBehavior](self, "pinBehavior"));
  -[SFPin pinText](self, "pinText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setPinText:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFPin *v6;
  SFPin *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v6 = (SFPin *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFPin isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[SFPin location](self, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPin location](v7, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
      -[SFPin location](self, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SFPin location](self, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPin location](v7, "location");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:"))
        {
          v12 = 0;
          goto LABEL_34;
        }
        v55 = v11;
      }
      -[SFPin pinColor](self, "pinColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPin pinColor](v7, "pinColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v57 == 0) == (v56 != 0))
        goto LABEL_32;
      -[SFPin pinColor](self, "pinColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[SFPin pinColor](self, "pinColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPin pinColor](v7, "pinColor");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqual:", v3) & 1) == 0)
        {

LABEL_31:
LABEL_32:

          v12 = 0;
          goto LABEL_33;
        }
        v51 = v14;
        v54 = v9;
        v15 = v58;
        v16 = v13;
      }
      else
      {
        v54 = v9;
        v15 = v58;
        v16 = 0;
      }
      v52 = v3;
      v58 = v15;
      -[SFPin label](self, "label");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPin label](v7, "label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;
      v9 = v54;
      if ((v53 == 0) != (v17 != 0))
      {
        v50 = v17;
        -[SFPin label](self, "label");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          -[SFPin label](self, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPin label](v7, "label");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v12 = 0;
            v24 = v49;
            goto LABEL_57;
          }
          v48 = v16;
        }
        else
        {
          v48 = v16;
        }
        -[SFPin resultID](self, "resultID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPin resultID](v7, "resultID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) != (v20 != 0))
        {
          v45 = v20;
          -[SFPin resultID](self, "resultID");
          v13 = v48;
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v19;
          if (v43)
          {
            -[SFPin resultID](self, "resultID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPin resultID](v7, "resultID");
            v42 = v21;
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v21, "isEqual:"))
            {
              v12 = 0;
              v22 = (void *)v43;
LABEL_55:

LABEL_56:
              v24 = v49;
              if (!v49)
              {
LABEL_58:

                if (v13)
                {

                }
LABEL_33:
                v11 = v55;
                if (!v10)
                {
LABEL_35:

                  goto LABEL_36;
                }
LABEL_34:

                goto LABEL_35;
              }
LABEL_57:

              goto LABEL_58;
            }
          }
          -[SFPin mapsData](self, "mapsData");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPin mapsData](v7, "mapsData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v25 == 0) == (v26 != 0))
          {

            v12 = 0;
            v13 = v48;
            goto LABEL_54;
          }
          v40 = v25;
          v41 = v26;
          -[SFPin mapsData](self, "mapsData");
          v13 = v48;
          v39 = objc_claimAutoreleasedReturnValue();
          if (!v39
            || (-[SFPin mapsData](self, "mapsData"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFPin mapsData](v7, "mapsData"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                v38 = v27,
                objc_msgSend(v27, "isEqual:")))
          {
            v29 = -[SFPin pinBehavior](self, "pinBehavior");
            if (v29 == -[SFPin pinBehavior](v7, "pinBehavior"))
            {
              -[SFPin pinText](self, "pinText");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPin pinText](v7, "pinText");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v30 == 0) == (v31 != 0))
              {

                v12 = 0;
              }
              else
              {
                v36 = v31;
                -[SFPin pinText](self, "pinText");
                v32 = objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  v35 = (void *)v32;
                  -[SFPin pinText](self, "pinText");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFPin pinText](v7, "pinText");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v12 = objc_msgSend(v34, "isEqual:");

                }
                else
                {

                  v12 = 1;
                }
              }
            }
            else
            {
              v12 = 0;
            }
            v28 = (void *)v39;
            if (!v39)
              goto LABEL_53;
          }
          else
          {
            v12 = 0;
            v28 = (void *)v39;
          }

LABEL_53:
LABEL_54:
          v22 = (void *)v43;
          if (!v43)
            goto LABEL_56;
          goto LABEL_55;
        }

        v13 = v48;
        if (v49)
        {

        }
        v17 = v50;
      }

      if (v13)
      {

      }
      goto LABEL_31;
    }
    v12 = 0;
  }
LABEL_37:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  -[SFPin location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFPin pinColor](self, "pinColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFPin label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFPin resultID](self, "resultID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SFPin mapsData](self, "mapsData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v12 ^ -[SFPin pinBehavior](self, "pinBehavior");
  -[SFPin pinText](self, "pinText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (SFColor)pinColor
{
  return self->_pinColor;
}

- (void)setPinColor:(id)a3
{
  objc_storeStrong((id *)&self->_pinColor, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)resultID
{
  return self->_resultID;
}

- (void)setResultID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setMapsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)pinBehavior
{
  return self->_pinBehavior;
}

- (NSString)pinText
{
  return self->_pinText;
}

- (void)setPinText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinText, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_resultID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (SFPin)initWithProtobuf:(id)a3
{
  id v4;
  SFPin *v5;
  void *v6;
  SFLatLng *v7;
  void *v8;
  SFLatLng *v9;
  void *v10;
  SFColor *v11;
  void *v12;
  SFColor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SFPin *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFPin;
  v5 = -[SFPin init](&v24, sel_init);
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
      -[SFPin setLocation:](v5, "setLocation:", v9);

    }
    objc_msgSend(v4, "pinColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFColor alloc];
      objc_msgSend(v4, "pinColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFColor initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFPin setPinColor:](v5, "setPinColor:", v13);

    }
    objc_msgSend(v4, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPin setLabel:](v5, "setLabel:", v15);

    }
    objc_msgSend(v4, "resultID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "resultID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPin setResultID:](v5, "setResultID:", v17);

    }
    objc_msgSend(v4, "mapsData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "mapsData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPin setMapsData:](v5, "setMapsData:", v19);

    }
    if (objc_msgSend(v4, "pinBehavior"))
      -[SFPin setPinBehavior:](v5, "setPinBehavior:", objc_msgSend(v4, "pinBehavior"));
    objc_msgSend(v4, "pinText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "pinText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPin setPinText:](v5, "setPinText:", v21);

    }
    v22 = v5;
  }

  return v5;
}

@end
