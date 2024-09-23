@implementation SBDisplayItemGridLayoutRestrictionInfo

+ (id)layoutRestrictionInfoWithLayoutRestrictions:(unint64_t)a3 restrictedSize:(CGSize)a4
{
  id v5;
  void *v9;
  _QWORD block[5];

  if (a3)
  {
    v5 = (id)objc_msgSend(objc_alloc((Class)a1), "_initWithLayoutRestrictions:restrictedSize:", a3, a4.width, a4.height);
  }
  else
  {
    if (a4.width != -1.0 || a4.height != -1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDisplayItemGridLayoutRestrictionInfo.m"), 48, CFSTR("invalid layout restriction initialization"));

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__SBDisplayItemGridLayoutRestrictionInfo_layoutRestrictionInfoWithLayoutRestrictions_restrictedSize___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__onceToken != -1)
      dispatch_once(&layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__onceToken, block);
    v5 = (id)layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__sSharedUnrestrictedInfo;
  }
  return v5;
}

void __101__SBDisplayItemGridLayoutRestrictionInfo_layoutRestrictionInfoWithLayoutRestrictions_restrictedSize___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithLayoutRestrictions:restrictedSize:", 0, -1.0, -1.0);
  v2 = (void *)layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__sSharedUnrestrictedInfo;
  layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__sSharedUnrestrictedInfo = v1;

}

- (id)_initWithLayoutRestrictions:(unint64_t)a3 restrictedSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  SBDisplayItemGridLayoutRestrictionInfo *v7;
  SBDisplayItemGridLayoutRestrictionInfo *v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  v13.receiver = self;
  v13.super_class = (Class)SBDisplayItemGridLayoutRestrictionInfo;
  v7 = -[SBDisplayItemGridLayoutRestrictionInfo init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_layoutRestrictions = a3;
    v7->_restrictedSize.width = width;
    v7->_restrictedSize.height = height;
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "appendUnsignedInteger:", v8->_layoutRestrictions);
    v11 = (id)objc_msgSend(v9, "appendCGSize:", v8->_restrictedSize.width, v8->_restrictedSize.height);
    v8->_cachedHash = objc_msgSend(v9, "hash");

  }
  return v8;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_layoutRestrictions == *((_QWORD *)v4 + 2)
    && self->_restrictedSize.height == v4[4]
    && self->_restrictedSize.width == v4[3];

  return v5;
}

- (id)description
{
  return -[SBDisplayItemGridLayoutRestrictionInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDisplayItemGridLayoutRestrictionInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  CGFloat width;
  double height;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  width = self->_restrictedSize.width;
  height = self->_restrictedSize.height;
  if (width != -1.0 || height != -1.0)
  {
    NSStringFromCGSize(*(CGSize *)&width);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v7, CFSTR("restrictedSize"));

  }
  SBDisplayItemGridLayoutRestrictionsDescription(self->_layoutRestrictions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("restrictions"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDisplayItemGridLayoutRestrictionInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)layoutRestrictions
{
  return self->_layoutRestrictions;
}

- (CGSize)restrictedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_restrictedSize.width;
  height = self->_restrictedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
