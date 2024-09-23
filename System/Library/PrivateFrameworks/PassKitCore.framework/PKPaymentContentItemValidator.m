@implementation PKPaymentContentItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContentItem:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKPaymentContentItemValidator)initWithContentItem:(id)a3
{
  id v5;
  PKPaymentContentItemValidator *v6;
  PKPaymentContentItemValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentContentItemValidator;
  v6 = -[PKPaymentContentItemValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPaymentContentItemValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  _BOOL4 v7;
  void *item;
  uint64_t v9;
  PKPaymentContentItem *v10;
  uint64_t v11;
  char v12;
  PKPaymentContentItem *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = -[PKPaymentContentItem isCentered](self->_item, "isCentered");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  item = self->_item;
  v9 = objc_opt_class();
  if (!_PKPaymentValidateProperty(item, CFSTR("label"), v9, !v7, a3, (uint64_t)a4))
    goto LABEL_9;
  v10 = self->_item;
  v11 = objc_opt_class();
  if (!v7)
  {
    if (_PKPaymentValidateProperty(v10, CFSTR("title"), v11, 1, a3, (uint64_t)a4))
      goto LABEL_7;
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  -[PKPaymentContentItem label](self->_item, "label");
  item = (void *)objc_claimAutoreleasedReturnValue();
  if ((_PKPaymentValidateProperty(v10, CFSTR("title"), v11, item == 0, a3, (uint64_t)a4) & 1) == 0)
  {
    v12 = 0;
LABEL_8:

    goto LABEL_10;
  }
LABEL_7:
  v13 = self->_item;
  v14 = objc_opt_class();
  v12 = _PKPaymentValidateProperty(v13, CFSTR("imageRequest"), v14, 0, a3, (uint64_t)a4);
  if (v7)
    goto LABEL_8;
LABEL_10:
  if (a4 && (v12 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("%@ has an invalid property");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (PKPaymentContentItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
