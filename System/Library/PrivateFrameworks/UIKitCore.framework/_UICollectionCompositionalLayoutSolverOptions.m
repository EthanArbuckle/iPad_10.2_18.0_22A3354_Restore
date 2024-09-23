@implementation _UICollectionCompositionalLayoutSolverOptions

- (void)setLayoutAttributesClass:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

+ (id)defaultOptions
{
  id *v0;
  id *v1;
  void *v2;
  void *v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;

  v0 = (id *)objc_alloc_init((Class)objc_opt_self());
  v1 = v0;
  if (v0)
  {
    v0[2] = 0;
    v2 = (void *)objc_opt_class();
    objc_storeStrong(v1 + 3, v2);
    v3 = (void *)objc_opt_class();
    objc_storeStrong(v1 + 4, v3);
    *((_WORD *)v1 + 4) = 256;
    objc_setProperty_nonatomic_copy(v1, v4, 0, 40);
    objc_setProperty_nonatomic_copy(v1, v5, MEMORY[0x1E0C9AA60], 48);
    objc_setProperty_nonatomic_copy(v1, v6, 0, 56);
    objc_setProperty_nonatomic_copy(v1, v7, 0, 64);
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_traitCollectionSourceProvider, 0);
  objc_storeStrong(&self->_sectionSolveErrorHandler, 0);
  objc_storeStrong(&self->_decorationRegistrationHandler, 0);
  objc_storeStrong((id *)&self->_globalSupplementaryItems, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_invalidationContextClass, 0);
  objc_storeStrong((id *)&self->_layoutAttributesClass, 0);
}

@end
