@implementation SFMediaOffer

- (SFMediaOffer)initWithProtobuf:(id)a3
{
  id v4;
  SFMediaOffer *v5;
  void *v6;
  SFActionItem *v7;
  void *v8;
  SFActionItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFImage *v15;
  void *v16;
  SFImage *v17;
  SFMediaOffer *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFMediaOffer;
  v5 = -[SFMediaOffer init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "actionItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFActionItem alloc];
      objc_msgSend(v4, "actionItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFActionItem initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFMediaOffer setActionItem:](v5, "setActionItem:", v9);

    }
    objc_msgSend(v4, "sublabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "sublabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaOffer setSublabel:](v5, "setSublabel:", v11);

    }
    objc_msgSend(v4, "offerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "offerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaOffer setOfferIdentifier:](v5, "setOfferIdentifier:", v13);

    }
    if (objc_msgSend(v4, "isEnabled"))
      -[SFMediaOffer setIsEnabled:](v5, "setIsEnabled:", objc_msgSend(v4, "isEnabled"));
    objc_msgSend(v4, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFImage initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[SFMediaOffer setImage:](v5, "setImage:", v17);

    }
    v18 = v5;
  }

  return v5;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isEnabled = a3;
}

- (BOOL)hasIsEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMediaOffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaOffer *v6;
  SFMediaOffer *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMediaOffer initWithData:]([_SFPBMediaOffer alloc], "initWithData:", v5);
  v7 = -[SFMediaOffer initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaOffer *v6;

  v4 = a3;
  v6 = -[_SFPBMediaOffer initWithFacade:]([_SFPBMediaOffer alloc], "initWithFacade:", self);
  -[_SFPBMediaOffer data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMediaOffer *v2;
  void *v3;

  v2 = -[_SFPBMediaOffer initWithFacade:]([_SFPBMediaOffer alloc], "initWithFacade:", self);
  -[_SFPBMediaOffer dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMediaOffer *v2;
  void *v3;

  v2 = -[_SFPBMediaOffer initWithFacade:]([_SFPBMediaOffer alloc], "initWithFacade:", self);
  -[_SFPBMediaOffer jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFMediaOffer;
  v4 = -[SFActionItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[SFMediaOffer actionItem](self, "actionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setActionItem:", v6);

  -[SFMediaOffer sublabel](self, "sublabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSublabel:", v8);

  -[SFMediaOffer offerIdentifier](self, "offerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setOfferIdentifier:", v10);

  objc_msgSend(v4, "setIsEnabled:", -[SFMediaOffer isEnabled](self, "isEnabled"));
  -[SFMediaOffer image](self, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setImage:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMediaOffer *v5;
  SFMediaOffer *v6;
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
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
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
  objc_super v44;

  v5 = (SFMediaOffer *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMediaOffer isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v44.receiver = self;
      v44.super_class = (Class)SFMediaOffer;
      if (-[SFActionItem isEqual:](&v44, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFMediaOffer actionItem](self, "actionItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaOffer actionItem](v6, "actionItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_40:

          goto LABEL_41;
        }
        -[SFMediaOffer actionItem](self, "actionItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFMediaOffer actionItem](self, "actionItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaOffer actionItem](v6, "actionItem");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_38;
          }
          v43 = v10;
        }
        -[SFMediaOffer sublabel](self, "sublabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaOffer sublabel](v6, "sublabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_37;
        }
        -[SFMediaOffer sublabel](self, "sublabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v36 = v9;
          v16 = v14;
          v17 = v12;
          -[SFMediaOffer sublabel](self, "sublabel");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaOffer sublabel](v6, "sublabel");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v11 = 0;
            v12 = v17;
            v14 = v16;
            v9 = v36;
            goto LABEL_35;
          }
          v40 = v3;
          v42 = v15;
          v12 = v17;
          v14 = v16;
          v9 = v36;
        }
        else
        {
          v40 = v3;
          v42 = 0;
        }
        -[SFMediaOffer offerIdentifier](self, "offerIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaOffer offerIdentifier](v6, "offerIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          v11 = 0;
          v3 = v40;
          v15 = v42;
          if (!v42)
            goto LABEL_36;
          goto LABEL_35;
        }
        v34 = v20;
        v35 = v19;
        -[SFMediaOffer offerIdentifier](self, "offerIdentifier");
        v15 = v42;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          -[SFMediaOffer offerIdentifier](self, "offerIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaOffer offerIdentifier](v6, "offerIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v21;
          v22 = objc_msgSend(v21, "isEqual:");
          v3 = v40;
          if (!v22)
          {
            v11 = 0;
LABEL_33:

LABEL_34:
            if (!v15)
            {
LABEL_36:

LABEL_37:
              v10 = v43;
              if (!v9)
              {
LABEL_39:

                goto LABEL_40;
              }
LABEL_38:

              goto LABEL_39;
            }
LABEL_35:

            goto LABEL_36;
          }
        }
        else
        {
          v3 = v40;
        }
        v23 = -[SFMediaOffer isEnabled](self, "isEnabled");
        if (v23 == -[SFMediaOffer isEnabled](v6, "isEnabled"))
        {
          -[SFMediaOffer image](self, "image");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaOffer image](v6, "image");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v24 == 0) != (v25 != 0))
          {
            v31 = v25;
            v41 = v24;
            -[SFMediaOffer image](self, "image");
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v30 = (void *)v26;
              -[SFMediaOffer image](self, "image");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMediaOffer image](v6, "image");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v29, "isEqual:", v27);

            }
            else
            {

              v11 = 1;
            }
LABEL_32:
            v15 = v42;
            if (!v37)
              goto LABEL_34;
            goto LABEL_33;
          }

        }
        v11 = 0;
        goto LABEL_32;
      }
    }
    v11 = 0;
  }
LABEL_41:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFMediaOffer;
  v3 = -[SFActionItem hash](&v14, sel_hash);
  -[SFMediaOffer actionItem](self, "actionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFMediaOffer sublabel](self, "sublabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFMediaOffer offerIdentifier](self, "offerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFMediaOffer isEnabled](self, "isEnabled");
  -[SFMediaOffer image](self, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v3;

  return v12;
}

- (SFActionItem)actionItem
{
  return self->_actionItem;
}

- (void)setActionItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionItem, a3);
}

- (NSString)sublabel
{
  return self->_sublabel;
}

- (void)setSublabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setOfferIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_sublabel, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
