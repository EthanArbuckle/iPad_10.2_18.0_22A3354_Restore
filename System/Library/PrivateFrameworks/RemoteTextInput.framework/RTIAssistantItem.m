@implementation RTIAssistantItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  UIColor *detachedTintColor;
  UIColor *detachedBackgroundColor;
  NSArray *leadingBarButtonGroups;
  NSArray *trailingBarButtonGroups;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  if (self->_showsBarButtonItemsInline)
    objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("sBtnInline"));
  v4 = v9;
  if (self->_showsInputDashboardViewController)
  {
    objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("sIDVC"));
    v4 = v9;
  }
  if (self->_centerViewPreferredWidth != 0.0)
  {
    objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("cVPW"));
    v4 = v9;
  }
  detachedTintColor = self->_detachedTintColor;
  if (detachedTintColor)
  {
    objc_msgSend(v9, "encodeObject:forKey:", detachedTintColor, CFSTR("dTintCol"));
    v4 = v9;
  }
  detachedBackgroundColor = self->_detachedBackgroundColor;
  if (detachedBackgroundColor)
  {
    objc_msgSend(v9, "encodeObject:forKey:", detachedBackgroundColor, CFSTR("dBgCol"));
    v4 = v9;
  }
  leadingBarButtonGroups = self->_leadingBarButtonGroups;
  if (leadingBarButtonGroups)
  {
    objc_msgSend(v9, "encodeObject:forKey:", leadingBarButtonGroups, CFSTR("lGroups"));
    v4 = v9;
  }
  trailingBarButtonGroups = self->_trailingBarButtonGroups;
  if (trailingBarButtonGroups)
  {
    objc_msgSend(v9, "encodeObject:forKey:", trailingBarButtonGroups, CFSTR("tGroups"));
    v4 = v9;
  }
  if (self->_visibleWhenMinimized)
  {
    objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("rvizwm"));
    v4 = v9;
  }

}

- (RTIAssistantItem)initWithCoder:(id)a3
{
  id v4;
  RTIAssistantItem *v5;
  float v6;
  Class Class;
  Class v8;
  uint64_t v9;
  UIColor *detachedTintColor;
  uint64_t v11;
  UIColor *detachedBackgroundColor;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *leadingBarButtonGroups;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *trailingBarButtonGroups;
  objc_super v24;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v24.receiver = self;
  v24.super_class = (Class)RTIAssistantItem;
  v5 = -[RTIAssistantItem init](&v24, sel_init);
  if (v5)
  {
    v5->_showsBarButtonItemsInline = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sBtnInline"));
    v5->_showsInputDashboardViewController = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sIDVC"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("cVPW"));
    v5->_centerViewPreferredWidth = v6;
    v5->_visibleWhenMinimized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("rvizwm"));
    Class = objc_getClass("UIColor");
    if (Class)
    {
      v8 = Class;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", Class, CFSTR("dTintCol"));
      v9 = objc_claimAutoreleasedReturnValue();
      detachedTintColor = v5->_detachedTintColor;
      v5->_detachedTintColor = (UIColor *)v9;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("dBgCol"));
      v11 = objc_claimAutoreleasedReturnValue();
      detachedBackgroundColor = v5->_detachedBackgroundColor;
      v5->_detachedBackgroundColor = (UIColor *)v11;

    }
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("lGroups"));
    v16 = objc_claimAutoreleasedReturnValue();
    leadingBarButtonGroups = v5->_leadingBarButtonGroups;
    v5->_leadingBarButtonGroups = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("tGroups"));
    v21 = objc_claimAutoreleasedReturnValue();
    trailingBarButtonGroups = v5->_trailingBarButtonGroups;
    v5->_trailingBarButtonGroups = (NSArray *)v21;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTIAssistantItem *v4;
  uint64_t v5;
  NSArray *leadingBarButtonGroups;
  uint64_t v7;
  NSArray *trailingBarButtonGroups;

  v4 = -[RTIAssistantItem init](+[RTIAssistantItem allocWithZone:](RTIAssistantItem, "allocWithZone:", a3), "init");
  v4->_showsBarButtonItemsInline = self->_showsBarButtonItemsInline;
  v4->_showsInputDashboardViewController = self->_showsInputDashboardViewController;
  v4->_centerViewPreferredWidth = self->_centerViewPreferredWidth;
  objc_storeStrong((id *)&v4->_detachedTintColor, self->_detachedTintColor);
  objc_storeStrong((id *)&v4->_detachedBackgroundColor, self->_detachedBackgroundColor);
  v5 = -[NSArray copy](self->_leadingBarButtonGroups, "copy");
  leadingBarButtonGroups = v4->_leadingBarButtonGroups;
  v4->_leadingBarButtonGroups = (NSArray *)v5;

  v7 = -[NSArray copy](self->_trailingBarButtonGroups, "copy");
  trailingBarButtonGroups = v4->_trailingBarButtonGroups;
  v4->_trailingBarButtonGroups = (NSArray *)v7;

  v4->_visibleWhenMinimized = self->_visibleWhenMinimized;
  return v4;
}

