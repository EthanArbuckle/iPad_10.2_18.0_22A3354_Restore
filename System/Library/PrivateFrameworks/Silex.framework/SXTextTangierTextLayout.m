@implementation SXTextTangierTextLayout

- (double)lineHeightGuessForFirstLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CTFont *FontForStyle;
  void *v10;
  double v11;
  double v12;

  -[TSWPLayout columns](self, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TSDLayout info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterStyleAtCharIndex:effectiveRange:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TSDLayout info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaleTextPercent");
  FontForStyle = (const __CTFont *)TSWPFastCreateFontForStyle();
  TSWPFontHeightInfoForFont(FontForStyle);
  objc_msgSend(v8, "valueForProperty:", 85, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "amount");
  v12 = v11;
  CFRelease(FontForStyle);

  return (0.0 + 0.0) * v12 + 0.0 + 0.0;
}

- (double)baselineForLastLine
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[TSWPLayout columns](self, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TSDLayout info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4)
    objc_msgSend(v4, "lineMetricsAtCharIndex:allowEndOfLine:", v6 - 1, 1, (unsigned __int128)0, (unsigned __int128)0);

  return 0.0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 1;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 10;
}

- (__CFLocale)hyphenationLocale
{
  void *v2;
  void *v3;

  -[TSDLayout info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFLocale *)v3;
}

- (id)currentInlineDrawableLayouts
{
  return -[SXTextTangierTextLayout attachedLayoutsInLayout:anchored:](self, "attachedLayoutsInLayout:anchored:", self, 0);
}

- (id)currentAnchoredDrawableLayouts
{
  return -[SXTextTangierTextLayout attachedLayoutsInLayout:anchored:](self, "attachedLayoutsInLayout:anchored:", self, 1);
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  -[SXTextTangierTextLayout validatedLayoutForAttachedDrawable:](self, "validatedLayoutForAttachedDrawable:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutForInlineDrawable:(id)a3
{
  -[SXTextTangierTextLayout validatedLayoutForAttachedDrawable:](self, "validatedLayoutForAttachedDrawable:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addAttachmentLayout:(id)a3
{
  SXTextTangierTextLayout *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "parent");
  v4 = (SXTextTangierTextLayout *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[TSDAbstractLayout addChild:](self, "addChild:", v8);
    -[SXTextTangierTextLayout addedChildren](self, "addedChildren");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[SXTextTangierTextLayout setAddedChildren:](self, "setAddedChildren:", v6);

    }
    -[SXTextTangierTextLayout addedChildren](self, "addedChildren");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_msgSend(v8, "updateChildrenFromInfo");

}

- (void)validate
{
  objc_super v3;

  if (!-[TSWPLayout textLayoutValid](self, "textLayoutValid"))
  {
    v3.receiver = self;
    v3.super_class = (Class)SXTextTangierTextLayout;
    -[TSWPLayout validate](&v3, sel_validate);
  }
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SXTextTangierTextLayout;
  -[TSDLayout invalidate](&v2, sel_invalidate);
}

- (void)invalidateTextLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)SXTextTangierTextLayout;
  -[TSWPLayout invalidateTextLayout](&v12, sel_invalidateTextLayout);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[SXTextTangierTextLayout addedChildren](self, "addedChildren", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "removeFromParent");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v4);
  }

  -[SXTextTangierTextLayout addedChildren](self, "addedChildren");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (BOOL)alwaysAllowWordSplit
{
  return 1;
}

- (BOOL)pushAscendersIntoColumn
{
  return 1;
}

- (id)attachedLayoutsInLayout:(id)a3 anchored:(BOOL)a4
{
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = a3;
  objc_msgSend(v15, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        TSUDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "info");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "owningAttachment");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13
            && objc_msgSend(v13, "isDrawable")
            && objc_msgSend(v13, "isAnchored") == v4)
          {
            if (v6)
              objc_msgSend(v6, "addObject:", v11);
            else
              v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v11, 0);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v6;
}

- (id)validatedLayoutForAttachedDrawable:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  void *v7;

  v4 = a3;
  -[TSDLayout layoutController](self, "layoutController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutForInfo:", v4);
  v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4);
    if (!v6)
      goto LABEL_6;
    -[SXTextTangierTextLayout addAttachmentLayout:](self, "addAttachmentLayout:", v6);
  }
  if ((v6[*MEMORY[0x24BEB3B88]] & 3) != 0)
  {
    -[TSDLayout layoutController](self, "layoutController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validateLayoutWithDependencies:", v6);

  }
LABEL_6:

  return v6;
}

- (void)startedIterativePositioningProcessForDrawableAttachment:(id)a3
{
  void *v3;
  void *v4;
  _QWORD *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "drawable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "exclusionPath");
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath callStartBlock](v5);

  }
}

- (void)drawableAttachment:(id)a3 willStartNewIterationWithIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  objc_msgSend(v13, "drawable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    -[TSDLayout layoutController](self, "layoutController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutForInfo:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "exclusionPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    -[SXTextExclusionPath adjustYPositionWithCurrentPosition:]((uint64_t)v10, v11, v12);

  }
}

- (void)drawableAttachment:(id)a3 didFinalizePosition:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  const char *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  objc_opt_class();
  objc_msgSend(v11, "drawable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "exclusionPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath setActualPosition:]((uint64_t)v8, x, y);

    objc_msgSend(v7, "exclusionPath");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath callCompletionBlock](v9, v10);

  }
}

- (BOOL)drawableAttachment:(id)a3 withLayout:(id)a4 shouldPositionIterativelyInColumn:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;

  v6 = a5;
  objc_msgSend(a4, "frame");
  v8 = v7;
  objc_msgSend(v6, "frameBounds");
  LOBYTE(a4) = v8 <= v9 * 0.9;

  return (char)a4;
}

- (CGSize)maxSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.79769313e308;
  v3 = 1.79769313e308;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSMutableSet)addedChildren
{
  return self->_addedChildren;
}

- (void)setAddedChildren:(id)a3
{
  objc_storeStrong((id *)&self->_addedChildren, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedChildren, 0);
}

@end
