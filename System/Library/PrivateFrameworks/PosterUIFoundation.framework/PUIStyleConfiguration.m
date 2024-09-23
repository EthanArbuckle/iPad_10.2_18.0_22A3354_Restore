@implementation PUIStyleConfiguration

- (PUIStyleConfiguration)init
{
  return -[PUIStyleConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", 0, 0, 0, 0, 2);
}

- (PUIStyleConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedStyle:(id)a5 stylePalette:(id)a6 colorWellDisplayMode:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PUIStyleConfiguration *v16;
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
  v24.super_class = (Class)PUIStyleConfiguration;
  v16 = -[PUIStyleConfiguration init](&v24, sel_init);
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
      PUIBundle();
      prompt = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(prompt, "localizedStringForKey:value:table:", CFSTR("EDIT_COLOR_PICKER_DEFAULT_PROMPT"), &stru_25154D128, 0);
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
  PUIStyle *v5;
  PUIStyle *v6;

  v5 = (PUIStyle *)a3;
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
  PUIStyleConfiguration *v4;
  PUIStyleConfiguration *v5;
  void *v6;
  char isKindOfClass;
  BOOL v8;

  v4 = (PUIStyleConfiguration *)a3;
  v5 = v4;
  if (self == v4)
    v8 = 1;
  else
    v8 = v4
      && (objc_opt_self(),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0)
      && -[PUIStyleConfiguration isEqualToStyleColorConfiguration:](self, "isEqualToStyleColorConfiguration:", v5);

  return v8;
}

- (BOOL)isEqualToStyleColorConfiguration:(id)a3
{
  PUIStyleConfiguration *v4;
  PUIStyleConfiguration *v5;
  PUIStyleConfiguration *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  unint64_t v22;
  BOOL v23;

  v4 = (PUIStyleConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    v23 = 1;
  }
  else if (v4)
  {
    v6 = v4;
    -[PUIStyleConfiguration identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleConfiguration identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualStrings();

    if (!v9)
      goto LABEL_9;
    -[PUIStyleConfiguration prompt](self, "prompt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleConfiguration prompt](v6, "prompt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BSEqualStrings();

    if (!v12)
      goto LABEL_9;
    -[PUIStyleConfiguration stylePalette](self, "stylePalette");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleConfiguration stylePalette](v6, "stylePalette");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualObjects();

    if (!v15)
      goto LABEL_9;
    -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleConfiguration selectedStyle](v6, "selectedStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = BSEqualObjects();

    if (!v18)
      goto LABEL_9;
    -[PUIStyleConfiguration suggestedStyle](self, "suggestedStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleConfiguration suggestedStyle](v6, "suggestedStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = BSEqualObjects();

    if (v21)
    {
      v22 = -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode");
      v23 = v22 == -[PUIStyleConfiguration colorWellDisplayMode](v6, "colorWellDisplayMode");
    }
    else
    {
LABEL_9:
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
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

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[PUIStyleConfiguration prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[PUIStyleConfiguration stylePalette](self, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
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
  PUIStyleConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __36__PUIStyleConfiguration_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __36__PUIStyleConfiguration_description__block_invoke(uint64_t a1)
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
  -[PUIStyleConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleConfiguration prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleConfiguration stylePalette](self, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v5, v6, v7, v8, -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PUIMutableStyleConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PUIMutableStyleConfiguration *v9;

  v4 = [PUIMutableStyleConfiguration alloc];
  -[PUIStyleConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleConfiguration prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleConfiguration stylePalette](self, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUIStyleConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](v4, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v5, v6, v7, v8, -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));

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
  -[PUIStyleConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PUIStyleConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("prompt"));

  -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 != 999)
  {
    -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("selectedStyle"));

  }
  -[PUIStyleConfiguration stylePalette](self, "stylePalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("palette"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("colorWellDisplayMode"));

}

- (PUIStyleConfiguration)initWithCoder:(id)a3
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
  PUIStyleConfiguration *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("prompt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 5);
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
  v19 = -[PUIStyleConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v6, v8, v12, v14, v18);

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
  -[PUIStyleConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PUIStyleConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("prompt"));

  -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 != 999)
  {
    -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("selectedStyle"));

  }
  -[PUIStyleConfiguration stylePalette](self, "stylePalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("palette"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("colorWellDisplayMode"));

}

- (PUIStyleConfiguration)initWithBSXPCCoder:(id)a3
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
  PUIStyleConfiguration *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[7];

  v29[5] = *MEMORY[0x24BDAC8D0];
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
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 5);
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
  v22 = -[PUIStyleConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v6, v8, v15, v17, v21, (_QWORD)v24);

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
  const __CFString *v11;
  id v12;

  v12 = a3;
  -[PUIStyleConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:", v4, CFSTR("identifier"));

  -[PUIStyleConfiguration prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:skipIfEmpty:", v5, CFSTR("prompt"), 1);

  -[PUIStyleConfiguration selectedStyle](self, "selectedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v12, "appendObject:withName:skipIfNil:", v6, CFSTR("selectedStyle"), 1);

  -[PUIStyleConfiguration stylePalette](self, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v12, "appendObject:withName:", v8, CFSTR("stylePalette"));

  v10 = -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode");
  if (v10 > 2)
    v11 = CFSTR("(null color well mode)");
  else
    v11 = off_25154CEA0[v10];
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

- (PUIStylePalette)stylePalette
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

- (PUIStyle)suggestedStyle
{
  return self->_suggestedStyle;
}

- (PUIStyle)selectedStyle
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
