@implementation _PKDashboardItemWrapper

- (_PKDashboardItemWrapper)initWithDashboardItem:(id)a3
{
  id v5;
  _PKDashboardItemWrapper *v6;
  _PKDashboardItemWrapper *v7;
  void *v8;
  uint64_t v9;
  NSCopying *identifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PKDashboardItemWrapper;
  v6 = -[_PKDashboardItemWrapper init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wrappedItem, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSCopying *)v9;

  }
  return v7;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (PKDashboardItem)wrappedItem
{
  return self->_wrappedItem;
}

- (void)setWrappedItem:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
