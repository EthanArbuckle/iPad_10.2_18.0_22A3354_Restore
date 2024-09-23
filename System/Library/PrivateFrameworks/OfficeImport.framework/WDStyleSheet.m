@implementation WDStyleSheet

- (WDStyleSheet)initWithDocument:(id)a3
{
  id v4;
  WDStyleSheet *v5;
  WDStyleSheet *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *mStyleDictionary;
  NSMutableArray *v9;
  NSMutableArray *mStylesInOrder;
  NSMutableDictionary *v11;
  NSMutableDictionary *mIdDictionaryForName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WDStyleSheet;
  v5 = -[WDStyleSheet init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mStyleDictionary = v6->mStyleDictionary;
    v6->mStyleDictionary = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mStylesInOrder = v6->mStylesInOrder;
    v6->mStylesInOrder = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mIdDictionaryForName = v6->mIdDictionaryForName;
    v6->mIdDictionaryForName = v11;

    -[WDStyleSheet initializeDefaultProperties](v6, "initializeDefaultProperties");
  }

  return v6;
}

- (void)initializeDefaultProperties
{
  WDDocument **p_mDocument;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  WDCharacterProperties *v12;
  void *v13;
  WDCharacterProperties *v14;
  WDCharacterProperties *mDefaultCharacterProperties;
  WDCharacterProperties *v16;
  void *v17;
  id v18;
  WDCharacterProperties *v19;
  void *v20;
  WDParagraphProperties *v21;
  void *v22;
  WDParagraphProperties *v23;
  WDParagraphProperties *mDefaultParagraphProperties;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  p_mDocument = &self->mDocument;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  objc_msgSend(WeakRetained, "fontTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithName:create:", CFSTR("Times New Roman"), 1);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_mDocument);
  objc_msgSend(v6, "fontTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontWithName:create:", CFSTR("Times New Roman"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained((id *)p_mDocument);
  objc_msgSend(v9, "fontTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontWithName:create:", CFSTR("Arial Unicode MS"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [WDCharacterProperties alloc];
  -[WDStyleSheet document](self, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WDCharacterProperties initWithDocument:](v12, "initWithDocument:", v13);
  mDefaultCharacterProperties = self->mDefaultCharacterProperties;
  self->mDefaultCharacterProperties = v14;

  -[WDCharacterProperties setResolveMode:](self->mDefaultCharacterProperties, "setResolveMode:", 0);
  -[WDCharacterProperties setBold:](self->mDefaultCharacterProperties, "setBold:", 0);
  -[WDCharacterProperties setBoldForBiText:](self->mDefaultCharacterProperties, "setBoldForBiText:", 0);
  -[WDCharacterProperties setItalic:](self->mDefaultCharacterProperties, "setItalic:", 0);
  -[WDCharacterProperties setItalicForBiText:](self->mDefaultCharacterProperties, "setItalicForBiText:", 0);
  -[WDCharacterProperties setOutline:](self->mDefaultCharacterProperties, "setOutline:", 0);
  -[WDCharacterProperties setShadow:](self->mDefaultCharacterProperties, "setShadow:", 0);
  -[WDCharacterProperties setEmbossed:](self->mDefaultCharacterProperties, "setEmbossed:", 0);
  -[WDCharacterProperties setImprint:](self->mDefaultCharacterProperties, "setImprint:", 0);
  -[WDCharacterProperties setUnderline:](self->mDefaultCharacterProperties, "setUnderline:", 0);
  v16 = self->mDefaultCharacterProperties;
  +[OITSUColor clearColor](OITSUColor, "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDCharacterProperties setUnderlineColor:](v16, "setUnderlineColor:", v17);

  -[WDCharacterProperties setStrikeThrough:](self->mDefaultCharacterProperties, "setStrikeThrough:", 0);
  -[WDCharacterProperties setDoubleStrikeThrough:](self->mDefaultCharacterProperties, "setDoubleStrikeThrough:", 0);
  v18 = -[WDCharacterProperties mutableBorder](self->mDefaultCharacterProperties, "mutableBorder");
  v19 = self->mDefaultCharacterProperties;
  +[OITSUColor clearColor](OITSUColor, "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDCharacterProperties setColor:](v19, "setColor:", v20);

  -[WDCharacterProperties setHighlightColor:](self->mDefaultCharacterProperties, "setHighlightColor:", 0);
  -[WDCharacterProperties setSmallCaps:](self->mDefaultCharacterProperties, "setSmallCaps:", 0);
  -[WDCharacterProperties setCaps:](self->mDefaultCharacterProperties, "setCaps:", 0);
  -[WDCharacterProperties setHidden:](self->mDefaultCharacterProperties, "setHidden:", 0);
  -[WDCharacterProperties setSpacing:](self->mDefaultCharacterProperties, "setSpacing:", 0);
  -[WDCharacterProperties setTextScale:](self->mDefaultCharacterProperties, "setTextScale:", 0);
  -[WDCharacterProperties setPosition:](self->mDefaultCharacterProperties, "setPosition:", 0);
  -[WDCharacterProperties setVerticalAlign:](self->mDefaultCharacterProperties, "setVerticalAlign:", 0);
  -[WDCharacterProperties setFontSize:](self->mDefaultCharacterProperties, "setFontSize:", 20);
  -[WDCharacterProperties setFontSizeForBiText:](self->mDefaultCharacterProperties, "setFontSizeForBiText:", 20);
  -[WDCharacterProperties setKerning:](self->mDefaultCharacterProperties, "setKerning:", 0);
  -[WDCharacterProperties setTextScale:](self->mDefaultCharacterProperties, "setTextScale:", 100);
  -[WDCharacterProperties setRightToLeft:](self->mDefaultCharacterProperties, "setRightToLeft:", 0);
  -[WDCharacterProperties setFont:](self->mDefaultCharacterProperties, "setFont:", v32);
  -[WDCharacterProperties setFarEastFont:](self->mDefaultCharacterProperties, "setFarEastFont:", v11);
  -[WDCharacterProperties setExtendedFont:](self->mDefaultCharacterProperties, "setExtendedFont:", v8);
  -[WDCharacterProperties setSymbolFont:](self->mDefaultCharacterProperties, "setSymbolFont:", v32);
  -[WDCharacterProperties setLanguageForDefaultText:](self->mDefaultCharacterProperties, "setLanguageForDefaultText:", 0xFFFFLL);
  -[WDCharacterProperties setLanguageForFarEast:](self->mDefaultCharacterProperties, "setLanguageForFarEast:", 0xFFFFLL);
  -[WDCharacterProperties setLanguageForBiText:](self->mDefaultCharacterProperties, "setLanguageForBiText:", 0xFFFFLL);
  -[WDCharacterProperties setDeleted:](self->mDefaultCharacterProperties, "setDeleted:", 0);
  -[WDCharacterProperties setEdited:](self->mDefaultCharacterProperties, "setEdited:", 0);
  -[WDCharacterProperties setFormattingChanged:](self->mDefaultCharacterProperties, "setFormattingChanged:", 0);
  -[WDCharacterProperties setResolveMode:](self->mDefaultCharacterProperties, "setResolveMode:", 2);
  v21 = [WDParagraphProperties alloc];
  -[WDStyleSheet document](self, "document");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[WDParagraphProperties initWithDocument:](v21, "initWithDocument:", v22);
  mDefaultParagraphProperties = self->mDefaultParagraphProperties;
  self->mDefaultParagraphProperties = v23;

  -[WDParagraphProperties setResolveMode:](self->mDefaultParagraphProperties, "setResolveMode:", 0);
  -[WDParagraphProperties setPageBreakBefore:](self->mDefaultParagraphProperties, "setPageBreakBefore:", 0);
  -[WDParagraphProperties setListLevel:](self->mDefaultParagraphProperties, "setListLevel:", 0);
  -[WDParagraphProperties setListIndex:](self->mDefaultParagraphProperties, "setListIndex:", 0);
  -[WDParagraphProperties setDropCap:](self->mDefaultParagraphProperties, "setDropCap:", 0);
  -[WDParagraphProperties setWidth:](self->mDefaultParagraphProperties, "setWidth:", 0);
  -[WDParagraphProperties setHeight:](self->mDefaultParagraphProperties, "setHeight:", 0);
  -[WDParagraphProperties setHeightRule:](self->mDefaultParagraphProperties, "setHeightRule:", 0);
  -[WDParagraphProperties setVerticalSpace:](self->mDefaultParagraphProperties, "setVerticalSpace:", 0);
  -[WDParagraphProperties setHorizontalSpace:](self->mDefaultParagraphProperties, "setHorizontalSpace:", 0);
  -[WDParagraphProperties setWrap:](self->mDefaultParagraphProperties, "setWrap:", 0);
  -[WDParagraphProperties setVerticalAnchor:](self->mDefaultParagraphProperties, "setVerticalAnchor:", 0);
  -[WDParagraphProperties setHorizontalPosition:](self->mDefaultParagraphProperties, "setHorizontalPosition:", 0);
  -[WDParagraphProperties setVerticalPosition:](self->mDefaultParagraphProperties, "setVerticalPosition:", 0);
  -[WDParagraphProperties setAnchorLock:](self->mDefaultParagraphProperties, "setAnchorLock:", 0);
  v25 = -[WDParagraphProperties mutableTopBorder](self->mDefaultParagraphProperties, "mutableTopBorder");
  v26 = -[WDParagraphProperties mutableLeftBorder](self->mDefaultParagraphProperties, "mutableLeftBorder");
  v27 = -[WDParagraphProperties mutableBottomBorder](self->mDefaultParagraphProperties, "mutableBottomBorder");
  v28 = -[WDParagraphProperties mutableRightBorder](self->mDefaultParagraphProperties, "mutableRightBorder");
  v29 = -[WDParagraphProperties mutableBetweenBorder](self->mDefaultParagraphProperties, "mutableBetweenBorder");
  v30 = -[WDParagraphProperties mutableBarBorder](self->mDefaultParagraphProperties, "mutableBarBorder");
  -[WDParagraphProperties setSpaceBefore:](self->mDefaultParagraphProperties, "setSpaceBefore:", 0);
  -[WDParagraphProperties setSpaceBeforeAuto:](self->mDefaultParagraphProperties, "setSpaceBeforeAuto:", 0);
  -[WDParagraphProperties setSpaceAfter:](self->mDefaultParagraphProperties, "setSpaceAfter:", 0);
  -[WDParagraphProperties setSpaceAfterAuto:](self->mDefaultParagraphProperties, "setSpaceAfterAuto:", 0);
  -[WDParagraphProperties setLineSpacing:](self->mDefaultParagraphProperties, "setLineSpacing:", 240);
  -[WDParagraphProperties setLineSpacingRule:](self->mDefaultParagraphProperties, "setLineSpacingRule:", 0);
  -[WDParagraphProperties setLeftIndent:](self->mDefaultParagraphProperties, "setLeftIndent:", 0);
  -[WDParagraphProperties setRightIndent:](self->mDefaultParagraphProperties, "setRightIndent:", 0);
  -[WDParagraphProperties setFirstLineIndent:](self->mDefaultParagraphProperties, "setFirstLineIndent:", 0);
  -[WDParagraphProperties setJustification:](self->mDefaultParagraphProperties, "setJustification:", 0);
  -[WDParagraphProperties setOutlineLevel:](self->mDefaultParagraphProperties, "setOutlineLevel:", 9);
  -[WDParagraphProperties setSuppressLineNumbers:](self->mDefaultParagraphProperties, "setSuppressLineNumbers:", 0);
  -[WDParagraphProperties setSuppressAutoHyphens:](self->mDefaultParagraphProperties, "setSuppressAutoHyphens:", 0);
  -[WDParagraphProperties setWidowControl:](self->mDefaultParagraphProperties, "setWidowControl:", 1);
  -[WDParagraphProperties setKeepLinesTogether:](self->mDefaultParagraphProperties, "setKeepLinesTogether:", 0);
  -[WDParagraphProperties setKeepNextParagraphTogether:](self->mDefaultParagraphProperties, "setKeepNextParagraphTogether:", 0);
  v31 = -[WDParagraphProperties mutableShading](self->mDefaultParagraphProperties, "mutableShading");
  -[WDParagraphProperties setTabStopAddedCount:](self->mDefaultParagraphProperties, "setTabStopAddedCount:", 0);
  -[WDParagraphProperties setTabStopDeletedPositionCount:](self->mDefaultParagraphProperties, "setTabStopDeletedPositionCount:", 0);

}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (id)styleIdForName:(id)a3
{
  NSMutableDictionary *mIdDictionaryForName;
  void *v4;
  void *v5;

  mIdDictionaryForName = self->mIdDictionaryForName;
  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mIdDictionaryForName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)styleWithId:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mStyleDictionary, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createStyleWithId:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  WDStyle *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[WDStyle initWithStyleSheet:id:type:]([WDStyle alloc], "initWithStyleSheet:id:type:", self, v6, v4);
  -[NSMutableDictionary setObject:forKey:](self->mStyleDictionary, "setObject:forKey:", v7, v6);
  -[NSMutableArray addObject:](self->mStylesInOrder, "addObject:", v7);

  return v7;
}

- (void)setName:(id)a3 forId:(id)a4
{
  NSMutableDictionary *mIdDictionaryForName;
  void *v7;
  id v8;

  v8 = a4;
  mIdDictionaryForName = self->mIdDictionaryForName;
  objc_msgSend(a3, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mIdDictionaryForName, "setObject:forKey:", v8, v7);

}

- (void)setDefaultParagraphStyle:(id)a3
{
  objc_storeStrong((id *)&self->mDefaultParagraphStyle, a3);
}

- (void)setDefaultCharacterStyle:(id)a3
{
  objc_storeStrong((id *)&self->mDefaultCharacterStyle, a3);
}

- (void)setDefaultTableStyle:(id)a3
{
  objc_storeStrong((id *)&self->mDefaultTableStyle, a3);
}

- (void)setDefaultListStyle:(id)a3
{
  objc_storeStrong((id *)&self->mDefaultListStyle, a3);
}

- (id)defaultCharacterProperties
{
  return self->mDefaultCharacterProperties;
}

- (id)defaultParagraphStyle
{
  return self->mDefaultParagraphStyle;
}

- (void)addStyle:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *mIdDictionaryForName;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "id");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->mIdDictionaryForName, "setObject:forKey:", v7, v6);
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        mIdDictionaryForName = self->mIdDictionaryForName;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "lowercaseString", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](mIdDictionaryForName, "setObject:forKey:", v7, v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (id)defaultListStyle
{
  return self->mDefaultListStyle;
}

- (id)defaultParagraphProperties
{
  return self->mDefaultParagraphProperties;
}

- (id)styles
{
  return (id)-[NSMutableArray objectEnumerator](self->mStylesInOrder, "objectEnumerator");
}

- (unint64_t)styleCount
{
  return -[NSMutableDictionary count](self->mStyleDictionary, "count");
}

- (id)styleWithName:(id)a3
{
  void *v4;
  void *v5;

  -[WDStyleSheet styleIdForName:](self, "styleIdForName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStyleSheet styleWithId:](self, "styleWithId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)paragraphStyleWithStartingName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary keyEnumerator](self->mIdDictionaryForName, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v9 = 0;
      goto LABEL_10;
    }
    if (objc_msgSend(v7, "tc_startsWithString:", v5))
      break;
LABEL_7:

  }
  -[WDStyleSheet styleWithName:](self, "styleWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "type") != 1 && objc_msgSend(v9, "type") != 3)
  {

    goto LABEL_7;
  }

LABEL_10:
  return v9;
}

- (id)createStyleWithName:(id)a3 type:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  -[WDStyleSheet styleNameToUniqueId:](self, "styleNameToUniqueId:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStyleSheet createStyleWithId:type:](self, "createStyleWithId:type:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeStyleWithId:(id)a3
{
  id v4;
  NSMutableArray *mStylesInOrder;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  mStylesInOrder = self->mStylesInOrder;
  v8 = v4;
  -[NSMutableDictionary objectForKey:](self->mStyleDictionary, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](mStylesInOrder, "removeObject:", v6);

  -[NSMutableDictionary allKeysForObject:](self->mIdDictionaryForName, "allKeysForObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](self->mIdDictionaryForName, "removeObjectsForKeys:", v7);
  -[NSMutableDictionary removeObjectForKey:](self->mStyleDictionary, "removeObjectForKey:", v8);

}

- (void)createDefaultStyles
{
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  -[WDStyleSheet createStyleWithName:type:](self, "createStyleWithName:type:", CFSTR("Normal"), 1);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNextStyle:", v20);
  objc_msgSend(v20, "setName:", CFSTR("Normal"));
  objc_msgSend(v20, "paragraphProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResolveMode:", 0);

  objc_msgSend(v20, "paragraphProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseStyle:", v20);

  objc_msgSend(v20, "paragraphProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResolveMode:", 2);

  objc_msgSend(v20, "characterProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResolveMode:", 0);
  objc_msgSend(v6, "setFontSize:", 24);
  objc_msgSend(v6, "setLanguageForDefaultText:", 1033);
  objc_msgSend(v6, "setLanguageForFarEast:", 1033);
  objc_msgSend(v6, "setLanguageForBiText:", 1025);
  objc_msgSend(v6, "setFontSizeForBiText:", 24);
  -[WDStyleSheet setDefaultParagraphStyle:](self, "setDefaultParagraphStyle:", v20);
  -[WDStyleSheet styleNameToUniqueId:](self, "styleNameToUniqueId:", CFSTR("Default Paragraph Font"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStyleSheet createStyleWithId:type:](self, "createStyleWithId:type:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setNextStyle:", v8);
  objc_msgSend(v8, "setHidden:", 1);
  objc_msgSend(v8, "setName:", CFSTR("Default Paragraph Font"));
  -[WDStyleSheet setDefaultCharacterStyle:](self, "setDefaultCharacterStyle:", v8);
  -[WDStyleSheet createStyleWithName:type:](self, "createStyleWithName:type:", CFSTR("Hyperlink"), 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setName:", CFSTR("Hyperlink"));
  objc_msgSend(v9, "characterProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUnderline:", 1);

  -[WDStyleSheet createStyleWithName:type:](self, "createStyleWithName:type:", CFSTR("Table Normal"), 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setNextStyle:", v11);
  objc_msgSend(v11, "setHidden:", 1);
  objc_msgSend(v11, "setName:", CFSTR("Table Normal"));
  objc_msgSend(v11, "paragraphProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResolveMode:", 0);

  objc_msgSend(v11, "paragraphProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBaseStyle:", v11);

  objc_msgSend(v11, "paragraphProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setResolveMode:", 2);

  objc_msgSend(v11, "tableProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setResolveMode:", 0);
  objc_msgSend(v15, "setIndentType:", 3);
  objc_msgSend(v15, "setIndent:", 0);
  objc_msgSend(v15, "setResolveMode:", 2);
  -[WDStyleSheet setDefaultTableStyle:](self, "setDefaultTableStyle:", v11);
  -[WDStyleSheet createStyleWithName:type:](self, "createStyleWithName:type:", CFSTR("No List"), 4);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setNextStyle:", v21);
  objc_msgSend(v21, "setHidden:", 1);
  objc_msgSend(v21, "setName:", CFSTR("No List"));
  objc_msgSend(v21, "paragraphProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setResolveMode:", 0);

  objc_msgSend(v21, "paragraphProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStyleSheet defaultParagraphStyle](self, "defaultParagraphStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBaseStyle:", v18);

  objc_msgSend(v21, "paragraphProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setResolveMode:", 2);

  -[WDStyleSheet setDefaultListStyle:](self, "setDefaultListStyle:");
}

- (id)defaultCharacterStyle
{
  return self->mDefaultCharacterStyle;
}

- (id)defaultTableStyle
{
  return self->mDefaultTableStyle;
}

- (id)styleNameToUniqueId:(id)a3
{
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = 0;
  for (i = v4; ; i = (void *)v8)
  {
    -[WDStyleSheet styleIdForName:](self, "styleIdForName:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%d"), v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (v5 + 1);
  }

  return i;
}

- (id)styleIdToName:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("."), 4);
  if (v5)
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  return v3;
}

- (id)allAliasesForStyleId:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->mIdDictionaryForName;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->mIdDictionaryForName, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v6))
        {
          v14 = objc_msgSend(v12, "isEqualToString:", v7);

          if ((v14 & 1) == 0)
            objc_msgSend(v16, "addObject:", v12);
        }
        else
        {

        }
      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v16;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDStyleSheet;
  -[WDStyleSheet description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mIdDictionaryForName, 0);
  objc_storeStrong((id *)&self->mStylesInOrder, 0);
  objc_storeStrong((id *)&self->mDefaultListStyle, 0);
  objc_storeStrong((id *)&self->mDefaultTableStyle, 0);
  objc_storeStrong((id *)&self->mDefaultCharacterStyle, 0);
  objc_storeStrong((id *)&self->mDefaultParagraphStyle, 0);
  objc_storeStrong((id *)&self->mDefaultParagraphProperties, 0);
  objc_storeStrong((id *)&self->mDefaultCharacterProperties, 0);
  objc_storeStrong((id *)&self->mStyleDictionary, 0);
}

@end
