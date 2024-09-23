@implementation UINavigationBarAppearance

- (id)_plainButtonAppearanceData
{
  return -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
}

- (id)_doneButtonAppearanceData
{
  return -[UIBarButtonItemAppearance _data](self->_doneButtonAppearance, "_data");
}

- (id)_backButtonAppearanceData
{
  return -[UIBarButtonItemAppearance _data](self->_backButtonAppearance, "_data");
}

- (void)_setupDefaults
{
  _UINavTitleAppearanceData *v3;
  _UINavTitleAppearanceData *barTitleData;
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *buttonAppearance;
  UIBarButtonItemAppearance *v7;
  UIBarButtonItemAppearance *doneButtonAppearance;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *backButtonAppearance;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UINavigationBarAppearance;
  -[UIBarAppearance _setupDefaults](&v11, sel__setupDefaults);
  if (!self->_barTitleData)
  {
    +[_UINavTitleAppearanceData standardTitleDataForIdiom:](_UINavTitleAppearanceData, "standardTitleDataForIdiom:", -[UIBarAppearance idiom](self, "idiom"));
    v3 = (_UINavTitleAppearanceData *)objc_claimAutoreleasedReturnValue();
    barTitleData = self->_barTitleData;
    self->_barTitleData = v3;

  }
  if (!self->_buttonAppearance)
  {
    v5 = -[UIBarButtonItemAppearance initWithStyle:]([UIBarButtonItemAppearance alloc], "initWithStyle:", 0);
    buttonAppearance = self->_buttonAppearance;
    self->_buttonAppearance = v5;

  }
  if (!self->_doneButtonAppearance)
  {
    v7 = -[UIBarButtonItemAppearance initWithStyle:]([UIBarButtonItemAppearance alloc], "initWithStyle:", 2);
    doneButtonAppearance = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v7;

  }
  if (!self->_backButtonAppearance)
  {
    v9 = objc_alloc_init(UIBarButtonItemAppearance);
    backButtonAppearance = self->_backButtonAppearance;
    self->_backButtonAppearance = v9;

    -[UIBarButtonItemAppearance _updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:](self->_backButtonAppearance, "_updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:", 0);
  }
}

