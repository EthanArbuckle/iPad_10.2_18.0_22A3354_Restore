@implementation PKMemoItem

- (PKMemoItem)initWithMemo:(id)a3 type:(unint64_t)a4
{
  id v7;
  PKMemoItem *v8;
  PKMemoItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMemoItem;
  v8 = -[PKMemoItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    objc_storeStrong((id *)&v8->_memo, a3);
  }

  return v9;
}

- (NSCopying)identifier
{
  uint64_t v2;
  unint64_t type;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D6A128];
  type = self->_type;
  if (type - 1 >= 3)
  {
    if (type)
      goto LABEL_3;
    if (self->_memo)
    {
      v6[0] = self->_memo;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKCombinedHash();

    }
  }
  v2 = PKIntegerHash();
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  return (NSCopying *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKPeerPaymentRecurringPaymentMemo)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
  objc_storeStrong((id *)&self->_memo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memo, 0);
}

@end
