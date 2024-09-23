@implementation PDSlide

- (void)setSlideLayout:(id)a3
{
  objc_storeStrong((id *)&self->super.mColorMapOverride, a3);
}

- (id)slideLayout
{
  return self->super.mColorMapOverride;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  -[PDSlide slideLayout](self, "slideLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  objc_msgSend(v11, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v8, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v12, (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_opt_class();
    objc_msgSend(v11, "placeholderWithType:placeholderTypeIndex:useBaseTypeMatch:overrideIndex:", v8, v7, 1, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v15, (uint64_t)v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_4;
  }
  objc_msgSend(v14, "textBody");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textListStyle");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_4:
    objc_msgSend(v11, "parentTextStyleForPlaceholderType:placeholderTypeIndex:defaultTextListStyle:overrideIndex:", v8, v7, v10, v6);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
      v18 = v10;
  }

  return v18;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v9 = objc_opt_class();
  -[PDSlide slideLayout](self, "slideLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v9, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_opt_class();
    -[PDSlide slideLayout](self, "slideLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "placeholderWithType:placeholderTypeIndex:useBaseTypeMatch:overrideIndex:", v7, v6, 1, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v13, (uint64_t)v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_4;
  }
  objc_msgSend(v12, "textBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_4:
    -[PDSlide slideLayout](self, "slideLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentTextBodyPropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  -[PDSlide slideLayout](self, "slideLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v8, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_opt_class();
    objc_msgSend(v8, "placeholderWithType:placeholderTypeIndex:useBaseTypeMatch:overrideIndex:", v7, v6, 1, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v12, (uint64_t)v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_4;
  }
  objc_msgSend(v11, "shapeProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_4:
    objc_msgSend(v8, "parentShapePropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  -[PDSlide slideLayout](self, "slideLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v8, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_opt_class();
    objc_msgSend(v8, "placeholderWithType:placeholderTypeIndex:useBaseTypeMatch:overrideIndex:", v7, v6, 1, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v12, (uint64_t)v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v14 = objc_opt_class();
      objc_msgSend(v8, "slideMaster");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v14, (uint64_t)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (id)background
{
  OADBackground *mColorMapOverride;

  mColorMapOverride = self->super.super.mBackground;
  if (!mColorMapOverride)
  {
    mColorMapOverride = (OADBackground *)self->super.mColorMapOverride;
    if (mColorMapOverride)
    {
      -[OADBackground background](mColorMapOverride, "background");
      mColorMapOverride = (OADBackground *)objc_claimAutoreleasedReturnValue();
    }
  }
  return mColorMapOverride;
}

- (id)defaultTheme
{
  void *v2;
  void *v3;

  -[PDSlide slideLayout](self, "slideLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInheritedTextStyle:(id)a3 placeholderType:(int)a4 defaultTextListStyle:(id)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v8 = a5;
  v9 = v8;
  v10 = a4 & 0xFFFFFFFD;
  if ((a4 & 0xFFFFFFFD) == 1)
  {
    -[PDSlide slideLayout](self, "slideLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "slideMaster");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bodyTextStyle");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v11 = v8;
  if (!v10)
  {
    -[PDSlide slideLayout](self, "slideLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "slideMaster");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleTextStyle");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v14;

  }
  objc_msgSend(v15, "setParentTextListStyle:", v11);

}

- (void)setNotesSlide:(id)a3
{
  objc_storeStrong((id *)&self->mComments, a3);
}

- (id)parentTextStyleForTables
{
  void *v2;
  void *v3;

  -[PDSlide slideLayout](self, "slideLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentTextStyleForTables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)notesSlide
{
  return self->mComments;
}

- (unint64_t)commentCount
{
  return -[PDSlideLayout count](self->mSlideLayout, "count");
}

- (id)commentAtIndex:(unint64_t)a3
{
  return (id)-[PDSlideLayout objectAtIndex:](self->mSlideLayout, "objectAtIndex:", a3);
}

- (void)addComment:(id)a3
{
  id v4;
  PDSlideLayout *mSlideLayout;
  PDSlideLayout *v6;
  PDSlideLayout *v7;
  id v8;

  v4 = a3;
  mSlideLayout = self->mSlideLayout;
  v8 = v4;
  if (!mSlideLayout)
  {
    v6 = (PDSlideLayout *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->mSlideLayout;
    self->mSlideLayout = v6;

    mSlideLayout = self->mSlideLayout;
    v4 = v8;
  }
  -[PDSlideLayout addObject:](mSlideLayout, "addObject:", v4);

}

- (id)commentForAuthorId:(unint64_t)a3 authorIdx:(unint64_t)a4
{
  PDSlideLayout *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->mSlideLayout;
  v7 = -[PDSlideLayout countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "authorId", (_QWORD)v15) == a3)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v10, "index"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "unsignedIntegerValue") == a4;

          if (v12)
          {
            v13 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = -[PDSlideLayout countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (OITSUNoCopyDictionary)commentParents
{
  PDNotesSlide *mNotesSlide;
  PDNotesSlide *v4;
  PDNotesSlide *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  PDNotesSlide *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PDNotesSlide *v19;
  PDSlideLayout *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  mNotesSlide = self->mNotesSlide;
  if (!mNotesSlide)
  {
    v4 = (PDNotesSlide *)objc_opt_new();
    v5 = self->mNotesSlide;
    self->mNotesSlide = v4;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = self->mSlideLayout;
    v6 = -[PDSlideLayout countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "parent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (v11)
          {
            v19 = self->mNotesSlide;
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDNotesSlide setObject:forUncopiedKey:](v19, "setObject:forUncopiedKey:", v16, v9);
          }
          else
          {
            v12 = objc_opt_class();
            v13 = self->mNotesSlide;
            objc_msgSend(v9, "parent");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDNotesSlide objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            TSUDynamicCast(v12, (uint64_t)v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PDSlide commentParents]");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Dom/PDSlide.mm");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 230, 0, "child comment being mapped before the parent");

              +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
            }
            objc_msgSend(v16, "addObject:", v9);
          }

        }
        v6 = -[PDSlideLayout countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    mNotesSlide = self->mNotesSlide;
  }
  return (OITSUNoCopyDictionary *)mNotesSlide;
}

- (void)setCommentParents:(id)a3
{
  objc_storeStrong((id *)&self->mNotesSlide, a3);
}

- (void)doneWithContent
{
  PDSlideLayout *mSlideLayout;
  NSMutableArray *mComments;
  objc_super v5;

  mSlideLayout = self->mSlideLayout;
  self->mSlideLayout = 0;

  -[NSMutableArray doneWithContent](self->mComments, "doneWithContent");
  mComments = self->mComments;
  self->mComments = 0;

  v5.receiver = self;
  v5.super_class = (Class)PDSlide;
  -[PDSlideChild doneWithContent](&v5, sel_doneWithContent);
}

- (id)inheritedTextStyleForPlaceholderType:(int)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if ((a3 & 0xFFFFFFFD) == 1)
  {
    -[PDSlide slideLayout](self, "slideLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "slideMaster");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bodyTextStyle");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a3 & 0xFFFFFFFD) != 0)
    {
      v6 = 0;
      return v6;
    }
    -[PDSlide slideLayout](self, "slideLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "slideMaster");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleTextStyle");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)transition
{
  PDTransition *mColorMapOverride;

  mColorMapOverride = self->super.super.mTransition;
  if (!mColorMapOverride)
  {
    mColorMapOverride = (PDTransition *)self->super.mColorMapOverride;
    if (mColorMapOverride)
    {
      -[PDTransition transition](mColorMapOverride, "transition");
      mColorMapOverride = (PDTransition *)objc_claimAutoreleasedReturnValue();
    }
  }
  return mColorMapOverride;
}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSlide;
  -[PDSlideBase setUpPropertyHierarchyPreservingEffectiveValues](&v3, sel_setUpPropertyHierarchyPreservingEffectiveValues);
  -[NSMutableArray setUpPropertyHierarchyPreservingEffectiveValues](self->mComments, "setUpPropertyHierarchyPreservingEffectiveValues");
}

- (void)removeUnnecessaryOverrides
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSlide;
  -[PDSlideBase removeUnnecessaryOverrides](&v3, sel_removeUnnecessaryOverrides);
  -[NSMutableArray removeUnnecessaryOverrides](self->mComments, "removeUnnecessaryOverrides");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSlide;
  -[PDSlideChild description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNotesSlide, 0);
  objc_storeStrong((id *)&self->mComments, 0);
  objc_storeStrong((id *)&self->mSlideLayout, 0);
  objc_storeStrong((id *)&self->super.mColorMapOverride, 0);
}

@end
