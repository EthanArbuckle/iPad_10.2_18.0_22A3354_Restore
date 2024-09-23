@implementation UIViewConfigurationState

- (id)_initWithState:(id)a3
{
  id v5;
  UIViewConfigurationState *v6;
  UIViewConfigurationState *v7;
  uint64_t v8;
  NSMutableDictionary *customStates;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewConfigurationState.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state != nil"));

  }
  v6 = -[UIViewConfigurationState initWithTraitCollection:](self, "initWithTraitCollection:", *((_QWORD *)v5 + 4));
  v7 = v6;
  if (v6)
  {
    v6->_stateFlags = ($B4C1D8677C6CF89FC39FD309BCEF1DC7)*((_DWORD *)v5 + 6);
    v8 = objc_msgSend(*((id *)v5 + 2), "mutableCopy");
    customStates = v7->_customStates;
    v7->_customStates = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithState:", self);
}

- (BOOL)isFocused
{
  return (*(_BYTE *)&self->_stateFlags >> 3) & 1;
}

- (BOOL)isSelected
{
  return (*(_BYTE *)&self->_stateFlags >> 2) & 1;
}

- (unint64_t)_mutations
{
  return self->_mutations;
}

- (BOOL)isDisabled
{
  return *(_BYTE *)&self->_stateFlags & 1;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)isPinned
{
  return (*(_BYTE *)&self->_stateFlags >> 4) & 1;
}

- (id)_customStatesForSwiftBridging
{
  return self->_customStates;
}

- (BOOL)isHighlighted
{
  return (*(_BYTE *)&self->_stateFlags >> 1) & 1;
}

- (UIViewConfigurationState)initWithTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v6;
  UIViewConfigurationState *v7;
  UIViewConfigurationState *v8;
  void *v10;
  objc_super v11;

  v6 = traitCollection;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewConfigurationState.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitCollection != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)UIViewConfigurationState;
  v7 = -[UIViewConfigurationState init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_traitCollection, traitCollection);

  return v8;
}

- (void)setDisabled:(BOOL)disabled
{
  char stateFlags;

  stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 1) == 0) ^ disabled) & 1) == 0)
  {
    ++self->_mutations;
    *(_BYTE *)&self->_stateFlags = stateFlags & 0xFE | disabled;
  }
}

- (void)setFocused:(BOOL)focused
{
  char stateFlags;
  char v4;

  stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 8) == 0) ^ focused) & 1) == 0)
  {
    ++self->_mutations;
    if (focused)
      v4 = 8;
    else
      v4 = 0;
    *(_BYTE *)&self->_stateFlags = stateFlags & 0xF7 | v4;
  }
}

- (void)setSelected:(BOOL)selected
{
  char stateFlags;
  char v4;

  stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 4) == 0) ^ selected) & 1) == 0)
  {
    ++self->_mutations;
    if (selected)
      v4 = 4;
    else
      v4 = 0;
    *(_BYTE *)&self->_stateFlags = stateFlags & 0xFB | v4;
  }
}

- (void)setHighlighted:(BOOL)highlighted
{
  char stateFlags;
  char v4;

  stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 2) == 0) ^ highlighted) & 1) == 0)
  {
    ++self->_mutations;
    if (highlighted)
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)&self->_stateFlags = stateFlags & 0xFD | v4;
  }
}

- (void)_setContextMenuGroupLocation:(int64_t)a3
{
  id v4;

  if (a3 || self->_customStates)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIViewConfigurationState setCustomState:forKey:](self, "setCustomState:forKey:", v4, CFSTR("_UICompactContextMenuGroupLocation"));

  }
}

- (void)setPinned:(BOOL)pinned
{
  char stateFlags;
  char v4;

  stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 0x10) == 0) ^ pinned) & 1) == 0)
  {
    ++self->_mutations;
    if (pinned)
      v4 = 16;
    else
      v4 = 0;
    *(_BYTE *)&self->_stateFlags = stateFlags & 0xEF | v4;
  }
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *customStates;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self)
    ++self->_mutations;
  customStates = self->_customStates;
  if (!customStates)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_customStates;
    self->_customStates = v8;

    customStates = self->_customStates;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](customStates, "setObject:forKeyedSubscript:", v10, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_customStates, 0);
}

