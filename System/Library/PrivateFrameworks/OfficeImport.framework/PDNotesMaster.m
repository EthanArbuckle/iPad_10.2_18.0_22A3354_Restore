@implementation PDNotesMaster

- (PDNotesMaster)init
{
  PDNotesMaster *v2;
  OADTheme *v3;
  OADTheme *mTheme;
  OADColorMap *v5;
  OADColorMap *mColorMap;
  OADTextListStyle *v7;
  OADTextListStyle *mNotesTextStyle;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PDNotesMaster;
  v2 = -[PDSlideBase init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADTheme);
    mTheme = v2->mTheme;
    v2->mTheme = v3;

    v5 = objc_alloc_init(OADColorMap);
    mColorMap = v2->mColorMap;
    v2->mColorMap = v5;

    v7 = objc_alloc_init(OADTextListStyle);
    mNotesTextStyle = v2->mNotesTextStyle;
    v2->mNotesTextStyle = v7;

    -[OADColorMap addDefaultMappings:](v2->mColorMap, "addDefaultMappings:", 1);
  }
  return v2;
}

- (id)theme
{
  return self->mTheme;
}

- (id)colorMap
{
  return self->mColorMap;
}

- (id)notesTextStyle
{
  return self->mNotesTextStyle;
}

- (id)colorScheme
{
  void *v2;
  void *v3;
  void *v4;

  -[PDNotesMaster theme](self, "theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fontScheme
{
  void *v2;
  void *v3;
  void *v4;

  -[PDNotesMaster theme](self, "theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = v8;
  if (a3 == 1)
  {
    -[PDNotesMaster notesTextStyle](self, "notesTextStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
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

- (id)parentSlideBase
{
  return 0;
}

- (id)styleMatrix
{
  void *v2;
  void *v3;
  void *v4;

  -[PDNotesMaster theme](self, "theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleMatrix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)parentTextStyleForTables
{
  return 0;
}

- (void)doneWithContent
{
  OADTheme *mTheme;
  OADColorMap *mColorMap;
  OADTextListStyle *mNotesTextStyle;
  objc_super v6;

  mTheme = self->mTheme;
  self->mTheme = 0;

  mColorMap = self->mColorMap;
  self->mColorMap = 0;

  mNotesTextStyle = self->mNotesTextStyle;
  self->mNotesTextStyle = 0;

  v6.receiver = self;
  v6.super_class = (Class)PDNotesMaster;
  -[PDSlideBase doneWithContent](&v6, sel_doneWithContent);
}

- (id)drawingTheme
{
  return -[OADDrawingTheme initWithTheme:colorMap:colorPalette:]([OADDrawingTheme alloc], "initWithTheme:colorMap:colorPalette:", self->mTheme, self->mColorMap, 0);
}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  OADTextListStyle *mNotesTextStyle;
  void *v4;
  objc_super v5;

  mNotesTextStyle = self->mNotesTextStyle;
  +[OADTextListStyle defaultObject](OADTextListStyle, "defaultObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTextListStyle changeParentTextListStylePreservingEffectiveValues:](mNotesTextStyle, "changeParentTextListStylePreservingEffectiveValues:", v4);

  v5.receiver = self;
  v5.super_class = (Class)PDNotesMaster;
  -[PDSlideBase setUpPropertyHierarchyPreservingEffectiveValues](&v5, sel_setUpPropertyHierarchyPreservingEffectiveValues);
}

- (void)removeUnnecessaryOverrides
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDNotesMaster;
  -[PDSlideBase removeUnnecessaryOverrides](&v3, sel_removeUnnecessaryOverrides);
  -[OADTextListStyle removeUnnecessaryOverrides](self->mNotesTextStyle, "removeUnnecessaryOverrides");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDNotesMaster;
  -[PDSlideBase description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNotesTextStyle, 0);
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mTheme, 0);
}

@end
