@implementation PXSharedLibrarySharingSuggestionLayout

- (PXSharedLibrarySharingSuggestionLayout)init
{
  PXSharedLibrarySharingSuggestionLayout *v2;
  PXSharedLibrarySharingSuggestionLayout *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDictionary *titleAttributes;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *titleAttributesWithoutSubtitle;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *subtitleAttributes;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PXSharedLibrarySharingSuggestionLayout;
  v2 = -[PXGLayout init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_contentSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v2, "addSpriteWithInitialState:", 0);
    v3->_textSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v3, "addSpriteWithInitialState:", 0);
    v3->_badgeSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v3, "addSpriteWithInitialState:", 0);
    -[PXGLayout setContentSource:](v3, "setContentSource:", v3);
    v26 = *MEMORY[0x1E0DC1138];
    v4 = v26;
    MEMORY[0x1A85CC970](5, 0, 9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v5;
    v27 = *MEMORY[0x1E0DC1140];
    v6 = v27;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v26, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    titleAttributes = v3->_titleAttributes;
    v3->_titleAttributes = (NSDictionary *)v8;

    v23[0] = v4;
    MEMORY[0x1A85CC970](5, 0, 9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    v23[1] = v6;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0DC1108];
    v12 = v24;
    v25[1] = v11;
    v25[2] = &unk_1E53EF9A0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v23, 3);
    v13 = objc_claimAutoreleasedReturnValue();
    titleAttributesWithoutSubtitle = v3->_titleAttributesWithoutSubtitle;
    v3->_titleAttributesWithoutSubtitle = (NSDictionary *)v13;

    v21[0] = v4;
    MEMORY[0x1A85CC970](10, 0, 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v21[1] = v6;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v12;
    v22[1] = v16;
    v22[2] = &unk_1E53EF9A0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v17 = objc_claimAutoreleasedReturnValue();
    subtitleAttributes = v3->_subtitleAttributes;
    v3->_subtitleAttributes = (NSDictionary *)v17;

  }
  return v3;
}

- (void)entityManagerDidChange
{
  void *v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibrarySharingSuggestionLayout;
  -[PXGLayout entityManagerDidChange](&v8, sel_entityManagerDidChange);
  -[PXGLayout entityManager](self, "entityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc((Class)off_1E50B2D68);
    -[PXGLayout entityManager](self, "entityManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "initWithEntityManager:", v2);
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)&self->_legibilityEffect, v6);
  if (v4)
  {

  }
  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharingSuggestionsLegibilityStrength");
  -[PXGTextLegibilityEffect setStrength:](self->_legibilityEffect, "setStrength:");

  -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibrarySharingSuggestionLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibrarySharingSuggestionLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
}

