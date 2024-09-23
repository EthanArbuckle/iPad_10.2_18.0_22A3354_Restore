@implementation SBCoplanarSwitcherModifier

- (double)scaleForIndex:(unint64_t)a3
{
  double result;
  objc_super v6;
  objc_super v7;

  if (-[SBCoplanarSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")
    && (-[SBCoplanarSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled") & 1) == 0)
  {
    -[SBCoplanarSwitcherModifier scaleForIndex:](&v7, sel_scaleForIndex_, a3, v6.receiver, v6.super_class, self, SBCoplanarSwitcherModifier);
  }
  else if (-[SBCoplanarSwitcherModifier isSystemAssistantExperienceEnabled](self, "isSystemAssistantExperienceEnabled")&& -[SBCoplanarSwitcherModifier assistantPresentationState](self, "assistantPresentationState"))
  {
    -[SBCoplanarSwitcherModifier scaleForIndex:](&v6, sel_scaleForIndex_, a3, self, SBCoplanarSwitcherModifier, v7.receiver, v7.super_class);
  }
  else
  {
    return self->_scale;
  }
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char v10;
  double v11;
  double x;
  double v13;
  CGFloat y;
  double v15;
  double width;
  double v17;
  CGFloat height;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  int64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
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
  double v47;
  objc_super v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  v5 = -[SBCoplanarSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  if (v5
    && (-[SBCoplanarSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled") & 1) == 0)
  {
    v49.receiver = self;
    v49.super_class = (Class)SBCoplanarSwitcherModifier;
    -[SBCoplanarSwitcherModifier frameForIndex:](&v49, sel_frameForIndex_, a3);
    x = v29;
    y = v30;
    width = v31;
    height = v32;
  }
  else
  {
    -[SBCoplanarSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v9 = v8;
    if (self->_usesContainerViewBoundsAsActiveFrame)
      v10 = v5;
    else
      v10 = 1;
    if ((v10 & 1) != 0)
    {
      v48.receiver = self;
      v48.super_class = (Class)SBCoplanarSwitcherModifier;
      -[SBCoplanarSwitcherModifier frameForIndex:](&v48, sel_frameForIndex_, a3);
      x = v11;
      y = v13;
      width = v15;
      height = v17;
    }
    else
    {
      y = v6;
      height = v7;
      UIRectGetCenter();
      x = v19 + v9 * -0.5;
      width = v9;
    }
    -[SBCoplanarSwitcherModifier appLayouts](self, "appLayouts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[SBAppLayout isOrContainsAppLayout:](self->_activeAppLayout, "isOrContainsAppLayout:", v21))
    {
      -[SBCoplanarSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isOrContainsAppLayout:", self->_activeAppLayout);

      if ((v23 & 1) == 0)
      {
        v24 = -[SBCoplanarSwitcherModifier _indexOfActiveAppLayout](self, "_indexOfActiveAppLayout");
        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
          v25 = ~a3;
        else
          v25 = v24 - a3;
        if (-[SBCoplanarSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
          v26 = -(uint64_t)v25;
        else
          v26 = v25;
        -[SBCoplanarSwitcherModifier switcherSettings](self, "switcherSettings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SBCoplanarSwitcherModifier isDevicePad](self, "isDevicePad"))
          objc_msgSend(v27, "coplanarSpacingPad");
        else
          objc_msgSend(v27, "coplanarSpacingPhone");
        v33 = v28;
        if (v5)
        {
          -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v21);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "boundingBox");
          x = v35;
          y = v36;
          width = v37;
          height = v38;

          v39 = (v9 + v33) * (double)v26;
          if (v26 < 1)
            v40 = v39 + v9 - (x + width);
          else
            v40 = v39 - x;
          v41 = v40 * self->_scale;
        }
        else
        {
          v41 = (width + v28) * self->_scale * (double)v26;
        }
        if (self->_spacingType == 1)
        {
          -[SBCoplanarSwitcherModifier _offscreenSpacing](self, "_offscreenSpacing");
          v43 = 1.0;
          if (v26 < 0)
            v43 = -1.0;
          v41 = v41 + v42 * v43;
        }
        v50.origin.x = x;
        v50.origin.y = y;
        v50.size.width = width;
        v50.size.height = height;
        v51 = CGRectOffset(v50, v41, 0.0);
        x = v51.origin.x;
        y = v51.origin.y;
        width = v51.size.width;
        height = v51.size.height;

      }
    }

  }
  v44 = x;
  v45 = y;
  v46 = width;
  v47 = height;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

- (SBCoplanarSwitcherModifier)initWithActiveAppLayout:(id)a3
{
  id v5;
  SBCoplanarSwitcherModifier *v6;
  SBCoplanarSwitcherModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCoplanarSwitcherModifier;
  v6 = -[SBSwitcherModifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activeAppLayout, a3);
    v7->_scale = 1.0;
    v7->_spacingType = 0;
    v7->_usesContainerViewBoundsAsActiveFrame = 0;
  }

  return v7;
}

- (void)setUsesContainerViewBoundsAsActiveFrame:(BOOL)a3
{
  self->_usesContainerViewBoundsAsActiveFrame = a3;
}

- (int64_t)_indexOfActiveAppLayout
{
  void *v3;
  int64_t v4;

  if (!self->_activeAppLayout)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SBCoplanarSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self->_activeAppLayout);

  return v4;
}

- (double)_offscreenSpacing
{
  double v3;

  -[SBCoplanarSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return v3 * (1.0 - self->_scale) * 0.5;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)usesContainerViewBoundsAsActiveFrame
{
  return self->_usesContainerViewBoundsAsActiveFrame;
}

- (int64_t)spacingType
{
  return self->_spacingType;
}

- (void)setSpacingType:(int64_t)a3
{
  self->_spacingType = a3;
}

- (uint64_t)activeAppLayout
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

- (void)setActiveAppLayout:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 120), a2);
}

@end
