@implementation SBGridLayoutSwitcherModifier

- (SBGridLayoutSwitcherModifier)initWithAlignment:(unint64_t)a3 layoutDirection:(unint64_t)a4
{
  SBGridLayoutSwitcherModifier *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBGridLayoutSwitcherModifier;
  result = -[SBSwitcherModifier init](&v7, sel_init);
  if (result)
  {
    result->_alignment = a3;
    result->_layoutDirection = a4;
  }
  return result;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBGridLayoutSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBGridLayoutSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
}

- (double)scale
{
  void *v3;
  double v4;
  double v5;
  double Width;
  char IsZero;
  double result;
  CGRect v9;

  -[SBGridLayoutSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridSwitcherPageScale");
  v5 = v4;

  -[SBGridLayoutSwitcherModifier containerViewBounds](self, "containerViewBounds");
  Width = CGRectGetWidth(v9);
  IsZero = BSFloatIsZero();
  result = 0.0;
  if ((IsZero & 1) == 0)
    return round(v5 * Width) / Width;
  return result;
}

- (_NSRange)visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v15;
  uint64_t v16;
  _NSRange result;

  -[SBGridLayoutSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset", a3.x, a3.y);
  v4 = -[SBGridLayoutSwitcherModifier _firstTrailingIndexForContentOffset:](self, "_firstTrailingIndexForContentOffset:");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_2;
  v7 = v4;
  if ((-[SBGridLayoutSwitcherModifier isRTLEnabled](self, "isRTLEnabled") & 1) == 0)
  {
    if ((v7 & 0x8000000000000000) == 0)
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (-[SBGridLayoutSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v7))
        {
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
            v13 = v7;
          else
            v13 = v11;
          v10 = v7;
        }
        else
        {
          v13 = 0x7FFFFFFFFFFFFFFFLL;
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_24;
        }
        v11 = v13;
      }
      while ((uint64_t)v7-- > 0);
      goto LABEL_24;
    }
LABEL_2:
    v5 = 0;
    v6 = 0;
    goto LABEL_36;
  }
  v8 = -[SBGridLayoutSwitcherModifier _numberOfSpaces](self, "_numberOfSpaces");
  if (v7 >= v8)
    goto LABEL_2;
  v9 = v8;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (-[SBGridLayoutSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v7))
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = v7;
      else
        v12 = v10;
      v11 = v7;
    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        break;
    }
    ++v7;
    v10 = v12;
  }
  while (v9 != v7);
LABEL_24:
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = 0;
  else
    v15 = v10;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v16 = 0;
  else
    v16 = v11 - v10 + 1;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = v15;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v16;
