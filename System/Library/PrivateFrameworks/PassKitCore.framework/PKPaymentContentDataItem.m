@implementation PKPaymentContentDataItem

+ (int64_t)dataType
{
  return 1;
}

+ (BOOL)supportsMultipleItems
{
  return 1;
}

- (PKPaymentContentDataItem)initWithContentItem:(id)a3
{
  id v5;
  PKPaymentContentDataItem *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentContentDataItem;
  v6 = -[PKPaymentContentDataItem init](&v8, sel_init);
  if (v6)
  {
    -[PKPaymentDataItem setType:](v6, "setType:", objc_msgSend((id)objc_opt_class(), "dataType"));
    -[PKPaymentDataItem setStatus:](v6, "setStatus:", 0);
    objc_storeStrong((id *)&v6->_contentItem, a3);
  }

  return v6;
}

- (int64_t)context
{
  return 3;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (PKPaymentContentItem)contentItem
{
  return self->_contentItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
