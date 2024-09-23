@implementation SBStripContinuousExposeSwitcherModifier

- (SBStripContinuousExposeSwitcherModifier)init
{
  SBStripContinuousExposeSwitcherModifier *v2;
  NSMutableSet *v3;
  NSMutableSet *highlightedByTouchAppLayouts;
  NSMutableSet *v5;
  NSMutableSet *highlightedByHoverAppLayouts;
  SBSwitcherLayoutCalculationsCache *v7;
  SBSwitcherLayoutCalculationsCache *stripLayoutCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    highlightedByTouchAppLayouts = v2->_highlightedByTouchAppLayouts;
    v2->_highlightedByTouchAppLayouts = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    highlightedByHoverAppLayouts = v2->_highlightedByHoverAppLayouts;
    v2->_highlightedByHoverAppLayouts = v5;

    v7 = objc_alloc_init(SBSwitcherLayoutCalculationsCache);
    stripLayoutCache = v2->_stripLayoutCache;
    v2->_stripLayoutCache = v7;

    -[SBSwitcherLayoutCalculationsCache setDelegate:](v2->_stripLayoutCache, "setDelegate:", v2);
  }
  return v2;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  -[SBStripContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](&v14, sel_appLayoutsForContinuousExposeIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStripContinuousExposeSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "continuousExposeIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = BSEqualStrings(),
        v8,
        v9))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__SBStripContinuousExposeSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v13[3] = &unk_1E8E9DF78;
    v13[4] = self;
    objc_msgSend(v5, "bs_filter:", v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

uint64_t __83__SBStripContinuousExposeSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isAppLayoutEffectivelyOnStage:", a2) ^ 1;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  v24.receiver = self;
  v24.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  -[SBStripContinuousExposeSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier _currentLayoutCalculationsValidityToken](self, "_currentLayoutCalculationsValidityToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStripContinuousExposeSwitcherModifier _cachedOrFallbackFrameForIndex:cacheValidityToken:](self, "_cachedOrFallbackFrameForIndex:cacheValidityToken:", a3, v12);
  v14 = v13;
  v16 = v15;

  -[SBStripContinuousExposeSwitcherModifier continuousExposeIdentifiersInStrip](self, "continuousExposeIdentifiersInStrip");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "continuousExposeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "containsObject:", v18))
  {
    -[SBStripContinuousExposeSwitcherModifier _appStripOriginX](self, "_appStripOriginX");
    v14 = v19;
  }

  v20 = v14 - v6 * 0.5;
  v21 = v16 - v8 * 0.5;
  v22 = v6;
  v23 = v8;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  CGPoint result;

  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "continuousExposeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStripContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chamoisSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfVisibleItemsPerGroup");

  v13 = objc_msgSend(v9, "count");
  if (v13 < v12)
    v12 = v13;
  v14 = 0.0;
  if (v12 >= 2)
  {
    -[SBStripContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stripCardScale");
    v17 = v16;
    objc_msgSend(v15, "stripStackDistance");
    v19 = v18;
    -[SBStripContinuousExposeSwitcherModifier _currentLayoutCalculationsValidityToken](self, "_currentLayoutCalculationsValidityToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBStripContinuousExposeSwitcherModifier _cachedOrFallbackFrameForIndex:cacheValidityToken:](self, "_cachedOrFallbackFrameForIndex:cacheValidityToken:", a3, v20);
    v22 = v21;
    -[SBStripContinuousExposeSwitcherModifier _cachedOrFallbackScaleForIndex:cacheValidityToken:](self, "_cachedOrFallbackScaleForIndex:cacheValidityToken:", a3, v20);
    v24 = v23;
    v25 = objc_msgSend(v9, "indexOfObject:", v7);
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      v26 = 0;
    else
      v26 = v25;
    v14 = v17 / v24 * (v19 / v22) * (double)v26 - ((double)v12 + -1.0) * (v17 / v24 * (v19 / v22));

  }
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v14 = 1.0 - v14;

  v27 = 0.5;
  v28 = v14;
  result.y = v27;
  result.x = v28;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  unint64_t v29;
  double Height;
  double v31;
  double v32;
  CGRect rect;
  CGRect v35;
  CGRect v36;

  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier _currentLayoutCalculationsValidityToken](self, "_currentLayoutCalculationsValidityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStripContinuousExposeSwitcherModifier _cachedOrFallbackScaleForIndex:cacheValidityToken:](self, "_cachedOrFallbackScaleForIndex:cacheValidityToken:", a3, v8);
  v10 = v9;
  objc_msgSend(v7, "continuousExposeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStripContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    *(_QWORD *)&rect.origin.y = self;
    *(_QWORD *)&rect.size.width = SBStripContinuousExposeSwitcherModifier;
    -[CGFloat frameForIndex:]((objc_super *)&rect.origin.y, sel_frameForIndex_, a3);
    rect.origin.x = v13;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[SBStripContinuousExposeSwitcherModifier _cachedOrFallbackFrameForIndex:cacheValidityToken:](self, "_cachedOrFallbackFrameForIndex:cacheValidityToken:", a3, v8);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = objc_msgSend(v12, "indexOfObject:", v7);
    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      v29 = 0;
    else
      v29 = v28;
    v35.origin.x = v21;
    v35.origin.y = v23;
    v35.size.width = v25;
    v35.size.height = v27;
    Height = CGRectGetHeight(v35);
    v36.origin.x = rect.origin.x;
    v36.origin.y = v15;
    v36.size.width = v17;
    v36.size.height = v19;
    v10 = (double)v29 * -0.01 + v10 * (Height / CGRectGetHeight(v36));
  }
  -[SBStripContinuousExposeSwitcherModifier _highlightScaleForAppLayout:](self, "_highlightScaleForAppLayout:", v7);
  v32 = v10 * v31;

  return v32;
}

- (double)_highlightScaleForAppLayout:(id)a3
{
  id v4;
  double v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;

  v4 = a3;
  v5 = 1.0;
  if (!-[SBStripContinuousExposeSwitcherModifier _indexInContinuousExposeIdentifierPileForAppLayout:](self, "_indexInContinuousExposeIdentifierPileForAppLayout:", v4))
  {
    v6 = -[SBStripContinuousExposeSwitcherModifier _isGroupForAppLayoutHighlightedFromHover:](self, "_isGroupForAppLayoutHighlightedFromHover:", v4);
    v7 = -[SBStripContinuousExposeSwitcherModifier _isGroupForAppLayoutHighlightedFromTouch:](self, "_isGroupForAppLayoutHighlightedFromTouch:", v4);
    if (v6 && v7)
    {
      v5 = 0.98;
    }
    else
    {
      v8 = 1.1;
      if (!v6)
        v8 = 1.0;
      if (v7)
        v5 = 0.9;
      else
        v5 = v8;
    }
  }

  return v5;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  CGFloat y;
  uint64_t v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  v5 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection", a4, a3.x);
  v6 = 0.0;
  if (v5 == 1)
    v6 = 1.0;
  v7 = y;
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)adjustedSpaceAccessoryViewScale:(double)a3 forAppLayout:(id)a4
{
  double v5;

  -[SBStripContinuousExposeSwitcherModifier _highlightScaleForAppLayout:](self, "_highlightScaleForAppLayout:", a4);
  return a3 / v5;
}

- (id)visibleAppLayouts
{
  void *v2;
  void *v3;

  -[SBStripContinuousExposeSwitcherModifier _orderedVisibleAppLayoutsIgnoringProgress:](self, "_orderedVisibleAppLayoutsIgnoringProgress:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_orderedVisibleAppLayoutsIgnoringProgress:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  SBStripContinuousExposeSwitcherModifier *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[SBStripContinuousExposeSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
  if ((BSFloatGreaterThanFloat() & 1) != 0
    || (!self->_requireStripContentsInViewHierarchy ? (v6 = !v3) : (v6 = 0), !v6))
  {
    -[SBStripContinuousExposeSwitcherModifier continuousExposeIdentifiersInStrip](self, "continuousExposeIdentifiersInStrip");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v23, "count");
    -[SBStripContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chamoisSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfVisibleItemsPerGroup");

    v11 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v22 = v7;
    if (v7)
    {
      v12 = 0;
      v21 = self;
      do
      {
        objc_msgSend(v23, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[SBStripContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v11, "addObject:", v13);
              if (objc_msgSend(v11, "countForObject:", v13) <= v10)
                objc_msgSend(v5, "addObject:", v19);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v16);
        }

        ++v12;
        self = v21;
      }
      while (v12 != v22);
    }

  }
  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  double result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  v8 = a4;
  -[SBStripContinuousExposeSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v16, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  v10 = v9;
  v11 = -[SBStripContinuousExposeSwitcherModifier _indexInContinuousExposeIdentifierPileForAppLayout:](self, "_indexInContinuousExposeIdentifierPileForAppLayout:", v8, v16.receiver, v16.super_class);

  -[SBStripContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "chamoisSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfVisibleItemsPerGroup");

  result = 0.0;
  if (v11 <= v14)
    return v10;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  UIRectCornerRadii result;

  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBStripContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    v20.receiver = self;
    v20.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
    -[SBStripContinuousExposeSwitcherModifier cornerRadiiForIndex:](&v20, sel_cornerRadiiForIndex_, a3);
  }
  else
  {
    -[SBStripContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stripCornerRadii");

    -[SBStripContinuousExposeSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
  }
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = v10;

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  char IsZero;
  double v33;
  int v34;
  double v35;
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
  uint64_t v47;
  double v48;
  double v49;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v52;
  CATransform3D v53;
  CATransform3D v54;
  SBSwitcherWallpaperGradientAttributes result;
  CGRect v56;
  CGRect v57;

  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier _wallpaperDimmingForIndex:](self, "_wallpaperDimmingForIndex:", a3);
  v8 = v7;
  v9 = 0.0;
  v10 = 0.0;
  if ((BSFloatLessThanOrEqualToFloat() & 1) == 0)
  {
    -[SBStripContinuousExposeSwitcherModifier perspectiveAngleForAppLayout:](self, "perspectiveAngleForAppLayout:", v6);
    v12 = v11;
    v9 = v8;
    v10 = v8;
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      -[SBStripContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "screenEdgePadding");
      v49 = v14;
      objc_msgSend(v13, "stripWidth");
      v48 = v15;
      objc_msgSend(v13, "containerPerspective");
      v47 = v16;
      -[SBStripContinuousExposeSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
      v18 = v17;
      v20 = v19;
      -[SBStripContinuousExposeSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
      v22 = v21;
      -[SBStripContinuousExposeSwitcherModifier anchorPointForIndex:](self, "anchorPointForIndex:", a3);
      v45 = v24;
      v46 = v23;
      UIRectGetCenter();
      v26 = v25;
      v28 = v27;
      memset(&v54, 0, sizeof(v54));
      CATransform3DMakeScale(&v54, v22, v22, 1.0);
      memset(&v53, 0, sizeof(v53));
      CATransform3DMakeRotation(&v53, v12, 0.0, 1.0, 0.0);
      memset(&v52, 0, sizeof(v52));
      a = v54;
      b = v53;
      CATransform3DConcat(&v52, &a, &b);
      a = v52;
      -[SBStripContinuousExposeSwitcherModifier _positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:](self, "_positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:", &a, v18 * -0.5, 0.0, v26, v28, v18, v20, v46, v45, v47);
      v44 = v29;
      a = v52;
      -[SBStripContinuousExposeSwitcherModifier _positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:](self, "_positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:", &a, v18 * 0.5, 0.0, v26, v28, v18, v20, v46, v45, v47);
      v31 = v30;
      objc_msgSend(v13, "minimumDefaultWindowSize");
      IsZero = BSFloatIsZero();
      v33 = 0.25;
      if ((IsZero & 1) == 0)
      {
        v34 = -[SBStripContinuousExposeSwitcherModifier prefersStripHidden](self, "prefersStripHidden", 0.25);
        v33 = 0.6;
        if (v34)
          v33 = 0.25;
      }
      v35 = v8 + v33;
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      {
        -[SBStripContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v36 = v35 - v8;
        v37 = v48 - v49;
        v38 = (v35 - v8) * (CGRectGetMaxX(v56) - v44 - v49) / (v48 - v49);
        -[SBStripContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v39 = CGRectGetMaxX(v57) - v31 - v49;
      }
      else
      {
        v39 = v35 - v8;
        v37 = v48 - v49;
        v38 = (v44 - v49) * (v35 - v8) / (v48 - v49);
        v36 = v31 - v49;
      }
      v40 = v8 + v38;
      v41 = v8 + v36 * v39 / v37;
      if (v8 + v38 >= v35)
        v40 = v35;
      if (v40 >= v8)
        v10 = v40;
      else
        v10 = v8;
      if (v41 >= v35)
        v41 = v35;
      if (v41 >= v8)
        v9 = v41;
      else
        v9 = v8;

    }
  }
  SBSwitcherWallpaperGradientAttributesMakeEmpty();

  v42 = v9;
  v43 = v10;
  result.trailingAlpha = v43;
  result.leadingAlpha = v42;
  return result;
}

- (double)_wallpaperDimmingForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  unint64_t v8;
  double v9;
  double v10;

  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBStripContinuousExposeSwitcherModifier _isGroupForAppLayoutHighlightedFromHover:](self, "_isGroupForAppLayoutHighlightedFromHover:", v6);
  v8 = -[SBStripContinuousExposeSwitcherModifier _indexInContinuousExposeIdentifierPileForAppLayout:](self, "_indexInContinuousExposeIdentifierPileForAppLayout:", v6);
  v9 = (double)v8 * 0.25 + 0.1 + 0.1;
  if (!v8)
    v9 = 0.0;
  if (v7)
    v10 = v9;
  else
    v10 = (double)v8 * 0.25 + 0.1;

  return v10;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;

  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBStripContinuousExposeSwitcherModifier _indexInContinuousExposeIdentifierPileForAppLayout:](self, "_indexInContinuousExposeIdentifierPileForAppLayout:", v6))
  {
    v7 = 0.0;
  }
  else
  {
    v7 = 1.0;
  }

  return v7;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection", a3);
  -[SBStripContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stripTiltAngle");
  if (v4 == 1)
    v7 = -v6;
  else
    v7 = v6;

  return v7;
}

- (id)topMostLayoutElements
{
  void *v2;
  void *v3;

  -[SBStripContinuousExposeSwitcherModifier _orderedVisibleAppLayoutsIgnoringProgress:](self, "_orderedVisibleAppLayoutsIgnoringProgress:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  void *v2;
  void *v3;

  -[SBStripContinuousExposeSwitcherModifier _orderedVisibleAppLayoutsIgnoringProgress:](self, "_orderedVisibleAppLayoutsIgnoringProgress:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)handleEvent:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  -[SBStripContinuousExposeSwitcherModifier _invalidateAppStripOriginX](self, "_invalidateAppStripOriginX");
  ++self->_modifierEventGenCount;
  v5 = -[SBStripContinuousExposeSwitcherModifier requireStripContentsInViewHierarchy](self, "requireStripContentsInViewHierarchy");
  v6 = -[SBStripContinuousExposeSwitcherModifier isContinuousExposeConfigurationChangeTransition](self, "isContinuousExposeConfigurationChangeTransition") | v5;
  if (self->_requireStripContentsInViewHierarchy == v6)
  {
    v7 = 0;
  }
  else
  {
    self->_requireStripContentsInViewHierarchy = v6;
    v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 0);
    SBAppendSwitcherModifierResponse(v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12.receiver = self;
  v12.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v12, sel_handleEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)handleHighlightEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  SBUpdateLayoutSwitcherEventResponse *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleHighlightEvent:](&v35, sel_handleHighlightEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHandled") & 1) == 0 && v6 && (objc_msgSend(v4, "isPencilHoverEvent") & 1) == 0)
  {
    v7 = objc_msgSend(v4, "phase") - 1;
    v8 = -[SBStripContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6);
    v9 = objc_msgSend(v4, "isHoverEvent");
    if (!v8 && v7 > 1)
    {
      if (v9)
        v10 = 152;
      else
        v10 = 144;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v10), "addObject:", v6);
      goto LABEL_37;
    }
    if (v7 < 2)
      v11 = v9;
    else
      v11 = 0;
    if (v11 == 1)
    {
      v12 = 152;
      if (!-[NSMutableSet containsObject:](self->_highlightedByHoverAppLayouts, "containsObject:", v6))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v13 = (void *)-[NSMutableSet copy](self->_highlightedByHoverAppLayouts, "copy");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (objc_msgSend(v18, "containsAnyItemFromAppLayout:", v6))
                -[NSMutableSet removeObject:](self->_highlightedByHoverAppLayouts, "removeObject:", v18);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v15);
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      v12 = 144;
      if (!-[NSMutableSet containsObject:](self->_highlightedByTouchAppLayouts, "containsObject:", v6))
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = (void *)-[NSMutableSet copy](self->_highlightedByTouchAppLayouts, "copy", 0);
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(v13);
              v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              if (objc_msgSend(v23, "containsAnyItemFromAppLayout:", v6))
                -[NSMutableSet removeObject:](self->_highlightedByTouchAppLayouts, "removeObject:", v23);
            }
            v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v20);
        }
        goto LABEL_36;
      }
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "removeObject:", v6);
LABEL_37:
    v24 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, 0);
    SBAppendSwitcherModifierResponse(v24, v5);
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleWithReason:", CFSTR("Full Screen Continuous Expose"));
    v5 = (void *)v25;
  }

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  -[SBStripContinuousExposeSwitcherModifier animationAttributesForLayoutElement:](&v6, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setUpdateMode:", 3);
  return v4;
}

