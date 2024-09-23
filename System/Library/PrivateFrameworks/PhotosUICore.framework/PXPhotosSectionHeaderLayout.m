@implementation PXPhotosSectionHeaderLayout

- (PXPhotosSectionHeaderLayout)initWithSpec:(id)a3
{
  id v5;
  PXPhotosSectionHeaderLayout *v6;
  PXPhotosSectionHeaderLayout *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  NSIndexSet *axSpriteIndexes;
  CGSize v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosSectionHeaderLayout;
  v6 = -[PXGLayout init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PXGLayout setContentSource:](v6, "setContentSource:", v6);
    objc_storeStrong((id *)&v7->_spec, a3);
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    LODWORD(v10) = 1.0;
    LODWORD(v11) = 0;
    v7->_gradientResizableCapInsetsIndex = -[PXGLayout addResizableCapInsets:](v7, "addResizableCapInsets:", v8, v9, v10, v11);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 10);
    axSpriteIndexes = v7->_axSpriteIndexes;
    v7->_axSpriteIndexes = (NSIndexSet *)v12;

    v14 = *(CGSize *)off_1E50B8810;
    v7->_finalTitleSize = *(CGSize *)off_1E50B8810;
    v7->_subtitleSize = v14;
    v7->_badgeSize = v14;
    v7->_buttonTitleSize = v14;
    -[PXPhotosSectionHeaderLayout _invalidateAttributes](v7, "_invalidateAttributes");
    -[PXPhotosSectionHeaderLayout _invalidateContent](v7, "_invalidateContent");
    v7->_relativeOffsetAlpha = 1.0;
    -[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha](v7, "_invalidateSpritesAlpha");
  }

  return v7;
}

- (PXPhotosSectionHeaderLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderLayout.m"), 119, CFSTR("%s is not available as initializer"), "-[PXPhotosSectionHeaderLayout init]");

  abort();
}

- (void)setAssetCollectionReference:(id)a3
{
  PXAssetCollectionReference *v5;
  char v6;
  PXAssetCollectionReference *v7;

  v7 = (PXAssetCollectionReference *)a3;
  v5 = self->_assetCollectionReference;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXAssetCollectionReference isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetCollectionReference, a3);
      -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
      -[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha](self, "_invalidateSpritesAlpha");
    }
  }

}

- (BOOL)allowsInteraction
{
  return -[PXPhotosSectionHeaderLayout wantsChevron](self, "wantsChevron")
      || -[PXPhotosSectionHeaderLayout wantsButton](self, "wantsButton");
}

- (BOOL)wantsChevron
{
  void *v3;
  _BOOL4 v4;

  -[PXPhotosSectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[PXPhotosSectionHeaderLayout wantsButton](self, "wantsButton");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)wantsButton
{
  void *v2;
  BOOL v3;

  -[PXPhotosSectionHeaderLayout buttonTitle](self, "buttonTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)setSpec:(id)a3
{
  PXPhotosLayoutSpec *v5;
  char v6;
  PXPhotosLayoutSpec *v7;

  v7 = (PXPhotosLayoutSpec *)a3;
  v5 = self->_spec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXPhotosLayoutSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      -[PXPhotosSectionHeaderLayout _invalidateAttributes](self, "_invalidateAttributes");
      -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
      -[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha](self, "_invalidateSpritesAlpha");
    }
  }

}

- (PXPhotosLayoutSpec)spec
{
  PXPhotosLayoutSpec *spec;
  void *v6;

  spec = self->_spec;
  if (!spec)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderLayout.m"), 158, CFSTR("Must be non-null"));

    spec = self->_spec;
  }
  return spec;
}

- (void)setDividerColor:(id)a3
{
  UIColor *v5;
  char v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = self->_dividerColor;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIColor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dividerColor, a3);
      -[PXPhotosSectionHeaderLayout _invalidateDividerMediaVersion](self, "_invalidateDividerMediaVersion");
    }
  }

}

- (void)setFinalTitleAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *finalTitleAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_finalTitleAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      finalTitleAttributes = self->_finalTitleAttributes;
      self->_finalTitleAttributes = v6;

      -[PXPhotosSectionHeaderLayout _invalidateFinalTitleMediaVersion](self, "_invalidateFinalTitleMediaVersion");
    }
  }

}

- (void)setFinalTitleLightGradientAttributess:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *finalTitleLightGradientAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_finalTitleLightGradientAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      finalTitleLightGradientAttributes = self->_finalTitleLightGradientAttributes;
      self->_finalTitleLightGradientAttributes = v6;

      -[PXPhotosSectionHeaderLayout _invalidateFinalTitleMediaVersion](self, "_invalidateFinalTitleMediaVersion");
    }
  }

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXPhotosSectionHeaderLayout _invalidateFinalTitle](self, "_invalidateFinalTitle");
    }
  }

}

- (void)setFinalTitle:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;

  v7 = (NSString *)a3;
  v5 = self->_finalTitle;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSString isEqualToString:](v7, "isEqualToString:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_finalTitle, a3);
      -[PXPhotosSectionHeaderLayout _invalidateFinalTitleMediaVersion](self, "_invalidateFinalTitleMediaVersion");
    }
  }

}

- (void)setSubtitleAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *subtitleAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_subtitleAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      subtitleAttributes = self->_subtitleAttributes;
      self->_subtitleAttributes = v6;

      -[PXPhotosSectionHeaderLayout _invalidateSubtitleMediaVersion](self, "_invalidateSubtitleMediaVersion");
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v6;

      -[PXPhotosSectionHeaderLayout _invalidateSubtitleMediaVersion](self, "_invalidateSubtitleMediaVersion");
    }
  }

}

- (void)setIsBadgeVisible:(BOOL)a3
{
  if (self->_isBadgeVisible != a3)
  {
    self->_isBadgeVisible = a3;
    -[PXPhotosSectionHeaderLayout _invalidateFinalTitle](self, "_invalidateFinalTitle");
    -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
    -[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha](self, "_invalidateSpritesAlpha");
  }
}

- (void)setBadgeTitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *badgeTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_badgeTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      badgeTitle = self->_badgeTitle;
      self->_badgeTitle = v6;

      -[PXPhotosSectionHeaderLayout _invalidateFinalTitle](self, "_invalidateFinalTitle");
      -[PXPhotosSectionHeaderLayout _invalidateBadgeMediaVersion](self, "_invalidateBadgeMediaVersion");
    }
  }

}

- (void)setButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *buttonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_buttonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      buttonTitle = self->_buttonTitle;
      self->_buttonTitle = v6;

      -[PXPhotosSectionHeaderLayout _invalidateButtonTitleMediaVersion](self, "_invalidateButtonTitleMediaVersion");
    }
  }

}

- (void)setBadgeAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *badgeAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_badgeAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      badgeAttributes = self->_badgeAttributes;
      self->_badgeAttributes = v6;

      -[PXPhotosSectionHeaderLayout _invalidateBadgeMediaVersion](self, "_invalidateBadgeMediaVersion");
    }
  }

}

- (void)setButtonTitleAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *buttonTitleAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_buttonTitleAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      buttonTitleAttributes = self->_buttonTitleAttributes;
      self->_buttonTitleAttributes = v6;

      -[PXPhotosSectionHeaderLayout _invalidateButtonTitleMediaVersion](self, "_invalidateButtonTitleMediaVersion");
    }
  }

}

- (void)setFilterButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *filterButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_filterButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      filterButtonTitle = self->_filterButtonTitle;
      self->_filterButtonTitle = v6;

      -[PXPhotosSectionHeaderLayout _invalidateFilterUI](self, "_invalidateFilterUI");
    }
  }

}