LABEL_36:
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBGridLayoutSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBGridLayoutSwitcherModifier;
  -[SBSwitcherModifier handleSwitcherSettingsChangedEvent:](&v7, sel_handleSwitcherSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double x;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  x = self->_previousContentOffset.x;
  if (x != 1.79769313e308 || self->_previousContentOffset.y != 1.79769313e308)
    self->_isScrollingForward = x > v5;
  self->_previousContentOffset.x = v5;
  self->_previousContentOffset.y = v6;
  v11.receiver = self;
  v11.super_class = (Class)SBGridLayoutSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v11, sel_handleScrollEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "toEnvironmentMode") == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)SBGridLayoutSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBGridLayoutSwitcherModifier _frameForIndex:ignoringScrollOffset:](self, "_frameForIndex:ignoringScrollOffset:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleAppLayouts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[SBGridLayoutSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBGridLayoutSwitcherModifier visibleAppLayoutRangeForContentOffset:](self, "visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  v11.receiver = self;
  v11.super_class = (Class)SBGridLayoutSwitcherModifier;
  -[SBGridLayoutSwitcherModifier visibleAppLayouts](&v11, sel_visibleAppLayouts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGridLayoutSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  void *v3;
  char v4;

  -[SBGridLayoutSwitcherModifier homeGrabberSettings](self, "homeGrabberSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)_isIndexVisible:(unint64_t)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[SBGridLayoutSwitcherModifier _frameWithScaleAppliedForIndex:ignoringScrollOffset:](self, "_frameWithScaleAppliedForIndex:ignoringScrollOffset:", a3, 1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBGridLayoutSwitcherModifier switcherSettings](self, "switcherSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "switcherCardShadowRadius");
  v14 = v13;

  -[SBGridLayoutSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v17 = CGRectInset(v16, v14 * -2.8, v14 * -2.8);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  return CGRectIntersectsRect(v17, v18);
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  SBMutableSwitcherAnimationAttributes *v5;
  void *v6;
  void *v7;

  -[SBGridLayoutSwitcherModifier switcherSettings](self, "switcherSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  -[SBSwitcherAnimationAttributes setUpdateMode:](v5, "setUpdateMode:", 1);
  objc_msgSend(v4, "layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setLayoutSettings:](v5, "setLayoutSettings:", v6);

  objc_msgSend(v4, "opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setOpacitySettings:](v5, "setOpacitySettings:", v7);

  return v5;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[SBGridLayoutSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIRectCornerRadii result;

  -[SBGridLayoutSwitcherModifier _cornerRadius](self, "_cornerRadius");
  -[SBGridLayoutSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[SBGridLayoutSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBGridLayoutSwitcherModifier visibleAppLayoutRangeForContentOffset:](self, "visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  -[SBGridLayoutSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSnapshotsToCacheInSwitcher");

  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v3, v5, v7, self->_isScrollingForward);
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return -[SBGridLayoutSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", a4);
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result;

  result = -[SBGridLayoutSwitcherModifier _indexOfLeadingCard](self, "_indexOfLeadingCard", a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  if (-[SBGridLayoutSwitcherModifier _numberOfSpaces](self, "_numberOfSpaces", a3) >= 2)
    return -[SBGridLayoutSwitcherModifier _indexOfLeadingCard](self, "_indexOfLeadingCard");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_indexOfLeadingCard
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v15;
  CGRect v16;

  -[SBGridLayoutSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBGridLayoutSwitcherModifier visibleAppLayoutRangeForContentOffset:](self, "visibleAppLayoutRangeForContentOffset:");
  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = v3;
  -[SBSwitcherModifier scaledFrameForIndex:](self, "scaledFrameForIndex:", v3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBGridLayoutSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  if (!CGRectIntersectsRect(v15, v16)
    && v5 < -[SBGridLayoutSwitcherModifier _numberOfSpaces](self, "_numberOfSpaces") - 1)
  {
    v5 += -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  }
  return v5;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  return a3;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  return a3;
}

- (id)scrollViewAttributes
{
  SBMutableSwitcherScrollViewAttributes *v3;

  v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  -[SBGridLayoutSwitcherModifier _contentSize](self, "_contentSize");
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  -[SBSwitcherScrollViewAttributes setDecelerationRate:](v3, "setDecelerationRate:", *MEMORY[0x1E0CEBBA8]);
  -[SBSwitcherScrollViewAttributes setScrollViewPagingEnabled:](v3, "setScrollViewPagingEnabled:", 0);
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SBSwitcherScrollViewAttributes setInterpolatesDuringSwipeToKill:](v3, "setInterpolatesDuringSwipeToKill:", 0);
  return v3;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  CGRect v6;

  -[SBGridLayoutSwitcherModifier frameForIndex:](self, "frameForIndex:");
  -[SBGridLayoutSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  return CGRectGetMinY(v6);
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  double Height;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;
  CGRect v15;

  -[SBGridLayoutSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  v4 = v3;
  v6 = v5;
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v8 = v4 + v7;
  -[SBGridLayoutSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  Width = CGRectGetWidth(v14);
  if (v8 < Width)
    v8 = Width;
  -[SBGridLayoutSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  Height = CGRectGetHeight(v15);
  if (v6 >= Height)
    v11 = v6;
  else
    v11 = Height;
  v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)_fittedContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[SBGridLayoutSwitcherModifier _scaledCardSize](self, "_scaledCardSize");
  -[SBGridLayoutSwitcherModifier _numberOfColumns](self, "_numberOfColumns");
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  -[SBGridLayoutSwitcherModifier _verticalSpacing](self, "_verticalSpacing");
  -[SBGridLayoutSwitcherModifier screenScale](self, "screenScale");
  BSSizeRoundForScale();
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  int v7;
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
  double v22;
  double v23;
  double v24;
  CGPoint result;

  v7 = -[SBGridLayoutSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBGridLayoutSwitcherModifier _contentSize](self, "_contentSize");
  v9 = v8;
  -[SBGridLayoutSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v11 = v10;
  -[SBGridLayoutSwitcherModifier _frameWithScaleAppliedForIndex:ignoringScrollOffset:](self, "_frameWithScaleAppliedForIndex:ignoringScrollOffset:", a3, 1);
  v13 = v12;
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v15 = v14;
  -[SBGridLayoutSwitcherModifier _frameWithScaleAppliedForIndex:ignoringScrollOffset:](self, "_frameWithScaleAppliedForIndex:ignoringScrollOffset:", a3, 0);
  v17 = v16;
  v18 = v15 + v13;
  switch(a4)
  {
    case 0:
    case 3:
      if (v7)
      {
        -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
        goto LABEL_8;
      }
      break;
    case 1:
      if (v7)
      {
        v18 = v18 - v11;
      }
      else
      {
        -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
        v18 = v11 - v21;
      }
      break;
    case 2:
      if (v7)
      {
        -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
        v19 = v18 + v20;
LABEL_8:
        v18 = -v19;
      }
      else
      {
        v18 = v18 + v18;
      }
      break;
    default:
      break;
  }
  if (v7)
    v22 = 0.0;
  else
    v22 = v11;
  v23 = fmax(v17 + v18 - v22, 0.0);
  if (v9 - v11 <= v23)
    v23 = v9 - v11;
  v24 = 0.0;
  result.y = v24;
  result.x = v23;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  uint64_t v5;
  double result;

  v5 = -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBSwitcherModifier distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:](self, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:", a3, v5, self->_layoutDirection);
  return result;
}

- (void)_applyPrototypeSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[SBGridLayoutSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridSwitcherHorizontalInterpageSpacingLandscape");
  kGridSwitcherHorizontalInterpageSpacingLandscape = v2;
  objc_msgSend(v6, "gridSwitcherVerticalNaturalSpacingLandscape");
  kGridSwitcherVerticalNaturalSpacingLandscape = v3;
  objc_msgSend(v6, "gridSwitcherHorizontalInterpageSpacingPortrait");
  kGridSwitcherHorizontalInterpageSpacingPortrait = v4;
  objc_msgSend(v6, "gridSwitcherVerticalNaturalSpacingPortrait");
  kGridSwitcherVerticalNaturalSpacingPortrait = v5;

}

- (unint64_t)_firstTrailingIndexForContentOffset:(CGPoint)a3
{
  double x;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  x = a3.x;
  v5 = -[SBGridLayoutSwitcherModifier _numberOfSpaces](self, "_numberOfSpaces", a3.x, a3.y);
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  -[SBGridLayoutSwitcherModifier _scaledCardSize](self, "_scaledCardSize");
  v8 = v7;
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v10 = x / (v8 + v9 * 2.0);
  v11 = BSFloatLessThanOrEqualToFloat();
  v12 = vcvtmd_u64_f64(v10);
  if (v11)
    v13 = 0;
  else
    v13 = v12;
  if (-[SBGridLayoutSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    return -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher") * v13;
  v15 = -[SBGridLayoutSwitcherModifier _numberOfColumns](self, "_numberOfColumns") - v13;
  v16 = v6 - 1;
  v17 = -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  if (v16 >= v15 * v17 - 1)
    return v15 * v17 - 1;
  else
    return v16;
}

- (CGRect)_frameForIndex:(unint64_t)a3 ignoringScrollOffset:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
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
  objc_super v22;
  CGRect result;

  v4 = a4;
  v7 = -[SBGridLayoutSwitcherModifier _numberOfSpaces](self, "_numberOfSpaces");
  v8 = a3;
  if (v7)
  {
    if (self->_layoutDirection)
      v8 = v7 + ~a3;
    else
      v8 = a3;
  }
  -[SBGridLayoutSwitcherModifier _rowForIndex:](self, "_rowForIndex:", v8);
  -[SBGridLayoutSwitcherModifier _columnForIndex:](self, "_columnForIndex:", v8);
  -[SBGridLayoutSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  -[SBGridLayoutSwitcherModifier _scaledCardSize](self, "_scaledCardSize");
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBGridLayoutSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBGridLayoutSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  -[SBGridLayoutSwitcherModifier _verticalSpacing](self, "_verticalSpacing");
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  if (!-[SBGridLayoutSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    -[SBGridLayoutSwitcherModifier _contentSize](self, "_contentSize");
  -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBGridLayoutSwitcherModifier _cardHeaderHeight](self, "_cardHeaderHeight");
  -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  -[SBGridLayoutSwitcherModifier _verticalSpacing](self, "_verticalSpacing");
  -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  -[SBGridLayoutSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  -[SBGridLayoutSwitcherModifier _verticalSpacing](self, "_verticalSpacing");
  if (self->_alignment == 1)
  {
    -[SBGridLayoutSwitcherModifier _contentSize](self, "_contentSize");
    -[SBGridLayoutSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
    if (BSFloatLessThanOrEqualToFloat())
      -[SBGridLayoutSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  }
  v22.receiver = self;
  v22.super_class = (Class)SBGridLayoutSwitcherModifier;
  -[SBGridLayoutSwitcherModifier frameForIndex:](&v22, sel_frameForIndex_, a3);
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (v4)
  {
    -[SBGridLayoutSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v10 = v10 - v17;
  }
  v18 = v10;
  v19 = v12;
  v20 = v14;
  v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)_verticalSpacing
{
  double result;

  -[SBGridLayoutSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBGridLayoutSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  return result;
}

- (double)_horizontalSpacing
{
  double result;

  -[SBGridLayoutSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBGridLayoutSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  return result;
}

- (double)_cornerRadius
{
  double v2;
  BOOL v3;
  double result;

  -[SBGridLayoutSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  v3 = v2 <= 0.0;
  result = 7.0;
  if (!v3)
    return 10.0;
  return result;
}

- (unint64_t)_rowForIndex:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;

  v4 = -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  return a3 % v5;
}

- (unint64_t)_columnForIndex:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;

  v4 = -[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  return a3 / v5;
}

- (double)_cardHeaderHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[SBGridLayoutSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spacingBetweenSnapshotAndIcon");
  v4 = v3;
  objc_msgSend(v2, "iconSideLength");
  v6 = v4 + v5;

  return v6;
}

- (CGRect)_frameWithScaleAppliedForIndex:(unint64_t)a3 ignoringScrollOffset:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[SBGridLayoutSwitcherModifier _frameForIndex:ignoringScrollOffset:](self, "_frameForIndex:ignoringScrollOffset:", a3, a4);
  -[SBGridLayoutSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (unint64_t)_numberOfColumns
{
  return vcvtpd_u64_f64((double)-[SBGridLayoutSwitcherModifier _numberOfSpaces](self, "_numberOfSpaces")/ (double)(unint64_t)-[SBGridLayoutSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher"));
}

- (unint64_t)_numberOfSpaces
{
  void *v2;
  unint64_t v3;

  -[SBGridLayoutSwitcherModifier appLayouts](self, "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)_appLayoutIndexForSpaceIndex:(unint64_t)a3
{
  return a3;
}

- (CGSize)_scaledCardSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBGridLayoutSwitcherModifier scale](self, "scale");
  v4 = v3;
  -[SBGridLayoutSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = v4 * v5;
  v8 = v4 * v7;
  result.height = v8;
  result.width = v6;
  return result;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

@end
