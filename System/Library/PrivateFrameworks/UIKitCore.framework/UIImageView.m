@implementation UIImageView

- (id)_symbolConfigurationForImage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_automaticSymbolConfiguration");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  -[UIImageView preferredSymbolConfiguration](self, "preferredSymbolConfiguration");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v5;
  v13 = v12;

  -[UIImageView _overridingSymbolConfiguration](self, "_overridingSymbolConfiguration");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v5;
  v17 = v16;

  objc_msgSend(v9, "configurationByApplyingConfiguration:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "configurationByApplyingConfiguration:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "configurationByApplyingConfiguration:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView _effectiveImageViewTraitCollectionForResolvingImages](self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configurationByApplyingConfiguration:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_effectiveImageViewTraitCollectionForResolvingImages
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("BUG IN CLIENT: UIImageView trait collection unexpectedly found nil. Did you override traitCollection to return nil? That's illegal. imageView = %@"), v1);
        v2 = 0;
      }
      else
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "traitCollection");
        v2 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v2, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", objc_msgSend(v1, "effectiveUserInterfaceLayoutDirection"), 0x1E1A994C8);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return -[_UIImageViewStorage preferredSymbolConfiguration](self->_storage, "preferredSymbolConfiguration");
}

- (BOOL)_canDrawContent
{
  unsigned int imageViewFlags;
  UIImageView *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  char v11;
  __int16 v12;
  void *v13;
  void *v14;
  int v15;

  imageViewFlags = self->_imageViewFlags;
  if ((imageViewFlags & 1) == 0)
  {
    v4 = self;
    if ((unint64_t)-[UIView contentMode](v4, "contentMode") >= UIViewContentModeCenter)
    {
LABEL_18:

      v12 = (__int16)self->_imageViewFlags;
LABEL_19:
      v15 = 1;
LABEL_20:
      imageViewFlags = v15 | v12 & 0xFFFC;
      *(_WORD *)&self->_imageViewFlags = imageViewFlags;
      return (imageViewFlags >> 1) & 1;
    }
    -[UIImageView _currentImage](v4, "_currentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIImageView isHighlighted](v4, "isHighlighted"))
    {
      if (!v5)
        goto LABEL_13;
      v6 = v5;
      objc_msgSend(v6, "CIImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {

        goto LABEL_13;
      }
      v8 = objc_msgSend(v6, "_representsCIImageWhichSupportsIOSurfaceRendering");

      if (v8)
      {
LABEL_13:
        -[UIImageView _currentHighlightedImage](v4, "_currentHighlightedImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v13;
        if (v13)
        {
          objc_msgSend(v13, "CIImage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14 || objc_msgSend(v9, "_representsCIImageWhichSupportsIOSurfaceRendering"))
            goto LABEL_16;
        }

        v12 = (__int16)self->_imageViewFlags;
        if (!v9)
          goto LABEL_19;
LABEL_23:
        v15 = 3;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v5)
        goto LABEL_17;
      v9 = v5;
      objc_msgSend(v9, "CIImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_16:

        goto LABEL_17;
      }
      v11 = objc_msgSend(v9, "_representsCIImageWhichSupportsIOSurfaceRendering");

      if ((v11 & 1) != 0)
      {
LABEL_17:

        goto LABEL_18;
      }
    }

    v12 = (__int16)self->_imageViewFlags;
    goto LABEL_23;
  }
  return (imageViewFlags >> 1) & 1;
}

- (void)setFrame:(CGRect)a3
{
  -[UIImageView _setViewGeometry:forMetric:](self, "_setViewGeometry:forMetric:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_invalidateResolvedImages
{
  UITraitCollection *lastResolvedImageViewTraitCollection;
  void *v4;
  void *v5;
  char v6;

  -[_UIImageViewStorage setResolvedImage:](self->_storage, "setResolvedImage:", 0);
  -[_UIImageViewStorage setResolvedHighlightedImage:](self->_storage, "setResolvedHighlightedImage:", 0);
  lastResolvedImageViewTraitCollection = self->_lastResolvedImageViewTraitCollection;
  self->_lastResolvedImageViewTraitCollection = 0;

  -[_UIImageViewStorage image](self->_storage, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCIImage");

  if ((v6 & 1) == 0)
    -[_UIImageViewStorage setCIRenderer:](self->_storage, "setCIRenderer:", 0);
}

- (void)_applyImageLayout:(id)a3 toLayer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _UIImageViewSymbolAnimationPresetManager *animationPresetManager;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __int16 imageViewFlags;
  uint64_t v27;
  __int16 v28;
  _OWORD v29[3];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  UIImageView *v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  -[UIImageView image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIImageView _usesRenderBoxToRenderImage:withLayout:](self, "_usesRenderBoxToRenderImage:withLayout:", v8, v6);

  if (v9)
  {
    objc_msgSend(v7, "setContents:", 0);
    -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0D87450], "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v10, "setAnchorPoint:", *MEMORY[0x1E0C9D538], v12);
      -[UIView layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSublayer:", v10);

      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setAnchorPoint:", v11, v12);
      objc_msgSend(v10, "setAnimator:", v14);
      -[UIImageView _setRBSymbolLayer:](self, "_setRBSymbolLayer:", v10);

    }
    animationPresetManager = self->_animationPresetManager;
    -[UIImageView image](self, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewSymbolAnimationPresetManager pendingSymbolContentTransitionForSettingSymbolImage:](animationPresetManager, "pendingSymbolContentTransitionForSettingSymbolImage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if ((objc_msgSend(v17, "isPendingLayoutPass") & 1) == 0)
      {
        objc_msgSend(v17, "sourceSymbolImage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bounds](self, "bounds");
        -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView _setupRBSymbolLayerWithSymbolImageLayout:](self, "_setupRBSymbolLayerWithSymbolImageLayout:", v21);
        objc_msgSend(v17, "setPendingLayoutPass:", 1);
        -[UIImageView _effectiveSymbolContentTransitionContainerView](self, "_effectiveSymbolContentTransitionContainerView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[UIView bounds](self, "bounds");
          -[UIView convertRect:toView:](self, "convertRect:toView:", v22);
          objc_msgSend(v17, "setInitialSymbolAbsoluteRect:");
        }
        v23 = (void *)UIApp;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __41__UIImageView__applyImageLayout_toLayer___block_invoke;
        v33[3] = &unk_1E16B51E8;
        v34 = v17;
        v35 = self;
        v36 = v18;
        v37 = v10;
        v24 = v18;
        objc_msgSend(v23, "_performBlockAfterCATransactionCommits:", v33);

      }
    }
    else
    {
      -[UIImageView _setupSymbolLayerForCurrentSymbolImageLayout:](self, "_setupSymbolLayerForCurrentSymbolImageLayout:", v6);
    }

  }
  else
  {
    -[UIImageView _teardownRBSymbolLayerIfNeeded](self, "_teardownRBSymbolLayerIfNeeded");
    objc_msgSend(v6, "contents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContents:", v25);

    -[UIImageView _applyEffectsFromLayout:](self, "_applyEffectsFromLayout:", v6);
    if (v6)
    {
      objc_msgSend(v6, "contentsTransform");
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v30 = 0u;
    }
    v29[0] = v30;
    v29[1] = v31;
    v29[2] = v32;
    objc_msgSend(v7, "setContentsTransform:", v29);
    objc_msgSend(v6, "contentsScaleFactor");
    -[UIImageView setContentScaleFactor:](self, "setContentScaleFactor:");
    if (qword_1ECD79C88 != -1)
      dispatch_once(&qword_1ECD79C88, &__block_literal_global_662);
    if (byte_1ECD79C72 == 1)
    {
      imageViewFlags = (__int16)self->_imageViewFlags;
      -[UIImageView image](self, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v10, "isSymbolImage");
      if ((imageViewFlags & 0x20) != 0)
      {
        if ((_DWORD)v27)
          v28 = 64;
        else
          v28 = 0;
        *(_WORD *)&self->_imageViewFlags = *(_WORD *)&self->_imageViewFlags & 0xFFBF | v28;
      }
      else
      {
        objc_msgSend(v7, "setContentsAlignsToPixels:", v27);
      }
    }
    else
    {
      -[UIImageView image](self, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _setLayerAllowsEdgeAntialiasing:](self, "_setLayerAllowsEdgeAntialiasing:", objc_msgSend(v10, "isSymbolImage"));
    }
  }

}

- (id)_currentImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_UIImageViewStorage resolvedImage](self->_storage, "resolvedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIImageViewStorage image](self->_storage, "image");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (UIImage)image
{
  return -[_UIImageViewStorage image](self->_storage, "image");
}

- (void)setContentScaleFactor:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  -[UIView setContentScaleFactor:](&v6, sel_setContentScaleFactor_);
  -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentScaleFactor:", a3);

}

- (void)_teardownRBSymbolLayerIfNeeded
{
  void *v3;
  _UIImageViewSymbolAnimationPresetManager *animationPresetManager;
  void *v5;
  id v6;

  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "removeFromSuperlayer");
    objc_msgSend(v6, "setAnimator:", 0);
    -[UIImageView _setRBSymbolLayer:](self, "_setRBSymbolLayer:", 0);
    animationPresetManager = self->_animationPresetManager;
    objc_msgSend(MEMORY[0x1E0CE86E8], "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewSymbolAnimationPresetManager removeAllSymbolEffectsWithOptions:animated:](animationPresetManager, "removeAllSymbolEffectsWithOptions:animated:", v5, 0);

    -[_UIImageViewSymbolAnimationPresetManager discardPendingSymbolContentTransitions](self->_animationPresetManager, "discardPendingSymbolContentTransitions");
    v3 = v6;
  }

}

- (RBSymbolLayer)_rbSymbolLayer
{
  return (RBSymbolLayer *)objc_getAssociatedObject(self, &renderBoxSymbolLayerKey);
}

- (BOOL)_usesRenderBoxToRenderImage:(id)a3 withLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isSymbolImage")
    && -[UIImageView _hasReasonToUseRBSymbolLayerForImage:](self, "_hasReasonToUseRBSymbolLayerForImage:", v6))
  {
    objc_msgSend(v7, "rbSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_effectiveRenderingModeForSource:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  id v7;
  int64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "renderingMode");
  if (!v8)
  {
    v8 = -[UIImageView _defaultRenderingMode](self, "_defaultRenderingMode");
    if (!v8)
      v8 = objc_msgSend(v6, "_effectiveRenderingModeWithSymbolConfiguration:", v7);
  }

  return v8;
}

- (int64_t)_defaultRenderingMode
{
  return -[_UIImageViewStorage defaultRenderingMode](self->_storage, "defaultRenderingMode");
}

- (id)_resolvedImageFromImage:(void *)a3 withImageViewTrait:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = v5;
    v8 = a3;
    if (objc_msgSend(v7, "_isSymbolImage"))
      objc_msgSend(a1, "_symbolConfigurationForImage:", v7);
    else
      objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    objc_msgSend(v9, "_effectiveTraitCollectionForImageLookup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (v11)
    {
      -[UITraitCollection _traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection:](v10, (uint64_t)v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "configurationWithTraitCollection:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v7;
    v15 = (void *)_UISetCurrentFallbackEnvironment(a1);
    objc_msgSend(a1, "_preferredSymbolVariant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(a1, "_preferredSymbolVariant");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_imageByApplyingSymbolVariant:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v18;
    }
    objc_msgSend(v14, "imageWithConfiguration:", v13);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

    _UIRestorePreviousFallbackEnvironment(v15);
  }

  return a1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  -[UIImageView animationImages](self, "animationImages", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _currentImage](self, "_currentImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "count");
  v9 = v4;
  if (v8 || (v10 = objc_msgSend(v5, "count"), v9 = v5, v10))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
LABEL_4:
      v12 = _UIAccessibilityContentSizeCategorySizeForImage(v11, self);
      v14 = v13;
      -[UIImageView _edgeInsetsForEffects](self, "_edgeInsetsForEffects");
      v17 = v16 + v12 + v15;
      v20 = v19 + v14 + v18;
      goto LABEL_11;
    }
  }
  else
  {
    v21 = v6;
    if (v6 || (v21 = v7) != 0)
    {
      v11 = v21;
      goto LABEL_4;
    }
  }
  -[UIImageView _placeholderView](self, "_placeholderView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0C9D820];
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v22, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v17 = v24;
    v20 = v25;

    v11 = 0;
  }
  else
  {
    v11 = 0;
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
LABEL_11:

  v26 = v17;
  v27 = v20;
  result.height = v27;
  result.width = v26;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[UIImageView _activeImage](self, "_activeImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v3, 0, 1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "alignmentRectInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForEffects
{
  UIEdgeInsets *p_cachedEdgeInsetsForEffects;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if ((*(_WORD *)&self->_imageViewFlags & 0x10) != 0)
  {
    p_cachedEdgeInsetsForEffects = &self->_cachedEdgeInsetsForEffects;
    *(_OWORD *)&self->_cachedEdgeInsetsForEffects.top = 0u;
    *(_OWORD *)&self->_cachedEdgeInsetsForEffects.bottom = 0u;
    -[UIImageView _activeImage](self, "_activeImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[UIImageView _edgeInsetsForEffectsForImage:](self, "_edgeInsetsForEffectsForImage:", v4);
      p_cachedEdgeInsetsForEffects->top = v5;
      p_cachedEdgeInsetsForEffects->left = v6;
      p_cachedEdgeInsetsForEffects->bottom = v7;
      p_cachedEdgeInsetsForEffects->right = v8;
    }
    *(_WORD *)&self->_imageViewFlags &= ~0x10u;

  }
  top = self->_cachedEdgeInsetsForEffects.top;
  left = self->_cachedEdgeInsetsForEffects.left;
  bottom = self->_cachedEdgeInsetsForEffects.bottom;
  right = self->_cachedEdgeInsetsForEffects.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)_activeImage
{
  void *v3;

  if (!-[UIImageView isHighlighted](self, "isHighlighted")
    || (-[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIImageView _currentImage](self, "_currentImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_setViewGeometry:(CGRect)a3 forMetric:(int)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  char **v14;
  UIImageView **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  BOOL v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  double v30;
  double v31;
  UIImageView *v32;
  UIImageView *v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  if (a4 == 1)
  {
    v32 = self;
    v14 = &selRef_setBounds_;
    v15 = &v32;
    goto LABEL_5;
  }
  if (!a4)
  {
    v33 = self;
    v14 = &selRef_setFrame_;
    v15 = &v33;
LABEL_5:
    v15[1] = (UIImageView *)UIImageView;
    objc_msgSendSuper2((objc_super *)v15, *v14, x, y, width, height, v32);
  }
  -[UIImageView _updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass](self, "_updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass");
  -[UIImageView _currentImage](self, "_currentImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (width != v11 || height != v13)
  {
    if (-[UIImageView _canDrawContent](self, "_canDrawContent"))
    {
LABEL_9:
      -[UIImageView _updateState](self, "_updateState");
LABEL_14:
      -[UIImageView _imageContentParametersDidChange](self, "_imageContentParametersDidChange");
      goto LABEL_15;
    }
    objc_msgSend(v16, "content");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "canScaleImageToTargetResolution"))
    {

    }
    else
    {
      objc_msgSend(v17, "content");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "canScaleImageToTargetResolution");

      if (!v20)
      {
        objc_msgSend(v16, "content");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isCGImage"))
        {

        }
        else
        {
          objc_msgSend(v17, "content");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isCGImage");

          if (!v24)
            goto LABEL_9;
        }
        v25 = -[UIImageView _recomputePretilingState](self, "_recomputePretilingState");
        v26 = v25;
        if (v25)
          -[UIImageView _updateState](self, "_updateState");
        -[UIView layer](self, "layer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "contentsScaling");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 != (void *)*MEMORY[0x1E0CD29F0];

        -[UIView bounds](self, "bounds");
        if (((v29 ^ objc_msgSend(v16, "_isTiledWhenStretchedToSize:", v30, v31)) & 1) == 0)
          _setContentStretchForImage(self, v16);
        if (v26)
          goto LABEL_14;
        goto LABEL_9;
      }
    }
    v21 = -[UIImageView _animatesContents](self, "_animatesContents");
    -[UIImageView _setAnimatesContents:](self, "_setAnimatesContents:", 1);
    -[UIImageView _updateState](self, "_updateState");
    -[UIImageView _setAnimatesContents:](self, "_setAnimatesContents:", v21);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)_updateState
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  _BOOL4 v15;
  char v16;
  void *v17;
  id v18;

  *(_WORD *)&self->_imageViewFlags &= ~4u;
  if ((*(_QWORD *)&self->super._viewFlags & 0x1000) != 0)
    return;
  if (-[UIImageView _canDrawContent](self, "_canDrawContent"))
  {
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    v3 = 0;
LABEL_4:
    -[UIImageView _updateHDRFlags:](self, "_updateHDRFlags:", v3);
    return;
  }
  -[UIImageView _invalidateImageLayouts](self, "_invalidateImageLayouts");
  -[UIImageView _currentImage](self, "_currentImage");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UIImageView isHighlighted](self, "isHighlighted"))
  {
    -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[UIImageView isHighlighted](self, "isHighlighted") && (-[UIImageView isAnimating](self, "isAnimating") || !v4))
  {
    -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v10 = v7;
      objc_msgSend(v7, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _setContentStretchForImage(self, v11);

      goto LABEL_18;
    }
  }
  if (-[UIImageView isAnimating](self, "isAnimating") || !v18)
  {
    -[UIImageView animationImages](self, "animationImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[UIImageView animationImages](self, "animationImages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
LABEL_18:
  if (-[UIImageView isAnimating](self, "isAnimating"))
  {

    return;
  }
  if (-[UIImageView isHighlighted](self, "isHighlighted"))
  {
    if (v4)
      v12 = v4;
    else
      v12 = v18;
    v13 = v12;
    v14 = -[UIImageView _setImageViewContents:](self, "_setImageViewContents:", v13);
    if (v14)
      v3 = objc_msgSend(v13, "isHighDynamicRange");
    else
      v3 = 0;

  }
  else
  {
    v14 = 0;
    v3 = 0;
  }
  v15 = -[UIImageView _displayImageAsLayered:](self, "_displayImageAsLayered:", v18);
  v16 = v15;
  if (v14 || v15)
  {
    if (!v15)
      goto LABEL_35;
    -[UIImageView _configureForLayeredImage:](self, "_configureForLayeredImage:", v18);
  }
  else
  {
    -[UIImageView _setImageViewContents:](self, "_setImageViewContents:", v18);
    v3 = objc_msgSend(v18, "isHighDynamicRange");
  }
  v14 = 1;
LABEL_35:
  -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    v16 = 1;

  if ((v16 & 1) != 0)
  {

    if (v14)
      goto LABEL_4;
  }
  else
  {
    -[UIImageView _teardownLayeredImage](self, "_teardownLayeredImage");

    if (v14)
      goto LABEL_4;
  }
}

- (BOOL)isHighlighted
{
  return -[_UIImageViewStorage isHighlighted](self->_storage, "isHighlighted");
}

- (_UIStackedImageContainerView)_layeredImageContainer
{
  return (_UIStackedImageContainerView *)objc_getAssociatedObject(self, &layeredImageContainerKey);
}

- (void)_invalidateImageLayouts
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (pthread_main_np() == 1)
    goto LABEL_2;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_26;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v23;
    v33 = 2112;
    v34 = v24;
    _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "-[%@ %@] must be called on the main queue", buf, 0x16u);
LABEL_25:

LABEL_26:
    goto LABEL_2;
  }
  v19 = _invalidateImageLayouts___s_category;
  if (!_invalidateImageLayouts___s_category)
  {
    v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v19, (unint64_t *)&_invalidateImageLayouts___s_category);
  }
  v20 = *(NSObject **)(v19 + 8);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = v20;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v23;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "-[%@ %@] must be called on the main queue", buf, 0x16u);
    goto LABEL_25;
  }
LABEL_2:
  -[_UIImageViewStorage layouts](self->_storage, "layouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[UIImageView _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
    self->_previousBaselineOffsetFromBottom = v6;
    -[UIImageView _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
    self->_previousFirstBaselineOffsetFromTop = v7;
  }
  -[_UIImageViewStorage imageBeingSetByLoader](self->_storage, "imageBeingSetByLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewStorage layouts](self->_storage, "layouts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_class();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) == 0 || v16 != v8)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 != v8)
              continue;
          }
          objc_msgSend(v11, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    -[_UIImageViewStorage setLayouts:](self->_storage, "setLayouts:", v9);
  }
  else
  {
    -[_UIImageViewStorage layouts](self->_storage, "layouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");
  }

}

