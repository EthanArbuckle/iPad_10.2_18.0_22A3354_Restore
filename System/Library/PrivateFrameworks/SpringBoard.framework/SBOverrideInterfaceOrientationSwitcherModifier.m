@implementation SBOverrideInterfaceOrientationSwitcherModifier

- (SBOverrideInterfaceOrientationSwitcherModifier)initWithInterfaceOrientation:(int64_t)a3
{
  SBOverrideInterfaceOrientationSwitcherModifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  result = -[SBSwitcherModifier init](&v5, sel_init);
  if (result)
    result->_orientation = a3;
  return result;
}

- (int64_t)switcherInterfaceOrientation
{
  return self->_orientation;
}

- (CGRect)containerViewBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  objc_super v17;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  -[SBOverrideInterfaceOrientationSwitcherModifier containerViewBounds](&v17, sel_containerViewBounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v16.receiver = self;
  v16.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  v11 = ((char *)-[SBOverrideInterfaceOrientationSwitcherModifier switcherInterfaceOrientation](&v16, sel_switcherInterfaceOrientation)- 1 < (char *)2) ^ ((unint64_t)(self->_orientation - 1) < 2);
  if (v11)
    v12 = v8;
  else
    v12 = v10;
  if (v11)
    v13 = v10;
  else
    v13 = v8;
  v14 = v4;
  v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)switcherViewBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  objc_super v17;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  -[SBOverrideInterfaceOrientationSwitcherModifier switcherViewBounds](&v17, sel_switcherViewBounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v16.receiver = self;
  v16.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  v11 = ((char *)-[SBOverrideInterfaceOrientationSwitcherModifier switcherInterfaceOrientation](&v16, sel_switcherInterfaceOrientation)- 1 < (char *)2) ^ ((unint64_t)(self->_orientation - 1) < 2);
  if (v11)
    v12 = v8;
  else
    v12 = v10;
  if (v11)
    v13 = v10;
  else
    v13 = v8;
  v14 = v4;
  v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

@end
