@implementation CLVisit

- (CLVisit)initWithVisit:(id)a3
{
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  id v9;
  double v11;

  if (a3)
  {
    objc_msgSend(objc_msgSend(a3, "location"), "latitude");
    v6 = v5;
    objc_msgSend(objc_msgSend(a3, "location"), "longitude");
    v8 = CLLocationCoordinate2DMake(v6, v7);
    if (objc_msgSend(a3, "placeInference"))
      v9 = objc_msgSend(objc_alloc((Class)_CLPlaceInference), "_initWithRTPlaceInference:", objc_msgSend(a3, "placeInference"));
    else
      v9 = 0;
    objc_msgSend(objc_msgSend(a3, "location"), "horizontalUncertainty");
    return -[CLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:](self, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:", objc_msgSend(a3, "entry"), objc_msgSend(a3, "exit"), objc_msgSend(a3, "date"), v9, v8.latitude, v8.longitude, v11);
  }
  else
  {

    return 0;
  }
}

+ (id)_visitWithVisit:(id)a3 authDate:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v17;
  NSObject *v18;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  if (a4)
  {
    if (objc_msgSend(objc_msgSend(a3, "departureDate"), "compare:", objc_msgSend(a3, "arrivalDate")) == (id)-1)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B5A08);
      v17 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        v19 = 68289283;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2113;
        v24 = a3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Malformed visit\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v19, 0x1Cu);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021B5A08);
      }
      v18 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        v19 = 68289283;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2113;
        v24 = a3;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Malformed visit", "{\"msg%{public}.0s\":\"#slv Malformed visit\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v19, 0x1Cu);
      }
    }
    else
    {
      v6 = objc_msgSend(a4, "compare:", objc_msgSend(a3, "departureDate"));
      v7 = objc_msgSend(a4, "compare:", objc_msgSend(a3, "arrivalDate"));
      v8 = 0;
      if (objc_msgSend(a3, "hasArrivalDate") && v7 == (id)-1)
        v8 = (unint64_t)objc_msgSend(a3, "arrivalDate");
      v9 = 0;
      if (objc_msgSend(a3, "hasDepartureDate"))
      {
        if (v6 == (id)-1)
          v9 = (unint64_t)objc_msgSend(a3, "departureDate");
      }
      if (v8 | v9)
      {
        v10 = objc_alloc((Class)CLVisit);
        objc_msgSend(a3, "coordinate");
        v12 = v11;
        v14 = v13;
        objc_msgSend(a3, "horizontalAccuracy");
        return objc_msgSend(v10, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:", v8, v9, objc_msgSend(a3, "detectionDate"), objc_msgSend(a3, "_placeInference"), v12, v14, v15);
      }
    }
  }
  return 0;
}

@end
