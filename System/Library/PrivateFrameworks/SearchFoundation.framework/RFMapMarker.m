@implementation RFMapMarker

- (RFMapMarker)initWithProtobuf:(id)a3
{
  id v4;
  RFMapMarker *v5;
  void *v6;
  RFMapMarkerIdentifier *v7;
  void *v8;
  RFMapMarkerIdentifier *v9;
  void *v10;
  RFMapMarkerText *v11;
  void *v12;
  RFMapMarkerText *v13;
  void *v14;
  RFMapMarkerImage *v15;
  void *v16;
  RFMapMarkerImage *v17;
  void *v18;
  RFColor *v19;
  void *v20;
  RFColor *v21;
  RFMapMarker *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFMapMarker;
  v5 = -[RFMapMarker init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFMapMarkerIdentifier alloc];
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFMapMarkerIdentifier initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFMapMarker setIdentifier:](v5, "setIdentifier:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFMapMarkerText alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFMapMarkerText initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFMapMarker setText:](v5, "setText:", v13);

    }
    objc_msgSend(v4, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFMapMarkerImage alloc];
      objc_msgSend(v4, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFMapMarkerImage initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFMapMarker setImage:](v5, "setImage:", v17);

    }
    objc_msgSend(v4, "tint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFColor alloc];
      objc_msgSend(v4, "tint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFColor initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFMapMarker setTint:](v5, "setTint:", v21);

    }
    v22 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIdentifier:(id)a3
{
  RFMapMarkerText *text;
  RFMapMarkerImage *image;
  id v7;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_identifier, a3);
  v7 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  text = self->_text;
  self->_text = 0;

  *(_BYTE *)&self->_has &= ~4u;
  image = self->_image;
  self->_image = 0;

}

- (BOOL)hasIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setText:(id)a3
{
  RFMapMarkerIdentifier *identifier;
  RFMapMarkerImage *image;
  id v7;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_text, a3);
  v7 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  identifier = self->_identifier;
  self->_identifier = 0;

  *(_BYTE *)&self->_has &= ~4u;
  image = self->_image;
  self->_image = 0;

}

- (BOOL)hasText
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setImage:(id)a3
{
  RFMapMarkerIdentifier *identifier;
  RFMapMarkerText *text;
  id v7;

  *(_BYTE *)&self->_has |= 4u;
  objc_storeStrong((id *)&self->_image, a3);
  v7 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  identifier = self->_identifier;
  self->_identifier = 0;

  *(_BYTE *)&self->_has &= ~2u;
  text = self->_text;
  self->_text = 0;

}

- (BOOL)hasImage
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (RFMapMarker)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapMarker *v6;
  RFMapMarker *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFMapMarker initWithData:]([_SFPBRFMapMarker alloc], "initWithData:", v5);
  v7 = -[RFMapMarker initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapMarker *v6;

  v4 = a3;
  v6 = -[_SFPBRFMapMarker initWithFacade:]([_SFPBRFMapMarker alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarker data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMapMarker *v2;
  void *v3;

  v2 = -[_SFPBRFMapMarker initWithFacade:]([_SFPBRFMapMarker alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarker dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMapMarker *v2;
  void *v3;

  v2 = -[_SFPBRFMapMarker initWithFacade:]([_SFPBRFMapMarker alloc], "initWithFacade:", self);
  -[_SFPBRFMapMarker jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[RFMapMarker hasIdentifier](self, "hasIdentifier"))
  {
    -[RFMapMarker identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setIdentifier:", v6);

  }
  if (-[RFMapMarker hasText](self, "hasText"))
  {
    -[RFMapMarker text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setText:", v8);

  }
  if (-[RFMapMarker hasImage](self, "hasImage"))
  {
    -[RFMapMarker image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setImage:", v10);

  }
  -[RFMapMarker tint](self, "tint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setTint:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFMapMarker *v5;
  RFMapMarker *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v5 = (RFMapMarker *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFMapMarker isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFMapMarker identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarker identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[RFMapMarker identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFMapMarker identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapMarker identifier](v6, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      -[RFMapMarker text](self, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarker text](v6, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_34;
      }
      -[RFMapMarker text](self, "text");
      v15 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        -[RFMapMarker text](self, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapMarker text](v6, "text");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      -[RFMapMarker image](self, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapMarker image](v6, "image");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 == 0) == (v20 != 0))
      {

        v11 = 0;
        v3 = v39;
        v16 = v40;
        if (!v40)
          goto LABEL_33;
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      -[RFMapMarker image](self, "image");
      v16 = v40;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36
        || (-[RFMapMarker image](self, "image"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFMapMarker image](v6, "image"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        -[RFMapMarker tint](self, "tint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapMarker tint](v6, "tint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) == (v23 != 0))
        {

          v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          -[RFMapMarker tint](self, "tint");
          v24 = objc_claimAutoreleasedReturnValue();
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            -[RFMapMarker tint](self, "tint");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFMapMarker tint](v6, "tint");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v27, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_38:

  return v11;
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
  unint64_t v10;

  -[RFMapMarker identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFMapMarker text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFMapMarker image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[RFMapMarker tint](self, "tint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (RFMapMarkerIdentifier)identifier
{
  return self->_identifier;
}

- (RFMapMarkerText)text
{
  return self->_text;
}

- (RFMapMarkerImage)image
{
  return self->_image;
}

- (RFColor)tint
{
  return self->_tint;
}

- (void)setTint:(id)a3
{
  objc_storeStrong((id *)&self->_tint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tint, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
