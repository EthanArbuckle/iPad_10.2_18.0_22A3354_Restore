@implementation PXGadgetSpecManager

- (PXGadgetSpecManager)initWithGadgetSpecClass:(Class)a3 scrollAxis:(int64_t)a4 traitCollection:(id)a5
{
  id v9;
  PXGadgetSpecManager *v10;
  PXGadgetSpecManager *v11;
  uint64_t v12;
  PXGadgetSpec *currentGadgetSpec;
  uint64_t v14;
  NSHashTable *updatedGadgets;
  objc_super v17;

  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXGadgetSpecManager;
  v10 = -[PXGadgetSpecManager init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_gadgetSpecClass, a3);
    v11->_scrollAxis = a4;
    objc_storeStrong((id *)&v11->_traitCollection, a5);
    v12 = objc_msgSend([a3 alloc], "initWithTraitCollection:scrollAxis:", v9, a4);
    currentGadgetSpec = v11->_currentGadgetSpec;
    v11->_currentGadgetSpec = (PXGadgetSpec *)v12;

    objc_msgSend(v9, "registerChangeObserver:context:", v11, PXExtendedTraitCollectionObservationContext);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    updatedGadgets = v11->_updatedGadgets;
    v11->_updatedGadgets = (NSHashTable *)v14;

  }
  return v11;
}

- (void)setCurrentGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;

  v5 = (PXGadgetSpec *)a3;
  if (self->_currentGadgetSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentGadgetSpec, a3);
    -[PXGadgetSpecManager signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (void)updateGadgetDataSourceToSpecIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[PXGadgetSpecManager updatedGadgets](self, "updatedGadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSpecManager currentGadgetSpec](self, "currentGadgetSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke;
  v14[3] = &unk_1E5117798;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v4, "enumerateGadgetSectionsUsingBlock:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke_2;
  v11[3] = &unk_1E51177C0;
  v12 = v5;
  v13 = v8;
  v9 = v8;
  v10 = v5;
  objc_msgSend(v4, "enumerateGadgetsUsingBlock:", v11);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;

  v9 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext == a5)
  {
    v16 = v9;
    v10 = v9;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        -[PXGadgetSpecManager _extendedTraitCollection:didChange:](self, "_extendedTraitCollection:didChange:", v10, a4);

        v9 = v16;
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSpecManager.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v13, v15);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSpecManager.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v13);
    }

    goto LABEL_4;
  }
LABEL_5:

}

- (void)_extendedTraitCollection:(id)a3 didChange:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  -[PXGadgetSpecManager currentGadgetSpec](self, "currentGadgetSpec");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(-[PXGadgetSpecManager gadgetSpecClass](self, "gadgetSpecClass")), "initWithTraitCollection:scrollAxis:", v5, -[PXGadgetSpecManager scrollAxis](self, "scrollAxis"));

  v8 = v7;
  v9 = v6;
  if (v6 == v8)
    goto LABEL_4;
  v10 = objc_msgSend(v6, "isEqual:", v8);

  if ((v10 & 1) == 0)
  {
    -[PXGadgetSpecManager updatedGadgets](self, "updatedGadgets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");
LABEL_4:

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PXGadgetSpecManager__extendedTraitCollection_didChange___block_invoke;
  v12[3] = &unk_1E51177E8;
  v13 = v8;
  v11 = v8;
  -[PXGadgetSpecManager performChanges:](self, "performChanges:", v12);

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGadgetSpecManager;
  -[PXGadgetSpecManager performChanges:](&v3, sel_performChanges_, a3);
}

- (PXGadgetSpec)currentGadgetSpec
{
  return self->_currentGadgetSpec;
}

- (Class)gadgetSpecClass
{
  return self->_gadgetSpecClass;
}

- (int64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (NSHashTable)updatedGadgets
{
  return self->_updatedGadgets;
}

- (void)setUpdatedGadgets:(id)a3
{
  objc_storeStrong((id *)&self->_updatedGadgets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedGadgets, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_gadgetSpecClass, 0);
  objc_storeStrong((id *)&self->_currentGadgetSpec, 0);
}

uint64_t __58__PXGadgetSpecManager__extendedTraitCollection_didChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCurrentGadgetSpec:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGadgetSpec:", *(_QWORD *)(a1 + 32));
}

void __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(v3, "setGadgetSpec:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

@end
