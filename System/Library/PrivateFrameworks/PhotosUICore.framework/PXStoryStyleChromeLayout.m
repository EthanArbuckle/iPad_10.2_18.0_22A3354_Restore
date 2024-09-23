@implementation PXStoryStyleChromeLayout

- (PXStoryStyleChromeLayout)initWithViewModel:(id)a3
{
  id v5;
  PXStoryStyleChromeLayout *v6;
  PXStoryStyleChromeLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryStyleChromeLayout;
  v6 = -[PXGLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    v7->_songTitleSpriteIndex = 0;
    v7->_songTitleAccessorySpriteIndex = 1;
    v7->_songSubtitleSpriteIndex = 2;
    v7->_colorGradeNameSpriteIndex = 3;
    v7->_songArtworkSpriteIndex = 4;
    v7->_filterButtonSpriteIndex = 5;
    v7->_musicButtonSpriteIndex = 6;
    v7->_customLabelSpriteIndex = 7;
    v7->_spriteCount = 8;
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](v7, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, 8, 0, 0);
  }

  return v7;
}

- (void)setStyleInfo:(id)a3
{
  PXStoryStyleDescriptor *v5;
  char v6;
  PXStoryStyleDescriptor *v7;

  v7 = (PXStoryStyleDescriptor *)a3;
  v5 = self->_styleInfo;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStyleDescriptor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_styleInfo, a3);
      -[PXStoryStyleChromeLayout setMediaVersion:](self, "setMediaVersion:", (unsigned __int16)(-[PXStoryStyleChromeLayout mediaVersion](self, "mediaVersion") + 1));
      -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setViewLayoutSpec:(id)a3
{
  PXStoryViewLayoutSpec *v5;
  char v6;
  PXStoryViewLayoutSpec *v7;

  v7 = (PXStoryViewLayoutSpec *)a3;
  v5 = self->_viewLayoutSpec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryViewLayoutSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewLayoutSpec, a3);
      -[PXStoryStyleChromeLayout setMediaVersion:](self, "setMediaVersion:", (unsigned __int16)(-[PXStoryStyleChromeLayout mediaVersion](self, "mediaVersion") + 1));
      -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
      -[PXStoryStyleChromeLayout _invalidateStrings](self, "_invalidateStrings");
    }
  }

}

- (void)setColorGradingRepository:(id)a3
{
  PXStoryColorGradingRepository *v5;
  char v6;
  PXStoryColorGradingRepository *v7;

  v7 = (PXStoryColorGradingRepository *)a3;
  v5 = self->_colorGradingRepository;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryColorGradingRepository isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_colorGradingRepository, a3);
      -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setMediaVersion:(unsigned __int16)a3
{
  if (self->_mediaVersion != a3)
  {
    self->_mediaVersion = a3;
    -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (PXStoryStyleChromeLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleChromeLayout.m"), 141, CFSTR("%s is not available as initializer"), "-[PXStoryStyleChromeLayout init]");

  abort();
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  -[PXGLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXStoryStyleChromeLayout _invalidateContent](self, "_invalidateContent");
}

- (BOOL)canHandleVisibleRectRejection
{
  return 1;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleChromeLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryStyleChromeLayout.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleChromeLayout.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryStyleChromeLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryStyleChromeLayout.m"), 180, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryStyleChromeLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleChromeLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryStyleChromeLayout.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateContent
{
  NSAttributedString *colorGradeNameAttributedString;
  NSAttributedString *titleAccessoryAttributedString;
  NSAttributedString *titleAttributedString;
  NSAttributedString *subtitleAttributedString;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v10;
  void *v11;

  colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  self->_colorGradeNameAttributedString = 0;

  titleAccessoryAttributedString = self->_titleAccessoryAttributedString;
  self->_titleAccessoryAttributedString = 0;

  titleAttributedString = self->_titleAttributedString;
  self->_titleAttributedString = 0;

  subtitleAttributedString = self->_subtitleAttributedString;
  self->_subtitleAttributedString = 0;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeLayout _invalidateContent]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXStoryStyleChromeLayout.m"), 194, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContent
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  unsigned __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  PXStoryStyleChromeLayout *v27;
  __int128 v28;
  double v29;
  double v30;
  SEL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  double v39;
  double v40;
  unsigned __int16 v41;
  char v42;

  -[PXGLayout referenceSize](self, "referenceSize");
  v5 = v4;
  v7 = v6;
  -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chromeButtonSize");
  v10 = v9;
  v12 = v11;
  v38 = *MEMORY[0x1E0C9D538];
  v28 = v38;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v14 = -v13;
  v15 = -[PXStoryStyleChromeLayout mediaVersion](self, "mediaVersion");
  -[PXGLayout alpha](self, "alpha");
  v17 = v16;
  -[PXGLayout displayScale](self, "displayScale");
  v19 = v18;
  objc_msgSend(v8, "styleSwitcherDistanceBetweenAlbumArtAndLabels");
  v21 = v20;
  v22 = objc_msgSend(v8, "styleSwitcherCanShowEditButtons");
  v23 = (unint64_t)self->_spriteCount << 32;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __42__PXStoryStyleChromeLayout__updateContent__block_invoke;
  v25[3] = &unk_1E513EC18;
  v29 = v5;
  v30 = v7;
  v31 = a2;
  v26 = v8;
  v27 = self;
  v32 = v10;
  v33 = v12;
  v42 = v22;
  v34 = v21;
  v35 = v14;
  v41 = v15;
  v36 = v17;
  v37 = v19;
  v39 = v5;
  v40 = v7;
  v24 = v8;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v23, v25);
  -[PXGLayout setContentSize:](self, "setContentSize:", v5, v7);

}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return &stru_1E5149688;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_songTitleSpriteIndex == a3)
  {
    -[PXStoryStyleChromeLayout titleAttributedString](self, "titleAttributedString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (self->_songSubtitleSpriteIndex == a3)
  {
    -[PXStoryStyleChromeLayout subtitleAttributedString](self, "subtitleAttributedString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (self->_colorGradeNameSpriteIndex == a3)
  {
    -[PXStoryStyleChromeLayout colorGradeNameAttributedString](self, "colorGradeNameAttributedString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_songTitleAccessorySpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleChromeLayout.m"), 397, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXStoryStyleChromeLayout titleAccessoryAttributedString](self, "titleAccessoryAttributedString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 35;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v7;

  if (self->_songArtworkSpriteIndex != a3
    && self->_musicButtonSpriteIndex != a3
    && self->_filterButtonSpriteIndex != a3
    && self->_customLabelSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleChromeLayout.m"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index == _songArtworkSpriteIndex || index == _musicButtonSpriteIndex || index == _filterButtonSpriteIndex || index == _customLabelSpriteIndex"));

  }
  return (Class)objc_opt_class();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  PXStoryChromeButtonConfiguration *v8;
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
  void *v19;
  void *v20;
  void *v22;

  v7 = a4;
  if (self->_songArtworkSpriteIndex == a3)
  {
    v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v8, "setBackgroundStyle:", 2);
    -[PXStoryChromeButtonConfiguration setTarget:](v8, "setTarget:", self);
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chromeButtonSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryChromeButtonConfiguration setSpec:](v8, "setSpec:", v10);
    -[PXStoryStyleChromeLayout _styleSongAsset](self, "_styleSongAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "artworkDisplayAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setDisplayAsset:](v8, "setDisplayAsset:", v12);

    -[PXStoryStyleChromeLayout musicFeedbackContextMenuDelegate](self, "musicFeedbackContextMenuDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setCustomContextMenuInteractionDelegate:](v8, "setCustomContextMenuInteractionDelegate:", v13);

  }
  else if (self->_musicButtonSpriteIndex == a3)
  {
    v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v8, "setBackgroundStyle:", -[PXStoryStyleChromeLayout _backgroundCircleStyle](self, "_backgroundCircleStyle"));
    -[PXStoryChromeButtonConfiguration setTarget:](v8, "setTarget:", self);
    -[PXStoryChromeButtonConfiguration setAction:](v8, "setAction:", sel__handleMusicButton_);
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chromeButtonSpec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setSpec:](v8, "setSpec:", v15);

    -[PXStoryChromeButtonConfiguration setSystemImageName:](v8, "setSystemImageName:", CFSTR("music.badge.plus"));
    -[PXStoryChromeButtonConfiguration setApplyTintColorAsHierarchicalColor:](v8, "setApplyTintColorAsHierarchicalColor:", 1);
  }
  else if (self->_filterButtonSpriteIndex == a3)
  {
    v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v8, "setBackgroundStyle:", -[PXStoryStyleChromeLayout _backgroundCircleStyle](self, "_backgroundCircleStyle"));
    -[PXStoryChromeButtonConfiguration setTarget:](v8, "setTarget:", self);
    -[PXStoryChromeButtonConfiguration setAction:](v8, "setAction:", sel__handleFilterButton_);
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chromeButtonSpec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setSpec:](v8, "setSpec:", v17);

    -[PXStoryChromeButtonConfiguration setApplyTintColorAsHierarchicalColor:](v8, "setApplyTintColorAsHierarchicalColor:", 1);
    -[PXStoryChromeButtonConfiguration setSystemImageName:](v8, "setSystemImageName:", CFSTR("camera.filters"));
  }
  else
  {
    if (self->_customLabelSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleChromeLayout.m"), 446, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v8, "setBackgroundStyle:", 2);
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chromeButtonSpec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setSpec:](v8, "setSpec:", v19);

    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCustomStyleLabel"), CFSTR("PhotosUICore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setLabel:](v8, "setLabel:", v20);

  }
  return v8;
}

