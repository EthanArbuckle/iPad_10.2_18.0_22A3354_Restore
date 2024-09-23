@implementation RFTextElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFTextElement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTextElement *v6;
  RFTextElement *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFTextElement initWithData:]([_SFPBRFTextElement alloc], "initWithData:", v5);
  v7 = -[RFTextElement initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTextElement *v6;

  v4 = a3;
  v6 = -[_SFPBRFTextElement initWithFacade:]([_SFPBRFTextElement alloc], "initWithFacade:", self);
  -[_SFPBRFTextElement data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTextElement *v2;
  void *v3;

  v2 = -[_SFPBRFTextElement initWithFacade:]([_SFPBRFTextElement alloc], "initWithFacade:", self);
  -[_SFPBRFTextElement dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTextElement *v2;
  void *v3;

  v2 = -[_SFPBRFTextElement initWithFacade:]([_SFPBRFTextElement alloc], "initWithFacade:", self);
  -[_SFPBRFTextElement jsonData](v2, "jsonData");
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
  -[RFTextElement formatted_text](self, "formatted_text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setFormatted_text:", v6);

  -[RFTextElement line_limit](self, "line_limit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setLine_limit:", v8);

  -[RFTextElement show_more_on_tap](self, "show_more_on_tap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setShow_more_on_tap:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFTextElement *v5;
  RFTextElement *v6;
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

  v5 = (RFTextElement *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFTextElement isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFTextElement formatted_text](self, "formatted_text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTextElement formatted_text](v6, "formatted_text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[RFTextElement formatted_text](self, "formatted_text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFTextElement formatted_text](self, "formatted_text");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTextElement formatted_text](v6, "formatted_text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[RFTextElement line_limit](self, "line_limit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTextElement line_limit](v6, "line_limit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[RFTextElement line_limit](self, "line_limit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v25 = v12;
        -[RFTextElement line_limit](self, "line_limit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTextElement line_limit](v6, "line_limit");
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
      -[RFTextElement show_more_on_tap](self, "show_more_on_tap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTextElement show_more_on_tap](v6, "show_more_on_tap");
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
        -[RFTextElement show_more_on_tap](self, "show_more_on_tap");
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          -[RFTextElement show_more_on_tap](self, "show_more_on_tap");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFTextElement show_more_on_tap](v6, "show_more_on_tap");
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

  -[RFTextElement formatted_text](self, "formatted_text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFTextElement line_limit](self, "line_limit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFTextElement show_more_on_tap](self, "show_more_on_tap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSArray)formatted_text
{
  return self->_formatted_text;
}

- (void)setFormatted_text:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)line_limit
{
  return self->_line_limit;
}

- (void)setLine_limit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RFShowMoreOnTap)show_more_on_tap
{
  return self->_show_more_on_tap;
}

- (void)setShow_more_on_tap:(id)a3
{
  objc_storeStrong((id *)&self->_show_more_on_tap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_show_more_on_tap, 0);
  objc_storeStrong((id *)&self->_line_limit, 0);
  objc_storeStrong((id *)&self->_formatted_text, 0);
}

- (RFTextElement)initWithProtobuf:(id)a3
{
  id v4;
  RFTextElement *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFFormattedText *v13;
  void *v14;
  void *v15;
  RFShowMoreOnTap *v16;
  void *v17;
  RFShowMoreOnTap *v18;
  RFTextElement *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RFTextElement;
  v5 = -[RFTextElement init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "formatted_texts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "formatted_texts", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = -[RFFormattedText initWithProtobuf:]([RFFormattedText alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v10);
    }

    -[RFTextElement setFormatted_text:](v5, "setFormatted_text:", v7);
    if (objc_msgSend(v4, "line_limit"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "line_limit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTextElement setLine_limit:](v5, "setLine_limit:", v14);

    }
    objc_msgSend(v4, "show_more_on_tap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [RFShowMoreOnTap alloc];
      objc_msgSend(v4, "show_more_on_tap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[RFShowMoreOnTap initWithProtobuf:](v16, "initWithProtobuf:", v17);
      -[RFTextElement setShow_more_on_tap:](v5, "setShow_more_on_tap:", v18);

    }
    v19 = v5;

  }
  return v5;
}

@end
