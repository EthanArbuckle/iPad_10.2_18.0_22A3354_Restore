@implementation UITabBarAppearance

- (id)_dataForItemStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v8;

  v5 = 0;
  switch(a3)
  {
    case 0:
      v6 = 56;
      goto LABEL_6;
    case 1:
    case 4:
      v6 = 64;
      goto LABEL_6;
    case 2:
      v6 = 72;
LABEL_6:
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "_data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      return v5;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarAppearance.m"), 510, CFSTR("Invalid style (%li)"), a3);

      v5 = 0;
      break;
  }
  return v5;
}

- (void)_copyFromAppearance:(id)a3
{
  id v4;
  void *v5;
  UITabBarItemAppearance *v6;
  UITabBarItemAppearance *stackedLayoutAppearance;
  void *v8;
  UITabBarItemAppearance *v9;
  UITabBarItemAppearance *inlineLayoutAppearance;
  void *v11;
  UITabBarItemAppearance *v12;
  UITabBarItemAppearance *compactInlineLayoutAppearance;
  void *v14;
  _UITabBarLayoutData *v15;
  _UITabBarLayoutData *layoutData;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITabBarAppearance;
  -[UIBarAppearance _copyFromAppearance:](&v17, sel__copyFromAppearance_, v4);
  objc_msgSend(v4, "_stackedTabButtonAppearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[UITabBarItemAppearance _initWithTabBarItemData:]([UITabBarItemAppearance alloc], "_initWithTabBarItemData:", v5);
    stackedLayoutAppearance = self->_stackedLayoutAppearance;
    self->_stackedLayoutAppearance = v6;

  }
  objc_msgSend(v4, "_inlineTabButtonAppearanceData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[UITabBarItemAppearance _initWithTabBarItemData:]([UITabBarItemAppearance alloc], "_initWithTabBarItemData:", v8);
    inlineLayoutAppearance = self->_inlineLayoutAppearance;
    self->_inlineLayoutAppearance = v9;

  }
  objc_msgSend(v4, "_compactInlineTabButtonAppearanceData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[UITabBarItemAppearance _initWithTabBarItemData:]([UITabBarItemAppearance alloc], "_initWithTabBarItemData:", v11);
    compactInlineLayoutAppearance = self->_compactInlineLayoutAppearance;
    self->_compactInlineLayoutAppearance = v12;

  }
  objc_msgSend(v4, "_tabLayoutAppearanceData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (_UITabBarLayoutData *)objc_msgSend(v14, "copy");
  layoutData = self->_layoutData;
  self->_layoutData = v15;

}

- (id)_tabLayoutAppearanceData
{
  return self->_layoutData;
}

- (void)_setupDefaults
{
  UITabBarItemAppearance *v3;
  UITabBarItemAppearance *stackedLayoutAppearance;
  UITabBarItemAppearance *v5;
  UITabBarItemAppearance *inlineLayoutAppearance;
  UITabBarItemAppearance *v7;
  UITabBarItemAppearance *compactInlineLayoutAppearance;
  _UITabBarLayoutData *v9;
  _UITabBarLayoutData *layoutData;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UITabBarAppearance;
  -[UIBarAppearance _setupDefaults](&v11, sel__setupDefaults);
  if (!self->_stackedLayoutAppearance)
  {
    v3 = -[UITabBarItemAppearance initWithStyle:]([UITabBarItemAppearance alloc], "initWithStyle:", 0);
    stackedLayoutAppearance = self->_stackedLayoutAppearance;
    self->_stackedLayoutAppearance = v3;

  }
  if (!self->_inlineLayoutAppearance)
  {
    v5 = -[UITabBarItemAppearance initWithStyle:]([UITabBarItemAppearance alloc], "initWithStyle:", 1);
    inlineLayoutAppearance = self->_inlineLayoutAppearance;
    self->_inlineLayoutAppearance = v5;

  }
  if (!self->_compactInlineLayoutAppearance)
  {
    v7 = -[UITabBarItemAppearance initWithStyle:]([UITabBarItemAppearance alloc], "initWithStyle:", 2);
    compactInlineLayoutAppearance = self->_compactInlineLayoutAppearance;
    self->_compactInlineLayoutAppearance = v7;

  }
  if (!self->_layoutData)
  {
    +[_UITabBarLayoutData standardLayoutData](_UITabBarLayoutData, "standardLayoutData");
    v9 = (_UITabBarLayoutData *)objc_claimAutoreleasedReturnValue();
    layoutData = self->_layoutData;
    self->_layoutData = v9;

  }
}

- (void)_completeInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITabBarAppearance;
  -[UIBarAppearance _completeInit](&v3, sel__completeInit);
  -[UITabBarItemAppearance _setOwningAppearance:](self->_stackedLayoutAppearance, "_setOwningAppearance:", self);
  -[UITabBarItemAppearance _setOwningAppearance:](self->_inlineLayoutAppearance, "_setOwningAppearance:", self);
  -[UITabBarItemAppearance _setOwningAppearance:](self->_compactInlineLayoutAppearance, "_setOwningAppearance:", self);
}

