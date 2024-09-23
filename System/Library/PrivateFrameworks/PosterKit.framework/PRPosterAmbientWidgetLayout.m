@implementation PRPosterAmbientWidgetLayout

- (PRPosterAmbientWidgetLayout)initWithDictionary:(id)a3
{
  id v4;
  PRPosterAmbientWidgetLayout *v5;
  uint64_t v6;
  NSDictionary *widgetLayoutIconState;
  PRPosterAmbientWidgetLayout *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PRPosterAmbientWidgetLayout;
    v5 = -[PRPosterAmbientWidgetLayout init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      widgetLayoutIconState = v5->_widgetLayoutIconState;
      v5->_widgetLayoutIconState = (NSDictionary *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_widgetLayoutIconState, "hash");
}

- (BOOL)isEqualToWidgetLayout:(id)a3
{
  PRPosterAmbientWidgetLayout *v4;
  PRPosterAmbientWidgetLayout *v5;
  char v6;

  v4 = (PRPosterAmbientWidgetLayout *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[NSDictionary isEqual:](self->_widgetLayoutIconState, "isEqual:", v4->_widgetLayoutIconState);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterAmbientWidgetLayout *v4;
  PRPosterAmbientWidgetLayout *v5;
  void *v6;
  char isKindOfClass;
  BOOL v8;

  v4 = (PRPosterAmbientWidgetLayout *)a3;
  v5 = v4;
  if (v4 == self)
    v8 = 1;
  else
    v8 = v4
      && (objc_opt_self(),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0)
      && -[PRPosterAmbientWidgetLayout isEqualToWidgetLayout:](self, "isEqualToWidgetLayout:", v5);

  return v8;
}

- (NSString)description
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PRSPosterUpdateAmbientWidgetsIdentifiers();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("widgetLayoutIconState"));

  objc_msgSend(v2, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  NSDictionary *widgetLayoutIconState;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB38B0];
  widgetLayoutIconState = self->_widgetLayoutIconState;
  v5 = a3;
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", widgetLayoutIconState, 200, 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_widgetLayoutIconStateData"));

}

- (PRPosterAmbientWidgetLayout)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PRPosterAmbientWidgetLayout *v8;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("_widgetLayoutIconStateData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PRPosterAmbientWidgetLayout initWithDictionary:](self, "initWithDictionary:", v7);

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v3;
  NSDictionary *widgetLayoutIconState;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB38B0];
  widgetLayoutIconState = self->_widgetLayoutIconState;
  v5 = a3;
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", widgetLayoutIconState, 200, 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_widgetLayoutIconStateData"));

}

- (PRPosterAmbientWidgetLayout)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PRPosterAmbientWidgetLayout *v8;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("_widgetLayoutIconStateData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PRPosterAmbientWidgetLayout initWithDictionary:](self, "initWithDictionary:", v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRPosterAmbientWidgetLayout initWithDictionary:]([PRPosterAmbientWidgetLayout alloc], "initWithDictionary:", self->_widgetLayoutIconState);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PRPosterAmbientWidgetLayout initWithDictionary:](+[PRMutablePosterAmbientWidgetLayout allocWithZone:](PRMutablePosterAmbientWidgetLayout, "allocWithZone:", a3), "initWithDictionary:", self->_widgetLayoutIconState);
}

- (NSDictionary)widgetLayoutIconState
{
  return self->_widgetLayoutIconState;
}

- (void)setWidgetLayoutIconState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetLayoutIconState, 0);
}

@end
