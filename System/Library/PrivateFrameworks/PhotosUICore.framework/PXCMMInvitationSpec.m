@implementation PXCMMInvitationSpec

- (PXCMMInvitationSpec)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 23, CFSTR("%s is not available as initializer"), "-[PXCMMInvitationSpec init]");

  abort();
}

- (id)_initWithLayoutVariant:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMInvitationSpec;
  result = -[PXCMMInvitationSpec init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (double)aspectRatio
{
  unint64_t layoutVariant;
  void *v6;

  layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 45, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return dbl_1A7C0B6C0[layoutVariant];
}

- (double)cornerRadius
{
  unint64_t layoutVariant;
  void *v6;

  layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 58, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return dbl_1A7C0B6E0[layoutVariant];
}

- (double)insets
{
  unint64_t layoutVariant;
  void *v6;

  layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 72, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return dbl_1A7C0B700[layoutVariant];
}

- (double)verticalPadding
{
  int64_t layoutVariant;
  double result;
  void *v6;

  layoutVariant = self->_layoutVariant;
  result = 9.0;
  if (layoutVariant != 1)
  {
    if (layoutVariant != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 9.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 85, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    return 0.0;
  }
  return result;
}

- (double)bulletSize
{
  void *v5;

  if ((unint64_t)(self->_layoutVariant - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 97, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 12.0;
}

- (double)titleSpacing
{
  int64_t layoutVariant;
  double result;
  void *v6;

  layoutVariant = self->_layoutVariant;
  result = 2.0;
  if (layoutVariant != 1)
  {
    if (layoutVariant != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 2.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 110, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    return 0.0;
  }
  return result;
}

- (double)subtitleSpacing
{
  unint64_t v2;
  void *v6;

  v2 = self->_layoutVariant - 1;
  if (v2 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 124, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return dbl_1A7C0B720[v2];
}

- (UIFont)posterTitleFont
{
  void *v2;
  void *v3;

  -[PXCMMInvitationSpec posterTitleTextStyle](self, "posterTitleTextStyle");
  UIFontTextStyleFromPXFontTextStyle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", v2, 32770);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)titleFont
{
  void *v2;
  void *v3;

  -[PXCMMInvitationSpec titleTextStyle](self, "titleTextStyle");
  UIFontTextStyleFromPXFontTextStyle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)titleEmphasizedFont
{
  void *v2;
  void *v3;

  -[PXCMMInvitationSpec titleTextStyle](self, "titleTextStyle");
  UIFontTextStyleFromPXFontTextStyle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)subtitle2Font
{
  void *v2;
  void *v3;

  -[PXCMMInvitationSpec subtitle2TextStyle](self, "subtitle2TextStyle");
  UIFontTextStyleFromPXFontTextStyle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (int64_t)posterTitleTextStyle
{
  unint64_t layoutVariant;
  void *v6;

  layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 242, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return qword_1A7C0B738[layoutVariant];
}

- (int64_t)titleTextStyle
{
  void *v5;

  if (self->_layoutVariant >= 4uLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationSpec.m"), 253, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 7;
}

- (int64_t)subtitle2TextStyle
{
  return 12;
}

- (UIColor)posterTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (UIColor)titleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)titleBulletColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

- (UIColor)subtitle1Color
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIColor)subtitle2Color
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

- (int64_t)layoutVariant
{
  return self->_layoutVariant;
}

+ (id)specForLayoutVariant:(int64_t)a3
{
  void *v4;
  id v5;

  if (specForLayoutVariant__predicate[0] != -1)
    dispatch_once(specForLayoutVariant__predicate, &__block_literal_global_264507);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)specForLayoutVariant__specs, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[PXCMMInvitationSpec _initWithLayoutVariant:]([PXCMMInvitationSpec alloc], "_initWithLayoutVariant:", a3);
    objc_msgSend((id)specForLayoutVariant__specs, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

void __44__PXCMMInvitationSpec_specForLayoutVariant___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)specForLayoutVariant__specs;
  specForLayoutVariant__specs = (uint64_t)v0;

}

@end
