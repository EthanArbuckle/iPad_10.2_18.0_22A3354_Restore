@implementation RFVisualProperty

- (RFVisualProperty)initWithProtobuf:(id)a3
{
  id v4;
  RFVisualProperty *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFVisualElement *v13;
  RFVisualProperty *v14;
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
  v20.super_class = (Class)RFVisualProperty;
  v5 = -[RFVisualProperty init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "visual_elements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "visual_elements", 0);
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
          v13 = -[RFVisualElement initWithProtobuf:]([RFVisualElement alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[RFVisualProperty setVisual_elements:](v5, "setVisual_elements:", v7);
    if (objc_msgSend(v4, "is_safe_for_logging"))
      -[RFVisualProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v4, "is_safe_for_logging"));
    v14 = v5;

  }
  return v5;
}

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

- (RFVisualProperty)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFVisualProperty *v6;
  RFVisualProperty *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFVisualProperty initWithData:]([_SFPBRFVisualProperty alloc], "initWithData:", v5);
  v7 = -[RFVisualProperty initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFVisualProperty *v6;

  v4 = a3;
  v6 = -[_SFPBRFVisualProperty initWithFacade:]([_SFPBRFVisualProperty alloc], "initWithFacade:", self);
  -[_SFPBRFVisualProperty data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFVisualProperty *v2;
  void *v3;

  v2 = -[_SFPBRFVisualProperty initWithFacade:]([_SFPBRFVisualProperty alloc], "initWithFacade:", self);
  -[_SFPBRFVisualProperty dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFVisualProperty *v2;
  void *v3;

  v2 = -[_SFPBRFVisualProperty initWithFacade:]([_SFPBRFVisualProperty alloc], "initWithFacade:", self);
  -[_SFPBRFVisualProperty jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFVisualProperty visual_elements](self, "visual_elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setVisual_elements:", v6);

  objc_msgSend(v4, "setIs_safe_for_logging:", -[RFVisualProperty is_safe_for_logging](self, "is_safe_for_logging"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFVisualProperty *v6;
  RFVisualProperty *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v6 = (RFVisualProperty *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFVisualProperty isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[RFVisualProperty visual_elements](self, "visual_elements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFVisualProperty visual_elements](v7, "visual_elements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[RFVisualProperty visual_elements](self, "visual_elements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[RFVisualProperty visual_elements](self, "visual_elements"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFVisualProperty visual_elements](v7, "visual_elements"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[RFVisualProperty is_safe_for_logging](self, "is_safe_for_logging");
        v11 = v12 ^ -[RFVisualProperty is_safe_for_logging](v7, "is_safe_for_logging") ^ 1;
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

  -[RFVisualProperty visual_elements](self, "visual_elements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFVisualProperty is_safe_for_logging](self, "is_safe_for_logging");

  return v5;
}

- (NSArray)visual_elements
{
  return self->_visual_elements;
}

- (void)setVisual_elements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)is_safe_for_logging
{
  return self->_is_safe_for_logging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visual_elements, 0);
}

@end
