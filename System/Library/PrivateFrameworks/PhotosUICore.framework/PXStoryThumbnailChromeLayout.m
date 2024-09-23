@implementation PXStoryThumbnailChromeLayout

- (PXStoryThumbnailChromeLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryThumbnailChromeLayout.m"), 59, CFSTR("%s is not available as initializer"), "-[PXStoryThumbnailChromeLayout init]");

  abort();
}

- (PXStoryThumbnailChromeLayout)initWithModel:(id)a3
{
  id v5;
  PXStoryThumbnailChromeLayout *v6;
  PXStoryThumbnailChromeLayout *v7;
  uint64_t v8;
  PXStoryThumbnailActionPerformer *actionPerformer;
  void *v10;
  uint64_t (**v11)(void *, uint64_t);
  _QWORD aBlock[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryThumbnailChromeLayout;
  v6 = -[PXGAbsoluteCompositeLayout init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](v7->_model, "registerChangeObserver:context:", v7, ModelObservationContext_155849);
    objc_msgSend(v5, "thumbnailActionPerformer");
    v8 = objc_claimAutoreleasedReturnValue();
    actionPerformer = v7->_actionPerformer;
    v7->_actionPerformer = (PXStoryThumbnailActionPerformer *)v8;

    objc_msgSend(v5, "layoutSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PXStoryThumbnailChromeLayout_initWithModel___block_invoke;
    aBlock[3] = &unk_1E512EE78;
    aBlock[4] = &v14;
    v11 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
    v7->_favoriteButtonSpriteIndex = v11[2](v11, objc_msgSend(v10, "thumbnailChromeShowsFavoriteButton"));
    v7->_actionMenuButtonSpriteIndex = v11[2](v11, objc_msgSend(v10, "thumbnailChromeShowsActionMenuButton"));
    v7->_playButtonSpriteIndex = v11[2](v11, objc_msgSend(v10, "thumbnailChromeShowsPlayButton"));
    v7->_detailsViewButtonSpriteIndex = v11[2](v11, objc_msgSend(v5, "detailsViewButtonDisplayStyle") == 2);
    -[PXGLayout addSpriteCount:withInitialState:](v7, "addSpriteCount:withInitialState:", *((unsigned int *)v15 + 6), &__block_literal_global_155896);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    -[PXStoryThumbnailChromeLayout _invalidateIsFavorite](v7, "_invalidateIsFavorite");
    -[PXStoryThumbnailChromeLayout _invalidateContentAlpha](v7, "_invalidateContentAlpha");

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryThumbnailChromeLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryThumbnailChromeLayout _invalidateTransform](self, "_invalidateTransform");
  -[PXStoryThumbnailChromeLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryThumbnailChromeLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryThumbnailChromeLayout _invalidateContentAlpha](self, "_invalidateContentAlpha");
}

- (PXStoryLayoutSpec)spec
{
  void *v2;
  void *v3;

  -[PXStoryThumbnailChromeLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXStoryLayoutSpec *)v3;
}

- (void)setScaleFromTopRightCorner:(double)a3
{
  if (self->_scaleFromTopRightCorner != a3)
  {
    self->_scaleFromTopRightCorner = a3;
    -[PXStoryThumbnailChromeLayout _invalidateContentVersion](self, "_invalidateContentVersion");
  }
}

- (void)setIsFavorite:(BOOL)a3
{
  if (self->_isFavorite != a3)
  {
    self->_isFavorite = a3;
    -[PXStoryThumbnailChromeLayout _invalidateContentVersion](self, "_invalidateContentVersion");
  }
}

- (void)setAlphaOverride:(id)a3
{
  NSNumber *v5;
  char v6;
  NSNumber *v7;

  v7 = (NSNumber *)a3;
  v5 = self->_alphaOverride;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSNumber isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alphaOverride, a3);
      -[PXStoryThumbnailChromeLayout _invalidateContentAlpha](self, "_invalidateContentAlpha");
    }
  }

}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXStoryThumbnailChromeLayout.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryThumbnailChromeLayout _updateIsFavorite](self, "_updateIsFavorite");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout update]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXStoryThumbnailChromeLayout.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryThumbnailChromeLayout _updateTransform](self, "_updateTransform");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXStoryThumbnailChromeLayout.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryThumbnailChromeLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXStoryThumbnailChromeLayout.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryThumbnailChromeLayout _updateContentAlpha](self, "_updateContentAlpha");
      v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXStoryThumbnailChromeLayout.m"), 151, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXStoryThumbnailChromeLayout;
  -[PXGCompositeLayout update](&v18, sel_update);
}