- (unint64_t)_viewConfigurationState
{
  unint64_t v3;

  v3 = (*(_BYTE *)&self->_stateFlags & 0xC | (__rbit32(*(_BYTE *)&self->_stateFlags) >> 30)) & 0xFFFFFFFFFFFFF7FFLL | ((((unint64_t)(*(_BYTE *)&self->_stateFlags & 0x10) >> 4) & 1) << 11);
  if (-[UIViewConfigurationState _contextMenuGroupLocation](self, "_contextMenuGroupLocation"))
    return v3 & 0xFFFFFFFFFFFF8FFFLL | ((-[UIViewConfigurationState _contextMenuGroupLocation](self, "_contextMenuGroupLocation") & 7) << 12);
  return v3;
}

- (int64_t)_contextMenuGroupLocation
{
  void *v2;
  int64_t v3;

  -[UIViewConfigurationState customStateForKey:](self, "customStateForKey:", CFSTR("_UICompactContextMenuGroupLocation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)customStateForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_customStates, "objectForKeyedSubscript:", a3);
}

- (void)_configureWithViewConfigurationState:(unint64_t)a3
{
  -[UIViewConfigurationState setHighlighted:](self, "setHighlighted:", a3 & 1);
  -[UIViewConfigurationState setDisabled:](self, "setDisabled:", (a3 >> 1) & 1);
  -[UIViewConfigurationState setSelected:](self, "setSelected:", (a3 >> 2) & 1);
  -[UIViewConfigurationState setFocused:](self, "setFocused:", (a3 >> 3) & 1);
  -[UIViewConfigurationState setPinned:](self, "setPinned:", (a3 >> 11) & 1);
  -[UIViewConfigurationState _setContextMenuGroupLocation:](self, "_setContextMenuGroupLocation:", (a3 >> 12) & 7);
}

- (BOOL)isEqual:(id)a3
{
  UIViewConfigurationState *v4;
  UIViewConfigurationState *v5;
  UIViewConfigurationState *v6;
  UIViewConfigurationState *v7;
  _BOOL4 v8;
  UITraitCollection *traitCollection;
  UITraitCollection *v10;
  UITraitCollection *v11;
  UITraitCollection *v12;
  NSMutableDictionary *customStates;
  NSMutableDictionary *v14;
  UITraitCollection *v15;

  v4 = (UIViewConfigurationState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (((*(_BYTE *)&v6->_stateFlags ^ *(_BYTE *)&self->_stateFlags) & 0x1F) != 0)
        {
          LOBYTE(v8) = 0;
LABEL_20:

          goto LABEL_21;
        }
        traitCollection = v6->_traitCollection;
        v10 = self->_traitCollection;
        v11 = traitCollection;
        if (v10 == v11)
        {

        }
        else
        {
          v12 = v11;
          LOBYTE(v8) = 0;
          if (!v10 || !v11)
          {
LABEL_19:

            goto LABEL_20;
          }
          v8 = -[UITraitCollection isEqual:](v10, "isEqual:", v11);

          if (!v8)
            goto LABEL_20;
        }
        customStates = self->_customStates;
        v14 = v7->_customStates;
        v10 = customStates;
        v15 = v14;
        v12 = v15;
        if (v10 == v15)
        {
          LOBYTE(v8) = 1;
        }
        else
        {
          LOBYTE(v8) = 0;
          if (v10 && v15)
            LOBYTE(v8) = -[UITraitCollection isEqual:](v10, "isEqual:", v15);
        }
        goto LABEL_19;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_21:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIViewConfigurationState)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  UIViewConfigurationState *v6;
  UIViewConfigurationState *v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  NSMutableDictionary *customStates;
  objc_super v15;

  v4 = coder;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)UIViewConfigurationState;
    v6 = -[UIViewConfigurationState init](&v15, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_traitCollection, v5);
      *(_BYTE *)&v7->_stateFlags = *(_BYTE *)&v7->_stateFlags & 0xFE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("disabled"));
      if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("highlighted")))
        v8 = 2;
      else
        v8 = 0;
      *(_BYTE *)&v7->_stateFlags = *(_BYTE *)&v7->_stateFlags & 0xFD | v8;
      if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("selected")))
        v9 = 4;
      else
        v9 = 0;
      *(_BYTE *)&v7->_stateFlags = *(_BYTE *)&v7->_stateFlags & 0xFB | v9;
      if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("focused")))
        v10 = 8;
      else
        v10 = 0;
      *(_BYTE *)&v7->_stateFlags = *(_BYTE *)&v7->_stateFlags & 0xF7 | v10;
      if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("pinned")))
        v11 = 16;
      else
        v11 = 0;
      *(_BYTE *)&v7->_stateFlags = *(_BYTE *)&v7->_stateFlags & 0xEF | v11;
      if (!-[NSCoder requiresSecureCoding](v4, "requiresSecureCoding"))
      {
        -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("customStates"));
        v12 = objc_claimAutoreleasedReturnValue();
        customStates = v7->_customStates;
        v7->_customStates = (NSMutableDictionary *)v12;

      }
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_traitCollection, CFSTR("traitCollection"));
  objc_msgSend(v4, "encodeBool:forKey:", *(_BYTE *)&self->_stateFlags & 1, CFSTR("disabled"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_stateFlags >> 1) & 1, CFSTR("highlighted"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_stateFlags >> 2) & 1, CFSTR("selected"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_stateFlags >> 3) & 1, CFSTR("focused"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_stateFlags >> 4) & 1, CFSTR("pinned"));
  if ((objc_msgSend(v4, "requiresSecureCoding") & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_customStates, CFSTR("customStates"));

}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_BYTE *)&self->_stateFlags & 0x1F;
  v4 = -[UITraitCollection hash](self->_traitCollection, "hash") ^ v3;
  return v4 ^ -[NSMutableDictionary hash](self->_customStates, "hash");
}

