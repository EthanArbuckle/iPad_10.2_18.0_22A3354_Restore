@implementation PKPayLaterFinancingPlanRow

- (PKPayLaterFinancingPlanRow)initWithFinancingPlan:(id)a3 rowIndex:(int64_t)a4 selectionHandler:(id)a5
{
  id v9;
  id v10;
  PKPayLaterFinancingPlanRow *v11;
  PKPayLaterFinancingPlanRow *v12;
  uint64_t v13;
  id selectionHandler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlanRow;
  v11 = -[PKPayLaterFinancingPlanRow init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_financingPlan, a3);
    v12->_rowIndex = a4;
    v13 = objc_msgSend(v10, "copy");
    selectionHandler = v12->_selectionHandler;
    v12->_selectionHandler = (id)v13;

  }
  return v12;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  PKPayLaterFinancingPlan *financingPlan;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  financingPlan = self->_financingPlan;
  if (financingPlan)
  {
    -[PKPayLaterFinancingPlan planIdentifier](financingPlan, "planIdentifier");
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
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  int64_t rowIndex;
  id v7;
  id v8;

  v8 = a3;
  -[PKPayLaterFinancingPlanRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    context = self->_context;
    financingPlan = self->_financingPlan;
    rowIndex = self->_rowIndex;
    v7 = v8;
    objc_msgSend(v7, "setFinancingPlan:context:rowIndex:", financingPlan, context, rowIndex);
    objc_msgSend(v7, "setIcon:animated:", self->_icon, 0);
    objc_msgSend(v7, "setMaskType:", self->_maskType);
    objc_msgSend(v7, "setShowSpinner:", self->_showSpinner);

  }
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_financingPlan);
  objc_msgSend(v3, "safelyAddObject:", self->_icon);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_tertiaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_amountText);
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlanRow *v4;
  PKPayLaterFinancingPlanRow *v5;
  const void **v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSString *v13;

  v4 = (PKPayLaterFinancingPlanRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (!PKEqualObjects() || !PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
        v7 = (void *)v6[6];
        v8 = self->_tertiaryText;
        v9 = v7;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_27;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_28;
        }
        v12 = (void *)v6[7];
        v8 = self->_amountText;
        v13 = v12;
        if (v8 == v13)
        {

LABEL_21:
          v8 = (NSString *)_Block_copy(self->_selectionHandler);
          v10 = _Block_copy(v6[3]);
          LOBYTE(v11) = PKEqualObjects()
                     && (const void *)self->_context == v6[8]
                     && self->_showSpinner == *((unsigned __int8 *)v6 + 32)
                     && (const void *)self->_rowIndex == v6[2]
                     && self->_maskType == (_QWORD)v6[9];
          goto LABEL_27;
        }
        v10 = v13;
        LOBYTE(v11) = 0;
        if (v8 && v13)
        {
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

          if (!v11)
            goto LABEL_28;
          goto LABEL_21;
        }
LABEL_27:

        goto LABEL_28;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_29:

  return v11;
}

- (void)handleCellSelectionWithContinueBlock:(id)a3
{
  void (**selectionHandler)(id, id);

  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2](selectionHandler, a3);
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (void)setTertiaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)amountText
{
  return self->_amountText;
}

- (void)setAmountText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unint64_t)maskType
{
  return self->_maskType;
}

- (void)setMaskType:(unint64_t)a3
{
  self->_maskType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