- (id)_stackedTabButtonAppearanceData
{
  return -[UITabBarItemAppearance _data](self->_stackedLayoutAppearance, "_data");
}

- (id)_inlineTabButtonAppearanceData
{
  return -[UITabBarItemAppearance _data](self->_inlineLayoutAppearance, "_data");
}

- (id)_compactInlineTabButtonAppearanceData
{
  return -[UITabBarItemAppearance _data](self->_compactInlineLayoutAppearance, "_data");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactInlineLayoutAppearance, 0);
  objc_storeStrong((id *)&self->_inlineLayoutAppearance, 0);
  objc_storeStrong((id *)&self->_stackedLayoutAppearance, 0);
  objc_storeStrong((id *)&self->_layoutData, 0);
}

- (UITabBarItemAppearance)stackedLayoutAppearance
{
  return self->_stackedLayoutAppearance;
}

- (void)_tabBarItemDataChanged:(id)a3
{
  UITabBarItemAppearance *v4;
  UITabBarItemAppearance *v5;
  unint64_t v6;
  NSObject *v7;
  UITabBarAppearance *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  UITabBarItemAppearance *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (UITabBarItemAppearance *)a3;
  v5 = v4;
  if (self->_stackedLayoutAppearance == v4)
  {
    v8 = self;
    v9 = 32;
LABEL_12:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)v8, v9);
    goto LABEL_13;
  }
  if (self->_inlineLayoutAppearance == v4)
  {
    v8 = self;
    v9 = 64;
    goto LABEL_12;
  }
  if (self->_compactInlineLayoutAppearance == v4)
  {
    v8 = self;
    v9 = 128;
    goto LABEL_12;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Signal from unknown appearance object %@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    v6 = _tabBarItemDataChanged____s_category;
    if (!_tabBarItemDataChanged____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_tabBarItemDataChanged____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Signal from unknown appearance object %@", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_13:

}

- (BOOL)_checkEqualTo:(id)a3
{
  _QWORD *v4;
  void *v5;
  UITabBarItemAppearance *v6;
  UITabBarItemAppearance *v7;
  UITabBarItemAppearance *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  UITabBarItemAppearance *v12;
  BOOL v13;
  void *v15;
  UITabBarItemAppearance *v16;
  _UITabBarLayoutData *layoutData;
  void *v18;
  UITabBarItemAppearance *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UITabBarAppearance;
  if (!-[UIBarAppearance _checkEqualTo:](&v20, sel__checkEqualTo_, v4))
  {
    LOBYTE(v10) = 0;
    goto LABEL_19;
  }
  v5 = (void *)v4[7];
  v6 = self->_stackedLayoutAppearance;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_17;
    v10 = -[UITabBarItemAppearance isEqual:](v6, "isEqual:", v7);

    if (!v10)
      goto LABEL_19;
  }
  v11 = (void *)v4[8];
  v6 = self->_inlineLayoutAppearance;
  v12 = v11;
  if (v6 == v12)
  {

LABEL_22:
    v15 = (void *)v4[9];
    v6 = self->_compactInlineLayoutAppearance;
    v16 = v15;
    if (v6 == v16)
    {

LABEL_28:
      layoutData = self->_layoutData;
      v18 = (void *)v4[6];
      v6 = layoutData;
      v19 = v18;
      if (v6 == v19)
      {
        LOBYTE(v10) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v19;
        LOBYTE(v10) = 0;
        if (v6 && v19)
          LOBYTE(v10) = -[UITabBarItemAppearance isEqual:](v6, "isEqual:", v19);
      }
      goto LABEL_18;
    }
    v8 = v16;
    LOBYTE(v10) = 0;
    if (v6 && v16)
    {
      v10 = -[UITabBarItemAppearance isEqual:](v6, "isEqual:", v16);

      if (!v10)
        goto LABEL_19;
      goto LABEL_28;
    }
LABEL_18:

    goto LABEL_19;
  }
  v8 = v12;
  if (v6)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
LABEL_17:
    LOBYTE(v10) = 0;
    goto LABEL_18;
  }
  v10 = -[UITabBarItemAppearance isEqual:](v6, "isEqual:", v12);

  if (v10)
    goto LABEL_22;
