@implementation TwoLinesSharedTripSummaryOutlineCellModel

- (id)homeDragAndDropObject
{
  return 0;
}

- (TwoLinesSharedTripSummaryOutlineCellModel)initWithSharedTripSummary:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5
{
  id v9;
  id v10;
  id v11;
  TwoLinesSharedTripSummaryOutlineCellModel *v12;
  TwoLinesSharedTripSummaryOutlineCellModel *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100BFEAD0;
  v16[3] = &unk_1011E8FE8;
  objc_copyWeak(&v17, &location);
  v15.receiver = self;
  v15.super_class = (Class)TwoLinesSharedTripSummaryOutlineCellModel;
  v12 = -[TwoLinesBasicOutlineCellModel initWithBackgroundModel:contentModelBlock:](&v15, "initWithBackgroundModel:contentModelBlock:", v11, v16);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sharedTripSummary, a3);
    objc_storeStrong((id *)&v13->_accessoryModels, a4);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

- (unint64_t)hash
{
  return (unint64_t)-[SharedTripSummary hash](self->_sharedTripSummary, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesSharedTripSummaryOutlineCellModel *v4;
  TwoLinesSharedTripSummaryOutlineCellModel *v5;
  uint64_t v6;
  TwoLinesSharedTripSummaryOutlineCellModel *v7;
  SharedTripSummary *v8;
  SharedTripSummary *v9;
  NSArray *v10;
  NSArray *v11;
  unsigned __int8 v12;
  objc_super v14;

  v4 = (TwoLinesSharedTripSummaryOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v14.receiver = self;
    v14.super_class = (Class)TwoLinesSharedTripSummaryOutlineCellModel;
    if (-[TwoLinesBasicOutlineCellModel isEqual:](&v14, "isEqual:", v7))
    {
      v8 = (SharedTripSummary *)objc_claimAutoreleasedReturnValue(-[TwoLinesSharedTripSummaryOutlineCellModel sharedTripSummary](v7, "sharedTripSummary"));
      v9 = v8;
      if (v8 == self->_sharedTripSummary || -[SharedTripSummary isEqual:](v8, "isEqual:"))
      {
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TwoLinesSharedTripSummaryOutlineCellModel accessoryModels](v7, "accessoryModels"));
        v11 = v10;
        if (v10 == self->_accessoryModels)
          v12 = 1;
        else
          v12 = -[NSArray isEqual:](v10, "isEqual:");

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)accessoryModels
{
  return self->_accessoryModels;
}

- (SharedTripSummary)sharedTripSummary
{
  return self->_sharedTripSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTripSummary, 0);
  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end
