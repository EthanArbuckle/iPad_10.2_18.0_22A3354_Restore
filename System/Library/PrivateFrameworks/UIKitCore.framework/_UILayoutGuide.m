@implementation _UILayoutGuide

- (_UILayoutGuide)initWithFrame:(CGRect)a3
{
  _UILayoutGuide *v3;
  _UILayoutGuide *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UILayoutGuide;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)&v3->super._viewFlags |= 0x420000000000000uLL;
    -[CALayer setHidden:](-[UIView layer](v3, "layer"), "setHidden:", 1);
  }
  return v4;
}

+ (id)classFallbacksForKeyedArchiver
{
  objc_class *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  v4[0] = NSStringFromClass(v2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
}

- (void)_setUpCounterDimensionConstraint
{
  uint64_t v3;
  _UILayoutSupportConstraint *v4;
  double v5;

  if (self->_horizontal)
    v3 = 8;
  else
    v3 = 7;
  v4 = +[_UILayoutSupportConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](_UILayoutSupportConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, v3, 0, 0, 0, 1.0, 0.0);
  LODWORD(v5) = 1148829696;
  -[_UILayoutSupportConstraint setPriority:](v4, "setPriority:", v5);
  -[_UILayoutSupportConstraint setShouldBeArchived:](v4, "setShouldBeArchived:", 1);
  -[UIView addConstraint:](self, "addConstraint:", v4);
}

+ (id)_verticalLayoutGuide
{
  id v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v2, "_setUpCounterDimensionConstraint");
  return v2;
}

+ (id)_horizontalLayoutGuide
{
  _BYTE *v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = v2;
  if (v2)
  {
    v2[417] = 1;
    objc_msgSend(v2, "_setUpCounterDimensionConstraint");
  }
  return v3;
}

- (double)length
{
  double v3;
  double v4;

  if (-[UIView _layoutEngine](self, "_layoutEngine"))
    -[UIView _nsis_bounds](self, "_nsis_bounds");
  else
    -[UIView bounds](self, "bounds");
  if (self->_horizontal)
    return v3;
  else
    return v4;
}

- (BOOL)_allowsArchivingAsSubview
{
  return self->_allowsArchivingAsSubview;
}

- (_UILayoutGuide)initWithCoder:(id)a3
{
  _UILayoutGuide *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UILayoutGuide;
  v4 = -[UIView initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("_UILayoutGuideIsHorizontal")))
      v4->_horizontal = 1;
    v4->_archivedIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("_UILayoutGuideIdentifier")), "copy");
    v4->_constraintsToRemoveAtRuntime = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("_UILayoutGuideConstraintsToRemove")), "copy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UILayoutGuide;
  -[UIView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (self->_horizontal)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("_UILayoutGuideIsHorizontal"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILayoutGuide _archivedIdentifier](self, "_archivedIdentifier"), CFSTR("_UILayoutGuideIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILayoutGuide _constraintsToRemoveAtRuntime](self, "_constraintsToRemoveAtRuntime"), CFSTR("_UILayoutGuideConstraintsToRemove"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UILayoutGuide;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (BOOL)_isFloatingLayoutItem
{
  return dyld_program_sdk_at_least();
}

- (id)_layoutVariablesWithAmbiguousValue
{
  id v3;
  id v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_UILayoutGuide;
  v3 = -[UIView _layoutVariablesWithAmbiguousValue](&v6, sel__layoutVariablesWithAmbiguousValue);
  if (self->_horizontal)
    v4 = -[UIView nsli_minYVariable](self, "nsli_minYVariable");
  else
    v4 = -[UIView nsli_minXVariable](self, "nsli_minXVariable");
  v7[0] = v4;
  return (id)objc_msgSend(v3, "arrayByExcludingObjectsInArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
}

- (NSArray)_constraintsToRemoveAtRuntime
{
  return self->_constraintsToRemoveAtRuntime;
}

- (void)_setConstraintsToRemoveAtRuntime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void)_setAllowsArchivingAsSubview:(BOOL)a3
{
  self->_allowsArchivingAsSubview = a3;
}

- (NSString)_archivedIdentifier
{
  return self->_archivedIdentifier;
}

- (void)_setArchivedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (BOOL)isHorizontal
{
  return self->_horizontal;
}

- (void)_setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

@end
