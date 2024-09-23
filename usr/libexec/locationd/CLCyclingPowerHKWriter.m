@implementation CLCyclingPowerHKWriter

- (CLCyclingPowerHKWriter)init
{
  uint64_t v2;
  CLCyclingPowerHKWriter *v3;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  objc_super v9;
  uint8_t buf[1640];

  v9.receiver = self;
  v9.super_class = (Class)CLCyclingPowerHKWriter;
  v3 = -[CLCyclingPowerHKWriter init](&v9, "init");
  if (v3)
  {
    if (objc_opt_class(HKHealthStore, v2))
    {
      if (+[HKHealthStore isHealthDataAvailable](HKHealthStore, "isHealthDataAvailable"))
      {
        v3->_healthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
      }
      else
      {
        if (qword_10229FF90 != -1)
          dispatch_once(&qword_10229FF90, &stru_10219C488);
        v4 = qword_10229FF98;
        if (os_log_type_enabled((os_log_t)qword_10229FF98, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "HKHealthStore, health data not available", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FF90 != -1)
            dispatch_once(&qword_10229FF90, &stru_10219C488);
          v8[0] = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF98, 16, "HKHealthStore, health data not available", v8, 2);
          v7 = (uint8_t *)v6;
          sub_100512490("Generic", 1, 0, 0, "-[CLCyclingPowerHKWriter init]", "%s\n", v6);
          if (v7 != buf)
            free(v7);
        }
      }
    }
    v3->_startDate = (NSDate *)objc_alloc_init((Class)NSDate);
  }
  return v3;
}

- (void)writeFTPToHK:(CLCyclingFTPResults *)a3
{
  HKQuantity *v5;
  id v6;
  id v7;
  HKQuantitySample *v8;
  HKHealthStore *healthStore;
  HKQuantitySample *v10;

  self->_startDate = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->var5);
  v5 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit wattUnit](HKUnit, "wattUnit"), a3->var0);
  v6 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingFunctionalThresholdPower);
  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10221CDD0, HKMetadataKeyCyclingFunctionalThresholdPowerTestType);
  v8 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v6, v5, self->_startDate, self->_startDate, v7);
  healthStore = self->_healthStore;
  v10 = v8;
  -[HKHealthStore saveObjects:withCompletion:](healthStore, "saveObjects:withCompletion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1), &stru_10219C468);
}

- (void)dealloc
{
  objc_super v3;

  self->_healthStore = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLCyclingPowerHKWriter;
  -[CLCyclingPowerHKWriter dealloc](&v3, "dealloc");
}

@end
