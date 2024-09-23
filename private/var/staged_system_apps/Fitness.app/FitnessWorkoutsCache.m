@implementation FitnessWorkoutsCache

- (FitnessWorkoutsCache)initWithDataProvider:(id)a3
{
  id v5;
  FitnessWorkoutsCache *v6;
  uint64_t v7;
  NSCalendar *gregorianCalendar;
  uint64_t v9;
  NSCalendar *currentCalendar;
  uint64_t v11;
  uint64_t v12;
  OS_dispatch_queue *cacheQueue;
  void ***v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FitnessWorkoutsCache;
  v6 = -[FitnessWorkoutsCache init](&v22, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
    currentCalendar = v6->_currentCalendar;
    v6->_currentCalendar = (NSCalendar *)v9;

    objc_storeStrong((id *)&v6->_dataProvider, a3);
    v11 = HKCreateSerialDispatchQueue(v6, CFSTR("WorkoutCacheQueue"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    cacheQueue = v6->_cacheQueue;
    v6->_cacheQueue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v6);
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_1000D37C8;
    v19 = &unk_100777C80;
    objc_copyWeak(&v20, &location);
    v14 = objc_retainBlock(&v16);
    -[CHWorkoutDataProvider addUpdateHandler:](v6->_dataProvider, "addUpdateHandler:", v14, v16, v17, v18, v19);
    -[CHWorkoutDataProvider addAnimatedUpdateHandler:](v6->_dataProvider, "addAnimatedUpdateHandler:", v14);
    if (-[CHWorkoutDataProvider dataAvailable](v6->_dataProvider, "dataAvailable"))
      -[FitnessWorkoutsCache _refreshCache](v6, "_refreshCache");

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_refreshCache
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000D3844;
  v2[3] = &unk_100777E20;
  v2[4] = self;
  -[FitnessWorkoutsCache _queue_refreshCacheWithCompletion:](self, "_queue_refreshCacheWithCompletion:", v2);
}

- (void)_queue_refreshCacheWithCompletion:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D3910;
  v7[3] = &unk_100779CB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(cacheQueue, v7);

}

- (BOOL)_queue_workoutsExistForCacheKey:(int64_t)a3
{
  NSObject *cacheQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3C60;
  block[3] = &unk_100779DE0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(cacheQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)existsWorkoutOnCacheIndex:(int64_t)a3
{
  return -[FitnessWorkoutsCache _queue_workoutsExistForCacheKey:](self, "_queue_workoutsExistForCacheKey:", a3);
}

- (NSDictionary)numberOfWorkoutsForCacheKey
{
  return self->_numberOfWorkoutsForCacheKey;
}

- (void)setNumberOfWorkoutsForCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfWorkoutsForCacheKey, a3);
}

- (CHWorkoutDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_numberOfWorkoutsForCacheKey, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end
