@implementation CLFenceAnalyticsMotionActivityHistogram

- (id)initActivityHistogramWithActivities:(id)a3 dateInterval:(id)a4
{
  CLFenceAnalyticsMotionActivityHistogram *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLFenceAnalyticsMotionActivityHistogram;
  v6 = -[CLFenceAnalyticsMotionActivityHistogram init](&v15, "init");
  if (v6)
  {
    v6->_bins = objc_opt_new(NSMutableDictionary);
    v6->_totalInterval = 0.0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3052000000;
    v12 = sub_100206E80;
    v13 = sub_100207BB8;
    v14 = 0;
    v14 = objc_msgSend(objc_msgSend(a4, "endDate"), "copy");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008BDE28;
    v8[3] = &unk_10215AAA8;
    v8[5] = v6;
    v8[6] = &v9;
    v8[4] = a4;
    objc_msgSend(a3, "enumerateObjectsWithOptions:usingBlock:", 2, v8);

    _Block_object_dispose(&v9, 8);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFenceAnalyticsMotionActivityHistogram;
  -[CLFenceAnalyticsMotionActivityHistogram dealloc](&v3, "dealloc");
}

- (id)binsSortedByInterval
{
  return objc_msgSend(-[NSMutableDictionary allValues](-[CLFenceAnalyticsMotionActivityHistogram bins](self, "bins"), "allValues"), "sortedArrayUsingComparator:", &stru_10215AAE8);
}

- (void)addInterval:(double)a3 type:(unint64_t)a4 confidence:(int64_t)a5
{
  id v9;
  void *v10;
  double v11;

  v9 = -[NSMutableDictionary objectForKey:](-[CLFenceAnalyticsMotionActivityHistogram bins](self, "bins"), "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "addInterval:", a3);
    objc_msgSend(v10, "updateConfidence:", a5);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](-[CLFenceAnalyticsMotionActivityHistogram bins](self, "bins"), "setObject:forKey:", -[CLFenceAnalyticsMotionActivityHistogramBin initWithInterval:motionActivityType:motionActivityConfidence:]([CLFenceAnalyticsMotionActivityHistogramBin alloc], "initWithInterval:motionActivityType:motionActivityConfidence:", a4, a5, a3), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  }
  -[CLFenceAnalyticsMotionActivityHistogram totalInterval](self, "totalInterval");
  -[CLFenceAnalyticsMotionActivityHistogram setTotalInterval:](self, "setTotalInterval:", v11 + a3);
}

- (NSMutableDictionary)bins
{
  return self->_bins;
}

- (void)setBins:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)totalInterval
{
  return self->_totalInterval;
}

- (void)setTotalInterval:(double)a3
{
  self->_totalInterval = a3;
}

@end
