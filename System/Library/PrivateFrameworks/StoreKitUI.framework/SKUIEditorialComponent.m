@implementation SKUIEditorialComponent

- (SKUIEditorialComponent)initWithBrickRoomText:(id)a3
{
  id v4;
  SKUIEditorialComponent *v5;
  uint64_t v6;
  NSString *bodyText;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIEditorialComponent;
  v5 = -[SKUIEditorialComponent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v6;

    v5->_maximumBodyLines = 0;
    v5->_style.bodyFontSize = 14.0;
  }

  return v5;
}

- (SKUIEditorialComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SKUIEditorialComponent *v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *bodyText;
  void *v12;
  uint64_t v13;
  NSString *titleText;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  SKUILink *v25;
  uint64_t v26;
  NSArray *links;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  uint64_t v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SKUIEditorialComponent;
  v5 = -[SKUIPageComponent initWithCustomPageContext:](&v38, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIEditorialStyleForDictionary(v6, (uint64_t)v36);
    v7 = v36[1];
    *(_OWORD *)&v5->_style.alignment = v36[0];
    *(_OWORD *)&v5->_style.bodyFontSize = v7;
    *(_QWORD *)&v5->_style.titleFontSize = v37;
    if (v5->_style.alignment == 3 && !objc_msgSend(v4, "layoutStyle"))
      v5->_style.alignment = 1;
    objc_msgSend(v6, "objectForKey:", CFSTR("maximumBodyLines"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_maximumBodyLines = objc_msgSend(v8, "integerValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("body"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      bodyText = v5->_bodyText;
      v5->_bodyText = (NSString *)v10;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      titleText = v5->_titleText;
      v5->_titleText = (NSString *)v13;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("useLockupTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_usesLockupTitle = objc_msgSend(v15, "BOOLValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("links"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v6;
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = v4;
      v18 = (void *)objc_msgSend(v4, "copy");
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v29 = v16;
      v19 = v16;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v18, "setComponentDictionary:", v24);
              v25 = -[SKUILink initWithComponentContext:]([SKUILink alloc], "initWithComponentContext:", v18);
              if (v25)
                objc_msgSend(v17, "addObject:", v25);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        }
        while (v21);
      }

      v26 = objc_msgSend(v17, "copy");
      links = v5->_links;
      v5->_links = (NSArray *)v26;

      v6 = v30;
      v4 = v31;
      v16 = v29;
    }

  }
  return v5;
}

- (SKUIEditorialComponent)initWithUberText:(id)a3
{
  id v4;
  SKUIEditorialComponent *v5;
  uint64_t v6;
  NSString *bodyText;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIEditorialComponent;
  v5 = -[SKUIEditorialComponent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v6;

    v5->_maximumBodyLines = 3;
    v5->_style.bodyFontSize = 14.0;
  }

  return v5;
}

- (SKUIEditorialComponent)initWithViewElement:(id)a3
{
  id v4;
  SKUIEditorialComponent *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIEditorialComponent;
  v5 = -[SKUIPageComponent initWithViewElement:](&v9, sel_initWithViewElement_, v4);
  if (v5)
  {
    objc_msgSend(v4, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "maxTextLines");
    if (!v6 || v7 == -1)
      v7 = objc_msgSend(v4, "numberOfLines");
    v5->_maximumBodyLines = v7;

  }
  return v5;
}

- (NSAttributedString)bodyAttributedText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;

  -[SKUIPageComponent viewElement](self, "viewElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementFontWithStyle(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      SKUIFontPreferredFontForTextStyle(5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "ikColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = SKUIViewElementAlignmentForStyle(v4);
    if (v8)
      v9 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v8);
    else
      v9 = 0;
    objc_msgSend(v3, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v5, v7, v9, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v14 = *MEMORY[0x1E0DC1178];
    v15 = objc_msgSend(v13, "length");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__SKUIEditorialComponent_bodyAttributedText__block_invoke;
    v17[3] = &unk_1E73A3670;
    v10 = v13;
    v18 = v10;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v15, 0, v17);

  }
  else
  {
    v10 = 0;
  }

  return (NSAttributedString *)v10;
}

void __44__SKUIEditorialComponent_bodyAttributedText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v7, "setLineBreakMode:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v7, a3, a4);

}

- (void)_setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;

  if (self->_titleText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    titleText = self->_titleText;
    self->_titleText = v4;

  }
}

- (int64_t)componentType
{
  return 5;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (SKUIEditorialStyle)editorialStyle
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].titleFontWeight;
  *(_OWORD *)&retstr->alignment = *(_OWORD *)&self[1].bodyFontWeight;
  *(_OWORD *)&retstr->bodyFontSize = v3;
  *(_QWORD *)&retstr->titleFontSize = self[2].alignment;
  return self;
}

- (NSArray)links
{
  return self->_links;
}

- (int64_t)maximumBodyLines
{
  return self->_maximumBodyLines;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (BOOL)_usesLockupTitle
{
  return self->_usesLockupTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
}

@end
