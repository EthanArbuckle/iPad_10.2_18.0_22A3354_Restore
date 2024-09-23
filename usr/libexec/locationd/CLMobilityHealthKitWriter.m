@implementation CLMobilityHealthKitWriter

- (CLMobilityHealthKitWriter)initWithDelegate:(id)a3
{
  CLMobilityHealthKitWriter *v4;
  uint64_t v5;
  CLMobilityHealthKitWriter *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v13;
  uint8_t *v14;
  objc_super v15;
  int v16;
  const __CFString *v17;
  uint8_t buf[4];
  const __CFString *v19;

  v15.receiver = self;
  v15.super_class = (Class)CLMobilityHealthKitWriter;
  v4 = -[CLMobilityHealthKitWriter init](&v15, "init");
  v6 = v4;
  if (v4)
  {
    v4->_delegate = (CLMobilityWalkingBoutServiceProtocol *)a3;
    if (objc_opt_class(HKHealthStore, v5))
    {
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021B67C8);
      v7 = qword_10229FE98;
      if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = CFSTR("com.apple.locationd");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "HealthKitWriter: Initializing Mobility HKDataCollectors (%@)", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021B67C8);
        v16 = 138412290;
        v17 = CFSTR("com.apple.locationd");
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "HealthKitWriter: Initializing Mobility HKDataCollectors (%@)", &v16, 12);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter initWithDelegate:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
      v6->_healthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
      v8 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierWalkingSpeed);
      v9 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierWalkingDoubleSupportPercentage);
      v10 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierWalkingStepLength);
      v11 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierWalkingAsymmetryPercentage);
      v6->_dataCollectorWalkingSpeed = (HKDataCollector *)objc_msgSend(objc_alloc((Class)HKDataCollector), "initWithHealthStore:bundleIdentifier:quantityType:", v6->_healthStore, CFSTR("com.apple.locationd"), v8);
      v6->_dataCollectorWalkingDoubleSupportPercentage = (HKDataCollector *)objc_msgSend(objc_alloc((Class)HKDataCollector), "initWithHealthStore:bundleIdentifier:quantityType:", v6->_healthStore, CFSTR("com.apple.locationd"), v9);
      v6->_dataCollectorWalkingStepLength = (HKDataCollector *)objc_msgSend(objc_alloc((Class)HKDataCollector), "initWithHealthStore:bundleIdentifier:quantityType:", v6->_healthStore, CFSTR("com.apple.locationd"), v10);
      v6->_dataCollectorWalkingAsymmetryPercentage = (HKDataCollector *)objc_msgSend(objc_alloc((Class)HKDataCollector), "initWithHealthStore:bundleIdentifier:quantityType:", v6->_healthStore, CFSTR("com.apple.locationd"), v11);
      -[HKDataCollector setDelegate:](v6->_dataCollectorWalkingSpeed, "setDelegate:", v6);
      v6->_featureStatusManager = (HKMobilityWalkingSteadinessFeatureStatusManager *)objc_msgSend(objc_alloc((Class)HKMobilityWalkingSteadinessFeatureStatusManager), "initWithHealthStore:", v6->_healthStore);
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMobilityHealthKitWriter;
  -[CLMobilityHealthKitWriter dealloc](&v3, "dealloc");
}

- (void)writeToHealthKitAppleWalkingSteadiness:(double)a3 startDate:(id)a4 endDate:(id)a5 source:(id)a6
{
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  HKQuantitySample *v15;
  HKHealthStore *healthStore;
  const char *v17;
  uint8_t *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD v22[7];
  HKQuantitySample *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  double v29;
  __int16 v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  double v37;
  __int16 v38;
  id v39;

  if (objc_opt_class(HKQuantityType, a2))
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_1021B67E8);
    v11 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544131;
      v33 = a4;
      v34 = 2114;
      v35 = a5;
      v36 = 2049;
      v37 = a3;
      v38 = 2114;
      v39 = a6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Writing Steadiness score to HealthKit, startDate: %{public}@, endDate:%{public}@, walkingSteadiness: %{private}f, source: %{public}@", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_1021B67E8);
      v24 = 138544131;
      v25 = a4;
      v26 = 2114;
      v27 = a5;
      v28 = 2049;
      v29 = a3;
      v30 = 2114;
      v31 = a6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 1, "Writing Steadiness score to HealthKit, startDate: %{public}@, endDate:%{public}@, walkingSteadiness: %{private}f, source: %{public}@", &v24, 42);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter writeToHealthKitAppleWalkingSteadiness:startDate:endDate:source:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    v12 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v13 = v12;
    if (a6)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", a6, _HKPrivateMetadataKeyCoreMotionSourceIdentifier);
    }
    else
    {
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_1021B67E8);
      v14 = qword_10229FC48;
      if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Steadiness Sample missing source metadata", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_1021B67E8);
        LOWORD(v24) = 0;
        LODWORD(v21) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 17, "Steadiness Sample missing source metadata", &v24, v21);
        v20 = (uint8_t *)v19;
        sub_100512490("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter writeToHealthKitAppleWalkingSteadiness:startDate:endDate:source:]", "%s\n", v19);
        if (v20 != buf)
          free(v20);
      }
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10221DC28, HKMetadataKeyAlgorithmVersion);
    v15 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierAppleWalkingSteadiness), +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit percentUnit](HKUnit, "percentUnit"), a3 / 100.0), a4, a5, +[HKDevice localDevice](HKDevice, "localDevice"), v13);
    healthStore = self->_healthStore;
    v23 = v15;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10142B890;
    v22[3] = &unk_102144B20;
    v22[4] = a4;
    v22[5] = a5;
    *(double *)&v22[6] = a3;
    -[HKHealthStore saveObjects:withCompletion:](healthStore, "saveObjects:withCompletion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1), v22);
  }
}