- (id)_layoutForImage:(id)a3 inSize:(CGSize)a4 cachePerSize:(BOOL)a5 forBaselineOffset:(BOOL)a6
{
  double height;
  double width;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  height = a4.height;
  width = a4.width;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (pthread_main_np() == 1)
    goto LABEL_2;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v25;
    v31 = 2112;
    v32 = v26;
    _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "-[%@ %@] must be called on the main queue", buf, 0x16u);
LABEL_16:

LABEL_17:
    goto LABEL_2;
  }
  v21 = _layoutForImage_inSize_cachePerSize_forBaselineOffset____s_category;
  if (!_layoutForImage_inSize_cachePerSize_forBaselineOffset____s_category)
  {
    v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v21, (unint64_t *)&_layoutForImage_inSize_cachePerSize_forBaselineOffset____s_category);
  }
  v22 = *(NSObject **)(v21 + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = v22;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v25;
    v31 = 2112;
    v32 = v26;
    _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "-[%@ %@] must be called on the main queue", buf, 0x16u);
    goto LABEL_16;
  }
LABEL_2:
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", width, height, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v12;
  }
  -[_UIImageViewStorage layouts](self->_storage, "layouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    +[_UIImageContentLayout layoutForSource:inTarget:withSize:](_UIImageContentLayout, "layoutForSource:inTarget:withSize:", v12, self, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewStorage layouts](self->_storage, "layouts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIImageViewStorage setLayouts:](self->_storage, "setLayouts:", v18);

    }
    -[_UIImageViewStorage layouts](self->_storage, "layouts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v16, v14);

    if (!a6)
      -[UIImageView _baselineOffsetParametersDidChangeHasBaselinePropertyChanged:](self, "_baselineOffsetParametersDidChangeHasBaselinePropertyChanged:", 0);
  }

  return v16;
}

- (void)_baselineOffsetParametersDidChangeHasBaselinePropertyChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if ((*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    v3 = a3;
    -[UIView _layoutEngine](self, "_layoutEngine");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:", CFSTR("_UIViewHasBaselinePropertyChanged"), self);

      }
      -[UIImageView _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
      v7 = v6;
      -[UIImageView _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
      v9 = v8;
      if (self->_previousBaselineOffsetFromBottom != v7 || self->_previousFirstBaselineOffsetFromTop != v8)
      {
        -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
        self->_previousBaselineOffsetFromBottom = v7;
        self->_previousFirstBaselineOffsetFromTop = v9;
      }
    }

  }
}

- (BOOL)_setImageViewContents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  BOOL v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v31;
  unint64_t v32;
  NSObject *v33;
  uint8_t v34[16];
  uint8_t buf[16];

  v4 = a3;
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("UIImageAnimationContents"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("UIImageAnimationContentsTransform"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("UIImageAnimationContentsMultiplyColor"));
  objc_msgSend(v5, "setContentsAlignsToPixels:", 0);
  -[UIImageView _setLayerAllowsEdgeAntialiasing:](self, "_setLayerAllowsEdgeAntialiasing:", 0);
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v31, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v32 = _setImageViewContents____s_category;
    if (!_setImageViewContents____s_category)
    {
      v32 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v32, (unint64_t *)&_setImageViewContents____s_category);
    }
    v33 = *(NSObject **)(v32 + 8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v34, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v7);

  v8 = (void *)_UISetCurrentFallbackEnvironment(self);
  objc_msgSend(v4, "size");
  if (v4 && v9 > 0.0)
  {
    v11 = v10;
    v12 = v10 > 0.0;
    if (-[UIView contentMode](self, "contentMode") >= UIViewContentModeCenter)
    {
      if (v11 > 0.0)
      {
        v13 = 0;
        goto LABEL_15;
      }
LABEL_28:
      objc_msgSend(v5, "setContents:", 0);
      goto LABEL_31;
    }
  }
  else
  {
    if (-[UIView contentMode](self, "contentMode") > UIViewContentModeRedraw)
      goto LABEL_28;
    v12 = 0;
  }
  -[UIView bounds](self, "bounds");
  v16 = v15 > 0.0 && v14 > 0.0;
  v13 = v12 && !v16;
  if (!v12 || !v16)
  {
    objc_msgSend(v5, "setContents:", 0);
    goto LABEL_30;
  }
LABEL_15:
  if (objc_msgSend(v4, "_representsCIImageWhichSupportsIOSurfaceRendering")
    && -[UIImageView _setImageViewContentsForCIImageBackedImage:](self, "_setImageViewContentsForCIImageBackedImage:", v4))
  {
LABEL_30:
    if (v13)
      goto LABEL_34;
LABEL_31:
    -[UIImageView _teardownRBSymbolLayerIfNeeded](self, "_teardownRBSymbolLayerIfNeeded");
    goto LABEL_34;
  }
  objc_msgSend(v4, "duration");
  if (v17 > 0.0)
  {
    objc_msgSend(v4, "images");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (!-[UIImageView _setImageViewContentsForAnimatedImage:](self, "_setImageViewContentsForAnimatedImage:", v4))
      {
        objc_msgSend(v4, "images");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          v22 = (void *)v20;
        else
          v22 = v4;
        v23 = v22;

        v4 = v23;
        goto LABEL_24;
      }
      goto LABEL_30;
    }
  }
LABEL_24:
  -[UIImageView _cachedPretiledImageForImage:](self, "_cachedPretiledImageForImage:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;

    v4 = v26;
  }
  -[UIView bounds](self, "bounds");
  -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v4, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "hasContents"))
  {
    -[UIImageView _applyImageLayout:toLayer:](self, "_applyImageLayout:toLayer:", v29, v5);
    _setContentStretchForImage(self, v4);
  }
  else
  {
    objc_msgSend(v5, "setContents:", 0);
    -[UIImageView _teardownRBSymbolLayerIfNeeded](self, "_teardownRBSymbolLayerIfNeeded");
  }

LABEL_34:
  _UIRestorePreviousFallbackEnvironment(v8);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v6);

  return 1;
}

- (BOOL)_displayImageAsLayered:(id)a3
{
  return 0;
}

- (void)_updateHDRFlags:(BOOL)a3
{
  _BOOL4 v3;
  UIImageDynamicRange v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = a3;
  objc_opt_self();
  if (dyld_program_sdk_at_least())
  {
    if (v3)
      v5 = -[UIImageView imageDynamicRange](self, "imageDynamicRange");
    else
      v5 = UIImageDynamicRangeStandard;
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWantsExtendedDynamicRangeContent:", v5 != UIImageDynamicRangeStandard);

    -[UIImageView _maximumEDRForDynamicRange:](self, "_maximumEDRForDynamicRange:", v5);
    v8 = v7;
    -[UIView layer](self, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsMaximumDesiredEDR:", v8);

  }
}

- (BOOL)_hasInstalledContentsAnimation
{
  void *v3;
  void *v4;
  _UIImageViewStorage *v5;
  BOOL v6;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("contents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "delegate");
  v5 = (_UIImageViewStorage *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (v4 && v5)
    v6 = v5 == self->_storage;

  return v6;
}

- (double)_maximumEDRForDynamicRange:(int64_t)a3
{
  double result;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  if (a3 == 2)
  {
    -[UIImageView _currentImage](self, "_currentImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageMaximumHeadroom");
    v7 = v10;

    result = 8.0;
  }
  else
  {
    result = 1.0;
    if (a3 != 1)
      return result;
    -[UIImageView _currentImage](self, "_currentImage", 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageMaximumHeadroom");
    v7 = v6;

    result = 2.0;
  }
  if (v7 <= result)
    return v7;
  return result;
}

- (double)preferredContentScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");
  v4 = v3;

  return v4;
}

- (BOOL)_resolveImagesWithPreviouslyDisplayedImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  char v27;
  void *v28;

  v4 = a3;
  -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_6;
    -[UIImageView _effectiveImageViewTraitCollectionForResolvingImages](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UITraitCollection _isEqualToTraitCollectionForResolvingImage:]((uint64_t)v7, (uint64_t)self->_lastResolvedImageViewTraitCollection))
    {

      goto LABEL_6;
    }
    objc_storeStrong((id *)&self->_lastResolvedImageViewTraitCollection, v7);
    -[UIImageView highlightedImage](self, "highlightedImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v8 = 0;
      v18 = 0;
      goto LABEL_22;
    }
    -[UIImageView _resolvedImageFromImage:withImageViewTrait:](self, v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_20;
    -[_UIImageViewStorage resolvedHighlightedImage](self->_storage, "resolvedHighlightedImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = v13;
    if (v14 == v15)
    {

    }
    else
    {
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v14, "isEqual:", v15);

        if ((v17 & 1) != 0)
          goto LABEL_20;
      }
      else
      {

      }
      -[_UIImageViewStorage setResolvedHighlightedImage:](self->_storage, "setResolvedHighlightedImage:", v14);
      if (-[UIImageView isHighlighted](self, "isHighlighted"))
      {
        v8 = v14;
        v18 = 1;
LABEL_21:

LABEL_22:
        -[UIImageView image](self, "image");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {

          if (!v18)
            goto LABEL_7;
LABEL_37:
          -[UIImageView _updateImageViewForOldImage:newImage:](self, "_updateImageViewForOldImage:newImage:", v4, v8);
          v9 = 1;
          goto LABEL_8;
        }
        v20 = v19;
        -[UIImageView _resolvedImageFromImage:withImageViewTrait:](self, v19, v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v28 = v11;
          -[_UIImageViewStorage resolvedImage](self->_storage, "resolvedImage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v21;
          v24 = v22;
          if (v23 == v24)
          {

            v11 = v28;
          }
          else
          {
            v25 = v24;
            if (v24)
            {
              v27 = objc_msgSend(v23, "isEqual:", v24);

              v11 = v28;
              if ((v27 & 1) != 0)
                goto LABEL_36;
            }
            else
            {

              v11 = v28;
            }
            -[_UIImageViewStorage setResolvedImage:](self->_storage, "setResolvedImage:", v23);
            if ((v18 & 1) != 0)
            {
              LOBYTE(v18) = 1;
              goto LABEL_36;
            }
            v26 = v23;
            v23 = v8;
            LOBYTE(v18) = 1;
            v8 = v26;
          }

        }
LABEL_36:

        if ((v18 & 1) == 0)
          goto LABEL_7;
        goto LABEL_37;
      }
    }
LABEL_20:
    v8 = 0;
    v18 = 0;
    goto LABEL_21;
  }

LABEL_6:
  v8 = 0;
LABEL_7:
  v9 = 0;
LABEL_8:

  return v9;
}

- (id)_currentHighlightedImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_UIImageViewStorage resolvedHighlightedImage](self->_storage, "resolvedHighlightedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSArray)animationImages
{
  void *v2;
  void *v3;

  -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)highlightedAnimationImages
{
  void *v2;
  void *v3;

  -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return -[_UIImageViewStorage adjustsImageSizeForAccessibilityContentSizeCategory](self->_storage, "adjustsImageSizeForAccessibilityContentSizeCategory");
}

- (BOOL)_layoutShouldFlipHorizontalOrientations
{
  return 0;
}

- (BOOL)_supportsContents
{
  return 1;
}

- (id)_layoutForImage:(id)a3 inSize:(CGSize)a4
{
  return -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", a3, 0, 0, a4.width, a4.height);
}

- (double)_baselineOffsetFromBottom
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v11;
  double *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double previousBaselineOffsetFromBottom;
  double v18;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  -[UIImageView _currentImage](self, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (objc_msgSend(v6, "hasBaseline"))
  {
    -[UIView bounds](self, "bounds");
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    v11 = CGRectGetWidth(v21);
    v12 = (double *)MEMORY[0x1E0D15688];
    if ((v11 <= *MEMORY[0x1E0D15688]
       || (v22.origin.x = x,
           v22.origin.y = y,
           v22.size.width = width,
           v22.size.height = height,
           CGRectGetHeight(v22) <= *v12))
      && (*(_WORD *)&self->_imageViewFlags & 0x200) != 0)
    {
      previousBaselineOffsetFromBottom = self->_previousBaselineOffsetFromBottom;
    }
    else
    {
      -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v6, 0, 1, width, height);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "baselineOffsetFromBottom");
      v15 = v14;
      -[UIImageView alignmentRectInsets](self, "alignmentRectInsets");
      previousBaselineOffsetFromBottom = v15 - v16;

    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIImageView;
    -[UIView _baselineOffsetFromBottom](&v20, sel__baselineOffsetFromBottom);
    previousBaselineOffsetFromBottom = v18;
  }

  return previousBaselineOffsetFromBottom;
}

- (BOOL)_hasContentGravity
{
  return 1;
}

- (UIImage)highlightedImage
{
  return -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
}

- (UIView)_placeholderView
{
  return -[_UIImageViewStorage placeholderView](self->_storage, "placeholderView");
}

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIImageView _decompressingImageForType:](self, "_decompressingImageForType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIImageView setImage:](self, "setImage:", v3);
    -[UIImageView _setDecompressingImage:forType:](self, "_setDecompressingImage:forType:", 0, 0);
  }
  -[UIImageView _decompressingImageForType:](self, "_decompressingImageForType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIImageView setHighlightedImage:](self, "setHighlightedImage:", v4);
    -[UIImageView _setDecompressingImage:forType:](self, "_setDecompressingImage:forType:", 0, 1);
  }
  -[UIImageView _updateVisibilityAndFrameOfPlaceholderView](self, "_updateVisibilityAndFrameOfPlaceholderView");
  -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");

  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  -[UIView layoutSubviews](&v6, sel_layoutSubviews);

}

- (id)_decompressingImageForType:(unint64_t)a3
{
  const void *v3;

  if (a3)
    v3 = &unk_1ECD79C71;
  else
    v3 = &_MergedGlobals_71;
  return objc_getAssociatedObject(self, v3);
}

- (void)_updateVisibilityAndFrameOfPlaceholderView
{
  void *v3;
  id v4;

  -[_UIImageViewStorage placeholderView](self->_storage, "placeholderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIImageView _currentImage](self, "_currentImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3 != 0);

    -[UIView bounds](self, "bounds");
    objc_msgSend(v4, "setFrame:");
  }

}

- (void)setBounds:(CGRect)a3
{
  -[UIImageView _setViewGeometry:forMetric:](self, "_setViewGeometry:forMetric:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[UIImageView _animatesContents](self, "_animatesContents")
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("contentsTransform")) & 1) != 0
    || (objc_opt_self(), dyld_program_sdk_at_least())
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("contentsMaximumDesiredEDR")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  UISemanticContentAttribute v5;
  void *v6;
  int v7;
  objc_super v8;

  v5 = -[UIView semanticContentAttribute](self, "semanticContentAttribute");
  v8.receiver = self;
  v8.super_class = (Class)UIImageView;
  -[UIView setSemanticContentAttribute:](&v8, sel_setSemanticContentAttribute_, a3);
  if (v5 != a3)
  {
    -[UIImageView image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "flipsForRightToLeftLayoutDirection");

    if (v7)
      -[UIImageView _invalidateImageLayouts](self, "_invalidateImageLayouts");
    else
      -[UIImageView _updateResolvedImages](self, "_updateResolvedImages");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setDrawMode:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[_UIImageViewStorage drawMode](self->_storage, "drawMode") != a3)
  {
    -[_UIImageViewStorage setDrawMode:](self->_storage, "setDrawMode:", v3);
    -[UIImageView _updateState](self, "_updateState");
  }
}

- (BOOL)_getDrawModeCompositeOperation:(int *)a3 whiteComponent:(double *)a4 drawingAlpha:(double *)a5
{
  return -[UIImageView _getDrawModeCompositeOperation:whiteComponent:drawingAlpha:forDrawMode:](self, "_getDrawModeCompositeOperation:whiteComponent:drawingAlpha:forDrawMode:", a3, a4, a5, -[UIImageView drawMode](self, "drawMode"));
}

- (unsigned)drawMode
{
  return -[_UIImageViewStorage drawMode](self->_storage, "drawMode");
}

- (void)_updateImageViewForOldImage:(id)a3 newImage:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[5];

  v47 = a3;
  v6 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "legibilityWeight");

  if (v8 != 1
    || objc_msgSend(v47, "_suppressesAccessibilityHairlineThickening")
    && (objc_msgSend(v6, "_suppressesAccessibilityHairlineThickening") & 1) != 0)
  {
    v9 = 0;
    goto LABEL_8;
  }
  if (!v47 && v6)
  {
LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  if (v47)
    v41 = v6 == 0;
  else
    v41 = 0;
  v9 = v41;
  if (v47 && v6)
  {
    v42 = objc_msgSend(v47, "renderingMode");
    v43 = objc_msgSend(v6, "renderingMode");
    if (v42 == 1 && v43 != 1)
      goto LABEL_7;
    v9 = v42 != 1 && v43 == 1;
  }
LABEL_8:
  objc_msgSend(v6, "alignmentRectInsets", v47);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v48, "alignmentRectInsets");
  v21 = 1;
  if (v13 == v22 && v11 == v18 && v17 == v20 && v15 == v19)
  {
    objc_msgSend(v48, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "layoutDirection");
    objc_msgSend(v6, "configuration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25 != objc_msgSend(v27, "layoutDirection");

  }
  if (v9)
  {
    *(_WORD *)&self->_imageViewFlags |= 0x10u;
LABEL_15:
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    goto LABEL_16;
  }
  objc_msgSend(v6, "size");
  v32 = v31;
  v34 = v33;
  objc_msgSend(v48, "size");
  if (v32 != v36 || v34 != v35)
    goto LABEL_15;
  v37 = objc_msgSend(v6, "imageOrientation");
  if (v37 != objc_msgSend(v48, "imageOrientation") || v21)
    goto LABEL_15;
LABEL_16:
  if (v21)
  {
    v28 = -[UIView _wantsAutolayout](self, "_wantsAutolayout");
    -[UIView superview](self, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
      objc_msgSend(v29, "setNeedsLayout");
    else
      objc_msgSend(v29, "_alignmentRectInsetsHaveChangedForChildImageView:", self);

  }
  -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v48);
  -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", v6);
  if (-[UIImageView _animatesContents](self, "_animatesContents"))
  {
    -[UIImageView _updateState](self, "_updateState");
  }
  else
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __52__UIImageView__updateImageViewForOldImage_newImage___block_invoke;
    v49[3] = &unk_1E16B1B28;
    v49[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v49);
  }
  -[UIImageView _updateVisibilityAndFrameOfPlaceholderView](self, "_updateVisibilityAndFrameOfPlaceholderView");
  -[UIImageView _updateTemplateProperties](self, "_updateTemplateProperties");
  -[UIImageView _currentImage](self, "_currentImage");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[UIView setOpaque:](self, "setOpaque:", 0);
  }
  else
  {
    -[UIImageView animationImages](self, "animationImages");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      -[UIView setOpaque:](self, "setOpaque:", 0);
    }
    else
    {
      -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        -[UIView setOpaque:](self, "setOpaque:", 0);
      }
      else
      {
        -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setOpaque:](self, "setOpaque:", v46 == 0);

      }
    }

  }
  -[UIImageView _imageContentParametersDidChange](self, "_imageContentParametersDidChange");
  -[UIImageView _baselineOffsetParametersDidChangeHasBaselinePropertyChanged:](self, "_baselineOffsetParametersDidChangeHasBaselinePropertyChanged:", objc_msgSend(v48, "_hasBaseline") ^ objc_msgSend(v6, "_hasBaseline"));

}

