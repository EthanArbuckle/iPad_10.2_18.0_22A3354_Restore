@implementation CLFallHealthKitManager

+ (void)recordFallEventInHealthKit:(const ImpactEvent *)a3
{
  uint64_t v4;
  char v5;
  int v6;
  NSObject *v7;
  _BOOL4 fHasMotionBeforeImpact;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSDictionary *v16;
  NSDate *v17;
  uint8_t *v18;
  HKQuantitySample *v19;
  const __CFString *v20;
  NSNumber *v21;
  _DWORD v22[4];
  uint8_t buf[4];
  _BOOL4 v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;

  if (objc_opt_class(HKHealthStore, a2))
  {
    if (+[HKHealthStore isHealthDataAvailable](HKHealthStore, "isHealthDataAvailable"))
    {
      v4 = 0;
      v5 = 1;
      v6 = 0;
      switch(a3->fImpact.fHasMotionBeforeImpact)
      {
        case 0:
          if (qword_10229FD90 != -1)
            dispatch_once(&qword_10229FD90, &stru_102142078);
          v12 = qword_10229FD98;
          if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "event has not response", buf, 2u);
          }
          if (sub_1001BFF7C(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FD90 != -1)
              dispatch_once(&qword_10229FD90, &stru_102142078);
            LOWORD(v22[0]) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "event has not response", v22, 2);
            goto LABEL_39;
          }
          return;
        case 1:
        case 5:
          v5 = 0;
          v4 = 1;
          goto LABEL_28;
        case 2:
          v4 = 0;
          v5 = 0;
LABEL_28:
          v6 = 1;
          goto LABEL_29;
        case 3:
        case 4:
          goto LABEL_29;
        case 6:
        case 7:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
          if (qword_10229FD90 != -1)
            dispatch_once(&qword_10229FD90, &stru_102142078);
          v7 = qword_10229FD98;
          if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
          {
            fHasMotionBeforeImpact = a3->fImpact.fHasMotionBeforeImpact;
            *(_DWORD *)buf = 67109120;
            v24 = fHasMotionBeforeImpact;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "event should not be logged in HK with response %i", buf, 8u);
          }
          if (!sub_1001BFF7C(115, 0))
            return;
          bzero(buf, 0x65CuLL);
          if (qword_10229FD90 != -1)
            dispatch_once(&qword_10229FD90, &stru_102142078);
          v9 = a3->fImpact.fHasMotionBeforeImpact;
          v22[0] = 67109120;
          v22[1] = v9;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "event should not be logged in HK with response %i", v22);
          goto LABEL_39;
        default:
          v6 = 0;
LABEL_29:
          if (qword_10229FD90 != -1)
            dispatch_once(&qword_10229FD90, &stru_102142078);
          v13 = qword_10229FD98;
          if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68289539;
            v24 = 0;
            v25 = 2082;
            v26 = "";
            v27 = 1025;
            v28 = v6;
            v29 = 1025;
            v30 = v4;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Candidate fall event record\", \"felt\":%{private}hhd, \"actionRequested\":%{private}hhd}", buf, 0x1Eu);
          }
          if ((v5 & 1) == 0)
          {
            v14 = objc_alloc_init((Class)HKHealthStore);
            v15 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierNumberOfTimesFallen);
            v20 = CFSTR("_HKPrivateFallActionRequested");
            v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
            v16 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
            v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)&a3->fImpact.fOperatingMode);
            v19 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v15, +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit countUnit](HKUnit, "countUnit"), 1.0), v17, v17, +[HKDevice localDevice](HKDevice, "localDevice"), v16);
            objc_msgSend(v14, "saveObjects:withCompletion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1), &stru_102142058);

          }
          return;
      }
    }
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102142078);
    v11 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "HKHealthStore, health data not available", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_102142078);
      LOWORD(v22[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "HKHealthStore, health data not available", v22, 2);
LABEL_39:
      v18 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "+[CLFallHealthKitManager recordFallEventInHealthKit:]", "%s\n", v10);
      if (v18 != buf)
        free(v18);
    }
  }
}

@end