- (id)_currentLayoutCalculationsValidityToken
{
  SBSwitcherLayoutCalculationsCacheValidityToken *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = [SBSwitcherLayoutCalculationsCacheValidityToken alloc];
  v4 = -[SBStripContinuousExposeSwitcherModifier appLayoutsGenerationCount](self, "appLayoutsGenerationCount");
  v5 = -[SBStripContinuousExposeSwitcherModifier continuousExposeIdentifiersGenerationCount](self, "continuousExposeIdentifiersGenerationCount");
  v6 = -[SBStripContinuousExposeSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBStripContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return -[SBSwitcherLayoutCalculationsCacheValidityToken initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:](v3, "initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:", v4, v5, v6, self->_modifierEventGenCount);
}

- (id)buildLayoutCalculationsForCache:(id)a3
{
  SBStripContinuousExposeSwitcherModifier *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  SBStripContinuousExposeSwitcherModifier *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  SBSwitcherLayoutCalculations *v47;
  double v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[11];
  _BYTE v68[128];
  uint64_t v69;

  v3 = self;
  v69 = *MEMORY[0x1E0C80C00];
  -[SBStripContinuousExposeSwitcherModifier continuousExposeIdentifiersInStrip](self, "continuousExposeIdentifiersInStrip", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v4, "count");
  -[SBStripContinuousExposeSwitcherModifier chamoisLayoutAttributes](v3, "chamoisLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stripWidth");
  v61 = v6;
  objc_msgSend(v5, "stripStackDistance");
  v8 = v7;
  objc_msgSend(v5, "stripCardScale");
  v10 = v9;
  objc_msgSend(v5, "stripInterItemSpacing");
  v12 = v11;
  -[SBStripContinuousExposeSwitcherModifier containerViewBounds](v3, "containerViewBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SBStripContinuousExposeSwitcherModifier switcherSettings](v3, "switcherSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "chamoisSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "numberOfVisibleItemsPerGroup");
  if ((-[SBStripContinuousExposeSwitcherModifier prefersDockHidden](v3, "prefersDockHidden") & 1) == 0)
    -[SBStripContinuousExposeSwitcherModifier floatingDockHeight](v3, "floatingDockHeight", v20);
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __75__SBStripContinuousExposeSwitcherModifier_buildLayoutCalculationsForCache___block_invoke;
  v67[3] = &__block_descriptor_88_e8_d16__0Q8l;
  v67[4] = v14;
  v67[5] = v16;
  v67[6] = v18;
  *(double *)&v67[7] = v20;
  v67[8] = v61;
  v67[9] = v8;
  v67[10] = v23;
  v24 = MEMORY[0x1D17E5550](v67);
  v58 = (void *)v24;
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v60);
  if (v60)
  {
    v56 = v22;
    v57 = v5;
    v25 = 0;
    v26 = 0.0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBStripContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](v3, "appLayoutsForContinuousExposeIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");
      objc_msgSend(v28, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](v3, "autoLayoutSpaceForAppLayout:", v30);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 == 1
        && (objc_msgSend(v30, "allItems"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = v3,
            v33 = objc_msgSend(v31, "count"),
            v31,
            v34 = v33 == 1,
            v3 = v32,
            v34))
      {
        objc_msgSend(v30, "allItems");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "autoLayoutItemForDisplayItem:", v36);
        v37 = v4;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "size");
        v40 = v39;
        v42 = v41;

        v4 = v37;
        v24 = (uint64_t)v58;

        v3 = v32;
      }
      else
      {
        -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](v3, "autoLayoutSpaceForAppLayout:", v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "boundingBox");
        v40 = v43;
        v42 = v44;
      }

      v45 = (*(double (**)(uint64_t, uint64_t))(v24 + 16))(v24, v29);
      v46 = v10;
      if (v40 > v45)
        v46 = v10 * (v45 / v40);
      v47 = objc_alloc_init(SBSwitcherLayoutCalculations);
      -[SBSwitcherLayoutCalculations setScale:](v47, "setScale:", v46);
      -[SBSwitcherLayoutCalculations setFrame:](v47, "setFrame:", 0.0, v26 + v42 * v46 * 0.5, v40, v42);
      objc_msgSend(v59, "setObject:forKey:", v47, v27);
      ++v25;
      v48 = -0.0;
      if (v25 < v60)
        v48 = v12;
      v26 = v48 + v26 + v42 * v46;

    }
    while (v60 != v25);
    v22 = v56;
    v5 = v57;
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v49 = v59;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v64 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(v49, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "frame");
        objc_msgSend(v54, "setFrame:");

      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v51);
  }

  return v49;
}