- (id)description
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; visibleWhenMinimized = %d"),
    -[RTIAssistantItem visibleWhenMinimized](self, "visibleWhenMinimized"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; showsBarButtonItemsInline = %d"),
    -[RTIAssistantItem showsBarButtonItemsInline](self, "showsBarButtonItemsInline"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; showsInputDashboardViewController = %d"),
    -[RTIAssistantItem showsInputDashboardViewController](self, "showsInputDashboardViewController"));
  -[RTIAssistantItem centerViewPreferredWidth](self, "centerViewPreferredWidth");
  if (v4 != 0.0)
  {
    -[RTIAssistantItem centerViewPreferredWidth](self, "centerViewPreferredWidth");
    objc_msgSend(v3, "appendFormat:", CFSTR("; centerViewPreferredWidth = %f"), v5);
  }
  -[RTIAssistantItem detachedTintColor](self, "detachedTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTIAssistantItem detachedTintColor](self, "detachedTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; detachedTintColor = %@"), v7);

  }
  -[RTIAssistantItem detachedBackgroundColor](self, "detachedBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RTIAssistantItem detachedBackgroundColor](self, "detachedBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; detachedBackgroundColor = %@"), v9);

  }
  -[RTIAssistantItem leadingBarButtonGroups](self, "leadingBarButtonGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RTIAssistantItem leadingBarButtonGroups](self, "leadingBarButtonGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; leadingBarButtonGroups = %@"), v11);

  }
  -[RTIAssistantItem trailingBarButtonGroups](self, "trailingBarButtonGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RTIAssistantItem trailingBarButtonGroups](self, "trailingBarButtonGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; trailingBarButtonGroups = %@"), v13);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  RTIAssistantItem *v4;
  RTIAssistantItem *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = (RTIAssistantItem *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTIAssistantItem visibleWhenMinimized](self, "visibleWhenMinimized");
      if (v6 != -[RTIAssistantItem visibleWhenMinimized](v5, "visibleWhenMinimized"))
        goto LABEL_19;
      v7 = -[RTIAssistantItem showsBarButtonItemsInline](self, "showsBarButtonItemsInline");
      if (v7 != -[RTIAssistantItem showsBarButtonItemsInline](v5, "showsBarButtonItemsInline"))
        goto LABEL_19;
      v8 = -[RTIAssistantItem showsInputDashboardViewController](self, "showsInputDashboardViewController");
      if (v8 != -[RTIAssistantItem showsInputDashboardViewController](v5, "showsInputDashboardViewController"))
        goto LABEL_19;
      -[RTIAssistantItem centerViewPreferredWidth](self, "centerViewPreferredWidth");
      v10 = v9;
      -[RTIAssistantItem centerViewPreferredWidth](v5, "centerViewPreferredWidth");
      if (v10 != v11)
        goto LABEL_19;
      -[RTIAssistantItem detachedTintColor](self, "detachedTintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIAssistantItem detachedTintColor](v5, "detachedTintColor");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v12 == (void *)v13)
      {

      }
      else
      {
        v14 = (void *)v13;
        -[RTIAssistantItem detachedTintColor](self, "detachedTintColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIAssistantItem detachedTintColor](v5, "detachedTintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (!v17)
          goto LABEL_19;
      }
      -[RTIAssistantItem detachedBackgroundColor](self, "detachedBackgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIAssistantItem detachedBackgroundColor](v5, "detachedBackgroundColor");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

      }
      else
      {
        v21 = (void *)v20;
        -[RTIAssistantItem detachedBackgroundColor](self, "detachedBackgroundColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIAssistantItem detachedBackgroundColor](v5, "detachedBackgroundColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqual:", v23);

        if (!v24)
          goto LABEL_19;
      }
      -[RTIAssistantItem leadingBarButtonGroups](self, "leadingBarButtonGroups");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIAssistantItem leadingBarButtonGroups](v5, "leadingBarButtonGroups");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

      }
      else
      {
        v27 = (void *)v26;
        -[RTIAssistantItem leadingBarButtonGroups](self, "leadingBarButtonGroups");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIAssistantItem leadingBarButtonGroups](v5, "leadingBarButtonGroups");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "isEqual:", v29);

        if (!v30)
        {
LABEL_19:
          v18 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      -[RTIAssistantItem trailingBarButtonGroups](self, "trailingBarButtonGroups");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIAssistantItem trailingBarButtonGroups](v5, "trailingBarButtonGroups");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 == v33)
      {
        v18 = 1;
      }
      else
      {
        -[RTIAssistantItem trailingBarButtonGroups](self, "trailingBarButtonGroups");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIAssistantItem trailingBarButtonGroups](v5, "trailingBarButtonGroups");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v34, "isEqual:", v35);

      }
      goto LABEL_20;
    }
    v18 = 0;
  }
LABEL_21:

  return v18;
}

- (BOOL)visibleWhenMinimized
{
  return self->_visibleWhenMinimized;
}

- (void)setVisibleWhenMinimized:(BOOL)a3
{
  self->_visibleWhenMinimized = a3;
}

- (BOOL)showsBarButtonItemsInline
{
  return self->_showsBarButtonItemsInline;
}

- (void)setShowsBarButtonItemsInline:(BOOL)a3
{
  self->_showsBarButtonItemsInline = a3;
}

- (BOOL)showsInputDashboardViewController
{
  return self->_showsInputDashboardViewController;
}

- (void)setShowsInputDashboardViewController:(BOOL)a3
{
  self->_showsInputDashboardViewController = a3;
}

- (float)centerViewPreferredWidth
{
  return self->_centerViewPreferredWidth;
}

- (void)setCenterViewPreferredWidth:(float)a3
{
  self->_centerViewPreferredWidth = a3;
}

- (UIColor)detachedTintColor
{
  return self->_detachedTintColor;
}

- (void)setDetachedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_detachedTintColor, a3);
}

- (UIColor)detachedBackgroundColor
{
  return self->_detachedBackgroundColor;
}

- (void)setDetachedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_detachedBackgroundColor, a3);
}

- (NSArray)leadingBarButtonGroups
{
  return self->_leadingBarButtonGroups;
}

- (void)setLeadingBarButtonGroups:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBarButtonGroups, a3);
}

- (NSArray)trailingBarButtonGroups
{
  return self->_trailingBarButtonGroups;
}

- (void)setTrailingBarButtonGroups:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBarButtonGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_detachedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_detachedTintColor, 0);
}

@end
