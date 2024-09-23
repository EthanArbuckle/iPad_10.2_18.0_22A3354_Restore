@implementation PDPresentation

- (PDPresentation)init
{
  PDPresentation *v2;
  NSMutableArray *v3;
  NSMutableArray *mSlideMasters;
  NSMutableArray *v5;
  NSMutableArray *mNotesMasters;
  NSMutableArray *v7;
  NSMutableArray *mSlides;
  NSMutableArray *v9;
  NSMutableArray *mBulletBlips;
  CGSize *v11;
  NSMutableArray *v12;
  NSMutableArray *mCommentAuthors;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PDPresentation;
  v2 = -[OCDDocument init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSlideMasters = v2->mSlideMasters;
    v2->mSlideMasters = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mNotesMasters = v2->mNotesMasters;
    v2->mNotesMasters = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSlides = v2->mSlides;
    v2->mSlides = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mBulletBlips = v2->mBulletBlips;
    v2->mBulletBlips = v9;

    v11 = (CGSize *)MEMORY[0x24BDBF148];
    v2->mSlideSize = (CGSize)*MEMORY[0x24BDBF148];
    v2->mNotesSize = *v11;
    v2->mIsCommentsVisible = 1;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mCommentAuthors = v2->mCommentAuthors;
    v2->mCommentAuthors = v12;

  }
  return v2;
}

- (void)setIsAutoPlay:(BOOL)a3
{
  self->mIsAutoPlay = a3;
}

- (void)setSlideSize:(CGSize)a3
{
  self->mSlideSize = a3;
}

- (void)setNotesSize:(CGSize)a3
{
  self->mNotesSize = a3;
}

- (void)setIsCommentsVisible:(BOOL)a3
{
  self->mIsCommentsVisible = a3;
}

- (void)addSlideMaster:(id)a3
{
  -[NSMutableArray addObject:](self->mSlideMasters, "addObject:", a3);
}

- (void)cacheGraphicStylesForSlideBase:(id)a3
{
  id v4;
  OADColorContext *v5;
  void *v6;
  void *v7;
  OADColorContext *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = [OADColorContext alloc];
    objc_msgSend(v4, "colorScheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[OADColorContext initWithScheme:map:palette:](v5, "initWithScheme:map:palette:", v6, v7, 0);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "drawables", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          -[PDPresentation cacheGraphicStyleForDrawable:colorContext:](self, "cacheGraphicStyleForDrawable:colorContext:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v8);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)cacheGraphicStyleForDrawable:(id)a3 colorContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  int v16;
  char v17;
  char v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[OCDDocument graphicStyleCache](self, "graphicStyleCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v6, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v9);
          -[PDPresentation cacheGraphicStyleForDrawable:colorContext:](self, "cacheGraphicStyleForDrawable:colorContext:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v7);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v10);
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "clientData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "placeholder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = v6;
      v34 = v13;
      objc_msgSend(v15, "shapeProperties");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "type");
      v17 = objc_msgSend(v33, "isTextBox");
      if (v16 == 202)
        v18 = 1;
      else
        v18 = v17;
      if ((v18 & 1) != 0)
      {
        v19 = 2;
      }
      else
      {
        v19 = 1;
        if (v16 != 20 && v16 != 203)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            v19 = 0;
        }
      }
      objc_msgSend(v15, "textBody");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "textListStyle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v19;
      objc_msgSend(v23, "propertiesForListLevel:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "paragraphCount"))
      {
        v31 = v22;
        objc_msgSend(v22, "paragraphAtIndex:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "properties");
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "paragraphEndCharacterProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "textRunCount"))
        {
          objc_msgSend(v25, "textRunAtIndex:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "properties");
          v29 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v29;
        }

        v24 = (void *)v26;
        v22 = v31;
      }
      else
      {
        v27 = 0;
      }
      objc_msgSend(v22, "properties");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cacheDrawablePropertiesOfCategory:withGraphicProperties:textBodyProperties:paragraphProperties:characterProperties:colorContext:", v32, v33, v30, v24, v27, v7);

      v13 = v34;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "imageProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cacheDrawablePropertiesOfCategory:withGraphicProperties:textBodyProperties:paragraphProperties:characterProperties:colorContext:", 3, v20, 0, 0, 0, v7);
LABEL_22:

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "drawableProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "style");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v8, "cacheTableStyle:", v20);
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "cacheChartStyleId:", objc_msgSend(v6, "styleId"));
LABEL_36:

}

- (CGSize)slideSize
{
  double width;
  double height;
  CGSize result;

  width = self->mSlideSize.width;
  height = self->mSlideSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)addBulletBlip:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableArray addObject:](self->mBulletBlips, "addObject:", v4);
  LODWORD(self) = -[NSMutableArray count](self->mBulletBlips, "count");

  return self;
}

- (unsigned)bulletBlipCount
{
  return -[NSMutableArray count](self->mBulletBlips, "count");
}

- (void)setIsLooping:(BOOL)a3
{
  self->mIsLooping = a3;
}

- (void)setIsKiosk:(BOOL)a3
{
  self->mIsKiosk = a3;
}

- (id)bulletBlips
{
  return self->mBulletBlips;
}

- (void)addNotesMaster:(id)a3
{
  -[NSMutableArray addObject:](self->mNotesMasters, "addObject:", a3);
}

- (unint64_t)slideMasterCount
{
  return -[NSMutableArray count](self->mSlideMasters, "count");
}

