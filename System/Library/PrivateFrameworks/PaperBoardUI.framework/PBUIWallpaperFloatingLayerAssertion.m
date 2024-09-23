@implementation PBUIWallpaperFloatingLayerAssertion

- (id)initWithContainerView:(void *)a3 forReason:(void *)a4 invalidationBlock:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id *v15;
  void *v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a1)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithContainerView_forReason_invalidationBlock_, a1, CFSTR("PBUIWallpaperFloatingLayerAssertion.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationBlock"));

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__PBUIWallpaperFloatingLayerAssertion_initWithContainerView_forReason_invalidationBlock___block_invoke;
    v19[3] = &unk_1E6B963F8;
    v20 = v11;
    v12 = (void *)MEMORY[0x1BCCA5978](v19);
    v18.receiver = a1;
    v18.super_class = (Class)PBUIWallpaperFloatingLayerAssertion;
    v13 = (id *)objc_msgSendSuper2(&v18, sel_initWithIdentifier_forReason_invalidationBlock_, CFSTR("WallpaperFloatingLayer"), v9, v12);
    v14 = v13;
    if (v13)
      objc_storeStrong(v13 + 7, a2);
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __89__PBUIWallpaperFloatingLayerAssertion_initWithContainerView_forReason_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v9 = *(id *)(a1 + 32);
  v8 = v7;
  BSDispatchMain();

}

uint64_t __89__PBUIWallpaperFloatingLayerAssertion_initWithContainerView_forReason_invalidationBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)invalidate
{
  -[PBUIWallpaperFloatingLayerAssertion invalidateWithAnimationFactory:](self, "invalidateWithAnimationFactory:", 0);
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
  v6.super_class = (Class)PBUIWallpaperFloatingLayerAssertion;
  -[BSSimpleAssertion invalidate](&v6, sel_invalidate);
}

- (void)dealloc
{
  objc_super v3;

  -[PBUIWallpaperFloatingLayerAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperFloatingLayerAssertion;
  -[BSSimpleAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperFloatingLayerAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperFloatingLayerAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[PBUIWallpaperFloatingLayerAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[PBUIWallpaperFloatingLayerAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_containerView, CFSTR("ContainerView"));
  return v4;
}

- (uint64_t)containerView
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_invalidationAnimationFactory, 0);
}

@end
