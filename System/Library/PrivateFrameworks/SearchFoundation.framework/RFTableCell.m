@implementation RFTableCell

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setText:(id)a3
{
  RFVisualProperty *visual;
  id v6;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_text, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  visual = self->_visual;
  self->_visual = 0;

}

- (BOOL)hasText
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVisual:(id)a3
{
  RFTextProperty *text;
  id v6;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_visual, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  text = self->_text;
  self->_text = 0;

}

- (BOOL)hasVisual
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHorizontal_alignment:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_horizontal_alignment = a3;
}

- (BOOL)hasHorizontal_alignment
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setApplySmallCaps:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_applySmallCaps = a3;
}

- (BOOL)hasApplySmallCaps
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (RFTableCell)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableCell *v6;
  RFTableCell *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFTableCell initWithData:]([_SFPBRFTableCell alloc], "initWithData:", v5);
  v7 = -[RFTableCell initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableCell *v6;

  v4 = a3;
  v6 = -[_SFPBRFTableCell initWithFacade:]([_SFPBRFTableCell alloc], "initWithFacade:", self);
  -[_SFPBRFTableCell data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTableCell *v2;
  void *v3;

  v2 = -[_SFPBRFTableCell initWithFacade:]([_SFPBRFTableCell alloc], "initWithFacade:", self);
  -[_SFPBRFTableCell dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTableCell *v2;
  void *v3;

  v2 = -[_SFPBRFTableCell initWithFacade:]([_SFPBRFTableCell alloc], "initWithFacade:", self);
  -[_SFPBRFTableCell jsonData](v2, "jsonData");
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
  if (-[RFTableCell hasText](self, "hasText"))
  {
    -[RFTableCell text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setText:", v6);

  }
  if (-[RFTableCell hasVisual](self, "hasVisual"))
  {
    -[RFTableCell visual](self, "visual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setVisual:", v8);

  }
  -[RFTableCell column_span](self, "column_span");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setColumn_span:", v10);

  objc_msgSend(v4, "setHorizontal_alignment:", -[RFTableCell horizontal_alignment](self, "horizontal_alignment"));
  objc_msgSend(v4, "setApplySmallCaps:", -[RFTableCell applySmallCaps](self, "applySmallCaps"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFTableCell *v5;
  RFTableCell *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v5 = (RFTableCell *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFTableCell isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFTableCell text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableCell text](v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_35:

        goto LABEL_36;
      }
      -[RFTableCell text](self, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFTableCell text](self, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableCell text](v6, "text");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          LOBYTE(v11) = 0;
          goto LABEL_33;
        }
        v35 = v10;
      }
      -[RFTableCell visual](self, "visual");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableCell visual](v6, "visual");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        LOBYTE(v11) = 0;
        goto LABEL_32;
      }
      -[RFTableCell visual](self, "visual");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v28 = v14;
        v16 = v12;
        -[RFTableCell visual](self, "visual");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableCell visual](v6, "visual");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          LOBYTE(v11) = 0;
          v12 = v16;
          v14 = v28;
          goto LABEL_30;
        }
        v30 = v3;
        v34 = v15;
        v12 = v16;
        v14 = v28;
      }
      else
      {
        v30 = v3;
        v34 = 0;
      }
      -[RFTableCell column_span](self, "column_span");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableCell column_span](v6, "column_span");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 == 0) == (v19 != 0))
      {

        LOBYTE(v11) = 0;
        v15 = v34;
        v3 = v30;
        if (!v34)
          goto LABEL_31;
        goto LABEL_30;
      }
      v26 = v19;
      v27 = v18;
      -[RFTableCell column_span](self, "column_span");
      v15 = v34;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29
        || (-[RFTableCell column_span](self, "column_span"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFTableCell column_span](v6, "column_span"),
            v24 = v20,
            v25 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v20, "isEqual:")))
      {
        v3 = v30;
        v31 = -[RFTableCell horizontal_alignment](self, "horizontal_alignment");
        if (v31 == -[RFTableCell horizontal_alignment](v6, "horizontal_alignment"))
        {
          v22 = -[RFTableCell applySmallCaps](self, "applySmallCaps");
          v11 = v22 ^ -[RFTableCell applySmallCaps](v6, "applySmallCaps") ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }
        v21 = (void *)v25;
        if (!v29)
        {
LABEL_29:

          if (!v34)
          {
LABEL_31:

LABEL_32:
            v10 = v35;
            if (!v9)
            {
LABEL_34:

              goto LABEL_35;
            }
LABEL_33:

            goto LABEL_34;
          }
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
        v3 = v30;
        v21 = (void *)v25;
      }

      goto LABEL_29;
    }
    LOBYTE(v11) = 0;
  }
LABEL_36:

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
  uint64_t v9;
  unint64_t v10;

  -[RFTableCell text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFTableCell visual](self, "visual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFTableCell column_span](self, "column_span");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[RFTableCell horizontal_alignment](self, "horizontal_alignment");
  v10 = v9 ^ -[RFTableCell applySmallCaps](self, "applySmallCaps");

  return v10;
}

- (RFTextProperty)text
{
  return self->_text;
}

- (RFVisualProperty)visual
{
  return self->_visual;
}

- (NSNumber)column_span
{
  return self->_column_span;
}

- (void)setColumn_span:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_column_span, 0);
  objc_storeStrong((id *)&self->_visual, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (RFTableCell)initWithProtobuf:(id)a3
{
  id v4;
  RFTableCell *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  RFVisualProperty *v11;
  void *v12;
  RFVisualProperty *v13;
  void *v14;
  RFTableCell *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RFTableCell;
  v5 = -[RFTableCell init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTextProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFTableCell setText:](v5, "setText:", v9);

    }
    objc_msgSend(v4, "visual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFVisualProperty alloc];
      objc_msgSend(v4, "visual");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFVisualProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFTableCell setVisual:](v5, "setVisual:", v13);

    }
    if (objc_msgSend(v4, "column_span"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "column_span"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTableCell setColumn_span:](v5, "setColumn_span:", v14);

    }
    if (objc_msgSend(v4, "horizontal_alignment"))
      -[RFTableCell setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    if (objc_msgSend(v4, "applySmallCaps"))
      -[RFTableCell setApplySmallCaps:](v5, "setApplySmallCaps:", objc_msgSend(v4, "applySmallCaps"));
    v15 = v5;
  }

  return v5;
}

@end
