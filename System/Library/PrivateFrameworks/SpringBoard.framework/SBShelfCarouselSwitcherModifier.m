@implementation SBShelfCarouselSwitcherModifier

- (SBShelfCarouselSwitcherModifier)init
{
  SBShelfCarouselSwitcherModifier *v2;
  SBShelfCarouselSwitcherModifier *v3;
  CGSize v4;
  CGPoint v5;
  SBDefaultImplementationsSwitcherModifier *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBShelfCarouselSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fittedContentSize_lastAppLayoutsGenCount = 0x7FFFFFFFFFFFFFFFLL;
    v2->_fittedContentSize_lastOrientation = 0;
    v5 = (CGPoint)*MEMORY[0x1E0C9D628];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v2->_fittedContentSize_lastContainerViewBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v2->_fittedContentSize_lastContainerViewBounds.size = v4;
    v2->_fittedContentSize_lastSwitcherViewBounds.origin = v5;
    v2->_fittedContentSize_lastSwitcherViewBounds.size = v4;
    v2->_fittedContentSize_lastSize = (CGSize)*MEMORY[0x1E0C9D820];
    v2->_visibleRange_lastAppLayoutsGenCount = 0x7FFFFFFFFFFFFFFFLL;
    v2->_visibleRange_lastOrientation = 0;
    v2->_visibleRange_lastContainerViewBounds.origin = v5;
    v2->_visibleRange_lastContainerViewBounds.size = v4;
    v2->_visibleRange_lastSwitcherViewBounds.origin = v5;
    v2->_visibleRange_lastSwitcherViewBounds.size = v4;
    v2->_visibleRange_lastContentOffset = (CGPoint)SBInvalidPoint;
    v2->_visibleRange_lastRange = (_NSRange)xmmword_1D0E8B8F0;
    v2->_centerCardSize_containerViewBounds.origin = v5;
    v2->_centerCardSize_containerViewBounds.size = v4;
    v2->_floatingCardSize_containerViewBounds.origin = v5;
    v2->_floatingCardSize_containerViewBounds.size = v4;
    v6 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    -[SBChainableModifier addChildModifier:](v3, "addChildModifier:", v6);

  }
  return v3;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleAppLayouts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBShelfCarouselSwitcherModifier _orderedVisibleAppLayouts](self, "_orderedVisibleAppLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_orderedVisibleAppLayouts
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = -[SBShelfCarouselSwitcherModifier _visibleRange](self, "_visibleRange");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v6 = v3;
    v7 = v4;
    -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", v6, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (_NSRange)_visibleRange
{
  unint64_t v3;
  int64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSUInteger length;
  NSUInteger location;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  CGFloat v32;
  CGFloat v33;
  _NSRange result;
  CGRect v35;
  CGRect v36;

  if (self->_hasReceivedInitialSetupEvent)
  {
    v3 = -[SBShelfCarouselSwitcherModifier appLayoutsGenerationCount](self, "appLayoutsGenerationCount");
    v4 = -[SBShelfCarouselSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
    -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    v32 = v14;
    v33 = v13;
    v16 = v15;
    v18 = v17;
    -[SBShelfCarouselSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v20 = v19;
    v22 = v21;
    if (*(_OWORD *)&self->_visibleRange_lastAppLayoutsGenCount != __PAIR128__(v4, v3))
      goto LABEL_12;
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    if (!CGRectEqualToRect(self->_visibleRange_lastContainerViewBounds, v35))
      goto LABEL_12;
    v36.origin.y = v32;
    v36.origin.x = v33;
    v36.size.width = v16;
    v36.size.height = v18;
    if (!CGRectEqualToRect(self->_visibleRange_lastSwitcherViewBounds, v36))
      goto LABEL_12;
    if (self->_visibleRange_lastContentOffset.x == v20 && self->_visibleRange_lastContentOffset.y == v22)
    {
      location = self->_visibleRange_lastRange.location;
      length = self->_visibleRange_lastRange.length;
    }
    else
    {
LABEL_12:
      self->_visibleRange_lastAppLayoutsGenCount = v3;
      self->_visibleRange_lastOrientation = v4;
      self->_visibleRange_lastContainerViewBounds.origin.x = v6;
      self->_visibleRange_lastContainerViewBounds.origin.y = v8;
      self->_visibleRange_lastContainerViewBounds.size.width = v10;
      self->_visibleRange_lastContainerViewBounds.size.height = v12;
      self->_visibleRange_lastSwitcherViewBounds.origin.x = v33;
      self->_visibleRange_lastSwitcherViewBounds.origin.y = v32;
      self->_visibleRange_lastSwitcherViewBounds.size.width = v16;
      self->_visibleRange_lastSwitcherViewBounds.size.height = v18;
      self->_visibleRange_lastContentOffset.x = v20;
      self->_visibleRange_lastContentOffset.y = v22;
      -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        v28 = 0;
        length = 0;
        location = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          if (-[SBShelfCarouselSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v28))
          {
            if (location == 0x7FFFFFFFFFFFFFFFLL)
              v29 = v28;
            else
              v29 = location;
            ++length;
          }
          else
          {
            v29 = 0x7FFFFFFFFFFFFFFFLL;
            if (location != 0x7FFFFFFFFFFFFFFFLL)
              break;
          }
          ++v28;
          location = v29;
        }
        while (v27 != v28);
      }
      else
      {
        length = 0;
        location = 0x7FFFFFFFFFFFFFFFLL;
      }
      self->_visibleRange_lastRange.location = location;
      self->_visibleRange_lastRange.length = length;
    }
  }
  else
  {
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v30 = location;
  v31 = length;
  result.length = v31;
  result.location = v30;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  -[SBShelfCarouselSwitcherModifier scaleForIndex:](self, "scaleForIndex:");
  v6 = v5;
  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherShelfCardScale");
  v9 = v8;

  v10 = (v6 - v9 * 0.75) * 0.25 / (v9 - v9 * 0.75) + 0.75;
  -[SBShelfCarouselSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  UIRectGetCenter();
  v12 = v11;
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v14 = v10 * 0.5;
  if (v12 <= v13 * 0.5)
    v14 = 1.0 - v10 * 0.5;
  v15 = 0.5;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBShelfCarouselSwitcherModifier _frameForIndex:applyCarousel:](self, "_frameForIndex:applyCarousel:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
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
  double v27;
  objc_super v28;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  if (objc_msgSend(v11, "environment") == 1)
  {
    v28.receiver = self;
    v28.super_class = (Class)SBShelfCarouselSwitcherModifier;
    -[SBShelfCarouselSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v28, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    -[SBShelfCarouselSwitcherModifier _cardSizeForAppLayout:](self, "_cardSizeForAppLayout:", v11);

    SBRectWithSize();
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v19 = v23;
  }
  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_frameForIndex:(unint64_t)a3 applyCarousel:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
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
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect result;

  v4 = a4;
  v7 = a3;
  if ((-[SBShelfCarouselSwitcherModifier isRTLEnabled](self, "isRTLEnabled") & 1) == 0)
  {
    -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count") + ~a3;

  }
  -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", a3);
  v10 = v9;
  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switcherShelfCardScale");
  v13 = v12;

  if (v7)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0.0;
    do
    {
      v17 = v15;
      if ((-[SBShelfCarouselSwitcherModifier isRTLEnabled](self, "isRTLEnabled") & 1) == 0)
      {
        -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v18, "count") + v14 - 1;

      }
      -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", v17);
      v16 = v16 + v13 * v19 + 32.0;
      ++v15;
      --v14;
    }
    while (-(uint64_t)v7 != v14);
  }
  else
  {
    v16 = 0.0;
  }
  v20 = v10 * v13;
  v21 = v20 * 0.5;
  -[SBShelfCarouselSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v23 = v20 * 0.5 + v16 - v22;
  -[SBShelfCarouselSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  v25 = v24;
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v27 = v26;
  if (v25 >= v26)
  {
    if (-[SBShelfCarouselSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    {
      -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", 0);
      v30 = v29;
    }
    else
    {
      -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", objc_msgSend(v31, "count") - 1);
      v30 = v32;

    }
    -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "switcherShelfCardScale");
    v35 = v34;

    v28 = v27 * 0.5 - v27 * 0.899497487 * 0.5 + v30 * v35 * 0.5 - v30 * v35 * 0.5;
  }
  else
  {
    v28 = (v26 - v25) * 0.5;
  }
  v36 = v23 + v28;
  if (v4)
  {
    -[SBShelfCarouselSwitcherModifier _effectiveMaxCarouselWidth](self, "_effectiveMaxCarouselWidth");
    v37 = v27 * 0.5;
    v39 = v38 * 0.5;
    v40 = v27 * 0.5 - v39;
    v41 = v20 * 3.0 * 0.5;
    v42 = v41 + v40;
    v43 = v21 + v40;
    v44 = v37 + v39;
    v45 = v44 - v41;
    v46 = v44 - v21;
    if (v36 <= v37)
    {
      if (!v7
        || (-[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts"),
            v52 = (void *)objc_claimAutoreleasedReturnValue(),
            v53 = objc_msgSend(v52, "count") - 1,
            v52,
            v7 == v53))
      {
        if (v43 >= v36)
          v54 = v43;
        else
          v54 = v36;
        if (v42 <= v54)
          v54 = v42;
        v50 = v54 - v42;
        v51 = v43 - v42;
        goto LABEL_34;
      }
      if (v43 - v21 >= v36)
        v60 = v43 - v21;
      else
        v60 = v36;
      if (v42 <= v60)
        v60 = v42;
      v58 = v60 - v42;
      v59 = v43 - v21 - v42;
    }
    else
    {
      if (!v7
        || (-[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts"),
            v47 = (void *)objc_claimAutoreleasedReturnValue(),
            v48 = objc_msgSend(v47, "count") - 1,
            v47,
            v7 == v48))
      {
        if (v45 >= v36)
          v49 = v45;
        else
          v49 = v36;
        if (v46 <= v49)
          v49 = v46;
        v50 = v49 - v45;
        v51 = v46 - v45;
LABEL_34:
        v55 = v50 / v51;
LABEL_48:
        v61 = fmax(v55 + 0.0, 0.0);
        if (v61 >= 1.0)
          v62 = 1.57079633;
        else
          v62 = v61 * 1.57079633;
        sin(v62);
        if (!BSFloatIsOne() && (BSFloatIsZero() & 1) == 0 && v7)
        {
          -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "count");

        }
        goto LABEL_55;
      }
      v56 = v21 + v46;
      if (v45 >= v36)
        v57 = v45;
      else
        v57 = v36;
      if (v56 <= v57)
        v57 = v21 + v46;
      v58 = v57 - v45;
      v59 = v56 - v45;
    }
    v55 = v58 / v59;
    goto LABEL_48;
  }
LABEL_55:
  SBRectWithSize();
  UIRectCenteredAboutPoint();
  result.size.height = v67;
  result.size.width = v66;
  result.origin.y = v65;
  result.origin.x = v64;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  unint64_t v45;
  double v46;

  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v6 = v5;
  -[SBShelfCarouselSwitcherModifier _frameForIndex:applyCarousel:](self, "_frameForIndex:applyCarousel:", a3, 1);
  UIRectGetCenter();
  v8 = v7;
  v9 = v6 * 0.5;
  if (-[SBShelfCarouselSwitcherModifier isRTLEnabled](self, "isRTLEnabled") != v7 <= v6 * 0.5)
    v10 = a3 - 1;
  else
    v10 = a3 + 1;
  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - 1;
  v13 = v10 & ~(v10 >> 63);

  if (v12 >= v13)
    v14 = v13;
  else
    v14 = v12;
  -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", a3);
  v16 = v15;
  -[SBShelfCarouselSwitcherModifier _frameForIndex:applyCarousel:](self, "_frameForIndex:applyCarousel:", v14, 0);
  UIRectGetCenter();
  v18 = v17;
  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "switcherShelfCardScale");
  v21 = v20;

  -[SBShelfCarouselSwitcherModifier _effectiveMaxCarouselWidth](self, "_effectiveMaxCarouselWidth");
  v23 = v22 * 0.5;
  v24 = v9 - v22 * 0.5;
  v25 = v16 * v21 * 3.0 * 0.5;
  v26 = v16 * v21 * 0.5;
  v27 = v9 + v23;
  v28 = v27 - v25;
  v29 = v25 + v24 + 32.0;
  v30 = v28 + -32.0;
  v31 = (v29 - (v28 + -32.0)) * 0.5;
  if (v8 > v9)
  {
    v37 = -0.0;
    if (v30 < v29)
      v37 = v31;
    v38 = v30 + v37;
    v39 = v27 - v26 + 32.0;
    if (v38 >= v18)
      v40 = v38;
    else
      v40 = v18;
    if (v39 <= v40)
      v40 = v39;
    v36 = (v40 - v38) / (v39 - v38);
  }
  else
  {
    v32 = 0.0;
    if (v30 < v29)
      v32 = v31;
    v33 = v29 - v32;
    v34 = v26 + v24 + -32.0;
    if (v34 >= v18)
      v35 = v34;
    else
      v35 = v18;
    if (v33 <= v35)
      v35 = v33;
    v36 = (v35 - v33) / (v34 - v33);
  }
  v41 = fmax(v36 + 0.0, 0.0);
  if (v41 >= 1.0)
    v42 = 1.57079633;
  else
    v42 = v41 * 1.57079633;
  v43 = sin(v42) * -0.25 + 1.0;
  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  v46 = 0.76;
  if (v43 >= 0.76 || v45 >= 3)
    v46 = v43;
  return v21 * v46;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  void *v6;
  double v7;

  -[SBShelfCarouselSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a5, a4);
  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherShelfCardScale");
  if (BSFloatEqualToFloat())
    v7 = 0.0;
  else
    v7 = 1.0;

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  double result;

  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherShelfCardScale");

  -[SBShelfCarouselSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  v6 = BSFloatLessThanOrEqualToFloat();
  result = 1.0;
  if (v6)
    return 0.0;
  return result;
}

- (id)topMostLayoutElements
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v3 = -[SBShelfCarouselSwitcherModifier _visibleRange](self, "_visibleRange");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return MEMORY[0x1E0C9AA60];
  v6 = v3;
  v7 = v4;
  v8 = (void *)objc_opt_new();
  v9 = -[SBShelfCarouselSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  if (v6 < v6 + v7)
  {
    v10 = v9;
    do
    {
      -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
      UIRectGetCenter();
      v12 = v11;
      -[SBShelfCarouselSwitcherModifier _frameForIndex:applyCarousel:](self, "_frameForIndex:applyCarousel:", v6, 1);
      UIRectGetCenter();
      v14 = v13;
      -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (((v10 ^ (v14 <= v12)) & 1) != 0)
        objc_msgSend(v8, "addObject:", v16);
      else
        objc_msgSend(v8, "insertObject:atIndex:", v16, 0);

      ++v6;
      --v7;
    }
    while (v7);
  }
  return v8;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v2;
  void *v3;

  -[SBShelfCarouselSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  return a3;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  return a3;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v4;
  double v5;
  double v6;

  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherShelfCardScale");
  v6 = v5;

  return v6;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  void *v4;
  double v5;
  double v6;

  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherShelfCardScale");
  v6 = v5;

  return v6;
}

- (CGSize)_cardSizeForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBShelfCarouselSwitcherModifier _cardSizeForAppLayout:](self, "_cardSizeForAppLayout:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_cardSizeForAppLayout:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  CGSize result;

  if (a3)
  {
    v4 = objc_msgSend(a3, "environment");
    if (v4 == 1)
    {
      -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v6 = v5;
      v8 = v7;
    }
    else
    {
      v9 = v4;
      v10 = -[SBShelfCarouselSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      if (v9 == 2)
        -[SBShelfCarouselSwitcherModifier _floatingCardSizeForOrientation:](self, "_floatingCardSizeForOrientation:", v10);
      else
        -[SBShelfCarouselSwitcherModifier _centerCardSizeForOrientation:](self, "_centerCardSizeForOrientation:", v10);
    }
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v8;
  result.width = v6;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 3;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  double v3;

  -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds", a3);
  return v3;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  int v11;

  v7 = a4;
  if (objc_msgSend(v7, "type") == 5
    || (-[SBShelfCarouselSwitcherModifier shelfFocusedDisplayItems](self, "shelfFocusedDisplayItems"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "containsAnyItemFromSet:", v8),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_msgSend(v7, "isCenterOverSplit") ^ 1;
    if (a3 == 4)
      v10 = 1;
    else
      v10 = v11;
  }

  return v10;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 1;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)shouldScrollViewBlockTouches
{
  return 0;
}

- (double)shelfBackgroundBlurOpacity
{
  return 1.0;
}

- (CGRect)shelfBackgroundBlurFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBShelfCarouselSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  SBRectWithSize();
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v3;
  double v4;
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
  UIRectCornerRadii result;

  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherShelfCardCornerRadius");
  objc_msgSend(v3, "switcherShelfCardScale");
  SBRectCornerRadiiForRadius();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.topRight = v15;
  result.bottomRight = v14;
  result.bottomLeft = v13;
  result.topLeft = v12;
  return result;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)scrollViewAttributes
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[SBShelfCarouselSwitcherModifier _contentSize](self, "_contentSize");
  objc_msgSend(v3, "setContentSize:");
  objc_msgSend(v3, "setDecelerationRate:", *MEMORY[0x1E0CEBBA8]);
  objc_msgSend(v3, "setScrollViewPagingEnabled:", 0);
  objc_msgSend(v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v3, "setPagingOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v3, "setInterpolatesDuringSwipeToKill:", 0);
  return v3;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  return a3;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (double)plusButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonScale
{
  return 1.0;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 0;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleShelves
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (CGRect)frameForShelf:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUpdateMode:", 1);
  objc_msgSend(v4, "setTitleAndIconOpacityUpdateMode:", 3);
  -[SBShelfCarouselSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutSettings:", v7);

  -[SBShelfCarouselSwitcherModifier switcherSettings](self, "switcherSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "opacitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpacitySettings:", v10);

  return v4;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[SBShelfCarouselSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherShelfCardScale");
  v8 = v7;

  -[SBShelfCarouselSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a4);
  v10 = v9;
  result = 1.0;
  if (v10 < v8 * 0.765)
    return (v10 + v8 * -0.75) / (v8 * 0.765 + v8 * -0.75) + 0.0;
  return result;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (int64_t)switcherBackdropBlurType
{
  return 1;
}

- (double)switcherBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 0;
}

- (double)switcherDimmingAlpha
{
  return 0.0;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  return 0;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 1;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return 1;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
}

- (double)containerStatusBarAnimationDuration
{
  return 0.35;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 0;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "itemForLayoutRole:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  return 2;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  return 0;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return 0;
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return 0;
}

- (unint64_t)transactionCompletionOptions
{
  void *v3;
  int v4;

  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[SBShelfCarouselSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

    if (v4)
      return 6;
    else
      return 2;
  }
  else
  {

    return 6;
  }
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 1;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t i;

  v5 = -[SBShelfCarouselSwitcherModifier _visibleRange](self, "_visibleRange");
  if (v5 > a3)
    return a3;
  v7 = v5;
  v8 = v6;
  if (v5 + v6 <= a3)
    return a3;
  -[SBShelfCarouselSwitcherModifier titleAndIconOpacityForIndex:](self, "titleAndIconOpacityForIndex:", a3);
  i = a3;
  if (BSFloatIsOne())
  {
    for (i = v7; ; ++i)
    {
      -[SBShelfCarouselSwitcherModifier titleAndIconOpacityForIndex:](self, "titleAndIconOpacityForIndex:", i);
      if ((BSFloatIsOne() & 1) != 0)
        break;
      if (!--v8)
        return a3;
    }
  }
  if (i == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  return i;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v5 = -[SBShelfCarouselSwitcherModifier _visibleRange](self, "_visibleRange");
  if (v5 >= v5 + v6)
    return a3;
  v7 = v5;
  v8 = v6;
  while (1)
  {
    -[SBShelfCarouselSwitcherModifier titleAndIconOpacityForIndex:](self, "titleAndIconOpacityForIndex:", v7);
    if ((BSFloatIsOne() & 1) != 0)
      break;
    ++v7;
    if (!--v8)
      return a3;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a4;
  if (objc_msgSend(v6, "type")
    || (-[SBShelfCarouselSwitcherModifier shelfFocusedDisplayItems](self, "shelfFocusedDisplayItems"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "containsAnyItemFromSet:", v7),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "leafAppLayoutForRole:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemForLayoutRole:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBShelfCarouselSwitcherModifier displayItemSupportsMedusa:](self, "displayItemSupportsMedusa:", v11);

  }
  return v9;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 0;
}

- (double)dockProgress
{
  return 0.0;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[SBShelfCarouselSwitcherModifier shelfFocusedDisplayItems](self, "shelfFocusedDisplayItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsAnyItemFromSet:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "itemForLayoutRole:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  return v6;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D1FA0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  double v5;
  double v6;
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
  double v20;
  double v21;
  CGPoint result;

  -[SBShelfCarouselSwitcherModifier _frameForIndex:applyCarousel:](self, "_frameForIndex:applyCarousel:", a3, 0);
  v6 = v5;
  UIRectGetCenter();
  v8 = v7;
  -[SBShelfCarouselSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v10 = v8 + v9;
  -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switcherShelfCardScale");
  v13 = v10 + v6 * v12 * 0.5;

  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v15 = v13 + v14 * -0.899497487;
  -[SBShelfCarouselSwitcherModifier _contentSize](self, "_contentSize");
  v17 = v16;
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v19 = v17 - v18;
  v20 = fmax(v15, 0.0);
  if (v17 - v18 > v20)
    v19 = v20;
  v21 = 0.0;
  result.y = v21;
  result.x = v19;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  return 0.0;
}

- (unint64_t)slideOverTongueState
{
  return 0;
}

- (unint64_t)slideOverTongueDirection
{
  return 0;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return 0;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  double v9;

  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBShelfCarouselSwitcherModifier shelfFocusedDisplayItems](self, "shelfFocusedDisplayItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsAnyItemFromSet:", v7))
  {
    v8 = objc_msgSend(v6, "isSplitConfiguration");

    v9 = 1.0;
    if ((v8 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  v9 = 0.0;
LABEL_6:

  return v9;
}

- (id)handleInitialSetupEvent:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SBScrollToAppLayoutSwitcherEventResponse *v9;
  void *v10;
  SBUpdateLayoutSwitcherEventResponse *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBShelfCarouselSwitcherModifier;
  -[SBSwitcherModifier handleInitialSetupEvent:](&v13, sel_handleInitialSetupEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasReceivedInitialSetupEvent = 1;
  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v8, 0, 0);
      SBAppendSwitcherModifierResponse(v9, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 2);
      SBAppendSwitcherModifierResponse(v11, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  SBNewWindowRequestSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  SBPerformTransitionSwitcherEventResponse *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") == 5)
  {
    v6 = [SBNewWindowRequestSwitcherEventResponse alloc];
    objc_msgSend(v5, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBNewWindowRequestSwitcherEventResponse initWithBundleIdentifier:](v6, "initWithBundleIdentifier:", v9);

  }
  else
  {
    +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRetainsSiri:", -[SBShelfCarouselSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    v10 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 0);
  }

  v14.receiver = self;
  v14.super_class = (Class)SBShelfCarouselSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v14, sel_handleTapAppLayoutEvent_, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  SBAppendSwitcherModifierResponse(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)handleShelfFocusedDisplayItemsChangedEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBShelfCarouselSwitcherModifier;
  -[SBSwitcherModifier handleShelfFocusedDisplayItemsChangedEvent:](&v9, sel_handleShelfFocusedDisplayItemsChangedEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
  SBAppendSwitcherModifierResponse(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)foregroundAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

- (double)_effectiveMaxCarouselWidth
{
  double v3;
  double v4;
  double v5;
  double result;

  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v4 = v3;
  -[SBShelfCarouselSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  result = v5 + v4 * 0.100502513;
  if (result > v4 * 0.899497487)
    return v4 * 0.899497487;
  return result;
}

- (BOOL)_isIndexVisible:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBShelfCarouselSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](self, "opacityForLayoutRole:inAppLayout:atIndex:", 1, v6, a3);
  LOBYTE(a3) = BSFloatIsZero() ^ 1;

  return a3;
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  -[SBShelfCarouselSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  v4 = v3;
  v6 = v5;
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v8 = v7;
  if (v4 >= v7)
  {
    -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      if (-[SBShelfCarouselSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      {
        -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", 0);
        v12 = v11;
      }
      else
      {
        -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", objc_msgSend(v13, "count") - 1);
        v12 = v14;

      }
      v15 = v8 * 0.899497487;
      if ((-[SBShelfCarouselSwitcherModifier isRTLEnabled](self, "isRTLEnabled") & 1) != 0)
      {
        -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", objc_msgSend(v16, "count") - 1);
        v18 = v17;

      }
      else
      {
        -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", 0);
        v18 = v19;
      }
      -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "switcherShelfCardScale");
      v22 = v21;

      v23 = v12 * v22 * 0.5;
      v24 = v8 * 0.5 - v15 * 0.5 + v23;
      v25 = v8 * 0.5 + v15 * 0.5;
      v26 = v18 * v22 * 0.5;
      v27 = v25 - v26;
      v28 = v24 - v23;
      -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
      v8 = v4 + v28 + v29 - v27 - v26;
    }
    else
    {
      v8 = 0.0;
    }
  }
  v30 = v8;
  v31 = v6;
  result.height = v31;
  result.width = v30;
  return result;
}

- (double)_trailingPaddingIfAny
{
  double v3;
  double v4;
  double result;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  -[SBShelfCarouselSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
  v4 = v3;
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  result = 0.0;
  if (v4 >= v6)
  {
    -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherShelfCardScale");
    v9 = v8;

    -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    v11 = v10;
    v12 = v10 * -0.899497487;
    -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", objc_msgSend(v13, "count") - 1);
    v15 = v14;

    return v11 * 0.5 + v12 * 0.5 + v9 * v15 * 3.0 * 0.5 - (v15 * v9 + 32.0);
  }
  return result;
}

- (CGSize)_fittedContentSize
{
  unint64_t v3;
  int64_t v4;
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
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double height;
  double width;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGSize result;
  CGRect v34;
  CGRect v35;

  v3 = -[SBShelfCarouselSwitcherModifier appLayoutsGenerationCount](self, "appLayoutsGenerationCount");
  v4 = -[SBShelfCarouselSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (*(_OWORD *)&self->_fittedContentSize_lastAppLayoutsGenCount != __PAIR128__(v4, v3))
    goto LABEL_5;
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  if (!CGRectEqualToRect(self->_fittedContentSize_lastContainerViewBounds, v34))
    goto LABEL_5;
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  if (CGRectEqualToRect(self->_fittedContentSize_lastSwitcherViewBounds, v35))
  {
    width = self->_fittedContentSize_lastSize.width;
    height = self->_fittedContentSize_lastSize.height;
  }
  else
  {
LABEL_5:
    self->_fittedContentSize_lastAppLayoutsGenCount = v3;
    self->_fittedContentSize_lastOrientation = v4;
    self->_fittedContentSize_lastContainerViewBounds.origin.x = v6;
    self->_fittedContentSize_lastContainerViewBounds.origin.y = v8;
    self->_fittedContentSize_lastContainerViewBounds.size.width = v10;
    self->_fittedContentSize_lastContainerViewBounds.size.height = v12;
    self->_fittedContentSize_lastSwitcherViewBounds.origin.x = v14;
    self->_fittedContentSize_lastSwitcherViewBounds.origin.y = v16;
    self->_fittedContentSize_lastSwitcherViewBounds.size.width = v18;
    self->_fittedContentSize_lastSwitcherViewBounds.size.height = v20;
    -[SBShelfCarouselSwitcherModifier medusaSettings](self, "medusaSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "switcherShelfCardScale");
    v25 = v24;

    -[SBShelfCarouselSwitcherModifier appLayouts](self, "appLayouts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27)
    {
      v28 = 0;
      v29 = 0.0;
      do
      {
        -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", v28);
        v29 = v29 + v30 * v25;
        ++v28;
      }
      while (v27 != v28);
    }
    else
    {
      v29 = 0.0;
    }
    width = v29 + (double)(unint64_t)(v27 - 1) * 32.0;
    -[SBShelfCarouselSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    height = v31;
    self->_fittedContentSize_lastSize.width = width;
    self->_fittedContentSize_lastSize.height = v31;
  }
  v32 = width;
  result.height = height;
  result.width = v32;
  return result;
}

- (CGSize)_centerCardSizeForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect *p_centerCardSize_containerViewBounds;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int *v23;
  double *v24;
  double v25;
  double v26;
  CGSize result;
  CGRect v28;
  CGRect v29;

  -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  p_centerCardSize_containerViewBounds = &self->_centerCardSize_containerViewBounds;
  if (CGRectIsNull(self->_centerCardSize_containerViewBounds))
    goto LABEL_3;
  v29.origin.x = p_centerCardSize_containerViewBounds->origin.x;
  v29.origin.y = self->_centerCardSize_containerViewBounds.origin.y;
  v29.size.width = self->_centerCardSize_containerViewBounds.size.width;
  v29.size.height = self->_centerCardSize_containerViewBounds.size.height;
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  if (!CGRectEqualToRect(v28, v29))
  {
LABEL_3:
    p_centerCardSize_containerViewBounds->origin.x = v6;
    self->_centerCardSize_containerViewBounds.origin.y = v8;
    self->_centerCardSize_containerViewBounds.size.width = v10;
    self->_centerCardSize_containerViewBounds.size.height = v12;
    SBAppLayoutGenericAppLayoutWithConfiguration(1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 3, v6, v8, v10, v12);
    v16 = v15;
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 1, v6, v8, v10, v12);
    v18 = v17;
    -[SBShelfCarouselSwitcherModifier centerWindowFrameInInterfaceOrientation:centerConfiguration:](self, "centerWindowFrameInInterfaceOrientation:centerConfiguration:", 4, 1);
    self->_centerCardSize_landscapeCardSize.width = v16 * (v19 / v20);
    self->_centerCardSize_landscapeCardSize.height = v16;
    -[SBShelfCarouselSwitcherModifier centerWindowFrameInInterfaceOrientation:centerConfiguration:](self, "centerWindowFrameInInterfaceOrientation:centerConfiguration:", 1, 1);
    self->_centerCardSize_portraitCardSize.width = v18 * (v21 / v22);
    self->_centerCardSize_portraitCardSize.height = v18;

  }
  if ((unint64_t)(a3 - 1) >= 2)
    v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__centerCardSize_landscapeCardSize;
  else
    v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__centerCardSize_portraitCardSize;
  v24 = (double *)((char *)self + *v23);
  v25 = *v24;
  v26 = v24[1];
  result.height = v26;
  result.width = v25;
  return result;
}

- (CGSize)_floatingCardSizeForOrientation:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect *p_floatingCardSize_containerViewBounds;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int *v23;
  double *v24;
  double v25;
  double v26;
  CGSize result;
  CGRect v28;
  CGRect v29;

  -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  p_floatingCardSize_containerViewBounds = &self->_floatingCardSize_containerViewBounds;
  if (CGRectIsNull(self->_floatingCardSize_containerViewBounds))
    goto LABEL_3;
  v29.origin.x = p_floatingCardSize_containerViewBounds->origin.x;
  v29.origin.y = self->_floatingCardSize_containerViewBounds.origin.y;
  v29.size.width = self->_floatingCardSize_containerViewBounds.size.width;
  v29.size.height = self->_floatingCardSize_containerViewBounds.size.height;
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  if (!CGRectEqualToRect(v28, v29))
  {
LABEL_3:
    p_floatingCardSize_containerViewBounds->origin.x = v6;
    self->_floatingCardSize_containerViewBounds.origin.y = v8;
    self->_floatingCardSize_containerViewBounds.size.width = v10;
    self->_floatingCardSize_containerViewBounds.size.height = v12;
    SBAppLayoutGenericAppLayoutWithConfiguration(1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds");
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 3);
    v16 = v15;
    -[SBShelfCarouselSwitcherModifier containerViewBounds](self, "containerViewBounds");
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 1);
    v18 = v17;
    -[SBShelfCarouselSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", 3, 2);
    self->_floatingCardSize_landscapeCardSize.width = v16 * (v19 / v20);
    self->_floatingCardSize_landscapeCardSize.height = v16;
    -[SBShelfCarouselSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", 1, 2);
    self->_floatingCardSize_portraitCardSize.width = v18 * (v21 / v22);
    self->_floatingCardSize_portraitCardSize.height = v18;

  }
  if ((unint64_t)(a3 - 1) >= 2)
    v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__floatingCardSize_landscapeCardSize;
  else
    v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__floatingCardSize_portraitCardSize;
  v24 = (double *)((char *)self + *v23);
  v25 = *v24;
  v26 = v24[1];
  result.height = v26;
  result.width = v25;
  return result;
}

@end