double __75__SBStripContinuousExposeSwitcherModifier_buildLayoutCalculationsForCache___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 48)
       + *(double *)(a1 + 64) * -2.0
       + *(double *)(a1 + 72) * (double)(unint64_t)(*(_QWORD *)(a1 + 80) - a2);
}

- (unint64_t)_indexInContinuousExposeIdentifierPileForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "continuousExposeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStripContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v7;
}

- (double)_appStripOriginX
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBStripContinuousExposeSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
  v4 = v3;
  if (self->_cached_appStripOriginX == 0.0 || (BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cached_appStripUnocclusionProgress = v4;
    -[SBStripContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stripWidth");
    v7 = v6;
    objc_msgSend(v5, "screenEdgePadding");
    v9 = v4 * (v7 + v8) - v7;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      -[SBStripContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v9 = v10 - v9;
    }
    self->_cached_appStripOriginX = v9;

  }
  return self->_cached_appStripOriginX;
}

- (void)_invalidateAppStripOriginX
{
  self->_cached_appStripOriginX = 0.0;
  self->_cached_appStripUnocclusionProgress = -1.0;
}

- (CGRect)_stripFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  CGFloat Height;
  uint64_t v15;
  double Width;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[SBStripContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBStripContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stripWidth");
  v13 = v12;

  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  Height = CGRectGetHeight(v20);
  v15 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  Width = 0.0;
  if (v15 == 1)
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    Width = CGRectGetWidth(v21);
  }
  v17 = 0.0;
  v18 = v13;
  v19 = Height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = Width;
  return result;
}

