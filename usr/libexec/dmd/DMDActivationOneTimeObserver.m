@implementation DMDActivationOneTimeObserver

- (DMDActivationOneTimeObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 oneTimePredicate:(id)a5
{
  id v8;
  DMDActivationOneTimeObserver *v9;
  DMDActivationOneTimeObserver *v10;
  DMDActivationOneTimeObserver *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DMDActivationOneTimeObserver;
  v9 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:](&v13, "initWithDelegate:uniqueIdentifier:predicate:", a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    if (!-[DMDActivationOneTimeObserver _extractComponentsFromPredicate:](v9, "_extractComponentsFromPredicate:", v8))
    {
      v11 = 0;
      goto LABEL_6;
    }
    -[DMDActivationOneTimeObserver _registerPredicateObserver](v10, "_registerPredicateObserver");
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  NSDate *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  NSDate *v24;

  v4 = objc_opt_new(NSDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
  -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", -[NSDate compare:](v4, "compare:", v5) == NSOrderedAscending);

  v7 = DMFConfigurationEngineLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    v11 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
    v15 = 138544386;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 1024;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d, end date: %{public}@, now: %{public}@", (uint8_t *)&v15, 0x30u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));

  return v13;
}

- (void)invalidate
{
  id v3;
  id v4;
  objc_super v5;

  v3 = objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier")));
  xpc_set_event(v3, objc_msgSend(v4, "UTF8String"), 0);

  v5.receiver = self;
  v5.super_class = (Class)DMDActivationOneTimeObserver;
  -[DMDActivationPredicateObserver invalidate](&v5, "invalidate");
}

- (BOOL)_extractComponentsFromPredicate:(id)a3
{
  id v4;
  NSDate *v5;
  void *v6;
  uint64_t v7;
  NSISO8601DateFormatter *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  NSDate *v33;

  v4 = a3;
  v5 = objc_opt_new(NSDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadDateTime"));

  if (!v6)
  {
    v18 = DMFConfigurationEngineLog(v7);
    v8 = (NSISO8601DateFormatter *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
      sub_1000715E4(self);
    goto LABEL_10;
  }
  v8 = objc_opt_new(NSISO8601DateFormatter);
  -[NSISO8601DateFormatter setFormatOptions:](v8, "setFormatOptions:", 1907);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v8, "dateFromString:", v6));
  -[DMDActivationOneTimeObserver setEndDate:](self, "setEndDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
  if (!v10)
  {
    v19 = DMFConfigurationEngineLog(v11);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10007169C(self);

LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }

  v13 = DMFConfigurationEngineLog(v12);
  v8 = (NSISO8601DateFormatter *)objc_claimAutoreleasedReturnValue(v13);
  v14 = 1;
  if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
    v22 = 138544642;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    v26 = 2048;
    v27 = 0;
    v28 = 2114;
    v29 = v6;
    v30 = 2114;
    v31 = v17;
    v32 = 2114;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, &v8->super.super, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted seconds: %f, end time string: %{public}@, end date: %{public}@, now: %{public}@", (uint8_t *)&v22, 0x3Eu);

  }
LABEL_11:

  return v14;
}

- (void)_registerPredicateObserver
{
  NSDate *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  NSDate *v32;

  v3 = objc_opt_new(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.dmd.alarm"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v3);
  v8 = v7;

  if (v8 <= 0.0)
  {
    v20 = DMFConfigurationEngineLog(v9);
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100071754(self);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = (uint64_t)(v11 * 1000000000.0);

    v14 = DMFConfigurationEngineLog(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
      *(_DWORD *)buf = 138544642;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v5;
      v27 = 2114;
      v28 = v18;
      v29 = 2048;
      v30 = v12;
      v31 = 2114;
      v32 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ will schedule alarm with identifier: %{public}@ to fire at date: %{public}@, epoch time in nano seconds: %lld, now: %{public}@", buf, 0x3Eu);

    }
    v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v19, (const char *)objc_msgSend(CFSTR("ShouldWake"), "UTF8String"), 0);
    xpc_dictionary_set_date(v19, (const char *)objc_msgSend(CFSTR("Date"), "UTF8String"), v12);
    xpc_set_event(objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String"), objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), v19);
  }

}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end
