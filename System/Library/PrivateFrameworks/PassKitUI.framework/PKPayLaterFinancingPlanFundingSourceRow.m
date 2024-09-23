@implementation PKPayLaterFinancingPlanFundingSourceRow

- (PKPayLaterFinancingPlanFundingSourceRow)initWithFinancingPlanFundingSource:(id)a3 selectionHandler:(id)a4
{
  id v7;
  id v8;
  PKPayLaterFinancingPlanFundingSourceRow *v9;
  PKPayLaterFinancingPlanFundingSourceRow *v10;
  uint64_t v11;
  id selectionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterFinancingPlanFundingSourceRow;
  v9 = -[PKPayLaterFinancingPlanFundingSourceRow init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fundingSource, a3);
    v11 = objc_msgSend(v8, "copy");
    selectionHandler = v10->_selectionHandler;
    v10->_selectionHandler = (id)v11;

  }
  return v10;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  PKPayLaterFinancingPlanFundingSource *fundingSource;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  fundingSource = self->_fundingSource;
  if (fundingSource)
  {
    -[PKPayLaterFinancingPlanFundingSource identifier](fundingSource, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterFinancingPlanFundingSourceRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self->_selectionHandler)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3568]);
      v9[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAccessories:", v8);

    }
    else
    {
      objc_msgSend(v5, "setAccessories:", 0);
    }
    objc_msgSend(v6, "setFundingSource:", self->_fundingSource);

  }
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_fundingSource);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlanFundingSourceRow *v4;
  PKPayLaterFinancingPlanFundingSourceRow *v5;
  const void **v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (PKPayLaterFinancingPlanFundingSourceRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
    {
      v7 = _Block_copy(self->_selectionHandler);
      v8 = _Block_copy(v6[2]);
      v9 = PKEqualObjects();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleCellSelection
{
  void (**selectionHandler)(void);

  selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2]();
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
}

@end
