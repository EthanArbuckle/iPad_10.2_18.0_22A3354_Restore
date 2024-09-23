@implementation SXButtonComponentSizer

- (SXButtonComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textProvider:(id)a8 textComponentLayoutHosting:(id)a9 textSourceFactory:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  SXButtonComponentSizer *v20;
  void *v21;
  void *v22;
  SXTextLayouter *v23;
  void *v24;
  uint64_t v25;
  SXTextLayouter *textLayouter;
  void *v27;
  objc_super v29;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)SXButtonComponentSizer;
  v20 = -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v29, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, v16, a4, a5, a6, a7);
  if (v20)
  {
    objc_msgSend(v17, "textForComponent:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createTextSourceWithString:dataSource:", v21, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = [SXTextLayouter alloc];
    objc_msgSend(v18, "documentRoot");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SXTextLayouter initWithTextSource:andDocumentRoot:](v23, "initWithTextSource:andDocumentRoot:", v22, v24);
    textLayouter = v20->_textLayouter;
    v20->_textLayouter = (SXTextLayouter *)v25;

    -[SXButtonComponentSizer textLayouter](v20, "textLayouter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](v20, "saveInfo:forRenderingPhaseWithIdentifier:", v27, CFSTR("TextLayouter"));

  }
  return v20;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  -[SXButtonComponentSizer textLayouter](self, "textLayouter", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  -[SXButtonComponentSizer textLayouter](self, "textLayouter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calculateHeightForWidth:", a3);

  v8 = (void *)MEMORY[0x24BDD1968];
  -[SXButtonComponentSizer textLayouter](self, "textLayouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "typographicBounds");
  objc_msgSend(v8, "valueWithCGRect:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](self, "saveInfo:forRenderingPhaseWithIdentifier:", v10, CFSTR("TypographicBounds"));

  -[SXButtonComponentSizer textLayouter](self, "textLayouter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "typographicBounds");
  v13 = v12;

  return v13;
}

- (UIEdgeInsets)contentInsetsWithUnitConverter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  objc_super v26;
  UIEdgeInsets result;

  v4 = a3;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "padding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v25.receiver = self;
    v25.super_class = (Class)SXButtonComponentSizer;
    -[SXComponentSizer contentInsetsWithUnitConverter:](&v25, sel_contentInsetsWithUnitConverter_, v4);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SXButtonComponentSizer;
    -[SXComponentSizer contentInsetsWithUnitConverter:](&v26, sel_contentInsetsWithUnitConverter_, v4);
    v16 = v15;
    v10 = v17;
    v19 = v18;
    v14 = v20;

    v8 = v16 + 5.0;
    v12 = v19 + 5.0;
  }
  v21 = v8;
  v22 = v10;
  v23 = v12;
  v24 = v14;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (UIEdgeInsets)layoutMarginsWithUnitConverter:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  SXTextUtilities *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  objc_super v50;
  UIEdgeInsets result;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SXButtonComponentSizer;
  -[SXComponentSizer layoutMarginsWithUnitConverter:](&v50, sel_layoutMarginsWithUnitConverter_, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "padding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_msgSend(v14, "left");
    objc_msgSend(v4, "convertValueToPoints:", v15, v16);
    v18 = v17;
    v19 = objc_msgSend(v14, "top");
    objc_msgSend(v4, "convertValueToPoints:", v19, v20);
    v21 = objc_msgSend(v14, "right");
    objc_msgSend(v4, "convertValueToPoints:", v21, v22);
    v24 = v23;
    v25 = objc_msgSend(v14, "bottom");
    objc_msgSend(v4, "convertValueToPoints:", v25, v26);
  }
  else
  {
    v24 = 10.0;
    v18 = 10.0;
  }
  -[SXButtonComponentSizer textLayouter](self, "textLayouter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "wpStorage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[TSWPText initWithParagraphStyle:]([SXTextUtilities alloc], "initWithParagraphStyle:", v29);
  -[TSWPText measureStorage:](v30, "measureStorage:", v28);
  v32 = v31;
  objc_msgSend(v4, "convertValueToPoints:", 0x4059000000000000, 7);
  v34 = v33 - v18 - v24 - v8 - v12;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "maximumContentWidth");
  v37 = v36;

  if (v37)
  {
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "maximumContentWidth");
    objc_msgSend(v4, "convertValueToPoints:", v39, v40);
    v42 = v41;

    if (v32 >= v42)
      v32 = v42;
  }
  v43 = v34 - v32;
  if (v34 - v32 > 0.0)
  {
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "horizontalContentAlignment");

    if (v45 == 1)
    {
      v12 = v34 - v32;
    }
    else if (v45 == 3)
    {
      v8 = v34 - v32;
    }
    else
    {
      v12 = v43 * 0.5;
      v8 = v43 * 0.5;
    }
  }

  v46 = v6;
  v47 = v8;
  v48 = v10;
  v49 = v12;
  result.right = v49;
  result.bottom = v48;
  result.left = v47;
  result.top = v46;
  return result;
}

- (id)textResizerForTextSource:(id)a3
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
  char v13;
  void *v14;
  void *v15;
  SXTextResizer *v16;
  void *v17;
  void *v18;
  id *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SXDefaultTextStyleIdentifierForRole((uint64_t)CFSTR("body"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentTextStyleForIdentifiers:component:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("default");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentSizer component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentTextStyleForIdentifiers:component:", v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = 1;
  -[SXButtonComponentSizer componentTextStyleForTextSource:inheritingFromDefaultStyles:](self, "componentTextStyleForTextSource:inheritingFromDefaultStyles:", v4, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v13 = objc_msgSend(v14, "fontScaling");
  v16 = [SXTextResizer alloc];
  -[SXComponentSizer layoutOptions](self, "layoutOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "columnLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v16->super.isa, v18, v9, v13);

  return v19;
}

- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4
{
  _BOOL4 v4;
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

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SXComponentSizer component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultTextStyleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SXComponentSizer component](self, "component");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "classification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultTextStyleIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v12);

    }
  }
  -[SXComponentSizer component](self, "component");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SXComponentSizer component](self, "component");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v16);

  }
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentTextStyleForIdentifiers:component:", v6, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE30];
  -[SXComponentSizer component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultTextStyleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentTextStyleForIdentifiers:component:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultComponentTextStylesForTextSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SXComponentSizer component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultTextStyleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentSizer component](self, "component");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentTextStyleForIdentifiers:component:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v17, "addObject:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  return v17;
}

- (id)inlineTextStylesForTextSource:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)additionsForTextSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentSizer component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "NSArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textRulesForTextSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentSizer component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentSizeCategoryForTextSource:(id)a3
{
  void *v3;
  void *v4;

  -[SXComponentSizer layoutOptions](self, "layoutOptions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStyleForIdentifier:component:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SXTextLayouter)textLayouter
{
  return self->_textLayouter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayouter, 0);
}

@end
