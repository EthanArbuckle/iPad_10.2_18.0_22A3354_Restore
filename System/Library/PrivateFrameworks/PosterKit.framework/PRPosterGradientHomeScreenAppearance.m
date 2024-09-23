@implementation PRPosterGradientHomeScreenAppearance

- (PRPosterGradientHomeScreenAppearance)initWithColor:(id)a3 colorPickerConfiguration:(id)a4
{
  id v6;
  id v7;
  PRPosterGradientHomeScreenAppearance *v8;
  uint64_t v9;
  PRPosterColor *color;
  PREditorColorPickerConfiguration *v11;
  PREditorColorPickerConfiguration *colorPickerConfiguration;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterGradientHomeScreenAppearance;
  v8 = -[PRPosterGradientHomeScreenAppearance init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    color = v8->_color;
    v8->_color = (PRPosterColor *)v9;

    v11 = (PREditorColorPickerConfiguration *)v7;
    if (!v11)
    {
      v11 = objc_alloc_init(PREditorColorPickerConfiguration);
      -[PREditorColorPickerConfiguration setIdentifier:](v11, "setIdentifier:", CFSTR("gradientHomeScreenAppearance"));
    }
    colorPickerConfiguration = v8->_colorPickerConfiguration;
    v8->_colorPickerConfiguration = v11;

  }
  return v8;
}

- (PRPosterGradientHomeScreenAppearance)init
{
  PREditorColorPickerConfiguration *v3;
  PRPosterGradientHomeScreenAppearance *v4;

  v3 = objc_alloc_init(PREditorColorPickerConfiguration);
  v4 = -[PRPosterGradientHomeScreenAppearance initWithColor:colorPickerConfiguration:](self, "initWithColor:colorPickerConfiguration:", 0, v3);

  return v4;
}

- (PRPosterColor)effectiveColor
{
  PRPosterColor *v3;
  void *v4;
  PRPosterColor *v5;
  void *v6;
  void *v7;

  -[PRPosterGradientHomeScreenAppearance color](self, "color");
  v3 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PRPosterGradientHomeScreenAppearance colorPickerConfiguration](self, "colorPickerConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedColor");
    v3 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v5 = [PRPosterColor alloc];
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.215686275, 0.270588235, 0.333333333, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[PRPosterColor initWithColor:](v5, "initWithColor:", v6);

    }
  }
  v7 = (void *)-[PRPosterColor copy](v3, "copy");

  return (PRPosterColor *)v7;
}

- (NSArray)gradientColors
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  -[PRPosterGradientHomeScreenAppearance effectiveColor](self, "effectiveColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.215686275, 0.270588235, 0.333333333, 1.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v14 = 0.0;
  v15 = 0.0;
  v13 = 0.0;
  objc_msgSend(v6, "getHue:saturation:brightness:alpha:", &v15, &v14, &v13, 0);
  if (v15 + -0.06 < 0.0)
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v15 + -0.06 + v7, v14, v13 + 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = v6;
  if (v15 + 0.06 > 1.0)
    v9 = 1.0;
  else
    v9 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v15 + 0.06 - v9, v14, v13 + -0.1, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterGradientHomeScreenAppearance *v4;
  char v5;

  v4 = (PRPosterGradientHomeScreenAppearance *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (BSEqualObjects())
  {
    v5 = BSEqualObjects();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[PRPosterColor hash](self->_color, "hash");
  return -[PREditorColorPickerConfiguration hash](self->_colorPickerConfiguration, "hash") ^ v3;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterGradientHomeScreenAppearance *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __51__PRPosterGradientHomeScreenAppearance_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __51__PRPosterGradientHomeScreenAppearance_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterGradientHomeScreenAppearance color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("color"));

  -[PRPosterGradientHomeScreenAppearance colorPickerConfiguration](self, "colorPickerConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("colorPickerConfiguration"));

}

- (PRPosterGradientHomeScreenAppearance)initWithCoder:(id)a3
{
  id v4;
  PRPosterColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRPosterGradientHomeScreenAppearance *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
  v5 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("color"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5 = -[PRPosterColor initWithColor:preferredStyle:]([PRPosterColor alloc], "initWithColor:preferredStyle:", v7, 1);
    else
      v5 = 0;

  }
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("colorPickerConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PRPosterGradientHomeScreenAppearance initWithColor:colorPickerConfiguration:](self, "initWithColor:colorPickerConfiguration:", v5, v9);
  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterGradientHomeScreenAppearance color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("color"));

  -[PRPosterGradientHomeScreenAppearance colorPickerConfiguration](self, "colorPickerConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("colorPickerConfiguration"));

}

- (PRPosterGradientHomeScreenAppearance)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRPosterColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRPosterGradientHomeScreenAppearance *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
  v5 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("color"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5 = -[PRPosterColor initWithColor:preferredStyle:]([PRPosterColor alloc], "initWithColor:preferredStyle:", v7, 1);
    else
      v5 = 0;

  }
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("colorPickerConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PRPosterGradientHomeScreenAppearance initWithColor:colorPickerConfiguration:](self, "initWithColor:colorPickerConfiguration:", v5, v9);
  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[PRPosterGradientHomeScreenAppearance color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v8, "appendObject:withName:", v4, CFSTR("color"));

  -[PRPosterGradientHomeScreenAppearance colorPickerConfiguration](self, "colorPickerConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "appendObject:withName:", v6, CFSTR("colorPickerConfiguration"));

}

- (PRPosterColor)color
{
  return self->_color;
}

- (PREditorColorPickerConfiguration)colorPickerConfiguration
{
  return self->_colorPickerConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerConfiguration, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
