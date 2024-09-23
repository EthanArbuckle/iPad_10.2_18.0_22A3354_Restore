@implementation _UICellAccessoryConfigurationCustomView

- (_UICellAccessoryConfigurationCustomView)initWithCustomView:(id)a3
{
  id v6;
  _UICellAccessoryConfigurationCustomView *v7;
  _UICellAccessoryConfigurationCustomView *v8;
  _BOOL8 v9;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICellAccessoryConfiguration.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customView != nil"));

  }
  if ((objc_msgSend(v6, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICellAccessoryConfiguration.m"), 502, CFSTR("Custom view accessories must have translatesAutoresizingMaskIntoConstraints enabled, even if auto layout constraints are used inside them. Custom view: %@"), v6);

  }
  v13.receiver = self;
  v13.super_class = (Class)_UICellAccessoryConfigurationCustomView;
  v7 = -[_UICellAccessoryConfiguration init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_customView, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
    }
    else
    {
      objc_opt_class();
      v9 = (objc_opt_isKindOfClass() & 1) == 0
        || _UICellAccessoryCustomViewDefaultUsesStandardLayoutWidthForCustomButton(v6);
    }
    -[_UICellAccessoryConfiguration setUsesDefaultLayoutWidth:](v8, "setUsesDefaultLayoutWidth:", v9);
  }

  return v8;
}

- (BOOL)_isSystemType
{
  return 0;
}

- (id)_identifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CustomView-%p"), self->_customView);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfigurationCustomView)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _UICellAccessoryConfigurationCustomView *v7;
  _UICellAccessoryConfigurationCustomView *v8;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend(v4, "requiresSecureCoding") & 1) != 0
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customView")),
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    v8 = 0;
    v6 = 0;
  }
  else
  {
    v6 = (void *)v5;
    v10.receiver = self;
    v10.super_class = (Class)_UICellAccessoryConfigurationCustomView;
    v7 = -[_UICellAccessoryConfiguration initWithCoder:](&v10, sel_initWithCoder_, v4);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_customView, v6);
      v8->_maintainsFixedSize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("maintainsFixedSize"));
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationCustomView;
  -[_UICellAccessoryConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if ((objc_msgSend(v4, "requiresSecureCoding") & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_customView, CFSTR("customView"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_maintainsFixedSize, CFSTR("maintainsFixedSize"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationCustomView;
  v4 = -[_UICellAccessoryConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 5, self->_customView);
    *((_BYTE *)v5 + 32) = self->_maintainsFixedSize;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationCustomView;
  v5 = -[_UICellAccessoryConfiguration isEqual:](&v7, sel_isEqual_, v4)
    && self->_customView == (UIView *)v4[5]
    && self->_maintainsFixedSize == *((unsigned __int8 *)v4 + 32);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationCustomView;
  v3 = -[_UICellAccessoryConfiguration hash](&v5, sel_hash);
  return -[UIView hash](self->_customView, "hash") ^ v3 ^ self->_maintainsFixedSize;
}

- (UIView)customView
{
  return self->_customView;
}

- (BOOL)maintainsFixedSize
{
  return self->_maintainsFixedSize;
}

- (void)setMaintainsFixedSize:(BOOL)a3
{
  self->_maintainsFixedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
}

@end
