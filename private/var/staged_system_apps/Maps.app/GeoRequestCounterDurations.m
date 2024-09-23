@implementation GeoRequestCounterDurations

- (GeoRequestCounterDurations)init
{
  GeoRequestCounterDurations *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GeoRequestCounterDurations;
  v2 = -[GeoRequestCounterDurations init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("_debug_geoReqCountDuration")));

    v2->_selectedRow = (int64_t)objc_msgSend(v4, "integerValue");
  }
  return v2;
}

- (BOOL)supportsMultipleSelection
{
  return 0;
}

- (id)currentSelectionString
{
  return -[GeoRequestCounterDurations stringForRow:](self, "stringForRow:", self->_selectedRow);
}

- (id)currentSelection
{
  return +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", self->_selectedRow);
}

- (void)setSelection:(id)a3
{
  void *v4;
  id v5;

  self->_selectedRow = (int64_t)objc_msgSend(a3, "firstIndex");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_selectedRow));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("_debug_geoReqCountDuration"));

}

- (double)currentDurationInterval
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_101273050, "objectAtIndexedSubscript:", self->_selectedRow));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)stringForRow:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[0] = CFSTR("10 minutes");
  v7[1] = CFSTR("1 hour");
  v7[2] = CFSTR("6 hours");
  v7[3] = CFSTR("12 hours");
  v7[4] = CFSTR("1 day");
  v7[5] = CFSTR("7 days");
  v7[6] = CFSTR("30 days");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 7));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (int64_t)rowCount
{
  return 7;
}

@end
