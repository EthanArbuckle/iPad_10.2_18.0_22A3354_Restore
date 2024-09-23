@implementation SXTextTangierFlowLayout

- (SXTextTangierFlowLayout)initWithInfo:(id)a3 layout:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  SXTextTangierFlowLayout *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v46 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v43.receiver = self;
  v43.super_class = (Class)SXTextTangierFlowLayout;
  v13 = -[TSDLayout initWithInfo:](&v43, sel_initWithInfo_, v11);
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3AA8]), "initWithFrame:", x, y, width, height);
    -[TSDAbstractLayout setGeometry:](v13, "setGeometry:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SXTextTangierFlowLayout setColumns:](v13, "setColumns:", v15);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v12, "columns");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v20);
          objc_msgSend(v11, "storage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v11, "range");
          objc_msgSend(v21, "setStorage:range:", v22, v23, v24);

          -[SXTextTangierFlowLayout columns](v13, "columns");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v18);
    }

    objc_msgSend(v12, "children");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v36;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v36 != v31)
            objc_enumerationMutation(v28);
          -[TSDAbstractLayout addChild:](v13, "addChild:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v32++), (_QWORD)v35);
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v30);
    }

    objc_msgSend(v12, "columns");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeAllObjects");

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[SXTextTangierFlowLayout setColumns:](self, "setColumns:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierFlowLayout;
  -[TSDLayout dealloc](&v3, sel_dealloc);
}

- (unint64_t)characterPositionForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SXTextTangierFlowLayout columns](self, "columns", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "frameBounds");
        v19.x = x;
        v19.y = y;
        if (CGRectContainsPoint(v20, v19))
        {
          v11 = objc_msgSend(v10, "charIndexForSelectionFromPoint:isTail:", 0, x, y);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v11;
}

- (CGPoint)pointForCharacterPosition:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint result;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SXTextTangierFlowLayout columns](self, "columns", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "range");
        if (v12 <= a3 && v12 + v13 >= a3 + 1)
        {
          v15 = (void *)MEMORY[0x24BEB3AF8];
          objc_msgSend(MEMORY[0x24BEB3B68], "selectionWithRange:", a3, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTextTangierFlowLayout columns](self, "columns");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "rectForSelection:withColumns:", v16, v17);
          v5 = v18;
          v6 = v19;

          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

  v20 = v5;
  v21 = v6;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)layoutGeometryFromInfo
{
  return 0;
}

- (BOOL)shouldDisplayGuides
{
  return 0;
}

- (BOOL)shouldProvideSizingGuides
{
  return 0;
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  return 0;
}

- (TSWPOffscreenColumn)previousTargetLastColumn
{
  return 0;
}

- (const)previousTargetTopicNumbers
{
  return 0;
}

- (const)nextTargetTopicNumbers
{
  return 0;
}

- (TSWPOffscreenColumn)nextTargetFirstColumn
{
  return 0;
}

- (TSDHint)nextTargetFirstChildHint
{
  return 0;
}

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  return 0;
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  return 0;
}

- (BOOL)isLastTarget
{
  return 1;
}

- (CGSize)currentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TSDAbstractLayout geometry](self, "geometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGPoint)position
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[TSDAbstractLayout geometry](self, "geometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (unsigned)autosizeFlags
{
  return 0;
}

- (unsigned)verticalAlignment
{
  return 0;
}

- (unsigned)naturalAlignment
{
  return 4;
}

- (int)naturalDirection
{
  return -1;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDAbstractLayout frameInRoot](self, "frameInRoot");
  v8 = -v7;
  v10 = -v9;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectOffset(v11, v8, v10);
}

- (TSDCanvas)canvas
{
  void *v2;
  void *v3;

  -[TSDLayout layoutController](self, "layoutController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TSDCanvas *)v3;
}

- (id)layoutForInlineDrawable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TSDAbstractLayout children](self, "children", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        TSUDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "info");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v4)
          {

            goto LABEL_13;
          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4);
  if (v11)
    -[TSDAbstractLayout addChild:](self, "addChild:", v11);
LABEL_13:
  objc_msgSend(v11, "updateChildrenFromInfo");

  return v11;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierFlowLayout validatedLayoutForAnchoredDrawable:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierFlowLayout.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 270, CFSTR("Anchored attachments not supported in non-body text."));

  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  SXTextTangierFlowLayout *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "parent");
  v4 = (SXTextTangierFlowLayout *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    -[TSDAbstractLayout addChild:](self, "addChild:", v5);
  objc_msgSend(v5, "updateChildrenFromInfo");

}

- (id)currentAnchoredDrawableLayouts
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierFlowLayout currentAnchoredDrawableLayouts]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierFlowLayout.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 305, CFSTR("Anchored attachments not supported in flow text."));

  return 0;
}

- (double)maxAnchorY
{
  double v3;
  double v4;
  double v5;

  -[SXTextTangierFlowLayout position](self, "position");
  v4 = v3;
  -[SXTextTangierFlowLayout maxSize](self, "maxSize");
  return v4 + v5;
}

- (unint64_t)pageNumber
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pageCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (CGRect)maskRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isLayoutOffscreen
{
  void *v2;
  char v3;

  -[TSDLayout layoutController](self, "layoutController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLayoutOffscreen");

  return v3;
}

- (BOOL)layoutIsValid
{
  return 1;
}

- (BOOL)allowsLastLineTruncation
{
  return 0;
}

- (unsigned)maxLineCount
{
  return 0;
}

- (BOOL)ignoresEquationAlignment
{
  return 0;
}

- (BOOL)shouldHyphenate
{
  return 1;
}

- (NSMutableArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
