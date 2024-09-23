@implementation PRPosterLockPosterHomeScreenAppearance

- (BOOL)isLegibilityBlurEnabled
{
  return self->_legibilityBlurEnabled;
}

- (PRPosterLockPosterHomeScreenAppearance)initWithLegibilityBlurEnabled:(BOOL)a3 allowsModifyingLegibilityBlur:(BOOL)a4
{
  PRPosterLockPosterHomeScreenAppearance *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRPosterLockPosterHomeScreenAppearance;
  result = -[PRPosterLockPosterHomeScreenAppearance init](&v7, sel_init);
  if (result)
  {
    result->_legibilityBlurEnabled = a3;
    result->_allowsModifyingLegibilityBlur = a4;
  }
  return result;
}

- (PRPosterLockPosterHomeScreenAppearance)init
{
  return -[PRPosterLockPosterHomeScreenAppearance initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:](self, "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", 0, 1);
}

- (id)copyWithLegibilityBlurEnabled:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", a3, -[PRPosterLockPosterHomeScreenAppearance allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"));
}

- (id)copyByTogglingLegibilityBlurEnabled
{
  return -[PRPosterLockPosterHomeScreenAppearance copyWithLegibilityBlurEnabled:](self, "copyWithLegibilityBlurEnabled:", -[PRPosterLockPosterHomeScreenAppearance isLegibilityBlurEnabled](self, "isLegibilityBlurEnabled") ^ 1);
}

- (BOOL)isEqual:(id)a3
{
  PRPosterLockPosterHomeScreenAppearance *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  v4 = (PRPosterLockPosterHomeScreenAppearance *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && BSEqualBools())
      v7 = BSEqualBools();
    else
      v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = 1;
  if (self->_legibilityBlurEnabled)
    v2 = 2;
  v3 = 20;
  if (!self->_allowsModifyingLegibilityBlur)
    v3 = 10;
  return v3 ^ v2;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterLockPosterHomeScreenAppearance *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __53__PRPosterLockPosterHomeScreenAppearance_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__PRPosterLockPosterHomeScreenAppearance_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterLockPosterHomeScreenAppearance isLegibilityBlurEnabled](self, "isLegibilityBlurEnabled"), CFSTR("legibilityBlurEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterLockPosterHomeScreenAppearance allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), CFSTR("allowsModifyingLegibilityBlur"));

}

- (PRPosterLockPosterHomeScreenAppearance)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  PRPosterLockPosterHomeScreenAppearance *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("legibilityBlurEnabled"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsModifyingLegibilityBlur")))
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsModifyingLegibilityBlur"));
  else
    v6 = 1;
  v7 = -[PRPosterLockPosterHomeScreenAppearance initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:](self, "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", v5, v6);

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterLockPosterHomeScreenAppearance isLegibilityBlurEnabled](self, "isLegibilityBlurEnabled"), CFSTR("legibilityBlurEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterLockPosterHomeScreenAppearance allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), CFSTR("allowsModifyingLegibilityBlur"));

}

- (PRPosterLockPosterHomeScreenAppearance)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  PRPosterLockPosterHomeScreenAppearance *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("legibilityBlurEnabled"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsModifyingLegibilityBlur")))
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsModifyingLegibilityBlur"));
  else
    v6 = 1;
  v7 = -[PRPosterLockPosterHomeScreenAppearance initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:](self, "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", v5, v6);

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterLockPosterHomeScreenAppearance isLegibilityBlurEnabled](self, "isLegibilityBlurEnabled"), CFSTR("legibilityBlurEnabled"));
  v5 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterLockPosterHomeScreenAppearance allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), CFSTR("allowsModifyingLegibilityBlur"));

}

- (BOOL)allowsModifyingLegibilityBlur
{
  return self->_allowsModifyingLegibilityBlur;
}

@end