- (void)_imageContentParametersDidChange
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;

  -[UIImageView _imageContentGuideAllowingCreation:](self, "_imageContentGuideAllowingCreation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v65 = v3;
    -[UIImageView _currentImage](self, "_currentImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
      -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIView bounds](self, "bounds");
    -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    if (!v4)
    -[UIImageView alignmentRectInsets](self, "alignmentRectInsets");
    v18 = v10 - v17;
    v20 = v12 - v19;
    v22 = v14 - v21;
    v24 = v16 - v23;
    -[UIView superview](self, "superview");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25 && (*(_QWORD *)(v25 + 104) & 0x1000000000000000) != 0)
    {
      v63 = v22;
      objc_msgSend(v65, "_systemConstraints");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constant");
      v62 = v29;
      objc_msgSend(v65, "_systemConstraints");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constant");
      v33 = v32;
      objc_msgSend(v65, "_systemConstraints");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constant");
      v60 = v36;
      objc_msgSend(v65, "_systemConstraints");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constant");
      v64 = v39;

      -[UIView _layoutEngine](self, "_layoutEngine");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      -[UIView bounds](self, "bounds");
      v42 = v41;
      v61 = v43;
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v45 = 1.0 / v44;
      -[UIView nsli_boundsWidthVariable](self, "nsli_boundsWidthVariable");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "valueForVariable:", v46);
      v48 = v47;

      if ((round(vabdd_f64(v33, v20) - v45) == 0.0 || round(vabdd_f64(v64, v24) - v45) == 0.0)
        && round(vabdd_f64(v48 / 360.0, v42) - v45) == 0.0)
      {
        v24 = v64;
        v20 = v33;
      }
      v22 = v63;
      -[UIView nsli_boundsHeightVariable](self, "nsli_boundsHeightVariable");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "valueForVariable:", v49);
      v51 = v50;

      if ((round(vabdd_f64(v62, v18) - v45) == 0.0 || round(vabdd_f64(v60, v63) - v45) == 0.0)
        && round(vabdd_f64(v51 / 360.0, v61) - v45) == 0.0)
      {
        v24 = v64;
        v20 = v33;
      }

    }
    objc_msgSend(v65, "_systemConstraints");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "setConstant:", v18);
    objc_msgSend(v65, "_systemConstraints");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "setConstant:", v20);
    objc_msgSend(v65, "_systemConstraints");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectAtIndexedSubscript:", 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "setConstant:", v22);
    objc_msgSend(v65, "_systemConstraints");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "setConstant:", v24);
    v3 = v65;
  }

}

- (id)_imageContentGuideAllowingCreation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  UILayoutGuide *v7;
  void *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v3 = a3;
  v18[4] = *MEMORY[0x1E0C80C00];
  -[_UIImageViewStorage imageContentGuide](self->_storage, "imageContentGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    v7 = objc_alloc_init(UILayoutGuide);
    -[UILayoutGuide _setAllowsNegativeDimensions:](v7, "_setAllowsNegativeDimensions:", 1);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v7);
    -[UILayoutGuide _setLockedToOwningView:](v7, "_setLockedToOwningView:", 1);
    -[UILayoutGuide setIdentifier:](v7, "setIdentifier:", CFSTR("UIImageViewImageContentGuide"));
    -[_UIImageViewStorage setImageContentGuide:](self->_storage, "setImageContentGuide:", v7);
    v8 = (void *)MEMORY[0x1E0D156E0];
    v9 = self;
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v7, 3, 0, v9, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v7, 1, 0, v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v9, 4, 0, v7, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v9, 2, 0, v7, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", CFSTR("UIImageView-imageContentGuide-top-constraint"));
    objc_msgSend(v11, "setIdentifier:", CFSTR("UIImageView-imageContentGuide-left-constraint"));
    objc_msgSend(v12, "setIdentifier:", CFSTR("UIImageView-imageContentGuide-bottom-constraint"));
    objc_msgSend(v13, "setIdentifier:", CFSTR("UIImageView-imageContentGuide-right-constraint"));
    v18[0] = v10;
    v18[1] = v11;
    v18[2] = v12;
    v18[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](v7, "_setSystemConstraints:", v14);

    -[UIImageView _imageContentParametersDidChange](v9, "_imageContentParametersDidChange");
    v15 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](v7, "_systemConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

  }
  -[_UIImageViewStorage imageContentGuide](self->_storage, "imageContentGuide");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_animatesContents
{
  return self->__animatesContents;
}

- (id)_cachedPretiledImageForImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "_isResizable"))
  {
    objc_getAssociatedObject(self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pretiledImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updatePretiledImageCacheForImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  UIGraphicsImageRenderer *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  double v57;
  double v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "_isResizable") && (objc_msgSend(v5, "_representsLayeredImage") & 1) == 0)
  {
    -[UIView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v10 = v5;
    if (qword_1ECD82558 != -1)
      dispatch_once(&qword_1ECD82558, &__block_literal_global_40_5);
    if (!_MergedGlobals_1327
      || (v11 = objc_retainAutorelease(v10), !objc_msgSend(v11, "CGImage"))
      || !objc_msgSend(v11, "_isTiledWhenStretchedToSize:", v7, v9)
      || (objc_msgSend(v11, "size"), v13 = v12, v15 = v14, objc_msgSend(v11, "capInsets"), v19 == 0.0)
      && v16 == 0.0
      && v18 == 0.0
      && v17 == 0.0
      && ((unint64_t)v13 & ((unint64_t)v13 - 1)) == 0
      && ((unint64_t)v15 & ((unint64_t)v15 - 1)) == 0
      || (objc_msgSend(v11, "capInsets"), (int)(v7 * v9 / ((v13 - v20 - v21) * (v15 - v22 - v23))) <= 255))
    {

LABEL_17:
      -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v10);
      goto LABEL_18;
    }
    v24 = pretiledSizeForImage(v11, v7);
    v26 = v25;

    if (v24 <= v13 && v26 <= v15)
      goto LABEL_17;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v11, "images", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v52 != v30)
            objc_enumerationMutation(v27);
          -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v29);
    }

    -[UIView bounds](self, "bounds");
    v33 = pretiledSizeForImage(v11, v32);
    v35 = v34;
    +[_UIImageViewPretiledImageCacheKey cacheKeyWithOriginalImage:pretiledSize:](_UIImageViewPretiledImageCacheKey, "cacheKeyWithOriginalImage:pretiledSize:", v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(self, v11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37
      || (objc_msgSend((id)qword_1ECD82548, "objectForKey:", v36),
          (v37 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v37, "pretiledImage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "size");
      v40 = v39;
      v42 = v41;

      if ((v33 < v40 || v35 <= v42) && (v33 <= v40 || v35 < v42))
        goto LABEL_43;
      -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v11);

    }
    v43 = v11;
    v44 = v43;
    if (v33 == 0.0 || v35 == 0.0)
    {

    }
    else
    {
      objc_msgSend(v43, "imageRendererFormat");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setOpaque:", 0);
      v46 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v45, v33, v35);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __pretiledImageForImage_block_invoke;
      v55[3] = &unk_1E16C4E18;
      v56 = v44;
      v57 = v33;
      v58 = v35;
      v47 = v44;
      -[UIGraphicsImageRenderer imageWithActions:](v46, "imageWithActions:", v55);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "capInsets");
      objc_msgSend(v48, "resizableImageWithCapInsets:");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "imageWithRenderingMode:", objc_msgSend(v47, "renderingMode"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        if (qword_1ECD82550 != -1)
          dispatch_once(&qword_1ECD82550, &__block_literal_global_663);
        +[_UIImageViewPretiledImageWrapper cacheValueWithPretiledImage:cacheKey:](_UIImageViewPretiledImageWrapper, "cacheValueWithPretiledImage:cacheKey:", v50, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)qword_1ECD82548, "setObject:forKey:", v37, v36);

        goto LABEL_43;
      }
    }
    v37 = 0;
LABEL_43:
    objc_setAssociatedObject(self, v11, v37, (void *)1);

  }
LABEL_18:

}

- (void)_clearPretiledImageCacheForImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (qword_1ECD82558 == -1)
  {
    if (!v4)
      goto LABEL_13;
  }
  else
  {
    dispatch_once(&qword_1ECD82558, &__block_literal_global_40_5);
    if (!v5)
      goto LABEL_13;
  }
  if (_MergedGlobals_1327 && objc_msgSend(v5, "_isResizable"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v5, "images", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    objc_getAssociatedObject(self, v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, v5, 0, (void *)1);
  }
LABEL_13:

}

- (void)_updateMasking
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  if (-[UIImageView _masksTemplateImages](self, "_masksTemplateImages"))
  {
    -[UIView layer](self, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compositingFilter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = (_QWORD *)MEMORY[0x1E0CD2F28];
    if (v3)
    {
      objc_msgSend(v3, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *v5);

    }
    else
    {
      v7 = 0;
    }
    -[UIImageView _activeImage](self, "_activeImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIImageView _shouldTreatImageAsTemplate:](self, "_shouldTreatImageAsTemplate:", v8);

    if ((v7 & 1) != 0 || !v9)
    {
      if (((v7 ^ 1 | v9) & 1) == 0)
        objc_msgSend(v11, "setCompositingFilter:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCompositingFilter:", v10);

    }
  }
}

- (BOOL)_masksTemplateImages
{
  return -[_UIImageViewStorage masksTemplateImages](self->_storage, "masksTemplateImages");
}

uint64_t __52__UIImageView__updateImageViewForOldImage_newImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIImageView;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[UIImageView _activeImage](self, "_activeImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIImageView _shouldTreatImageAsTemplate:](self, "_shouldTreatImageAsTemplate:", v3)
    || objc_msgSend(v3, "isSymbolImage"))
  {
    -[UIImageView _updateState](self, "_updateState");
  }

}

- (BOOL)_shouldTreatImageAsTemplate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIImageView _symbolConfigurationForImage:](self, "_symbolConfigurationForImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UIImageView _shouldTreatImageAsTemplate:symbolConfiguration:](self, "_shouldTreatImageAsTemplate:symbolConfiguration:", v4, v5);

  return (char)self;
}

uint64_t __120__UIImageView_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 1);
  }
  else
  {
    -[UIImageView _currentImage](self, "_currentImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints");
    }
    else
    {
      -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v5 = -[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints");
      else
        v5 = 0;

    }
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    if (v5)
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _updateResolvedImages](self, "_updateResolvedImages");
  if (!-[UIImageView adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory"))
  {
LABEL_6:
    v5 = v8;
    if (!v8 || !v4)
      goto LABEL_10;
    goto LABEL_8;
  }
  v5 = v8;
  if (!v4)
    goto LABEL_10;
  if (!v8 || v4[13] != v8[13])
  {
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    goto LABEL_6;
  }
LABEL_8:
  if (v4[15] != v5[15])
  {
    *(_WORD *)&self->_imageViewFlags |= 0x10u;
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
LABEL_10:
  v6 = objc_msgSend(v4, "_userInterfaceRenderingMode");
  if (v6 != objc_msgSend(v8, "_userInterfaceRenderingMode")
    || (v7 = objc_msgSend(v4, "_vibrancy"), v7 != objc_msgSend(v8, "_vibrancy")))
  {
    -[UIImageView _updateState](self, "_updateState");
  }

}

- (void)setHidden:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIImageView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (!a3)
    -[UIImageView _mainQ_beginLoadingIfApplicable](self, "_mainQ_beginLoadingIfApplicable");
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v6;
  _BOOL4 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIImageView;
  -[UIView _didMoveFromWindow:toWindow:](&v8, sel__didMoveFromWindow_toWindow_, a3);
  if (a4)
  {
    -[UIImageView _mainQ_beginLoadingIfApplicable](self, "_mainQ_beginLoadingIfApplicable");
    if (dyld_program_sdk_at_least())
      -[UIImageView _updateResolvedImages](self, "_updateResolvedImages");
    if ((*(_WORD *)&self->_imageViewFlags & 8) != 0
      || (-[UIImageView _activeImage](self, "_activeImage"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = -[UIImageView _shouldTreatImageAsTemplate:](self, "_shouldTreatImageAsTemplate:", v6),
          v6,
          v7))
    {
      -[UIImageView _templateSettingsDidChange](self, "_templateSettingsDidChange");
    }
  }
}

- (void)_mainQ_beginLoadingIfApplicable
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  UIImageView *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
LABEL_4:
    -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (!-[_UIImageViewStorage isStartingLoad](self->_storage, "isStartingLoad"))
      {
        -[UIView window](self, "window");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = -[UIView isHidden](self, "isHidden");

          if (!v5)
          {
            -[_UIImageViewStorage setStartingLoad:](self->_storage, "setStartingLoad:", 1);
            -[_UIImageViewStorage loadingDelegate](self->_storage, "loadingDelegate");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v7 = objc_msgSend(v6, "_imageViewShouldBeginLoading:", self);
            else
              v7 = 1;
            if (-[_UIImageViewStorage isStoppingLoad](self->_storage, "isStoppingLoad") || !v7)
            {
              -[UIImageView _mainQ_resetForLoader:delegate:](self, "_mainQ_resetForLoader:delegate:", 0, 0);
            }
            else
            {
              -[_UIImageViewStorage setEnqueueingLoad:](self->_storage, "setEnqueueingLoad:", 1);
              _UIImageLoadingLog();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                v16 = self;
                v17 = 2048;
                v18 = v3;
                _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_INFO, "Image view %p is loading from loader=%p", buf, 0x16u);
              }

              objc_initWeak((id *)buf, self);
              -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_initWeak(&location, v9);

              if (qword_1ECD79C98 != -1)
                dispatch_once(&qword_1ECD79C98, &__block_literal_global_624);
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __46__UIImageView__mainQ_beginLoadingIfApplicable__block_invoke;
              block[3] = &unk_1E16B2358;
              v10 = (id)qword_1ECD79C90;
              objc_copyWeak(&v12, (id *)buf);
              objc_copyWeak(&v13, &location);
              dispatch_async(v10, block);

              objc_destroyWeak(&v13);
              objc_destroyWeak(&v12);
              objc_destroyWeak(&location);
              objc_destroyWeak((id *)buf);
            }

          }
        }
      }
    }
    goto LABEL_20;
  }
  if (pthread_main_np() == 1)
    goto LABEL_4;
  _UIImageLoadingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v16 = self;
    _os_log_error_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Image view %p is being used from a non-main thread. It is illegal to use UIView on a background thread.", buf, 0xCu);
  }
LABEL_20:

}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration
{
  UIImageSymbolConfiguration *v4;
  UIImageSymbolConfiguration *v5;
  UIImageSymbolConfiguration *v6;
  BOOL v7;
  UIImageSymbolConfiguration *v8;
  void *v9;
  UIImageSymbolConfiguration *v10;

  v4 = preferredSymbolConfiguration;
  -[_UIImageViewStorage preferredSymbolConfiguration](self->_storage, "preferredSymbolConfiguration");
  v5 = (UIImageSymbolConfiguration *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

    v9 = v10;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIImageSymbolConfiguration isEqual:](v5, "isEqual:", v6);

      v8 = v10;
      if (v7)
        goto LABEL_10;
    }
    else
    {

    }
    -[UIImageView _activeImage](self, "_activeImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewStorage setPreferredSymbolConfiguration:](self->_storage, "setPreferredSymbolConfiguration:", v10);
    -[UIImageView _invalidateResolvedImages](self, "_invalidateResolvedImages");
    -[UIImageView _resolveImagesWithPreviouslyDisplayedImage:](self, "_resolveImagesWithPreviouslyDisplayedImage:", v9);
  }

  v8 = v10;
LABEL_10:

}