- (void)setSharingSuggestion:(id)a3
{
  PXSharedLibrarySharingSuggestion **p_sharingSuggestion;
  PXSharedLibrarySharingSuggestion *v6;
  PXSharedLibrarySharingSuggestion *v7;
  char v8;
  PXSharedLibrarySharingSuggestion *v9;
  id v10;
  id v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  PXSharedLibrarySharingSuggestion *v27;

  v27 = (PXSharedLibrarySharingSuggestion *)a3;
  p_sharingSuggestion = &self->_sharingSuggestion;
  v6 = self->_sharingSuggestion;
  if (v6 == v27)
  {

LABEL_30:
    v9 = v27;
    goto LABEL_31;
  }
  v7 = v6;
  v8 = -[PXSharedLibrarySharingSuggestion isEqual:](v6, "isEqual:", v27);

  v9 = v27;
  if ((v8 & 1) == 0)
  {
    -[PXSharedLibrarySharingSuggestion identifier](*p_sharingSuggestion, "identifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibrarySharingSuggestion identifier](v27, "identifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {

    }
    else
    {
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v12)
        goto LABEL_9;
    }
    if ((-[PXSharedLibrarySharingSuggestion isPlaceholder](*p_sharingSuggestion, "isPlaceholder") & 1) != 0)
    {
LABEL_9:

      v9 = v27;
      goto LABEL_11;
    }
    v13 = -[PXSharedLibrarySharingSuggestion isPlaceholder](v27, "isPlaceholder");

    v9 = v27;
    if ((v13 & 1) == 0)
    {
LABEL_11:
      -[PXSharedLibrarySharingSuggestion keyAsset](v9, "keyAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedLibrarySharingSuggestion keyAsset](*p_sharingSuggestion, "keyAsset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = v15;
      if (v16 == v17)
      {

        goto LABEL_21;
      }
      v18 = v17;
      if (v16 && v17)
      {
        v19 = objc_msgSend(v16, "isContentEqualTo:", v17);
        if (!v19)
          v19 = objc_msgSend(v18, "isContentEqualTo:", v16);

        if (v19 == 2)
        {
LABEL_21:
          -[PXSharedLibrarySharingSuggestion title](*p_sharingSuggestion, "title");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          -[PXSharedLibrarySharingSuggestion title](v27, "title");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (v20 == v21)
          {

          }
          else
          {
            v22 = objc_msgSend(v20, "isEqual:", v21);

            if ((v22 & 1) == 0)
            {

              goto LABEL_27;
            }
          }
          -[PXSharedLibrarySharingSuggestion locations](*p_sharingSuggestion, "locations");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          -[PXSharedLibrarySharingSuggestion locations](v27, "locations");
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (v23 == v24)
          {

            goto LABEL_29;
          }
          v25 = v24;
          v26 = objc_msgSend(v23, "isEqual:", v24);

          if ((v26 & 1) != 0)
          {
LABEL_29:
            objc_storeStrong((id *)&self->_sharingSuggestion, a3);
            -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
            goto LABEL_30;
          }
LABEL_27:
          -[PXSharedLibrarySharingSuggestionLayout _invalidateLabelContentVersion](self, "_invalidateLabelContentVersion");
          goto LABEL_29;
        }
      }
      else
      {

      }
      -[PXSharedLibrarySharingSuggestionLayout _invalidateAssetContentVersion](self, "_invalidateAssetContentVersion");
      goto LABEL_21;
    }
  }
LABEL_31:

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSharedLibrarySharingSuggestionLayout update]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXSharedLibrarySharingSuggestionLayout.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXSharedLibrarySharingSuggestionLayout _updateContent](self, "_updateContent");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSharedLibrarySharingSuggestionLayout update]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXSharedLibrarySharingSuggestionLayout.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXSharedLibrarySharingSuggestionLayout _updateSubtitleThatFits](self, "_updateSubtitleThatFits");
      v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSharedLibrarySharingSuggestionLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXSharedLibrarySharingSuggestionLayout.m"), 148, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibrarySharingSuggestionLayout;
  -[PXGLayout update](&v12, sel_update);
}

- (void)_invalidateAssetContentVersion
{
  ++self->_assetContentVersion;
  -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_invalidateLabelContentVersion
{
  ++self->_labelContentVersion;
  -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
  -[PXSharedLibrarySharingSuggestionLayout _invalidateSubtitleThatFits](self, "_invalidateSubtitleThatFits");
}

- (void)_invalidateBadgeContentVersion
{
  ++self->_badgeContentVersion;
  -[PXSharedLibrarySharingSuggestionLayout _invalidateContent](self, "_invalidateContent");
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
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSharedLibrarySharingSuggestionLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXSharedLibrarySharingSuggestionLayout.m"), 169, CFSTR("invalidating %lu after it already has been updated"), 1);

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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXGLayout setContentSize:](self, "setContentSize:");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXSharedLibrarySharingSuggestionLayout__updateContent__block_invoke;
  v8[3] = &unk_1E5126CF0;
  v8[6] = v4;
  v8[7] = v6;
  v8[4] = self;
  v8[5] = &v9;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v7 << 32, v8);
  if (*((_BYTE *)v10 + 24))
    -[PXSharedLibrarySharingSuggestionLayout _invalidateSubtitleThatFits](self, "_invalidateSubtitleThatFits");
  _Block_object_dispose(&v9, 8);
}

