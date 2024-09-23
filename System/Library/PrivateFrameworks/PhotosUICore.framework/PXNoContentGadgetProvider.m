@implementation PXNoContentGadgetProvider

- (PXNoContentGadgetProvider)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4
{
  id v7;
  id v8;
  PXNoContentGadgetProvider *v9;
  PXNoContentGadgetProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXNoContentGadgetProvider;
  v9 = -[PXGadgetProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedTitle, a3);
    objc_storeStrong((id *)&v10->_localizedMessage, a4);
  }

  return v10;
}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)generateGadgets
{
  void *v3;
  PXNoContentGadget *v4;
  void *v5;
  void *v6;
  PXNoContentGadget *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PXNoContentGadgetProvider noContentGadgets](self, "noContentGadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [PXNoContentGadget alloc];
    -[PXNoContentGadgetProvider localizedTitle](self, "localizedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNoContentGadgetProvider localizedMessage](self, "localizedMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXNoContentGadget initWithLocalizedTitle:localizedMessage:](v4, "initWithLocalizedTitle:localizedMessage:", v5, v6);

    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNoContentGadgetProvider setNoContentGadgets:](self, "setNoContentGadgets:", v8);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__PXNoContentGadgetProvider_generateGadgets__block_invoke;
    v9[3] = &unk_1E5145360;
    v9[4] = self;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v9);

  }
}

- (NSArray)noContentGadgets
{
  return self->_noContentGadgets;
}

- (void)setNoContentGadgets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_noContentGadgets, 0);
}

void __44__PXNoContentGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "noContentGadgets");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4);

}

@end