- (void)_updateResolvedImages
{
  id v3;

  -[UIImageView _activeImage](self, "_activeImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView _resolveImagesWithPreviouslyDisplayedImage:](self, "_resolveImagesWithPreviouslyDisplayedImage:", v3);

}

- (void)_setImage:(id)a3 invalidatingPendingSymbolTransitions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;

  v4 = a4;
  v6 = a3;
  if (!self || (*(_QWORD *)&self->super._viewFlags & 0x1000) == 0)
  {
    v13 = v6;
    if (v4)
      -[_UIImageViewSymbolAnimationPresetManager discardPendingSymbolContentTransitions](self->_animationPresetManager, "discardPendingSymbolContentTransitions");
    -[UIImageView _activeImage](self, "_activeImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewStorage image](self->_storage, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    v10 = v8;
    if (v10 != v9)
    {
      v11 = v10;
      if (v9 && v10)
      {
        v12 = objc_msgSend(v9, "isEqual:", v10);

        if ((v12 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
      -[_UIImageViewStorage setImage:](self->_storage, "setImage:", v9);
      *(_WORD *)&self->_imageViewFlags &= ~1u;
      -[UIImageView _invalidateResolvedImages](self, "_invalidateResolvedImages");
      if (!-[UIImageView _resolveImagesWithPreviouslyDisplayedImage:](self, "_resolveImagesWithPreviouslyDisplayedImage:", v7))-[UIImageView _updateImageViewForOldImage:newImage:](self, "_updateImageViewForOldImage:newImage:", v7, v9);
      goto LABEL_14;
    }

LABEL_14:
    v6 = v13;
  }

}

- (id)_checkImageForAdaptation:(id)a3 hasAdapted:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[UIImageView image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _currentImage](self, "_currentImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _adaptiveImageForImage:assignedImage:currentImage:hasAdapted:](self, "_adaptiveImageForImage:assignedImage:currentImage:hasAdapted:", v6, v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_adaptiveImageForImage:(id)a3 assignedImage:(id)a4 currentImage:(id)a5 hasAdapted:(BOOL *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a6)
    *a6 = 0;
  v12 = v9;
  if (v12)
  {
    v13 = objc_msgSend(v10, "isEqual:", v12);
    v14 = v12;
    if (v11)
    {
      v14 = v12;
      if (v13)
      {
        v14 = v12;
        if ((objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
        {
          v14 = v11;

          if (a6)
            *a6 = 1;
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_resolvedImageFromImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIImageView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[UIImageView _currentImage](self, "_currentImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIImageView _effectiveImageViewTraitCollectionForResolvingImages](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView _resolvedImageFromImage:withImageViewTrait:](self, v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setImage:(UIImage *)image
{
  -[UIImageView _setImage:invalidatingPendingSymbolTransitions:](self, "_setImage:invalidatingPendingSymbolTransitions:", image, 1);
}

- (void)_templateSettingsDidChange
{
  -[UIImageView _updateState](self, "_updateState");
  -[UIImageView _updateTemplateProperties](self, "_updateTemplateProperties");
  *(_WORD *)&self->_imageViewFlags &= ~8u;
}

- (BOOL)_hasReasonToUseRBSymbolLayerForImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v6, "isAnimating") & 1) != 0
    || -[_UIImageViewSymbolAnimationPresetManager hasPendingAnimationsForImage:](self->_animationPresetManager, "hasPendingAnimationsForImage:", v4)|| -[UIImageView _hasNonDefaultSymbolAnimatorState](self, "_hasNonDefaultSymbolAnimatorState");

  return v7;
}

- (BOOL)_hasNonDefaultSymbolAnimatorState
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (objc_msgSend(v3, "isHidden") & 1) != 0 || objc_msgSend(v3, "scaleLevel") != 0;
  else
    v4 = 0;

  return v4;
}

- (void)setContentMode:(int64_t)a3
{
  UIViewContentMode v5;
  objc_super v6;

  v5 = -[UIView contentMode](self, "contentMode");
  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  -[UIView setContentMode:](&v6, sel_setContentMode_, a3);
  if (v5 != a3)
  {
    *(_WORD *)&self->_imageViewFlags &= ~1u;
    -[UIImageView _imageContentParametersDidChange](self, "_imageContentParametersDidChange");
    -[UIImageView _baselineOffsetParametersDidChangeHasBaselinePropertyChanged:](self, "_baselineOffsetParametersDidChangeHasBaselinePropertyChanged:", 0);
    -[UIImageView _updateState](self, "_updateState");
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  if (!-[UIImageView isAnimating](self, "isAnimating"))
  {
    v5 = objc_retainAutorelease(v4);
    if (!CGColorEqualToColor((CGColorRef)objc_msgSend(v5, "CGColor"), -[UIView _backgroundCGColor](self, "_backgroundCGColor")))
    {
      v8.receiver = self;
      v8.super_class = (Class)UIImageView;
      -[UIView setBackgroundColor:](&v8, sel_setBackgroundColor_, v5);
      -[UIImageView _currentImage](self, "_currentImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

LABEL_5:
        -[UIImageView _updateState](self, "_updateState");
        goto LABEL_6;
      }
      if (-[UIImageView isHighlighted](self, "isHighlighted"))
      {
        -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_5;
      }
    }
  }
LABEL_6:

}

- (double)_firstBaselineOffsetFromTop
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v11;
  double *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double previousFirstBaselineOffsetFromTop;
  double v18;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  -[UIImageView _currentImage](self, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (objc_msgSend(v6, "hasBaseline"))
  {
    -[UIView bounds](self, "bounds");
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    v11 = CGRectGetWidth(v21);
    v12 = (double *)MEMORY[0x1E0D15688];
    if (v11 <= *MEMORY[0x1E0D15688]
      && (v22.origin.x = x,
          v22.origin.y = y,
          v22.size.width = width,
          v22.size.height = height,
          CGRectGetHeight(v22) <= *v12)
      && (*(_WORD *)&self->_imageViewFlags & 0x200) != 0)
    {
      previousFirstBaselineOffsetFromTop = self->_previousFirstBaselineOffsetFromTop;
    }
    else
    {
      -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v6, 0, 1, width, height);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = *(double *)(v13 + 72);
      else
        v15 = 0.0;
      -[UIImageView alignmentRectInsets](self, "alignmentRectInsets");
      previousFirstBaselineOffsetFromTop = v15 - v16;

    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIImageView;
    -[UIView _firstBaselineOffsetFromTop](&v20, sel__firstBaselineOffsetFromTop);
    previousFirstBaselineOffsetFromTop = v18;
  }

  return previousFirstBaselineOffsetFromTop;
}

- (BOOL)_recomputePretilingState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[UIImageView _currentImage](self, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIImageView isAnimating](self, "isAnimating"))
    goto LABEL_8;
  objc_msgSend(v3, "images");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !-[UIImageView isHighlighted](self, "isHighlighted"))
  {

    goto LABEL_8;
  }
  objc_msgSend(v4, "images");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[UIImageView isHighlighted](self, "isHighlighted");

    if (!v8)
      goto LABEL_10;
LABEL_8:
    v9 = 0;
    goto LABEL_25;
  }

LABEL_10:
  -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", v3);
  -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", v4);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[UIImageView animationImages](self, "animationImages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  v9 = 1;
LABEL_25:

  return v9;
}

- (void)startAnimating
{
  _BOOL4 v3;
  _UIImageViewStorage *storage;
  void *v5;
  void *v6;
  uint64_t v7;
  float v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[UIImageView isAnimating](self, "isAnimating"))
    return;
  v3 = -[UIImageView isHighlighted](self, "isHighlighted");
  storage = self->_storage;
  if (!v3)
    goto LABEL_6;
  -[_UIImageViewStorage highlightedAnimationImages](storage, "highlightedAnimationImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return;
    storage = self->_storage;
LABEL_6:
    -[_UIImageViewStorage animationImages](storage, "animationImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      return;
  }
  v7 = objc_msgSend(v5, "count");
  if (-[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount") < 1)
    v8 = 2147500000.0;
  else
    v8 = (float)-[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount");
  -[_UIImageViewStorage animationDuration](self->_storage, "animationDuration");
  if (v9 == 0.0)
  {
    v11 = (double)v7 / 30.0;
  }
  else
  {
    -[_UIImageViewStorage animationDuration](self->_storage, "animationDuration");
    v11 = v10;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[UIImageView _cachedPretiledImageForImage:](self, "_cachedPretiledImageForImage:", v18, (_QWORD)v32);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = v19;

          v18 = v21;
        }
        v22 = objc_retainAutorelease(v18);
        objc_msgSend(v12, "addObject:", objc_msgSend(v22, "CGImage"));

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }

  v23 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v23, "setKeyPath:", CFSTR("contents"));
  objc_msgSend(v23, "setValues:", v12);
  v24 = *MEMORY[0x1E0CD2930];
  objc_msgSend(v23, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  *(float *)&v25 = v8;
  objc_msgSend(v23, "setRepeatCount:", v25);
  objc_msgSend(v23, "setDuration:", v11);
  objc_msgSend(v23, "setDelegate:", self->_storage);
  v26 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v23, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v23, "setRemovedOnCompletion:", 0);
  -[UIView layer](self, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAnimation:forKey:", v23, CFSTR("contents"));
  v28 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v28, "setKeyPath:", CFSTR("contentsMultiplyColor"));
  +[UIColor whiteColor](UIColor, "whiteColor");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36 = objc_msgSend(v29, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValues:", v30);

  objc_msgSend(v28, "setCalculationMode:", v24);
  *(float *)&v31 = v8;
  objc_msgSend(v28, "setRepeatCount:", v31);
  objc_msgSend(v28, "setDuration:", v11);
  objc_msgSend(v28, "setFillMode:", v26);
  objc_msgSend(v28, "setRemovedOnCompletion:", 0);
  objc_msgSend(v27, "addAnimation:forKey:", v28, CFSTR("contentsMultiplyColor"));
  objc_msgSend(v27, "setContentsSwizzle:", *MEMORY[0x1E0CD2FE0]);

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  width = a3.width;
  -[UIImageView _currentImage](self, "_currentImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (objc_msgSend(v9, "hasBaseline"))
  {
    -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v9, 1, 1, width, height);
    v10 = (double *)objc_claimAutoreleasedReturnValue();
    -[UIImageView alignmentRectInsets](self, "alignmentRectInsets");
    v13 = v12;
    if (v10)
      v14 = v10[9];
    else
      v14 = 0.0;
    v15 = v14 - v11;
    objc_msgSend(v10, "baselineOffsetFromBottom");
    v17 = v16 - v13;

  }
  else
  {
    v15 = 2.22507386e-308;
    v17 = 2.22507386e-308;
  }

  v18 = v15;
  v19 = v17;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (UIImageView)initWithCoder:(id)a3
{
  id v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
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
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v59;
  void *v60;
  objc_super v61;
  CGRect v62;
  CGRect v63;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)UIImageView;
  v5 = -[UIView initWithCoder:](&v61, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    _UIImageViewCommonInit(v5);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIImage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UIView layer](v6, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentsCenter");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      _setContentStretchForImage(v6, v7);
      -[UIView layer](v6, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentsCenter");
      v63.origin.x = v18;
      v63.origin.y = v19;
      v63.size.width = v20;
      v63.size.height = v21;
      v62.origin.x = v10;
      v62.origin.y = v12;
      v62.size.width = v14;
      v62.size.height = v16;
      v22 = CGRectEqualToRect(v62, v63);

      if (!v22)
      {
        -[UIView layer](v6, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setContentsCenter:", v10, v12, v14, v16);

      }
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIHighlightedImage"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAnimationImages"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIHighlightedAnimationImages"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIAnimationDuration"));
    v28 = v27;
    v59 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIAnimationRepeatCount"));
    v29 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIHighlighted"));
    v30 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAdjustsImageSizeForAccessibilityContentSizeCategory"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIPreferredSymbolConfiguration"));
    v31 = objc_claimAutoreleasedReturnValue();
    -[_UIImageViewStorage setImage:](v6->_storage, "setImage:", v7);
    v60 = (void *)v24;
    -[_UIImageViewStorage setHighlightedImage:](v6->_storage, "setHighlightedImage:", v24);
    v32 = (void *)objc_msgSend(v25, "copy");
    -[_UIImageViewStorage setAnimationImages:](v6->_storage, "setAnimationImages:", v32);

    v33 = (void *)objc_msgSend(v26, "copy");
    -[_UIImageViewStorage setHighlightedAnimationImages:](v6->_storage, "setHighlightedAnimationImages:", v33);

    -[_UIImageViewStorage setAnimationDuration:](v6->_storage, "setAnimationDuration:", v28);
    -[_UIImageViewStorage setAnimationRepeatCount:](v6->_storage, "setAnimationRepeatCount:", v59);
    -[_UIImageViewStorage setHighlighted:](v6->_storage, "setHighlighted:", v29);
    -[_UIImageViewStorage setAdjustsImageSizeForAccessibilityContentSizeCategory:](v6->_storage, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", v30);
    v34 = (void *)v31;
    -[_UIImageViewStorage setPreferredSymbolConfiguration:](v6->_storage, "setPreferredSymbolConfiguration:", v31);
    if (!v7)
      goto LABEL_23;
    v35 = v7;
    objc_msgSend(v35, "CIImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = objc_msgSend(v35, "_representsCIImageWhichSupportsIOSurfaceRendering");

      if (!v37)
      {
LABEL_22:
        objc_msgSend(v35, "scale");
        -[UIImageView setContentScaleFactor:](v6, "setContentScaleFactor:");
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {

    }
    if (dyld_program_sdk_at_least())
    {
      -[UIView bounds](v6, "bounds");
      -[UIImageView _layoutForImage:inSize:](v6, "_layoutForImage:inSize:", v35, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v40, "hasContents") & 1) != 0)
      {
        objc_msgSend(v40, "contents");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = (uint64_t)v41;
        if (v41)
        {
LABEL_16:
          -[UIView layer](v6, "layer");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setContents:", v42);

          -[UIImageView _updateHDRFlags:](v6, "_updateHDRFlags:", objc_msgSend(v35, "isHighDynamicRange"));
          if (objc_msgSend(v35, "_isResizable"))
          {
            objc_msgSend(v35, "_contentStretchInPixels");
            v45 = v44;
            v47 = v46;
            v49 = v48;
            v51 = v50;
            objc_msgSend(v35, "_sizeInPixels");
            v53 = v52;
            v55 = v54;
            -[UIView bounds](v6, "bounds");
            -[UIView _setContentStretchInPixels:forContentSize:shouldTile:](v6, "_setContentStretchInPixels:forContentSize:shouldTile:", objc_msgSend(v35, "_isTiledWhenStretchedToSize:", v56, v57), v45, v47, v49, v51, v53, v55);
          }
          if (dyld_program_sdk_at_least()
            && -[UIImageView _shouldTreatImageAsTemplate:](v6, "_shouldTreatImageAsTemplate:", v35))
          {
            -[UIImageView _invalidateTemplateSettings](v6, "_invalidateTemplateSettings");
          }

          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    v42 = objc_msgSend(objc_retainAutorelease(v35), "CGImage");
    v41 = 0;
    goto LABEL_16;
  }
LABEL_24:

  return v6;
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[_UIImageViewStorage adjustsImageSizeForAccessibilityContentSizeCategory](self->_storage, "adjustsImageSizeForAccessibilityContentSizeCategory") != a3)
  {
    -[_UIImageViewStorage setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_storage, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", v3);
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __120__UIImageView_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }
}

- (void)_setGuardAgainstDegenerateBaselineCalculation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_imageViewFlags = *(_WORD *)&self->_imageViewFlags & 0xFDFF | v3;
}

- (void)_setDefaultRenderingMode:(int64_t)a3
{
  if (-[_UIImageViewStorage defaultRenderingMode](self->_storage, "defaultRenderingMode") != a3)
  {
    -[_UIImageViewStorage setDefaultRenderingMode:](self->_storage, "setDefaultRenderingMode:", a3);
    -[UIImageView _templateSettingsDidChange](self, "_templateSettingsDidChange");
  }
}

- (UIImageSymbolConfiguration)_overridingSymbolConfiguration
{
  return -[_UIImageViewStorage overridingSymbolConfiguration](self->_storage, "overridingSymbolConfiguration");
}

- (void)_setOverridingSymbolConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[_UIImageViewStorage overridingSymbolConfiguration](self->_storage, "overridingSymbolConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

    v9 = v10;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      v8 = v10;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[UIImageView _activeImage](self, "_activeImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewStorage setOverridingSymbolConfiguration:](self->_storage, "setOverridingSymbolConfiguration:", v10);
    -[UIImageView _invalidateResolvedImages](self, "_invalidateResolvedImages");
    -[UIImageView _resolveImagesWithPreviouslyDisplayedImage:](self, "_resolveImagesWithPreviouslyDisplayedImage:", v9);
  }

  v8 = v10;
LABEL_10:

}

- (BOOL)_hasBaseline
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[UIImageView _currentImage](self, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hasBaseline");
  }
  else
  {
    -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasBaseline");

  }
  return v5;
}

- (void)setHighlightedAnimationImages:(NSArray *)highlightedAnimationImages
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = highlightedAnimationImages;
  if (-[UIImageView isHighlighted](self, "isHighlighted") && -[UIImageView isAnimating](self, "isAnimating"))
    -[UIImageView stopAnimating](self, "stopAnimating");
  -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
  v5 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_27;
  }
  if (v6 && v5)
  {
    v8 = -[NSArray isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) != 0)
      goto LABEL_27;
  }
  else
  {

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v7;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), (_QWORD)v28);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  v19 = (void *)-[NSArray copy](v14, "copy");
  -[_UIImageViewStorage setHighlightedAnimationImages:](self->_storage, "setHighlightedAnimationImages:", v19);

  -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (!v21)
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_27:
  if (-[UIImageView isHighlighted](self, "isHighlighted", (_QWORD)v28))
    -[UIImageView _updateState](self, "_updateState");
  -[UIImageView _currentImage](self, "_currentImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "count"))
    {
      v23 = -[NSArray count](v7, "count");

      if (!v23)
        goto LABEL_34;
      -[NSArray objectAtIndex:](v7, "objectAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scale");
      -[UIImageView setContentScaleFactor:](self, "setContentScaleFactor:");
    }
  }

LABEL_34:
  -[UIImageView _currentImage](self, "_currentImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[UIView setOpaque:](self, "setOpaque:", 0);
  }
  else
  {
    -[UIImageView animationImages](self, "animationImages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[UIView setOpaque:](self, "setOpaque:", 0);
    }
    else
    {
      -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        -[UIView setOpaque:](self, "setOpaque:", 0);
      }
      else
      {
        -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setOpaque:](self, "setOpaque:", v27 == 0);

      }
    }

  }
}

- (void)setAnimationRepeatCount:(NSInteger)animationRepeatCount
{
  if (-[UIImageView isAnimating](self, "isAnimating"))
    -[UIImageView stopAnimating](self, "stopAnimating");
  -[_UIImageViewStorage setAnimationRepeatCount:](self->_storage, "setAnimationRepeatCount:", animationRepeatCount);
}

- (void)setAnimationImages:(NSArray *)animationImages
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = animationImages;
  if (-[UIImageView isAnimating](self, "isAnimating"))
    -[UIImageView stopAnimating](self, "stopAnimating");
  -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
  v5 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_25;
  }
  if (v6 && v5)
  {
    v8 = -[NSArray isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) != 0)
      goto LABEL_25;
  }
  else
  {

  }
  -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v7;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }

  v19 = (void *)-[NSArray copy](v14, "copy");
  -[_UIImageViewStorage setAnimationImages:](self->_storage, "setAnimationImages:", v19);

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_25:
  -[UIImageView _updateState](self, "_updateState", (_QWORD)v25);
  -[UIImageView _currentImage](self, "_currentImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (!-[NSArray count](v7, "count"))
      goto LABEL_29;
    -[NSArray objectAtIndex:](v7, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    -[UIImageView setContentScaleFactor:](self, "setContentScaleFactor:");
  }

LABEL_29:
  -[UIImageView _currentImage](self, "_currentImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[UIView setOpaque:](self, "setOpaque:", 0);
  }
  else
  {
    -[UIImageView animationImages](self, "animationImages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[UIView setOpaque:](self, "setOpaque:", 0);
    }
    else
    {
      -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[UIView setOpaque:](self, "setOpaque:", 0);
      }
      else
      {
        -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setOpaque:](self, "setOpaque:", v24 == 0);

      }
    }

  }
}

- (void)setAnimationDuration:(NSTimeInterval)animationDuration
{
  if (-[UIImageView isAnimating](self, "isAnimating"))
    -[UIImageView stopAnimating](self, "stopAnimating");
  -[_UIImageViewStorage setAnimationDuration:](self->_storage, "setAnimationDuration:", animationDuration);
}

- (UIImageView)initWithImage:(UIImage *)image
{
  UIImage *v4;
  UIImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIImageView *v10;
  UIImageView *v11;
  objc_super v13;

  v4 = image;
  v5 = v4;
  v7 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v4 && !-[UIImage _isDecompressing](v4, "_isDecompressing"))
  {
    -[UIImage size](v5, "size");
    v7 = v8;
    v6 = v9;
  }
  v13.receiver = self;
  v13.super_class = (Class)UIImageView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, v7, v6);
  v11 = v10;
  if (v10)
  {
    _UIImageViewCommonInit(v10);
    -[UIView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
    if (-[UIImage _isDecompressing](v5, "_isDecompressing"))
    {
      -[UIImageView _setDecompressingImage:forType:](v11, "_setDecompressingImage:forType:", v5, 0);
      -[UIView setNeedsLayout](v11, "setNeedsLayout");
    }
    else
    {
      -[UIImageView setImage:](v11, "setImage:", v5);
    }
  }

  return v11;
}

