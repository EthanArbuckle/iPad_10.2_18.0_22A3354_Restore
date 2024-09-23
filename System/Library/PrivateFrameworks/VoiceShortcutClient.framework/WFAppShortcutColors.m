@implementation WFAppShortcutColors

- (WFColor)tintColor
{
  return self->_tintColor;
}

- (WFGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (BOOL)isDefaultTintColor
{
  return self->_isDefaultTintColor;
}

- (WFAppShortcutColors)initWithComplementingColors:(id)a3 tintColor:(id)a4
{
  id v6;
  id v7;
  WFAppShortcutColors *v8;
  WFGradient *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  WFGradient *backgroundGradient;
  WFColor *v16;
  char v17;
  WFColor *tintColor;
  uint64_t v19;
  WFAppShortcutColors *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WFAppShortcutColors;
  v8 = -[WFAppShortcutColors init](&v22, sel_init);
  if (!v8)
    goto LABEL_11;
  if (objc_msgSend(v6, "count") == 1)
  {
    v9 = [WFGradient alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v12 = 0;
LABEL_6:
    objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFGradient initWithStartColor:endColor:](v9, "initWithStartColor:endColor:", v10, v13);
    backgroundGradient = v8->_backgroundGradient;
    v8->_backgroundGradient = (WFGradient *)v14;

    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v9 = [WFGradient alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v12 = 1;
    goto LABEL_6;
  }
LABEL_7:
  if (v7)
  {
    v16 = (WFColor *)v7;
    v17 = 0;
    tintColor = v8->_tintColor;
    v8->_tintColor = v16;
  }
  else
  {
    -[WFGradient baseColor](v8->_backgroundGradient, "baseColor");
    v19 = objc_claimAutoreleasedReturnValue();
    tintColor = v8->_tintColor;
    v8->_tintColor = (WFColor *)v19;
    v17 = 1;
  }

  v8->_isDefaultTintColor = v17;
  v20 = v8;
LABEL_11:

  return v8;
}

- (WFAppShortcutColors)initWithCoder:(id)a3
{
  id v4;
  WFAppShortcutColors *v5;
  uint64_t v6;
  WFGradient *backgroundGradient;
  uint64_t v8;
  WFColor *tintColor;
  WFAppShortcutColors *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFAppShortcutColors;
  v5 = -[WFAppShortcutColors init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundGradient"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundGradient = v5->_backgroundGradient;
    v5->_backgroundGradient = (WFGradient *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (WFColor *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFAppShortcutColors backgroundGradient](self, "backgroundGradient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("backgroundGradient"));

  -[WFAppShortcutColors tintColor](self, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tintColor"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundGradient, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