- (void)_copyFromAppearance:(id)a3
{
  id v4;
  void *v5;
  _UINavTitleAppearanceData *v6;
  _UINavTitleAppearanceData *barTitleData;
  void *v8;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *buttonAppearance;
  void *v11;
  UIBarButtonItemAppearance *v12;
  UIBarButtonItemAppearance *doneButtonAppearance;
  void *v14;
  UIBarButtonItemAppearance *v15;
  UIBarButtonItemAppearance *backButtonAppearance;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UINavigationBarAppearance;
  v4 = a3;
  -[UIBarAppearance _copyFromAppearance:](&v17, sel__copyFromAppearance_, v4);
  objc_msgSend(v4, "_barTitleData", v17.receiver, v17.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_UINavTitleAppearanceData *)objc_msgSend(v5, "copy");
  barTitleData = self->_barTitleData;
  self->_barTitleData = v6;

  objc_msgSend(v4, "_plainButtonAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (UIBarButtonItemAppearance *)objc_msgSend(v8, "copy");
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v9;

  objc_msgSend(v4, "_doneButtonAppearance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIBarButtonItemAppearance *)objc_msgSend(v11, "copy");
  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v12;

  objc_msgSend(v4, "_backButtonAppearance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (UIBarButtonItemAppearance *)objc_msgSend(v14, "copy");
  backButtonAppearance = self->_backButtonAppearance;
  self->_backButtonAppearance = v15;

}

- (id)_barTitleData
{
  return -[_UIBarAppearanceData markReadOnly](self->_barTitleData, "markReadOnly");
}

- (id)_plainButtonAppearance
{
  return self->_buttonAppearance;
}

- (id)_doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

- (id)_backButtonAppearance
{
  return self->_backButtonAppearance;
}

- (void)_barButtonItemAppearanceChangedItemData:(id)a3 toItemData:(id)a4 fromItemData:(id)a5
{
  if (self->_buttonAppearance == a3)
    -[UIBarButtonItemAppearance _setFallback:](self->_backButtonAppearance, "_setFallback:", a4);
}

- (void)_completeInit
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UINavigationBarAppearance;
  -[UIBarAppearance _completeInit](&v4, sel__completeInit);
  -[UIBarButtonItemAppearance _setChangeObserver:](self->_buttonAppearance, "_setChangeObserver:", self);
  -[UIBarButtonItemAppearance _setChangeObserver:](self->_doneButtonAppearance, "_setChangeObserver:", self);
  -[UIBarButtonItemAppearance _setChangeObserver:](self->_backButtonAppearance, "_setChangeObserver:", self);
  -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemAppearance _setFallback:](self->_backButtonAppearance, "_setFallback:", v3);

}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment
{
  double vertical;
  double horizontal;
  double v6;
  double v7;
  _UINavTitleAppearanceData *v9;
  _UINavTitleAppearanceData *barTitleData;

  vertical = titlePositionAdjustment.vertical;
  horizontal = titlePositionAdjustment.horizontal;
  -[_UINavTitleAppearanceData titlePositionAdjustment](self->_barTitleData, "titlePositionAdjustment");
  if (v7 != horizontal || v6 != vertical)
  {
    -[_UIBarAppearanceData writableInstance](self->_barTitleData, "writableInstance");
    v9 = (_UINavTitleAppearanceData *)objc_claimAutoreleasedReturnValue();
    barTitleData = self->_barTitleData;
    self->_barTitleData = v9;

    -[_UINavTitleAppearanceData setTitlePositionAdjustment:](v9, "setTitlePositionAdjustment:", horizontal, vertical);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_backButtonAppearance, 0);
  objc_storeStrong((id *)&self->_doneButtonAppearance, 0);
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
  objc_storeStrong((id *)&self->_barTitleData, 0);
}

- (void)setLargeTitleTextAttributes:(NSDictionary *)largeTitleTextAttributes
{
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  char v7;
  _UINavTitleAppearanceData *v8;
  _UINavTitleAppearanceData *barTitleData;
  NSDictionary *v10;

  v4 = largeTitleTextAttributes;
  -[_UINavTitleAppearanceData largeTitleTextAttributes](self->_barTitleData, "largeTitleTextAttributes");
  v5 = (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSDictionary isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_barTitleData, "writableInstance");
    v8 = (_UINavTitleAppearanceData *)objc_claimAutoreleasedReturnValue();
    barTitleData = self->_barTitleData;
    self->_barTitleData = v8;

    -[_UINavTitleAppearanceData setLargeTitleTextAttributes:](v8, "setLargeTitleTextAttributes:", v10);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 2);
  }
LABEL_9:

}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  char v7;
  _UINavTitleAppearanceData *v8;
  _UINavTitleAppearanceData *barTitleData;
  NSDictionary *v10;

  v4 = titleTextAttributes;
  -[_UINavTitleAppearanceData titleTextAttributes](self->_barTitleData, "titleTextAttributes");
  v5 = (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSDictionary isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_barTitleData, "writableInstance");
    v8 = (_UINavTitleAppearanceData *)objc_claimAutoreleasedReturnValue();
    barTitleData = self->_barTitleData;
    self->_barTitleData = v8;

    -[_UINavTitleAppearanceData setTitleTextAttributes:](v8, "setTitleTextAttributes:", v10);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 2);
  }
LABEL_9:

}

