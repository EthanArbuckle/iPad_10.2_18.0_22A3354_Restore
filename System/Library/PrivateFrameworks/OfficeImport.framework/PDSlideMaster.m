@implementation PDSlideMaster

- (id)theme
{
  return self->mTheme;
}

- (void)setTitleTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->mTitleTextStyle, a3);
}

- (void)setBodyTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->mBodyTextStyle, a3);
}

- (void)setOtherTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->mOtherTextStyle, a3);
}

- (id)colorMap
{
  return self->mColorMap;
}

- (void)setHeaderPlaceholderIsVisible:(BOOL)a3
{
  self->mHeaderPlaceholderIsVisible = a3;
}

- (void)setFooterPlaceholderIsVisible:(BOOL)a3
{
  self->mFooterPlaceholderIsVisible = a3;
}

- (void)setDateTimePlaceholderIsVisible:(BOOL)a3
{
  self->mDateTimePlaceholderIsVisible = a3;
}

- (void)setSlideNumberPlaceholderIsVisible:(BOOL)a3
{
  self->mSlideNumberPlaceholderIsVisible = a3;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = v8;
  if (a3 > 8)
  {
    -[PDSlideMaster otherTextStyle](self, "otherTextStyle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (((1 << a3) & 0xF0) != 0)
  {
    v10 = v8;
  }
  else
  {
    if (((1 << a3) & 0x10A) != 0)
      -[PDSlideMaster bodyTextStyle](self, "bodyTextStyle");
    else
      -[PDSlideMaster titleTextStyle](self, "titleTextStyle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)titleTextStyle
{
  return self->mTitleTextStyle;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)bodyTextStyle
{
  return self->mBodyTextStyle;
}

- (id)colorScheme
{
  void *v2;
  void *v3;
  void *v4;

  -[PDSlideMaster theme](self, "theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDSlideMaster;
  -[PDSlideBase placeholderWithType:placeholderTypeIndex:overrideIndex:](&v6, sel_placeholderWithType_placeholderTypeIndex_overrideIndex_, +[PDSlideBase inheritedPlaceholderType:](PDSlideBase, "inheritedPlaceholderType:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5), 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)slideLayoutCount
{
  return -[NSMutableArray count](self->mSlideLayouts, "count");
}

- (id)slideLayoutOfType:(int)a3
{
  uint64_t v5;
  unsigned int v6;
  void *v7;

  if (-[NSMutableArray count](self->mSlideLayouts, "count"))
  {
    v5 = 0;
    v6 = 1;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->mSlideLayouts, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "slideLayoutType") == a3)
        break;

      v5 = v6;
      if (-[NSMutableArray count](self->mSlideLayouts, "count") <= (unint64_t)v6++)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0;
  }
  return v7;
}

- (id)addSlideLayout
{
  PDSlideLayout *v3;

  v3 = -[PDSlideLayout initWithSlideMaster:]([PDSlideLayout alloc], "initWithSlideMaster:", self);
  -[PDSlideMaster addSlideLayout:](self, "addSlideLayout:", v3);
  return v3;
}

- (void)addSlideLayout:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableArray addObject:](self->mSlideLayouts, "addObject:");
  objc_msgSend(v4, "setSlideMaster:", self);

}

- (id)slideLayoutAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mSlideLayouts, "objectAtIndex:", a3);
}

- (id)otherTextStyle
{
  return self->mOtherTextStyle;
}

- (id)defaultTheme
{
  return self->mTheme;
}

- (id)fontScheme
{
  void *v2;
  void *v3;
  void *v4;

  -[PDSlideMaster theme](self, "theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)styleMatrix
{
  void *v2;
  void *v3;
  void *v4;

  -[PDSlideMaster theme](self, "theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleMatrix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PDSlideMaster)initWithPresentation:(id)a3
{
  id v4;
  PDSlideMaster *v5;
  PDSlideMaster *v6;
  NSMutableArray *v7;
  NSMutableArray *mSlideLayouts;
  OADTheme *v9;
  OADTheme *mTheme;
  OADColorMap *v11;
  OADColorMap *mColorMap;
  OADTextListStyle *v13;
  OADTextListStyle *mTitleTextStyle;
  OADTextListStyle *v15;
  OADTextListStyle *mBodyTextStyle;
  OADTextListStyle *v17;
  OADTextListStyle *mOtherTextStyle;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PDSlideMaster;
  v5 = -[PDSlideBase init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mPresentation, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSlideLayouts = v6->mSlideLayouts;
    v6->mSlideLayouts = v7;

    v9 = objc_alloc_init(OADTheme);
    mTheme = v6->mTheme;
    v6->mTheme = v9;

    v11 = objc_alloc_init(OADColorMap);
    mColorMap = v6->mColorMap;
    v6->mColorMap = v11;

    v13 = objc_alloc_init(OADTextListStyle);
    mTitleTextStyle = v6->mTitleTextStyle;
    v6->mTitleTextStyle = v13;

    v15 = objc_alloc_init(OADTextListStyle);
    mBodyTextStyle = v6->mBodyTextStyle;
    v6->mBodyTextStyle = v15;

    v17 = objc_alloc_init(OADTextListStyle);
    mOtherTextStyle = v6->mOtherTextStyle;
    v6->mOtherTextStyle = v17;

    for (i = 0; i != 9; ++i)
    {
      -[OADTextListStyle propertiesForListLevel:](v6->mTitleTextStyle, "propertiesForListLevel:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTextListStyle propertiesForListLevel:](v6->mBodyTextStyle, "propertiesForListLevel:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 1116733440;
      objc_msgSend(v20, "setDefaultTab:", v22);
      LODWORD(v23) = 1116733440;
      objc_msgSend(v21, "setDefaultTab:", v23);

    }
  }

  return v6;
}

- (id)parentSlideBase
{
  return 0;
}

- (void)doneWithContent
{
  NSMutableArray *mSlideLayouts;
  OADTheme *mTheme;
  OADColorMap *mColorMap;
  OADTextListStyle *mTitleTextStyle;
  OADTextListStyle *mBodyTextStyle;
  OADTextListStyle *mOtherTextStyle;
  objc_super v9;

  mSlideLayouts = self->mSlideLayouts;
  self->mSlideLayouts = 0;

  mTheme = self->mTheme;
  self->mTheme = 0;

  mColorMap = self->mColorMap;
  self->mColorMap = 0;

  mTitleTextStyle = self->mTitleTextStyle;
  self->mTitleTextStyle = 0;

  mBodyTextStyle = self->mBodyTextStyle;
  self->mBodyTextStyle = 0;

  mOtherTextStyle = self->mOtherTextStyle;
  self->mOtherTextStyle = 0;

  v9.receiver = self;
  v9.super_class = (Class)PDSlideMaster;
  -[PDSlideBase doneWithContent](&v9, sel_doneWithContent);
}

- (id)drawingTheme
{
  return -[OADDrawingTheme initWithTheme:colorMap:colorPalette:]([OADDrawingTheme alloc], "initWithTheme:colorMap:colorPalette:", self->mTheme, self->mColorMap, 0);
}

- (id)defaultTextListStyle
{
  void *v2;
  void *v3;

  -[PDSlideMaster presentation](self, "presentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)PDSlideMaster;
  -[PDSlideBase setUpPropertyHierarchyPreservingEffectiveValues](&v11, sel_setUpPropertyHierarchyPreservingEffectiveValues);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = self->mSlideLayouts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setUpPropertyHierarchyPreservingEffectiveValues", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
    }
    while (v4);
  }

}

- (void)removeUnnecessaryOverrides
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:](self->mSlideLayouts, "makeObjectsPerformSelector:", sel_removeUnnecessaryOverrides);
  v3.receiver = self;
  v3.super_class = (Class)PDSlideMaster;
  -[PDSlideBase removeUnnecessaryOverrides](&v3, sel_removeUnnecessaryOverrides);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSlideMaster;
  -[PDSlideBase description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PDPresentation)presentation
{
  return (PDPresentation *)objc_loadWeakRetained((id *)&self->mPresentation);
}

- (NSMutableArray)slideLayouts
{
  return self->mSlideLayouts;
}

- (void)setSlideLayouts:(id)a3
{
  objc_storeStrong((id *)&self->mSlideLayouts, a3);
}

- (BOOL)headerPlaceholderIsVisible
{
  return self->mHeaderPlaceholderIsVisible;
}

- (BOOL)footerPlaceholderIsVisible
{
  return self->mFooterPlaceholderIsVisible;
}

- (BOOL)slideNumberPlaceholderIsVisible
{
  return self->mSlideNumberPlaceholderIsVisible;
}

- (BOOL)dateTimePlaceholderIsVisible
{
  return self->mDateTimePlaceholderIsVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mPresentation);
  objc_storeStrong((id *)&self->mOtherTextStyle, 0);
  objc_storeStrong((id *)&self->mBodyTextStyle, 0);
  objc_storeStrong((id *)&self->mTitleTextStyle, 0);
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mTheme, 0);
  objc_storeStrong((id *)&self->mSlideLayouts, 0);
}

@end
