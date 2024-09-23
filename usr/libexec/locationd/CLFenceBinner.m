@implementation CLFenceBinner

+ (id)binForNumber:(id)a3 bins:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  if (a3 && a4)
    return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a4, "count"), 1536, &stru_1021AF558));
  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_1021AF618);
  v7 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v15 = a3;
    v16 = 2112;
    v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#FenceMetrics Error creating bins for number %@, bins, %@, invalid input", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_1021AF618);
    v10 = 138412546;
    v11 = a3;
    v12 = 2112;
    v13 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 16, "#FenceMetrics Error creating bins for number %@, bins, %@, invalid input", &v10, 22);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "+[CLFenceBinner binForNumber:bins:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  return 0;
}

+ (id)binForDistance:(double)a3
{
  NSNumber *v5;

  if (qword_10230E330 != -1)
    dispatch_once(&qword_10230E330, &stru_1021AF578);
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  return objc_msgSend(a1, "binForNumber:bins:", v5, qword_10230E328);
}

+ (id)binForAccuracy:(double)a3
{
  NSNumber *v5;

  if (qword_10230E340 != -1)
    dispatch_once(&qword_10230E340, &stru_1021AF598);
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  return objc_msgSend(a1, "binForNumber:bins:", v5, qword_10230E338);
}

+ (id)binForAge:(double)a3
{
  NSNumber *v5;

  if (qword_10230E350 != -1)
    dispatch_once(&qword_10230E350, &stru_1021AF5B8);
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  return objc_msgSend(a1, "binForNumber:bins:", v5, qword_10230E348);
}

+ (id)binForConvergingSessionDuration:(double)a3
{
  NSNumber *v5;

  if (qword_10230E360 != -1)
    dispatch_once(&qword_10230E360, &stru_1021AF5D8);
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  return objc_msgSend(a1, "binForNumber:bins:", v5, qword_10230E358);
}

+ (id)binForConvergingSessionCount:(int)a3
{
  uint64_t v3;
  NSNumber *v5;

  v3 = *(_QWORD *)&a3;
  if (qword_10230E370 != -1)
    dispatch_once(&qword_10230E370, &stru_1021AF5F8);
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3);
  return objc_msgSend(a1, "binForNumber:bins:", v5, qword_10230E368);
}

@end