- (void)setFilterButtonCaption:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *filterButtonCaption;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_filterButtonCaption;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      filterButtonCaption = self->_filterButtonCaption;
      self->_filterButtonCaption = v6;

      -[PXPhotosSectionHeaderLayout _invalidateFilterUI](self, "_invalidateFilterUI");
    }
  }

}

- (void)setFilterButtonHighlighting:(BOOL)a3
{
  if (self->_filterButtonHighlighting != a3)
  {
    self->_filterButtonHighlighting = a3;
    -[PXPhotosSectionHeaderLayout _invalidateFilterUI](self, "_invalidateFilterUI");
  }
}

- (void)setFilterActionHandler:(id)a3
{
  void *v4;
  id filterActionHandler;

  if (self->_filterActionHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    filterActionHandler = self->_filterActionHandler;
    self->_filterActionHandler = v4;

    -[PXPhotosSectionHeaderLayout _invalidateFilterUI](self, "_invalidateFilterUI");
  }
}

- (void)setShowLegibilityGradient:(BOOL)a3
{
  if (self->_showLegibilityGradient != a3)
  {
    self->_showLegibilityGradient = a3;
    -[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha](self, "_invalidateSpritesAlpha");
  }
}

- (void)_handleFilterAction
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  -[PXPhotosSectionHeaderLayout filterActionHandler](self, "filterActionHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    ((void (**)(_QWORD, PXPhotosSectionHeaderLayout *))v3)[2](v3, self);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (PXGSpriteReference)filterButtonReference
{
  return (PXGSpriteReference *)-[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", 8);
}

- (CGSize)finalTitleSize
{
  CGSize *p_finalTitleSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  double width;
  double height;
  CGSize result;

  p_finalTitleSize = &self->_finalTitleSize;
  if (PXSizeIsNull())
  {
    -[PXPhotosSectionHeaderLayout finalTitle](self, "finalTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout referenceSize](self, "referenceSize");
    v6 = v5;
    v8 = v7;
    -[PXPhotosSectionHeaderLayout finalTitleAttributes](self, "finalTitleAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v9, 0, v6, v8);
    p_finalTitleSize->width = v10;
    p_finalTitleSize->height = v11;

  }
  width = p_finalTitleSize->width;
  height = p_finalTitleSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)subtitleSize
{
  CGSize *p_subtitleSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  double width;
  double height;
  CGSize result;

  p_subtitleSize = &self->_subtitleSize;
  if (PXSizeIsNull())
  {
    -[PXPhotosSectionHeaderLayout subtitle](self, "subtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout referenceSize](self, "referenceSize");
    v6 = v5;
    v8 = v7;
    -[PXPhotosSectionHeaderLayout subtitleAttributes](self, "subtitleAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v9, 0, v6, v8);
    p_subtitleSize->width = v10;
    p_subtitleSize->height = v11;

  }
  width = p_subtitleSize->width;
  height = p_subtitleSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)badgeSize
{
  CGSize *p_badgeSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  double width;
  double height;
  CGSize result;

  p_badgeSize = &self->_badgeSize;
  if (PXSizeIsNull())
  {
    -[PXPhotosSectionHeaderLayout badgeTitle](self, "badgeTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout referenceSize](self, "referenceSize");
    v6 = v5;
    v8 = v7;
    -[PXPhotosSectionHeaderLayout badgeAttributes](self, "badgeAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v9, 0, v6, v8);
    p_badgeSize->width = v10;
    p_badgeSize->height = v11;

  }
  width = p_badgeSize->width;
  height = p_badgeSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)buttonTitleSize
{
  CGSize *p_buttonTitleSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  double width;
  double height;
  CGSize result;

  p_buttonTitleSize = &self->_buttonTitleSize;
  if (PXSizeIsNull())
  {
    -[PXPhotosSectionHeaderLayout buttonTitle](self, "buttonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout referenceSize](self, "referenceSize");
    v6 = v5;
    v8 = v7;
    -[PXPhotosSectionHeaderLayout buttonTitleAttributes](self, "buttonTitleAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v9, 0, v6, v8);
    p_buttonTitleSize->width = v10;
    p_buttonTitleSize->height = v11;

  }
  width = p_buttonTitleSize->width;
  height = p_buttonTitleSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  PXGHitTestResult *v10;

  v3 = *(_QWORD *)&a3;
  if (-[PXPhotosSectionHeaderLayout allowsInteraction](self, "allowsInteraction")
    && (_DWORD)v3
    && ((_DWORD)v3 == 7 || -[PXPhotosSectionHeaderLayout wantsChevron](self, "wantsChevron")))
  {
    v5 = CFSTR("PXPhotosLayoutHitTestIdentifierSectionHeader");
    if ((_DWORD)v3 == 7)
      v5 = CFSTR("PXPhotosLayoutHitTestIdentifierSectionHeaderButton");
    v6 = v5;
    -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:]([PXGHitTestResult alloc], "initWithSpriteReference:layout:identifier:userData:", v7, self, v6, v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)setRelativeOffsetAlpha:(double)a3
{
  if (self->_relativeOffsetAlpha != a3)
  {
    self->_relativeOffsetAlpha = a3;
    -[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha](self, "_invalidateSpritesAlpha");
  }
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXPhotosSectionHeaderLayout _invalidateRelativeOffsetAlpha](self, "_invalidateRelativeOffsetAlpha");
}

- (void)contentSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout contentSizeDidChange](&v3, sel_contentSizeDidChange);
  -[PXPhotosSectionHeaderLayout _invalidateRelativeOffsetAlpha](self, "_invalidateRelativeOffsetAlpha");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PXPhotosSectionHeaderLayout _invalidateRelativeOffsetAlpha](self, "_invalidateRelativeOffsetAlpha");
}

- (void)floatingOffsetDidChange
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout floatingOffsetDidChange](&v4, sel_floatingOffsetDidChange);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PXPhotosSectionHeaderLayout_floatingOffsetDidChange__block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXGLayout performChangesWithLocalUpdate:](self, "performChangesWithLocalUpdate:", v3);
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosSectionHeaderLayout.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
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
  objc_super v21;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXPhotosSectionHeaderLayout.m"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXPhotosSectionHeaderLayout _updateFinalTitle](self, "_updateFinalTitle");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout update]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXPhotosSectionHeaderLayout.m"), 410, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXPhotosSectionHeaderLayout _updateAttributes](self, "_updateAttributes");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXPhotosSectionHeaderLayout.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXPhotosSectionHeaderLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXPhotosSectionHeaderLayout.m"), 416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXPhotosSectionHeaderLayout _updateRelativeOffsetAlpha](self, "_updateRelativeOffsetAlpha");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPhotosSectionHeaderLayout.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXPhotosSectionHeaderLayout _updateSpritesAlpha](self, "_updateSpritesAlpha");
      v8 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXPhotosSectionHeaderLayout.m"), 422, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout update](&v21, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosSectionHeaderLayout.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateFinalTitle
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

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
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout _invalidateFinalTitle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionHeaderLayout.m"), 432, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_invalidateFilterUI
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_filterButtonVersion;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout _invalidateFilterUI]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionHeaderLayout.m"), 437, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateFinalTitle
{
  void *v3;
  id v4;
  id v5;
  id v6;

  -[PXPhotosSectionHeaderLayout title](self, "title");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXPhotosSectionHeaderLayout isBadgeVisible](self, "isBadgeVisible") && objc_msgSend(v6, "length"))
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotosGridsSectionHeaderBadgeSeparator"), CFSTR("PhotosUICore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    PXStringWithValidatedFormat();
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v6;
  }
  -[PXPhotosSectionHeaderLayout setFinalTitle:](self, "setFinalTitle:", v4, v5);

}