- (void)_appendPropertiesForDescription:(id)a3
{
  void *v4;
  char stateFlags;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("traitCollection = %@"), self->_traitCollection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  stateFlags = (char)self->_stateFlags;
  if ((stateFlags & 1) != 0)
  {
    objc_msgSend(v6, "addObject:", CFSTR("Disabled"));
    stateFlags = (char)self->_stateFlags;
    if ((stateFlags & 2) == 0)
    {
LABEL_3:
      if ((stateFlags & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_stateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v6, "addObject:", CFSTR("Highlighted"));
  stateFlags = (char)self->_stateFlags;
  if ((stateFlags & 4) == 0)
  {
LABEL_4:
    if ((stateFlags & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v6, "addObject:", CFSTR("Focused"));
    if ((*(_BYTE *)&self->_stateFlags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v6, "addObject:", CFSTR("Selected"));
  stateFlags = (char)self->_stateFlags;
  if ((stateFlags & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((stateFlags & 0x10) != 0)
LABEL_6:
    objc_msgSend(v6, "addObject:", CFSTR("Pinned"));
LABEL_7:

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIViewConfigurationState _appendPropertiesForDescription:](self, "_appendPropertiesForDescription:", v3);
  if (self->_customStates)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Custom = %@"), self->_customStates);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v7, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v6;
  void *v7;
  UITraitCollection *v8;

  v6 = traitCollection;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewConfigurationState.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitCollection != nil"));

    v6 = 0;
  }
  if (self->_traitCollection != v6)
  {
    ++self->_mutations;
    v8 = v6;
    objc_storeStrong((id *)&self->_traitCollection, traitCollection);
    v6 = v8;
  }

}

@end