- (UIImageView)initWithFrame:(CGRect)a3
{
  UIImageView *v3;
  UIImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    _UIImageViewCommonInit(v3);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
  UIImage *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  UIImage *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIImage *v16;

  v4 = highlightedImage;
  -[_UIImageViewStorage resolvedHighlightedImage](self->_storage, "resolvedHighlightedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  v10 = v9;
  if (v10 == v16)
  {

  }
  else
  {
    if (v16 && v10)
    {
      v11 = -[UIImage isEqual:](v16, "isEqual:", v10);

      if (v11)
        goto LABEL_14;
    }
    else
    {

    }
    -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v13);

    }
    -[_UIImageViewStorage resolvedHighlightedImage](self->_storage, "resolvedHighlightedImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v14);

    -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", v16);
    -[_UIImageViewStorage setHighlightedImage:](self->_storage, "setHighlightedImage:", v16);
    -[_UIImageViewStorage setResolvedHighlightedImage:](self->_storage, "setResolvedHighlightedImage:", 0);
    *(_WORD *)&self->_imageViewFlags &= ~1u;
  }
LABEL_14:
  if (-[UIImageView isHighlighted](self, "isHighlighted"))
  {
    -[UIImageView _currentImage](self, "_currentImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      -[UIImageView _updateImageViewForOldImage:newImage:](self, "_updateImageViewForOldImage:newImage:", v8, v16);
  }

}

- (void)stopAnimating
{
  void *v3;

  if (-[UIImageView isAnimating](self, "isAnimating"))
  {
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAnimationForKey:", CFSTR("contents"));

    if (!-[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount"))
      -[UIImageView _cleanUpForStopAnimating](self, "_cleanUpForStopAnimating");
  }
}

- (id)_currentAnimationKeyframeImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("contents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[UIView layer](self, "layer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "presentationLayer"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "contents"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v4, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v7);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      v11 = v9;
      if (-[UIImageView isHighlighted](self, "isHighlighted"))
      {
        -[UIImageView highlightedAnimationImages](self, "highlightedAnimationImages");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      if (!objc_msgSend(v12, "count"))
      {
        -[UIImageView animationImages](self, "animationImages");
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      if (v11 >= objc_msgSend(v12, "count"))
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v12, "objectAtIndex:", v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_cleanUpForStopAnimating
{
  -[UIImageView _removeLayerAnimations](self, "_removeLayerAnimations");
  -[UIImageView _updateState](self, "_updateState");
}

- (void)_removeLayerAnimations
{
  id v2;

  -[UIView layer](self, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("contents"));
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("contentsMultiplyColor"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedFrameGuide, 0);
  objc_storeStrong((id *)&self->_animationPresetManager, 0);
  objc_storeStrong((id *)&self->_lastResolvedImageViewTraitCollection, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __60__UIImageView_Pretiling___updatePretiledImageCacheForImage___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82548;
  qword_1ECD82548 = v0;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->super._layerRetained
    && -[UIImageView _hasInstalledContentsAnimation](self, "_hasInstalledContentsAnimation"))
  {
    -[UIImageView _removeLayerAnimations](self, "_removeLayerAnimations");
  }
  -[_UIImageViewStorage image](self->_storage, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v3);

  -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v4);

  -[_UIImageViewStorage resolvedImage](self->_storage, "resolvedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v5);

  -[_UIImageViewStorage resolvedHighlightedImage](self->_storage, "resolvedHighlightedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", v6);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[UIImageView _clearPretiledImageCacheForImage:](self, "_clearPretiledImageCacheForImage:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17.receiver = self;
  v17.super_class = (Class)UIImageView;
  -[UIView dealloc](&v17, sel_dealloc);
}

- (void)setHighlighted:(BOOL)highlighted
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  id v7;

  v3 = highlighted;
  if (-[_UIImageViewStorage isHighlighted](self->_storage, "isHighlighted") != highlighted)
  {
    -[_UIImageViewStorage setHighlighted:](self->_storage, "setHighlighted:", v3);
    *(_WORD *)&self->_imageViewFlags &= ~1u;
    -[UIImageView _currentImage](self, "_currentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIImageView _displayImageAsLayered:](self, "_displayImageAsLayered:", v5);

    if (v6)
    {
      -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPressed:", v3);

    }
    else
    {
      if (-[UIImageView isAnimating](self, "isAnimating"))
        -[UIImageView stopAnimating](self, "stopAnimating");
      -[UIImageView _updateState](self, "_updateState");
      -[UIImageView _updateTemplateProperties](self, "_updateTemplateProperties");
    }
  }
}

- (void)_setAnimatesContents:(BOOL)a3
{
  self->__animatesContents = a3;
}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options completion:(UISymbolEffectCompletion)completionHandler
{
  NSSymbolContentTransition *v11;
  NSSymbolEffectOptions *v12;
  void (**v13)(UISymbolEffectCompletion, id);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  UIImage *v20;
  UIImage *v21;
  UIImage *v22;
  BOOL v23;
  id v24;
  void *v25;
  NSSymbolContentTransition *v26;
  uint64_t v27;
  _UIImageViewSymbolAnimationPresetManager *animationPresetManager;
  void *v29;
  UIImage *v30;

  v30 = symbolImage;
  v11 = transition;
  v12 = options;
  v13 = completionHandler;
  if (!-[NSSymbolContentTransition ui_isSupportedByImageView](v11, "ui_isSupportedByImageView"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIImageView.m"), 2707, CFSTR("Unsupported symbol content transition added to UIImageView."));

  }
  if (!v11)
    goto LABEL_16;
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  -[UIImageView image](self, "image");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_15;
  v17 = (void *)v16;
  -[UIImageView image](self, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSymbolImage");
  if (!v30 || !v19 || !-[UIImage isSymbolImage](v30, "isSymbolImage"))
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  -[UIImageView image](self, "image");
  v20 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v21 = v30;
  v22 = v21;
  if (v20 == v21)
  {

    goto LABEL_14;
  }
  if (!v20)
  {

LABEL_21:
    v26 = (NSSymbolContentTransition *)-[NSSymbolContentTransition copy](v11, "copy");

    v27 = -[NSSymbolEffectOptions copy](v12, "copy");
    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0CE86E8], "options");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    animationPresetManager = self->_animationPresetManager;
    -[UIImageView _currentImage](self, "_currentImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewSymbolAnimationPresetManager addPendingSymbolContentTransition:fromSymbolImage:toSymbolImage:options:completion:](animationPresetManager, "addPendingSymbolContentTransition:fromSymbolImage:toSymbolImage:options:completion:", v26, v29, v22, v27, v13);

    -[UIImageView _setImage:invalidatingPendingSymbolTransitions:](self, "_setImage:invalidatingPendingSymbolTransitions:", v22, 0);
    v12 = (NSSymbolEffectOptions *)v27;
    goto LABEL_19;
  }
  v23 = -[UIImage isEqual:](v20, "isEqual:", v21);

  if (!v23)
    goto LABEL_21;
LABEL_16:
  -[UIImageView setImage:](self, "setImage:", v30);
  if (v13)
  {
    v24 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
    objc_msgSend(v24, "setFinished:", 0);
    objc_msgSend(v24, "setSender:", self);
    v25 = (void *)-[NSSymbolContentTransition copy](v11, "copy");
    objc_msgSend(v24, "setContentTransition:", v25);

    v13[2](v13, v24);
  }
  v26 = v11;
LABEL_19:

}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options
{
  -[UIImageView setSymbolImage:withContentTransition:options:completion:](self, "setSymbolImage:withContentTransition:options:completion:", symbolImage, transition, options, 0);
}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition
{
  void *v6;
  NSSymbolContentTransition *v7;
  UIImage *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CE86E8];
  v7 = transition;
  v8 = symbolImage;
  objc_msgSend(v6, "options");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setSymbolImage:withContentTransition:options:](self, "setSymbolImage:withContentTransition:options:", v8, v7, v9);

}

- (void)animationPresetManager:(id)a3 didDiscardPendingContentTransition:(id)a4
{
  void (**v5)(_QWORD, _QWORD);
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "completionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
    objc_msgSend(v6, "setFinished:", 0);
    objc_msgSend(v6, "setSender:", self);
    objc_msgSend(v8, "symbolContentTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentTransition:", v7);

    ((void (**)(_QWORD, id))v5)[2](v5, v6);
  }

}

- (BOOL)_isHasBaselinePropertyChangeable
{
  return 1;
}

- (void)_invalidateTemplateSettings
{
  *(_WORD *)&self->_imageViewFlags |= 8u;
}

- (Class)_intelligenceBaseClass
{
  sub_18575F380();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  id v5;
  UIImageView *v6;

  v5 = a4;
  v6 = self;
  _sSo11UIImageViewC5UIKitE27_intelligenceCollectContent2in9collectorySo6CGRectV_21UIIntelligenceSupport0J16ElementCollectorCtF_0();

}

- (BOOL)isAccessibilityElementByDefault
{
  return 0;
}

- (unint64_t)defaultAccessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIImageView;
  return -[NSObject defaultAccessibilityTraits](&v3, sel_defaultAccessibilityTraits) | 4;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (void)_applySettingsForLegibilityStyle:(int64_t)a3
{
  id v4;
  uint64_t v5;

  v4 = +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", a3);
  if (v4)
    v5 = objc_msgSend(v4, "shadowCompositingFilterName");
  else
    v5 = *MEMORY[0x1E0CD2E70];
  -[CALayer setCompositingFilter:](-[UIView layer](self, "layer"), "setCompositingFilter:", v5);
  -[CALayer setAllowsGroupBlending:](-[UIView layer](self, "layer"), "setAllowsGroupBlending:", 0);
}

- (id)largeContentImage
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetLargeContentImage");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    -[UIView largeContentImage](&v7, sel_largeContentImage);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIImageView image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)scalesLargeContentImage
{
  void *v3;
  int v4;
  objc_super v6;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetScalesLargeContentImage");

  if (!v4)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  return -[UIView scalesLargeContentImage](&v6, sel_scalesLargeContentImage);
}

- (void)_willBeginBeingDisplayedInPointerContentEffect
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIImageView;
  -[UIView _willBeginBeingDisplayedInPointerContentEffect](&v5, sel__willBeginBeingDisplayedInPointerContentEffect);
  -[UIImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSymbolImage");

  if (v4)
    -[UIImageView _setSuppressPixelAlignment:](self, "_setSuppressPixelAlignment:", 1);
}

- (void)_didStopBeingDisplayedInPointerContentEffect
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIImageView;
  -[UIView _didStopBeingDisplayedInPointerContentEffect](&v5, sel__didStopBeingDisplayedInPointerContentEffect);
  -[UIImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSymbolImage");

  if (v4)
    -[UIImageView _setSuppressPixelAlignment:](self, "_setSuppressPixelAlignment:", 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)UIImageView;
  -[UIView description](&v34, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_opt_new();
  -[UIImageView _currentImage](self, "_currentImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIImageName(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v7);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("anonymous");
  }
  objc_msgSend(v6, "size");
  v14 = v13;
  objc_msgSend(v6, "size");
  v16 = v15;
  objc_msgSend(v6, "content");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  objc_msgSend(v5, "appendFormat:", CFSTR("; image = <%@:%p %@ %@; (%0.0f %0.0f)@%0.f"),
    v9,
    v6,
    v11,
    v12,
    v14,
    v16,
    v18);

  if (v7)
  objc_msgSend(v6, "content");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "vectorScale");
  v21 = v20;
  objc_msgSend(v6, "content");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scale");
  v24 = v23;

  if (v21 != v24)
  {
    objc_msgSend(v6, "content");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "vectorScale");
    objc_msgSend(v5, "appendFormat:", CFSTR("{%0.0f}"), v26);

  }
  objc_msgSend(v6, "content");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "isVectorGlyph"))
    goto LABEL_11;
  objc_msgSend(v6, "content");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "variableValue");
  v30 = v29;

  if (v30 != INFINITY)
  {
    objc_msgSend(v6, "content");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "variableValue");
    objc_msgSend(v5, "appendFormat:", CFSTR(", value=%0.0f"), v31);
LABEL_11:

  }
  objc_msgSend(v5, "appendString:", CFSTR(">; layer ="));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("; layer ="),
    v5,
    0,
    0,
    objc_msgSend(v4, "length"));
  v32 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v32;
}

void __41__UIImageView__applyImageLayout_toLayer___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  v4 = (void *)v2[60];
  objc_msgSend(v2, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingSymbolContentTransitionForSettingSymbolImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_currentImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "symbolContentTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *(id *)(a1 + 40));
    v11 = *(_QWORD *)(a1 + 48);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __41__UIImageView__applyImageLayout_toLayer___block_invoke_2;
    v25 = &unk_1E16EAF70;
    objc_copyWeak(&v28, &location);
    v12 = v8;
    v26 = v12;
    v13 = v10;
    v27 = v13;
    objc_msgSend(v12, "ui_animationConfigurationFromSymbolImage:toSymbolImage:options:completion:", v11, v7, v9, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 480), "activatePendingSymbolContentTransition:", *(_QWORD *)(a1 + 32), v22, v23, v24, v25);
    objc_msgSend(*(id *)(a1 + 56), "animator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "animation");
    objc_msgSend(v14, "options");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:options:", v16, v17);

    v18 = *(void **)(a1 + 40);
    objc_msgSend(v18, "bounds");
    objc_msgSend(v18, "_layoutForImage:inSize:", v7, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_setupSymbolLayerForCurrentSymbolImageLayout:", v21);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
}

void __41__UIImageView__applyImageLayout_toLayer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[60], "activeSymbolContentTransitionDidComplete:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
      objc_msgSend(v5, "setFinished:", a2);
      objc_msgSend(v5, "setSender:", v6);
      objc_msgSend(v5, "setContentTransition:", *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    objc_msgSend(v6, "_updateStateIfRBSymbolLayerNoLongerNeeded");
    WeakRetained = v6;
  }

}

- (void)_setupSymbolLayerForCurrentSymbolImageLayout:(id)a3
{
  _UIImageViewSymbolAnimationPresetManager *animationPresetManager;
  id v5;

  animationPresetManager = self->_animationPresetManager;
  v5 = a3;
  -[_UIImageViewSymbolAnimationPresetManager discardPendingSymbolContentTransitions](animationPresetManager, "discardPendingSymbolContentTransitions");
  -[UIImageView _setupRBSymbolLayerWithSymbolImageLayout:](self, "_setupRBSymbolLayerWithSymbolImageLayout:", v5);

  -[_UIImageViewSymbolAnimationPresetManager activatePendingSymbolEffects](self->_animationPresetManager, "activatePendingSymbolEffects");
}

- (BOOL)_needsBoldEffectForImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[UIImageView _baseMultiplyColorWithImage:symbolConfiguration:](self, "_baseMultiplyColorWithImage:symbolConfiguration:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _effectiveContentEffectsWithImage:symbolConfiguration:](self, "_effectiveContentEffectsWithImage:symbolConfiguration:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UIImageView _needsBoldEffectForImage:symbolConfiguration:withBaseColor:withEffects:](self, "_needsBoldEffectForImage:symbolConfiguration:withBaseColor:withEffects:", v7, v6, v8, v9);

  return (char)self;
}

- (BOOL)_needsBoldEffectForImage:(id)a3 symbolConfiguration:(id)a4 withBaseColor:(id)a5 withEffects:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;

  v9 = a3;
  v10 = objc_msgSend(a6, "count");
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "legibilityWeight");

  if (v12 == 1)
  {
    v13 = (a5 != 0) & ~objc_msgSend(v9, "_suppressesAccessibilityHairlineThickening");
    if (v10)
      v14 = 0;
    else
      v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_setupRBSymbolLayerWithSymbolImageLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(id, void *);
  void *v25;
  void *v26;
  id WeakRetained;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  CGFloat v37;
  CGFloat v38;
  __int128 v39;
  CGFloat a;
  CGFloat ty;
  double v42;
  double tx;
  double d;
  double v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  __int128 v57;
  __int128 v58;
  double v59;
  CGAffineTransform v60;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v63;
  __int128 v64;

  v4 = a3;
  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "animator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(v4, "contentsSize");
      v9 = v8;
      v11 = v10;
      -[UIView bounds](self, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(v6, "setBounds:");
      v20 = *MEMORY[0x1E0C9D538];
      v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v6, "setPosition:", *MEMORY[0x1E0C9D538], v21);
      objc_msgSend(v4, "contentsScaleFactor");
      objc_msgSend(v6, "setContentsScale:");
      objc_msgSend(v4, "contentsScaleFactor");
      objc_msgSend(v6, "setRasterizationScale:");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
      objc_msgSend(v4, "rbSymbolConfiguration");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v59 = v21;
        v56 = v20;
        v24 = (void (**)(id, void *))*(id *)(v22 + 24);
        objc_msgSend(v4, "contentsMultiplyColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2](v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setStyleResolver:", v26);

        WeakRetained = objc_loadWeakRetained((id *)(v23 + 16));
        objc_msgSend(v6, "animator");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setGlyph:", WeakRetained);

        v29 = *(unsigned int *)(v23 + 8);
        objc_msgSend(v6, "animator");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setRenderingMode:", v29);

        v31 = v9;
        v32 = *(double *)(v23 + 32);
        objc_msgSend(v6, "animator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setVariableValue:", v32);

        v34 = objc_msgSend(v4, "symbolLayerNeedsHorizontalFlip");
        objc_msgSend(v6, "animator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setFlipsRightToLeft:", v34);

        v36 = MEMORY[0x1E0C9BAA8];
        v37 = *MEMORY[0x1E0C9BAA8];
        v57 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 24);
        v38 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
        LayerContentModeTransform(-[UIView contentMode](self, "contentMode"), (uint64_t)&t2, v13, v15, v17, v19, v31, v11);
        t1.a = v37;
        *(_OWORD *)&t1.b = *(_OWORD *)(v36 + 8);
        *(_OWORD *)&t1.d = v57;
        t1.ty = v38;
        CGAffineTransformConcat(&v63, &t1, &t2);
        v64 = *(_OWORD *)&v63.b;
        v39 = *(_OWORD *)&v63.d;
        a = v63.a;
        ty = v63.ty;
        if (v4)
        {
          v58 = *(_OWORD *)&v63.d;
          objc_msgSend(v4, "symbolLayerPositionTransform");
          v39 = v58;
        }
        else
        {
          memset(&v60, 0, sizeof(v60));
        }
        t1.a = a;
        *(_OWORD *)&t1.b = v64;
        *(_OWORD *)&t1.d = v39;
        t1.ty = ty;
        CGAffineTransformConcat(&v63, &t1, &v60);
        v42 = v63.a;
        d = v63.d;
        tx = v63.tx;
        v45 = v63.ty;
        objc_msgSend(v6, "animator");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_opt_respondsToSelector();

        if ((v47 & 1) != 0)
        {
          objc_msgSend(v6, "animator");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setTransform:", v42, d, tx, v45);

        }
        else
        {
          objc_msgSend(v6, "setSymbolTransform:", v42, d, tx, v45);
        }
        -[UIImageView _effectiveSymbolContentTransitionContainerView](self, "_effectiveSymbolContentTransitionContainerView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v49, v56, v59);
          v51 = v50;
          v53 = v52;
          objc_msgSend(v6, "animator");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setPosition:", v51, v53);

          objc_msgSend(v6, "animator");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setPresentationPosition:", v51, v53);

        }
      }

    }
  }

}

- (void)_applyEffectsFromLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "contentEffects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView mt_setContentEffects:](self, "mt_setContentEffects:", v4);
  objc_msgSend(v15, "contentsMultiplyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _overrideTintColor](self, "_overrideTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;

    v5 = v8;
  }
  v9 = objc_msgSend(v15, "contentDrawMode");
  if ((_DWORD)v9)
  {
    v10 = v9;
    if (!v5)
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIImageView _colorByApplyingDrawMode:toColor:](self, "_colorByApplyingDrawMode:toColor:", v10, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  -[UIView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !-[UIImageView isAnimating](self, "isAnimating"))
  {
    v13 = objc_msgSend(objc_retainAutorelease(v5), "CGColor");
    v14 = (_QWORD *)MEMORY[0x1E0CD2FD8];
  }
  else
  {
    v13 = 0;
    v14 = (_QWORD *)MEMORY[0x1E0CD2FE0];
  }
  objc_msgSend(v12, "setContentsMultiplyColor:", v13);
  objc_msgSend(v12, "setContentsSwizzle:", *v14);

}

- (BOOL)_setImageViewContentsForAnimatedImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(void *, const __CFString *, const __CFString *, void *);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  _OWORD v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD aBlock[6];
  _OWORD v51[3];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView layer](self, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  v39 = v4;
  objc_msgSend(v4, "images");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v44 = (id)*MEMORY[0x1E0CD2FE0];
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v7)
  {
    v8 = v7;
    v45 = *(_QWORD *)v53;
    v40 = (void *)*MEMORY[0x1E0CD2FD8];
    v9 = 0.0;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v53 != v45)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
        {
          -[UIImageView _cachedPretiledImageForImage:](self, "_cachedPretiledImageForImage:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = v13;

            v11 = v15;
          }
          -[UIView bounds](self, "bounds");
          +[_UIImageContentLayout layoutForSource:inTarget:withSize:](_UIImageContentLayout, "layoutForSource:inTarget:withSize:", v11, self, v16, v17);
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = v18;
          if (v18)
          {
            -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v18);
            if ((v19[1] & 1) != 0)
              v20 = v19[4];
            else
              v20 = 0;
            v21 = v6;
            objc_msgSend(v6, "addObject:", v20);
            v22 = (void *)MEMORY[0x1E0CB3B18];
            objc_msgSend(v19, "contentsTransform");
          }
          else
          {
            v21 = v6;
            objc_msgSend(v6, "addObject:", 0);
            v22 = (void *)MEMORY[0x1E0CB3B18];
            memset(v51, 0, sizeof(v51));
          }
          objc_msgSend(v22, "valueWithCGAffineTransform:", v51);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v23);

          +[UIColor whiteColor](UIColor, "whiteColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "contentsMultiplyColor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v19, "contentsMultiplyColor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = v44;
            v44 = v40;
          }
          else
          {
            +[UIColor whiteColor](UIColor, "whiteColor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v27 = objc_retainAutorelease(v26);
          objc_msgSend(v42, "addObject:", objc_msgSend(v27, "CGColor"));

          if (v9 == 0.0)
          {
            objc_msgSend(v19, "contentsScaleFactor");
            v9 = v28;
          }

          v6 = v21;
        }

        ++v10;
      }
      while (v8 != v10);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      v8 = v29;
    }
    while (v29);
  }

  v30 = objc_msgSend(v6, "count");
  if (v30)
  {
    objc_msgSend(v39, "duration");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIImageView__setImageViewContentsForAnimatedImage___block_invoke;
    aBlock[3] = &unk_1E16EAF98;
    aBlock[5] = v31;
    aBlock[4] = v38;
    v32 = (void (**)(void *, const __CFString *, const __CFString *, void *))_Block_copy(aBlock);
    v32[2](v32, CFSTR("UIImageAnimationContents"), CFSTR("contents"), v6);
    v32[2](v32, CFSTR("UIImageAnimationContentsTransform"), CFSTR("contentsTransform"), v43);
    v32[2](v32, CFSTR("UIImageAnimationContentsMultiplyColor"), CFSTR("contentsMultiplyColor"), v42);
    v33 = v6;
    objc_msgSend(v6, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setContents:", v34);

    objc_msgSend(v43, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      objc_msgSend(v35, "CGAffineTransformValue");
    }
    else
    {
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
    }
    v46[0] = v47;
    v46[1] = v48;
    v46[2] = v49;
    objc_msgSend(v38, "setContentsTransform:", v46);

    objc_msgSend(v38, "setContentsMultiplyColor:", objc_msgSend(v42, "firstObject"));
    objc_msgSend(v38, "setContentsSwizzle:", v44);
    _setContentStretchForImage(self, v39);

    v6 = v33;
  }

  return v30 != 0;
}

void __53__UIImageView__setImageViewContentsForAnimatedImage___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  double v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0CD2798];
  v8 = a4;
  v9 = a2;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", v8);

  objc_msgSend(v11, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  LODWORD(v10) = 2139095039;
  objc_msgSend(v11, "setRepeatCount:", v10);
  objc_msgSend(v11, "setDuration:", *(double *)(a1 + 40));
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", v11, v9);

}

