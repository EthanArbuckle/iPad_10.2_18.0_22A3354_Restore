@implementation PREditorContentStylePalette

+ (id)_standardPaletteColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[13];

  v17[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightBlue"), v2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("darkBlue"), v2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("plum"), v2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("magenta"), v2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("pink"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("coral"), v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("orange"), v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("peach"), v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("yellow"), v2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("greenYellow"), v2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightGreen"), v2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("green"), v2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_condensedPaletteColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[10];

  v14[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightBlue"), v2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("darkBlue"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("plum"), v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("magenta"), v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("coral"), v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("peach"), v2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("yellow"), v2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightGreen"), v2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("green"), v2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_additionalColorsForExtendedPalette
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedGreen"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedBlue"), v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedPurple"), v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedBrown"), v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_incomingCallRainbowTextStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRPosterContentGradientStyle *v10;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.250980392, 0.878431373, 0.815686275, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.250980392, 0.878431373, 0.815686275, 1.0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.564705882, 0.835294118, 0.294117647, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.68627451, 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.470588235, 0.156862745, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.282352941, 0.294117647, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PRPosterContentGradientStyle initWithColors:gradientType:locations:startPoint:endPoint:]([PRPosterContentGradientStyle alloc], "initWithColors:gradientType:locations:startPoint:endPoint:", v9, 0, &unk_1E21DD158, 0.0, 0.5, 1.0, 0.5);
  return v10;
}

+ (id)defaultPaletteForContext:(unint64_t)a3 role:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PRPosterContentVibrantMaterialStyle *v9;
  PRPosterContentVibrantMonochromeStyle *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
    objc_msgSend(a1, "_condensedPaletteColors");
  else
    objc_msgSend(a1, "_standardPaletteColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    v9 = objc_alloc_init(PRPosterContentVibrantMaterialStyle);
    v21[0] = v9;
    v10 = objc_alloc_init(PRPosterContentVibrantMonochromeStyle);
    v21[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
      v12 = objc_msgSend(v6, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall"));
    else
      v12 = 0;
    v16 = _os_feature_enabled_impl();
    if (v16)
      v16 = objc_msgSend(v6, "isEqualToString:", CFSTR("PRPosterRoleLockScreen"));
    if ((v12 | v16) == 1)
    {
      objc_msgSend((id)objc_opt_class(), "_incomingCallRainbowTextStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v18;
    }
    objc_msgSend(v8, "bs_map:", &__block_literal_global_28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_additionalColorsForExtendedPalette");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "bs_map:", &__block_literal_global_48_0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContentStyles:context:role:localizedName:defaultPalette:", v15, a3, v6, 0, 1);
  return v19;
}

PRPosterContentDiscreteColorsStyle *__61__PREditorContentStylePalette_defaultPaletteForContext_role___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRPosterContentDiscreteColorsStyle *v3;
  void *v4;
  PRPosterContentDiscreteColorsStyle *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = [PRPosterContentDiscreteColorsStyle alloc];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PRPosterContentDiscreteColorsStyle initWithVibrantColors:variation:](v3, "initWithVibrantColors:variation:", v4, 0.0);
  return v5;
}

PRPosterContentDiscreteColorsStyle *__61__PREditorContentStylePalette_defaultPaletteForContext_role___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PRPosterContentDiscreteColorsStyle *v3;
  void *v4;
  PRPosterContentDiscreteColorsStyle *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = [PRPosterContentDiscreteColorsStyle alloc];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PRPosterContentDiscreteColorsStyle initWithOpaqueColors:variation:](v3, "initWithOpaqueColors:variation:", v4, 0.0);
  return v5;
}

- (PREditorContentStylePalette)initWithContentStyles:(id)a3 localizedName:(id)a4
{
  return -[PREditorContentStylePalette initWithContentStyles:context:role:localizedName:defaultPalette:](self, "initWithContentStyles:context:role:localizedName:defaultPalette:", a3, 0, 0, a4, 0);
}

