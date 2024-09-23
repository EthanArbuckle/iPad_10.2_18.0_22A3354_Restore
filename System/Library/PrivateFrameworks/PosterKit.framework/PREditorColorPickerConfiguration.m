@implementation PREditorColorPickerConfiguration

- (PREditorColorPickerConfiguration)init
{
  uint64_t v3;

  LOBYTE(v3) = 1;
  return -[PREditorColorPickerConfiguration initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:](self, "initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:", 0, 0, 0, 0, 0, 2, v3, 0);
}

- (PREditorColorPickerConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedColor:(id)a5 suggestedColors:(id)a6 colorPalette:(id)a7 colorWellDisplayMode:(unint64_t)a8 showsSlider:(BOOL)a9 context:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PREditorColorPickerConfiguration *v22;
  NSString *v23;
  NSString *identifier;
  const char *v25;
  NSString *v26;
  void *prompt;
  uint64_t v28;
  NSString *v29;
  int isKindOfClass;
  int v31;
  int v32;
  char v33;
  PRPosterColor *v34;
  uint64_t v35;
  id selectedColor;
  PREditorColorPickerConfiguration *v37;
  void *v38;
  uint64_t v39;
  NSArray *suggestedColors;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  PREditorColorPalette *v46;
  PREditorColorPalette *colorPalette;
  char v48;
  UIView *colorPickerSourceView;
  UIPopoverPresentationControllerSourceItem *colorPickerSourceItem;
  PREditorColorPickerConfiguration *result;
  void *v52;
  void *v53;
  char v54;
  unint64_t v55;
  _QWORD v56[4];
  PREditorColorPickerConfiguration *v57;
  uint64_t *v58;
  const char *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  objc_super v64;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v64.receiver = self;
  v64.super_class = (Class)PREditorColorPickerConfiguration;
  v22 = -[PREditorColorPickerConfiguration init](&v64, sel_init);
  if (!v22)
    goto LABEL_23;
  if (v17)
    v23 = (NSString *)v17;
  else
    v23 = (NSString *)objc_msgSend(CFSTR("default"), "copy");
  identifier = v22->_identifier;
  v22->_identifier = v23;

  v55 = a8;
  v25 = a2;
  if (v18)
  {
    v26 = (NSString *)v18;
    prompt = v22->_prompt;
    v22->_prompt = v26;
  }
  else
  {
    PRBundle();
    prompt = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(prompt, "localizedStringForKey:value:table:", CFSTR("EDIT_COLOR_PICKER_DEFAULT_PROMPT"), &stru_1E2186E08, CFSTR("PosterKit"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v22->_prompt;
    v22->_prompt = (NSString *)v28;

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v31 = objc_opt_isKindOfClass();
  if (!v19)
  {
    v34 = 0;
    v54 = 1;
LABEL_14:
    v35 = -[PRPosterColor copy](v34, "copy", v34);
    selectedColor = v22->_selectedColor;
    v22->_selectedColor = (id)v35;

    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __146__PREditorColorPickerConfiguration_initWithIdentifier_prompt_selectedColor_suggestedColors_colorPalette_colorWellDisplayMode_showsSlider_context___block_invoke;
    v56[3] = &unk_1E2183A10;
    v58 = &v60;
    v59 = v25;
    v37 = v22;
    v57 = v37;
    objc_msgSend(v20, "bs_compactMap:", v56);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "copy");
    suggestedColors = v37->_suggestedColors;
    v37->_suggestedColors = (NSArray *)v39;

    if (v21)
    {
      v41 = v21;
      v42 = v18;
      v43 = v17;
      v44 = v20;
      v45 = v41;
      v46 = v41;
    }
    else
    {
      +[PREditorColorPalette extendedPalette](PREditorColorPalette, "extendedPalette");
      v46 = (PREditorColorPalette *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v42 = v18;
      v43 = v17;
      v44 = v20;
    }
    colorPalette = v37->_colorPalette;
    v37->_colorPalette = v46;

    v37->_colorWellDisplayMode = v55;
    v37->_showsSlider = a9;
    v37->_context = a10;
    if ((v54 & 1) != 0)
    {
      v48 = 1;
      v20 = v44;
      v17 = v43;
      v18 = v42;
    }
    else
    {
      v20 = v44;
      v18 = v42;
      if (!*((_BYTE *)v61 + 24))
      {
        v21 = v45;
        v48 = objc_msgSend(v45, "includesObjectsOfTypePRPosterColor");
        v17 = v43;
        goto LABEL_22;
      }
      v48 = 1;
      v17 = v43;
    }
    v21 = v45;
LABEL_22:
    v37->_includesObjectsOfTypePRPickerColor = v48;
    colorPickerSourceView = v37->_colorPickerSourceView;
    v37->_colorPickerSourceView = 0;

    colorPickerSourceItem = v37->_colorPickerSourceItem;
    v37->_colorPickerSourceItem = 0;

    _Block_object_dispose(&v60, 8);
LABEL_23:

    return v22;
  }
  v32 = v31;
  objc_opt_class();
  v33 = objc_opt_isKindOfClass();
  if (((isKindOfClass | v32) & 1) != 0)
  {
    v54 = v33;
    if ((isKindOfClass & 1) != 0)
      v34 = (PRPosterColor *)v19;
    else
      v34 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v19);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected object type provided for [PREditorColorPickerConfiguration selectedColor]"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PREditorColorPickerConfiguration initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:].cold.1(v25);
  objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
  result = (PREditorColorPickerConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

PRPosterColor *__146__PREditorColorPickerConfiguration_initWithIdentifier_prompt_selectedColor_suggestedColors_colorPalette_colorWellDisplayMode_showsSlider_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PRPosterColor *v4;
  PRPosterColor *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
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
    v4 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v3);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (void)setSelectedColor:(id)a3
{
  int isKindOfClass;
  int v6;
  PRPosterColor *v7;
  PRPosterColor *v8;
  void *v9;
  id selectedColor;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  if (!v12)
  {
    v8 = 0;
LABEL_8:
    v9 = (void *)-[PRPosterColor copy](v8, "copy");
    selectedColor = self->_selectedColor;
    self->_selectedColor = v9;

    -[PREditorColorPickerConfiguration didUpdateColors](self, "didUpdateColors");
    return;
  }
  if (((isKindOfClass | v6) & 1) != 0)
  {
    if ((isKindOfClass & 1) != 0)
      v7 = (PRPosterColor *)v12;
    else
      v7 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v12);
    v8 = v7;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected object type provided for [PREditorColorPickerConfiguration selectedColor]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PREditorColorPickerConfiguration setSelectedColor:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)setSuggestedColor:(id)a3
{
  BOOL v4;
  void *v5;
  PRPosterColor *v6;
  PRPosterColor *v7;
  uint64_t v8;
  PRPosterColor *suggestedColor;
  id v10;

  v10 = a3;
  v4 = -[PRPosterColor isEquivalentToColor:](self->_suggestedColor, "isEquivalentToColor:", v10);
  v5 = v10;
  if (!v4)
  {
    v6 = (PRPosterColor *)v10;
    v7 = v6;
    if (v6 && !-[PRPosterColor isSuggested](v6, "isSuggested"))
    {
      v8 = -[PRPosterColor copyAsSuggestedColor](v7, "copyAsSuggestedColor");

      v7 = (PRPosterColor *)v8;
    }
    suggestedColor = self->_suggestedColor;
    self->_suggestedColor = v7;

    self->_showsSuggestedColorItem = v7 != 0;
    v5 = v10;
  }

}

- (void)setSuggestedColors:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *suggestedColors;
  _QWORD v9[7];
  _QWORD v10[3];
  char v11;

  v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PREditorColorPickerConfiguration_setSuggestedColors___block_invoke;
  v9[3] = &unk_1E2183A10;
  v9[5] = v10;
  v9[6] = a2;
  v9[4] = self;
  objc_msgSend(v5, "bs_compactMap:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSArray *)objc_msgSend(v6, "copy");
  suggestedColors = self->_suggestedColors;
  self->_suggestedColors = v7;

  -[PREditorColorPickerConfiguration didUpdateColors](self, "didUpdateColors");
  _Block_object_dispose(v10, 8);

}

PRPosterColor *__55__PREditorColorPickerConfiguration_setSuggestedColors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PRPosterColor *v4;
  PRPosterColor *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
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
    v4 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v3);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (void)setColorPalette:(id)a3
{
  PREditorColorPalette *v5;
  PREditorColorPalette *v6;

  v5 = (PREditorColorPalette *)a3;
  if (self->_colorPalette != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_colorPalette, a3);
    -[PREditorColorPickerConfiguration didUpdateColors](self, "didUpdateColors");
    v5 = v6;
  }

}

- (void)didUpdateColors
{
  int isKindOfClass;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_selectedColor)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 1;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_suggestedColors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        objc_opt_class();
        v7 |= objc_opt_isKindOfClass();
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v10 = ((isKindOfClass | v7) & 1) != 0
     || -[PREditorColorPalette includesObjectsOfTypePRPosterColor](self->_colorPalette, "includesObjectsOfTypePRPosterColor", v11);
  self->_includesObjectsOfTypePRPickerColor = v10;
}

- (BOOL)isEqual:(id)a3
{
  PREditorColorPickerConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PREditorColorPickerConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;

  v4 = (PREditorColorPickerConfiguration *)a3;
  if (self == v4)
  {
    v31 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PREditorColorPickerConfiguration identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerConfiguration identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualStrings();

      if (!v10)
        goto LABEL_15;
      -[PREditorColorPickerConfiguration prompt](self, "prompt");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerConfiguration prompt](v7, "prompt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = BSEqualStrings();

      if (!v13)
        goto LABEL_15;
      -[PREditorColorPickerConfiguration colorPalette](self, "colorPalette");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerConfiguration colorPalette](v7, "colorPalette");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = BSEqualObjects();

      if (!v16)
        goto LABEL_15;
      -[PREditorColorPickerConfiguration selectedColor](self, "selectedColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerConfiguration selectedColor](v7, "selectedColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = BSEqualObjects();

      if (!v19)
        goto LABEL_15;
      -[PREditorColorPickerConfiguration suggestedColors](self, "suggestedColors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerConfiguration suggestedColors](v7, "suggestedColors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = BSEqualObjects();

      if (!v22)
        goto LABEL_15;
      v23 = -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider");
      if (v23 != -[PREditorColorPickerConfiguration showsSlider](v7, "showsSlider"))
        goto LABEL_15;
      v24 = -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode");
      if (v24 != -[PREditorColorPickerConfiguration colorWellDisplayMode](v7, "colorWellDisplayMode"))
        goto LABEL_15;
      v25 = -[PREditorColorPickerConfiguration context](self, "context");
      if (v25 != -[PREditorColorPickerConfiguration context](v7, "context"))
        goto LABEL_15;
      -[PREditorColorPickerConfiguration colorPickerSourceView](self, "colorPickerSourceView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorColorPickerConfiguration colorPickerSourceView](v7, "colorPickerSourceView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = BSEqualObjects();

      if (v28)
      {
        -[PREditorColorPickerConfiguration colorPickerSourceItem](self, "colorPickerSourceItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorColorPickerConfiguration colorPickerSourceItem](v7, "colorPickerSourceItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = BSEqualObjects();

      }
      else
      {
LABEL_15:
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }
  }

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v19;

  -[PREditorColorPickerConfiguration identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v19, "hash");
  -[PREditorColorPickerConfiguration prompt](self, "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[PREditorColorPickerConfiguration colorPalette](self, "colorPalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[PREditorColorPickerConfiguration selectedColor](self, "selectedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[PREditorColorPickerConfiguration suggestedColors](self, "suggestedColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration context](self, "context"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
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
  PREditorColorPickerConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __47__PREditorColorPickerConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __47__PREditorColorPickerConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PREditorColorPickerConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorColorPickerConfiguration prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorColorPickerConfiguration selectedColor](self, "selectedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorColorPickerConfiguration suggestedColors](self, "suggestedColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorColorPickerConfiguration colorPalette](self, "colorPalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode");
  LOBYTE(v13) = -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider");
  v11 = (void *)objc_msgSend(v4, "initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:", v5, v6, v7, v8, v9, v10, v13, -[PREditorColorPickerConfiguration context](self, "context"));

  return v11;
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PREditorColorPickerConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PREditorColorPickerConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("prompt"));

  -[PREditorColorPickerConfiguration selectedColor](self, "selectedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("selectedColor"));

  -[PREditorColorPickerConfiguration suggestedColors](self, "suggestedColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("suggestedColors"));
  -[PREditorColorPickerConfiguration colorPalette](self, "colorPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("palette"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("colorWellDisplayMode"));

  objc_msgSend(v11, "encodeBool:forKey:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"), CFSTR("showsSlider"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("context"));

}

- (PREditorColorPickerConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PRPosterColor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  PREditorColorPickerConfiguration *v31;
  uint64_t v33;
  void *v35;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("identifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("prompt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, CFSTR("selectedColor"));
  v8 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v9);
    else
      v8 = 0;

  }
  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("suggestedColors"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObjects:", v16, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v18, CFSTR("suggestedColors"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "bs_map:", &__block_literal_global_0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  objc_opt_self();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v20, CFSTR("palette"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v22, CFSTR("colorWellDisplayMode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_msgSend(v23, "unsignedIntegerValue");
    if (v24 >= 2)
      v25 = 2;
    else
      v25 = v24;
  }
  else
  {
    v25 = 2;
  }
  v26 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("showsSlider"));
  objc_opt_self();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v27, CFSTR("context"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_msgSend(v28, "unsignedIntegerValue");
    if (v29 >= 3)
      v30 = 0;
    else
      v30 = v29;
  }
  else
  {
    v30 = 0;
  }
  LOBYTE(v33) = v26;
  v31 = -[PREditorColorPickerConfiguration initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:](self, "initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:", v35, v6, v8, v14, v21, v25, v33, v30);

  return v31;
}

PRPosterColor *__50__PREditorColorPickerConfiguration_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRPosterColor *v3;

  v2 = a2;
  v3 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v2);

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PREditorColorPickerConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PREditorColorPickerConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("prompt"));

  -[PREditorColorPickerConfiguration selectedColor](self, "selectedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("selectedColor"));

  -[PREditorColorPickerConfiguration suggestedColors](self, "suggestedColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("suggestedColors"));
  -[PREditorColorPickerConfiguration colorPalette](self, "colorPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("palette"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("colorWellDisplayMode"));

  objc_msgSend(v11, "encodeBool:forKey:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"), CFSTR("showsSlider"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("context"));

}

- (PREditorColorPickerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PRPosterColor *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  PREditorColorPickerConfiguration *v26;
  uint64_t v28;
  void *v30;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("identifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("prompt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, CFSTR("selectedColor"));
  v8 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v9);
    else
      v8 = 0;

  }
  v10 = objc_opt_class();
  objc_msgSend(v3, "decodeCollectionOfClass:containingClass:forKey:", v10, objc_opt_class(), CFSTR("suggestedColors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = objc_opt_class();
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeCollectionOfClass:containingClass:forKey:", v12, v13, CFSTR("suggestedColors"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "bs_map:", &__block_literal_global_38);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v15, CFSTR("palette"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v17, CFSTR("colorWellDisplayMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
    if (v19 >= 2)
      v20 = 2;
    else
      v20 = v19;
  }
  else
  {
    v20 = 2;
  }
  v21 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("showsSlider"));
  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v22, CFSTR("context"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_msgSend(v23, "unsignedIntegerValue");
    if (v24 >= 3)
      v25 = 0;
    else
      v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  LOBYTE(v28) = v21;
  v26 = -[PREditorColorPickerConfiguration initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:](self, "initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:", v30, v6, v8, v11, v16, v20, v28, v25);

  return v26;
}

PRPosterColor *__55__PREditorColorPickerConfiguration_initWithBSXPCCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRPosterColor *v3;

  v2 = a2;
  v3 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v2);

  return v3;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  __CFString *v13;
  id v14;
  unint64_t v15;
  __CFString *v16;
  id v17;

  v17 = a3;
  -[PREditorColorPickerConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:withName:", v4, CFSTR("identifier"));

  -[PREditorColorPickerConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:withName:skipIfEmpty:", v5, CFSTR("prompt"), 1);

  -[PREditorColorPickerConfiguration selectedColor](self, "selectedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v17, "appendObject:withName:skipIfNil:", v6, CFSTR("selectedColor"), 1);

  -[PREditorColorPickerConfiguration suggestedColors](self, "suggestedColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v17, "appendObject:withName:skipIfNil:", v8, CFSTR("suggestedColors"), 1);

  -[PREditorColorPickerConfiguration colorPalette](self, "colorPalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v17, "appendObject:withName:", v10, CFSTR("colorPalette"));

  v12 = -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode");
  if (v12 > 2)
    v13 = 0;
  else
    v13 = off_1E2183A70[v12];
  objc_msgSend(v17, "appendString:withName:", v13, CFSTR("colorWellDisplayMode"));
  v14 = (id)objc_msgSend(v17, "appendBool:withName:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"), CFSTR("showsSlider"));
  v15 = -[PREditorColorPickerConfiguration context](self, "context");
  if (v15 > 2)
    v16 = 0;
  else
    v16 = off_1E2183A88[v15];
  objc_msgSend(v17, "appendString:withName:", v16, CFSTR("context"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PREditorColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (BOOL)showsSuggestedColorItem
{
  return self->_showsSuggestedColorItem;
}

- (void)setShowsSuggestedColorItem:(BOOL)a3
{
  self->_showsSuggestedColorItem = a3;
}

- (PRPosterColor)suggestedColor
{
  return self->_suggestedColor;
}

- (NSArray)suggestedColors
{
  return self->_suggestedColors;
}

- (id)selectedColor
{
  return self->_selectedColor;
}

- (BOOL)showsSlider
{
  return self->_showsSlider;
}

- (void)setShowsSlider:(BOOL)a3
{
  self->_showsSlider = a3;
}

- (unint64_t)colorWellDisplayMode
{
  return self->_colorWellDisplayMode;
}

- (void)setColorWellDisplayMode:(unint64_t)a3
{
  self->_colorWellDisplayMode = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIView)colorPickerSourceView
{
  return self->_colorPickerSourceView;
}

- (UIPopoverPresentationControllerSourceItem)colorPickerSourceItem
{
  return self->_colorPickerSourceItem;
}

- (void)setColorPickerSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerSourceItem, a3);
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)includesObjectsOfTypePRPickerColor
{
  return self->_includesObjectsOfTypePRPickerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerSourceItem, 0);
  objc_storeStrong((id *)&self->_colorPickerSourceView, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong(&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_suggestedColors, 0);
  objc_storeStrong((id *)&self->_suggestedColor, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(const char *)a1 prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setSelectedColor:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
