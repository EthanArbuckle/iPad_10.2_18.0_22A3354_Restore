@implementation PXBarSpec

- (PXBarSpec)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBarSpec.m"), 61, CFSTR("%@ not supported"), v5);

  abort();
}

- (PXBarSpec)initWithExtendedTraitCollection:(id)a3
{
  id v5;
  PXBarSpec *v6;
  PXBarSpec *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBarSpec;
  v6 = -[PXBarSpec init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_extendedTraitCollection, a3);

  return v7;
}

- (id)sortedBarItemsByPlacement:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBarSpec.m"), 73, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBarSpec sortedBarItemsByPlacement:]", v8);

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

@end
