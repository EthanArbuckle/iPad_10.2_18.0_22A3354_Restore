@implementation RFMapAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFMapAnnotation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapAnnotation *v6;
  RFMapAnnotation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFMapAnnotation initWithData:]([_SFPBRFMapAnnotation alloc], "initWithData:", v5);
  v7 = -[RFMapAnnotation initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapAnnotation *v6;

  v4 = a3;
  v6 = -[_SFPBRFMapAnnotation initWithFacade:]([_SFPBRFMapAnnotation alloc], "initWithFacade:", self);
  -[_SFPBRFMapAnnotation data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMapAnnotation *v2;
  void *v3;

  v2 = -[_SFPBRFMapAnnotation initWithFacade:]([_SFPBRFMapAnnotation alloc], "initWithFacade:", self);
  -[_SFPBRFMapAnnotation dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMapAnnotation *v2;
  void *v3;

  v2 = -[_SFPBRFMapAnnotation initWithFacade:]([_SFPBRFMapAnnotation alloc], "initWithFacade:", self);
  -[_SFPBRFMapAnnotation jsonData](v2, "jsonData");
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
  -[RFMapAnnotation coordinate](self, "coordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCoordinate:", v6);

  -[RFMapAnnotation content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setContent:", v8);

  -[RFMapAnnotation title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setTitle:", v10);

  -[RFMapAnnotation anchor](self, "anchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setAnchor:", v12);

  -[RFMapAnnotation label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setLabel:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFMapAnnotation *v4;
  RFMapAnnotation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
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
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
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
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = (RFMapAnnotation *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[RFMapAnnotation isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[RFMapAnnotation coordinate](self, "coordinate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapAnnotation coordinate](v5, "coordinate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v10 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[RFMapAnnotation coordinate](self, "coordinate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFMapAnnotation coordinate](self, "coordinate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapAnnotation coordinate](v5, "coordinate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_35;
        }
        v46 = v9;
      }
      -[RFMapAnnotation content](self, "content");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapAnnotation content](v5, "content");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v48 == 0) != (v11 != 0))
      {
        -[RFMapAnnotation content](self, "content");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[RFMapAnnotation content](self, "content");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFMapAnnotation content](v5, "content");
          v43 = v14;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "isEqual:"))
          {
            v10 = 0;
            v18 = v44;
            goto LABEL_32;
          }
          v45 = v13;
        }
        else
        {
          v45 = 0;
        }
        -[RFMapAnnotation title](self, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapAnnotation title](v5, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v15 == 0) != (v16 != 0))
        {
          v41 = v15;
          v42 = v16;
          -[RFMapAnnotation title](self, "title");
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            -[RFMapAnnotation title](self, "title");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFMapAnnotation title](v5, "title");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v17;
            if (!objc_msgSend(v17, "isEqual:"))
            {
              v10 = 0;
              v13 = v45;
              v18 = v44;
              v19 = (void *)v40;
              goto LABEL_30;
            }
          }
          -[RFMapAnnotation anchor](self, "anchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFMapAnnotation anchor](v5, "anchor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v20 == 0) == (v21 != 0))
          {

            v10 = 0;
            v13 = v45;
            v18 = v44;
            v19 = (void *)v40;
            if (!v40)
              goto LABEL_31;
            goto LABEL_30;
          }
          v36 = v21;
          v37 = v20;
          -[RFMapAnnotation anchor](self, "anchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v44;
          if (v22)
          {
            -[RFMapAnnotation anchor](self, "anchor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFMapAnnotation anchor](v5, "anchor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v23;
            if (!objc_msgSend(v23, "isEqual:", v33))
            {
              v10 = 0;
              goto LABEL_48;
            }
            v35 = v22;
          }
          else
          {
            v35 = 0;
          }
          -[RFMapAnnotation label](self, "label");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFMapAnnotation label](v5, "label");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v25 == 0) == (v26 != 0))
          {

            v10 = 0;
            v18 = v44;
            v22 = v35;
            if (!v35)
            {
LABEL_49:

              v19 = (void *)v40;
              v13 = v45;
              if (!v40)
              {
LABEL_31:

                if (!v13)
                {
LABEL_33:

LABEL_34:
                  v9 = v46;
                  if (!v8)
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
LABEL_30:

              goto LABEL_31;
            }
          }
          else
          {
            v31 = v26;
            v32 = v25;
            -[RFMapAnnotation label](self, "label");
            v27 = objc_claimAutoreleasedReturnValue();
            v18 = v44;
            v22 = v35;
            if (v27)
            {
              v30 = (void *)v27;
              -[RFMapAnnotation label](self, "label");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFMapAnnotation label](v5, "label");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = objc_msgSend(v29, "isEqual:", v28);

              if (!v35)
                goto LABEL_49;
            }
            else
            {

              v10 = 1;
              if (!v35)
                goto LABEL_49;
            }
          }
LABEL_48:

          goto LABEL_49;
        }

        if (v45)
        {

        }
      }

      v10 = 0;
      goto LABEL_34;
    }
    v10 = 0;
  }
LABEL_38:

  return v10;
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
  unint64_t v12;

  -[RFMapAnnotation coordinate](self, "coordinate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFMapAnnotation content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFMapAnnotation title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[RFMapAnnotation anchor](self, "anchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RFMapAnnotation label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (SFLatLng)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (RFVisualProperty)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RFMapPoint)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (RFTextProperty)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (RFMapAnnotation)initWithProtobuf:(id)a3
{
  id v4;
  RFMapAnnotation *v5;
  void *v6;
  SFLatLng *v7;
  void *v8;
  SFLatLng *v9;
  void *v10;
  RFVisualProperty *v11;
  void *v12;
  RFVisualProperty *v13;
  void *v14;
  void *v15;
  void *v16;
  RFMapPoint *v17;
  void *v18;
  RFMapPoint *v19;
  void *v20;
  RFTextProperty *v21;
  void *v22;
  RFTextProperty *v23;
  RFMapAnnotation *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)RFMapAnnotation;
  v5 = -[RFMapAnnotation init](&v26, sel_init);
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
      -[RFMapAnnotation setCoordinate:](v5, "setCoordinate:", v9);

    }
    objc_msgSend(v4, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFVisualProperty alloc];
      objc_msgSend(v4, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFVisualProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFMapAnnotation setContent:](v5, "setContent:", v13);

    }
    objc_msgSend(v4, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMapAnnotation setTitle:](v5, "setTitle:", v15);

    }
    objc_msgSend(v4, "anchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [RFMapPoint alloc];
      objc_msgSend(v4, "anchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[RFMapPoint initWithProtobuf:](v17, "initWithProtobuf:", v18);
      -[RFMapAnnotation setAnchor:](v5, "setAnchor:", v19);

    }
    objc_msgSend(v4, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [RFTextProperty alloc];
      objc_msgSend(v4, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[RFTextProperty initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[RFMapAnnotation setLabel:](v5, "setLabel:", v23);

    }
    v24 = v5;
  }

  return v5;
}

@end
