@implementation PXPeopleMetricsActionQueueItem

- (PXPeopleMetricsActionQueueItem)initWithItemType:(int64_t)a3 andPerson:(id)a4
{
  id v7;
  PXPeopleMetricsActionQueueItem *v8;
  PXPeopleMetricsActionQueueItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleMetricsActionQueueItem;
  v8 = -[PXPeopleMetricsActionQueueItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_itemType = a3;
    objc_storeStrong((id *)&v8->_person, a4);
  }

  return v9;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (PXPersonItem)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

@end
