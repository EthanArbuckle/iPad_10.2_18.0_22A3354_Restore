@implementation PGGraphIngestBusinessItemContainer

- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 visit:(id)a4 dateInterval:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGGraphIngestBusinessItemContainer *v12;
  PGGraphIngestBusinessItemContainer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphIngestBusinessItemContainer;
  v12 = -[PGGraphIngestBusinessItemContainer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_businessItem, a3);
    objc_storeStrong((id *)&v13->_visit, a4);
    objc_storeStrong((id *)&v13->_dateInterval, a5);
  }

  return v13;
}

- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 visit:(id)a4
{
  return -[PGGraphIngestBusinessItemContainer initWithBusinessItem:visit:dateInterval:](self, "initWithBusinessItem:visit:dateInterval:", a3, a4, 0);
}

- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 dateInterval:(id)a4
{
  return -[PGGraphIngestBusinessItemContainer initWithBusinessItem:visit:dateInterval:](self, "initWithBusinessItem:visit:dateInterval:", a3, 0, a4);
}

- (void)updateBusinessItem:(id)a3
{
  CLSBusinessItem *v5;
  CLSBusinessItem **p_businessItem;
  CLSBusinessItem *businessItem;
  CLSBusinessItem *v8;

  v5 = (CLSBusinessItem *)a3;
  businessItem = self->_businessItem;
  p_businessItem = &self->_businessItem;
  if (businessItem != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_businessItem, a3);
    v5 = v8;
  }

}

- (NSString)name
{
  return (NSString *)-[CLSBusinessItem name](self->_businessItem, "name");
}

- (unint64_t)muid
{
  return -[CLSBusinessItem muid](self->_businessItem, "muid");
}

- (NSArray)businessCategories
{
  return (NSArray *)-[CLSBusinessItem businessCategories](self->_businessItem, "businessCategories");
}

- (NSDateInterval)dateInterval
{
  void *dateInterval;
  void *v4;
  NSDateInterval *v5;

  -[CLSLocationOfInterestVisit visitInterval](self->_visit, "visitInterval");
  dateInterval = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dateInterval;
  if (!dateInterval)
    dateInterval = self->_dateInterval;
  v5 = dateInterval;

  return v5;
}

- (BOOL)hasRoutineVisit
{
  return self->_visit != 0;
}

- (double)routineVisitConfidence
{
  double result;

  -[CLSLocationOfInterestVisit confidence](self->_visit, "confidence");
  return result;
}

- (int64_t)venueCapacity
{
  return -[CLSBusinessItem venueCapacity](self->_businessItem, "venueCapacity");
}

- (CLCircularRegion)region
{
  return (CLCircularRegion *)-[CLSBusinessItem region](self->_businessItem, "region");
}

- (CLSBusinessItem)businessItem
{
  return self->_businessItem;
}

- (CLSLocationOfInterestVisit)visit
{
  return self->_visit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_visit, 0);
  objc_storeStrong((id *)&self->_businessItem, 0);
}

@end
