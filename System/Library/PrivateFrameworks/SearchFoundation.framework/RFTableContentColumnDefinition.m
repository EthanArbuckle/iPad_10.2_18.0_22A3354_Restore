@implementation RFTableContentColumnDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHorizontal_alignment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_horizontal_alignment = a3;
}

- (BOOL)hasHorizontal_alignment
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDisable_truncation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_disable_truncation = a3;
}

- (BOOL)hasDisable_truncation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShould_drop_in_flow_layout:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_should_drop_in_flow_layout = a3;
}

- (BOOL)hasShould_drop_in_flow_layout
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (RFTableContentColumnDefinition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableContentColumnDefinition *v6;
  RFTableContentColumnDefinition *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFTableContentColumnDefinition initWithData:]([_SFPBRFTableContentColumnDefinition alloc], "initWithData:", v5);
  v7 = -[RFTableContentColumnDefinition initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableContentColumnDefinition *v6;

  v4 = a3;
  v6 = -[_SFPBRFTableContentColumnDefinition initWithFacade:]([_SFPBRFTableContentColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableContentColumnDefinition data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTableContentColumnDefinition *v2;
  void *v3;

  v2 = -[_SFPBRFTableContentColumnDefinition initWithFacade:]([_SFPBRFTableContentColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableContentColumnDefinition dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTableContentColumnDefinition *v2;
  void *v3;

  v2 = -[_SFPBRFTableContentColumnDefinition initWithFacade:]([_SFPBRFTableContentColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableContentColumnDefinition jsonData](v2, "jsonData");
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
  -[RFTableContentColumnDefinition size_percent](self, "size_percent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSize_percent:", v6);

  objc_msgSend(v4, "setHorizontal_alignment:", -[RFTableContentColumnDefinition horizontal_alignment](self, "horizontal_alignment"));
  -[RFTableContentColumnDefinition drop_order](self, "drop_order");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDrop_order:", v8);

  -[RFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setEqual_size_column_group:", v10);

  objc_msgSend(v4, "setDisable_truncation:", -[RFTableContentColumnDefinition disable_truncation](self, "disable_truncation"));
  objc_msgSend(v4, "setShould_drop_in_flow_layout:", -[RFTableContentColumnDefinition should_drop_in_flow_layout](self, "should_drop_in_flow_layout"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFTableContentColumnDefinition *v6;
  RFTableContentColumnDefinition *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;

  v6 = (RFTableContentColumnDefinition *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFTableContentColumnDefinition isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[RFTableContentColumnDefinition size_percent](self, "size_percent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableContentColumnDefinition size_percent](v7, "size_percent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[RFTableContentColumnDefinition size_percent](self, "size_percent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[RFTableContentColumnDefinition size_percent](self, "size_percent");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableContentColumnDefinition size_percent](v7, "size_percent");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          LOBYTE(v11) = 0;
          goto LABEL_17;
        }
      }
      v12 = -[RFTableContentColumnDefinition horizontal_alignment](self, "horizontal_alignment");
      if (v12 == -[RFTableContentColumnDefinition horizontal_alignment](v7, "horizontal_alignment"))
      {
        -[RFTableContentColumnDefinition drop_order](self, "drop_order");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableContentColumnDefinition drop_order](v7, "drop_order");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 == 0) != (v14 != 0))
        {
          v34 = v14;
          v35 = v13;
          -[RFTableContentColumnDefinition drop_order](self, "drop_order");
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            -[RFTableContentColumnDefinition drop_order](self, "drop_order");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFTableContentColumnDefinition drop_order](v7, "drop_order");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v15;
            if (!objc_msgSend(v15, "isEqual:"))
            {
              LOBYTE(v11) = 0;
              v16 = (void *)v33;
              goto LABEL_26;
            }
          }
          -[RFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFTableContentColumnDefinition equal_size_column_group](v7, "equal_size_column_group");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v18 == 0) == (v19 != 0))
          {

            LOBYTE(v11) = 0;
            v13 = v35;
            v16 = (void *)v33;
            if (!v33)
              goto LABEL_27;
            goto LABEL_26;
          }
          v29 = v19;
          v30 = v18;
          -[RFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[RFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFTableContentColumnDefinition equal_size_column_group](v7, "equal_size_column_group");
            v28 = objc_claimAutoreleasedReturnValue();
            v27 = v21;
            if (!objc_msgSend(v21, "isEqual:"))
            {
              LOBYTE(v11) = 0;
              v16 = (void *)v33;
              v23 = (void *)v28;
              goto LABEL_35;
            }
            v25 = v20;
          }
          else
          {
            v25 = 0;
          }
          v16 = (void *)v33;
          v22 = -[RFTableContentColumnDefinition disable_truncation](self, "disable_truncation", v25, v27);
          if (v22 == -[RFTableContentColumnDefinition disable_truncation](v7, "disable_truncation"))
          {
            v24 = -[RFTableContentColumnDefinition should_drop_in_flow_layout](self, "should_drop_in_flow_layout");
            v11 = v24 ^ -[RFTableContentColumnDefinition should_drop_in_flow_layout](v7, "should_drop_in_flow_layout") ^ 1;
          }
          else
          {
            LOBYTE(v11) = 0;
          }
          v20 = v26;
          v23 = (void *)v28;
          if (!v26)
          {
LABEL_36:

            v13 = v35;
            if (!v16)
            {
LABEL_27:

              if (!v10)
                goto LABEL_18;
              goto LABEL_17;
            }
LABEL_26:

            goto LABEL_27;
          }
LABEL_35:

          goto LABEL_36;
        }

      }
      LOBYTE(v11) = 0;
      if (!v10)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
    LOBYTE(v11) = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  -[RFTableContentColumnDefinition size_percent](self, "size_percent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFTableContentColumnDefinition horizontal_alignment](self, "horizontal_alignment");
  -[RFTableContentColumnDefinition drop_order](self, "drop_order");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[RFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[RFTableContentColumnDefinition disable_truncation](self, "disable_truncation");
  v11 = v9 ^ v10 ^ -[RFTableContentColumnDefinition should_drop_in_flow_layout](self, "should_drop_in_flow_layout");

  return v11;
}

- (NSNumber)size_percent
{
  return self->_size_percent;
}

- (void)setSize_percent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (NSNumber)drop_order
{
  return self->_drop_order;
}

- (void)setDrop_order:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)equal_size_column_group
{
  return self->_equal_size_column_group;
}

- (void)setEqual_size_column_group:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)disable_truncation
{
  return self->_disable_truncation;
}

- (BOOL)should_drop_in_flow_layout
{
  return self->_should_drop_in_flow_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equal_size_column_group, 0);
  objc_storeStrong((id *)&self->_drop_order, 0);
  objc_storeStrong((id *)&self->_size_percent, 0);
}

- (RFTableContentColumnDefinition)initWithProtobuf:(id)a3
{
  id v4;
  RFTableContentColumnDefinition *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RFTableContentColumnDefinition *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RFTableContentColumnDefinition;
  v5 = -[RFTableContentColumnDefinition init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "size_percent");
    if (v6 != 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "size_percent");
      objc_msgSend(v7, "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableContentColumnDefinition setSize_percent:](v5, "setSize_percent:", v8);

    }
    if (objc_msgSend(v4, "horizontal_alignment"))
      -[RFTableContentColumnDefinition setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    if (objc_msgSend(v4, "drop_order"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "drop_order"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableContentColumnDefinition setDrop_order:](v5, "setDrop_order:", v9);

    }
    if (objc_msgSend(v4, "equal_size_column_group"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "equal_size_column_group"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableContentColumnDefinition setEqual_size_column_group:](v5, "setEqual_size_column_group:", v10);

    }
    if (objc_msgSend(v4, "disable_truncation"))
      -[RFTableContentColumnDefinition setDisable_truncation:](v5, "setDisable_truncation:", objc_msgSend(v4, "disable_truncation"));
    if (objc_msgSend(v4, "should_drop_in_flow_layout"))
      -[RFTableContentColumnDefinition setShould_drop_in_flow_layout:](v5, "setShould_drop_in_flow_layout:", objc_msgSend(v4, "should_drop_in_flow_layout"));
    v11 = v5;
  }

  return v5;
}

@end
