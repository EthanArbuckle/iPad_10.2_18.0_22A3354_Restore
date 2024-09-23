@implementation BKTouchDestinationStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_touchIdentifiers, 0);
  objc_storeStrong((id *)&self->_pathIndexes, 0);
}

- (BKTouchDestinationStats)init
{
  BKTouchDestinationStats *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *pathIndexes;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *touchIdentifiers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKTouchDestinationStats;
  v2 = -[BKTouchDestinationStats init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    pathIndexes = v2->_pathIndexes;
    v2->_pathIndexes = v3;

    v5 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    touchIdentifiers = v2->_touchIdentifiers;
    v2->_touchIdentifiers = v5;

  }
  return v2;
}

- (NSMutableIndexSet)touchIdentifiers
{
  return self->_touchIdentifiers;
}

- (void)setProcessDescription:(id)a3
{
  objc_storeStrong((id *)&self->_processDescription, a3);
}

- (NSString)processDescription
{
  return self->_processDescription;
}

- (NSMutableIndexSet)pathIndexes
{
  return self->_pathIndexes;
}

- (void)setPathIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_pathIndexes, a3);
}

- (void)setTouchIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_touchIdentifiers, a3);
}

@end