- (id)slideMasterAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mSlideMasters, "objectAtIndex:", a3);
}

- (unint64_t)notesMasterCount
{
  return -[NSMutableArray count](self->mNotesMasters, "count");
}

- (id)notesMasterAtIndex:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[NSMutableArray count](self->mNotesMasters, "count");
  if (v5)
  {
    -[NSMutableArray objectAtIndex:](self->mNotesMasters, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)slideCount
{
  return -[NSMutableArray count](self->mSlides, "count");
}

- (id)slideAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mSlides, "objectAtIndex:", a3);
}

- (void)addSlide:(id)a3
{
  -[NSMutableArray addObject:](self->mSlides, "addObject:", a3);
}

- (unint64_t)indexOfSlide:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v4 = a3;
  v5 = -[PDPresentation slideCount](self, "slideCount");
  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[PDPresentation slideAtIndex:](self, "slideAtIndex:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
        break;
      if (v5 == ++v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (id)bulletBlipAtIndex:(int)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mBulletBlips, "objectAtIndex:", a3);
}

- (CGSize)notesSize
{
  double width;
  double height;
  CGSize result;

  width = self->mNotesSize.width;
  height = self->mNotesSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isAutoPlay
{
  return self->mIsAutoPlay;
}

- (BOOL)isCommentsVisible
{
  return self->mIsCommentsVisible;
}

- (BOOL)isLooping
{
  return self->mIsLooping;
}

- (BOOL)isKiosk
{
  return self->mIsKiosk;
}

- (unint64_t)commentAuthorCount
{
  return -[NSMutableArray count](self->mCommentAuthors, "count");
}

- (id)commentAuthorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mCommentAuthors, "objectAtIndex:", a3);
}

- (void)addCommentAuthor:(id)a3
{
  -[NSMutableArray addObject:](self->mCommentAuthors, "addObject:", a3);
}

- (void)flushUnusedMastersAndLayouts
{
  unsigned int i;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int j;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  OITSUNoCopyDictionary *v16;

  v16 = objc_alloc_init(OITSUNoCopyDictionary);
  for (i = 0; ; i = v4 + 1)
  {
    v4 = i;
    if (-[NSMutableArray count](self->mSlides, "count") <= (unint64_t)i)
      break;
    -[NSMutableArray objectAtIndex:](self->mSlides, "objectAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "slideLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "slideMaster");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUNoCopyDictionary objectForKey:](v16, "objectForKey:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[OITSUNoCopyDictionary setObject:forUncopiedKey:](v16, "setObject:forUncopiedKey:", v8, v7);
    }
    objc_msgSend(v8, "addObject:", v6);

  }
  -[OITSUNoCopyDictionary allKeys](v16, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setArray:](self->mSlideMasters, "setArray:", v9);
  for (j = 0; objc_msgSend(v9, "count") > (unint64_t)j; ++j)
  {
    objc_msgSend(v9, "objectAtIndex:", j);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[OITSUNoCopyDictionary objectForKey:](v16, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithArray:", v14);

    objc_msgSend(v11, "setSlideLayouts:", v15);
  }

}

- (void)ensureDefaultLayoutsForMasters
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  PDSlideLayout *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->mSlideMasters;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (!objc_msgSend(v6, "slideLayoutCount", (_QWORD)v9))
        {
          v7 = -[PDSlideLayout initWithSlideMaster:]([PDSlideLayout alloc], "initWithSlideMaster:", v6);
          -[PDSlideLayout setSlideLayoutType:](v7, "setSlideLayoutType:", 2);
          -[PDSlideChild setShowMasterShapes:](v7, "setShowMasterShapes:", 1);
          objc_msgSend(v6, "placeholders");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDSlideBase setDrawables:](v7, "setDrawables:", v8);

          -[PDSlideChild setShowMasterPlaceholderAnimations:](v7, "setShowMasterPlaceholderAnimations:", 1);
          objc_msgSend(v6, "addSlideLayout:", v7);

        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)PDPresentation;
  -[OCDDocument setUpPropertyHierarchyPreservingEffectiveValues](&v27, sel_setUpPropertyHierarchyPreservingEffectiveValues);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->mSlideMasters;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v6++), "setUpPropertyHierarchyPreservingEffectiveValues");
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v4);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->mNotesMasters;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "setUpPropertyHierarchyPreservingEffectiveValues");
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v8);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = self->mSlides;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setUpPropertyHierarchyPreservingEffectiveValues", (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    }
    while (v12);
  }

}

- (void)removeUnnecessaryOverrides
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:](self->mSlides, "makeObjectsPerformSelector:", sel_removeUnnecessaryOverrides);
  -[NSMutableArray makeObjectsPerformSelector:](self->mSlideMasters, "makeObjectsPerformSelector:", sel_removeUnnecessaryOverrides);
  -[NSMutableArray makeObjectsPerformSelector:](self->mNotesMasters, "makeObjectsPerformSelector:", sel_removeUnnecessaryOverrides);
  v3.receiver = self;
  v3.super_class = (Class)PDPresentation;
  -[OCDDocument removeUnnecessaryOverrides](&v3, sel_removeUnnecessaryOverrides);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDPresentation;
  -[PDPresentation description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCommentAuthors, 0);
  objc_storeStrong((id *)&self->mBulletBlips, 0);
  objc_storeStrong((id *)&self->mSlides, 0);
  objc_storeStrong((id *)&self->mNotesMasters, 0);
  objc_storeStrong((id *)&self->mSlideMasters, 0);
}

@end
