@implementation PREditorColorPalette

+ (id)standardPaletteColors
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
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightBlue"), v2, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("darkBlue"), v2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("plum"), v2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("magenta"), v2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("pink"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("coral"), v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("orange"), v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("peach"), v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("yellow"), v2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("greenYellow"), v2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightGreen"), v2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("green"), v2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bs_map:", &__block_literal_global_14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

PRPosterColor *__45__PREditorColorPalette_standardPaletteColors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRPosterColor *v3;

  v2 = a2;
  v3 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v2);

  return v3;
}

+ (id)condensedPaletteColors
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
  void *v12;
  void *v14;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightBlue"), v2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("darkBlue"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("plum"), v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("magenta"), v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("coral"), v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("peach"), v2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("yellow"), v2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lightGreen"), v2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("green"), v2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bs_map:", &__block_literal_global_27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

PRPosterColor *__46__PREditorColorPalette_condensedPaletteColors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRPosterColor *v3;

  v2 = a2;
  v3 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v2);

  return v3;
}

+ (id)additionalColorsForExtendedPalette
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
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedGreen"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedBlue"), v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedPurple"), v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("desaturatedBrown"), v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bs_map:", &__block_literal_global_36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

PRPosterColor *__58__PREditorColorPalette_additionalColorsForExtendedPalette__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRPosterColor *v3;

  v2 = a2;
  v3 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v2);

  return v3;
}

+ (id)standardPalette
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "standardPaletteColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPickerColors:colors:localizedName:paletteType:showsColorWell:", 0, v4, 0, 0, 0);

  return v5;
}

+ (id)extendedPalette
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "standardPaletteColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "additionalColorsForExtendedPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPickerColors:colors:localizedName:paletteType:showsColorWell:", 0, v5, 0, 1, 0);
  return v6;
}

+ (id)condensedPalette
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "condensedPaletteColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPickerColors:colors:localizedName:paletteType:showsColorWell:", 0, v4, 0, 2, 0);

  return v5;
}

- (PREditorColorPalette)initWithColors:(id)a3 localizedName:(id)a4 showsColorWell:(BOOL)a5
{
  return -[PREditorColorPalette initWithPickerColors:colors:localizedName:paletteType:showsColorWell:](self, "initWithPickerColors:colors:localizedName:paletteType:showsColorWell:", 0, a3, a4, 3, a5);
}

- (PREditorColorPalette)initWithPickerColors:(id)a3 localizedName:(id)a4
{
  return -[PREditorColorPalette initWithPickerColors:colors:localizedName:paletteType:showsColorWell:](self, "initWithPickerColors:colors:localizedName:paletteType:showsColorWell:", a3, 0, a4, 3, 0);
}

- (PREditorColorPalette)initWithPickerColors:(id)a3 colors:(id)a4 localizedName:(id)a5 paletteType:(unint64_t)a6 showsColorWell:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  PREditorColorPalette *v16;
  uint64_t v17;
  NSString *localizedName;
  PREditorColorPalette *v19;
  void *v20;
  uint64_t v21;
  NSArray *colors;
  _QWORD v24[4];
  PREditorColorPalette *v25;
  uint64_t *v26;
  SEL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PREditorColorPalette;
  v16 = -[PREditorColorPalette init](&v32, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    localizedName = v16->_localizedName;
    v16->_localizedName = (NSString *)v17;

    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __93__PREditorColorPalette_initWithPickerColors_colors_localizedName_paletteType_showsColorWell___block_invoke;
    v24[3] = &unk_1E2183A10;
    v26 = &v28;
    v27 = a2;
    v19 = v16;
    v25 = v19;
    objc_msgSend(v14, "bs_map:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    colors = v19->_colors;
    v19->_colors = (NSArray *)v21;

    objc_storeStrong((id *)&v19->_pickerColors, a3);
    v19->_includesObjectsOfTypePRPosterColor = *((_BYTE *)v29 + 24);
    v19->_paletteType = a6;
    if (v13)
      v19->_hasGeneratedPickerColors = 1;

    _Block_object_dispose(&v28, 8);
  }

  return v16;
}

PRPosterColor *__93__PREditorColorPalette_initWithPickerColors_colors_localizedName_paletteType_showsColorWell___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PRPosterColor *v4;
  PRPosterColor *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (PRPosterColor *)v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v4 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v3);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (void)generatePickerColorsIfNeededForContext:(unint64_t)a3
{
  uint64_t v5;
  NSArray *colors;
  NSArray *v7;
  NSArray *pickerColors;
  _QWORD v9[6];

  if (!self->_hasGeneratedPickerColors)
  {
    v5 = objc_opt_class();
    colors = self->_colors;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__PREditorColorPalette_generatePickerColorsIfNeededForContext___block_invoke;
    v9[3] = &__block_descriptor_48_e23__16__0__PRPosterColor_8lu40l8;
    v9[4] = a3;
    v9[5] = v5;
    -[NSArray bs_map:](colors, "bs_map:", v9);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    pickerColors = self->_pickerColors;
    self->_pickerColors = v7;

    self->_hasGeneratedPickerColors = 1;
  }
}

id __63__PREditorColorPalette_generatePickerColorsIfNeededForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  v5 = 0.0;
  if (*(_QWORD *)(a1 + 32) == 1)
  {
    if (objc_msgSend(v3, "preferredStyle") == 1)
      v5 = 1.0;
    else
      v5 = 0.0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithColor:initialVariation:", v4, v5);

  return v6;
}

