@implementation UICellAccessory

- (void)setReservedLayoutWidth:(CGFloat)reservedLayoutWidth
{
  self->_reservedLayoutWidth = reservedLayoutWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (int64_t)_compare:(id)a3
{
  UICellAccessory *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;

  v5 = (UICellAccessory *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICellAccessory.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("other != nil"));

  }
  if (self == v5)
  {
    v8 = 0;
  }
  else
  {
    -[UICellAccessory _identifier](self, "_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessory _identifier](v5, "_identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:", v7);

  }
  return v8;
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_storeStrong((id *)&self->_tintColor, tintColor);
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (void)_setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 24) = self->_displayedState;
    *(_BYTE *)(v4 + 8) = self->_hidden;
    *(double *)(v4 + 32) = self->_reservedLayoutWidth;
    objc_storeStrong((id *)(v4 + 40), self->_tintColor);
    objc_storeStrong(v5 + 2, self->_backgroundColor);
  }
  return v5;
}

- (void)setDisplayedState:(UICellAccessoryDisplayedState)displayedState
{
  self->_displayedState = displayedState;
}

- (UICellAccessory)init
{
  UICellAccessory *v3;
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UICellAccessory;
  v3 = -[UICellAccessory init](&v9, sel_init);
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("UICellAccessory.m"), 30, CFSTR("%@ is an abstract base class and should not be instantiated directly."), v8);

    }
    v3->_displayedState = 0;
    v3->_reservedLayoutWidth = -1.79769313e308;
  }
  return v3;
}

- (CGFloat)reservedLayoutWidth
{
  return self->_reservedLayoutWidth;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)_isSystemType
{
  return 1;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)_backgroundColor
{
  return self->_backgroundColor;
}

- (UICellAccessoryDisplayedState)displayedState
{
  return self->_displayedState;
}

- (int64_t)_defaultPlacementForHeader:(BOOL)a3
{
  return -[UICellAccessory _systemTypePlacementForHeader:](self, "_systemTypePlacementForHeader:", a3) > 199;
}

- (BOOL)isEqual:(id)a3
{
  UICellAccessory *v4;
  UICellAccessory *v5;
  void **v6;
  void **v7;
  char v8;

  v4 = (UICellAccessory *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    if ((void *)self->_displayedState == v6[3]
      && self->_hidden == *((unsigned __int8 *)v6 + 8)
      && self->_reservedLayoutWidth == *((double *)v6 + 4)
      && UIEqual(self->_tintColor, v6[5]))
    {
      v8 = UIEqual(self->_backgroundColor, v7[2]);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  UICellAccessory *v4;
  UICellAccessory *v5;
  BOOL v6;

  v4 = (UICellAccessory *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_displayedState == v5->_displayedState
      && self->_hidden == v5->_hidden
      && self->_reservedLayoutWidth == v5->_reservedLayoutWidth;

  return v6;
}

- (int64_t)_systemType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)_isDisplayedForEditingState:(BOOL)a3
{
  int64_t displayedState;
  void *v6;

  displayedState = self->_displayedState;
  if (!displayedState)
    return 1;
  if (displayedState == 2)
    return !a3;
  if (displayedState != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICellAccessory.m"), 64, CFSTR("Unknown UICellAccessoryDisplayedState value (%ld)"), self->_displayedState);

    return 0;
  }
  return a3;
}

- (NSString)_identifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_1E16EDF20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessory)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UICellAccessory *v5;
  double v6;
  uint64_t v7;
  UIColor *tintColor;
  uint64_t v9;
  UIColor *backgroundColor;
  objc_super v12;

  v4 = coder;
  v12.receiver = self;
  v12.super_class = (Class)UICellAccessory;
  v5 = -[UICellAccessory init](&v12, sel_init);
  if (v5)
  {
    v5->_displayedState = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("displayedState"));
    v5->_hidden = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("hidden"));
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("reservedLayoutWidth"));
    v5->_reservedLayoutWidth = v6;
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v7 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v7;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t displayedState;
  id v5;

  displayedState = self->_displayedState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", displayedState, CFSTR("displayedState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hidden, CFSTR("hidden"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("reservedLayoutWidth"), self->_reservedLayoutWidth);
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));

}

- (unint64_t)hash
{
  return self->_displayedState ^ self->_hidden ^ (unint64_t)self->_reservedLayoutWidth;
}

@end
