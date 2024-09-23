@implementation PXSearchZeroKeywordGadgetProvider

- (PXSearchZeroKeywordGadgetProvider)initWithZeroKeywordDataSource:(id)a3 sectionType:(int64_t)a4
{
  id v8;
  void *v9;
  PXSearchZeroKeywordGadgetProvider *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchZeroKeywordGadgetProvider.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zeroKeywordDataSource"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), objc_opt_class(), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PXSearchZeroKeywordGadgetProvider;
  v10 = -[PXGadgetProvider initWithIdentifier:](&v13, sel_initWithIdentifier_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_zeroKeywordDataSource, a3);
    v10->_sectionType = a4;
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
  uint64_t v4;
  void *v5;
  uint64_t v6;
  PXSearchZeroKeywordGadget *v7;
  PXSearchZeroKeywordGadget *v8;
  _QWORD v9[4];
  PXSearchZeroKeywordGadget *v10;

  -[PXSearchZeroKeywordGadgetProvider zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sectionForSectionType:", self->_sectionType);
  -[PXGadgetProvider gadgets](self, "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
      -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_137054);
  }
  else if (!v6)
  {
    v7 = -[PXSearchZeroKeywordGadget initWithDataSource:dataSourceSection:sectionType:]([PXSearchZeroKeywordGadget alloc], "initWithDataSource:dataSourceSection:sectionType:", v3, objc_msgSend(v3, "sectionForSectionType:", self->_sectionType), self->_sectionType);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__PXSearchZeroKeywordGadgetProvider_generateGadgets__block_invoke;
    v9[3] = &unk_1E5145360;
    v10 = v7;
    v8 = v7;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v9);

  }
}

- (id)visibleIndexPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXGadgetProvider gadgets](self, "gadgets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForVisibleItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (PXSearchZeroKeywordDataSource)zeroKeywordDataSource
{
  return self->_zeroKeywordDataSource;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroKeywordDataSource, 0);
}

void __52__PXSearchZeroKeywordGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

uint64_t __52__PXSearchZeroKeywordGadgetProvider_generateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

@end
