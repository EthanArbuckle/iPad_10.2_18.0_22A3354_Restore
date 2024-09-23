@implementation PXGadgetNavigationItem

- (PXGadgetNavigationItem)initWithGadetType:(unint64_t)a3 navigationBlock:(id)a4 animated:(BOOL)a5
{
  id v8;
  PXGadgetNavigationItem *v9;
  PXGadgetNavigationItem *v10;
  uint64_t v11;
  id navigationBlock;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGadgetNavigationItem;
  v9 = -[PXGadgetNavigationItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_navigationType = 0;
    v11 = objc_msgSend(v8, "copy");
    navigationBlock = v10->_navigationBlock;
    v10->_navigationBlock = (id)v11;

    v10->_gadgetType = a3;
    v10->_animated = a5;
  }

  return v10;
}

- (PXGadgetNavigationItem)initWithGadgetId:(id)a3 navigationBlock:(id)a4 animated:(BOOL)a5
{
  id v10;
  id v11;
  PXGadgetNavigationItem *v12;
  PXGadgetNavigationItem *v13;
  uint64_t v14;
  id navigationBlock;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetNavigationHelper.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgetId"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXGadgetNavigationItem;
  v12 = -[PXGadgetNavigationItem init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_navigationType = 1;
    v14 = objc_msgSend(v11, "copy");
    navigationBlock = v13->_navigationBlock;
    v13->_navigationBlock = (id)v14;

    objc_storeStrong((id *)&v13->_gadgetId, a3);
    v13->_animated = a5;
  }

  return v13;
}

- (PXGadgetNavigationItem)initWithGadget:(id)a3 navigationBlock:(id)a4 animated:(BOOL)a5
{
  id v10;
  id v11;
  PXGadgetNavigationItem *v12;
  PXGadgetNavigationItem *v13;
  uint64_t v14;
  id navigationBlock;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetNavigationHelper.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadget"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXGadgetNavigationItem;
  v12 = -[PXGadgetNavigationItem init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_navigationType = 2;
    v14 = objc_msgSend(v11, "copy");
    navigationBlock = v13->_navigationBlock;
    v13->_navigationBlock = (id)v14;

    objc_storeStrong((id *)&v13->_gadget, a3);
    v13->_animated = a5;
  }

  return v13;
}

- (unint64_t)gadgetType
{
  void *v5;

  if (self->_navigationType)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetNavigationHelper.m"), 321, CFSTR("Should only ask for gadgetType when navigationType is PXGadgetNavigationTypeGadgetType"));

    abort();
  }
  return self->_gadgetType;
}

- (NSString)gadgetId
{
  void *v5;

  if (self->_navigationType != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetNavigationHelper.m"), 328, CFSTR("Should only ask for gadgetId when navigationType is PXGadgetNavigationTypeGadgetId"));

    abort();
  }
  return self->_gadgetId;
}

- (PXGadget)gadget
{
  void *v5;

  if (self->_navigationType != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetNavigationHelper.m"), 335, CFSTR("Should only ask for gadget when navigationType is PXGadgetNavigationTypeGadget"));

    abort();
  }
  return self->_gadget;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (id)navigationBlock
{
  return self->_navigationBlock;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationBlock, 0);
  objc_storeStrong((id *)&self->_gadget, 0);
  objc_storeStrong((id *)&self->_gadgetId, 0);
}

@end