- (void)_setLayerAllowsEdgeAntialiasing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  __int16 imageViewFlags;
  __int16 v8;
  id v9;

  v3 = a3;
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsEdgeAntialiasing") ^ ((*(_WORD *)&self->_imageViewFlags & 0x80) == 0);

  if (v6)
    imageViewFlags = (__int16)self->_imageViewFlags;
  else
    imageViewFlags = *(_WORD *)&self->_imageViewFlags | 0x100;
  if (v3)
    v8 = 128;
  else
    v8 = 0;
  *(_WORD *)&self->_imageViewFlags = imageViewFlags & 0xFF7F | v8;
  if ((imageViewFlags & 0x100) == 0)
  {
    -[UIView layer](self, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsEdgeAntialiasing:", v3);

  }
}

- (UIEdgeInsets)_additionalAlignmentRectInsetsForRenderingSource:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v4 = a3;
  objc_opt_class();
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIImageView _edgeInsetsForEffectsForImage:](self, "_edgeInsetsForEffectsForImage:", v4);
    v5 = v9;
    v6 = v10;
    v7 = v11;
    v8 = v12;
  }

  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)_renditionForSource:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5 withRenditionResult:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t (**v34)(void);
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t (**v39)(void);
  id v40;
  CGImage *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  UIGraphicsImageRenderer *v46;
  void *v47;
  CGImageRef v48;
  CFTypeRef v49;
  void *v50;
  id v52;
  unsigned int v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  _QWORD v64[5];
  _QWORD v65[8];
  _QWORD v66[3];

  height = a4.height;
  width = a4.width;
  v66[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v11;
    objc_msgSend(v14, "_colorForFlattening");
    v15 = objc_claimAutoreleasedReturnValue();
    v63 = v12;
    if (!v15
      && !-[UIImageView _needsImageEffectsForImage:symbolConfiguration:](self, "_needsImageEffectsForImage:symbolConfiguration:", v14, v12))
    {
      v31 = 0;
      v32 = 0;
      v33 = 0;
      +[_UIImageContentRendition renditionWithResult:color:effects:drawMode:]((uint64_t)_UIImageContentRendition, v13, 0, 0, 0);
      goto LABEL_38;
    }
    v16 = v13;
    -[UIImageView _baseMultiplyColorWithImage:symbolConfiguration:](self, "_baseMultiplyColorWithImage:symbolConfiguration:", v14, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    -[UIImageView _effectiveContentEffectsWithImage:symbolConfiguration:](self, "_effectiveContentEffectsWithImage:symbolConfiguration:", v14, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v14;
    v20 = -[UIImageView _needsBoldEffectForImage:symbolConfiguration:withBaseColor:withEffects:](self, "_needsBoldEffectForImage:symbolConfiguration:withBaseColor:withEffects:", v14, v12, v17, v18);
    v21 = -[UIImageView drawMode](self, "drawMode");
    objc_msgSend(v12, "traitCollection");
    v22 = objc_claimAutoreleasedReturnValue();
    v55 = v20;
    v60 = v18;
    v62 = (void *)v22;
    if (v20)
    {
      v23 = v22;
      v52 = v11;
      v59 = (void *)v15;
      v66[0] = CFSTR("_UIKitBoldTintStyle");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "resolvedColorWithTraitCollection:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_primitiveImageAsset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_cachedRenditionWithSize:tintColor:traitCollection:bold:drawMode:", v24, v23, 1, v21, width, height);
      v26 = (void *)v17;
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = v19;
      if (v17)
      {
        v57 = v26;

        v27 = 0;
        v28 = 0;
        v58 = 0;
        v61 = 0;
        v29 = 0;
        v30 = 0;
        v11 = v52;
        v13 = v16;
        v31 = 0;
        goto LABEL_32;
      }
      v58 = v21;
      v13 = v16;
      -[_UIImageContentRenditionResult CGImageProvider](v16);
      v34 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v34[2]());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v24;
      objc_msgSend(v35, "_imageWithStylePresets:tintColor:traitCollection:", v54, v24, v23);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      v11 = v52;
      v18 = v60;
    }
    else
    {
      v14 = v19;
      v58 = v21;
      v56 = 0;
      v29 = 0;
      v13 = v16;
    }
    if (objc_msgSend(v18, "count"))
    {
      v61 = v18;
      v36 = 0;
    }
    else
    {
      v61 = 0;
      v36 = v58;
      v58 = 0;
    }
    v59 = (void *)v15;
    v57 = (void *)v17;
    if (!(v17 | v15))
      goto LABEL_23;
    if (-[UIImageView _shouldTreatImageAsTemplate:symbolConfiguration:](self, "_shouldTreatImageAsTemplate:symbolConfiguration:", v14, v63))
    {
      if (v17)
        v37 = (void *)v17;
      else
        v37 = (void *)v15;
    }
    else
    {
      v37 = (void *)v15;
      if (!v15)
        goto LABEL_21;
    }
    v15 = v37;
LABEL_21:
    objc_msgSend((id)v15, "resolvedColorWithTraitCollection:", v62);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[UIImageView _colorByApplyingDrawMode:toColor:](self, "_colorByApplyingDrawMode:toColor:", v36, v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      goto LABEL_27;
    }
LABEL_23:
    if (!(_DWORD)v36)
    {
      v31 = 0;
      v53 = 0;
      goto LABEL_29;
    }
    v53 = v36;
    if (!v29)
    {
      -[_UIImageContentRenditionResult CGImageProvider](v13);
      v39 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v39[2]());
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    v40 = objc_retainAutorelease(v29);
    v41 = (CGImage *)objc_msgSend(v40, "CGImage");
    objc_msgSend(v40, "scale");
    v43 = v42;
    v44 = (double)CGImageGetWidth(v41) / v42;
    v45 = (double)CGImageGetHeight(v41) / v43;
    +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setScale:", v43);
    v46 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v38, v44, v45);
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke;
    v65[3] = &unk_1E16C4EB8;
    *(double *)&v65[5] = v44;
    *(double *)&v65[6] = v45;
    v65[7] = v41;
    v65[4] = self;
    -[UIGraphicsImageRenderer imageWithActions:](v46, "imageWithActions:", v65);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    v31 = 0;
LABEL_27:

LABEL_29:
    v27 = v56;
    v47 = v60;
    if (!v29)
    {
      v28 = 0;
      v17 = 0;
      v30 = 1;
      goto LABEL_35;
    }
    v28 = objc_retainAutorelease(v29);
    v48 = CGImageRetain((CGImageRef)objc_msgSend(v28, "CGImage"));
    v49 = CFAutorelease(v48);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke_2;
    v64[3] = &__block_descriptor_40_e15___CGImage__8__0l;
    v64[4] = v49;
    -[_UIImageContentRenditionResult resultWithCGImageProvider:]((uint64_t)v13, v64);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIImageContentRendition renditionWithResult:color:effects:]((uint64_t)_UIImageContentRendition, v50, v31, v61);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!v55)
    {
      v17 = 0;
      v30 = 1;
      v13 = v50;
      v27 = v56;
      goto LABEL_35;
    }
    objc_msgSend(v14, "imageAsset");
    v30 = 1;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "_cacheRendition:forSize:tintColor:traitCollection:bold:drawMode:", v29, v56, v62, 1, v53, width, height);
    v17 = 0;
    v13 = v50;
    v27 = v56;
LABEL_32:

    v47 = v60;
LABEL_35:

    if (!v30)
    {
      v33 = v59;
      v32 = v61;
      goto LABEL_41;
    }
    v33 = v59;
    v32 = v61;
    if (v29)
    {
LABEL_39:
      v29 = v29;
      v17 = (uint64_t)v29;
LABEL_41:

      v12 = v63;
      goto LABEL_42;
    }
    +[_UIImageContentRendition renditionWithResult:color:effects:drawMode:]((uint64_t)_UIImageContentRendition, v13, v31, v61, v58);
LABEL_38:
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v13);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_42:

  return (id)v17;
}

uint64_t __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGRect v5;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetBlendMode(v3, kCGBlendModeCopy);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  v5.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v5.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v5.size.width = *(CGFloat *)(a1 + 40);
  v5.size.height = *(CGFloat *)(a1 + 48);
  CGContextDrawImage(v3, v5, *(CGImageRef *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_renderDrawModeEffectInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (void)_setNeedsUpdateState
{
  __int16 imageViewFlags;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  imageViewFlags = (__int16)self->_imageViewFlags;
  if ((imageViewFlags & 4) == 0)
  {
    *(_WORD *)&self->_imageViewFlags = imageViewFlags | 4;
    objc_initWeak(&location, self);
    v3 = (void *)UIApp;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __35__UIImageView__setNeedsUpdateState__block_invoke;
    v4[3] = &unk_1E16B3F40;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "_performBlockAfterCATransactionCommits:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __35__UIImageView__setNeedsUpdateState__block_invoke(uint64_t a1)
{
  _WORD *WeakRetained;
  _WORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[244] &= ~4u;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateState");
    WeakRetained = v2;
  }

}

- (UIImageView)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
  UIImage *v6;
  UIImage *v7;
  double v8;
  double v9;
  UIImage *v10;
  double v11;
  double v12;
  UIImageView *v13;
  UIImageView *v14;
  objc_super v16;

  v6 = image;
  v7 = highlightedImage;
  if (v6 && !-[UIImage _isDecompressing](v6, "_isDecompressing"))
  {
    v10 = v6;
    goto LABEL_7;
  }
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v7 && !-[UIImage _isDecompressing](v7, "_isDecompressing"))
  {
    v10 = v7;
LABEL_7:
    -[UIImage size](v10, "size");
    v8 = v11;
    v9 = v12;
  }
  v16.receiver = self;
  v16.super_class = (Class)UIImageView;
  v13 = -[UIView initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, v8, v9);
  v14 = v13;
  if (v13)
  {
    _UIImageViewCommonInit(v13);
    -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
    if (-[UIImage _isDecompressing](v6, "_isDecompressing") || -[UIImage _isDecompressing](v7, "_isDecompressing"))
    {
      -[UIImageView _setDecompressingImage:forType:](v14, "_setDecompressingImage:forType:", v6, 0);
      -[UIImageView _setDecompressingImage:forType:](v14, "_setDecompressingImage:forType:", v7, 1);
      -[UIView setNeedsLayout](v14, "setNeedsLayout");
    }
    else
    {
      -[UIImageView setImage:](v14, "setImage:", v6);
      -[UIImageView setHighlightedImage:](v14, "setHighlightedImage:", v7);
    }
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIImageView;
  -[UIView encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  -[UIImageView image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIImage"));
  -[UIImageView highlightedImage](self, "highlightedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UIHighlightedImage"));
  -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIAnimationImages"));

  }
  -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIHighlightedAnimationImages"));

  }
  -[_UIImageViewStorage animationDuration](self->_storage, "animationDuration");
  if (v11 != 0.0)
  {
    -[_UIImageViewStorage animationDuration](self->_storage, "animationDuration");
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIAnimationDuration"));
  }
  if (-[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount"), CFSTR("UIAnimationRepeatCount"));
  if (-[_UIImageViewStorage isHighlighted](self->_storage, "isHighlighted"))
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIHighlighted"), (double)-[_UIImageViewStorage isHighlighted](self->_storage, "isHighlighted"));
  if (-[_UIImageViewStorage adjustsImageSizeForAccessibilityContentSizeCategory](self->_storage, "adjustsImageSizeForAccessibilityContentSizeCategory"))
  {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UIImageViewStorage adjustsImageSizeForAccessibilityContentSizeCategory](self->_storage, "adjustsImageSizeForAccessibilityContentSizeCategory"), CFSTR("UIAdjustsImageSizeForAccessibilityContentSizeCategory"));
  }
  -[_UIImageViewStorage preferredSymbolConfiguration](self->_storage, "preferredSymbolConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UIImageViewStorage preferredSymbolConfiguration](self->_storage, "preferredSymbolConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("UIPreferredSymbolConfiguration"));

  }
}

- (BOOL)isTransparentFocusItem
{
  void *v3;
  int v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsViewTransparency");

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIImageView;
    if (-[UIView isTransparentFocusItem](&v10, sel_isTransparentFocusItem))
    {
      return 1;
    }
    else
    {
      -[UIImageView image](self, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[UIImageView image](self, "image");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "_probeIsSeeThrough");

      }
      else
      {
        v5 = 1;
      }

    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIImageView;
    return -[UIView isTransparentFocusItem](&v9, sel_isTransparentFocusItem);
  }
  return v5;
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIImageView;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  -[UIImageView _updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass](self, "_updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass");
}

- (UILayoutGuide)imageContentGuide
{
  return (UILayoutGuide *)-[UIImageView _imageContentGuideAllowingCreation:](self, "_imageContentGuideAllowingCreation:", 1);
}

- (id)midlineGuide
{
  return -[UIImageView _imageContentGuideAllowingCreation:](self, "_imageContentGuideAllowingCreation:", 1);
}

- (BOOL)_suppressPixelAlignment
{
  return 1;
}

- (BOOL)_guardAgainstDegenerateBaselineCalculation
{
  return (*(_WORD *)&self->_imageViewFlags >> 9) & 1;
}

- (_UIImageSymbolVariant)_preferredSymbolVariant
{
  return -[_UIImageViewStorage preferredSymbolVariant](self->_storage, "preferredSymbolVariant");
}

- (void)_setPreferredSymbolVariant:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[_UIImageViewStorage preferredSymbolVariant](self->_storage, "preferredSymbolVariant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

    v9 = v10;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      v8 = v10;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[UIImageView _activeImage](self, "_activeImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewStorage setPreferredSymbolVariant:](self->_storage, "setPreferredSymbolVariant:", v10);
    -[UIImageView _invalidateResolvedImages](self, "_invalidateResolvedImages");
    -[UIImageView _resolveImagesWithPreviouslyDisplayedImage:](self, "_resolveImagesWithPreviouslyDisplayedImage:", v9);
  }

  v8 = v10;
LABEL_10:

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _QWORD *ContextStack;
  CGContext *v10;
  double v11;
  CGFloat v12;
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIImageView _activeImage](self, "_activeImage");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = (id)v8;
  if (v8)
  {
    -[UIView bounds](self, "bounds");
    objc_msgSend(v13, "drawInRect:blendMode:alpha:", 17);
    v8 = (uint64_t)v13;
  }
  if (-[UIImageView _needsImageEffectsForImage:](self, "_needsImageEffectsForImage:", v8))
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v10 = 0;
    else
      v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextGetCompositeOperation();
    CGContextGetAlpha();
    v12 = v11;
    -[UIImageView _renderDrawModeEffectInRect:](self, "_renderDrawModeEffectInRect:", x, y, width, height);
    CGContextSetCompositeOperation();
    CGContextSetAlpha(v10, v12);
  }

}

- (NSTimeInterval)animationDuration
{
  NSTimeInterval result;

  -[_UIImageViewStorage animationDuration](self->_storage, "animationDuration");
  return result;
}

- (NSInteger)animationRepeatCount
{
  return -[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount");
}

- (id)_initialValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(CFSTR("imageDynamicRange"), "isEqualToString:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UIImageView imageDynamicRange](self, "imageDynamicRange"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageView;
    -[UIView _initialValueForKey:](&v8, sel__initialValueForKey_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)_generateDeferredAnimations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIImageView;
  -[UIView _generateDeferredAnimations:](&v14, sel__generateDeferredAnimations_, v4);
  objc_opt_self();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageDynamicRange"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "animationFrames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      -[UIView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWantsExtendedDynamicRangeContent:", 1);

      v10 = MEMORY[0x1E0C809B0];
      if (v8 >= 1)
      {
        for (i = 0; i != v8; ++i)
        {
          v13[0] = v10;
          v13[1] = 3221225472;
          v13[2] = __43__UIImageView__generateDeferredAnimations___block_invoke;
          v13[3] = &unk_1E16B5540;
          v13[4] = self;
          objc_msgSend(v6, "animateFrameAtIndex:animations:", i, v13);
        }
      }
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __43__UIImageView__generateDeferredAnimations___block_invoke_2;
      v12[3] = &unk_1E16B3FD8;
      v12[4] = self;
      +[UIView _addCompletion:](UIView, "_addCompletion:", v12);
    }

  }
}

void __43__UIImageView__generateDeferredAnimations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "_maximumEDRForDynamicRange:", v4);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentsMaximumDesiredEDR:", v6);

}

uint64_t __43__UIImageView__generateDeferredAnimations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHDRFlags:", 1);
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect
{
  void *v4;
  NSSymbolEffect *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CE86E8];
  v5 = symbolEffect;
  objc_msgSend(v4, "options");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView addSymbolEffect:options:](self, "addSymbolEffect:options:", v5, v6);

}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
  -[UIImageView addSymbolEffect:options:animated:](self, "addSymbolEffect:options:animated:", symbolEffect, options, 1);
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  -[UIImageView addSymbolEffect:options:animated:completion:](self, "addSymbolEffect:options:animated:completion:", symbolEffect, options, animated, 0);
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated completion:(UISymbolEffectCompletion)completionHandler
{
  _BOOL8 v7;
  NSSymbolEffectOptions *v11;
  void (**v12)(UISymbolEffectCompletion, id);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _UIImageViewSymbolAnimationPresetManager *animationPresetManager;
  id v23;
  void *v24;
  NSSymbolEffect *v25;

  v7 = animated;
  v25 = symbolEffect;
  v11 = options;
  v12 = completionHandler;
  if (!-[NSSymbolEffect ui_isSupportedByImageView](v25, "ui_isSupportedByImageView"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIImageView.m"), 2602, CFSTR("Unsupported symbol effect added to UIImageView."));

  }
  if (v25)
  {
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[UIImageView image](self, "image"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      -[UIImageView image](self, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isSymbolImage");

      if ((v18 & 1) != 0)
      {
        v19 = -[NSSymbolEffect copy](v25, "copy");

        v20 = -[NSSymbolEffectOptions copy](v11, "copy");
        v11 = (NSSymbolEffectOptions *)v20;
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CE86E8], "options");
          v11 = (NSSymbolEffectOptions *)objc_claimAutoreleasedReturnValue();
        }
        -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        animationPresetManager = self->_animationPresetManager;
        if (v21)
        {
          -[_UIImageViewSymbolAnimationPresetManager addActiveSymbolEffect:options:animated:completion:](animationPresetManager, "addActiveSymbolEffect:options:animated:completion:", v19, v11, v7, v12);
        }
        else
        {
          -[_UIImageViewSymbolAnimationPresetManager addPendingSymbolEffect:options:animated:completion:](animationPresetManager, "addPendingSymbolEffect:options:animated:completion:", v19, v11, v7, v12);
          -[UIImageView _updateState](self, "_updateState");
        }
        v25 = (NSSymbolEffect *)v19;
        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  if (v12)
  {
    v23 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
    objc_msgSend(v23, "setFinished:", 0);
    objc_msgSend(v23, "setSender:", self);
    v24 = (void *)-[NSSymbolEffect copy](v25, "copy");
    objc_msgSend(v23, "setEffect:", v24);

    v12[2](v12, v23);
  }
LABEL_14:

}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect
{
  void *v4;
  NSSymbolEffect *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CE86E8];
  v5 = symbolEffect;
  objc_msgSend(v4, "options");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView removeSymbolEffectOfType:options:](self, "removeSymbolEffectOfType:options:", v5, v6);

}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
  -[UIImageView removeSymbolEffectOfType:options:animated:](self, "removeSymbolEffectOfType:options:animated:", symbolEffect, options, 1);
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  -[UIImageView removeSymbolEffectOfType:options:animated:completion:](self, "removeSymbolEffectOfType:options:animated:completion:", symbolEffect, options, 1, 0);
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated completion:(UISymbolEffectCompletion)completionHandler
{
  _BOOL8 v7;
  NSSymbolEffect *v11;
  NSSymbolEffectOptions *v12;
  UISymbolEffectCompletion v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  NSSymbolEffect *v18;

  v7 = animated;
  v11 = symbolEffect;
  v12 = options;
  v13 = completionHandler;
  if (!-[NSSymbolEffect ui_isSupportedByImageView](v11, "ui_isSupportedByImageView"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIImageView.m"), 2660, CFSTR("Unsupported symbol effect removed from UIImageView."));

  }
  if (v11)
  {
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v18 = (NSSymbolEffect *)-[NSSymbolEffect copy](v11, "copy");

      v17 = -[NSSymbolEffectOptions copy](v12, "copy");
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CE86E8], "options");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      -[_UIImageViewSymbolAnimationPresetManager removeSymbolEffectsOfType:options:animated:completion:](self->_animationPresetManager, "removeSymbolEffectsOfType:options:animated:completion:", v18, v17, v7, v13);
      v12 = (NSSymbolEffectOptions *)v17;
    }
    else
    {
      v18 = v11;
    }
  }
  else
  {
    v18 = 0;
  }

}