- (int64_t)_backgroundCircleStyle
{
  return 1;
}

- (id)axSpriteIndexes
{
  NSIndexSet *axSpriteIndexes;
  NSIndexSet *v4;
  NSIndexSet *v5;

  axSpriteIndexes = self->_axSpriteIndexes;
  if (!axSpriteIndexes)
  {
    v4 = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, self->_spriteCount);
    v5 = self->_axSpriteIndexes;
    self->_axSpriteIndexes = v4;

    axSpriteIndexes = self->_axSpriteIndexes;
  }
  return axSpriteIndexes;
}

- (id)axVisibleSpriteIndexes
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PXStoryStyleChromeLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode");

  if (v4 == 4)
  {
    -[PXStoryStyleChromeLayout axSpriteIndexes](self, "axSpriteIndexes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  }
  return v5;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  void *v3;
  _BOOL4 v4;

  -[PXStoryStyleChromeLayout viewModel](self, "viewModel", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode") == 4;

  return 2 * v4;
}

- (id)_actionPerformer
{
  void *v2;
  void *v3;

  -[PXStoryStyleChromeLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_invalidateStrings
{
  NSAttributedString *colorGradeNameAttributedString;
  NSAttributedString *titleAttributedString;
  NSAttributedString *subtitleAttributedString;

  colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  self->_colorGradeNameAttributedString = 0;

  titleAttributedString = self->_titleAttributedString;
  self->_titleAttributedString = 0;

  subtitleAttributedString = self->_subtitleAttributedString;
  self->_subtitleAttributedString = 0;

}

- (NSAttributedString)colorGradeNameAttributedString
{
  NSAttributedString *colorGradeNameAttributedString;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSAttributedString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSAttributedString *v15;
  NSAttributedString *v16;
  NSAttributedString *v17;

  colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  if (!colorGradeNameAttributedString)
  {
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleChromeLayout colorGradingRepository](self, "colorGradingRepository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleChromeLayout styleInfo](self, "styleInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitleForColorGradeKind:", objc_msgSend(v6, "customColorGradeKind"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "styleSwitcherDetailsLabelAttributesC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
      objc_msgSend(v4, "styleSwitcherColorGradeNameGlyphImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSAttributedString setImage:](v9, "setImage:", v10);

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      objc_msgSend(v12, "appendAttributedString:", v11);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v8);
      objc_msgSend(v12, "appendAttributedString:", v13);

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v8);
      objc_msgSend(v12, "appendAttributedString:", v14);

      v15 = (NSAttributedString *)objc_msgSend(v12, "copy");
      v16 = self->_colorGradeNameAttributedString;
      self->_colorGradeNameAttributedString = v15;

    }
    else
    {
      v17 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", &stru_1E5149688, v8);
      v9 = self->_colorGradeNameAttributedString;
      self->_colorGradeNameAttributedString = v17;
    }

    colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  }
  return colorGradeNameAttributedString;
}

- (NSAttributedString)titleAttributedString
{
  NSAttributedString *titleAttributedString;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  NSAttributedString *v14;
  NSAttributedString *v15;

  titleAttributedString = self->_titleAttributedString;
  if (!titleAttributedString)
  {
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleChromeLayout styleInfo](self, "styleInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "songResource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_storyResourceSongAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_1E5149688;
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v4, "styleSwitcherDetailsLabelAttributesA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSAttributedString *)objc_msgSend(v12, "initWithString:attributes:", v11, v13);

    v15 = self->_titleAttributedString;
    self->_titleAttributedString = v14;

    titleAttributedString = self->_titleAttributedString;
  }
  return titleAttributedString;
}

- (NSAttributedString)titleAccessoryAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSAttributedString *v10;
  NSAttributedString *titleAccessoryAttributedString;
  NSAttributedString *v12;

  -[PXStoryStyleChromeLayout styleInfo](self, "styleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "songResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_storyResourceSongAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_titleAccessoryAttributedString && (objc_msgSend(v5, "flags") & 1) != 0)
  {
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryExplicitLyricsIcon"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v6, "styleSwitcherDetailsLabelAttributesAAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSAttributedString *)objc_msgSend(v8, "initWithString:attributes:", v7, v9);
    titleAccessoryAttributedString = self->_titleAccessoryAttributedString;
    self->_titleAccessoryAttributedString = v10;

  }
  v12 = self->_titleAccessoryAttributedString;

  return v12;
}

