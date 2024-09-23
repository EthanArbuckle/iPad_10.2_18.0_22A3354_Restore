@implementation MOTrendsAnalyzerOptions

- (MOTrendsAnalyzerOptions)initWithKeyword:(id)a3 category:(unint64_t)a4 trainDateInterval:(id)a5 testDateInterval:(id)a6 aggregationDuration:(unint64_t)a7 aggregationMethod:(unint64_t)a8 valueType:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id os_log;
  NSObject *v19;
  void *v20;
  void *v21;
  Block_layout *v22;
  MOTrendsAnalyzerOptions *v23;
  MOTrendsAnalyzerOptions *v24;
  unint64_t v26;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (!a4)
  {
    v26 = a8;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueType:].cold.1();

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueType:]"));
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MOTrendsAnalyzerOptions.m"), 25, CFSTR("Invalid parameter not satisfying: category != MOTrendsAnalyzerValueFunctionTypeCustom (in %s:%d)"), "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueType:]", 25);

    a8 = v26;
  }
  if (a9 > 2)
    v22 = 0;
  else
    v22 = off_1002B14A8[a9];
  v23 = -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:](self, "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:", v15, a4, v16, v17, a7, a8, v22);
  v24 = v23;
  if (v23)
    v23->_valueFunctionType = a9;

  return v24;
}

double __135__MOTrendsAnalyzerOptions_initWithKeyword_category_trainDateInterval_testDateInterval_aggregationDuration_aggregationMethod_valueType___block_invoke(id a1, MOEvent *a2)
{
  MOEvent *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](v2, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](v2, "startDate"));

  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  result = 0.0;
  if (v6 > 600.0)
    return 1.0;
  return result;
}

double __135__MOTrendsAnalyzerOptions_initWithKeyword_category_trainDateInterval_testDateInterval_aggregationDuration_aggregationMethod_valueType___block_invoke_2(id a1, MOEvent *a2)
{
  MOEvent *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](v2, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](v2, "startDate"));

  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

double __135__MOTrendsAnalyzerOptions_initWithKeyword_category_trainDateInterval_testDateInterval_aggregationDuration_aggregationMethod_valueType___block_invoke_3(id a1, MOEvent *a2)
{
  return 0.0;
}

- (MOTrendsAnalyzerOptions)initWithKeyword:(id)a3 category:(unint64_t)a4 trainDateInterval:(id)a5 testDateInterval:(id)a6 aggregationDuration:(unint64_t)a7 aggregationMethod:(unint64_t)a8 valueFunction:(id)a9
{
  id v13;
  id v14;
  id v15;
  id os_log;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  MOTrendsAnalyzerOptions *v28;
  MOTrendsAnalyzerOptions *v29;
  id v30;
  id valueFunction;
  id v36;
  objc_super v37;

  v36 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a9;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:].cold.3();

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]"));
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MOTrendsAnalyzerOptions.m"), 71, CFSTR("Invalid parameter not satisfying: trainDateInterval (in %s:%d)"), "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]", 71);

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:].cold.2();

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]"));
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("MOTrendsAnalyzerOptions.m"), 72, CFSTR("Invalid parameter not satisfying: testDateInterval (in %s:%d)"), "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]", 72);

  if (!v15)
  {
LABEL_11:
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:].cold.1();

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]"));
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("MOTrendsAnalyzerOptions.m"), 73, CFSTR("Invalid parameter not satisfying: valueFunction (in %s:%d)"), "-[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]", 73);

  }
LABEL_14:
  v37.receiver = self;
  v37.super_class = (Class)MOTrendsAnalyzerOptions;
  v28 = -[MOTrendsAnalyzerOptions init](&v37, "init");
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_keyword, a3);
    v29->_category = a4;
    objc_storeStrong((id *)&v29->_trainDateInterval, a5);
    objc_storeStrong((id *)&v29->_testDateInterval, a6);
    v29->_aggregationDuration = a7;
    v29->_aggregationMethod = a8;
    v29->_valueFunctionType = 0;
    v30 = objc_retainBlock(v15);
    valueFunction = v29->_valueFunction;
    v29->_valueFunction = v30;

  }
  return v29;
}

- (id)description
{
  unint64_t category;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *keyword;

  category = self->_category;
  keyword = self->_keyword;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval startDate](self->_trainDateInterval, "startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval endDate](self->_trainDateInterval, "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval startDate](self->_testDateInterval, "startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval endDate](self->_testDateInterval, "endDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("keyword, %@, category, %lu@, train.startDate, %@, train.endDate, %@, test.startDate, %@, test.endDate, %@, aggregationDuration, %lu, aggregationMethod, %lu, valueFunctionType, %lu"), keyword, category, v5, v7, v9, v11, self->_aggregationDuration, self->_aggregationMethod, self->_valueFunctionType));

  return v12;
}

- (NSString)keyword
{
  return self->_keyword;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSDateInterval)trainDateInterval
{
  return self->_trainDateInterval;
}

- (NSDateInterval)testDateInterval
{
  return self->_testDateInterval;
}

- (unint64_t)aggregationDuration
{
  return self->_aggregationDuration;
}

- (unint64_t)aggregationMethod
{
  return self->_aggregationMethod;
}

- (unint64_t)valueFunctionType
{
  return self->_valueFunctionType;
}

- (id)valueFunction
{
  return self->_valueFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueFunction, 0);
  objc_storeStrong((id *)&self->_testDateInterval, 0);
  objc_storeStrong((id *)&self->_trainDateInterval, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

- (void)initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: category != MOTrendsAnalyzerValueFunctionTypeCustom (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: valueFunction (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: testDateInterval (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: trainDateInterval (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
