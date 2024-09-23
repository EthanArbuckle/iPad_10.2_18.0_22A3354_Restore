@implementation _UICellAccessory

- (NSString)identifier
{
  return self->_identifier;
}

- (UIView)view
{
  return self->_view;
}

- (void)setReservedLayoutWidth:(double)a3
{
  self->_reservedLayoutWidth = a3;
}

+ (id)accessoryWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setIdentifier:", v4);

  return v5;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_UICellAccessory)init
{
  _UICellAccessory *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICellAccessory;
  result = -[_UICellAccessory init](&v3, sel_init);
  if (result)
    result->_reservedLayoutWidth = 0.0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (double)reservedLayoutWidth
{
  return self->_reservedLayoutWidth;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = identifier;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = -[NSString isEqual:](v7, "isEqual:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)alwaysNeedsLayout
{
  return self->_alwaysNeedsLayout;
}

@end