- (void)writeSteadinessEvent:(int)a3 startDate:(id)a4 endDate:(id)a5 source:(id)a6
{
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  const char *v19;
  uint8_t *v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;

  if (objc_opt_class(HKQuantityType, a2))
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_1021B67E8);
    v11 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544131;
      v33 = a4;
      v34 = 2114;
      v35 = a5;
      v36 = 2053;
      v37 = a3;
      v38 = 2114;
      v39 = a6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Writing Steadiness event to HealthKit, startDate: %{public}@, endDate:%{public}@, eventType: %{sensitive}ld, source: %{public}@", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_1021B67E8);
      v24 = 138544131;
      v25 = a4;
      v26 = 2114;
      v27 = a5;
      v28 = 2053;
      v29 = a3;
      v30 = 2114;
      v31 = a6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 1, "Writing Steadiness event to HealthKit, startDate: %{public}@, endDate:%{public}@, eventType: %{sensitive}ld, source: %{public}@", &v24, 42);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter writeSteadinessEvent:startDate:endDate:source:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    switch(a3)
    {
      case 0:
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_1021B67E8);
        v13 = qword_10229FC48;
        if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Unsupported event type: none", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_1021B67E8);
          LOWORD(v24) = 0;
          LODWORD(v23) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 17, "Unsupported event type: none", &v24, v23);
          v22 = (uint8_t *)v21;
          sub_100512490("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter writeSteadinessEvent:startDate:endDate:source:]", "%s\n", v21);
          if (v22 != buf)
            free(v22);
        }
        goto LABEL_16;
      case 1:
      case 5:
LABEL_16:
        v12 = 1;
        break;
      case 2:
      case 6:
        v12 = 2;
        break;
      case 3:
      case 7:
        v12 = 3;
        break;
      case 4:
      case 8:
        v12 = 4;
        break;
      default:
        v12 = 0;
        break;
    }
    v14 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v15 = v14;
    if (a6)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", a6, _HKPrivateMetadataKeyCoreMotionSourceIdentifier);
    }
    else
    {
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_1021B67E8);
      v16 = qword_10229FC48;
      if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Steadiness Event missing source metadata", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_1021B67E8);
        LOWORD(v24) = 0;
        LODWORD(v23) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 17, "Steadiness Event missing source metadata", &v24, v23);
        v20 = (uint8_t *)v19;
        sub_100512490("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter writeSteadinessEvent:startDate:endDate:source:]", "%s\n", v19);
        if (v20 != buf)
          free(v20);
      }
    }
    -[HKHealthStore saveObject:withCompletion:](self->_healthStore, "saveObject:withCompletion:", +[HKCategorySample categorySampleWithType:value:startDate:endDate:device:metadata:](HKCategorySample, "categorySampleWithType:value:startDate:endDate:device:metadata:", +[HKObjectType categoryTypeForIdentifier:](HKObjectType, "categoryTypeForIdentifier:", HKCategoryTypeIdentifierAppleWalkingSteadinessEvent), v12, a4, a5, +[HKDevice localDevice](HKDevice, "localDevice"), v15), &stru_1021B6788);
  }
}

- (void)writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6 deviceSide:(unsigned __int8)a7
{
  unsigned int v7;
  uint64_t v11;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;

  v7 = a7;
  v11 = *(_QWORD *)&a3;
  v13 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1);
  v14 = v13;
  if (v7 <= 2)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", (&off_1021B6808)[(char)v7], HKMetadataKeyDevicePlacementSide);
  -[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:](self, "_writeToHealthKitType:value:startDate:endDate:metadata:", v11, a5, a6, v14, a4);
}

- (void)writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6
{
  -[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:](self, "_writeToHealthKitType:value:startDate:endDate:metadata:", *(_QWORD *)&a3, a5, a6, 0, a4);
}

