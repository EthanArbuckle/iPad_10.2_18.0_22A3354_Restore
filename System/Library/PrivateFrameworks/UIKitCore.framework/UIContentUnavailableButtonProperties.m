@implementation UIContentUnavailableButtonProperties

- (uint64_t)_hasButton
{
  id v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = *(id *)(a1 + 16);
  if ((objc_msgSend(v1, "_hasTitle") & 1) != 0
    || (objc_msgSend(v1, "_hasSubtitle") & 1) != 0
    || (objc_msgSend(v1, "_hasImage") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "showsActivityIndicator");
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[UIButtonConfiguration copy](self->_configuration, "copy");
    v6 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v5;

    v7 = -[UIAction copy](self->_primaryAction, "copy");
    v8 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v7;

    v9 = -[UIMenu copy](self->_menu, "copy");
    v10 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v9;

    *(_BYTE *)(v4 + 12) = self->_enabled;
    *(_QWORD *)(v4 + 40) = self->_role;
    *(CGSize *)(v4 + 56) = self->_minimumSize;
    v11 = -[UIButtonConfiguration copy](self->_defaultConfiguration, "copy");
    v12 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v11;

    *($E86DFEC0DF05A1DED00CBA946940B8E3 *)(v4 + 8) = self->_buttonFlags;
  }
  return (id)v4;
}

- (UIContentUnavailableButtonProperties)init
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  UIContentUnavailableButtonProperties *v7;
  UIButtonConfiguration *v8;
  UIButtonConfiguration *defaultConfiguration;
  objc_super v11;

  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContentUnavailableConstantsForTraitCollection(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultButtonConfigurationForTraitCollection:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIContentUnavailableButtonProperties;
    v7 = -[UIContentUnavailableButtonProperties init](&v11, sel_init);
    self = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_configuration, v5);
      v8 = (UIButtonConfiguration *)objc_msgSend(v6, "copy");
      defaultConfiguration = self->_defaultConfiguration;
      self->_defaultConfiguration = v8;

      self->_enabled = 1;
      self->_role = 0;
      self->_minimumSize = (CGSize)*MEMORY[0x1E0C9D820];
    }
  }

  return self;
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  char *v3;
  void *v4;
  char v5;
  BOOL v6;
  uint64_t v7;
  __int128 v8;
  char *v9;

  v3 = a2;
  if (!a1)
    goto LABEL_19;
  v9 = v3;
  if (objc_msgSend(*(id *)(a1 + 16), "isEqual:", *(_QWORD *)(a1 + 48)))
  {
    if (v9)
      v4 = (void *)*((_QWORD *)v9 + 2);
    else
      v4 = 0;
    objc_storeStrong((id *)(a1 + 16), v4);
  }
  v5 = *(_BYTE *)(a1 + 8);
  v3 = v9;
  if ((v5 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      goto LABEL_8;
  }
  else
  {
    if (v9)
      v6 = v9[12] != 0;
    else
      v6 = 0;
    *(_BYTE *)(a1 + 12) = v6;
    if ((v5 & 2) != 0)
    {
LABEL_8:
      if ((v5 & 4) != 0)
        goto LABEL_19;
      goto LABEL_16;
    }
  }
  if (v9)
    v7 = *((_QWORD *)v9 + 5);
  else
    v7 = 0;
  *(_QWORD *)(a1 + 40) = v7;
  if ((v5 & 4) == 0)
  {
LABEL_16:
    if (v9)
      v8 = *(_OWORD *)(v9 + 56);
    else
      v8 = 0uLL;
    *(_OWORD *)(a1 + 56) = v8;
  }
LABEL_19:

}

- (uint64_t)_isEqualToProperties:(uint64_t)a1
{
  unsigned __int8 *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  int v14;

  v3 = a2;
  if (!a1)
    goto LABEL_23;
  if ((-[UIContentUnavailableButtonProperties _isEqualToPropertiesQuick:](a1, v3) & 1) != 0)
  {
    a1 = 1;
    goto LABEL_23;
  }
  v4 = (void *)*((_QWORD *)v3 + 2);
  v5 = *(id *)(a1 + 16);
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
      goto LABEL_21;
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if (!v8)
      goto LABEL_22;
  }
  v9 = (void *)*((_QWORD *)v3 + 3);
  v5 = *(id *)(a1 + 24);
  v10 = v9;
  if (v5 == v10)
  {

    goto LABEL_16;
  }
  v7 = v10;
  if (!v5 || !v10)
  {
LABEL_21:

    goto LABEL_22;
  }
  v11 = objc_msgSend(v5, "isEqual:", v10);

  if (!v11)
    goto LABEL_22;
