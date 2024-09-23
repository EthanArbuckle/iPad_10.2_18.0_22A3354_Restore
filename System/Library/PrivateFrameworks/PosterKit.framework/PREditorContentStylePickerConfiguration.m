@implementation PREditorContentStylePickerConfiguration

- (PREditorContentStylePickerConfiguration)init
{
  return -[PREditorContentStylePickerConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", 0, 0, 0, 0, 2);
}

- (PREditorContentStylePickerConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedStyle:(id)a5 stylePalette:(id)a6 colorWellDisplayMode:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PREditorContentStylePickerConfiguration *v16;
  NSString *v17;
  NSString *identifier;
  NSString *v19;
  void *prompt;
  uint64_t v21;
  NSString *v22;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PREditorContentStylePickerConfiguration;
  v16 = -[PREditorContentStylePickerConfiguration init](&v24, sel_init);
  if (v16)
  {
    if (v12)
      v17 = (NSString *)v12;
    else
      v17 = (NSString *)objc_msgSend(CFSTR("default"), "copy");
    identifier = v16->_identifier;
    v16->_identifier = v17;

    if (v13)
    {
      v19 = (NSString *)v13;
      prompt = v16->_prompt;
      v16->_prompt = v19;
    }
    else
    {
      PRBundle();
      prompt = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(prompt, "localizedStringForKey:value:table:", CFSTR("EDIT_COLOR_PICKER_DEFAULT_PROMPT"), &stru_1E2186E08, CFSTR("PosterKit"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v16->_prompt;
      v16->_prompt = (NSString *)v21;

    }
    objc_storeStrong((id *)&v16->_selectedStyle, a5);
    objc_storeStrong((id *)&v16->_stylePalette, a6);
    v16->_colorWellDisplayMode = a7;
  }

  return v16;
}

- (void)setSuggestedStyle:(id)a3
{
  PRPosterContentStyle *v5;
  PRPosterContentStyle *v6;

  v5 = (PRPosterContentStyle *)a3;
  if (self->_suggestedStyle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_suggestedStyle, a3);
    v5 = v6;
    self->_showsSuggestedContentStyleItem = v6 != 0;
  }

}

- (BOOL)isEqual:(id)a3
{
  PREditorContentStylePickerConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PREditorContentStylePickerConfiguration *v7;
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
  unint64_t v23;
  BOOL v24;

  v4 = (PREditorContentStylePickerConfiguration *)a3;
  if (self == v4)
  {
    v24 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PREditorContentStylePickerConfiguration identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorContentStylePickerConfiguration identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualStrings();

      if (!v10)
        goto LABEL_11;
      -[PREditorContentStylePickerConfiguration prompt](self, "prompt");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorContentStylePickerConfiguration prompt](v7, "prompt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = BSEqualStrings();

      if (!v13)
        goto LABEL_11;
      -[PREditorContentStylePickerConfiguration stylePalette](self, "stylePalette");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorContentStylePickerConfiguration stylePalette](v7, "stylePalette");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = BSEqualObjects();

      if (!v16)
        goto LABEL_11;
      -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorContentStylePickerConfiguration selectedStyle](v7, "selectedStyle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = BSEqualObjects();

      if (!v19)
        goto LABEL_11;
      -[PREditorContentStylePickerConfiguration suggestedStyle](self, "suggestedStyle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorContentStylePickerConfiguration suggestedStyle](v7, "suggestedStyle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = BSEqualObjects();

      if (v22)
      {
        v23 = -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode");
        v24 = v23 == -[PREditorContentStylePickerConfiguration colorWellDisplayMode](v7, "colorWellDisplayMode");
      }
      else
      {
LABEL_11:
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorContentStylePickerConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[PREditorContentStylePickerConfiguration prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[PREditorContentStylePickerConfiguration stylePalette](self, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v13 = objc_msgSend(v3, "hash");

  return v13;
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
  PREditorContentStylePickerConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __54__PREditorContentStylePickerConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __54__PREditorContentStylePickerConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PREditorContentStylePickerConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorContentStylePickerConfiguration prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorContentStylePickerConfiguration stylePalette](self, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v5, v6, v7, v8, -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));

  return v9;
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PREditorContentStylePickerConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PREditorContentStylePickerConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("prompt"));

  -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 != 999)
  {
    -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("selectedStyle"));

  }
  -[PREditorContentStylePickerConfiguration stylePalette](self, "stylePalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("palette"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("colorWellDisplayMode"));

}

- (PREditorContentStylePickerConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  PREditorContentStylePickerConfiguration *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("prompt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10, v21, v22, v23, v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("selectedStyle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, CFSTR("palette"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("colorWellDisplayMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_msgSend(v16, "unsignedIntegerValue");
    if (v17 >= 2)
      v18 = 2;
    else
      v18 = v17;
  }
  else
  {
    v18 = 2;
  }
  v19 = -[PREditorContentStylePickerConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v6, v8, v12, v14, v18);

  return v19;
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PREditorContentStylePickerConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PREditorContentStylePickerConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("prompt"));

  -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 != 999)
  {
    -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("selectedStyle"));

  }
  -[PREditorContentStylePickerConfiguration stylePalette](self, "stylePalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("palette"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("colorWellDisplayMode"));

}

- (PREditorContentStylePickerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  PREditorContentStylePickerConfiguration *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[7];

  v29[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("prompt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  v29[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), CFSTR("selectedStyle"), (_QWORD)v24);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("palette"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("colorWellDisplayMode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_msgSend(v19, "unsignedIntegerValue");
    if (v20 >= 2)
      v21 = 2;
    else
      v21 = v20;
  }
  else
  {
    v21 = 2;
  }
  v22 = -[PREditorContentStylePickerConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v6, v8, v15, v17, v21, (_QWORD)v24);

  return v22;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  __CFString *v11;
  id v12;

  v12 = a3;
  -[PREditorContentStylePickerConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:", v4, CFSTR("identifier"));

  -[PREditorContentStylePickerConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:skipIfEmpty:", v5, CFSTR("prompt"), 1);

  -[PREditorContentStylePickerConfiguration selectedStyle](self, "selectedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v12, "appendObject:withName:skipIfNil:", v6, CFSTR("selectedStyle"), 1);

  -[PREditorContentStylePickerConfiguration stylePalette](self, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v12, "appendObject:withName:", v8, CFSTR("stylePalette"));

  v10 = -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode");
  if (v10 > 2)
    v11 = 0;
  else
    v11 = off_1E2184288[v10];
  objc_msgSend(v12, "appendString:withName:", v11, CFSTR("colorWellDisplayMode"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PREditorContentStylePalette)stylePalette
{
  return self->_stylePalette;
}

- (void)setStylePalette:(id)a3
{
  objc_storeStrong((id *)&self->_stylePalette, a3);
}

- (BOOL)showsSuggestedContentStyleItem
{
  return self->_showsSuggestedContentStyleItem;
}

- (void)setShowsSuggestedContentStyleItem:(BOOL)a3
{
  self->_showsSuggestedContentStyleItem = a3;
}

- (PRPosterContentStyle)suggestedStyle
{
  return self->_suggestedStyle;
}

- (PRPosterContentStyle)selectedStyle
{
  return self->_selectedStyle;
}

- (void)setSelectedStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIPopoverPresentationControllerSourceItem)contentStylePickerSourceItem
{
  return self->_contentStylePickerSourceItem;
}

- (void)setContentStylePickerSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentStylePickerSourceItem, a3);
}

- (BOOL)isForTitleStylePicker
{
  return self->_forTitleStylePicker;
}

- (void)setForTitleStylePicker:(BOOL)a3
{
  self->_forTitleStylePicker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentStylePickerSourceItem, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_selectedStyle, 0);
  objc_storeStrong((id *)&self->_suggestedStyle, 0);
  objc_storeStrong((id *)&self->_stylePalette, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
