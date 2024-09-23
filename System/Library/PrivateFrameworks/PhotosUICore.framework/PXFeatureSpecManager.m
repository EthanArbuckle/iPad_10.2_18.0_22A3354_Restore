@implementation PXFeatureSpecManager

- (PXFeatureSpec)spec
{
  PXFeatureSpec *spec;
  PXFeatureSpec *v4;
  PXFeatureSpec *v5;

  spec = self->_spec;
  if (!spec)
  {
    -[PXFeatureSpecManager createSpec](self, "createSpec");
    v4 = (PXFeatureSpec *)objc_claimAutoreleasedReturnValue();
    v5 = self->_spec;
    self->_spec = v4;

    spec = self->_spec;
  }
  return spec;
}

void __35__PXFeatureSpecManager__updateSpec__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "createSpec");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setSpec:", v2);

}

- (void)_setSpec:(id)a3
{
  PXFeatureSpec *v5;
  char v6;
  PXFeatureSpec *v7;

  v7 = (PXFeatureSpec *)a3;
  v5 = self->_spec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXFeatureSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      -[PXFeatureSpecManager signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext_199292 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeatureSpecManager.m"), 103, CFSTR("unexpectd context"));

    abort();
  }
  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXFeatureSpecManager shouldUpdateSpecForExtendedTraitCollection:change:](self, "shouldUpdateSpecForExtendedTraitCollection:change:", v9, a4);

  if (v10)
    -[PXFeatureSpecManager _updateSpec](self, "_updateSpec");

}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)_updateSpec
{
  _QWORD v3[5];

  kdebug_trace();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PXFeatureSpecManager__updateSpec__block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXFeatureSpecManager performChanges:](self, "performChanges:", v3);
  kdebug_trace();
}

- (void)invalidateSpec
{
  if (self->_spec)
    -[PXFeatureSpecManager _updateSpec](self, "_updateSpec");
}

- (PXFeatureSpecManager)initWithExtendedTraitCollection:(id)a3
{
  return -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](self, "initWithExtendedTraitCollection:options:", a3, 0);
}

- (PXFeatureSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v7;
  PXFeatureSpecManager *v8;
  PXFeatureSpecManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFeatureSpecManager;
  v8 = -[PXFeatureSpecManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_options = a4;
    objc_storeStrong((id *)&v8->_extendedTraitCollection, a3);
    -[PXExtendedTraitCollection registerChangeObserver:context:](v9->_extendedTraitCollection, "registerChangeObserver:context:", v9, PXExtendedTraitCollectionObservationContext_199292);
  }

  return v9;
}

- (PXFeatureSpecManager)init
{
  return -[PXFeatureSpecManager initWithExtendedTraitCollection:](self, "initWithExtendedTraitCollection:", 0);
}

- (unint64_t)defaultChangesToUpdateFor
{
  return 863;
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  return (-[PXFeatureSpecManager defaultChangesToUpdateFor](self, "defaultChangesToUpdateFor", a3) & a4) != 0;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (id)createSpec
{
  void *v3;
  void *v4;

  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(-[PXFeatureSpecManager specClass](self, "specClass")), "initWithExtendedTraitCollection:options:", v3, -[PXFeatureSpecManager options](self, "options"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
