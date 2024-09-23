@implementation _UISystemBaselineConstraint

+ (id)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 withSystemSpacingMultipliedBy:(double)a6
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (objc_msgSend(a3, "_anchorType") != 2 || objc_msgSend(a5, "_anchorType") != 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSLayoutConstraint_UIKitAdditions.m"), 6176, CFSTR("_UISystemBaselineConstraint may only be created with proxied anchors."));
  v12 = objc_msgSend(a3, "_proxiedItem");
  v13 = objc_msgSend(a3, "_proxiedAttribute");
  v14 = objc_msgSend(a5, "_proxiedItem");
  v15 = objc_msgSend(a5, "_proxiedAttribute");
  return +[_UISystemBaselineConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:symbolicConstant:symbolicConstantMultiplier:](_UISystemBaselineConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:symbolicConstant:symbolicConstantMultiplier:", v12, v13, a4, v14, v15, *MEMORY[0x1E0D15690], 1.0, a6);
}

- (_UISystemBaselineConstraint)initWithCoder:(id)a3
{
  _UISystemBaselineConstraint *v5;
  _UISystemBaselineConstraint *v6;
  void *v7;
  void *v8;
  float v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UISystemBaselineConstraint;
  v5 = -[_UISystemBaselineConstraint initWithCoder:](&v11, sel_initWithCoder_);
  v6 = v5;
  if (v5)
  {
    if (!-[_UISystemBaselineConstraint symbolicConstant](v5, "symbolicConstant"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NSLayoutConstraint_UIKitAdditions.m"), 6182, CFSTR("Creating a _UISystemBaselineConstraint without a symbolic constant is not allowed."));
    v7 = (void *)-[_UISystemBaselineConstraint symbolicConstant](v6, "symbolicConstant");
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D156A8]) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D15690]) & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NSLayoutConstraint_UIKitAdditions.m"), 6184, CFSTR("_UISystemBaselineConstraint symbolic constant %@ does not support a spacingMultiplier."), -[_UISystemBaselineConstraint symbolicConstant](v6, "symbolicConstant"));
    }
    v8 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("UISpacingMultiplier"));
    if (v8)
    {
      objc_msgSend(v8, "floatValue");
      -[_UISystemBaselineConstraint setSymbolicConstantMultiplier:](v6, "setSymbolicConstantMultiplier:", v9);
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISystemBaselineConstraint;
  -[_UISystemBaselineConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[_UISystemBaselineConstraint symbolicConstantMultiplier](self, "symbolicConstantMultiplier");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v5, "numberWithDouble:"), CFSTR("UISpacingMultiplier"));
}

@end
