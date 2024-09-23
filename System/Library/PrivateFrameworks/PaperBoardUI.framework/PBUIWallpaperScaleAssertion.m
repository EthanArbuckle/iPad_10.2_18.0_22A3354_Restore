@implementation PBUIWallpaperScaleAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationAnimationFactory, 0);
}

void __81__PBUIWallpaperScaleAssertion_initWithVariant_scale_forReason_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (uint64_t)variant
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (double)scale
{
  if (a1)
    return *(double *)(a1 + 64);
  else
    return 0.0;
}

- (double)initWithVariant:(void *)a3 scale:(void *)a4 forReason:(double)a5 invalidationBlock:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double *v13;
  double *v14;
  void *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a1)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithVariant_scale_forReason_invalidationBlock_, a1, CFSTR("PBUIWallpaperScaleAssertion.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationBlock"));

    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__PBUIWallpaperScaleAssertion_initWithVariant_scale_forReason_invalidationBlock___block_invoke;
    v18[3] = &unk_1E6B963F8;
    v19 = v11;
    v12 = (void *)MEMORY[0x1BCCA5978](v18);
    v17.receiver = a1;
    v17.super_class = (Class)PBUIWallpaperScaleAssertion;
    v13 = (double *)objc_msgSendSuper2(&v17, sel_initWithIdentifier_forReason_invalidationBlock_, CFSTR("WallpaperScale"), v9, v12);
    if (v13)
    {
      *((_QWORD *)v13 + 7) = a2;
      v13[8] = a5;
    }
    v14 = v13;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[PBUIWallpaperScaleAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperScaleAssertion;
  -[BSSimpleAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[PBUIWallpaperScaleAssertion invalidateWithAnimationFactory:](self, "invalidateWithAnimationFactory:", 0);
}

- (void)invalidateWithAnimationFactory:(id)a3
{
  BSUIAnimationFactory *v4;
  BSUIAnimationFactory *invalidationAnimationFactory;
  objc_super v6;

  v4 = (BSUIAnimationFactory *)objc_msgSend(a3, "copy");
  invalidationAnimationFactory = self->_invalidationAnimationFactory;
  self->_invalidationAnimationFactory = v4;

  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperScaleAssertion;
  -[BSSimpleAssertion invalidate](&v6, sel_invalidate);
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperScaleAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperScaleAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperScaleAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  double scale;
  id v7;
  void *v9;

  -[PBUIWallpaperScaleAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    PBUIStringForWallpaperVariant(self->_variant);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v5, CFSTR("variant"));

    scale = self->_scale;
  }
  else
  {
    PBUIStringForWallpaperVariant(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v9, CFSTR("variant"));

    scale = 0.0;
  }
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("scale"), scale);
  return v4;
}

@end