- (void)removeAllSymbolEffects
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CE86E8], "options");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView removeAllSymbolEffectsWithOptions:](self, "removeAllSymbolEffectsWithOptions:", v3);

}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CE86E8], "options", options);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView removeAllSymbolEffectsWithOptions:animated:](self, "removeAllSymbolEffectsWithOptions:animated:", v4, 1);

}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  -[_UIImageViewSymbolAnimationPresetManager removeAllSymbolEffectsWithOptions:animated:](self->_animationPresetManager, "removeAllSymbolEffectsWithOptions:animated:", options, animated);
}

- (void)_addSymbolEffect:(id)a3
{
  -[UIImageView _addSymbolEffect:animated:](self, "_addSymbolEffect:animated:", a3, 1);
}

- (void)_addSymbolEffect:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  objc_msgSend(a3, "_nsSymbolEffectRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CE86E8], "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView addSymbolEffect:options:animated:](self, "addSymbolEffect:options:animated:", v7, v6, v4);

}

- (void)_removeSymbolEffect:(id)a3
{
  -[UIImageView _removeSymbolEffect:animated:](self, "_removeSymbolEffect:animated:", a3, 1);
}

- (void)_removeSymbolEffect:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  objc_msgSend(a3, "_nsSymbolEffectRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CE86E8], "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView removeSymbolEffectOfType:options:animated:](self, "removeSymbolEffectOfType:options:animated:", v7, v6, v4);

}

- (void)_removeAllSymbolEffects
{
  -[UIImageView _removeAllSymbolEffectsAnimated:](self, "_removeAllSymbolEffectsAnimated:", 1);
}

- (void)_removeAllSymbolEffectsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CE86E8], "options");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView removeAllSymbolEffectsWithOptions:animated:](self, "removeAllSymbolEffectsWithOptions:animated:", v5, v3);

}

- (void)_setSymbolImage:(id)a3 withSymbolTransition:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "_nsSymbolContentTransitionRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setSymbolImage:withContentTransition:](self, "setSymbolImage:withContentTransition:", v6, v7);

}

- (void)animationPresetManager:(id)a3 didActivateEffect:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "animator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v24 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v27, &location);
  v17 = v12;
  v25 = v17;
  v18 = v14;
  v26 = v18;
  -[UIImageView _activeImage](self, "_activeImage", v24, 3221225472, __84__UIImageView_animationPresetManager_didActivateEffect_options_animated_completion___block_invoke, &unk_1E16EAF70);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ui_animationConfigurationWithOptions:completion:configuration:", v13, &v24, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "animation");
  objc_msgSend(v21, "options");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:options:", v22, v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __84__UIImageView_animationPresetManager_didActivateEffect_options_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[60], "activeSymbolEffectDidComplete:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
      objc_msgSend(v5, "setFinished:", a2);
      objc_msgSend(v5, "setSender:", v6);
      objc_msgSend(v5, "setEffect:", *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    objc_msgSend(v6, "_updateStateIfRBSymbolLayerNoLongerNeeded");
    WeakRetained = v6;
  }

}

- (void)animationPresetManager:(id)a3 didRemoveEffect:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7 wasActive:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  id v14;
  id v15;
  void (**v16)(id, id);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;

  v8 = a8;
  v10 = a6;
  v26 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, id))a7;
  if (v8)
  {
    -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "animator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView _activeImage](self, "_activeImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    objc_msgSend(v14, "ui_animationConfigurationWithOptions:completion:configuration:", v15, 0, v20);
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "animation");

    if (v21)
      objc_msgSend(v18, "cancelAnimation:", v23);
    else
      objc_msgSend(v18, "removeAnimation:", v23);

    v15 = v25;
  }
  if (v16)
  {
    v24 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
    objc_msgSend(v24, "setFinished:", 0);
    objc_msgSend(v24, "setSender:", self);
    objc_msgSend(v24, "setEffect:", v14);
    v16[2](v16, v24);

  }
}

- (void)animationPresetManager:(id)a3 didSetScale:(int)a4 usingEffect:(id)a5 options:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  uint64_t v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id location;

  v9 = a7;
  v12 = *(_QWORD *)&a4;
  v27 = a3;
  v28 = a5;
  v14 = a6;
  v15 = a8;
  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "animator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "scaleLevel");
  if (v18 == (_DWORD)v12)
  {
    v24 = 1;
  }
  else
  {
    if (v9)
    {
      v26 = v14;
      objc_initWeak(&location, self);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __90__UIImageView_animationPresetManager_didSetScale_usingEffect_options_animated_completion___block_invoke;
      v29[3] = &unk_1E16EAF70;
      objc_copyWeak(&v32, &location);
      v30 = v28;
      v31 = v15;
      -[UIImageView _activeImage](self, "_activeImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "ui_animationConfigurationWithOptions:completion:configuration:", v26, v29, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "animation");
      objc_msgSend(v21, "options");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAnimation:options:", v22, v23);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      v14 = v26;
    }
    objc_msgSend(v17, "setScaleLevel:", v12);
    v24 = !v9;
  }
  if (v15 && v24)
  {
    v25 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
    objc_msgSend(v25, "setFinished:", v18 != (_DWORD)v12);
    objc_msgSend(v25, "setSender:", self);
    objc_msgSend(v25, "setEffect:", v28);
    (*((void (**)(id, id))v15 + 2))(v15, v25);

  }
  -[UIImageView _updateStateIfRBSymbolLayerNoLongerNeeded](self, "_updateStateIfRBSymbolLayerNoLongerNeeded");

}

void __90__UIImageView_animationPresetManager_didSetScale_usingEffect_options_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[60], "activeSymbolEffectDidComplete:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
      objc_msgSend(v5, "setFinished:", a2);
      objc_msgSend(v5, "setSender:", v6);
      objc_msgSend(v5, "setEffect:", *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    objc_msgSend(v6, "_updateStateIfRBSymbolLayerNoLongerNeeded");
    WeakRetained = v6;
  }

}

- (void)animationPresetManager:(id)a3 didSetHiddenness:(BOOL)a4 usingEffect:(id)a5 options:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  unint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;

  v9 = a7;
  v12 = a4;
  v29 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "animator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isHidden") ^ v12;
  if ((_DWORD)v19 != 1)
  {
    v25 = 1;
    if (!v16)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v9)
  {
    v28 = v15;
    if (v12)
      v20 = 9;
    else
      v20 = 5;
    v27 = __PAIR64__(v20, v9);
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __95__UIImageView_animationPresetManager_didSetHiddenness_usingEffect_options_animated_completion___block_invoke;
    v30[3] = &unk_1E16EAF70;
    objc_copyWeak(&v33, &location);
    v31 = v14;
    v32 = v16;
    -[UIImageView _activeImage](self, "_activeImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ui_animationConfigurationWithOptions:completion:configuration:", v28, v30, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:options:", HIDWORD(v27), v24);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    v15 = v28;
    v9 = v27;
  }
  objc_msgSend(v18, "setHidden:", v12, v27);
  v25 = !v9;
  if (v16)
  {
LABEL_10:
    if (v25)
    {
      v26 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
      objc_msgSend(v26, "setFinished:", v19);
      objc_msgSend(v26, "setSender:", self);
      objc_msgSend(v26, "setEffect:", v14);
      (*((void (**)(id, id))v16 + 2))(v16, v26);

    }
  }
LABEL_12:
  -[UIImageView _updateStateIfRBSymbolLayerNoLongerNeeded](self, "_updateStateIfRBSymbolLayerNoLongerNeeded");

}

void __95__UIImageView_animationPresetManager_didSetHiddenness_usingEffect_options_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[60], "activeSymbolEffectDidComplete:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = +[UISymbolEffectCompletionContext _new](UISymbolEffectCompletionContext, "_new");
      objc_msgSend(v5, "setFinished:", a2);
      objc_msgSend(v5, "setSender:", v6);
      objc_msgSend(v5, "setEffect:", *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    objc_msgSend(v6, "_updateStateIfRBSymbolLayerNoLongerNeeded");
    WeakRetained = v6;
  }

}

- (BOOL)_shouldTreatImageAsTemplate:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[UIImageView _effectiveRenderingModeForSource:symbolConfiguration:](self, "_effectiveRenderingModeForSource:symbolConfiguration:", v6, v7) != 2|| objc_msgSend(v7, "_hasSpecifiedHierarchicalColors")&& (objc_msgSend(v6, "_isHierarchicalColorSymbolImage") & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else if (objc_msgSend(v7, "_hasSpecifiedPaletteColors"))
  {
    objc_msgSend(v7, "_colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
      LOBYTE(v8) = 1;
    else
      v8 = objc_msgSend(v6, "_isPaletteColorSymbolImage") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (UIEdgeInsets)_edgeInsetsForEffectsForImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v4 = a3;
  -[UIImageView _symbolConfigurationForImage:](self, "_symbolConfigurationForImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIImageView _needsBoldEffectForImage:symbolConfiguration:](self, "_needsBoldEffectForImage:symbolConfiguration:", v4, v5))
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", CFSTR("_UIKitBoldTintStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v4, "scale");
  v8 = v7;
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _edgeInsetsForStylePresetNames:scale:traitCollection:](UIImage, "_edgeInsetsForStylePresetNames:scale:traitCollection:", v6, v9, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (UIImageDynamicRange)preferredImageDynamicRange
{
  return (((unint64_t)*(_WORD *)&self->_imageViewFlags >> 10) & 3) - 1;
}

- (void)setPreferredImageDynamicRange:(UIImageDynamicRange)preferredImageDynamicRange
{
  __int16 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = preferredImageDynamicRange;
  if (-[UIImageView preferredImageDynamicRange](self, "preferredImageDynamicRange") != preferredImageDynamicRange)
  {
    -[UIView _deferredAnimationForKey:ignoringKeyFrames:](self, "_deferredAnimationForKey:ignoringKeyFrames:", CFSTR("imageDynamicRange"), 1);
    v5 = objc_claimAutoreleasedReturnValue();
    *(_WORD *)&self->_imageViewFlags = *(_WORD *)&self->_imageViewFlags & 0xF3FF | ((v3 << 10) + 1024) & 0xC00;
    v7 = (id)v5;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UIImageView imageDynamicRange](self, "imageDynamicRange"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimationFrameForValue:", v6);

    }
    else
    {
      -[UIImageView _updateState](self, "_updateState");
    }

  }
}

- (UIImageDynamicRange)imageDynamicRange
{
  UIImageDynamicRange v3;
  void *v4;

  v3 = -[UIImageView preferredImageDynamicRange](self, "preferredImageDynamicRange");
  if (v3 == UIImageDynamicRangeUnspecified)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "imageDynamicRange");

  }
  if (v3 == UIImageDynamicRangeUnspecified)
    return 0;
  else
    return v3;
}

- (void)_setMasksTemplateImages:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewStorage masksTemplateImages](self->_storage, "masksTemplateImages") != a3)
  {
    -[_UIImageViewStorage setMasksTemplateImages:](self->_storage, "setMasksTemplateImages:", v3);
    if (v3)
    {
      -[UIImageView _updateMasking](self, "_updateMasking");
    }
    else
    {
      -[UIView layer](self, "layer");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCompositingFilter:", 0);

    }
  }
}

- (id)_colorByApplyingDrawModeToColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIImageView _colorByApplyingDrawMode:toColor:](self, "_colorByApplyingDrawMode:toColor:", -[UIImageView drawMode](self, "drawMode"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_colorByApplyingDrawMode:(unsigned int)a3 toColor:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  uint8_t buf[8];
  double v28;
  double v29;
  int v30;
  uint8_t v31[4];
  int v32;
  uint64_t v33;

  v4 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v30 = 0;
  v28 = 0.0;
  v29 = 0.0;
  v7 = v6;
  if (-[UIImageView _getDrawModeCompositeOperation:whiteComponent:drawingAlpha:forDrawMode:](self, "_getDrawModeCompositeOperation:whiteComponent:drawingAlpha:forDrawMode:", &v30, &v29, &v28, v4))
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!self)
      {
        __UIFaultDebugAssertLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
        }

      }
    }
    else if (!self)
    {
      v19 = qword_1ECD79C78;
      if (!qword_1ECD79C78)
      {
        v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD79C78);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
    +[UITraitCollection _currentTraitCollectionIfExists]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v9);

    v10 = (void *)_UISetCurrentFallbackEnvironment(self);
    v26 = 0.0;
    *(double *)buf = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    objc_msgSend(v6, "getRed:green:blue:alpha:", buf, &v26, &v25, &v24);
    _UIRestorePreviousFallbackEnvironment(v10);
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v8);
    if (v30 == 8)
    {
      v11 = 1.0 - v28;
      v12 = v24 * (1.0 - v28);
      v7 = v6;
      if (v12 <= 0.0)
      {
LABEL_12:

        goto LABEL_13;
      }
      v13 = v11 * (v24 * *(double *)buf) / v12;
      v14 = v11 * (v24 * v26) / v12;
      v15 = v11 * (v24 * v25) / v12;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        if (v30 != 5)
        {
          __UIFaultDebugAssertLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v31 = 67109120;
            v32 = v30;
            _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Unexpected CG blend mode: %d", v31, 8u);
          }

        }
      }
      else if (v30 != 5)
      {
        v22 = qword_1ECD79C80;
        if (!qword_1ECD79C80)
        {
          v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v22, (unint64_t *)&qword_1ECD79C80);
        }
        v23 = *(NSObject **)(v22 + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v31 = 67109120;
          v32 = v30;
          _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Unexpected CG blend mode: %d", v31, 8u);
        }
      }
      v7 = v6;
      if (v24 <= 0.0)
        goto LABEL_12;
      v16 = v24 * (v29 * v28);
      v13 = v16 + (1.0 - v28) * (v24 * *(double *)buf) / v24;
      v14 = v16 + (1.0 - v28) * (v24 * v26) / v24;
      v15 = v16 + (1.0 - v28) * (v24 * v25) / v24;
    }
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_13:

  return v7;
}

- (id)_baseMultiplyColorWithImage:(id)a3 symbolConfiguration:(id)a4
{
  return -[UIImageView _baseMultiplyColorWithImage:symbolConfiguration:shouldResolveDynamicColors:](self, "_baseMultiplyColorWithImage:symbolConfiguration:shouldResolveDynamicColors:", a3, a4, 1);
}

- (id)_baseMultiplyColorWithImage:(id)a3 symbolConfiguration:(id)a4 shouldResolveDynamicColors:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;

  v5 = a5;
  v8 = a4;
  if (-[UIImageView _shouldTreatImageAsTemplate:symbolConfiguration:](self, "_shouldTreatImageAsTemplate:symbolConfiguration:", a3, v8))
  {
    if (objc_msgSend(v8, "_hasSpecifiedPaletteColors"))
    {
      objc_msgSend(v8, "_paletteColorsWithEffect:shouldResolveDynamicColors:", self, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v8, "_hasSpecifiedHierarchicalColors"))
    {
      objc_msgSend(v8, "_hierarchicalColorForLayerLevel:effect:shouldResolveDynamicColors:", 0, self, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIView tintColor](self, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[UIView traitCollection](self, "traitCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resolvedColorWithTraitCollection:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v13;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_overrideTintColorAutomaticallyOverridesTintColor
{
  return 0;
}

- (BOOL)_needsImageEffectsForImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIImageView _symbolConfigurationForImage:](self, "_symbolConfigurationForImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UIImageView _needsImageEffectsForImage:symbolConfiguration:](self, "_needsImageEffectsForImage:symbolConfiguration:", v4, v5);

  return (char)self;
}

- (BOOL)_needsImageEffectsForImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[UIImageView drawMode](self, "drawMode"))
  {
    v8 = 1;
  }
  else
  {
    -[UIImageView _baseMultiplyColorWithImage:symbolConfiguration:](self, "_baseMultiplyColorWithImage:symbolConfiguration:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = 1;
    }
    else
    {
      -[UIImageView _effectiveContentEffectsWithImage:symbolConfiguration:](self, "_effectiveContentEffectsWithImage:symbolConfiguration:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "count") != 0;

    }
  }

  return v8;
}

- (BOOL)_getDrawModeCompositeOperation:(int *)a3 whiteComponent:(double *)a4 drawingAlpha:(double *)a5 forDrawMode:(unsigned int)a6
{
  void *v9;
  int v10;
  double v11;

  switch(a6)
  {
    case 1u:
      +[UIColor lightGrayColor](UIColor, "lightGrayColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 8;
      v11 = 0.5;
      goto LABEL_7;
    case 3u:
      +[UIColor blackColor](UIColor, "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 5;
      v11 = 0.3;
      goto LABEL_7;
    case 2u:
      +[UIColor blackColor](UIColor, "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 5;
      v11 = 0.466666667;
LABEL_7:
      objc_msgSend(v9, "getWhite:alpha:", a4, 0);

      *a5 = v11;
      *a3 = v10;
      return 1;
  }
  return 0;
}

- (void)_renderDrawModeEffectInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *ContextStack;
  CGContext *v9;
  void *v10;
  CGFloat alpha;
  double v12;
  int v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v9 = 0;
  else
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v13 = 0;
  alpha = 0.0;
  v12 = 0.0;
  if (-[UIImageView _getDrawModeCompositeOperation:whiteComponent:drawingAlpha:](self, "_getDrawModeCompositeOperation:whiteComponent:drawingAlpha:", &v13, &v12, &alpha))
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v12, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "set");

    CGContextSetAlpha(v9, alpha);
    CGContextSetCompositeOperation();
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    CGContextFillRect(v9, v14);
  }
}

- (void)setCGImageRef:(CGImage *)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContents:", a3);

}

- (CGImage)imageRef
{
  void *v2;
  CGImage *v3;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImage *)objc_msgSend(v2, "contents");

  return v3;
}

- (void)setAnimating:(BOOL)a3
{
  if (a3)
    -[UIImageView startAnimating](self, "startAnimating");
  else
    -[UIImageView stopAnimating](self, "stopAnimating");
}

- (void)_setDecompressingImage:(id)a3 forType:(unint64_t)a4
{
  const void *v4;

  if (a4)
    v4 = &unk_1ECD79C71;
  else
    v4 = &_MergedGlobals_71;
  objc_setAssociatedObject(self, v4, a3, (void *)1);
}