- (void)_invalidateSubtitleThatFits
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSharedLibrarySharingSuggestionLayout _invalidateSubtitleThatFits]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXSharedLibrarySharingSuggestionLayout.m"), 226, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateSubtitleThatFits
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *subtitleThatFits;
  _QWORD v7[5];
  uint64_t v8;

  -[PXSharedLibrarySharingSuggestionLayout sharingSuggestion](self, "sharingSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", self->_textSpriteIndex);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PXSharedLibrarySharingSuggestionLayout__updateSubtitleThatFits__block_invoke;
  v7[3] = &unk_1E5128890;
  v7[4] = self;
  objc_msgSend(v4, "px_localizedComposedStringThatFitsWidth:maxCount:useUndefinedMoreCount:withMeasuringBlock:", 3, 1, v7, *(float *)&v8);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitleThatFits = self->_subtitleThatFits;
  self->_subtitleThatFits = v5;

}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXSharedLibrarySharingSuggestionBadgeViewConfiguration *v4;

  v4 = objc_alloc_init(PXSharedLibrarySharingSuggestionBadgeViewConfiguration);
  -[PXSharedLibrarySharingSuggestionBadgeViewConfiguration setSideMargin:](v4, "setSideMargin:", 16.0);
  return v4;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_contentSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionLayout.m"), 263, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)gradientForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)off_1E50B2A20);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.45);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithStartingColor:endingColor:direction:", v5, v6, 0);

  return v7;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  -[PXSharedLibrarySharingSuggestionLayout sharingSuggestion](self, "sharingSuggestion", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("<null>");
  v7 = v5;

  return v7;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  -[PXSharedLibrarySharingSuggestionLayout sharingSuggestion](self, "sharingSuggestion", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  if (self->_subtitleThatFits)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_subtitleThatFits, self->_subtitleAttributes);
  else
    v7 = 0;
  v8 = objc_msgSend(v7, "length");
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v5, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E5149688;
  if (v8)
    v13 = &OBJC_IVAR___PXSharedLibrarySharingSuggestionLayout__titleAttributes;
  else
    v13 = &OBJC_IVAR___PXSharedLibrarySharingSuggestionLayout__titleAttributesWithoutSubtitle;
  v14 = (void *)objc_msgSend(v9, "initWithString:attributes:", v12, *(Class *)((char *)&self->super.super.isa + *v13));

  v15 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v16 = v15;
  v17 = v14;
  if (v8)
  {
    objc_msgSend(v15, "appendAttributedString:", v14);
    v17 = v7;
  }
  objc_msgSend(v16, "appendAttributedString:", v6);
  objc_msgSend(v16, "appendAttributedString:", v17);

  return v16;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[PXSharedLibrarySharingSuggestionLayout sharingSuggestion](self, "sharingSuggestion", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromAsset();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (PXSharedLibrarySharingSuggestion)sharingSuggestion
{
  return self->_sharingSuggestion;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSuggestion, 0);
  objc_storeStrong((id *)&self->_legibilityEffect, 0);
  objc_storeStrong((id *)&self->_subtitleAttributes, 0);
  objc_storeStrong((id *)&self->_titleAttributesWithoutSubtitle, 0);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleThatFits, 0);
}

uint64_t __65__PXSharedLibrarySharingSuggestionLayout__updateSubtitleThatFits__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sizeWithAttributes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 920));
}