- (NSAttributedString)subtitleAttributedString
{
  NSAttributedString *subtitleAttributedString;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  NSAttributedString *v14;
  NSAttributedString *v15;

  subtitleAttributedString = self->_subtitleAttributedString;
  if (!subtitleAttributedString)
  {
    -[PXStoryStyleChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleChromeLayout styleInfo](self, "styleInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "songResource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_storyResourceSongAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtitle");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_1E5149688;
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v4, "styleSwitcherDetailsLabelAttributesB");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSAttributedString *)objc_msgSend(v12, "initWithString:attributes:", v11, v13);

    v15 = self->_subtitleAttributedString;
    self->_subtitleAttributedString = v14;

    subtitleAttributedString = self->_subtitleAttributedString;
  }
  return subtitleAttributedString;
}

- (id)_styleSongAsset
{
  void *v2;
  void *v3;
  void *v4;

  -[PXStoryStyleChromeLayout styleInfo](self, "styleInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "songResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_storyResourceSongAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_handleMusicButton:(id)a3
{
  id v3;

  -[PXStoryStyleChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentMusicEditor");

}

- (void)_handleFilterButton:(id)a3
{
  id v3;

  -[PXStoryStyleChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentColorGradeEditor");

}

- (id)musicFeedbackContextMenuDelegate
{
  id musicFeedbackContextMenuDelegate;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;

  musicFeedbackContextMenuDelegate = self->_musicFeedbackContextMenuDelegate;
  if (!musicFeedbackContextMenuDelegate)
  {
    objc_initWeak(&location, self);
    -[PXStoryStyleChromeLayout viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionPerformer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PXStoryStyleChromeLayout_musicFeedbackContextMenuDelegate__block_invoke;
    v9[3] = &unk_1E513EC40;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "musicFeedbackContextMenuDelegateWithAudioAssetProvidingBlock:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_musicFeedbackContextMenuDelegate;
    self->_musicFeedbackContextMenuDelegate = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    musicFeedbackContextMenuDelegate = self->_musicFeedbackContextMenuDelegate;
  }
  return musicFeedbackContextMenuDelegate;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryStyleDescriptor)styleInfo
{
  return self->_styleInfo;
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  return self->_viewLayoutSpec;
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (unsigned)mediaVersion
{
  return self->_mediaVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_viewLayoutSpec, 0);
  objc_storeStrong((id *)&self->_styleInfo, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong(&self->_musicFeedbackContextMenuDelegate, 0);
  objc_storeStrong((id *)&self->_colorGradeNameAttributedString, 0);
  objc_storeStrong((id *)&self->_subtitleAttributedString, 0);
  objc_storeStrong((id *)&self->_titleAccessoryAttributedString, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

id __60__PXStoryStyleChromeLayout_musicFeedbackContextMenuDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_styleSongAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

float32x2_t __42__PXStoryStyleChromeLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double MinX;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  double v102;
  double v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  double v109;
  double v110;
  CGFloat v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  double v134;
  double v135;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  CGFloat v156;
  uint64_t v157;
  float v158;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v161;
  float64x2_t v162;
  _OWORD *v163;
  uint64_t v164;
  float v165;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  CGFloat v169;
  CGFloat v170;
  CGFloat v171;
  float64x2_t v172;
  _OWORD *v173;
  float v174;
  float v175;
  uint64_t v176;
  float v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  float64x2_t v181;
  _OWORD *v182;
  uint64_t v183;
  float v184;
  CGFloat v185;
  CGFloat v186;
  CGFloat v187;
  float64x2_t v188;
  _OWORD *v189;
  uint64_t v190;
  uint64_t v191;
  float v192;
  CGFloat v193;
  CGFloat v194;
  CGFloat v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  float64x2_t v199;
  _OWORD *v200;
  uint64_t v201;
  uint64_t v202;
  float v203;
  CGFloat v204;
  CGFloat v205;
  CGFloat v206;
  CGFloat v207;
  CGFloat v208;
  CGFloat v209;
  float64x2_t v210;
  _OWORD *v211;
  uint64_t v212;
  uint64_t v213;
  float v214;
  CGFloat v215;
  CGFloat v216;
  CGFloat v217;
  CGFloat v218;
  CGFloat v219;
  CGFloat v220;
  float64x2_t v221;
  _OWORD *v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  CGFloat v228;
  CGFloat v229;
  CGFloat v230;
  CGFloat v231;
  uint64_t v232;
  float v233;
  CGFloat v234;
  CGFloat v235;
  CGFloat v236;
  float64x2_t v237;
  _OWORD *v238;
  void *v239;
  int v240;
  float v241;
  float v242;
  uint64_t v243;
  float32x2_t result;
  void *v245;
  CGFloat v246;
  CGFloat v247;
  float64_t MinY;
  double v249;
  CGFloat v250;
  double v251;
  CGFloat v252;
  float64_t v253;
  CGFloat v254;
  CGFloat v255;
  CGFloat v256;
  CGFloat v257;
  CGFloat v258;
  CGFloat v259;
  CGFloat v260;
  CGFloat v261;
  CGFloat v262;
  CGFloat v263;
  CGFloat v264;
  CGFloat v265;
  CGFloat v266;
  CGFloat v267;
  CGFloat v268;
  CGFloat v269;
  CGFloat v270;
  CGFloat v271;
  CGFloat v272;
  CGFloat v273;
  CGFloat v274;
  CGFloat v275;
  double v276;
  double v277;
  double v278;
  double v279;
  CGFloat v280;
  CGFloat v281;
  __int128 v282;
  double rect;
  CGFloat recta;
  __int128 rectb;
  __int128 v286;
  double v287;
  double v288;
  __int128 v289;
  __int128 v290;
  CGFloat v291;
  CGFloat v292;
  __int128 v293;
  CGFloat v294;
  __int128 v295;
  CGFloat v296;
  __int128 v297;
  CGFloat v298;
  __int128 v299;
  CGFloat v300;
  __int128 v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;
  CGRect v324;
  CGRect v325;
  CGRect v326;
  CGRect v327;
  CGRect v328;
  CGRect v329;
  CGRect v330;
  CGRect v331;
  CGRect v332;
  CGRect v333;
  CGRect v334;
  CGRect v335;
  CGRect v336;
  CGRect v337;
  CGRect v338;
  CGRect v339;
  CGRect v340;
  CGRect v341;
  CGRect v342;
  CGRect v343;
  CGRect v344;
  CGRect v345;
  CGRect v346;
  CGRect v347;
  CGRect v348;
  CGRect v349;
  CGRect v350;
  CGRect v351;
  CGRect v352;
  CGRect v353;
  CGRect v354;

  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDetailsLabelAttributesA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDetailsLabelAttributesB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");
  v17 = v16;

  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDetailsLabelAttributesC");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lineHeight");
  v21 = v20;

  v22 = *(double *)(a1 + 48);
  v23 = *(double *)(a1 + 56);
  v24 = *(double *)(a1 + 64);
  v25 = *(double *)(a1 + 72);
  switch(objc_msgSend(*(id *)(a1 + 32), "styleSwitcherChromeArrangement"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("PXStoryStyleChromeLayout.m"), 226, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v287 = v23;
      v249 = v25;
      v251 = v22;
      rect = v24;
      v276 = v13 + v17 + v21;
      PXRectWithSizeAlignedToRectEdges();
      v300 = v26;
      v298 = v27;
      v296 = v28;
      v294 = v29;
      PXRectWithSizeAlignedToRectEdges();
      x = v302.origin.x;
      y = v302.origin.y;
      width = v302.size.width;
      height = v302.size.height;
      v34 = CGRectGetWidth(v302);
      objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDistanceBetweenEditButtons");
      v36 = -v35 - v34;
      v259 = y;
      v260 = x;
      v303.origin.x = x;
      v303.origin.y = y;
      v257 = height;
      v258 = width;
      v303.size.width = width;
      v303.size.height = height;
      v304 = CGRectOffset(v303, v36, 0.0);
      v37 = v304.origin.x;
      v38 = v304.origin.y;
      v39 = v304.size.width;
      v40 = v304.size.height;
      v304.origin.x = v300;
      v304.origin.y = v298;
      v304.size.width = v296;
      v304.size.height = v294;
      CGRectGetMaxX(v304);
      PXInsetRectWithValueForEdges();
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v254 = v39;
      v255 = v40;
      v253 = v38;
      v291 = v37;
      if (*(_BYTE *)(a1 + 170))
      {
        v48 = v41;
        v305.origin.x = v37;
        v305.origin.y = v38;
        v305.size.width = v39;
        v305.size.height = v40;
        MinX = CGRectGetMinX(v305);
        v306.origin.x = v43;
        v306.origin.y = v48;
        v306.size.width = v45;
        v306.size.height = v47;
        v45 = MinX - CGRectGetMinX(v306) - *(double *)(a1 + 104);
      }
      v307.origin.x = v300;
      v307.origin.y = v298;
      v307.size.width = v296;
      v307.size.height = v294;
      v50 = CGRectGetMidY(v307) + v276 * -0.5;
      v51 = CGRectGetMaxY(*(CGRect *)(a1 + 48)) - v276;
      if (v50 >= v51)
        v52 = v51;
      else
        v52 = v50;
      v308.origin.x = v43;
      v308.origin.y = v52;
      v308.size.width = v45;
      v308.size.height = v47;
      v53 = CGRectGetWidth(v308);
      PXRectWithSizeAlignedToRectEdgesWithPadding();
      v274 = v55;
      v275 = v54;
      v273 = v56;
      objc_msgSend(*(id *)(a1 + 40), "titleAttributedString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "size");
      v59 = v58;

      if (v53 >= v59)
        v60 = v59;
      else
        v60 = v53;
      v277 = v60;
      PXInsetRectWithValueForEdges();
      PXRectWithSizeAlignedToRectEdgesWithPadding();
      v266 = v62;
      v267 = v61;
      v265 = v63;
      objc_msgSend(*(id *)(a1 + 40), "subtitleAttributedString");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "size");
      v66 = v65;

      if (v53 >= v66)
        v67 = v66;
      else
        v67 = v53;
      v264 = v67;
      PXInsetRectWithValueForEdges();
      PXRectWithSizeAlignedToRectEdgesWithPadding();
      v271 = v69;
      v272 = v68;
      v70 = v277;
      v269 = v72;
      v270 = v71;
      v25 = v249;
      v22 = v251;
      v24 = rect;
      v23 = v287;
      break;
    case 2:
      v309.origin.x = v22;
      v309.origin.y = v23;
      v309.size.width = v24;
      v309.size.height = v25;
      v73 = CGRectGetWidth(v309);
      PXRectWithSizeAlignedToRectEdges();
      v271 = v75;
      v272 = v74;
      v269 = v77;
      v270 = v76;
      PXInsetRectWithValueForEdges();
      PXRectWithSizeAlignedToRectEdges();
      v266 = v79;
      v267 = v78;
      v264 = v80;
      v265 = v81;
      PXInsetRectWithValueForEdges();
      PXRectWithSizeAlignedToRectEdges();
      v274 = v83;
      v275 = v82;
      v273 = v84;
      objc_msgSend(*(id *)(a1 + 40), "titleAttributedString");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "size");
      v87 = v86;

      if (v73 >= v87)
        v88 = v87;
      else
        v88 = v73;
      v278 = v88;
      PXInsetRectWithValueForEdges();
      v22 = v89;
      v91 = v90;
      v25 = v92;
      v288 = v93;
      PXRectWithSizeAlignedToRectEdges();
      v300 = v94;
      v298 = v95;
      v296 = v96;
      v294 = v97;
      PXRectWithSizeAlignedToRectEdges();
      v98 = v310.origin.x;
      v99 = v310.origin.y;
      v100 = v310.size.width;
      v101 = v310.size.height;
      v102 = CGRectGetWidth(v310);
      objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDistanceBetweenEditButtons");
      v104 = -v103 - v102;
      v259 = v99;
      v260 = v98;
      v311.origin.x = v98;
      v24 = v91;
      v23 = v288;
      v311.origin.y = v99;
      v257 = v101;
      v258 = v100;
      v311.size.width = v100;
      v311.size.height = v101;
      v312 = CGRectOffset(v311, v104, 0.0);
      v291 = v312.origin.x;
      v253 = v312.origin.y;
      v254 = v312.size.width;
      v70 = v278;
      v255 = v312.size.height;
      break;
    case 3:
      recta = v24;
      PXRectWithSizeAlignedToRectEdges();
      v105 = v313.origin.x;
      v106 = v313.origin.y;
      v107 = v313.size.width;
      v108 = v313.size.height;
      v109 = CGRectGetWidth(v313);
      objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDistanceBetweenEditButtons");
      v111 = -v110 - v109;
      v314.origin.x = v105;
      v314.origin.y = v106;
      v314.size.width = v107;
      v314.size.height = v108;
      v315 = CGRectOffset(v314, v111, 0.0);
      if (*(_BYTE *)(a1 + 170))
      {
        v112 = CGRectGetMinX(v315);
        v316.origin.x = v22;
        v316.origin.y = v23;
        v316.size.width = recta;
        v316.size.height = v25;
        v113 = v112 - CGRectGetMinX(v316) - *(double *)(a1 + 104);
      }
      else
      {
        v113 = recta;
      }
      v317.origin.x = v22;
      v317.origin.y = v23;
      v317.size.width = v113;
      v317.size.height = v25;
      v114 = CGRectGetWidth(v317);
      PXRectWithSizeAlignedToRectEdges();
      v271 = v116;
      v272 = v115;
      v269 = v118;
      v270 = v117;
      PXInsetRectWithValueForEdges();
      PXRectWithSizeAlignedToRectEdges();
      v266 = v120;
      v267 = v119;
      v264 = v121;
      v265 = v122;
      PXInsetRectWithValueForEdges();
      PXRectWithSizeAlignedToRectEdges();
      v274 = v124;
      v275 = v123;
      v273 = v125;
      objc_msgSend(*(id *)(a1 + 40), "titleAttributedString");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "size");
      v128 = v127;

      if (v114 >= v128)
        v129 = v128;
      else
        v129 = v114;
      v279 = v129;
      PXRectWithSizeAlignedToRectEdges();
      v130 = v318.origin.x;
      v131 = v318.origin.y;
      v132 = v318.size.width;
      v133 = v318.size.height;
      v134 = CGRectGetWidth(v318);
      objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDistanceBetweenEditButtons");
      v136 = -v135 - v134;
      v259 = v131;
      v260 = v130;
      v319.origin.x = v130;
      v319.origin.y = v131;
      v257 = v133;
      v258 = v132;
      v319.size.width = v132;
      v319.size.height = v133;
      v320 = CGRectOffset(v319, v136, 0.0);
      v291 = v320.origin.x;
      v253 = v320.origin.y;
      v254 = v320.size.width;
      v255 = v320.size.height;
      PXInsetRectWithValueForEdges();
      v22 = v137;
      v23 = v138;
      v24 = v139;
      v25 = v140;
      PXRectWithSizeAlignedToRectEdges();
      v300 = v141;
      v298 = v142;
      v70 = v279;
      v296 = v143;
      v294 = v144;
      break;
    default:
      v254 = 0.0;
      v255 = 0.0;
      v253 = 0.0;
      v291 = 0.0;
      v257 = 0.0;
      v258 = 0.0;
      v259 = 0.0;
      v260 = 0.0;
      v294 = 0.0;
      v296 = 0.0;
      v298 = 0.0;
      v300 = 0.0;
      v264 = 0.0;
      v265 = 0.0;
      v266 = 0.0;
      v267 = 0.0;
      v273 = 0.0;
      v274 = 0.0;
      v70 = 0.0;
      v275 = 0.0;
      v269 = 0.0;
      v270 = 0.0;
      v271 = 0.0;
      v272 = 0.0;
      break;
  }
  v280 = v70;
  objc_msgSend(*(id *)(a1 + 40), "titleAccessoryAttributedString");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "size");
  v147 = v146;

  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherDetailsTitleAccessoryPadding");
  if (v147 <= 0.0)
  {
    MinY = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v250 = *MEMORY[0x1E0C9D648];
    v252 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v247 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v149 = v148;
    v321.origin.x = v22;
    v321.origin.y = v23;
    v321.size.width = v24;
    v321.size.height = v25;
    v150 = CGRectGetMaxX(v321) - v147;
    v322.origin.x = v275;
    v322.origin.y = v274;
    v322.size.width = v280;
    v322.size.height = v273;
    v151 = v149 + CGRectGetMaxX(v322);
    if (v150 >= v151)
      v150 = v151;
    v323.origin.x = v275;
    v323.origin.y = v274;
    v323.size.width = v280;
    v323.size.height = v273;
    MinY = CGRectGetMinY(v323);
    v324.origin.x = v275;
    v324.origin.y = v274;
    v324.size.width = v280;
    v324.size.height = v273;
    v247 = CGRectGetHeight(v324);
    v325.origin.x = v275;
    v325.origin.y = v274;
    v325.size.width = v280;
    v325.size.height = v273;
    v250 = v150;
    v252 = v147;
    if (CGRectGetMaxX(v325) - v150 - v149 > 0.0)
    {
      PXInsetRectWithValueForEdges();
      v274 = v153;
      v275 = v152;
      v280 = v154;
      v273 = v155;
    }
  }
  v156 = v291;
  v157 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872);
  v158 = *(double *)(a1 + 112);
  v326.origin.x = v300;
  v326.origin.y = v298;
  v326.size.width = v296;
  v326.size.height = v294;
  MidX = CGRectGetMidX(v326);
  v327.origin.x = v300;
  v327.origin.y = v298;
  v327.size.width = v296;
  v327.size.height = v294;
  MidY = CGRectGetMidY(v327);
  v328.origin.x = v300;
  v328.origin.y = v298;
  v328.size.width = v296;
  v328.size.height = v294;
  v292 = CGRectGetWidth(v328);
  v329.origin.x = v300;
  v329.origin.y = v298;
  v329.size.width = v296;
  v329.size.height = v294;
  v161 = CGRectGetHeight(v329);
  v162.f64[0] = v292;
  v162.f64[1] = v161;
  *(CGFloat *)v157 = MidX;
  *(CGFloat *)(v157 + 8) = MidY;
  *(double *)(v157 + 16) = v158;
  *(float32x2_t *)(v157 + 24) = vcvt_f32_f64(v162);
  v163 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872));
  v299 = *((_OWORD *)off_1E50B83A0 + 1);
  v301 = *(_OWORD *)off_1E50B83A0;
  *v163 = *(_OWORD *)off_1E50B83A0;
  v163[1] = v299;
  v295 = *((_OWORD *)off_1E50B83A0 + 4);
  v297 = *((_OWORD *)off_1E50B83A0 + 5);
  v163[4] = v295;
  v163[5] = v297;
  v290 = *((_OWORD *)off_1E50B83A0 + 2);
  v293 = *((_OWORD *)off_1E50B83A0 + 3);
  v163[2] = v290;
  v163[3] = v293;
  v286 = *((_OWORD *)off_1E50B83A0 + 8);
  v289 = *((_OWORD *)off_1E50B83A0 + 9);
  v163[8] = v286;
  v163[9] = v289;
  v282 = *((_OWORD *)off_1E50B83A0 + 6);
  rectb = *((_OWORD *)off_1E50B83A0 + 7);
  v163[6] = v282;
  v163[7] = rectb;
  v162.f64[0] = *(float64_t *)(a1 + 112);
  *(float *)&v161 = *(double *)(a1 + 120);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872)) = LODWORD(v161);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872) + 1) = 10;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872) + 32) = *(_WORD *)(a1 + 168);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872)) = 1;
  v164 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 896);
  v165 = v162.f64[0];
  v166 = v156;
  v162.f64[0] = v253;
  v167 = v254;
  v168 = v255;
  v169 = CGRectGetMidX(*(CGRect *)((char *)&v162 - 8));
  v330.origin.x = v156;
  v330.origin.y = v253;
  v330.size.width = v254;
  v330.size.height = v255;
  v170 = CGRectGetMidY(v330);
  v331.origin.x = v156;
  v331.origin.y = v253;
  v331.size.width = v254;
  v331.size.height = v255;
  v246 = CGRectGetWidth(v331);
  v332.origin.x = v156;
  v332.origin.y = v253;
  v332.size.width = v254;
  v332.size.height = v255;
  v171 = CGRectGetHeight(v332);
  v172.f64[0] = v246;
  v172.f64[1] = v171;
  *(CGFloat *)v164 = v169;
  *(CGFloat *)(v164 + 8) = v170;
  *(double *)(v164 + 16) = v165;
  *(float32x2_t *)(v164 + 24) = vcvt_f32_f64(v172);
  v173 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 896));
  *v173 = v301;
  v173[1] = v299;
  v173[4] = v295;
  v173[5] = v297;
  v173[2] = v290;
  v173[3] = v293;
  v173[8] = v286;
  v173[9] = v289;
  v173[6] = v282;
  v173[7] = rectb;
  v174 = 0.0;
  v175 = 0.0;
  if (*(_BYTE *)(a1 + 170))
    v175 = *(double *)(a1 + 120);
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 896)) = v175;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 896) + 1) = 10;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 896) + 32) = *(_WORD *)(a1 + 168);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 896)) = 1;
  v176 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 892);
  v177 = *(double *)(a1 + 112);
  v333.origin.x = v260;
  v333.origin.y = v259;
  v333.size.width = v258;
  v333.size.height = v257;
  v178 = CGRectGetMidX(v333);
  v334.origin.x = v260;
  v334.origin.y = v259;
  v334.size.width = v258;
  v334.size.height = v257;
  v179 = CGRectGetMidY(v334);
  v335.origin.x = v260;
  v335.origin.y = v259;
  v335.size.width = v258;
  v335.size.height = v257;
  v256 = CGRectGetWidth(v335);
  v336.origin.x = v260;
  v336.origin.y = v259;
  v336.size.width = v258;
  v336.size.height = v257;
  v180 = CGRectGetHeight(v336);
  v181.f64[0] = v256;
  v181.f64[1] = v180;
  *(CGFloat *)v176 = v178;
  *(CGFloat *)(v176 + 8) = v179;
  *(double *)(v176 + 16) = v177;
  *(float32x2_t *)(v176 + 24) = vcvt_f32_f64(v181);
  v182 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 892));
  *v182 = v301;
  v182[1] = v299;
  v182[4] = v295;
  v182[5] = v297;
  v182[2] = v290;
  v182[3] = v293;
  v182[8] = v286;
  v182[9] = v289;
  v182[6] = v282;
  v182[7] = rectb;
  if (*(_BYTE *)(a1 + 170))
    v174 = *(double *)(a1 + 120);
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 892)) = v174;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 892) + 1) = 10;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 892) + 32) = *(_WORD *)(a1 + 168);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 892)) = 1;
  v183 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876);
  v184 = *(double *)(a1 + 112);
  v337.origin.x = v275;
  v337.origin.y = v274;
  v337.size.width = v280;
  v337.size.height = v273;
  v185 = CGRectGetMidX(v337);
  v338.origin.x = v275;
  v338.origin.y = v274;
  v338.size.width = v280;
  v338.size.height = v273;
  v186 = CGRectGetMidY(v338);
  v339.origin.x = v275;
  v339.origin.y = v274;
  v339.size.width = v280;
  v339.size.height = v273;
  v261 = CGRectGetWidth(v339);
  v340.origin.x = v275;
  v340.origin.y = v274;
  v340.size.width = v280;
  v340.size.height = v273;
  v187 = CGRectGetHeight(v340);
  v188.f64[0] = v261;
  v188.f64[1] = v187;
  *(CGFloat *)v183 = v185;
  *(CGFloat *)(v183 + 8) = v186;
  *(double *)(v183 + 16) = v184;
  *(float32x2_t *)(v183 + 24) = vcvt_f32_f64(v188);
  v189 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876));
  v189[6] = v282;
  v189[7] = rectb;
  v189[8] = v286;
  v189[9] = v289;
  v189[2] = v290;
  v189[3] = v293;
  v189[4] = v295;
  v189[5] = v297;
  *v189 = v301;
  v189[1] = v299;
  v188.f64[0] = *(float64_t *)(a1 + 128);
  *(float *)&v187 = *(double *)(a1 + 120);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876)) = LODWORD(v187);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876) + 1) = 3;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876) + 32) = *(_WORD *)(a1 + 168);
  *(float *)&v187 = v188.f64[0];
  v190 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876);
  *(float32x2_t *)(a5 + 40 * v190 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v190 + 24), *(float *)&v187);
  v191 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880);
  v192 = *(double *)(a1 + 112);
  v193 = v250;
  v188.f64[0] = MinY;
  v194 = v252;
  v195 = v247;
  v196 = CGRectGetMidX(*(CGRect *)((char *)&v188 - 8));
  v341.origin.x = v250;
  v341.origin.y = MinY;
  v341.size.width = v252;
  v341.size.height = v247;
  v197 = CGRectGetMidY(v341);
  v342.origin.x = v250;
  v342.origin.y = MinY;
  v342.size.width = v252;
  v342.size.height = v247;
  v262 = CGRectGetWidth(v342);
  v343.origin.x = v250;
  v343.origin.y = MinY;
  v343.size.width = v252;
  v343.size.height = v247;
  v198 = CGRectGetHeight(v343);
  v199.f64[0] = v262;
  v199.f64[1] = v198;
  *(CGFloat *)v191 = v196;
  *(CGFloat *)(v191 + 8) = v197;
  *(double *)(v191 + 16) = v192;
  *(float32x2_t *)(v191 + 24) = vcvt_f32_f64(v199);
  v200 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880));
  v200[6] = v282;
  v200[7] = rectb;
  v200[8] = v286;
  v200[9] = v289;
  v200[2] = v290;
  v200[3] = v293;
  v200[4] = v295;
  v200[5] = v297;
  *v200 = v301;
  v200[1] = v299;
  v199.f64[0] = *(float64_t *)(a1 + 128);
  *(float *)&v198 = *(double *)(a1 + 120);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880)) = LODWORD(v198);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880) + 1) = 3;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880) + 32) = *(_WORD *)(a1 + 168);
  *(float *)&v198 = v199.f64[0];
  v201 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880);
  *(float32x2_t *)(a5 + 40 * v201 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v201 + 24), *(float *)&v198);
  v202 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 884);
  v203 = *(double *)(a1 + 112);
  v204 = v267;
  v199.f64[0] = v266;
  v205 = v264;
  v206 = v265;
  v207 = CGRectGetMidX(*(CGRect *)((char *)&v199 - 8));
  v344.origin.x = v267;
  v344.origin.y = v266;
  v344.size.width = v264;
  v344.size.height = v265;
  v208 = CGRectGetMidY(v344);
  v345.origin.x = v267;
  v345.origin.y = v266;
  v345.size.width = v264;
  v345.size.height = v265;
  v263 = CGRectGetWidth(v345);
  v346.origin.x = v267;
  v346.origin.y = v266;
  v346.size.width = v264;
  v346.size.height = v265;
  v209 = CGRectGetHeight(v346);
  v210.f64[0] = v263;
  v210.f64[1] = v209;
  *(CGFloat *)v202 = v207;
  *(CGFloat *)(v202 + 8) = v208;
  *(double *)(v202 + 16) = v203;
  *(float32x2_t *)(v202 + 24) = vcvt_f32_f64(v210);
  v211 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 884));
  v211[6] = v282;
  v211[7] = rectb;
  v211[8] = v286;
  v211[9] = v289;
  v211[2] = v290;
  v211[3] = v293;
  v211[4] = v295;
  v211[5] = v297;
  *v211 = v301;
  v211[1] = v299;
  v210.f64[0] = *(float64_t *)(a1 + 128);
  *(float *)&v209 = *(double *)(a1 + 120);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 884)) = LODWORD(v209);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 884) + 1) = 3;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 884) + 32) = *(_WORD *)(a1 + 168);
  *(float *)&v209 = v210.f64[0];
  v212 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 884);
  *(float32x2_t *)(a5 + 40 * v212 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v212 + 24), *(float *)&v209);
  v213 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 888);
  v214 = *(double *)(a1 + 112);
  v215 = v272;
  v210.f64[0] = v271;
  v216 = v270;
  v217 = v269;
  v218 = CGRectGetMidX(*(CGRect *)((char *)&v210 - 8));
  v347.origin.x = v272;
  v347.origin.y = v271;
  v347.size.width = v270;
  v347.size.height = v269;
  v219 = CGRectGetMidY(v347);
  v348.origin.x = v272;
  v348.origin.y = v271;
  v348.size.width = v270;
  v348.size.height = v269;
  v268 = CGRectGetWidth(v348);
  v349.origin.x = v272;
  v349.origin.y = v271;
  v349.size.width = v270;
  v349.size.height = v269;
  v220 = CGRectGetHeight(v349);
  v221.f64[0] = v268;
  v221.f64[1] = v220;
  *(CGFloat *)v213 = v218;
  *(CGFloat *)(v213 + 8) = v219;
  *(double *)(v213 + 16) = v214;
  *(float32x2_t *)(v213 + 24) = vcvt_f32_f64(v221);
  v222 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 888));
  v222[6] = v282;
  v222[7] = rectb;
  v222[8] = v286;
  v222[9] = v289;
  v222[2] = v290;
  v222[3] = v293;
  v222[4] = v295;
  v222[5] = v297;
  *v222 = v301;
  v222[1] = v299;
  v221.f64[0] = *(float64_t *)(a1 + 128);
  *(float *)&v220 = *(double *)(a1 + 120);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 888)) = LODWORD(v220);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 888) + 1) = 3;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 888) + 32) = *(_WORD *)(a1 + 168);
  *(float *)&v220 = v221.f64[0];
  v223 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 888);
  *(float32x2_t *)(a5 + 40 * v223 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v223 + 24), *(float *)&v220);
  objc_msgSend(*(id *)(a1 + 40), "viewUserDataForSpriteAtIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 900), *(_QWORD *)(a1 + 40));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v224);

  objc_msgSend(*(id *)(a1 + 40), "viewModel");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "mainModel");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "layoutSpec");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "styleSwitcherViewportInset");

  CGRectGetMaxY(*(CGRect *)(a1 + 136));
  v350.origin.y = v274;
  v350.origin.x = v275;
  v350.size.width = v280;
  v350.size.height = v273;
  CGRectGetMinY(v350);
  PXRectWithSizeAlignedToRectEdgesWithPadding();
  v228 = v351.origin.x;
  v229 = v351.origin.y;
  v230 = v351.size.width;
  v231 = v351.size.height;
  v232 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 900);
  v233 = *(double *)(a1 + 112);
  v234 = CGRectGetMidX(v351);
  v352.origin.x = v228;
  v352.origin.y = v229;
  v352.size.width = v230;
  v352.size.height = v231;
  v235 = CGRectGetMidY(v352);
  v353.origin.x = v228;
  v353.origin.y = v229;
  v353.size.width = v230;
  v353.size.height = v231;
  v281 = CGRectGetWidth(v353);
  v354.origin.x = v228;
  v354.origin.y = v229;
  v354.size.width = v230;
  v354.size.height = v231;
  v236 = CGRectGetHeight(v354);
  v237.f64[0] = v281;
  v237.f64[1] = v236;
  *(CGFloat *)v232 = v234;
  *(CGFloat *)(v232 + 8) = v235;
  *(double *)(v232 + 16) = v233;
  *(float32x2_t *)(v232 + 24) = vcvt_f32_f64(v237);
  v238 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 900));
  v238[6] = v282;
  v238[7] = rectb;
  v238[8] = v286;
  v238[9] = v289;
  v238[2] = v290;
  v238[3] = v293;
  v238[4] = v295;
  v238[5] = v297;
  *v238 = v301;
  v238[1] = v299;
  objc_msgSend(*(id *)(a1 + 40), "styleInfo");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = objc_msgSend(v239, "isCustomized");
  v241 = 0.0;
  if (v240)
    v241 = *(double *)(a1 + 120);
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 900)) = v241;

  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 900) + 1) = 10;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 900) + 32) = *(_WORD *)(a1 + 168);
  v242 = *(double *)(a1 + 128);
  v243 = *(_QWORD *)(a1 + 40);
  result = vmul_n_f32(*(float32x2_t *)(a3 + 32 * *(unsigned int *)(v243 + 888) + 24), v242);
  *(float32x2_t *)(a5 + 40 * *(unsigned int *)(v243 + 900) + 8) = result;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 900)) = 1;
  return result;
}

+ (void)startCachingResourcesForStyleInfo:(id)a3 viewLayoutSpec:(id)a4 displayScale:(double)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "songResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_storyResourceSongAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkDisplayAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(off_1E50B3348, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageProviderForAsset:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chromeButtonSize");
    PXSizeScale();
    objc_msgSend(v11, "startCachingImagesForAssets:targetSize:contentMode:options:", v12, 1, 0);

  }
}

+ (void)stopCachingResourcesForStyleInfo:(id)a3 viewLayoutSpec:(id)a4 displayScale:(double)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "songResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_storyResourceSongAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkDisplayAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(off_1E50B3348, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageProviderForAsset:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chromeButtonSize");
    PXSizeScale();
    objc_msgSend(v11, "stopCachingImagesForAssets:targetSize:contentMode:options:", v12, 1, 0);

  }
}

@end