LABEL_16:
  v12 = (void *)*((_QWORD *)v3 + 4);
  v5 = *(id *)(a1 + 32);
  v13 = v12;
  if (v5 == v13)
  {

    goto LABEL_25;
  }
  v7 = v13;
  if (!v5 || !v13)
    goto LABEL_21;
  v14 = objc_msgSend(v5, "isEqual:", v13);

  if (!v14)
  {
LABEL_22:
    a1 = 0;
    goto LABEL_23;
  }
LABEL_25:
  if (*(unsigned __int8 *)(a1 + 12) != v3[12] || *(_QWORD *)(a1 + 40) != *((_QWORD *)v3 + 5))
    goto LABEL_22;
  a1 = *(double *)(a1 + 64) == *((double *)v3 + 8) && *(double *)(a1 + 56) == *((double *)v3 + 7);
LABEL_23:

  return a1;
}

- (uint64_t)_isEqualToPropertiesQuick:(uint64_t)a1
{
  _QWORD *v3;
  double *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  int v15;

  v3 = a2;
  v4 = (double *)v3;
  if (!a1)
    goto LABEL_23;
  if (v3 == (_QWORD *)a1)
  {
    a1 = 1;
    goto LABEL_23;
  }
  v5 = (void *)v3[2];
  v6 = *(id *)(a1 + 16);
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
      goto LABEL_21;
    v9 = objc_msgSend(v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_22;
  }
  v10 = (void *)*((_QWORD *)v4 + 3);
  v6 = *(id *)(a1 + 24);
  v11 = v10;
  if (v6 == v11)
  {

    goto LABEL_16;
  }
  v8 = v11;
  if (!v6 || !v11)
  {
LABEL_21:

    goto LABEL_22;
  }
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (!v12)
    goto LABEL_22;
LABEL_16:
  v13 = (void *)*((_QWORD *)v4 + 4);
  v6 = *(id *)(a1 + 32);
  v14 = v13;
  if (v6 == v14)
  {

    goto LABEL_25;
  }
  v8 = v14;
  if (!v6 || !v14)
    goto LABEL_21;
  v15 = objc_msgSend(v6, "isEqual:", v14);

  if (!v15)
  {
LABEL_22:
    a1 = 0;
    goto LABEL_23;
  }
LABEL_25:
  if (*(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v4 + 12) || *(_QWORD *)(a1 + 40) != *((_QWORD *)v4 + 5))
    goto LABEL_22;
  a1 = *(double *)(a1 + 64) == v4[8] && *(double *)(a1 + 56) == v4[7];
LABEL_23:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableButtonProperties)initWithCoder:(id)a3
{
  id v4;
  UIContentUnavailableButtonProperties *v5;
  uint64_t v6;
  UIButtonConfiguration *configuration;
  uint64_t v8;
  UIAction *primaryAction;
  uint64_t v10;
  UIMenu *menu;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  UIButtonConfiguration *defaultConfiguration;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UIContentUnavailableButtonProperties;
  v5 = -[UIContentUnavailableButtonProperties init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (UIButtonConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAction"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryAction = v5->_primaryAction;
    v5->_primaryAction = (UIAction *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("menu"));
    v10 = objc_claimAutoreleasedReturnValue();
    menu = v5->_menu;
    v5->_menu = (UIMenu *)v10;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    v5->_role = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("role"));
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("minimumSize"));
    v5->_minimumSize.width = v12;
    v5->_minimumSize.height = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultConfiguration"));
    v14 = objc_claimAutoreleasedReturnValue();
    defaultConfiguration = v5->_defaultConfiguration;
    v5->_defaultConfiguration = (UIButtonConfiguration *)v14;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("enabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_buttonFlags = *(_BYTE *)&v5->_buttonFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", v16);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("role"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v17))
      v18 = 2;
    else
      v18 = 0;
    *(_BYTE *)&v5->_buttonFlags = *(_BYTE *)&v5->_buttonFlags & 0xFD | v18;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("minimumSize"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v19))
      v20 = 4;
    else
      v20 = 0;
    *(_BYTE *)&v5->_buttonFlags = *(_BYTE *)&v5->_buttonFlags & 0xFB | v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIButtonConfiguration *configuration;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  configuration = self->_configuration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", configuration, CFSTR("configuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryAction, CFSTR("primaryAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_menu, CFSTR("menu"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_role, CFSTR("role"));
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("minimumSize"), self->_minimumSize.width, self->_minimumSize.height);
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultConfiguration, CFSTR("_defaultConfiguration"));
  v6 = *(_BYTE *)&self->_buttonFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_BYTE *)&self->_buttonFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("role"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_BYTE *)&self->_buttonFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("minimumSize"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

}