- (void)setBackIndicatorImage:(UIImage *)backIndicatorImage transitionMaskImage:(UIImage *)backIndicatorTransitionMaskImage
{
  UIImage *v6;
  UIImage *v7;
  UIImage *v8;
  UIImage *v9;
  double v10;
  double v11;
  UIImage *v12;
  UIImage *v13;
  double v14;
  UIImage *v15;
  double v16;
  UIBarButtonItemAppearance *backButtonAppearance;
  void *v18;
  UIImage *v19;
  UIImage *v20;
  UIImage *v21;
  void *v22;
  _BOOL4 v23;
  UIImage *v24;
  UIImage *v25;
  UIImage *v26;
  BOOL v27;
  UIImage *v28;

  v6 = backIndicatorImage;
  v7 = backIndicatorTransitionMaskImage;
  v8 = v6;
  v9 = v8;
  if (v8)
  {
    -[UIImage size](v8, "size");
    v28 = 0;
    if (v11 != 0.0 && v10 != 0.0)
      v28 = v9;
  }
  else
  {
    v28 = 0;
  }

  v12 = v7;
  v13 = v12;
  if (v12)
  {
    -[UIImage size](v12, "size");
    v15 = 0;
    if (v16 != 0.0 && v14 != 0.0)
      v15 = v13;
  }
  else
  {
    v15 = 0;
  }

  backButtonAppearance = self->_backButtonAppearance;
  if (!v28 || !v15)
  {
    -[UIBarButtonItemAppearance _resetBackIndicatorImages](backButtonAppearance, "_resetBackIndicatorImages");
LABEL_28:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 4);
    goto LABEL_29;
  }
  -[UIBarButtonItemAppearance _data](backButtonAppearance, "_data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "backIndicatorImage");
  v19 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v20 = v28;
  v21 = v20;
  if (v19 == v20)
  {

  }
  else
  {
    v22 = v20;
    if (!v19)
    {
LABEL_25:

LABEL_26:
LABEL_27:
      -[UIBarButtonItemAppearance _setBackIndicatorImage:transitionMaskImage:](self->_backButtonAppearance, "_setBackIndicatorImage:transitionMaskImage:", v21, v15);
      goto LABEL_28;
    }
    v23 = -[UIImage isEqual:](v19, "isEqual:", v20);

    if (!v23)
      goto LABEL_26;
  }
  -[UIBarButtonItemAppearance _data](self->_backButtonAppearance, "_data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "backIndicatorTransitionMaskImage");
  v24 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v25 = v15;
  v26 = v25;
  if (v24 != v25)
  {
    if (v24)
    {
      v27 = -[UIImage isEqual:](v24, "isEqual:", v25);

      if (v27)
        goto LABEL_29;
      goto LABEL_27;
    }

    goto LABEL_25;
  }

LABEL_29:
}

- (void)_barButtonItemDataChanged:(id)a3
{
  UIBarButtonItemAppearance *v4;
  UIBarButtonItemAppearance *v5;
  unint64_t v6;
  NSObject *v7;
  UINavigationBarAppearance *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  UIBarButtonItemAppearance *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (UIBarButtonItemAppearance *)a3;
  v5 = v4;
  if (self->_buttonAppearance == v4)
  {
    v8 = self;
    v9 = 8;
LABEL_12:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)v8, v9);
    goto LABEL_13;
  }
  if (self->_doneButtonAppearance == v4)
  {
    v8 = self;
    v9 = 16;
    goto LABEL_12;
  }
  if (self->_backButtonAppearance == v4)
  {
    v8 = self;
    v9 = 4;
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
    v6 = _barButtonItemDataChanged____s_category_0;
    if (!_barButtonItemDataChanged____s_category_0)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_barButtonItemDataChanged____s_category_0);
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

- (NSDictionary)largeTitleTextAttributes
{
  return -[_UINavTitleAppearanceData largeTitleTextAttributes](self->_barTitleData, "largeTitleTextAttributes");
}

- (UIBarButtonItemAppearance)backButtonAppearance
{
  return self->_backButtonAppearance;
}

