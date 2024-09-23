@implementation SBOverridePreferredFrameSwitcherModifier

- (SBOverridePreferredFrameSwitcherModifier)initWithDisplayItem:(id)a3
{
  return -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", a3, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredSize:(CGSize)a3 forDisplayItem:(id)a4
{
  return -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", a4, a3.width, a3.height, 1.79769313e308, 1.79769313e308);
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredCenter:(CGPoint)a3 forDisplayItem:(id)a4
{
  return -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", a4, 1.79769313e308, 1.79769313e308, a3.x, a3.y);
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredFrame:(CGRect)a3 forDisplayItem:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  SBOverridePreferredFrameSwitcherModifier *v10;

  height = a3.size.height;
  width = a3.size.width;
  v7 = a4;
  UIRectGetCenter();
  v10 = -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", v7, width, height, v8, v9);

  return v10;
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredSize:(CGSize)a3 newPreferredCenter:(CGPoint)a4 forDisplayItem:(id)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v12;
  SBOverridePreferredFrameSwitcherModifier *v13;
  void *v15;
  objc_super v16;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
  v13 = -[SBSwitcherModifier init](&v16, sel_init);
  if (v13)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBOverridePreferredFrameSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayItem"));

    }
    v13->_newPreferredSize.width = width;
    v13->_newPreferredSize.height = height;
    v13->_newPreferredCenter.x = x;
    v13->_newPreferredCenter.y = y;
    objc_storeStrong((id *)&v13->_displayItem, a5);
  }

  return v13;
}

- (void)setNewPreferredFrame:(CGRect)a3
{
  CGPoint *p_newPreferredCenter;
  CGFloat v4;
  CGFloat v5;

  self->_newPreferredSize.width = a3.size.width;
  self->_newPreferredSize.height = a3.size.height;
  p_newPreferredCenter = &self->_newPreferredCenter;
  UIRectGetCenter();
  p_newPreferredCenter->x = v4;
  p_newPreferredCenter->y = v5;
}

- (CGRect)newPreferredFrame
{
  BOOL v2;
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v2 = self->_newPreferredCenter.x == 1.79769313e308 && self->_newPreferredCenter.y == 1.79769313e308;
  if (v2
    || (self->_newPreferredSize.width == 1.79769313e308
      ? (v3 = self->_newPreferredSize.height == 1.79769313e308)
      : (v3 = 0),
        v3))
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    SBRectWithSize();
    UIRectCenteredAboutPoint();
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setNewPreferredSize:(CGSize)a3
{
  self->_newPreferredSize = a3;
}

- (void)setNewPreferredCenter:(CGPoint)a3
{
  self->_newPreferredCenter = a3;
}

- (CGRect)preferredFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 interfaceOrientation:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  BOOL v15;
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
  double v28;
  objc_super v29;
  objc_super v30;
  objc_super v31;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4;
  objc_msgSend(v13, "itemForLayoutRole:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqual:", self->_displayItem))
  {
    v15 = self->_newPreferredSize.width == 1.79769313e308;
    if (self->_newPreferredSize.height != 1.79769313e308)
      v15 = 0;
    if (self->_newPreferredCenter.x != 1.79769313e308 || self->_newPreferredCenter.y != 1.79769313e308)
    {
      if (v15)
      {
        v31.receiver = self;
        v31.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
        -[SBOverridePreferredFrameSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](&v31, sel_preferredFrameForLayoutRole_inAppLayout_bounds_interfaceOrientation_, a3, v13, a6, x, y, width, height, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
      }
      SBRectWithSize();
      goto LABEL_14;
    }
    if (!v15)
    {
      v30.receiver = self;
      v30.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
      -[SBOverridePreferredFrameSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](&v30, sel_preferredFrameForLayoutRole_inAppLayout_bounds_interfaceOrientation_, a3, v13, a6, x, y, width, height, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
      UIRectGetCenter();
      SBRectWithSize();
LABEL_14:
      UIRectCenteredAboutPoint();
      goto LABEL_15;
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
  -[SBOverridePreferredFrameSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](&v29, sel_preferredFrameForLayoutRole_inAppLayout_bounds_interfaceOrientation_, a3, v13, a6, x, y, width, height);
LABEL_15:
  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGSize)newPreferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_newPreferredSize.width;
  height = self->_newPreferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)newPreferredCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_newPreferredCenter.x;
  y = self->_newPreferredCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end