- (void)_invalidateAttributes
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout _invalidateAttributes]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionHeaderLayout.m"), 452, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  -[PXPhotosSectionHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dividerColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderLayout setDividerColor:](self, "setDividerColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setLineBreakMode:", 4);
  v34 = *MEMORY[0x1E0DC1138];
  v8 = v34;
  objc_msgSend(v4, "titleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v9;
  v35 = *MEMORY[0x1E0DC1140];
  v10 = v35;
  objc_msgSend(v4, "titleColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x1E0DC1178];
  v12 = v36;
  v37[1] = v11;
  v37[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v34, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderLayout setFinalTitleAttributes:](self, "setFinalTitleAttributes:", v13);

  v32[0] = v8;
  objc_msgSend(v4, "titleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v14;
  v32[1] = v10;
  objc_msgSend(v4, "gradientTitleColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v12;
  v33[1] = v15;
  v33[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderLayout setFinalTitleLightGradientAttributes:](self, "setFinalTitleLightGradientAttributes:", v16);

  v30[0] = v8;
  objc_msgSend(v4, "subtitleFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v17;
  v30[1] = v10;
  objc_msgSend(v4, "subtitleColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v12;
  v31[1] = v18;
  v31[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderLayout setSubtitleAttributes:](self, "setSubtitleAttributes:", v19);

  v28[0] = v8;
  objc_msgSend(v4, "badgeFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  v28[1] = v10;
  objc_msgSend(v4, "badgeColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v12;
  v29[1] = v21;
  v29[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderLayout setBadgeAttributes:](self, "setBadgeAttributes:", v22);

  objc_msgSend(v4, "buttonFont", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = v10;
  objc_msgSend(v4, "buttonColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v12;
  v27[1] = v24;
  v27[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderLayout setButtonTitleAttributes:](self, "setButtonTitleAttributes:", v25);

}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionHeaderLayout.m"), 479, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContent
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  float v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  CGFloat v74;
  CGFloat MaxY;
  CGFloat v76;
  double v77;
  double v78;
  CGFloat v79;
  CGFloat x;
  CGFloat v81;
  CGFloat width;
  CGFloat height;
  double v84;
  int v85;
  double v86;
  double v87;
  double v88;
  CGFloat v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  id v96;
  CGFloat v97;
  CGFloat v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  uint64_t v103;
  double v104;
  CGFloat y;
  double v106;
  double v107;
  CGFloat v108;
  float v109;
  double v110;
  double v111;
  CGFloat rect;
  double v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat MaxX;
  CGFloat v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  id v123;
  double v124;
  CGFloat v125;
  double v126;
  double v127;
  CGFloat v128;
  double v129;
  double v130;
  CGFloat v131;
  CGFloat v132;
  _QWORD v133[4];
  id v134;
  PXPhotosSectionHeaderLayout *v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  uint64_t v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  CGFloat v153;
  double v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  double v158;
  double v159;
  CGFloat v160;
  CGFloat v161;
  CGFloat v162;
  CGFloat v163;
  double v164;
  double v165;
  uint64_t v166;
  double v167;
  double v168;
  double v169;
  float v170;
  BOOL v171;
  BOOL v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;

  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") != 10)
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, 10, 0, 0);
  v3 = -[PXPhotosSectionHeaderLayout wantsButton](self, "wantsButton");
  -[PXPhotosSectionHeaderLayout spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionHeaderSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "minimumHeaderContentHeight");
  v113 = v6;
  objc_msgSend(v5, "titleHorizontalInset");
  v8 = v7;
  -[PXPhotosSectionHeaderLayout subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v11 = 0.0;
  v12 = 0.0;
  if (v10)
    objc_msgSend(v5, "titleSubtitleHorizontalSpacing", 0.0);
  v118 = v12;

  objc_msgSend(v5, "dividerBaselineToTextBaselineSpacing");
  v130 = v13;
  if (-[PXPhotosSectionHeaderLayout wantsChevron](self, "wantsChevron"))
  {
    objc_msgSend(v5, "chevronSpacing");
    v11 = v14;
  }
  v15 = -[PXPhotosSectionHeaderLayout wantsChevron](self, "wantsChevron");
  v16 = (double *)MEMORY[0x1E0C9D820];
  if (v15)
  {
    objc_msgSend(v5, "chevronSize");
    v129 = v17;
    v124 = v18;
    if (!v3)
    {
LABEL_9:
      v19 = *v16;
      v121 = v16[1];
      v126 = 0.0;
      goto LABEL_12;
    }
  }
  else
  {
    v129 = *MEMORY[0x1E0C9D820];
    v124 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (!v3)
      goto LABEL_9;
  }
  objc_msgSend(v5, "buttonSpacing");
  v126 = v20;
  -[PXPhotosSectionHeaderLayout buttonTitleSize](self, "buttonTitleSize");
  v19 = v21;
  v121 = v22;
LABEL_12:
  objc_msgSend(v5, "padding");
  v24 = v23;
  v26 = v25;
  v110 = v27;
  v29 = v28;
  objc_msgSend(v5, "titleFont");
  v123 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitleFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "badgeFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonFont");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout displayScale](self, "displayScale");
  v34 = v33;
  v35 = -[PXPhotosSectionHeaderLayout isBadgeVisible](self, "isBadgeVisible");
  -[PXGLayout referenceSize](self, "referenceSize");
  v111 = v36 - v26 - v29;
  v37 = v111 + v8 * -2.0;
  v109 = v34;
  v102 = v34;
  PXFloatRoundToPixel();
  v39 = v38;
  v120 = v24;
  v107 = v11;
  v131 = v8;
  v132 = v37;
  if (v35)
  {
    -[PXPhotosSectionHeaderLayout badgeSize](self, "badgeSize");
    rect = v41;
    v42 = v126;
    v43 = v37 - v129 - v11;
    v44 = v118;
    if (v40 >= v43 - v39 - v118 - v126 - v19)
      v45 = v43 - v39 - v118 - v126 - v19;
    else
      v45 = v40;
    v173.size.height = 1.0;
    v173.origin.x = v8;
    v173.origin.y = v24;
    v46 = v45;
    v173.size.width = v111 + v8 * -2.0;
    v47 = v130 + CGRectGetMaxY(v173);
    objc_msgSend(v31, "ascender");
    v174.origin.y = v47 - v48;
    v174.origin.x = v8;
    y = v174.origin.y;
    v174.size.width = v46;
    v174.size.height = rect;
    MaxX = CGRectGetMaxX(v174);
    v104 = v8;
  }
  else
  {
    v46 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    rect = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v104 = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v42 = v126;
    v43 = v37 - v129 - v11;
    MaxX = v8;
    v44 = v118;
  }
  -[PXPhotosSectionHeaderLayout finalTitleSize](self, "finalTitleSize");
  v51 = v50;
  v106 = v46;
  if (v46 >= v39)
    v52 = v46;
  else
    v52 = v39;
  v53 = v43 - v52 - v44 - v42 - v19;
  if (v49 >= v53)
    v54 = v53;
  else
    v54 = v49;
  if (objc_msgSend(v5, "minimizeTitleBottomPadding"))
  {
    v55 = v113 - v51 + -7.0;
    v125 = 1.0;
  }
  else
  {
    v125 = 1.0;
    v175.size.height = 1.0;
    v175.origin.x = v131;
    v175.size.width = v132;
    v175.origin.y = v120;
    v56 = v130 + CGRectGetMaxY(v175);
    objc_msgSend(v123, "ascender");
    v55 = v56 - v57;
  }
  -[PXPhotosSectionHeaderLayout subtitleSize](self, "subtitleSize");
  v122 = v19;
  v176.origin.x = MaxX;
  v176.origin.y = v55;
  v176.size.width = v54;
  v176.size.height = v51;
  v127 = v42;
  CGRectGetMaxX(v176);
  v177.origin.x = v131;
  v177.size.width = v132;
  v177.origin.y = v120;
  v177.size.height = v125;
  CGRectGetMaxY(v177);
  objc_msgSend(v30, "ascender");
  PXPointCeilingToPixel();
  v117 = v59;
  v119 = v58;
  v60 = v59;
  PXSizeCeilingToPixel();
  v114 = v62;
  v115 = v61;
  PXPointCeilingToPixel();
  v64 = v63;
  v66 = v65;
  PXSizeCeilingToPixel();
  v68 = v67;
  v70 = v69;
  if (v60 <= v55)
    v71 = 0.0;
  else
    v71 = 1.0 / v102;
  v101 = v66;
  v103 = v64;
  v72 = v64;
  v73 = v66;
  v99 = v70;
  v100 = v68;
  v74 = v107 + CGRectGetMaxX(*(CGRect *)(&v68 - 2));
  v178.origin.x = v131;
  v178.origin.y = v120;
  v178.size.width = v132;
  v178.size.height = v125;
  MaxY = CGRectGetMaxY(v178);
  v179.size.width = v129;
  v179.size.height = v124;
  v179.origin.y = v71 + v130 + MaxY - v124;
  v108 = v74;
  v179.origin.x = v74;
  v98 = v179.origin.y;
  v76 = v127 + CGRectGetMaxX(v179);
  v180.origin.x = v131;
  v180.origin.y = v120;
  v180.size.width = v132;
  v180.size.height = v125;
  v77 = v130 + CGRectGetMaxY(v180);
  objc_msgSend(v32, "ascender");
  v79 = v77 - v78;
  v181.origin.x = v119;
  v181.origin.y = v117;
  v181.size.width = v115;
  v181.size.height = v114;
  CGRectGetMinX(v181);
  v182.origin.x = v119;
  v182.origin.y = v117;
  v182.size.width = v115;
  v182.size.height = v114;
  CGRectGetMinY(v182);
  v183.origin.x = v76;
  v183.origin.y = v79;
  v183.size.width = v122;
  v183.size.height = v121;
  CGRectGetMaxX(v183);
  v128 = v76;
  v184.origin.x = v76;
  v97 = v79;
  v184.origin.y = v79;
  v184.size.width = v122;
  v184.size.height = v121;
  CGRectGetMaxY(v184);
  PXRectWithEdges();
  x = v185.origin.x;
  v81 = v185.origin.y;
  width = v185.size.width;
  height = v185.size.height;
  v84 = CGRectGetMaxY(v185);
  v85 = objc_msgSend(v5, "filterButtonLayoutForSearch");
  if (objc_msgSend(v5, "filterButtonLayoutForSearch"))
    v86 = 25.0;
  else
    v86 = 30.0;
  if (objc_msgSend(v5, "minimizeTitleBottomPadding"))
  {
    v87 = v113;
    v88 = v113 - v86 + -2.0;
    v89 = v120;
  }
  else
  {
    v186.origin.x = v131;
    v186.size.width = v132;
    v89 = v120;
    v186.origin.y = v120;
    v186.size.height = v125;
    v90 = v130 + CGRectGetMaxY(v186);
    objc_msgSend(v123, "ascender");
    v88 = v90 - v91;
    v87 = v113;
  }
  v136 = v131;
  v137 = v89;
  v92 = 200.0;
  if (v85)
    v92 = 175.0;
  v93 = v111 - v92;
  if (v84 >= v87)
    v94 = v84;
  else
    v94 = v87;
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v95 = v110 + v94;
  v133[2] = __45__PXPhotosSectionHeaderLayout__updateContent__block_invoke;
  v133[3] = &unk_1E511DBE0;
  v138 = v132;
  v139 = 0x3FF0000000000000;
  v170 = v109;
  v134 = v5;
  v135 = self;
  v140 = x;
  v141 = v81;
  v142 = width;
  v143 = height;
  v144 = v119;
  v145 = v117;
  v146 = v115;
  v147 = v114;
  v148 = v103;
  v149 = v101;
  v150 = v100;
  v151 = v99;
  v152 = v104;
  v153 = y;
  v154 = v106;
  v155 = rect;
  v171 = v35;
  v156 = v108;
  v157 = v98;
  v158 = v129;
  v159 = v124;
  v160 = v128;
  v161 = v97;
  v162 = v122;
  v163 = v121;
  v172 = v3;
  v164 = v93;
  v165 = v88;
  v166 = 0x4062C00000000000;
  v167 = v86;
  v168 = v111;
  v169 = v110 + v94;
  v96 = v5;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", 0xA00000000, v133);
  -[PXGLayout setContentSize:](self, "setContentSize:", v111, v95);

}

- (void)_invalidateRelativeOffsetAlpha
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout _invalidateRelativeOffsetAlpha]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionHeaderLayout.m"), 636, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateRelativeOffsetAlpha
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[PXPhotosSectionHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "titleShouldFadeOnScroll");

  if (v5)
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v7 = v6;
    -[PXGLayout visibleRect](self, "visibleRect");
    v9 = v8;
    v10 = -[PXPhotosSectionHeaderLayout isFirstSectionHeader](self, "isFirstSectionHeader");
    v11 = 0.0;
    if (!v10)
    {
      -[PXGLayout contentSize](self, "contentSize", 0.0);
      v11 = 0.0;
      if (v12 > 0.0)
      {
        -[PXGLayout contentSize](self, "contentSize");
        v11 = (-v7 - v9) / (v13 * 1.5);
      }
    }
    v14 = fmin(v11, 1.0);
    if (v14 < 0.0)
      v14 = 0.0;
    -[PXPhotosSectionHeaderLayout setRelativeOffsetAlpha:](self, "setRelativeOffsetAlpha:", v14);
  }
}

- (void)_invalidateSpritesAlpha
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionHeaderLayout.m"), 648, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 16;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSpritesAlpha
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[11];

  -[PXPhotosSectionHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderSpec");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosSectionHeaderLayout relativeOffsetAlpha](self, "relativeOffsetAlpha");
  v5 = v4;
  v6 = 0;
  if (-[PXPhotosSectionHeaderLayout wantsChevron](self, "wantsChevron"))
  {
    objc_msgSend(v12, "chevronAlpha");
    v6 = v7;
  }
  v8 = (double)-[PXPhotosSectionHeaderLayout isBadgeVisible](self, "isBadgeVisible", v12);
  if (-[PXPhotosSectionHeaderLayout wantsButton](self, "wantsButton"))
    v9 = 1.0;
  else
    v9 = 0.0;
  if (-[PXPhotosSectionHeaderLayout showLegibilityGradient](self, "showLegibilityGradient"))
    v10 = 0.4;
  else
    v10 = 0.0;
  -[PXGLayout floatingOffset](self, "floatingOffset");
  -[PXGLayout contentSize](self, "contentSize");
  PXClamp();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__PXPhotosSectionHeaderLayout__updateSpritesAlpha__block_invoke;
  v14[3] = &unk_1E51342D0;
  v14[4] = self;
  v14[5] = v5;
  v14[6] = v11;
  *(double *)&v14[7] = v8;
  v14[8] = v6;
  *(double *)&v14[9] = v9;
  *(double *)&v14[10] = v10;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", 0xA00000000, v14);

}

- (void)_invalidateDividerMediaVersion
{
  ++self->_dividerVersion;
  -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_invalidateFinalTitleMediaVersion
{
  self->_finalTitleSize = *(CGSize *)off_1E50B8810;
  ++self->_finalTitleVersion;
  -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_invalidateSubtitleMediaVersion
{
  self->_subtitleSize = *(CGSize *)off_1E50B8810;
  ++self->_subtitleVersion;
  -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_invalidateBadgeMediaVersion
{
  self->_badgeSize = *(CGSize *)off_1E50B8810;
  ++self->_badgeVersion;
  -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_invalidateButtonTitleMediaVersion
{
  self->_buttonTitleSize = *(CGSize *)off_1E50B8810;
  ++self->_buttonVersion;
  -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXPhotosSectionHeaderLayout _invalidateFinalTitleMediaVersion](self, "_invalidateFinalTitleMediaVersion");
  -[PXPhotosSectionHeaderLayout _invalidateSubtitleMediaVersion](self, "_invalidateSubtitleMediaVersion");
  -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXPhotosSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)viewEnvironmentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  -[PXGLayout viewEnvironmentDidChange](&v3, sel_viewEnvironmentDidChange);
  -[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha](self, "_invalidateSpritesAlpha");
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v12;

  v7 = a4;
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    -[PXPhotosSectionHeaderLayout finalTitle](self, "finalTitle");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    switch(a3)
    {
      case 7u:
        -[PXPhotosSectionHeaderLayout buttonTitle](self, "buttonTitle");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 5u:
        -[PXPhotosSectionHeaderLayout badgeTitle](self, "badgeTitle");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 4u:
        -[PXPhotosSectionHeaderLayout subtitle](self, "subtitle");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderLayout.m"), 748, CFSTR("Code which should be unreachable has been reached"));

        abort();
    }
  }
  v9 = v8;
  if (!v8)
    v8 = &stru_1E5149688;
  v10 = v8;

  return v10;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a4;
  switch(a3)
  {
    case 2u:
      -[PXPhotosSectionHeaderLayout finalTitleAttributes](self, "finalTitleAttributes");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      -[PXPhotosSectionHeaderLayout finalTitleLightGradientAttributes](self, "finalTitleLightGradientAttributes");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 4u:
      -[PXPhotosSectionHeaderLayout subtitleAttributes](self, "subtitleAttributes");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 5u:
      -[PXPhotosSectionHeaderLayout badgeAttributes](self, "badgeAttributes");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 7u:
      -[PXPhotosSectionHeaderLayout buttonTitleAttributes](self, "buttonTitleAttributes");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderLayout.m"), 764, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v9 = (void *)v8;

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderLayout.m"), 784, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXPhotosSectionHeaderLayout dividerColor](self, "dividerColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v7 = a4;
  if (a3 == 9)
  {
    -[PXPhotosSectionHeaderLayout spec](self, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionHeaderSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "legibilityGradientImageConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderLayout.m"), 796, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXPhotosSectionHeaderLayout spec](self, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionHeaderSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chevronImageConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = a4;
  -[PXPhotosSectionHeaderLayout filterButtonTitle](self, "filterButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderLayout spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionHeaderSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "curatedLibraryHeaderSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:title:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithButtonType:title:spec:", 4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setStyle:", 10);
  -[PXPhotosSectionHeaderLayout filterButtonCaption](self, "filterButtonCaption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCaption:", v11);

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PXPhotosSectionHeaderLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke;
  v13[3] = &unk_1E5148D30;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v10, "setActionHandler:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

- (id)axSpriteIndexes
{
  return (id)-[NSIndexSet copy](self->_axSpriteIndexes, "copy");
}

- (id)axVisibleSpriteIndexes
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  CGRect v17;
  CGRect v18;

  -[PXGLayout visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXPhotosSectionHeaderLayout axSpriteFrame](self, "axSpriteFrame");
  v18.origin.x = v11;
  v18.origin.y = v12;
  v18.size.width = v13;
  v18.size.height = v14;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (CGRectIntersectsRect(v17, v18))
    v15 = (id)-[NSIndexSet copy](self->_axSpriteIndexes, "copy");
  else
    v15 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  return v15;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v11;
  float64x2_t v12;
  float32x2_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v20;
  CGFloat v21;
  _QWORD v22[4];
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = *(_QWORD *)&a3;
  if (a3 != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderLayout.m"), 832, CFSTR("Unexpected sprite index found"));

  }
  -[PXPhotosSectionHeaderLayout axSpriteFrame](self, "axSpriteFrame");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MidY = CGRectGetMidY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v21 = CGRectGetWidth(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v11 = CGRectGetHeight(v26);
  v12.f64[0] = v21;
  v12.f64[1] = v11;
  v13 = vcvt_f32_f64(v12);
  -[PXPhotosSectionHeaderLayout axSpriteText](self, "axSpriteText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "checkOutReusableObjectWithReuseIdentifier:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setSpriteIndex:", v3);
  *(CGFloat *)v22 = MidX;
  *(CGFloat *)&v22[1] = MidY;
  v22[2] = 0;
  v22[3] = v13;
  objc_msgSend(v16, "setSpriteGeometry:", v22);
  -[PXGLayout axGroup](self, "axGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAxContainingGroup:", v17);

  objc_msgSend(v16, "setContent:ofContentKind:", v14, 3);
  return v16;
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSIndexSet *v8;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXPhotosSectionHeaderLayout axSpriteFrame](self, "axSpriteFrame");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (CGRectIntersectsRect(v10, v11))
    v8 = self->_axSpriteIndexes;
  else
    v8 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
  return v8;
}

- (CGRect)axSpriteFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MinX;
  CGFloat MinY;
  CGFloat v19;
  double Height;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", 2);
  PXRectWithCenterAndSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", 6);
  PXRectWithCenterAndSize();
  v24 = v12;
  v25 = v11;
  v14 = v13;
  v16 = v15;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  MinY = CGRectGetMinY(v27);
  v28.origin.y = v24;
  v28.origin.x = v25;
  v28.size.width = v14;
  v28.size.height = v16;
  v19 = CGRectGetMaxX(v28) - MinX;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  Height = CGRectGetHeight(v29);
  v21 = MinX;
  v22 = MinY;
  v23 = v19;
  result.size.height = Height;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (NSString)axSpriteText
{
  NSString *axSpriteText;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  axSpriteText = self->_axSpriteText;
  if (!axSpriteText)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PXPhotosSectionHeaderLayout title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PXPhotosSectionHeaderLayout title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
    -[PXPhotosSectionHeaderLayout subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PXPhotosSectionHeaderLayout subtitle](self, "subtitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_axSpriteText;
    self->_axSpriteText = v9;

    axSpriteText = self->_axSpriteText;
  }
  return axSpriteText;
}

- (BOOL)isInSelectMode
{
  return self->isInSelectMode;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  self->isInSelectMode = a3;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->selectionSnapshot;
}

- (void)setSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->selectionSnapshot, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)badgeTitle
{
  return self->_badgeTitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)filterButtonTitle
{
  return self->_filterButtonTitle;
}

- (NSString)filterButtonCaption
{
  return self->_filterButtonCaption;
}

- (BOOL)filterButtonHighlighting
{
  return self->_filterButtonHighlighting;
}

- (id)filterActionHandler
{
  return self->_filterActionHandler;
}

- (BOOL)isBadgeVisible
{
  return self->_isBadgeVisible;
}

- (BOOL)isFirstSectionHeader
{
  return self->_isFirstSectionHeader;
}

- (void)setIsFirstSectionHeader:(BOOL)a3
{
  self->_isFirstSectionHeader = a3;
}

- (BOOL)showLegibilityGradient
{
  return self->_showLegibilityGradient;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (NSString)finalTitle
{
  return self->_finalTitle;
}

- (NSDictionary)finalTitleAttributes
{
  return self->_finalTitleAttributes;
}

- (NSDictionary)finalTitleLightGradientAttributes
{
  return self->_finalTitleLightGradientAttributes;
}

- (void)setFinalTitleLightGradientAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSDictionary)subtitleAttributes
{
  return self->_subtitleAttributes;
}

- (NSDictionary)badgeAttributes
{
  return self->_badgeAttributes;
}

- (NSDictionary)buttonTitleAttributes
{
  return self->_buttonTitleAttributes;
}

- (double)relativeOffsetAlpha
{
  return self->_relativeOffsetAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitleAttributes, 0);
  objc_storeStrong((id *)&self->_badgeAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleAttributes, 0);
  objc_storeStrong((id *)&self->_finalTitleLightGradientAttributes, 0);
  objc_storeStrong((id *)&self->_finalTitleAttributes, 0);
  objc_storeStrong((id *)&self->_finalTitle, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong(&self->_filterActionHandler, 0);
  objc_storeStrong((id *)&self->_filterButtonCaption, 0);
  objc_storeStrong((id *)&self->_filterButtonTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_badgeTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_axSpriteText, 0);
  objc_storeStrong((id *)&self->selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

void __69__PXPhotosSectionHeaderLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleFilterAction");

}

float __50__PXPhotosSectionHeaderLayout__updateSpritesAlpha__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  float v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float result;

  v6 = *(double *)(a1 + 40);
  *a4 = v6;
  if (objc_msgSend(*(id *)(a1 + 32), "showLegibilityGradient")
    && (objc_msgSend(*(id *)(a1 + 32), "viewEnvironment"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "userInterfaceStyle"),
        v7,
        v8 == 1))
  {
    v10 = *(double *)(a1 + 40);
    v9 = *(double *)(a1 + 48);
    v11 = 1.0 - v9;
    a4[80] = v11;
    v12 = v9;
    a4[120] = v12;
    v13 = v10;
  }
  else
  {
    v10 = *(double *)(a1 + 40);
    v9 = *(double *)(a1 + 48);
    v13 = v10;
    a4[80] = v13;
    a4[120] = 0.0;
  }
  a4[160] = v13;
  v14 = *(double *)(a1 + 64);
  v15 = v10 * *(double *)(a1 + 56);
  a4[200] = v15;
  v16 = v10 * v14;
  a4[240] = v16;
  v17 = *(double *)(a1 + 80);
  v18 = v10 * *(double *)(a1 + 72);
  a4[280] = v18;
  result = v17 * v9;
  a4[360] = result;
  return result;
}

float32x2_t __45__PXPhotosSectionHeaderLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, float32x2_t *a5)
{
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  float64x2_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  float64x2_t v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  float64x2_t v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  float64x2_t v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  float64x2_t v73;
  char v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  float64x2_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  float64x2_t v94;
  char v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  float64x2_t v103;
  void *v104;
  char v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  float64x2_t v111;
  float32x2_t result;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  CGFloat Width;
  CGFloat v131;
  __int128 v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;

  if (objc_msgSend(*(id *)(a1 + 32), "dividerLineVisible"))
  {
    v9 = *(double *)(a1 + 48);
    v10 = *(double *)(a1 + 56);
    v11 = *(double *)(a1 + 64);
    v12 = *(double *)(a1 + 72);
    v133.origin.x = v9;
    v133.origin.y = v10;
    v133.size.width = v11;
    v133.size.height = v12;
    MidX = CGRectGetMidX(v133);
    v134.origin.x = v9;
    v134.origin.y = v10;
    v134.size.width = v11;
    v134.size.height = v12;
    MidY = CGRectGetMidY(v134);
    v135.origin.x = v9;
    v135.origin.y = v10;
    v135.size.width = v11;
    v135.size.height = v12;
    Width = CGRectGetWidth(v135);
    v136.origin.x = v9;
    v136.origin.y = v10;
    v136.size.width = v11;
    v136.size.height = v12;
    Height = CGRectGetHeight(v136);
    v16.f64[0] = Width;
    v16.f64[1] = Height;
    *(CGFloat *)a3 = MidX;
    *(CGFloat *)&a3[1] = MidY;
    a3[2] = (float32x2_t)0xBFF0000000000000;
    a3[3] = vcvt_f32_f64(v16);
    v17 = *((_OWORD *)off_1E50B83A0 + 1);
    *(_OWORD *)a4 = *(_OWORD *)off_1E50B83A0;
    *(_OWORD *)(a4 + 16) = v17;
    v18 = *((_OWORD *)off_1E50B83A0 + 5);
    *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
    *(_OWORD *)(a4 + 80) = v18;
    v19 = *((_OWORD *)off_1E50B83A0 + 3);
    *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
    *(_OWORD *)(a4 + 48) = v19;
    v20 = *((_OWORD *)off_1E50B83A0 + 9);
    *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
    *(_OWORD *)(a4 + 144) = v20;
    v21 = *((_OWORD *)off_1E50B83A0 + 7);
    *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
    *(_OWORD *)(a4 + 112) = v21;
    a5->i8[1] = 5;
    a5[1] = vmul_n_f32(a3[3], *(float *)(a1 + 320));
    a5[4].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 40) + 872);
  }
  v22 = *(double *)(a1 + 80);
  v23 = *(double *)(a1 + 88);
  v24 = *(double *)(a1 + 96);
  v25 = *(double *)(a1 + 104);
  v137.origin.x = v22;
  v137.origin.y = v23;
  v137.size.width = v24;
  v137.size.height = v25;
  v26 = CGRectGetMidX(v137);
  v138.origin.x = v22;
  v138.origin.y = v23;
  v138.size.width = v24;
  v138.size.height = v25;
  v27 = CGRectGetMidY(v138);
  v139.origin.x = v22;
  v139.origin.y = v23;
  v139.size.width = v24;
  v139.size.height = v25;
  v131 = CGRectGetWidth(v139);
  v140.origin.x = v22;
  v140.origin.y = v23;
  v140.size.width = v24;
  v140.size.height = v25;
  v28 = CGRectGetHeight(v140);
  v29.f64[0] = v131;
  v29.f64[1] = v28;
  *(CGFloat *)&a3[4] = v26;
  *(CGFloat *)&a3[5] = v27;
  a3[6] = 0;
  a3[7] = vcvt_f32_f64(v29);
  v129 = *(_OWORD *)off_1E50B83A0;
  v132 = *((_OWORD *)off_1E50B83A0 + 1);
  *(_OWORD *)(a4 + 160) = *(_OWORD *)off_1E50B83A0;
  *(_OWORD *)(a4 + 176) = v132;
  v127 = *((_OWORD *)off_1E50B83A0 + 5);
  v128 = *((_OWORD *)off_1E50B83A0 + 4);
  *(_OWORD *)(a4 + 224) = v128;
  *(_OWORD *)(a4 + 240) = v127;
  v125 = *((_OWORD *)off_1E50B83A0 + 3);
  v126 = *((_OWORD *)off_1E50B83A0 + 2);
  *(_OWORD *)(a4 + 192) = v126;
  *(_OWORD *)(a4 + 208) = v125;
  v123 = *((_OWORD *)off_1E50B83A0 + 9);
  v124 = *((_OWORD *)off_1E50B83A0 + 8);
  *(_OWORD *)(a4 + 288) = v124;
  *(_OWORD *)(a4 + 304) = v123;
  v121 = *((_OWORD *)off_1E50B83A0 + 7);
  v122 = *((_OWORD *)off_1E50B83A0 + 6);
  *(_OWORD *)(a4 + 256) = v122;
  *(_OWORD *)(a4 + 272) = v121;
  a5[5].i8[1] = 5;
  a5[6] = vmul_n_f32(a3[7], *(float *)(a1 + 320));
  v30 = *(double *)(a1 + 112);
  v31 = *(double *)(a1 + 120);
  v32 = *(double *)(a1 + 128);
  v33 = *(double *)(a1 + 136);
  v34 = v30;
  v29.f64[0] = v31;
  v35 = v32;
  v36 = v33;
  v37 = CGRectGetMidX(*(CGRect *)((char *)&v29 - 8));
  v141.origin.x = v30;
  v141.origin.y = v31;
  v141.size.width = v32;
  v141.size.height = v33;
  v38 = CGRectGetMidY(v141);
  v142.origin.x = v30;
  v142.origin.y = v31;
  v142.size.width = v32;
  v142.size.height = v33;
  v113 = CGRectGetWidth(v142);
  v143.origin.x = v30;
  v143.origin.y = v31;
  v143.size.width = v32;
  v143.size.height = v33;
  v39 = CGRectGetHeight(v143);
  v40.f64[0] = v113;
  v40.f64[1] = v39;
  *(CGFloat *)&a3[8] = v37;
  *(CGFloat *)&a3[9] = v38;
  a3[10] = (float32x2_t)0xBFF0000000000000;
  a3[11] = vcvt_f32_f64(v40);
  *(_OWORD *)(a4 + 320) = v129;
  *(_OWORD *)(a4 + 336) = v132;
  *(_OWORD *)(a4 + 384) = v128;
  *(_OWORD *)(a4 + 400) = v127;
  *(_OWORD *)(a4 + 352) = v126;
  *(_OWORD *)(a4 + 368) = v125;
  *(_OWORD *)(a4 + 448) = v124;
  *(_OWORD *)(a4 + 464) = v123;
  *(_OWORD *)(a4 + 416) = v122;
  *(_OWORD *)(a4 + 432) = v121;
  a5[10].i8[1] = 3;
  a5[11] = vmul_n_f32(a3[11], *(float *)(a1 + 320));
  a5[14].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 40) + 874);
  v41 = *(double *)(a1 + 112);
  v42 = *(double *)(a1 + 120);
  v43 = *(double *)(a1 + 128);
  v44 = *(double *)(a1 + 136);
  v45 = v41;
  v40.f64[0] = v42;
  v46 = v43;
  v47 = v44;
  v48 = CGRectGetMidX(*(CGRect *)((char *)&v40 - 8));
  v144.origin.x = v41;
  v144.origin.y = v42;
  v144.size.width = v43;
  v144.size.height = v44;
  v49 = CGRectGetMidY(v144);
  v145.origin.x = v41;
  v145.origin.y = v42;
  v145.size.width = v43;
  v145.size.height = v44;
  v114 = CGRectGetWidth(v145);
  v146.origin.x = v41;
  v146.origin.y = v42;
  v146.size.width = v43;
  v146.size.height = v44;
  v50 = CGRectGetHeight(v146);
  v51.f64[0] = v114;
  v51.f64[1] = v50;
  *(CGFloat *)&a3[12] = v48;
  *(CGFloat *)&a3[13] = v49;
  a3[14] = (float32x2_t)0xBFF0000000000000;
  a3[15] = vcvt_f32_f64(v51);
  *(_OWORD *)(a4 + 480) = v129;
  *(_OWORD *)(a4 + 496) = v132;
  *(_OWORD *)(a4 + 544) = v128;
  *(_OWORD *)(a4 + 560) = v127;
  *(_OWORD *)(a4 + 512) = v126;
  *(_OWORD *)(a4 + 528) = v125;
  *(_OWORD *)(a4 + 608) = v124;
  *(_OWORD *)(a4 + 624) = v123;
  *(_OWORD *)(a4 + 576) = v122;
  *(_OWORD *)(a4 + 592) = v121;
  *(_DWORD *)(a4 + 480) = 0;
  a5[15].i8[1] = 3;
  a5[16] = vmul_n_f32(a3[11], *(float *)(a1 + 320));
  a5[19].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 40) + 874);
  v52 = *(double *)(a1 + 144);
  v53 = *(double *)(a1 + 152);
  v54 = *(double *)(a1 + 160);
  v55 = *(double *)(a1 + 168);
  v56 = v52;
  v51.f64[0] = v53;
  v57 = v54;
  v58 = v55;
  v59 = CGRectGetMidX(*(CGRect *)((char *)&v51 - 8));
  v147.origin.x = v52;
  v147.origin.y = v53;
  v147.size.width = v54;
  v147.size.height = v55;
  v60 = CGRectGetMidY(v147);
  v148.origin.x = v52;
  v148.origin.y = v53;
  v148.size.width = v54;
  v148.size.height = v55;
  v115 = CGRectGetWidth(v148);
  v149.origin.x = v52;
  v149.origin.y = v53;
  v149.size.width = v54;
  v149.size.height = v55;
  v61 = CGRectGetHeight(v149);
  v62.f64[0] = v115;
  v62.f64[1] = v61;
  *(CGFloat *)&a3[16] = v59;
  *(CGFloat *)&a3[17] = v60;
  a3[18] = (float32x2_t)0xBFF0000000000000;
  a3[19] = vcvt_f32_f64(v62);
  *(_OWORD *)(a4 + 640) = v129;
  *(_OWORD *)(a4 + 656) = v132;
  *(_OWORD *)(a4 + 704) = v128;
  *(_OWORD *)(a4 + 720) = v127;
  *(_OWORD *)(a4 + 672) = v126;
  *(_OWORD *)(a4 + 688) = v125;
  *(_OWORD *)(a4 + 768) = v124;
  *(_OWORD *)(a4 + 784) = v123;
  *(_OWORD *)(a4 + 736) = v122;
  *(_OWORD *)(a4 + 752) = v121;
  a5[20].i8[1] = 3;
  a5[21] = vmul_n_f32(a3[19], *(float *)(a1 + 320));
  a5[24].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 40) + 876);
  v63 = *(double *)(a1 + 176);
  v64 = *(double *)(a1 + 184);
  v65 = *(double *)(a1 + 192);
  v66 = *(double *)(a1 + 200);
  v67 = v63;
  v62.f64[0] = v64;
  v68 = v65;
  v69 = v66;
  v70 = CGRectGetMidX(*(CGRect *)((char *)&v62 - 8));
  v150.origin.x = v63;
  v150.origin.y = v64;
  v150.size.width = v65;
  v150.size.height = v66;
  v71 = CGRectGetMidY(v150);
  v151.origin.x = v63;
  v151.origin.y = v64;
  v151.size.width = v65;
  v151.size.height = v66;
  v116 = CGRectGetWidth(v151);
  v152.origin.x = v63;
  v152.origin.y = v64;
  v152.size.width = v65;
  v152.size.height = v66;
  v72 = CGRectGetHeight(v152);
  v73.f64[0] = v116;
  v73.f64[1] = v72;
  *(CGFloat *)&a3[20] = v70;
  *(CGFloat *)&a3[21] = v71;
  a3[22] = (float32x2_t)0xBFF0000000000000;
  a3[23] = vcvt_f32_f64(v73);
  *(_OWORD *)(a4 + 800) = v129;
  *(_OWORD *)(a4 + 816) = v132;
  *(_OWORD *)(a4 + 864) = v128;
  *(_OWORD *)(a4 + 880) = v127;
  *(_OWORD *)(a4 + 832) = v126;
  *(_OWORD *)(a4 + 848) = v125;
  *(_OWORD *)(a4 + 928) = v124;
  *(_OWORD *)(a4 + 944) = v123;
  *(_OWORD *)(a4 + 896) = v122;
  *(_OWORD *)(a4 + 912) = v121;
  if (*(_BYTE *)(a1 + 324))
    v74 = 3;
  else
    v74 = 0;
  a5[25].i8[1] = v74;
  a5[26] = vmul_n_f32(a3[23], *(float *)(a1 + 320));
  a5[29].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 40) + 878);
  v75 = *(double *)(a1 + 208);
  v76 = *(double *)(a1 + 216);
  v77 = *(double *)(a1 + 224);
  v78 = *(double *)(a1 + 232);
  v153.origin.x = v75;
  v153.origin.y = v76;
  v153.size.width = v77;
  v153.size.height = v78;
  v79 = CGRectGetMidX(v153);
  v154.origin.x = v75;
  v154.origin.y = v76;
  v154.size.width = v77;
  v154.size.height = v78;
  v80 = CGRectGetMidY(v154);
  v155.origin.x = v75;
  v155.origin.y = v76;
  v155.size.width = v77;
  v155.size.height = v78;
  v117 = CGRectGetWidth(v155);
  v156.origin.x = v75;
  v156.origin.y = v76;
  v156.size.width = v77;
  v156.size.height = v78;
  v81 = CGRectGetHeight(v156);
  v82.f64[0] = v117;
  v82.f64[1] = v81;
  *(CGFloat *)&a3[24] = v79;
  *(CGFloat *)&a3[25] = v80;
  a3[26] = (float32x2_t)0xBFF0000000000000;
  a3[27] = vcvt_f32_f64(v82);
  *(_OWORD *)(a4 + 960) = v129;
  *(_OWORD *)(a4 + 976) = v132;
  *(_OWORD *)(a4 + 1040) = v127;
  *(_OWORD *)(a4 + 1008) = v125;
  *(_OWORD *)(a4 + 1024) = v128;
  *(_OWORD *)(a4 + 992) = v126;
  *(_OWORD *)(a4 + 1104) = v123;
  *(_OWORD *)(a4 + 1088) = v124;
  *(_OWORD *)(a4 + 1072) = v121;
  *(_OWORD *)(a4 + 1056) = v122;
  a5[30].i8[1] = 1;
  objc_msgSend(*(id *)(a1 + 40), "spec");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "sectionHeaderSpec");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "chevronImageConfiguration");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "imageName");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  a5[34].i16[0] = objc_msgSend(v86, "hash");

  v87 = *(double *)(a1 + 240);
  v88 = *(double *)(a1 + 248);
  v89 = *(double *)(a1 + 256);
  v90 = *(double *)(a1 + 264);
  v157.origin.x = v87;
  v157.origin.y = v88;
  v157.size.width = v89;
  v157.size.height = v90;
  v91 = CGRectGetMidX(v157);
  v158.origin.x = v87;
  v158.origin.y = v88;
  v158.size.width = v89;
  v158.size.height = v90;
  v92 = CGRectGetMidY(v158);
  v159.origin.x = v87;
  v159.origin.y = v88;
  v159.size.width = v89;
  v159.size.height = v90;
  v118 = CGRectGetWidth(v159);
  v160.origin.x = v87;
  v160.origin.y = v88;
  v160.size.width = v89;
  v160.size.height = v90;
  v93 = CGRectGetHeight(v160);
  v94.f64[0] = v118;
  v94.f64[1] = v93;
  *(CGFloat *)&a3[28] = v91;
  *(CGFloat *)&a3[29] = v92;
  a3[30] = (float32x2_t)0xBFF0000000000000;
  a3[31] = vcvt_f32_f64(v94);
  *(_OWORD *)(a4 + 1120) = v129;
  *(_OWORD *)(a4 + 1136) = v132;
  *(_OWORD *)(a4 + 1200) = v127;
  *(_OWORD *)(a4 + 1184) = v128;
  *(_OWORD *)(a4 + 1168) = v125;
  *(_OWORD *)(a4 + 1152) = v126;
  *(_OWORD *)(a4 + 1264) = v123;
  *(_OWORD *)(a4 + 1248) = v124;
  *(_OWORD *)(a4 + 1232) = v121;
  *(_OWORD *)(a4 + 1216) = v122;
  if (*(_BYTE *)(a1 + 325))
    v95 = 3;
  else
    v95 = 0;
  a5[35].i8[1] = v95;
  a5[36] = vmul_n_f32(a3[31], *(float *)(a1 + 320));
  a5[39].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 40) + 880);
  v96 = *(double *)(a1 + 272);
  v97 = *(double *)(a1 + 280);
  v98 = *(double *)(a1 + 288);
  v99 = *(double *)(a1 + 296);
  v161.origin.x = v96;
  v161.origin.y = v97;
  v161.size.width = v98;
  v161.size.height = v99;
  v100 = CGRectGetMidX(v161);
  v162.origin.x = v96;
  v162.origin.y = v97;
  v162.size.width = v98;
  v162.size.height = v99;
  v101 = CGRectGetMidY(v162);
  v163.origin.x = v96;
  v163.origin.y = v97;
  v163.size.width = v98;
  v163.size.height = v99;
  v119 = CGRectGetWidth(v163);
  v164.origin.x = v96;
  v164.origin.y = v97;
  v164.size.width = v98;
  v164.size.height = v99;
  v102 = CGRectGetHeight(v164);
  v103.f64[0] = v119;
  v103.f64[1] = v102;
  *(CGFloat *)&a3[32] = v100;
  *(CGFloat *)&a3[33] = v101;
  a3[34] = (float32x2_t)0xBFF0000000000000;
  a3[35] = vcvt_f32_f64(v103);
  *(_OWORD *)(a4 + 1296) = v132;
  *(_OWORD *)(a4 + 1280) = v129;
  *(_OWORD *)(a4 + 1360) = v127;
  *(_OWORD *)(a4 + 1344) = v128;
  *(_OWORD *)(a4 + 1328) = v125;
  *(_OWORD *)(a4 + 1312) = v126;
  *(_OWORD *)(a4 + 1424) = v123;
  *(_OWORD *)(a4 + 1408) = v124;
  *(_OWORD *)(a4 + 1392) = v121;
  *(_OWORD *)(a4 + 1376) = v122;
  objc_msgSend(*(id *)(a1 + 40), "filterButtonTitle");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v104, "length"))
    v105 = 10;
  else
    v105 = 0;
  a5[40].i8[1] = v105;

  a5[40].i8[0] = 1;
  a5[41] = vmul_n_f32(a3[35], *(float *)(a1 + 320));
  a5[44].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 40) + 882);
  v106 = *(double *)(a1 + 304);
  v107 = *(double *)(a1 + 312);
  v165.origin.x = 0.0;
  v165.origin.y = 0.0;
  v165.size.width = v106;
  v165.size.height = v107;
  v108 = CGRectGetMidX(v165);
  v166.origin.x = 0.0;
  v166.origin.y = 0.0;
  v166.size.width = v106;
  v166.size.height = v107;
  v109 = CGRectGetMidY(v166);
  v167.origin.x = 0.0;
  v167.origin.y = 0.0;
  v167.size.width = v106;
  v167.size.height = v107;
  v120 = CGRectGetWidth(v167);
  v168.origin.x = 0.0;
  v168.origin.y = 0.0;
  v168.size.width = v106;
  v168.size.height = v107;
  v110 = CGRectGetHeight(v168);
  v111.f64[0] = v120;
  v111.f64[1] = v110;
  *(CGFloat *)&a3[36] = v108;
  *(CGFloat *)&a3[37] = v109;
  a3[38] = 0;
  a3[39] = vcvt_f32_f64(v111);
  *(_OWORD *)(a4 + 1440) = v129;
  *(_OWORD *)(a4 + 1456) = v132;
  *(_OWORD *)(a4 + 1520) = v127;
  *(_OWORD *)(a4 + 1504) = v128;
  *(_OWORD *)(a4 + 1488) = v125;
  *(_OWORD *)(a4 + 1472) = v126;
  *(_OWORD *)(a4 + 1584) = v123;
  *(_OWORD *)(a4 + 1568) = v124;
  *(_OWORD *)(a4 + 1552) = v121;
  *(_OWORD *)(a4 + 1536) = v122;
  *(_WORD *)(a4 + 1508) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 884);
  *(_DWORD *)(a4 + 1440) = 0;
  a5[45].i16[0] = 256;
  result = vmul_n_f32(a3[39], *(float *)(a1 + 320));
  a5[46] = result;
  return result;
}

uint64_t __54__PXPhotosSectionHeaderLayout_floatingOffsetDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSpritesAlpha");
}

@end