- (void)_writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6 metadata:(id)a7
{
  NSObject *v13;
  std::string *v14;
  HKQuantity *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  std::string *v19;
  void *v20;
  NSUUID *v21;
  id v22;
  id v23;
  NSObject *v24;
  std::string *v25;
  uint64_t v26;
  std::string *v27;
  std::string *v28;
  std::string *v29;
  uint64_t v30;
  std::string *v31;
  std::string *v32;
  _QWORD v33[4];
  int v34;
  id v35;
  std::string v36;
  std::string __p;
  id v38;
  __int16 v39;
  double v40;
  __int16 v41;
  id v42;
  std::string buf;
  id v44;
  __int16 v45;
  double v46;
  __int16 v47;
  id v48;

  if (objc_opt_class(HKQuantityType, a2))
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021B67C8);
    v13 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
    {
      sub_101081C30(a3, &__p);
      v14 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &__p
          : (std::string *)__p.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136316163;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2114;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a5;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2114;
      v44 = a6;
      v45 = 2049;
      v46 = a4;
      v47 = 2112;
      v48 = a7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "HealthKitWriter: Writing %s to HealthKit, startDate: %{public}@, endDate: %{public}@, value: %{private}.2f, metadata: %@", (uint8_t *)&buf, 0x34u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021B67C8);
      v26 = qword_10229FE98;
      sub_101081C30(a3, &v36);
      if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v27 = &v36;
      else
        v27 = (std::string *)v36.__r_.__value_.__r.__words[0];
      LODWORD(__p.__r_.__value_.__l.__data_) = 136316163;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v27;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2114;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a5;
      HIWORD(__p.__r_.__value_.__r.__words[2]) = 2114;
      v38 = a6;
      v39 = 2049;
      v40 = a4;
      v41 = 2112;
      v42 = a7;
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, v26, 2, "HealthKitWriter: Writing %s to HealthKit, startDate: %{public}@, endDate: %{public}@, value: %{private}.2f, metadata: %@", &__p, 52);
      v29 = v28;
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v36.__r_.__value_.__l.__data_);
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:]", "%s\n", (const char *)v29);
      if (v29 != &buf)
        free(v29);
    }
    switch(a3)
    {
      case 0:
        v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m/s")), a4);
        v16 = 32;
        goto LABEL_25;
      case 1:
        v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit percentUnit](HKUnit, "percentUnit"), a4 / 100.0);
        v16 = 40;
        goto LABEL_25;
      case 2:
        v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit meterUnit](HKUnit, "meterUnit"), a4);
        v16 = 48;
        goto LABEL_25;
      case 3:
        v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit percentUnit](HKUnit, "percentUnit"), a4 / 100.0);
        v16 = 56;
LABEL_25:
        v20 = *(Class *)((char *)&self->super.isa + v16);
        if (v20 && v15)
        {
          v21 = +[NSUUID UUID](NSUUID, "UUID");
          v22 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", a5, a6);
          v23 = objc_msgSend(objc_alloc((Class)HKQuantityDatum), "initWithIdentifier:dateInterval:quantity:resumeContext:", v21, v22, v15, 0);
          v35 = v23;
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10142CBEC;
          v33[3] = &unk_1021B67A8;
          v34 = a3;
          objc_msgSend(v20, "insertDatums:device:metadata:completion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1), +[HKDevice localDevice](HKDevice, "localDevice"), a7, v33);

        }
        else
        {
          if (qword_10229FE90 != -1)
            dispatch_once(&qword_10229FE90, &stru_1021B67C8);
          v24 = qword_10229FE98;
          if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_FAULT))
          {
            sub_101081C30(a3, &buf);
            v25 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? &buf
                : (std::string *)buf.__r_.__value_.__r.__words[0];
            LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "HKDataCollector %s was not properly initialized", (uint8_t *)&__p, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
          }
          if (sub_1001BFF7C(115, 0))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_10229FE90 != -1)
              dispatch_once(&qword_10229FE90, &stru_1021B67C8);
            v30 = qword_10229FE98;
            sub_101081C30(a3, &__p);
            v31 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? &__p
                : (std::string *)__p.__r_.__value_.__r.__words[0];
            LODWORD(v36.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)v36.__r_.__value_.__r.__words + 4) = (std::string::size_type)v31;
            _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, v30, 17, "HKDataCollector %s was not properly initialized", (const char *)&v36);
            v19 = v32;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            sub_100512490("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:]", "%s\n", (const char *)v19);
            if (v19 != &buf)
