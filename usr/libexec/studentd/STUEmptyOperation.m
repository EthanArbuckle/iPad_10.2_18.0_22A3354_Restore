@implementation STUEmptyOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUEmptyOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKEmptyRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3790);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  STUEmptyOperation *v7;

  v4 = a3;
  if (qword_1000FC358 != -1)
    dispatch_once(&qword_1000FC358, &stru_1000CAB20);
  v5 = qword_1000FC350;
  if (os_log_type_enabled((os_log_t)qword_1000FC350, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Empty Operation", (uint8_t *)&v6, 0xCu);
  }
  -[STUEmptyOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);

}

@end