LABEL_19:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBarAppearance;
  v4 = a3;
  -[UIBarAppearance encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stackedLayoutAppearance, CFSTR("Stacked"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_inlineLayoutAppearance, CFSTR("Inline"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_compactInlineLayoutAppearance, CFSTR("CompactInline"));
  -[_UITabBarLayoutData encodeToCoder:prefix:](self->_layoutData, "encodeToCoder:prefix:", v4, CFSTR("Layout"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  id v4;
  UITabBarItemAppearance *v5;
  UITabBarItemAppearance *stackedLayoutAppearance;
  UITabBarItemAppearance *v7;
  UITabBarItemAppearance *inlineLayoutAppearance;
  UITabBarItemAppearance *v9;
  UITabBarItemAppearance *compactInlineLayoutAppearance;
  _UITabBarLayoutData *v11;
  _UITabBarLayoutData *layoutData;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UITabBarAppearance;
  v4 = a3;
  -[UIBarAppearance _decodeFromCoder:](&v13, sel__decodeFromCoder_, v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Stacked"), v13.receiver, v13.super_class);
  v5 = (UITabBarItemAppearance *)objc_claimAutoreleasedReturnValue();
  stackedLayoutAppearance = self->_stackedLayoutAppearance;
  self->_stackedLayoutAppearance = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Inline"));
  v7 = (UITabBarItemAppearance *)objc_claimAutoreleasedReturnValue();
  inlineLayoutAppearance = self->_inlineLayoutAppearance;
  self->_inlineLayoutAppearance = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CompactInline"));
  v9 = (UITabBarItemAppearance *)objc_claimAutoreleasedReturnValue();
  compactInlineLayoutAppearance = self->_compactInlineLayoutAppearance;
  self->_compactInlineLayoutAppearance = v9;

  +[_UITabBarLayoutData decodeFromCoder:prefix:](_UITabBarLayoutData, "decodeFromCoder:prefix:", v4, CFSTR("Layout"));
  v11 = (_UITabBarLayoutData *)objc_claimAutoreleasedReturnValue();

  layoutData = self->_layoutData;
  self->_layoutData = v11;

}

- (void)_describeInto:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBarAppearance;
  v4 = a3;
  -[UIBarAppearance _describeInto:](&v5, sel__describeInto_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tStackedItemAppearance(%p):"), self->_stackedLayoutAppearance);
  -[UITabBarItemAppearance _describeInto:](self->_stackedLayoutAppearance, "_describeInto:", v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tInlineItemAppearance(%p):"), self->_inlineLayoutAppearance);
  -[UITabBarItemAppearance _describeInto:](self->_inlineLayoutAppearance, "_describeInto:", v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tCompactInlineItemAppearance(%p):"), self->_compactInlineLayoutAppearance);
  -[UITabBarItemAppearance _describeInto:](self->_compactInlineLayoutAppearance, "_describeInto:", v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tItemLayout(%p):"), self->_layoutData);
  -[_UITabBarLayoutData describeInto:](self->_layoutData, "describeInto:", v4);

}

- (unint64_t)_hashInto:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITabBarAppearance;
  v4 = 3 * -[UIBarAppearance _hashInto:](&v9, sel__hashInto_, a3);
  v5 = 3 * (-[UITabBarItemAppearance hash](self->_stackedLayoutAppearance, "hash") + v4);
  v6 = 3 * (-[UITabBarItemAppearance hash](self->_inlineLayoutAppearance, "hash") + v5);
  v7 = 3 * (-[UITabBarItemAppearance hash](self->_compactInlineLayoutAppearance, "hash") + v6);
  return -[_UIBarAppearanceData hash](self->_layoutData, "hash") + v7;
}

- (void)setStackedLayoutAppearance:(UITabBarItemAppearance *)stackedLayoutAppearance
{
  UITabBarItemAppearance *v5;
  UITabBarItemAppearance *v6;
  UITabBarItemAppearance *v7;
  BOOL v8;
  UITabBarItemAppearance *v9;
  UITabBarItemAppearance *v10;
  void *v11;
  UITabBarItemAppearance *v12;

  v5 = stackedLayoutAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarAppearance.m"), 529, CFSTR("Use -[UITabBarItemAppearance configureWithDefaultForStyle:] to reset"));

  }
  v6 = self->_stackedLayoutAppearance;
  v7 = v5;
  v12 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UITabBarItemAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    -[UITabBarItemAppearance _setOwningAppearance:](self->_stackedLayoutAppearance, "_setOwningAppearance:", 0);
    v9 = -[UITabBarItemAppearance copy](v12, "copy");
    v10 = self->_stackedLayoutAppearance;
    self->_stackedLayoutAppearance = v9;

    -[UITabBarItemAppearance _setOwningAppearance:](self->_stackedLayoutAppearance, "_setOwningAppearance:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 32);
  }
LABEL_11:

}

- (void)setInlineLayoutAppearance:(UITabBarItemAppearance *)inlineLayoutAppearance
{
  UITabBarItemAppearance *v5;
  UITabBarItemAppearance *v6;
  UITabBarItemAppearance *v7;
  BOOL v8;
  UITabBarItemAppearance *v9;
  UITabBarItemAppearance *v10;
  void *v11;
  UITabBarItemAppearance *v12;

  v5 = inlineLayoutAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarAppearance.m"), 540, CFSTR("Use -[UITabBarItemAppearance configureWithDefaultForStyle:] to reset"));

  }
  v6 = self->_inlineLayoutAppearance;
  v7 = v5;
  v12 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UITabBarItemAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    -[UITabBarItemAppearance _setOwningAppearance:](self->_inlineLayoutAppearance, "_setOwningAppearance:", 0);
    v9 = -[UITabBarItemAppearance copy](v12, "copy");
    v10 = self->_inlineLayoutAppearance;
    self->_inlineLayoutAppearance = v9;

    -[UITabBarItemAppearance _setOwningAppearance:](self->_inlineLayoutAppearance, "_setOwningAppearance:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 64);
  }
LABEL_11:

}

- (void)setCompactInlineLayoutAppearance:(UITabBarItemAppearance *)compactInlineLayoutAppearance
{
  UITabBarItemAppearance *v5;
  UITabBarItemAppearance *v6;
  UITabBarItemAppearance *v7;
  BOOL v8;
  UITabBarItemAppearance *v9;
  UITabBarItemAppearance *v10;
  void *v11;
  UITabBarItemAppearance *v12;

  v5 = compactInlineLayoutAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarAppearance.m"), 551, CFSTR("Use -[UITabBarItemAppearance configureWithDefaultForStyle:] to reset"));

  }
  v6 = self->_compactInlineLayoutAppearance;
  v7 = v5;
  v12 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UITabBarItemAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    -[UITabBarItemAppearance _setOwningAppearance:](self->_compactInlineLayoutAppearance, "_setOwningAppearance:", 0);
    v9 = -[UITabBarItemAppearance copy](v12, "copy");
    v10 = self->_compactInlineLayoutAppearance;
    self->_compactInlineLayoutAppearance = v9;

    -[UITabBarItemAppearance _setOwningAppearance:](self->_compactInlineLayoutAppearance, "_setOwningAppearance:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 128);
  }
LABEL_11:

}

- (UIColor)selectionIndicatorTintColor
{
  return -[_UITabBarLayoutData selectionIndicatorTintColor](self->_layoutData, "selectionIndicatorTintColor");
}

- (void)setSelectionIndicatorTintColor:(UIColor *)selectionIndicatorTintColor
{
  UIColor *v4;
  void *v5;
  BOOL v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  BOOL v10;
  _UITabBarLayoutData *v11;
  _UITabBarLayoutData *layoutData;
  UIColor *v13;

  v4 = selectionIndicatorTintColor;
  if (v4
    && (+[UIColor clearColor](UIColor, "clearColor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[UIColor isEqual:](v4, "isEqual:", v5),
        v5,
        !v6))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  -[_UITabBarLayoutData selectionIndicatorTintColor](self->_layoutData, "selectionIndicatorTintColor");
  v8 = (UIColor *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v13 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (v9 && v8)
    {
      v10 = -[UIColor isEqual:](v8, "isEqual:", v9);

      if (v10)
        goto LABEL_13;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_layoutData, "writableInstance");
    v11 = (_UITabBarLayoutData *)objc_claimAutoreleasedReturnValue();
    layoutData = self->_layoutData;
    self->_layoutData = v11;

    -[_UITabBarLayoutData setSelectionIndicatorTintColor:](v11, "setSelectionIndicatorTintColor:", v13);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
LABEL_13:

}

- (UIImage)selectionIndicatorImage
{
  return -[_UITabBarLayoutData selectionIndicatorImage](self->_layoutData, "selectionIndicatorImage");
}

- (void)setSelectionIndicatorImage:(UIImage *)selectionIndicatorImage
{
  UIImage *v4;
  UIImage *v5;
  double v6;
  UIImage *v7;
  double v8;
  UIImage *v9;
  UIImage *v10;
  BOOL v11;
  _UITabBarLayoutData *v12;
  _UITabBarLayoutData *layoutData;
  UIImage *v14;

  v4 = selectionIndicatorImage;
  v5 = v4;
  if (v4)
  {
    -[UIImage size](v4, "size");
    v7 = 0;
    if (v8 != 0.0 && v6 != 0.0)
      v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  -[_UITabBarLayoutData selectionIndicatorImage](self->_layoutData, "selectionIndicatorImage");
  v9 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v14 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (v10 && v9)
    {
      v11 = -[UIImage isEqual:](v9, "isEqual:", v10);

      if (v11)
        goto LABEL_14;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_layoutData, "writableInstance");
    v12 = (_UITabBarLayoutData *)objc_claimAutoreleasedReturnValue();
    layoutData = self->_layoutData;
    self->_layoutData = v12;

    -[_UITabBarLayoutData setSelectionIndicatorImage:](v12, "setSelectionIndicatorImage:", v14);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
LABEL_14:

}

- (UITabBarItemPositioning)stackedItemPositioning
{
  return -[_UITabBarLayoutData itemPositioning](self->_layoutData, "itemPositioning");
}

- (void)setStackedItemPositioning:(UITabBarItemPositioning)stackedItemPositioning
{
  _UITabBarLayoutData *v5;
  _UITabBarLayoutData *layoutData;

  if (-[_UITabBarLayoutData itemPositioning](self->_layoutData, "itemPositioning") != stackedItemPositioning)
  {
    -[_UIBarAppearanceData writableInstance](self->_layoutData, "writableInstance");
    v5 = (_UITabBarLayoutData *)objc_claimAutoreleasedReturnValue();
    layoutData = self->_layoutData;
    self->_layoutData = v5;

    -[_UITabBarLayoutData setItemPositioning:](v5, "setItemPositioning:", stackedItemPositioning);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
}

- (CGFloat)stackedItemWidth
{
  CGFloat result;

  -[_UITabBarLayoutData itemWidth](self->_layoutData, "itemWidth");
  return result;
}

- (void)setStackedItemWidth:(CGFloat)stackedItemWidth
{
  double v5;
  _UITabBarLayoutData *v6;
  _UITabBarLayoutData *layoutData;

  -[_UITabBarLayoutData itemWidth](self->_layoutData, "itemWidth");
  if (v5 != stackedItemWidth)
  {
    -[_UIBarAppearanceData writableInstance](self->_layoutData, "writableInstance");
    v6 = (_UITabBarLayoutData *)objc_claimAutoreleasedReturnValue();
    layoutData = self->_layoutData;
    self->_layoutData = v6;

    -[_UITabBarLayoutData setItemWidth:](v6, "setItemWidth:", stackedItemWidth);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
}

- (CGFloat)stackedItemSpacing
{
  CGFloat result;

  -[_UITabBarLayoutData itemSpacing](self->_layoutData, "itemSpacing");
  return result;
}

- (void)setStackedItemSpacing:(CGFloat)stackedItemSpacing
{
  double v5;
  _UITabBarLayoutData *v6;
  _UITabBarLayoutData *layoutData;

  -[_UITabBarLayoutData itemSpacing](self->_layoutData, "itemSpacing");
  if (v5 != stackedItemSpacing)
  {
    -[_UIBarAppearanceData writableInstance](self->_layoutData, "writableInstance");
    v6 = (_UITabBarLayoutData *)objc_claimAutoreleasedReturnValue();
    layoutData = self->_layoutData;
    self->_layoutData = v6;

    -[_UITabBarLayoutData setItemSpacing:](v6, "setItemSpacing:", stackedItemSpacing);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
}

- (UITabBarItemAppearance)inlineLayoutAppearance
{
  return self->_inlineLayoutAppearance;
}

- (UITabBarItemAppearance)compactInlineLayoutAppearance
{
  return self->_compactInlineLayoutAppearance;
}

@end
