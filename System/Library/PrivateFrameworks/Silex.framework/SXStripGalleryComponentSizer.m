@implementation SXStripGalleryComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "columnLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentSizer contentWidthForColumnLayout:](self, "contentWidthForColumnLayout:", v6);
  v8 = v7;

  objc_msgSend(v5, "unitConverter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertValueToPoints:", 0x404F000000000000, 2);
  v11 = v10;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[SXStripGalleryComponentSizer imageResources](self, "imageResources", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v50;
    v16 = 0.0;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v18, "dimensions");
        v20 = v19;
        objc_msgSend(v18, "dimensions");
        v22 = v20 / v21;
        if (v20 / v21 < 2.0)
        {
          objc_msgSend(v18, "dimensions", v22);
          v24 = v23;
          objc_msgSend(v18, "dimensions");
          v22 = v24 / v25;
          if (v24 / v25 > v16)
          {
            objc_msgSend(v18, "dimensions", v22);
            v27 = v26;
            objc_msgSend(v18, "dimensions");
            v16 = v27 / v28;
          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v53, 16, v22);
    }
    while (v14);
  }
  else
  {
    v16 = 0.0;
  }

  if (v16 == 0.0)
    v29 = v11;
  else
    v29 = v8 / v16;
  -[SXStripGalleryComponentSizer imageResources](self, "imageResources");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    -[SXStripGalleryComponentSizer imageResources](self, "imageResources");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndex:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "dimensions");
    v35 = v34;
    objc_msgSend(v33, "dimensions");
    if (v35 / v36 < 2.0)
    {
      objc_msgSend(v33, "dimensions");
      v38 = v29 / v37;
      objc_msgSend(v33, "dimensions");
      v40 = v38 * v39;
      if (v40 > v8 + -20.0)
      {
        if (v40 >= v8 + -20.0)
          v40 = v8 + -20.0;
        v29 = v40 / v16;
      }
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](self, "saveInfo:forRenderingPhaseWithIdentifier:", v41, CFSTR("ContentWidth"));

  v42 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "columnLayout");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentSizer xOffsetForColumnLayout:](self, "xOffsetForColumnLayout:", v43);
  objc_msgSend(v42, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](self, "saveInfo:forRenderingPhaseWithIdentifier:", v44, CFSTR("leftOffset"));

  v45 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "columnLayout");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentSizer rightContentInsetForColumnLayout:](self, "rightContentInsetForColumnLayout:", v46);
  objc_msgSend(v45, "numberWithDouble:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](self, "saveInfo:forRenderingPhaseWithIdentifier:", v47, CFSTR("rightOffset"));

  if (v29 < v11)
    v11 = v29;

  return v11;
}

- (id)imageResources
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SXComponentSizer component](self, "component", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageResourceForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v3, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (double)contentWidthForColumnLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;

  v4 = a3;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "columnRange");
  v8 = objc_msgSend(v4, "convertColumnRange:minimumColumnLength:", v6, v7, -[SXComponentSizer minimumColumnLength](self, "minimumColumnLength"));
  v10 = v9;

  -[SXComponentSizer componentLayout](self, "componentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ignoreDocumentMargin");
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "ignoreDocumentGutter");
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v8, v10, v12, v14, objc_msgSend(v15, "ignoreViewportPadding"));
  v17 = v16;

  return v17;
}

- (double)xOffsetForColumnLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;

  v4 = a3;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "columnRange");
  v8 = objc_msgSend(v4, "convertColumnRange:minimumColumnLength:", v6, v7, -[SXComponentSizer minimumColumnLength](self, "minimumColumnLength"));

  -[SXComponentSizer componentLayout](self, "componentLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ignoreDocumentMargin");
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ignoreDocumentGutter");
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v8, v10, v12, objc_msgSend(v13, "ignoreViewportPadding"));
  v15 = v14;

  return v15;
}

- (double)rightContentInsetForColumnLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "columnRange");
  v8 = objc_msgSend(v4, "convertColumnRange:minimumColumnLength:", v6, v7, -[SXComponentSizer minimumColumnLength](self, "minimumColumnLength"));
  v10 = v9;

  -[SXComponentSizer componentLayout](self, "componentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ignoreDocumentMargin");
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "ignoreDocumentGutter");
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v8, v10, v12, v14, objc_msgSend(v15, "ignoreViewportPadding"));
  v17 = v16;

  -[SXStripGalleryComponentSizer xOffsetForColumnLayout:](self, "xOffsetForColumnLayout:", v4);
  v19 = v18;
  objc_msgSend(v4, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", 0, objc_msgSend(v4, "numberOfColumns"), 3, 3, 3);
  v21 = v20;

  return v21 - v17 - v19;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = objc_msgSend(a4, "numberOfColumns", a3.location, a3.length);
  v5 = 0;
  result.length = v4;
  result.location = v5;
  return result;
}

- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3
{
  return 3;
}

- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3
{
  return 3;
}

@end
