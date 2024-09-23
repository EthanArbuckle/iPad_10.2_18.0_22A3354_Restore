@implementation SXTextComponentSizer

- (SXTextComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textComponentLayoutHosting:(id)a8 textSourceFactory:(id)a9
{
  id v15;
  id v16;
  id v17;
  SXTextComponentSizer *v18;
  void *v19;
  void *v20;
  SXTextLayouter *v21;
  void *v22;
  uint64_t v23;
  SXTextLayouter *textLayouter;
  void *v25;
  objc_super v27;

  v15 = a3;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)SXTextComponentSizer;
  v18 = -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v27, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, v15, a4, a5, a6, a7);
  if (v18)
  {
    objc_msgSend(v15, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createTextSourceWithString:dataSource:", v19, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = [SXTextLayouter alloc];
    objc_msgSend(v16, "documentRoot");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SXTextLayouter initWithTextSource:andDocumentRoot:](v21, "initWithTextSource:andDocumentRoot:", v20, v22);
    textLayouter = v18->_textLayouter;
    v18->_textLayouter = (SXTextLayouter *)v23;

    -[SXTextComponentSizer textLayouter](v18, "textLayouter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](v18, "saveInfo:forRenderingPhaseWithIdentifier:", v25, CFSTR("TextLayouter"));

  }
  return v18;
}

- (void)addExclusionPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXTextComponentSizer textLayouter](self, "textLayouter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addExclusionPath:", v4);

}

- (void)removeAllExclusionPaths
{
  id v2;

  -[SXTextComponentSizer textLayouter](self, "textLayouter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllExclusionPaths");

}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[SXTextComponentSizer textLayouter](self, "textLayouter", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  -[SXTextComponentSizer textLayouter](self, "textLayouter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calculateHeightForWidth:", a3);
  v9 = v8;

  return v9;
}

- (id)snapLines
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  CGRect v16;

  -[SXTextComponentSizer textLayouter](self, "textLayouter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstColumn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameBounds");
  if (CGRectGetHeight(v16) > 100.0)
  {
    objc_msgSend(v3, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "range");
    v8 = objc_msgSend(v5, "paragraphIndexRangeForCharRange:", v6, v7);
    if (v8 < v8 + v9)
    {
      v10 = v8;
      v11 = v9;
      do
      {
        v12 = objc_msgSend(v5, "textRangeForParagraphAtIndex:", v10);
        if (v13 >= 2)
        {
          objc_msgSend(v3, "topOfLineAtCharIndex:", v12);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

        }
        ++v10;
        --v11;
      }
      while (v11);
    }

  }
  return v4;
}

- (double)verticalPositionForRange:(_NSRange)a3
{
  NSUInteger location;
  void *v4;
  void *v5;
  double v6;
  double v7;

  location = a3.location;
  -[SXTextComponentSizer textLayouter](self, "textLayouter", a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstColumn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topOfLineAtCharIndex:", location);
  v7 = v6;

  return v7;
}

- (unint64_t)stringLength
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[SXTextComponentSizer textLayouter](self, "textLayouter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  return v5;
}

- (id)existingExclusionPathForComponentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXTextComponentSizer textLayouter](self, "textLayouter", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exclusionPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        -[SXTangierTextRenderCollectorItem componentIdentifier]((uint64_t)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)textResizerForTextSource:(id)a3
{
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
  char v19;
  SXTextResizer *v20;
  void *v21;
  void *v22;
  id *v23;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SXDefaultTextStyleIdentifierForRole((uint64_t)CFSTR("body"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentTextStyleForIdentifiers:component:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("default");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentSizer component](self, "component");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentTextStyleForIdentifiers:component:", v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "classification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentTextStyleForIdentifier:classification:component:", v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = objc_msgSend(v18, "fontScaling");
  else
    v19 = 1;
  v20 = [SXTextResizer alloc];
  -[SXComponentSizer layoutOptions](self, "layoutOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "columnLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v20->super.isa, v22, v8, v19);

  return v23;
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
    objc_msgSend(v6, "addObjectsFromArray:", v9);

  }
  -[SXComponentSizer component](self, "component");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SXComponentSizer component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

  }
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentTextStyleForIdentifiers:component:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultTextStyleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentTextStyleForIdentifiers:component:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  void *v3;
  void *v4;

  -[SXComponentSizer component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineTextStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (SXTextResizer)textResizer
{
  return self->_textResizer;
}

- (void)setTextResizer:(id)a3
{
  objc_storeStrong((id *)&self->_textResizer, a3);
}

- (SXTextLayouter)textLayouter
{
  return self->_textLayouter;
}

- (void)setTextLayouter:(id)a3
{
  objc_storeStrong((id *)&self->_textLayouter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayouter, 0);
  objc_storeStrong((id *)&self->_textResizer, 0);
}

@end
