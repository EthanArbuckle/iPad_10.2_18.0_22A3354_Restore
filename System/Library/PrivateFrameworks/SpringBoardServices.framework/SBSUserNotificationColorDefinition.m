@implementation SBSUserNotificationColorDefinition

+ (SBSUserNotificationColorDefinition)definitionWithColorName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithColorName:color:", v4, 0);

  return (SBSUserNotificationColorDefinition *)v5;
}

+ (SBSUserNotificationColorDefinition)definitionWithColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithColorName:color:", 0, v4);

  return (SBSUserNotificationColorDefinition *)v5;
}

- (id)_initWithColorName:(id)a3 color:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  SBSUserNotificationColorDefinition *v10;
  id *p_isa;
  void *v13;
  objc_super v14;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationColorDefinition.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colorName || color"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBSUserNotificationColorDefinition;
  v10 = -[SBSUserNotificationColorDefinition init](&v14, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_colorName, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  SBSUserNotificationColorDefinition *v5;
  uint64_t v6;
  NSString *colorName;
  void *v8;
  uint64_t v9;
  BSColor *color;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSUserNotificationColorDefinition;
  v5 = -[SBSUserNotificationColorDefinition init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SBSCFUNColorName"));
    v6 = objc_claimAutoreleasedReturnValue();
    colorName = v5->_colorName;
    v5->_colorName = (NSString *)v6;

    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SBSCFUNColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUserNotificationColorDefinition _colorForString:](v5, "_colorForString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (BSColor *)v9;

  }
  return v5;
}

- (id)build
{
  void *v3;
  void *v4;
  NSString *colorName;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  colorName = self->_colorName;
  if (colorName)
    objc_msgSend(v3, "setObject:forKey:", colorName, CFSTR("SBSCFUNColorName"));
  if (self->_color)
  {
    -[SBSUserNotificationColorDefinition _stringForColor:](self, "_stringForColor:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("SBSCFUNColor"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)_stringForColor:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "red");
  v6 = v5;
  objc_msgSend(v4, "green");
  v8 = v7;
  objc_msgSend(v4, "blue");
  v10 = v9;
  objc_msgSend(v4, "alpha");
  v12 = v11;

  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%f:%f:%f:%f"), v6, v8, v10, v12);
}

- (id)_colorForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  void *v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 4)
    {
      v6 = (void *)MEMORY[0x1E0D01710];
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v9 = v8;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      objc_msgSend(v6, "colorWithRed:green:blue:alpha:", v9, v12, v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BSColor)color
{
  return self->_color;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