- (void)_invalidateIsFavorite
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout _invalidateIsFavorite]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryThumbnailChromeLayout.m"), 156, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateIsFavorite
{
  id v3;

  -[PXStoryThumbnailChromeLayout model](self, "model");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryThumbnailChromeLayout setIsFavorite:](self, "setIsFavorite:", objc_msgSend(v3, "currentAssetCollectionIsFavorite"));

}

- (void)_invalidateTransform
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout _invalidateTransform]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryThumbnailChromeLayout.m"), 164, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateTransform
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  -[PXStoryThumbnailChromeLayout model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pressAnimationInfo");
  v7 = v6;

  v8 = v4 >= v7 || v7 <= 0.0;
  v9 = v4 / v7;
  if (v8)
    v9 = 1.0;
  -[PXStoryThumbnailChromeLayout setScaleFromTopRightCorner:](self, "setScaleFromTopRightCorner:", v9);
}

- (void)_invalidateContentVersion
{
  ++self->_contentVersion;
  -[PXStoryThumbnailChromeLayout _invalidateContent](self, "_invalidateContent");
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryThumbnailChromeLayout.m"), 179, CFSTR("invalidating %lu after it already has been updated"), 4);

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
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v16;
  uint64_t v17;
  CGFloat MaxX;
  CGFloat MinY;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  double v28;
  double v29;
  _QWORD aBlock[6];
  _QWORD v31[4];
  CGFloat v32;
  CGFloat v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXStoryThumbnailChromeLayout spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailChromePadding");
  v9 = v8;
  v11 = v10;
  PXRectWithOriginAndSize();
  v35 = CGRectInset(v34, v9, v11);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  objc_msgSend(v7, "thumbnailChromeButtonSpacing");
  v17 = v16;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3010000000;
  v32 = 0.0;
  v33 = 0.0;
  v31[3] = &unk_1A7E74EE7;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MinY = CGRectGetMinY(v37);
  v32 = MaxX;
  v33 = MinY;
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PXStoryThumbnailChromeLayout__updateContent__block_invoke;
  aBlock[3] = &unk_1E512EEC0;
  aBlock[4] = v31;
  aBlock[5] = v17;
  v21 = _Block_copy(aBlock);
  v22 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32;
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __46__PXStoryThumbnailChromeLayout__updateContent__block_invoke_2;
  v25[3] = &unk_1E512EEE8;
  v25[4] = self;
  v23 = v21;
  v27 = v23;
  v24 = v7;
  v26 = v24;
  v28 = v4;
  v29 = v6;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v22, v25);
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v4, v6);

  _Block_object_dispose(v31, 8);
}

