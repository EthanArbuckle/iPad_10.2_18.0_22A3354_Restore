@implementation SXTextLayouter

- (SXTextLayouter)init
{
  return -[SXTextLayouter initWithTextSource:andDocumentRoot:](self, "initWithTextSource:andDocumentRoot:", 0, 0);
}

- (SXTextLayouter)initWithTextSource:(id)a3 andDocumentRoot:(id)a4
{
  id v7;
  id v8;
  SXTextLayouter *v9;
  SXTextLayouter *v10;
  uint64_t v11;
  NSSet *exclusionPaths;
  uint64_t v13;
  TSDLayoutController *layoutController;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXTextLayouter;
  v9 = -[SXTextLayouter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textSource, a3);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    exclusionPaths = v10->_exclusionPaths;
    v10->_exclusionPaths = (NSSet *)v11;

    objc_storeStrong((id *)&v10->_documentRoot, a4);
    +[SXTextTangierApplicationDelegate setup](SXTextTangierApplicationDelegate, "setup");
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEB3AA0]), "initWithCanvas:", 0);
    layoutController = v10->_layoutController;
    v10->_layoutController = (TSDLayoutController *)v13;

  }
  return v10;
}

- (double)calculateHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[SXTextLayouter createTextInfoIfNeeded](self, "createTextInfoIfNeeded");
  -[SXTextLayouter assignExclusionPaths](self, "assignExclusionPaths");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3A88]), "initWithSize:", a3, 10000000.0);
  -[SXTextLayouter textInfo](self, "textInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGeometry:", v5);

  -[SXTextLayouter layoutController](self, "layoutController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextLayouter textInfo](self, "textInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "validatedLayoutForInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "geometry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;

  return v14;
}

- (void)reset
{
  SXTextTangierContainerInfo *textInfo;

  textInfo = self->_textInfo;
  self->_textInfo = 0;

}

