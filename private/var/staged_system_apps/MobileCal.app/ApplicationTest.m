@implementation ApplicationTest

+ (id)testName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (ApplicationTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  ApplicationTest *v12;
  ApplicationTest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ApplicationTest;
  v12 = -[ApplicationTest init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    objc_storeStrong((id *)&v13->_options, a5);
    objc_storeStrong((id *)&v13->_model, a4);
    -[ApplicationTest setupData](v13, "setupData");
  }

  return v13;
}

- (void)runTest
{
  id v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;

  v3 = objc_msgSend((id)objc_opt_class(self), "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("runTest should be overridden for class: [%@]"), v7));

  -[Application startedTest:](self->_application, "startedTest:", v4);
  -[Application failedTest:withFailure:](self->_application, "failedTest:withFailure:", v4, v8);
  v9 = kCalUILogTestHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

}

- (id)extractInitialDateOption
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSDateComponents *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  id v24;
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("initialDate")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("PPTForceRestoreDate")));

  v10 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v10, "setYear:", 2024);
  objc_msgSend(v10, "setMonth:", 6);
  objc_msgSend(v10, "setDay:", 1);
  v11 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithDateComponents:timeZone:", v10, v5);
  if (v7)
    v12 = v7;
  else
    v12 = v9;
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-")));
    v14 = objc_opt_new(NSDateComponents);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
    -[NSDateComponents setYear:](v14, "setYear:", (int)objc_msgSend(v15, "intValue"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 1));
    -[NSDateComponents setMonth:](v14, "setMonth:", (int)objc_msgSend(v16, "intValue"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 2));
    -[NSDateComponents setDay:](v14, "setDay:", (int)objc_msgSend(v17, "intValue"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 3));
    -[NSDateComponents setHour:](v14, "setHour:", (int)objc_msgSend(v18, "intValue"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 4));
    -[NSDateComponents setMinute:](v14, "setMinute:", (int)objc_msgSend(v19, "intValue"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 5));
    objc_msgSend(v20, "doubleValue");
    -[NSDateComponents setSecond:](v14, "setSecond:", (uint64_t)v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 5));
    objc_msgSend(v22, "doubleValue");
    -[NSDateComponents setNanosecond:](v14, "setNanosecond:", (uint64_t)-((double)-[NSDateComponents second](v14, "second") - v23 * 1000000000.0));

    v24 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithDateComponents:timeZone:", v14, v5);
  }
  else
  {
    v24 = v11;
  }
  v25 = v24;

  return v25;
}

- (void)setupData
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  CUIKCalendarModel *model;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  self->_useLegacyData = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("useLegacyData")));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
    self->_useLegacyData = v5;
    if (!v5)
      goto LABEL_15;
  }
  else if (!self->_useLegacyData)
  {
    goto LABEL_15;
  }
  v19 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarsForEntityType:", 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        v16 = objc_msgSend(v15, "containsString:", CFSTR("Legacy"));

        if (v16)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  model = self->_model;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  -[CUIKCalendarModel setSelectedCalendars:](model, "setSelectedCalendars:", v18);

  v4 = v19;
LABEL_15:

}

- (Application)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
