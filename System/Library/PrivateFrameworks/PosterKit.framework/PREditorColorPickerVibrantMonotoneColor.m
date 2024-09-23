@implementation PREditorColorPickerVibrantMonotoneColor

+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double result;

  v4 = a4 * -0.25;
  objc_msgSend(a3, "hslValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "luminance");
  v7 = v6;

  result = fmax(v7 + v4, 0.1);
  if (result > 0.9)
    return 0.9;
  return result;
}

- (PREditorColorPickerVibrantMonotoneColor)initWithColor:(id)a3 displayColors:(id)a4
{
  return -[PREditorColorPickerVibrantMonotoneColor initWithColor:displayColors:localizedName:](self, "initWithColor:displayColors:localizedName:", a3, a4, 0);
}

- (PREditorColorPickerVibrantMonotoneColor)initWithColor:(id)a3 displayColors:(id)a4 localizedName:(id)a5
{
  id v9;
  id v10;
  id v11;
  PREditorColorPickerVibrantMonotoneColor *v12;
  PREditorColorPickerVibrantMonotoneColor *v13;
  uint64_t v14;
  PRPosterColor *activeDisplayColor;
  uint64_t v16;
  NSString *localizedName;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PREditorColorPickerVibrantMonotoneColor;
  v12 = -[PREditorColorPickerVibrantMonotoneColor init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_color, a3);
    objc_storeStrong((id *)&v13->_displayColors, a4);
    -[NSDictionary objectForKeyedSubscript:](v13->_displayColors, "objectForKeyedSubscript:", &unk_1E21DCE18);
    v14 = objc_claimAutoreleasedReturnValue();
    activeDisplayColor = v13->_activeDisplayColor;
    v13->_activeDisplayColor = (PRPosterColor *)v14;

    v16 = objc_msgSend(v11, "copy");
    localizedName = v13->_localizedName;
    v13->_localizedName = (NSString *)v16;

  }
  return v13;
}