- (void)_invalidateContentAlpha
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryThumbnailChromeLayout _invalidateContentAlpha]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryThumbnailChromeLayout.m"), 257, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_updateContentAlpha
{
  double v3;
  double v4;
  void *v5;
  float v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[7];

  -[PXGLayout alpha](self, "alpha");
  v4 = v3;
  -[PXStoryThumbnailChromeLayout alphaOverride](self, "alphaOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue", v5);
    v4 = v6;
  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1.0;
  if (objc_msgSend(v7, "showFeedChromeOnHover"))
  {
    -[PXStoryThumbnailChromeLayout model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double)objc_msgSend(v9, "isHovering");

  }
  v10 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__PXStoryThumbnailChromeLayout__updateContentAlpha__block_invoke;
  v13[3] = &unk_1E51472A8;
  v13[4] = self;
  *(double *)&v13[5] = v4;
  *(double *)&v13[6] = v8;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v10 << 32, v13);

}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a4;
  if (self->_actionMenuButtonSpriteIndex != a3
    && self->_favoriteButtonSpriteIndex != a3
    && self->_playButtonSpriteIndex != a3
    && self->_detailsViewButtonSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryThumbnailChromeLayout.m"), 292, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v4);
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  -[PXStoryThumbnailChromeLayout scaleFromTopRightCorner](self, "scaleFromTopRightCorner");
  PXPointSubtract();
  PXAffineTransformMakeScaleFromPoint();
  if (self->_actionMenuButtonSpriteIndex != (_DWORD)v4
    && self->_favoriteButtonSpriteIndex != (_DWORD)v4
    && self->_playButtonSpriteIndex != (_DWORD)v4
    && self->_detailsViewButtonSpriteIndex != (_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryThumbnailChromeLayout.m"), 305, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXStoryThumbnailChromeLayout _buttonConfigurationForSpriteIndex:](self, "_buttonConfigurationForSpriteIndex:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  objc_msgSend(v8, "setTransform:", v11);

  return v8;
}

- (id)_buttonConfigurationForSpriteIndex:(unsigned int)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v20;

  if (self->_actionMenuButtonSpriteIndex != a3)
  {
    if (self->_favoriteButtonSpriteIndex == a3)
    {
      if (-[PXStoryThumbnailChromeLayout isFavorite](self, "isFavorite"))
        v6 = CFSTR("suit.heart.fill");
      else
        v6 = CFSTR("suit.heart");
      -[PXStoryThumbnailChromeLayout _baseConfigurationForButtonWithSystemImageName:](self, "_baseConfigurationForButtonWithSystemImageName:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7;
      v8 = sel__handleFavoriteButton_;
    }
    else
    {
      if (self->_playButtonSpriteIndex == a3)
      {
        -[PXStoryThumbnailChromeLayout _baseConfigurationForButtonWithSystemImageName:](self, "_baseConfigurationForButtonWithSystemImageName:", CFSTR("play.fill"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setAction:", sel__handlePlayButton_);
        -[PXStoryThumbnailChromeLayout spec](self, "spec");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "thumbnailChromePlayButtonSpec");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSpec:", v10);

        -[PXStoryThumbnailChromeLayout spec](self, "spec");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "thumbnailChromePlayButtonSpec");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setBackgroundStyle:", objc_msgSend(v12, "backgroundStyle"));

        objc_msgSend(v4, "setBackgroundExtendsUnderLabel:", 1);
        PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionPlay"), CFSTR("PhotosUICore"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setLabel:", v13);

        objc_msgSend(v4, "setPointerShape:", 0);
        return v4;
      }
      if (self->_detailsViewButtonSpriteIndex != a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryThumbnailChromeLayout.m"), 331, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      -[PXStoryThumbnailChromeLayout _baseConfigurationForButtonWithSystemImageName:](self, "_baseConfigurationForButtonWithSystemImageName:", CFSTR("square.grid.3x3.fill"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryThumbnailChromeLayout spec](self, "spec");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "thumbnailChromeDetailsViewButtonSpec");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSpec:", v15);

      -[PXStoryThumbnailChromeLayout spec](self, "spec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "thumbnailChromeDetailsViewButtonSpec");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSystemImageStyle:", objc_msgSend(v17, "systemImageStyle"));

      v8 = sel__handleDetailsViewButton_;
      v7 = v4;
    }
    objc_msgSend(v7, "setAction:", v8);
    return v4;
  }
  -[PXStoryThumbnailChromeLayout _baseConfigurationForButtonWithSystemImageName:](self, "_baseConfigurationForButtonWithSystemImageName:", CFSTR("ellipsis.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXMenuBuilder defaultStoryThumbnailActionsMenuWithModel:isFavorite:](PXMenuBuilder, "defaultStoryThumbnailActionsMenuWithModel:isFavorite:", self->_model, -[PXStoryThumbnailChromeLayout isFavorite](self, "isFavorite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMenu:", v5);

  return v4;
}

- (id)_baseConfigurationForButtonWithSystemImageName:(id)a3
{
  id v4;
  PXStoryChromeButtonConfiguration *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(PXStoryChromeButtonConfiguration);
  -[PXStoryChromeButtonConfiguration setSystemImageName:](v5, "setSystemImageName:", v4);

  -[PXStoryChromeButtonConfiguration setTarget:](v5, "setTarget:", self);
  -[PXStoryThumbnailChromeLayout spec](self, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailChromeButtonSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButtonConfiguration setSpec:](v5, "setSpec:", v7);

  -[PXStoryChromeButtonConfiguration setPointerShape:](v5, "setPointerShape:", 1);
  PXEdgeInsetsMake();
  -[PXStoryChromeButtonConfiguration setPointerShapeInsets:](v5, "setPointerShapeInsets:");
  -[PXStoryChromeButtonConfiguration setPreferredSystemImageWeight:](v5, "setPreferredSystemImageWeight:", 6);
  return v5;
}

- (void)_handleFavoriteButton:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  -[PXStoryThumbnailChromeLayout setIsFavorite:](self, "setIsFavorite:", -[PXStoryThumbnailChromeLayout isFavorite](self, "isFavorite") ^ 1);
  objc_initWeak(&location, self);
  -[PXStoryThumbnailChromeLayout actionPerformer](self, "actionPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXStoryThumbnailChromeLayout isFavorite](self, "isFavorite");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PXStoryThumbnailChromeLayout__handleFavoriteButton___block_invoke;
  v7[3] = &unk_1E5142510;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "setFavorite:completionHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_handlePlayButton:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXStoryThumbnailChromeLayout actionPerformer](self, "actionPerformer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentPlayerAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "presentPlayerAction");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v5 + 16))();
  }
  else
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A6789000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "%@ should provide presentPlayerAction block to support play action", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)_handleDetailsViewButton:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXStoryThumbnailChromeLayout actionPerformer](self, "actionPerformer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentDetailsViewAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "presentDetailsViewAction");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v5 + 16))();
  }
  else
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A6789000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "%@ should provide presentDetailsViewAction block to support segue action", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5;

  v5 = a3;
  -[PXGLayout alpha](self, "alpha");
  objc_msgSend(v5, "setChromeAlpha:");

}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  void *v5;
  id v6;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "chromeAlpha");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryThumbnailChromeLayout setAlphaOverride:](self, "setAlphaOverride:", v6);

  }
  else
  {
    -[PXStoryThumbnailChromeLayout setAlphaOverride:](self, "setAlphaOverride:", 0, a4);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((void *)ModelObservationContext_155849 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryThumbnailChromeLayout.m"), 409, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 0x200000000000) != 0)
  {
    -[PXStoryThumbnailChromeLayout _invalidateIsFavorite](self, "_invalidateIsFavorite");
    if ((a4 & 0x2000) == 0)
    {
LABEL_4:
      if ((a4 & 0x4000000000000000) == 0)
        goto LABEL_5;
LABEL_11:
      -[PXStoryThumbnailChromeLayout _invalidateContentAlpha](self, "_invalidateContentAlpha");
      if ((a4 & 0x8000000000000000) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((a4 & 0x2000) == 0)
  {
    goto LABEL_4;
  }
  -[PXStoryThumbnailChromeLayout _invalidateContentVersion](self, "_invalidateContentVersion");
  if ((a4 & 0x4000000000000000) != 0)
    goto LABEL_11;
LABEL_5:
  if ((a4 & 0x8000000000000000) == 0)
    goto LABEL_6;
LABEL_12:
  -[PXStoryThumbnailChromeLayout _invalidateTransform](self, "_invalidateTransform");
LABEL_6:
  -[PXStoryThumbnailChromeLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "thumbnailChromeShowsPlayButton"))
  {

    if ((a4 & 0x2000000000000000) != 0)
      -[PXStoryThumbnailChromeLayout _invalidateContentVersion](self, "_invalidateContentVersion");
  }
  else
  {

  }
}

- (NSIndexSet)axSpriteIndexes
{
  NSIndexSet *axSpriteIndexes;
  uint64_t v4;
  NSIndexSet *v5;
  NSIndexSet *v6;

  axSpriteIndexes = self->_axSpriteIndexes;
  if (!axSpriteIndexes)
  {
    v4 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
    v5 = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v4);
    v6 = self->_axSpriteIndexes;
    self->_axSpriteIndexes = v5;

    axSpriteIndexes = self->_axSpriteIndexes;
  }
  return axSpriteIndexes;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  return 2;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryThumbnailActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (double)scaleFromTopRightCorner
{
  return self->_scaleFromTopRightCorner;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

void __54__PXStoryThumbnailChromeLayout__handleFavoriteButton___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_invalidateIsFavorite");

  }
}

void __51__PXStoryThumbnailChromeLayout__updateContentAlpha__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, float *a4)
{
  unint64_t v4;
  uint64_t i;
  double v8;
  _DWORD *v9;
  void *v10;
  char v11;
  double v12;
  float v13;

  v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    for (i = 0; v4 != i; ++i)
    {
      v8 = *(double *)(a1 + 40);
      v9 = *(_DWORD **)(a1 + 32);
      if (i == v9[257])
      {
        if ((objc_msgSend(v9, "isFavorite") & 1) != 0)
          goto LABEL_7;
        v9 = *(_DWORD **)(a1 + 32);
      }
      objc_msgSend(v9, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "thumbnailChromeShowsPlayButton");

      if ((v11 & 1) != 0)
      {
LABEL_7:
        if (i == *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1032))
        {
          v12 = fmax(v8 * 15.0 + -14.0, 0.0);
          if (v12 <= 1.0)
            v8 = v12;
          else
            v8 = 1.0;
        }
        goto LABEL_12;
      }
      v8 = v8 * *(double *)(a1 + 48);
LABEL_12:
      v13 = v8;
      *a4 = v13;
      a4 += 40;
    }
  }
}

