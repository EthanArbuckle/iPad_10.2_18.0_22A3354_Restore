@implementation PLExistingMomentData

- (PLExistingMomentData)initWithMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PLExistingMomentData *v8;
  PLExistingMomentData *v9;
  PLExistingMomentData *v10;
  uint64_t v11;
  NSDateInterval *dateInterval;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "uniqueObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v5 && v6 && v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)PLExistingMomentData;
    v9 = -[PLExistingMomentData init](&v14, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_objectID, v5);
      objc_storeStrong((id *)&v10->_startDate, v6);
      objc_storeStrong((id *)&v10->_endDate, v7);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10->_startDate, v10->_endDate);
      dateInterval = v10->_dateInterval;
      v10->_dateInterval = (NSDateInterval *)v11;

    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (void)registerAsset:(id)a3
{
  ++self->_numberOfAssets;
}

- (unint64_t)hash
{
  return -[NSCopying hash](self->_objectID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PLExistingMomentData *v4;
  NSCopying *objectID;
  void *v6;
  char v7;

  v4 = (PLExistingMomentData *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objectID = self->_objectID;
      -[PLExistingMomentData objectID](v4, "objectID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSCopying isEqual:](objectID, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSCopying)objectID
{
  return self->_objectID;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
