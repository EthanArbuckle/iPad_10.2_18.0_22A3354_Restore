@implementation PXActivityCoordinatorRecord

- (PXActivityCoordinatorRecord)initWithItem:(id)a3
{
  id v4;
  PXActivityCoordinatorRecord *v5;
  PXActivityCoordinatorRecord *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXActivityCoordinatorRecord;
  v5 = -[PXActivityCoordinatorRecord init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_item, v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "item");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    v7 = v5 == WeakRetained;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  v3 = objc_msgSend(WeakRetained, "hash");

  return v3;
}

- (PXActivityCoordinatorItem)item
{
  return (PXActivityCoordinatorItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
}

@end
