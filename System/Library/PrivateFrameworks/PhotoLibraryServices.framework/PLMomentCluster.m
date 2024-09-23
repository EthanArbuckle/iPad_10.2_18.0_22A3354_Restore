@implementation PLMomentCluster

- (PLMomentCluster)initWithMoments:(id)a3
{
  id v4;
  PLMomentCluster *v5;
  uint64_t v6;
  NSArray *moments;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *endDate;
  uint64_t v14;
  NSDate *localStartDate;
  uint64_t v16;
  NSDate *localEndDate;
  PLMomentCluster *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v21.receiver = self;
    v21.super_class = (Class)PLMomentCluster;
    v5 = -[PLMomentCluster init](&v21, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      moments = v5->_moments;
      v5->_moments = (NSArray *)v6;

      -[NSArray firstObject](v5->_moments, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](v5->_moments, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startDate");
      v10 = objc_claimAutoreleasedReturnValue();
      startDate = v5->_startDate;
      v5->_startDate = (NSDate *)v10;

      objc_msgSend(v9, "endDate");
      v12 = objc_claimAutoreleasedReturnValue();
      endDate = v5->_endDate;
      v5->_endDate = (NSDate *)v12;

      objc_msgSend(v8, "localStartDate");
      v14 = objc_claimAutoreleasedReturnValue();
      localStartDate = v5->_localStartDate;
      v5->_localStartDate = (NSDate *)v14;

      objc_msgSend(v9, "localEndDate");
      v16 = objc_claimAutoreleasedReturnValue();
      localEndDate = v5->_localEndDate;
      v5->_localEndDate = (NSDate *)v16;

    }
    self = v5;
    v18 = self;
  }
  else
  {
    PLMomentsGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Trying to initialize MomentCluster with 0 moments.", buf, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (PLMomentCluster)initWithMomentClusters:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PLMomentCluster *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "moments", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[PLMomentCluster initWithMoments:](self, "initWithMoments:", v5);
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSArray count](self->_moments, "count");
  v4 = -[NSDate hash](self->_startDate, "hash") ^ v3;
  return v4 ^ -[NSDate hash](self->_endDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PLMomentCluster *v4;
  NSDate *startDate;
  void *v6;
  NSDate *endDate;
  void *v8;
  NSUInteger v9;
  void *v10;
  BOOL v11;

  v4 = (PLMomentCluster *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      startDate = self->_startDate;
      -[PLMomentCluster startDate](v4, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDate isEqual:](startDate, "isEqual:", v6))
      {
        endDate = self->_endDate;
        -[PLMomentCluster endDate](v4, "endDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSDate isEqual:](endDate, "isEqual:", v8))
        {
          v9 = -[NSArray count](self->_moments, "count");
          -[PLMomentCluster moments](v4, "moments");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v9 == objc_msgSend(v10, "count");

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSArray)moments
{
  return self->_moments;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

@end