- (BOOL)isEqual:(id)a3
{
  UIContentUnavailableButtonProperties *v4;
  UIContentUnavailableButtonProperties *v5;
  char v6;

  v4 = (UIContentUnavailableButtonProperties *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[UIContentUnavailableButtonProperties _isEqualToProperties:]((uint64_t)self, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[UIButtonConfiguration hash](self->_configuration, "hash");
  return -[UIAction hash](self->_primaryAction, "hash") ^ v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIAction *primaryAction;
  void *v8;
  void *v9;
  void *v10;
  UIMenu *menu;
  void *v12;
  void *v13;
  void *v14;
  unint64_t role;
  CGFloat width;
  double height;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[UIButtonConfiguration description](self->_configuration, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("configuration = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  primaryAction = self->_primaryAction;
  if (primaryAction)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[UIAction description](primaryAction, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("primaryAction = %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  menu = self->_menu;
  if (menu)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[UIMenu description](menu, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("menu = %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  if (!self->_enabled)
    objc_msgSend(v3, "addObject:", CFSTR("enabled = NO"));
  role = self->_role;
  if (role <= 3)
    objc_msgSend(v3, "addObject:", off_1E16C5500[role]);
  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  if (*MEMORY[0x1E0C9D820] != width || *(double *)(MEMORY[0x1E0C9D820] + 8) != height)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGSize(*(CGSize *)&width);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("minimumSize = %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("none");
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v25, self, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (__CFString)_shortDescription
{
  __CFString *v1;

  if (a1)
  {
    v1 = a1;
    if (-[UIContentUnavailableButtonProperties _hasButton]((uint64_t)a1))
    {
      objc_msgSend(v1->data, "description");
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = CFSTR("none");
    }
  }
  return a1;
}

- (void)_applyToButton:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    objc_msgSend(v3, "setConfiguration:", *(_QWORD *)(a1 + 16));
    objc_msgSend(v6, "removeTarget:action:forControlEvents:", 0, 0, 0x2000);
    v4 = *(_QWORD *)(a1 + 24);
    if (v4)
      objc_msgSend(v6, "addAction:forControlEvents:", v4, 0x2000);
    objc_msgSend(v6, "setMenu:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
      v5 = *(_QWORD *)(a1 + 24) == 0;
    else
      v5 = 0;
    objc_msgSend(v6, "setShowsMenuAsPrimaryAction:", v5);
    objc_msgSend(v6, "setEnabled:", *(unsigned __int8 *)(a1 + 12));
    objc_msgSend(v6, "setRole:", *(_QWORD *)(a1 + 40));
    v3 = v6;
  }

}

- (void)setConfiguration:(id)a3
{
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)self, a3);
}

- (UIButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setPrimaryAction:(UIAction *)primaryAction
{
  if (self)
    objc_setProperty_nonatomic_copy(self, a2, primaryAction, 24);
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (void)setMenu:(UIMenu *)menu
{
  if (self)
    objc_setProperty_nonatomic_copy(self, a2, menu, 32);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setEnabled:(BOOL)enabled
{
  *(_BYTE *)&self->_buttonFlags |= 1u;
  self->_enabled = enabled;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setRole:(UIButtonRole)role
{
  *(_BYTE *)&self->_buttonFlags |= 2u;
  self->_role = role;
}

- (UIButtonRole)role
{
  return self->_role;
}

- (void)setMinimumSize:(CGSize)a3
{
  *(_BYTE *)&self->_buttonFlags |= 4u;
  self->_minimumSize = a3;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
