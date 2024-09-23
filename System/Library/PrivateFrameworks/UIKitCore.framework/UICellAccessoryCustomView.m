@implementation UICellAccessoryCustomView

- (UICellAccessoryCustomView)initWithCustomView:(UIView *)customView placement:(UICellAccessoryPlacement)placement
{
  UIView *v8;
  UICellAccessoryCustomView *v9;
  UICellAccessoryCustomView *v10;
  double v11;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = customView;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICellAccessory.m"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customView != nil"));

  }
  if (!-[UIView translatesAutoresizingMaskIntoConstraints](v8, "translatesAutoresizingMaskIntoConstraints"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICellAccessory.m"), 847, CFSTR("Custom view accessories must have translatesAutoresizingMaskIntoConstraints enabled, even if auto layout constraints are used inside them. Custom view: %@"), v8);

  }
  v15.receiver = self;
  v15.super_class = (Class)UICellAccessoryCustomView;
  v9 = -[UICellAccessory init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_customView, customView);
    v10->_placement = placement;
    objc_opt_class();
    v11 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (_UICellAccessoryCustomViewDefaultUsesStandardLayoutWidthForCustomButton(v8))
            v11 = -1.79769313e308;
          else
            v11 = 0.0;
        }
        else
        {
          v11 = -1.79769313e308;
        }
      }
    }
    -[UICellAccessory setReservedLayoutWidth:](v10, "setReservedLayoutWidth:", v11);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UICellAccessoryCustomView;
  v4 = -[UICellAccessory copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_customView);
    v5[8] = (id)self->_placement;
    *((_BYTE *)v5 + 48) = self->_maintainsFixedSize;
    v6 = objc_msgSend(self->_position, "copy");
    v7 = v5[9];
    v5[9] = (id)v6;

  }
  return v5;
}

- (BOOL)_isSystemType
{
  return 0;
}

- (UICellAccessoryPosition)position
{
  void *v3;
  void *v4;

  v3 = _Block_copy(self->_position);
  if (!v3)
  {
    if (self->_placement)
      v3 = &__block_literal_global_256_1;
    else
      v3 = &__block_literal_global_360;
  }
  v4 = _Block_copy(v3);

  return v4;
}

- (BOOL)maintainsFixedSize
{
  return self->_maintainsFixedSize;
}

- (UIView)customView
{
  return self->_customView;
}

- (id)_identifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CustomView-%p"), self->_customView);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryCustomView;
  if (-[UICellAccessory isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = self->_customView == (UIView *)v5[7]
      && self->_placement == v5[8]
      && self->_maintainsFixedSize == *((unsigned __int8 *)v5 + 48)
      && self->_position == (id)v5[9];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_position, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

- (void)setPosition:(UICellAccessoryPosition)position
{
  objc_setProperty_nonatomic_copy(self, a2, position, 72);
}

- (void)setMaintainsFixedSize:(BOOL)maintainsFixedSize
{
  self->_maintainsFixedSize = maintainsFixedSize;
}

- (int64_t)_defaultPlacementForHeader:(BOOL)a3
{
  return self->_placement;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryCustomView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  uint64_t v5;
  void *v6;
  UICellAccessoryCustomView *v7;
  UICellAccessoryCustomView *v8;
  objc_super v10;

  v4 = coder;
  if (-[NSCoder requiresSecureCoding](v4, "requiresSecureCoding")
    || (-[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customView")),
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    v8 = 0;
    v6 = 0;
  }
  else
  {
    v6 = (void *)v5;
    v10.receiver = self;
    v10.super_class = (Class)UICellAccessoryCustomView;
    v7 = -[UICellAccessory initWithCoder:](&v10, sel_initWithCoder_, v4);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_customView, v6);
      v8->_placement = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("placement"));
      v8->_maintainsFixedSize = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("maintainsFixedSize"));
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
  v5.super_class = (Class)UICellAccessoryCustomView;
  -[UICellAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if ((objc_msgSend(v4, "requiresSecureCoding") & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_customView, CFSTR("customView"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_placement, CFSTR("placement"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_maintainsFixedSize, CFSTR("maintainsFixedSize"));

}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryCustomView;
  v3 = -[UICellAccessory hash](&v5, sel_hash);
  return -[UIView hash](self->_customView, "hash") ^ v3 ^ self->_placement ^ self->_maintainsFixedSize;
}

uint64_t __37__UICellAccessoryCustomView_position__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count");
}

uint64_t __37__UICellAccessoryCustomView_position__block_invoke_2()
{
  return 0;
}

- (UICellAccessoryPlacement)placement
{
  return self->_placement;
}

@end
