@implementation CLWMHealthKit

- (CLWMHealthKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMHealthKit *v7;
  CLWMHealthKit *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLWMHealthKit;
  v7 = -[CLWMBase init](&v10, "init", a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v7->_universe = (CLIntersiloUniverse *)a4;
    v7->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_sampleCount = 0;
    v8->_startTime = CFAbsoluteTimeGetCurrent();
  }
  return v8;
}

- (void)setupListener
{
  sub_1006CB5B4();
}

- (void)teardownListeners
{
  -[CLWMHealthKit writeHealthKitInfo](self, "writeHealthKitInfo");
  -[CLWMHealthKit teardownHealthKitQueries](self, "teardownHealthKitQueries");
}

- (void)dealloc
{
  objc_super v3;

  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMHealthKit;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)setupHealthKitQueries
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSPredicate *v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  NSMutableArray *healthKitQueries;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[7];
  _BYTE v28[128];
  _QWORD v29[2];
  _BYTE v30[128];
  _QWORD v31[2];

  v3 = +[HKSampleType workoutType](HKSampleType, "workoutType");
  v4 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRestingHeartRate);
  v5 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierWalkingHeartRateAverage);
  self->_healthKitQueries = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  self->_healthKit = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
  ++self->_sampleCount;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1018CF19C;
  v27[3] = &unk_1021D7838;
  v27[4] = self;
  v27[5] = v4;
  v27[6] = v5;
  -[CLWMHealthKit startTime](self, "startTime");
  v31[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"), +[NSDate date](NSDate, "date"), 0);
  v31[1] = +[HKQuery _predicateForObjectsFromAppleWatches](HKQuery, "_predicateForObjectsFromAppleWatches");
  v6 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v3, +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2)), 0, 0, v27);
  -[NSMutableArray addObject:](self->_healthKitQueries, "addObject:", v6);

  v7 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate date](NSDate, "date"), +[NSDate date](NSDate, "date"), 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v29[0] = v4;
  v29[1] = v5;
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), v7, 1, 0, v27);
        -[NSMutableArray addObject:](self->_healthKitQueries, "addObject:", v13);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v10);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  healthKitQueries = self->_healthKitQueries;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](healthKitQueries, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(healthKitQueries);
        -[HKHealthStore executeQuery:](self->_healthKit, "executeQuery:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j));
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](healthKitQueries, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v16);
  }
}

- (void)queryUserEffortResponse:(double)a3 workoutEndTime:(double)a4
{
  id v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1018CFC28;
  v6[3] = &unk_1021D7860;
  v6[4] = self;
  v5 = objc_msgSend(objc_alloc((Class)HKWorkoutEffortRelationshipQuery), "initWithPredicate:anchor:options:resultsHandler:", +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4), 1), 0, 1, v6);
  -[NSMutableArray addObject:](self->_healthKitQueries, "addObject:", v5);
  -[HKHealthStore executeQuery:](self->_healthKit, "executeQuery:", v5);

}

- (void)stopHealthKitQueries
{
  NSMutableArray *healthKitQueries;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  healthKitQueries = self->_healthKitQueries;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](healthKitQueries, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(healthKitQueries);
        -[HKHealthStore stopQuery:](self->_healthKit, "stopQuery:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](healthKitQueries, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)teardownHealthKitQueries
{
  -[CLWMHealthKit stopHealthKitQueries](self, "stopHealthKitQueries");

  self->_healthKitQueries = 0;
  self->_healthKit = 0;
}

- (double)startTime
{
  double result;

  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", self->_startTime);
  return result;
}

- (void)writeHealthKitInfo
{
  WriterManager *ptr;
  uint64_t v4;
  _QWORD v5[439];
  char v6;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      sub_1015EB864(v5);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v6 |= 1u;
      v5[77] = v4;
      operator new();
    }
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  sub_100349198(&self->_writer.__ptr_, (uint64_t *)a3.__ptr_);
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void)queryHRSource:(double)a3 workoutEndTime:(double)a4
{
  NSCompoundPredicate *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", CFSTR("HeartRateSourceUnknown"), CFSTR("HeartRateSourceManufacturer"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", CFSTR("HeartRateSourceUnknown"), CFSTR("HeartRateSourceModel"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", CFSTR("HeartRateSourceUnknown"), CFSTR("HeartRateSourceFirmware"));
  v18[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4), 1);
  v18[1] = +[HKQuery predicateForObjectsFromSource:](HKQuery, "predicateForObjectsFromSource:", +[HKSource _blePeripheralSource](HKSource, "_blePeripheralSource"));
  v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1018D0BE8;
  v9[3] = &unk_1021D78B0;
  v9[4] = self;
  v10 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate);
  v11 = CFSTR("Apple");
  v12 = CFSTR("HeartRateSourceManufacturer");
  v13 = CFSTR("HeartRateSourceUnknown");
  v14 = CFSTR("HeartRateSourceModel");
  v15 = CFSTR("HeartRateSourceFirmware");
  v16 = CFSTR("HeartRateSourceHardware");
  v17 = CFSTR("Other");
  v8 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v10, v7, 5, 0, v9);
  -[NSMutableArray addObject:](self->_healthKitQueries, "addObject:", v8);
  -[HKHealthStore executeQuery:](self->_healthKit, "executeQuery:", v8);

}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  _WORD v13[8];
  uint8_t buf[1640];

  if (*a3 == 2)
  {
    v9 = *((_QWORD *)a4 + 2);
    if (v9 == 13)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D78D0);
      v10 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLWMHealthkit, Received session begin, stopping all healthit queries if exist", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D78D0);
        v13[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWMHealthkit, Received session begin, stopping all healthit queries if exist", v13, 2);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLWMHealthKit onMotionStateMediatorNotification:data:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      -[CLWMHealthKit stopHealthKitQueries](self, "stopHealthKitQueries");
    }
    else if (v9 == 15)
    {
      uuid_copy(self->_overviewId, (const unsigned __int8 *)a4 + 80);
      -[CLWMHealthKit queryHRSource:workoutEndTime:](self, "queryHRSource:workoutEndTime:", *(double *)a4, *((double *)a4 + 1));
      -[CLWMHealthKit queryUserEffortResponse:workoutEndTime:](self, "queryUserEffortResponse:workoutEndTime:", *(double *)a4, *((double *)a4 + 1));
    }
  }
}

- (void).cxx_destruct
{
  Client *value;

  PB::Base::~Base((PB::Base *)&self->_healthKitInfo);
  sub_100261F44((uint64_t)&self->_writer);
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  self->_writer.__ptr_ = 0;
  self->_writer.__cntrl_ = 0;
  sub_101637ECC((uint64_t)&self->_healthKitInfo);
  return self;
}

@end
