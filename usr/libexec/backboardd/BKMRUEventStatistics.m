@implementation BKMRUEventStatistics

+ (id)statisticsWithLabel:(id)a3 capacity:(int64_t)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  if (a4 <= 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BKEventStatisticsLoggingController.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capacity > 0"));

  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___BKMRUEventStatistics;
  v8 = objc_msgSendSuper2(&v12, "statisticWithLabel:", v7);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue(v8);
  v9[5] = a4;

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableOrderedSet hash](self->_statistics, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = (id *)a3;
  v6 = objc_opt_class(BKMRUEventStatistics, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = objc_msgSend(v4[4], "isEqual:", self->_statistics);
  else
    v7 = 0;

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet bs_compactMap:](self->_statistics, "bs_compactMap:", &stru_1000EBD50));
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_opt_class(BSDescriptionStream, v6);
    v8 = v4;
    v9 = v8;
    if (v7)
    {
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEventStatistic label](self, "label"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100074DD8;
    v15[3] = &unk_1000EBDB8;
    v13 = v9;
    v16 = v13;
    objc_msgSend(v11, "appendCollection:withName:itemBlock:", v5, v12, v15);

    v14.receiver = self;
    v14.super_class = (Class)BKMRUEventStatistics;
    -[BKEventStatistic appendDescriptionToFormatter:](&v14, "appendDescriptionToFormatter:", v13);

  }
}

- (void)pushStatistics:(id)a3
{
  NSMutableOrderedSet *statistics;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1);
  statistics = self->_statistics;
  if (!statistics)
  {
    v5 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v6 = self->_statistics;
    self->_statistics = v5;

    statistics = self->_statistics;
  }
  if (-[NSMutableOrderedSet containsObject:](statistics, "containsObject:", v9))
    -[NSMutableOrderedSet removeObject:](self->_statistics, "removeObject:", v9);
  v7 = self->_statistics;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bs_map:", &stru_1000EBDF8));
  -[NSMutableOrderedSet addObject:](v7, "addObject:", v8);

  if ((unint64_t)-[NSMutableOrderedSet count](self->_statistics, "count") > self->_capacity)
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_statistics, "removeObjectAtIndex:", 0);

}

- (void)reset
{
  objc_super v3;

  -[NSMutableOrderedSet removeAllObjects](self->_statistics, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)BKMRUEventStatistics;
  -[BKEventStatistic reset](&v3, "reset");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKMRUEventStatistics;
  v4 = -[BKEventStatistic copyWithZone:](&v8, "copyWithZone:", a3);
  v5 = -[NSMutableOrderedSet copy](self->_statistics, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v4[5] = self->_capacity;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