double __46__PXStoryThumbnailChromeLayout__updateContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double x;
  CGRect v10;

  v3 = a2;
  +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v3);
  PXRectWithOriginAndSize();
  PXRectWithSizeAlignedToRectEdges();
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "offset");

  PXPointAdd();
  x = v10.origin.x;
  v10.size.width = v5;
  v10.size.height = v7;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectGetMinX(v10) - *(double *)(a1 + 40);
  return x;
}

void __46__PXStoryThumbnailChromeLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  float32x2_t *v18;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v22;
  uint64_t v23;
  void *v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  float32x2_t *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  float64x2_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  void *v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  CGFloat x;
  CGFloat y;
  CGFloat v61;
  CGFloat v62;
  double MinX;
  double v64;
  double v65;
  CGFloat v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double MaxY;
  double v77;
  float32x2_t *v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  float64x2_t v82;
  void *v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  float32x2_t *v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  float64x2_t v92;
  CGFloat Width;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v8 = *(_DWORD **)(a1 + 32);
  if (v8[256] != -1)
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "_buttonConfigurationForSpriteIndex:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (*(double (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v18 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1024));
    v97.origin.x = v11;
    v97.origin.y = v13;
    v97.size.width = v15;
    v97.size.height = v17;
    MidX = CGRectGetMidX(v97);
    v98.origin.x = v11;
    v98.origin.y = v13;
    v98.size.width = v15;
    v98.size.height = v17;
    MidY = CGRectGetMidY(v98);
    v99.origin.x = v11;
    v99.origin.y = v13;
    v99.size.width = v15;
    v99.size.height = v17;
    Width = CGRectGetWidth(v99);
    v100.origin.x = v11;
    v100.origin.y = v13;
    v100.size.width = v15;
    v100.size.height = v17;
    Height = CGRectGetHeight(v100);
    v22.f64[0] = Width;
    v22.f64[1] = Height;
    *(CGFloat *)v18 = MidX;
    *(CGFloat *)&v18[1] = MidY;
    v18[2] = (float32x2_t)0xC059000000000000;
    v18[3] = vcvt_f32_f64(v22);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1024) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 1040);
    v8 = *(_DWORD **)(a1 + 32);
  }
  if (v8[257] != -1)
  {
    v23 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "_buttonConfigurationForSpriteIndex:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (*(double (**)(uint64_t, void *))(v23 + 16))(v23, v24);
    v27 = v26;
    v29 = v28;
    v31 = v30;

    v32 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1028));
    v101.origin.x = v25;
    v101.origin.y = v27;
    v101.size.width = v29;
    v101.size.height = v31;
    v33 = CGRectGetMidX(v101);
    v102.origin.x = v25;
    v102.origin.y = v27;
    v102.size.width = v29;
    v102.size.height = v31;
    v34 = CGRectGetMidY(v102);
    v103.origin.x = v25;
    v103.origin.y = v27;
    v103.size.width = v29;
    v103.size.height = v31;
    v94 = CGRectGetWidth(v103);
    v104.origin.x = v25;
    v104.origin.y = v27;
    v104.size.width = v29;
    v104.size.height = v31;
    v35 = CGRectGetHeight(v104);
    v36.f64[0] = v94;
    v36.f64[1] = v35;
    *(CGFloat *)v32 = v33;
    *(CGFloat *)&v32[1] = v34;
    v32[2] = (float32x2_t)0xC059000000000000;
    v32[3] = vcvt_f32_f64(v36);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1028) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 1040);
    v8 = *(_DWORD **)(a1 + 32);
  }
  if (v8[258] != -1)
  {
    objc_msgSend(v8, "rootLayout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "coordinateSpace");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "model");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "presentedTitleFrame");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "rectInCoordinateSpace:", v38);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    objc_msgSend(*(id *)(a1 + 32), "model");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "presentedSubtitleFrame");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "rectInCoordinateSpace:", v38);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;

    v105.origin.x = v42;
    v105.origin.y = v44;
    v105.size.width = v46;
    v105.size.height = v48;
    v116.origin.x = v52;
    v116.origin.y = v54;
    v116.size.width = v56;
    v116.size.height = v58;
    v106 = CGRectUnion(v105, v116);
    x = v106.origin.x;
    y = v106.origin.y;
    v61 = v106.size.width;
    v62 = v106.size.height;
    MinX = *MEMORY[0x1E0C9D648];
    v64 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v65 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v66 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v117.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
    v117.origin.y = v64;
    v117.size.width = v65;
    v117.size.height = v66;
    if (!CGRectEqualToRect(v106, v117))
    {
      objc_msgSend(*(id *)(a1 + 32), "_buttonConfigurationForSpriteIndex:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1032));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v67);
      v65 = v68;
      v66 = v69;

      objc_msgSend(*(id *)(a1 + 32), "model");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "titleAlignment");

      v72 = x;
      v73 = y;
      v74 = v61;
      v75 = v62;
      if (v71 == 2)
      {
        MinX = CGRectGetMaxX(*(CGRect *)&v72) - v65;
      }
      else if (v71)
      {
        MinX = CGRectGetMidX(*(CGRect *)&v72) + v65 * -0.5;
      }
      else
      {
        MinX = CGRectGetMinX(*(CGRect *)&v72);
      }
      v107.origin.x = x;
      v107.origin.y = y;
      v107.size.width = v61;
      v107.size.height = v62;
      MaxY = CGRectGetMaxY(v107);
      objc_msgSend(*(id *)(a1 + 40), "thumbnailPlayButtonPadding");
      v64 = MaxY + v77;
    }
    v78 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1032));
    v108.origin.x = MinX;
    v108.origin.y = v64;
    v108.size.width = v65;
    v108.size.height = v66;
    v79 = CGRectGetMidX(v108);
    v109.origin.x = MinX;
    v109.origin.y = v64;
    v109.size.width = v65;
    v109.size.height = v66;
    v80 = CGRectGetMidY(v109);
    v110.origin.x = MinX;
    v110.origin.y = v64;
    v110.size.width = v65;
    v110.size.height = v66;
    v95 = CGRectGetWidth(v110);
    v111.origin.x = MinX;
    v111.origin.y = v64;
    v111.size.width = v65;
    v111.size.height = v66;
    v81 = CGRectGetHeight(v111);
    v82.f64[0] = v95;
    v82.f64[1] = v81;
    *(CGFloat *)v78 = v79;
    *(CGFloat *)&v78[1] = v80;
    v78[2] = (float32x2_t)0xC059000000000000;
    v78[3] = vcvt_f32_f64(v82);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1032) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 1040);

    v8 = *(_DWORD **)(a1 + 32);
  }
  if (v8[259] != -1)
  {
    objc_msgSend(v8, "_buttonConfigurationForSpriteIndex:", v8[258]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v83);

    PXRectWithOriginAndSize();
    objc_msgSend(*(id *)(a1 + 40), "thumbnailChromeDetailsViewButtonPadding");
    PXRectWithSizeAlignedToRectEdgesWithPadding();
    v84 = v112.origin.x;
    v85 = v112.origin.y;
    v86 = v112.size.width;
    v87 = v112.size.height;
    v88 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1036));
    v89 = CGRectGetMidX(v112);
    v113.origin.x = v84;
    v113.origin.y = v85;
    v113.size.width = v86;
    v113.size.height = v87;
    v90 = CGRectGetMidY(v113);
    v114.origin.x = v84;
    v114.origin.y = v85;
    v114.size.width = v86;
    v114.size.height = v87;
    v96 = CGRectGetWidth(v114);
    v115.origin.x = v84;
    v115.origin.y = v85;
    v115.size.width = v86;
    v115.size.height = v87;
    v91 = CGRectGetHeight(v115);
    v92.f64[0] = v96;
    v92.f64[1] = v91;
    *(CGFloat *)v88 = v89;
    *(CGFloat *)&v88[1] = v90;
    v88[2] = (float32x2_t)0xC059000000000000;
    v88[3] = vcvt_f32_f64(v92);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1036) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 1040);
  }
}

