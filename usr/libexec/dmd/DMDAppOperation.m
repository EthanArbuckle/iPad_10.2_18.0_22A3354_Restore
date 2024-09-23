@implementation DMDAppOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;
  uint64_t v21;
  const __CFString *v22;

  v6 = a3;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___DMDAppOperation;
  if (objc_msgSendSuper2(&v20, "validateRequest:error:", v6, a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeItemIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manifestURL"));
    v11 = (void *)v9;
    v12 = v7 != 0;
    v13 = 1;
    if (v7)
      v13 = 2;
    if (v8)
      v12 = v13;
    if (v9)
      ++v12;
    v14 = v12 == 1;
    if (v12 != 1)
    {
      v15 = DMFAppLog(v9, v10);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100072510(v16);

      if (a4)
      {
        v21 = DMFInvalidParameterErrorKey;
        v22 = CFSTR("request.bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        v18 = DMFErrorWithCodeAndUserInfo(1, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue(v18);

      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000244C0;
  v7[3] = &unk_1000BA500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getBundleIdentifierForAppRequest:completion:", v6, v7);

}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppOperation.m"), 68, CFSTR("%@ must implement %@"), v6, v8);

}

@end