- (CGPoint)_positionForPositionIn3DContainerSpace:(CGPoint)a3 layerPosition:(CGPoint)a4 layerSize:(CGSize)a5 layerAnchorPoint:(CGPoint)a6 layerTransform:(CATransform3D *)a7 containerPerspective:(double)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  -[SBStripContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v9 = v8;
  v16 = v10;
  CAPointApplyTransform();
  CAPointApplyTransform();
  v14 = v9 * 0.5 + v11 / v12;
  v15 = v16 * 0.5 + v13 / v12;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)_isGroupForAppLayoutHighlightedFromTouch:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBStripContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v4))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(v4, "continuousExposeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_highlightedByTouchAppLayouts;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "continuousExposeIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v6);

          if ((v11 & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (BOOL)_isGroupForAppLayoutHighlightedFromHover:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBStripContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v4))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(v4, "continuousExposeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_highlightedByHoverAppLayouts;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "continuousExposeIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v6);

          if ((v11 & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (BOOL)_isAppLayoutEffectivelyOnStage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[SBStripContinuousExposeSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  if ((objc_msgSend(v5, "containsAllItemsFromAppLayout:", v4) & 1) == 0
    && (objc_msgSend(v4, "containsAllItemsFromAppLayout:", v6) & 1) == 0)
  {
    -[SBStripContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chamoisSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "maximumNumberOfAppsOnStage");

    objc_msgSend(v6, "allItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") != v10)
    {
      v7 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v4, "allItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 == v10)
    {
      objc_msgSend(v4, "allItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __74__SBStripContinuousExposeSwitcherModifier__isAppLayoutEffectivelyOnStage___block_invoke;
      v17[3] = &unk_1E8E9DF50;
      v18 = v6;
      objc_msgSend(v14, "bs_filter:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v15, "count") == v10 - 1;
      v11 = v18;
LABEL_10:

      goto LABEL_11;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

uint64_t __74__SBStripContinuousExposeSwitcherModifier__isAppLayoutEffectivelyOnStage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2);
}

- (CGRect)_cachedOrFallbackFrameForIndex:(unint64_t)a3 cacheValidityToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBSwitcherLayoutCalculationsCache *stripLayoutCache;
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
  _QWORD v24[6];
  CGRect result;

  v6 = a4;
  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "continuousExposeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  stripLayoutCache = self->_stripLayoutCache;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackFrameForIndex_cacheValidityToken___block_invoke;
  v24[3] = &unk_1E8EACB28;
  v24[4] = self;
  v24[5] = a3;
  -[SBSwitcherLayoutCalculationsCache frameForKey:validityToken:fallback:](stripLayoutCache, "frameForKey:validityToken:fallback:", v10, v6, v24);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

double __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackFrameForIndex_cacheValidityToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  double Width;
  double v22;
  double v23;
  CGFloat rect;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v2 = *(_QWORD *)(a1 + 40);
  v26.receiver = *(id *)(a1 + 32);
  v26.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  objc_msgSendSuper2(&v26, sel_frameForIndex_, v2);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "containerViewBounds");
  v12 = v11;
  v14 = v13;
  rect = v15;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "chamoisLayoutAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stripWidth");
  v20 = v19;

  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  Width = CGRectGetWidth(v27);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    v28.origin.x = v12;
    v28.origin.y = v14;
    v28.size.width = rect;
    v28.size.height = v17;
    v22 = v20 + CGRectGetWidth(v28);
  }
  else
  {
    v22 = 0.0 - v20;
  }
  v29.size.width = rect;
  v23 = v22 - Width * 0.5;
  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.height = v17;
  CGRectGetHeight(v29);
  return v23;
}

- (double)_cachedOrFallbackScaleForIndex:(unint64_t)a3 cacheValidityToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBSwitcherLayoutCalculationsCache *stripLayoutCache;
  double v12;
  double v13;
  _QWORD v15[5];

  v6 = a4;
  -[SBStripContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStripContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "continuousExposeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  stripLayoutCache = self->_stripLayoutCache;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackScaleForIndex_cacheValidityToken___block_invoke;
  v15[3] = &unk_1E8EA8460;
  v15[4] = self;
  -[SBSwitcherLayoutCalculationsCache scaleForKey:validityToken:fallback:](stripLayoutCache, "scaleForKey:validityToken:fallback:", v10, v6, v15);
  v13 = v12;

  return v13;
}

double __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackScaleForIndex_cacheValidityToken___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "chamoisLayoutAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stripCardScale");
  v3 = v2;

  return v3;
}

- (NSMutableSet)highlightedByTouchAppLayouts
{
  return self->_highlightedByTouchAppLayouts;
}

- (void)setHighlightedByTouchAppLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedByTouchAppLayouts, a3);
}

- (NSMutableSet)highlightedByHoverAppLayouts
{
  return self->_highlightedByHoverAppLayouts;
}

- (void)setHighlightedByHoverAppLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedByHoverAppLayouts, a3);
}

- (BOOL)isContinuousExposeConfigurationChangeTransition
{
  return self->_continuousExposeConfigurationChangeTransition;
}

- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedByHoverAppLayouts, 0);
  objc_storeStrong((id *)&self->_highlightedByTouchAppLayouts, 0);
  objc_storeStrong((id *)&self->_stripLayoutCache, 0);
}

@end
