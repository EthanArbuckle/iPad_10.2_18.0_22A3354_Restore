@implementation PKProductSearchResult

- (PKProductSearchResult)initWithListItem:(id)a3 searchDistance:(double)a4
{
  id v7;
  PKProductSearchResult *v8;
  PKProductSearchResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKProductSearchResult;
  v8 = -[PKProductSearchResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_listItem, a3);
    v9->_searchDistance = a4;
  }

  return v9;
}

- (PKPaymentSetupProductsSectionListItem)listItem
{
  return self->_listItem;
}

- (double)searchDistance
{
  return self->_searchDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItem, 0);
}

@end