- (id)_checkHighlightedImageForAdaptation:(id)a3 hadAdapted:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[UIImageView highlightedImage](self, "highlightedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _currentHighlightedImage](self, "_currentHighlightedImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _adaptiveImageForImage:assignedImage:currentImage:hasAdapted:](self, "_adaptiveImageForImage:assignedImage:currentImage:hasAdapted:", v6, v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_effectiveContentEffectsWithImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v11;

  v6 = a3;
  v7 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_userInterfaceRenderingMode") == 2 && (*((_BYTE *)&self->super._viewFlags + 24) & 0x20) != 0)
  {
    v11 = -[UIImageView _imageSupportsMaterials:symbolConfiguration:](self, "_imageSupportsMaterials:symbolConfiguration:", v6, v7);

    if (!v11)
    {
      v9 = 0;
      goto LABEL_5;
    }
    -[UIImageView _materialForImage:symbolConfiguration:](self, "_materialForImage:symbolConfiguration:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

LABEL_5:
  return v9;
}

- (BOOL)_imageSupportsMaterials:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isSymbolImage")
    && (objc_msgSend(v7, "_suppressesMaterialRendering") & 1) == 0
    && -[UIImageView _effectiveRenderingModeForSource:symbolConfiguration:](self, "_effectiveRenderingModeForSource:symbolConfiguration:", v6, v7) == 2)
  {
    if (objc_msgSend(v7, "_hasSpecifiedPaletteColors"))
    {
      objc_msgSend(v7, "_colors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v8, "count") < 2)
        v9 = 1;
      else
        v9 = objc_msgSend(v6, "_isPaletteColorSymbolImage") ^ 1;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 6)
    LOBYTE(v12) = v9;
  else
    LOBYTE(v12) = 0;
  if (v11 != 6 && v9)
  {
    if (objc_msgSend(v7, "_hasSpecifiedHierarchicalColors"))
      v12 = objc_msgSend(v6, "_isHierarchicalColorSymbolImage") ^ 1;
    else
      LOBYTE(v12) = 1;
  }

  return v12;
}

- (id)_materialForImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _baseMultiplyColorWithImage:symbolConfiguration:shouldResolveDynamicColors:](self, "_baseMultiplyColorWithImage:symbolConfiguration:shouldResolveDynamicColors:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "_isDynamic"))
  {
    objc_msgSend(v9, "_resolvedMaterialWithTraitCollection:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_teardownLayeredImage
{
  void *v3;
  id v4;

  -[UIImageView _updateLayeredImageIsFocusedWithFocusedView:focusAnimationCoordinator:](self, "_updateLayeredImageIsFocusedWithFocusedView:focusAnimationCoordinator:", 0, 0);
  -[UIView _setTracksFocusedAncestors:](self, "_setTracksFocusedAncestors:", 0);
  -[UIImageView _existingOverlayView](self, "_existingOverlayView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverlayView:", 0);

    -[UIView addSubview:](self, "addSubview:", v4);
  }

}

- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "nextFocusedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView _updateLayeredImageIsFocusedWithFocusedView:focusAnimationCoordinator:](self, "_updateLayeredImageIsFocusedWithFocusedView:focusAnimationCoordinator:", v8, v6);

  v9.receiver = self;
  v9.super_class = (Class)UIImageView;
  -[UIView _ancestorWillUpdateFocusInContext:withAnimationCoordinator:](&v9, sel__ancestorWillUpdateFocusInContext_withAnimationCoordinator_, v7, v6);

}

- (void)_setLayeredImageContainer:(id)a3
{
  objc_setAssociatedObject(self, &layeredImageContainerKey, a3, (void *)1);
}

- (double)_layeredImageCornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  return v5;
}

- (id)_existingOverlayView
{
  return objc_getAssociatedObject(self, &overlayViewKey);
}

- (void)_setOverlayContentView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_setAssociatedObject(self, &overlayViewKey, v6, (void *)1);
  -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverlayView:", v6);

  }
  else
  {
    -[UIView addSubview:](self, "addSubview:", v6);
  }

}

- (UIView)overlayContentView
{
  _UIImageViewOverlayView *v3;
  _UIImageViewOverlayView *v4;

  -[UIImageView _existingOverlayView](self, "_existingOverlayView");
  v3 = (_UIImageViewOverlayView *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [_UIImageViewOverlayView alloc];
    -[UIView bounds](self, "bounds");
    v3 = -[UIView initWithFrame:](v4, "initWithFrame:");
    -[_UIImageViewOverlayView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[UIImageView _setOverlayContentView:](self, "_setOverlayContentView:", v3);
  }
  return (UIView *)v3;
}

- (void)_setLayeredImageCornerRadius:(double)a3
{
  void *v4;
  id v5;

  -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)_updateLayeredImageIsFocusedWithFocusedView:(id)a3 focusAnimationCoordinator:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (a3)
    a3 = (id)-[UIView isDescendantOfView:](self, "isDescendantOfView:", a3);
  -[UIImageView _layeredImageContainer](self, "_layeredImageContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStackFocused:withFocusAnimationCoordinator:", a3, v7);

}

- (void)_setRBSymbolLayer:(id)a3
{
  objc_setAssociatedObject(self, &renderBoxSymbolLayerKey, a3, (void *)1);
}

- (void)_updateStateIfRBSymbolLayerNoLongerNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIImageView image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIImageView _hasReasonToUseRBSymbolLayerForImage:](self, "_hasReasonToUseRBSymbolLayerForImage:", v5);

    if (!v6)
      -[UIImageView _setNeedsUpdateState](self, "_setNeedsUpdateState");
  }
}

- (void)_updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass
{
  _UIImageViewSymbolAnimationPresetManager *animationPresetManager;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  CGRect v12;

  if (-[_UIImageViewSymbolAnimationPresetManager hasPendingContentTransition](self->_animationPresetManager, "hasPendingContentTransition"))
  {
    -[UIImageView _effectiveSymbolContentTransitionContainerView](self, "_effectiveSymbolContentTransitionContainerView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    animationPresetManager = self->_animationPresetManager;
    -[UIImageView image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageViewSymbolAnimationPresetManager pendingSymbolContentTransitionForSettingSymbolImage:](animationPresetManager, "pendingSymbolContentTransitionForSettingSymbolImage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v5 && objc_msgSend(v5, "isPendingLayoutPass"))
    {
      objc_msgSend(v5, "initialSymbolAbsoluteRect");
      if (!CGRectIsNull(v12))
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        objc_msgSend(v5, "initialSymbolAbsoluteRect");
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v11);
        v7 = v6;
        v9 = v8;
        -[UIImageView _rbSymbolLayer](self, "_rbSymbolLayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPosition:", v7, v9);

        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
      }
    }

  }
}

- (void)_setSymbolContentTransitionContainerView:(id)a3
{
  id v4;

  +[_UIWeakReference weakReferenceWrappingObject:](_UIWeakReference, "weakReferenceWrappingObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &_UIImageViewSymbolContentTransitionContainerViewKey, v4, (void *)1);

}

- (UIView)_symbolContentTransitionContainerView
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(self, &_UIImageViewSymbolContentTransitionContainerViewKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)_effectiveSymbolContentTransitionContainerView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIImageView _symbolContentTransitionContainerView](self, "_symbolContentTransitionContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIView superview](self, "superview");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_applyImageEffectsToCIImage:(id)a3 multiplyColor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  NSObject *v28;
  unint64_t v29;
  NSObject *v30;
  double v31;
  double v32;
  int v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  int v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD80]), "initWithColor:", v7);
    v9 = (void *)v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E0C9DDB8];
      v44 = *MEMORY[0x1E0C9E1C0];
      v45[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filterWithName:withInputParameters:", CFSTR("CIConstantColorGenerator"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "outputImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = *MEMORY[0x1E0C9E190];
      v43 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageByApplyingFilter:withInputParameters:", CFSTR("CISourceInCompositing"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v15;
    }

  }
  v33 = 0;
  v31 = 0.0;
  v32 = 0.0;
  if (-[UIImageView _getDrawModeCompositeOperation:whiteComponent:drawingAlpha:](self, "_getDrawModeCompositeOperation:whiteComponent:drawingAlpha:", &v33, &v32, &v31))
  {
    v16 = objc_alloc(MEMORY[0x1E0C9DD80]);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v32, v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithColor:", v17);

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0C9DDB8];
      v40 = *MEMORY[0x1E0C9E1C0];
      v41 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filterWithName:withInputParameters:", CFSTR("CIConstantColorGenerator"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "outputImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 == 8)
      {
        v38 = *MEMORY[0x1E0C9E190];
        v39 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("CISourceOutCompositing");
        v25 = v6;
      }
      else
      {
        if (os_variant_has_internal_diagnostics())
        {
          if (v33 != 5)
          {
            __UIFaultDebugAssertLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              v37 = v33;
              _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "Unexpected CG blend mode: %d", buf, 8u);
            }

          }
        }
        else if (v33 != 5)
        {
          v29 = _applyImageEffectsToCIImage_multiplyColor____s_category;
          if (!_applyImageEffectsToCIImage_multiplyColor____s_category)
          {
            v29 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v29, (unint64_t *)&_applyImageEffectsToCIImage_multiplyColor____s_category);
          }
          v30 = *(NSObject **)(v29 + 8);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v37 = v33;
            _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "Unexpected CG blend mode: %d", buf, 8u);
          }
        }
        v34 = *MEMORY[0x1E0C9E190];
        v35 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("CISourceAtopCompositing");
        v25 = v22;
      }
      objc_msgSend(v25, "imageByApplyingFilter:withInputParameters:", v24, v23);
      v26 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v26;
    }

  }
  return v6;
}

- (BOOL)_setImageViewContentsForCIImageBackedImage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD aBlock[5];
  id v28;

  v4 = a3;
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canRenderCIImage");
  if (!v6)
    goto LABEL_25;
  objc_opt_self();
  v7 = dyld_program_sdk_at_least()
    && objc_msgSend(v5, "isHDR")
    && (unint64_t)(-[UIImageView imageDynamicRange](self, "imageDynamicRange") - 1) < 2;
  -[_UIImageViewStorage CIRenderer](self->_storage, "CIRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    -[_UIImageViewStorage setCIRenderer:](self->_storage, "setCIRenderer:", v8);
    if (v7)
      goto LABEL_8;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  if (!v7)
    goto LABEL_10;
LABEL_8:
  v9 = objc_msgSend(v5, "isHDR");
LABEL_11:
  if (-[UIImageView _needsImageEffectsForImage:](self, "_needsImageEffectsForImage:", v4))
  {
    -[UIImageView _baseMultiplyColorWithImage:symbolConfiguration:](self, "_baseMultiplyColorWithImage:symbolConfiguration:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UIImageView__setImageViewContentsForCIImageBackedImage___block_invoke;
    aBlock[3] = &unk_1E16EAFC0;
    aBlock[4] = self;
    v28 = v10;
    v11 = v10;
    v12 = _Block_copy(aBlock);

  }
  else
  {
    v12 = 0;
  }
  -[_UIImageCIImageRenderer renderContent:usingHDR:withEffects:]((uint64_t)v8, v5, v9, v12);
  v13 = objc_retainAutorelease(v8);
  v14 = v13;
  if (v13 && (*((_BYTE *)v13 + 32) & 1) != 0)
    v15 = (void *)*((_QWORD *)v13 + 1);
  else
    v15 = 0;
  -[UIView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v17)
    objc_msgSend(v16, "reloadValueForKeyPath:", CFSTR("contents"));
  else
    objc_msgSend(v16, "setContents:", v15);
  -[UIView bounds](self, "bounds");
  -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v4, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "contentsTransform");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
  }
  v23[0] = v24;
  v23[1] = v25;
  v23[2] = v26;
  objc_msgSend(v16, "setContentsTransform:", v23);

LABEL_25:
  return v6;
}

uint64_t __58__UIImageView__setImageViewContentsForCIImageBackedImage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyImageEffectsToCIImage:multiplyColor:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_setPlaceholderView:(id)a3
{
  id v4;
  UIImageView *v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  -[_UIImageViewStorage placeholderView](self->_storage, "placeholderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
  {
    objc_msgSend(v4, "superview");
    v5 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
      objc_msgSend(v4, "removeFromSuperview");
    -[_UIImageViewStorage setPlaceholderView:](self->_storage, "setPlaceholderView:", v6);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__UIImageView__setPlaceholderView___block_invoke;
    v7[3] = &unk_1E16B1B28;
    v7[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
    -[UIView addSubview:](self, "addSubview:", v6);
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

uint64_t __35__UIImageView__setPlaceholderView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibilityAndFrameOfPlaceholderView");
}

- (_UIImageLoader)_imageLoader
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
}

- (void)_loadImageWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIImageLoader _imageLoaderWithURLRequest:session:](_UIImageLoader, "_imageLoaderWithURLRequest:session:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIImageView _loadImage:delegate:](self, "_loadImage:delegate:", v7, 0);
}

- (void)_loadImage:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  UIImageView *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UIImageViewStorage setStoppingLoad:](self->_storage, "setStoppingLoad:", 1);
    -[_UIImageViewStorage loadingDelegate](self->_storage, "loadingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v9, "_imageView:shouldCancelPreviousImageLoader:", self, v8))
    {
      objc_msgSend(v8, "_cancel");
    }

  }
  -[UIImageView _mainQ_resetForLoader:delegate:](self, "_mainQ_resetForLoader:delegate:", v6, v7);
  _UIImageLoadingLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 134218240;
    v12 = self;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_INFO, "Image view %p will load from loader=%p", (uint8_t *)&v11, 0x16u);
  }

  -[UIImageView _mainQ_beginLoadingIfApplicable](self, "_mainQ_beginLoadingIfApplicable");
}

void __46__UIImageView__mainQ_beginLoadingIfApplicable__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "_kickoffQ_beginLoadingWithImageLoader:", v2);

}

- (void)_kickoffQ_beginLoadingWithImageLoader:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__UIImageView__kickoffQ_beginLoadingWithImageLoader___block_invoke;
    v8[3] = &unk_1E16B1500;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v9, "_loadImageWithCompletionQueue:handler:", v6, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __53__UIImageView__kickoffQ_beginLoadingWithImageLoader___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_mainQ_imageLoader:finishedWithImage:error:", v2, v3, v4);

}

- (void)_mainQ_imageLoader:(id)a3 finishedWithImage:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _BYTE *v17;
  id *v18;
  id *v19;
  id *v20;
  id *v21;
  _BYTE *v22;
  NSObject *v23;
  _QWORD *v24;
  NSObject *v25;
  void *v26;
  _BYTE *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _BYTE *v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  _BYTE *v37;
  id v38;
  id v39;
  id from;
  _BYTE location[12];
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v8)
  {
    -[_UIImageViewStorage loadingDelegate](self->_storage, "loadingDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v29, "_imageView:didLoadImage:", self, v9);
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v12;
      }
      os_variant_has_internal_diagnostics();
      +[UITraitCollection _currentTraitCollectionIfExists]();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v13);

      v14 = (void *)_UISetCurrentFallbackEnvironment(self);
      -[UIView bounds](self, "bounds");
      -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v9, v15, v16);
      v17 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      _UIRestorePreviousFallbackEnvironment(v14);
      +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v28);
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v8);
      if (v17 && (v17[8] & 1) != 0)
      {
        decodeQueue();
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke;
        block[3] = &unk_1E16EAFE8;
        v18 = &v38;
        objc_copyWeak(&v38, (id *)location);
        v19 = &v39;
        objc_copyWeak(&v39, &from);
        v20 = &v36;
        v21 = (id *)&v37;
        v36 = v9;
        v37 = v17;
        v27 = v17;
        v24 = block;
      }
      else
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke_2;
        v30[3] = &unk_1E16EAFE8;
        v18 = &v33;
        objc_copyWeak(&v33, (id *)location);
        v19 = &v34;
        objc_copyWeak(&v34, &from);
        v20 = &v31;
        v21 = (id *)&v32;
        v31 = v9;
        v32 = v17;
        v22 = v17;
        v23 = MEMORY[0x1E0C80D38];
        v24 = v30;
      }
      dispatch_async(v23, v24);

      objc_destroyWeak(v19);
      objc_destroyWeak(v18);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);

    }
    else
    {
      if (-[_UIImageViewStorage isStoppingLoad](self->_storage, "isStoppingLoad"))
      {
        _UIImageLoadingLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "domain");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 134218754;
          *(_QWORD *)&location[4] = self;
          v42 = 2048;
          v43 = v8;
          v44 = 2114;
          v45 = v26;
          v46 = 2048;
          v47 = objc_msgSend(v10, "code");
          _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_INFO, "Image view %p stopped loading with error: loader=%p domain=%{public}@ code=%ld", location, 0x2Au);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v29, "_imageView:stoppedLoadingWithError:", self, v10);
        -[UIImageView _mainQ_resetForLoader:delegate:](self, "_mainQ_resetForLoader:delegate:", 0, 0);
      }
      v9 = 0;
    }

  }
}

void __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "_decodeQ_imageLoader:decodeImage:layout:", v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "_mainQ_imageLoader:finishedOrSkippedDecodingImage:layout:", v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_decodeQ_imageLoader:(id)a3 decodeImage:(id)a4 layout:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _BYTE *v13;
  _BYTE *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _BYTE *v19;
  uint8_t buf[4];
  _BYTE *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  decodeQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v8)
  {
    v13 = objc_retainAutorelease(v10);
    v14 = v13;
    if (!v13
      || (-[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v13), (v14[8] & 1) == 0)
      || !*((_QWORD *)v14 + 4))
    {
      _UIImageLoadingLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v21 = v14;
        v22 = 2048;
        v23 = v8;
        _os_log_error_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Could not generate CGImage contents from layout %p (loader=%p)", buf, 0x16u);
      }

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__UIImageView__decodeQ_imageLoader_decodeImage_layout___block_invoke;
    v16[3] = &unk_1E16B51E8;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    v19 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v16);

  }
}

uint64_t __55__UIImageView__decodeQ_imageLoader_decodeImage_layout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQ_imageLoader:finishedOrSkippedDecodingImage:layout:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_mainQ_imageLoader:(id)a3 finishedOrSkippedDecodingImage:(id)a4 layout:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[_UIImageViewStorage setImageBeingSetByLoader:](self->_storage, "setImageBeingSetByLoader:", v9);
    -[UIImageView setImage:](self, "setImage:", v9);
    -[_UIImageViewStorage setImageBeingSetByLoader:](self->_storage, "setImageBeingSetByLoader:", 0);
    -[UIImageView _mainQ_resetForLoader:delegate:](self, "_mainQ_resetForLoader:delegate:", 0, 0);
  }

}

- (void)_stopLoading
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  UIImageView *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIImageViewStorage setStoppingLoad:](self->_storage, "setStoppingLoad:", 1);
    if (!-[_UIImageViewStorage isStartingLoad](self->_storage, "isStartingLoad")
      || -[_UIImageViewStorage isEnqueueingLoad](self->_storage, "isEnqueueingLoad"))
    {
      _UIImageLoadingLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = 134218240;
        v7 = self;
        v8 = 2048;
        v9 = v3;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_INFO, "Image view %p stopping loader=%p", (uint8_t *)&v6, 0x16u);
      }

      -[_UIImageViewStorage loadingDelegate](self->_storage, "loadingDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "_imageView:stoppedLoadingWithError:", self, 0);
      -[UIImageView _mainQ_resetForLoader:delegate:](self, "_mainQ_resetForLoader:delegate:", 0, 0);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v5, "_imageView:shouldCancelPreviousImageLoader:", self, v3))
      {
        objc_msgSend(v3, "_cancel");
      }

    }
  }

}

- (void)_mainQ_resetForLoader:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_UIImageViewStorage setImageLoader:](self->_storage, "setImageLoader:", v7);

  -[_UIImageViewStorage setLoadingDelegate:](self->_storage, "setLoadingDelegate:", v6);
  -[_UIImageViewStorage setStartingLoad:](self->_storage, "setStartingLoad:", 0);
  -[_UIImageViewStorage setEnqueueingLoad:](self->_storage, "setEnqueueingLoad:", 0);
  -[_UIImageViewStorage setStoppingLoad:](self->_storage, "setStoppingLoad:", 0);
}

- (int64_t)_preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (void)_setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (BOOL)adjustsImageWhenAncestorFocused
{
  return self->_adjustsImageWhenAncestorFocused;
}

- (void)setAdjustsImageWhenAncestorFocused:(BOOL)adjustsImageWhenAncestorFocused
{
  self->_adjustsImageWhenAncestorFocused = adjustsImageWhenAncestorFocused;
}

- (UILayoutGuide)focusedFrameGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 504, 1);
}

- (BOOL)masksFocusEffectToContents
{
  return self->_masksFocusEffectToContents;
}

- (void)setMasksFocusEffectToContents:(BOOL)masksFocusEffectToContents
{
  self->_masksFocusEffectToContents = masksFocusEffectToContents;
}

- (BOOL)useBlockyMagnificationInClassic
{
  return 0;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIImageView;
  v4 = a3;
  -[UIResponder encodeRestorableStateWithCoder:](&v7, sel_encodeRestorableStateWithCoder_, v4);
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorPoint");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("kViewAnchorKey"));

  -[UIView bounds](self, "bounds");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("kViewBoundsKey"));
  -[UIView center](self, "center");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("kViewCenterKey"));
  -[UIView transform](self, "transform");
  objc_msgSend(v4, "encodeCGAffineTransform:forKey:", &v6, CFSTR("kViewTransformKey"));

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIImageView;
  -[UIResponder decodeRestorableStateWithCoder:](&v14, sel_decodeRestorableStateWithCoder_, v4);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kViewAnchorKey")))
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("kViewAnchorKey"));
    v6 = v5;
    v8 = v7;
    -[UIView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAnchorPoint:", v6, v8);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kViewBoundsKey")))
  {
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("kViewBoundsKey"));
    -[UIImageView setBounds:](self, "setBounds:");
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kViewCenterKey")))
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("kViewCenterKey"));
    -[UIImageView setCenter:](self, "setCenter:");
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kViewTransformKey")))
  {
    if (v4)
    {
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("kViewTransformKey"));
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v11 = 0u;
    }
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    -[UIView setTransform:](self, "setTransform:", v10);
  }

}

- (double)_scaleFactorForImage
{
  void *v2;
  double v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(v2);

  return v3;
}

@end