- (void)createTextInfoIfNeeded
{
  id v3;
  SXTextTangierContainerInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SXTextTangierContainerInfo *v13;
  SXTextTangierContainerInfo *textInfo;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (!self->_textInfo)
  {
    v3 = objc_alloc(MEMORY[0x24BEB3A88]);
    v19 = (id)objc_msgSend(v3, "initWithPosition:size:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v4 = [SXTextTangierContainerInfo alloc];
    -[SXTextLayouter documentRoot](self, "documentRoot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextLayouter documentRoot](self, "documentRoot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stylesheet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextLayouter textSource](self, "textSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextLayouter textSource](self, "textSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SXTextTangierContainerInfo initWithContext:geometry:stylesheet:string:locale:](v4, "initWithContext:geometry:stylesheet:string:locale:", v6, v19, v8, v10, v12);
    textInfo = self->_textInfo;
    self->_textInfo = v13;

    -[SXTextLayouter textSource](self, "textSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextTangierContainerInfo storage](self->_textInfo, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applyStylingOnTextTangierStorage:", v16);

    -[SXTextLayouter textSource](self, "textSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextTangierContainerInfo storage](self->_textInfo, "storage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "applyAdditionsOnTextTangierStorage:", v18);

  }
}

- (void)invalidate
{
  id v3;

  -[SXTextLayouter assignExclusionPaths](self, "assignExclusionPaths");
  -[SXTextLayouter textLayout](self, "textLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)assignExclusionPaths
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SXTextLayouter exclusionPaths](self, "exclusionPaths", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v11 = -[SXTextExclusionPath type](v10);
        v12 = v3;
        if (v11 != 1)
        {
          v13 = -[SXTextExclusionPath type](v10);
          v12 = v4;
          if (v13 != 2)
            continue;
        }
        objc_msgSend(v12, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  -[SXTextLayouter textInfo](self, "textInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rangedExclusionPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v4);

  if ((v16 & 1) == 0)
  {
    -[SXTextLayouter textInfo](self, "textInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRangedExclusionPaths:", v4);

  }
  -[SXTextLayouter textInfo](self, "textInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fixedExclusionPaths");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", v3);

  if ((v20 & 1) == 0)
  {
    -[SXTextLayouter textInfo](self, "textInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFixedExclusionPaths:", v3);

  }
}

- (void)addExclusionPath:(id)a3
{
  double *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSSet *v26;
  NSSet *exclusionPaths;
  double *v28;

  v4 = (double *)a3;
  if (v4)
  {
    v28 = v4;
    if (-[SXTextExclusionPath type]((uint64_t)v4) == 2)
    {
      -[SXTextLayouter textSource](self, "textSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SXTextExclusionPath range]((uint64_t)v28);
      v8 = objc_msgSend(v5, "rangeForRange:", v6, v7);
      v10 = v9;

      -[SXTextExclusionPath setRange:]((uint64_t)v28, v8, v10);
    }
    v11 = -[SXTextLayouter validAnchorRangeForRange:](self, "validAnchorRangeForRange:", -[SXTextExclusionPath range]((uint64_t)v28), 1);
    -[SXTextExclusionPath setRange:]((uint64_t)v28, v11, v12);
    -[SXTextLayouter wpStorage](self, "wpStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "paragraphStartAtCharIndex:", -[SXTextExclusionPath range]((uint64_t)v28));

    if (v14)
    {
      v15 = -[SXTextExclusionPath range]((uint64_t)v28);
      if (-[SXTangierTextRenderCollectorItem selectable]((_BOOL8)v28) && v15 >= v14 - 1 && v15 - (v14 - 1) <= 1)
      {
        -[SXTextLayouter wpStorage](self, "wpStorage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "paragraphIndexAtCharIndex:", -[SXTextExclusionPath range]((uint64_t)v28) - 1);

        if (v17)
        {
          -[SXTextLayouter wpStorage](self, "wpStorage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "paragraphStyleAtParIndex:effectiveRange:", v17 - 1, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "floatValueForProperty:", 88);
          v21 = v20;
          v22 = -[SXTextExclusionPath exclusionRect]((uint64_t)v28);
          -[SXTextExclusionPath setExclusionRect:](v28, v22, v24, v25, v23 + v21);

        }
      }
    }
    -[NSSet setByAddingObject:](self->_exclusionPaths, "setByAddingObject:", v28);
    v26 = (NSSet *)objc_claimAutoreleasedReturnValue();
    exclusionPaths = self->_exclusionPaths;
    self->_exclusionPaths = v26;

    v4 = v28;
  }

}

- (_NSRange)validAnchorRangeForRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  NSUInteger v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  unint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  void *v43;
  _NSRange result;

  location = a3.location;
  if ((uint64_t)a3.location <= 10)
    v5 = 10;
  else
    v5 = a3.location;
  if (a3.location >= 0xA)
    v6 = 10;
  else
    v6 = a3.location;
  -[SXTextLayouter textSource](self, "textSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringWithRange:", v5 - 10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v9;
  v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("\n"));
  -[SXTextLayouter textSource](self, "textSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length") - 1;

  if (location + 10 >= v13)
    v14 = v13;
  else
    v14 = location + 10;
  v15 = v14 - location;
  -[SXTextLayouter textSource](self, "textSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "substringWithRange:", location + 1, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "rangeOfString:", CFSTR("\n"));
  v20 = v5 + v10 - 9;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  v21 = v10 - location;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v21 = -1;
  v22 = v19 - location < v21 || v21 == -1;
  v23 = location + 1 + v19;
  if (!v22)
    v23 = v20;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    v20 = v23;
  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    location = v20;
  while (1)
  {
    -[SXTextLayouter textSource](self, "textSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (location >= v26)
      break;
    -[SXTextLayouter textSource](self, "textSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "substringWithRange:", location, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "rangeOfCharacterFromSet:", v30);

    ++location;
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      --location;
      break;
    }
  }
  v32 = location + 1;
  -[SXTextLayouter exclusionPathIndexes](self, "exclusionPathIndexes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "containsIndex:", v32))
  {
    while (1)
    {
      -[SXTextLayouter textSource](self, "textSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "string");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 >= objc_msgSend(v35, "length") - 1)
        break;
      v36 = objc_msgSend(v33, "containsIndex:", v32);

      if (!v36)
        goto LABEL_31;
      ++v32;
    }

  }
LABEL_31:
  -[SXTextLayouter textSource](self, "textSource");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "string");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "length") - 1;

  if (v32 >= v39)
    v40 = v39;
  else
    v40 = v32;

  v41 = v40;
  v42 = 1;
  result.length = v42;
  result.location = v41;
  return result;
}

- (void)removeAllExclusionPaths
{
  NSSet *v3;
  NSSet *exclusionPaths;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  exclusionPaths = self->_exclusionPaths;
  self->_exclusionPaths = v3;

}

- (id)textLayout
{
  void *v3;
  void *v4;
  void *v5;

  -[SXTextLayouter layoutController](self, "layoutController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextLayouter textInfo](self, "textInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstColumn
{
  void *v2;
  void *v3;
  void *v4;

  -[SXTextLayouter wpLayout](self, "wpLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)baselineForLastLine
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SXTextLayouter textLayout](self, "textLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "baselineForLastLine");
  v6 = v5;

  return v6;
}

- (CGRect)typographicBounds
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  CGRect result;

  -[SXTextLayouter firstColumn](self, "firstColumn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextLayouter textSource](self, "textSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "glyphRectForRange:includingLabel:", 0, objc_msgSend(v5, "length"), 1);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)boundingSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SXTextLayouter wpLayout](self, "wpLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSArray)paragraphRanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextLayouter firstColumn](self, "firstColumn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextLayouter firstColumn](self, "firstColumn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "range");
  v9 = objc_msgSend(v5, "paragraphIndexRangeForCharRange:", v7, v8);
  v11 = v10;

  if (v9 < v9 + v11)
  {
    do
    {
      -[SXTextLayouter firstColumn](self, "firstColumn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "storage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "textRangeForParagraphAtIndex:", v9);
      v16 = v15;

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v17);

      ++v9;
      --v11;
    }
    while (v11);
  }
  return (NSArray *)v3;
}

- (double)verticalLocationOfCharacterAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;

  -[SXTextLayouter textSource](self, "textSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7 <= a3)
    return 0.0;
  -[SXTextLayouter firstColumn](self, "firstColumn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topOfLineAtCharIndex:", a3);
  v10 = v9;

  return v10;
}

- (id)wpStorage
{
  void *v3;
  void *v4;

  -[SXTextLayouter createTextInfoIfNeeded](self, "createTextInfoIfNeeded");
  -[SXTextLayouter textInfo](self, "textInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)wpLayout
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SXTextLayouter textLayout](self, "textLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)exclusionPathIndexes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SXTextLayouter exclusionPaths](self, "exclusionPaths", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SXTextExclusionPath range](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        objc_msgSend(v3, "addIndexesInRange:", v9, v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (SXTextSource)textSource
{
  return self->_textSource;
}

- (void)setTextSource:(id)a3
{
  objc_storeStrong((id *)&self->_textSource, a3);
}

- (NSSet)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void)setExclusionPaths:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionPaths, a3);
}

- (SXTextTangierDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_storeStrong((id *)&self->_documentRoot, a3);
}

- (TSDLayoutController)layoutController
{
  return self->_layoutController;
}

- (void)setLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_layoutController, a3);
}

- (SXTextTangierContainerInfo)textInfo
{
  return self->_textInfo;
}

- (void)setTextInfo:(id)a3
{
  objc_storeStrong((id *)&self->_textInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_documentRoot, 0);
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
}

@end
