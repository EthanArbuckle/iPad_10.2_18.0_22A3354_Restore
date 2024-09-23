@implementation RFAttribution

- (RFAttribution)initWithProtobuf:(id)a3
{
  id v4;
  RFAttribution *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  RFTextProperty *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  RFVisualProperty *v15;
  void *v16;
  RFVisualProperty *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SFCommandReference *v26;
  void *v27;
  SFCommandReference *v28;
  RFAttribution *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)RFAttribution;
  v5 = -[RFAttribution init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      objc_msgSend(v4, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTextProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFAttribution setTitle:](v5, "setTitle:", v9);

    }
    objc_msgSend(v4, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFAttribution setSubtitle:](v5, "setSubtitle:", v13);

    }
    objc_msgSend(v4, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFVisualProperty alloc];
      objc_msgSend(v4, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFVisualProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFAttribution setImage:](v5, "setImage:", v17);

    }
    if (objc_msgSend(v4, "index"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "index"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution setIndex:](v5, "setIndex:", v18);

    }
    objc_msgSend(v4, "localized_index");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "localized_index");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution setLocalized_index:](v5, "setLocalized_index:", v20);

    }
    objc_msgSend(v4, "localized_separator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v4, "localized_separator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution setLocalized_separator:](v5, "setLocalized_separator:", v22);

    }
    objc_msgSend(v4, "locale");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "locale");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution setLocale:](v5, "setLocale:", v24);

    }
    objc_msgSend(v4, "commandReference");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = [SFCommandReference alloc];
      objc_msgSend(v4, "commandReference");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[SFCommandReference initWithProtobuf:](v26, "initWithProtobuf:", v27);
      -[RFAttribution setCommandReference:](v5, "setCommandReference:", v28);

    }
    v29 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFAttribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAttribution *v6;
  RFAttribution *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFAttribution initWithData:]([_SFPBRFAttribution alloc], "initWithData:", v5);
  v7 = -[RFAttribution initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAttribution *v6;

  v4 = a3;
  v6 = -[_SFPBRFAttribution initWithFacade:]([_SFPBRFAttribution alloc], "initWithFacade:", self);
  -[_SFPBRFAttribution data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFAttribution *v2;
  void *v3;

  v2 = -[_SFPBRFAttribution initWithFacade:]([_SFPBRFAttribution alloc], "initWithFacade:", self);
  -[_SFPBRFAttribution dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFAttribution *v2;
  void *v3;

  v2 = -[_SFPBRFAttribution initWithFacade:]([_SFPBRFAttribution alloc], "initWithFacade:", self);
  -[_SFPBRFAttribution jsonData](v2, "jsonData");
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFAttribution title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[RFAttribution subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSubtitle:", v8);

  -[RFAttribution image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setImage:", v10);

  -[RFAttribution index](self, "index");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setIndex:", v12);

  -[RFAttribution localized_index](self, "localized_index");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setLocalized_index:", v14);

  -[RFAttribution localized_separator](self, "localized_separator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setLocalized_separator:", v16);

  -[RFAttribution locale](self, "locale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setLocale:", v18);

  -[RFAttribution commandReference](self, "commandReference");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setCommandReference:", v20);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFAttribution *v4;
  RFAttribution *v5;
  void *v6;
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
  void *v20;
  void *v21;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;

  v4 = (RFAttribution *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFAttribution isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[RFAttribution title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v11 = 0;
LABEL_26:

        goto LABEL_27;
      }
      -[RFAttribution title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFAttribution title](self, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAttribution title](v5, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v71 = v10;
        v72 = v9;
      }
      -[RFAttribution subtitle](self, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution subtitle](v5, "subtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 == 0) == (v13 != 0))
        goto LABEL_22;
      -[RFAttribution subtitle](self, "subtitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[RFAttribution subtitle](self, "subtitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAttribution subtitle](v5, "subtitle");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v15;
        if (!objc_msgSend(v15, "isEqual:", v68))
          goto LABEL_20;
      }
      v70 = v14;
      -[RFAttribution image](self, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution image](v5, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_21:

LABEL_22:
          v11 = 0;
          if (!v8)
          {
LABEL_25:

            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_20:

        goto LABEL_21;
      }
      v65 = v16;
      v66 = v17;
      -[RFAttribution image](self, "image");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        -[RFAttribution image](self, "image");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAttribution image](v5, "image");
        v63 = v18;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "isEqual:", v64))
        {
LABEL_49:

LABEL_50:
          if (!v14)
            goto LABEL_21;
          goto LABEL_20;
        }
      }
      -[RFAttribution index](self, "index");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution index](v5, "index");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v20 == 0) == (v21 != 0))
      {

        goto LABEL_48;
      }
      v61 = v20;
      v62 = v21;
      -[RFAttribution index](self, "index");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[RFAttribution index](self, "index");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAttribution index](v5, "index");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isEqual:"))
          goto LABEL_46;
      }
      v58 = v20;
      v60 = v22;
      -[RFAttribution localized_index](self, "localized_index");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution localized_index](v5, "localized_index");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v23 == 0) == (v24 != 0))
      {

        goto LABEL_45;
      }
      v55 = v23;
      v56 = v24;
      -[RFAttribution localized_index](self, "localized_index");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        -[RFAttribution localized_index](self, "localized_index");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAttribution localized_index](v5, "localized_index");
        v53 = v25;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v25, "isEqual:", v54))
          goto LABEL_43;
      }
      -[RFAttribution localized_separator](self, "localized_separator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution localized_separator](v5, "localized_separator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v26 == 0) == (v27 != 0))
      {

        if (!v57)
        {
LABEL_44:

LABEL_45:
          v20 = v58;
          if (!v22)
          {
LABEL_47:

LABEL_48:
            v14 = v70;
            if (!v67)
              goto LABEL_50;
            goto LABEL_49;
          }
LABEL_46:

          goto LABEL_47;
        }
LABEL_43:

        goto LABEL_44;
      }
      v51 = v26;
      v52 = v27;
      -[RFAttribution localized_separator](self, "localized_separator");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        -[RFAttribution localized_separator](self, "localized_separator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAttribution localized_separator](v5, "localized_separator");
        v48 = v29;
        v50 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v29, "isEqual:"))
        {
          v11 = 0;
          v34 = (void *)v50;
LABEL_70:

LABEL_71:
          if (v57)
          {

          }
          if (v60)
          {

          }
          if (v67)
          {

          }
          if (v70)
          {

          }
          if (!v8)
            goto LABEL_25;
LABEL_23:
          v10 = v71;
          v9 = v72;
          goto LABEL_24;
        }
        v49 = v28;
      }
      else
      {
        v49 = 0;
      }
      -[RFAttribution locale](self, "locale");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution locale](v5, "locale");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v30 == 0) == (v31 != 0))
      {

        v11 = 0;
        goto LABEL_69;
      }
      v46 = v31;
      v47 = v30;
      -[RFAttribution locale](self, "locale");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        -[RFAttribution locale](self, "locale");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAttribution locale](v5, "locale");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v33;
        if (!objc_msgSend(v33, "isEqual:"))
        {
          v11 = 0;
          v38 = v54;
          v39 = v47;
LABEL_67:
          v54 = v38;

LABEL_68:
LABEL_69:
          v28 = v49;
          v34 = (void *)v50;
          if (!v49)
            goto LABEL_71;
          goto LABEL_70;
        }
        v45 = v32;
      }
      else
      {
        v45 = 0;
      }
      -[RFAttribution commandReference](self, "commandReference");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAttribution commandReference](v5, "commandReference");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v35 == 0) == (v36 != 0))
      {

        v11 = 0;
      }
      else
      {
        v42 = v36;
        -[RFAttribution commandReference](self, "commandReference");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          -[RFAttribution commandReference](self, "commandReference");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFAttribution commandReference](v5, "commandReference");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v40, "isEqual:");

        }
        else
        {

          v11 = 1;
        }
      }
      v38 = v54;
      v39 = v47;
      v32 = v45;
      if (!v45)
        goto LABEL_68;
      goto LABEL_67;
    }
    v11 = 0;
  }
LABEL_27:

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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[RFAttribution title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFAttribution subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFAttribution image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[RFAttribution index](self, "index");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RFAttribution localized_index](self, "localized_index");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RFAttribution localized_separator](self, "localized_separator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[RFAttribution locale](self, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[RFAttribution commandReference](self, "commandReference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (RFTextProperty)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (RFTextProperty)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (RFVisualProperty)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localized_index
{
  return self->_localized_index;
}

- (void)setLocalized_index:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localized_separator
{
  return self->_localized_separator;
}

- (void)setLocalized_separator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SFCommandReference)commandReference
{
  return self->_commandReference;
}

- (void)setCommandReference:(id)a3
{
  objc_storeStrong((id *)&self->_commandReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localized_separator, 0);
  objc_storeStrong((id *)&self->_localized_index, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
