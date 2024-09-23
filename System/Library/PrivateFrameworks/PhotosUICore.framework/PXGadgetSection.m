@implementation PXGadgetSection

- (PXGadgetSection)initWithIdentifier:(id)a3 gadgets:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXGadgetSection *v11;
  PXGadgetSection *v12;
  PXGadgetSectionHeader *v13;
  PXGadgetSectionHeader *sectionHeader;
  PXGadgetSectionHeader *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSection.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSection.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgets"));

LABEL_3:
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSection.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgets.count > 0"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PXGadgetSection;
  v11 = -[PXGadgetSection init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_gadgets, a4);
    v13 = objc_alloc_init(PXGadgetSectionHeader);
    sectionHeader = v12->_sectionHeader;
    v12->_sectionHeader = v13;

    v15 = v12->_sectionHeader;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetSectionHeader performChangesWithGadget:additionalChanges:](v15, "performChangesWithGadget:additionalChanges:", v16, 0);

  }
  return v12;
}

- (PXGadgetSection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSection.m"), 33, CFSTR("%s is not available as initializer"), "-[PXGadgetSection init]");

  abort();
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;
  PXGadgetSpec *v7;
  BOOL v8;
  void *v9;
  _QWORD v10[4];
  PXGadgetSpec *v11;

  v5 = (PXGadgetSpec *)a3;
  v6 = self->_gadgetSpec;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXGadgetSpec isEqual:](v6, "isEqual:", v5);

    if (!v8)
    {
      objc_storeStrong((id *)&self->_gadgetSpec, a3);
      -[PXGadgetSection sectionHeader](self, "sectionHeader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __33__PXGadgetSection_setGadgetSpec___block_invoke;
      v10[3] = &unk_1E51265D0;
      v11 = v5;
      objc_msgSend(v9, "performChanges:", v10);

    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, identifier:%@, gadgets:%lu>"), objc_opt_class(), self, self->_identifier, -[NSArray count](self->_gadgets, "count"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)gadgets
{
  return self->_gadgets;
}

- (PXGadgetSectionHeader)sectionHeader
{
  return self->_sectionHeader;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_gadgets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __33__PXGadgetSection_setGadgetSpec___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGadgetSpec:", *(_QWORD *)(a1 + 32));
}

@end
