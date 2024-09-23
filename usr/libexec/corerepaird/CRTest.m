@implementation CRTest

- (CRTest)init
{
  CRTest *v2;
  CRTest *v3;
  NSMutableDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRTest;
  v2 = -[CRTest init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setStatusCode:](v2, "setStatusCode:", &off_100058450);
    v4 = objc_opt_new(NSMutableDictionary);
    -[CRTest setResultData:](v3, "setResultData:", v4);

    -[CRTest setRunningSemaphore:](v3, "setRunningSemaphore:", 0);
    -[CRTest setOverrides:](v3, "setOverrides:", 0);
  }
  return v3;
}

- (BOOL)shouldRun:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;

  v4 = a3;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled")));

    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0 && !objc_msgSend(v7, "BOOLValue"))
    {
      v9 = 0;
      goto LABEL_7;
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastTestStatusCode"));
  v9 = objc_msgSend(v7, "isEqual:", &off_100058468);
LABEL_7:

LABEL_9:
  return v9;
}

- (BOOL)promptContinue:(id)a3 withContext:(id)a4
{
  return 1;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  NSMutableDictionary *v10;

  v5 = a3;
  v6 = objc_opt_new(NSMutableDictionary);
  v9 = CFSTR("parameters");
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v5, "startTest:parameters:", v8, v7);

}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a3)
  {
    if (a5)
    {
      v8 = a5;
      v13 = a3;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusCode"));
      -[CRTest setStatusCode:](self, "setStatusCode:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
      -[CRTest setResultData:](self, "setResultData:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
      objc_msgSend(v13, "setLastRunTestId:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest statusCode](self, "statusCode"));
      objc_msgSend(v13, "setLastTestStatusCode:", v12);

      objc_msgSend(v13, "setLastRunTestIndex:", a4);
    }
  }
}

- (BOOL)supportPeCoNet
{
  return +[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("JpCl"));
}

- (BOOL)supportLiDAR
{
  return MGGetBoolAnswer(CFSTR("lidar-scanner"), a2);
}

- (BOOL)hasMesa
{
  return MGGetBoolAnswer(CFSTR("HV7WDiidgMf7lwAu++Lk5w"), a2);
}

- (BOOL)hasMesaDelta
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  id v21;
  _BYTE v22[128];

  v21 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRFDRUtils findUnsealedDataWithError:](CRFDRUtils, "findUnsealedDataWithError:", &v21));
  v3 = v21;
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100037708((uint64_t)v4, v7);
LABEL_7:

LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v2, "count"))
  {
    v15 = handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
    }
    goto LABEL_7;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(&off_1000583D8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (!v10)
    goto LABEL_8;
  v11 = v10;
  v12 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(&off_1000583D8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1)
                                                                                                  + 8 * (_QWORD)i)));

      if (v14)
      {
        v8 = 1;
        goto LABEL_9;
      }
    }
    v11 = objc_msgSend(&off_1000583D8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    v8 = 0;
    if (v11)
      continue;
    break;
  }
LABEL_9:

  return v8;
}

- (BOOL)supportHarvestPearl
{
  return +[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("psd3"));
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSNumber)testId
{
  return self->_testId;
}

- (void)setTestId:(id)a3
{
  objc_storeStrong((id *)&self->_testId, a3);
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (NSDictionary)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
  objc_storeStrong((id *)&self->_resultData, a3);
}

- (OS_dispatch_semaphore)runningSemaphore
{
  return self->_runningSemaphore;
}

- (void)setRunningSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_runningSemaphore, a3);
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_overrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_runningSemaphore, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_testId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