uint64_t __46__PXStoryThumbnailChromeLayout_initWithModel___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t result;

  if (!a2)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(unsigned int *)(v2 + 24);
  *(_DWORD *)(v2 + 24) = result + 1;
  return result;
}

void __46__PXStoryThumbnailChromeLayout_initWithModel___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;

  if (*a3)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = *((_OWORD *)off_1E50B83A0 + 6);
    v7 = *((_OWORD *)off_1E50B83A0 + 7);
    v8 = *((_OWORD *)off_1E50B83A0 + 8);
    v9 = *((_OWORD *)off_1E50B83A0 + 9);
    v10 = *((_OWORD *)off_1E50B83A0 + 2);
    v11 = *((_OWORD *)off_1E50B83A0 + 3);
    v12 = *((_OWORD *)off_1E50B83A0 + 4);
    v13 = *((_OWORD *)off_1E50B83A0 + 5);
    v14 = *(_OWORD *)off_1E50B83A0;
    v15 = *((_OWORD *)off_1E50B83A0 + 1);
    do
    {
      v16 = (_OWORD *)(*((_QWORD *)a3 + 3) + v3);
      v16[6] = v6;
      v16[7] = v7;
      v16[8] = v8;
      v16[9] = v9;
      v16[2] = v10;
      v16[3] = v11;
      v16[4] = v12;
      v16[5] = v13;
      *v16 = v14;
      v16[1] = v15;
      *(_WORD *)(*((_QWORD *)a3 + 4) + v4) = 2561;
      ++v5;
      v4 += 40;
      v3 += 160;
    }
    while (v5 < *a3);
  }
}

@end