LABEL_55:
              free(v19);
          }
        }
        break;
      default:
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021B67C8);
        v17 = qword_10229FE98;
        if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
          HIDWORD(buf.__r_.__value_.__r.__words[0]) = a3;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "HealthKitWriter: Unexpected QuantityTypeIdentifier %d", (uint8_t *)&buf, 8u);
        }
        if (!sub_1001BFF7C(115, 0))
          return;
        bzero(&buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021B67C8);
        LODWORD(__p.__r_.__value_.__l.__data_) = 67109120;
        HIDWORD(__p.__r_.__value_.__r.__words[0]) = a3;
        _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FE98, 17, "HealthKitWriter: Unexpected QuantityTypeIdentifier %d", &__p);
        v19 = (std::string *)v18;
        sub_100512490("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:]", "%s\n", v18);
        if (v19 == &buf)
          return;
        goto LABEL_55;
    }
  }
}

- (BOOL)isWalkingSteadinessAvailable
{
  id v2;
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  BOOL result;
  const char *v7;
  uint8_t *v8;
  void *v9;
  NSObject *v10;
  id v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  id v15;
  unsigned int v16;
  id v17;
  const char *v18;
  uint8_t *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  id v32;

  v20 = 0;
  v2 = -[HKMobilityWalkingSteadinessFeatureStatusManager onboardingStatusWithError:](self->_featureStatusManager, "onboardingStatusWithError:", &v20);
  if (v20)
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_1021B67E8);
    v4 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to query onboarding status: %{public}@", buf, 0xCu);
    }
    v5 = sub_1001BFF7C(115, 0);
    result = 0;
    if (v5)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_1021B67E8);
      v21 = 138543362;
      v22 = v20;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 16, "Unable to query onboarding status: %{public}@", &v21, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter isWalkingSteadinessAvailable]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
      return 0;
    }
  }
  else
  {
    v9 = v2;
    if (objc_msgSend(v2, "onboardingUnavailableReasons"))
    {
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_1021B67E8);
      v10 = qword_10229FC48;
      if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v9, "onboardingUnavailableReasons");
        v12 = objc_msgSend(v9, "isLocaleValidOnLocalDevice");
        v13 = objc_msgSend(v9, "state");
        *(_DWORD *)buf = 134349568;
        v28 = v11;
        v29 = 1026;
        v30 = v12;
        v31 = 2050;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "HK Walking Steadiness unavailable. reasons=%{public}ld, isLocaleValid=%{public}d, state=%{public}ld", buf, 0x1Cu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_1021B67E8);
        v14 = qword_10229FC48;
        v15 = objc_msgSend(v9, "onboardingUnavailableReasons");
        v16 = objc_msgSend(v9, "isLocaleValidOnLocalDevice");
        v17 = objc_msgSend(v9, "state");
        v21 = 134349568;
        v22 = v15;
        v23 = 1026;
        v24 = v16;
        v25 = 2050;
        v26 = v17;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 1, "HK Walking Steadiness unavailable. reasons=%{public}ld, isLocaleValid=%{public}d, state=%{public}ld", &v21, 28);
        v19 = (uint8_t *)v18;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter isWalkingSteadinessAvailable]", "%s\n", v18);
        if (v19 != buf)
          free(v19);
      }
    }
    return objc_msgSend(v9, "isClassificationAvailable");
  }
  return result;
}

- (BOOL)areWalkingSteadinessNotificationsEnabled
{
  id v2;
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  BOOL result;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;

  v9 = 0;
  v2 = -[HKMobilityWalkingSteadinessFeatureStatusManager notificationStatusWithError:](self->_featureStatusManager, "notificationStatusWithError:", &v9);
  if (v9)
    v3 = 1;
  else
    v3 = v2 == 0;
  if (!v3)
    return objc_msgSend(v2, "state") == (id)1;
  if (qword_10229FC40 != -1)
    dispatch_once(&qword_10229FC40, &stru_1021B67E8);
  v4 = qword_10229FC48;
  if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to query notification status: %{public}@", buf, 0xCu);
  }
  v5 = sub_1001BFF7C(115, 0);
  result = 0;
  if (v5)
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_1021B67E8);
    v10 = 138543362;
    v11 = v9;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 16, "Unable to query notification status: %{public}@", &v10, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter areWalkingSteadinessNotificationsEnabled]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
    return 0;
  }
  return result;
}

- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4
{
  NSObject *v7;
  CLMobilityWalkingBoutServiceProtocol *delegate;
  const char *v9;
  uint8_t *v10;
  _QWORD v11[5];
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021B67C8);
  v7 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "HealthKitWriter: Data collection requested through date %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021B67C8);
    v12 = 138412290;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "HealthKitWriter: Data collection requested through date %@", &v12, 12);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter dataCollectorDidRequestCollectionThroughDate:completion:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  delegate = self->_delegate;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10142D734;
  v11[3] = &unk_102162918;
  v11[4] = a4;
  -[CLMobilityWalkingBoutServiceProtocol onDataCollectionRequested:](delegate, "onDataCollectionRequested:", v11);
}

@end
