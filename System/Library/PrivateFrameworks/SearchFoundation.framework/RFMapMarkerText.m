@implementation RFMapMarkerText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFMapMarkerText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapMarkerText *v6;
  RFMapMarkerText *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFMapMarkerText initWithData:]([_SFPBRFMapMarkerText alloc], "initWithData:", v5);
  v7 = -[RFMapMarkerText initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapMarkerText *v6;

  v4 = a3;
  v6 = -[_SFPBRFMapMarkerText initWithFacade:]([_SFPBRFMapMarkerText alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarkerText data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMapMarkerText *v2;
  void *v3;

  v2 = -[_SFPBRFMapMarkerText initWithFacade:]([_SFPBRFMapMarkerText alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarkerText dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMapMarkerText *v2;
  void *v3;

  v2 = -[_SFPBRFMapMarkerText initWithFacade:]([_SFPBRFMapMarkerText alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarkerText jsonData](v2, "jsonData");
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
  -[RFMapMarkerText coordinate](self, "coordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCoordinate:", v6);

  -[RFMapMarkerText title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTitle:", v8);

  -[RFMapMarkerText monogram](self, "monogram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setMonogram:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFMapMarkerText *v5;
  RFMapMarkerText *v6;
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

  v5 = (RFMapMarkerText *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFMapMarkerText isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFMapMarkerText coordinate](self, "coordinate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerText coordinate](v6, "coordinate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[RFMapMarkerText coordinate](self, "coordinate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFMapMarkerText coordinate](self, "coordinate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapMarkerText coordinate](v6, "coordinate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[RFMapMarkerText title](self, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerText title](v6, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[RFMapMarkerText title](self, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v25 = v12;
        -[RFMapMarkerText title](self, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapMarkerText title](v6, "title");
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
      -[RFMapMarkerText monogram](self, "monogram");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerText monogram](v6, "monogram");
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
        -[RFMapMarkerText monogram](self, "monogram");
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          -[RFMapMarkerText monogram](self, "monogram");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFMapMarkerText monogram](v6, "monogram");
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

  -[RFMapMarkerText coordinate](self, "coordinate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFMapMarkerText title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFMapMarkerText monogram](self, "monogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (SFLatLng)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RFTextProperty)monogram
{
  return self->_monogram;
}

- (void)setMonogram:(id)a3
{
  objc_storeStrong((id *)&self->_monogram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (RFMapMarkerText)initWithProtobuf:(id)a3
{
  id v4;
  RFMapMarkerText *v5;
  void *v6;
  SFLatLng *v7;
  void *v8;
  SFLatLng *v9;
  void *v10;
  void *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  RFTextProperty *v15;
  RFMapMarkerText *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RFMapMarkerText;
  v5 = -[RFMapMarkerText init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "coordinate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFLatLng alloc];
      objc_msgSend(v4, "coordinate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFLatLng initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFMapMarkerText setCoordinate:](v5, "setCoordinate:", v9);

    }
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarkerText setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "monogram");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [RFTextProperty alloc];
      objc_msgSend(v4, "monogram");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RFTextProperty initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[RFMapMarkerText setMonogram:](v5, "setMonogram:", v15);

    }
    v16 = v5;
  }

  return v5;
}

@end