void __56__PXSharedLibrarySharingSuggestionLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  float64_t v14;
  float64x2_t v15;
  float64_t v16;
  float64x2_t v17;
  float32x2_t *v18;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v22;
  _OWORD *v23;
  unsigned int *v24;
  uint64_t v25;
  double v26;
  char v27;
  uint64_t v28;
  float64_t v29;
  float64x2_t v30;
  unsigned int *v36;
  int v37;
  void *v38;
  void *v39;
  CGFloat x;
  CGFloat y;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  float v46;
  CGFloat v47;
  BOOL v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD *v55;
  float64_t v56;
  float64x2_t v57;
  unsigned int v58;
  float32x2_t *v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  float64x2_t v63;
  _OWORD *v64;
  unsigned int *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  float v69;
  CGFloat v70;
  float64x2_t v71;
  CGFloat v72;
  float64x2_t v73;
  CGFloat v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  CGFloat Width;
  __int128 v85;
  void *v86;
  _QWORD v87[5];
  int v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  PXRectWithOriginAndSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "displayScale");
  objc_msgSend(*(id *)(a1 + 32), "sharingSuggestion");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "keyAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    PXSizeGetAspectRatio();
    objc_msgSend(v13, "bestCropRectForAspectRatioV2:verticalContentMode:cropMode:", 0, 2);
    v15.f64[1] = v14;
    v73 = v15;
    v17.f64[1] = v16;
  }
  else
  {
    v73 = *((float64x2_t *)off_1E50B86D0 + 1);
    v17 = *(float64x2_t *)off_1E50B86D0;
  }
  v71 = v17;
  v18 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
  v89.origin.x = v6;
  v89.origin.y = v8;
  v89.size.width = v10;
  v89.size.height = v12;
  MidX = CGRectGetMidX(v89);
  v90.origin.x = v6;
  v90.origin.y = v8;
  v90.size.width = v10;
  v90.size.height = v12;
  MidY = CGRectGetMidY(v90);
  v91.origin.x = v6;
  v91.origin.y = v8;
  v91.size.width = v10;
  v91.size.height = v12;
  Width = CGRectGetWidth(v91);
  v92.origin.x = v6;
  v92.origin.y = v8;
  v92.size.width = v10;
  v92.size.height = v12;
  Height = CGRectGetHeight(v92);
  v22.f64[0] = Width;
  v22.f64[1] = Height;
  *(CGFloat *)v18 = MidX;
  *(CGFloat *)&v18[1] = MidY;
  v18[2] = 0;
  v18[3] = vcvt_f32_f64(v22);
  v23 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
  v83 = *(_OWORD *)off_1E50B83A0;
  v85 = *((_OWORD *)off_1E50B83A0 + 1);
  *v23 = *(_OWORD *)off_1E50B83A0;
  v23[1] = v85;
  v81 = *((_OWORD *)off_1E50B83A0 + 4);
  v82 = *((_OWORD *)off_1E50B83A0 + 5);
  v23[4] = v81;
  v23[5] = v82;
  v79 = *((_OWORD *)off_1E50B83A0 + 2);
  v80 = *((_OWORD *)off_1E50B83A0 + 3);
  v23[2] = v79;
  v23[3] = v80;
  v77 = *((_OWORD *)off_1E50B83A0 + 8);
  v78 = *((_OWORD *)off_1E50B83A0 + 9);
  v23[8] = v77;
  v23[9] = v78;
  v75 = *((_OWORD *)off_1E50B83A0 + 6);
  v76 = *((_OWORD *)off_1E50B83A0 + 7);
  v23[6] = v75;
  v23[7] = v76;
  *(float32x4_t *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v71), v73);
  v24 = *(unsigned int **)(a1 + 32);
  v25 = a3[3] + 160 * v24[218];
  objc_msgSend(v24, "cornerRadius");
  *(float *)&v26 = v26;
  *(int32x4_t *)(v25 + 36) = vdupq_lane_s32(*(int32x2_t *)&v26, 0);
  if (v13)
    v27 = 2;
  else
    v27 = 5;
  v28 = a3[4];
  *(_BYTE *)(v28 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 1) = v27;
  if (v13)
  {
    PXSizeScale();
    v30.f64[1] = v29;
    _D0 = vcvt_f32_f64(v30);
    v28 = a3[4];
  }
  else
  {
    __asm { FMOV            V0.2S, #1.0 }
  }
  *(float32x2_t *)(v28 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 8) = _D0;
  *(_WORD *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 884);
  v36 = *(unsigned int **)(a1 + 32);
  v37 = *(_DWORD *)(a3[1] + 4 * v36[218]);
  objc_msgSend(v36, "entityManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "effectComponent");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __56__PXSharedLibrarySharingSuggestionLayout__updateContent__block_invoke_2;
  v87[3] = &unk_1E5126CC8;
  v88 = v37;
  v87[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v39, "performChanges:", v87);

  v74 = v6;
  v72 = v8;
  PXInsetRectWithValueForEdges();
  x = v93.origin.x;
  y = v93.origin.y;
  v42 = v93.size.width;
  v43 = v93.size.height;
  v44 = CGRectGetMidX(v93);
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = v42;
  v94.size.height = v43;
  v45 = CGRectGetMidY(v94);
  v95.origin.x = x;
  v95.origin.y = y;
  v95.size.width = v42;
  v95.size.height = v43;
  v46 = CGRectGetWidth(v95);
  v69 = v46;
  v96.origin.x = x;
  v96.origin.y = y;
  v96.size.width = v42;
  v96.size.height = v43;
  v47 = CGRectGetHeight(v96);
  v48 = 0;
  v49 = v47;
  v50 = a3[2];
  v51 = v50 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876);
  if (*(double *)v51 == v44 && *(double *)(v51 + 8) == v45 && *(double *)(v51 + 16) == -1.0)
  {
    v52 = *(_QWORD *)(v51 + 24);
    *(float *)&v53 = v69;
    if (*(float *)&v52 == v69)
      v48 = *((float *)&v52 + 1) == v49;
  }
  else
  {
    *(float *)&v53 = v69;
  }
  *((float *)&v53 + 1) = v49;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v48;
  v54 = v50 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876);
  *(double *)v54 = v44;
  *(double *)(v54 + 8) = v45;
  *(_QWORD *)(v54 + 16) = 0xBFF0000000000000;
  *(_QWORD *)(v54 + 24) = v53;
  v55 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876));
  v55[6] = v75;
  v55[7] = v76;
  v55[8] = v77;
  v55[9] = v78;
  v55[2] = v79;
  v55[3] = v80;
  v55[4] = v81;
  v55[5] = v82;
  *v55 = v83;
  v55[1] = v85;
  *(_BYTE *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876) + 1) = 3;
  PXSizeScale();
  v57.f64[1] = v56;
  *(float32x2_t *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876) + 8) = vcvt_f32_f64(v57);
  *(_WORD *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 886);
  v58 = objc_msgSend(v86, "isNew");
  v59 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880));
  v97.origin.x = v74;
  v97.origin.y = v72;
  v97.size.width = v10;
  v97.size.height = v12;
  v60 = CGRectGetMidX(v97);
  v98.origin.x = v74;
  v98.origin.y = v72;
  v98.size.width = v10;
  v98.size.height = v12;
  v61 = CGRectGetMidY(v98);
  v99.origin.x = v74;
  v99.origin.y = v72;
  v99.size.width = v10;
  v99.size.height = v12;
  v70 = CGRectGetWidth(v99);
  v100.origin.x = v74;
  v100.origin.y = v72;
  v100.size.width = v10;
  v100.size.height = v12;
  v62 = CGRectGetHeight(v100);
  v63.f64[0] = v70;
  v63.f64[1] = v62;
  *(CGFloat *)v59 = v60;
  *(CGFloat *)&v59[1] = v61;
  v59[2] = (float32x2_t)0xBFF0000000000000;
  v59[3] = vcvt_f32_f64(v63);
  v64 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880));
  *v64 = v83;
  v64[1] = v85;
  v64[4] = v81;
  v64[5] = v82;
  v64[2] = v79;
  v64[3] = v80;
  v64[8] = v77;
  v64[9] = v78;
  v64[6] = v75;
  v64[7] = v76;
  v65 = *(unsigned int **)(a1 + 32);
  v66 = a3[3] + 160 * v65[220];
  objc_msgSend(v65, "cornerRadius");
  *(float *)&v67 = v67;
  *(int32x4_t *)(v66 + 36) = vdupq_lane_s32(*(int32x2_t *)&v67, 0);
  v68 = a3[4];
  *(float *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880)) = (float)v58;
  *(_BYTE *)(v68 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880)) = 1;
  *(_BYTE *)(v68 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880) + 1) = 10;
  *(_WORD *)(v68 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 888);

}

void __56__PXSharedLibrarySharingSuggestionLayout__updateContent__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 928);
  v4 = a2;
  LODWORD(v3) = objc_msgSend(v3, "effectId");
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "mutableEffectIds");

  *(_DWORD *)(v6 + 4 * *(unsigned int *)(a1 + 40)) = (_DWORD)v3;
}

@end
