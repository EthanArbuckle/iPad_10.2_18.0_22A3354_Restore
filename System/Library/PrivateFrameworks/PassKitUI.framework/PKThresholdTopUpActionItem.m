@implementation PKThresholdTopUpActionItem

- (PKThresholdTopUpActionItem)initWithIdentifier:(id)a3
{
  id v5;
  PKThresholdTopUpActionItem *v6;
  PKThresholdTopUpActionItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKThresholdTopUpActionItem;
  v6 = -[PKThresholdTopUpActionItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