- (BOOL)shouldShowColorWell
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  PREditorColorPalette *v4;
  void *v5;
  char isKindOfClass;
  PREditorColorPalette *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (PREditorColorPalette *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PREditorColorPalette localizedName](self, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPalette localizedName](v7, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualStrings();

      if (v10
        && (-[PREditorColorPalette colors](self, "colors"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PREditorColorPalette colors](v7, "colors"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = BSEqualObjects(),
            v12,
            v11,
            v13))
      {
        -[PREditorColorPalette pickerColors](self, "pickerColors");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorColorPalette pickerColors](v7, "pickerColors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = BSEqualObjects();

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  -[PREditorColorPalette colors](self, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PREditorColorPalette localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  if (-[PREditorColorPalette hasGeneratedPickerColors](self, "hasGeneratedPickerColors"))
  {
    -[PREditorColorPalette pickerColors](self, "pickerColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 ^= objc_msgSend(v7, "hash");

  }
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
  PREditorColorPalette *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __35__PREditorColorPalette_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __35__PREditorColorPalette_description__block_invoke(uint64_t a1)
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
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PREditorColorPalette pickerColors](self, "pickerColors");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "isCustomColor", (_QWORD)v13) & 1) != 0)
        {
          v12 = v5;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[PREditorColorPalette colors](self, "colors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("colors"));

  -[PREditorColorPalette localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("localizedName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PREditorColorPalette includesObjectsOfTypePRPosterColor](self, "includesObjectsOfTypePRPosterColor"), CFSTR("includesPosterColors"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPalette paletteType](self, "paletteType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("paletteType"));
LABEL_11:

}

- (PREditorColorPalette)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  PREditorColorPalette *v19;
  PREditorColorPalette *v20;
  PREditorColorPalette *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paletteType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if ((objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStandardPalette")) & 1) == 0)
    {
      v8 = 3;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v7 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "condensedPalette");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v8 = v7;
  if (v7 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "extendedPalette");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!v7)
  {
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "standardPalette");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v21 = (PREditorColorPalette *)v9;
    goto LABEL_17;
  }
LABEL_9:
  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("colors"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includesPosterColors"));
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, CFSTR("localizedName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v15, "count"))
  {
    v19 = -[PREditorColorPalette initWithPickerColors:colors:localizedName:paletteType:showsColorWell:](self, "initWithPickerColors:colors:localizedName:paletteType:showsColorWell:", 0, v15, v18, v8, 0);
    v19->_includesObjectsOfTypePRPosterColor = v16;
    v20 = v19;
    self = v20;
  }
  else
  {
    +[PREditorColorPalette standardPalette](PREditorColorPalette, "standardPalette");
    v20 = (PREditorColorPalette *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

LABEL_17:
  return v21;
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
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PREditorColorPalette pickerColors](self, "pickerColors");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "isCustomColor", (_QWORD)v13) & 1) != 0)
        {
          v12 = v5;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[PREditorColorPalette colors](self, "colors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("colors"));

  -[PREditorColorPalette localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("localizedName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PREditorColorPalette includesObjectsOfTypePRPosterColor](self, "includesObjectsOfTypePRPosterColor"), CFSTR("includesPosterColors"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPalette paletteType](self, "paletteType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("paletteType"));
LABEL_11:

}

- (PREditorColorPalette)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  PREditorColorPalette *v15;
  PREditorColorPalette *v16;
  PREditorColorPalette *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paletteType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if ((objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStandardPalette")) & 1) == 0)
    {
      v8 = 3;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v7 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "condensedPalette");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v8 = v7;
  if (v7 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "extendedPalette");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!v7)
  {
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "standardPalette");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v17 = (PREditorColorPalette *)v9;
    goto LABEL_17;
  }
LABEL_9:
  v10 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v10, objc_opt_class(), CFSTR("colors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includesPosterColors"));
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, CFSTR("localizedName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "count"))
  {
    v15 = -[PREditorColorPalette initWithPickerColors:colors:localizedName:paletteType:showsColorWell:](self, "initWithPickerColors:colors:localizedName:paletteType:showsColorWell:", 0, v11, v14, v8, 0);
    v15->_includesObjectsOfTypePRPosterColor = v12;
    v16 = v15;
    self = v16;
  }
  else
  {
    +[PREditorColorPalette standardPalette](PREditorColorPalette, "standardPalette");
    v16 = (PREditorColorPalette *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

LABEL_17:
  return v17;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  id v11;
  id v12;

  v12 = a3;
  -[PREditorColorPalette colors](self, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v12, "appendObject:withName:", v4, CFSTR("colors"));

  -[PREditorColorPalette pickerColors](self, "pickerColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v12, "appendObject:withName:skipIfNil:", v6, CFSTR("pickerColors"), 1);

  -[PREditorColorPalette localizedName](self, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:skipIfEmpty:", v8, CFSTR("localizedName"), 1);

  v9 = -[PREditorColorPalette paletteType](self, "paletteType");
  if (v9 > 3)
    v10 = 0;
  else
    v10 = off_1E2184AC0[v9];
  objc_msgSend(v12, "appendString:withName:", v10, CFSTR("paletteType"));
  v11 = (id)objc_msgSend(v12, "appendBool:withName:", -[PREditorColorPalette includesObjectsOfTypePRPosterColor](self, "includesObjectsOfTypePRPosterColor"), CFSTR("includesPosterColors"));

}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)colors
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)hasGeneratedPickerColors
{
  return self->_hasGeneratedPickerColors;
}

- (void)setHasGeneratedPickerColors:(BOOL)a3
{
  self->_hasGeneratedPickerColors = a3;
}

- (BOOL)includesObjectsOfTypePRPosterColor
{
  return self->_includesObjectsOfTypePRPosterColor;
}

- (unint64_t)paletteType
{
  return self->_paletteType;
}

- (NSArray)pickerColors
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPickerColors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
