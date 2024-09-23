@implementation RFTextProperty

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIs_safe_for_logging:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_is_safe_for_logging = a3;
}

- (BOOL)hasIs_safe_for_logging
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFTextProperty)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTextProperty *v6;
  RFTextProperty *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFTextProperty initWithData:]([_SFPBRFTextProperty alloc], "initWithData:", v5);
  v7 = -[RFTextProperty initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTextProperty *v6;

  v4 = a3;
  v6 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", self);
  -[_SFPBRFTextProperty data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTextProperty *v2;
  void *v3;

  v2 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", self);
  -[_SFPBRFTextProperty dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTextProperty *v2;
  void *v3;

  v2 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", self);
  -[_SFPBRFTextProperty jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFTextProperty text_elements](self, "text_elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_elements:", v6);

  objc_msgSend(v4, "setIs_safe_for_logging:", -[RFTextProperty is_safe_for_logging](self, "is_safe_for_logging"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFTextProperty *v6;
  RFTextProperty *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v6 = (RFTextProperty *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFTextProperty isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[RFTextProperty text_elements](self, "text_elements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFTextProperty text_elements](v7, "text_elements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[RFTextProperty text_elements](self, "text_elements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[RFTextProperty text_elements](self, "text_elements"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFTextProperty text_elements](v7, "text_elements"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[RFTextProperty is_safe_for_logging](self, "is_safe_for_logging");
        v11 = v12 ^ -[RFTextProperty is_safe_for_logging](v7, "is_safe_for_logging") ^ 1;
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      goto LABEL_12;
    }
    LOBYTE(v11) = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[RFTextProperty text_elements](self, "text_elements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFTextProperty is_safe_for_logging](self, "is_safe_for_logging");

  return v5;
}

- (NSArray)text_elements
{
  return self->_text_elements;
}

- (void)setText_elements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)is_safe_for_logging
{
  return self->_is_safe_for_logging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_elements, 0);
}

- (RFTextProperty)initWithProtobuf:(id)a3
{
  id v4;
  RFTextProperty *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFTextElement *v13;
  RFTextProperty *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFTextProperty;
  v5 = -[RFTextProperty init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text_elements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "text_elements", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[RFTextElement initWithProtobuf:]([RFTextElement alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[RFTextProperty setText_elements:](v5, "setText_elements:", v7);
    if (objc_msgSend(v4, "is_safe_for_logging"))
      -[RFTextProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v4, "is_safe_for_logging"));
    v14 = v5;

  }
  return v5;
}

@end
