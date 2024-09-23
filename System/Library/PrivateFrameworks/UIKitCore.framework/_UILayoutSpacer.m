@implementation _UILayoutSpacer

- (double)length
{
  double v3;
  double v4;

  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  if (self->_horizontal)
    return v3;
  else
    return v4;
}

+ (id)_horizontalLayoutSpacer
{
  _BYTE *v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = v2;
  if (v2)
  {
    v2[225] = 1;
    objc_msgSend(v2, "_setUpCounterDimensionConstraint");
  }
  return v3;
}

+ (id)_verticalLayoutSpacer
{
  id v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v2, "_setUpCounterDimensionConstraint");
  return v2;
}

- (void)_setUpCounterDimensionConstraint
{
  uint64_t v2;
  _UILayoutSupportConstraint *v3;
  double v4;

  if (self->_horizontal)
    v2 = 8;
  else
    v2 = 7;
  v3 = +[_UILayoutSupportConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](_UILayoutSupportConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, v2, 0, 0, 0, 1.0, 0.0);
  LODWORD(v4) = 1148829696;
  -[_UILayoutSupportConstraint setPriority:](v3, "setPriority:", v4);
  -[_UILayoutSupportConstraint setShouldBeArchived:](v3, "setShouldBeArchived:", 1);
  -[_UILayoutSupportConstraint setActive:](v3, "setActive:", 1);
}

- (BOOL)_isHorizontal
{
  return self->_horizontal;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UILayoutSpacer;
  -[UILayoutGuide dealloc](&v3, sel_dealloc);
}

- (_UILayoutSpacer)initWithCoder:(id)a3
{
  _UILayoutSpacer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UILayoutSpacer;
  v4 = -[UILayoutGuide initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_UILayoutSpacerIsHorizontal")))
      v4->_horizontal = 1;
    v4->_constraintsToRemoveAtRuntime = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("_UILayoutSpacerConstraintsToRemove")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_UILayoutSpacerCompatibilityGuideAllowsArchivingAsSubview")))v4->_compatibilityGuideAllowsArchivingAsSubview = 1;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UILayoutSpacer;
  -[UILayoutGuide encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (self->_horizontal)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("_UILayoutSpacerIsHorizontal"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILayoutSpacer _constraintsToRemoveAtRuntime](self, "_constraintsToRemoveAtRuntime"), CFSTR("_UILayoutSpacerConstraintsToRemove"));
  if (self->_compatibilityGuideAllowsArchivingAsSubview)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("_UILayoutSpacerCompatibilityGuideAllowsArchivingAsSubview"));
}

- (id)_layoutVariablesWithAmbiguousValue
{
  void *v3;
  id v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)_layoutVariablesWithAmbiguousValueForLayoutItem(self);
  if (self->_horizontal)
    v4 = -[UILayoutGuide nsli_minYVariable](self, "nsli_minYVariable");
  else
    v4 = -[UILayoutGuide nsli_minXVariable](self, "nsli_minXVariable");
  v6[0] = v4;
  return (id)objc_msgSend(v3, "arrayByExcludingObjectsInArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

- (NSArray)_constraintsToRemoveAtRuntime
{
  return self->_constraintsToRemoveAtRuntime;
}

- (void)_setConstraintsToRemoveAtRuntime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)_compatibilityGuideAllowsArchivingAsSubview
{
  return self->_compatibilityGuideAllowsArchivingAsSubview;
}

- (void)_setCompatibilityGuideAllowsArchivingAsSubview:(BOOL)a3
{
  self->_compatibilityGuideAllowsArchivingAsSubview = a3;
}

- (void)_setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

@end