- (NSString)localizedName
{
  NSString *localizedName;

  localizedName = self->_localizedName;
  if (localizedName)
    return localizedName;
  -[PRPosterColor localizedName](self->_activeDisplayColor, "localizedName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setContentsLuminance:(double)a3
{
  uint64_t v4;
  NSDictionary *displayColors;
  void *v6;
  PRPosterColor *v7;
  PRPosterColor *activeDisplayColor;

  v4 = PRPosterContentsBackgroundTypeForLuminance(a3);
  displayColors = self->_displayColors;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](displayColors, "objectForKeyedSubscript:", v6);
  v7 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();

  activeDisplayColor = self->_activeDisplayColor;
  self->_activeDisplayColor = v7;

}

- (double)initialVariation
{
  return 0.0;
}

- (PRPosterColor)baseColor
{
  return self->_color;
}

- (PRPosterColor)leftSliderColor
{
  return (PRPosterColor *)-[PREditorColorPickerVibrantMonotoneColor displayColorWithVariation:](self, "displayColorWithVariation:", -1.0);
}

- (PRPosterColor)rightSliderColor
{
  return (PRPosterColor *)-[PREditorColorPickerVibrantMonotoneColor displayColorWithVariation:](self, "displayColorWithVariation:", 1.0);
}

- (PREditorColorPickerVibrantMonotoneColor)colorWithVariation:(double)a3
{
  return (PREditorColorPickerVibrantMonotoneColor *)-[PRPosterColor copyWithAlpha:](self->_color, "copyWithAlpha:", (a3 + 1.0) * 0.5 + 0.0);
}

- (id)displayColorWithVariation:(double)a3
{
  objc_msgSend((id)objc_opt_class(), "luminanceForPosterColor:withAppliedVariation:", self->_activeDisplayColor, a3);
  return -[PRPosterColor copyWithLuminance:](self->_activeDisplayColor, "copyWithLuminance:");
}

- (BOOL)isCustomColor
{
  return 0;
}

- (BOOL)isVibrantColor
{
  return 1;
}

- (double)variationForAlpha:(double)a3
{
  return a3 + a3 + -1.0;
}

- (BOOL)isEqual:(id)a3
{
  PREditorColorPickerVibrantMonotoneColor *v4;
  void *v5;
  char isKindOfClass;
  PREditorColorPickerVibrantMonotoneColor *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  char v17;
  void *v19;
  void *v20;

  v4 = (PREditorColorPickerVibrantMonotoneColor *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PREditorColorPickerVibrantMonotoneColor color](self, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerVibrantMonotoneColor color](v7, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (!v10)
        goto LABEL_6;
      -[PREditorColorPickerVibrantMonotoneColor displayColors](self, "displayColors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerVibrantMonotoneColor displayColors](v7, "displayColors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = BSEqualObjects();

      if (!v13)
        goto LABEL_6;
      -[PREditorColorPickerVibrantMonotoneColor initialVariation](self, "initialVariation");
      v15 = v14;
      -[PREditorColorPickerVibrantMonotoneColor initialVariation](v7, "initialVariation");
      if (v15 == v16)
      {
        -[PREditorColorPickerVibrantMonotoneColor localizedName](self, "localizedName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorColorPickerVibrantMonotoneColor localizedName](v7, "localizedName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = BSEqualStrings();

      }
      else
      {
LABEL_6:
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  -[PREditorColorPickerVibrantMonotoneColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[PREditorColorPickerVibrantMonotoneColor displayColors](self, "displayColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[PREditorColorPickerVibrantMonotoneColor initialVariation](self, "initialVariation");
  v8 = (id)objc_msgSend(v3, "appendCGFloat:");
  if (self->_localizedName)
  {
    -[PREditorColorPickerVibrantMonotoneColor localizedName](self, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  }
  v11 = objc_msgSend(v3, "hash");

  return v11;
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
  PREditorColorPickerVibrantMonotoneColor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __54__PREditorColorPickerVibrantMonotoneColor_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __54__PREditorColorPickerVibrantMonotoneColor_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PREditorColorPickerVibrantMonotoneColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("color"));

  -[PREditorColorPickerVibrantMonotoneColor displayColors](self, "displayColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("displayColors"));

  if (self->_localizedName)
  {
    -[PREditorColorPickerVibrantMonotoneColor localizedName](self, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("localizedName"));

  }
}

- (PREditorColorPickerVibrantMonotoneColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PREditorColorPickerVibrantMonotoneColor *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v7, objc_opt_class(), CFSTR("displayColors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PREditorColorPickerVibrantMonotoneColor initWithColor:displayColors:localizedName:](self, "initWithColor:displayColors:localizedName:", v6, v8, v9);
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PREditorColorPickerVibrantMonotoneColor color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("color"));

  -[PREditorColorPickerVibrantMonotoneColor displayColors](self, "displayColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[PREditorColorPickerVibrantMonotoneColor displayColors](self, "displayColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "addObject:", v16);
        objc_msgSend(v6, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(v4, "encodeCollection:forKey:", v9, CFSTR("displayColorKeys"));
  objc_msgSend(v4, "encodeCollection:forKey:", v10, CFSTR("displayColorValues"));
  if (self->_localizedName)
  {
    -[PREditorColorPickerVibrantMonotoneColor localizedName](self, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("localizedName"));

  }
}

- (PREditorColorPickerVibrantMonotoneColor)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PREditorColorPickerVibrantMonotoneColor *v13;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v7, objc_opt_class(), CFSTR("displayColorKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("displayColorValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PREditorColorPickerVibrantMonotoneColor initWithColor:displayColors:localizedName:](self, "initWithColor:displayColors:localizedName:", v6, v11, v12);
  return v13;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[PREditorColorPickerVibrantMonotoneColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v10, "appendObject:withName:", v4, CFSTR("color"));

  -[PREditorColorPickerVibrantMonotoneColor displayColors](self, "displayColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v10, "appendObject:withName:", v6, CFSTR("displayColors"));

  -[PREditorColorPickerVibrantMonotoneColor localizedName](self, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "appendObject:withName:skipIfNil:", v8, CFSTR("localizedName"), 1);

}

- (PRPosterColor)color
{
  return self->_color;
}

- (NSDictionary)displayColors
{
  return self->_displayColors;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PRPosterColor)activeDisplayColor
{
  return self->_activeDisplayColor;
}

- (void)setActiveDisplayColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDisplayColor, 0);
  objc_storeStrong((id *)&self->_displayColors, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