- (PREditorContentStylePalette)initWithContentStyles:(id)a3 context:(unint64_t)a4 role:(id)a5 localizedName:(id)a6 defaultPalette:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  PREditorContentStylePalette *v16;
  uint64_t v17;
  NSString *localizedName;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PREditorContentStylePalette;
  v16 = -[PREditorContentStylePalette init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    localizedName = v16->_localizedName;
    v16->_localizedName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_styles, a3);
    v16->_context = a4;
    objc_storeStrong((id *)&v16->_role, a5);
    v16->_defaultPalette = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PREditorContentStylePalette *v4;
  void *v5;
  char isKindOfClass;
  PREditorContentStylePalette *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (PREditorContentStylePalette *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PREditorContentStylePalette localizedName](self, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorContentStylePalette localizedName](v7, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualStrings();

      if (v10)
      {
        -[PREditorContentStylePalette styles](self, "styles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorContentStylePalette styles](v7, "styles");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = BSEqualObjects();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PREditorContentStylePalette styles](self, "styles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PREditorContentStylePalette localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PREditorContentStylePalette *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __42__PREditorContentStylePalette_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __42__PREditorContentStylePalette_description__block_invoke(uint64_t a1)
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
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *role;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PREditorContentStylePalette styles](self, "styles");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "type", (_QWORD)v14) == 999)
        {
          v13 = v5;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[PREditorContentStylePalette styles](self, "styles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("styles"));

  role = self->_role;
  if (role)
    objc_msgSend(v4, "encodeObject:forKey:", role, CFSTR("role"));
  -[PREditorContentStylePalette localizedName](self, "localizedName", (_QWORD)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("localizedName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorContentStylePalette context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("context"));
LABEL_13:

}

- (PREditorContentStylePalette)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PREditorContentStylePalette *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultPaletteForContext:role:", v6, v7);
    v8 = (PREditorContentStylePalette *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    v16[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v11, CFSTR("styles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, CFSTR("localizedName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[PREditorContentStylePalette initWithContentStyles:context:role:localizedName:defaultPalette:](self, "initWithContentStyles:context:role:localizedName:defaultPalette:", v12, 0, v7, v14, 0);
    v8 = self;
  }

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  NSString *role;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PREditorContentStylePalette styles](self, "styles");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "type") == 999)
        {
          v21 = v5;
          goto LABEL_20;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("styleCount"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = v5;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("style%ld"), v14 + j);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v14 += j;
    }
    while (v13);
  }

  role = self->_role;
  if (role)
    objc_msgSend(v4, "encodeObject:forKey:", role, CFSTR("role"));
  -[PREditorContentStylePalette localizedName](self, "localizedName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("localizedName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorContentStylePalette context](self, "context"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("context"));
  v5 = v22;
LABEL_20:

}

- (PREditorContentStylePalette)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  PREditorContentStylePalette *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  unint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  PREditorContentStylePalette *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[7];

  v37[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = 0x1E0CB3000uLL;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultPaletteForContext:role:", v6, v8);
    v10 = (PREditorContentStylePalette *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = (void *)v8;
    v29 = self;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("styleCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    v37[3] = objc_opt_class();
    v37[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        v15 = v7;
        objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("style%ld"), i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v17 = v31;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v33;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v33 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(v4, "decodeObjectOfClass:forKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j), v16);
              v22 = objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v23 = (void *)v22;
                objc_msgSend(v30, "addObject:", v22);

                goto LABEL_15;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            if (v19)
              continue;
            break;
          }
        }
LABEL_15:

        v7 = v15;
      }
    }
    objc_opt_self();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, CFSTR("localizedName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_msgSend(v30, "copy");
    v9 = v28;
    self = -[PREditorContentStylePalette initWithContentStyles:context:role:localizedName:defaultPalette:](v29, "initWithContentStyles:context:role:localizedName:defaultPalette:", v26, 0, v28, v25, 0);

    v10 = self;
  }

  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = -[PREditorContentStylePalette context](self, "context");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_1E21853D8[v5];
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("context"));
  -[PREditorContentStylePalette role](self, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("role"));

  -[PREditorContentStylePalette styles](self, "styles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("styles"));

  -[PREditorContentStylePalette localizedName](self, "localizedName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v10, CFSTR("localizedName"), 1);

}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)styles
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)context
{
  return self->_context;
}

- (BOOL)isDefaultPalette
{
  return self->_defaultPalette;
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