- (BOOL)_checkEqualTo:(id)a3
{
  id v4;
  void *v5;
  _UINavTitleAppearanceData *v6;
  _UINavTitleAppearanceData *v7;
  _UINavTitleAppearanceData *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _UINavTitleAppearanceData *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;
  _UINavTitleAppearanceData *v18;
  BOOL v19;
  void *v20;
  void *v21;
  _UINavTitleAppearanceData *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UINavigationBarAppearance;
  if (!-[UIBarAppearance _checkEqualTo:](&v24, sel__checkEqualTo_, v4))
    goto LABEL_24;
  v5 = (void *)*((_QWORD *)v4 + 6);
  v6 = self->_barTitleData;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    LOBYTE(v10) = 0;
LABEL_32:

    goto LABEL_33;
  }
  v10 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v7);

  if (v10)
  {
LABEL_11:
    -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 7), "_data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v13 = v12;
    if (v6 == v13)
    {

    }
    else
    {
      v8 = v13;
      if (v6)
        v14 = v13 == 0;
      else
        v14 = 1;
      if (v14)
      {
        LOBYTE(v10) = 0;
        goto LABEL_31;
      }
      v15 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v13);

      if (!v15)
        goto LABEL_24;
    }
    -[UIBarButtonItemAppearance _data](self->_doneButtonAppearance, "_data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 8), "_data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    v18 = v17;
    if (v6 == v18)
    {

LABEL_26:
      -[UIBarButtonItemAppearance _data](self->_backButtonAppearance, "_data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v4 + 9), "_data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v20;
      v22 = v21;
      if (v6 == v22)
      {
        LOBYTE(v10) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v22;
        LOBYTE(v10) = 0;
        if (v6 && v22)
          LOBYTE(v10) = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v22);
      }
      goto LABEL_31;
    }
    v8 = v18;
    LOBYTE(v10) = 0;
    if (v6 && v18)
    {
      v19 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v18);

      if (!v19)
      {
LABEL_24:
        LOBYTE(v10) = 0;
        goto LABEL_33;
      }
      goto LABEL_26;
    }
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationBarAppearance;
  v4 = a3;
  -[UIBarAppearance encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[_UINavTitleAppearanceData encodeToCoder:prefix:](self->_barTitleData, "encodeToCoder:prefix:", v4, CFSTR("Title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_buttonAppearance, CFSTR("PlainButtons"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_doneButtonAppearance, CFSTR("DoneButtons"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backButtonAppearance, CFSTR("BackButtons"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItemAppearance *v7;
  UIBarButtonItemAppearance *buttonAppearance;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *doneButtonAppearance;
  UIBarButtonItemAppearance *v11;
  UIBarButtonItemAppearance *backButtonAppearance;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAppearance;
  -[UIBarAppearance _decodeFromCoder:](&v13, sel__decodeFromCoder_, v4);
  +[_UINavTitleAppearanceData decodeFromCoder:prefix:](_UINavTitleAppearanceData, "decodeFromCoder:prefix:", v4, CFSTR("Title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[_UINavTitleAppearanceData standardTitleDataForIdiom:](_UINavTitleAppearanceData, "standardTitleDataForIdiom:", -[UIBarAppearance idiom](self, "idiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_barTitleData, v6);
  if (!v5)

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlainButtons"));
  v7 = (UIBarButtonItemAppearance *)objc_claimAutoreleasedReturnValue();
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DoneButtons"));
  v9 = (UIBarButtonItemAppearance *)objc_claimAutoreleasedReturnValue();
  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BackButtons"));
  v11 = (UIBarButtonItemAppearance *)objc_claimAutoreleasedReturnValue();
  backButtonAppearance = self->_backButtonAppearance;
  self->_backButtonAppearance = v11;

}

- (void)_describeInto:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationBarAppearance;
  v4 = a3;
  -[UIBarAppearance _describeInto:](&v5, sel__describeInto_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tTitle(%p):"), self->_barTitleData);
  -[_UINavTitleAppearanceData describeInto:](self->_barTitleData, "describeInto:", v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tPlain BarButtonItems(%p):"), self->_buttonAppearance);
  -[UIBarButtonItemAppearance _describeInto:](self->_buttonAppearance, "_describeInto:", v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tDone BarButtonItems(%p):"), self->_doneButtonAppearance);
  -[UIBarButtonItemAppearance _describeInto:](self->_doneButtonAppearance, "_describeInto:", v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tBack Buttons(%p):"), self->_backButtonAppearance);
  -[UIBarButtonItemAppearance _describeInto:](self->_backButtonAppearance, "_describeInto:", v4);

}

- (unint64_t)_hashInto:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAppearance;
  v4 = 3 * -[UIBarAppearance _hashInto:](&v13, sel__hashInto_, a3);
  v5 = 3 * (-[_UIBarAppearanceData hash](self->_barTitleData, "hash") + v4);
  -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") + v5;

  -[UIBarButtonItemAppearance _data](self->_doneButtonAppearance, "_data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") + 3 * v7;

  -[UIBarButtonItemAppearance _data](self->_backButtonAppearance, "_data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") + 3 * v9;

  return v11;
}

- (NSDictionary)titleTextAttributes
{
  return -[_UINavTitleAppearanceData titleTextAttributes](self->_barTitleData, "titleTextAttributes");
}

- (UIOffset)titlePositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UINavTitleAppearanceData titlePositionAdjustment](self->_barTitleData, "titlePositionAdjustment");
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setButtonAppearance:(UIBarButtonItemAppearance *)buttonAppearance
{
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *v6;
  UIBarButtonItemAppearance *v7;
  BOOL v8;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *v10;
  void *v11;
  void *v12;
  UIBarButtonItemAppearance *v13;

  v5 = buttonAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBarAppearance.m"), 202, CFSTR("use -[UIBarButtonItemAppearance configureWithDefaultForStyle:] to reset appearance values"));

  }
  v6 = self->_buttonAppearance;
  v7 = v5;
  v13 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIBarButtonItemAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    -[UIBarButtonItemAppearance _setChangeObserver:](self->_buttonAppearance, "_setChangeObserver:", 0);
    v9 = -[UIBarButtonItemAppearance copy](v13, "copy");
    v10 = self->_buttonAppearance;
    self->_buttonAppearance = v9;

    -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItemAppearance _setFallback:](self->_backButtonAppearance, "_setFallback:", v11);

    -[UIBarButtonItemAppearance _setChangeObserver:](self->_buttonAppearance, "_setChangeObserver:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 8);
  }
LABEL_11:

}

- (void)setDoneButtonAppearance:(UIBarButtonItemAppearance *)doneButtonAppearance
{
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *v6;
  UIBarButtonItemAppearance *v7;
  BOOL v8;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *v10;
  void *v11;
  UIBarButtonItemAppearance *v12;

  v5 = doneButtonAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBarAppearance.m"), 214, CFSTR("use -[UIBarButtonItemAppearance configureWithDefaultForStyle:] to reset appearance values"));

  }
  v6 = self->_doneButtonAppearance;
  v7 = v5;
  v12 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIBarButtonItemAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    -[UIBarButtonItemAppearance _setChangeObserver:](self->_doneButtonAppearance, "_setChangeObserver:", 0);
    v9 = -[UIBarButtonItemAppearance copy](v12, "copy");
    v10 = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v9;

    -[UIBarButtonItemAppearance _setChangeObserver:](self->_doneButtonAppearance, "_setChangeObserver:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 16);
  }
LABEL_11:

}

- (void)setBackButtonAppearance:(UIBarButtonItemAppearance *)backButtonAppearance
{
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *v6;
  UIBarButtonItemAppearance *v7;
  BOOL v8;
  UIBarButtonItemAppearance *v9;
  void *v10;
  UIBarButtonItemAppearance *v11;
  UIBarButtonItemAppearance *v12;
  void *v13;
  void *v14;
  UIBarButtonItemAppearance *v15;

  v5 = backButtonAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBarAppearance.m"), 225, CFSTR("use -[UIBarButtonItemAppearance configureWithDefaultForStyle:] to reset appearance values"));

  }
  v6 = self->_backButtonAppearance;
  v7 = v5;
  v15 = v7;
  if (v6 == v7)
  {

    v10 = v15;
  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIBarButtonItemAppearance isEqual:](v6, "isEqual:", v7);

      v9 = v15;
      if (v8)
        goto LABEL_12;
    }
    else
    {

    }
    -[UIBarButtonItemAppearance _setChangeObserver:](self->_backButtonAppearance, "_setChangeObserver:", 0);
    -[UIBarButtonItemAppearance _data](self->_backButtonAppearance, "_data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIBarButtonItemAppearance copy](v15, "copy");
    v12 = self->_backButtonAppearance;
    self->_backButtonAppearance = v11;

    -[UIBarButtonItemAppearance _updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:](self->_backButtonAppearance, "_updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:", v10);
    -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItemAppearance _setFallback:](self->_backButtonAppearance, "_setFallback:", v13);

    -[UIBarButtonItemAppearance _setChangeObserver:](self->_backButtonAppearance, "_setChangeObserver:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 4);
  }

  v9 = v15;
LABEL_12:

}

- (UIImage)backIndicatorImage
{
  void *v2;
  void *v3;

  -[UIBarButtonItemAppearance _data](self->_backButtonAppearance, "_data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backIndicatorImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)backIndicatorTransitionMaskImage
{
  void *v2;
  void *v3;

  -[UIBarButtonItemAppearance _data](self->_backButtonAppearance, "_data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backIndicatorTransitionMaskImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIBarButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (UIBarButtonItemAppearance)doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

- (_UINavigationBarVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (int64_t)_backgroundVisibility
{
  return self->__backgroundVisibility;
}

- (void)set_backgroundVisibility:(int64_t)a3
{
  self->__backgroundVisibility = a3;
}

- (double)_backgroundVisibilityOnScrollDistance
{
  return self->__backgroundVisibilityOnScrollDistance;
}

- (void)set_backgroundVisibilityOnScrollDistance:(double)a3
{
  self->__backgroundVisibilityOnScrollDistance = a3;
}

@end
