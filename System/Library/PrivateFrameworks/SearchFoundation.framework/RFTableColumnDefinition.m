@implementation RFTableColumnDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSpacer:(id)a3
{
  RFTableContentColumnDefinition *content;
  id v6;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_spacer, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  content = self->_content;
  self->_content = 0;

}

- (BOOL)hasSpacer
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setContent:(id)a3
{
  RFTableSpacerColumnDefinition *spacer;
  id v6;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_content, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  spacer = self->_spacer;
  self->_spacer = 0;

}

- (BOOL)hasContent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFTableColumnDefinition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableColumnDefinition *v6;
  RFTableColumnDefinition *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFTableColumnDefinition initWithData:]([_SFPBRFTableColumnDefinition alloc], "initWithData:", v5);
  v7 = -[RFTableColumnDefinition initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableColumnDefinition *v6;

  v4 = a3;
  v6 = -[_SFPBRFTableColumnDefinition initWithFacade:]([_SFPBRFTableColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableColumnDefinition data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTableColumnDefinition *v2;
  void *v3;

  v2 = -[_SFPBRFTableColumnDefinition initWithFacade:]([_SFPBRFTableColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableColumnDefinition dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTableColumnDefinition *v2;
  void *v3;

  v2 = -[_SFPBRFTableColumnDefinition initWithFacade:]([_SFPBRFTableColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableColumnDefinition jsonData](v2, "jsonData");
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
  if (-[RFTableColumnDefinition hasSpacer](self, "hasSpacer"))
  {
    -[RFTableColumnDefinition spacer](self, "spacer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setSpacer:", v6);

  }
  if (-[RFTableColumnDefinition hasContent](self, "hasContent"))
  {
    -[RFTableColumnDefinition content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setContent:", v8);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFTableColumnDefinition *v5;
  RFTableColumnDefinition *v6;
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

  v5 = (RFTableColumnDefinition *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFTableColumnDefinition isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFTableColumnDefinition spacer](self, "spacer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableColumnDefinition spacer](v6, "spacer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[RFTableColumnDefinition spacer](self, "spacer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFTableColumnDefinition spacer](self, "spacer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableColumnDefinition spacer](v6, "spacer");
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
      -[RFTableColumnDefinition content](self, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableColumnDefinition content](v6, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[RFTableColumnDefinition content](self, "content");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[RFTableColumnDefinition content](self, "content");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFTableColumnDefinition content](v6, "content");
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

  -[RFTableColumnDefinition spacer](self, "spacer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFTableColumnDefinition content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (RFTableSpacerColumnDefinition)spacer
{
  return self->_spacer;
}

- (RFTableContentColumnDefinition)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_spacer, 0);
}

- (RFTableColumnDefinition)initWithProtobuf:(id)a3
{
  id v4;
  RFTableColumnDefinition *v5;
  void *v6;
  RFTableSpacerColumnDefinition *v7;
  void *v8;
  RFTableSpacerColumnDefinition *v9;
  void *v10;
  RFTableContentColumnDefinition *v11;
  void *v12;
  RFTableContentColumnDefinition *v13;
  RFTableColumnDefinition *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFTableColumnDefinition;
  v5 = -[RFTableColumnDefinition init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "spacer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTableSpacerColumnDefinition alloc];
      objc_msgSend(v4, "spacer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTableSpacerColumnDefinition initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFTableColumnDefinition setSpacer:](v5, "setSpacer:", v9);

    }
    objc_msgSend(v4, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTableContentColumnDefinition alloc];
      objc_msgSend(v4, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTableContentColumnDefinition initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFTableColumnDefinition setContent:](v5, "setContent:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end
