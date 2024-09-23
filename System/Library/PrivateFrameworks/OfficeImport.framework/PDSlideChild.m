@implementation PDSlideChild

- (PDSlideChild)init
{
  PDSlideChild *v2;
  PDSlideChild *v3;
  OADThemeOverrides *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDSlideChild;
  v2 = -[PDSlideBase init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)&v2->super + 73) = 1;
    *((_BYTE *)&v2->super + 74) = 1;
    v4 = objc_alloc_init(OADThemeOverrides);
    v5 = *(void **)&v3->mShowMasterPlaceholderAnimations;
    *(_QWORD *)&v3->mShowMasterPlaceholderAnimations = v4;

  }
  return v3;
}

- (id)colorScheme
{
  void *v3;
  void *v4;
  void *v5;

  -[PDSlideChild themeOverrides](self, "themeOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PDSlideBase parentSlideBase](self, "parentSlideBase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorScheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)themeOverrides
{
  return *(id *)&self->mShowMasterPlaceholderAnimations;
}

- (id)colorMap
{
  void *v3;
  void *v4;

  -[PDSlideChild colorMapOverride](self, "colorMapOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PDSlideBase parentSlideBase](self, "parentSlideBase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)colorMapOverride
{
  return self->mThemeOverrides;
}

- (void)setShowMasterShapes:(BOOL)a3
{
  *((_BYTE *)&self->super + 74) = a3;
}

- (BOOL)showMasterShapes
{
  return *((_BYTE *)&self->super + 74);
}

- (void)setColorMapOverride:(id)a3
{
  objc_storeStrong((id *)&self->mThemeOverrides, a3);
}

- (void)setShowMasterPlaceholderAnimations:(BOOL)a3
{
  *((_BYTE *)&self->super + 73) = a3;
}

- (id)fontScheme
{
  void *v3;
  void *v4;
  void *v5;

  -[PDSlideChild themeOverrides](self, "themeOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PDSlideBase parentSlideBase](self, "parentSlideBase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontScheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)styleMatrix
{
  void *v3;
  void *v4;
  void *v5;

  -[PDSlideChild themeOverrides](self, "themeOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleMatrix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PDSlideBase parentSlideBase](self, "parentSlideBase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleMatrix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)showMasterPlaceholderAnimations
{
  return *((_BYTE *)&self->super + 73);
}

- (id)defaultTextListStyle
{
  void *v2;
  void *v3;

  -[PDSlideBase parentSlideBase](self, "parentSlideBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultTextListStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)doneWithContent
{
  void *v3;
  OADThemeOverrides *mThemeOverrides;
  objc_super v5;

  v3 = *(void **)&self->mShowMasterPlaceholderAnimations;
  *(_QWORD *)&self->mShowMasterPlaceholderAnimations = 0;

  mThemeOverrides = self->mThemeOverrides;
  self->mThemeOverrides = 0;

  v5.receiver = self;
  v5.super_class = (Class)PDSlideChild;
  -[PDSlideBase doneWithContent](&v5, sel_doneWithContent);
}

- (id)drawingTheme
{
  void *v3;
  void *v4;

  -[PDSlideBase parentSlideBase](self, "parentSlideBase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "applyThemeOverrides:colorMapOverride:", *(_QWORD *)&self->mShowMasterPlaceholderAnimations, self->mThemeOverrides);
  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSlideChild;
  -[PDSlideBase description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mThemeOverrides, 0);
  objc_storeStrong((id *)&self->mShowMasterPlaceholderAnimations, 0);
}

@end
