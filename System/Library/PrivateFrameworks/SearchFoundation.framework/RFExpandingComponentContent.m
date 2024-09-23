@implementation RFExpandingComponentContent

- (RFExpandingComponentContent)initWithProtobuf:(id)a3
{
  id v4;
  RFExpandingComponentContent *v5;
  void *v6;
  RFLongItemStandardCardSection *v7;
  void *v8;
  RFLongItemStandardCardSection *v9;
  void *v10;
  RFReferenceFootnoteCardSection *v11;
  void *v12;
  RFReferenceFootnoteCardSection *v13;
  RFExpandingComponentContent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFExpandingComponentContent;
  v5 = -[RFExpandingComponentContent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "long_item_standard_card_section");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFLongItemStandardCardSection alloc];
      objc_msgSend(v4, "long_item_standard_card_section");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFLongItemStandardCardSection initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFExpandingComponentContent setLong_item_standard_card_section:](v5, "setLong_item_standard_card_section:", v9);

    }
    objc_msgSend(v4, "reference_footnote_card_section");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFReferenceFootnoteCardSection alloc];
      objc_msgSend(v4, "reference_footnote_card_section");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFReferenceFootnoteCardSection initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFExpandingComponentContent setReference_footnote_card_section:](v5, "setReference_footnote_card_section:", v13);

    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLong_item_standard_card_section:(id)a3
{
  RFReferenceFootnoteCardSection *reference_footnote_card_section;
  id v6;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_long_item_standard_card_section, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  reference_footnote_card_section = self->_reference_footnote_card_section;
  self->_reference_footnote_card_section = 0;

}

- (BOOL)hasLong_item_standard_card_section
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReference_footnote_card_section:(id)a3
{
  RFLongItemStandardCardSection *long_item_standard_card_section;
  id v6;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_reference_footnote_card_section, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  long_item_standard_card_section = self->_long_item_standard_card_section;
  self->_long_item_standard_card_section = 0;

}

- (BOOL)hasReference_footnote_card_section
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFExpandingComponentContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFExpandingComponentContent *v6;
  RFExpandingComponentContent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFExpandingComponentContent initWithData:]([_SFPBRFExpandingComponentContent alloc], "initWithData:", v5);
  v7 = -[RFExpandingComponentContent initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFExpandingComponentContent *v6;

  v4 = a3;
  v6 = -[_SFPBRFExpandingComponentContent initWithFacade:]([_SFPBRFExpandingComponentContent alloc], "initWithFacade:", self);
  -[_SFPBRFExpandingComponentContent data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFExpandingComponentContent *v2;
  void *v3;

  v2 = -[_SFPBRFExpandingComponentContent initWithFacade:]([_SFPBRFExpandingComponentContent alloc], "initWithFacade:", self);
  -[_SFPBRFExpandingComponentContent dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFExpandingComponentContent *v2;
  void *v3;

  v2 = -[_SFPBRFExpandingComponentContent initWithFacade:]([_SFPBRFExpandingComponentContent alloc], "initWithFacade:", self);
  -[_SFPBRFExpandingComponentContent jsonData](v2, "jsonData");
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
  if (-[RFExpandingComponentContent hasLong_item_standard_card_section](self, "hasLong_item_standard_card_section"))
  {
    -[RFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setLong_item_standard_card_section:", v6);

  }
  if (-[RFExpandingComponentContent hasReference_footnote_card_section](self, "hasReference_footnote_card_section"))
  {
    -[RFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setReference_footnote_card_section:", v8);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFExpandingComponentContent *v5;
  RFExpandingComponentContent *v6;
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
  void *v19;
  void *v20;
  void *v21;

  v5 = (RFExpandingComponentContent *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFExpandingComponentContent isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFExpandingComponentContent long_item_standard_card_section](v6, "long_item_standard_card_section");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[RFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFExpandingComponentContent long_item_standard_card_section](v6, "long_item_standard_card_section");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[RFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFExpandingComponentContent reference_footnote_card_section](v6, "reference_footnote_card_section");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[RFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[RFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFExpandingComponentContent reference_footnote_card_section](v6, "reference_footnote_card_section");
          v20 = v3;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v19, "isEqual:", v17);

          v3 = v20;
        }
        else
        {

          v11 = 1;
        }
      }
      v10 = v21;
      if (!v9)
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (RFLongItemStandardCardSection)long_item_standard_card_section
{
  return self->_long_item_standard_card_section;
}

- (RFReferenceFootnoteCardSection)reference_footnote_card_section
{
  return self->_reference_footnote_card_section;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference_footnote_card_section, 0);
  objc_storeStrong((id *)&self->_long_item_standard_card_section, 0);
}

@end
